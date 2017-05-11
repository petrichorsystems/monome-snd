#!/bin/bash
cd monome-raspbian
#create default configuration for this kernel version
KERNEL=kernel7
cp ../configs/kernel_config .config
MONOME_SND_COMPILE_EXIT=$(make -j4 ARCH=arm CROSS_COMPILE=arm-linux- zImage)
cd ..
exit $MONOME_SND_COMPILE_EXIT
