stageSpritesThenloadSprites:
        jsr loadSpriteIntoOamStaging
        jsr stageSpriteForCurrentPiece
        jmp stageSpriteForNextPiece

render_endingSkippable_A:
        jsr     render_ending
        jsr     updateAudioWaitForNmiAndResetOamStaging
        lda     newlyPressedButtons_player1
        and     #BUTTON_START
        beq     render_endingSkippable_A
        rts

render_endingSkippable_B:
        ldy     player2_score
        bne     @ret
        sta     sleepCounter
@sleep:
        jsr     render_ending
        jsr     updateAudioWaitForNmiAndResetOamStaging
        lda     newlyPressedButtons_player1
        and     #BUTTON_START
        bne     @skipped
        lda     sleepCounter
        bne     @sleep
        beq     @ret
@skipped:
        inc     player2_score
@ret:   rts

clearLineCounterThenUpdateAudio2:
        lda #$00
        sta player1_completedLines
        jmp updateAudio2

; menu das code by Kirjava
menuThrottle: ; add DAS-like movement to the menu
        sta menuThrottleTmp
        lda newlyPressedButtons_player1
        cmp menuThrottleTmp
        beq menuThrottleNew
        lda heldButtons_player1
        cmp menuThrottleTmp
        bne @endThrottle
        dec menuMoveThrottle
        beq menuThrottleContinue
@endThrottle:
        lda #0
        rts

menuThrottleStart := $10
menuThrottleRepeat := $4
menuThrottleNew:
        lda #menuThrottleStart
        sta menuMoveThrottle
        rts
menuThrottleContinue:
        lda #menuThrottleRepeat
        sta menuMoveThrottle
        rts

; Anydas code by HydrantDude
renderAnydasMenu:
        lda gameMode
        cmp #$01
        beq @continueRendering
        jmp @clearOAMStagingAndReturn
@continueRendering:
        lda #$26
        sta PPUADDR
        lda #$70
        sta PPUADDR
        ldx anydasDASValue
        lda byteToBcdTable,x
        jsr twoDigsToPPU
        lda #$FF
        sta PPUDATA

        lda #$26
        sta PPUADDR
        lda #$90
        sta PPUADDR
        ldx anydasARRValue
        lda byteToBcdTable,x
        jsr twoDigsToPPU
        lda #$FF
        sta PPUDATA

        lda #$26
        sta PPUADDR
        lda #$B5
        sta PPUADDR
        lda anydasARECharge
        bne @areChargeOn
        lda #$0F
        sta PPUDATA
        sta PPUDATA
        bne @drawArrow
@areChargeOn:
        lda #$17
        sta PPUDATA
        lda #$FF
        sta PPUDATA
@drawArrow:
        lda #$FF
        sta PPUDATA

        lda #$22
        sta PPUADDR
        lda #$D3
        sta PPUADDR
        lda levelOffset
        jsr renderByteBCD
        lda #$FF
        sta PPUDATA

        lda #$22
        sta PPUADDR
        lda #$72
        clc
        ldx anydasMenu
        adc arrowOffsets,x
        sta PPUADDR
        lda #$63
        sta PPUDATA

@clearOAMStagingAndReturn:
        lda #$00
        sta oamStagingLength
        jmp returnFromAnydasRender

anydasControllerInput:
        jsr pollController
        lda gameMode
        cmp #$01
        beq @getInputs
        rts
@getInputs:

; check for default first
        lda heldButtons_player1
        and #BUTTON_SELECT
        beq @resetResetCounter
@checkDuration:
        inc resetCounter
        lda resetCounter
        cmp #$40
        bne @checkDown
        jsr defaultScoresAndSettings
        jsr copyHighScoresToSram

@resetResetCounter:
        lda #$00
        sta resetCounter

