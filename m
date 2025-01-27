Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F8117BEB6;
	Mon, 27 Jan 2025 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738000797; cv=none; b=V7Pf/BD2fe2ayKSvHFTDSis0o+f9V1HKvKwEbRSC2/IjEHmeVfPnCJIsD6zQeFdFvtLSjCj66PJMigXh3DoglWqQgwCLzf/moVSx4CJ1MYCLQ/jD+CW7VHfBkAlBvfhkPCeJjAIKvm+TwXQ/PQ9x6V4SFhrRnk685kCwLzJOsXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738000797; c=relaxed/simple;
	bh=l1d9yDAe68WR6X7n4XDqzM0yxCdAllsVLaPjkrT9UWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NnO1NHr4upRMgw5ztWcafSLO6MlRzwngaZPhz2BQCp8bAkH+AB1Mwm/d5fdXieUHW6FBSTRXU8mTXwAuAl4DUb28GuJ7ML35/Ob4HqiAhHisuMl1T5ifTO3+rzKCJDKJVZe6ZiOSjd3d673dUuie0iZjLyUnkVQuySUWQQqTgr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MT0FCPVi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MT0FCPVi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0754AC4CED2;
	Mon, 27 Jan 2025 17:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738000796;
	bh=l1d9yDAe68WR6X7n4XDqzM0yxCdAllsVLaPjkrT9UWo=;
	h=Date:From:To:Cc:Subject:From;
	b=MT0FCPVi+tXcYLDPapo2yCB2jRy9qyCMjOvOptoV7xNopGF/PyWFPF02uV09cmpuv
	 ICPBIDCqsTNialwTqr8piBOqz/1mts6lN4ACUnHpZsSefD+tz5JBTYpriQzGGAmuTN
	 9rmk+do0Lq9vL4l/ghtANaqF7L5qUmFHs2lV8LEo=
