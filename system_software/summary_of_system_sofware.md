# Author: Daltro Oliveira Vinuto 
# Email: daltroov777@gmail.com 


# System software :rocket:
0. ## System software 
	> * System Softwere controls the hardware directly. Ex.: OS(operating system), bootloader, drivers, firmware, BIOS(basic input/output system), compiler, assembler, linker, loader, debugger. 
	> * Application software needs System Software to work. Ex.: Games, DBMS(data base management system), Browsers, video/audio players, graphic processing/editing, spreadsheet/text editors.
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
  	> * [makefile](makefile).
  	> * Phases: analysis & synthesis. Use tables(ex.: Symbol Table).
	> * Analysis: lexical analyser(scanner(Regular Expression matching(ex.: Flex) to match tokens using a FSA(finite state automaton for regular language))) -> syntax analyser(parser(BNF/EBNF grammar)for PDA(pushdown automaton for context-free language) ex.: Bison) generates a parse tree, the parser calls the scanner for a token -> semantic analyser(verify variable type, declaration duplicated, flow control, implicit casting) generates a annotated parse tree.
	> * Synthesis: Intermediate Code generation(three addrees code=(operation, operand 1, operand 2)) -> Code Optimization ->  Code Generation(generates the object code to a specific ISA(Instruction Set Architecture) directly or generates the assembly code and then calls the assembler for a ISA).
	> * Three Addrees Code: attribute(simple copy, unary, binary operations), jumps(unconditional, conditional), functions(parameters, call, return), access indexed/indirect(with arrays/pointers).

2. ## Assembler
	> * Hypotethical machine: Registers: ACC(accumulator) with 16 bits, PC(program counter) with 16 bits, 216 words with 16 bits each. Opcode table:
	Operation(Symbolic Opcode) | Numerical Opcode | action
	-------------------------- | ---------------- | -------
	ADD address            | 01 | ACC = ACC + (*address)
	SUB address            | 02 | ACC = ACC - (*address)
	MUL address            | 03 | ACC = ACC * (*address)
	DIV address            | 04 | ACC = ACC / (*address)
	JMP address            | 05 | ACC = address
	JMPN address           | 06 | if ACC < 0: ACC = address
	JMPP address           | 07 | if ACC > 0: ACC = address
	JMPZ address 			  | 08 | if ACC == 0: ACC = address
	COPY address1 address2 | 09 | *address2 = *address1
	LOAD address           | 10 | ACC = (*address)
	STORE address          | 11 | (*address) = ACC
	INPUT address          | 12 | ACC = input
	OUTPUT address         | 13 | output = ACC
	STOP                   | 14 | stop the execution of the program

	Instruction format: <label>: <operation(symbolic opcode)> <operands list> ; <comments>

	Directive table:
	Directive  |  action
	---------- | ----------
	SPACE FACTOR       |  allocates FACTOR(default 1) words(16 bits) of memory for the program
	CONST VALUE        |  allocates a word(16 bits) of memory and store VALUE there
	BEGIN              |  indicate the begin of the program
	END                |  indicate the end of the program
	ORG POSITION       |  the next instructions should start in the memory addresses POSITION
	Label_X: EQU VALUE |  the assembler must insert VALUE in the place of Label_X
	IF Flag            |  assembles the next line of code if Flag != 0
	MACRO param_list   |  indicate the beginning of the macro definition
	ENDMACRO           |  indicate the end of the macro definition
	label_x: EXTERN    |  indicate that the label_x is defined in another file(imported)
	label_x: GLOBAL    |  indicates that the label_x will be used in another file(exported)

	MNT(Macro Name Table): Contains the names of the macros. Is a table with the name of the macro, number of arguments and the location of begin and end of the his definition in the MDT.
	MDT(Macro Definition Table): contains the definitions(body) of the macros defined in MNT.
	

	Example of program to sum A+B and the binary generated(in decimal), obs.: xx means don't care:
	Symbol Table: A==13, B==14, C==15;

	Source code    | Binary generated(in decimal)
	-------------  | ----------------------------
	ADD_TWO: begin |
	INPUT A        |  12 13
	INPUT B        |  12 14
	LOAD A         |  10 13
	ADD B          |  01 14
	STORE C        |  11 15
	OUTPUT C       |  13 15
	STOP           |  14
	A: SPACE       |  xx
	B: SPACE       |  xx 
	C: SPACE       |  xx
	END            |  



	> * Foward reference solution: two-pass assembler(first pass generates the symbol table and second pass generates the object code) or one-pass assembler(linked list of addresses).

	> * Two-pass assembler algorithm:
		> * Preprocessing(macro expansion) algorithm: 
			* Input: Source code with macros and assembling flags.
			* Output: Source code without macros:
			1. For each line of the source file:
				1. Split the line in label, instruction/directive, operands, comments
				2. If it is a declaration of a macro then updates MNT and MDT 
				3. If it is calling a macro then use the MNT, MDT to update the parameters and add the expanded code of the macro definition in the source code.


		> * First Pass(Input: source code, Output: ST(Symbol Table), GST(Global Symbol Table), EST(Extern Symbol table)), it needs the Opcode Table and Directive Table.
			Location_Counter = 0;
			Line_Number = 1
			For each line of the source file:
				* Split the line in label, instruction/directive, operands, comments
				* If is a label_x: EXTERN then add the label_x in the ST and mark it as extern symbol with the value 0 in the ST;
				* Else if is a label_x: GLOBAL then add the label_x in the GST and let the value as 0(empty).
				* Else if there is a label label_x:
					* If label_x is in the ST then throws a error.
					* If label_x is not in the ST:
						* If label_x is not marked as a extern symbol in the ST then saves (label_x, Location_Counter) in the ST.	
						* Else if label_x is marked as a extern symbol in the ST then throws a error.
				* If the line contains a instruction:
					Location_Counter += get_size_of_the_instruction(instruction);
				* Else if the line contains a directive
					Location_Counter += execute_directive(directive);
				* Else throws a error of invalid operation
				Line_Number++;

			For each row in the GST updates the value of the label with the updated value in the ST.



		> * Second Pass(Input: source code, Output: Object Code, Global Symbol Table, Extern Symbol table for the Linker, RL(Relocation List) of Positions(relative addresses positions) for the Loader), it needs the Opcode Table, Directive Table and the Symbol Table:
			Location_Counter = 0;
			Line_Number = 1
			For each line of the source file:
				* Split the line in label, instruction/directive, operands, comments
				* If line contains a instruction:
					* opcode = find_instruction_opcode(instruction)
					* save opcode in the object file.
					Location_Counter++;
					* For each of the operands(label_i+operand_offset):
						* operand_address = ST(label_i)
						* If label_i is not marked as extern symbol in the ST then saves operand_address in the object file.
						* Else if label_i is marked as extern symbol in the ST then saves 0 in the object file and saves (label_i, operand_offset) in the EST.
						Location_Counter++;
						* Saves the Location_Counter in the RL.

					Location_Counter += get_size_of_the_instruction(instruction);
				* Else if line contains a directive:
					Location_Counter += execute_directive(directive);
					* Saves the don't care values or other values in the object code as accordingly to the directive.

				* Else throws a error of invalid operation
				Line_Number++


	> * One-pass assembler algorithm:
		* The same as the two-pass algorithm but do the two steps of the two-pass algorithm while it is reading the source file only once.
		* To solve the forward reference problem we save each position in the linked list associated with the label_x in the ST marking it as solved or not.
			* While the symbol value is not solved then saves the address of the label_x not solved in the list associated with the label_x and saves a dummy(0) value in the object code position.
			* After the symbol has being solved(value found) then go through the whole list of addresses of the label_x replacing the dummy(0) value with the real value of the label_x in the object code(still in the memory) and then marks the label_x as solved.



