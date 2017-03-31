#!/bin/bash
cd linux
#create default configuration for this kernel version
KERNEL=kernel7
cp ../configs/kernel_config .config
make -j4 ARCH=arm zImage
cd ..
