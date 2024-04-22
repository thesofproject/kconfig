#!/bin/bash

set -e

KCONFIG_DIR=$(dirname ${BASH_SOURCE[0]})
echo $KCONFIG_DIR

. $KCONFIG_DIR/kconfig-lib.sh

make defconfig
$COMMAND .config \
	 $KCONFIG_DIR/base-defconfig \
	 $KCONFIG_DIR/devices-defconfig \
	 $KCONFIG_DIR/hdaudio-codecs-defconfig \
	 $@
