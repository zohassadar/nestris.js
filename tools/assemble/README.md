[cc65](https://github.com/cc65/cc65) binaries built as WebAssembly for TetrisNESDisasm

Script derived from [TetrisGYM](https://github.com/kirjavascript/TetrisGYM)

generated with Emscripten

    git clone https://github.com/cc65/cc65
    cd cc65
    
    emmake make ca65 \
        EXE_SUFFIX=".js" \
        CC=emcc \
        CFLAGS="-O3 -Wall -I common" \
        LD=emcc \
        OBJDIR="" \
        HOST_OBJEXTENSION=".o" \
        LDFLAGS="-s EXPORTED_RUNTIME_METHODS=FS -s FORCE_FILESYSTEM=1 -lnodefs.js -lnoderawfs.js"
    
    emmake make ld65 \
        EXE_SUFFIX=".js" \
        CC=emcc \
        CFLAGS="-O3 -Wall -I common" \
        LD=emcc \
        OBJDIR="" \
        HOST_OBJEXTENSION=".o" \
        LDFLAGS="-s EXPORTED_RUNTIME_METHODS=FS -s FORCE_FILESYSTEM=1 -lnodefs.js -lnoderawfs.js"
    
    # adjust path to TetrisNESDisasm accordingly
    
    cp bin/* ../TetrisNESDisasm/tools/assemble/


