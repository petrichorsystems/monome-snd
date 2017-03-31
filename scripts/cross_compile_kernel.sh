#!/bin/bash
cd linux;

# create default configuration for this kernel version
KERNEL=kernel7
cp ../configs/kernel_config .config
make ARCH=arm CROSS_COMPILE=../tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf- oldconfig
make -j5 ARCH=arm CROSS_COMPILE=../tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf- zImage
cd ..