@checkDown:
        lda #BUTTON_DOWN
        jsr menuThrottle
        beq @downNotPressed
        lda #$01
        sta soundEffectSlot1Init
        inc anydasMenu
        lda anydasMenu
        cmp #$04
        bne @downNotPressed
        lda #$00
        sta anydasMenu
@downNotPressed:
        lda #BUTTON_UP
        jsr menuThrottle
        beq @upNotPressed
        lda #$01
        sta soundEffectSlot1Init
        dec anydasMenu
        bpl @upNotPressed
        lda #$03
        sta anydasMenu
@upNotPressed:
        lda #BUTTON_LEFT
        jsr menuThrottle
        beq @leftNotPressed
        lda #$01
        sta soundEffectSlot1Init
        ldx anydasMenu
        dec anydasDASValue,x
        lda anydasDASValue,x
        cmp #$FF
        bne @leftNotPressed
        lda anydasUpperLimit,x
        sta anydasDASValue,x
        dec anydasDASValue,x
@leftNotPressed:
        lda #BUTTON_RIGHT
        jsr menuThrottle
        beq @rightNotPressed
        lda #$01
        sta soundEffectSlot1Init
        ldx anydasMenu
        inc anydasDASValue,x
        lda anydasDASValue,x
        cmp anydasUpperLimit,x
        bne @rightNotPressed
        lda #$00
        sta anydasDASValue,x
@rightNotPressed:
        jmp copyAnydasOptionsToSram

arrowOffsets:
        .byte $00,$20,$45,$64

anydasUpperLimit:
        .byte $32,$32,$02,$F7

; 0 Arr code by Kirby703
checkFor0Arr:
        lda     anydasARRValue
        beq     @zeroArr
        jmp     buttonHeldDown
@zeroArr:
        lda     heldButtons
        and     #BUTTON_RIGHT
        beq     @checkLeftPressed
@shiftRight:
        inc     tetriminoX
        jsr     isPositionValid
        bne     @shiftBackToLeft
        lda     #$03
        sta     soundEffectSlot1Init
        jmp     @shiftRight
@checkLeftPressed:
        lda     heldButtons
        and     #BUTTON_LEFT
        beq     @leftNotPressed
@shiftLeft:
        dec     tetriminoX
        jsr     isPositionValid
        bne     @shiftBackToRight
        lda     #$03
        sta     soundEffectSlot1Init
        jmp     @shiftLeft
@shiftBackToLeft:
        dec     tetriminoX
        dec     tetriminoX
@shiftBackToRight:
        inc     tetriminoX
        lda     #$01
        sta     autorepeatX
@leftNotPressed:
        rts

renderByteBCD:
        ldx #$0
renderByteBCDStart:
        sta generalCounter
        cmp #200
        bcc @maybe100
        lda #2
        sta PPUDATA
        lda generalCounter
        sbc #200
        jmp @byte
@maybe100:
        cmp #100
        bcc @not100
        lda #1
        sta PPUDATA
        lda generalCounter
        sbc #100
        jmp @byte
@not100:
        cpx #0
        bne @main
        lda #$FF
        sta PPUDATA
@main:
        lda generalCounter
@byte:
        tax
        lda longerByteToBCDTable, x
        jmp twoDigsToPPU

validateSRAMThenInitRam:
        ldy #$06
        sty tmp2
        ldy #$00
        sty tmp1
        lda #$00
@zeroOutPages:
        sta (tmp1),y
        dey
        bne @zeroOutPages
        dec tmp2
        bpl @zeroOutPages

        lda sramInitMagic
        cmp #'Z'
        bne @resetThenInitRam

        lda sramInitMagic+1
        cmp #'O'
        bne @resetThenInitRam

        lda sramInitMagic+2
        cmp #'H'
        bne @resetThenInitRam

        lda sramInitMagic+3
        cmp #'A'
        bne @resetThenInitRam

        lda sramInitMagic+4
        cmp #'S'
        bne @resetThenInitRam

        jmp @copySramtoRamThenInitRam

