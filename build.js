const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

console.log('TetrisNESDisasm buildscript');
console.time('build');

// options handling

const args = process.argv.slice(2);

if (args.includes('-h')) {
    console.log(`usage: node build.js [-p] [-n] [-w] [-h]

-p  build PAL version
-n  build NWC1990 version
-w  force WASM compiler
-h  you are here
`);
    process.exit(0);
}

const compileFlags = [];

// compiler options

const nativeCC65 = args.includes('-w')
    ? false
    : process.env.PATH.split(path.delimiter).some((dir) =>
          fs
              .statSync(path.join(dir, 'cc65'), { throwIfNoEntry: false })
              ?.isFile(),
      );

console.log(`using ${nativeCC65 ? 'system' : 'wasm'} ca65/ld65`);

// compileFlags

var output = 'tetris';

// Mutually exclusive flags
if (args.includes('-p')) {
    console.log('building PAL version');
    compileFlags.push('-D', 'PAL=1');
    output = 'tetris-pal';
} else if (args.includes('-n')) {
    console.log('building NWC 1990 version');
    compileFlags.push('-D', 'NWC=1');
    output = 'tetris-nwc';
}

console.log();

// PNG -> CHR

console.time('CHR');

const png2chr = require('./tools/png2chr/convert');

const dir = path.join(__dirname, 'gfx');

fs.readdirSync(dir)
    .filter((name) => name.endsWith('.png'))
    .forEach((name) => {
        const png = path.join(dir, name);
        const chr = path.join(dir, name.replace('.png', '.chr'));

        const pngStat = fs.statSync(png, { throwIfNoEntry: false });
        const chrStat = fs.statSync(chr, { throwIfNoEntry: false });

        const staleCHR = !chrStat || chrStat.mtime < pngStat.mtime;

        if (staleCHR || args.includes('-c')) {
            console.log(`${name} => ${path.basename(chr)}`);
            fs.writeFileSync(chr, png2chr(fs.readFileSync(png)));
        }
    });

console.timeEnd('CHR');

// build object files

const { spawnSync } = require('child_process');

function exec(cmd) {
    const [exe, ...args] = cmd.split(' ');
    const output = spawnSync(exe, args).output.flatMap(
        (d) => d?.toString() || [],
    );
    if (output.length) {
        console.log(output.join('\n'));
        process.exit(0);
    }
}

const ca65bin = nativeCC65 ? 'ca65' : 'node ./tools/assemble/ca65.js';
const flags = compileFlags.length ? ` ${compileFlags.join(' ')}` : '';

console.time('assemble');

exec(`${ca65bin}${flags} -g tetris.asm -o ${output}.o`);

console.timeEnd('assemble');

// link object files

const ld65bin = nativeCC65 ? 'ld65' : 'node ./tools/assemble/ld65.js';

console.time('link');

exec(
    `${ld65bin} -m ${output}.map -Ln ${output}.lbl --dbgfile ${output}.dbg -o ${output}.nes -C tetris.nes.cfg ${output}.o`,
);

console.timeEnd('link');

// stats

console.log();

function hashFile(filename, sha1file) {
    if (fs.existsSync(filename)) {
        const shasum = crypto.createHash('sha1');
        shasum.update(fs.readFileSync(filename));
        const hash = shasum.digest('hex');
        const expected = fs.readFileSync(sha1file).toString().split(/ /)[0];
        if (expected === hash) {
            console.log(`\n${filename} => ${hash} match`);
        } else {
            console.log(`\n${filename} => ${hash} does not match!`);
        }
        console.log(`${fs.statSync(filename).size} bytes`);
    }
}

hashFile(`${output}.nes`, `${output}.sha1`);

console.log();

console.timeEnd('build');
