#!/bin/bash
cd linux;

# create default configuration for this kernel version
KERNEL=kernel7
make ARCH=arm CROSS_COMPILE=../tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf- bcm2709_defconfig    
echo "CONFIG_SND_BCM2708_SOC_MONOME=m" >> .config
echo "CONFIG_PREEMPT_RT_FULL=y" >> .config
make ARCH=arm CROSS_COMPILE=../tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf- zImage
cd ..
