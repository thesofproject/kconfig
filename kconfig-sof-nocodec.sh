#!/bin/bash
KCONFIG_DIR=$(dirname ${BASH_SOURCE[0]})
echo $KCONFIG_DIR

. $KCONFIG_DIR/kconfig-lib.sh

make defconfig
$COMMAND .config \
	 $KCONFIG_DIR/base-defconfig    \
	 $KCONFIG_DIR/sof-defconfig     \
	 $KCONFIG_DIR/sof-dev-defconfig \
	 $KCONFIG_DIR/nocodec-defconfig \
	 $KCONFIG_DIR/lock-stall-defconfig \
	 $@
