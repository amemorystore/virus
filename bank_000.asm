SECTION "ROM Bank $000", ROM0[$0]

RST_00::
    ret


    nop
    nop
    nop
    nop
    nop
    nop
    nop

RST_08::
    ret


    nop
    nop
    nop
    nop
    nop
    nop
    nop

RST_10::
    ret


    nop
    nop
    nop
    nop
    nop
    nop
    nop

RST_18::
    jp Jump_000_01b2


    nop
    nop
    nop
    nop
    nop

RST_20::
    ret


    nop
    nop
    nop
    nop
    nop
    nop
    nop

RST_28::
    ret


    nop
    nop
    nop
    nop
    nop
    nop
    nop

RST_30::
    ret


    nop
    nop
    nop
    nop
    nop
    nop
    nop

RST_38::
    ret


    nop
    nop
    nop
    nop
    nop
    nop
    nop

VBlankInterrupt::
    jp Jump_000_01c1


    nop
    nop
    nop
    nop
    nop

LCDCInterrupt::
    reti


    nop
    nop
    nop
    nop
    nop
    nop
    nop

TimerOverflowInterrupt::
    jp Jump_000_01fd


    nop
    nop
    nop
    nop
    nop

SerialTransferCompleteInterrupt::
    jp Jump_000_01fe


    nop
    nop
    nop
    nop
    nop

JoypadTransitionInterrupt::
    reti


    nop
    nop
    nop
    nop
    nop
    nop
    nop

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

Boot::
    nop
    jp Jump_000_0150


HeaderLogo::
    db $ce, $ed, $66, $66, $cc, $0d, $00, $0b, $03, $73, $00, $83, $00, $0c, $00, $0d
    db $00, $08, $11, $1f, $88, $89, $00, $0e, $dc, $cc, $6e, $e6, $dd, $dd, $d9, $99
    db $bb, $bb, $67, $63, $6e, $0e, $ec, $cc, $dd, $dc, $99, $9f, $bb, $b9, $33, $3e

HeaderTitle::
    db "VIRUS", $00, $00, $00, $00, $00, $00, "VIRS", $00

HeaderNewLicenseeCode::
    db $30, $31

HeaderSGBFlag::
    db $00

HeaderCartridgeType::
    db $00

HeaderROMSize::
    db $00

HeaderRAMSize::
    db $02

HeaderDestinationCode::
    db $01

HeaderOldLicenseeCode::
    db $33

HeaderMaskROMVersion::
    db $00

HeaderComplementCheck::
    db $73

HeaderGlobalChecksum::
    db $60, $c3

Jump_000_0150:
    di
    ld sp, $ffff
    xor a
    ldh [rLCDC], a
    ld hl, $c000
    ld bc, $2000
    call Call_000_0217
    ld hl, $8000
    ld bc, $2000
    call Call_000_0217
    ld hl, $fe00
    ld bc, $00a0
    call Call_000_0217
    ld hl, $ff80
    ld bc, $007d
    call Call_000_0217
    ld hl, $0da0
    ld bc, $0800
    ld de, $8000
    call Call_000_0247
    ld a, $e4
    ldh [rBGP], a
    ldh [rOBP0], a
    ldh [rOBP1], a
    call Call_000_0228
    call Call_000_0232
    ld sp, $dfff
    call Call_000_01ff
    xor a
    ld hl, $d0a0
    ld [hl+], a
    ld [hl], a
    ld a, $93
    ldh [rLCDC], a
    ld a, $01
    ldh [rIE], a
    ei
    ld a, $ba
    call $423a
    jp Jump_000_0945


Jump_000_01b2:
    sla a
    pop hl
    push de
    ld e, a
    ld d, $00
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, e
    ld h, d
    pop de
    jp hl


Jump_000_01c1:
    push af
    push bc
    push de
    push hl
    call Call_000_0274
    call Call_000_01d8
    call $4297
    ld a, $01
    ld [$c000], a
    pop hl
    pop de
    pop bc
    pop af
    reti


Call_000_01d8:
    ld a, [$d0a0]
    rst $18
    ld [c], a
    ld bc, $01e5
    ld a, [$c301]
    add b
    rst $38
    call Call_000_02d5
    call Call_000_0304
    call Call_000_0383
    call Call_000_0228
    call Call_000_0485
    call Call_000_0357
    jp $ff80


    jp $ff80


Jump_000_01fd:
    reti


Jump_000_01fe:
    reti


Call_000_01ff:
    ld c, $80
    ld b, $0a
    ld hl, $020d

jr_000_0206:
    ld a, [hl+]
    ld [c], a
    inc c
    dec b
    jr nz, jr_000_0206

    ret


    ld a, $d0
    ldh [rDMA], a
    ld a, $28

jr_000_0213:
    dec a
    jr nz, jr_000_0213

    ret


Call_000_0217:
Jump_000_0217:
    dec bc

jr_000_0218:
    ld [hl+], a
    dec bc
    bit 7, b
    jr z, jr_000_0218

    ret


jr_000_021f:
    ld a, [hl+]
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_000_021f

    ret


Call_000_0228:
    xor a
    ld hl, $d000
    ld bc, $00a0
    jp Jump_000_0217


Call_000_0232:
    ld a, $01
    ld hl, $9800
    ld bc, $0800
    jp Jump_000_0217


Call_000_023d:
    xor a
    ld hl, $d0b0
    ld bc, $003c
    jp Jump_000_0217


Call_000_0247:
Jump_000_0247:
jr_000_0247:
    ldh a, [rSTAT]
    and $03
    jr nz, jr_000_0247

    ld a, [hl+]
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_000_0247

    ret


Call_000_0256:
jr_000_0256:
    ldh a, [rSTAT]
    and $03
    jr nz, jr_000_0256

    ld a, d
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, jr_000_0256

    ret


Call_000_0264:
    ld bc, $0000
    push hl

jr_000_0268:
    ld a, [hl+]
    cp $00
    jr z, jr_000_0270

    inc bc
    jr jr_000_0268

jr_000_0270:
    pop hl
    jp Jump_000_0247


Call_000_0274:
    ld a, $20
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    and $0f
    swap a
    ld b, a
    ld a, $30
    ldh [rP1], a
    ld a, $10
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    and $0f
    or b
    cpl
    ldh [$90], a
    ret


Call_000_029c:
    xor a
    ld hl, $d0ee
    ld [hl+], a
    ld [hl], a
    ret


Call_000_02a3:
    ld hl, $d0a2
    ld a, $00
    ld [hl+], a
    ld a, $17
    ld [hl], a
    ld a, $18
    ld [$d0a4], a
    ret


Call_000_02b2:
    xor a
    ld hl, $d0b0
    ld bc, $001e
    jp Jump_000_0217


Call_000_02bc:
    ld hl, $d0a5
    ld a, $00
    ld [hl+], a
    ld a, $17
    ld [hl], a
    ld a, $18
    ld [$d0a7], a
    ret


Call_000_02cb:
    xor a
    ld hl, $d0ce
    ld bc, $001e
    jp Jump_000_0217


Call_000_02d5:
    ld a, [$d0ee]
    cp $0b
    jr c, jr_000_02e6

    push af
    ld a, $21
    ld hl, $9862
    ld [hl], a
    pop af
    sub $0b

jr_000_02e6:
    add $20
    ld hl, $9863
    ld [hl], a
    ld a, [$d0ef]
    cp $0b
    jr c, jr_000_02fd

    push af
    ld a, $21
    ld hl, $9870
    ld [hl], a
    pop af
    sub $0b

jr_000_02fd:
    add $20
    ld hl, $9871
    ld [hl], a
    ret


Call_000_0304:
    ld a, [$d0a3]
    push af
    srl a
    srl a
    srl a
    ld hl, $9800
    ld bc, $0020
    ld d, $00

jr_000_0316:
    ld [hl], $01
    and a
    jr z, jr_000_0320

    inc d
    add hl, bc
    dec a
    jr jr_000_0316

jr_000_0320:
    pop af
    and $07
    jr z, jr_000_032e

    push af
    ld e, a
    ld a, $08
    sub e
    ld e, a
    pop af
    jr jr_000_0330

jr_000_032e:
    ld e, $08

jr_000_0330:
    add $10
    ld [hl], a
    inc d
    ld a, [$d0a4]
    sub e

jr_000_0338:
    add hl, bc
    cp $08
    jr c, jr_000_0344

    sub $08
    ld [hl], $10
    inc d
    jr jr_000_0338

jr_000_0344:
    and a
    jr z, jr_000_034c

    add $18
    ld [hl], a
    inc d
    ld a, d

jr_000_034c:
    cp $12
    jr z, jr_000_0356

    add hl, bc
    ld [hl], $01
    inc a
    jr jr_000_034c

jr_000_0356:
    ret


Call_000_0357:
    ld hl, $d0b0
    ld de, $d004
    ld b, $0d

jr_000_035f:
    dec b
    ret z

    ld a, [hl+]
    and a
    jr nz, jr_000_036d

    push bc
    ld bc, $0004
    add hl, bc
    pop bc
    jr jr_000_035f

jr_000_036d:
    inc hl
    ld a, [hl+]
    add $0c
    ld [de], a
    inc de
    inc hl
    ld a, [hl+]
    add $04
    ld [de], a
    inc de
    ld a, $02
    ld [de], a
    inc de
    ld a, $00
    ld [de], a
    inc de
    jr jr_000_035f

Call_000_0383:
    ld a, [$d0a6]
    push af
    srl a
    srl a
    srl a
    ld hl, $9813
    ld bc, $0020
    ld d, $00

jr_000_0395:
    ld [hl], $01
    and a
    jr z, jr_000_039f

    inc d
    add hl, bc
    dec a
    jr jr_000_0395

jr_000_039f:
    pop af
    and $07
    jr z, jr_000_03ad

    push af
    ld e, a
    ld a, $08
    sub e
    ld e, a
    pop af
    jr jr_000_03af

jr_000_03ad:
    ld e, $08

jr_000_03af:
    add $10
    ld [hl], a
    inc d
    ld a, [$d0a7]
    sub e

jr_000_03b7:
    add hl, bc
    cp $08
    jr c, jr_000_03c3

    sub $08
    ld [hl], $10
    inc d
    jr jr_000_03b7

jr_000_03c3:
    and a
    jr z, jr_000_03cb

    add $18
    ld [hl], a
    inc d
    ld a, d

jr_000_03cb:
    cp $12
    jr z, jr_000_03d5

    add hl, bc
    ld [hl], $01
    inc a
    jr jr_000_03cb

jr_000_03d5:
    ret


Call_000_03d6:
    ld hl, $d0a8
    xor a
    ld [hl+], a
    ld a, $40
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, $50
    ld [hl+], a
    ld a, $a0
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $40
    ld [hl+], a
    ld a, $01
    ld [hl], a
    ret


Call_000_03f0:
    ld a, [$d0ee]
    inc a
    ld [$d0ee], a
    ld a, $78
    ld [$d0f1], a
    call Call_000_02a3
    call Call_000_02bc
    call Call_000_03d6
    ld hl, $d0a8
    xor a
    ld [hl+], a
    ld a, $40
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, $50
    ld [hl+], a
    ld a, $a0
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $c0
    ld [hl+], a
    ld a, $fe
    ld [hl], a
    call Call_000_023d
    call Call_000_045a
    ret


Call_000_0425:
    ld a, [$d0ef]
    inc a
    ld [$d0ef], a
    ld a, $78
    ld [$d0f1], a
    call Call_000_02a3
    call Call_000_02bc
    call Call_000_03d6
    ld hl, $d0a8
    xor a
    ld [hl+], a
    ld a, $40
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, $50
    ld [hl+], a
    ld a, $a0
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $40
    ld [hl+], a
    ld a, $01
    ld [hl], a
    call Call_000_023d
    call Call_000_045a
    ret


