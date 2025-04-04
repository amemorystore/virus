;......_ .......*
;............................*
;..............................*
;................................*
;..................................*
;.
INCLUDE "macros.asm"
INCLUDE "constants.asm"
INCLUDE "charmap.asm"
;..............................*
;................................*
;..................................*
SECTION "rst 00", ROM0 [$00]
        ret
;..............................*
;................................*
;..................................*
SECTION "rst 08", ROM0 [$08]
        ret
;..............................*
;................................*
;..................................*
SECTION "rst 10", ROM0 [$10]
        ret
;..............................*
;................................*
;..................................*
SECTION "rst 18", ROM0 [$18]
        jp JumpToFuncInTable
;..............................*
;................................*
;..................................*
SECTION "rst 20", ROM0 [$20]
        ret
;..............................*
;................................*
;..................................*
SECTION "rst 28", ROM0 [$28]
        ret
;..............................*
;................................*
;..................................*
SECTION "rst 30", ROM0 [$30]
        ret
;..............................*
;................................*
;..................................*
SECTION "rst 38", ROM0 [$38]
        ret
;..............................*
;................................*
;..................................*
SECTION "VBlank", ROM0 [$40]
        jp VBlankInterruptHandler
;..............................*
;................................*
;..................................*
SECTION "LCDC",ROM0[$48]
        reti
;..............................*
;................................*
;..................................*
SECTION "Timer", ROM0 [$50]
        jp TimerInterruptHandler
;..............................*
;................................*
;..................................*
SECTION "Serial",ROM0[$58]
        jp SerialInterruptHandler
;..............................*
;................................*
;..................................*
SECTION "✓oypad", ROM0 [$60]
        reti
;..............................*
;................................*
;..................................*
SECTION "Entry", ROM0 [$100]
;.
Entry: ; 0x100
	nop
	jp start
;.
;..............................*
;................................*
;..................................*
SECTION "Header", ROM0 [$104]
; empty
	ds $150 - $104
;.
;..............................*
;................................*
;..................................*
;.
SECTION "Main", ROM0 [$150]
;.
;..............................*
;................................*
;..................................*
;.
start: 		; 0x150
        di
        ld sp, $ffff
        xor a
        ld [rLCDC], a ; disable lcd
        ld hl, $c000
        ld bc, $2000 ; clear wram
        call ClearData
        ld hl, vTiles0
        ld bc, $2000 ; clear vram
        call ClearData
        ld hl, $fe00
        ld bc, $a0 ; clear oam (sram)
        call ClearData
        ld hl, $ff80
        ld bc, $7d ; clear hram
        call ClearData
        ld hl, GameGfx
        ld bc, $800
        ld de, vTiles0
        call LoadGfx
        ld a, %11100100
        ld [rBGP], a  ; set bg pal
        ld [rOBP0], a ; set sprite pal 0
        ld [rOBP1], a ; set sprite pal 1
;.
        call ClearOAMBuffer
        call ClearBackground
;.
        ld sp, $dfff ; init stack pointer to end of wram
        call WriteDMACodeToHRAM
;.
        xor a
        ld hl, wCurrentScreen
        ld [hli], a
        ld [hl], a
;.
        ld a, $93
        ld [rLCDC], a   ; enable LCD
        ld a,%00000001  ; enable V-blank interrupt
        ld [rIE], a
        ei
        ld a, MUSIC_GAME
        call PlayMusic
        jp Main
;.
;..............................*
;................................*
;..................................*
;.
JumpToFuncInTable:
        sla a
        pop hl
        push de
        ld e, a
        ld d, $0
        add hl, de
        ld e, [hl]
        inc hl
        ld d, [hl]
        ld l, e
        ld h, d
	pop de
	jp [hl]
;.
;..............................*
;................................*
;..................................*
;.
VBlankInterruptHandler:
        push af
        push bc
        push de
        push hl
        call ReadJoypad
        call DrawCurrentScreen
        call Music2_UpdateMusic
        ld a, 1
        ld [VBlankFlag], a
        pop hl
        pop de
        pop bc
        pop af
        reti
;.
;..............................*
;................................*
;..................................*
;.
DrawCurrentScreen:
        ld a, [wCurrentScreen]
        rst $18
;.
;..............................*
;................................*
;..................................*
;.
DrawScreenFunctions:
        dw DrawTitlescreen
        dw DrawGame
        dw DrawGameOver
;. fallthrough
;..............................*
;................................*
;..................................*
;.
DrawTitlescreen:
        jp $ff80
;.
;..............................*
;................................*
;..................................*
;.
DrawGame:
        call DrawScore
        call DrawPlayerPaddle
        call DrawComputerPaddle
;.          O
        call ClearOAMBuffer
        call DrawViron
        call DrawDrop
        jp $ff80  ; OAM DMA transfer
;.
;..............................*
;................................*
;..................................*
;.
DrawGameOver:
        jp $ff80  ; OAM DMA transfer
;.
;..............................*
;................................*
;..................................*
;.
TimerInterruptHandler:
        reti
;.
;..............................*
;................................*
;..................................*
;.
SerialInterruptHandler:
        reti
;.
;..............................*
;................................*
;..................................*
;.
WriteDMACodeToHRAM: ; 4bed (1:4bed)
        ld c, $80
        ld b, $a
        ld hl, DMARoutine
.copyLoop
        ld a, [hli]
        ld [$ff00+c], a
        inc c
        dec b
        jr nz, .copyLoop
        ret
;.
;..............................*
;................................*
;..................................*
;.
DMARoutine: ; 4bfb (1:4bfb)
        ld a, (wOAMBuffer >> 8)
        ld [$ff00+$46], a   ; start DMA
        ld a, $28
.waitLoop
        dec a
        jr nz, .waitLoop
        ret
;.
;..............................*
;................................*
;..................................*
;.
ClearData:
        dec bc
.clearLoop
        ld [hli], a
        dec bc
        bit 7, b
        jr z, .clearLoop
        ret
;.
;..............................*
;................................*
;..................................*
;.
CopyData:
        ld a, [hli]
        ld [de], a
        inc de
        dec bc
        ld a, b
        or c  ; have we copied all of the data?
        jr nz, CopyData
        ret
;.
;..............................*
;................................*
;..................................*
;.
ClearOAMBuffer:
        xor a
        ld hl, wOAMBuffer
        ld bc, $a0  ; size of OAM buffer
        jp ClearData
;.
;..............................*
;................................*
;..................................*
;.
ClearBackground:
        ld a, 1
        ld hl, vBGMap0
        ld bc,$800  ; size of background memory
        jp ClearData
;.
;..............................*
;................................*
;..................................*
;.
ClearBlood:
        xor a
        ld hl, wLasers
        ld bc, (MAX_DROPS * 2 * 5)
        jp ClearData
;.
;..............................*
;................................*
;..................................*
;.
LoadGfx:
.waitForHBlank
        ld a, [$ff41] ; LCDC status
        and $3
        jr nz, .waitForHBlank
        ld a, [hli]
        ld [de], a
        inc de
        dec bc
        ld a, b
        or c  ; check: was all data copied?
        jr nz, .waitForHBlank
        ret
;.
;..............................*
;................................*
;..................................*
;.
ClearGfx:
.waitForHBlank
        ld a, [$ff41] ; LCDC Status
        and $3
        jr nz, .waitForHBlank
        ld a, d
        ld [hli], a
        dec bc
        ld a, b
        or c
        jr nz, .waitForHBlank
        ret
;.
;..............................*
;................................*
;..................................*
;.
PrintText:
        ld bc, $0000
        push hl
.loop
        ld a, [hli]
        cp "@"
        jr z, .finishedProcessingString
        inc bc
        jr .loop
.finishedProcessingString
        pop hl
        jp LoadGfx
;.
;..............................*
;................................*
;..................................*
;.
ReadJoypad:
        ld a, $20
        ld [rJOYP], a
        ld a, [rJOYP]
        ld a, [rJOYP]
        and $f
        swap a
        ld b, a
        ld a, $30
        ld [rJOYP], a
        ld a, $10
        ld [rJOYP], a
        ld a, [rJOYP]
        ld a, [rJOYP]
        ld a, [rJOYP]
        ld a, [rJOYP]
        ld a, [rJOYP]
        ld a, [rJOYP]
        and $f
        or b
        cpl  ; a has current pressed buttons
        ld [hJoypadState], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
ResetScores:
        xor a
        ld hl, wPlayerScore
        ld [hli], a
        ld [hl], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
InitPlayerPaddle:
        ld hl, wPlayerY
        ld a, $00
        ld [hli], a
        ld a, $17
        ld [hl], a
        ld a, $18
        ld [wPlayerHeight], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
InitPlayerLasers:
        xor a
        ld hl, wPlayerLasers
        ld bc, 5 * MAX_DROPS
        jp ClearData
;.
;..............................*
;................................*
;..................................*
;.
InitComputerPaddle:
        ld hl, wComputerY
        ld a, $00
        ld [hli], a
        ld a, $17
        ld [hl], a
        ld a, $18
        ld [wComputerHeight], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
InitComputerLasers:
        xor a
        ld hl, wComputerLasers
        ld bc, 5 * MAX_DROPS
        jp ClearData
;.
;..............................*
;................................*
;..................................*
;.
DrawScore:
        ld a, [wPlayerScore]
        cp 11 ; 10
        jr c, .oneDigit
        push af
        ld a, $21
        hlCoord 2, 3, vBGMap0
        ld [hl], a
        pop af
        sub 11 ;10
.oneDigit
        add $20  ; base tile id for numbers
        hlCoord 3, 3, vBGMap0
        ld [hl], a
        ld a, [wComputerScore]
        cp 11 ; 10
        jr c, .oneDigit2
        push af
        ld a, $21
        hlCoord 16, 3, vBGMap0
        ld [hl], a
        pop af
        sub 11 ; 10
.oneDigit2
        add $20  ; base tile id for numbers
        hlCoord 17, 3, vBGMap0
        ld [hl], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
DrawPlayerPaddle:
        ld a, [wPlayerY + 1]
        push af
        srl a
        srl a
        srl a  
; divides by 8 for the tile to begin drawing at
        hlCoord 0, 0, vBGMap0
        ld bc, $0020
        ld d, $00  
; count to the current tile row
.addLoop
        ld [hl], $01
        and a
        jr z, .gotHLCoord
        inc d
        add hl, bc  
; move the HL coord down one tile row
        dec a
        jr .addLoop
.gotHLCoord
        pop af  
; reload player paddle y pos
        and $7  
; get the pixel offset in the tile
        jr z, .save8
        push af
        ld e, a
        ld a, 8
        sub e
        ld e, a
        pop af
        jr .drawTile
.save8
        ld e, 8
.drawTile
        add $10  
; a now contains tile id for the top tile
        ld [hl], a  
; draw the top tile
        inc d
        ld a, [wPlayerHeight]
        sub e
.drawMiddleTiles
        add hl, bc
        cp a, 8
        jr c, .drawBottomTile
        sub 8
        ld [hl], $10  
; tile id of paddle tile
        inc d
        jr .drawMiddleTiles
.drawBottomTile
        and a
        jr z, .clearRemainingTiles
        add $18
        ld [hl], a
        inc d
        ld a, d
.clearRemainingTiles
        cp 18 
; number of rows in the display
        jr z, .done
        add hl, bc
        ld [hl], $01  
; blank tile
        inc a
        jr .clearRemainingTiles
.done
        ret
;.
;..............................*
;................................*
;..................................*
;.
DrawDrop:
; loads player and computer laser sprites to OAM buffer
        ld hl, wLasers
        ld de, wLaserSprites        
; OAM buffer destination for laser sprites
        ld b, 1 + (MAX_DROPS * 2)  
; drawing both player and computer lasers
.loop
        dec b
        ret z
        ld a, [hli] 
; check if laser is active
        and a
        jr nz, .activeLaser
; laser is inactive, so, do not draw it
        push bc
        ld bc, $0004
        add hl, bc
; move to next laser struct
        pop bc
        jr .loop
.activeLaser
        inc hl
; skip over the low byte of the y position
        ld a, [hli]  
; y position (high byte)
        add 16 - 4  
; adjust for sprite screen offset (and center the sprite)
        ld [de], a
        inc de
        inc hl  
; skip over low byte of the x position
        ld a, [hli]  
; x position (high byte)
        add 8 - 4  
; adjust for sprite screen offset (and center the sprite)
        ld [de], a
        inc de
        ld a, $2  
; laser tile id
        ld [de], a
        inc de
        ld a, %00000000  
; sprite attributes
        ld [de], a
        inc de
        jr .loop
;.
;..............................*
;................................*
;..................................*
;.
DrawComputerPaddle:
        ld a, [wComputerY + 1]
        push af
        srl a
        srl a
        srl a  
; divides by 8 for the tile to begin drawing at
        hlCoord 019, 0, vBGMap0
        ld bc, $0020
        ld d, $00  
; count to the current tile row
.addLoop
        ld [hl], $01
        and a
        jr z, .gotHLCoord
        inc d
        add hl, bc 
; move the HL coord down one tile row
        dec a
        jr .addLoop
.gotHLCoord
        pop af
; reload player paddle y pos
        and $7
; get the pixel offset in the tile
        jr z, .save8
        push af
        ld e, a
        ld a, 8
        sub e
        ld e, a
        pop af
        jr .drawTile
.save8
        ld e, 8
.drawTile
        add $10
; a now contains tile id for the top tile
        ld [hl], a  
; draw the top tile
        inc d
        ld a, [wComputerHeight]
        sub e
.drawMiddleTiles
        add hl, bc
        cp a, 8
        jr c, .drawBottomTile
        sub 8
        ld [hl], $10
; tile id of paddle tile
        inc d
        jr .drawMiddleTiles
.drawBottomTile
        and a
        jr z, .clearRemainingTiles
        add $18
        ld [hl], a
        inc d
        ld a, d
.clearRemainingTiles
        cp 18 
; number of rows in the display
        jr z, .done
        add hl, bc
        ld [hl], $01
; blank tile
        inc a
        jr .clearRemainingTiles
.done
        ret

InitBall:
        ld hl, wBallY
        xor a
        ld [hli], a
        ld a, BASE_BALL_Y_POSITION
        ld [hli], a
        xor a
        ld [hli], a
        ld a, BASE_BALL_X_POSITION
        ld [hli], a
        ld a, (BASE_BALL_Y_SPEED & $ff)
        ld [hli], a
        ld a, (BASE_BALL_Y_SPEED >> 8)
        ld [hli], a
        ld a, (BASE_BALL_X_SPEED & $ff)
        ld [hli], a
        ld a, (BASE_BALL_X_SPEED >> 8)
        ld [hl], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
