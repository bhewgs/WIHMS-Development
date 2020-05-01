EESchema Schematic File Version 4
LIBS:I2C Bus Board-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "WISM Signal Distribution Board"
Date "2019-10-16"
Rev "1.2"
Comp "University of Vermont"
Comment1 "Blake Hewgill"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:RJ45 J1
U 1 1 5D9DCFB6
P 1100 850
F 0 "J1" V 1109 1380 50  0000 L CNN
F 1 "3.3 I2C" V 1200 1380 50  0000 L CNN
F 2 "Connector_RJ:RJ45_Amphenol_54602-x08_Horizontal" V 1100 875 50  0001 C CNN
F 3 "~" V 1100 875 50  0001 C CNN
	1    1100 850 
	0    1    1    0   
$EndComp
$Comp
L Connector:RJ45 J2
U 1 1 5D9DD02A
P 3050 850
F 0 "J2" V 3059 1380 50  0000 L CNN
F 1 "Sel" V 3150 1380 50  0000 L CNN
F 2 "Connector_RJ:RJ45_Amphenol_54602-x08_Horizontal" V 3050 875 50  0001 C CNN
F 3 "~" V 3050 875 50  0001 C CNN
	1    3050 850 
	0    1    1    0   
$EndComp
$Comp
L Connector:RJ45 J8
U 1 1 5D9DD111
P 6750 800
F 0 "J8" V 6759 1330 50  0000 L CNN
F 1 "5V I2C" V 6850 1330 50  0000 L CNN
F 2 "Connector_RJ:RJ45_Amphenol_54602-x08_Horizontal" V 6750 825 50  0001 C CNN
F 3 "~" V 6750 825 50  0001 C CNN
	1    6750 800 
	0    1    1    0   
$EndComp
Text Label 1000 1400 3    50   ~ 0
+5V
Text Label 800  1400 3    50   ~ 0
GND
Text Label 1400 1400 3    50   ~ 0
GND
Text Label 1100 1400 3    50   ~ 0
GND
Text Label 1300 1400 3    50   ~ 0
GND
Text Label 3250 2450 3    50   ~ 0
+3.3V
Text Label 3350 1400 3    50   ~ 0
GND
Text Label 3050 1400 3    50   ~ 0
GND
Text Label 3250 1400 3    50   ~ 0
GND
Text Label 6550 1350 3    50   ~ 0
TEMP_SCL
Text Label 7150 1350 3    50   ~ 0
TEMP_SDA
Text Label 6650 1350 3    50   ~ 0
+5V
Text Label 6450 1350 3    50   ~ 0
GND
Text Label 7050 1350 3    50   ~ 0
GND
Text Label 6750 1350 3    50   ~ 0
GND
Text Label 6950 1350 3    50   ~ 0
GND
Wire Wire Line
	800  1400 800  1250
Wire Wire Line
	900  1400 900  1250
Wire Wire Line
	1400 1400 1400 1250
Wire Wire Line
	1500 1400 1500 1250
Wire Wire Line
	2750 1400 2750 1250
Wire Wire Line
	2850 1400 2850 1250
Wire Wire Line
	3350 1400 3350 1250
Wire Wire Line
	3450 1400 3450 1250
Wire Wire Line
	6450 1350 6450 1200
Wire Wire Line
	6550 1350 6550 1200
Wire Wire Line
	7050 1350 7050 1200
Wire Wire Line
	7150 1350 7150 1200
$Comp
L Device:C C1
U 1 1 5D9ECF00
P 1000 1900
F 0 "C1" H 885 1854 50  0000 R CNN
F 1 "1uF" H 885 1945 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1038 1750 50  0001 C CNN
F 3 "~" H 1000 1900 50  0001 C CNN
	1    1000 1900
	1    0    0    1   
$EndComp
$Comp
L Device:C C2
U 1 1 5D9ECF36
P 1300 1900
F 0 "C2" H 1415 1946 50  0000 L CNN
F 1 ".1uF" H 1415 1855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1338 1750 50  0001 C CNN
F 3 "~" H 1300 1900 50  0001 C CNN
	1    1300 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1250 1300 1750
Wire Wire Line
	1300 2050 1200 2050
Wire Wire Line
	1200 1250 1200 2050
Wire Wire Line
	1000 1250 1000 1750
Wire Wire Line
	1000 2050 1100 2050
Wire Wire Line
	1100 1250 1100 2050
$Comp
L Device:C C3
U 1 1 5D9F4184
P 3050 1900
F 0 "C3" H 2935 1854 50  0000 R CNN
F 1 ".1uF" H 2935 1945 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3088 1750 50  0001 C CNN
F 3 "~" H 3050 1900 50  0001 C CNN
	1    3050 1900
	1    0    0    1   
$EndComp
$Comp
L Device:C C4
U 1 1 5D9F418B
P 3250 1900
F 0 "C4" H 3365 1946 50  0000 L CNN
F 1 ".1uF" H 3365 1855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3288 1750 50  0001 C CNN
F 3 "~" H 3250 1900 50  0001 C CNN
	1    3250 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 2050 3200 2050
Wire Wire Line
	3150 1250 3150 2050
$Comp
L Device:C C8
U 1 1 5D9F61C4
P 6650 1850
F 0 "C8" H 6535 1804 50  0000 R CNN
F 1 ".1uF" H 6535 1895 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6688 1700 50  0001 C CNN
F 3 "~" H 6650 1850 50  0001 C CNN
	1    6650 1850
	1    0    0    1   
$EndComp
$Comp
L Device:C C10
U 1 1 5D9F61CB
P 6950 1850
F 0 "C10" H 7065 1896 50  0000 L CNN
F 1 "1uF" H 7065 1805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6988 1700 50  0001 C CNN
F 3 "~" H 6950 1850 50  0001 C CNN
	1    6950 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 2000 6850 2000
Wire Wire Line
	6650 2000 6750 2000
Wire Wire Line
	6750 1200 6750 2000
Wire Wire Line
	6850 1200 6850 2000
Wire Wire Line
	6650 1200 6650 1700
Wire Wire Line
	6950 1200 6950 1700
Wire Wire Line
	3250 1250 3250 1750
Text Label 8400 1750 2    50   ~ 0
+5V
Wire Wire Line
	8500 1750 8650 1750
Text Label 8500 1550 3    50   ~ 0
V_A1
Text Label 8800 1550 3    50   ~ 0
A1
Text Label 8600 1550 3    50   ~ 0
GND
Wire Wire Line
	8800 1550 8800 1350
$Comp
L Device:C C11
U 1 1 5DA65952
P 8800 1750
F 0 "C11" V 8915 1796 50  0000 L CNN
F 1 "1uF" V 9000 1800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8838 1600 50  0001 C CNN
F 3 "~" H 8800 1750 50  0001 C CNN
	1    8800 1750
	0    1    1    0   
$EndComp
Text Label 8950 1750 0    50   ~ 0
GND
Text Label 10300 5600 2    50   ~ 0
ACCint
Text Label 10300 5900 2    50   ~ 0
GND
$Comp
L Connector_Generic:Conn_01x08 J3
U 1 1 5DA7546E
P 1950 5850
F 0 "J3" H 2029 5842 50  0000 L CNN
F 1 "RTC" H 2029 5751 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 1950 5850 50  0001 C CNN
F 3 "~" H 1950 5850 50  0001 C CNN
	1    1950 5850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J11
