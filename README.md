# monome-snd

monome raspberry-pi hat

## Directories

- `scripts`: bash scripts for easy staging and compilation of code
- `configs`: monome-snd-specific device tree overlay and linux kernel configuration
-  `kernel`: changes to the kernel, specific for this driver

## Status
[![Build Status](https://travis-ci.org/petrichorsystems/monome-snd.svg?branch=master)](https://travis-ci.org/petrichorsystems/monome-snd)

## Building
The building and installing process could be broken up into smaller
steps and made faster, but for simplicity there are two scripted
methods to build the driver.  (Also, you can replace any of the scp
commands with cp if you've mounted the SD card on your local machine)
* Cross-compile on a local system, requires approximately 2.9GB locally and
   1.4GB on the RasbPi
* Compile remotely on the RasbPi, requires approximately 1.4GB on the RasbPi

#### cross-compiling on local system
```
$ git clone https://github.com/petrichorsystems/monome-snd.git
$ cd monome-snd
$ make cross-compile
```
You'll need to copy the kernel sources over to the RasbPi. 'tools' contains
the cross-compilation scripts and 'monome-raspbian/.git' contains branch/commit data.
They are large directories (tools - 1.4GB+, monome-raspbian/.git - 1.8GB+) and will
drastically increase remote copy time so remove them first
```
$ make stage-remote-copy
$ cd ..
$ scp -r monome-snd pi@192.168.#.#:.
```
#### compiling remotely
```
$ ssh pi@192.168.#.#
pi@raspberrypi:~ $ sudo apt-get install git
pi@raspberrypi:~ $ sudo apt-get install bc
pi@raspberrypi:~ $ git clone https://github.com/petrichorsystems/monome-snd.git
pi@raspberrypi:~ $ cd monome-snd
pi@raspberrypi:~ $ make
```

## Installing
```
pi@raspberrypi:~ $ cd ~/monome-snd
pi@raspberrypi:~ $ make install
pi@raspberrypi:~ $ sudo reboot
```

## Uninstalling
After you're done using monome-snd: make uninstall, make clean, and (if you backed
them up) copy your original sources back to the RasbPi.
```
$ ssh pi@192.168.#.#
pi@raspberrypi:~ $ cd monome-snd
pi@raspberrypi:~ $ make uninstall
pi@raspberrypi:~ $ make clean
pi@raspberrypi:~ $ cd ..
pi@raspberrypi:~ $ rm -rf monome-snd
pi@raspberrypi:~ $ exit
```

## To-Do
* Submit RasbPi-specific code and configuration to Raspbian distribution
* Update monome-snd build process (to work with above)