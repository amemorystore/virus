SECTION "ROM Bank $001", ROMX[$4000], BANK[$1]

    rst $38
    rst $38
    rst $38
    rlca
    or b
    ld c, l
    rlca
    or h
    ld c, l
    rlca
    cp b
    ld c, l
    rlca
    cp h
    ld c, l
    rlca
    ret nz

    ld c, l
    rlca
    db $d3
    ld c, l
    rlca
    rst $10
    ld c, l
    rlca
    sbc $4d
    rlca
    ld [c], a
    ld c, l
    rlca
    and $4d
    rlca
    ld [$074d], a
    xor $4d
    rlca
    ld a, [c]
    ld c, l
    rlca
    or $4d
    rlca
    ld a, [$074d]
    ld bc, $074e
    ld [$074e], sp
    inc c
    ld c, [hl]
    rlca
    db $10
    ld c, [hl]
    add h
    inc d
    ld c, [hl]
    dec b
    inc hl
    ld c, [hl]
    rlca
    ld [hl-], a
    ld c, [hl]
    add h
    inc a
    ld c, [hl]
    dec b
    ld c, a
    ld c, [hl]
    rlca
    ld h, d
    ld c, [hl]
    add h
    ld l, a
    ld c, [hl]
    dec b
    ld a, [hl]
    ld c, [hl]
    rlca
    adc h
    ld c, [hl]
    add h
    adc l
    ld c, [hl]
    dec b
    xor h
    ld c, [hl]
    rlca
    bit 1, [hl]
    add h
    ret c

    ld c, [hl]
    dec b
    rst $30
    ld c, [hl]
    rlca
    ld d, $4f
    add h
    add hl, hl
    ld c, a
    dec b
    inc a
    ld c, a
    rlca
    ld c, [hl]
    ld c, a
    add h
    ld c, a
    ld c, a
    dec b
    ld l, c
    ld c, a
    rlca
    ld l, d
    ld c, a
    add h
    ld a, l
    ld c, a
    dec b
    adc h
    ld c, a
    rlca
    sbc e
    ld c, a
    add h
    and l
    ld c, a
    dec b
    cp b
    ld c, a
    rlca
    bit 1, a
    add h
    push de
    ld c, a
    dec b
    ld a, [c]
    ld c, a
    rlca
    inc de
    ld d, b
    add h
    inc l
    ld d, b
    dec b
    ld c, e
    ld d, b
    rlca
    ld l, [hl]
    ld d, b
    add h
    add a
    ld d, b
    dec b
    or d
    ld d, b
    rlca
    pop de
    ld d, b
    add h
    ld [$0550], a
    ld de, $0751
    scf
    ld d, c
    add h
    jr c, jr_001_4105

    dec b
    ld d, a
    ld d, c
    rlca
    add [hl]
    ld d, c
    add h
    and l
    ld d, c
    dec b
    cp b
    ld d, c
    rlca
    bit 2, c
    add h
    push de
    ld d, c
    dec b
    ldh a, [rHDMA1]
    rlca
    dec bc
    ld d, d
    add h
    dec de
    ld d, d
    dec b
    ld a, $52
    rlca
    ld h, c
    ld d, d
    add h
    ld l, e
    ld d, d
    dec b
    adc d
    ld d, d
    rlca
    xor l
    ld d, d
    add h
    jp $0552


    sub $52
    rlca
    jp hl


    ld d, d
    add h
    or $52
    dec b
    ld de, $0753
    inc l
    ld d, e
    add h
    ccf
    ld d, e
    dec b
    ld c, [hl]
    ld d, e
    rlca
    ld e, l
    ld d, e
    add h
    ld h, a
    ld d, e
    dec b
    add d
    ld d, e
    rlca
    sbc l
    ld d, e
    add h
    or b
    ld d, e

jr_001_4105:
    dec b
    cp a
    ld d, e
    rlca
    adc $53
    add h
    ret c

    ld d, e
    dec b
    db $eb
    ld d, e
    rlca
    cp $53
    add h
    dec bc
    ld d, h
    dec b
    ld l, $54
    rlca
    ld d, c
    ld d, h
    add h
    ld h, h
    ld d, h
    dec b
    ld [hl], e
    ld d, h
    rlca
    add l
    ld d, h
    add h
    add [hl]
    ld d, h
    dec b
    and c
    ld d, h
    rlca
    cp h
    ld d, h
    add h
    rst $08
    ld d, h
    dec b
    and $54
    rlca
    db $fd
    ld d, h
    add h
    ld a, [bc]
    ld d, l
    dec b
    dec l
    ld d, l
    rlca
    ld c, b
    ld d, l
    add h
    ld e, b
    ld d, l
    dec b
    ld [hl], e
    ld d, l
    rlca
    adc [hl]
    ld d, l
    add h
    sbc [hl]
    ld d, l
    dec b
    pop bc
    ld d, l
    rlca
    add sp, $55
    add h
    inc b
    ld d, [hl]
    dec b
    rla
    ld d, [hl]
    rlca
    ld a, [hl+]
    ld d, [hl]
    add h
    scf
    ld d, [hl]
    dec b
    ld c, d
    ld d, [hl]
    rlca
    ld e, l
    ld d, [hl]
    add h
    ld l, d
    ld d, [hl]
    dec b
    adc l
    ld d, [hl]
    rlca
    xor a
    ld d, [hl]
    add h
    or b
    ld d, [hl]
    dec b
    jp $0756


    sub $56
    add h
    db $e3
    ld d, [hl]
    dec b
    ld a, [$0756]
    dec c
    ld d, a
    add h
    ld a, [de]
    ld d, a
    dec b
    dec a
    ld d, a
    rlca
    ld h, b
    ld d, a
    add h
    ld [hl], b
    ld d, a
    dec b
    add a
    ld d, a
    rlca
    sbc [hl]
    ld d, a
    add h
    xor e
    ld d, a
    dec b
    jp nz, $0657

    jp nc, $8457

    ld [c], a
    ld d, a
    dec b
    ld bc, $0658
    add hl, de
    ld e, b
    inc b
    ld l, $58
    inc b
    ccf
    ld e, b
    inc b
    ld c, [hl]
    ld e, b
    rlca
    ld h, e
    ld e, b
    inc b
    ld l, d
    ld e, b
    add h
    ld a, l
    ld e, b
    dec b
    sub [hl]
    ld e, b
    ld b, $ac
    ld e, b
    add h
    bit 3, b
    dec b
    ld [$0658], a
    ld b, $59
    inc b
    db $10
    ld e, c
    inc b
    inc hl
    ld e, c
    inc b
    ld [hl-], a
    ld e, c
    inc b
    ld e, l
    ld e, c
    inc b
    ld [hl], b
    ld e, c
    inc b
    add e
    ld e, c
    inc b
    sbc [hl]
    ld e, c
    inc b
    or l
    ld e, c
    inc b
    jp z, $0459

    push hl
    ld e, c
    inc b
    nop
    ld e, d
    inc b
    dec bc
    ld e, d
    rlca
    ld d, $5a
    rlca
    inc hl
    ld e, d
    ld b, h
    ld d, h
    ld e, d
    dec b
    ld l, e
    ld e, d
    inc b
    ld a, [hl]
    ld e, d
    rlca
    adc c
    ld e, d
    ld b, h
    and d
    ld e, d
    dec b
    pop bc
    ld e, d
    inc b
    ldh [$5a], a
    rlca
    db $fd
    ld e, d
    rlca
    dec c
    ld e, e
    ld b, h
    inc d
    ld e, e
    dec b
    dec de
    ld e, e
    ld b, h
    ld h, $5b
    dec b
    dec l
    ld e, e
    ld b, h
    jr c, jr_001_4274

    dec b
    ld b, e
    ld e, e
    inc b
    ld d, d
    ld e, e
    rlca
    ld e, l
    ld e, e
    ld b, h
    ld l, l
    ld e, e
    dec b
    adc h
    ld e, e
    ld [bc], a
    xor a
    ld e, e
    inc b
    add $5b
    ret nz

    ld [hl-], a
    ld c, l
    ld bc, $4d41
    ld [bc], a
    ld e, [hl]
    ld c, l
    inc bc
    ld a, [hl]
    ld c, l
    ld b, a
    ld [$d1e2], a
    xor a
    ld [$d1f4], a
    ld [$d1e4], a
    ld a, b
    push hl
    push de
    push bc
    ld b, a
    ld a, [$d1e2]
    and a
    jr z, jr_001_425d

    xor a
    ld [$d11e], a
    ld [$d11f], a
    ld [$d120], a
    ld [$d121], a

jr_001_425d:
    ld a, [$d1f4]
    and a
    jr z, jr_001_4278

    ld a, [$d1e2]
    and a
    jr z, jr_001_4293

    xor a
    ld [$d1e2], a
    ld a, [$d1f7]
    cp $ff
    jr nz, jr_001_4282

jr_001_4274:
    xor a
    ld [$d1f4], a

jr_001_4278:
    xor a
    ld [$d1e2], a
    ld a, b
    call Call_001_4a0a
    jr jr_001_4293

jr_001_4282:
    ld a, b
    ld [$d1f7], a
    ld a, [$d1f4]
    ld [$d1f5], a
    ld [$d1f6], a
    ld a, b
    ld [$d1f4], a

jr_001_4293:
    pop bc
    pop de
    pop hl
    ret


    ld c, $00

jr_001_4299:
    ld b, $00
    ld hl, $d11a
    add hl, bc
    ld a, [hl]
    and a
    jr z, jr_001_42c5

    ld a, c
    cp $04
    jr nc, jr_001_42c2

    ld a, [$d0f6]
    and a
    jr z, jr_001_42c2

    bit 7, a
    jr nz, jr_001_42c5

    set 7, a
    ld [$d0f6], a
    xor a
    ldh [rNR51], a
    ldh [rNR30], a
    ld a, $80
    ldh [rNR30], a
    jr jr_001_42c5

jr_001_42c2:
    call Call_001_42cc

jr_001_42c5:
    ld a, c
    inc c
    cp $07
    jr nz, jr_001_4299

    ret


Call_001_42cc:
    ld b, $00
    ld hl, $d1aa
    add hl, bc
    ld a, [hl]
    cp $01
    jp z, Jump_001_4364

    dec a
    ld [hl], a
    ld a, c
    cp $04
    jr nc, jr_001_42e8

    ld hl, $d11e
    add hl, bc
    ld a, [hl]
    and a
    jr z, jr_001_42e8

    ret


jr_001_42e8:
    ld hl, $d122
    add hl, bc
    bit 6, [hl]
    jr z, jr_001_42f3

    call Call_001_49a1

jr_001_42f3:
    ld b, $00
    ld hl, $d12a
    add hl, bc
    bit 0, [hl]
    jr nz, jr_001_4305

    ld hl, $d122
    add hl, bc
    bit 2, [hl]
    jr nz, jr_001_4319

jr_001_4305:
    ld hl, $d122
    add hl, bc
    bit 4, [hl]
    jr z, jr_001_4310

    jp Jump_001_488d


jr_001_4310:
    ld hl, $d142
    add hl, bc
    ld a, [hl]
    and a
    jr z, jr_001_431a

    dec [hl]

jr_001_4319:
    ret


jr_001_431a:
    ld hl, $d14a
    add hl, bc
    ld a, [hl]
    and a
    jr nz, jr_001_4323

    ret


jr_001_4323:
    ld d, a
    ld hl, $d152
    add hl, bc
    ld a, [hl]
    and $0f
    and a
    jr z, jr_001_4330

    dec [hl]
    ret


jr_001_4330:
    ld a, [hl]
    swap [hl]
    or [hl]
    ld [hl], a
    ld hl, $d15a
    add hl, bc
    ld e, [hl]
    ld hl, $d122
    add hl, bc
    bit 3, [hl]
    jr z, jr_001_4350

    res 3, [hl]
    ld a, d
    and $0f
    ld d, a
    ld a, e
    sub d
    jr nc, jr_001_434e

    ld a, $00

jr_001_434e:
    jr jr_001_435c

jr_001_4350:
    set 3, [hl]
    ld a, d
    and $f0
    swap a
    add e
    jr nc, jr_001_435c

    ld a, $ff

jr_001_435c:
    ld d, a
    ld b, $03
    call Call_001_49cc
    ld [hl], d
    ret