U 1 1 5DA786E5
P 9500 4500
F 0 "J11" H 9580 4492 50  0000 L CNN
F 1 "SD_Card" H 9580 4401 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 9500 4500 50  0001 C CNN
F 3 "~" H 9500 4500 50  0001 C CNN
	1    9500 4500
	1    0    0    -1  
$EndComp
Text Label 9300 4300 2    50   ~ 0
SD_CS
Text Label 9300 4400 2    50   ~ 0
SD_DI
Text Label 9300 4500 2    50   ~ 0
SD_DO
Text Label 9300 4600 2    50   ~ 0
SD_CLK
Text Label 9300 4700 2    50   ~ 0
GND
Text Label 9300 4900 2    50   ~ 0
+5V
NoConn ~ 9300 4800
Text Notes 6650 2200 0    50   ~ 0
MCP9808\nTemp
Text Notes 950  2150 0    50   ~ 0
PulseOx 1
Text Notes 3600 1250 0    50   ~ 0
Aux
$Comp
L Connector:TestPoint TP1
U 1 1 5DA8720A
P 1000 5750
F 0 "TP1" H 1058 5870 50  0000 L CNN
F 1 "TestPoint" H 1058 5779 50  0000 L CNN
F 2 "TestPoint:TestPoint_Loop_D1.80mm_Drill1.0mm_Beaded" H 1200 5750 50  0001 C CNN
F 3 "~" H 1200 5750 50  0001 C CNN
	1    1000 5750
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 5DA87290
P 1000 6050
F 0 "TP2" H 1058 6170 50  0000 L CNN
F 1 "TestPoint" H 1058 6079 50  0000 L CNN
F 2 "TestPoint:TestPoint_Loop_D1.80mm_Drill1.0mm_Beaded" H 1200 6050 50  0001 C CNN
F 3 "~" H 1200 6050 50  0001 C CNN
	1    1000 6050
	1    0    0    -1  
$EndComp
Text Label 1000 5850 0    50   ~ 0
5V_SDA
Text Label 1000 6150 0    50   ~ 0
5V_SCL
Wire Wire Line
	1000 5850 1000 5750
Wire Wire Line
	1000 6050 1000 6150
Text Label 1750 5750 2    50   ~ 0
5V_SCL
Text Label 1750 5850 2    50   ~ 0
5V_SDA
Text Label 1750 5550 2    50   ~ 0
+5V
Text Label 1750 5650 2    50   ~ 0
GND
NoConn ~ 1750 5950
NoConn ~ 1750 6050
NoConn ~ 1750 6150
NoConn ~ 1750 6250
$Comp
L Mechanical:MountingHole H2
U 1 1 5DAA6A40
P 10500 2250
F 0 "H2" H 10600 2296 50  0000 L CNN
F 1 "MountingHole" H 10600 2205 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 10500 2250 50  0001 C CNN
F 3 "~" H 10500 2250 50  0001 C CNN
	1    10500 2250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5DAA6BC6
P 10500 2400
F 0 "H3" H 10600 2446 50  0000 L CNN
F 1 "MountingHole" H 10600 2355 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 10500 2400 50  0001 C CNN
F 3 "~" H 10500 2400 50  0001 C CNN
	1    10500 2400
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5DAA6C2A
P 10500 2550
F 0 "H4" H 10600 2596 50  0000 L CNN
F 1 "MountingHole" H 10600 2505 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 10500 2550 50  0001 C CNN
F 3 "~" H 10500 2550 50  0001 C CNN
	1    10500 2550
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H5
U 1 1 5DAA6C8C
P 10500 2700
F 0 "H5" H 10600 2746 50  0000 L CNN
F 1 "MountingHole" H 10600 2655 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 10500 2700 50  0001 C CNN
F 3 "~" H 10500 2700 50  0001 C CNN
	1    10500 2700
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H6
U 1 1 5DAA6CEE
P 10500 2850
F 0 "H6" H 10600 2896 50  0000 L CNN
F 1 "MountingHole" H 10600 2805 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 10500 2850 50  0001 C CNN
F 3 "~" H 10500 2850 50  0001 C CNN
	1    10500 2850
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H7
U 1 1 5DAA6D56
P 10500 3000
F 0 "H7" H 10600 3046 50  0000 L CNN
F 1 "MountingHole" H 10600 2955 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 10500 3000 50  0001 C CNN
F 3 "~" H 10500 3000 50  0001 C CNN
	1    10500 3000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5DAAA26B
P 10500 2100
F 0 "H1" H 10600 2146 50  0000 L CNN
F 1 "MountingHole" H 10600 2055 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 10500 2100 50  0001 C CNN
F 3 "~" H 10500 2100 50  0001 C CNN
	1    10500 2100
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H9
U 1 1 5DAAA95F
P 10500 3150
F 0 "H9" H 10600 3196 50  0000 L CNN
F 1 "MountingHole" H 10600 3105 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 10500 3150 50  0001 C CNN
F 3 "~" H 10500 3150 50  0001 C CNN
	1    10500 3150
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H10
U 1 1 5DAAA9CB
P 10500 3300
F 0 "H10" H 10600 3346 50  0000 L CNN
F 1 "MountingHole" H 10600 3255 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 10500 3300 50  0001 C CNN
F 3 "~" H 10500 3300 50  0001 C CNN
	1    10500 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J6
U 1 1 5DAAACC2
P 3800 7350
F 0 "J6" H 3720 7667 50  0000 C CNN
F 1 "Pololu S7V8F3" H 3720 7576 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 3800 7350 50  0001 C CNN
F 3 "~" H 3800 7350 50  0001 C CNN
	1    3800 7350
	-1   0    0    -1  
$EndComp
$Comp
L Connector:USB_OTG J10
U 1 1 5DAAB110
P 6400 7050
F 0 "J10" H 6171 7041 50  0000 R CNN
F 1 "PowerIn" H 6171 6950 50  0000 R CNN
F 2 "Connector_USB:USB_Micro-B_Wuerth_629105150521_CircularHoles" H 6550 7000 50  0001 C CNN
F 3 " ~" H 6550 7000 50  0001 C CNN
	1    6400 7050
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J5
U 1 1 5DAAB87F
P 3800 6800
F 0 "J5" H 3720 7117 50  0000 C CNN
F 1 "Pololu S7V7F5" H 3720 7026 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3800 6800 50  0001 C CNN
F 3 "~" H 3800 6800 50  0001 C CNN
	1    3800 6800
	-1   0    0    -1  
$EndComp
Text Label 4000 7250 0    50   ~ 0
~SHDN
Text Label 4000 7350 0    50   ~ 0
Batt+
Text Label 4000 7450 0    50   ~ 0
GND
Text Label 4000 7550 0    50   ~ 0
+3.3V
Text Label 4000 6900 0    50   ~ 0
Batt+
Text Label 4000 6800 0    50   ~ 0
GND
Text Label 4000 6700 0    50   ~ 0
+5V
Wire Wire Line
	4800 6900 4800 6850
