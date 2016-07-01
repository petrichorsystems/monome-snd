#!/bin/bash
if [ ! -d "tools" ]; then
    git clone --depth=1 https://github.com/raspberrypi/tools.git
fi
