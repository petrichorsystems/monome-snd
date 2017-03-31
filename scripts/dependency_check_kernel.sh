#!/bin/bash
if [ ! -d "linux" ]; then
    git clone https://github.com/raspberrypi/linux.git -b rpi-4.9.y

    cd linux
    git checkout 883de20e54e16f89a878c9957fd265e352ebf5c3
    
    wget -nd -r -l1 --no-parent -A "patch-4.9.13-rt*.patch.gz" https://www.kernel.org/pub/linux/kernel/projects/rt/4.9/older/
    
    ls patch-4.9.13-rt*.patch.gz | tail -1 | xargs zcat | patch -p1

    patch -p1 arch/arm/boot/dts/overlays/Makefile ../kernel/monome-rt-patches/monome-rt-Makefile.patch
    patch -p1 arch/arm/boot/dts/overlays/README ../kernel/monome-rt-patches/monome-rt-README.patch
    patch -p1 sound/soc/bcm/Kconfig ../kernel/monome-rt-patches/monome-rt-Kconfig.patch
    patch -p1 sound/soc/bcm/Makefile ../kernel/monome-rt-patches/monome-rt-Makefile-bcm.patch
    
    cd ..
    cp kernel/monome-overlay.dts linux/arch/arm/boot/dts/overlays/monome-overlay.dts
    cp kernel/monome.c linux/sound/soc/bcm/monome.c
    
fi
exit 0
