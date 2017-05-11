#!/bin/bash
cd monome-raspbian
#create default configuration for this kernel version
KERNEL=kernel7
cp ../configs/kernel_config .config
make -j4 ARCH=arm CROSS_COMPILE=arm-linux- zImage
MONOME_SND_COMPILE_EXIT=$?
cd ..
exit $MONOME_SND_COMPILE_EXIT
