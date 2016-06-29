# norns

monome raspberry-pi hat

## Directories

- `scripts`: bash scripts for easy staging and compilation of code
- `configs`: norns-specific device tree overlay and linux kernel configuration

## Building
The building and installing process could be broken up into smaller
steps and made faster, but for simplicity there are two scripted
methods to build the driver.  Also, you can replace any of the scp
commands with cp if you've mounted the SD card on your local machine.
1. Cross-compile on a local system, requires approximately 4.3GB locally and
   2.8GB on the RasbPi
2. Compile remotely on the RasbPi, requires approximately 2.8GB on the RasbPi
** restore kernel source (optional)
If you want the ability to completely restore your RasbPi configuration,
backup the kernel source directory.  This requires approximately 2.8GB locally.
```$ mkdir rasbpi_source_backup
$ scp -r pi@192.168.#.#:linux rasbpi_source_backup/. 
```
** cross-compiling on local system
```$ git clone https://github.com/bonemurmurer/norns.git
$ cd norns
$ make cross-compile

```
You'll need to copy the kernel sources over to the RasbPi. 'tools' is a large
directory (1.4GB+) and will take up diskspace, remove it first.
```
$ ssh pi@192.168.#.#
pi@raspberrypi:~ $ rm -rf ~/linux
pi@raspberrypi:~ $ exit
$ make clean_tools
$ cd ..
$ scp -r norns pi@192.168.#.#:.
```
** compiling remotely

```$ ssh pi@192.168.#.#
pi@raspberrypi:~ $ rm -rf ~/linux
pi@raspberrypi:~ $ git clone https://github.com/bonemurmurer/norns.git
pi@raspberrypi:~ $ cd norns
pi@raspberrypi:~ $ make

```

## Installing
```
pi@raspberrypi:~ $ cd ~/norns
pi@raspberrypi:~ $ make install
pi@raspberrypi:~ $ sudo reboot
```

## To-Do
* Merge patch to cs4270 codec driver to upstream Linux kernel
* Submit RasbPi-specific code and configuration to Raspbian distribution
* Update Norns build process to work with previous kernel/Raspbian tasks
* Remove norns-linux repository (https://github.com/bonemurmurer/norns-linux)