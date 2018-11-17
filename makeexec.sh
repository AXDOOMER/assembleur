#!/bin/bash

# Build a 64-bit executable from a single .asm file

USAGE="Usage: $0 file.asm"

if [ "$#" -ge 1 ]; then
	if [ -f $1 ]; then
		# TODO: If NASM is not installed, use YASM?
		nasm -f elf64 $1
		# Check if NASM returned errors?

		name=$(echo "$1" | cut -f 1 -d '.')

		if grep -q extern "$1"; then
			# Use `gcc` because it must be importing glibc functions
			gcc -o $name $name.o -static
		else
			# Use the regular linker
			ld -s -o $name $name.o
		fi
	else
		echo "Specified file '$1' does not exist."
	fi
else
	echo "$USAGE"
fi
