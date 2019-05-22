# kconfig
kconfig fragments for SOF development

The base-defconfig is intended to provide basic support for all platforms currently used for SOF development, including:
- boot
- i915/display
- USB (w/ Ethernet dongles)
- Ethernet
- WiFi


sof-defconfig lists all the options for SOF.
sst-defconfig lists all the options for the SST driver.
hdaudio-defconfig lists all the options for HDaudio codec support

Those fragments are supposed to be applied on top of a default kernel
configuration.

```bash
cd <your kernel>
make defconfig
````

Then select one of the three options

````bash
scripts/kconfig/merge_config.sh .config <PATH>/kconfig/base-defconfig <PATH>/kconfig/hdaudio-codecs-defconfig
scripts/kconfig/merge_config.sh .config <PATH>/kconfig/base-defconfig <PATH>/kconfig/sst-defconfig <PATH>/kconfig/hdaudio-codecs-defconfig
scripts/kconfig/merge_config.sh .config <PATH>/kconfig/base-defconfig <PATH>/kconfig/sof-defconfig <PATH>/kconfig/sof-mach-driver-defconfig <PATH>/kconfig/hdaudio-codecs-defconfig
````

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


Enjoy!