Date: Mon, 27 Jan 2025 18:59:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: rust-for-linux@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Char/Misc/IIO driver updates for 6.134rc1
Message-ID: <Z5fJmQlVQmnnqAC4@kroah.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 5bc55a333a2f7316b58edc7573e8e893f7acb532:

  Linux 6.13-rc7 (2025-01-12 14:37:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.14-rc1

for you to fetch changes up to 970b9757cb44c315b5c3da6b1b35a1ffb07cca5a:

  ntsync: Fix reference leaks in the remaining create ioctls. (2025-01-17 13:10:07 +0100)

----------------------------------------------------------------
Char/Misc/IIO driver updates for 6.14-rc1

Here is the "big" set of char/misc/iio and other smaller driver
subsystem updates for 6.14-rc1.  Loads of different things in here this
development cycle, highlights are:
  - ntsync "driver" to handle Windows locking types enabling Wine to
    work much better on many workloads (i.e. games).  The driver
    framework was in 6.13, but now it's enabled and fully working
    properly.  Should make many SteamOS users happy.  Even comes with
    tests!
  - Large IIO driver updates and bugfixes
  - FPGA driver updates
  - Coresight driver updates
  - MHI driver updates
  - PPS driver updatesa
  - const bin_attribute reworking for many drivers
  - binder driver updates
  - smaller driver updates and fixes

All of these have been in linux-next for a while with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Abhijit Gangurde (1):
      cdx: disable cdx bus from bus shutdown callback

Al Viro (1):
      ntsync: fix a file reference leak in drivers/misc/ntsync.c

Alyssa Ross (2):
      VMCI: remove unused ioctl definitions
      VMCI: fix reference to ioctl-number.rst

Anandu Krishnan E (1):
      misc: fastrpc: Deregister device nodes properly in error scenarios

Angelo Dureghello (2):
      iio: dac: ad3552r-common: fix ad3541/2r ranges
      iio: dac: ad3552r-hs: clear reset status flag

Angus Chen (1):
      uio: Fix return value of poll

Axel Haslam (1):
      dt-bindings: iio: dac: ad5791: ldac gpio is active low

Barnabás Czémán (1):
      dt-bindings: nvmem: Add compatible for MS8917

Bartosz Golaszewski (1):
      uio: uio_dmem_genirq: check the return value of devm_kasprintf()

Bastien Curutchet (1):
      pps: clients: gpio: Bypass edge's direction check when not needed

Calvin Owens (1):
      pps: Fix a use-after-free

Carlos Llamas (11):
      Revert "binder: switch alloc->mutex to spinlock_t"
      binder: concurrent page installation
      binder: select correct nid for pages in LRU
      binder: store shrinker metadata under page->private
      binder: replace alloc->vma with alloc->mapped
      binder: rename alloc->buffer to vm_start
      binder: use per-vma lock in page installation
      binder: propagate vm_insert_page() errors
      binder: use per-vma lock in page reclaiming
      binder: fix kernel-doc warning of 'file' member
      binder: log transaction code on failure

Charles Han (1):
      extcon: realtek: fix NULL deref check in extcon_rtk_type_c_probe

Christophe JAILLET (1):
      iio: proximity: aw96103: Constify struct iio_info​

Cibil Pankiras (1):
      iio: light: cm3232: Reset before reading HW ID

Claudiu Beznea (12):
      iio: adc: rzg2l_adc: Convert dev_err() to dev_err_probe()
      iio: adc: rzg2l_adc: Use devres helpers to request pre-deasserted reset controls
      iio: adc: rzg2l_adc: Simplify the runtime PM code
      iio: adc: rzg2l_adc: Switch to RUNTIME_PM_OPS() and pm_ptr()
      iio: adc: rzg2l_adc: Use read_poll_timeout()
      iio: adc: rzg2l_adc: Simplify the locking scheme in rzg2l_adc_read_raw()
      iio: adc: rzg2l_adc: Enable runtime PM autosuspend support
      iio: adc: rzg2l_adc: Prepare for the addition of RZ/G3S support
      iio: adc: rzg2l_adc: Add support for channel 8
      iio: adc: rzg2l_adc: Add suspend/resume support
      dt-bindings: iio: adc: renesas,rzg2l-adc: Document RZ/G3S SoC
      iio: adc: rzg2l_adc: Add support for Renesas RZ/G3S

Costa Shulyupin (2):
      scripts/tags.sh: Tag timer definitions
      scripts/tags.sh: Don't tag usages of DECLARE_BITMAP

Dan Carpenter (1):
      iio: chemical: bme680: Fix uninitialized variable in __bme680_read_raw()

Darius Berghe (3):
      iio: imu: adis16480: add devices to adis16480 driver
      iio: imu: adis16480: add devices to adis16480 - docs
      dt-bindings: iio: adis16480: add devices to adis16480

David Lechner (17):
      iio: adc: ad7173: remove unused field
      iio: dac: ad5624r: fix struct name in doc comment
      iio: dac: ad5686: fix struct name in doc comment
      iio: dac: ad5686: use devm_regulator_get_enable_read_voltage()
      iio: dac: ad8801: use devm_regulator_get_enable_read_voltage()
      iio: dac ad8801: drop driver remove function
      iio: dac: ltc2632: use devm_regulator_get_enable_read_voltage()
      iio: dac ltc2632: drop driver remove function
      iio: dac: ltc2688: use devm_regulator_get_enable_read_voltage()
      iio: dac: max5821: use devm_regulator_get_enable_read_voltage()
      iio: adc: ad4695: move dt-bindings header
      dt-bindings: iio: adc: adi,ad4695: change include path
      iio: buffer-dmaengine: document iio_dmaengine_buffer_setup_ext
      iio: adc: ad_sigma_delta: add tab to align irq_line
      iio: ABI: use Y consistently as channel number
      iio: dac: ad7293: enable power before reset
      iio: ABI: combine current input sections

David Reaver (1):
      virtio: console: Replace deprecated kmap_atomic with kmap_local_page

Ekansh Gupta (4):
      misc: fastrpc: Add support for multiple PD from one process
      misc: fastrpc: Rename tgid and pid to client_id
      misc: fastrpc: Fix registered buffer page address
      misc: fastrpc: Fix copy buffer page size

Elizabeth Figura (31):
      ntsync: Return the fd from NTSYNC_IOC_CREATE_SEM.
      ntsync: Rename NTSYNC_IOC_SEM_POST to NTSYNC_IOC_SEM_RELEASE.
      ntsync: Introduce NTSYNC_IOC_WAIT_ANY.
      ntsync: Introduce NTSYNC_IOC_WAIT_ALL.
      ntsync: Introduce NTSYNC_IOC_CREATE_MUTEX.
      ntsync: Introduce NTSYNC_IOC_MUTEX_UNLOCK.
      ntsync: Introduce NTSYNC_IOC_MUTEX_KILL.
      ntsync: Introduce NTSYNC_IOC_CREATE_EVENT.
      ntsync: Introduce NTSYNC_IOC_EVENT_SET.
      ntsync: Introduce NTSYNC_IOC_EVENT_RESET.
      ntsync: Introduce NTSYNC_IOC_EVENT_PULSE.
      ntsync: Introduce NTSYNC_IOC_SEM_READ.
      ntsync: Introduce NTSYNC_IOC_MUTEX_READ.
      ntsync: Introduce NTSYNC_IOC_EVENT_READ.
      ntsync: Introduce alertable waits.
      selftests: ntsync: Add some tests for semaphore state.
      selftests: ntsync: Add some tests for mutex state.
      selftests: ntsync: Add some tests for NTSYNC_IOC_WAIT_ANY.
      selftests: ntsync: Add some tests for NTSYNC_IOC_WAIT_ALL.
      selftests: ntsync: Add some tests for wakeup signaling with WINESYNC_IOC_WAIT_ANY.
      selftests: ntsync: Add some tests for wakeup signaling with WINESYNC_IOC_WAIT_ALL.
      selftests: ntsync: Add some tests for manual-reset event state.
      selftests: ntsync: Add some tests for auto-reset event state.
      selftests: ntsync: Add some tests for wakeup signaling with events.
      selftests: ntsync: Add tests for alertable waits.
      selftests: ntsync: Add some tests for wakeup signaling via alerts.
      selftests: ntsync: Add a stress test for contended waits.
      maintainers: Add an entry for ntsync.
      docs: ntsync: Add documentation for the ntsync uAPI.
      ntsync: No longer depend on BROKEN.
      ntsync: Fix reference leaks in the remaining create ioctls.

Fabrice Gasnier (1):
      iio: trigger: stm32-timer: add support for stm32mp25

Frank Li (2):
      iio: adc: vf610_adc: use devm_* and dev_err_probe() to simple code
      iio: adc: vf610_adc: limit i.MX6SX's channel number to 4

Frederic Weisbecker (1):
      firmware: stratix10-svc: Use kthread_run_on_cpu()

Georgi Djakov (1):
      Merge branch 'icc-sm8750' into icc-next

Gerhard Engleder (1):
      misc: keba: Fix kernfs warning on module unload

Greg Kroah-Hartman (10):
      Merge tag 'w1-drv-6.14' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/krzk/linux-w1 into char-misc-next
      Merge tag 'socfpga_firmware_update_for_v6.14' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into char-misc-next
      Merge tag 'fpga-for-6.14-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/fpga/linux-fpga into char-misc-next
      Merge tag 'coresight-next-v6.14' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/coresight/linux into char-misc-next
      Merge tag 'extcon-next-for-6.14' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon into char-misc-next
      Merge tag 'iio-for-6.14a' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char-misc-next
      Merge tag 'mhi-for-v6.14' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mani/mhi into char-misc-next
      Merge 6.13-rc4 into char-misc-next
      Merge tag 'iio-fixes-for-6.13b' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char-misc-next
      Merge tag 'icc-6.14-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/djakov/icc into char-misc-next

Guenter Roeck (1):
      iio: imu: lsm6dsx: Use i3cdev_to_dev to get device pointer

Guillaume Ranquet (2):
      iio: adc: ad7173: add calibration support
      iio: adc: ad-sigma-delta: Document ABI for sigma delta adc

Guillaume Stols (1):
      iio: adc: ad7606: Fix hardcoded offset in the ADC channels

Haibo Chen (1):
      iio: accel: fxls8962af: add fxls8974cf support

Han Xu (5):
      dt-bindings: iio: accel: fxls8962af: add compatible string 'nxp,fxls8967af'
      dt-bindings: iio: accel: fxls8962af: add compatible string 'nxp,fxls8974cf'
      iio: accel: fxls8962af: add fxls8967af support
      dt-bindings: iio: imu: mpu6050: Add invensense,iam20380 compatible string
      iio: gyro: Add support for iam20380 sensor

James Clark (1):
      coresight: Drop atomics in connection refcounts

Javier Carrasco (8):
      iio: core: fix doc reference to iio_push_to_buffers_with_ts_unaligned
      iio: light: veml6030: add support for triggered buffer
      iio: light: as73211: fix channel handling in only-color triggered buffer
      iio: ABI: document in_illuminance_hardwaregain
      iio: light: veml3235: fix code style
      iio: light: veml3235: extend regmap to add cache
      iio: gts-helper: add helpers to ease searches of gain_sel and new_gain
      iio: light: veml3235: fix scale to conform to ABI

Jennifer Berringer (1):
      nvmem: core: improve range check for nvmem_cell_write()

Jiasheng Jiang (1):
      iio: trigger: stm32-timer-trigger: Add check for clk_enable()

Jingyi Wang (1):
      dt-bindings: nvmem: qfprom: Add compatible for QCS8300

Joe Hattori (1):
      spmi: hisi-spmi-controller: Drop duplicated OF node assignment in spmi_controller_probe()

Jonathan Cameron (18):
      iio: adc: ad7944: Fix sign and use aligned_s64 for timestamp.
      io: adc: ina2xx-adc: Fix sign and use aligned_s64 for timestamp.
      iio: temperature: tmp006: Use aligned_s64 instead of open coding alignment.
      iio: resolver: ad2s1210: Use aligned_s64 instead of open coding alignment.
      iio: proximity: Use aligned_s64 instead of open coding alignment.
      iio: pressure: Use aligned_s64 instead of open coding alignment.
      iio: magnetometer: Use aligned_s64 instead of open coding alignment.
      iio: light: Use aligned_s64 instead of open coding alignment.
      iio: imu: Use aligned_s64 instead of open coding alignment.
      iio: humidity: Use aligned_s64 instead of open coding alignment.
      iio: gyro: Use aligned_s64 instead of open coding alignment.
      iio: chemical: Use aligned_s64 instead of open coding alignment.
      iio: adc: Use aligned_s64 instead of open coding alignment.
      iio: accel: bma220: Use aligned_s64 instead of open coding alignment.
      iio: adc: ti-lmp92064: Switch timestamp type from int64_t __aligned(8) to aligned_s64
      iio: chemical: scd4x: switch timestamp type from int64_t __aligned(8) to aligned_s64
      iio: imu: inv_icm42600: switch timestamp type from int64_t __aligned(8) to aligned_s64
      iio: adc: rockchip: correct alignment of timestamp

Julia Lawall (1):
      slimbus: messaging: Reorganize kerneldoc parameter names

Karan Sanghavi (2):
      iio: invensense: Prevent possible integer overflow while multiplication
      iio: dac: Fix converters spelling typo.

Kryštof Černý (4):
      dt-bindings: w1: ds2482: Add vcc-supply property
      w1: ds2482: switch to devm_kzalloc() from kzalloc()
      w1: ds2482: Add regulator support
      w1: ds2482: Fix datasheet URL

Krzysztof Kozlowski (1):
      interconnect: sm8750: Add missing const to static qcom_icc_desc

Lee Jones (1):
      misc: trivial: Remove undesired double space from struct definition

Li Li (1):
      binderfs: add new binder devices to binder_devices

Lijuan Gao (1):
      dt-bindings: interconnect: qcom-bwmon: Document QCS615 bwmon compatibles

Lothar Rubusch (9):
      iio: accel: adxl345: refrase comment on probe
      iio: accel: adxl345: rename variable data to st
      iio: accel: adxl345: add function to switch measuring mode
      dt-bindings: iio: accel: adxl345: make interrupts not a required property
      dt-bindings: iio: accel: adxl345: add interrupt-names
      iio: accel: adxl345: introduce interrupt handling
      iio: accel: adxl345: initialize FIFO delay value for SPI
      iio: accel: adxl345: add FIFO with watermark events
      iio: accel: adxl345: complete the list of defines

Luca Weiss (1):
      nvmem: qcom-spmi-sdam: Set size in struct nvmem_config

Lukas Bulwahn (2):
      scripts/spdxcheck: Handle license identifiers in Jinja comments
      pps: adjust references to actual name of uapi header file

Manikanta Mylavarapu (1):
      dt-bindings: nvmem: Add compatible for IPQ5424

Mao Jinlong (3):
      dt-bindings: arm: Add arm,static-trace-id for coresight dummy source
      coresight: Add support to get static id for system trace sources
      coresight: dummy: Add static trace id support for dummy source

Marcelo Schmitt (4):
      dt-bindings: iio: adc: adi,ad4000: Add PulSAR
      iio: adc: ad4000: Add timestamp channel
      iio: adc: ad4000: Use device specific timing for SPI transfers
      iio: adc: ad4000: Add support for PulSAR devices

Martin Blumenstingl (3):
      iio: adc: meson: fix voltage reference selection field name typo
      iio: adc: meson: use tabs instead of spaces for some REG11 bit fields
      iio: adc: meson: simplify MESON_SAR_ADC_REG11 register access

Matteo Martelli (2):
      iio: consumers: ensure read buffers for labels and ext_info are page aligned
      iio: iio-mux: kzalloc instead of devm_kzalloc to ensure page alignment

Matti Vaittinen (16):
      iio: accel: kx022a: Improve reset delay
      iio: bu27034: simplify using guard(mutex)
      iio: bm1390: simplify using guard(mutex)
      iio: light: Drop BU27008 and BU27010
      dt-bindings: iio: light: Drop BU27008 and BU27010
      iio: accel: kx022a: Use cleanup.h helpers
      iio: accel: kx022a: Support ICs with different G-ranges
      dt-bindings: ROHM KX134ACR-LBZ
      iio: kx022a: Support ROHM KX134ACR-LBZ
      dt-bindings: iio: kx022a: Support KX134-1211
      iio: accel: kx022a: Support KX134-1211
      iio: kx022a: document new chip_info structure members
      iio: dac: ad5624r: Drop docs of missing members
      dt-bindings: Add ROHM BD79703
      iio: dac: Support ROHM BD79703 DAC
      MAINTAINERS: Add maintainer for ROHM BD79703

Neil Armstrong (1):
      dt-bindings: interconnect: OSM L3: Document sm8650 OSM L3 compatible

Pei Xiao (1):
      coresight: Fix dsb_mode_store() unsigned val is never less than zero

Peng Fan (1):
      MAINTAINERS: Update nvmem section

Per-Daniel Olsson (2):
      dt-bindings: iio: light: Document TI OPT4060 RGBW sensor
      iio: light: Add support for TI OPT4060 color sensor

Peter Colberg (17):
      fpga: dfl: omit unneeded argument pdata from dfl_feature_instance_init()
      fpga: dfl: return platform data from dfl_fpga_inode_to_feature_dev_data()
      fpga: dfl: afu: use parent device to log errors on port enable/disable
      fpga: dfl: afu: define local pointer to feature device
      fpga: dfl: pass feature platform data instead of device as argument
      fpga: dfl: factor out feature data creation from build_info_commit_dev()
      fpga: dfl: store FIU type in feature platform data
      fpga: dfl: refactor internal DFL APIs to take/return feature device data
      fpga: dfl: factor out feature device registration
      fpga: dfl: factor out feature device data from platform device data
      fpga: dfl: convert features from flexible array member to separate array
      fpga: dfl: store MMIO resources in feature device data
      fpga: dfl: store platform device name in feature device data
      fpga: dfl: store platform device id in feature device data
      fpga: dfl: allocate platform device after feature device data
      fpga: dfl: remove unneeded function build_info_create_dev()
      fpga: dfl: drop unneeded get_device() and put_device() of feature device

Randy Dunlap (2):
      intel_th: core: fix kernel-doc warnings
      memstick: core: fix kernel-doc notation

Raviteja Laggyshetty (2):
      dt-bindings: interconnect: add interconnect bindings for SM8750
      interconnect: qcom: Add interconnect provider driver for SM8750

Rengarajan S (1):
      misc: microchip: pci1xxxx: Add push-pull drive support for GPIO

Ricardo Ribalda (2):
      iio: hid-sensor-prox: Fix invalid read_raw for attention
      misc: Kconfig: Make MCHP_LAN966X_PCI depend on OF_OVERLAY

Rob Herring (Arm) (1):
      iio: dac: mcp4725: Use of_property_present() for non-boolean properties

Robert Budai (1):
      iio: imu: adis: Remove documented not used elements

Rodolfo Giometti (4):
      drivers pps: add PPS generators support
      drivers pps/generators: add dummy PPS generator
      Documentation pps.rst: add PPS generators documentation
      Documentation ABI: add PPS generators documentation

Saravana Kannan (1):
      spmi: Set fwnode for spmi devices

Sascha Hauer (4):
      nvmem: imx-ocotp-ele: simplify read beyond device check
      nvmem: imx-ocotp-ele: fix reading from non zero offset
      nvmem: imx-ocotp-ele: fix MAC address byte order
      nvmem: imx-ocotp-ele: set word length to 1

Sean Nyekjaer (2):
      dt-bindings: iio: accel: fxls8962af: add wakeup-source property
      iio: imu: st_lsm6dsx: don't always auto-enable I2C, I3C and SPI interface drivers

Sean Rhodes (1):
      drivers/card_reader/rtsx_usb: Restore interrupt based detection

Shivnandan Kumar (1):
      dt-bindings: interconnect: qcom,msm8998-bwmon: Add SM8750 CPU BWMONs

Songwei Chai (1):
      Coresight: Narrow down the matching range of tpdm

Tao Zhang (4):
      dt-bindings: arm: qcom,coresight-static-replicator: Add property for source filtering
      coresight: Add a helper to check if a device is source
      coresight: Add support for trace filtering by source
      coresight-tpda: Optimize the function of reading element size

Thomas Gleixner (1):
      scripts/spdxcheck: Parse j2 comments correctly

Thomas Weißschuh (23):
      w1: Constify 'struct bin_attribute'
      w1: ds2406: Constify 'struct bin_attribute'
      w1: ds2408: Constify 'struct bin_attribute'
      w1: ds2413: Constify 'struct bin_attribute'
      w1: ds2430: Constify 'struct bin_attribute'
      w1: ds2431: Constify 'struct bin_attribute'
      w1: ds2433: Constify 'struct bin_attribute'
      w1: ds2438: Constify 'struct bin_attribute'
      w1: ds2780: Constify 'struct bin_attribute'
      w1: ds2781: Constify 'struct bin_attribute'
      w1: ds2805: Constify 'struct bin_attribute'
      w1: ds28e04: Constify 'struct bin_attribute'
      ocxl: Constify 'struct bin_attribute'
      cxl: Constify 'struct bin_attribute'
      misc: sram: constify 'struct bin_attribute'
      misc: c2port: Calculate bin_attribute size through group callback
      misc: c2port: Constify 'struct bin_attribute'
      misc: pch_phub: Constify 'struct bin_attribute'
      misc: eeprom/idt_89hpesx: Constify 'struct bin_attribute'
      misc: eeprom/max6875: Constify 'struct bin_attribute'
      misc: ds1682: Constify 'struct bin_attribute'
      iio: imu: bno055: constify 'struct bin_attribute'
      nvmem: core: constify 'struct bin_attribute'

Théo Lebrun (6):
      dt-bindings: nvmem: rmem: Add mobileye,eyeq5-bootloader-config
      nvmem: specify ->reg_read/reg_write() expected return values
      nvmem: rmem: make ->reg_read() straight forward code
      nvmem: rmem: remove unused struct rmem::size field
      nvmem: rmem: add CRC validation for Mobileye EyeQ5 NVMEM
      MIPS: mobileye: eyeq5: add bootloader config reserved memory

Uwe Kleine-König (13):
      extcon: Drop explicit initialization of struct i2c_device_id::driver_data to 0
      iio: adc: ad7124: Don't create more channels than the driver can handle
      iio: adc: ad7124: Refuse invalid input specifiers
      dt-bindings: iio: adc: adi,ad7{124,173,192,780}: Allow specifications of a gpio for irq line
      iio: adc: ad_sigma_delta: Add support for reading irq status using a GPIO
      iio: adc: ad_sigma_delta: Handle CS assertion as intended in ad_sd_read_reg_raw()
      iio: adc: ad_sigma_delta: Fix a race condition
      iio: adc: ad_sigma_delta: Store information about reset sequence length
      iio: adc: ad_sigma_delta: Check for previous ready signals
      iio: adc: ad7124: Add error reporting during probe
      iio: adc: ad7124: Implement temperature measurement
      iio: adc: ad_sigma_delta: Use `unsigned int` instead of plain `unsigned`
      iio: adc: ad7625: Add ending newlines to error messages

Vasileios Amoiridis (13):
      dt-bindings: iio: bosch,bme680: Move from trivial-devices and add supplies
      iio: chemical: bme680: add regulators
      iio: chemical: bme680: add power management
      iio: pressure: bmp280: Use sizeof() for denominator
      iio: pressure: bmp280: Make time vars intuitive and move to fsleep
      dt-bindings: iio: pressure: bmp085: Add SPI interface
      iio: adc: dln2-adc: zero full struct instead of just the padding
      iio: adc: max1363: Use a small fixed size buffer to replace dynamic allocation
      iio: common: ssp_sensors: drop conditional optimization for simplicity
      iio: core: mark scan_timestamp as __private
      dt-bindings: iio: imu: bmi160: add boolean type for drive-open-drain
      dt-bindings: iio: imu: bmi270: add boolean type for drive-open-drain
      dt-bindings: iio: imu: bmi323: add boolean type for drive-open-drain

Victor Duicu (1):
      iio: adc: pac1921: Add ACPI support to Microchip pac1921

Vimal Agrawal (2):
      misc: misc_minor_alloc to use ida for all dynamic/misc dynamic minors
      misc:minor basic kunit tests

Vivek Pernamitta (2):
      bus: mhi: host: pci_generic: Add support for QDU100 device
      bus: mhi: host: pci_generic: Enable MSI-X if the endpoint supports

Xu Yilun (1):
      fpga: dfl: destroy/recreate feature platform device on port release/assign

Yasin Lee (1):
      iio: proximity: hx9023s: Added firmware file parsing functionality

Youssef Samir (1):
      bus: mhi: host: Free mhi_buf vector inside mhi_alloc_bhie_table()

anish kumar (2):
      Documentation: extcon: add documentation for Extcon subsystem
      MAINTAINERS: add slimbus documentation

zhangheng (1):
      w1: core: use sysfs_emit() instead of sprintf()

 .../sysfs-bus-coresight-devices-dummy-source       |   15 +
 Documentation/ABI/testing/sysfs-bus-iio            |   77 +-
 .../ABI/testing/sysfs-bus-iio-adc-ad-sigma-delta   |   23 +
 Documentation/ABI/testing/sysfs-bus-iio-adc-ad7192 |   24 -
 Documentation/ABI/testing/sysfs-pps-gen            |   43 +
 .../bindings/arm/arm,coresight-dummy-source.yaml   |    6 +
 .../arm/arm,coresight-static-replicator.yaml       |   19 +-
 .../devicetree/bindings/iio/accel/adi,adxl345.yaml |   11 +-
 .../bindings/iio/accel/kionix,kx022a.yaml          |   11 +-
 .../bindings/iio/accel/nxp,fxls8962af.yaml         |   20 +-
 .../devicetree/bindings/iio/adc/adi,ad4000.yaml    |   75 +-
 .../devicetree/bindings/iio/adc/adi,ad4695.yaml    |    7 +-
 .../devicetree/bindings/iio/adc/adi,ad7124.yaml    |   13 +
 .../devicetree/bindings/iio/adc/adi,ad7173.yaml    |   12 +
 .../devicetree/bindings/iio/adc/adi,ad7192.yaml    |   15 +
 .../devicetree/bindings/iio/adc/adi,ad7780.yaml    |   11 +
 .../bindings/iio/adc/renesas,rzg2l-adc.yaml        |   37 +-
 .../bindings/iio/chemical/bosch,bme680.yaml        |   62 +
 .../devicetree/bindings/iio/dac/adi,ad5791.yaml    |    2 +-
 .../devicetree/bindings/iio/dac/rohm,bd79703.yaml  |   62 +
 .../devicetree/bindings/iio/imu/adi,adis16480.yaml |   42 +-
 .../devicetree/bindings/iio/imu/bosch,bmi160.yaml  |    1 +
 .../devicetree/bindings/iio/imu/bosch,bmi270.yaml  |    1 +
 .../devicetree/bindings/iio/imu/bosch,bmi323.yaml  |    1 +
 .../bindings/iio/imu/invensense,mpu6050.yaml       |    1 +
 .../bindings/iio/light/rohm,bu27008.yaml           |   49 -
 .../bindings/iio/light/rohm,bu27010.yaml           |   50 -
 .../devicetree/bindings/iio/light/ti,opt4060.yaml  |   51 +
 .../devicetree/bindings/iio/pressure/bmp085.yaml   |   29 +
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |    3 +
 .../bindings/interconnect/qcom,osm-l3.yaml         |    1 +
 .../bindings/interconnect/qcom,sm8750-rpmh.yaml    |  136 ++
 .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |    3 +
 Documentation/devicetree/bindings/nvmem/rmem.yaml  |    1 +
 .../devicetree/bindings/trivial-devices.yaml       |    2 -
 .../devicetree/bindings/w1/maxim,ds2482.yaml       |    2 +
 Documentation/driver-api/extcon.rst                |  255 +++
 Documentation/driver-api/index.rst                 |    1 +
 Documentation/driver-api/pps.rst                   |   40 +
 Documentation/iio/ad4695.rst                       |    2 +-
 Documentation/iio/adis16480.rst                    |    3 +
 Documentation/iio/index.rst                        |    1 +
 Documentation/iio/opt4060.rst                      |   61 +
 Documentation/userspace-api/index.rst              |    1 +
 Documentation/userspace-api/ioctl/ioctl-number.rst |    1 +
 Documentation/userspace-api/ntsync.rst             |  385 +++++
 MAINTAINERS                                        |   22 +-
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             |   22 +
 drivers/android/binder.c                           |   13 +-
 drivers/android/binder_alloc.c                     |  364 +++--
 drivers/android/binder_alloc.h                     |   45 +-
 drivers/android/binder_alloc_selftest.c            |   18 +-
 drivers/android/binder_internal.h                  |   11 +-
 drivers/android/binder_trace.h                     |    2 +-
 drivers/android/binderfs.c                         |    2 +
 drivers/bus/mhi/host/boot.c                        |    1 +
 drivers/bus/mhi/host/pci_generic.c                 |   57 +-
 drivers/cdx/cdx.c                                  |    3 +
 drivers/char/misc.c                                |   37 +-
 drivers/char/virtio_console.c                      |    4 +-
 drivers/extcon/extcon-fsa9480.c                    |    2 +-
 drivers/extcon/extcon-ptn5150.c                    |    2 +-
 drivers/extcon/extcon-rtk-type-c.c                 |    2 +
 drivers/firmware/stratix10-svc.c                   |    9 +-
 drivers/fpga/dfl-afu-dma-region.c                  |  117 +-
 drivers/fpga/dfl-afu-error.c                       |   59 +-
 drivers/fpga/dfl-afu-main.c                        |  278 ++--
 drivers/fpga/dfl-afu-region.c                      |   51 +-
 drivers/fpga/dfl-afu.h                             |   26 +-
 drivers/fpga/dfl-fme-br.c                          |   24 +-
 drivers/fpga/dfl-fme-error.c                       |   98 +-
 drivers/fpga/dfl-fme-main.c                        |   95 +-
 drivers/fpga/dfl-fme-pr.c                          |   86 +-
 drivers/fpga/dfl.c                                 |  447 +++--
 drivers/fpga/dfl.h                                 |  142 +-
 drivers/hwtracing/coresight/coresight-core.c       |  113 +-
 drivers/hwtracing/coresight/coresight-dummy.c      |   81 +-
 drivers/hwtracing/coresight/coresight-funnel.c     |    6 +-
 drivers/hwtracing/coresight/coresight-platform.c   |   27 +
 drivers/hwtracing/coresight/coresight-replicator.c |    6 +-
 drivers/hwtracing/coresight/coresight-tpda.c       |   19 +-
 drivers/hwtracing/coresight/coresight-tpdm.c       |    7 +-
 drivers/hwtracing/coresight/coresight-trace-id.c   |   43 +-
 drivers/hwtracing/coresight/coresight-trace-id.h   |    9 +
 drivers/hwtracing/intel_th/core.c                  |    3 +-
 drivers/iio/accel/adxl345.h                        |   81 +-
 drivers/iio/accel/adxl345_core.c                   |  421 ++++-
 drivers/iio/accel/adxl345_i2c.c                    |    2 +-
 drivers/iio/accel/adxl345_spi.c                    |    7 +-
 drivers/iio/accel/bma220_spi.c                     |    2 +-
 drivers/iio/accel/fxls8962af-core.c                |   14 +
 drivers/iio/accel/fxls8962af-i2c.c                 |    2 +
 drivers/iio/accel/fxls8962af.h                     |    2 +
 drivers/iio/accel/kionix-kx022a-i2c.c              |    4 +
 drivers/iio/accel/kionix-kx022a-spi.c              |    4 +
 drivers/iio/accel/kionix-kx022a.c                  |  169 +-
 drivers/iio/accel/kionix-kx022a.h                  |   14 +
 drivers/iio/adc/ad4000.c                           |  313 +++-
 drivers/iio/adc/ad4695.c                           |    2 +-
 drivers/iio/adc/ad7124.c                           |  217 ++-
 drivers/iio/adc/ad7173.c                           |  119 +-
 drivers/iio/adc/ad7192.c                           |    4 +-
 drivers/iio/adc/ad7606.c                           |   48 +-
 drivers/iio/adc/ad7606.h                           |    2 +-
 drivers/iio/adc/ad7625.c                           |    8 +-
 drivers/iio/adc/ad7791.c                           |    1 +
 drivers/iio/adc/ad7793.c                           |    3 +-
 drivers/iio/adc/ad7944.c                           |    2 +-
 drivers/iio/adc/ad_sigma_delta.c                   |  194 ++-
 drivers/iio/adc/dln2-adc.c                         |   21 +-
 drivers/iio/adc/ina2xx-adc.c                       |    2 +-
 drivers/iio/adc/max1118.c                          |    2 +-
 drivers/iio/adc/max11410.c                         |    2 +-
 drivers/iio/adc/max1363.c                          |   30 +-
 drivers/iio/adc/mcp3911.c                          |    2 +-
 drivers/iio/adc/meson_saradc.c                     |   47 +-
 drivers/iio/adc/pac1921.c                          |   95 +-
 drivers/iio/adc/rockchip_saradc.c                  |    2 +-
 drivers/iio/adc/rtq6056.c                          |    2 +-
 drivers/iio/adc/rzg2l_adc.c                        |  439 ++---
 drivers/iio/adc/ti-adc081c.c                       |    2 +-
 drivers/iio/adc/ti-adc084s021.c                    |    2 +-
 drivers/iio/adc/ti-ads1015.c                       |    2 +-
 drivers/iio/adc/ti-ads1119.c                       |    2 +-
 drivers/iio/adc/ti-ads131e08.c                     |    2 +-
 drivers/iio/adc/ti-lmp92064.c                      |    2 +-
 drivers/iio/adc/ti-tsc2046.c                       |    2 +-
 drivers/iio/adc/vf610_adc.c                        |  100 +-
 drivers/iio/buffer/industrialio-buffer-dmaengine.c |   19 +-
 drivers/iio/chemical/bme680.h                      |    2 +
 drivers/iio/chemical/bme680_core.c                 |  124 +-
 drivers/iio/chemical/bme680_i2c.c                  |    1 +
 drivers/iio/chemical/bme680_spi.c                  |    1 +
 drivers/iio/chemical/ccs811.c                      |    2 +-
 drivers/iio/chemical/ens160_core.c                 |    2 +-
 drivers/iio/chemical/scd30_core.c                  |    2 +-
 drivers/iio/chemical/scd4x.c                       |    2 +-
 .../iio/common/inv_sensors/inv_sensors_timestamp.c |    4 +-
 drivers/iio/common/ssp_sensors/ssp_iio.c           |   12 +-
 drivers/iio/dac/Kconfig                            |   10 +-
 drivers/iio/dac/Makefile                           |    1 +
 drivers/iio/dac/ad3552r-common.c                   |    5 +-
 drivers/iio/dac/ad3552r-hs.c                       |    6 +
 drivers/iio/dac/ad3552r.h                          |    8 +-
 drivers/iio/dac/ad5624r.h                          |    4 +-
 drivers/iio/dac/ad5686-spi.c                       |    6 -
 drivers/iio/dac/ad5686.c                           |   62 +-
 drivers/iio/dac/ad5686.h                           |    6 +-
 drivers/iio/dac/ad5696-i2c.c                       |    6 -
 drivers/iio/dac/ad7293.c                           |   68 +-
 drivers/iio/dac/ad8801.c                           |   79 +-
 drivers/iio/dac/ltc2632.c                          |   69 +-
 drivers/iio/dac/ltc2688.c                          |   44 +-
 drivers/iio/dac/max5821.c                          |   36 +-
 drivers/iio/dac/mcp4725.c                          |    2 +-
 drivers/iio/dac/rohm-bd79703.c                     |  162 ++
 drivers/iio/gyro/adxrs290.c                        |    2 +-
 drivers/iio/gyro/bmg160_core.c                     |    2 +-
 drivers/iio/gyro/itg3200_buffer.c                  |    2 +-
 drivers/iio/gyro/mpu3050-core.c                    |    2 +-
 drivers/iio/humidity/am2315.c                      |    2 +-
 drivers/iio/humidity/hdc100x.c                     |    2 +-
 drivers/iio/humidity/hts221.h                      |    2 +-
 drivers/iio/imu/adis16480.c                        |   75 +
 drivers/iio/imu/bmi323/bmi323_core.c               |    2 +-
 drivers/iio/imu/bno055/bno055.c                    |   10 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c  |    2 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c   |    2 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c         |   25 +
 drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c          |    6 +
 drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h          |    2 +
 drivers/iio/imu/inv_mpu6050/inv_mpu_spi.c          |    5 +
 drivers/iio/imu/st_lsm6dsx/Kconfig                 |   18 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c        |    6 +-
 drivers/iio/industrialio-buffer.c                  |    2 +-
 drivers/iio/industrialio-gts-helper.c              |   77 +
 drivers/iio/inkern.c                               |   11 +
 drivers/iio/light/Kconfig                          |   32 +-
 drivers/iio/light/Makefile                         |    2 +-
 drivers/iio/light/adjd_s311.c                      |    2 +-
 drivers/iio/light/as73211.c                        |   26 +-
 drivers/iio/light/bh1745.c                         |    2 +-
 drivers/iio/light/cm3232.c                         |   18 +-
 drivers/iio/light/hid-sensor-prox.c                |    1 +
 drivers/iio/light/isl29125.c                       |    2 +-
 drivers/iio/light/ltr501.c                         |    2 +-
 drivers/iio/light/max44000.c                       |    2 +-
 drivers/iio/light/opt4060.c                        | 1343 +++++++++++++++
 drivers/iio/light/rohm-bu27008.c                   | 1635 -------------------
 drivers/iio/light/rohm-bu27034.c                   |   75 +-
 drivers/iio/light/rpr0521.c                        |    2 +-
 drivers/iio/light/st_uvis25.h                      |    2 +-
 drivers/iio/light/tcs3414.c                        |    2 +-
 drivers/iio/light/tcs3472.c                        |    2 +-
 drivers/iio/light/veml3235.c                       |  280 ++--
 drivers/iio/light/veml6030.c                       |   76 +
 drivers/iio/magnetometer/af8133j.c                 |    2 +-
 drivers/iio/magnetometer/ak8974.c                  |    2 +-
 drivers/iio/magnetometer/ak8975.c                  |    2 +-
 drivers/iio/magnetometer/bmc150_magn.c             |    2 +-
 drivers/iio/magnetometer/hmc5843.h                 |    2 +-
 drivers/iio/magnetometer/mag3110.c                 |    2 +-
 drivers/iio/magnetometer/yamaha-yas530.c           |    2 +-
 drivers/iio/multiplexer/iio-mux.c                  |   84 +-
 drivers/iio/pressure/bmp280-core.c                 |   39 +-
 drivers/iio/pressure/bmp280.h                      |    8 +-
 drivers/iio/pressure/hsc030pa.h                    |    2 +-
 drivers/iio/pressure/ms5611_core.c                 |    2 +-
 drivers/iio/pressure/rohm-bm1390.c                 |   80 +-
 drivers/iio/proximity/as3935.c                     |    2 +-
 drivers/iio/proximity/aw96103.c                    |    2 +-
 drivers/iio/proximity/hx9023s.c                    |   95 +-
 drivers/iio/proximity/mb1232.c                     |    2 +-
 drivers/iio/proximity/pulsedlight-lidar-lite-v2.c  |    2 +-
 drivers/iio/proximity/srf08.c                      |    2 +-
 drivers/iio/proximity/sx_common.h                  |    2 +-
 drivers/iio/resolver/ad2s1210.c                    |    2 +-
 drivers/iio/temperature/tmp006.c                   |    2 +-
 drivers/iio/trigger/stm32-timer-trigger.c          |   69 +-
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/sm8750.c                 | 1705 ++++++++++++++++++++
 drivers/memstick/core/memstick.c                   |   46 +-
 drivers/misc/Kconfig                               |    4 +-
 drivers/misc/Makefile                              |    1 +
 drivers/misc/c2port/core.c                         |   29 +-
 drivers/misc/cardreader/rtsx_usb.c                 |   15 +
 drivers/misc/cxl/sysfs.c                           |    8 +-
 drivers/misc/ds1682.c                              |    8 +-
 drivers/misc/eeprom/idt_89hpesx.c                  |    6 +-
 drivers/misc/eeprom/max6875.c                      |    4 +-
 drivers/misc/fastrpc.c                             |   66 +-
 drivers/misc/keba/cp500.c                          |   69 +-
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c    |    3 +
 drivers/misc/misc_minor_kunit.c                    |   69 +
 drivers/misc/ntsync.c                              | 1000 +++++++++++-
 drivers/misc/ocxl/sysfs.c                          |    4 +-
 drivers/misc/pch_phub.c                            |    8 +-
 drivers/misc/sram.c                                |    8 +-
 drivers/nvmem/core.c                               |   37 +-
 drivers/nvmem/imx-ocotp-ele.c                      |   38 +-
 drivers/nvmem/qcom-spmi-sdam.c                     |    1 +
 drivers/nvmem/rmem.c                               |   97 +-
 drivers/pps/Makefile                               |    3 +-
 drivers/pps/clients/pps-gpio.c                     |   10 +-
 drivers/pps/clients/pps-ktimer.c                   |    4 +-
 drivers/pps/clients/pps-ldisc.c                    |    6 +-
 drivers/pps/clients/pps_parport.c                  |    4 +-
 drivers/pps/generators/Kconfig                     |   22 +-
 drivers/pps/generators/Makefile                    |    4 +
 drivers/pps/generators/pps_gen-dummy.c             |   96 ++
 drivers/pps/generators/pps_gen.c                   |  344 ++++
 drivers/pps/generators/sysfs.c                     |   75 +
 drivers/pps/kapi.c                                 |   10 +-
 drivers/pps/kc.c                                   |   10 +-
 drivers/pps/pps.c                                  |  127 +-
 drivers/ptp/ptp_ocp.c                              |    2 +-
 drivers/slimbus/messaging.c                        |    2 +-
 drivers/spmi/hisi-spmi-controller.c                |    3 -
 drivers/spmi/spmi.c                                |    2 +-
 drivers/uio/uio.c                                  |    2 +-
 drivers/uio/uio_dmem_genirq.c                      |    2 +
 drivers/w1/masters/ds2482.c                        |   26 +-
 drivers/w1/slaves/w1_ds2406.c                      |   10 +-
 drivers/w1/slaves/w1_ds2408.c                      |   42 +-
 drivers/w1/slaves/w1_ds2413.c                      |   14 +-
 drivers/w1/slaves/w1_ds2430.c                      |   10 +-
 drivers/w1/slaves/w1_ds2431.c                      |   10 +-
 drivers/w1/slaves/w1_ds2433.c                      |   24 +-
 drivers/w1/slaves/w1_ds2438.c                      |   34 +-
 drivers/w1/slaves/w1_ds2780.c                      |    8 +-
 drivers/w1/slaves/w1_ds2781.c                      |    8 +-
 drivers/w1/slaves/w1_ds2805.c                      |   10 +-
 drivers/w1/slaves/w1_ds28e04.c                     |   18 +-
 drivers/w1/slaves/w1_ds28e17.c                     |    4 +-
 drivers/w1/w1.c                                    |   12 +-
 include/dt-bindings/iio/{ => adc}/adi,ad4695.h     |    0
 .../dt-bindings/interconnect/qcom,sm8750-rpmh.h    |  143 ++
 include/linux/coresight.h                          |   17 +-
 include/linux/iio/adc/ad_sigma_delta.h             |   10 +-
 include/linux/iio/buffer.h                         |    2 +-
 include/linux/iio/consumer.h                       |    4 +-
 include/linux/iio/iio-gts-helper.h                 |    6 +
 include/linux/iio/iio-opaque.h                     |    2 +-
 include/linux/iio/iio.h                            |    2 +-
 include/linux/iio/imu/adis.h                       |    1 -
 include/linux/iio/timer/stm32-timer-trigger.h      |    6 +
 include/linux/miscdevice.h                         |    2 +-
 include/linux/nvmem-provider.h                     |    4 +-
 include/linux/pps_gen_kernel.h                     |   78 +
 include/linux/pps_kernel.h                         |    3 +-
 include/linux/vmw_vmci_defs.h                      |   14 +-
 include/uapi/linux/ntsync.h                        |   42 +-
 include/uapi/linux/pps_gen.h                       |   37 +
 lib/Kconfig.debug                                  |   11 +
 scripts/spdxcheck.py                               |    6 +
 scripts/tags.sh                                    |    4 +-
 tools/testing/selftests/Makefile                   |    1 +
 tools/testing/selftests/drivers/ntsync/.gitignore  |    1 +
 tools/testing/selftests/drivers/ntsync/Makefile    |    7 +
 tools/testing/selftests/drivers/ntsync/config      |    1 +
 tools/testing/selftests/drivers/ntsync/ntsync.c    | 1343 +++++++++++++++
 302 files changed, 12723 insertions(+), 4550 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-ad-sigma-delta
 create mode 100644 Documentation/ABI/testing/sysfs-pps-gen
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/bosch,bme680.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/dac/rohm,bd79703.yaml
 delete mode 100644 Documentation/devicetree/bindings/iio/light/rohm,bu27008.yaml
 delete mode 100644 Documentation/devicetree/bindings/iio/light/rohm,bu27010.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/light/ti,opt4060.yaml
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sm8750-rpmh.yaml
 create mode 100644 Documentation/driver-api/extcon.rst
 create mode 100644 Documentation/iio/opt4060.rst
 create mode 100644 Documentation/userspace-api/ntsync.rst
 create mode 100644 drivers/iio/dac/rohm-bd79703.c
 create mode 100644 drivers/iio/light/opt4060.c
 delete mode 100644 drivers/iio/light/rohm-bu27008.c
 create mode 100644 drivers/interconnect/qcom/sm8750.c
 create mode 100644 drivers/misc/misc_minor_kunit.c
 create mode 100644 drivers/pps/generators/pps_gen-dummy.c
 create mode 100644 drivers/pps/generators/pps_gen.c
 create mode 100644 drivers/pps/generators/sysfs.c
 rename include/dt-bindings/iio/{ => adc}/adi,ad4695.h (100%)
 create mode 100644 include/dt-bindings/interconnect/qcom,sm8750-rpmh.h
 create mode 100644 include/linux/pps_gen_kernel.h
 create mode 100644 include/uapi/linux/pps_gen.h
 create mode 100644 tools/testing/selftests/drivers/ntsync/.gitignore
 create mode 100644 tools/testing/selftests/drivers/ntsync/Makefile
 create mode 100644 tools/testing/selftests/drivers/ntsync/config
 create mode 100644 tools/testing/selftests/drivers/ntsync/ntsync.c