3. ## Linker
	> * Linker algorithm(Input: a set of object files of all the modules of a program, GST(Global Symbol Table) for each module, EST(Extern Symbol Table) for each module, RL(Relocation List) of Positions(relative addresses positions) for each module, Output: only one object file in the format specified by the Loader and with the information about the Relocation Positions):
		* Mark all values in RL as not used.
		* Choose a sequence to place the modules one after another sequentially.
		* Calculates the CF(correction factor) for each module.
		* Joins all the GST in a single UGST(Unified Global Symbol Table).
		* Corrects(adds CF) the values of each row of the UGST with the CF of each module.
		* Go through each of the EST and updates in each module the value in the final object code with the value of the label_x in the EST(label_x, offset) added with the the value in the UGST(label_x, corrected_value), then saving in the object code (corrected_value + offset) and mark the RL value as used.
		* Go through all the values in the RL not used and updates the actual value of the final object code in that position with the (actual value + CF) of the module.

4. ## Loader

5. ## Libraries

6. ## Executable File Formats

7. ## Assembly x86/x64/ARM/RISC-V/MIPS
	### X86
	```X86
		format:
			; comments about title, objectives, input, output
			section .data ; for initialized data
				variable_name db/dw/dd/dq/dt value1, value2,...,valueN
			section .bss  ; for uninitialized data
				variable_name resb/resw/resd/resq/rest value1, value2, ...,valueN
			section .text ; for directives and instructions 
			global _start: ; or _main
				_start: ; or _main
				symbol operation operands ; comments
			```

8. ## Main Instructions and syscalls


9. ## Addressing Modes 

10. ## Input/Output - File manipulation

11. ## Flow Control

12. ## Functions 

13. ## Assembly x C 

14. ## Floating Pointer Arithmetic

15. ## Assembly x64



# Sources:
 1. System Software discipline of the University of Brasilia.
 2. Randal E. Bryant, David R. O'Hallaron: Computer Systems A Programmer's Perspective.
 3. Jonh R. Levine: Linkers & Loaders.
 4. Brian W. Kerninghan, Dennis M. Ritchie: C Programming Language.
 5. ARM programming: https://azeria-labs.com/
 6. ARM documentation: https://developer.arm.com/
 7. RISC-V documentation: https://riscv.org/specifications/ratified/



# Tools:
 1. CPU Emulator for Altera, ARM, RISC-V, MIPS: https://cpulator.01xz.net/
 2. ARM cpu emulator: https://www.qemu.org/docs/master/system/target-arm.html
 3. RARS RISC-V emulator: https://github.com/TheThirdOne/rars
 2. MARS Mips emulator: https://github.com/dpetersanderson/MARS/
















