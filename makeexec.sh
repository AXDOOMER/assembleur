#!/bin/bash

# Build a 64-bit executable from a single .asm file

USAGE="Usage: $0 file.asm"

if [ "$#" -ge 1 ]; then
	if [ -f $1 ]; then
		nasm -f elf64 $1
		name=$(echo "$1" | cut -f 1 -d '.')
		ld -s -o $name $name.o
	else
		echo "Specified file '$1' does not exist."
	fi
else
	echo "$USAGE"
fi