Jump_001_4364:
    ld hl, $d162
    add hl, bc
    ld a, [hl]
    ld hl, $d142
    add hl, bc
    ld [hl], a
    ld hl, $d122
    add hl, bc
    res 4, [hl]
    res 5, [hl]
    call Call_001_437a
    ret


Call_001_437a:
Jump_001_437a:
    call Call_001_49b9
    ld d, a
    cp $ff
    jp nz, Jump_001_4408

    ld b, $00
    ld hl, $d122
    add hl, bc
    bit 1, [hl]
    jr nz, jr_001_43b8

    ld a, c
    cp $03
    jr nc, jr_001_4394

    jr jr_001_43d3

jr_001_4394:
    res 2, [hl]
    ld hl, $d12a
    add hl, bc
    res 0, [hl]
    cp $06
    jr nz, jr_001_43a8

    ld a, $00
    ldh [rNR30], a
    ld a, $80
    ldh [rNR30], a

jr_001_43a8:
    jr nz, jr_001_43b6

    ld a, [$d0f7]
    and a
    jr z, jr_001_43b6

    xor a
    ld [$d0f7], a
    jr jr_001_43d3

jr_001_43b6:
    jr jr_001_43dc

jr_001_43b8:
    res 1, [hl]
    ld d, $00
    ld a, c
    add a
    ld e, a
    ld hl, $d0fa
    add hl, de
    push hl
    ld hl, $d10a
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    jp Jump_001_437a


jr_001_43d3:
    ld hl, $4cb0
    add hl, bc
    ldh a, [rNR51]
    and [hl]
    ldh [rNR51], a

jr_001_43dc:
    ld a, [$d11e]
    cp $14
    jr nc, jr_001_43e5

    jr jr_001_4402

jr_001_43e5:
    ld a, [$d11e]
    cp $86
    jr z, jr_001_4402

    jr c, jr_001_43f0

    jr jr_001_4402

jr_001_43f0:
    ld a, c
    cp $04
    jr z, jr_001_43f9

    call Call_001_485b
    ret c

jr_001_43f9:
    ld a, [$d0f9]
    ldh [rNR50], a
    xor a
    ld [$d0f9], a

jr_001_4402:
    ld hl, $d11a
    add hl, bc
    ld [hl], b
    ret


Jump_001_4408:
    cp $fd
    jp nz, Jump_001_443d

    call Call_001_49b9
    push af
    call Call_001_49b9
    ld d, a
    pop af
    ld e, a
    push de
    ld d, $00
    ld a, c
    add a
    ld e, a
    ld hl, $d0fa
    add hl, de
    push hl
    ld hl, $d10a
    add hl, de
    ld e, l
    ld d, h
    pop hl
    ld a, [hl+]
    ld [de], a
    inc de
    ld a, [hl-]
    ld [de], a
    pop de
    ld [hl], e
    inc hl
    ld [hl], d
    ld b, $00
    ld hl, $d122
    add hl, bc
    set 1, [hl]
    jp Jump_001_437a


Jump_001_443d:
    cp $fe
    jp nz, Jump_001_4478

    call Call_001_49b9
    ld e, a
    and a
    jr z, jr_001_4461

    ld b, $00
    ld hl, $d1b2
    add hl, bc
    ld a, [hl]
    cp e
    jr nz, jr_001_445f

    ld a, $01
    ld [hl], a
    call Call_001_49b9
    call Call_001_49b9
    jp Jump_001_437a


jr_001_445f:
    inc a
    ld [hl], a

jr_001_4461:
    call Call_001_49b9
    push af
    call Call_001_49b9
    ld b, a
    ld d, $00
    ld a, c
    add a
    ld e, a
    ld hl, $d0fa
    add hl, de
    pop af
    ld [hl+], a
    ld [hl], b
    jp Jump_001_437a


Jump_001_4478:
    and $f0
    cp $d0
    jp nz, Jump_001_44b7

    ld a, d
    and $0f
    ld b, $00
    ld hl, $d1ba
    add hl, bc
    ld [hl], a
    ld a, c
    cp $03
    jr z, jr_001_44b4

    call Call_001_49b9
    ld d, a
    ld a, c
    cp $02
    jr z, jr_001_44a0

    cp $06
    jr nz, jr_001_44ad

    ld hl, $d1db
    jr jr_001_44a3

jr_001_44a0:
    ld hl, $d1da

jr_001_44a3:
    ld a, d
    and $0f
    ld [hl], a
    ld a, d
    and $30
    sla a
    ld d, a

jr_001_44ad:
    ld b, $00
    ld hl, $d1d2
    add hl, bc
    ld [hl], d

jr_001_44b4:
    jp Jump_001_437a


Jump_001_44b7:
    ld a, d
    cp $e8
    jr nz, jr_001_44c9

    ld b, $00
    ld hl, $d122
    add hl, bc
    ld a, [hl]
    xor $01
    ld [hl], a
    jp Jump_001_437a


jr_001_44c9:
    cp $ea
    jr nz, jr_001_4501

    call Call_001_49b9
    ld b, $00
    ld hl, $d142
    add hl, bc
    ld [hl], a
    ld hl, $d162
    add hl, bc
    ld [hl], a
    call Call_001_49b9
    ld d, a
    and $f0
    swap a
    ld b, $00
    ld hl, $d14a
    add hl, bc
    srl a
    ld e, a
    adc b
    swap a
    or e
    ld [hl], a
    ld a, d
    and $0f
    ld d, a
    ld hl, $d152
    add hl, bc
    swap a
    or d
    ld [hl], a
    jp Jump_001_437a


jr_001_4501:
    cp $eb
    jr nz, jr_001_4539

    call Call_001_49b9
    ld b, $00
    ld hl, $d16a
    add hl, bc
    ld [hl], a
    call Call_001_49b9
    ld d, a
    and $f0
    swap a
    ld b, a
    ld a, d
    and $0f
    call Call_001_49ec
    ld b, $00
    ld hl, $d19a
    add hl, bc
    ld [hl], d
    ld hl, $d1a2
    add hl, bc
    ld [hl], e
    ld b, $00
    ld hl, $d122
    add hl, bc
    set 4, [hl]
    call Call_001_49b9
    ld d, a
    jp Jump_001_469e


jr_001_4539:
    cp $ec
    jr nz, jr_001_454e

    call Call_001_49b9
    rrca
    rrca
    and $c0
    ld b, $00
    ld hl, $d132
    add hl, bc
    ld [hl], a
    jp Jump_001_437a


jr_001_454e:
    cp $ed
    jr nz, jr_001_458e

    ld a, c
    cp $04
    jr nc, jr_001_4572

    call Call_001_49b9
    ld [$d1dc], a
    call Call_001_49b9
    ld [$d1dd], a
    xor a
    ld [$d1c2], a
    ld [$d1c3], a
    ld [$d1c4], a
    ld [$d1c5], a
    jr jr_001_458b

jr_001_4572:
    call Call_001_49b9
    ld [$d1de], a
    call Call_001_49b9
    ld [$d1df], a
    xor a
    ld [$d1c6], a
    ld [$d1c7], a
    ld [$d1c8], a
    ld [$d1c9], a

jr_001_458b:
    jp Jump_001_437a


jr_001_458e:
    cp $ee
    jr nz, jr_001_459b

    call Call_001_49b9
    ld [$d0f8], a
    jp Jump_001_437a


jr_001_459b:
    cp $ef
    jr nz, jr_001_45ba

    call Call_001_49b9
    push bc
    call Call_001_4a0a
    pop bc
    ld a, [$d0f7]
    and a
    jr nz, jr_001_45b7

    ld a, [$d121]
    ld [$d0f7], a
    xor a
    ld [$d121], a

jr_001_45b7:
    jp Jump_001_437a


jr_001_45ba:
    cp $fc
    jr nz, jr_001_45d8

    call Call_001_49b9
    ld b, $00
    ld hl, $d13a
    add hl, bc
    ld [hl], a
    and $c0
    ld hl, $d132
    add hl, bc
    ld [hl], a
    ld hl, $d122
    add hl, bc
    set 6, [hl]
    jp Jump_001_437a


jr_001_45d8:
    cp $f0
    jr nz, jr_001_45e4

    call Call_001_49b9
    ldh [rNR50], a
    jp Jump_001_437a


jr_001_45e4:
    cp $f8
    jr nz, jr_001_45f3

    ld b, $00
    ld hl, $d12a
    add hl, bc
    set 0, [hl]
    jp Jump_001_437a


jr_001_45f3:
    and $f0
    cp $e0
    jr nz, jr_001_4606

    ld hl, $d1ca
    ld b, $00
    add hl, bc
    ld a, d
    and $0f
    ld [hl], a
    jp Jump_001_437a


jr_001_4606:
    cp $20
    jr nz, jr_001_4653

    ld a, c
    cp $03
    jr c, jr_001_4653

    ld b, $00
    ld hl, $d12a
    add hl, bc
    bit 0, [hl]
    jr nz, jr_001_4653

    call Call_001_469e
    ld d, a
    ld b, $00
    ld hl, $d132
    add hl, bc
    ld a, [hl]
    or d
    ld d, a
    ld b, $01
    call Call_001_49cc
    ld [hl], d
    call Call_001_49b9
    ld d, a
    ld b, $02
    call Call_001_49cc
    ld [hl], d
    call Call_001_49b9
    ld e, a
    ld a, c
    cp $07
    ld a, $00
    jr z, jr_001_4646

    push de
    call Call_001_49b9
    pop de

jr_001_4646:
    ld d, a
    push de
    call Call_001_47bd
    call Call_001_478c
    pop de
    call Call_001_47df
    ret


jr_001_4653:
    ld a, c
    cp $04
    jr c, jr_001_466f

    ld a, d
    cp $10
    jr nz, jr_001_466f

    ld b, $00
    ld hl, $d12a
    add hl, bc
    bit 0, [hl]
    jr nz, jr_001_466f

    call Call_001_49b9
    ldh [rNR10], a
    jp Jump_001_437a


jr_001_466f:
    ld a, c
    cp $03
    jr nz, jr_001_469e

    ld a, d
    and $f0
    cp $b0
    jr z, jr_001_4689

    jr nc, jr_001_469e

    swap a
    ld b, a
    ld a, d
    and $0f
    ld d, a
    ld a, b
    push de
    push bc
    jr jr_001_4691

jr_001_4689:
    ld a, d
    and $0f
    push af
    push bc
    call Call_001_49b9

jr_001_4691:
    ld d, a
    ld a, [$d0f7]
    and a
    jr nz, jr_001_469c

    ld a, d
    call Call_001_4a0a

jr_001_469c:
    pop bc
    pop de

Call_001_469e:
Jump_001_469e:
jr_001_469e:
    ld a, d
    push af
    and $0f
    inc a
    ld b, $00
    ld e, a
    ld d, b
    ld hl, $d1ba
    add hl, bc
    ld a, [hl]
    ld l, b
    call Call_001_49db
    ld a, c
    cp $04
    jr nc, jr_001_46bf

    ld a, [$d1dc]
    ld d, a
    ld a, [$d1dd]
    ld e, a
    jr jr_001_46d2

jr_001_46bf:
    ld d, $01
    ld e, $00
    cp $07
    jr z, jr_001_46d2

    call Call_001_4827
    ld a, [$d1de]
    ld d, a
    ld a, [$d1df]
    ld e, a

jr_001_46d2:
    ld a, l
    ld b, $00
    ld hl, $d1c2
    add hl, bc
    ld l, [hl]
    call Call_001_49db
    ld e, l
    ld d, h
    ld hl, $d1c2
    add hl, bc
    ld [hl], e
    ld a, d
    ld hl, $d1aa
    add hl, bc
    ld [hl], a
    ld hl, $d12a
    add hl, bc
    bit 0, [hl]
    jr nz, jr_001_46fc

    ld hl, $d122
    add hl, bc
    bit 2, [hl]
    jr z, jr_001_46fc

    pop hl
    ret


jr_001_46fc:
    pop af
    and $f0
    cp $c0
    jr nz, jr_001_4733

    ld a, c
    cp $04
    jr nc, jr_001_4710

    ld hl, $d11e
    add hl, bc
    ld a, [hl]
    and a
    jr nz, jr_001_4732