@resetThenInitRam:
        jsr defaultScoresAndSettings
        jsr copyHighScoresToSram
        jsr copyAnydasOptionsToSram
        jsr copyGameSettingsToSram

    ; magic number
        lda #'Z'
        sta sramInitMagic
        lda #'O'
        sta sramInitMagic+1
        lda #'H'
        sta sramInitMagic+2
        lda #'A'
        sta sramInitMagic+3
        lda #'S'
        sta sramInitMagic+4
        jmp continueWarmBootInit

@copySramtoRamThenInitRam:
        ldx #0
@copyAnydasOptions:
        lda sramAnydasSettings,x
        sta anydasSettings,x
        inx
        cpx #ANYDAS_OPTIONS_LENGTH
        bne @copyAnydasOptions

        ldx #0
@copyHighScores:
        lda sramHighScores,x
        sta highScores,x
        inx
        cpx #HIGHSCORES_LENGTH
        bne @copyHighScores

        lda sramGameType
        sta gameType
        lda sramMusicType
        sta musicType
        lda sramStartLevel
        sta player1_startLevel
        lda sramStartHeight
        sta player1_startHeight

        jmp continueWarmBootInit

copyAnydasOptionsToSram:
        ldx #0
@copyAnydasOptions:
        lda anydasSettings,x
        sta sramAnydasSettings,x
        inx
        cpx #ANYDAS_OPTIONS_LENGTH
        bne @copyAnydasOptions
        rts

copyGameSettingsToSram:
        lda player1_startHeight
        sta sramStartHeight
        lda player1_startLevel
        sta sramStartLevel
        lda gameType
        sta sramGameType
        lda musicType
        sta sramMusicType
        rts

defaultScoresAndSettings:
    ; default anydas
        lda #$10
        sta anydasDASValue
        lda #$06
        sta anydasARRValue
        lda #$00
        sta anydasARECharge
        lda #$0A
        sta levelOffset

    ; default settings
        lda #$00
        sta musicType
        sta gameType
        sta player1_startLevel
        sta player1_startHeight

    ; default high scores
        ldx #$00
; Only run on cold boot
@initHighScoreTable:
        lda defaultHighScoresTable,x
        cmp #$FF
        beq @ret
        sta highScoreNames,x
        inx
        jmp @initHighScoreTable
@ret:
        rts

copyGameSettingsThenWait:
        jsr copyGameSettingsToSram
        jmp updateAudioWaitForNmiAndResetOamStaging

copyHighScoresToSramThenWait:
        jsr copyHighScoresToSram
        jmp updateAudioWaitForNmiAndResetOamStaging

copyHighScoresToSram:
        ldx #0
@copyHighScores:
        lda highScores,x
        sta sramHighScores,x
        inx
        cpx #HIGHSCORES_LENGTH
        bne @copyHighScores
        rts

; longer byte table from TetrisGYM
longerByteToBCDTable: ; original goes to 49
        .byte   $00,$01,$02,$03,$04,$05,$06,$07
        .byte   $08,$09,$10,$11,$12,$13,$14,$15
        .byte   $16,$17,$18,$19,$20,$21,$22,$23
        .byte   $24,$25,$26,$27,$28,$29,$30,$31
        .byte   $32,$33,$34,$35,$36,$37,$38,$39
        .byte   $40,$41,$42,$43,$44,$45,$46,$47
        .byte   $48,$49
        ; 50 extra bytes is shorter than a conversion routine (and super fast)
        ; (used in renderByteBCD)
        .byte   $50,$51,$52,$53,$54,$55,$56,$57
        .byte   $58,$59,$60,$61,$62,$63,$64,$65
        .byte   $66,$67,$68,$69,$70,$71,$72,$73
        .byte   $74,$75,$76,$77,$78,$79,$80,$81
        .byte   $82,$83,$84,$85,$86,$87,$88,$89
        .byte   $90,$91,$92,$93,$94,$95,$96,$97
        .byte   $98,$99