Call_000_045a:
    ld a, [$d0ef]
    cp $0b
    jr c, jr_000_0470

    ld a, $02
    ld [$d0f0], a
    xor a
    ld [$d0a1], a
    ld a, $02
    ld [$d0a0], a
    ret


jr_000_0470:
    ld a, [$d0ee]
    cp $0b
    ret c

    ld a, $01
    ld [$d0f0], a
    xor a
    ld [$d0a1], a
    ld a, $02
    ld [$d0a0], a
    ret


Call_000_0485:
    ld hl, $d000
    ld a, [$d0a9]
    add $0c
    ld [hl+], a
    ld a, [$d0ab]
    add $04
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $00
    ld [hl], a
    ret


Call_000_049b:
    call Call_000_04a2
    call Call_000_04ea
    ret


Call_000_04a2:
    ld a, [$d0a8]
    ld l, a
    ld a, [$d0a9]
    ld h, a
    ld a, [$d0ac]
    ld c, a
    ld a, [$d0ad]
    ld b, a
    cp $80
    jr c, jr_000_04cc

    add hl, bc
    ld a, h
    cp $dc
    jr c, jr_000_04e1

    call Call_000_05cd
    ld a, c
    ld [$d0ac], a
    ld a, b
    ld [$d0ad], a
    ld hl, $0000
    jr jr_000_04e1

jr_000_04cc:
    add hl, bc
    ld a, h
    cp $90
    jr c, jr_000_04e1

    call Call_000_05cd
    ld a, c
    ld [$d0ac], a
    ld a, b
    ld [$d0ad], a
    ld h, $90
    ld l, $00

jr_000_04e1:
    ld a, l
    ld [$d0a8], a
    ld a, h
    ld [$d0a9], a
    ret


Call_000_04ea:
    ld a, [$d0aa]
    ld l, a
    ld a, [$d0ab]
    ld h, a
    ld a, [$d0ae]
    ld c, a
    ld a, [$d0af]
    ld b, a
    cp $80
    jr c, jr_000_0564

    add hl, bc
    ld a, h
    cp $dc
    jr c, jr_000_0508

    call Call_000_0425
    ret


jr_000_0508:
    ld a, h
    sub $04
    cp $04
    jp c, Jump_000_05c4

    cp $08
    jp nc, Jump_000_05c4

    ld a, [$d0a9]
    ld e, a
    ld a, [$d0a3]
    cp e
    jp nc, Jump_000_05c4

    ld d, a
    ld a, [$d0a4]
    add d
    cp e
    jp c, Jump_000_05c4

    ld bc, $0140
    ld a, c
    ld [$d0ae], a
    ld a, b
    ld [$d0af], a
    ld a, [$d0a9]
    ld b, a
    ld a, [$d0a3]
    ld c, a
    ld a, [$d0a4]
    srl a
    add c
    cp b
    jr c, jr_000_054e

    ld a, [$d0ad]
    cp $80
    jr c, jr_000_055c

    jr jr_000_0557

jr_000_054e:
    ld a, [$d0ad]
    cp $80
    jr c, jr_000_0557

    jr jr_000_055c

jr_000_0557:
    call Call_000_084f
    jr jr_000_055f

jr_000_055c:
    call Call_000_0829

jr_000_055f:
    ld hl, $0c00
    jr jr_000_05c4

jr_000_0564:
    add hl, bc
    ld a, h
    cp $a0
    jr c, jr_000_056e

    call Call_000_03f0
    ret


jr_000_056e:
    ld a, h
    add $04
    cp $98
    jr c, jr_000_05c4

    cp $9c
    jr nc, jr_000_05c4

    ld a, [$d0a9]
    ld e, a
    ld a, [$d0a6]
    cp e
    jr nc, jr_000_05c4

    ld d, a
    ld a, [$d0a7]
    add d
    cp e
    jr c, jr_000_05c4

    ld bc, $fec0
    ld a, c
    ld [$d0ae], a
    ld a, b
    ld [$d0af], a
    ld a, [$d0a9]
    ld b, a
    ld a, [$d0a6]
    ld c, a
    ld a, [$d0a7]
    srl a
    add c
    cp b
    jr c, jr_000_05b0

    ld a, [$d0ad]
    cp $80
    jr c, jr_000_05be

    jr jr_000_05b9

jr_000_05b0:
    ld a, [$d0ad]
    cp $80
    jr c, jr_000_05b9

    jr jr_000_05be

jr_000_05b9:
    call Call_000_084f
    jr jr_000_05c1

jr_000_05be:
    call Call_000_0829

jr_000_05c1:
    ld hl, $9400

Jump_000_05c4:
jr_000_05c4:
    ld a, l
    ld [$d0aa], a
    ld a, h
    ld [$d0ab], a
    ret


Call_000_05cd:
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


Call_000_05d7:
    call Call_000_05dd
    jp Jump_000_0602


Call_000_05dd:
    ld hl, $d0b0
    ld b, $07

jr_000_05e2:
    dec b
    ret z

    ld a, [hl+]
    and a
    jr nz, jr_000_05ee

    inc hl
    inc hl
    inc hl
    inc hl
    jr jr_000_05e2

jr_000_05ee:
    inc hl
    inc hl
    push hl
    ld a, [hl+]
    ld e, a
    ld a, [hl]
    ld d, a
    ld hl, $0100
    add hl, de
    ld d, h
    ld e, l
    pop hl
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    jr jr_000_05e2

Jump_000_0602:
    ld hl, $d0ce
    ld b, $07

jr_000_0607:
    dec b
    ret z

    ld a, [hl+]
    and a
    jr nz, jr_000_0613

    inc hl
    inc hl
    inc hl
    inc hl
    jr jr_000_0607

jr_000_0613:
    inc hl
    inc hl
    push hl
    ld a, [hl+]
    ld e, a
    ld a, [hl]
    ld d, a
    ld hl, $ff00
    add hl, de
    ld d, h
    ld e, l
    pop hl
    ld a, e
    ld [hl+], a
    ld a, d
    ld [hl+], a
    jr jr_000_0607

Call_000_0627:
    call Call_000_062e
    call Call_000_0672
    ret


Call_000_062e:
    ldh a, [$90]
    bit 0, a
    jr z, jr_000_0668

    ld a, [$d0ec]
    and a
    jr nz, jr_000_0668

    ld hl, $d0b0
    ld b, $07

jr_000_063f:
    dec b
    jr z, jr_000_0668

    ld a, [hl]
    and a
    jr z, jr_000_064d

    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    jr jr_000_063f

jr_000_064d:
    ld a, $01
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [$d0a3]
    ld c, a
    ld a, [$d0a4]
    srl a
    add c
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, $0a
    ld [hl+], a
    ld a, $07
    ld [$d0ec], a
    ret


jr_000_0668:
    ld a, [$d0ec]
    and a
    ret z

    dec a
    ld [$d0ec], a
    ret


Call_000_0672:
    ld a, [$d0ed]
    and a
    jr nz, jr_000_06a6

    ld hl, $d0ce
    ld b, $07

jr_000_067d:
    dec b
    jr z, jr_000_06a6

    ld a, [hl]
    and a
    jr z, jr_000_068b

    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    jr jr_000_067d

jr_000_068b:
    ld a, $01
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, [$d0a6]
    ld c, a
    ld a, [$d0a7]
    srl a
    add c
    ld [hl+], a
    xor a
    ld [hl+], a
    ld a, $96
    ld [hl+], a
    ld a, $07
    ld [$d0ed], a
    ret


jr_000_06a6:
    ld a, [$d0ed]
    and a
    ret z

    dec a
    ld [$d0ed], a
    ret


Call_000_06b0:
    call Call_000_06b9
    call Call_000_0767
    jp Jump_000_08bd


Call_000_06b9:
    ld hl, $d0b0
    ld b, $07

Jump_000_06be:
jr_000_06be:
    dec b
    ret z

    ld a, [hl+]
    and a
    jr nz, jr_000_06ca

    inc hl
    inc hl
    inc hl
    inc hl
    jr jr_000_06be

jr_000_06ca:
    push hl
    ld a, [$d0af]
    cp $80
    jr c, jr_000_070d

    inc hl
    ld a, [hl]
    ld c, a
    ld a, [$d0a9]
    cp c
    jr c, jr_000_06de

    sub c
    jr jr_000_06e1

jr_000_06de:
    ld d, a
    ld a, c
    sub d

jr_000_06e1:
    cp $07
    jr nc, jr_000_070d

    inc hl
    inc hl
    ld a, [hl]
    ld c, a
    ld a, [$d0ab]
    cp c
    jr c, jr_000_06f2

    sub c
    jr jr_000_06f5

jr_000_06f2:
    ld d, a
    ld a, c
    sub d

jr_000_06f5:
    cp $07
    jr nc, jr_000_070d

    pop hl
    dec hl
    xor a
    ld [hl], a
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    call Call_000_084f
    call Call_000_0886
    call Call_000_0815
    jr jr_000_06be

jr_000_070d:
    pop hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    cp $a4
    jr c, jr_000_0721

    push hl
    dec hl
    dec hl
    dec hl
    dec hl
    xor a
    ld [hl], a
    pop hl
    inc hl
    jr jr_000_06be

jr_000_0721:
    cp $9c
    jr nc, jr_000_0748

    cp $98
    jr c, jr_000_0748

    dec hl
    dec hl
    ld a, [hl]
    ld c, a
    ld a, [$d0a6]
    cp c
    inc hl
    inc hl
    jr nc, jr_000_0748

    ld d, a
    ld a, [$d0a7]
    add d
    cp c
    jr c, jr_000_0748

    push hl
    dec hl
    dec hl
    dec hl
    dec hl
    xor a
    ld [hl+], a
    call Call_000_074c
    pop hl

jr_000_0748:
    inc hl
    jp Jump_000_06be


Call_000_074c:
    ld a, [$d0a6]
    ld b, a
    ld a, [$d0a7]
    sub $04
    inc b
    inc b
    cp $08
    jr nc, jr_000_075f

    dec b
    dec b
    ld a, $08

jr_000_075f:
    ld [$d0a7], a
    ld a, b
    ld [$d0a6], a
    ret


Call_000_0767:
    ld hl, $d0ce
    ld b, $07

Jump_000_076c:
jr_000_076c:
    dec b
    ret z

    ld a, [hl+]
    and a
    jr nz, jr_000_0778

    inc hl
    inc hl
    inc hl
    inc hl
    jr jr_000_076c

jr_000_0778:
    push hl
    ld a, [$d0af]
    cp $80
    jr nc, jr_000_07bb

    inc hl
    ld a, [hl]
    ld c, a
    ld a, [$d0a9]
    cp c
    jr c, jr_000_078c

    sub c
    jr jr_000_078f

jr_000_078c:
    ld d, a
    ld a, c
    sub d

jr_000_078f:
    cp $07
    jr nc, jr_000_07bb

    inc hl
    inc hl
    ld a, [hl]
    ld c, a
    ld a, [$d0ab]
    cp c
    jr c, jr_000_07a0

    sub c
    jr jr_000_07a3

jr_000_07a0:
    ld d, a
    ld a, c
    sub d

jr_000_07a3:
    cp $07
    jr nc, jr_000_07bb

    pop hl
    dec hl
    xor a
    ld [hl], a
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    call Call_000_084f
    call Call_000_0886
    call Call_000_0815
    jr jr_000_076c

jr_000_07bb:
    pop hl
    inc hl
    inc hl
    inc hl
    ld a, [hl]
    cp $fc
    jr c, jr_000_07cf

    push hl
    dec hl
    dec hl
    dec hl
    dec hl
    xor a
    ld [hl], a
    pop hl
    inc hl
    jr jr_000_076c

jr_000_07cf:
    cp $04
    jr c, jr_000_07f6

    cp $08
    jr nc, jr_000_07f6

    dec hl
    dec hl
    ld a, [hl]
    ld c, a
    ld a, [$d0a3]
    cp c
    inc hl
    inc hl
    jr nc, jr_000_07f6

    ld d, a
    ld a, [$d0a4]
    add d
    cp c
    jr c, jr_000_07f6

    push hl
    dec hl
    dec hl
    dec hl
    dec hl
    xor a
    ld [hl+], a
    call Call_000_07fa
    pop hl