jr_001_4710:
    ld a, c
    cp $02
    jr z, jr_001_4719

    cp $06
    jr nz, jr_001_4726

jr_001_4719:
    ld b, $00
    ld hl, $4cb0
    add hl, bc
    ldh a, [rNR51]
    and [hl]
    ldh [rNR51], a
    jr jr_001_4732

jr_001_4726:
    ld b, $02
    call Call_001_49cc
    ld a, $08
    ld [hl+], a
    inc hl
    ld a, $80
    ld [hl], a

jr_001_4732:
    ret


jr_001_4733:
    swap a
    ld b, $00
    ld hl, $d1ca
    add hl, bc
    ld b, [hl]
    call Call_001_49ec
    ld b, $00
    ld hl, $d122
    add hl, bc
    bit 4, [hl]
    jr z, jr_001_474c

    call Call_001_4923

jr_001_474c:
    push de
    ld a, c
    cp $04
    jr nc, jr_001_4761

    ld hl, $d11e
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    and a
    jr nz, jr_001_475f

    jr jr_001_4761

jr_001_475f:
    pop de
    ret


jr_001_4761:
    ld b, $00
    ld hl, $d1d2
    add hl, bc
    ld d, [hl]
    ld b, $02
    call Call_001_49cc
    ld [hl], d
    call Call_001_47bd
    call Call_001_478c
    pop de
    ld b, $00
    ld hl, $d122
    add hl, bc
    bit 0, [hl]
    jr z, jr_001_4783

    inc e
    jr nc, jr_001_4783

    inc d

jr_001_4783:
    ld hl, $d15a
    add hl, bc
    ld [hl], e
    call Call_001_47df
    ret


Call_001_478c:
    ld b, $00
    ld hl, $4cb8
    add hl, bc
    ldh a, [rNR51]
    or [hl]
    ld d, a
    ld a, c
    cp $07
    jr z, jr_001_47a7

    cp $04
    jr nc, jr_001_47b9

    ld hl, $d11e
    add hl, bc
    ld a, [hl]
    and a
    jr nz, jr_001_47b9

jr_001_47a7:
    ld a, [$d0f8]
    ld hl, $4cb8
    add hl, bc
    and [hl]
    ld d, a
    ldh a, [rNR51]
    ld hl, $4cb0
    add hl, bc
    and [hl]
    or d
    ld d, a

jr_001_47b9:
    ld a, d
    ldh [rNR51], a
    ret


Call_001_47bd:
    ld b, $00
    ld hl, $d1aa
    add hl, bc
    ld d, [hl]
    ld a, c
    cp $02
    jr z, jr_001_47d8

    cp $06
    jr z, jr_001_47d8

    ld a, d
    and $3f
    ld d, a
    ld hl, $d132
    add hl, bc
    ld a, [hl]
    or d
    ld d, a

jr_001_47d8:
    ld b, $01
    call Call_001_49cc
    ld [hl], d
    ret


Call_001_47df:
    ld a, c
    cp $02
    jr z, jr_001_47e8

    cp $06
    jr nz, jr_001_4815

jr_001_47e8:
    push de
    ld de, $d1da
    cp $02
    jr z, jr_001_47f3

    ld de, $d1db

jr_001_47f3:
    ld a, [de]
    add a
    ld d, $00
    ld e, a
    ld hl, $4cd8
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $ff30
    ld b, $0f
    ld a, $00
    ldh [rNR30], a

jr_001_4808:
    ld a, [de]
    inc de
    ld [hl+], a
    ld a, b
    dec b
    and a
    jr nz, jr_001_4808

    ld a, $80
    ldh [rNR30], a
    pop de

jr_001_4815:
    ld a, d
    or $80
    and $c7
    ld d, a
    ld b, $03
    call Call_001_49cc
    ld [hl], e
    inc hl
    ld [hl], d
    call Call_001_4849
    ret


Call_001_4827:
    call Call_001_4879
    jr nc, jr_001_483f

    ld d, $00
    ld a, [$d1e6]
    add $80
    jr nc, jr_001_4836

    inc d

jr_001_4836:
    ld [$d1df], a
    ld a, d
    ld [$d1de], a
    jr jr_001_4848

jr_001_483f:
    xor a
    ld [$d1df], a
    ld a, $01
    ld [$d1de], a

jr_001_4848:
    ret


Call_001_4849:
    call Call_001_4879
    jr nc, jr_001_485a

    ld a, [$d1e5]
    add e
    jr nc, jr_001_4855

    inc d

jr_001_4855:
    dec hl
    ld e, a
    ld [hl], e
    inc hl
    ld [hl], d

jr_001_485a:
    ret


Call_001_485b:
    call Call_001_4879
    jr nc, jr_001_4876

    ld hl, $d0fa
    ld e, c
    ld d, $00
    sla e
    rl d
    add hl, de
    ld a, [hl]
    sub $01
    ld [hl], a
    inc hl
    ld a, [hl]
    sbc $00
    ld [hl], a
    scf
    ret


jr_001_4876:
    scf
    ccf
    ret


Call_001_4879:
    ld a, [$d11e]
    cp $14
    jr nc, jr_001_4882

    jr jr_001_4888

jr_001_4882:
    cp $86
    jr z, jr_001_4888

    jr c, jr_001_488b

jr_001_4888:
    scf
    ccf
    ret


jr_001_488b:
    scf
    ret


Jump_001_488d:
    ld hl, $d122
    add hl, bc
    bit 5, [hl]
    jp nz, Jump_001_48d4

    ld hl, $d192
    add hl, bc
    ld e, [hl]
    ld hl, $d18a
    add hl, bc
    ld d, [hl]
    ld hl, $d172
    add hl, bc
    ld l, [hl]
    ld h, b
    add hl, de
    ld d, h
    ld e, l
    ld hl, $d182
    add hl, bc
    push hl
    ld hl, $d17a
    add hl, bc
    ld a, [hl]
    pop hl
    add [hl]
    ld [hl], a
    ld a, $00
    adc e
    ld e, a
    ld a, $00
    adc d
    ld d, a
    ld hl, $d19a
    add hl, bc
    ld a, [hl]
    cp d
    jp c, Jump_001_491a

    jr nz, jr_001_4907

    ld hl, $d1a2
    add hl, bc
    ld a, [hl]
    cp e
    jp c, Jump_001_491a

    jr jr_001_4907

Jump_001_48d4:
    ld hl, $d192
    add hl, bc
    ld a, [hl]
    ld hl, $d18a
    add hl, bc
    ld d, [hl]
    ld hl, $d172
    add hl, bc
    ld e, [hl]
    sub e
    ld e, a
    ld a, d
    sbc b
    ld d, a
    ld hl, $d17a
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
    ld hl, $d19a
    add hl, bc
    ld a, d
    cp [hl]
    jr c, jr_001_491a

    jr nz, jr_001_4907

    ld hl, $d1a2
    add hl, bc
    ld a, e
    cp [hl]
    jr c, jr_001_491a

jr_001_4907:
    ld hl, $d192
    add hl, bc
    ld [hl], e
    ld hl, $d18a
    add hl, bc
    ld [hl], d
    ld b, $03
    call Call_001_49cc
    ld a, e
    ld [hl+], a
    ld [hl], d
    ret


Jump_001_491a:
jr_001_491a:
    ld hl, $d122
    add hl, bc
    res 4, [hl]
    res 5, [hl]
    ret


Call_001_4923:
    ld hl, $d18a
    add hl, bc
    ld [hl], d
    ld hl, $d192
    add hl, bc
    ld [hl], e
    ld hl, $d1aa
    add hl, bc
    ld a, [hl]
    ld hl, $d16a
    add hl, bc
    sub [hl]
    jr nc, jr_001_493b

    ld a, $01

jr_001_493b:
    ld [hl], a
    ld hl, $d1a2
    add hl, bc
    ld a, e
    sub [hl]
    ld e, a
    ld a, d
    sbc b
    ld hl, $d19a
    add hl, bc
    sub [hl]
    jr c, jr_001_4957

    ld d, a
    ld b, $00
    ld hl, $d122
    add hl, bc
    set 5, [hl]
    jr jr_001_497a

jr_001_4957:
    ld hl, $d18a
    add hl, bc
    ld d, [hl]
    ld hl, $d192
    add hl, bc
    ld e, [hl]
    ld hl, $d1a2
    add hl, bc
    ld a, [hl]
    sub e
    ld e, a
    ld a, d
    sbc b
    ld d, a
    ld hl, $d19a
    add hl, bc
    ld a, [hl]
    sub d
    ld d, a
    ld b, $00
    ld hl, $d122
    add hl, bc
    res 5, [hl]

jr_001_497a:
    ld hl, $d16a
    add hl, bc

jr_001_497e:
    inc b
    ld a, e
    sub [hl]
    ld e, a
    jr nc, jr_001_497e

    ld a, d
    and a
    jr z, jr_001_498c

    dec a
    ld d, a
    jr jr_001_497e

jr_001_498c:
    ld a, e
    add [hl]
    ld d, b
    ld b, $00
    ld hl, $d172
    add hl, bc
    ld [hl], d
    ld hl, $d17a
    add hl, bc
    ld [hl], a
    ld hl, $d182
    add hl, bc
    ld [hl], a
    ret


Call_001_49a1:
    ld b, $00
    ld hl, $d13a
    add hl, bc
    ld a, [hl]
    rlca
    rlca
    ld [hl], a
    and $c0
    ld d, a
    ld b, $01
    call Call_001_49cc
    ld a, [hl]
    and $3f
    or d
    ld [hl], a
    ret


Call_001_49b9:
    ld d, $00
    ld a, c
    add a
    ld e, a
    ld hl, $d0fa
    add hl, de
    ld a, [hl+]
    ld e, a
    ld a, [hl-]
    ld d, a
    ld a, [de]
    inc de
    ld [hl], e
    inc hl
    ld [hl], d
    ret


Call_001_49cc:
    ld a, c
    ld hl, $4ca8
    add l
    jr nc, jr_001_49d4

    inc h

jr_001_49d4:
    ld l, a
    ld a, [hl]
    add b
    ld l, a
    ld h, $ff
    ret


Call_001_49db:
    ld h, $00

jr_001_49dd:
    srl a
    jr nc, jr_001_49e2

    add hl, de

jr_001_49e2:
    sla e
    rl d
    and a
    jr z, jr_001_49eb

    jr jr_001_49dd

jr_001_49eb:
    ret


Call_001_49ec:
    ld h, $00
    ld l, a
    add hl, hl
    ld d, h
    ld e, l
    ld hl, $4cc0
    add hl, de
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, b

jr_001_49fa:
    cp $07
    jr z, jr_001_4a05

    sra d
    rr e
    inc a
    jr jr_001_49fa

jr_001_4a05:
    ld a, $08
    add d
    ld d, a
    ret


Call_001_4a0a:
    ld [$d0f5], a
    cp $ff
    jp z, Jump_001_4bc5

    cp $b9
    jp z, Jump_001_4adf

    jp c, Jump_001_4adf

    cp $fe
    jr z, jr_001_4a21

    jp nc, Jump_001_4adf

jr_001_4a21:
    xor a
    ld [$d0f4], a
    ld [$d0f7], a
    ld [$d1dd], a
    ld [$d1da], a
    ld [$d1db], a
    ld d, $08
    ld hl, $d10a
    ld hl, $d0fa
    call Call_001_4c1a
    ld d, $04
    ld hl, $d11a
    call Call_001_4c1a
    ld hl, $d122
    call Call_001_4c1a
    ld hl, $d132
    call Call_001_4c1a
    ld hl, $d13a
    call Call_001_4c1a
    ld hl, $d142
    call Call_001_4c1a
    ld hl, $d14a
    call Call_001_4c1a
    ld hl, $d152
    call Call_001_4c1a
    ld hl, $d15a
    call Call_001_4c1a
    ld hl, $d162
    call Call_001_4c1a
    ld hl, $d12a
    call Call_001_4c1a
    ld hl, $d16a
    call Call_001_4c1a
    ld hl, $d172
    call Call_001_4c1a
    ld hl, $d17a
    call Call_001_4c1a
    ld hl, $d182
    call Call_001_4c1a
    ld hl, $d18a
    call Call_001_4c1a
    ld hl, $d192
    call Call_001_4c1a
    ld hl, $d19a
    call Call_001_4c1a
    ld hl, $d1a2
    call Call_001_4c1a
    ld a, $01
    ld hl, $d1b2
    call Call_001_4c1a
    ld hl, $d1aa
    call Call_001_4c1a
    ld hl, $d1ba
    call Call_001_4c1a
    ld [$d1dc], a
    ld a, $ff
    ld [$d0f8], a
    xor a
    ldh [rNR50], a
    ld a, $08
    ldh [rNR10], a
    ld a, $00
    ldh [rNR51], a
    xor a
    ldh [rNR30], a
    ld a, $80
    ldh [rNR30], a
    ld a, $77
    ldh [rNR50], a
    jp Jump_001_4c20


