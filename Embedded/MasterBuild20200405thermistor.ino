/*
   Wearable Integrated Health Monitoring System (WIHMS)
   Blake Hewgill; University of Vermont
   bhewgill@uvm.edu
   Advisors Dr. Jeff Frolik and Dr. Ryan McGinnis
   Department of Electrical and Biomedical Engineering
   Written 8/20/2019
   Last Revised 5/1/2020
   Rev. ID. 20200405

   This sketch is intended to perform the data collection and processing for the WIHMS project.
   This effort was funded by the Vermont Space Grant Consortium under NASA Cooperative Agreement NNX15AP86H.
   More information on this project can be found at <<SOME LINK>> or by contacting Blake Hewgill: bhewgill@uvm.edu

*/
int testMode = 0; // 1 will enable serial output, but slow down the loop rate.
const int structSize = 16; // # of structs to fill before sampling the BNO055 (affects loop speed)

#include <Adafruit_Sensor.h> // Unified sensor library
#include <Adafruit_BNO055.h> // BNO055 specific sensor library
#include <utility/imumaths.h> // Math functions for BNO055 data storage
#include "I2Cdev.h"
#include <Wire.h>
#include "MAX30105.h" // Pulse oximeter library
#include "DS3231.h" // Real time clock library
#include "Adafruit_MCP9808.h" // Thermometer library
#include "SSD1306Ascii.h" // Low memory OLED driver that includes only ASCII characters
#include "SSD1306AsciiWire.h" // OLED is driven using the wire library as opposed to AVR12
#include <SPI.h>
#include <SdFat.h>

#define moisture0 A0 // Upper back sensor analog pin
#define therm1 A7 // Trunk sensor analog pin
#define therm2 A11 // Ambient air thermistor
#define ECGpin A3 // ECG analog pin
#define I2C_ADDRESS 0x3C // OLED address
#define RST_PIN -1 // OLED reset pin. The display used does not support this feature
#define USE_SDIO 0 // Tell the teensy library not to default to SDIO

#if ENABLE_DEDICATED_SPI // crank up SPI speed to 4MHZ
#define SD_CONFIG SdSpiConfig(SD_CS_PIN, DEDICATED_SPI)
#else  // ENABLE_DEDICATED_SPI
#define SD_CONFIG SdSpiConfig(SD_CS_PIN, SHARED_SPI)
#endif  // ENABLE_DEDICATED_SPI

const long int baudrate = 230400; // Reliable on 16 KHz Mega2560 - drop to 115200 maximum if using 8 KHz board
struct meas // a 16 byte structure to hold all of our measurements (16 bytes fits nicely in a 512 byte SD buffer)
{
  unsigned long mils; // Time since program start
  int ECG; // Analog measure from Gravity sensor
  int pox; // IR LED reading from MAX30102
  int poxRed; // RED LED reading from MAX30102
  int tempInt; // Temperature x 100 (avoids using extra bytes as float)
  int m1; // Analog measure from moisture sensor
  int gyro; // X axis gyro value x 100 from BNO055
};
struct meas measure[structSize]; // create an instance of the above structure
unsigned long millisSet = 0; // Flags the end of the setup loop
unsigned long timeLapse = 0; 
float thermread; // placeholder for thermistor temperature
#define RT0 470000   // Thermistor nominal value Ω
#define A .0007866146518 // Steinhart-Hart parameter
#define B .0001814898641 // Steinhart-Hart parameter
#define C 0.00000008845259122 // Steinhart-Hart parameter
float T0; // for temp calculations


SdFat SD; // Code originally used SD library. Now uses SdFat.
Adafruit_MCP9808 therm = Adafruit_MCP9808(); // MCP9808 no longer used
RTClib rtc; // Declare real time clock as rtc
SSD1306AsciiWire oled; // Declare Ascii Wire library as oled for simplicity
File sdLog; // placeholder to create datalogger file
MAX30105 pulseOx; // pulse oximeter cast
Adafruit_BNO055 bno = Adafruit_BNO055(55, 0x28); // instantiate gyroscope as bno

