#!/bin/bash
# in case we're cross-compiling, have
#  to rebuild this binary due to it
#  being built as 64bit for some reason
cd norns-linux/firmware
rm ihex2fw
gcc -o ihex2fw ihex2fw.c
cd ..
# continue installing rest of modules
sudo make modules_install
cd ..
sudo cp configs/config.txt /boot/.
sudo cp norns-linux/arch/arm/boot/dts/overlays/* /boot/overlays/.
sudo cp norns-linux/arch/arm/boot/Image /boot/kernel7.img
sudo cp norns-linux/arch/arm/boot/Image /boot/kernel.img