Jump_001_4adf:
    ld l, a
    ld e, a
    ld h, $00
    ld d, h
    add hl, hl
    add hl, de
    ld de, $4000
    add hl, de
    ld a, h
    ld [$d1e0], a
    ld a, l
    ld [$d1e1], a
    ld a, [hl]
    and $c0
    rlca
    rlca
    ld c, a

Jump_001_4af8:
    ld d, c
    ld a, c
    add a
    add c
    ld c, a
    ld b, $00
    ld a, [$d1e0]
    ld h, a
    ld a, [$d1e1]
    ld l, a
    add hl, bc
    ld c, d
    ld a, [hl]
    and $0f
    ld e, a
    ld d, $00
    ld hl, $d11a
    add hl, de
    ld a, [hl]
    and a
    jr z, jr_001_4b34

    ld a, e
    cp $07
    jr nz, jr_001_4b2b

    ld a, [$d0f5]
    cp $14
    jr nc, jr_001_4b24

    ret


jr_001_4b24:
    ld a, [hl]
    cp $14
    jr z, jr_001_4b34

    jr c, jr_001_4b34

jr_001_4b2b:
    ld a, [$d0f5]
    cp [hl]
    jr z, jr_001_4b34

    jr c, jr_001_4b34

    ret


jr_001_4b34:
    xor a
    push de
    ld h, d
    ld l, e
    add hl, hl
    ld d, h
    ld e, l
    ld hl, $d10a
    add hl, de
    ld [hl+], a
    ld [hl], a
    ld hl, $d0fa
    add hl, de
    ld [hl+], a
    ld [hl], a
    pop de
    ld hl, $d11a
    add hl, de
    ld [hl], a
    ld hl, $d122
    add hl, de
    ld [hl], a
    ld hl, $d132
    add hl, de
    ld [hl], a
    ld hl, $d13a
    add hl, de
    ld [hl], a
    ld hl, $d142
    add hl, de
    ld [hl], a
    ld hl, $d14a
    add hl, de
    ld [hl], a
    ld hl, $d152
    add hl, de
    ld [hl], a
    ld hl, $d15a
    add hl, de
    ld [hl], a
    ld hl, $d162
    add hl, de
    ld [hl], a
    ld hl, $d16a
    add hl, de
    ld [hl], a
    ld hl, $d172
    add hl, de
    ld [hl], a
    ld hl, $d17a
    add hl, de
    ld [hl], a
    ld hl, $d182
    add hl, de
    ld [hl], a
    ld hl, $d18a
    add hl, de
    ld [hl], a
    ld hl, $d192
    add hl, de
    ld [hl], a
    ld hl, $d19a
    add hl, de
    ld [hl], a
    ld hl, $d1a2
    add hl, de
    ld [hl], a
    ld hl, $d12a
    add hl, de
    ld [hl], a
    ld a, $01
    ld hl, $d1b2
    add hl, de
    ld [hl], a
    ld hl, $d1aa
    add hl, de
    ld [hl], a
    ld hl, $d1ba
    add hl, de
    ld [hl], a
    ld a, e
    cp $04
    jr nz, jr_001_4bbc

    ld a, $08
    ldh [rNR10], a

jr_001_4bbc:
    ld a, c
    and a
    jp z, Jump_001_4c20

    dec c
    jp Jump_001_4af8


Jump_001_4bc5:
    ld a, $80
    ldh [rNR52], a
    ldh [rNR30], a
    xor a
    ldh [rNR51], a
    ldh [rNR32], a
    ld a, $08
    ldh [rNR10], a
    ldh [rNR12], a
    ldh [rNR22], a
    ldh [rNR42], a
    ld a, $40
    ldh [rNR14], a
    ldh [rNR24], a
    ldh [rNR44], a
    ld a, $77
    ldh [rNR50], a
    xor a
    ld [$d0f4], a
    ld [$d0f7], a
    ld [$d0f6], a
    ld [$d1dd], a
    ld [$d1df], a
    ld [$d1da], a
    ld [$d1db], a
    ld d, $a0
    ld hl, $d0fa
    call Call_001_4c1a
    ld a, $01
    ld d, $18
    ld hl, $d1aa
    call Call_001_4c1a
    ld [$d1dc], a
    ld [$d1de], a
    ld a, $ff
    ld [$d0f8], a
    ret


Call_001_4c1a:
    ld b, d

jr_001_4c1b:
    ld [hl+], a
    dec b
    jr nz, jr_001_4c1b

    ret


Jump_001_4c20:
    ld a, [$d0f5]
    ld l, a
    ld e, a
    ld h, $00
    ld d, h
    add hl, hl
    add hl, de
    ld de, $4000
    add hl, de
    ld e, l
    ld d, h
    ld hl, $d0fa
    ld a, [de]
    ld b, a
    rlca
    rlca
    and $03
    ld c, a
    ld a, b
    and $0f
    ld b, c
    inc b
    inc de
    ld c, $00

jr_001_4c42:
    cp c
    jr z, jr_001_4c4a

    inc c
    inc hl
    inc hl
    jr jr_001_4c42

jr_001_4c4a:
    push hl
    push bc
    push af
    ld b, $00
    ld c, a
    ld hl, $d11a
    add hl, bc
    ld a, [$d0f5]
    ld [hl], a
    pop af
    cp $03
    jr c, jr_001_4c63

    ld hl, $d122
    add hl, bc
    set 2, [hl]

jr_001_4c63:
    pop bc
    pop hl
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    inc c
    dec b
    ld a, b
    and a
    ld a, [de]
    inc de
    jr nz, jr_001_4c42

    ld a, [$d0f5]
    cp $14
    jr nc, jr_001_4c7c

    jr jr_001_4ca6

jr_001_4c7c:
    ld a, [$d0f5]
    cp $86
    jr z, jr_001_4ca6

    jr c, jr_001_4c87

    jr jr_001_4ca6

jr_001_4c87:
    ld hl, $d11e
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl], a
    ld hl, $d106
    ld de, $4ca7
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, [$d0f9]
    and a
    jr nz, jr_001_4ca6

    ldh a, [rNR50]
    ld [$d0f9], a
    ld a, $77
    ldh [rNR50], a

jr_001_4ca6:
    ret


    rst $38
    db $10
    dec d
    ld a, [de]
    rra
    db $10
    dec d
    ld a, [de]
    rra
    xor $dd
    cp e
    ld [hl], a
    xor $dd
    cp e
    ld [hl], a
    ld de, $4422
    adc b
    ld de, $4422
    adc b
    inc l
    ld hl, sp-$63
    ld hl, sp+$07
    ld sp, hl
    ld l, e
    ld sp, hl
    jp z, $23f9

    ld a, [$fa77]
    rst $00
    ld a, [$fb12]
    ld e, b
    ei
    sbc e
    ei
    jp c, $e2fb

    ld c, h
    ld a, [c]
    ld c, h
    ld [bc], a
    ld c, l
    ld [de], a
    ld c, l
    ld [hl+], a
    ld c, l
    ld [bc], a
    ld b, [hl]
    adc d
    adc $ff
    cp $ed
    call c, $a9cb
    add a
    ld h, l
    ld b, h
    inc sp
    ld [hl+], a
    ld de, $4602
    adc d
    adc $ef
    rst $38
    cp $ee
    db $dd
    res 5, c
    add a
    ld h, l
    ld b, e
    ld [hl+], a
    ld de, $6913
    cp l
    xor $ee
    rst $38
    rst $38
    db $ed
    sbc $ff
    rst $38
    xor $ee
    db $db
    sub [hl]
    ld sp, $4602
    adc d
    call $feef
    sbc $ff
    xor $dc
    cp d

jr_001_4d1d:
    sbc b
    db $76
    ld d, h
    ld [hl-], a
    db $10
    ld bc, $4523
    ld h, a
    adc d
    call $f7ee
    ld a, a
    xor $dc
    xor b
    db $76
    ld d, h
    ld [hl-], a
    db $10
    db $ed
    nop
    add d
    ldh a, [rPCM34]
    db $ec
    inc bc
    db $dd
    db $dd
    db $e4
    ld d, b
    cp $00

jr_001_4d3f:
    dec sp
    ld c, l
    db $ec
    ld [bc], a
    db $dd
    ret nc

    ld [$220d], a
    rst $08
    rst $08
    rst $08
    rst $08
    db $fd
    ld e, d
    ld c, l
    db $fd
    ld e, d
    ld c, l
    rst $08
    rst $08
    rst $08
    rst $08
    cp $00
    ld c, b
    ld c, l
    db $e3

jr_001_4d5b:
    jr nc, jr_001_4d1d

    rst $38
    call c, $fd13

jr_001_4d61:
    ld a, l
    ld c, l
    db $fd
    ld a, l
    ld c, l

jr_001_4d66:
    db $fd

jr_001_4d67:
    ld a, l
    ld c, l
    db $fd

jr_001_4d6a:
    ld a, l
    ld c, l
    rst $08
    rst $08

jr_001_4d6e:
    rst $08
    rst $08
    db $fd
    ld a, l
    ld c, l

jr_001_4d73:
    db $fd
    ld a, l
    ld c, l
    db $fd
    ld a, l
    ld c, l
    cp $00
    ld h, b
    ld c, l
    rst $38
    call c, $cf13
    rst $08
    rst $08
    jp $acfd


    ld c, l
    db $fd
    xor h
    ld c, l
    db $fd
    xor h
    ld c, l
    db $fd
    xor h
    ld c, l
    db $fd

jr_001_4d91:
    xor h
    ld c, l
    db $fd
    xor h
    ld c, l

jr_001_4d96:
    db $fd
    xor h
    ld c, l
    db $fd
    xor h

jr_001_4d9b:
    ld c, l
    db $fd

jr_001_4d9d:
    xor h
    ld c, l
    db $fd
    xor h
    ld c, l
    db $fd
    xor h
    ld c, l
    db $fd
    xor h
    ld c, l
    cp $00
    add b
    ld c, l
    or b
    ld b, $c4
    rst $38
    jr nz, jr_001_4d73

    inc sp
    rst $38
    jr nz, jr_001_4d67

    inc sp
    rst $38
    jr nz, jr_001_4d5b

    inc sp

jr_001_4dbb:
    rst $38
    jr nz, jr_001_4d3f

    inc sp
    rst $38
    daa
    add h
    scf
    ld h, $84
    ld [hl], $25
    add e
    dec [hl]
    inc h
    add e
    inc [hl]
    inc hl
    add d
    inc sp
    ld [hl+], a
    add c
    ld [hl-], a
    rst $38
    jr nz, jr_001_4e26

    ld a, [hl+]
    rst $38
    ld hl, $2b41
    jr nz, jr_001_4e3d

    ld a, [hl+]
    rst $38
    jr nz, jr_001_4d61

    db $10
    rst $38
    jr nz, jr_001_4d66

    inc hl
    rst $38
    jr nz, jr_001_4d6a

    dec h
    rst $38
    jr nz, jr_001_4d6e

    ld h, $ff
    jr nz, jr_001_4d91

    db $10
    rst $38
    jr nz, jr_001_4d96

    ld de, $20ff
    and d
    ld d, b
    rst $38
    jr nz, jr_001_4d9d

    jr jr_001_4e1e

    ld sp, $ff33
    ld [hl+], a
    sub c
    jr z, jr_001_4e25

    ld [hl], c
    jr @+$01

    jr nz, jr_001_4d9b

    ld [hl+], a
    rst $38
    jr nz, jr_001_4e7f

    ld [hl+], a
    rst $38
    jr nz, jr_001_4e73

    ld [hl+], a
    rst $38
    db $fc
    push af
    inc h
    di
    jr jr_001_4e21

    cpl
    push hl
    sbc b

