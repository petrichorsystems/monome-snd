#!/bin/bash
read -p "Are you sure? 'make clean' will remove system backups (Y/N): " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
	rm -rf linux
	rm -rf tools
	rm -rf backups
fi