Wire Wire Line
	4800 6850 5100 6850
$Comp
L Device:R R5
U 1 1 5DAC3529
P 4350 7250
F 0 "R5" V 4557 7250 50  0000 C CNN
F 1 "NC" V 4466 7250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4280 7250 50  0001 C CNN
F 3 "~" H 4350 7250 50  0001 C CNN
	1    4350 7250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4000 7250 4200 7250
Wire Wire Line
	4000 7450 4650 7450
Wire Wire Line
	4500 7250 4650 7250
Wire Wire Line
	4650 7250 4650 7450
Connection ~ 4650 7450
Wire Wire Line
	4650 7450 4750 7450
Wire Wire Line
	6500 7450 6400 7450
Connection ~ 6400 7450
$Comp
L Device:R R6
U 1 1 5DAD935E
P 4700 6750
F 0 "R6" H 4770 6796 50  0000 L CNN
F 1 "NC" H 4770 6705 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" V 4630 6750 50  0001 C CNN
F 3 "~" H 4700 6750 50  0001 C CNN
	1    4700 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 6900 4750 6900
Wire Wire Line
	4000 6700 4250 6700
Wire Wire Line
	4250 6700 4250 6600
Wire Wire Line
	4250 6600 4700 6600
$Comp
L Device:C C7
U 1 1 5DAE152E
P 4750 7150
F 0 "C7" H 4865 7196 50  0000 L CNN
F 1 "10uF" H 4865 7105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4788 7000 50  0001 C CNN
F 3 "~" H 4750 7150 50  0001 C CNN
	1    4750 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 5DAE15B8
P 5100 7150
F 0 "C9" H 5215 7196 50  0000 L CNN
F 1 "1uF" H 5215 7105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5138 7000 50  0001 C CNN
F 3 "~" H 5100 7150 50  0001 C CNN
	1    5100 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 7000 4750 6900
Connection ~ 4750 6900
Wire Wire Line
	4750 6900 4800 6900
Wire Wire Line
	4750 7300 4750 7450
Connection ~ 4750 7450
Wire Wire Line
	4750 7450 5100 7450
Wire Wire Line
	5100 7300 5100 7450
Connection ~ 5100 7450
Wire Wire Line
	5100 7450 5500 7450
NoConn ~ 6100 7050
NoConn ~ 6100 7150
NoConn ~ 6100 7250
Wire Notes Line
	6950 7750 6950 6400
Wire Notes Line
	3550 6400 3550 7750
Text Notes 4650 6400 0    50   ~ 0
Power Distro
Text Label 9600 5850 2    50   ~ 0
ACC_SDA
Text Label 9600 5700 2    50   ~ 0
ACC_SCL
$Comp
L Connector:RJ45 J9
U 1 1 5DB3F780
P 8200 4650
F 0 "J9" H 8255 5317 50  0000 C CNN
F 1 "SPI" H 8255 5226 50  0000 C CNN
F 2 "Connector_RJ:RJ45_Amphenol_54602-x08_Horizontal" V 8200 4675 50  0001 C CNN
F 3 "~" V 8200 4675 50  0001 C CNN
	1    8200 4650
	1    0    0    -1  
$EndComp
$Comp
L Connector:RJ10 J12
U 1 1 5DB43322
P 8600 850
F 0 "J12" V 8609 1180 50  0000 L CNN
F 1 "Moisture1" V 8700 1180 50  0000 L CNN
F 2 "I2CbusBoard:4p4c" V 8600 900 50  0001 C CNN
F 3 "~" V 8600 900 50  0001 C CNN
	1    8600 850 
	0    1    1    0   
$EndComp
$Comp
L Connector:RJ10 J13
U 1 1 5DB43400
P 9600 850
F 0 "J13" V 9609 1180 50  0000 L CNN
F 1 "Moisture2" V 9700 1180 50  0000 L CNN
F 2 "I2CbusBoard:4p4c" V 9600 900 50  0001 C CNN
F 3 "~" V 9600 900 50  0001 C CNN
	1    9600 850 
	0    1    1    0   
$EndComp
$Comp
L Connector:RJ10 J14
U 1 1 5DB434A0
P 10600 850
F 0 "J14" V 10609 1180 50  0000 L CNN
F 1 "ECG" V 10700 1180 50  0000 L CNN
F 2 "I2CbusBoard:4p4c" V 10600 900 50  0001 C CNN
F 3 "~" V 10600 900 50  0001 C CNN
	1    10600 850 
	0    1    1    0   
$EndComp
Wire Wire Line
	8500 1250 8500 1750
Wire Wire Line
	8700 1250 8700 1350
Wire Wire Line
	8700 1350 8800 1350
Connection ~ 8800 1350
Wire Wire Line
	8800 1350 8800 1250
Wire Wire Line
	8600 1550 8600 1250
Text Label 9350 1750 2    50   ~ 0
+5V
Text Label 9500 1550 3    50   ~ 0
V_A2
Text Label 9800 1550 3    50   ~ 0
A2
Text Label 9600 1550 3    50   ~ 0
GND
Wire Wire Line
	9800 1550 9800 1350
$Comp
L Device:C C12
U 1 1 5DB66F22
P 9900 1750
F 0 "C12" V 10015 1796 50  0000 L CNN
F 1 "1uF" V 10100 1800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 9938 1600 50  0001 C CNN
F 3 "~" H 9900 1750 50  0001 C CNN
	1    9900 1750
	0    1    1    0   
$EndComp
Text Label 10050 1750 0    50   ~ 0
GND
Wire Wire Line
	9500 1250 9500 1750
Wire Wire Line
	9700 1250 9700 1350
Wire Wire Line
	9700 1350 9800 1350
Connection ~ 9800 1350
Wire Wire Line
	9800 1350 9800 1250
Wire Wire Line
	9600 1550 9600 1250
Wire Wire Line
	10400 1750 10500 1750
Text Label 10500 1550 3    50   ~ 0
V_A3
Text Label 10800 1550 3    50   ~ 0
A3
Text Label 10600 1550 3    50   ~ 0
GND
Wire Wire Line
	10800 1550 10800 1350
$Comp
L Device:C C13
U 1 1 5DB698A4
P 10850 1750
F 0 "C13" V 10965 1796 50  0000 L CNN
F 1 "1uF" V 11050 1800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 10888 1600 50  0001 C CNN
F 3 "~" H 10850 1750 50  0001 C CNN
	1    10850 1750
	0    1    1    0   
$EndComp
Text Label 11000 1750 0    50   ~ 0
GND
Wire Wire Line
	10500 1250 10500 1750
Wire Wire Line
	10700 1250 10700 1350
Wire Wire Line
	10700 1350 10800 1350
Connection ~ 10800 1350
Wire Wire Line
	10800 1350 10800 1250
Wire Wire Line
	10600 1550 10600 1250
NoConn ~ 9300 4200
Wire Wire Line
	9300 4600 8850 4600
Wire Wire Line
	8850 4600 8850 4950
