#!/bin/bash
if [ ! -d "linux" ]; then
    git clone --depth=1 https://github.com/raspberrypi/linux.git -b rpi-4.9.y

    cd linux
    wget -nd -r -l1 --no-parent -A "patch-4.9.13-rt*.patch.gz" https://www.kernel.org/pub/linux/kernel/projects/rt/4.9/
    zcat patch-4.9.13-rt*.patch.gz | patch -p1
    rm patch-4.9.13-rt*.patch.gz
    git apply ../kernel/monome-rt-git.patch
    cd ..

    # these are monome-specific files, we should change these to be a single
    #  or set of patches
    cp kernel/monome-overlay.dts linux/arch/arm/boot/dts/overlays/monome-overlay.dts
    cp kernel/monome.c linux/sound/soc/bcm/monome.c
fi