PlayerScorePoint:
        ld a, [wPlayerScore]
        inc a
        ld [wPlayerScore], a
        ld a, START_PLAY_TIME
        ld [wStartPlayTimer], a
        call InitPlayerPaddle
        call InitComputerPaddle
        call InitBall
        ld hl, wBallY
        xor a
        ld [hli], a
        ld a, BASE_BALL_Y_POSITION
        ld [hli], a
        xor a
        ld [hli], a
        ld a, BASE_BALL_X_POSITION
        ld [hli], a
        ld a, (BASE_BALL_Y_SPEED & $ff)
        ld [hli], a
        ld a, (BASE_BALL_Y_SPEED >> 8)
        ld [hli], a
        ld a, (BASE_BALL_X_SPEED_NEGATIVE & $ff)
        ld [hli], a
        ld a, (BASE_BALL_X_SPEED_NEGATIVE >> 8)
        ld [hl], a
        call ClearBlood
        call CheckForGameFinished
        ret
;.
;..............................*
;................................*
;..................................*
;.
ComputerScorePoint:
        ld a, [wComputerScore]
        inc a
        ld [wComputerScore], a
        ld a, START_PLAY_TIME
        ld [wStartPlayTimer], a
        call InitPlayerPaddle
        call InitComputerPaddle
        call InitBall
        ld hl, wBallY
        xor a
        ld [hli], a
        ld a, BASE_BALL_Y_POSITION
        ld [hli], a
        xor a
        ld [hli], a
        ld a, BASE_BALL_X_POSITION
        ld [hli], a
        ld a, (BASE_BALL_Y_SPEED & $ff)
        ld [hli], a
        ld a, (BASE_BALL_Y_SPEED >> 8)
        ld [hli], a
        ld a, (BASE_BALL_X_SPEED & $ff)
        ld [hli], a
        ld a, (BASE_BALL_X_SPEED >> 8)
        ld [hl], a
        call ClearBlood
        call CheckForGameFinished
        ret
;.
;..............................*
;................................*
;..................................*
;.
CheckForGameFinished:
        ld a, [wComputerScore]
        cp POINTS_TO_WIN
        jr c, .checkPlayer
        ld a, 2  ; computer won
        ld [wWinner], a
        xor a
        ld [wScreenState], a
        ld a, SCREEN_GAME_OVER
        ld [wCurrentScreen], a
        ret
.checkPlayer
        ld a, [wPlayerScore]
        cp POINTS_TO_WIN
        ret c
        ld a, 1
        ld [wWinner], a
        xor a
        ld [wScreenState], a
        ld a, SCREEN_GAME_OVER
        ld [wCurrentScreen], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
DrawViron:
        ld hl, wBallSprite
        ld a, [wBallY + 1]
        add 16 - 4
        ld [hli], a
        ld a, [wBallX + 1]
        add 8 - 4
        ld [hli], a
        ld a, $0
        ld [hli], a
        ld a, %00000000
        ld [hl], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
MoveBall:
        call UpdateBallYPosition
        call UpdateBallXPosition
        ret
;.
;..............................*
;................................*
;..................................*
;.
UpdateBallYPosition:
        ld a, [wBallY]
        ld l, a
        ld a, [wBallY + 1]
        ld h, a
        ld a, [wBallYSpeed]
        ld c, a
        ld a, [wBallYSpeed + 1]
        ld b, a
        cp $80
        jr c, .movingDown
        add hl, bc
        ld a, h
        cp 220
        jr c, .saveYPosition
        call InvertBC
        ld a, c
        ld [wBallYSpeed], a
        ld a, b
        ld [wBallYSpeed + 1], a
        ld hl, $0000
        jr .saveYPosition
.movingDown
        add hl, bc
        ld a, h
        cp 144
        jr c, .saveYPosition
        call InvertBC
        ; bc now contains inverted y speed
        ld a, c
        ld [wBallYSpeed], a
        ld a, b
        ld [wBallYSpeed + 1], a
        ld h, 144
        ld l, 0
.saveYPosition
        ld a, l
        ld [wBallY], a
        ld a, h
        ld [wBallY + 1], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
UpdateBallXPosition:
        ld a, [wBallX]
        ld l, a
        ld a, [wBallX + 1]
        ld h, a  ; hl contains virus x position
        ld a, [wBallXSpeed]
        ld c, a
        ld a, [wBallXSpeed + 1]
        ld b, a  ; bc contains virus x speed
        cp $80
        jr c, .movingRight
        add hl, bc
        ld a, h
        cp 220
        jr c, .notTouchingLeftWall
        call ComputerScorePoint
        ret
.notTouchingLeftWall
        ld a, h
        sub 4
        cp 4
        jp c, .saveXPosition
        cp 8
        jp nc, .saveXPosition
        ld a, [wBallY + 1]
        ld e, a
        ld a, [wPlayerY + 1]
        cp e
        jp nc, .saveXPosition
        ld d, a
        ld a, [wPlayerHeight]
        add d
        cp e
        jp c, .saveXPosition
        ld bc, BASE_BALL_X_SPEED
        ld a, c
        ld [wBallXSpeed], a
        ld a, b
        ld [wBallXSpeed + 1], a
        ld a, [wBallY + 1]
        ld b, a
        ld a, [wPlayerY + 1]
        ld c, a
        ld a, [wPlayerHeight]
        srl a
        add c
        cp b
        jr c, .bottomOfPlayerPaddle
        ld a, [wBallYSpeed + 1]
        cp $80
        jr c, .decreaseBallYSpeed
        jr .increaseBallYSpeed
.bottomOfPlayerPaddle
        ld a, [wBallYSpeed + 1]
        cp $80
        jr c, .increaseBallYSpeed
        jr .decreaseBallYSpeed
.increaseBallYSpeed
        call IncreaseBallYSpeed
        jr .doneChangingYSpeed
.decreaseBallYSpeed
        call DecreaseBallYSpeed
.doneChangingYSpeed
        ld hl, $0c00
        jr .saveXPosition
.movingRight
        add hl, bc
        ld a, h
        cp 160
        jr c, .notTouchingRightWall
        call PlayerScorePoint
        ret
.notTouchingRightWall
        ld a, h
        add 4
        cp 152
        jr c, .saveXPosition
        cp 156
        jr nc, .saveXPosition
        ld a, [wBallY + 1]
        ld e, a
        ld a, [wComputerY + 1]
        cp e
        jr nc, .saveXPosition
        ld d, a
        ld a, [wComputerHeight]
        add d
        cp e
        jr c, .saveXPosition
        ld bc, BASE_BALL_X_SPEED_NEGATIVE
        ld a, c
        ld [wBallXSpeed], a
        ld a, b
        ld [wBallXSpeed + 1], a
        ld a, [wBallY + 1]
        ld b, a
        ld a, [wComputerY + 1]
        ld c, a
        ld a, [wComputerHeight]
        srl a
        add c
        cp b
        jr c, .bottomOfComputerPaddle
        ld a, [wBallYSpeed + 1]
        cp $80
        jr c, .decreaseBallYSpeed2
        jr .increaseBallYSpeed2
.bottomOfComputerPaddle
        ld a, [wBallYSpeed + 1]
        cp $80
        jr c, .increaseBallYSpeed2
        jr .decreaseBallYSpeed2
.increaseBallYSpeed2
        call IncreaseBallYSpeed
        jr .doneChangingYSpeed2
.decreaseBallYSpeed2
        call DecreaseBallYSpeed
.doneChangingYSpeed2
        ld hl, $9400
.saveXPosition
        ld a, l
        ld [wBallX], a
        ld a, h
        ld [wBallX + 1], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
InvertBC:
        ld a, b
        cpl
        ld b, a
        ld a, c
        cpl
        ld c, a
        inc c
        ret nz
        inc b
        ret
;.
;..............................*
;................................*
;..................................*
;.
MoveLasers:
        call MovePlayerLasers
        jp MoveComputerLasers
;.
;..............................*
;................................*
;..................................*
;.
MovePlayerLasers:
        ld hl, wPlayerLasers
        ld b, MAX_DROPS + 1
.loop
        dec b
        ret z
        ld a, [hli]
        and a
        jr nz, .activeLaser
        inc hl
        inc hl
        inc hl
        inc hl
        jr .loop
.activeLaser
        inc hl
        inc hl
        push hl
        ld a, [hli]
        ld e, a
        ld a, [hl]
        ld d, a
        ld hl, BASE_LASER_SPEED_RIGHT
        add hl, de
        ld d, h
        ld e, l
        pop hl
        ld a, e
        ld [hli], a
        ld a, d
        ld [hli], a
        jr .loop
;.
;..............................*
;................................*
;..................................*
;.
MoveComputerLasers:
        ld hl, wComputerLasers
        ld b, MAX_DROPS + 1
.loop
        dec b
        ret z
        ld a, [hli]
        and a
        jr nz, .activeLaser
        inc hl
        inc hl
        inc hl
        inc hl
        jr .loop
.activeLaser
        inc hl
        inc hl
        push hl
        ld a, [hli]
        ld e, a
        ld a, [hl]
        ld d, a
        ld hl, BASE_LASER_SPEED_LEFT
        add hl, de
        ld d, h
        ld e, l
        pop hl
        ld a, e
        ld [hli], a
        ld a, d
        ld [hli], a
        jr .loop
;.
;..............................*
;................................*
;..................................*
;.
ShootLasers:
        call ShootPlayerLasers
        call ShootComputerLasers
        ret
;.
;..............................*
;................................*
;..................................*
;.
ShootPlayerLasers:
        ld a, [hJoypadState]
        bit BIT_A_BUTTON, a
        jr z, .done
        ld a, [wPlayerLaserCooldown]
        and a
        jr nz, .done
        ld hl, wPlayerLasers
        ld b, MAX_DROPS + 1
.loop
        dec b
        jr z, .done
        ld a, [hl]
        and a
        jr z, .foundInactiveLaser
        inc hl
        inc hl
        inc hl
        inc hl
        inc hl
        jr .loop
.foundInactiveLaser
        ld a, 1
        ld [hli], a
        xor a
        ld [hli], a
        ld a, [wPlayerY + 1]
        ld c, a
        ld a, [wPlayerHeight]
        srl a
        add c
        ld [hli], a
        xor a
        ld [hli], a
        ld a, $a
        ld [hli], a
        ld a, LASER_COOLDOWN
        ld [wPlayerLaserCooldown], a
        ret
.done
        ld a, [wPlayerLaserCooldown]
        and a
        ret z
        dec a
        ld [wPlayerLaserCooldown], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
ShootComputerLasers:
        ld a, [wComputerLaserCooldown]
        and a
        jr nz, .done
        ld hl, wComputerLasers
        ld b, MAX_DROPS + 1
.loop
        dec b
        jr z, .done
        ld a, [hl]
        and a
        jr z, .foundInactiveLaser
        inc hl
        inc hl
        inc hl
        inc hl
        inc hl
        jr .loop
.foundInactiveLaser
        ld a, 1
        ld [hli], a
        xor a
        ld [hli], a
        ld a, [wComputerY + 1]
        ld c, a
        ld a, [wComputerHeight]
        srl a
        add c
        ld [hli], a
        xor a
        ld [hli], a
        ld a, $96
        ld [hli], a
        ld a, LASER_COOLDOWN
        ld [wComputerLaserCooldown], a
        ret
.done
        ; Decrement the cooldown counter
        ld a, [wComputerLaserCooldown]
        and a
        ret z
        dec a
        ld [wComputerLaserCooldown], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
HandleLaserCollisions:
        call HandlePlayerLaserCollisions
        call HandleComputerLaserCollisions
        jp HandleLaserPairCollisions
;.
;..............................*
;................................*
;..................................*
;.
HandlePlayerLaserCollisions:
        ld hl, wPlayerLasers
        ld b, MAX_DROPS + 1
.loop
        dec b
        ret z
        ld a, [hli]
        and a
        jr nz, .activeLaser
        inc hl
        inc hl
        inc hl
        inc hl
        jr .loop
.activeLaser
        push hl
        ld a, [wBallXSpeed + 1]
        cp $80
        jr c, .checkForWall
        inc hl
        ld a, [hl]
        ld c, a
        ld a, [wBallY + 1]
        cp c
        jr c, .laserYIsGreater
        sub c
        jr .gotYDifference
.laserYIsGreater
        ld d, a
        ld a, c
        sub d
.gotYDifference
        cp 7
        jr nc, .checkForWall
        inc hl
        inc hl
        ld a, [hl]
        ld c, a
        ld a, [wBallX + 1]
        cp c
        jr c, .laserXIsGreater
        sub c
        jr .gotXDifference
.laserXIsGreater
        ld d, a
        ld a, c
        sub d
.gotXDifference
        cp 7
        jr nc, .checkForWall
        pop hl
        dec hl
        xor a
        ld [hl], a
        inc hl
        inc hl
        inc hl
        inc hl
        inc hl
        call IncreaseBallYSpeed
        call IncreaseBallXSpeed
        call FlipBallDirection
        jr .loop
.checkForWall
        pop hl
        inc hl
        inc hl
        inc hl
        ld a, [hl]
        cp 164
        jr c, .checkForPaddle
        push hl
        dec hl
        dec hl
        dec hl
        dec hl
        xor a
        ld [hl], a
        pop hl
        inc hl
        jr .loop
.checkForPaddle
        cp 156
        jr nc, .continue
        cp 152
        jr c, .continue
        dec hl
        dec hl
        ld a, [hl]
        ld c, a
        ld a, [wComputerY + 1]
        cp c
        inc hl
        inc hl
        jr nc, .continue
        ld d, a
        ld a, [wComputerHeight]
        add d
        cp c
        jr c, .continue
        push hl
        dec hl
        dec hl
        dec hl
        dec hl
        xor a
        ld [hli], a
        call LaserHitComputerPaddle
        pop hl
.continue
        inc hl
        jp .loop
;.
;..............................*
;................................*
;..................................*
;.
LaserHitComputerPaddle:
        ld a, [wComputerY + 1]
        ld b, a
        ld a, [wComputerHeight]
        sub 4
        inc b
        inc b
        cp MIN_PADDLE_HEIGHT
        jr nc, .done
        dec b
        dec b
        ld a, MIN_PADDLE_HEIGHT
.done
        ld [wComputerHeight], a
        ld a, b
        ld [wComputerY + 1], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
HandleComputerLaserCollisions:
        ld hl, wComputerLasers
        ld b, MAX_DROPS + 1
.loop
        dec b
        ret z
        ld a, [hli]
        and a
        jr nz, .activeLaser
        inc hl
        inc hl
        inc hl
        inc hl
        jr .loop
.activeLaser
        push hl
        ld a, [wBallXSpeed + 1]
        cp $80
        jr nc, .checkForWall
        inc hl
        ld a, [hl]
        ld c, a
        ld a, [wBallY + 1]
        cp c
        jr c, .laserYIsGreater
        sub c
        jr .gotYDifference
.laserYIsGreater
        ld d, a
        ld a, c
        sub d
.gotYDifference
        cp 7
        jr nc, .checkForWall
        inc hl
        inc hl
        ld a, [hl]
        ld c, a
        ld a, [wBallX + 1]
        cp c
        jr c, .laserXIsGreater
        sub c
        jr .gotXDifference
