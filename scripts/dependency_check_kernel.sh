#!/bin/bash
if [ ! -d "monome-raspbian" ]; then
    git clone https://github.com/petrichorsystems/monome-raspbian.git --depth 1
fi
exit 0
