G91                   		; use relative positioning

;Here I set motor settings before homing, it makes sure they are consistent even if I change settings for my motors for regular printing, it wont break my homing (the settings are corrected at the end of homing)
M203 X8000 Y8000		; Set maximum speeds (mm/min)
M906 X900 Y900			; Set motor currents (mA) and motor idle factor in percent
M201 X200 Y200			; Set accelerations (mm/s^2)
M913 X70 Y70			; drop motor currents to 50%

M915 X Y S4 R0 F0     		; set X and Y to sensitivity 2, do nothing when stall, unfiltered

; Initial homing for X/Y
G1 Z10 F1200 S2         		; lift Z
G4 P100
G1 S1 X-325 Y-325 F3600 	; move right/back 325mm, stopping at the endstop
G4 P100
G1 X5 Y5            		; move away from home
G4 P100

; X or Y is homed at this point, now home the other axis
G1 S1 X-325 F3600      		; move towards axis minimum 
G4 P100
G1 S1 Y-325 F3600      		; move towards axis minimum 
G4 P100
G1 X5 Y5               		; move away from home
G4 P100
M400                  		; make sure everything has stopped before we reset the motor currents
M913 X100 Y100			; motor currents back to 100%

; Home Z
G90                   		; back to absolute positioning
G1 X10 Y10 F3600          	; Move to bed
G4 P500                 	; pause
G91                     	; relative positioning
G1 S1 Z-305 F600        	; move Z down until the switch triggers
G90                     	; absolute positioning
G1 Z7.5 F100              	; lift Z relative to current position
G1 X150 Y150 F3600      	; Move to bed
G4 P500                 	; pause
G91                     	; relative positioning
G1 S1 Z-305 F420        	; move Z down until the switch triggers
G90                     	; absolute positioning
G92 Z0               	; set Z position to trigger height for buildtak
G1 Z5 F100              	; lift Z relative to current position

M913 X100 Y100

M98 P/macros/motorspeeds.g    		;I moved all motor settings from config.g into motorspeeds.g file so that I can set the back to normal after any changes during homing.