jr_001_4e1d:
    rlca

jr_001_4e1e:
    jr z, @-$6d

    ld e, b

jr_001_4e21:
    rlca
    rst $38
    db $fc
    and b

jr_001_4e25:
    dec h

jr_001_4e26:
    or e
    ld [$2f07], sp
    push bc
    adc b
    rlca
    jr z, jr_001_4ea0

    ld c, b
    rlca
    rst $38
    inc hl
    and c
    inc e
    ld l, $94
    inc l
    jr z, jr_001_4dbb

    inc e
    rst $38
    db $fc

jr_001_4e3d:
    and b
    inc h
    di
    nop
    ld b, $28
    push de
    ld h, b
    rlca
    inc hl
    ld [c], a
    jr nz, jr_001_4e51

    jr z, jr_001_4e1d

jr_001_4e4c:
    db $10
    rlca
    rst $38
    db $fc
    ld e, d

jr_001_4e51:
    dec h
    or e
    pop af
    ld b, $27
    push bc
    ld d, d
    rlca
    inc hl
    and d
    ld de, $2807
    or c
    ld bc, $ff06
    inc hl
    and d
    inc a
    inc l
    sub h
    inc l

jr_001_4e68:
    inc hl
    add d
    inc e
    jr z, @+$73

    inc l
    rst $38
    db $ec
    nop
    jr z, jr_001_4e68

jr_001_4e73:
    add b
    inc b
    ld [hl+], a
    pop hl
    ldh [rTIMA], a
    jr z, jr_001_4e4c

    call c, $ff05
    db $fc

jr_001_4e7f:
    and l
    daa
    sub l
    ld b, c
    inc b
    ld [hl+], a
    add c
    ld hl, $2805

jr_001_4e89:
    ld h, c

jr_001_4e8a:
    ld a, [de]
    dec b
    rst $38
    db $fc
    ldh a, [rNR50]
    rst $30
    ld [$2606], sp
    and $00
    ld b, $26
    rst $10
    ldh a, [rTIMA]
    ld h, $c4
    ldh [rTIMA], a
    dec h

jr_001_4ea0:
    db $d3
    ret nz

    dec b
    inc h
    db $d3

jr_001_4ea5:
    and b
    dec b
    jr z, jr_001_4e8a

    add b
    dec b
    rst $38
    db $fc
    ld a, [bc]
    inc h

jr_001_4eaf:
    rst $00
    inc b
    dec b
    ld h, $a6

jr_001_4eb4:
    ld [bc], a
    dec b
    ld h, $97
    pop af
    inc b
    inc h
    or h
    pop hl
    inc b

jr_001_4ebe:
    dec h
    and e
    jp nz, $2404

    or e
    and e
    inc b
    jr z, jr_001_4e89

    add d
    inc b
    rst $38
    inc l
    db $e4

jr_001_4ecd:
    ld c, h
    ld a, [hl+]
    rst $00
    ld e, h
    inc l
    or [hl]
    ld c, h
    cpl
    and d
    ld e, h
    rst $38
    db $fc
    ldh a, [rNR50]
    rst $30
    and b
    ld b, $28
    and $a4
    ld b, $24
    sub $a0
    ld b, $2c
    db $d3
    jr nz, @+$08

    jr z, jr_001_4eaf

    inc h
    ld b, $24
    jp nz, $0620

    jr z, jr_001_4ea5

    db $10
    ld b, $ff
    db $fc
    ld e, d
    inc h
    rst $20
    ld bc, $2806
    sub $03
    ld b, $24
    add $01
    ld b, $2c
    jp $0581


    jr z, jr_001_4ebe

    add e
    dec b
    inc h
    or d
    add d
    dec b
    jr z, jr_001_4eb4

    ld [hl], c
    dec b
    rst $38
    daa
    sub $5c
    jr z, @-$18

    ld c, h
    inc h
    call nc, $245c
    call nc, $274c
    jp $284c


    and c
    ld e, h
    rst $38
    db $fc
    ld a, [bc]
    ld h, $e2
    nop
    dec b
    ld h, $e3
    add b
    dec b
    ld h, $d3
    ld [hl], b
    dec b
    jr z, @-$5d

    ld h, b
    dec b
    rst $38
    db $fc
    push af
    ld h, $e2

jr_001_4f40:
    add d
    inc b
    ld h, $d3
    ld bc, $2605
    or d
    ld [c], a
    inc b
    jr z, jr_001_4ecd

    pop bc
    inc b
    rst $38
    db $fc
    ld a, [$8326]
    ld b, a

jr_001_4f54:
    ld [bc], a
    cpl
    ld h, d
    ld h, $02

jr_001_4f59:
    inc h
    ld d, d
    ld b, l
    ld [bc], a
    add hl, hl
    ld h, e
    ld b, $02
    cpl
    add d
    dec h
    ld [bc], a
    cpl
    ld b, d
    rlca
    ld [bc], a
    rst $38
    jr z, jr_001_4f40

    adc h
    inc h
    ld [c], a
    sbc h
    cpl
    add $8c
    jr z, jr_001_4f59

    xor h
    cpl
    rst $10
    sbc h
    cpl
    ld a, [c]
    xor h
    rst $38
    db $fc
    ldh a, [rNR50]
    di
    ldh [rTMA], a
    cpl
    db $e4
    ld b, b
    ld b, $28
    pop bc
    jr nz, @+$08

    rst $38
    db $fc
    ld a, [bc]
    inc hl
    jp $0683


    ld l, $b4
    ld [bc], a
    ld b, $28
    and c
    ld bc, $ff06
    inc h
    db $d3
    ld e, h
    cpl
    and $4c
    jr z, jr_001_4f54

    ld e, h
    rst $38
    db $fc
    ldh a, [$2f]
    or $65
    dec b
    ld a, [hl+]
    db $e4
    ld a, h
    dec b
    inc hl
    jp nz, $055c

    cpl
    or d
    inc a
    dec b
    rst $38
    db $fc
    ld e, d
    ld l, $d6
    inc bc
    dec b
    add hl, hl
    or h
    dec de
    dec b
    inc h
    sub d
    ld a, [$2f04]
    and d
    db $db
    inc b
    rst $38
    inc l
    and $4c
    dec hl
    rst $10
    ld e, h
    cpl
    jp nz, $ff4c

    db $fc
    ldh a, [$2f]
    rst $30
    and b

jr_001_4fda:
    rlca
    ld h, $e6
    and e
    rlca
    ld a, [hl+]
    db $f4
    and b
    rlca
    db $fc
    and l
    ld a, [hl+]
    or $d8
    rlca
    inc h
    db $e3

jr_001_4feb:
    rst $10
    rlca
    cpl
    ld a, [c]
    ret c

    rlca
    rst $38
    db $fc
    dec b
    ld [hl+], a
    ld [$0000], sp
    cpl
    and a

jr_001_4ffa:
    and c
    ld b, $26
    add [hl]
    and d
    ld b, $2a
    ld [hl], h
    and c
    ld b, $fc
    ld e, a
    ld a, [hl+]
    db $76
    sub $06
    inc h
    add e
    reti


    ld b, $2f
    and d
    rst $10
    ld b, $ff
    ld [hl+], a
    ld a, [c]
    inc a

jr_001_5016:
    jr z, @-$1a

    ld a, $2f
    rst $10
    inc a
    ld h, $c5
    dec sp
    ld h, $e4
    dec a
    jr z, jr_001_4fda

    inc a
    ld h, $d4
    dec a
    jr z, jr_001_4feb

    dec sp
    rst $38
    db $fc
    ldh a, [$28]
    rst $30
    ldh [rTMA], a
    ld h, $e6
    push hl
    ld b, $23
    db $f4
    ldh [rTMA], a
    inc hl
    or $d0
    ld b, $23
    db $e3
    ret nz

    ld b, $24
    ld a, [c]
    or b
    ld b, $2f
    and d
    ret z

    ld b, $ff
    db $fc
    dec b
    inc hl
    ld [$0000], sp
    jr z, jr_001_4ffa

    and c
    ld b, $26
    add [hl]

jr_001_5057:
    and e
    ld b, $23
    ld [hl], h
    and c
    ld b, $23
    db $76
    sub c

jr_001_5060:
    ld b, $23
    add e
    add d
    ld b, $24
    and d
    ld [hl], c
    ld b, $2f
    ld [hl], d
    adc c
    ld b, $ff
    ld [hl+], a
    ld a, [c]
    inc a
    jr z, jr_001_5057

    ld a, $28
    rst $10
    inc a
    dec h
    push bc
    dec sp
    inc hl
    call nc, $222c
    or [hl]
    inc a
    inc hl
    and h
    inc l
    jr z, jr_001_5016

    inc a
    rst $38
    db $fc
    call z, $f124
    nop
    rlca
    inc h
    pop hl
    add b
    rlca
    inc h
    pop de
    ld b, b
    rlca
    inc h
    pop hl
    ld b, b
    rlca
    inc h
    pop af
    add b
    rlca
    inc h
    pop de

jr_001_509f:
    nop
    rlca
    inc h
    pop af
    ld bc, $2407
    pop de
    add d
    rlca
    inc h
    pop bc
    ld b, d
    rlca
    jr z, jr_001_5060

    ld b, c
    rlca
    rst $38
    db $fc
    ld b, h
    inc l
    ld [$0000], sp
    inc h
    pop af
    ld bc, $2407
    pop hl
    add d
    rlca
    inc h
    pop de
    ld b, c
    rlca
    inc h
    pop hl

jr_001_50c6:
    ld b, c
    rlca
    inc h
    pop af
    add d
    rlca
    jr z, jr_001_509f

    ld bc, $ff07
    cpl
    ld [$2400], sp
    ld [$2400], sp
    pop de
    ld c, h
    inc h
    or c
    inc l
    inc h
    pop de
    inc a
    inc h
    or c
    inc a
    inc h
    pop bc
    inc l
    jr z, @-$5d

    ld c, h
    rst $38
    db $fc
    call z, $f528
    nop
    ld b, $22
    jp nc, $0638

    ld [hl+], a
    jp nz, $0630

    ld [hl+], a
    jp nz, $0628

    ld [hl+], a
    or d
    jr nz, jr_001_5106

    ld [hl+], a
    or d
    db $10
    ld b, $22
    and d

jr_001_5106:
    jr jr_001_510e

    ld [hl+], a
    or d
    db $10
    ld b, $28
    pop bc

jr_001_510e:
    jr nz, @+$08

    rst $38
    db $fc
    ld b, h
    inc l
    jp $05c0


    inc hl
    or c
    ld sp, hl
    dec b
    ld [hl+], a
    and c
    pop af
    dec b
    ld [hl+], a
    and c
    jp hl


    dec b
    ld [hl+], a
    sub c
    pop hl
    dec b
    ld [hl+], a
    sub c
    reti


    dec b
    ld [hl+], a
    add c
    pop de
    dec b
    ld [hl+], a
    sub c
    reti


    dec b
    jr z, jr_001_50c6

    pop hl
    dec b
    rst $38
    db $fc
    adc b
    dec h
    ld a, [c]
    ld d, b
    ld b, $29
    pop de
    ld h, b
    ld b, $25
    ld [c], a
    ld [de], a
    ld b, $29
    pop bc
    ld [hl+], a
    ld b, $25
    ld a, [c]
    db $10
    ld b, $26
    pop de

jr_001_5150:
    jr nz, jr_001_5158

    cp $02
    jr c, jr_001_51a7

    rst $38
    db $fc

jr_001_5158:
    ld b, b
    inc h
    ld [$0000], sp
    dec h
    ld a, [c]
    ld d, c
    ld b, $29
    pop de
    ld h, c
    ld b, $25
    ld [c], a
    inc d
    ld b, $28
    pop bc
    inc h
    ld b, $25
    ld a, [c]
    ld de, $2c06
    pop de
    ld hl, $2506
    ld [c], a
    inc d
    ld b, $28
    pop bc
    inc h
    ld b, $25
    ld a, [c]
    ld de, $2406
    pop de
    ld hl, $ff06
    ld h, $d2
    inc e
    add hl, hl
    or c
    inc l
    jr z, jr_001_5150

    inc l
    add hl, hl
    or c
    inc a
    ld h, $c2
    inc l
    add hl, hl

