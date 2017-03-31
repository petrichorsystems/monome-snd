#!/bin/bash
if [ ! -d "tools" ]; then
    if git clone --depth=1 https://github.com/raspberrypi/tools.git; then
	exit 0
    else
	echo "Failed to clone cross-compilation tools from 'https://github.com/raspberrypi/tools.git'"
	exit 1
    fi
fi
