
#Test compilation makefile

.PHONY: setup nRF52832_S132 nRF52832_S212

test: setup nRF52832_S132

setup:
	mkdir -p builds

nRF52832_NONE:
	mkdir -p builds/nRF52832_NONE; cd builds/nRF52832_NONE; cmake -DDEVICE=nRF52832 -DBOARD=BOARD_PCA10036 ../..; make

nRF52832_S132:
	mkdir -p builds/nRF52832_S132; cd builds/nRF52832_S132; cmake -DDEVICE=nRF52832 -DBOARD=BOARD_PCA10036 -DSOFTDEVICE=S132 ../..; make

nRF52832_S212:
	mkdir -p builds/nRF52832_S212; cd builds/nRF52832_S212; cmake -DDEVICE=nRF52832 -DBOARD=BOARD_PCA10036 -DSOFTDEVICE=S212 ../..; make

clean:
	rm -rf builds
