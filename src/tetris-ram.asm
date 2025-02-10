.zeropage
tmp1: .res 1                                     ; $0000
tmp2: .res 1                                     ; $0001
tmp3: .res 1                                     ; $0002
.res 2
tmpBulkCopyToPpuReturnAddr: .res 2               ; $0005
.res 13
patchToPpuAddr: .res 1                           ; $0014
.res 2
rng_seed: .res 2                                 ; $0017
spawnID: .res 1                                  ; $0019
spawnCount: .res 1                               ; $001A

; Anydas
resetCounter: .res $1
anydasMenu: .res $1                              ; $001C

anydasSettings:
anydasDASValue: .res $1                          ; $001D
anydasARRValue: .res $1                          ; $001E
anydasARECharge: .res $1                         ; $001F
levelOffset: .res $1                             ; $0020
anydasSettingsEnd:
ANYDAS_OPTIONS_LENGTH = <(anydasSettingsEnd-anydasSettings)

.res 18
verticalBlankingInterval: .res 1                 ; $0033
unused_0E: .res 1                                ; $0034 Always $0E
.res 11
.if NWC = 1
; NWC vars overlap with player1, defined below
.res 27
.else
tetriminoX: .res 1                               ; $0040 Player data is $20 in size. It is copied here from $60 or $80, processed, then copied back
tetriminoY: .res 1                               ; $0041
currentPiece: .res 1                             ; $0042 Current piece as an orientation ID
.res 1
levelNumber: .res 1                              ; $0044
fallTimer: .res 1                                ; $0045
autorepeatX: .res 1                              ; $0046
startLevel: .res 1                               ; $0047
playState: .res 1                                ; $0048
vramRow: .res 1                                  ; $0049 Next playfield row to copy. Set to $20 when playfield copy is complete
completedRow: .res 4                             ; $004A Row which has been cleared. 0 if none complete
autorepeatY: .res 1                              ; $004E
holdDownPoints: .res 1                           ; $004F
lines: .res 2                                    ; $0050
rowY: .res 1                                     ; $0052
score: .res 3                                    ; $0053
completedLines: .res 1                           ; $0056
lineIndex: .res 1                                ; $0057 Iteration count of playState_checkForCompletedRows
curtainRow: .res 1                               ; $0058
startHeight: .res 1                              ; $0059
garbageHole: .res 1                              ; $005A Position of hole in received garbage
.endif
.res 5
player1_tetriminoX: .res 1                       ; $0060
player1_tetriminoY: .res 1                       ; $0061
player1_currentPiece: .res 1                     ; $0062
.res 1
player1_levelNumber: .res 1                      ; $0064
player1_fallTimer: .res 1                        ; $0065
player1_autorepeatX: .res 1                      ; $0066
player1_startLevel: .res 1                       ; $0067
player1_playState: .res 1                        ; $0068
player1_vramRow: .res 1                          ; $0069
player1_completedRow: .res 4                     ; $006A
player1_autorepeatY: .res 1                      ; $006E
player1_holdDownPoints: .res 1                   ; $006F
player1_lines: .res 2                            ; $0070
player1_rowY: .res 1                             ; $0072
player1_score: .res 3                            ; $0073
player1_completedLines: .res 1                   ; $0076
.res 1
player1_curtainRow: .res 1                       ; $0078
player1_startHeight: .res 1                      ; $0079
player1_garbageHole: .res 1                      ; $007A
.res 5
player2_tetriminoX: .res 1                       ; $0080
player2_tetriminoY: .res 1                       ; $0081
player2_currentPiece: .res 1                     ; $0082
.res 1
player2_levelNumber: .res 1                      ; $0084
player2_fallTimer: .res 1                        ; $0085
player2_autorepeatX: .res 1                      ; $0086
player2_startLevel: .res 1                       ; $0087
player2_playState: .res 1                        ; $0088
player2_vramRow: .res 1                          ; $0089
player2_completedRow: .res 4                     ; $008A
player2_autorepeatY: .res 1                      ; $008E
player2_holdDownPoints: .res 1                   ; $008F
player2_lines: .res 2                            ; $0090
player2_rowY: .res 1                             ; $0092
player2_score: .res 3                            ; $0093
player2_completedLines: .res 1                   ; $0096
.res 1
player2_curtainRow: .res 1                       ; $0098
player2_startHeight: .res 1                      ; $0099
player2_garbageHole: .res 1                      ; $009A
.res 5
spriteXOffset: .res 1                            ; $00A0
spriteYOffset: .res 1                            ; $00A1
spriteIndexInOamContentLookup: .res 1            ; $00A2
outOfDateRenderFlags: .res 1                     ; $00A3 Bit 0-lines 1-level 2-score 6-stats 7-high score entry letter
twoPlayerPieceDelayCounter: .res 1               ; $00A4 0 is not delaying
twoPlayerPieceDelayPlayer: .res 1                ; $00A5
twoPlayerPieceDelayPiece: .res 1                 ; $00A6 The future value of nextPiece, once the delay completes
gameModeState: .res 1                            ; $00A7 For values, see playState_checkForCompletedRows
generalCounter: .res 1                           ; $00A8 canon is legalScreenCounter2
generalCounter2: .res 1                          ; $00A9
generalCounter3: .res 1                          ; $00AA
generalCounter4: .res 1                          ; $00AB
generalCounter5: .res 1                          ; $00AC
selectingLevelOrHeight: .res 1                   ; $00AD 0-level, 1-height
originalY: .res 1                                ; $00AE
dropSpeed: .res 1                                ; $00AF
tmpCurrentPiece: .res 1                          ; $00B0 Only used as a temporary
frameCounter: .res 2                             ; $00B1
oamStagingLength: .res 1                         ; $00B3
.res 1
newlyPressedButtons: .res 1                      ; $00B5 Active player's buttons
heldButtons: .res 1                              ; $00B6 Active player's buttons
activePlayer: .res 1                             ; $00B7 Which player is being processed (data in $40)
playfieldAddr: .res 2                            ; $00B8 HI byte is leftPlayfield in canon. Current playfield being processed: $0400 (left; 1st player) or $0500 (right; 2nd player)
allegro: .res 1                                  ; $00BA
pendingGarbage: .res 1                           ; $00BB Garbage waiting to be delivered to the current player. This is exchanged with pendingGarbageInactivePlayer when swapping players.
pendingGarbageInactivePlayer: .res 1             ; $00BC canon is totalGarbage
renderMode: .res 1                               ; $00BD
numberOfPlayers: .res 1                          ; $00BE
nextPiece: .res 1                                ; $00BF Stored by its orientation ID
gameMode: .res 1                                 ; $00C0 0=legal, 1=title, 2=type menu, 3=level menu, 4=play and ending and high score, 5=demo, 6=start demo
gameType: .res 1                                 ; $00C1 A=0, B=1
musicType: .res 1                                ; $00C2 0-3; 3 is off
sleepCounter: .res 1                             ; $00C3 canon is legalScreenCounter1
ending: .res 1                                   ; $00C4
ending_customVars: .res 1                        ; $00C5 Different usages depending on Type A and B and Type B concert
.res 6
ending_currentSprite: .res 1                     ; $00CC
ending_typeBCathedralFrameDelayCounter: .res 1   ; $00CD
demo_heldButtons: .res 1                         ; $00CE
demo_repeats: .res 1                             ; $00CF
.res 1
demoButtonsAddr: .res 1                          ; $00D1 Current address within demoButtonsTable
demoButtonsTable_indexOverflowed: .res 1         ; $00D2
demoIndex: .res 1                                ; $00D3
highScoreEntryNameOffsetForLetter: .res 1        ; $00D4 Relative to current row
highScoreEntryRawPos: .res 1                     ; $00D5 High score position 0=1st type A, 1=2nd... 4=1st type B... 7=4th/extra type B
highScoreEntryNameOffsetForRow: .res 1           ; $00D6 Relative to start of table
highScoreEntryCurrentLetter: .res 1              ; $00D7
lineClearStatsByType: .res 4                     ; $00D8 bcd. one entry for each of single, double, triple, tetris

