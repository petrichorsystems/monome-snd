#! /bin/bash

if [[ $(find . -name "snd-soc-monome.ko") ]]; then exit 0; else exit 1; fi
