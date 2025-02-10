const {
    writeStripe,
    blankNT,
    drawTiles,
    drawAttrs,
    flatLookup,
} = require('./nametables');

const buffer = blankNT();

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

drawTiles(buffer, lookup, `
üÝß╣_┌━━━━━━━━━━━━━━━━━━━━┐_╠¼½Î
¾Üí╣_┇____NAME__SCORE__LV_╏_╠ÌÍÞ
y¾Î╣_├╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┤_╠ÜÝí
ÞÎÞ╣_┇_1__________________╏_╠¾¾Þ
Üý¾╣_┇____________________╏_╠Îüí
¼½Î╣_┇_2__________________╏_╠Î¾Þ
ÌÍÎ╣_┇____________________╏_╠ÞÎÜ
¾¾Þ╣_┇_3__________________╏_╠¾üß
ÎwÏ╣_└╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┘_╠üÝß
Џ000000ЏЏ000000ЏЏüüüüüüЏAAAAAAAA
`);

writeStripe(
    __dirname + '/high_scores_nametable.bin',
    0x2220,
    buffer.slice(0,32*10),
    b=>b[0x13c]=0xe0 // hack until functionality is extended.  last row of NT is actually attrs
);
