const {
    writeStripe,
    blankNT,
    drawTiles,
    drawAttrs,
    flatLookup,
} = require('./nametables');

const lookup = flatLookup(`
0123456789ABCDEF
GHIJKLMNOPQRSTUV
WXYZ-,'╥┌━┐┇╏└╍┘
ghijklmn╔╧╗╣╠╚╤╝
wxyz╭▭╮╢╟╰▱╯├╪┤/
┉=!@[]^Ëq{|}~¹()
¼½¾¿ÀÁÂÃÄÅÆÇÈÉ‟.
ÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛ
ÜÝÞßàáâãäåæçèéêë
ìíîïðñòóôõö÷øùúû
üýþÿЉЊЋЌЍЎЏАБВГД
ЕЖЗИЙКЛМНОПРСТУФ
ХЦЧШЩЪЫЬЭЮЯабвгд
εζηθικλμνξοπρςστ
υφχψωϊϋόύώϏϐϑϒϓϔ
ϕϖϗϘϙ©ϛ┬ϝϞϟϠϡͰͱ_
`);

const buffer = blankNT();

drawTiles(buffer, lookup, `
¾ìÏÜxß¾ÎÜ½ÜíÜzÏ¾ÜÝÝßìÝß¾¾ÜÝ½Ü½ìÏ
ÎÎ¾¼½ìýÞ¾Î¾üßÞÜxß¾Ü½ÞÜÝýÎ¼½Þ¾ÎÎ¾
ÎÞÎÌÍÞÜÝýÞüÝßÜÝÝßüíÎÜzÏÜýÌÍìýÞÞÎ
Þ¾Îghhhhhhhhhhhhi¾ÞÞ¾Þ¼½¾¼½ÞÜíÜý
ÜyÞj_GAME__TYPE_küÝßüíÌÍÎÌÍìÏüß¾
¾Þ¾lmmmmmmmmmmmmnìÏÜíÞ¾Üý¼½Î¼½Üy
wÏüÝßÜzÏÜÝÝßÜÝÝßÜýìÏüßüÝßÌÍÞÌÍ¾Þ
ÞìÏìÏ¾Þ╔╧╧╧╧╧╧╧╧╗¾Î╔╧╧╧╧╧╧╧╧╗ìý¾
ÜýÜýÜxß╣_A-TYPE_╠ÎÞ╣_B-TYPE_╠ÞÜy
ìÏ¾ÜÝ½¾╚╤╤╤╤╤╤╤╤╝üÏ╚╤╤╤╤╤╤╤╤╝ìÏÞ
ÎÜxß¾Þüí¼½¼½¾ÜÝ½¼½ÜÝÝß¾Ü½ìÝßÜýÜ½
ÞìÝßüÝßÞÌÍÌÍüÝßÞÌÍ¾ÜÝ½üíÎÞ¾ÜÝÝßÎ
¾Þ¾ghhhhhhhhhhhhiÜxß¾Þ¾ÞÞÜyìÏÜíÞ
ÎÜyj_MUSIC_TYPE_kÜzÏüíÎÜÝ½ÞÎìÏüß
üÏÞlmmmmmmmmmmmmn¾ÞÜíÞÎ¼½Þ¾ÞÎÜÝ½
¼½¾ÜÝ½ÜzÏÜÝÝßÜÝÝßüÝßüßÞÌÍÜxßÞÜíÞ
ÌÍüÝßÞ¾ÞÜÝ½¾┌━━━━━━━━━━┐ÜÝÝß¼½üß
Ýß¼½¾¾üÝß¾ÞÎ┇__________╏ÜÝÝßÌÍÜÝ
½¾ÌÍÎwÏìÏwÏÎ┇_MUSIC@[1_╏¾Ü½¼½ìÝß
Þüí¾ÎÞ¾Î¾Þ¾Þ┇__________╏üíÎÌÍÞ¾¾
Ï¾ÞÎÞìýÞwÏüí┇_MUSIC@[2_╏¾ÞÞ¾¼½Îü
ßwÏüÏÞ¼½Þ¼½Þ┇__________╏wÏÜyÌÍüÏ
½ÞÜÝÝßÌÍ¾ÌÍ¾┇_MUSIC@[3_╏ÞìÏÞ¾ÜÝ½
ÍìÝßÜÝ½ÜyÜÝý┇__________╏ÜýÜÝýìÏÞ
½ÞÜzÏ¾Þ¾ÞÜÝ½┇___OFF____╏ÜÝÝßÜý¼½
Þ¼½ÞìýÜxß¾¾Þ┇__________╏¼½¾¾Ü½ÌÍ
¾ÌÍ¾ÞìÝß¾ÎwÏ└╍╍╍╍╍╍╍╍╍╍┘ÌÍÎwÏÎÜÝ
Î¾ÜxßÞ¼½ÎÎÞ¾ÜÝÝß¾Ü½ìÝßìÏ¼½ÎÞ¾Þ¾¾
ÎüÝß¾¾ÌÍÎÞìý¾¼½ÜxßÎÞ¾Üý¾ÌÍÞÜyìýÎ
ÞÜÝ½ÎÎìÏÞ¾Þ¾ÎÌÍÜzÏÞÜxßÜxßÜÝ½ÞÞÜý

`);


drawAttrs(buffer, [`
    2222222222222222
    2000000002222222
    2000000002222222
    2221111112222222
    2221111112222222
    2111111110000002
    2000000002222222
    2000000002222222
`,`
    2222220000002222
    2222220000002222
    2222220000002222
    2222220000002222
    2222220000002222
    2222220000002222
    2222222222222222
    0000000000000000
`]);

writeStripe(
    __dirname + '/game_type_menu_nametable.bin',
    0x2000,
    buffer,
);
