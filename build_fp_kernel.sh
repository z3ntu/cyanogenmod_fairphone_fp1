#!/bin/bash

echo "Downloading..."
git clone https://github.com/bgcngm/mtk-tools
#git clone https://github.com/keesj/alps-fairphone-gpl
git clone -b cm-11.0 https://github.com/z3ntu/android_kernel_fp_FP1
git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.6
curl -O http://storage.googleapis.com/fairphone-updates/FP1-Fairphone_OS_v1_8_7_Image_2015081400.zip
echo "Prepairing..."
mkdir FP1-Fairphone_OS_v1_8_7_OTA_2015081400
mkdir ramdisk
unzip FP1-Fairphone_OS_v1_8_7_Image_2015081400.zip -d FP1-Fairphone_OS_v1_8_7_OTA_2015081400
mv FP1-Fairphone_OS_v1_8_7_OTA_2015081400/boot.img ramdisk/boot.img
cd ramdisk
../mtk-tools/unpack-MTK.pl boot.img
#cd ../alps-fairphone-gpl/kernel
cd ../android_kernel_fp_FP1/kernel
export PATH=../../arm-linux-androideabi-4.6/bin:$PATH
export CROSS_COMPILE=arm-linux-androideabi-
echo "Compiling"
TARGET_BUILD_VARIANT=user \
    TARGET_PRODUCT=ahong89_wet_jb2 \
    MTK_ROOT_CUSTOM=../mediatek/custom/ \
    make V=1
echo "Hopefully the compilation worked without problems!"
echo "Made by z3ntu"