jr_001_5196:
    and d
    inc a
    daa
    jp nz, $252c

    and c
    inc a
    add hl, hl
    jp nz, $242c

    and c
    inc a
    rst $38
    db $fc
    and l

jr_001_51a7:
    inc h
    pop hl
    nop
    rlca
    inc h
    ld a, [c]
    add b
    rlca
    ld [hl+], a
    sub d
    ld b, b
    rlca
    jr z, jr_001_5196

    nop
    ld b, $ff
    db $fc
    ld a, [bc]
    inc h
    or c
    pop hl
    ld b, $23
    jp nz, $06e1

    inc hl
    ld h, d
    add c
    ld b, $28
    or c
    pop hl
    dec b
    rst $38
    ld [hl+], a
    ld h, c

jr_001_51cd:
    ld [hl-], a
    ld [hl+], a
    ld h, c
    ld hl, $6128
    ld de, $fcff
    pop af
    inc h
    rst $30
    ret nz

    rlca
    inc l
    and $c2
    rlca
    ld h, $b5
    add b
    ld b, $24
    call nz, $0670
    inc h
    or l
    ld h, b
    ld b, $28
    pop bc
    ld b, b
    ld b, $ff
    db $fc
    call z, $c723
    add c
    rlca
    inc l
    or [hl]
    add b
    rlca
    ld h, $a5
    ld b, c
    ld b, $24
    call nz, $0632
    ld h, $b5
    ld hl, $2806
    and c
    ld [bc], a
    ld b, $ff
    inc hl
    db $e4
    inc a
    inc l
    sub $2c
    inc h
    db $e4
    inc a
    jr z, jr_001_51cd

jr_001_5216:
    ld e, h
    cpl
    jp nz, $ff5d

    db $fc

jr_001_521c:
    ret


    jr z, jr_001_5216

    add b
    ld b, $22
    rst $30
    ld h, b
    ld b, $21
    rst $20
    ld b, b
    ld b, $21
    rst $20
    jr nz, jr_001_5233

    cpl
    pop de
    nop
    ld b, $24
    rst $00

jr_001_5233:
    ld b, b
    rlca
    inc h
    and a
    jr nc, jr_001_5240

    cpl
    sub c
    jr nz, @+$09

    rst $38
    db $fc
    ld a, c

jr_001_5240:
    ld a, [hl+]
    rst $20

jr_001_5242:
    add d
    ld b, $22
    rst $20
    ld h, d
    ld b, $21
    rst $10
    ld b, d
    ld b, $21
    rst $10
    ld [hl+], a
    ld b, $2f
    pop bc
    ld [bc], a
    ld b, $24
    or a
    ld b, d
    rlca
    ld [hl+], a

jr_001_5259:
    sub a
    ld [hl-], a
    rlca
    cpl
    add c
    ld [hl+], a
    rlca
    rst $38
    inc h
    ld [hl], h
    ld hl, $7424
    db $10
    inc h
    ld [hl], c
    jr nz, @+$01

    db $fc
    ldh a, [rNR52]
    rst $30
    and b
    rlca
    jr z, jr_001_5259

    and h
    rlca
    inc h
    sub $a0
    rlca
    cpl
    db $d3
    jr nz, @+$09

    jr z, jr_001_5242

    inc hl
    rlca
    ld [hl+], a
    jp nz, $0728

    jr z, @-$4d

    jr nc, jr_001_5290

    rst $38
    db $fc
    ld a, [bc]
    inc h
    ld [$0000], sp

jr_001_5290:
    ld h, $a7
    ld b, c
    rlca
    jr z, jr_001_521c

    ld b, e

jr_001_5297:
    rlca
    inc h
    db $76
    ld b, c
    rlca
    dec l
    add e
    jp nz, $2706

    ld [hl], e
    pop bc
    ld b, $23
    add d
    call z, $2806
    ld [hl], c
    ret c

    ld b, $ff
    ld [hl+], a
    ld a, [c]
    ld c, h
    ld h, $e6
    ld a, [hl-]

jr_001_52b3:
    inc h
    rst $10
    ld a, [hl-]
    ld h, $d6
    inc l
    jr z, @-$19

    inc a
    inc l
    jp nc, $283d

    pop de
    inc l
    rst $38
    db $fc
    and l
    inc l
    ld a, [c]
    ld b, b
    inc b
    cpl
    db $e3
    and b
    inc b
    inc h
    jp nc, $0490

    jr z, @-$2d

    add b
    inc b
    rst $38
    db $fc
    xor $2b
    jp nc, $0438

    ld l, $c6

jr_001_52de:
    sbc b
    inc b
    inc hl

jr_001_52e1:
    or d
    adc b
    inc b
    jr z, jr_001_5297

    ld a, b
    inc b
    rst $38
    ld a, [hl+]
    and $6c
    cpl

jr_001_52ed:
    jp nc, $235c

    jp nz, $286c

    pop de
    ld e, h
    rst $38
    db $fc
    inc sp
    cpl
    or $c0

jr_001_52fb:
    dec b
    jr z, jr_001_52e1

    cp h
    dec b
    ld h, $d2
    ret nc

    dec b
    ld h, $b2
    ldh [rTIMA], a
    ld h, $c2
    ldh a, [rTIMA]
    jr z, @-$4d

    nop
    ld b, $ff
    db $fc
    sbc c
    ld l, $c6
    or c
    inc b
    daa
    jp $04ad


    dec h

jr_001_531c:
    or d
    pop bc
    inc b
    jr z, jr_001_52b3

    pop de
    inc b
    ld h, $a2
    pop hl
    inc b
    jr z, @-$6d

    pop af
    inc b
    rst $38
    ld a, [hl+]
    and $5c
    ld a, [hl+]
    sub $6c
    inc h
    jp nz, $264c

jr_001_5336:
    db $d3
    ld e, h
    jr z, jr_001_52ed

    ld c, h
    jr z, jr_001_52de

    ld e, h
    rst $38
    db $fc

jr_001_5340:
    ldh a, [$28]
    db $e4

jr_001_5343:
    sub b
    rlca
    cpl

jr_001_5346:
    push af
    ret nz

    rlca
    jr z, jr_001_531c

    ret c

    rlca
    rst $38
    db $fc
    and l
    ld a, [hl+]
    call nz, $0771
    cpl
    or [hl]
    and d
    rlca
    jr z, jr_001_52fb

    or a
    rlca
    rst $38
    jr z, jr_001_5343

jr_001_535f:
    ld c, h
    ld l, $c4
    inc a
    jr z, jr_001_5336

    inc l
    rst $38
    db $fc
    ldh a, [rNR50]
    di
    add b
    rlca
    cpl
    rst $20
    nop
    rlca
    jr z, jr_001_5346

    db $10
    rlca
    inc h
    jp nz, $0700

    inc h
    jp nc, $06f0

    jr z, jr_001_5340

    ldh [rTMA], a
    rst $38
    db $fc
    ld e, d
    ld h, $c3
    ld bc, $2e07
    or a
    add c
    ld b, $27
    or e
    sub d
    ld b, $23
    and d
    add c
    ld b, $24
    or d
    ld [hl], d
    ld b, $28
    and c
    ld h, c
    ld b, $ff
    ld h, $e3
    ld e, h
    ld l, $d6
    ld c, h
    ld h, $c6
    inc a
    inc hl
    or e
    ld c, h
    inc hl
    and d
    ld e, h
    jr z, jr_001_535f

    ld l, h
    rst $38
    db $fc
    ldh a, [$2f]
    rst $10
    add b
    rlca
    inc h
    and $a0
    rlca
    cpl
    jp nc, $0740

    rst $38
    db $fc
    ld e, d
    cpl
    rst $00
    ld d, e
    rlca
    dec h
    or [hl]
    ld [hl], d
    rlca
    cpl
    jp nz, $0711

    rst $38
    dec l
    or $4c
    inc h
    and $3c
    cpl
    ld a, [c]
    ld c, h
    rst $38
    db $fc
    rrca
    cpl
    rst $30
    nop
    dec b
    cpl
    rst $20
    ld [$2805], sp
    or h
    add b
    inc b
    cpl
    and d
    ld h, b
    inc b
    rst $38
    db $fc

jr_001_53ec:
    ld b, h
    ld l, $d7
    add c
    inc b
    ld l, $c7
    adc c
    inc b
    ld a, [hl+]
    or h
    ld bc, $2f04
    jp nz, $03e1

    rst $38
    ld l, $f7
    ld a, h
    inc l
    or $6c
    add hl, hl
    db $e4
    ld a, h
    cpl
    ld [c], a
    ld l, h
    rst $38
    db $fc
    ld d, b
    ld a, [hl+]
    push af
    add b
    ld b, $23
    ld [c], a
    and b
    ld b, $23
    ld a, [c]
    ret nz

    ld b, $23
    ld [c], a
    ldh [rTMA], a
    inc hl
    jp nc, $0700

    inc hl
    jp nz, $06e0

    inc hl
    jp nc, $06c0

    jr z, jr_001_53ec

    and b
    ld b, $ff
    db $fc
    rrca
    add hl, hl
    push de
    ld sp, $2306
    jp nc, $0652

    inc hl
    ld [c], a
    ld [hl], c
    ld b, $23
    or d
    sub c
    ld b, $23
    jp nz, $06b2

    inc hl
    or d
    sub c
    ld b, $23
    jp nz, $0671

    jr z, @-$4d

    ld d, c
    ld b, $ff
    ld h, $e3
    ld c, h
    inc h
    jp $253c


    call nc, $243c
    call nz, $262c
    or h
    inc a
    jr z, @-$3d

    inc l
    rst $38
    db $fc
    dec de
    daa
    jp nc, $0740

    cpl
    push hl
    ld h, b
    rlca
    cpl

jr_001_546f:
    pop bc
    jr nc, jr_001_5479

    rst $38
    db $fc
    add c
    ld [hl+], a
    jp nz, $0701

jr_001_5479:
    inc h
    jp nz, $0708

    cpl
    rst $10
    ld b, c
    rlca
    cpl
    and d
    ld bc, $ff07
    db $fc
    ldh a, [rNR52]
    rst $30
    ld b, b
    rlca
    inc l
    and $44
    rlca
    ld h, $d5
    ld d, b
    rlca
    inc h
    jp $0760


    inc hl

jr_001_5499:
    jp $0780


    jr z, jr_001_546f

jr_001_549e:
    and b
    rlca
    rst $38
    db $fc
    ld a, [bc]
    ld h, $c7
    ld bc, $2b07
    or [hl]
    ld [bc], a
    rlca
    ld h, $a5
    ld de, $2407
    sub e
    ld hl, $2307

jr_001_54b4:
    and e
    ld b, c
    rlca
    jr z, @-$6d

    ld h, d
    rlca

jr_001_54bb:
    rst $38
    inc hl
    ld [c], a
    inc a
    jr z, @-$28

    ld c, h
    dec h
    call nc, $2c3c
    rst $00
    ld c, h
    ld [hl+], a
    ld [c], a
    inc a

jr_001_54cb:
    jr z, jr_001_549e

    inc l
    rst $38
    db $fc
    ldh a, [rNR52]
    rst $30
    ret nz

    ld b, $2f
    rst $20
    nop
    rlca
    inc h
    db $f4
    ldh a, [rTMA]
    inc h
    db $e4
    ldh [rTMA], a
    jr z, jr_001_54b4

    ret nc

    ld b, $ff
    db $fc
    ld a, [bc]
    daa
    and $81
    ld b, $2e
    push de
    pop bc
    ld b, $24

jr_001_54f1:
    call nz, $06b1
    inc h
    call nc, $06a1
    jr z, jr_001_54bb

    sub c
    ld b, $ff
    ld a, [hl+]
    and [hl]
    inc a
    ld l, $94
    inc l
    dec h
    and e
    inc a
    jr z, jr_001_5499

    inc l
    rst $38
    db $fc
    push af
    daa
    sub $e1
    rlca
    ld h, $c6
    ld [c], a
    rlca
    add hl, hl
    sub $e1

