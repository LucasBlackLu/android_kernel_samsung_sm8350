#!/bin/bash

## DEVICE STUFF
DEVICE_HARDWARE="sm8350"
DEVICE_MODEL="$1"
ZIP_DIR="$(pwd)/AnyKernel3"
MOD_DIR="$ZIP_DIR/modules/vendor/lib/modules"
K_MOD_DIR="$(pwd)/out/modules"

# Enviorment Variables
SRC_DIR=$(pwd)
TC_DIR=$(pwd)/clang
JOBS="$(nproc --all)"
MAKE_PARAMS="-j$JOBS -C $SRC_DIR O=$SRC_DIR/out ARCH=arm64 CC=clang CLANG_TRIPLE=$TC_DIR/bin/aarch64-linux-gnu- LLVM=1 CROSS_COMPILE=$TC_DIR/bin/llvm-"
export PATH="$TC_DIR/bin:$PATH"

if [ "$DEVICE_MODEL" == "SM-G9910" ]; then
    DEVICE_NAME="o1q"
    DEFCONFIG=o1q_defconfig
elif [ "$DEVICE_MODEL" == "SM-G9960" ]; then
    DEVICE_NAME="t2q"
    DEFCONFIG=t2q_defconfig
elif [ "$DEVICE_MODEL" == "SM-G9980" ]; then
    DEVICE_NAME="p3q"
    DEFCONFIG=p3q_defconfig
elif [ "$DEVICE_MODEL" == "SM-G990B" ]; then
    DEVICE_NAME="r9q"
    DEFCONFIG=r9q_defconfig
elif [ "$DEVICE_MODEL" == "SM-G990B2" ]; then
    DEVICE_NAME="r9q2"
    DEFCONFIG=/r9q2_defconfig
else
    echo "Config not found"
    exit
fi

echo "Patch the kernel"
ZIP_NAME="Lavender_"$DEVICE_NAME"_"$DEVICE_MODEL"_"$(date +%d%m%y-%H%M)""

make $MAKE_PARAMS $DEFCONFIG
make $MAKE_PARAMS
make $MAKE_PARAMS INSTALL_MOD_PATH=modules INSTALL_MOD_STRIP=1 modules_install

if [ -d "AnyKernel3" ]; then
    cd AnyKernel3
    git reset HEAD --hard
    cd ..
    if [ -d "AnyKernel3/modules" ]; then
        rm -rf AnyKernel3/modules/
        mkdir AnyKernel3/modules/
        mkdir AnyKernel3/modules/vendor/
        mkdir AnyKernel3/modules/vendor/lib
        mkdir AnyKernel3/modules/vendor/lib/modules/
    else
        mkdir AnyKernel3/modules/
        mkdir AnyKernel3/modules/vendor/
        mkdir AnyKernel3/modules/vendor/lib
        mkdir AnyKernel3/modules/vendor/lib/modules/
    fi
    find "$(pwd)/out/modules" -type f -iname "*.ko" -exec cp -r {} ./AnyKernel3/modules/vendor/lib/modules/ \;
    cp ./out/arch/arm64/boot/Image ./AnyKernel3/
    cp ./out/arch/arm64/boot/dtbo.img ./AnyKernel3/
    cd AnyKernel3
    rm -rf Lavender*
    zip -r9 $ZIP_NAME . -x '*.git*' '*patch*' '*ramdisk*' 'LICENSE' 'README.md'
    cd ..
else
    git clone https://github.com/LucasBlackLu/AnyKernel3 -b samsung
    if [ -d "AnyKernel3/modules" ]; then
        rm -rf AnyKernel3/modules/
        mkdir AnyKernel3/modules/
        mkdir AnyKernel3/modules/vendor/
        mkdir AnyKernel3/modules/vendor/lib
        mkdir AnyKernel3/modules/vendor/lib/modules/
    else
        mkdir AnyKernel3/modules/
        mkdir AnyKernel3/modules/vendor/
        mkdir AnyKernel3/modules/vendor/lib
        mkdir AnyKernel3/modules/vendor/lib/modules/
    fi
    find "$(pwd)/out/modules" -type f -iname "*.ko" -exec cp -r {} ./AnyKernel3/modules/vendor/lib/modules/ \;
    cp ./out/arch/arm64/boot/Image ./AnyKernel3/
    cp ./out/arch/arm64/boot/dtbo.img ./AnyKernel3/
    cd AnyKernel3
    rm -rf Lavender*
    zip -r9 $ZIP_NAME . -x '*.git*' '*patch*' '*ramdisk*' 'LICENSE' 'README.md'
    cd ..
fi