int mVal = 0; // placeholder moisture value
int mSel = 0; // which thermistor will we query? Alternate skin temp and ambient temp
//unsigned long mils = 0; //
const int chipSelect = 53; // Sets CS pin for the SPI bus
char fileName[] = "WIHMSlog.bin"; // This line creates a placeholder name for the RTC filename to overwrite
//char rtcBuf[] = "HHMMSSmmmm"; // clock variable for creating datastrings
byte buffer1[512];
byte *measureLoc = (byte *) &measure; // to access measure structure as bytes
byte *buffer1Loc = (byte *) &buffer1; // starting location of buffer1

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setup()
{
  if (testMode) {
    Serial.begin(baudrate);
    Serial.flush();
  }
  T0 = 25 + 273.15; // thermister initial temp in Kelvin
  
    #if I2CDEV_IMPLEMENTATION == I2CDEV_ARDUINO_WIRE
        Wire.begin();
    #elif I2CDEV_IMPLEMENTATION == I2CDEV_BUILTIN_FASTWIRE
        Fastwire::setup(400, true);
    #endif
    
  screenInit(); // begin comms with SSD1306 OLED
  bno.begin();
  pulseOxStart(); // begin comms with MAX30102
  //thermStart(); // begin comms with MCP9808 - Currently not using this sensor
  //screenMeasure(); // Format the screen to display measured values - currently not in use due to update time of oled ~80 ms
  getFileName(); // Create a file NAME based on YearDateDay
  sdVerify(fileName); // Create or verify the existence of the file specified by getFileName()
  milliSync(); // Wait for rtc second to roll over, mark the time that occurs so we can have an accurate millisecond counter. Write the start time to the SD card

  oled.clear();
  oled.setCursor(30, 1);
  oled.println("Collecting Data");
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void loop()
{
  while (1) { // the main loop actually takes several clock cycles to call. By embedding everything in "while," we gain just a little bit of speed.
    sdLog = SD.open(fileName, O_WRITE | O_CREAT | O_AT_END); // Open the file
    collectHR(); // dive into a heartrate loop
    sdLog.close(); // Close file to permanently write the SD buffer to the file (In case data collection is interrupted)
    compCheck(); // Are we done?
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void collectHR() {
  int loopCount = 0; // How many times to loop before saving file and jumping back in
  unsigned int buffLen = 0; // starting position in buffer
  int buffSize = 16;
  int bufferLocation = *buffer1Loc;
  int tempPin = 0;

  while (loopCount < 320) { // some multiple of 32 (since 512 byte/sd block divided by 16 bytes per loop cycle = 32 cycles per sd write cycle
    imu::Vector<3> gyro = bno.getVector(Adafruit_BNO055::VECTOR_GYROSCOPE);
    measure[0].gyro = (int)(gyro.x()*100); // integer cast so data takes only 2 bytes. Divide by 100 in postproc.
    if (mSel == 1) { // Thermistor 1
      tempPin = therm1;
      mSel = 0;
    }
    else { // Thermistor 2
      tempPin = therm2;
      mSel = 1;
    }
    for (int i = 0; i < structSize; i++) { // this changed to 32 from 16 to increase gyro resolution
      measure[i].mils = millis();// - (millisSet * 1000); // microseconds since program start
      measure[i].ECG = analogRead(ECGpin); // read ECG and stick the int into measures
      measure[i].pox = (int)pulseOx.getIR(); // Measure the pulse oximeter and store the value
      measure[i].poxRed = (int)pulseOx.getRed();// Measure the pulse oximeter and store the value
      //measure[i].tempInt = measure[0].tempInt; // Store MCP9808 temp from outside HR loop, since it takes 250mS
      measure[i].tempInt = thermRead(tempPin); // Read thermistor of interest (either skin temp or ambient)
      measure[i].m1 = analogRead(moisture0); // Query moisture sensor
      measure[i].gyro = measure[0].gyro; // Update gyro once every "structSize" reads
    }

    loopCount++; // Increment loop
    sdLog.write(measure, sizeof(measure)); // Allegedly finalizes the write cycle of the 512 byte buffer. I'm not convinced it does, which is why we close and reopen the file in main()
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void milliSync() { // monitor when the rtc second rolls over and mark that "millis" count
  struct startTime // this structure holds the initialization time of the sample collections
  {
    unsigned long mics;
    byte d1; // 
    byte h1;
    byte m1;
    byte s1;
    unsigned long ph1;
    unsigned long ph2;
  };
  struct startTime line1; // populate the structure
  sdLog = SD.open(fileName, O_WRITE | O_CREAT | O_AT_END); // Create file for the datalogging and verify its existance
  DateTime now = rtc.now();  // get time
  line1.d1 = now.day();
  line1.h1 = now.hour();
  line1.m1 = now.minute();
  int nowtime = now.second(); // time of clock when we enter loop
  int newtime = now.second(); // time of clock when we enter loop
  while (nowtime == newtime) { // wait for the seccond to roll over to start cleanly
    DateTime now = rtc.now(); // update the time variable
    newtime = now.second();
    delay(1);
  }
  line1.s1 = now.second();
  line1.mics = micros();
  line1.ph1 = 0; // placeholder of zeros to help find file start if files need to be appended
  line1.ph2 = 0; // placeholder of zeros to help find file start if files need to be appended
  byte *line1Loc = (byte *) &line1; // to access rtc structure as bytes
  byte rtcInit[16];
  memcpy(rtcInit, line1Loc, 16); // place the 16 byte data structure into the buffer
  millisSet = millis(); // Now we have a static millisecond offset to calculate milliseconds in rtcTime()
  sdLog.write(rtcInit, 16); // write the 16 byte buffer to the sd card
  sdLog.close();
  millisSet = millis(); // Now we have a static millisecond offset to calculate milliseconds in rtcTime()
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void getFileName() { // create a filename based on this date on the sd card
  DateTime now = rtc.now(); // get current time
  sprintf(fileName, "%02d%02d%02d%02d.bin", now.month(), now.day(), now.hour(), now.minute()); // place the date into a string to be used as a filename

} // end of getFileName
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void rtcTime() { // Update current RTC time including milliseconds
  DateTime now = rtc.now(); // get current time
  timeLapse = (millis() - millisSet) % 1000; // current millisecond runtime-RTC second sync from milliSync(), divided by 1000 to return milliseconds
} // end of rtcTime
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void thermStart() {
  if (!therm.begin(0x18)) {
    if (testMode) {
      Serial.println("Couldn't find MCP9808! Check your connections and verify the address is correct.");
    }
    while (1);
  }

  therm.setResolution(3); // sets the resolution mode of reading, the modes are defined in the table bellow:

  // Mode Resolution SampleTime
  //  0    0.5°C       30 ms
  //  1    0.25°C      65 ms
  //  2    0.125°C     130 ms
  //  3    0.0625°C    250 ms
} // end of thermStart
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


int thermUpdate() {
  therm.wake();   // wake MCP9808
  float f = therm.readTempF();
  int intTemp = (int) (f * 100); // cast temperature as integer and divide by 100 in postproc
  therm.shutdown_wake(1); // Low power mode of MCP9808. No sense in wasting power when not in use.
  return intTemp;
} // end of thermUpdate
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void pulseOxStart() {
  if (!pulseOx.begin(Wire, I2C_SPEED_FAST)) //Use default I2C port, 400kHz speed
  {
    if (testMode) {
      Serial.println("MAX30105 was not found. Please check wiring/power. ");
    }
    oled.clear();
    oled.setCursor(15, 1);
    oled.println("Pulse Ox Not Found"); // give user feedback that the sensor is not working
    while (1);
  }
  oled.clear();
  oled.setCursor(15, 1);
  oled.println("Pulse Ox Connected"); // give user brief feedback that the sensor is working
  delay(500);

  // Setup pulse oximeter. Options balance resolution, power consumption, and datarate.
  byte ledBrightness = 60; //Options: 0=Off to 255=50mA changed from 255 to 60
  byte sampleAverage = 4; //Options: 1, 2, 4, 8, 16, 32 (initially 8) 
  byte ledMode = 2; //Options: 1 = Red only, 2 = Red + IR, 3 = Red + IR + Green MAX30102 DOES NOT HAVE GREEN LED
  int sampleRate = 3200; //Options: 50, 100, 200, 400, 800, 1000, 1600, 3200 (initially 100)
  int pulseWidth = 69; //Options: 69, 118, 215, 411 (initially 411)
  int adcRange = 8192; //Options: 2048, 4096, 8192, 16384 (initially 4096)
  pulseOx.setup(ledBrightness, sampleAverage, ledMode, sampleRate, pulseWidth, adcRange); //Configure sensor with these settings
  pulseOx.setPulseAmplitudeGreen(0); //Turn off Green LED - MAX30102 does not have green, but otherwise this measurement seems to time out
  // end of PulseOxStart
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void screenInit() { // This function posts the splash screen to the oled
  Wire.begin();
  Wire.setClock(400000L);
  oled.begin(&Adafruit128x32, I2C_ADDRESS); // Connect to Oled
  oled.setFont(System5x7); // Set font style
  oled.clear();
  oled.println("      WIHMS 1.1"); // WIHMS splash screen
  oled.println("  Blake Hewgill 2020");
  oled.println("     Rev 20200405");
  oled.println("       Welcome");
  delay(500);
} // end of screenInit
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void screenMeasure() { // This function creates the display for the sensor measurements
  oled.clear(); //
  oled.print("GSM: "); // set up screen for data display.
  oled.setCursor(0, 1);
  oled.print("HR:    HRV:   ");
  oled.setCursor(0, 2);
  oled.print("SP02:    BPM:    ");
  oled.setCursor(0, 3);
  //oled.print(fileName);
  oled.print("T(f):       Fatigue:    ");
} // end of screenMeasure
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void sdVerify(const char* fileToWrite) {
  pinMode(chipSelect, OUTPUT); // define chipselect pin for SD datalogger
  SD.begin(chipSelect); // Establish comms with SD card
  sdLog = SD.open(fileToWrite, O_WRITE | O_CREAT | O_AT_END); // Create file for the datalogging and verify its existance
  if (sdLog) {
    if (testMode) {
      Serial.println("Connection to SD card established. File created or verified.");
    }
    oled.clear();
    oled.setCursor(30, 1);
    oled.println("SD Connected");
    delay(500);
    sdLog.close();
  } else {
    if (testMode) {
      Serial.println("Error opening SD card. Please double check there is a card inserted.");
    }
    sdLog = SD.open(fileName, O_WRITE | O_CREAT | O_AT_END); // Try again
    sdLog.close(); // Close object to hopefully clear
    oled.clear();
    oled.setCursor(30, 1);
    oled.println("SD NOT Connected");
    oled.println("Check Connection");
    while(1){ // As of now, no self recovery for absent SD card
      delay(1000);
    }
  }
} // end of sdVerify
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


int thermRead(int pinNum) { // function written using code from https://computers.tutsplus.com/tutorials/how-to-read-temperatures-with-arduino--mac-53714 
    double Temp;
    Temp = log(((1024*RT0)/analogRead(pinNum)-RT0));
    Temp = 1 / (A + (B + (C * Temp * Temp ))* Temp ); // Steinhart-Hart equation for thermistor
    Temp = Temp - 273.15;              // Convert Kelvin to Celsius
    Temp = (Temp * 9.0)/ 5.0 + 35.0; 
    return (int)(Temp*100); // Divide by 100 in postproc to get 2 decimal places
} // End of thermRead
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void compCheck() { // If the duration of the collection has passed, stop collecting data and inform the user
      if ((micros() - millisSet) > 630000000) { // Collection done
      oled.clear();
      oled.setCursor(30, 1);
      oled.println("Complete");
      while (1) { // Do nothing
        delay(1000);
      }    
    }
} // end of compCheck