Wire Wire Line
	8850 4950 8600 4950
Text Label 8600 4850 0    50   ~ 0
GND
Text Label 8600 4650 0    50   ~ 0
GND
Text Label 8600 4450 0    50   ~ 0
GND
Text Label 8600 4250 0    50   ~ 0
GND
Text Label 8600 4550 0    50   ~ 0
SD_DO
Text Label 8600 4750 0    50   ~ 0
SD_CS
Wire Wire Line
	9050 4350 9050 4400
Wire Wire Line
	9050 4400 9300 4400
Wire Wire Line
	8600 4350 9050 4350
$Comp
L Connector:TestPoint TP3
U 1 1 5DB994F3
P 10000 5500
F 0 "TP3" H 10058 5620 50  0000 L CNN
F 1 "TestPoint" H 10058 5529 50  0000 L CNN
F 2 "TestPoint:TestPoint_Loop_D1.80mm_Drill1.0mm_Beaded" H 10200 5500 50  0001 C CNN
F 3 "~" H 10200 5500 50  0001 C CNN
	1    10000 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 5500 10000 5600
Connection ~ 4700 6900
$Comp
L Mechanical:MountingHole H11
U 1 1 5DBA60DE
P 10500 3450
F 0 "H11" H 10600 3496 50  0000 L CNN
F 1 "MountingHole" H 10600 3405 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 10500 3450 50  0001 C CNN
F 3 "~" H 10500 3450 50  0001 C CNN
	1    10500 3450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H12
U 1 1 5DBA6160
P 10500 3600
F 0 "H12" H 10600 3646 50  0000 L CNN
F 1 "MountingHole" H 10600 3555 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 10500 3600 50  0001 C CNN
F 3 "~" H 10500 3600 50  0001 C CNN
	1    10500 3600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H13
U 1 1 5DBA61E4
P 10500 3750
F 0 "H13" H 10600 3796 50  0000 L CNN
F 1 "MountingHole" H 10600 3705 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 10500 3750 50  0001 C CNN
F 3 "~" H 10500 3750 50  0001 C CNN
	1    10500 3750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H14
U 1 1 5DBA626E
P 10500 3900
F 0 "H14" H 10600 3946 50  0000 L CNN
F 1 "MountingHole" H 10600 3855 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 10500 3900 50  0001 C CNN
F 3 "~" H 10500 3900 50  0001 C CNN
	1    10500 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J15
U 1 1 5DBB421D
P 7900 1000
F 0 "J15" H 7820 1317 50  0000 C CNN
F 1 "AnalogOut" H 7820 1226 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7900 1000 50  0001 C CNN
F 3 "~" H 7900 1000 50  0001 C CNN
	1    7900 1000
	-1   0    0    -1  
$EndComp
Text Label 8100 900  0    50   ~ 0
A1
Text Label 8100 1000 0    50   ~ 0
A2
Text Label 8100 1100 0    50   ~ 0
A3
$Comp
L Connector:RJ45 J16
U 1 1 5DBBF954
P 9200 2450
F 0 "J16" V 9209 2980 50  0000 L CNN
F 1 "I2C_In" V 9300 2980 50  0000 L CNN
F 2 "Connector_RJ:RJ45_Amphenol_54602-x08_Horizontal" V 9200 2475 50  0001 C CNN
F 3 "~" V 9200 2475 50  0001 C CNN
	1    9200 2450
	0    1    1    0   
$EndComp
Text Label 8900 3200 3    50   ~ 0
5V_SDA
Text Label 9600 3200 3    50   ~ 0
5V_SCL
Text Label 9000 3000 3    50   ~ 0
GND
Text Label 9500 3000 3    50   ~ 0
GND
Text Label 9200 3000 3    50   ~ 0
GND
Text Label 9400 3000 3    50   ~ 0
GND
Wire Wire Line
	8900 3000 8900 2850
Wire Wire Line
	9000 3000 9000 2850
Wire Wire Line
	9500 3000 9500 2850
Wire Wire Line
	9100 2850 9100 3000
Wire Wire Line
	9400 2850 9400 3000
Wire Wire Line
	9200 3000 9200 2850
Wire Wire Line
	9300 2850 9300 3000
Text Label 9100 3000 3    50   ~ 0
GND
Text Label 9300 3000 3    50   ~ 0
GND
Wire Wire Line
	10000 5850 10000 5800
$Comp
L Connector:TestPoint Vin1
U 1 1 5DA7D73E
P 3100 7500
F 0 "Vin1" H 3158 7620 50  0000 L CNN
F 1 "TestPoint" H 3158 7529 50  0000 L CNN
F 2 "TestPoint:TestPoint_Loop_D1.80mm_Drill1.0mm_Beaded" H 3300 7500 50  0001 C CNN
F 3 "~" H 3300 7500 50  0001 C CNN
	1    3100 7500
	1    0    0    -1  
$EndComp
Text Label 3100 7150 3    50   ~ 0
GND
Text Label 4900 6850 0    50   ~ 0
Vbatt
Text Label 3100 7500 3    50   ~ 0
Vbatt
$Comp
L Connector:TestPoint Gnd1
U 1 1 5DA7C955
P 3100 7150
F 0 "Gnd1" H 3158 7270 50  0000 L CNN
F 1 "TestPoint" H 3158 7179 50  0000 L CNN
F 2 "TestPoint:TestPoint_Loop_D1.80mm_Drill1.0mm_Beaded" H 3300 7150 50  0001 C CNN
F 3 "~" H 3300 7150 50  0001 C CNN
	1    3100 7150
	1    0    0    -1  
$EndComp
Text Label 1200 1400 3    50   ~ 0
+5V
Text Label 6850 1350 3    50   ~ 0
+5V
Text Label 2950 2450 3    50   ~ 0
+5V
Wire Wire Line
	3050 1250 3050 1750
Wire Wire Line
	2950 1250 2950 1800
Wire Wire Line
	2950 1800 2750 1800
Wire Wire Line
	2750 1800 2750 2050
Wire Wire Line
	2750 2050 2950 2050
$Comp
L Device:R R20
U 1 1 5DAD4564
P 2950 2300
F 0 "R20" H 3020 2346 50  0000 L CNN
F 1 "NC" H 3020 2255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 2880 2300 50  0001 C CNN
F 3 "~" H 2950 2300 50  0001 C CNN
	1    2950 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 5DAD9DD5
P 3250 2300
F 0 "R21" H 3320 2346 50  0000 L CNN
F 1 "NC" H 3320 2255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3180 2300 50  0001 C CNN
F 3 "~" H 3250 2300 50  0001 C CNN
	1    3250 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 2150 3200 2150
Wire Wire Line
	2950 2150 2950 2050
Connection ~ 2950 2150
Connection ~ 2950 2050
Wire Wire Line
	2950 2050 3050 2050
Wire Wire Line
	3200 2150 3200 2050
Connection ~ 3200 2150
Wire Wire Line
	3200 2150 3250 2150
Connection ~ 3200 2050
Wire Wire Line
	3200 2050 3150 2050
