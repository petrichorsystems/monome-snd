#!/bin/bash
if [ ! -d "norns-linux" ];
    git clone https://github.com/bonemurmurer/norns-linux.git
    ln -s /home/pi/norns/norns-linux
    cp configs/norns_kernel_config norns-linux/.config
fi
