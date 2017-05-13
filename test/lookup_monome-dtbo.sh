#! /bin/bash

if [[ $(find . -name "monome.dtbo") ]]; then exit 0; else exit 1; fi
