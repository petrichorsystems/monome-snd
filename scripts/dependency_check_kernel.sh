#!/bin/bash
if [ ! -d "linux" ]; then
    git clone --depth=1 https://github.com/raspberrypi/linux.git

    # these are monome-specific files, we should change these to be a single
    #  or set of patches
    cp kernel/monome-overlay.dts linux/arch/arm/boot/dts/overlays/monome-overlay.dts
    cp kernel/README_overlays linux/arch/arm/boot/dts/overlays/README
    cp kernel/Makefile_overlays linux/arch/arm/boot/dts/overlays/Makefile
    cp kernel/Kconfig linux/sound/soc/bcm/Kconfig
    cp kernel/Makefile linux/sound/soc/bcm/Makefile
    cp kernel/monome.c linux/sound/soc/bcm/monome.c
    
    # create default configuration for this kernel version
    cd linux
    KERNEL=kernel7
    make ARCH=arm CROSS_COMPILE=../tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf- bcm2709_defconfig    
    echo "CONFIG_SND_BCM2708_SOC_MONOME=m" >> .config
    cd ..
fi