Text Label 9650 6250 2    50   ~ 0
+5V
$Comp
L Device:Jumper JP1
U 1 1 5DA9B1E9
P 5800 6850
F 0 "JP1" H 5800 6800 50  0000 C CNN
F 1 "Jumper" H 5800 6750 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5800 6850 50  0001 C CNN
F 3 "~" H 5800 6850 50  0001 C CNN
	1    5800 6850
	1    0    0    -1  
$EndComp
Text Label 1400 7100 0    50   ~ 0
+5V
Text Label 1800 7100 0    50   ~ 0
+3.3V
$Comp
L Device:D_TVS D1
U 1 1 5DACBF6B
P 1400 7250
F 0 "D1" V 1354 7329 50  0000 L CNN
F 1 "D_TVS" V 1445 7329 50  0000 L CNN
F 2 "Diode_SMD:D_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1400 7250 50  0001 C CNN
F 3 "~" H 1400 7250 50  0001 C CNN
	1    1400 7250
	0    1    1    0   
$EndComp
$Comp
L Device:D_TVS D2
U 1 1 5DAD3011
P 1800 7250
F 0 "D2" V 1754 7329 50  0000 L CNN
F 1 "D_TVS" V 1845 7329 50  0000 L CNN
F 2 "Diode_SMD:D_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1800 7250 50  0001 C CNN
F 3 "~" H 1800 7250 50  0001 C CNN
	1    1800 7250
	0    1    1    0   
$EndComp
Text Label 1600 7550 0    50   ~ 0
GND
Wire Wire Line
	1400 7400 1600 7400
Wire Wire Line
	1600 7550 1600 7400
Connection ~ 1600 7400
Wire Wire Line
	1600 7400 1800 7400
Wire Wire Line
	5100 7000 5100 6850
Connection ~ 5100 6850
Wire Wire Line
	5100 6850 5500 6850
$Comp
L Device:C C14
U 1 1 5DB2E2E0
P 5500 7150
F 0 "C14" H 5615 7196 50  0000 L CNN
F 1 "33uF" H 5615 7105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5538 7000 50  0001 C CNN
F 3 "~" H 5500 7150 50  0001 C CNN
	1    5500 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 7000 5500 6850
Connection ~ 5500 6850
Wire Wire Line
	5500 7300 5500 7450
Connection ~ 5500 7450
Wire Wire Line
	5500 7450 6400 7450
Text Label 10400 1750 2    50   ~ 0
+5V
Wire Wire Line
	10300 5900 10500 5900
Wire Wire Line
	10000 5800 10500 5800
Wire Wire Line
	10000 5600 10500 5600
$Comp
L Device:C C21
U 1 1 5DB05BF3
P 2250 7250
F 0 "C21" H 2365 7296 50  0000 L CNN
F 1 "10uF" H 2365 7205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2288 7100 50  0001 C CNN
F 3 "~" H 2250 7250 50  0001 C CNN
	1    2250 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C18
U 1 1 5DB061F8
P 1050 7250
F 0 "C18" H 1165 7296 50  0000 L CNN
F 1 "10uF" H 1165 7205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1088 7100 50  0001 C CNN
F 3 "~" H 1050 7250 50  0001 C CNN
	1    1050 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C17
U 1 1 5DB0623F
P 650 7250
F 0 "C17" H 765 7296 50  0000 L CNN
F 1 "1uF" H 765 7205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 688 7100 50  0001 C CNN
F 3 "~" H 650 7250 50  0001 C CNN
	1    650  7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C22
U 1 1 5DB16392
P 2700 7250
F 0 "C22" H 2815 7296 50  0000 L CNN
F 1 "1uF" H 2815 7205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2738 7100 50  0001 C CNN
F 3 "~" H 2700 7250 50  0001 C CNN
	1    2700 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	650  7100 1050 7100
Wire Wire Line
	1050 7100 1400 7100
Connection ~ 1050 7100
Wire Wire Line
	1800 7100 2250 7100
Wire Wire Line
	2250 7100 2700 7100
Connection ~ 2250 7100
Wire Wire Line
	2700 7400 2250 7400
Wire Wire Line
	650  7400 1050 7400
Wire Wire Line
	1050 7400 1400 7400
Connection ~ 1050 7400
Connection ~ 1400 7400
Wire Wire Line
	1800 7400 2250 7400
Connection ~ 1800 7400
Connection ~ 2250 7400
Wire Notes Line
	6950 7750 3550 7750
Wire Notes Line
	3550 6400 6950 6400
Wire Wire Line
	9500 1750 9750 1750
Wire Wire Line
	9350 1750 9500 1750
Connection ~ 9500 1750
Wire Wire Line
	8400 1750 8500 1750
Connection ~ 8500 1750
Wire Wire Line
	10700 1750 10500 1750
Connection ~ 10500 1750
$Comp
L I2C-Bus-Board-rescue:TCA9517-Q1-TCA9517 U1
U 1 1 5DBFC707
P 1300 3350
F 0 "U1" V 1254 3628 50  0000 L CNN
F 1 "TCA9517-Q1" V 1345 3628 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 1300 3500 50  0001 C CNN
F 3 "" H 1300 3500 50  0001 C CNN
	1    1300 3350
	0    1    1    0   
$EndComp
Text Label 1350 3850 3    50   ~ 0
5V_SDA
Text Label 1250 3850 3    50   ~ 0
5V_SCL
Text Label 1350 2850 1    50   ~ 0
PO_SDA
Text Label 900  1400 3    50   ~ 0
PO_SCL
Text Label 1250 2850 1    50   ~ 0
PO_SCL
Text Label 1150 2850 1    50   ~ 0
GND
Text Label 4900 1350 3    50   ~ 0
+3.3V
Text Notes 4950 2100 0    50   ~ 0
OLED
Wire Wire Line
	4900 1200 4900 1700
Wire Wire Line
	5200 1200 5200 1700
Wire Wire Line
	5100 1200 5100 2000
Wire Wire Line
	5000 1200 5000 2000
Wire Wire Line
	4900 2000 5000 2000
Wire Wire Line
	5200 2000 5100 2000
$Comp
L Device:C C6
U 1 1 5D9F5181
P 5200 1850
F 0 "C6" H 5315 1896 50  0000 L CNN
F 1 ".1uF" H 5315 1805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5238 1700 50  0001 C CNN
F 3 "~" H 5200 1850 50  0001 C CNN
	1    5200 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5D9F517A
P 4900 1850
F 0 "C5" H 4785 1804 50  0000 R CNN
F 1 "1uF" H 4785 1895 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4938 1700 50  0001 C CNN
F 3 "~" H 4900 1850 50  0001 C CNN
	1    4900 1850
	1    0    0    1   
$EndComp
Wire Wire Line
	5400 1350 5400 1200
Wire Wire Line
	5300 1350 5300 1200
Wire Wire Line
	4800 1350 4800 1200
Wire Wire Line
	4700 1350 4700 1200
