System Software Review


1. System software {
	Programming Languages(algorithm(solve a problem) first) {
		Low Level(machine language and assembly language(need a assembler program), total understanding && control of the machine): Intel x86-64, Armv7, RISC-V, MIPS.
		High Level(paradigms: structured, OOP, functional, logic; needs a compiler, assembler,linker and loader or interpreter): C/C++, Rust, Java, Python, Javascript, Go.
	}
	Compilation in GCC {
		source code -> load module in memory.
		gcc --help, man gcc , preprocess only: -E, preprocess & compiler only: -S , preprocess && compile && assembler only: -c , preprocess && compile && assemble && link -o , loader ./ 
		preprocess { source code -> source code without comments, macros, ifdef, etc.},
		compiler {source code -> assembly language(instructions & directives)},
		assembler {assembly language -> machine language},
		link {object file(machine language) -> load module(executable file)},
		loader{load module(executable file)  in the main memory}

	}

2. 

3.

4.

5.

6.

7.

8.

9.

10. 


















