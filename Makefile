AS = vasm6809_oldstyle
LD = vlink

VPATH = src

# The test.o object must be first to ensure proper start of the executable code.
OBJECTS =	obj/reset.o

# Order of the rest of the objects doesn't matter.
OBJECTS +=	obj/vectors.o obj/exceptions.o obj/core.o obj/timer.o obj/tables.o obj/sound.o

# Flags
ASFLAGS = -Fvobj -6809 -quiet
LDFLAGS = -b rawbin1 -Trom.ld -Mrom.map

CCNATIVE = gcc

all: rom.bin

rom.bin: rom_unpatched.bin mk_rom
	./mk_rom

rom_unpatched.bin: $(OBJECTS) rom.ld
	$(LD) $(LDFLAGS) $(OBJECTS) -o rom_unpatched.bin

obj/%.o : %.s
	$(AS) $(ASFLAGS) $< -o $@ -L $@.list

.PHONY: clean
clean:
	rm mk_rom rom_unpatched.bin rom.bin rom.map rom.cpp $(OBJECTS)
	cd obj && rm *.list && cd ..

mk_rom: tools/mk_rom.c
	$(CCNATIVE) -o mk_rom tools/mk_rom.c