Text Label 5200 1350 3    50   ~ 0
GND
Text Label 5000 1350 3    50   ~ 0
GND
Text Label 5300 1350 3    50   ~ 0
GND
Text Label 4700 1350 3    50   ~ 0
GND
Text Label 5100 1350 3    50   ~ 0
+3.3V
Text Label 5400 1350 3    50   ~ 0
OLED_SDA
Text Label 4800 1350 3    50   ~ 0
OLED_SCL
$Comp
L Connector:RJ45 J4
U 1 1 5D9DD07E
P 5000 800
F 0 "J4" V 5009 1330 50  0000 L CNN
F 1 "OLED I2C" V 6350 700 50  0000 L CNN
F 2 "Connector_RJ:RJ45_Amphenol_54602-x08_Horizontal" V 5000 825 50  0001 C CNN
F 3 "~" V 5000 825 50  0001 C CNN
	1    5000 800 
	0    1    1    0   
$EndComp
Text Label 1500 1400 3    50   ~ 0
PO_SDA
Text Label 1450 2750 1    50   ~ 0
+3.3V
Text Label 1450 3950 3    50   ~ 0
+5V
$Comp
L Device:R R22
U 1 1 5DC63DDD
P 8700 3000
F 0 "R22" V 8600 2950 50  0000 L CNN
F 1 "3.3k" V 8800 2950 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 8630 3000 50  0001 C CNN
F 3 "~" H 8700 3000 50  0001 C CNN
	1    8700 3000
	0    1    1    0   
$EndComp
$Comp
L Device:R R23
U 1 1 5DC64782
P 9800 3000
F 0 "R23" V 9700 2950 50  0000 L CNN
F 1 "3.3k" V 9900 2950 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 9730 3000 50  0001 C CNN
F 3 "~" H 9800 3000 50  0001 C CNN
	1    9800 3000
	0    1    1    0   
$EndComp
Text Label 8550 3000 2    50   ~ 0
+5V
Text Label 9950 3000 0    50   ~ 0
+5V
Wire Wire Line
	9600 2850 9600 3000
Wire Wire Line
	9600 3000 9650 3000
Connection ~ 9600 3000
Wire Wire Line
	9600 3000 9600 3200
Wire Wire Line
	8900 3000 8850 3000
Wire Wire Line
	8900 3200 8900 3000
Connection ~ 8900 3000
$Comp
L Device:C C16
U 1 1 5DCAA4A6
P 1650 3900
F 0 "C16" H 1765 3946 50  0000 L CNN
F 1 ".1uF" H 1765 3855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1688 3750 50  0001 C CNN
F 3 "~" H 1650 3900 50  0001 C CNN
	1    1650 3900
	0    1    1    0   
$EndComp
$Comp
L Device:C C15
U 1 1 5DCAAA46
P 1650 2800
F 0 "C15" H 1765 2846 50  0000 L CNN
F 1 ".1uF" H 1765 2755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1688 2650 50  0001 C CNN
F 3 "~" H 1650 2800 50  0001 C CNN
	1    1650 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	1450 2750 1450 2800
Wire Wire Line
	1500 2800 1450 2800
Connection ~ 1450 2800
Wire Wire Line
	1450 2800 1450 2850
Wire Wire Line
	1450 3850 1450 3900
Wire Wire Line
	1500 3900 1450 3900
Connection ~ 1450 3900
Wire Wire Line
	1450 3900 1450 3950
Text Label 1800 2800 0    50   ~ 0
GND
Text Label 1800 3900 0    50   ~ 0
GND
$Comp
L Device:R R1
U 1 1 5DCC64B4
P 1100 4500
F 0 "R1" H 1170 4546 50  0000 L CNN
F 1 "2.2k" H 1170 4455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1030 4500 50  0001 C CNN
F 3 "~" H 1100 4500 50  0001 C CNN
	1    1100 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5DCC6E51
P 1400 4500
F 0 "R2" H 1470 4546 50  0000 L CNN
F 1 "2.2k" H 1470 4455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1330 4500 50  0001 C CNN
F 3 "~" H 1400 4500 50  0001 C CNN
	1    1400 4500
	1    0    0    -1  
$EndComp
Text Label 1050 4350 2    50   ~ 0
+3.3V
Wire Wire Line
	1100 4350 1050 4350
Wire Wire Line
	1100 4350 1400 4350
Connection ~ 1100 4350
Text Label 1100 4750 2    50   ~ 0
PO_SCL
Wire Wire Line
	1100 4750 1100 4650
Text Label 1400 4750 0    50   ~ 0
PO_SDA
Wire Wire Line
	1400 4750 1400 4650
NoConn ~ 1150 3850
$Comp
L I2C-Bus-Board-rescue:TCA9517-Q1-TCA9517 U2
U 1 1 5DCFBA00
P 3050 3550
F 0 "U2" V 3004 3828 50  0000 L CNN
F 1 "TCA9517-Q1" V 3095 3828 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3050 3700 50  0001 C CNN
F 3 "" H 3050 3700 50  0001 C CNN
	1    3050 3550
	0    1    1    0   
$EndComp
Text Label 3100 4050 3    50   ~ 0
5V_SDA
Text Label 3000 4050 3    50   ~ 0
5V_SCL
Text Label 3100 3050 1    50   ~ 0
AUX_SDA
Text Label 3000 3050 1    50   ~ 0
AUX_SCL
Text Label 2900 3050 1    50   ~ 0
GND
Text Label 3750 2850 0    50   ~ 0
+3.3V
Text Label 3200 4150 3    50   ~ 0
+5V
$Comp
L Device:C C20
U 1 1 5DCFBA0D
P 3400 4100
F 0 "C20" H 3515 4146 50  0000 L CNN
F 1 ".1uF" H 3515 4055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3438 3950 50  0001 C CNN
F 3 "~" H 3400 4100 50  0001 C CNN
	1    3400 4100
	0    1    1    0   
$EndComp
$Comp
L Device:C C19
U 1 1 5DCFBA13
P 3400 3000
F 0 "C19" H 3515 3046 50  0000 L CNN
F 1 ".1uF" H 3515 2955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3438 2850 50  0001 C CNN
F 3 "~" H 3400 3000 50  0001 C CNN
	1    3400 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 3000 3200 3000
Connection ~ 3200 3000
Wire Wire Line
	3200 3000 3200 3050
Wire Wire Line
	3200 4050 3200 4100
Wire Wire Line
	3250 4100 3200 4100
Connection ~ 3200 4100
Wire Wire Line
	3200 4100 3200 4150
Text Label 3550 3000 0    50   ~ 0
GND
Text Label 3550 4100 0    50   ~ 0
GND
$Comp
L Device:R R7
U 1 1 5DCFBA23
P 2850 4600
F 0 "R7" H 2920 4646 50  0000 L CNN
F 1 "NC" H 2920 4555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 2780 4600 50  0001 C CNN
F 3 "~" H 2850 4600 50  0001 C CNN
	1    2850 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 5DCFBA29
P 3150 4600
F 0 "R8" H 3220 4646 50  0000 L CNN
F 1 "NC" H 3220 4555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3080 4600 50  0001 C CNN
F 3 "~" H 3150 4600 50  0001 C CNN
	1    3150 4600
	1    0    0    -1  
$EndComp
Text Label 2400 4450 2    50   ~ 0
+3.3V
Wire Wire Line
	2850 4450 3150 4450
