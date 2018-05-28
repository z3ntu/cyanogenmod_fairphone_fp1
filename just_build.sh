#!/bin/bash

set -e

cd alps-fairphone-gpl/kernel
#export PATH=~/android/prebuilt/arm-linux-androideabi-4.6/bin:$PATH
#export PATH=~/android/prebuilt/arm-linux-androideabi-4.7/bin:$PATH
#export PATH=~/android/prebuilt/arm-linux-androideabi-4.8/bin:$PATH
export PATH=~/android/prebuilt/arm-linux-androideabi-4.9/bin:$PATH
export PATH=~/android/prebuilt/compat:$PATH
export CROSS_COMPILE=arm-linux-androideabi-
echo "Compiling"
TARGET_BUILD_VARIANT=user \
TARGET_PRODUCT=ahong89_wet_jb2 \
MTK_ROOT_CUSTOM=../mediatek/custom/ \
make fp1_defconfig # only for Dan's tree
make -j8 #V=1 #CONFIG_DEBUG_SECTION_MISMATCH=y
echo "Hopefully the compilation worked without problems!"
echo "Made by z3ntu"
