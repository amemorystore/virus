# .     #
.PHONY: all compare clean

.SUFFIXES:
.SUFFIXES: .asm .o .gb
.SECONDEXPANSION:

ROM := virus.gb
OBJS := main.o wram.o

all: $(ROM)

$(OBJS): $$*.asm $$($$*_dep)
	rgbasm -h -o $@ $<

$(ROM): $(OBJS)
	rgblink -n $(ROM:.gb=.sym) -m $(ROM:.gb=.map) -o $@ $^
	rgbfix -jv -k 01 -l 0x33 -m 0x00 -p 0 -r 02 -t "VIRUS" -i VIRS $@

clean:
	rm -f $(ROM) $(OBJS) $(ROM:.gb=.sym)
#.  #  e    n      d