Connection ~ 2850 4450
Text Label 2850 4850 2    50   ~ 0
AUX_SCL
Wire Wire Line
	2850 4850 2850 4750
Text Label 3150 4850 0    50   ~ 0
AUX_SDA
Wire Wire Line
	3150 4850 3150 4750
NoConn ~ 2900 4050
$Comp
L I2C-Bus-Board-rescue:TCA9517-Q1-TCA9517 U3
U 1 1 5DD05D37
P 5100 3150
F 0 "U3" V 5054 3428 50  0000 L CNN
F 1 "TCA9517-Q1" V 5145 3428 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 5100 3300 50  0001 C CNN
F 3 "" H 5100 3300 50  0001 C CNN
	1    5100 3150
	0    1    1    0   
$EndComp
Text Label 5150 3650 3    50   ~ 0
5V_SDA
Text Label 5050 3650 3    50   ~ 0
5V_SCL
Text Label 5150 2650 1    50   ~ 0
OLED_SDA
Text Label 5050 2650 1    50   ~ 0
OLED_SCL
Text Label 4950 2650 1    50   ~ 0
GND
Text Label 5250 3750 3    50   ~ 0
+5V
$Comp
L Device:C C24
U 1 1 5DD05D44
P 5450 3700
F 0 "C24" H 5565 3746 50  0000 L CNN
F 1 ".1uF" H 5565 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5488 3550 50  0001 C CNN
F 3 "~" H 5450 3700 50  0001 C CNN
	1    5450 3700
	0    1    1    0   
$EndComp
$Comp
L Device:C C23
U 1 1 5DD05D4A
P 5450 2600
F 0 "C23" H 5565 2646 50  0000 L CNN
F 1 ".1uF" H 5565 2555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5488 2450 50  0001 C CNN
F 3 "~" H 5450 2600 50  0001 C CNN
	1    5450 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 2550 5250 2600
Wire Wire Line
	5300 2600 5250 2600
Connection ~ 5250 2600
Wire Wire Line
	5250 2600 5250 2650
Wire Wire Line
	5250 3650 5250 3700
Wire Wire Line
	5300 3700 5250 3700
Connection ~ 5250 3700
Wire Wire Line
	5250 3700 5250 3750
Text Label 5600 2600 0    50   ~ 0
GND
Text Label 5600 3700 0    50   ~ 0
GND
$Comp
L Device:R R11
U 1 1 5DD05D5A
P 4900 4300
F 0 "R11" H 4970 4346 50  0000 L CNN
F 1 "3.3k" H 4970 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4830 4300 50  0001 C CNN
F 3 "~" H 4900 4300 50  0001 C CNN
	1    4900 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5DD05D60
P 5200 4300
F 0 "R12" H 5270 4346 50  0000 L CNN
F 1 "3.3k" H 5270 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5130 4300 50  0001 C CNN
F 3 "~" H 5200 4300 50  0001 C CNN
	1    5200 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 4150 4850 4150
Wire Wire Line
	4900 4150 5200 4150
Connection ~ 4900 4150
Text Label 4900 4550 2    50   ~ 0
OLED_SCL
Wire Wire Line
	4900 4550 4900 4450
Text Label 5200 4550 0    50   ~ 0
OLED_SDA
Wire Wire Line
	5200 4550 5200 4450
NoConn ~ 4950 3650
Text Label 5250 2550 1    50   ~ 0
+5V
Text Label 4850 4150 1    50   ~ 0
+5V
$Comp
L I2C-Bus-Board-rescue:TCA9517-Q1-TCA9517 U4
U 1 1 5DD16886
P 6850 3150
F 0 "U4" V 6804 3428 50  0000 L CNN
F 1 "TCA9517-Q1" V 6895 3428 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6850 3300 50  0001 C CNN
F 3 "" H 6850 3300 50  0001 C CNN
	1    6850 3150
	0    1    1    0   
$EndComp
Text Label 6900 3650 3    50   ~ 0
5V_SDA
Text Label 6800 3650 3    50   ~ 0
5V_SCL
Text Label 6900 2650 1    50   ~ 0
TEMP_SDA
Text Label 6800 2650 1    50   ~ 0
TEMP_SCL
Text Label 6700 2650 1    50   ~ 0
GND
Text Label 7000 3750 3    50   ~ 0
+5V
$Comp
L Device:C C26
U 1 1 5DD16892
P 7200 3700
F 0 "C26" H 7315 3746 50  0000 L CNN
F 1 ".1uF" H 7315 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7238 3550 50  0001 C CNN
F 3 "~" H 7200 3700 50  0001 C CNN
	1    7200 3700
	0    1    1    0   
$EndComp
$Comp
L Device:C C25
U 1 1 5DD16898
P 7200 2600
F 0 "C25" H 7315 2646 50  0000 L CNN
F 1 ".1uF" H 7315 2555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7238 2450 50  0001 C CNN
F 3 "~" H 7200 2600 50  0001 C CNN
	1    7200 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	7000 2550 7000 2600
Wire Wire Line
	7050 2600 7000 2600
Connection ~ 7000 2600
Wire Wire Line
	7000 2600 7000 2650
Wire Wire Line
	7000 3650 7000 3700
Wire Wire Line
	7050 3700 7000 3700
Connection ~ 7000 3700
Wire Wire Line
	7000 3700 7000 3750
Text Label 7350 2600 0    50   ~ 0
GND
Text Label 7350 3700 0    50   ~ 0
GND
$Comp
L Device:R R18
U 1 1 5DD168A8
P 6650 4300
F 0 "R18" H 6720 4346 50  0000 L CNN
F 1 "3.3k" H 6720 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6580 4300 50  0001 C CNN
F 3 "~" H 6650 4300 50  0001 C CNN
	1    6650 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 5DD168AE
P 6950 4300
F 0 "R19" H 7020 4346 50  0000 L CNN
F 1 "3.3k" H 7020 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6880 4300 50  0001 C CNN
F 3 "~" H 6950 4300 50  0001 C CNN
	1    6950 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4150 6600 4150
Wire Wire Line
	6650 4150 6950 4150
Connection ~ 6650 4150
Text Label 6650 4550 2    50   ~ 0
TEMP_SCL
Wire Wire Line
	6650 4550 6650 4450
Text Label 6950 4550 0    50   ~ 0
TEMP_SDA
Wire Wire Line
	6950 4550 6950 4450
NoConn ~ 6700 3650
Text Label 7000 2550 1    50   ~ 0
+5V
Text Label 6600 4150 1    50   ~ 0
+5V
Text Label 2400 4250 2    50   ~ 0
+5V
$Comp
L Device:R R4
U 1 1 5DD2B0FB
P 2550 4450
F 0 "R4" V 2650 4500 50  0000 C CNN
F 1 "NC" V 2650 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 2480 4450 50  0001 C CNN
F 3 "~" H 2550 4450 50  0001 C CNN
	1    2550 4450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R3
U 1 1 5DD3567F
P 2550 4250
F 0 "R3" V 2650 4300 50  0000 C CNN
F 1 "NC" V 2650 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 2480 4250 50  0001 C CNN
F 3 "~" H 2550 4250 50  0001 C CNN
	1    2550 4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2700 4250 2850 4250
