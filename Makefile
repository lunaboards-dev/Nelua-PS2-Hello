EECROSS = mips64r5900el-ps2-elf
EECC = $(EECROSS)-gcc
EEAR = $(EECROSS)-ar
EERANLIB = $(EECROSS)-ranlib
EEAR_RC = $(EECROSS)-ar rc

IOPCROSS = mipsel-ps2-irx
IOPCC = $(IOPCROSS)-gcc
IOPAR = $(IOPCROSS)-ar
IOPRANLIB = $(IOPCROSS)-ranlib
IOPAR_RC = $(IOPCROSS)-ar rc

CPIO ?= cpio -oHbin

EEINCLUDE ?= -I$(PS2DEV)/ee/include -I$(PS2DEV)/gsKit/include -I$(PS2SDK)/common/include -I$(PS2SDK)/ee/include
EELIB ?= -L$(PS2SDK)/ee/lib -L$(PS2DEV)/gsKit/lib -L$(PS2DEV)/ee/lib -ldebug -lmc
EECFLAGS ?= -D_EE $(EEINCLUDE) $(EELIB)

EENELUA = nelua --cc "$(EECC)" --cflags="$(EECFLAGS)" -DEE
IOPNELUA = nelua --cc "$(IOPCC)" -DIOP

all:
	$(EENELUA) hello.nelua -o hello.elf