# norns

monome raspberry-pi hat

## Directories

- `scripts`: bash scripts for easy staging and compilation of code
- `configs`: norns-specific device tree overlay and linux kernel configuration

## Building
The building and installing process could be broken up into smaller
steps and made faster, but for simplicity there are two scripted
methods to build the driver.  (Also, you can replace any of the scp
commands with cp if you've mounted the SD card on your local machine)
* Cross-compile on a local system, requires approximately 4.3GB locally and
   2.8GB on the RasbPi
* Compile remotely on the RasbPi, requires approximately 2.8GB on the RasbPi

#### cross-compiling on local system
```
$ sudo apt-get install git
After this operation, 21.5 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
$ git clone https://github.com/bonemurmurer/monome-snd.git
$ cd norns
$ make cross-compile
```
You'll need to copy the kernel sources over to the RasbPi. 'tools' contains
the cross-compilation scripts.  It's a large directory (1.4GB+) and will take
up disk space, remove it first.
```
$ ssh pi@192.168.#.#
$ make clean-tools
$ cd ..
$ scp -r norns pi@192.168.#.#:.
```
#### compiling remotely
```
$ ssh pi@192.168.#.#
pi@raspberrypi:~ $ sudo apt-get install bc
pi@raspberrypi:~ $ git clone https://github.com/bonemurmurer/monome-snd.git
pi@raspberrypi:~ $ cd norns
pi@raspberrypi:~ $ make
```

## Installing
```
pi@raspberrypi:~ $ cd ~/norns
pi@raspberrypi:~ $ make install
pi@raspberrypi:~ $ sudo reboot
```

## Uninstalling
After you're done using norns: make uninstall, make clean, and (if you backed
them up) copy your original sources back to the RasbPi.
```
$ ssh pi@192.168.#.#
pi@raspberrypi:~ $ cd norns
pi@raspberrypi:~ $ make uninstall
pi@raspberrypi:~ $ make clean
pi@raspberrypi:~ $ cd ..
pi@raspberrypi:~ $ rm -rf norns
pi@raspberrypi:~ $ exit
$ scp -r raspbi_source_backup/linux pi@192.168.#.#:.
```

## To-Do
* Merge patch to cs4270 codec driver to upstream Linux kernel
* Submit RasbPi-specific code and configuration to Raspbian distribution
* Update Norns build process to work with previous kernel/Raspbian tasks
* Remove norns-linux repository (https://github.com/bonemurmurer/norns-linux)