Wire Wire Line
	2850 4250 2850 4450
Wire Wire Line
	2700 4450 2850 4450
Text Label 3750 2600 0    50   ~ 0
+5V
$Comp
L Device:R R9
U 1 1 5DD5FBE8
P 3600 2600
F 0 "R9" V 3700 2650 50  0000 C CNN
F 1 "NC" V 3700 2500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3530 2600 50  0001 C CNN
F 3 "~" H 3600 2600 50  0001 C CNN
	1    3600 2600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R10
U 1 1 5DD72E83
P 3600 2850
F 0 "R10" V 3700 2900 50  0000 C CNN
F 1 "NC" V 3700 2750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3530 2850 50  0001 C CNN
F 3 "~" H 3600 2850 50  0001 C CNN
	1    3600 2850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3450 2850 3350 2850
Wire Wire Line
	3200 2850 3200 3000
Wire Wire Line
	3450 2600 3350 2600
Wire Wire Line
	3350 2600 3350 2850
Connection ~ 3350 2850
Wire Wire Line
	3350 2850 3200 2850
$Comp
L I2C-Bus-Board-rescue:TCA9517-Q1-TCA9517 U5
U 1 1 5DDB7DF0
P 7600 5850
F 0 "U5" V 7554 6128 50  0000 L CNN
F 1 "TCA9517-Q1" V 7645 6128 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 7600 6000 50  0001 C CNN
F 3 "" H 7600 6000 50  0001 C CNN
	1    7600 5850
	1    0    0    -1  
$EndComp
Text Label 8100 5800 0    50   ~ 0
5V_SDA
Text Label 8100 5900 0    50   ~ 0
5V_SCL
Text Label 7100 6000 2    50   ~ 0
GND
Text Label 8200 5700 0    50   ~ 0
+5V
$Comp
L Device:C C28
U 1 1 5DDB7DFC
P 8150 5500
F 0 "C28" H 8265 5546 50  0000 L CNN
F 1 ".1uF" H 8265 5455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8188 5350 50  0001 C CNN
F 3 "~" H 8150 5500 50  0001 C CNN
	1    8150 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C27
U 1 1 5DDB7E02
P 7050 5500
F 0 "C27" H 7165 5546 50  0000 L CNN
F 1 ".1uF" H 7165 5455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7088 5350 50  0001 C CNN
F 3 "~" H 7050 5500 50  0001 C CNN
	1    7050 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 5650 7050 5700
Connection ~ 7050 5700
Wire Wire Line
	7050 5700 7100 5700
Wire Wire Line
	8100 5700 8150 5700
Wire Wire Line
	8150 5650 8150 5700
Connection ~ 8150 5700
Wire Wire Line
	8150 5700 8200 5700
Text Label 7050 5350 1    50   ~ 0
GND
Text Label 8150 5350 1    50   ~ 0
GND
$Comp
L Device:R R29
U 1 1 5DDB7E12
P 8750 6050
F 0 "R29" H 8820 6096 50  0000 L CNN
F 1 "NC" H 8820 6005 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 8680 6050 50  0001 C CNN
F 3 "~" H 8750 6050 50  0001 C CNN
	1    8750 6050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R28
U 1 1 5DDB7E18
P 8750 5750
F 0 "R28" H 8820 5796 50  0000 L CNN
F 1 "NC" H 8820 5705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 8680 5750 50  0001 C CNN
F 3 "~" H 8750 5750 50  0001 C CNN
	1    8750 5750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8600 6050 8600 5750
Connection ~ 8600 6050
Text Label 9000 6050 3    50   ~ 0
ACC_SCL
Wire Wire Line
	9000 6050 8900 6050
Text Label 9000 5750 1    50   ~ 0
ACC_SDA
Wire Wire Line
	9000 5750 8900 5750
NoConn ~ 8100 6000
Text Label 6300 5700 2    50   ~ 0
+3.3V
Wire Wire Line
	10200 6000 10500 6000
Text Label 7100 5800 2    50   ~ 0
ACC_SDA
Text Label 7100 5900 2    50   ~ 0
ACC_SCL
$Comp
L Device:R R25
U 1 1 5DDFA742
P 6450 5700
F 0 "R25" V 6550 5750 50  0000 L CNN
F 1 "NC" V 6550 5650 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6380 5700 50  0001 C CNN
F 3 "~" H 6450 5700 50  0001 C CNN
	1    6450 5700
	0    1    1    0   
$EndComp
Text Label 8600 6500 2    50   ~ 0
+3.3V
$Comp
L Mechanical:MountingHole H8
U 1 1 5E1060A5
P 10500 4050
F 0 "H8" H 10600 4096 50  0000 L CNN
F 1 "MountingHole" H 10600 4005 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 10500 4050 50  0001 C CNN
F 3 "~" H 10500 4050 50  0001 C CNN
	1    10500 4050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H15
U 1 1 5E1062BE
P 10500 4200
F 0 "H15" H 10600 4246 50  0000 L CNN
F 1 "MountingHole" H 10600 4155 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 10500 4200 50  0001 C CNN
F 3 "~" H 10500 4200 50  0001 C CNN
	1    10500 4200
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H16
U 1 1 5E1064C6
P 10500 4350
F 0 "H16" H 10600 4396 50  0000 L CNN
F 1 "MountingHole" H 10600 4305 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 10500 4350 50  0001 C CNN
F 3 "~" H 10500 4350 50  0001 C CNN
	1    10500 4350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H17
U 1 1 5E1066A5
P 10500 4500
F 0 "H17" H 10600 4546 50  0000 L CNN
F 1 "MountingHole" H 10600 4455 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 10500 4500 50  0001 C CNN
F 3 "~" H 10500 4500 50  0001 C CNN
	1    10500 4500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H18
U 1 1 5E106801
P 10500 4650
F 0 "H18" H 10600 4696 50  0000 L CNN
F 1 "MountingHole" H 10600 4605 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 10500 4650 50  0001 C CNN
F 3 "~" H 10500 4650 50  0001 C CNN
	1    10500 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 6900 4700 6900
Text Label 3450 1400 3    50   ~ 0
AUX_SDA
Text Label 2850 1400 3    50   ~ 0
AUX_SCL
Text Label 2750 1400 3    50   ~ 0
GND
Wire Wire Line
	6600 5700 7050 5700
Wire Wire Line
	10200 6000 10200 6250
Wire Wire Line
	9650 6250 10200 6250
Wire Wire Line
	8600 6050 8600 6500
Wire Wire Line
	9600 5700 10500 5700
Wire Wire Line
	9600 5850 10000 5850
$Comp
L Connector_Generic:Conn_01x05 J?
U 1 1 5DC05922
P 10700 5800
F 0 "J?" H 10780 5842 50  0000 L CNN
F 1 "MPU6050" H 10780 5751 50  0000 L CNN
F 2 "" H 10700 5800 50  0001 C CNN
F 3 "~" H 10700 5800 50  0001 C CNN
	1    10700 5800
	1    0    0    -1  
$EndComp
$EndSCHEMATC
