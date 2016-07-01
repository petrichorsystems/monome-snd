#!/bin/bash
if [ ! -d "norns-linux" ]; then
    git clone --depth=1 https://github.com/bonemurmurer/norns-linux.git
    ln -s /home/pi/norns/norns-linux ~/linux
    cp configs/norns_kernel_config norns-linux/.config
fi
