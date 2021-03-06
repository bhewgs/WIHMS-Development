EESchema Schematic File Version 4
LIBS:MoistureSensor-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "WIHMS Moisture Sensor"
Date "2020-01-28"
Rev "1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "Blake Hewgill"
$EndDescr
$Comp
L Connector:4P4C J1
U 1 1 5E302309
P 3300 3850
F 0 "J1" H 3357 4317 50  0000 C CNN
F 1 "4P4C" H 3357 4226 50  0000 C CNN
F 2 "I2CbusBoard:4p4c" V 3300 3900 50  0001 C CNN
F 3 "~" V 3300 3900 50  0001 C CNN
	1    3300 3850
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad LEAD1
U 1 1 5E302ED4
P 3200 4650
F 0 "LEAD1" V 3437 4653 50  0000 C CNN
F 1 "Lead2" V 3346 4653 50  0000 C CNN
F 2 "TestPoint:TestPoint_Loop_D2.50mm_Drill1.85mm" H 3200 4650 50  0001 C CNN
F 3 "~" H 3200 4650 50  0001 C CNN
	1    3200 4650
	0    -1   -1   0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad LEAD2
U 1 1 5E303166
P 4900 4450
F 0 "LEAD2" V 4854 4600 50  0000 L CNN
F 1 "Lead1" V 4945 4600 50  0000 L CNN
F 2 "TestPoint:TestPoint_Loop_D2.50mm_Drill1.85mm" H 4900 4450 50  0001 C CNN
F 3 "~" H 4900 4450 50  0001 C CNN
	1    4900 4450
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5E303DB0
P 4450 3950
F 0 "R2" V 4650 3950 50  0000 C CNN
F 1 "NC" V 4550 3950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4380 3950 50  0001 C CNN
F 3 "~" H 4450 3950 50  0001 C CNN
	1    4450 3950
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5E303F8B
P 4200 5050
F 0 "R1" H 4130 5004 50  0000 R CNN
F 1 "5.1k" H 4130 5095 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4130 5050 50  0001 C CNN
F 3 "~" H 4200 5050 50  0001 C CNN
	1    4200 5050
	-1   0    0    1   
$EndComp
$Comp
L Device:R R3
U 1 1 5E304339
P 4650 4450
F 0 "R3" V 4443 4450 50  0000 C CNN
F 1 "5.1k" V 4534 4450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4580 4450 50  0001 C CNN
F 3 "~" H 4650 4450 50  0001 C CNN
	1    4650 4450
	0    1    1    0   
$EndComp
$Comp
L Device:LED D1
U 1 1 5E304617
P 4850 3950
F 0 "D1" H 4850 4150 50  0000 C CNN
F 1 "LED" H 4850 4050 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4850 3950 50  0001 C CNN
F 3 "~" H 4850 3950 50  0001 C CNN
	1    4850 3950
	-1   0    0    1   
$EndComp
Text Label 4000 3850 0    50   ~ 0
GND
Text Label 4000 3950 0    50   ~ 0
V+
Wire Wire Line
	3700 3750 3850 3750
Wire Wire Line
	3850 3750 3850 3650
Wire Wire Line
	3850 3650 3700 3650
Connection ~ 3850 3650
Text Label 4000 3650 0    50   ~ 0
Vsense
Wire Wire Line
	3700 3950 4200 3950
Wire Wire Line
	4600 3950 4700 3950
Wire Wire Line
	5000 3950 5200 3950
Wire Wire Line
	5200 3950 5200 3850
Wire Wire Line
	3700 3850 5200 3850
Wire Wire Line
	4200 3950 4200 4100
Connection ~ 4200 3950
Wire Wire Line
	4200 3950 4300 3950
Wire Wire Line
	4200 4450 4500 4450
Wire Wire Line
	3850 3650 5800 3650
