#!/bin/bash
KCONFIG_DIR=$(dirname ${BASH_SOURCE[0]})
echo $KCONFIG_DIR
make defconfig
scripts/kconfig/merge_config.sh .config \
				$KCONFIG_DIR/base-defconfig \
				$KCONFIG_DIR/sof-defconfig  \
				$KCONFIG_DIR/sof-dev-defconfig  \
				$KCONFIG_DIR/sof-mach-driver-defconfig \
				$KCONFIG_DIR/hdaudio-codecs-defconfig \
				$KCONFIG_DIR/soundwire-defconfig $@
