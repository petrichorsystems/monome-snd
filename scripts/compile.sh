#!/bin/bash
cd monome-raspbian
#create default configuration for this kernel version
KERNEL=kernel7
cp ../configs/kernel_config .config
make -j4 ARCH=arm CROSS-COMPILE=arm-linux- zImage
cd ..
