M400                  		; make sure everything has stopped before we make changes
;Here I set motor settings before homing, it makes sure they are consistent even if I change settings for my motors for regular printing, it wont break my homing (the settings are corrected at the end of homing)
M203 X8000 			; Set maximum speeds (mm/min)
M906 X900 			; Set motor currents (mA) and motor idle factor in percent
M201 X200 			; Set accelerations (mm/s^2)
M913 X70 			; drop motor currents to 50%
M915 X S5 R0 F0     		; set X to sensitivity 2, do nothing when stall, unfiltered
G91                   		; use relative positioning
G1 Z10 F1200          		; lift Z
G4 P100
G1 S1 X-325 F3600 		; move right/back 325mm, stopping at the endstop
G4 P100
G1 Z-10 X5 F1200          	; lower Z
M400                  		; make sure everything has stopped before we reset the motor currents
M913 X100			; motor currents back to 100%
G90                   		; back to absolute positioning
M98 P/macros/motorspeeds.g     		;I moved all motor settings from config.g into motorspeeds.g file so that I can set the back to normal after any changes during homing.