.laserXIsGreater
        ld d, a
        ld a, c
        sub d
.gotXDifference
        cp 7  ; TODO: make this a constant
        jr nc, .checkForWall
        pop hl
        dec hl
        xor a
        ld [hl], a
        inc hl
        inc hl
        inc hl
        inc hl
        inc hl
        call IncreaseBallYSpeed
        call IncreaseBallXSpeed
        call FlipBallDirection
        jr .loop
.checkForWall
        pop hl
        inc hl
        inc hl
        inc hl
        ld a, [hl]
        cp 252
        jr c, .checkForPaddle
        push hl
        dec hl
        dec hl
        dec hl
        dec hl
        xor a
        ld [hl], a
        pop hl
        inc hl
        jr .loop
.checkForPaddle
        ; a contains x position
        cp 4
        jr c, .continue
        cp 8
        jr nc, .continue
        dec hl
        dec hl
        ld a, [hl]
        ld c, a
        ld a, [wPlayerY + 1]
        cp c
        inc hl
        inc hl
        jr nc, .continue
        ld d, a
        ld a, [wPlayerHeight]
        add d
        cp c
        jr c, .continue
        push hl
        dec hl
        dec hl
        dec hl
        dec hl
        xor a
        ld [hli], a
        call LaserHitPlayerPaddle
        pop hl
.continue
        inc hl
        jp .loop

LaserHitPlayerPaddle:
        ld a, [wPlayerY + 1]
        ld b, a
        ld a, [wPlayerHeight]
        sub 4
        inc b
        inc b
        cp MIN_PADDLE_HEIGHT
        jr nc, .done
        dec b
        dec b
        ld a, MIN_PADDLE_HEIGHT
.done
        ld [wPlayerHeight], a
        ld a, b
        ld [wPlayerY + 1], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
FlipBallDirection:
        ld a, [wBallXSpeed]
        ld c, a
        ld a, [wBallXSpeed + 1]
        ld b, a
        call InvertBC
        ld a, c
        ld [wBallXSpeed], a
        ld a, b
        ld [wBallXSpeed + 1], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
DecreaseBallYSpeed:
        ld a, [wBallYSpeed]
        ld c, a
        ld a, [wBallYSpeed + 1]
        ld b, a
        cp $80
        jr c, .movingDown
        ld a, c
        add BALL_Y_SPEED_DELTA
        jr nc, .noCarry
        inc b
.noCarry
        ld c, a
        ; bc is new speed
        ld a, b
        jr .saveSpeed
.movingDown
        ld a, c
        sub BALL_Y_SPEED_DELTA
        jr nc, .noCarry2
        dec b
.noCarry2
        ld c, a
.saveSpeed
        ; bc is new speed
        ld a, c
        ld [wBallYSpeed], a
        ld a, b
        ld [wBallYSpeed + 1], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
IncreaseBallYSpeed:
        ld a, [wBallYSpeed]
        ld c, a
        ld a, [wBallYSpeed + 1]
        ld b, a
        cp $80
        jr c, .movingDown
        ld a, c
        sub BALL_Y_SPEED_DELTA
        jr nc, .noCarry
        dec b
.noCarry
        ld c, a
        ld a, b
        cp MIN_Y_SPEED
        jr nc, .saveSpeed
        ld b, MIN_Y_SPEED
        ld c, 0
        jr .saveSpeed
.movingDown
        ld a, c
        add BALL_Y_SPEED_DELTA
        jr nc, .noCarry2
        inc b
.noCarry2
        ld c, a
        ld a, b
        cp MAX_Y_SPEED
        jr c, .saveSpeed
        ld b, MAX_Y_SPEED
        ld c, 0
.saveSpeed
        ld a, c
        ld [wBallYSpeed], a
        ld a, b
        ld [wBallYSpeed + 1], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
IncreaseBallXSpeed:
        ld a, [wBallXSpeed]
        ld c, a
        ld a, [wBallXSpeed + 1]
        ld b, a
        cp $80
        jr c, .movingRight
        ; Ball is moving left
        ld a, c
        sub BALL_X_SPEED_DELTA
        jr nc, .noCarry
        dec b
.noCarry
        ld c, a
        ; bc is new x speed
        ld a, b
        cp MIN_X_SPEED
        jr nc, .saveSpeed
        ld b, MIN_X_SPEED
        ld c, 0
        jr .saveSpeed
.movingRight
        ; ball is moving right
        ld a, c
        add BALL_X_SPEED_DELTA
        jr nc, .noCarry2
        inc b
.noCarry2
        ld c, a
        ld a, b
        cp MAX_X_SPEED
        jr c, .saveSpeed
        ld b, MAX_X_SPEED
        ld c, 0
.saveSpeed
        ld a, c
        ld [wBallXSpeed], a
        ld a, b
        ld [wBallXSpeed + 1], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
HandleLaserPairCollisions:
        ld hl, wPlayerLasers
        ld a, MAX_DROPS
        ld [wScratch], a
.loopPlayerLasers
        ld a, [wScratch]
        dec a
        cp $ff  ; check for underflow
        ret z
        ld [wScratch], a
        ld a, [hl]
        and a
        jr nz, .checkComputerLasers
        ld bc, 5
        add hl, bc
        jr .loopPlayerLasers
.checkComputerLasers
        ld de, wComputerLasers
        ld a, MAX_DROPS
        ld [wScratch2], a
        push hl
.loopComputerLasers
        ld a, [wScratch2]
        dec a
        cp $ff
        ld [wScratch2], a
        jr nz, .checkEnabled
        pop hl
        ld bc, 5
        add hl, bc
        jr .loopPlayerLasers
.checkEnabled
        ld a, [de]
        and a
        jr nz, .computerLaserEnabled
        inc de
        inc de
        inc de
        inc de
        inc de
        jr .loopComputerLasers
.computerLaserEnabled
        inc hl
        inc hl
        inc de
        inc de
        ld a, [de]
        ld b, a
        ld a, [hl]
        cp b
        jr c, .playerIsLess
        sub b
        jr .gotYDifference
.playerIsLess
        ld c, a
        ld a, b
        sub c
.gotYDifference
        cp 5
        jr c, .checkForXDifference
        dec hl
        dec hl
        inc de
        inc de
        inc de
        jr .loopComputerLasers
.checkForXDifference
        inc hl
        inc hl
        inc de
        inc de
        ld a, [hl]
        ld b, a
        ld a, [de]
        sub b
        cp 5
        jr c, .lasersColliding
        dec hl
        dec hl
        dec hl
        dec hl
        inc de
        jr .loopComputerLasers
.lasersColliding
        pop hl
        dec de
        dec de
        dec de
        dec de
        xor a
        ld [hl], a
        ld [de], a
        ld bc, 5
        add hl, bc
        jr .loopPlayerLasers
;.
;..............................*
;................................*
;..................................*
;.
WaitForNextFrame:
        ld hl, VBlankFlag
        xor a
        ld [hl], a
.wait
        ld a, [hl]
        and a
        jr z, .wait
        ret
;.
;..............................*
;................................*
;..................................*
;.
Main:
        call RunCurrentScreen
        jr Main
;.
;..............................*
;................................*
;..................................*
;.
RunCurrentScreen:
        ld a, [wCurrentScreen]
        rst $18 ; call a funtion from below
;.
;..............................*
;................................*
;..................................*
;.
ScreenFunctions:
        dw RunTitlescreen	; SCREEN_TITLESCREEN
        dw RunGame		; SCREEN_GAME
        dw RunGameOver		; SCREEN_GAME_OVER
;.
;..............................*
;................................*
;..................................*
;.
RunTitlescreen:
        ld a, [wScreenState]
        rst $18
;.
;..............................*
;................................*
;..................................*
;.
TitlescreenFunctions:
        dw LoadTitlescreenGraphics
        dw MainTitlescreen
;.
;..............................*
;................................*
;..................................*
;.
LoadTitlescreenGraphics:
        ld d, 1
        ld hl, vBGMap0
        ld bc, $400
        call ClearGfx
        call ClearOAMBuffer
        hlCoord 2, 1, vBGMap0
        ld d, h
        ld e, l
        ld hl, TitlescreenMainTextA
        call PrintText
	hlCoord 2, 2, vBGMap0
        ld d, h
        ld e, l
        ld hl, TitlescreenMainTextB
        call PrintText
        hlCoord 2, 3, vBGMap0
        ld d, h
        ld e, l
	ld hl, TitlescreenMainTextC
        call PrintText
        hlCoord 2, 4, vBGMap0
        ld d, h
        ld e, l
	ld hl, TitlescreenMainTextD
        call PrintText
        hlCoord 2, 5, vBGMap0
        ld d, h
        ld e, l
	ld hl, TitlescreenMainTextE
        call PrintText
        hlCoord 2, 6, vBGMap0
        ld d, h
        ld e, l
	ld hl, TitlescreenMainTextF
        call PrintText
	hlCoord 2, 7, vBGMap0
        ld d, h
        ld e, l
	ld hl, TitlescreenMainTextG
        call PrintText
	hlCoord 2, 8, vBGMap0
        ld d, h
        ld e, l
	ld hl, TitlescreenMainTextH
        call PrintText
	hlCoord 2, 9, vBGMap0
        ld d, h
        ld e, l
	ld hl, TitlescreenMainTextI
        call PrintText
	hlCoord 2, 10, vBGMap0
        ld d, h
        ld e, l
	ld hl, TitlescreenMainTextJ
        call PrintText
	hlCoord 2, 11, vBGMap0
        ld d, h
        ld e, l
	ld hl, TitlescreenMainTextK
        call PrintText
	hlCoord 2, 12, vBGMap0
        ld d, h
        ld e, l
	ld hl, TitlescreenMainTextL
        call PrintText
	hlCoord 2, 13, vBGMap0
        ld d, h
        ld e, l
	ld hl, TitlescreenMainTextM
        call PrintText
	hlCoord 2, 14, vBGMap0
        ld d, h
        ld e, l
	ld hl, TitlescreenMainTextN
        call PrintText
	hlCoord 2, 15, vBGMap0
        ld d, h
        ld e, l
	ld hl, TitlescreenMainTextO
        call PrintText
	hlCoord 2, 16, vBGMap0
        ld d, h
        ld e, l
	ld hl, TitlescreenMainTextP
        call PrintText
	hlCoord 3, 0, vBGMap0
        ld d, h
        ld e, l
	ld hl, TitlescreenTopRow
        call PrintText
	hlCoord 3, 17, vBGMap0
        ld d, h
        ld e, l
	ld hl, TitlescreenBottomRow
        call PrintText
        ld a, 1
        ld [wScreenState], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
; ferrror rochjert
TitlescreenMainTextA:
	db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,"@"
TitlescreenMainTextB:
	db $08, $01, $01, $01, "nrrrrrro", $01, $01, $01, $08, "@"
TitlescreenMainTextC:
	db $08, $01, $01, "nrrrrrrrro", $01, $01, $08, "@"
TitlescreenMainTextD:
	db $08, $01, "nrrrrrrrrrro", $01, $08, "@"
TitlescreenMainTextE:
	db $08, "nrrrrrrrrrrrro", $08, "@"
TitlescreenMainTextF:
	db $08, "rrrrrrrrrrlrrr", $08, "@"
TitlescreenMainTextG:
	db $08, "rrrrrrrrrrrrrr", $08, "@"
TitlescreenMainTextH:
	db $08, "rrrrrrrrrrrrrr", $08, "@"
TitlescreenMainTextI:
	db $08, "rrrrrrrrrrrrrr", $08, "@"
TitlescreenMainTextJ:
	db $08, "rrrrrrrrrrrrrr", $08, "@"
TitlescreenMainTextK:
	db $08, "rrrrrrrrrrrrrr", $08, "@"
TitlescreenMainTextL:
	db $08, "prrrrrrrrrrrrq", $08, "@"
TitlescreenMainTextM:
	db $08, $01, "prrrrrrrrrrq", $01, $08, "@"
TitlescreenMainTextN:
	db $08, $01, $01, "prrrrrrrrq", $01, $01, $08, "@"
TitlescreenMainTextO:
	db $08, $01, $01, $01, "prrrrrrq", $01, $01, $01, $08, "@"
TitlescreenMainTextP:
	db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,"@"
TitlescreenTopRow: ; top row
	db "game", "@"
TitlescreenBottomRow: ; bottom row
	db "virus", "@"
;.
;..............................*
;................................*
;..................................*
;.
AuthorText:
        db "game@"
;.
;..............................*
;................................*
;..................................*
;.
MainTitlescreen:
        ld a, [hJoypadState]
        bit BIT_A_BUTTON, a
        jr nz, .exitTitlescreen
        bit BIT_START, a
        jr z, .stayOnTitlescreen
.exitTitlescreen
        xor a
        ld [wScreenState], a
        ld a, SCREEN_GAME
        ld [wCurrentScreen], a
        ret
.stayOnTitlescreen
        jr MainTitlescreen
;.
;..............................*
;................................*
;..................................*
;.
RunGame:
        ld a, [wScreenState]
        rst $18
;.
;..............................*
;................................*
;..................................*
;.
GameFunctions:
        dw InitGame
        dw GameLoop
;.
;..............................*
;................................*
;..................................*
;.
InitGame:
        call ResetScores
        call InitPlayerPaddle
        call InitPlayerLasers
        call InitComputerPaddle
        call InitComputerLasers
        call InitBall
        ld a, START_PLAY_TIME
        ld [wStartPlayTimer], a
        ld d, 1
        ld hl, vBGMap0
        ld bc, $400
        call ClearGfx
        ld a, 1
        ld [wScreenState], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
GameLoop:
        call WaitForNextFrame
        call MovePlayerPaddle
        call MoveComputerPaddle
        ld a, [wStartPlayTimer]
        and a
        jr z, .currentlyPlaying
        dec a
        ld [wStartPlayTimer], a
        ret
.currentlyPlaying
        call ShootLasers
        call MoveLasers
        call MoveBall
        call HandleLaserCollisions
        ret
;.
;..............................*
;................................*
;..................................*
;.
MovePlayerPaddle:
        ld a, [hJoypadState]
        bit BIT_D_UP, a
        jr nz, .pressingUp
        bit BIT_D_DOWN, a
        ret z
        ; pressing Down
        ld a, [wPlayerY]
        ld l, a
        ld a, [wPlayerY + 1]
        ld h, a
        ld bc, BASE_PADDLE_DOWN_SPEED
        add hl, bc
        push hl
        ld a, [wPlayerHeight]
        add h
        cp 144 + 1
        pop hl
        jr c, .savePosition
        sub h
        ld b, a  ; Save paddle height into b
        ld a, 144
        sub b
        ld h, a
        ld l, 0
        jr .savePosition
