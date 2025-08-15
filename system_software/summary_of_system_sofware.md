
# System software :rocket:
0. ## System software 
	> * System Softwere controls the hardware directly. Ex.: OS(operating system), bootloader, drivers, firmware, BIOS(basic input/output system), compiler, assembler, linker, loader, debugger. 
	> * Application software needs System Software to work. Ex.: Games, DBMS, Browsers, video/audio players, graphic processing/editing, spreadsheet/text editors.
	> * Computer System == (Hardware & System Software) + Application Software. 

1. ## Programming Languages
   (**algorithm** (solve a problem) first):
	> * Low Level(machine language and assembly language(need a assembler program), total understanding && control of the machine): Intel x86-64, Armv7, RISC-V, MIPS.
	> * High Level(paradigms: structured, OOP, functional, logic; needs a compiler, assembler,linker and loader or interpreter): C/C++, Rust, Java, Python, Javascript, Go.
	> * Intepretador: source code -> translation(or execute the instruction directly on the VM) -> intermediate code(ex.: bytecode) -> interpreter(execute instructions one by one in a VM(virtual machine)). The code is more portable(you just need to create the VM to the specific hardware once).
	> * Compilation: source code -> translate(full code) -> assembly(then call a assembler)/binary -> binary loaded in the memory by the OS(operating system) of the machine. It is faster to execute then using a interpreter but is harder to test/debugger.
	
2. ## Compilation in GCC 
	> * source code -> load module in memory:	gcc --help, man gcc.
	> * preproces: gcc -E, source code -> source code without comments, macros, ifdef, etc.
	> * compiler: gcc -S, source code -> assembly language(instructions & directives).
	> * assembler: gcc -c, assembly language -> machine language.
	> * link: gcc -l -o, object file(machine language) -> load module(executable file).
	> * loader: ./file , (load module(executable file) in the main memory.
  	> * [makefile](makefile)

2. ## Assembler

3. ## Linker

4. ## Loader

5. ## Libraries

6. ## File Formats

7. ## Assembly x86/x64/ARM/RISC-V/MIPS
	# X86
		format:
			; comments about title, objectives, input, output
			section .data ; for initialized data
				variable_name db/dw/dd/dq/dt value1, value2,...,valueN
			section .bss  ; for uninitialized data
				variable_name resb/resw/resd/resq/rest value1, value2, ...,valueN
			section .text ; for directives and instructions 
			global underscore_start: ; or undercore_main
				underscore_start: ; or underscore_main
				symbol operation operands ; comments

8. ## Main Instructions and syscalls

9. ## Addressing Modes 

10. ## Input/Output - File manipulation

11. ## Flow Control

12. ## Functions 

13. ## Assembly x C 

14. ## Floating Pointer Arithmetic

15. ## Assembly x64




















