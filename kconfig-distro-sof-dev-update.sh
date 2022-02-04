#!/bin/bash
KCONFIG_DIR=$(dirname ${BASH_SOURCE[0]})
echo $KCONFIG_DIR

. $KCONFIG_DIR/kconfig-lib.sh

echo "-sof" > localversion
make olddefconfig
make localmodconfig

$COMMAND .config \
	 $KCONFIG_DIR/sof-defconfig  \
	 $KCONFIG_DIR/sof-dev-defconfig  \
	 $KCONFIG_DIR/amd-defconfig \
	 $KCONFIG_DIR/mach-driver-defconfig \
	 $KCONFIG_DIR/hdaudio-codecs-defconfig \
	 $KCONFIG_DIR/lock-stall-defconfig \
	 $KCONFIG_DIR/soundwire-defconfig \
	 $@