.pressingUp
        ld a, [wPlayerY]
        ld l, a
        ld a, [wPlayerY + 1]
        ld h, a
        ld bc, BASE_PADDLE_UP_SPEED
        add hl, bc
        ld a, h
        cp 220
        jr c, .savePosition
        ld hl, $0000
.savePosition
        ld a, l
        ld [wPlayerY], a
        ld a, h
        ld [wPlayerY + 1], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
MoveComputerPaddle:
        ld a, [wBallXSpeed + 1]
        cp $80
        jr c, .movingTowardsComputer
        ld a, [wComputerY + 1]
        ld b, a
        ld a, [wComputerHeight]
        srl a
        add b
        cp $48
        jr c, .aboveHalf
        sub $48
        jr .gotDiff
.aboveHalf
        ld b, a
        ld a, $48
        sub b
.gotDiff
        cp $4
        ret c
        ld a, [wComputerY + 1]
        ld b, a
        ld a, [wComputerHeight]
        srl a
        add b
        cp $48
        jr c, .upperHalf
.moveUp
        ld a, [wComputerY]
        ld l, a
        ld a, [wComputerY + 1]
        ld h, a
        ld bc, BASE_PADDLE_UP_SPEED
        add hl, bc
        ld a, h
        cp 220
        jr c, .noUnderflow
        xor a
        ld h, a
        ld l, a
.noUnderflow
        ld a, l
        ld [wComputerY], a
        ld a, h
        ld [wComputerY + 1], a
        ret
.upperHalf
.moveDown
        ld a, [wComputerY]
        ld l, a
        ld a, [wComputerY + 1]
        ld h, a
        ld bc, BASE_PADDLE_DOWN_SPEED
        add hl, bc
        ld a, [wPlayerHeight]
        add h
        cp 144 + 1
        jr c, .noOverflow
        sub h
        ld b, a
        ld a, 144
        sub b
        ld h, a
        ld l, 0
.noOverflow
        ld a, l
        ld [wComputerY], a
        ld a, h
        ld [wComputerY + 1], a
        ret
.movingTowardsComputer
        ld a, [wComputerY + 1]
        ld b, a
        ld a, [wComputerHeight]
        srl a
        add b
        ld b, a
        ld a, [wBallY + 1]
        cp b
        jr c, .moveUp
        jr .moveDown
;.
;..............................*
;................................*
;..................................*
;.
RunGameOver:
        ld d, 1
        ld hl, vBGMap0
        ld bc, $400
        call ClearGfx
        call ClearOAMBuffer
        ld a, [wWinner]
        cp 2
        jr z, .computerWon
	; ***********************************************
; .fallthrough
        hlCoord 3, 8, vBGMap0
        ld d, h
        ld e, l
        ld hl, PlayerWonText
        call PrintText
        hlCoord 3, 10, vBGMap0
        ld d, h
        ld e, l
        ld hl, PlayerWonText2
        call PrintText
	hlCoord 3, 12, vBGMap0
        ld d, h
        ld e, l
        ld hl, PlayerWonText3
        call PrintText
	hlCoord 3, 14, vBGMap0
        ld d, h
        ld e, l
        ld hl, PlayerWonText4
        call PrintText
        jr .loadedGraphics
        ; ***********************************************
.computerWon
        hlCoord 3, 8, vBGMap0
        ld d, h
        ld e, l
        ld hl, ComputerWonText
        call PrintText
 	hlCoord 3, 9, vBGMap0
        ld d, h
        ld e, l
        ld hl, ComputerWonText
        call PrintText
        hlCoord 3, 10, vBGMap0
        ld d, h
        ld e, l
        ld hl, ComputerWonText2
        call PrintText
	hlCoord 3, 11, vBGMap0
        ld d, h
        ld e, l
        ld hl, ComputerWonText
        call PrintText
	hlCoord 3, 12, vBGMap0
        ld d, h
        ld e, l
        ld hl, ComputerWonText3
        call PrintText
	hlCoord 3, 13, vBGMap0
        ld d, h
        ld e, l
        ld hl, ComputerWonText
        call PrintText
	hlCoord 3, 14, vBGMap0
        ld d, h
        ld e, l
        ld hl, ComputerWonText4
        call PrintText
        ; ***********************************************
.loadedGraphics
        ld b, 240  ; 240 frames
.waitLoop
        call WaitForNextFrame
        dec b
        jr nz, .waitLoop
        xor a
        ld [wScreenState], a
        ld a, SCREEN_TITLESCREEN
        ld [wCurrentScreen], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
PlayerWonText:
        db "..............@"

PlayerWonText2:
        db "..............@"
	
PlayerWonText3:
        db "..............@"
	
PlayerWonText4:
        db "..............@"
;.
;..............................*
;................................*
;..................................*
;.
ComputerWonText:
        db "..............@"

ComputerWonText2:
        db "..............@"

ComputerWonText3:
        db "..............@"
	
ComputerWonText4: ; ,
        db "..............@"
;.
;..............................*
;................................*
;..................................*
;.
GameGfx:
        INCBIN "gfx/game.2bpp"
;.
;..............................*
;................................*
;..................................*
;.
SECTION "Bank 1",ROMX,BANK[$1] ; music engine
;.
SFX_Headers_02:
        db $ff, $ff, $ff ; padding
;.
SFX_02_01: ; 8003 (2:4003)
        db CH7
        dw SFX_02_01_Ch1
;.
SFX_02_02: ; 8006 (2:4006)
        db CH7
        dw SFX_02_02_Ch1
;.
SFX_02_03: ; 8009 (2:4009)
        db CH7
        dw SFX_02_03_Ch1
;.
SFX_02_04: ; 800c (2:400c)
        db CH7
        dw SFX_02_04_Ch1
;.
SFX_02_05: ; 800f (2:400f)
        db CH7
        dw SFX_02_05_Ch1
;.
SFX_02_06: ; 8012 (2:4012)
        db CH7
        dw SFX_02_06_Ch1
;.
SFX_02_07: ; 8015 (2:4015)
        db CH7
        dw SFX_02_07_Ch1
;.
SFX_02_08: ; 8018 (2:4018)
        db CH7
        dw SFX_02_08_Ch1
;.
SFX_02_09: ; 801b (2:401b)
        db CH7
        dw SFX_02_09_Ch1
;.
SFX_02_0a: ; 801e (2:401e)
        db CH7
        dw SFX_02_0a_Ch1
;.
SFX_02_0b: ; 8021 (2:4021)
        db CH7
        dw SFX_02_0b_Ch1
;.
SFX_02_0c: ; 8024 (2:4024)
        db CH7
        dw SFX_02_0c_Ch1
;.
SFX_02_0d: ; 8027 (2:4027)
        db CH7
        dw SFX_02_0d_Ch1
;.
SFX_02_0e: ; 802a (2:402a)
        db CH7
        dw SFX_02_0e_Ch1
;.
SFX_02_0f: ; 802d (2:402d)
        db CH7
        dw SFX_02_0f_Ch1
;.
SFX_02_10: ; 8030 (2:4030)
        db CH7
        dw SFX_02_10_Ch1

SFX_02_11: ; 8033 (2:4033)
        db CH7
        dw SFX_02_11_Ch1
;.
SFX_02_12: ; 8036 (2:4036)
        db CH7
        dw SFX_02_12_Ch1
;.
SFX_02_13: ; 8039 (2:4039)
        db CH7
        dw SFX_02_13_Ch1
;.
SFX_02_14: ; 803c (2:403c)
        db ( $80 | CH4 )
        dw SFX_02_14_Ch1
        db CH5
        dw SFX_02_14_Ch2
        db CH7
        dw SFX_02_14_Ch3
;.
SFX_02_15: ; 8045 (2:4045)
        db ( $80 | CH4 )
        dw SFX_02_15_Ch1
        db CH5
        dw SFX_02_15_Ch2
        db CH7
        dw SFX_02_15_Ch3
;.
SFX_02_16: ; 804e (2:404e)
        db ( $80 | CH4 )
        dw SFX_02_16_Ch1
        db CH5
        dw SFX_02_16_Ch2
        db CH7
        dw SFX_02_16_Ch3
;.
SFX_02_17: ; 8057 (2:4057)
        db ( $80 | CH4 )
        dw SFX_02_17_Ch1
        db CH5
        dw SFX_02_17_Ch2
        db CH7
        dw SFX_02_17_Ch3
;.
SFX_02_18: ; 8060 (2:4060)
        db ( $80 | CH4 )
        dw SFX_02_18_Ch1
        db CH5
        dw SFX_02_18_Ch2
        db CH7
        dw SFX_02_18_Ch3
;.
SFX_02_19: ; 8069 (2:4069)
        db ( $80 | CH4 )
        dw SFX_02_19_Ch1
        db CH5
        dw SFX_02_19_Ch2
        db CH7
        dw SFX_02_19_Ch3
;.
SFX_02_1a: ; 8072 (2:4072)
        db ( $80 | CH4 )
        dw SFX_02_1a_Ch1
        db CH5
        dw SFX_02_1a_Ch2
        db CH7
        dw SFX_02_1a_Ch3
;.
SFX_02_1b: ; 807b (2:407b)
        db ( $80 | CH4 )
        dw SFX_02_1b_Ch1
        db CH5
        dw SFX_02_1b_Ch2
        db CH7
        dw SFX_02_1b_Ch3
;.
SFX_02_1c: ; 8084 (2:4084)
        db ( $80 | CH4 )
        dw SFX_02_1c_Ch1
        db CH5
        dw SFX_02_1c_Ch2
        db CH7
        dw SFX_02_1c_Ch3
;.
SFX_02_1d: ; 808d (2:408d)
        db ( $80 | CH4 )
        dw SFX_02_1d_Ch1
        db CH5
        dw SFX_02_1d_Ch2
        db CH7
        dw SFX_02_1d_Ch3
;.
SFX_02_1e: ; 8096 (2:4096)
        db ( $80 | CH4 )
        dw SFX_02_1e_Ch1
        db CH5
        dw SFX_02_1e_Ch2
        db CH7
        dw SFX_02_1e_Ch3
;.
SFX_02_1f: ; 809f (2:409f)
        db ( $80 | CH4 )
        dw SFX_02_1f_Ch1
        db CH5
        dw SFX_02_1f_Ch2
        db CH7
        dw SFX_02_1f_Ch3
;.
SFX_02_20: ; 80a8 (2:40a8)
        db ( $80 | CH4 )
        dw SFX_02_20_Ch1
        db CH5
        dw SFX_02_20_Ch2
        db CH7
        dw SFX_02_20_Ch3
;.
SFX_02_21: ; 80b1 (2:40b1)
        db ( $80 | CH4 )
        dw SFX_02_21_Ch1
        db CH5
        dw SFX_02_21_Ch2
        db CH7
        dw SFX_02_21_Ch3
;.
SFX_02_22: ; 80ba (2:40ba)
        db ( $80 | CH4 )
        dw SFX_02_22_Ch1
        db CH5
        dw SFX_02_22_Ch2
        db CH7
        dw SFX_02_22_Ch3
;.
SFX_02_23: ; 80c3 (2:40c3)
        db ( $80 | CH4 )
        dw SFX_02_23_Ch1
        db CH5
        dw SFX_02_23_Ch2
        db CH7
        dw SFX_02_23_Ch3
;.
SFX_02_24: ; 80cc (2:40cc)
        db ( $80 | CH4 )
        dw SFX_02_24_Ch1
        db CH5
        dw SFX_02_24_Ch2
        db CH7
        dw SFX_02_24_Ch3
;.
SFX_02_25: ; 80d5 (2:40d5)
        db ( $80 | CH4 )
        dw SFX_02_25_Ch1
        db CH5
        dw SFX_02_25_Ch2
        db CH7
        dw SFX_02_25_Ch3
;.
SFX_02_26: ; 80de (2:40de)
        db ( $80 | CH4 )
        dw SFX_02_26_Ch1
        db CH5
        dw SFX_02_26_Ch2
        db CH7
        dw SFX_02_26_Ch3
;.
SFX_02_27: ; 80e7 (2:40e7)
        db ( $80 | CH4 )
        dw SFX_02_27_Ch1
        db CH5
        dw SFX_02_27_Ch2
        db CH7
        dw SFX_02_27_Ch3
;.
SFX_02_28: ; 80f0 (2:40f0)
        db ( $80 | CH4 )
        dw SFX_02_28_Ch1
        db CH5
        dw SFX_02_28_Ch2
        db CH7
        dw SFX_02_28_Ch3
;.
SFX_02_29: ; 80f9 (2:40f9)
        db ( $80 | CH4 )
        dw SFX_02_29_Ch1
        db CH5
        dw SFX_02_29_Ch2
        db CH7
        dw SFX_02_29_Ch3
;.
SFX_02_2a: ; 8102 (2:4102)
        db ( $80 | CH4 )
        dw SFX_02_2a_Ch1
        db CH5
        dw SFX_02_2a_Ch2
        db CH7
        dw SFX_02_2a_Ch3
;.
SFX_02_2b: ; 810b (2:410b)
        db ( $80 | CH4 )
        dw SFX_02_2b_Ch1
        db CH5
        dw SFX_02_2b_Ch2
        db CH7
        dw SFX_02_2b_Ch3
;.
SFX_02_2c: ; 8114 (2:4114)
        db ( $80 | CH4 )
        dw SFX_02_2c_Ch1
        db CH5
        dw SFX_02_2c_Ch2
        db CH7
        dw SFX_02_2c_Ch3
;.
SFX_02_2d: ; 811d (2:411d)
        db ( $80 | CH4 )
        dw SFX_02_2d_Ch1
        db CH5
        dw SFX_02_2d_Ch2
        db CH7
        dw SFX_02_2d_Ch3
;.
SFX_02_2e: ; 8126 (2:4126)
        db ( $80 | CH4 )
        dw SFX_02_2e_Ch1
        db CH5
        dw SFX_02_2e_Ch2
        db CH7
        dw SFX_02_2e_Ch3
;.
SFX_02_2f: ; 812f (2:412f)
        db ( $80 | CH4 )
        dw SFX_02_2f_Ch1
        db CH5
        dw SFX_02_2f_Ch2
        db CH7
        dw SFX_02_2f_Ch3
;.
SFX_02_30: ; 8138 (2:4138)
        db ( $80 | CH4 )
        dw SFX_02_30_Ch1
        db CH5
        dw SFX_02_30_Ch2
        db CH7
        dw SFX_02_30_Ch3
;.
SFX_02_31: ; 8141 (2:4141)
        db ( $80 | CH4 )
        dw SFX_02_31_Ch1
        db CH5
        dw SFX_02_31_Ch2
        db CH7
        dw SFX_02_31_Ch3
;.
SFX_02_32: ; 814a (2:414a)
        db ( $80 | CH4 )
        dw SFX_02_32_Ch1
        db CH5
        dw SFX_02_32_Ch2
        db CH7
        dw SFX_02_32_Ch3
