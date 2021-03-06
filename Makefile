#
# Makefile
#

CIRCLEHOME = third_party/circle-stdlib/libs/circle
NEWLIBDIR = third_party/circle-stdlib/install/arm-none-circle
VICE = third_party/vice-3.2/src

OBJS	= main.o kernel.o vicescreen.o vicesound.o vicesoundbasedevice.o \
          viceoptions.o

# TODO Add subdir to kick off vice compilation

include $(CIRCLEHOME)/Rules.mk

CFLAGS += -I "$(NEWLIBDIR)/include" -I $(STDDEF_INCPATH) \
          -I third_party/circle-stdlib/include
LIBS := $(VICE)/alarm.o $(VICE)/attach.o $(VICE)/autostart.o $(VICE)/autostart-prg.o \
	$(VICE)/cbmdos.o $(VICE)/cbmimage.o $(VICE)/charset.o \
	$(VICE)/clipboard.o $(VICE)/clkguard.o $(VICE)/cmdline.o $(VICE)/color.o \
	$(VICE)/crc32.o $(VICE)/datasette.o $(VICE)/debug.o $(VICE)/dma.o \
	$(VICE)/embedded.o $(VICE)/event.o $(VICE)/findpath.o $(VICE)/fliplist.o \
	$(VICE)/gcr.o $(VICE)/info.o $(VICE)/init.o $(VICE)/initcmdline.o \
	$(VICE)/interrupt.o $(VICE)/ioutil.o $(VICE)/kbdbuf.o $(VICE)/keyboard.o \
	$(VICE)/lib.o $(VICE)/libm_math.o $(VICE)/log.o \
	$(VICE)/machine-bus.o $(VICE)/machine.o $(VICE)/main.o $(VICE)/network.o \
	$(VICE)/opencbmlib.o $(VICE)/palette.o $(VICE)/ram.o \
	$(VICE)/rawfile.o $(VICE)/rawnet.o $(VICE)/resources.o $(VICE)/romset.o \
	$(VICE)/screenshot.o $(VICE)/snapshot.o $(VICE)/socket.o \
	$(VICE)/sound.o $(VICE)/sysfile.o $(VICE)/translate.o $(VICE)/traps.o \
	$(VICE)/util.o $(VICE)/vicefeatures.o $(VICE)/vsync.o $(VICE)/zfile.o \
	$(VICE)/zipcode.o $(VICE)/midi.o $(VICE)/tapeport/libtapeport.a \
	$(VICE)/c64/libc64.a $(VICE)/tapeport/libtapeport.a \
	$(VICE)/c64/cart/libc64cartsystem.a $(VICE)/c64/cart/libc64cart.a \
	$(VICE)/c64/cart/libc64commoncart.a \
	$(VICE)/drive/iec/libdriveiec.a $(VICE)/drive/iecieee/libdriveiecieee.a \
	$(VICE)/drive/iec/c64exp/libdriveiecc64exp.a $(VICE)/drive/ieee/libdriveieee.a \
	$(VICE)/drive/libdrive.a $(VICE)/drive/tcbm/libdrivetcbm.a \
	$(VICE)/iecbus/libiecbus.a $(VICE)/lib/p64/libp64.a \
	$(VICE)/parallel/libparallel.a $(VICE)/vdrive/libvdrive.a $(VICE)/sid/libsid.a \
	$(VICE)/monitor/libmonitor.a $(VICE)/joyport/libjoyport.a \
	$(VICE)/samplerdrv/libsamplerdrv.a $(VICE)/sounddrv/libsounddrv.a \
	$(VICE)/mididrv/libmididrv.a $(VICE)/socketdrv/libsocketdrv.a \
	$(VICE)/hwsiddrv/libhwsiddrv.a $(VICE)/iodrv/libiodrv.a \
	$(VICE)/gfxoutputdrv/libgfxoutputdrv.a $(VICE)/printerdrv/libprinterdrv.a \
	$(VICE)/rs232drv/librs232drv.a $(VICE)/diskimage/libdiskimage.a \
	$(VICE)/fsdevice/libfsdevice.a $(VICE)/tape/libtape.a $(VICE)/fileio/libfileio.a \
	$(VICE)/serial/libserial.a $(VICE)/core/libcore.a $(VICE)/vicii/libvicii.a \
	$(VICE)/raster/libraster.a $(VICE)/userport/libuserport.a $(VICE)/diag/libdiag.a \
	$(VICE)/rtc/librtc.a $(VICE)/video/libvideo.a $(VICE)/usleep.o  \
	$(VICE)/imagecontents/libimagecontents.a \
	$(VICE)/arch/raspi/libarch.a \
        $(NEWLIBDIR)/lib/libm.a \
	$(NEWLIBDIR)/lib/libc.a \
	$(NEWLIBDIR)/lib/libcirclenewlib.a \
 	$(CIRCLEHOME)/addon/SDCard/libsdcard.a \
  	$(CIRCLEHOME)/lib/usb/libusb.a \
 	$(CIRCLEHOME)/lib/input/libinput.a \
 	$(CIRCLEHOME)/lib/fs/fat/libfatfs.a \
 	$(CIRCLEHOME)/lib/fs/libfs.a \
  	$(CIRCLEHOME)/lib/net/libnet.a \
  	$(CIRCLEHOME)/addon/vc4/vchiq/libvchiq.a \
  	$(CIRCLEHOME)/addon/linux/liblinuxemu.a \
  	$(CIRCLEHOME)/lib/sched/libsched.a \
  	$(CIRCLEHOME)/lib/libcircle.a

