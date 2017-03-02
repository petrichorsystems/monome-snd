#!/bin/bash
cd linux
#create default configuration for this kernel version
KERNEL=kernel7
make -j4 ARCH=arm bcm2709_defconfig
echo "CONFIG_SND_BCM2708_SOC_MONOME=m" >> .config
make -j4 zImage
cd ..