;.
SFX_02_33: ; 8153 (2:4153)
        db ( $80 | CH4 )
        dw SFX_02_33_Ch1
        db CH5
        dw SFX_02_33_Ch2
        db CH7
        dw SFX_02_33_Ch3
;.
SFX_02_34: ; 815c (2:415c)
        db ( $80 | CH4 )
        dw SFX_02_34_Ch1
        db CH5
        dw SFX_02_34_Ch2
        db CH7
        dw SFX_02_34_Ch3
;.
SFX_02_35: ; 8165 (2:4165)
        db ( $80 | CH4 )
        dw SFX_02_35_Ch1
        db CH5
        dw SFX_02_35_Ch2
        db CH7
        dw SFX_02_35_Ch3
;.
SFX_02_36: ; 816e (2:416e)
        db ( $80 | CH4 )
        dw SFX_02_36_Ch1
        db CH5
        dw SFX_02_36_Ch2
        db CH7
        dw SFX_02_36_Ch3
;.
SFX_02_37: ; 8177 (2:4177)
        db ( $80 | CH4 )
        dw SFX_02_37_Ch1
        db CH5
        dw SFX_02_37_Ch2
        db CH7
        dw SFX_02_37_Ch3
;.
SFX_02_38: ; 8180 (2:4180)
        db ( $80 | CH4 )
        dw SFX_02_38_Ch1
        db CH5
        dw SFX_02_38_Ch2
        db CH7
        dw SFX_02_38_Ch3
;.
SFX_02_39: ; 8189 (2:4189)
        db ( $80 | CH4 )
        dw SFX_02_39_Ch1
        db CH5
        dw SFX_02_39_Ch2
        db CH7
        dw SFX_02_39_Ch3
;.
SFX_02_3a: ; 8192 (2:4192)
        db ( $80 | CH4 )
        dw SFX_02_3a_Ch1
        db CH5
        dw SFX_02_3a_Ch2
        db CH6
        dw SFX_02_3a_Ch3
;.
SFX_02_3b: ; 819b (2:419b)
        db ( $80 | CH4 )
        dw SFX_02_3b_Ch1
        db CH5
        dw SFX_02_3b_Ch2
        db CH6
        dw SFX_02_3b_Ch3
;.
SFX_02_3c: ; 81a4 (2:41a4)
        db CH4
        dw SFX_02_3c_Ch1
;.
SFX_02_3d: ; 81a7 (2:41a7)
        db CH4
        dw SFX_02_3d_Ch1
;.
SFX_02_3e: ; 81aa (2:41aa)
        db CH4
        dw SFX_02_3e_Ch1
;.
SFX_02_3f: ; 81ad (2:41ad)
        db CH7
        dw SFX_02_3f_Ch1
;.
SFX_02_40: ; 81b0 (2:41b0)
        db CH4
        dw SFX_02_40_Ch1
;.
SFX_02_41: ; 81b3 (2:41b3)
        db ( $80 | CH4 )
        dw SFX_02_41_Ch1
        db CH5
        dw SFX_02_41_Ch2
        db CH6
        dw SFX_02_41_Ch3
;.
SFX_02_42: ; 81bc (2:41bc)
        db ( $80 | CH4 )
        dw SFX_02_42_Ch1
        db CH5
        dw SFX_02_42_Ch2
        db CH6
        dw SFX_02_42_Ch3
;.
SFX_02_43: ; 81c5 (2:41c5)
        db CH4
        dw SFX_02_43_Ch1
;.
SFX_02_44: ; 81c8 (2:41c8)
        db CH4
        dw SFX_02_44_Ch1
;.
SFX_02_45: ; 81cb (2:41cb)
        db CH4
        dw SFX_02_45_Ch1
;.
SFX_02_46: ; 81ce (2:41ce)
        db CH4
        dw SFX_02_46_Ch1
;.
SFX_02_47: ; 81d1 (2:41d1)
        db CH4
        dw SFX_02_47_Ch1
;.
SFX_02_48: ; 81d4 (2:41d4)
        db CH4
        dw SFX_02_48_Ch1
;.
SFX_02_49: ; 81d7 (2:41d7)
        db CH4
        dw SFX_02_49_Ch1
;.
SFX_02_4a: ; 81da (2:41da)
        db CH4
        dw SFX_02_4a_Ch1
;.
SFX_02_4b: ; 81dd (2:41dd)
        db CH4
        dw SFX_02_4b_Ch1
;.
SFX_02_4c: ; 81e0 (2:41e0)
        db CH4
        dw SFX_02_4c_Ch1
;.
SFX_02_4d: ; 81e3 (2:41e3)
        db CH4
        dw SFX_02_4d_Ch1
;.
SFX_02_4e: ; 81e6 (2:41e6)
        db CH4
        dw SFX_02_4e_Ch1
;.
SFX_02_4f: ; 81e9 (2:41e9)
        db CH7
        dw SFX_02_4f_Ch1
;.
SFX_02_50: ; 81ec (2:41ec)
        db CH7
        dw SFX_02_50_Ch1
;.
SFX_02_51: ; 81ef (2:41ef)
        db ( $40 | CH4 )
        dw SFX_02_51_Ch1
        db CH5
        dw SFX_02_51_Ch2
;.
SFX_02_52: ; 81f5 (2:41f5)
        db CH4
        dw SFX_02_52_Ch1
;.
SFX_02_53: ; 81f8 (2:41f8)
        db CH7
        dw SFX_02_53_Ch1
;.
SFX_02_54: ; 81fb (2:41fb)
        db ( $40 | CH4 )
        dw SFX_02_54_Ch1
        db CH5
        dw SFX_02_54_Ch2
;.
SFX_02_55: ; 8201 (2:4201)
        db CH4
        dw SFX_02_55_Ch1
;.
SFX_02_56: ; 8204 (2:4204)
        db CH7
        dw SFX_02_56_Ch1
;.
SFX_02_57: ; 8207 (2:4207)
        db CH7
        dw SFX_02_57_Ch1
;.
SFX_02_58: ; 820a (2:420a)
        db ( $40 | CH4 )
        dw SFX_02_58_Ch1
        db CH5
        dw SFX_02_58_Ch2
;.
SFX_02_59: ; 8210 (2:4210)
        db ( $40 | CH4 )
        dw SFX_02_59_Ch1
        db CH5
        dw SFX_02_59_Ch2
;.
SFX_02_5a: ; 8216 (2:4216)
        db ( $40 | CH4 )
        dw SFX_02_5a_Ch1
        db CH5
        dw SFX_02_5a_Ch2
;.
SFX_02_5b: ; 821c (2:421c)
        db CH4
        dw SFX_02_5b_Ch1
;.
SFX_02_5c: ; 821f (2:421f)
        db CH7
        dw SFX_02_5c_Ch1
;.
SFX_02_5d: ; 8222 (2:4222)
        db ( $40 | CH4 )
        dw SFX_02_5d_Ch1
        db CH5
        dw SFX_02_5d_Ch2
;.
SFX_02_5e: ; 8228 (2:4228)
        db CH2
        dw SFX_02_5e_Ch1
;.
SFX_02_5f: ; 822b (2:422b)
        db CH4
        dw SFX_02_5f_Ch1
;.
;..............................*
;................................*
;..................................*
;.
; BEGIN AUDIO ENGINE BEGIN AUDIO ENGINE BEGIN AUDIO ENGINE
; INCLUDE "music.asm"
;.
;..............................*
;................................*
;..................................*
;.
Music_Game:
        db ( $C0 | CH0 )
        dw Music_Game_Ch1
        db CH1
        dw Music_Game_Ch2
        db CH2
        dw Music_Game_Ch3
        db CH3
        dw Music_Game_Ch4
;.
;..............................*
;................................*
;..................................*
;.
PlayMusic:
        ld b, a
        ld [wc0ee], a
        xor a
        ld [wMusicHeaderPointer], a
        ld [wc0f0], a
        ld a, b
;.
;..............................*
;................................*
;..................................*
;.
PlaySound:
        push hl
        push de
        push bc
        ld b, a
        ld a, [wc0ee]
        and a
        jr z, .asm_23c8
        xor a
        ld [wc02a], a
        ld [wc02b], a
        ld [wc02c], a
        ld [wc02d], a
.asm_23c8
        ld a, [wMusicHeaderPointer]
        and a
        jr z, .asm_23e3
        ld a, [wc0ee]
        and a
        jr z, .asm_2425
        xor a
        ld [wc0ee], a
        ld a, [wcfca]
        cp $ff
        jr nz, .asm_2414
        xor a
        ld [wMusicHeaderPointer], a
.asm_23e3
        xor a
        ld [wc0ee], a
        ld a, b
        call Func_9876
        jr .asm_2425
.asm_2414
        ld a, b
        ld [wcfca], a
        ld a, [wMusicHeaderPointer]
        ld [wcfc8], a
        ld [wcfc9], a
        ld a, b
        ld [wMusicHeaderPointer], a
.asm_2425
        pop bc
        pop de
        pop hl
        ret
;.
;..............................*
;................................*
;..................................*
;.
Music2_UpdateMusic:
        ld c, CH0
.loop
        ld b, $0
        ld hl, wc026
        add hl, bc
        ld a, [hl]
        and a
        jr z, .nextChannel
        ld a, c
        cp CH4
        jr nc, .asm_912e ; if sfx channel
        ld a, [wc002]
        and a
        jr z, .asm_912e
        bit 7, a
        jr nz, .nextChannel
        set 7, a
        ld [wc002], a
        xor a
        ld [$ff25], a
        ld [$ff1a], a
        ld a, $80
        ld [$ff1a], a
        jr .nextChannel
.asm_912e
        call Music2_ApplyMusicAffects
.nextChannel
        ld a, c
        inc c ; inc channel number
        cp CH7
        jr nz, .loop
        ret
;.
;..............................*
;................................*
;..................................*
;.
Music2_ApplyMusicAffects:
        ld b, $0
        ld hl, wc0b6
        add hl, bc
        ld a, [hl]
        cp $1
        jp z, Music2_PlayNextNote
        dec a
        ld [hl], a
        ld a, c
        cp CH4
        jr nc, .startChecks ; if it is a sfx channel
        ld hl, wc02a
        add hl, bc
        ld a, [hl]
        and a
        jr z, .startChecks
        ret
.startChecks
        ld hl, wc02e
        add hl, bc
        bit 6, [hl] ; dutycycle
        jr z, .checkForExecuteMusic
        call Music2_ApplyDutyCycle
.checkForExecuteMusic
        ld b, $0
        ld hl, wc036
        add hl, bc
        bit 0, [hl]
        jr nz, .checkForPitchBend
        ld hl, wc02e
        add hl, bc
        bit 2, [hl]
        jr nz, .disablePitchBendVibrato
.checkForPitchBend
        ld hl, wc02e
        add hl, bc
        bit 4, [hl] ; pitchbend
        jr z, .checkVibratoDelay
        jp Music2_ApplyPitchBend
.checkVibratoDelay
        ld hl, wc04e ; vibrato delay
        add hl, bc
        ld a, [hl]
        and a ; check if delay is over
        jr z, .checkForVibrato
        dec [hl] ; otherwise, dec delay
.disablePitchBendVibrato
        ret
.checkForVibrato
        ld hl, wc056 ; vibrato rate
        add hl, bc
        ld a, [hl]
        and a
        jr nz, .vibrato
        ret ; no vibrato
.vibrato
        ld d, a
        ld hl, wc05e
        add hl, bc
        ld a, [hl]
        and $f
        and a
        jr z, .vibratoAlreadyDone
        dec [hl] ; apply vibrato pitch change
        ret
.vibratoAlreadyDone
        ld a, [hl]
        swap [hl]
        or [hl]
        ld [hl], a ; reset the vibrato value and start again
        ld hl, wc066
        add hl, bc
        ld e, [hl] ; get note pitch
        ld hl, wc02e
        add hl, bc
        bit 3, [hl] ; this is the only code that
;  sets/resets bit three so
        jr z, .unset ; it continuously alternates which 
; path it takes
        res 3, [hl]
        ld a, d
        and $f
        ld d, a
        ld a, e
        sub d
        jr nc, .noCarry
        ld a, $0
.noCarry
        jr .done
.unset
        set 3, [hl]
        ld a, d
        and $f0
        swap a
        add e
        jr nc, .done
        ld a, $ff
.done
        ld d, a
        ld b, $3
        call Func_9838
        ld [hl], d
        ret
;.
;..............................*
;................................*
;..................................*
;.
Music2_PlayNextNote:
        ld hl, wc06e
        add hl, bc
        ld a, [hl]
        ld hl, wc04e
        add hl, bc
        ld [hl], a
        ld hl, wc02e
        add hl, bc
        res 4, [hl]
        res 5, [hl]
        call Music2_endchannel
        ret
;.
;..............................*
;................................*
;..................................*
;.
Music2_endchannel:
        call Music2_GetNextMusicByte
        ld d, a
        cp $ff ; is this command an endchannel?
        jp nz, Music2_callchannel ; no
        ld b, $0 ; yes
        ld hl, wc02e
        add hl, bc
        bit 1, [hl]
        jr nz, .returnFromCall
        ld a, c
        cp CH3
        jr nc, .noiseOrSfxChannel
        jr .asm_923f
.noiseOrSfxChannel
        res 2, [hl]
        ld hl, wc036
        add hl, bc
        res 0, [hl]
        cp CH6
        jr nz, .notSfxChannel3
        ld a, $0
        ld [$ff1a], a
        ld a, $80
        ld [$ff1a], a
.notSfxChannel3
        jr nz, .asm_9222
        ld a, [wc003]
        and a
        jr z, .asm_9222
        xor a
        ld [wc003], a
        jr .asm_923f
.asm_9222
        jr .asm_9248
.returnFromCall
        res 1, [hl]
        ld d, $0
        ld a, c
        add a
        ld e, a
        ld hl, wc006
        add hl, de
        push hl ; store current channel address
        ld hl, wc016
        add hl, de
        ld e, l
        ld d, h
        pop hl
        ld a, [de]
        ld [hli], a
        inc de
        ld a, [de]
        ld [hl], a ; loads channel address to return to
        jp Music2_endchannel
.asm_923f
        ld hl, Unknown_9b1f
        add hl, bc
        ld a, [$ff25]
        and [hl]
        ld [$ff25], a
.asm_9248
        ld a, [wc02a]
        cp $14
        jr nc, .asm_9251
        jr .asm_926e
.asm_9251
        ld a, [wc02a]
        cp $86
        jr z, .asm_926e
        jr c, .asm_925c
        jr .asm_926e
.asm_925c
        ld a, c
        cp CH4
        jr z, .asm_9265
        call Func_96c7
        ret c
.asm_9265
        ld a, [wc005]
        ld [$ff24], a
        xor a
        ld [wc005], a
.asm_926e
        ld hl, wc026
        add hl, bc
        ld [hl], b
        ret