jr_000_07f6:
    inc hl
    jp Jump_000_076c


Call_000_07fa:
    ld a, [$d0a3]
    ld b, a
    ld a, [$d0a4]
    sub $04
    inc b
    inc b
    cp $08
    jr nc, jr_000_080d

    dec b
    dec b
    ld a, $08

jr_000_080d:
    ld [$d0a4], a
    ld a, b
    ld [$d0a3], a
    ret


Call_000_0815:
    ld a, [$d0ae]
    ld c, a
    ld a, [$d0af]
    ld b, a
    call Call_000_05cd
    ld a, c
    ld [$d0ae], a
    ld a, b
    ld [$d0af], a
    ret


Call_000_0829:
    ld a, [$d0ac]
    ld c, a
    ld a, [$d0ad]
    ld b, a
    cp $80
    jr c, jr_000_083f

    ld a, c
    add $40
    jr nc, jr_000_083b

    inc b

jr_000_083b:
    ld c, a
    ld a, b
    jr jr_000_0846

jr_000_083f:
    ld a, c
    sub $40
    jr nc, jr_000_0845

    dec b

jr_000_0845:
    ld c, a

jr_000_0846:
    ld a, c
    ld [$d0ac], a
    ld a, b
    ld [$d0ad], a
    ret


Call_000_084f:
    ld a, [$d0ac]
    ld c, a
    ld a, [$d0ad]
    ld b, a
    cp $80
    jr c, jr_000_086d

    ld a, c
    sub $40
    jr nc, jr_000_0861

    dec b

jr_000_0861:
    ld c, a
    ld a, b
    cp $fd
    jr nc, jr_000_087d

    ld b, $fd
    ld c, $00
    jr jr_000_087d

jr_000_086d:
    ld a, c
    add $40
    jr nc, jr_000_0873

    inc b

jr_000_0873:
    ld c, a
    ld a, b
    cp $03
    jr c, jr_000_087d

    ld b, $03
    ld c, $00

jr_000_087d:
    ld a, c
    ld [$d0ac], a
    ld a, b
    ld [$d0ad], a
    ret


Call_000_0886:
    ld a, [$d0ae]
    ld c, a
    ld a, [$d0af]
    ld b, a
    cp $80
    jr c, jr_000_08a4

    ld a, c
    sub $50
    jr nc, jr_000_0898

    dec b

jr_000_0898:
    ld c, a
    ld a, b
    cp $fd
    jr nc, jr_000_08b4

    ld b, $fd
    ld c, $00
    jr jr_000_08b4

jr_000_08a4:
    ld a, c
    add $50
    jr nc, jr_000_08aa

    inc b

jr_000_08aa:
    ld c, a
    ld a, b
    cp $03
    jr c, jr_000_08b4

    ld b, $03
    ld c, $00

jr_000_08b4:
    ld a, c
    ld [$d0ae], a
    ld a, b
    ld [$d0af], a
    ret


Jump_000_08bd:
    ld hl, $d0b0
    ld a, $06
    ld [$d0f2], a

jr_000_08c5:
    ld a, [$d0f2]
    dec a
    cp $ff
    ret z

    ld [$d0f2], a
    ld a, [hl]
    and a
    jr nz, jr_000_08d9

    ld bc, $0005
    add hl, bc
    jr jr_000_08c5

jr_000_08d9:
    ld de, $d0ce
    ld a, $06
    ld [$d0f3], a
    push hl

jr_000_08e2:
    ld a, [$d0f3]
    dec a
    cp $ff
    ld [$d0f3], a
    jr nz, jr_000_08f4

    pop hl
    ld bc, $0005
    add hl, bc
    jr jr_000_08c5

jr_000_08f4:
    ld a, [de]
    and a
    jr nz, jr_000_08ff

    inc de
    inc de
    inc de
    inc de
    inc de
    jr jr_000_08e2

jr_000_08ff:
    inc hl
    inc hl
    inc de
    inc de
    ld a, [de]
    ld b, a
    ld a, [hl]
    cp b
    jr c, jr_000_090c

    sub b
    jr jr_000_090f

jr_000_090c:
    ld c, a
    ld a, b
    sub c

jr_000_090f:
    cp $05
    jr c, jr_000_091a

    dec hl
    dec hl
    inc de
    inc de
    inc de
    jr jr_000_08e2

jr_000_091a:
    inc hl
    inc hl
    inc de
    inc de
    ld a, [hl]
    ld b, a
    ld a, [de]
    sub b
    cp $05
    jr c, jr_000_092d

    dec hl
    dec hl
    dec hl
    dec hl
    inc de
    jr jr_000_08e2

jr_000_092d:
    pop hl
    dec de
    dec de
    dec de
    dec de
    xor a
    ld [hl], a
    ld [de], a
    ld bc, $0005
    add hl, bc
    jr jr_000_08c5

Call_000_093b:
    ld hl, $c000
    xor a
    ld [hl], a

jr_000_0940:
    ld a, [hl]
    and a
    jr z, jr_000_0940

    ret


Jump_000_0945:
jr_000_0945:
    call Call_000_094a
    jr jr_000_0945

Call_000_094a:
    ld a, [$d0a0]
    rst $18
    ld d, h
    add hl, bc
    ld l, h
    dec bc
    add [hl]
    inc c
    ld a, [$d0a1]
    rst $18
    ld e, h
    add hl, bc
    ld d, [hl]
    dec bc
    ld d, $01
    ld hl, $9800
    ld bc, $0400
    call Call_000_0256
    call Call_000_0228
    ld hl, $9822
    ld d, h
    ld e, l
    ld hl, $0a36
    call Call_000_0264
    ld hl, $9842
    ld d, h
    ld e, l
    ld hl, $0a47
    call Call_000_0264
    ld hl, $9862
    ld d, h
    ld e, l
    ld hl, $0a58
    call Call_000_0264
    ld hl, $9882
    ld d, h
    ld e, l
    ld hl, $0a69
    call Call_000_0264
    ld hl, $98a2
    ld d, h
    ld e, l
    ld hl, $0a7a
    call Call_000_0264
    ld hl, $98c2
    ld d, h
    ld e, l
    ld hl, $0a8b
    call Call_000_0264
    ld hl, $98e2
    ld d, h
    ld e, l
    ld hl, $0a9c
    call Call_000_0264
    ld hl, $9902
    ld d, h
    ld e, l
    ld hl, $0aad
    call Call_000_0264
    ld hl, $9922
    ld d, h
    ld e, l
    ld hl, $0abe
    call Call_000_0264
    ld hl, $9942
    ld d, h
    ld e, l
    ld hl, $0acf
    call Call_000_0264
    ld hl, $9962
    ld d, h
    ld e, l
    ld hl, $0ae0
    call Call_000_0264
    ld hl, $9982
    ld d, h
    ld e, l
    ld hl, $0af1
    call Call_000_0264
    ld hl, $99a2
    ld d, h
    ld e, l
    ld hl, $0b02
    call Call_000_0264
    ld hl, $99c2
    ld d, h
    ld e, l
    ld hl, $0b13
    call Call_000_0264
    ld hl, $99e2
    ld d, h
    ld e, l
    ld hl, $0b24
    call Call_000_0264
    ld hl, $9a02
    ld d, h
    ld e, l
    ld hl, $0b35
    call Call_000_0264
    ld hl, $9803
    ld d, h
    ld e, l
    ld hl, $0b46
    call Call_000_0264
    ld hl, $9a23
    ld d, h
    ld e, l
    ld hl, $0b4b
    call Call_000_0264
    ld a, $01
    ld [$d0a1], a
    ret


    ld [$0808], sp
    ld [$0808], sp
    ld [$0808], sp
    ld [$0808], sp
    ld [$0808], sp
    ld [$0800], sp
    ld bc, $0101
    ld d, c
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, d
    ld bc, $0101
    ld [$0800], sp
    ld bc, $5101
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, d
    ld bc, $0801
    nop
    ld [$5101], sp
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, d
    ld bc, $0008
    ld [$5551], sp
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, d
    ld [$0800], sp
    ld d, l
    ld d, l
    ld d, l
    ld c, d
    ld c, e
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld c, d
    ld c, e
    ld d, l
    ld d, l
    ld d, l
    ld [$0800], sp
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld c, [hl]
    ld d, l
    ld d, l
    ld d, l
    ld [$0800], sp
    ld d, l
    ld d, l
    ld d, l
    ld c, [hl]
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld [$0800], sp
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld [$0800], sp
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld [$0800], sp
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld c, [hl]
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld [$0800], sp
    ld d, e
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld c, h
    ld d, b
    ld c, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    ld [$0800], sp
    ld bc, $5553
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    ld bc, $0008
    ld [$0101], sp
    ld d, e
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    ld bc, $0801
    nop
    ld [$0101], sp
    ld bc, $5553
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, l
    ld d, h
    ld bc, $0101
    ld [$0800], sp
    ld [$0808], sp
    ld [$0808], sp
    ld [$0808], sp
    ld [$0808], sp
    ld [$0808], sp
    nop
    ld c, d
    ld b, h
    ld d, b
    ld c, b
    nop
    ld e, c
    ld c, h
    ld d, l
    ld e, b
    ld d, [hl]
    nop
    ld c, d
    ld b, h
    ld d, b
    ld c, b
    nop

jr_000_0b56:
    ldh a, [$90]
    bit 0, a
    jr nz, jr_000_0b60

    bit 3, a
    jr z, jr_000_0b6a

jr_000_0b60:
    xor a
    ld [$d0a1], a
    ld a, $01
    ld [$d0a0], a
    ret


jr_000_0b6a:
    jr jr_000_0b56

    ld a, [$d0a1]
    rst $18
    ld [hl], h
    dec bc
    sbc h
    dec bc
    call Call_000_029c
    call Call_000_02a3
    call Call_000_02b2
    call Call_000_02bc
    call Call_000_02cb
    call Call_000_03d6
    ld a, $78
    ld [$d0f1], a
    ld d, $01
    ld hl, $9800
    ld bc, $0400
    call Call_000_0256
    ld a, $01
    ld [$d0a1], a
    ret


    call Call_000_093b
    call Call_000_0bbd
    call Call_000_0c03
    ld a, [$d0f1]
    and a
    jr z, jr_000_0bb0

    dec a
    ld [$d0f1], a
    ret


jr_000_0bb0:
    call Call_000_0627
    call Call_000_05d7
    call Call_000_049b
    call Call_000_06b0
    ret


Call_000_0bbd:
    ldh a, [$90]
    bit 6, a
    jr nz, jr_000_0be6

    bit 7, a
    ret z

    ld a, [$d0a2]
    ld l, a
    ld a, [$d0a3]
    ld h, a
    ld bc, $0250
    add hl, bc
    push hl
    ld a, [$d0a4]
    add h
    cp $91
    pop hl
    jr c, jr_000_0bfa

    sub h
    ld b, a
    ld a, $90
    sub b
    ld h, a
    ld l, $00
    jr jr_000_0bfa

jr_000_0be6:
    ld a, [$d0a2]
    ld l, a
    ld a, [$d0a3]
    ld h, a
    ld bc, $fdb0
    add hl, bc
    ld a, h
    cp $dc
    jr c, jr_000_0bfa

    ld hl, $0000

jr_000_0bfa:
    ld a, l
    ld [$d0a2], a
    ld a, h
    ld [$d0a3], a
    ret


Call_000_0c03:
    ld a, [$d0af]
    cp $80
    jr c, jr_000_0c73

    ld a, [$d0a6]
    ld b, a
    ld a, [$d0a7]
    srl a
    add b
    cp $48
    jr c, jr_000_0c1c

    sub $48
    jr jr_000_0c20

jr_000_0c1c:
    ld b, a
    ld a, $48
    sub b

