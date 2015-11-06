#!/bin/bash
cd kernel
export PATH=../../arm-linux-androideabi-4.6/bin:$PATH
export CROSS_COMPILE=arm-linux-androideabi-
echo "Compiling"
TARGET_BUILD_VARIANT=user \
    TARGET_PRODUCT=ahong89_wet_jb2 \
    MTK_ROOT_CUSTOM=../mediatek/custom/ \
    make V=1
echo "Hopefully the compilation worked without problems!"
echo "Made by z3ntu"