;.
;..............................*
;................................*
;..................................*
;.
Music2_callchannel:
        cp $fd ; is this command a callchannel?
        jp nz, Music2_loopchannel ; no
        call Music2_GetNextMusicByte ; yes
        push af
        call Music2_GetNextMusicByte
        ld d, a
        pop af
        ld e, a
        push de ; store pointer
        ld d, $0
        ld a, c
        add a
        ld e, a
        ld hl, wc006
        add hl, de
        push hl
        ld hl, wc016
        add hl, de
        ld e, l
        ld d, h
        pop hl
        ld a, [hli]
        ld [de], a
        inc de
        ld a, [hld]
        ld [de], a ; copy current channel address
        pop de
        ld [hl], e
        inc hl
        ld [hl], d ; overwrite current address with pointer
        ld b, $0
        ld hl, wc02e
        add hl, bc
        set 1, [hl] ; set the call flag
        jp Music2_endchannel
;.
;..............................*
;................................*
;..................................*
;.
Music2_loopchannel:
        cp $fe ; is this command a loopchannel?
        jp nz, Music2_notetype ; no
        call Music2_GetNextMusicByte ; yes
        ld e, a
        and a
        jr z, .infiniteLoop
        ld b, $0
        ld hl, wc0be
        add hl, bc
        ld a, [hl]
        cp e
        jr nz, .loopAgain
        ld a, $1 ; if no more loops to make,
        ld [hl], a
        call Music2_GetNextMusicByte ; skip pointer
        call Music2_GetNextMusicByte
        jp Music2_endchannel
.loopAgain ; inc loop count
        inc a
        ld [hl], a
        ; fall through
.infiniteLoop ; overwrite current address with pointer
        call Music2_GetNextMusicByte
        push af
        call Music2_GetNextMusicByte
        ld b, a
        ld d, $0
        ld a, c
        add a
        ld e, a
        ld hl, wc006
        add hl, de
        pop af
        ld [hli], a
        ld [hl], b
        jp Music2_endchannel
;.
;..............................*
;................................*
;..................................*
;.
Music2_notetype:
        and $f0
        cp $d0 ; is this command a notetype?
        jp nz, Music2_toggleperfectpitch ; no
        ld a, d ; yes
        and $f
        ld b, $0
        ld hl, wc0c6
        add hl, bc
        ld [hl], a ; store low nibble as speed
        ld a, c
        cp CH3
        jr z, .noiseChannel ; noise channel has 0 params
        call Music2_GetNextMusicByte
        ld d, a
        ld a, c
        cp CH2
        jr z, .musicChannel3
        cp CH6
        jr nz, .notChannel3
        ld hl, wc0e7
        jr .sfxChannel3
.musicChannel3
        ld hl, wc0e6
.sfxChannel3
        ld a, d
        and $f
        ld [hl], a ; store low nibble of param as duty
        ld a, d
        and $30
        sla a
        ld d, a
        ; fall through
; .....................*
        ; if channel 3, store high nibble as volume
        ; else, store volume (high nibble) 
	; and fade (low nibble)
.notChannel3
        ld b, $0
        ld hl, wc0de
        add hl, bc
        ld [hl], d
.noiseChannel
        jp Music2_endchannel
;.
;..............................*
;................................*
;..................................*
;.
Music2_toggleperfectpitch:
        ld a, d
        cp $e8 ; is this command a toggleperfectpitch?
        jr nz, Music2_vibrato ; no
        ld b, $0 ; yes
        ld hl, wc02e
        add hl, bc
        ld a, [hl]
        xor $1
        ld [hl], a ; flip bit 0 of wc02e
        jp Music2_endchannel
;.
;..............................*
;................................*
;..................................*
;.
Music2_vibrato:
        cp $ea ; is this command a vibrato?
        jr nz, Music2_pitchbend ; no
        call Music2_GetNextMusicByte ; yes
        ld b, $0
        ld hl, wc04e
        add hl, bc
        ld [hl], a ; store delay
        ld hl, wc06e
        add hl, bc
        ld [hl], a ; store delay
        call Music2_GetNextMusicByte
        ld d, a
        and $f0
        swap a
        ld b, $0
        ld hl, wc056
        add hl, bc
        srl a
        ld e, a
        adc b
        swap a
        or e
        ld [hl], a ; store rate as both high and low nibbles
        ld a, d
        and $f
        ld d, a
        ld hl, wc05e
        add hl, bc
        swap a
        or d
        ld [hl], a ; store depth as both high and low nibbles
        jp Music2_endchannel
;.
;..............................*
;................................*
;..................................*
;.
Music2_pitchbend:
        cp $eb ; is this command a pitchbend?
        jr nz, Music2_duty ; no
        call Music2_GetNextMusicByte ; yes
        ld b, $0
        ld hl, wc076
        add hl, bc
        ld [hl], a ; store first param
        call Music2_GetNextMusicByte
        ld d, a
        and $f0
        swap a
        ld b, a
        ld a, d
        and $f
        call Func_9858
        ld b, $0
        ld hl, wc0a6
        add hl, bc
        ld [hl], d ; store unknown part of second param
        ld hl, wc0ae
        add hl, bc
        ld [hl], e ; store unknown part of second param
        ld b, $0
        ld hl, wc02e
        add hl, bc
        set 4, [hl] ; set pitchbend flag
        call Music2_GetNextMusicByte
        ld d, a
        jp Music2_notelength
;.
;..............................*
;................................*
;..................................*
;.
Music2_duty:
        cp $ec ; is this command a duty?
        jr nz, Music2_tempo ; no
        call Music2_GetNextMusicByte ; yes
        rrca
        rrca
        and $c0
        ld b, $0
        ld hl, wc03e
        add hl, bc
        ld [hl], a ; store duty
        jp Music2_endchannel
;.
;..............................*
;................................*
;..................................*
;.
Music2_tempo:
        cp $ed ; is this command a tempo?
        jr nz, Music2_stereopanning ; no
        ld a, c ; yes
        cp CH4
        jr nc, .sfxChannel
        call Music2_GetNextMusicByte
        ld [wc0e8], a ; store first param
        call Music2_GetNextMusicByte
        ld [wc0e9], a ; store second param
        xor a
        ld [wc0ce], a ; clear RAM
        ld [wc0cf], a
        ld [wc0d0], a
        ld [wc0d1], a
        jr .musicChannelDone
.sfxChannel
        call Music2_GetNextMusicByte
        ld [wc0ea], a ; store first param
        call Music2_GetNextMusicByte
        ld [wc0eb], a ; store second param
        xor a
        ld [wc0d2], a ; clear RAM
        ld [wc0d3], a
        ld [wc0d4], a
        ld [wc0d5], a
.musicChannelDone
        jp Music2_endchannel
;.
;..............................*
;................................*
;..................................*
;.
Music2_stereopanning:
        cp $ee ; is this command a stereopanning?
        jr nz, Music2_unknownmusic0xef ; no
        call Music2_GetNextMusicByte ; yes
        ld [wc004], a ; store panning
        jp Music2_endchannel
;.
;..............................*
;................................*
;..................................*
;.
Music2_unknownmusic0xef:
        cp $ef ; is this command an unknownmusic0xef?
        jr nz, Music2_dutycycle ; no
        call Music2_GetNextMusicByte ; yes
        push bc
        call Func_9876
        pop bc
        ld a, [wc003]
        and a
        jr nz, .skip
        ld a, [wc02d]
        ld [wc003], a
        xor a
        ld [wc02d], a
.skip
        jp Music2_endchannel
;.
;..............................*
;................................*
;..................................*
;.
Music2_dutycycle:
        cp $fc ; is this command a dutycycle?
        jr nz, Music2_volume ; no
        call Music2_GetNextMusicByte ; yes
        ld b, $0
        ld hl, wc046
        add hl, bc
        ld [hl], a ; store full cycle
        and $c0
        ld hl, wc03e
        add hl, bc
        ld [hl], a ; store first duty
        ld hl, wc02e
        add hl, bc
        set 6, [hl] ; set dutycycle flag
        jp Music2_endchannel
;.
;..............................*
;................................*
;..................................*
;.
Music2_volume:
        cp $f0 ; is this command a volume?
        jr nz, Music2_executemusic ; no
        call Music2_GetNextMusicByte ; yes
        ld [$ff24], a ; store volume
        jp Music2_endchannel
;.
;..............................*
;................................*
;..................................*
;.
Music2_executemusic:
        cp $f8 ; is this command an executemusic?
        jr nz, Music2_octave ; no
        ld b, $0 ; yes
        ld hl, wc036
        add hl, bc
        set 0, [hl]
        jp Music2_endchannel
;.
;..............................*
;................................*
;..................................*
;.
Music2_octave:
        and $f0
        cp $e0 ; is this command an octave?
        jr nz, Music2_unknownsfx0x20 ; no
        ld hl, wc0d6 ; yes
        ld b, $0
        add hl, bc
        ld a, d
        and $f
        ld [hl], a ; store low nibble as octave
        jp Music2_endchannel
;.
;..............................*
;................................*
;..................................*
;.
Music2_unknownsfx0x20:
        cp $20 ; is this command an unknownsfx0x20?
        jr nz, Music2_unknownsfx0x10 ; no
        ld a, c
        cp CH3 ; is this a noise or sfx channel?
        jr c, Music2_unknownsfx0x10 ; no
        ld b, $0
        ld hl, wc036
        add hl, bc
        bit 0, [hl]
        jr nz, Music2_unknownsfx0x10 ; no
        call Music2_notelength ; yes
        ld d, a
        ld b, $0
        ld hl, wc03e
        add hl, bc
        ld a, [hl]
        or d
        ld d, a
        ld b, $1
        call Func_9838
        ld [hl], d
        call Music2_GetNextMusicByte
        ld d, a
        ld b, $2
        call Func_9838
        ld [hl], d
        call Music2_GetNextMusicByte
        ld e, a
        ld a, c
        cp CH7
        ld a, $0
        jr z, .sfxNoiseChannel 
; only two params for noise channel
        push de
        call Music2_GetNextMusicByte
        pop de
.sfxNoiseChannel
        ld d, a
        push de
        call Func_9629
        call Func_95f8
        pop de
        call Func_964b
        ret
;.
;..............................*
;................................*
;..................................*
;.
Music2_unknownsfx0x10:
        ld a, c
        cp CH4
        jr c, Music2_note ; if not a sfx
        ld a, d
        cp $10 ; is this command a unknownsfx0x10?
        jr nz, Music2_note ; no
        ld b, $0
        ld hl, wc036
        add hl, bc
        bit 0, [hl]
        jr nz, Music2_note ; no
        call Music2_GetNextMusicByte ; yes
        ld [$ff10], a
        jp Music2_endchannel
;.
;..............................*
;................................*
;..................................*
;.
Music2_note:
        ld a, c
        cp CH3
        jr nz, Music2_notelength ; if not noise channel
        ld a, d
        and $f0
        cp $b0 ; is this command a dnote?
        jr z, Music2_dnote ; yes
        jr nc, Music2_notelength ; no
        swap a
        ld b, a
        ld a, d
        and $f
        ld d, a
        ld a, b
        push de
        push bc
        jr asm_94fd
;.
;..............................*
;................................*
;..................................*
;.
Music2_dnote:
        ld a, d
        and $f
        push af
        push bc
        call Music2_GetNextMusicByte
asm_94fd
        ld d, a
        ld a, [wc003]
        and a
        jr nz, .asm_9508
        ld a, d
        call Func_9876
.asm_9508
        pop bc
        pop de
;.
;..............................*
;................................*
;..................................*
;.
Music2_notelength:
        ld a, d
        push af
        and $f
        inc a
        ld b, $0
        ld e, a
        ld d, b
        ld hl, wc0c6
        add hl, bc
        ld a, [hl]
        ld l, b
        call Func_9847
        ld a, c
        cp CH4
        jr nc, .sfxChannel
        ld a, [wc0e8]
        ld d, a
        ld a, [wc0e9]
        ld e, a
        jr .skip
.sfxChannel
        ld d, $1
        ld e, $0
        cp CH7
        jr z, .skip
        call Func_9693
        ld a, [wc0ea]
        ld d, a
        ld a, [wc0eb]
        ld e, a
.skip
        ld a, l
        ld b, $0
        ld hl, wc0ce
        add hl, bc
        ld l, [hl]
        call Func_9847
        ld e, l
        ld d, h
        ld hl, wc0ce
        add hl, bc
        ld [hl], e
        ld a, d
        ld hl, wc0b6
        add hl, bc
        ld [hl], a
        ld hl, wc036
        add hl, bc
        bit 0, [hl]
        jr nz, Music2_notepitch
        ld hl, wc02e
        add hl, bc
        bit 2, [hl]
        jr z, Music2_notepitch
        pop hl
        ret
;.
;..............................*
;................................*
;..................................*
;.
Music2_notepitch:
        pop af
        and $f0
        cp $c0
        jr nz, .notRest
        ld a, c
        cp CH4
        jr nc, .sfxChannel
        ld hl, wc02a
        add hl, bc
        ld a, [hl]
        and a
        jr nz, .done
        ; fall through
.sfxChannel
        ld a, c
        cp CH2
        jr z, .musicChannel3
        cp CH6
        jr nz, .notSfxChannel3
.musicChannel3
        ld b, $0
        ld hl, Unknown_9b1f
        add hl, bc
        ld a, [$ff25]
        and [hl]
        ld [$ff25], a
        jr .done
.notSfxChannel3
        ld b, $2
        call Func_9838
        ld a, $8
        ld [hli], a
        inc hl
        ld a, $80
        ld [hl], a
.done
        ret
.notRest
        swap a
        ld b, $0
        ld hl, wc0d6
        add hl, bc
        ld b, [hl]
        call Func_9858
        ld b, $0
        ld hl, wc02e
        add hl, bc
        bit 4, [hl]
        jr z, .asm_95b8
        call Func_978f
.asm_95b8
        push de
        ld a, c
        cp CH4
        jr nc, .skip
        ld hl, wc02a
        ld d, $0
        ld e, a
        add hl, de
        ld a, [hl]
        and a
        jr nz, .asm_95cb
        jr .skip
.asm_95cb
        pop de
        ret
.skip
        ld b, $0
        ld hl, wc0de
        add hl, bc
        ld d, [hl]
        ld b, $2
        call Func_9838
        ld [hl], d
        call Func_9629
        call Func_95f8
        pop de
        ld b, $0
        ld hl, wc02e
        add hl, bc
        bit 0, [hl]
        jr z, .skip2
        inc e
        jr nc, .skip2
        inc d
.skip2
        ld hl, wc066
        add hl, bc
        ld [hl], e
        call Func_964b
        ret
;.
;..............................*
;................................*
;..................................*
;.
Func_95f8:
        ld b, $0
        ld hl, Unknown_9b27
        add hl, bc
        ld a, [$ff25]
        or [hl]
        ld d, a
        ld a, c
        cp CH7
        jr z, .sfxNoiseChannel
        cp CH4
        jr nc, .skip
        ld hl, wc02a
        add hl, bc
        ld a, [hl]
        and a
        jr nz, .skip