totalScore: .res 3                               ; $00DC
displayNextPiece: .res 1                         ; $00DF
AUDIOTMP1: .res 1                                ; $00E0
AUDIOTMP2: .res 1                                ; $00E1
AUDIOTMP3: .res 1                                ; $00E2
AUDIOTMP4: .res 1                                ; $00E3
AUDIOTMP5: .res 1                                ; $00E4
.res 1
musicChanTmpAddr: .res 2                         ; $00E6
.res 2
music_unused2: .res 1                            ; $00EA Always 0
soundRngSeed: .res 2                             ; $00EB Set, but not read
currentSoundEffectSlot: .res 1                   ; $00ED Temporary
musicChannelOffset: .res 1                       ; $00EE Temporary. Added to $4000-3 for MMIO
currentAudioSlot: .res 1                         ; $00EF Temporary
.res 1
unreferenced_buttonMirror: .res 3                ; $00F1 Mirror of $F5-F8
.res 1
newlyPressedButtons_player1: .res 1              ; $00F5 $80-a $40-b $20-select $10-start $08-up $04-down $02-left $01-right
newlyPressedButtons_player2: .res 1              ; $00F6
heldButtons_player1: .res 1                      ; $00F7
heldButtons_player2: .res 1                      ; $00F8
.res 2
joy1Location: .res 1                             ; $00FB normal=0; 1 or 3 for expansion
ppuScrollY: .res 1                               ; $00FC Set to 0 many places, but not read
ppuScrollX: .res 1                               ; $00FD Set to 0 many places, but not read
currentPpuMask: .res 1                           ; $00FE
currentPpuCtrl: .res 1                           ; $00FF

