#!/bin/bash
if [ ! -d "linux" ]; then
    git clone --depth=1 https://github.com/raspberrypi/linux.git -b rpi-4.4.y

    cd linux
    git checkout rpi-4.4.y
    wget https://www.kernel.org/pub/linux/kernel/projects/rt/4.4/patch-4.4.50-rt62.patch.gz
    zcat patch-4.4.50-rt62.patch.gz | patch -p1
    rm patch-4.4.50-rt62.patch.gz
    git apply ../kernel/monome-rt-git.patch
    cd ..

    # these are monome-specific files, we should change these to be a single
    #  or set of patches
    cp kernel/monome-overlay.dts linux/arch/arm/boot/dts/overlays/monome-overlay.dts
    cp kernel/monome.c linux/sound/soc/bcm/monome.c
fi