.sfxNoiseChannel
        ld a, [wc004]
        ld hl, Unknown_9b27
        add hl, bc
        and [hl]
        ld d, a
        ld a, [$ff25]
        ld hl, Unknown_9b1f
        add hl, bc
        and [hl]
        or d
        ld d, a
.skip
        ld a, d
        ld [$ff25], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
Func_9629:
        ld b, $0
        ld hl, wc0b6
        add hl, bc
        ld d, [hl]
        ld a, c
        cp CH2
        jr z, .channel3
        cp CH6
        jr z, .channel3
        ld a, d
        and $3f
        ld d, a
        ld hl, wc03e
        add hl, bc
        ld a, [hl]
        or d
        ld d, a
.channel3
        ld b, $1
        call Func_9838
        ld [hl], d
        ret
;.
;..............................*
;................................*
;..................................*
;.
Func_964b:
        ld a, c
        cp CH2
        jr z, .channel3
        cp CH6
        jr nz, .notSfxChannel3
        ; fall through
.channel3
        push de
        ld de, wc0e6
        cp CH2
        jr z, .musicChannel3
        ld de, wc0e7
.musicChannel3
        ld a, [de]
        add a
        ld d, $0
        ld e, a
        ld hl, Music2_WavePointers
        add hl, de
        ld e, [hl]
        inc hl
        ld d, [hl]
        ld hl, $ff30
        ld b, $f
        ld a, $0
        ld [$ff1a], a
.loop
        ld a, [de]
        inc de
        ld [hli], a
        ld a, b
        dec b
        and a
        jr nz, .loop
        ld a, $80
        ld [$ff1a], a
        pop de
.notSfxChannel3
        ld a, d
        or $80
        and $c7
        ld d, a
        ld b, $3
        call Func_9838
        ld [hl], e
        inc hl
        ld [hl], d
        call Func_96b5
        ret
;.
;..............................*
;................................*
;..................................*
;.
Func_9693:
        call Func_96e5
        jr nc, .asm_96ab
        ld d, $0
        ld a, [wc0f2]
        add $80
        jr nc, .asm_96a2
        inc d
.asm_96a2
        ld [wc0eb], a
        ld a, d
        ld [wc0ea], a
        jr .asm_96b4
.asm_96ab
        xor a
        ld [wc0eb], a
        ld a, $1
        ld [wc0ea], a
.asm_96b4
        ret
;.
;..............................*
;................................*
;..................................*
;.
Func_96b5:
        call Func_96e5
        jr nc, .asm_96c6
        ld a, [wc0f1]
        add e
        jr nc, .asm_96c1
        inc d
.asm_96c1
        dec hl
        ld e, a
        ld [hl], e
        inc hl
        ld [hl], d
.asm_96c6
        ret
;.
;..............................*
;................................*
;..................................*
;.
Func_96c7:
        call Func_96e5
        jr nc, .asm_96e2
        ld hl, wc006
        ld e, c
        ld d, $0
        sla e
        rl d
        add hl, de
        ld a, [hl]
        sub $1
        ld [hl], a
        inc hl
        ld a, [hl]
        sbc $0
        ld [hl], a
        scf
        ret
.asm_96e2
        scf
        ccf
        ret
;.
;..............................*
;................................*
;..................................*
;.
Func_96e5:
        ld a, [wc02a]
        cp $14
        jr nc, .asm_96ee
        jr .asm_96f4
.asm_96ee
        cp $86
        jr z, .asm_96f4
        jr c, .asm_96f7
.asm_96f4
        scf
        ccf
        ret
.asm_96f7
        scf
        ret
;.
;..............................*
;................................*
;..................................*
;.
Music2_ApplyPitchBend: ; 0x96f9
        ld hl, wc02e
        add hl, bc
        bit 5, [hl]
        jp nz, .asm_9740
        ld hl, wc09e
        add hl, bc
        ld e, [hl]
        ld hl, wc096
        add hl, bc
        ld d, [hl]
        ld hl, wc07e
        add hl, bc
        ld l, [hl]
        ld h, b
        add hl, de
        ld d, h
        ld e, l
        ld hl, wc08e
        add hl, bc
        push hl
        ld hl, wc086
        add hl, bc
        ld a, [hl]
        pop hl
        add [hl]
        ld [hl], a
        ld a, $0
        adc e
        ld e, a
        ld a, $0
        adc d
        ld d, a
        ld hl, wc0a6
        add hl, bc
        ld a, [hl]
        cp d
        jp c, .asm_9786
        jr nz, .asm_9773
        ld hl, wc0ae
        add hl, bc
        ld a, [hl]
        cp e
        jp c, .asm_9786
        jr .asm_9773
.asm_9740
        ld hl, wc09e
        add hl, bc
        ld a, [hl]
        ld hl, wc096
        add hl, bc
        ld d, [hl]
        ld hl, wc07e
        add hl, bc
        ld e, [hl]
        sub e
        ld e, a
        ld a, d
        sbc b
        ld d, a
        ld hl, wc086
        add hl, bc
        ld a, [hl]
        add a
        ld [hl], a
        ld a, e
        sbc b
        ld e, a
        ld a, d
        sbc b
        ld d, a
        ld hl, wc0a6
        add hl, bc
        ld a, d
        cp [hl]
        jr c, .asm_9786
        jr nz, .asm_9773
        ld hl, wc0ae
        add hl, bc
        ld a, e
        cp [hl]
        jr c, .asm_9786
.asm_9773
        ld hl, wc09e
        add hl, bc
        ld [hl], e
        ld hl, wc096
        add hl, bc
        ld [hl], d
        ld b, $3
        call Func_9838
        ld a, e
        ld [hli], a
        ld [hl], d
        ret
.asm_9786
        ld hl, wc02e
        add hl, bc
        res 4, [hl]
        res 5, [hl]
        ret

Func_978f: ; 0x978f
        ld hl, wc096
        add hl, bc
        ld [hl], d
        ld hl, wc09e
        add hl, bc
        ld [hl], e
        ld hl, wc0b6
        add hl, bc
        ld a, [hl]
        ld hl, wc076
        add hl, bc
        sub [hl]
        jr nc, .asm_97a7
        ld a, $1
.asm_97a7
        ld [hl], a
        ld hl, wc0ae
        add hl, bc
        ld a, e
        sub [hl]
        ld e, a
        ld a, d
        sbc b
        ld hl, wc0a6
        add hl, bc
        sub [hl]
        jr c, .asm_97c3
        ld d, a
        ld b, $0
        ld hl, wc02e
        add hl, bc
        set 5, [hl]
        jr .asm_97e6
.asm_97c3
        ld hl, wc096
        add hl, bc
        ld d, [hl]
        ld hl, wc09e
        add hl, bc
        ld e, [hl]
        ld hl, wc0ae
        add hl, bc
        ld a, [hl]
        sub e
        ld e, a
        ld a, d
        sbc b
        ld d, a
        ld hl, wc0a6
        add hl, bc
        ld a, [hl]
        sub d
        ld d, a
        ld b, $0
        ld hl, wc02e
        add hl, bc
        res 5, [hl]
.asm_97e6
        ld hl, wc076
        add hl, bc
.asm_97ea
        inc b
        ld a, e
        sub [hl]
        ld e, a
        jr nc, .asm_97ea
        ld a, d
        and a
        jr z, .asm_97f8
        dec a
        ld d, a
        jr .asm_97ea
.asm_97f8
        ld a, e
        add [hl]
        ld d, b
        ld b, $0
        ld hl, wc07e
        add hl, bc
        ld [hl], d
        ld hl, wc086
        add hl, bc
        ld [hl], a
        ld hl, wc08e
        add hl, bc
        ld [hl], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
Music2_ApplyDutyCycle:
        ld b, $0
        ld hl, wc046
        add hl, bc
        ld a, [hl]
        rlca
        rlca
        ld [hl], a
        and $c0
        ld d, a
        ld b, $1
        call Func_9838
        ld a, [hl]
        and $3f
        or d
        ld [hl], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
Music2_GetNextMusicByte:
        ld d, $0
        ld a, c
        add a
        ld e, a
        ld hl, wc006
        add hl, de
        ld a, [hli]
        ld e, a
        ld a, [hld]
        ld d, a
        ld a, [de]
        inc de
        ld [hl], e
        inc hl
        ld [hl], d
        ret
;.
;..............................*
;................................*
;..................................*
;.
Func_9838:
        ld a, c
        ld hl, Unknown_9b17
        add l
        jr nc, .noCarry
        inc h
.noCarry
        ld l, a
        ld a, [hl]
        add b
        ld l, a
        ld h, $ff
        ret
;.
;..............................*
;................................*
;..................................*
;.
Func_9847:
        ld h, $0
.loop
        srl a
        jr nc, .noCarry
        add hl, de
.noCarry
        sla e
        rl d
        and a
        jr z, .done
        jr .loop
.done
        ret
;.
;..............................*
;................................*
;..................................*
;.
Func_9858:
        ld h, $0
        ld l, a
        add hl, hl
        ld d, h
        ld e, l
        ld hl, Music2_Pitches
        add hl, de
        ld e, [hl]
        inc hl
        ld d, [hl]
        ld a, b
.loop
        cp $7
        jr z, .done
        sra d
        rr e
        inc a
        jr .loop
.done
        ld a, $8
        add d
        ld d, a
        ret
;.
;..............................*
;................................*
;..................................*
;.
Func_9876:
        ld [wc001], a
        cp $ff
        jp z, Func_9a34
        cp $b9
        jp z, Func_994e
        jp c, Func_994e
        cp $fe
        jr z, .asm_988d
        jp nc, Func_994e
.asm_988d
        xor a
        ld [wc000], a
        ld [wc003], a
        ld [wc0e9], a
        ld [wc0e6], a
        ld [wc0e7], a
        ld d, $8
        ld hl, wc016
        call FillMusicRAM2
        ld hl, wc006
        call FillMusicRAM2
        ld d, $4
        ld hl, wc026
        call FillMusicRAM2
        ld hl, wc02e
        call FillMusicRAM2
        ld hl, wc03e
        call FillMusicRAM2
        ld hl, wc046
        call FillMusicRAM2
        ld hl, wc04e
        call FillMusicRAM2
        ld hl, wc056
        call FillMusicRAM2
        ld hl, wc05e
        call FillMusicRAM2
        ld hl, wc066
        call FillMusicRAM2
        ld hl, wc06e
        call FillMusicRAM2
        ld hl, wc036
        call FillMusicRAM2
        ld hl, wc076
        call FillMusicRAM2
        ld hl, wc07e
        call FillMusicRAM2
        ld hl, wc086
        call FillMusicRAM2
        ld hl, wc08e
        call FillMusicRAM2
        ld hl, wc096
        call FillMusicRAM2
        ld hl, wc09e
        call FillMusicRAM2
        ld hl, wc0a6
        call FillMusicRAM2
        ld hl, wc0ae
        call FillMusicRAM2
        ld a, $1
        ld hl, wc0be
        call FillMusicRAM2
        ld hl, wc0b6
        call FillMusicRAM2
        ld hl, wc0c6
        call FillMusicRAM2
        ld [wc0e8], a
        ld a, $ff
        ld [wc004], a
        xor a
        ld [$ff24], a
        ld a, $8
        ld [$ff10], a
        ld a, $0
        ld [$ff25], a
        xor a
        ld [$ff1a], a
        ld a, $80
        ld [$ff1a], a
        ld a, $77
        ld [$ff24], a
        jp Func_9a8f
;.
;..............................*
;................................*
;..................................*
;.
Func_994e:
        ld l, a
        ld e, a
        ld h, $0
        ld d, h
        add hl, hl
        add hl, de
        ld de, SFX_Headers_02
        add hl, de
        ld a, h
        ld [wc0ec], a
        ld a, l
        ld [wc0ed], a
        ld a, [hl]
        and $c0
        rlca
        rlca
        ld c, a
.asm_9967
        ld d, c
        ld a, c
        add a
        add c
        ld c, a
        ld b, $0
        ld a, [wc0ec]
        ld h, a
        ld a, [wc0ed]
        ld l, a
        add hl, bc
        ld c, d
        ld a, [hl]
        and $f
        ld e, a
        ld d, $0
        ld hl, wc026
        add hl, de
        ld a, [hl]
        and a
        jr z, .asm_99a3
        ld a, e
        cp $7
        jr nz, .asm_999a
        ld a, [wc001]
        cp $14
        jr nc, .asm_9993
        ret
.asm_9993
        ld a, [hl]
        cp $14
        jr z, .asm_99a3
        jr c, .asm_99a3
.asm_999a
        ld a, [wc001]
        cp [hl]
        jr z, .asm_99a3
        jr c, .asm_99a3
        ret
.asm_99a3
        xor a
        push de
        ld h, d
        ld l, e
        add hl, hl
        ld d, h
        ld e, l
        ld hl, wc016
        add hl, de
        ld [hli], a
        ld [hl], a
        ld hl, wc006
        add hl, de
        ld [hli], a
        ld [hl], a
        pop de
        ld hl, wc026
        add hl, de
        ld [hl], a
        ld hl, wc02e
        add hl, de
        ld [hl], a
        ld hl, wc03e
        add hl, de
        ld [hl], a
        ld hl, wc046
        add hl, de
        ld [hl], a
        ld hl, wc04e
        add hl, de
        ld [hl], a
        ld hl, wc056
        add hl, de
        ld [hl], a
        ld hl, wc05e
        add hl, de
        ld [hl], a
        ld hl, wc066
        add hl, de
        ld [hl], a
        ld hl, wc06e
        add hl, de
        ld [hl], a
        ld hl, wc076
        add hl, de
        ld [hl], a
        ld hl, wc07e
        add hl, de
        ld [hl], a
        ld hl, wc086
        add hl, de
        ld [hl], a
        ld hl, wc08e
        add hl, de
        ld [hl], a
        ld hl, wc096
        add hl, de
        ld [hl], a
        ld hl, wc09e
        add hl, de
        ld [hl], a
        ld hl, wc0a6
        add hl, de
        ld [hl], a
        ld hl, wc0ae
        add hl, de
        ld [hl], a
        ld hl, wc036
        add hl, de
        ld [hl], a
        ld a, $1
        ld hl, wc0be
        add hl, de
        ld [hl], a
        ld hl, wc0b6
        add hl, de
        ld [hl], a
        ld hl, wc0c6
        add hl, de
        ld [hl], a
        ld a, e
        cp $4
        jr nz, .asm_9a2b
        ld a, $8
        ld [$ff10], a
.asm_9a2b
        ld a, c
        and a
        jp z, Func_9a8f
        dec c
        jp .asm_9967
