; homez.g
; called to home the Z axis
G91                 ; relative positioning
G1 Z7.5 F6000 S2      ; lift Z relative to current position
G90                 ; absolute positioning
G1 X10 Y10 F3600  ; Move to bed
G4 P750             ; pause
G91                 ; relative positioning
G1 S1 Z-305 F420    ; move Z down until the switch triggers z
G90                 ; absolute positioning
G1 Z7.5 F100          ; lift Z relative to current position
G1 X150 Y150 F3600  ; Move to bed
G4 P750             ; pause
G91                 ; relative positioning
G1 S1 Z-305 F420    ; move Z down until the switch triggers z
G90                 ; absolute positioning
G92 Z-0.10               ; set Z position to trigger height for buildtak
G1 Z5 F100          ; lift Z relative to current position