jr_001_5517:
    rlca
    daa
    add $e0
    rlca
    dec h
    or [hl]
    ld [c], a
    rlca
    daa
    add $e1
    rlca
    ld h, $b6
    ldh [rTAC], a
    jr z, jr_001_54cb

    rst $18
    rlca
    rst $38
    db $fc
    ld b, h
    ld h, $c3
    ret


    rlca
    ld h, $b3
    rst $00
    rlca
    ld a, [hl+]
    call nz, $07c3
    jr z, jr_001_54f1

    rst $00
    rlca
    ld h, $c3
    ret


    rlca
    cpl
    and d
    push bc
    rlca
    rst $38
    dec l
    add hl, de
    ld a, h
    dec l
    rst $30
    adc h
    inc l
    sub $7c
    jr z, jr_001_5517

    ld l, h
    cpl
    or e
    ld e, h
    rst $38
    db $fc
    db $f4
    cpl
    ldh a, [rTIMA]
    rlca
    ld a, [hl+]

jr_001_555f:
    ldh [rP1], a
    rlca
    ld h, $b4
    db $10
    rlca

jr_001_5566:
    inc h
    db $d3
    nop
    rlca
    ld h, $b2
    jr nz, jr_001_5574

    jr z, @-$5d

    inc h
    ld b, $ff
    db $fc

jr_001_5574:
    ld [hl+], a
    cpl
    or b
    jp $2a06


    and b
    pop bc
    ld b, $26
    add h
    jp nc, $2406

    sub e

jr_001_5583:
    pop bc
    ld b, $26
    add d
    pop hl
    dec b
    jr z, @+$63

    add sp, $05
    rst $38
    ld h, $e6
    ld c, h
    cpl
    sub $3c
    ld a, [hl+]
    push bc
    ld c, d
    ld hl, $5bb2
    cpl
    jp nz, $ff4c

    db $fc
    ldh a, [rNR52]
    ld a, [c]
    nop
    ld b, $26
    ld [c], a
    ld b, b
    ld b, $26
    jp nc, $0680

    ld h, $e2
    ret nz

    ld b, $26
    jp nc, $0700

    ld h, $c2
    ld b, b
    rlca
    ld h, $b2
    add b
    rlca
    jr z, jr_001_555f

    ret nz

    rlca
    rst $38
    db $fc
    ld de, $0823
    ld bc, $2600
    jp nz, $05c1

    ld h, $b2
    ld [bc], a
    ld b, $26
    and d
    ld b, c
    ld b, $26
    or d

jr_001_55d5:
    add d
    ld b, $26
    and d
    jp nz, $2606

    sub d
    ld bc, $2607
    and d
    ld b, d
    rlca
    jr z, jr_001_5566

    add c

jr_001_55e6:
    rlca
    rst $38
    ld h, $08
    ld bc, $e225
    ld e, h
    dec h
    jp nz, $254c

    jp nc, $253c

    or d

jr_001_55f6:
    inc l
    dec h

jr_001_55f8:
    jp nz, $251c

    and d
    dec de
    dec h
    sub d
    ld a, [de]
    jr z, jr_001_5583

    jr @+$01

jr_001_5604:
    db $fc
    and l
    inc hl
    db $f4
    ld b, c
    ld b, $2d
    sub $21
    rlca
    jr z, jr_001_5604

    add hl, de
    rlca
    jr z, jr_001_55d5

    ld a, [de]
    rlca
    rst $38
    db $fc
    call z, $f424

jr_001_561b:
    add b
    dec b
    ld l, $e6
    ldh [rTMA], a
    jr z, jr_001_55f8

    ret c

    ld b, $28
    pop de
    call c, $ff06
    dec h
    call nz, $2d46
    and l
    ld b, h
    jr z, jr_001_55f6

    ld b, l
    jr z, jr_001_55e6

    ld b, h
    rst $38
    db $fc
    ldh a, [$2d]
    pop af
    ld de, $2d05
    pop hl
    dec d
    dec b
    dec l
    pop hl
    ld de, $2805
    pop de
    ld de, $ff05
    db $fc
    dec d
    inc l
    pop hl
    inc c

jr_001_564f:
    dec b
    inc l

jr_001_5651:
    pop de
    db $10
    dec b
    ld l, $c1
    inc c
    dec b
    jr z, jr_001_561b

    ld a, [bc]

jr_001_565b:
    dec b
    rst $38
    ld l, $f2
    ld h, l
    dec l
    ld [c], a

jr_001_5662:
    ld d, l
    ld l, $d2
    ld d, [hl]
    jr z, @-$2d

    ld h, [hl]
    rst $38
    db $fc
    dec de
    inc hl
    di

jr_001_566e:
    ld h, h
    dec b
    ld [hl+], a
    ld [c], a

jr_001_5672:
    ld b, h
    dec b
    dec h
    pop de
    ld [hl+], a
    dec b
    ld [hl+], a
    or d
    add h
    inc b
    jr z, jr_001_564f

    and d
    inc b
    inc hl
    di
    inc h
    dec b
    inc h
    db $e4
    db $e4
    inc b
    jr z, jr_001_565b

    ld [bc], a
    dec b
    rst $38
    db $fc
    call z, $d323
    ld h, b
    dec b
    ld [hl+], a
    jp nz, $0540

    dec h
    pop bc
    jr nz, @+$07

    ld [hl+], a
    sub d
    add b
    inc b
    jr z, jr_001_5662

    and b
    inc b
    inc hl
    db $d3
    jr nz, @+$07

    inc hl
    call nz, $04e0
    jr z, jr_001_566e

    nop
    dec b
    rst $38
    db $fc
    ld de, $3d22
    add c
    inc bc
    daa
    push af
    ld bc, $2106
    jp nz, $0481

    jr z, jr_001_5651

    add c
    inc bc
    rst $38
    db $fc
    xor $22
    ld a, $b0
    dec b
    daa
    push de
    ld e, l
    rlca
    ld hl, $b0b2
    ld b, $28
    ld h, c
    or b
    dec b
    rst $38
    ld [hl+], a
    sub d
    ld c, c

jr_001_56d9:
    daa
    or l
    add hl, hl
    ld hl, $39a2
    jr z, jr_001_5672

    ld c, c
    rst $38
    db $fc
    ldh a, [$2f]
    rst $30
    ret nz

    rlca
    ld h, $e4
    pop bc
    rlca
    ld a, [hl+]
    or $c0
    rlca
    inc h
    db $d3
    jp nz, $2807

    pop bc
    ret nz

    rlca
    rst $38
    db $fc
    ld e, a
    cpl
    sub a
    add c
    rlca
    ld h, $84
    add b
    rlca
    ld a, [hl+]
    sub [hl]
    add c
    rlca
    cpl
    add e
    add c
    rlca
    rst $38
    inc hl
    ld a, [c]
    inc a
    dec l
    and $2c
    cpl
    rst $10
    inc a
    jr z, jr_001_56d9

    inc l
    rst $38
    db $fc
    ldh a, [$2f]
    rst $30
    add b
    ld b, $2a
    and $84
    ld b, $2f
    rst $10
    sub b
    ld b, $28
    push de
    sub b
    ld b, $26
    call nz, $0688
    dec h
    db $d3
    ld [hl], b
    ld b, $24
    db $d3
    ld h, b
    ld b, $28
    pop bc

jr_001_573a:
    ld b, b
    ld b, $ff
    db $fc
    dec b
    cpl
    or a
    ld b, c
    ld b, $2a
    sub [hl]
    ld b, d
    ld b, $2f
    and a
    ld d, c
    ld b, $28

jr_001_574c:
    and l
    ld d, c
    ld b, $26
    sub h
    ld b, a
    ld b, $25
    and e

jr_001_5755:
    ld sp, $2406
    sub e
    ld [hl+], a
    ld b, $28
    ld [hl], c
    ld bc, $ff06
    cpl
    db $e4
    inc a
    ld a, [hl+]
    rst $00
    ld c, h
    ld a, [hl+]
    rst $00
    inc a
    inc l
    or a
    ld c, h
    cpl
    and d
    ld e, h
    rst $38
    db $fc
    and l
    ld h, $f4
    ld b, b
    rlca

jr_001_5776:
    cpl
    db $e3
    jr nc, jr_001_5781

    inc h
    db $f4
    ld b, b
    rlca
    dec h
    or e
    ld c, b

jr_001_5781:
    rlca
    jr z, jr_001_5755

    ld d, b
    rlca
    rst $38
    db $fc
    ld [hl], a
    ld h, $c3
    ld [de], a
    rlca
    cpl
    or e
    inc b
    rlca
    inc hl
    jp $0712


    inc h
    jp $0721


    jr z, jr_001_574c

    ld [hl-], a
    rlca
    rst $38
    jr z, jr_001_5776

    inc l
    inc l
    add $3c
    ld a, [hl+]
    or [hl]
    inc l
    jr z, jr_001_573a

    inc e
    rst $38
    ld hl, sp-$13
    ld bc, $f000
    ld [hl], a
    ld [$2606], a
    db $ec
    ld [bc], a
    add sp, -$2c
    or c
    push hl
    add c
    add c
    add c
    call c, $e4b3
    ld b, e
    rst $38
    ld hl, sp-$16
    ld [$ec27], sp
    ld [bc], a
    call nc, $e4c1
    ld b, c
    ld b, c
    ld b, c
    call c, $b3c3
    rst $38
    ld hl, sp-$2c
    db $10
    db $e4
    or b
    ret nz

    or b
    ret nz

    or b
    ret nz

    call c, $e410
    or c
    pop bc
    rst $38

jr_001_57e2:
    ld hl, sp-$13

jr_001_57e4:
    ld bc, $f000
    ld [hl], a
    db $ec
    ld [bc], a
    add sp, -$2b
    or h
    db $e4
    inc hl
    inc bc
    push hl
    sub a
    push de

jr_001_57f3:
    or d
    db $e4
    ld sp, $2131
    ld bc, $e501
    and c
    push de
    or h
    db $e4

jr_001_57ff:
    rlca
    rst $38
    ld hl, sp-$16
    ld [$ec27], sp
    ld [bc], a

jr_001_5807:
    push de
    push bc
    db $e4
    sub e
    ld d, e
    rlca
    push de
    jp nz, $a1a1

    and c
    ld [hl], c
    ld [hl], c
    and c
    push de
    call nz, $ff97
    ld hl, sp-$2b
    db $10

jr_001_581c:
    db $e3
    ld d, e
    inc sp
    rlca
    jr nc, jr_001_57e2

    jr nc, jr_001_57e4

    ld b, b
    ret nz

    ld d, b
    ret nz

    ld d, b
    ret nz

    ld [hl], b
    ret nz

    sub a
    rst $38
    db $ec
    ld [bc], a
    db $10
    ld a, [hl-]
    inc h
    ld a, [c]
    nop
    ld [bc], a
    db $10
    ld [hl+], a
    jr z, jr_001_581c

    nop
    ld [bc], a
    db $10
    ld [$ecff], sp
    ld [bc], a
    db $10
    rla
    cpl
    ldh a, [$f0]
    inc b
    cpl
    ld a, [c]

jr_001_5849:
    ld d, b
    ld b, $10
    ld [$ecff], sp
    ld [bc], a
    db $10
    inc d
    inc h
    ld a, [c]
    nop
    ld b, $24
    ld a, [c]
    nop
    ld b, $10
    rla
    cpl
    ld a, [c]
    nop
    ld b, $10
    ld [$21ff], sp
    ld [c], a
    inc sp
    jr z, jr_001_5849

    ld [hl+], a
    rst $38
    db $ec
    ld [bc], a
    jr nz, jr_001_57ff

    ret nz

    rlca
    jr nz, jr_001_57f3

    ret nc

    rlca
    jr nz, jr_001_5807

    ret nz

    rlca
    inc l
    and c
    ret nc

    rlca
    rst $38
    ld hl, sp-$13
    ld bc, $f000
    ld [hl], a
    db $ec
    ld [bc], a
    push de
    or c
    push hl
    sub c
    sub c
    ld [hl], c
    ld [hl], c
    ld d, c
    ld b, c
    ld d, c
    sub c
    db $e4
    inc bc
    ld b, e
    push hl
    ld d, e
    rst $38
    ld hl, sp-$14
    ld [bc], a
    push de
    jp nz, $51e3

    ld b, b
    ret nz

    ld hl, $c000
    db $e4
    and c
    db $e3
    ld bc, $4121
    ld d, e
    ld [hl], e
    ld d, e
    rst $38
    ld hl, sp-$2b
    db $10
    db $e3
    nop
    ret nz

    db $e4
    ld d, c
    db $e3
    nop
    ret nz

    db $e4
    and b
    ret nz

    sub b
    ret nz

    ld [hl], b
    ret nz

    ld d, b
    ret nz

    ld b, b
    ret nz

    db $e3
    ld d, b
    jp nz, $c200

    db $e4
    ld d, c
    pop bc
    rst $38
    ld hl, sp-$13
    ld bc, $f000
    ld [hl], a
    db $ec
    ld [bc], a
    add sp, -$2b
    and h
    push hl
    and e
    push de
    or c
    db $e4
    ld bc, $0000
    push de
    and h
    inc sp
    push de
    or c
    ld d, c
    ld d, b
    ld d, b
    push de
    or h
    and a
    rst $38
    ld hl, sp-$16
    inc b
    inc hl
    db $ec
    ld [bc], a
    push de
    pop de
    db $e4
    ld [hl], c
    ld [hl], b
    ld [hl], b
    push de
    call nz, $d533
    pop de