jr_000_0c20:
    cp $04
    ret c

    ld a, [$d0a6]
    ld b, a
    ld a, [$d0a7]
    srl a
    add b
    cp $48
    jr c, jr_000_0c4e

jr_000_0c31:
    ld a, [$d0a5]
    ld l, a
    ld a, [$d0a6]
    ld h, a
    ld bc, $fdb0
    add hl, bc
    ld a, h
    cp $dc
    jr c, jr_000_0c45

    xor a
    ld h, a
    ld l, a

jr_000_0c45:
    ld a, l
    ld [$d0a5], a
    ld a, h
    ld [$d0a6], a
    ret


jr_000_0c4e:
    ld a, [$d0a5]
    ld l, a
    ld a, [$d0a6]
    ld h, a
    ld bc, $0250
    add hl, bc
    ld a, [$d0a4]
    add h
    cp $91
    jr c, jr_000_0c6a

    sub h
    ld b, a
    ld a, $90
    sub b
    ld h, a
    ld l, $00

jr_000_0c6a:
    ld a, l
    ld [$d0a5], a
    ld a, h
    ld [$d0a6], a
    ret


jr_000_0c73:
    ld a, [$d0a6]
    ld b, a
    ld a, [$d0a7]
    srl a
    add b
    ld b, a
    ld a, [$d0a9]
    cp b
    jr c, jr_000_0c31

    jr jr_000_0c4e

    ld d, $01
    ld hl, $9800
    ld bc, $0400
    call Call_000_0256
    call Call_000_0228
    ld a, [$d0f0]
    cp $02
    jr z, jr_000_0cc9

    ld hl, $9903
    ld d, h
    ld e, l
    ld hl, $0d28
    call Call_000_0264
    ld hl, $9943
    ld d, h
    ld e, l
    ld hl, $0d37
    call Call_000_0264
    ld hl, $9983
    ld d, h
    ld e, l
    ld hl, $0d46
    call Call_000_0264
    ld hl, $99c3
    ld d, h
    ld e, l
    ld hl, $0d55
    call Call_000_0264
    jr jr_000_0d16

jr_000_0cc9:
    ld hl, $9903
    ld d, h
    ld e, l
    ld hl, $0d64
    call Call_000_0264
    ld hl, $9923
    ld d, h
    ld e, l
    ld hl, $0d64
    call Call_000_0264
    ld hl, $9943
    ld d, h
    ld e, l
    ld hl, $0d73
    call Call_000_0264
    ld hl, $9963
    ld d, h
    ld e, l
    ld hl, $0d64
    call Call_000_0264
    ld hl, $9983
    ld d, h
    ld e, l
    ld hl, $0d82
    call Call_000_0264
    ld hl, $99a3
    ld d, h
    ld e, l
    ld hl, $0d64
    call Call_000_0264
    ld hl, $99c3
    ld d, h
    ld e, l
    ld hl, $0d91
    call Call_000_0264

jr_000_0d16:
    ld b, $f0

jr_000_0d18:
    call Call_000_093b
    dec b
    jr nz, jr_000_0d18

    xor a
    ld [$d0a1], a
    ld a, $00
    ld [$d0a0], a
    ret


    ld c, d
    ld c, c
    ld c, [hl]
    ld d, [hl]
    ld c, l
    ld c, e
    ld c, c
    ld c, [hl]
    ld b, a
    ld d, [hl]
    ld c, d
    ld c, e
    ld c, l
    ld c, [hl]
    nop
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    nop
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    nop
    ld c, l
    ld c, e
    ld b, h
    ld c, [hl]
    ld c, l
    ld c, c
    ld c, d
    ld d, [hl]
    ld b, l
    ld d, c
    ld c, [hl]
    ld c, l
    ld c, e
    ld c, d
    nop
    ld c, d
    ld c, c
    ld c, [hl]
    ld d, [hl]
    ld c, l
    ld c, e
    ld c, c
    ld c, [hl]
    ld b, a
    ld d, [hl]
    ld c, d
    ld c, e
    ld c, l
    ld c, [hl]
    nop
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    nop
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    inc h
    nop
    ld c, l
    ld c, e
    ld b, h
    ld c, [hl]
    ld c, l
    ld c, c
    ld c, d
    ld d, [hl]
    ld b, l
    ld d, c
    ld c, [hl]
    ld c, l
    ld c, e
    ld c, d
    nop
    ld [de], a
    ld [de], a
    and h
    or h
    ld e, d
    ld a, [hl]
    dec a
    ccf
    xor h
    db $ec
    ld e, d
    ld a, [hl]
    dec h
    dec l
    ld c, b
    ld c, b
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    jr nz, jr_000_0dc5

jr_000_0dc5:
    jr nc, jr_000_0dc7

jr_000_0dc7:
    ld l, b
    nop
    ld e, b
    nop
    ld h, h
    nop
    ld a, b
    nop
    jr c, jr_000_0dd1

jr_000_0dd1:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    nop
    nop
    inc [hl]
    inc [hl]
    ld c, d
    ld c, d
    ld a, d
    ld a, d
    ld a, h
    ld a, h
    ld a, b
    ld a, b
    jr nc, jr_000_0fde

    nop
    nop
    ld bc, $4201
    ld b, d
    ld b, h
    ld b, h
    jr z, jr_000_0fe0

    inc a
    inc a
    ld e, d
    ld e, d
    ld h, [hl]
    ld h, [hl]
    nop
    nop
    nop
    nop
    jr jr_000_0fdc

    inc e
    inc e
    add hl, sp
    add hl, sp
    ld a, [hl]
    ld a, [hl]
    ld h, [hl]
    ld h, [hl]
    inc b
    inc b
    nop
    nop
    nop
    nop
    ld [$9008], sp
    sub b
    ld e, [hl]
    ld e, [hl]
    add hl, sp
    add hl, sp
    ld h, $26

jr_000_0fdc:
    inc h
    inc h

jr_000_0fde:
    jr jr_000_0ff8

jr_000_0fe0:
    nop
    nop
    nop
    nop
    ld [hl+], a
    ld [hl+], a
    ld [hl], l
    ld [hl], l
    ld a, l
    ld a, l
    ld a, $3e
    inc e
    inc e
    ld [$0008], sp
    nop
    nop
    nop
    dec de
    dec de
    dec de
    dec de

jr_000_0ff8:
    ld c, $0e
    inc b
    inc b
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, $0e
    rra
    rra
    rra
    rra
    rla
    rla
    ld c, $0e
    nop
    nop
    nop
    nop
    db $10
    db $10
    inc c
    inc c
    ld e, $1e
    ld a, [de]
    ld a, [de]
    inc l
    inc l
    ld d, h
    ld d, h
    inc a
    inc a
    inc bc
    inc bc
    nop
    jr nz, jr_000_1023

jr_000_1023:
    jr nc, jr_000_1025

jr_000_1025:
    ld l, b
    nop
    ld e, b
    nop
    ld h, h
    nop
    ld a, b
    nop
    jr c, jr_000_102f

jr_000_102f:
    nop
    nop
    ld h, b
    nop
    ret nc

    nop
    ld [hl], b
    nop
    ld [hl], h
    nop
    cp $00
    cp [hl]
    nop
    call c, $7000
    nop
    nop
    inc e
    inc e
    ld [hl+], a
    ld [hl+], a
    ld b, $06
    ld e, $1e
    inc l
    inc l
    jr jr_000_1066

    nop
    nop
    nop
    nop
    db $10
    db $10
    db $10
    db $10
    ld [$0b08], sp
    dec bc
    rrca
    rrca
    dec bc
    dec bc
    rlca
    rlca
    nop
    nop
    ld c, $0e
    add hl, de
    add hl, de

jr_000_1066:
    jr jr_000_1080

    dec e
    dec e
    adc [hl]
    adc [hl]
    add b
    add b
    nop
    nop
    nop
    nop
    inc c
    inc c
    ld a, [de]
    ld a, [de]
    ld [de], a
    ld [de], a
    db $10
    db $10
    jr nc, jr_000_10ac

    ld d, h
    ld d, h
    ld a, b
    ld a, b

jr_000_1080:
    nop
    nop
    inc c
    inc c
    ld a, [de]
    ld a, [de]
    inc a
    inc a
    ld sp, $3a31
    ld a, [hl-]
    inc e
    inc e
    nop
    nop
    nop
    nop
    add hl, de
    add hl, de
    ld h, $26
    jr nz, jr_000_10b8

    ld l, b
    ld l, b
    jr nc, jr_000_10cc

    jr nz, jr_000_10be

    jr nz, jr_000_10c0

    jr nz, jr_000_10c2

    jr jr_000_10bc

    inc a
    inc a
    inc [hl]
    inc [hl]
    ld e, b
    ld e, b
    xor b
    xor b

jr_000_10ac:
    ld a, b
    ld a, b
    ld b, $06
    db $10
    db $10
    jr nz, jr_000_10d4

    ld h, $26
    dec sp
    dec sp

jr_000_10b8:
    inc sp
    inc sp
    ld [hl+], a
    ld [hl+], a

jr_000_10bc:
    inc h
    inc h

jr_000_10be:
    nop
    nop

jr_000_10c0:
    nop
    nop

jr_000_10c2:
    ld [$0008], sp
    nop
    ld [$0808], sp
    ld [$0a0a], sp

jr_000_10cc:
    inc b
    inc b
    nop
    nop
    ld b, $06
    nop
    nop

jr_000_10d4:
    ld b, $06
    ld b, $06
    ld b, [hl]
    ld b, [hl]
    ld l, $2e
    inc e
    inc e
    nop
    nop
    nop
    nop
    db $10
    db $10
    add hl, de
    add hl, de
    ld a, [de]
    ld a, [de]
    inc e
    inc e
    inc d
    inc d
    inc de
    inc de
    nop
    nop
    inc b
    inc b
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld a, [bc]
    ld b, $06
    ld b, $06
    inc b
    inc b
    add hl, de
    add hl, de
    ld h, $26
    nop
    nop
    ld d, $16
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, hl
    ld d, d
    ld d, d
    add h
    add h
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, $06
    add hl, bc
    add hl, bc
    ld de, $2211
    ld [hl+], a
    nop
    nop
    nop
    nop
    nop
    nop
    ld c, $0e
    rra
    rra
    rra
    rra
    rla
    rla
    ld c, $0e
    nop
    nop
    nop
    nop
    nop
    nop
    ld h, [hl]
    ld h, [hl]
    add hl, de
    add hl, de
    add hl, de
    add hl, de
    ld e, [hl]
    ld e, [hl]
    jr c, jr_000_1174

    nop
    nop
    nop
    nop
    ld [$3008], sp
    jr nc, jr_000_11bd

    ld a, b
    ld e, c
    ld e, c
    ld a, [hl-]
    ld a, [hl-]
    inc c
    inc c
    inc e
    inc e
    jr c, jr_000_1188

    nop
    nop
    ld b, $06
    dec l
    dec l
    inc e
    inc e
    inc c
    inc c
    jr jr_000_1174

    jr nz, jr_000_117e

    nop
    nop
    nop
    nop
    nop
    nop
    ld e, $1e
    add hl, sp
    add hl, sp
    inc e
    inc e
    ld c, [hl]
    ld c, [hl]
    inc a
    inc a
    nop
    nop
    nop
    nop
    db $10
    db $10

jr_000_1174:
    jr c, jr_000_11ae

    db $10
    db $10
    db $10
    db $10
    ld e, $1e
    inc c
    inc c

jr_000_117e:
    nop
    nop
    nop
    nop
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    ld [hl-], a
    ld h, h
    ld h, h

jr_000_1188:
    ld l, h
    ld l, h
    inc [hl]
    inc [hl]
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld [hl], $36
    ld [hl], $36
    inc e
    inc e
    ld [$0008], sp
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    add d
    add d
    ld d, h
    ld d, h
    ld l, h
    ld l, h
    nop
    nop

