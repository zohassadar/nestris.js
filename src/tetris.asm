.setcpu "6502"
.feature force_range ; allows -1 vs <-1 (used in orientationTable)
.linecont

.segment "HEADER"

; This iNES header is from Brad Smith (rainwarrior)
; https://github.com/bbbradsmith/NES-ca65-example

INES_MAPPER = 1 ; 0 = NROM
INES_MIRROR = 0 ; 0 = horizontal mirroring, 1 = vertical mirroring
.ifdef ANYDAS
INES_SRAM = 1
.else
INES_SRAM = 0 ; 1 = battery backed SRAM at $6000-7FFF
.endif

.byte 'N', 'E', 'S', $1A ; ID
.byte $02 ; 16k PRG chunk count
.byte $02 ; 8k CHR chunk count
.byte INES_MIRROR | (INES_SRAM << 1) | ((INES_MAPPER & $f) << 4)
.byte (INES_MAPPER & %11110000)
.byte $0, $0, $0, $0, $0, $0, $0, $0 ; padding

; PRG segments

.include "constants.asm"
.include "tetris-ram.asm"
.include "main.asm"

.segment "CHR"
.if ANYDAS=1
.incbin "gfx/title_menu_tileset_anydas_seed.chr"
.else
.incbin "gfx/title_menu_tileset.chr"
.endif
.if NWC <> 1
.incbin "gfx/typeB_ending_tileset.chr"
.incbin "gfx/typeA_ending_tileset.chr"
.endif
.incbin "gfx/game_tileset.chr"