.bss
stack: .res 256                                  ; $0100
oamStaging: .res 256                             ; $0200 format: https://wiki.nesdev.com/w/index.php/PPU_programmer_reference#OAM
.res 240
statsByType: .res 14                             ; $03F0
.res 2
playfield: .res 256                              ; $0400
playfieldForSecondPlayer: .res 256               ; $0500
.res 2
menuMoveThrottle: .res 1                         ; $0602
menuThrottleTmp: .res 1                          ; $0603
.res 124
musicStagingSq1Lo: .res 1                        ; $0680
musicStagingSq1Hi: .res 1                        ; $0681
audioInitialized: .res 1                         ; $0682
musicPauseSoundEffectLengthCounter: .res 1       ; $0683
musicStagingSq2Lo: .res 1                        ; $0684
musicStagingSq2Hi: .res 1                        ; $0685
.res 2
musicStagingTriLo: .res 1                        ; $0688
musicStagingTriHi: .res 1                        ; $0689
resetSq12ForMusic: .res 1                        ; $068A 0-off. 1-sq1. 2-sq1 and sq2
musicPauseSoundEffectCounter: .res 1             ; $068B
musicStagingNoiseLo: .res 1                      ; $068C
musicStagingNoiseHi: .res 1                      ; $068D
.res 2
musicDataNoteTableOffset: .res 1                 ; $0690 AKA start of musicData, of size $0A
musicDataDurationTableOffset: .res 1             ; $0691
musicDataChanPtr: .res 8                         ; $0692
musicChanControl: .res 3                         ; $069A high 3 bits are for LO offset behavior. Low 5 bits index into musicChanVolControlTable, minus 1. Technically size 4, but usages of the next variable 'cheat' since that variable's first index is unused
musicChanVolume: .res 3                          ; $069D Must not use first index. First and second index are unused. High nibble always used; low nibble may be used depending on control and frame
musicDataChanPtrDeref: .res 8                    ; $06A0 deref'd musicDataChanPtr+musicDataChanPtrOff  deref'd musicDataChanPtr+musicDataChanPtrOff
musicDataChanPtrOff: .res 4                      ; $06A8
musicDataChanInstructionOffset: .res 4           ; $06AC
musicDataChanInstructionOffsetBackup: .res 4     ; $06B0
musicChanNoteDurationRemaining: .res 4           ; $06B4
musicChanNoteDuration: .res 4                    ; $06B8
musicChanProgLoopCounter: .res 4                 ; $06BC As driven by bytecode instructions
musicStagingSq1Sweep: .res 2                     ; $06C0 Used as if size 4, but since Tri/Noise does nothing when written for sweep, the other two entries can have any value without changing behavior
.res 1
musicChanNote: .res 4                            ; $06C3
.res 1
musicChanInhibit: .res 3                         ; $06C8 Always zero
.res 1
musicTrack_dec: .res 1                           ; $06CC $00-$09
musicChanVolFrameCounter: .res 4                 ; $06CD Pos 0/1 are unused
musicChanLoFrameCounter: .res 4                  ; $06D1 Pos 3 unused
soundEffectSlot0FrameCount: .res 5               ; $06D5 Number of frames
soundEffectSlot0FrameCounter: .res 5             ; $06DA Current frame
soundEffectSlot0SecondaryCounter: .res 1         ; $06DF nibble index into noiselo_/noisevol_table
soundEffectSlot1SecondaryCounter: .res 1         ; $06E0
soundEffectSlot2SecondaryCounter: .res 1         ; $06E1
soundEffectSlot3SecondaryCounter: .res 1         ; $06E2
soundEffectSlot0TertiaryCounter: .res 1          ; $06E3
soundEffectSlot1TertiaryCounter: .res 1          ; $06E4
soundEffectSlot2TertiaryCounter: .res 1          ; $06E5
soundEffectSlot3TertiaryCounter: .res 1          ; $06E6
soundEffectSlot0Tmp: .res 1                      ; $06E7
soundEffectSlot1Tmp: .res 1                      ; $06E8
soundEffectSlot2Tmp: .res 1                      ; $06E9
soundEffectSlot3Tmp: .res 1                      ; $06EA
.res 5
soundEffectSlot0Init: .res 1                     ; $06F0 NOISE sound effect. 2-game over curtain. 3-ending rocket. For mapping, see soundEffectSlot0Init_table
soundEffectSlot1Init: .res 1                     ; $06F1 SQ1 sound effect. Menu, move, rotate, clear sound effects. For mapping, see soundEffectSlot1Init_table
soundEffectSlot2Init: .res 1                     ; $06F2 SQ2 sound effect. For mapping, see soundEffectSlot2Init_table
soundEffectSlot3Init: .res 1                     ; $06F3 TRI sound effect. For mapping, see soundEffectSlot3Init_table
soundEffectSlot4Init: .res 1                     ; $06F4 Unused. Assume meant for DMC sound effect. Uses some data from slot 2
musicTrack: .res 1                               ; $06F5 $FF turns off music. $00 continues selection. $01-$0A for new selection
.res 2
soundEffectSlot0Playing: .res 1                  ; $06F8 Used if init is zero
soundEffectSlot1Playing: .res 1                  ; $06F9
soundEffectSlot2Playing: .res 1                  ; $06FA
soundEffectSlot3Playing: .res 1                  ; $06FB
soundEffectSlot4Playing: .res 1                  ; $06FC
currentlyPlayingMusicTrack: .res 1               ; $06FD Copied from musicTrack