jr_001_58fb:
    add c
    add b
    add b
    and c
    and b
    and b
    push de
    call nz, $37e3
    rst $38
    ld hl, sp-$2b
    db $10
    db $e4
    inc sp
    add e
    ld [hl], e
    ld d, e
    scf
    rst $38
    db $ec
    nop
    db $10
    inc d
    inc h
    ld a, [c]
    nop
    ld b, $fe
    inc b
    db $10
    ld e, c
    cpl
    di
    nop
    ld b, $10
    ld [$ecff], sp
    ld [bc], a
    db $10
    dec d
    cpl
    ldh a, [$f0]
    inc b
    cpl
    ld a, [c]
    ld d, b
    ld b, $10
    ld [$ecff], sp
    ld [bc], a
    cpl
    ld a, [c]
    ret nz

    rlca
    cpl
    nop
    nop
    nop
    inc hl
    and c
    add b
    rlca
    inc hl
    and c
    nop
    rlca
    inc hl
    and c
    ld b, b
    rlca
    inc hl
    and c
    nop
    rlca
    inc hl
    and c
    add b
    rlca
    inc hl
    and c
    nop
    rlca
    inc hl
    and c
    ret nz

    rlca
    jr z, jr_001_58fb

    nop
    rlca
    rst $38
    db $ec
    ld [bc], a
    inc h
    ldh a, [rP1]
    ld b, $24
    ldh a, [rP1]
    inc b
    inc h
    ldh a, [rP1]
    ld [bc], a
    ld hl, $0000
    nop
    rst $38
    db $ec
    ld [bc], a
    ld h, $f0
    nop
    rlca
    inc h
    nop
    nop
    nop
    ld h, $f0
    nop
    rlca
    ld hl, $0000
    nop
    rst $38
    db $ec
    ld bc, $1710
    cpl
    rst $10
    nop
    ld b, $2f
    or a
    add b
    dec b
    cpl
    add a
    nop
    dec b
    cpl
    ld b, a
    add b
    inc b
    cpl
    rla
    nop
    inc b
    db $10
    ld [$ecff], sp
    ld [bc], a
    inc h
    nop
    nop
    nop
    ld [hl+], a
    pop af
    add b
    ld b, $21
    nop
    nop
    nop
    inc h
    pop af
    add b
    rlca
    inc h
    nop
    nop
    nop
    rst $38
    db $ec
    ld [bc], a
    db $10
    inc l
    inc h
    ld a, [c]
    nop
    dec b
    db $10
    ld [hl+], a
    ld [hl+], a
    pop af
    nop
    dec b
    db $10
    ld [$0021], sp
    nop
    nop
    rst $38
    db $ec
    ld bc, $1710
    cpl
    rst $10
    nop
    dec b
    cpl
    or a
    add b
    dec b
    cpl
    add a
    nop
    ld b, $2f
    ld b, a
    add b
    ld b, $2f
    rla
    nop
    rlca
    db $10
    ld [$ecff], sp
    ld bc, $1710
    cpl
    rst $10
    nop
    rlca
    cpl
    or a
    add b
    ld b, $2f
    add a
    nop
    ld b, $2f
    ld b, a
    add b
    dec b
    cpl
    rla
    nop
    dec b
    db $10
    ld [$ecff], sp
    ld bc, $1610
    cpl
    jp nc, $0500

    db $10
    ld [$ecff], sp
    ld [bc], a
    db $10
    sub l
    cpl
    ld a, [c]
    nop
    inc b
    db $10
    ld [$22ff], sp
    pop af
    ld [hl-], a
    ld [hl+], a
    nop
    nop
    ld [hl+], a
    pop af
    ld [hl+], a
    ld hl, $0000
    rst $38
    ld [hl+], a
    pop af
    ld [de], a
    ld [hl+], a
    nop
    nop
    ld [hl+], a
    and c
    ld [de], a
    ld [hl+], a
    nop
    nop
    ld [hl+], a
    pop de
    ld [de], a
    ld [hl+], a
    nop
    nop
    ld [hl+], a
    add c
    ld [de], a
    ld [hl+], a
    nop
    nop
    ld [hl+], a
    or c
    ld [de], a
    ld [hl+], a
    nop
    nop
    ld [hl+], a
    ld h, c
    ld [de], a
    ld [hl+], a
    nop
    nop
    ld [hl+], a
    sub c
    ld [de], a
    ld [hl+], a
    nop
    nop
    ld [hl+], a
    ld b, c
    ld [de], a
    ld [hl+], a
    nop
    nop
    rst $38
    db $ec
    inc bc
    db $10
    ld e, d
    inc h
    ldh a, [rP1]
    dec b
    db $10
    ld [$0024], sp
    nop
    nop
    cpl
    ldh a, [rP1]
    dec b
    ld hl, $0000
    nop
    rst $38
    db $ec
    inc bc
    inc h
    ldh a, [rSB]
    inc b
    inc h
    nop
    nop
    nop
    cpl
    ldh a, [rSB]
    inc b
    ld hl, $0000
    nop
    rst $38
    db $ec

jr_001_5a7f:
    nop
    db $10
    rla
    cpl
    jp nc, $0700

    db $10
    ld [$24ff], sp
    and d
    inc hl
    jr z, jr_001_5a7f

    inc [hl]
    cpl
    nop

jr_001_5a91:
    nop
    ld [hl+], a
    rst $30
    inc h
    ld [hl+], a
    rst $30
    inc [hl]
    inc h
    rst $30
    ld b, h
    jr z, jr_001_5a91

    ld d, l
    jr z, jr_001_5a91

    ld b, h
    rst $38
    db $ec
    ld [bc], a
    cpl
    ldh a, [rP1]
    dec b
    inc h
    nop
    nop
    nop
    cpl
    ldh a, [rP1]
    dec b
    cpl
    ldh a, [rP1]
    dec b
    cpl
    ldh a, [rP1]
    dec b
    cpl
    ldh a, [rP1]
    dec b
    cpl
    ld a, [c]
    nop
    dec b
    rst $38
    db $ec
    inc bc
    cpl
    ldh a, [$82]
    inc b
    inc h
    nop
    nop
    nop
    cpl
    ldh a, [$82]
    inc b
    cpl
    ldh a, [$82]
    inc b
    cpl

jr_001_5ad4:
    ldh a, [$82]
    inc b
    cpl
    ldh a, [$82]
    inc b
    cpl
    ld a, [c]
    add d
    inc b
    rst $38
    db $ec
    ld bc, $3a10
    inc h
    ld a, [c]
    nop
    dec b
    db $10
    ld [hl+], a
    inc h
    ld [c], a
    nop
    dec b
    db $10
    ld a, [hl-]
    inc h
    ld a, [c]
    nop
    rlca
    db $10
    ld [hl+], a
    cpl
    ld [c], a
    nop

jr_001_5af9:
    rlca
    db $10
    ld [$22ff], sp
    rst $30
    inc h
    ld [hl+], a
    rst $30
    inc [hl]
    inc h
    rst $30
    ld b, h
    jr z, @-$0a

    ld d, l
    jr z, @-$0d

    ld b, h
    rst $38
    add hl, hl
    pop af
    ld b, h
    jr z, @-$2d

    ld b, e
    rst $38
    db $ec
    ld [bc], a
    jr z, jr_001_5af9

    ld b, b
    rlca
    rst $38
    db $ec
    ld [bc], a
    ld [hl+], a
    ld [$0000], sp
    jr z, jr_001_5ad4

    ld b, c
    rlca
    rst $38
    db $ec
    ld [bc], a
    inc h
    pop af
    add b
    rlca
    rst $38
    db $ec
    ld [bc], a
    ld hl, $0008

jr_001_5b32:
    nop
    inc h
    and c
    ld h, c
    rlca
    rst $38
    db $ec
    ld [bc], a
    inc h
    pop hl
    nop
    rlca
    jr z, jr_001_5b32

    ldh [rTAC], a
    rst $38
    db $ec
    ld [bc], a
    ld hl, $0008
    nop
    inc h
    sub c
    pop bc
    ld b, $28
    and d
    and c
    rlca
    rst $38
    db $ec
    ld [bc], a
    db $10
    ld e, d
    cpl
    pop af
    nop
    inc bc
    db $10
    ld [$22ff], sp
    pop af
    ld d, h
    inc l
    ld [hl], c
    inc hl
    ld [hl+], a
    or c
    ld d, h
    inc l
    ld h, c
    inc hl
    ld h, $41
    ld d, h
    rst $38
    db $ec
    ld [bc], a
    inc h
    db $f4
    nop
    rlca
    ld [hl+], a
    db $e4
    nop
    ld b, $22
    db $e4
    add b
    ld b, $22
    db $e4
    ret nz

    ld b, $22
    db $e4
    nop
    rlca
    ld [hl+], a
    db $e4
    and b
    rlca
    cpl
    ld a, [c]
    ldh [rTAC], a
    rst $38
    db $ec
    ld [bc], a
    inc h
    ld [$0000], sp
    ld [hl+], a
    call nc, $0701
    ld [hl+], a
    call nz, $0601
    ld [hl+], a
    call nz, $0681
    ld [hl+], a
    call nz, $06c1
    ld [hl+], a
    call nz, $0701
    ld [hl+], a
    call nz, $07a1
    cpl
    jp nc, $07e1

    rst $38
    ld [$1410], a
    call c, $e310
    ld b, c
    ld d, c
    ld [hl], e
    sub c
    ld [hl], c
    ld [c], a
    inc bc
    ld bc, $0121
    db $e3
    ld [hl], c
    sub c
    ld d, c
    ld [hl], a
    set 7, a
    db $ec
    ld [bc], a
    cpl
    di
    jr nc, jr_001_5bd3

    jr z, jr_001_5c33

    jr nc, jr_001_5bd7

    cpl
    db $f4
    nop

jr_001_5bd3:
    rlca
    cpl
    ld [hl], h
    nop

jr_001_5bd7:
    rlca
    cpl
    ld b, h
    nop
    rlca
    cpl
    inc h
    nop
    rlca
    rst $38
    db $fc
    ldh a, [$2f]
    ldh [$80], a
    rlca
    cpl
    ldh a, [$84]
    rlca
    cpl
    jp $05e0


    cpl
    call nz, $0600
    ld a, [hl+]
    ld l, h
    add b
    rlca
    jr z, jr_001_5c6a

    add h
    rlca
    rst $38
    db $fc
    dec b
    cpl
    and b
    ld b, c
    rlca
    cpl
    or b
    ld b, e
    rlca
    cpl
    sub e
    or c
    dec b
    cpl
    sub h
    pop bc
    dec b
    ld a, [hl+]
    ld c, h
    ld b, c
    rlca
    jr z, jr_001_5c45

    ld b, [hl]
    rlca
    rst $38
    ld [hl+], a
    ld a, [c]
    ld c, h
    ld h, $e0
    ld a, [hl-]
    cpl
    ret nc

    ld a, [hl-]
    jr z, @-$2e

    inc l
    ld h, $e6
    ld c, h
    inc l
    ld a, l
    ld c, h
    cpl
    db $d3
    ld c, h
    rst $38
    nop
    nop
    nop
    nop
    nop
    nop

jr_001_5c33:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_001_5c45:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

jr_001_5c6a:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
