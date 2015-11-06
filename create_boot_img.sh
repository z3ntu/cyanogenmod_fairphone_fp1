#!/bin/bash

cd alps-fairphone-gpl/

./mediatek/build/tools/mkimage kernel/arch/arm/boot/zImage KERNEL > ./zImage.img

../mtk-tools/repack-MTK.pl -boot zImage.img ../ramdisk/boot.img-ramdisk boot.img
