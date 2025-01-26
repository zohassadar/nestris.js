
import argparse
import pathlib
import sys

import nametable_builder

"""
This script has been generated by nametable_builder.py.  It's intended to rebuild the nametable
into a .bin

Unless modified, it will reproduce the original.  
"""

file = pathlib.Path(__file__)
output = file.parent / file.name.replace(".py", ".bin")

parser = argparse.ArgumentParser()
parser.add_argument('-D', '--buildflag', action='append', dest='buildflags', help='Build Flag')
args = parser.parse_args()
buildflags = args.buildflags if args.buildflags else []


original_sha1sum = "451fa63151ac42942eb7161e7d8546f4c15f97cd"

characters = (
    #0123456789ABCDEF
    "0123456789ABCDEF" #0
    "GHIJKLMNOPQRSTUV" #1
    "WXYZ-,'╥┌━┐┇╏└╍┘" #2
    "ghijklmn╔╧╗╣╠╚╤╝" #3
    "wxyz╭▭╮╢╟╰▱╯├╪┤/" #4
    "┉=!@[]^Ë`{|}~¹()" #5
    "¼½¾¿ÀÁÂÃÄÅÆÇÈÉ‟." #6
    "ÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛ" #7
    "ÜÝÞßàáâãäåæçèéêë" #8
    "ìíîïðñòóôõö÷øùúû" #9
    "üýþÿЉЊЋЌЍЎЏАБВГД" #A
    "ЕЖЗИЙКЛМНОПРСТУФ" #B
    "ХЦЧШЩЪЫЬЭЮЯабвгд" #C
    "εζηθικλμνξοπρςστ" #D
    "υφχψωϊϋόύώϏϐϑϒϓϔ" #E
    "ϕϖϗϘϙ©ϛ┬ϝϞϟϠϡͰͱ_" #F
)  # fmt: skip

table = """
ÎÞ¾¾¾ÜíÜzß¾Î¼½ÞìßÎìÝßÞ¾Þ¾Î¾ÜÝÝßÎ
ÎÜyÎüíÎ¾ÞÜyÞÌÍÜýÜýÞÜÝíÎÜyÎwßìßÜý
Þ¾ÞüßÞÞüÝßÞ╔╧╧╧╧╧╧╧╧╗ÞüßÞÞÞÜýìß¾
Üxß╔╧╧╧╧╧╧╧╣__-TYPE_╠╧╧╧╧╧╧╧╗Îìý
¾Üí╣_______╚╤╤╤╤╤╤╤╤╝_______╠ÞÞ¾
y¾Î╣________________________╠ÜÝý
ÞÎÞ╣________________________╠ìßÜ
¾üß╣_____CONGRATULATIONS____╠Î¼½
wß¾╣________________________╠ÞÌÍ
ÞÜy╣________________________╠ÜíÜ
¼½Þ╣_______YOU_ARE_A________╠¾üß
ÌÍ¾╣________________________╠üÝß
¼½Î╣_____TETRIS_MASTER._____╠¾¾¾
ÌÍÎ╣________________________╠ÎÎw
ÜíÞ╣________________________╠ÎÎÞ
¾üß╣_PLEASE_ENTER_YOUR_NAME_╠ÞÞ¾
wß¾╣________________________╠ÜíÎ
Þìý╣_┌━━━━━━━━━━━━━━━━━━━━┐_╠¾ÎÎ
ßÞ¾╣_┇____NAME__SCORE__LV_╏_╠ÎÞÞ
ÜÝý╣_├╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┤_╠üßÜ
ÜÝí╣_┇_1__________________╏_╠Üzß
ìßÞ╣_┇____________________╏_╠¾ÞÜ
Î¼½╣_┇_2__________________╏_╠üÝß
ÞÌÍ╣_┇____________________╏_╠¼½Ü
ßìß╣_┇_3__________________╏_╠ÌÍÜ
Üý¾╣_└╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┘_╠¾¼½
ÜÝý╣________________________╠ÎÌÍ
ÝÝß╚╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╝üß¾
¼½¼½ÜÝÝß¾¾¾ÜÝí¾Üzß¾¾ÜÝÝß¾ìß¼½¾ìý
ÌÍÌÍìßÜÝýÎüÝßÞwßÞÜywßÜíÜyÎ¾ÌÍÎÞ¾

"""

attributes = """
2222222222222222
2222222222222222
2222222222222222
2200333333330022
2200000000000022
2200000000000022
2200000000000022
2200000000000022
2200000000000022
2200000000000022
2200000000000022
2200000000000022
2200000000000022
2222222222222222
2222222222222222
0000000000000000"""

lengths = [32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32]  # fmt: skip

starting_addresses = [(32, 0), (32, 32), (32, 64), (32, 96), (32, 128), (32, 160), (32, 192),
 (32, 224), (33, 0), (33, 32), (33, 64), (33, 96), (33, 128), (33, 160),
 (33, 192), (33, 224), (34, 0), (34, 32), (34, 64), (34, 96), (34, 128),
 (34, 160), (34, 192), (34, 224), (35, 0), (35, 32), (35, 64), (35, 96),
 (35, 128), (35, 160), (35, 192), (35, 224)]  # fmt: skip


if __name__ == "__main__":
    try:
        nametable_builder.build_nametable(
            output,
            table,
            attributes,
            characters,
            original_sha1sum,
            lengths,
            starting_addresses,
        )
    except Exception as exc:
        print(
            f"Unable to build nametable: {type(exc).__name__}: {exc!s}", file=sys.stderr
        )
        sys.exit(1)