jr_000_11ae:
    nop
    nop
    nop
    nop
    nop
    nop
    ld h, e
    ld h, e
    ld [hl], $36
    inc e
    inc e
    ld [hl], $36
    ld h, e

jr_000_11bd:
    ld h, e
    nop
    nop
    ld [$4408], sp
    ld b, h
    inc h
    inc h
    add hl, de
    add hl, de
    ld a, $3e
    ld e, b
    ld e, b
    jr nc, jr_000_11fe

    nop
    nop
    nop
    nop
    nop
    nop
    ld e, $1e
    inc l
    inc l
    jr jr_000_11f2

    ld sp, $6e31
    ld l, [hl]
    nop
    nop
    nop
    nop
    dec c
    dec c
    ld [de], a
    ld [de], a
    ld e, $1e
    rra
    rra
    ld e, $1e
    inc c
    inc c
    nop
    nop
    nop
    nop

jr_000_11f2:
    inc c
    inc c
    adc [hl]
    adc [hl]
    sbc h
    sbc h
    ccf
    ccf
    inc sp
    inc sp
    ld [bc], a
    ld [bc], a

jr_000_11fe:
    nop
    nop
    ld bc, $4201
    ld b, d
    ld b, h
    ld b, h
    xor b
    xor b
    inc a
    inc a
    ld e, d
    ld e, d
    ld h, [hl]
    ld h, [hl]
    nop
    nop
    nop
    nop
    ld b, l
    ld b, l
    ld [$faea], a
    ld a, [$7c7c]
    jr c, jr_000_1254

    db $10
    stop
    nop
    db $10
    db $10
    jr nz, jr_000_1244

    cp h
    cp h
    ld [hl], d
    ld [hl], d
    ld c, h
    ld c, h
    ld c, b
    ld c, b
    jr nc, jr_000_125e

    nop
    nop
    jr nc, jr_000_1262

    ld l, b
    ld l, b
    jr c, jr_000_126e

    ld a, [hl-]
    ld a, [hl-]
    ld a, a
    ld a, a
    ld e, a
    ld e, a
    ld l, [hl]
    ld l, [hl]
    jr c, @+$3a

    nop
    nop
    rrca
    rrca

jr_000_1244:
    jr jr_000_125e

    db $10
    db $10
    db $10
    db $10
    db $10
    db $10
    jr jr_000_1266

    rrca
    rrca
    nop
    nop
    cp $fe

jr_000_1254:
    ld a, a
    ld a, a
    ld a, a
    ld a, a
    ld a, a
    ld a, a
    ld a, a
    ld a, a
    ccf
    ccf

jr_000_125e:
    cp $fe
    nop
    nop

jr_000_1262:
    ld a, a
    ld a, a
    ret nz

    ret nz

jr_000_1266:
    add b
    add b
    sbc a
    sbc a
    cp a
    cp a
    rst $38
    rst $38

jr_000_126e:
    ld a, a
    ld a, a
    nop
    nop
    ldh [$e0], a
    db $10
    db $10
    ld [$c808], sp
    ret z

    add sp, -$18
    ld hl, sp-$08
    ldh a, [$f0]
    nop
    jr nz, jr_000_1283

jr_000_1283:
    jr nc, jr_000_1285

jr_000_1285:
    ld l, b
    nop
    ld e, b
    nop
    ld h, h
    nop
    ld a, b
    nop
    jr c, jr_000_128f

jr_000_128f:
    nop
    ld [de], a
    ld [de], a
    and h
    or h
    ld e, d
    ld a, [hl]
    dec a
    ccf
    xor h
    db $ec
    ld e, d
    ld a, [hl]
    dec h
    dec l
    ld c, b
    ld c, b
    cp $fe
    ld bc, $0001
    nop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    nop
    nop
    inc bc
    inc bc
    ld b, $06
    inc c
    inc c
    jr @+$1a

    jr nc, jr_000_12ea

    ld h, b
    ld h, b
    ret nz

    ret nz

    add b
    add b
    ret nz

    ret nz

    ld h, b
    ld h, b
    jr nc, jr_000_12f6

    jr jr_000_12e0

    inc c
    inc c
    ld b, $06
    inc bc
    inc bc
    ld bc, $8001
    add b
    ret nz

    ret nz

    ld h, b
    ld h, b
    jr nc, jr_000_1308

    jr jr_000_12f2

    inc c
    inc c
    ld b, $06
    inc bc
    inc bc

jr_000_12e0:
    ld bc, $0301
    inc bc
    ld b, $06
    inc c
    inc c
    jr jr_000_1302

jr_000_12ea:
    jr nc, jr_000_131c

    ld h, b
    ld h, b
    ret nz

    ret nz

    inc bc
    inc bc

jr_000_12f2:
    ld b, $06
    inc c
    inc c

jr_000_12f6:
    jr jr_000_1310

    jr nc, jr_000_132a

    ld h, b
    ld h, b
    ret nz

    ret nz

    add b
    add b
    nop
    nop

jr_000_1302:
    nop
    nop
    nop
    nop
    nop
    nop

jr_000_1308:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_000_1310:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_000_131c:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_000_132a:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ld b, [hl]
    rst $18
    and l
    adc b
    rlca
    nop
    ld bc, $093f
    nop
    nop
    ld a, [bc]
    jr nz, jr_000_15cf

    jr nz, jr_000_15e5

    jr nz, jr_000_1614

    ld h, h
    ld l, d
    ld [hl], l
    ld [hl], e
    ld [hl], h
    ld l, l
    ld h, l
    ld l, [hl]
    ld [hl], h
    ld b, l
    ld h, [hl]
    ld h, [hl]
    ld h, l
    inc l
    jr nz, jr_000_1629

    ld l, h
    ld l, a
    ld h, c
    ld [hl], h
    jr nz, jr_000_1635

    ld [hl], l
    ld l, l
    ld h, c
    ld c, a
    ld h, [hl]
    ld h, [hl]

jr_000_15cf:
    ld [hl], e
    ld l, h
    ld l, c
    ld h, l
    ld [hl], d
    inc l
    jr nz, jr_000_163d

    ld l, h
    ld l, a
    ld h, c
    ld [hl], h
    jr nz, jr_000_1640

    ld l, a
    ld l, [hl]
    ld [hl], h
    ld h, [hl]
    ld l, h
    ld l, a
    ld h, c
    ld [hl], h

jr_000_15e5:
    jr nz, @+$75

    ld h, c
    ld [hl], h
    ld [hl], l
    ld [hl], d
    ld h, c
    ld [hl], h
    ld l, c
    ld l, a
    ld l, [hl]
    ld h, l
    ld h, e
    ld [hl-], a
    jr nz, @+$65

    ld l, a
    ld l, h
    ld l, a
    ld [hl], d
    ld c, a
    ld h, [hl]
    ld h, [hl]
    ld [hl], e
    ld h, l
    ld [hl], h
    add hl, hl
    ld [hl], b
    ld l, c
    ld a, b
    ld h, l
    ld l, h
    dec sp
    ld a, [bc]
    jr nz, jr_000_1629

    jr nz, jr_000_162b

    db $76
    ld h, l
    ld h, e
    inc sp
    jr nz, jr_000_1686

    db $76
    dec sp
    ld a, [bc]

jr_000_1614:
    jr nz, jr_000_1636

    jr nz, @+$22

    ld a, [bc]
    jr nz, jr_000_163b

    jr nz, jr_000_163d

    cpl
    cpl
    jr nz, @+$76

    ld l, a
    jr nz, jr_000_1690

    ld l, c
    ld l, [hl]
    ld h, l
    ld h, c
    ld [hl], d

jr_000_1629:
    jr nz, jr_000_167d

jr_000_162b:
    ld b, a
    ld b, d
    ld a, [bc]
    jr nz, jr_000_1650

    jr z, jr_000_169b

    ld l, l
    ld h, c
    ld h, a

jr_000_1635:
    ld h, l

jr_000_1636:
    inc l
    jr nz, jr_000_16ac

    ld h, c
    ld l, l

jr_000_163b:
    ld [hl], b
    ld l, h

jr_000_163d:
    ld h, l
    ld [hl], d
    ld b, e

jr_000_1640:
    jr nz, @+$22

    ld a, [bc]
    jr nz, @+$22

    jr nz, jr_000_1667

    cpl
    cpl
    jr nz, jr_000_16ae

    ld l, a
    ld l, [hl]
    db $76
    ld h, l
    ld [hl], d

jr_000_1650:
    jr nz, jr_000_1672

    jr nz, @+$22

    ld a, c
    ld [hl], l
    db $76
    jr nz, jr_000_1696

    jr nz, jr_000_16cb

    ld l, c
    ld a, b
    ld h, l
    ld l, h
    ld l, $2d
    jr nc, @+$30

    ld sp, $3734
    inc l

jr_000_1667:
    jr nz, jr_000_1699

    ld l, $36
    ld sp, $2935
    jr nz, jr_000_169b

    jr nc, @+$30

jr_000_1672:
    dec [hl]
    jr c, jr_000_16ac

    inc l
    jr nz, @+$2f

    jr nc, jr_000_16a8

    ld [hl-], a
    jr c, jr_000_16b6

jr_000_167d:
    inc l
    jr nz, @+$2f

    jr nz, jr_000_16ac

    jr nz, @+$78

    ld h, l
    ld h, e

jr_000_1686:
    inc sp
    jr z, jr_000_16b9

    ld l, $31
    ld sp, $2c34
    jr nz, jr_000_16c0

jr_000_1690:
    jr nz, jr_000_16b2

    jr nz, @+$0c

    jr nz, jr_000_16b6

jr_000_1696:
    jr nz, jr_000_16b8

    ld a, c

jr_000_1699:
    ld [hl], l
    db $76

jr_000_169b:
    ld l, $72
    jr nz, jr_000_16dc

    jr nz, jr_000_16c1

    ld a, [bc]
    jr nz, @+$22

    jr nz, jr_000_16c6

    ld l, e
    ld h, l

jr_000_16a8:
    ld [hl], d
    ld l, [hl]
    ld h, l
    ld l, h

jr_000_16ac:
    jr nz, jr_000_1724

jr_000_16ae:
    ld h, l
    ld h, e
    ld h, e
    ld [hl], h

jr_000_16b2:
    jr z, jr_000_1727

    ld h, c
    ld l, l

jr_000_16b6:
    ld [hl], b
    ld l, h

jr_000_16b8:
    ld h, l

jr_000_16b9:
    ld [hl], d
    jr nz, jr_000_1725

    ld l, l
    ld h, c
    ld h, a
    ld h, l

jr_000_16c0:
    ld h, l

jr_000_16c1:
    ld [hl], h
    inc l
    jr nz, jr_000_172b

    ld l, h

jr_000_16c6:
    ld l, a
    ld h, c
    ld [hl], h
    jr nz, jr_000_1738

jr_000_16cb:
    ld [hl], l
    ld l, h
    ld [hl], h
    ld l, c
    ld [hl], b
    ld [hl], d
    ld h, c
    ld [hl], e
    ld [hl], h
    ld c, l
    ld [hl], l
    ld l, h
    ld [hl], h
    ld l, c
    ld [hl], b
    ld l, h
    ld l, c

jr_000_16dc:
    ld h, l
    ld [hl], d
    inc l
    jr nz, jr_000_170d

    jr nz, jr_000_1749

    ld l, h
    ld l, a
    ld h, c
    ld [hl], h
    jr nz, jr_000_1750

    ld h, c
    ld l, l
    ld l, l
    ld h, c
    inc l
    jr nz, jr_000_1766

    ld a, [bc]
    jr nz, jr_000_1713

    jr nz, jr_000_1715

    ld a, e
    ld a, [bc]
    jr nz, jr_000_1719

    jr nz, jr_000_171b

    db $76
    ld h, l
    ld h, e
    inc [hl]
    jr nz, jr_000_1768

    ld [hl], d
    ld h, c
    ld a, c
    dec sp
    ld a, [bc]
    jr nz, @+$22

    jr nz, @+$22

    db $76
    ld h, l
    ld h, e

