dev : compile static_check dynamic_check
prod : compile  

compile: preprocess_only compile_only assemble_only link 


# compilation with GCC --------------------------------------------------
# -g for debug and empty for not debug
DEBUG_FLAG := -g

SOURCE_FILE := hello
SOURCE_EXTENSION := .asm
SOURCE_FOLDER := src/x86/
SOURCE_PATH := $(SOURCE_FOLDER)$(SOURCE_FILE)$(SOURCE_EXTENSION)

TARGET_FILE := $(SOURCE_FILE)
TARGET_EXTENSION := .out
TARGET_FOLDER := src/x86/
TARGET_PATH := $(TARGET_FOLDER)$(TARGET_FILE)$(TARGET_EXTENSION)

GCC := gcc
FLAGS_x86 :=$(DEBUG_FLAG) -masm=intel -m32
FLAGS_x64 :=$(DEBUG_FLAG) -masm=intel -m64
FILES_AND_FLAGS_TO_LINK_x86 :=$(DEBUG_FLAG) -m32 $(SOURCE_FOLDER)*.o -L -I
FILES_AND_FLAGS_TO_LINK_x64 :=$(DEBUG_FLAG) -m64 $(SOURCE_FOLDER)*.o -L -I


INPUT_FILE_TO_MAIN := input.txt 
OUTPUT_FILE_TO_MAIN := output.txt 
LOAD_FLAGS :=  $(INPUT_FILE_TO_MAIN) $(OUTPUT_FILE_TO_MAIN)

# needs to create .debug folder before by: mk debug
DEBUG_FOLDER := debug

preprocess_only:
	$(GCC) -E $(SOURCE_PATH) > $(SOURCE_FOLDER)$(SOURCE_FILE).txt


compile_only:
	$(GCC) -S $(FLAGS_x86) $(SOURCE_PATH) -o $(SOURCE_FOLDER)$(SOURCE_FILE).s


assemble_only:
	$(GCC) -c $(FLAGS_x86) $(SOURCE_FOLDER)$(SOURCE_FILE).s -o $(SOURCE_FOLDER)$(SOURCE_FILE).o 

link:
	$(GCC) $(FILES_AND_FLAGS_TO_LINK_x86) -o $(TARGET_PATH)
	mv $(SOURCE_FOLDER)*.s $(SOURCE_FOLDER)*.txt  $(DEBUG_FOLDER)

load:
	./$(TARGET_PATH) $(LOAD_FLAGS)

clean:
	mv $(SOURCE_FOLDER)*.o $(DEBUG_FOLDER)

# end of compilation with GCC --------------------------------------------

# analysing object code headers and content --------------------------------

OBJECT_DUMP_SOURCE := $(SOURCE_FOLDER)$(SOURCE_FILE).o
OBJECT_DUMP_TARGET := $(SOURCE_FOLDER)$(SOURCE_FILE).dumped
OBJECT_DUMP := objdump 
OBJECT_DUMP_FLAGS := --disassembler-options=intel-mnemonic
objdump:
	$(OBJECT_DUMP) -x  $(OBJECT_DUMP_FLAGS) $(OBJECT_DUMP_SOURCE) > $(OBJECT_DUMP_TARGET)
	$(OBJECT_DUMP) -s $(OBJECT_DUMP_FLAGS) $(OBJECT_DUMP_SOURCE) >> $(OBJECT_DUMP_TARGET)
	$(OBJECT_DUMP) -S $(OBJECT_DUMP_FLAGS) $(OBJECT_DUMP_SOURCE) >> $(OBJECT_DUMP_TARGET)
	mv $(SOURCE_FOLDER)*.dumped $(DEBUG_FOLDER)


# end of analysing object code headers and content ----------------------------

# assemble and link using nasm ----------------------------------------------
FLAGS_NASM_x86 :=$(DEBUG_FLAG) -f elf32
FLAGS_NASM_x64 :=$(DEBUG_FLAG) -f elf64
FLAGS_LD_x86 :=$(DEBUG_FLAG) -m elf_i386
FLAGS_LD_x64 :=$(DEBUG_FLAG)""
NASM := nasm
LD := ld

asm: assemble_with_nasm link_with_ld load_asm

assemble_with_nasm:
	$(NASM) $(SOURCE_PATH) $(FLAGS_NASM_x86) -o $(SOURCE_FOLDER)$(SOURCE_FILE).o 

link_with_ld:
	$(LD) $(SOURCE_FOLDER)$(SOURCE_FILE).o $(FLAGS_LD_x86) -o $(TARGET_PATH)

load_asm:
	./$(TARGET_PATH)


# end of assemble and link using nasm ------------------------------------------


# start of the code checking section -----------------------------------------

# sudo apt install pipx
# pipx install cpplint
CPPLINT := cpplint
static_check:
	$(CPPLINT) $(SOURCE_PATH)

# sudo apt install valgrind
# sudo apt install  libc6-dbg:i386
VALGRIND := valgrind
VALGRIND_LOGS := valgrind_logs.txt
VALGRIND_FLAGS :=--leak-check=full # --track-origins=yes --show-leak-kinds=all # --log-file=$(VALGRIND_LOGS)
dynamic_check:
	$(VALGRIND) $(VALGRIND_FLAGS) ./$(TARGET_PATH)



# end of the code checking section -----------------------------------------

# start of the debugging section with gdb ----------------------------------

GDB := gdb 
GDB_C_FLAGS := -ex "set disassembly-flavor intel" -ex "layout split" -ex "b main" -ex "r"
GDB_ASM_FLAGS := -ex "set disassembly-flavor intel" -ex "layout asm" -ex "layout regs" -ex "b _start" -ex "r"

debug_c:
	$(GDB) $(TARGET_PATH) $(GDB_C_FLAGS)

debug_asm:
	$(GDB) $(TARGET_PATH) $(GDB_ASM_FLAGS)


# end of the debugging section with gdb --------------------------------------