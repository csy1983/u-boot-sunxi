#!/bin/bash

[ "$1" = "" ] && echo Please specify SDCARD device node && exit 1

SDDEV=$1
SDDEV1=$(ls "$SDDEV"1)
sudo dd if=spl/sunxi-spl.bin of=$SDDEV bs=1024 seek=8
sync
sudo dd if=u-boot.bin of=$SDDEV bs=1024 seek=32
sync
sudo mkfs.vfat -v $SDDEV1
