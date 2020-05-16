EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "MAX30102 WIHMS Breakout"
Date "2020-05-16"
Rev "1"
Comp "University of Vermont"
Comment1 "Blake Hewgill"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:8P8C J?
U 1 1 5EC00499
P 2750 4050
F 0 "J?" H 2807 4717 50  0000 C CNN
F 1 "8P8C" H 2807 4626 50  0000 C CNN
F 2 "" V 2750 4075 50  0001 C CNN
F 3 "~" V 2750 4075 50  0001 C CNN
	1    2750 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3650 4000 3650
Wire Wire Line
	3150 3750 4000 3750
Wire Wire Line
	3150 3850 4000 3850
Wire Wire Line
	3150 3950 4000 3950
Wire Wire Line
	3150 4050 4000 4050
Wire Wire Line
	3150 4150 4000 4150
Wire Wire Line
	3150 4250 4000 4250
Wire Wire Line
	3150 4350 4000 4350
Text Notes 3300 4350 0    50   ~ 0
O/W
Text Notes 3300 4250 0    50   ~ 0
O
Text Notes 3300 4150 0    50   ~ 0
G/W
Text Notes 3300 4050 0    50   ~ 0
Bl
Text Notes 3300 3950 0    50   ~ 0
Bl/W
Text Notes 3300 3850 0    50   ~ 0
G
Text Notes 3300 3750 0    50   ~ 0
Br/W
Text Notes 3300 3650 0    50   ~ 0
Br
$Comp
L Sensor:MAX30102 IC?
U 1 1 5EC01CBD
P 6050 4050
F 0 "IC?" H 5350 3750 50  0000 R CNN
F 1 "MAX30102" H 5500 3650 50  0000 R CNN
F 2 "OptoDevice:Maxim_OLGA-14_3.3x5.6mm_P0.8mm" H 5900 4950 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX30102.pdf" H 5700 4300 50  0001 C CNN
	1    6050 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EC024A8
P 5950 4550
F 0 "#PWR?" H 5950 4300 50  0001 C CNN
F 1 "GND" H 5955 4377 50  0000 C CNN
F 2 "" H 5950 4550 50  0001 C CNN
F 3 "" H 5950 4550 50  0001 C CNN
	1    5950 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EC02915
P 6200 3300
F 0 "C?" V 6452 3300 50  0000 C CNN
F 1 "C" V 6361 3300 50  0000 C CNN
F 2 "" H 6238 3150 50  0001 C CNN
F 3 "~" H 6200 3300 50  0001 C CNN
	1    6200 3300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EC03361
P 6400 3400
F 0 "#PWR?" H 6400 3150 50  0001 C CNN
F 1 "GND" H 6405 3227 50  0000 C CNN
F 2 "" H 6400 3400 50  0001 C CNN
F 3 "" H 6400 3400 50  0001 C CNN
	1    6400 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3400 6400 3300
Wire Wire Line
	6400 3300 6350 3300
$Comp
L power:GND #PWR?
U 1 1 5EC03897
P 3050 5550
F 0 "#PWR?" H 3050 5300 50  0001 C CNN
F 1 "GND" H 3055 5377 50  0000 C CNN
F 2 "" H 3050 5550 50  0001 C CNN
F 3 "" H 3050 5550 50  0001 C CNN
	1    3050 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EC03B3B
P 2850 5300
F 0 "C?" H 2735 5254 50  0000 R CNN
F 1 ".1u" H 2735 5345 50  0000 R CNN
F 2 "" H 2888 5150 50  0001 C CNN
F 3 "~" H 2850 5300 50  0001 C CNN
	1    2850 5300
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 5EC041C0
P 3300 5300
F 0 "C?" H 3185 5254 50  0000 R CNN
F 1 "47u" H 3185 5345 50  0000 R CNN
F 2 "" H 3338 5150 50  0001 C CNN
F 3 "~" H 3300 5300 50  0001 C CNN
	1    3300 5300
	-1   0    0    1   
$EndComp
Wire Wire Line
	2850 5450 2850 5550
Wire Wire Line
	2850 5550 3050 5550
Wire Wire Line
	3050 5550 3300 5550
Wire Wire Line
	3300 5550 3300 5450
Connection ~ 3050 5550
Wire Wire Line
	2850 5150 3050 5150
$Comp
L power:+3.3V #PWR?
U 1 1 5EC04E90
P 3050 5150
F 0 "#PWR?" H 3050 5000 50  0001 C CNN
F 1 "+3.3V" H 3065 5323 50  0000 C CNN
F 2 "" H 3050 5150 50  0001 C CNN
F 3 "" H 3050 5150 50  0001 C CNN
	1    3050 5150
	1    0    0    -1  
$EndComp
Connection ~ 3050 5150
Wire Wire Line
	3050 5150 3300 5150
$Comp
L Device:R R?
U 1 1 5EC052B8
P 6750 3850
F 0 "R?" H 6820 3896 50  0000 L CNN
F 1 "R" H 6820 3805 50  0000 L CNN
F 2 "" V 6680 3850 50  0001 C CNN
F 3 "~" H 6750 3850 50  0001 C CNN
	1    6750 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4050 6750 4050
