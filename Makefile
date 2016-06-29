all:
	bash scripts/dependency_check_kernel.sh
	cd norns-linux
	make
	cd ..

modules:
	bash scripts/dependency_check_kernel.sh
	cd norns-linux
	make modules
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
