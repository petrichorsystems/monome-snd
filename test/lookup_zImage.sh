#! /bin/bash

if [[ $(find . -name "zImage") ]]; then exit 0; else exit 1; fi