Wire Wire Line
	6750 4050 6750 4000
$Comp
L power:+3.3V #PWR?
U 1 1 5EC05AF3
P 6750 3700
F 0 "#PWR?" H 6750 3550 50  0001 C CNN
F 1 "+3.3V" H 6765 3873 50  0000 C CNN
F 2 "" H 6750 3700 50  0001 C CNN
F 3 "" H 6750 3700 50  0001 C CNN
	1    6750 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EC062B2
P 1700 5300
F 0 "C?" H 1585 5254 50  0000 R CNN
F 1 "1u" H 1585 5345 50  0000 R CNN
F 2 "" H 1738 5150 50  0001 C CNN
F 3 "~" H 1700 5300 50  0001 C CNN
	1    1700 5300
	-1   0    0    1   
$EndComp
Wire Wire Line
	1700 5450 1700 5550
Wire Wire Line
	1700 5550 2300 5550
Connection ~ 2850 5550
$Comp
L Device:C C?
U 1 1 5EC06BBF
P 4450 5300
F 0 "C?" H 4335 5254 50  0000 R CNN
F 1 "1u" H 4335 5345 50  0000 R CNN
F 2 "" H 4488 5150 50  0001 C CNN
F 3 "~" H 4450 5300 50  0001 C CNN
	1    4450 5300
	-1   0    0    1   
$EndComp
Connection ~ 3300 5550
Wire Wire Line
	4450 5550 4450 5450
Wire Wire Line
	3300 5550 3900 5550
$Comp
L power:+3.3V #PWR?
U 1 1 5EC08644
P 7650 5050
F 0 "#PWR?" H 7650 4900 50  0001 C CNN
F 1 "+3.3V" H 7665 5223 50  0000 C CNN
F 2 "" H 7650 5050 50  0001 C CNN
F 3 "" H 7650 5050 50  0001 C CNN
	1    7650 5050
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5EC08B70
P 7650 5700
F 0 "#PWR?" H 7650 5550 50  0001 C CNN
F 1 "+3.3V" H 7665 5873 50  0000 C CNN
F 2 "" H 7650 5700 50  0001 C CNN
F 3 "" H 7650 5700 50  0001 C CNN
	1    7650 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EC0992C
P 7650 5200
F 0 "R?" H 7720 5246 50  0000 L CNN
F 1 "4.7k" H 7720 5155 50  0000 L CNN
F 2 "" V 7580 5200 50  0001 C CNN
F 3 "~" H 7650 5200 50  0001 C CNN
	1    7650 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EC09E7D
P 7650 5850
F 0 "R?" H 7720 5896 50  0000 L CNN
F 1 "4.7k" H 7720 5805 50  0000 L CNN
F 2 "" V 7580 5850 50  0001 C CNN
F 3 "~" H 7650 5850 50  0001 C CNN
	1    7650 5850
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:BSS138 Q?
U 1 1 5EC0A5D6
P 6950 6000
F 0 "Q?" V 7201 6000 50  0000 C CNN
F 1 "BSS138" V 7292 6000 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7150 5925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 6950 6000 50  0001 L CNN
	1    6950 6000
	0    -1   1    0   
$EndComp
$Comp
L Transistor_FET:BSS138 Q?
U 1 1 5EC0F6F2
P 6950 5250
F 0 "Q?" V 7201 5250 50  0000 C CNN
F 1 "BSS138" V 7292 5250 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7150 5175 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 6950 5250 50  0001 L CNN
	1    6950 5250
	0    -1   1    0   
$EndComp
Wire Wire Line
	6950 5050 7650 5050
Connection ~ 7650 5050
Wire Wire Line
	6950 5800 6950 5700
Wire Wire Line
	6950 5700 7650 5700
Connection ~ 7650 5700
Wire Wire Line
	7150 6100 7650 6100
Wire Wire Line
	7650 6100 7650 6000
Wire Wire Line
	7650 6100 7800 6100
Connection ~ 7650 6100
Wire Wire Line
	7150 5350 7650 5350
Wire Wire Line
	7650 5350 7800 5350
Connection ~ 7650 5350
Text Label 7800 5350 0    50   ~ 0
BSCL
Text Label 7800 6100 0    50   ~ 0
BSDA
Text Label 5450 4050 2    50   ~ 0
BSDA
Text Label 5450 3950 2    50   ~ 0
BSCL
$Comp
L Device:R R?
U 1 1 5EC145D3
P 6450 5150
F 0 "R?" H 6520 5196 50  0000 L CNN
F 1 "4.7k" H 6520 5105 50  0000 L CNN
F 2 "" V 6380 5150 50  0001 C CNN
F 3 "~" H 6450 5150 50  0001 C CNN
	1    6450 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EC14955
P 6450 5900
F 0 "R?" H 6520 5946 50  0000 L CNN
F 1 "4.7k" H 6520 5855 50  0000 L CNN
F 2 "" V 6380 5900 50  0001 C CNN
F 3 "~" H 6450 5900 50  0001 C CNN
	1    6450 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 6050 6450 6100
