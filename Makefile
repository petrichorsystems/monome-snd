all:
	bash scripts/dependency_check_kernel.sh
	bash scripts/compile.sh
modules:
	bash scripts/dependency_check_kernel.sh
	cd linux
	make -j4 ARCH=arm modules dtbs
	cd ..

cross-compile:
	bash scripts/dependency_check_kernel.sh
	bash scripts/dependency_check_tools.sh
	bash scripts/cross_compile_kernel.sh

cross-compile-modules:
	bash scripts/dependency_check_kernel.sh
	bash scripts/dependency_check_tools.sh
	bash scripts/cross_compile_modules.sh

install:
	bash scripts/backup.sh
	bash scripts/install.sh

uninstall:
	bash scripts/uninstall.sh

clean:
	bash scripts/clean.sh

clean-tools:
	rm -rf tools
