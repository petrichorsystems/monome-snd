#!/bin/bash
sudo cp backups/kernel.img /boot/.
sudo cp backups/kernel7.img /boot/.
sudo cp backups/config.txt /boot/.
sudo rm -rf /boot/overlays
sudo cp -r backups/overlays /boot/.
rm -rf ~/linux