Wire Wire Line
	6450 6100 6750 6100
Wire Wire Line
	6450 5300 6450 5350
Wire Wire Line
	6450 5350 6750 5350
Wire Wire Line
	6450 5350 6300 5350
Connection ~ 6450 5350
Wire Wire Line
	6450 6100 6300 6100
Connection ~ 6450 6100
Text Label 6300 5350 2    50   ~ 0
ASCL
Text Label 6300 6100 2    50   ~ 0
ASDA
$Comp
L power:+5V #PWR?
U 1 1 5EC19D26
P 6450 5750
F 0 "#PWR?" H 6450 5600 50  0001 C CNN
F 1 "+5V" H 6465 5923 50  0000 C CNN
F 2 "" H 6450 5750 50  0001 C CNN
F 3 "" H 6450 5750 50  0001 C CNN
	1    6450 5750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EC1D2F6
P 6450 5000
F 0 "#PWR?" H 6450 4850 50  0001 C CNN
F 1 "+5V" H 6465 5173 50  0000 C CNN
F 2 "" H 6450 5000 50  0001 C CNN
F 3 "" H 6450 5000 50  0001 C CNN
	1    6450 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 4550 5950 4550
Connection ~ 5950 4550
$Comp
L power:+1V8 #PWR?
U 1 1 5EC1EC46
P 4450 5150
F 0 "#PWR?" H 4450 5000 50  0001 C CNN
F 1 "+1V8" H 4465 5323 50  0000 C CNN
F 2 "" H 4450 5150 50  0001 C CNN
F 3 "" H 4450 5150 50  0001 C CNN
	1    4450 5150
	1    0    0    -1  
$EndComp
$Comp
L power:+1V8 #PWR?
U 1 1 5EC1F3EF
P 5750 3550
F 0 "#PWR?" H 5750 3400 50  0001 C CNN
F 1 "+1V8" H 5765 3723 50  0000 C CNN
F 2 "" H 5750 3550 50  0001 C CNN
F 3 "" H 5750 3550 50  0001 C CNN
	1    5750 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 3550 5950 3300
Wire Wire Line
	5950 3300 6050 3300
Wire Wire Line
	6050 3550 6050 3300
Connection ~ 6050 3300
NoConn ~ 6650 4250
NoConn ~ 6650 4350
$Comp
L Regulator_Linear:LF15_TO220 U?
U 1 1 5EC2536A
P 3900 5150
F 0 "U?" H 3900 5392 50  0000 C CNN
F 1 "LDO_1.8" H 3900 5301 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 3900 5375 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/c4/0e/7e/2a/be/bc/4c/bd/CD00000546.pdf/files/CD00000546.pdf/jcr:content/translations/en.CD00000546.pdf" H 3900 5100 50  0001 C CNN
	1    3900 5150
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LF15_TO220 U?
U 1 1 5EC25E7B
P 2300 5150
F 0 "U?" H 2300 5392 50  0000 C CNN
F 1 "LDO_3.3" H 2300 5301 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 2300 5375 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/c4/0e/7e/2a/be/bc/4c/bd/CD00000546.pdf/files/CD00000546.pdf/jcr:content/translations/en.CD00000546.pdf" H 2300 5100 50  0001 C CNN
	1    2300 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 5150 2000 5150
Wire Wire Line
	2300 5450 2300 5550
Connection ~ 2300 5550
Wire Wire Line
	2300 5550 2850 5550
Wire Wire Line
	2600 5150 2850 5150
Connection ~ 2850 5150
Wire Wire Line
	3300 5150 3600 5150
Connection ~ 3300 5150
Wire Wire Line
	4200 5150 4450 5150
Connection ~ 4450 5150
Wire Wire Line
	3900 5450 3900 5550
Connection ~ 3900 5550
Wire Wire Line
	3900 5550 4450 5550
$Comp
L power:+5V #PWR?
U 1 1 5EC2C868
P 1700 5150
F 0 "#PWR?" H 1700 5000 50  0001 C CNN
F 1 "+5V" H 1715 5323 50  0000 C CNN
F 2 "" H 1700 5150 50  0001 C CNN
F 3 "" H 1700 5150 50  0001 C CNN
	1    1700 5150
	1    0    0    -1  
$EndComp
Connection ~ 1700 5150
Wire Wire Line
	1700 5150 1600 5150
Text Label 1600 5150 2    50   ~ 0
Vin
Text Label 4000 4250 0    50   ~ 0
ASCL
Text Label 4000 3650 0    50   ~ 0
ASDA
Text Label 4000 3950 0    50   ~ 0
Vin
Text Label 4000 4150 0    50   ~ 0
Vin
Text Label 4000 4350 0    50   ~ 0
GND
Text Label 4000 4050 0    50   ~ 0
GND
Text Label 4000 3850 0    50   ~ 0
GND
Text Label 4000 3750 0    50   ~ 0
GND
Text Label 4500 5550 0    50   ~ 0
GND
Wire Wire Line
	4500 5550 4450 5550
Connection ~ 4450 5550
$EndSCHEMATC