jr_000_170d:
    inc sp
    jr nz, jr_000_1789

    ld h, a
    ld h, c
    ld l, l

jr_000_1713:
    ld l, l
    ld h, c

jr_000_1715:
    jr nz, jr_000_177a

    ld l, a
    ld [hl], d

jr_000_1719:
    ld [hl], d
    ld h, l

jr_000_171b:
    ld h, e
    ld [hl], h
    jr nz, @+$6b

    ld l, [hl]
    jr nz, @+$22

    ld [hl], b
    ld l, c

jr_000_1724:
    ld a, b

jr_000_1725:
    ld h, l
    ld l, h

jr_000_1727:
    jr nz, jr_000_1766

    jr nz, jr_000_179e

jr_000_172b:
    ld h, c
    ld l, l
    ld [hl], b
    ld l, h
    ld h, l
    ld l, a
    ld l, a
    ld [hl], d
    ld h, h
    jr z, @+$6b

    ld l, l
    ld h, c

jr_000_1738:
    ld h, a
    ld h, l
    add hl, hl
    add hl, hl
    dec sp
    ld a, [bc]
    jr nz, @+$22

    ld [hl], h
    jr nz, @+$76

    ld l, a
    jr nz, jr_000_17b2

    ld l, c
    ld l, [hl]
    ld h, l

jr_000_1749:
    ld h, c
    ld [hl], d
    jr nz, jr_000_17a6

    ld [hl], l
    db $76
    ld a, [bc]

jr_000_1750:
    ld [hl], d
    jr nz, jr_000_177d

    jr nz, jr_000_17cb

    ld h, l
    ld h, e
    inc sp
    jr z, @+$32

    ld l, $32
    add hl, sp
    add hl, sp
    inc l
    jr nz, @+$22

    ld [hl], b
    ld l, c
    ld a, b
    ld h, l
    ld l, h

jr_000_1766:
    ld l, $67

jr_000_1768:
    jr nz, @+$2c

    jr nz, jr_000_17e2

    ld h, l
    ld h, e
    inc sp
    jr z, @+$32

    ld l, $35
    ld sp, $2935
    jr nz, @+$2d

    jr nz, jr_000_17ea

jr_000_177a:
    ld l, c
    ld a, b
    ld h, l

jr_000_177d:
    ld l, h
    ld l, $62
    ld l, $34
    inc sp
    ld [hl], $2c
    jr nz, jr_000_17b4

    jr nc, @+$30

jr_000_1789:
    ld sp, $3030
    add hl, hl
    dec sp
    ld a, [bc]
    jr nz, jr_000_1801

    ld l, a
    ld [hl], a
    jr z, jr_000_180e

    ld [hl], l
    db $76
    ld l, $72
    inc l
    jr nz, jr_000_17cd

    ld l, $30

jr_000_179e:
    jr nz, jr_000_17cf

    jr nz, jr_000_17d4

    ld l, $32
    add hl, hl
    dec sp

jr_000_17a6:
    ld a, [bc]
    jr nz, jr_000_17c9

    jr nz, jr_000_17cb

    ld a, [bc]
    jr nz, jr_000_17ce

    jr nz, jr_000_17d0

    ld [hl], l
    db $76

jr_000_17b2:
    ld l, $72

jr_000_17b4:
    jr nz, jr_000_17e1

    jr nz, jr_000_1824

    ld [hl], l
    ld l, l
    ld h, c
    ld c, a
    ld h, [hl]
    ld h, [hl]
    ld [hl], e
    ld h, l
    jr nz, jr_000_17f2

    ld l, $30
    inc l
    jr nz, jr_000_17f8

    ld l, $30

jr_000_17c9:
    add hl, hl
    dec sp

jr_000_17cb:
    add hl, bc
    add hl, bc

jr_000_17cd:
    add hl, bc

jr_000_17ce:
    cpl

jr_000_17cf:
    cpl

jr_000_17d0:
    ld [hl], e
    ld h, e
    ld h, c
    ld l, h

jr_000_17d4:
    ld h, l
    jr nz, jr_000_184b

    ld l, a
    jr nz, jr_000_1846

    ld [hl], l
    ld l, l
    ld h, c
    jr nz, jr_000_1853

    ld h, l
    ld h, c

jr_000_17e1:
    ld [hl], e

jr_000_17e2:
    ld [hl], h
    jr nz, jr_000_1846

    ld h, h
    ld l, d
    ld [hl], l
    ld [hl], e
    ld [hl], h

jr_000_17ea:
    ld l, l
    ld h, l
    ld l, [hl]
    ld [hl], h
    add hl, hl
    ld a, [bc]
    ld a, c
    ld [hl], l

jr_000_17f2:
    db $76
    ld l, $72
    inc l
    jr nz, jr_000_1871

jr_000_17f8:
    ld [hl], l
    db $76
    ld l, $72
    ld a, [hl+]
    ld a, c
    ld [hl], l
    db $76
    db $76

jr_000_1801:
    ld l, $72
    add hl, hl
    inc l
    jr nz, jr_000_186a

    ld l, a
    ld l, [hl]
    ld [hl], h
    ld [hl], d
    ld h, c
    ld [hl], e
    ld [hl], h

jr_000_180e:
    ld c, l
    ld [hl], l
    ld [hl], b
    ld l, h
    ld a, c
    jr nz, jr_000_1878

    ld l, a
    ld l, [hl]
    ld [hl], h
    ld [hl], d
    ld h, c
    ld [hl], e
    ld [hl], h
    jr nz, @+$65

    ld [hl], l
    ld [hl], d
    ld l, a
    ld l, [hl]
    ld [hl], h
    ld [hl], d

jr_000_1824:
    ld h, c
    ld [hl], e
    ld [hl], h
    jr nz, jr_000_188a

    ld h, h
    ld l, d
    ld [hl], l
    ld [hl], e
    ld [hl], h
    ld l, l
    ld h, l
    ld l, $67
    ld h, d
    jr nz, jr_000_1860

    dec a
    jr nz, jr_000_18a5

    ld l, c
    ld a, b
    jr z, jr_000_18b2

    ld h, l
    ld h, e
    ld [hl-], a
    jr z, @+$76

    inc l
    jr nz, jr_000_18bd

    ld [hl], l
    db $76

jr_000_1846:
    ld l, $72
    add hl, hl
    dec sp
    add hl, bc

jr_000_184b:
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    cpl
    jr nz, jr_000_18c5

    ld h, e

jr_000_1853:
    ld h, c
    ld l, h
    ld h, l
    jr nz, @+$76

    ld l, a
    jr nz, jr_000_18be

    ld l, b
    ld [hl], d
    ld l, a
    ld l, l
    ld h, c

jr_000_1860:
    ld h, d
    jr nz, jr_000_188d

    dec a
    jr nz, jr_000_18d9

    ld h, c
    ld [hl], h
    ld [hl], l
    ld [hl], d

jr_000_186a:
    ld h, c
    ld [hl], h
    ld l, c
    ld l, a
    ld l, [hl]
    dec sp
    dec a

jr_000_1871:
    jr nz, @+$72

    ld l, a
    ld [hl], a
    jr z, @+$7b

    ld [hl], l

jr_000_1878:
    db $76
    ld l, $72
    inc l
    jr nz, jr_000_18b0

    ld l, $32
    jr nz, jr_000_18a2

    jr nz, @+$22

    cpl
    cpl
    jr nz, jr_000_18eb

    ld l, a
    ld l, [hl]

jr_000_188a:
    db $76
    ld h, l
    ld [hl], d

jr_000_188d:
    ld [hl], h
    jr nz, jr_000_18f2

    ld b, d
    ld a, [bc]
    jr nz, jr_000_18b4

    jr nz, jr_000_18b6

    ld h, a
    ld [hl], d
    ld h, c
    ld a, c
    jr nz, jr_000_18d9

    jr nz, jr_000_1914

    ld h, l
    ld h, e
    ld a, c
    ld [hl], l

jr_000_18a2:
    db $76
    ld l, $72

jr_000_18a5:
    jr nz, jr_000_18e4

    jr nz, jr_000_190c

    ld l, h
    ld h, c
    ld l, l
    ld [hl], b
    jr z, jr_000_18d7

    ld a, c

jr_000_18b0:
    ld [hl], h
    add hl, hl

jr_000_18b2:
    jr nz, jr_000_18de

jr_000_18b4:
    jr nz, jr_000_1923

jr_000_18b6:
    ld [hl], l
    ld l, h
    ld [hl], h
    ld l, c
    ld [hl], b
    ld l, h
    ld l, c

jr_000_18bd:
    ld h, l

jr_000_18be:
    ld [hl], d
    inc l
    jr nz, jr_000_1923

    ld [hl], b
    ld [hl], b
    ld l, h

jr_000_18c5:
    ld a, c
    jr nz, @+$64

    ld l, c
    ld h, c
    ld [hl], e
    jr nz, jr_000_192e

    ld l, [hl]
    ld h, h
    jr nz, jr_000_1943

    ld l, l
    jr nz, @+$2a

    ld l, h
    ld l, c
    ld l, [hl]

jr_000_18d7:
    ld h, l
    ld h, c

jr_000_18d9:
    ld [hl], d
    jr nz, jr_000_193f

    ld l, a
    ld l, [hl]

jr_000_18de:
    ld [hl], h
    ld [hl], d
    jr nz, jr_000_1902

    jr nz, jr_000_1904

jr_000_18e4:
    ld a, c
    ld [hl], l
    db $76
    ld l, $72
    jr nz, jr_000_1928

jr_000_18eb:
    jr nz, @+$6f

    ld l, c
    ld a, b
    jr z, @+$30

    ld [hl], d

jr_000_18f2:
    ld a, [hl+]
    jr z, jr_000_1928

    ld l, $30
    jr nz, jr_000_1926

    jr nz, jr_000_192d

    ld l, $30
    ld a, [hl+]
    ld a, c
    ld [hl], l
    ld l, h
    ld [hl], h

jr_000_1902:
    ld l, c
    ld [hl], b

jr_000_1904:
    ld l, h
    ld l, c
    ld h, l
    ld [hl], d
    add hl, hl
    dec sp
    add hl, bc
    cpl

jr_000_190c:
    cpl
    jr nz, @+$63

    ld [hl], b
    db $76
    ld h, l
    jr nz, jr_000_193c

jr_000_1914:
    ld l, [hl]
    ld l, a
    ld l, [hl]
    dec l
    ld l, h
    ld l, c
    ld l, [hl]
    ld h, l
    ld h, c
    ld [hl], d
    jr nz, jr_000_1983

    ld l, [hl]
    ld [hl], h
    add hl, hl

jr_000_1923:
    ld a, [bc]
    jr nz, jr_000_1946

jr_000_1926:
    jr nz, @+$22

jr_000_1928:
    ld a, [bc]
    jr nz, jr_000_194b

    jr nz, @+$22

jr_000_192d:
    ld a, c

jr_000_192e:
    ld [hl], l
    db $76
    jr nc, jr_000_1960

    jr nc, jr_000_195d

    inc l
    jr nz, jr_000_199a

    ld l, a
    ld l, h
    ld l, a
    ld [hl], d
    ld c, a

jr_000_193c:
    ld h, [hl]
    ld h, [hl]
    ld [hl], e

jr_000_193f:
    ld h, l
    cpl
    jr nz, @+$63

jr_000_1943:
    ld [hl], b
    ld [hl], b
    ld l, h

jr_000_1946:
    ld a, c
    jr nz, jr_000_19ab

    ld l, c
    ld h, c

jr_000_194b:
    ld [hl], e
    jr nz, @+$63

    ld l, [hl]
    ld h, h
    jr nz, jr_000_19c6

    ld h, l
    ld [hl], d
    ld l, l
    ld [hl], e
    ld a, [bc]
    jr nz, jr_000_1979

    jr nz, jr_000_197b

    ld a, c
    ld [hl], l

