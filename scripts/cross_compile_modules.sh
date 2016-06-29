#!/bin/bash
cd norns-linux;
make -j 6 ARCH=arm CROSS_COMPILE=../tools/arm-bcm2708/arm-bcm2708-linux-gnueabi/bin/arm-bcm2708-linux-gnueabi- modules