$Comp
L Transistor_BJT:S8050 Q1
U 1 1 5E30AE70
P 4100 4650
F 0 "Q1" H 4290 4696 50  0000 L CNN
F 1 "S8050" H 4290 4605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4300 4575 50  0001 L CIN
F 3 "http://www.unisonic.com.tw/datasheet/S8050.pdf" H 4100 4650 50  0001 L CNN
	1    4100 4650
	1    0    0    -1  
$EndComp
Connection ~ 4200 4450
Text Label 4200 5300 2    50   ~ 0
GND
Wire Wire Line
	4200 5200 4200 5300
Wire Wire Line
	5800 3650 5800 4900
Wire Wire Line
	5800 4900 4200 4900
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5E310343
P 4200 4100
F 0 "#FLG0101" H 4200 4175 50  0001 C CNN
F 1 "PWR_FLAG" V 4200 4227 50  0000 L CNN
F 2 "" H 4200 4100 50  0001 C CNN
F 3 "~" H 4200 4100 50  0001 C CNN
	1    4200 4100
	0    -1   -1   0   
$EndComp
Connection ~ 4200 4100
Wire Wire Line
	4200 4100 4200 4450
$Comp
L power:GND #PWR0101
U 1 1 5E311319
P 4200 5300
F 0 "#PWR0101" H 4200 5050 50  0001 C CNN
F 1 "GND" H 4205 5127 50  0000 C CNN
F 2 "" H 4200 5300 50  0001 C CNN
F 3 "" H 4200 5300 50  0001 C CNN
	1    4200 5300
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5E3124FD
P 5200 3850
F 0 "#FLG0102" H 5200 3925 50  0001 C CNN
F 1 "PWR_FLAG" V 5200 3978 50  0000 L CNN
F 2 "" H 5200 3850 50  0001 C CNN
F 3 "~" H 5200 3850 50  0001 C CNN
	1    5200 3850
	0    1    1    0   
$EndComp
Connection ~ 5200 3850
$Comp
L Device:C C1
U 1 1 5E313B7A
P 2000 4500
F 0 "C1" H 2115 4546 50  0000 L CNN
F 1 ".1u" H 2115 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2038 4350 50  0001 C CNN
F 3 "~" H 2000 4500 50  0001 C CNN
	1    2000 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5E313F2C
P 2350 4500
F 0 "C2" H 2465 4546 50  0000 L CNN
F 1 "1u" H 2465 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2388 4350 50  0001 C CNN
F 3 "~" H 2350 4500 50  0001 C CNN
	1    2350 4500
	1    0    0    -1  
$EndComp
Text Label 2200 4150 0    50   ~ 0
V+
Text Label 2200 4900 0    50   ~ 0
GND
Wire Wire Line
	2000 4650 2000 4750
Wire Wire Line
	2000 4750 2200 4750
Wire Wire Line
	2350 4750 2350 4650
Wire Wire Line
	2000 4350 2000 4300
Wire Wire Line
	2000 4300 2200 4300
Wire Wire Line
	2350 4300 2350 4350
Wire Wire Line
	2200 4300 2200 4150
Connection ~ 2200 4300
Wire Wire Line
	2200 4300 2350 4300
Wire Wire Line
	2200 4750 2200 4900
Connection ~ 2200 4750
Wire Wire Line
	2200 4750 2350 4750
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 5E326351
P 3600 4650
F 0 "#FLG0103" H 3600 4725 50  0001 C CNN
F 1 "PWR_FLAG" H 3600 4823 50  0000 C CNN
F 2 "" H 3600 4650 50  0001 C CNN
F 3 "~" H 3600 4650 50  0001 C CNN
	1    3600 4650
	-1   0    0    1   
$EndComp
Wire Wire Line
	3300 4650 3600 4650
Wire Wire Line
	4200 4900 3900 4900
Wire Wire Line
	3900 4900 3900 4650
Connection ~ 4200 4900
Wire Wire Line
	3600 4650 3850 4650
Wire Wire Line
	3850 4650 3850 4850
Wire Wire Line
	3850 4850 4200 4850
Connection ~ 3600 4650
$EndSCHEMATC
