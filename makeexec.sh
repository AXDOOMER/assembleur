#!/bin/bash

# Build a 64-bit executable from a single .asm file

USAGE="Usage: $0 file.asm            (to compile asm file)\n       $0 clean               (to cleanup folder)"

if [ "$#" -ge 1 ]; then
	if [ "$1" = "clean" ]; then
		find . -maxdepth 1 -type f -name "*.asm" -exec basename {} \; | cut -f 1 -d '.' | xargs rm 2> /dev/null
		rm *.o
		echo "Cleanup done"
	elif [ -f $1 ]; then
		# TODO: If NASM is not installed, use YASM?
		nasm -f elf64 $1
		# Check if NASM returned errors?

		name=$(echo "$1" | cut -f 1 -d '.')

		if grep -q extern "$1"; then
			# Use `gcc` because it must be importing glibc functions
			# Under Manjaro, I could not compile without '-static' and it makes the ELFs rather big.
			# Under OpenSuse, it works fine without it.
			gcc -o $name $name.o -static
		else
			# Use the regular linker
			ld -s -o $name $name.o
		fi
	else
		echo "Specified file '$1' does not exist."
	fi
else
	echo -e "$USAGE"
fi
