; can't use $ff80 - $ff89 because 
; that's where the DMA routine is
hJoypadState      EQU $FF90  
; see joy_constants.asm
hCurrentROMBank   EQU $FFF8
hNextROMBank      EQU $FFF9
