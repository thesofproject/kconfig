#!/bin/bash

set -e

KCONFIG_DIR=$(dirname "${BASH_SOURCE[0]}")
echo "$KCONFIG_DIR"

. "$KCONFIG_DIR"/kconfig-lib.sh

make defconfig ARCH=arm64
$COMMAND -m .config \
	 "$KCONFIG_DIR"/arm64-nobloat-defconfig \
	 "$KCONFIG_DIR"/sof-defconfig  \
	 "$KCONFIG_DIR"/sof-dev-defconfig \
	 "$@"
make olddefconfig ARCH=arm64