jr_000_195d:
    db $76
    ld l, $67

jr_000_1960:
    ld a, [bc]
    jr nz, jr_000_1983

    jr nz, jr_000_1985

    ld a, [bc]
    jr nz, jr_000_1988

    jr nz, jr_000_198a

    ld a, c
    ld [hl], l
    db $76
    ld l, $72
    jr nz, jr_000_1991

    ld a, [hl+]
    jr nz, jr_000_19db

    ld h, c
    ld l, l
    ld l, l
    ld h, c
    add hl, hl

jr_000_1979:
    dec sp
    ld a, [bc]

jr_000_197b:
    jr nz, @+$22

    jr nz, jr_000_199f

    ld a, [bc]
    ld h, c
    ld h, e
    ld l, e

jr_000_1983:
    jr nz, jr_000_19f9

jr_000_1985:
    ld l, a
    jr nz, jr_000_19f4

jr_000_1988:
    ld l, c
    ld l, [hl]

jr_000_198a:
    ld h, l
    ld h, c
    ld [hl], d
    jr nz, jr_000_19e1

    ld b, a
    inc sp

jr_000_1991:
    jr z, @+$7b

    ld [hl], l
    db $76
    ld l, $72
    add hl, hl
    dec sp
    ld a, [bc]

jr_000_199a:
    jr nz, jr_000_19bc

    jr nz, jr_000_19be

    ld [hl], b

jr_000_199f:
    ld l, c
    ld a, b
    ld h, l
    ld l, h
    ld l, $72
    ld h, a
    ld h, d
    jr nz, jr_000_19e6

    jr nz, jr_000_1a12

jr_000_19ab:
    ld [hl], d
    ld h, c
    ld a, c
    jr nz, jr_000_19db

    jr nc, jr_000_19de

    jr nz, jr_000_19e1

    jr nc, jr_000_19e4

    inc sp
    add hl, sp
    dec [hl]
    inc l
    jr nz, jr_000_19ee

jr_000_19bc:
    ld l, $30

jr_000_19be:
    inc sp
    ld [hl-], a
    jr z, jr_000_19f3

    ld l, $31
    inc [hl]
    inc l

jr_000_19c6:
    jr nz, jr_000_19f5

    jr nc, jr_000_19f8

    dec [hl]
    jr c, jr_000_19fe

    inc l
    jr nz, jr_000_1a00

    ld [hl], h
    ld [hl], l
    ld [hl], d
    ld l, [hl]
    jr nz, jr_000_1a46

    ld l, c
    ld a, b
    ld h, l
    ld l, h
    dec sp

jr_000_19db:
    ld a, [bc]
    jr nz, jr_000_19fe

jr_000_19de:
    jr nz, jr_000_1a00

    ld l, h

jr_000_19e1:
    jr nz, jr_000_1a59

    ld h, l

jr_000_19e4:
    ld h, e
    inc [hl]

jr_000_19e6:
    jr nz, @+$74

    ld h, a
    ld h, d
    ld c, l
    ld [hl], l
    ld l, h
    ld [hl], h

jr_000_19ee:
    ld l, c
    ld [hl], b
    inc l
    jr nz, jr_000_1a69

jr_000_19f3:
    ld h, l

jr_000_19f4:
    ld h, e

jr_000_19f5:
    inc sp
    jr nz, jr_000_1a57

jr_000_19f8:
    ld [hl], d

jr_000_19f9:
    ld h, a
    ld h, d
    ld c, l
    ld [hl], l
    ld l, h

jr_000_19fe:
    ld [hl], h
    ld l, c

jr_000_1a00:
    ld h, l
    ld h, e
    inc [hl]
    jr nz, jr_000_1a75

    ld l, c
    ld a, b
    ld h, l
    ld l, h
    dec sp
    ld a, [bc]
    jr nz, jr_000_1a2d

    jr nz, @+$22

    ld a, [bc]
    ld l, h
    ld h, l

jr_000_1a12:
    jr z, jr_000_1a7d

    ld l, l
    ld h, c
    ld h, a
    ld h, l
    inc l
    jr nz, jr_000_1a8e

    ld h, c
    ld l, l
    ld [hl], b
    ld l, h
    ld h, l
    jr nz, @+$22

    jr nz, @+$22

    ld a, [bc]
    jr nz, @+$22

    jr nz, @+$22

    ld [hl], b
    ld l, c
    ld a, b
    ld h, l

jr_000_1a2d:
    ld l, h
    ld l, $72
    ld l, h
    ld a, c
    dec sp
    ld a, [bc]
    jr nz, jr_000_1a56

    jr nz, jr_000_1a58

    ld a, [bc]
    jr nz, jr_000_1a5b

    jr nz, jr_000_1a5d

    ld [hl], d
    ld h, l
    ld [hl], h
    ld a, [bc]
    jr nz, jr_000_1a63

    jr nz, jr_000_1a65

    ld a, [bc]

jr_000_1a46:
    jr nz, jr_000_1a68

    jr nz, jr_000_1a6a

    ld l, e
    ld h, l
    ld [hl], d
    ld l, [hl]
    ld h, l
    ld l, h
    ld b, l
    ld h, [hl]
    ld h, [hl]
    ld h, l
    ld h, e
    ld [hl], h

jr_000_1a56:
    ld d, b

jr_000_1a57:
    ld [hl], d

jr_000_1a58:
    ld l, a

jr_000_1a59:
    jr z, jr_000_1a7b

jr_000_1a5b:
    ld [hl], e
    ld h, c

jr_000_1a5d:
    ld l, l
    ld [hl], b
    ld l, h
    ld l, h
    ld l, c
    ld h, [hl]

jr_000_1a63:
    ld [hl], h
    inc l

jr_000_1a65:
    jr nz, @+$68

    ld l, h

jr_000_1a68:
    ld l, a

jr_000_1a69:
    ld h, c

jr_000_1a6a:
    ld [hl], h
    jr nz, jr_000_1acc

    ld h, a
    ld h, c
    ld l, c
    ld [hl], e
    ld [hl], h
    inc l
    jr nz, jr_000_1adb

jr_000_1a75:
    ld l, h
    ld l, a
    ld h, c
    ld [hl], h
    jr nz, jr_000_1aee

jr_000_1a7b:
    ld h, c
    ld [hl], h

jr_000_1a7d:
    ld [hl], l
    ld [hl], d
    ld h, c
    ld h, c
    inc l
    jr nz, jr_000_1afa

    ld h, l
    ld h, e
    ld [hl-], a
    jr nz, jr_000_1aec

    ld l, a
    ld l, h
    ld l, a
    ld [hl], d
    ld c, a

jr_000_1a8e:
    ld h, [hl]
    ld h, [hl]
    db $76
    ld h, l
    ld h, e
    inc [hl]
    jr nz, jr_000_1b06

    ld l, c
    ld a, b
    ld h, l
    ld l, h
    dec sp
    ld a, [bc]
    jr nz, jr_000_1abe

    jr nz, jr_000_1ac0

    jr nz, jr_000_1b1b

    ld [hl], l
    db $76
    ld l, $67
    jr nz, jr_000_1ad2

    jr nz, jr_000_1b20

    ld h, l
    ld h, e
    inc sp
    jr z, jr_000_1adf

    ld l, $29
    jr nz, jr_000_1ade

    jr nz, jr_000_1b2e

    ld [hl], l
    db $76
    ld l, $62
    jr nz, jr_000_1ae5

    jr nz, jr_000_1b33

    ld h, l

jr_000_1abe:
    ld h, e
    inc sp

jr_000_1ac0:
    ld l, $30
    add hl, hl
    dec sp
    ld a, [bc]
    jr nz, jr_000_1ae7

    jr nz, jr_000_1ae9

    ld a, [bc]
    jr nz, jr_000_1aec

jr_000_1acc:
    jr nz, jr_000_1aee

    ld [hl], d
    ld h, l
    ld a, l
    ld a, [bc]

jr_000_1ad2:
    jr nz, jr_000_1af4

    jr nz, @+$22

    ld a, [bc]
    jr nz, jr_000_1af9

    jr nz, jr_000_1afb

jr_000_1adb:
    ld l, e
    ld h, l
    ld [hl], d

jr_000_1ade:
    ld l, [hl]

jr_000_1adf:
    ld h, l
    ld l, h
    ld a, c
    jr z, jr_000_1b57

    ld h, c

jr_000_1ae5:
    ld l, l
    ld [hl], b

jr_000_1ae7:
    ld l, h
    ld h, l

jr_000_1ae9:
    ld [hl], d
    jr nz, jr_000_1b55

jr_000_1aec:
    ld l, l
    ld h, c

jr_000_1aee:
    ld h, a
    ld h, l
    ld [hl], b
    ld l, h
    ld a, c
    add hl, hl

jr_000_1af4:
    ld a, [bc]
    jr nz, @+$22

    jr nz, jr_000_1b19

jr_000_1af9:
    ld a, e

jr_000_1afa:
    ld a, [bc]

jr_000_1afb:
    jr nz, jr_000_1b1d

    jr nz, jr_000_1b1f

    db $76
    jr nz, jr_000_1b22

    jr nz, jr_000_1b24

    ld [hl], b
    ld l, c

jr_000_1b06:
    ld a, b
    ld h, l
    ld l, h
    jr nz, jr_000_1b48

    jr nz, jr_000_1b80

    ld h, c
    ld l, l
    ld [hl], b
    ld [hl], d
    ld b, e
    ld l, a
    ld l, a
    ld [hl], d
    ld h, h
    jr z, jr_000_1b81

    ld l, l

jr_000_1b19:
    ld h, c
    ld h, a

jr_000_1b1b:
    ld h, l
    add hl, hl

jr_000_1b1d:
    add hl, hl
    dec sp

jr_000_1b1f:
    ld a, [bc]

jr_000_1b20:
    ld h, a
    ld h, d

jr_000_1b22:
    jr nz, jr_000_1b4e

jr_000_1b24:
    dec a
    jr nz, jr_000_1b86

    ld [hl], d
    ld h, a
    ld h, d
    ld c, l
    ld [hl], l
    ld l, h
    ld [hl], h

jr_000_1b2e:
    ld l, c
    ld [hl], b
    ld [hl], l
    ld [hl], d
    ld l, [hl]

jr_000_1b33:
    jr nz, jr_000_1ba5

    ld l, c
    ld a, b
    ld h, l
    ld l, h
    dec sp
    ld a, [bc]
    jr nz, jr_000_1b5d

    jr nz, jr_000_1b5f

    ld a, l
    jr nz, jr_000_1bb8

    ld h, l
    ld h, e
    inc [hl]
    jr nz, jr_000_1ba8

    ld h, h

jr_000_1b48:
    ld l, d
    ld [hl], l
    ld [hl], e
    ld [hl], h
    ld l, l
    ld h, l

jr_000_1b4e:
    ld l, [hl]
    ld [hl], h
    ld h, l
    ld [hl], d
    jr nz, jr_000_1bbd

    ld l, l

jr_000_1b55:
    ld h, c
    ld h, a

jr_000_1b57:
    ld h, l
    inc l
    jr nz, jr_000_1bc1

    ld l, h
    ld l, a

jr_000_1b5d:
    ld h, c
    ld [hl], h

jr_000_1b5f:
    jr nz, @+$70

    inc l
    jr nz, jr_000_1bca

    ld l, h
    ld l, a
    ld h, c
    ld [hl], h
    jr nz, jr_000_1bc9

    ld h, e
    ld l, a
    ld l, [hl]
    ld [hl], h
    ld [hl], d
    ld h, c
    ld [hl], h
    ld l, c
    ld l, a
    ld l, [hl]
    inc l
    jr nz, jr_000_1bdd

    ld l, h
    ld l, a
    ld h, c
    ld [hl], h
    jr nz, jr_000_1be4

    ld h, c
    ld l, l
    ld l, l

jr_000_1b80:
    ld [hl], e

