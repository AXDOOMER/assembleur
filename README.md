# Assembleur

### Comment compiler

Utiliser le script `makeexec.sh`. Il peut compiler tous les fichiers `.asm` de ce repo. Les fichiers contenant le mot clef `extern` seront linkés à l'aide de GCC, car ceux-ci requiert la bibliothèque `glibc`.

#### Utilisation:

* `./makeexec.sh hello64.asm && ./hello64`
* `./makeexec.sh number.asm && ./number`

### Mes programmes

* `hello.asm`: Hello world en 32-bit
* `hello64.asm`: Hello world en 64-bit
* `sayname.asm`: Vous dit Bonjour! avec votre nom en utilisant des _syscall_
* `number.asm`: Importe la libc pour vous demander un nombre en utilisant _scanf_ et _printf_
* `args.asm`: Liste les arguments qui lui sont passés en ligne de commande

### Documentation

* [NASM](https://www.nasm.us/doc/nasmdoc0.html)
* [Linux Assembly](http://asm.sourceforge.net/)
* [X86 Assembly](https://en.wikibooks.org/wiki/X86_Assembly)
* [x86_64 Linux Assembly](https://www.youtube.com/watch?v=BWRR3Hecjao&list=PLetF-YjXm-sCH6FrTz4AQhfH6INDQvQSn&index=2) (Youtube)
* [Searchable Linux Syscall Table for x86 and x86_64](https://filippo.io/linux-syscall-table/)
* [Say hello to x64 Assembly [part 1]](http://0xax.blogspot.com/2014/08/say-hello-to-x64-assembly-part-1.html)
* [x64 Cheat Sheet](https://cs.brown.edu/courses/cs033/docs/guides/x64_cheatsheet.pdf)
* [The Stack: Push and Pop](https://www.cs.uaf.edu/2015/fall/cs301/lecture/09_16_stack.html)
* [Full list of ordinary integer x86 registers and 64 bit registers](https://www.cs.uaf.edu/2017/fall/cs301/reference/x86_64.html)
* [64 bit assembly language using c standard library](https://lists.freebsd.org/pipermail/freebsd-doc/2013-July/022325.html)
* [Allocating Storage Space for Initialized Data](https://www.tutorialspoint.com/assembly_programming/assembly_variables.htm)
* [x86-64 Assembly Language Programming with Ubuntu](http://www.egr.unlv.edu/~ed/assembly64.pdf)

### Fun

* [Compiler Explorer](https://godbolt.org/)
