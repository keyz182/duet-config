; General preferences
G90                                                ; Send absolute coordinates...
M83                                                ; ...but relative extruder moves

M667 S1                                            ; Select CoreXY mode

; Network
M550 PThreedee                                     ; Set machine name
M552 S1                                            ; Enable network
M587 S"wireless" P"ROSXJNUD"                       ; Configure access point. You can delete this line once connected
M586 P0 S1                                         ; Enable HTTP
M586 P1 S0                                         ; Disable FTP
M586 P2 S0                                         ; Disable Telnet

; Drives
M569 P0 S1                                         ; Drive 0 goes forwards
M569 P1 S1                                         ; Drive 1 goes forwards
M569 P2 S1                                         ; Drive 2 goes forwards
M569 P3 S0                                         ; Drive 3 goes forwards
M569 P4 S1                                         ; Drive 4 goes backwards
M350 X16 Y16 Z16 E16:16 I1                         ; Configure microstepping with interpolation
;M92 X80 Y80 Z400 E418.5:837                       ; Set steps per mm
M92 X80 Y80 Z400 E414.8:402.4                        ; Set steps per mm
M566 X600 Y600 Z50 E600:600                        ; Set maximum instantaneous speed changes (mm/min)
M203 X18000 Y18000 Z1800 E3600:3600                ; Set maximum speeds (mm/min)
M201 X15000 Y15000 Z600 E4500:4500                 ; Set accelerations (mm/s^2)
M906 X1600 Y1600 Z1200 E1100:1100 I30              ; Set motor currents (mA) and motor idle factor in per cent
M84 S30                                            ; Set idle timeout

; Axis Limits
M208 X0 Y-15 Z0 S1                                 ; Set axis minima
M208 X300 Y295 Z290 S0                             ; Set axis maxima

; Stall Detection
;M915 X Y S-60 F0 H200 R1

; Endstops
M574 Z1 S2                                         ; Set Z-Probe at low end
M574 X1 Y1 S3                                      ; Set active high endstops

; Z-Probe
M558 P8 F250 T600 I1 R0.5 A3 Z1 A0.09 H3
;M558 P8 F350 T750 I1 R0.4 A5 Z1 A0.05 H7.5        ; Piezo Z probe
G31 P100 X0 Y0 Z-0.1                               ; Set Z probe trigger value, offset and trigger height

M557 X20:280 Y20:280 S52                           ; Define mesh grid

; Heaters
;M305 P0 T100000 B4138 C0 R4700                     ; Set thermistor + ADC parameters for heater 0
M305 P0 T100000 B4725 C7.060000e-8 R4700
M143 H0 S120                 
M305 P1 T100000 B4725 C7.060000e-8 R4700           ; Set thermistor + ADC parameters for heater 1
M143 H1 S285                                       ; Set temperature limit for heater 1 to 280C
M305 P2 T100000 B4725 C7.060000e-8 R4700           ; Set thermistor + ADC parameters for heater 2
M143 H2 S285                                       ; Set temperature limit for heater 2 to 280C

; Fans
M106 P1 S0 I0 F75 H-1 C"PartFan"                          ; Set fan 2 value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P0 S1 I0 F75 H1:2 T45 C"ExtruderFan"                        ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on
M106 P2 S1 I0 F75 H100 T45 C"DuetCooling"                             ; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off

; Tools
M563 P0 D0 H1 S"Nozzle0"                                ; Define tool 0
G10 P0 X0 Y0 Z0                                    ; Set tool 0 axis offsets
G10 P0 R0 S0                                       ; Set initial tool 0 active and standby temperatures to 0C

M563 P1 D1 H2 S"Nozzle1"                                ; Define tool 0
G10 P1 X-20 Y0 Z0                                   ; Set tool 1 axis offsets
;G10 P1 R0 S0                                      ; Set initial tool 0 active and standby temperatures to 0C

; Automatic power saving
M911 S22 R23 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000" ; Set voltage thresholds and actions to run on power loss

; Pressure Advance
M572 D0 S0.02

; Heater 3 LEDs
M307 H3 A-1 C-1 D-1
M42 P3 S0

; Heater 4 Servo
M307 H4 A-1 C-1 D-1
M42 P4 S0

; Filament out
M591 D0 P1 C3 S1

; Load override
M501