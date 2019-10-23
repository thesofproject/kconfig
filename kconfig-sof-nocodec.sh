#!/bin/bash
KCONFIG_DIR=$(dirname ${BASH_SOURCE[0]})
echo $KCONFIG_DIR
make defconfig
scripts/kconfig/merge_config.sh .config $KCONFIG_DIR/base-defconfig $KCONFIG_DIR/sof-defconfig $KCONFIG_DIR/nocodec-defconfig
