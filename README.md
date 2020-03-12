# kconfig
kconfig fragments for SOF development

The base-defconfig is intended to provide basic support for all platforms currently used for SOF development, including:
- boot
- i915/display
- USB (w/ Ethernet dongles)
- Ethernet
- WiFi


sof-defconfig lists all the options for SOF which can be enabled by distros
sof-dev-defconfig lists all SOF developer options which should not be enabled by distros. This file in included in all SOF CI configurations.
sst-defconfig lists all the options for the SST driver.
hdaudio-defconfig lists all the options for HDaudio codec support.
mach-driver-defconfig lists all the optiosn for SOF enabled machine driver support.
soundwire-defconfig lists all the options for SoundWire support.

Those fragments are supposed to be applied on top of a default kernel
configuration.

```bash
cd <your kernel>
make defconfig
````

The following options are some example how to use defconfigs:
- HDA
````bash
scripts/kconfig/merge_config.sh .config <PATH>/kconfig/base-defconfig <PATH>/kconfig/hdaudio-codecs-defconfig
````
- SST
````bash
scripts/kconfig/merge_config.sh .config <PATH>/kconfig/base-defconfig <PATH>/kconfig/sst-defconfig <PATH>/kconfig/hdaudio-codecs-defconfig
````
- SOF-NOCODEC: SOF in nocodec debug mode
````bash
scripts/kconfig/merge_config.sh .config <PATH>/kconfig/base-defconfig <PATH>/kconfig/sof-defconfig <PATH>/kconfig/nocodec-defconfig
````
- SOF-DEFAULT: SOF support with I2S, HDA and SDW support with machine drivers
````bash
scripts/kconfig/merge_config.sh .config <PATH>/kconfig/base-defconfig <PATH>/kconfig/sof-defconfig <PATH>/kconfig/mach-driver-defconfig <PATH>/kconfig/hdaudio-codecs-defconfig <PATH>/kconfig/soundwire-defconfig
````

Or you can generate above pre-defined kconfig with scripts:
````bash
<PATH>/kconfig/kconfig-hda.sh
<PATH>/kconfig/kconfig-sst.sh
<PATH>/kconfig/kconfig-sof-nocodec.sh
<PATH>/kconfig/kconfig-sof-default.sh
````

Note that the last two options include developer options not suitable for distros.

then build as usual
````bash
make -j8
````

Additional fragments:

- atom-defconfig: Atom-specific optimization
- compile-test-defconfig: turn on compilation checks
- debug-defconfig: turn on debug hooks
- edison-defconfig: configuration for Edison provided by Andy Shevchenko
- igb-tsn-defconfig: configuration for I210/I211
- memory-debug-defconfig: KASAN and friends debug
- nocodec-defconfig: interface-level tests for SSP/DMIC
- nopm-defconfig: turn off PM completely
- notrace-debugfs-defconfig: remove debugfs, useful for error handling
- snd-drm-modules-defconfig: build sound and DRM as modules
- up-defconfig: config for up board
- telemetry-debugfs-defconfig: config snippet for S0ix telemetry debugfs support


Enjoy!
