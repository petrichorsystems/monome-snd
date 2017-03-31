#!/bin/bash
cd linux;
make -j 5 ARCH=arm CROSS_COMPILE=../tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf- modules dtbs
cd ..