.res 1
unreferenced_soundRngTmp: .res 1                 ; $06FF
highScores:
highScoreNames: .res 48                          ; $0700
highScoreScoresA: .res 12                        ; $0730
highScoreScoresB: .res 12                        ; $073C
highScoreLevels: .res 8                          ; $0748
highScoresEnd:
HIGHSCORES_LENGTH = <(highScoresEnd-highScores)

initMagic: .res 5                                ; $0750 Initialized to a hard-coded number. When resetting, if not correct number then it knows this is a cold boot

.segment "SRAM"

sramHighScores:
.res HIGHSCORES_LENGTH

sramInitMagic:    .res $05                       ; $6050

sramAnydasSettings:
.res ANYDAS_OPTIONS_LENGTH

sramMusicType: .res 1
sramGameType: .res 1
sramStartLevel: .res 1
sramStartHeight: .res 1

.if NWC = 1
tetriminoX      := player1_tetriminoX
tetriminoY      := player1_tetriminoY
currentPiece    := player1_currentPiece
levelNumber     := player1_levelNumber
fallTimer       := player1_fallTimer
autorepeatX     := player1_autorepeatX
startLevel      := player1_startLevel
playState       := player1_playState
vramRow         := player1_vramRow
completedRow    := player1_completedRow
autorepeatY     := player1_autorepeatY
holdDownPoints  := player1_holdDownPoints
lines           := player1_lines
rowY            := player1_rowY
score           := player1_score
completedLines  := player1_completedLines
lineIndex       := $0077
curtainRow      := player1_curtainRow
startHeight     := player1_startHeight
garbageHole     := player1_garbageHole
.endif