jr_000_1b81:
    ld h, l
    ld [hl], h
    jr nz, jr_000_1bae

    ld a, [bc]

jr_000_1b86:
    jr nz, jr_000_1ba8

    jr nz, @+$22

    ld a, e
    ld a, [bc]
    jr nz, jr_000_1bae

    jr nz, jr_000_1bb0

    db $76
    ld h, l
    ld h, e
    inc sp
    jr nz, @+$7b

    ld [hl], l
    db $76
    inc l
    jr nz, jr_000_1c02

    ld [hl], d
    ld h, c
    ld a, c
    dec sp
    ld a, [bc]
    jr nz, jr_000_1bc2

    jr nz, jr_000_1bc4

    ld h, [hl]

jr_000_1ba5:
    ld l, h
    ld l, a
    ld h, c

jr_000_1ba8:
    ld [hl], h
    jr nz, jr_000_1c0e

    ld l, a
    ld l, [hl]
    ld [hl], h

jr_000_1bae:
    ld [hl], d
    ld h, c

jr_000_1bb0:
    ld h, c
    ld [hl], e
    ld [hl], h
    inc l
    jr nz, @+$61

    ld h, e
    ld l, a

jr_000_1bb8:
    ld l, [hl]
    ld [hl], h
    ld [hl], d
    ld h, c
    ld [hl], e

jr_000_1bbd:
    ld [hl], h
    jr nz, jr_000_1bea

    ld h, c

jr_000_1bc1:
    ld a, b

jr_000_1bc2:
    jr z, jr_000_1be4

jr_000_1bc4:
    ld e, a
    ld h, a
    ld h, c
    ld l, c
    ld l, [hl]

jr_000_1bc9:
    inc l

jr_000_1bca:
    jr nz, jr_000_1c3c

    ld l, a
    ld [hl], a
    jr z, jr_000_1bf0

    jr nz, jr_000_1bf2

    jr nz, jr_000_1bde

    jr nz, jr_000_1bf6

    jr nz, @+$22

    cpl
    cpl
    jr nz, jr_000_1c43

    ld h, l

jr_000_1bdd:
    ld [hl], h

jr_000_1bde:
    jr nz, jr_000_1c54

    ld h, l
    ld l, h
    jr nz, jr_000_1c21

jr_000_1be4:
    jr nz, @+$75

    ld h, c
    ld l, l
    ld [hl], b
    ld l, h

jr_000_1bea:
    ld h, l
    jr z, @+$22

    ld l, c
    ld l, l
    ld h, c

jr_000_1bf0:
    jr z, jr_000_1c12

jr_000_1bf2:
    ld l, c
    ld l, l
    ld h, c
    ld h, a

jr_000_1bf6:
    ld h, l
    jr nz, jr_000_1c22

    add hl, hl
    dec sp
    ld a, [bc]
    jr nz, jr_000_1c1e

    jr nz, jr_000_1c20

    ld l, h
    ld [hl], l

jr_000_1c02:
    ld l, l
    ld h, c
    ld a, [bc]
    jr nz, @+$22

    jr nz, @+$22

    ld a, c
    ld [hl], l
    db $76
    jr nz, jr_000_1c4b

jr_000_1c0e:
    jr nz, jr_000_1c80

    ld [hl-], a
    add hl, sp

jr_000_1c12:
    add hl, sp
    inc l
    jr nz, jr_000_1c43

    jr nc, jr_000_1c46

    ld sp, $3734
    inc l
    jr nz, jr_000_1c4e

jr_000_1c1e:
    ld l, $36

jr_000_1c20:
    db $76

jr_000_1c21:
    ld h, l

jr_000_1c22:
    ld h, e
    inc sp
    jr z, @+$32

    ld l, $35
    jr c, jr_000_1c61

    inc l
    jr nz, jr_000_1c5a

    jr nc, jr_000_1c5d

    ld [hl-], a
    ld a, b
    ld h, l
    ld l, h
    ld l, $62
    jr nz, jr_000_1c61

    jr nz, jr_000_1caf

    ld h, l
    ld h, e
    inc sp

jr_000_1c3c:
    jr z, jr_000_1c6e

    ld l, $31
    jr nc, @+$2b

    dec sp

jr_000_1c43:
    ld a, [bc]
    jr nz, jr_000_1c66

jr_000_1c46:
    jr nz, jr_000_1c68

    ld a, c
    ld [hl], l
    db $76

jr_000_1c4b:
    ld l, $67
    ld h, d

jr_000_1c4e:
    jr nz, jr_000_1c7a

    jr nz, jr_000_1c72

    ld a, c
    ld [hl], l

jr_000_1c54:
    db $76
    ld l, $67
    ld h, d
    jr nz, @+$2d

jr_000_1c5a:
    dec a
    jr nz, jr_000_1cca

jr_000_1c5d:
    ld l, c
    ld a, b
    jr z, jr_000_1ccd

jr_000_1c61:
    ld l, a
    ld [hl], d
    ld c, a
    ld h, [hl]
    ld h, [hl]

jr_000_1c66:
    ld [hl], e
    ld h, l

jr_000_1c68:
    ld [hl], h
    inc l
    jr nz, jr_000_1ce5

    ld [hl], l
    db $76

jr_000_1c6e:
    ld l, $72
    ld h, l
    ld h, e

jr_000_1c72:
    inc sp
    jr z, jr_000_1c95

    ld a, c
    ld [hl], l
    db $76
    ld l, $72

jr_000_1c7a:
    jr nz, @+$2b

    dec sp
    ld a, [bc]
    jr nz, @+$22

jr_000_1c80:
    ld h, c
    ld a, c
    jr nz, jr_000_1caf

    jr nz, jr_000_1cff

    ld [hl], l
    db $76
    ld l, $67
    jr nz, jr_000_1cb6

    jr nz, jr_000_1d04

    ld h, l
    ld h, e
    ld [hl-], a
    ld l, $30
    inc sp
    ld [hl-], a

jr_000_1c95:
    jr nz, jr_000_1cc0

    jr nz, jr_000_1cc4

    jr nz, @+$7b

    ld [hl], l
    db $76
    ld l, $62
    jr nz, @+$75

    ld [hl], h
    jr nz, jr_000_1ce1

    jr nz, jr_000_1d13

    ld h, c
    ld a, b
    jr z, jr_000_1cca

    ld e, a
    ld h, e
    ld l, a
    ld l, [hl]
    ld [hl], h

jr_000_1caf:
    ld [hl], d
    jr nz, jr_000_1ce2

    ld l, $35
    jr nz, jr_000_1cdf

jr_000_1cb6:
    inc l
    jr nz, @+$69

    ld h, c
    ld l, c
    ld l, [hl]
    jr nz, jr_000_1cfb

    jr nz, jr_000_1d2d

jr_000_1cc0:
    ld e, a
    ld h, a
    ld h, c
    ld l, c

jr_000_1cc4:
    ld l, [hl]
    inc l
    jr nz, jr_000_1cfa

    ld l, $30

jr_000_1cca:
    jr nz, jr_000_1cf5

    add hl, hl

jr_000_1ccd:
    dec sp
    ld a, [bc]
    jr nz, @+$6a

    ld h, l
    jr nz, jr_000_1d44

    ld l, c
    ld a, b
    ld h, l
    ld l, h
    ld a, [bc]
    jr nz, jr_000_1cfb

    jr nz, jr_000_1cfd

    ld [hl], b
    ld l, c

jr_000_1cdf:
    ld a, b
    ld h, a

jr_000_1ce1:
    ld h, l

jr_000_1ce2:
    inc l
    jr nz, @+$75

jr_000_1ce5:
    ld h, c
    ld l, l
    ld [hl], b
    ld l, h
    ld h, l
    ld [hl], d
    ld b, e
    ld l, a
    ld l, a
    ld [hl], d
    ld h, h
    ld a, [bc]
    jr nz, jr_000_1d13

    jr nz, jr_000_1d15

jr_000_1cf5:
    cpl
    cpl
    jr nz, jr_000_1d5c

    ld l, a

jr_000_1cfa:
    ld l, l

jr_000_1cfb:
    ld [hl], b
    ld [hl], l

jr_000_1cfd:
    ld [hl], h
    ld h, l

jr_000_1cff:
    jr nz, jr_000_1d6a

    ld a, b
    ld h, l
    ld l, h

jr_000_1d04:
    ld l, $72
    jr nz, @+$2c

    jr nz, jr_000_1d80

    ld h, l
    ld h, e
    inc sp
    jr z, @+$32

    ld l, $31
    dec [hl]
    add hl, hl

jr_000_1d13:
    jr nz, @+$2d

jr_000_1d15:
    jr nz, jr_000_1d87

    ld l, c
    ld a, b
    ld h, l
    ld l, h
    ld l, $67
    jr nz, jr_000_1d49

    jr nz, jr_000_1d59

    add hl, sp
    inc l
    jr nz, jr_000_1d52

    jr nc, jr_000_1d55

    dec [hl]
    ld sp, $2935
    jr nz, @+$2d

jr_000_1d2d:
    jr nz, jr_000_1d9f

    ld l, c
    ld sp, $2c34
    jr nz, @+$32

    ld l, $34
    inc sp
    ld [hl], $2c
    jr nz, jr_000_1d69

    jr nc, jr_000_1d6c

    ld sp, $3d30
    jr nz, jr_000_1db6

    ld h, c

jr_000_1d44:
    ld [hl], h
    ld [hl], l
    ld [hl], d
    ld h, c
    ld [hl], h

jr_000_1d49:
    ld l, c
    ld l, a
    ld l, [hl]
    dec sp
    ld a, [bc]
    jr nz, jr_000_1d70

    jr nz, jr_000_1dc8

jr_000_1d52:
    ld h, l
    ld h, e
    ld [hl-], a

jr_000_1d55:
    jr z, jr_000_1d77

    jr nc, jr_000_1d87

jr_000_1d59:
    jr nc, jr_000_1d7b

    add hl, hl

jr_000_1d5c:
    inc l
    jr nz, jr_000_1dc2

    ld l, a
    jr nz, jr_000_1d8b

    dec sp
    ld a, [bc]
    jr nz, @+$22

    jr nz, @+$22

    ld h, a

jr_000_1d69:
    ld [hl], d

jr_000_1d6a:
    ld h, c
    ld a, c

jr_000_1d6c:
    jr nz, jr_000_1dab

    jr nz, jr_000_1de6

jr_000_1d70:
    jr nz, @+$22

    ld [hl], b
    ld l, c
    ld a, b
    ld h, l
    ld l, h

jr_000_1d77:
    ld l, $72
    ld h, a
    ld h, d

jr_000_1d7b:
    jr nz, jr_000_1dba

    jr nz, jr_000_1de6

    ld [hl], d

jr_000_1d80:
    inc sp
    jr z, jr_000_1da3

    jr nc, jr_000_1db3

    jr nc, jr_000_1db3

jr_000_1d87:
    jr nz, jr_000_1db6

    jr nc, jr_000_1db9

jr_000_1d8b:
    inc sp
    add hl, sp
    dec [hl]
    inc l
    jr nz, jr_000_1dbb

    jr nz, jr_000_1e09

    ld h, l
    ld h, e
    inc sp
    jr z, jr_000_1db8

    ld sp, $312e
    inc [hl]
    inc l
    jr nz, jr_000_1dcc

jr_000_1d9f:
    jr nc, jr_000_1da1

jr_000_1da1:
    nop
    nop

jr_000_1da3:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_000_1dab:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_000_1db3:
    nop
    nop
    nop

jr_000_1db6:
    nop
    nop

jr_000_1db8:
    nop

jr_000_1db9:
    nop

jr_000_1dba:
    nop

jr_000_1dbb:
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_000_1dc2:
    nop
    nop
    nop
    nop
    nop
    nop

jr_000_1dc8:
    nop
    nop
    nop
    nop

jr_000_1dcc:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_000_1de6:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_000_1e09:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
