#!/bin/bash
if [ ! -d "monome-snd-linux" ]; then
    git clone --depth=1 https://github.com/bonemurmurer/monome-snd-linux.git
    cp configs/monome-snd_kernel_config monome-snd-linux/.config
fi