;.
;..............................*
;................................*
;..................................*
;.
Func_9a34:
        ld a, $80
        ld [$ff26], a
        ld [$ff1a], a
        xor a
        ld [$ff25], a
        ld [$ff1c], a
        ld a, $8
        ld [$ff10], a
        ld [$ff12], a
        ld [$ff17], a
        ld [$ff21], a
        ld a, $40
        ld [$ff14], a
        ld [$ff19], a
        ld [$ff23], a
        ld a, $77
        ld [$ff24], a
        xor a
        ld [wc000], a
        ld [wc003], a
        ld [wc002], a
        ld [wc0e9], a
        ld [wc0eb], a
        ld [wc0e6], a
        ld [wc0e7], a
        ld d, $a0
        ld hl, wc006
        call FillMusicRAM2
        ld a, $1
        ld d, $18
        ld hl, wc0b6
        call FillMusicRAM2
        ld [wc0e8], a
        ld [wc0ea], a
        ld a, $ff
        ld [wc004], a
        ret
;.
;..............................*
;................................*
;..................................*
;.
FillMusicRAM2:
        ld b, d
.loop
        ld [hli], a
        dec b
        jr nz, .loop
        ret
;.
;..............................*
;................................*
;..................................*
;.
Func_9a8f:
        ld a, [wc001]
        ld l, a
        ld e, a
        ld h, $0
        ld d, h
        add hl, hl
        add hl, de
        ld de, SFX_Headers_02
        add hl, de
        ld e, l
        ld d, h
        ld hl, wc006
        ld a, [de]
        ld b, a
        rlca
        rlca
        and $3
        ld c, a
        ld a, b
        and $f
        ld b, c
        inc b
        inc de
        ld c, $0
.asm_9ab1
        cp c
        jr z, .asm_9ab9
        inc c
        inc hl
        inc hl
        jr .asm_9ab1
.asm_9ab9
        push hl
        push bc
        push af
        ld b, $0
        ld c, a
        ld hl, wc026
        add hl, bc
        ld a, [wc001]
        ld [hl], a
        pop af
        cp $3
        jr c, .asm_9ad2
        ld hl, wc02e
        add hl, bc
        set 2, [hl]
.asm_9ad2
        pop bc
        pop hl
        ld a, [de]
        ld [hli], a
        inc de
        ld a, [de]
        ld [hli], a
        inc de
        inc c
        dec b
        ld a, b
        and a
        ld a, [de]
        inc de
        jr nz, .asm_9ab1
        ld a, [wc001]
        cp $14
        jr nc, .asm_9aeb
        jr .asm_9b15
.asm_9aeb
        ld a, [wc001]
        cp $86
        jr z, .asm_9b15
        jr c, .asm_9af6
        jr .asm_9b15
.asm_9af6
        ld hl, wc02a
        ld [hli], a
        ld [hli], a
        ld [hli], a
        ld [hl], a
        ld hl, wc012
        ld de, Noise2_endchannel
        ld [hl], e
        inc hl
        ld [hl], d
        ld a, [wc005]
        and a
        jr nz, .asm_9b15
        ld a, [$ff24]
        ld [wc005], a
        ld a, $77
        ld [$ff24], a
.asm_9b15
        ret
;.
;..............................*
;................................*
;..................................*
;.
Noise2_endchannel:
        endchannel
;.
;..............................*
;................................*
;..................................*
;.
Unknown_9b17:
        db $10, $15, $1A, $1F ; channels 0-3
        db $10, $15, $1A, $1F ; channels 4-7
;.
;..............................*
;................................*
;..................................*
;.
Unknown_9b1f:
        db $EE, $DD, $BB, $77 ; channels 0-3
        db $EE, $DD, $BB, $77 ; channels 4-7
;.
;..............................*
;................................*
;..................................*
;.
Unknown_9b27:
        db $11, $22, $44, $88 ; channels 0-3
        db $11, $22, $44, $88 ; channels 4-7
;.
;..............................*
;................................*
;..................................*
;.
Music2_Pitches:
        dw $F82C ; C_
        dw $F89D ; C#
        dw $F907 ; D_
        dw $F96B ; D#
        dw $F9CA ; E_
        dw $FA23 ; F_
        dw $FA77 ; F#
        dw $FAC7 ; G_
        dw $FB12 ; G#
        dw $FB58 ; A_
        dw $FB9B ; A#
        dw $FBDA ; B_
;.
;..............................*
;................................*
;..................................*
;.
Music2_WavePointers:
        dw .wave0
        dw .wave1
        dw .wave2
        dw .wave3
        dw .wave4
;.
.wave0
        db $02,$46,$8A,$CE,$FF,$FE,$ED,$DC,$CB,$A9,$87,$65,$44,$33,$22,$11
;.
.wave1
        db $02,$46,$8A,$CE,$EF,$FF,$FE,$EE,$DD,$CB,$A9,$87,$65,$43,$22,$11
;.
.wave2
        db $13,$69,$BD,$EE,$EE,$FF,$FF,$ED,$DE,$FF,$FF,$EE,$EE,$DB,$96,$31
;.
.wave3
        db $02,$46,$8A,$CD,$EF,$FE,$DE,$FF,$EE,$DC,$BA,$98,$76,$54,$32,$10
;.
.wave4
        db $01,$23,$45,$67,$8A,$CD,$EE,$F7,$7F,$EE,$DC,$A8,$76,$54,$32,$10
;. 
; END AUDIO ENGINE END AUDIO ENGINE END AUDIO ENGINE END AUDIO ENGINE END AUDIO ENGINE END AUDIO ENGINE END AUDIO
;. ..
;..............................*
;................................*
;..................................*
;.
Music_Game_Ch1: ; declare, b6c7 (2:76c7)
        tempo 333
        volume 7, 5
        duty 3
        vibrato 1, 13, 12
        notetype 11, 13, 13
;.
;..............................*
;................................*
;..................................*
;.
Music_Game_Ch1_b0: ; acending decending
        octave 4
        C_ 1
        loopchannel 0, Music_Game_Ch1_b0
;.
;..............................*
;................................*
;..................................*
;.
Music_Game_Ch2: ; declare
        duty 2
        notetype 13, 13, 0
        vibrato 13, 2, 2
;.
;..............................*
;................................*
;..................................*
;.
Music_Game_Ch2_b0: ; controller
        rest 16
        rest 16
        rest 16
        rest 16
        callchannel Music_Game_Ch2_b1
        callchannel Music_Game_Ch2_b1
        rest 16
        rest 16
        rest 16
        rest 16
        loopchannel 0, Music_Game_Ch2_b0
;.
;..............................*
;................................*
;..................................*
;.
Music_Game_Ch2_b1: ; melody
        octave 5
        D_ 1
        C_ 3
        A_ 2
        B_ 1
        F_ 1
        A_ 2
        B_ 3
        rest 1
        endchannel
;.
;..............................*
;................................*
;..................................*
;.
Music_Game_Ch3: ; declare
	notetype 12, 1, 3
        C_ 1
        A_ 2
        B_ 3
        F_ 1
        A_ 2
        B_ 3
;.
;..............................*
;................................*
;..................................*
;.
Music_Game_Ch3_b0: ; controller
        callchannel Music_Game_Ch3_b1
        callchannel Music_Game_Ch3_b1
        callchannel Music_Game_Ch3_b1
        callchannel Music_Game_Ch3_b1
        rest 16
        rest 16
        rest 16
        rest 16
        C_ 1
        A_ 2
        B_ 3
        F_ 1
        A_ 2
        B_ 3
        callchannel Music_Game_Ch3_b1
        callchannel Music_Game_Ch3_b1
        callchannel Music_Game_Ch3_b1
        loopchannel 0, Music_Game_Ch3_b0
;.
;..............................*
;................................*
;..................................*
;.
Music_Game_Ch3_b1:
        endchannel
;.
;..............................*
;................................*
;..................................*
;.
Music_Game_Ch4: ; declare
	notetype 12, 1, 3
;.
;..............................*
;................................*
;..................................*
;.
Music_Game_Ch4_b0:
        rest 16
        rest 16
        rest 16
        rest 4
        callchannel Music_Game_Ch4_b1
        callchannel Music_Game_Ch4_b1
        callchannel Music_Game_Ch4_b1
        callchannel Music_Game_Ch4_b1
        callchannel Music_Game_Ch4_b1
        callchannel Music_Game_Ch4_b1
        callchannel Music_Game_Ch4_b1
        callchannel Music_Game_Ch4_b1
        callchannel Music_Game_Ch4_b1
        callchannel Music_Game_Ch4_b1
        callchannel Music_Game_Ch4_b1
        callchannel Music_Game_Ch4_b1
        loopchannel 0, Music_Game_Ch4_b0
;.
;..............................*
;................................*
;..................................*
;.
Music_Game_Ch4_b1:
        triangle1 1
        rest 5
        endchannel
;.
;..............................*
;................................*
;..................................*
;.
INCLUDE "audio/sfx/sfx_02_01.asm"
INCLUDE "audio/sfx/sfx_02_02.asm"
INCLUDE "audio/sfx/sfx_02_03.asm"
INCLUDE "audio/sfx/sfx_02_04.asm"
INCLUDE "audio/sfx/sfx_02_05.asm"
INCLUDE "audio/sfx/sfx_02_06.asm"
INCLUDE "audio/sfx/sfx_02_07.asm"
INCLUDE "audio/sfx/sfx_02_08.asm"
INCLUDE "audio/sfx/sfx_02_09.asm"
INCLUDE "audio/sfx/sfx_02_0a.asm"
INCLUDE "audio/sfx/sfx_02_0b.asm"
INCLUDE "audio/sfx/sfx_02_0c.asm"
INCLUDE "audio/sfx/sfx_02_0d.asm"
INCLUDE "audio/sfx/sfx_02_0e.asm"
INCLUDE "audio/sfx/sfx_02_0f.asm"
INCLUDE "audio/sfx/sfx_02_10.asm"
INCLUDE "audio/sfx/sfx_02_11.asm"
INCLUDE "audio/sfx/sfx_02_12.asm"
INCLUDE "audio/sfx/sfx_02_13.asm"
INCLUDE "audio/sfx/sfx_02_14.asm"
INCLUDE "audio/sfx/sfx_02_15.asm"
INCLUDE "audio/sfx/sfx_02_16.asm"
INCLUDE "audio/sfx/sfx_02_17.asm"
INCLUDE "audio/sfx/sfx_02_18.asm"
INCLUDE "audio/sfx/sfx_02_19.asm"
INCLUDE "audio/sfx/sfx_02_1a.asm"
INCLUDE "audio/sfx/sfx_02_1b.asm"
INCLUDE "audio/sfx/sfx_02_1c.asm"
INCLUDE "audio/sfx/sfx_02_1d.asm"
INCLUDE "audio/sfx/sfx_02_1e.asm"
INCLUDE "audio/sfx/sfx_02_1f.asm"
INCLUDE "audio/sfx/sfx_02_20.asm"
INCLUDE "audio/sfx/sfx_02_21.asm"
INCLUDE "audio/sfx/sfx_02_22.asm"
INCLUDE "audio/sfx/sfx_02_23.asm"
INCLUDE "audio/sfx/sfx_02_24.asm"
INCLUDE "audio/sfx/sfx_02_25.asm"
INCLUDE "audio/sfx/sfx_02_26.asm"
INCLUDE "audio/sfx/sfx_02_27.asm"
INCLUDE "audio/sfx/sfx_02_28.asm"
INCLUDE "audio/sfx/sfx_02_29.asm"
INCLUDE "audio/sfx/sfx_02_2a.asm"
INCLUDE "audio/sfx/sfx_02_2b.asm"
INCLUDE "audio/sfx/sfx_02_2c.asm"
INCLUDE "audio/sfx/sfx_02_2d.asm"
INCLUDE "audio/sfx/sfx_02_2e.asm"
INCLUDE "audio/sfx/sfx_02_2f.asm"
INCLUDE "audio/sfx/sfx_02_30.asm"
INCLUDE "audio/sfx/sfx_02_31.asm"
INCLUDE "audio/sfx/sfx_02_32.asm"
INCLUDE "audio/sfx/sfx_02_33.asm"
INCLUDE "audio/sfx/sfx_02_34.asm"
INCLUDE "audio/sfx/sfx_02_35.asm"
INCLUDE "audio/sfx/sfx_02_36.asm"
INCLUDE "audio/sfx/sfx_02_37.asm"
INCLUDE "audio/sfx/sfx_02_38.asm"
INCLUDE "audio/sfx/sfx_02_39.asm"
INCLUDE "audio/sfx/sfx_02_3a.asm"
INCLUDE "audio/sfx/sfx_02_3b.asm"
INCLUDE "audio/sfx/sfx_02_3c.asm"
INCLUDE "audio/sfx/sfx_02_3d.asm"
INCLUDE "audio/sfx/sfx_02_3e.asm"
INCLUDE "audio/sfx/sfx_02_3f.asm"
INCLUDE "audio/sfx/sfx_02_40.asm"
INCLUDE "audio/sfx/sfx_02_41.asm"
INCLUDE "audio/sfx/sfx_02_42.asm"
INCLUDE "audio/sfx/sfx_02_43.asm"
INCLUDE "audio/sfx/sfx_02_44.asm"
INCLUDE "audio/sfx/sfx_02_45.asm"
INCLUDE "audio/sfx/sfx_02_46.asm"
INCLUDE "audio/sfx/sfx_02_47.asm"
INCLUDE "audio/sfx/sfx_02_48.asm"
INCLUDE "audio/sfx/sfx_02_49.asm"
INCLUDE "audio/sfx/sfx_02_4a.asm"
INCLUDE "audio/sfx/sfx_02_4b.asm"
INCLUDE "audio/sfx/sfx_02_4c.asm"
INCLUDE "audio/sfx/sfx_02_4d.asm"
INCLUDE "audio/sfx/sfx_02_4e.asm"
INCLUDE "audio/sfx/sfx_02_4f.asm"
INCLUDE "audio/sfx/sfx_02_50.asm"
INCLUDE "audio/sfx/sfx_02_51.asm"
INCLUDE "audio/sfx/sfx_02_52.asm"
INCLUDE "audio/sfx/sfx_02_53.asm"
INCLUDE "audio/sfx/sfx_02_54.asm"
INCLUDE "audio/sfx/sfx_02_55.asm"
INCLUDE "audio/sfx/sfx_02_56.asm"
INCLUDE "audio/sfx/sfx_02_57.asm"
INCLUDE "audio/sfx/sfx_02_58.asm"
INCLUDE "audio/sfx/sfx_02_59.asm"
INCLUDE "audio/sfx/sfx_02_5a.asm"
INCLUDE "audio/sfx/sfx_02_5b.asm"
INCLUDE "audio/sfx/sfx_02_5c.asm"
INCLUDE "audio/sfx/sfx_02_5d.asm"
INCLUDE "audio/sfx/sfx_02_5e.asm"
INCLUDE "audio/sfx/sfx_02_5f.asm"
INCLUDE "audio/sfx/sfx_02_unused.asm"
;.
;..............................*
;................................*
;..................................*
;. end
