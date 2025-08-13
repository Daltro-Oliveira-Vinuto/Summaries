all: compile

compile: preprocess_only compile_only assemble_only link 


# compilation with GCC --------------------------------------------------

# -g for debug and empty for not debug
DEBUG_FLAG := -g
SOURCE_FILE := hello
SOURCE_EXTENSION := .c
SOURCE_FOLDER := src/
SOURCE_PATH := $(SOURCE_FOLDER)$(SOURCE_FILE)$(SOURCE_EXTENSION)

TARGET_FILE := $(SOURCE_FILE)
TARGET_EXTENSION := .out
TARGET_FOLDER := src/
TARGET_PATH := $(TARGET_FOLDER)$(TARGET_FILE)$(TARGET_EXTENSION)

GCC := gcc
FLAGS_x86 :=$(DEBUG_FLAG) -masm=intel -m32
FLAGS_x64 :=$(DEBUG_FLAG) -masm=intel -m64 $(DEBUG_FLAG)
FILES_AND_FLAGS_TO_LINK_x86 :=$(DEBUG_FLAG) -m32 src/*.o -L -I
FILES_AND_FLAGS_TO_LINK_x64 :=$(DEBUG_FLAG) -m64 src/*.o -L -I


INPUT_FILE_TO_MAIN := input.txt 
OUTPUT_FILE_TO_MAIN := output.txt 
LOAD_FLAGS :=  $(INPUT_FILE_TO_MAIN) $(OUTPUT_FILE_TO_MAIN)

preprocess_only:
	$(GCC) -E $(SOURCE_PATH) > $(SOURCE_FOLDER)$(SOURCE_FILE).txt


compile_only:
	$(GCC) -S $(FLAGS_x86) $(SOURCE_PATH) -o $(SOURCE_FOLDER)$(SOURCE_FILE).s


assemble_only:
	$(GCC) -c $(FLAGS_x86) $(SOURCE_FOLDER)$(SOURCE_FILE).s -o $(SOURCE_FOLDER)$(SOURCE_FILE).o 

# needs to create .debug folder before by: mk debug_files
DEBUG_FOLDER := debug_folder
link:
	$(GCC) $(FILES_AND_FLAGS_TO_LINK_x86) -o $(TARGET_PATH)
	mv $(SOURCE_FOLDER)*.s $(SOURCE_FOLDER)*.txt  $(DEBUG_FOLDER)

load:
	./$(TARGET_PATH) $(LOAD_FLAGS) 

# end of compilation with GCC --------------------------------------------

# analysing object code headers and content --------------------------------
OBJECT_DUMP_SOURCE := $(SOURCE_FOLDER)$(SOURCE_FILE).out
OBJECT_DUMP_TARGET := $(SOURCE_FOLDER)$(SOURCE_FILE).dumped
OBJECT_DUMP := objdump 
OBJECT_DUMP_FLAGS := --disassembler-options=intel-mnemonic
objdump:
	$(OBJECT_DUMP) -x  $(OBJECT_DUMP_FLAGS) $(OBJECT_DUMP_SOURCE) > $(OBJECT_DUMP_TARGET)
	$(OBJECT_DUMP) -s $(OBJECT_DUMP_FLAGS) $(OBJECT_DUMP_SOURCE) >> $(OBJECT_DUMP_TARGET)
	$(OBJECT_DUMP) -S $(OBJECT_DUMP_FLAGS) $(OBJECT_DUMP_SOURCE) >> $(OBJECT_DUMP_TARGET)
	mv $(SOURCE_FOLDER)*.dumped $(DEBUG_FOLDER)


# end of analysing object code headers and content ----------------------------