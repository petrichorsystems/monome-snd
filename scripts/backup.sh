#!/bin/bash
if [ ! -d "backups" ]; then
    mkdir backups
    cp /boot/kernel.img backups/.
    cp /boot/kernel7.img backups/.
    cp /boot/config.txt backups/.
    cp -r /boot/overlays backups/.
fi
