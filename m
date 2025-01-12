Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C4C1B4124;
	Sun, 12 Jan 2025 14:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736690808; cv=none; b=t+VX8n8RPzeI9G1I6GgeFV2R0ZXvUZVsI3ATrb9zmeqdq5rbiHiUyVOdy8gnFIfEWvgvHT03ofkQwEz/MyObbQdWWsQrtxNTtDy90+ca66eO1AsPsQdog/UlcVqijLtlpQrpVs6b1VAnXJgvYO0kKS/0jZSLqExr8Tf8YcDE4Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736690808; c=relaxed/simple;
	bh=zgkLOWNN45BGAyMFRgr0B18fI+bMiB+p2fc3bLGAHpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E0nx6JV1ps9tTApZdOVKdxC+IA1Zs3DjaIwqIdHMiorWH3X2AQZm6KN/PZw6/Kl/T3UuMbRvf6wZb6Yb9nwM+8vzjZeP32wpxYt53qPGO11D/trCMp9bBL6o1P89H4yjrp8tXBYu6x4pxssmwY5EEakreklmeC3aSddxN12ZclU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CUFuS92U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CUFuS92U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B38BC4CEDF;
	Sun, 12 Jan 2025 14:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736690807;
	bh=zgkLOWNN45BGAyMFRgr0B18fI+bMiB+p2fc3bLGAHpw=;
	h=Date:From:To:Cc:Subject:From;
	b=CUFuS92UMBnetsnmHncW2ivHaKED771EgVPOzhGWxj2yMK8y0c0jAcU6RjeyrXpT4
	 1FEK1SaN+VWJDrt+A6ZLfZZrQ4yPKGuTkQx0XaFsDBKKUhNqgOaATwqnsM442LBwIZ
	 ro9cAMlRovaJNzxyR583hUD0KyjHMTLkpOC4J/24=
Date: Sun, 12 Jan 2025 15:06:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: rust-for-linux@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Char/Misc/IIO driver changes for 6.13-rc7
Message-ID: <Z4PMdA-E4_Ifi8sK@kroah.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8:

  Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.13-rc7

for you to fetch changes up to c7a5378a0f707686de3ddb489f1653c523bb7dcc:

  misc: microchip: pci1xxxx: Resolve return code mismatch during GPIO set config (2025-01-08 15:47:39 +0100)

----------------------------------------------------------------
Char/Misc/IIO driver fixes for 6.13-rc7

Here are a bunch of small IIO and interconnect and other driver fixes
for 6.13-rc7 to resolve reported issues.  Included in here are:
  - loads of iio driver fixes as a result of an audit of places where
    uninitialized data would leak to userspace.
  - other smaller, and normal, iio driver fixes.
  - mhi driver fix
  - interconnect driver fixes
  - pci1xxxx driver fix

All of these have been in linux-next for a while with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Bartosz Golaszewski (1):
      interconnect: icc-clk: check return values of devm_kasprintf()

Carlos Song (1):
      iio: gyro: fxas21002c: Fix missing data update in trigger handler

Charles Han (1):
      iio: adc: ti-ads1298: Add NULL check in ads1298_init

Christophe JAILLET (1):
      iio: adc: ad9467: Fix the "don't allow reading vref if not available" case

David Lechner (1):
      iio: adc: ad7173: fix using shared static info struct

Fabio Estevam (1):
      iio: adc: ti-ads124s08: Use gpiod_set_value_cansleep()

Georgi Djakov (1):
      interconnect: qcom: icc-rpm: Set the count member before accessing the flex array

Greg Kroah-Hartman (3):
      Merge tag 'iio-fixes-for-6.13a' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char-misc-linus
      Merge tag 'mhi-fixes-for-v6.13' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mani/mhi into char-misc-linus
      Merge tag 'icc-6.13-rc6' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/djakov/icc into char-misc-next

Javier Carrasco (10):
      iio: dummy: iio_simply_dummy_buffer: fix information leak in triggered buffer
      iio: adc: ti-ads8688: fix information leak in triggered buffer
      iio: light: bh1745: fix information leak in triggered buffer
      iio: light: vcnl4035: fix information leak in triggered buffer
      iio: imu: kmx61: fix information leak in triggered buffer
      iio: adc: rockchip_saradc: fix information leak in triggered buffer
      iio: pressure: zpa2326: fix information leak in triggered buffer
      iio: adc: ti-ads1119: fix information leak in triggered buffer
      iio: temperature: tmp006: fix information leak in triggered buffer
      iio: adc: ti-ads1119: fix sample size in scan struct for triggered buffer

Jean-Baptiste Maneyrol (2):
      iio: imu: inv_icm42600: fix spi burst write not supported
      iio: imu: inv_icm42600: fix timestamps after suspend if sensor is on

Joe Hattori (2):
      iio: adc: at91: call input_free_device() on allocated iio_dev
      iio: inkern: call iio_device_put() only on mapped devices

Johan Hovold (1):
      bus: mhi: host: pci_generic: fix MHI BAR mapping

Matti Vaittinen (1):
      iio: test: Fix GTS test config

Olivier Moysan (1):
      iio: adc: stm32-dfsdm: handle label as an optional property

Pei Xiao (1):
      iio: test : check null return of kunit_kmalloc in iio_rescale_test_scale

Rengarajan S (2):
      misc: microchip: pci1xxxx: Resolve kernel panic during GPIO IRQ handling
      misc: microchip: pci1xxxx: Resolve return code mismatch during GPIO set config

Sean Nyekjaer (1):
      dt-bindings: iio: st-sensors: Re-add IIS2MDC magnetometer

Trevor Gamblin (1):
      iio: adc: ad4695: fix buffered read, single sample timings

Uwe Kleine-König (1):
      iio: adc: ad7124: Disable all channels at probe time

Zicheng Qu (2):
      staging: iio: ad9834: Correct phase range check
      staging: iio: ad9832: Correct phase range check

 .../devicetree/bindings/iio/st,st-sensors.yaml     |  1 +
 drivers/bus/mhi/host/pci_generic.c                 |  2 +-
 drivers/iio/adc/ad4695.c                           | 98 +++++++++++++++-------
 drivers/iio/adc/ad7124.c                           |  3 +
 drivers/iio/adc/ad7173.c                           | 10 ++-
 drivers/iio/adc/ad9467.c                           | 15 +++-
 drivers/iio/adc/at91_adc.c                         |  2 +-
 drivers/iio/adc/rockchip_saradc.c                  |  2 +
 drivers/iio/adc/stm32-dfsdm-adc.c                  | 13 +--
 drivers/iio/adc/ti-ads1119.c                       |  4 +-
 drivers/iio/adc/ti-ads124s08.c                     |  4 +-
 drivers/iio/adc/ti-ads1298.c                       |  2 +
 drivers/iio/adc/ti-ads8688.c                       |  2 +-
 drivers/iio/dummy/iio_simple_dummy_buffer.c        |  2 +-
 drivers/iio/gyro/fxas21002c_core.c                 | 11 ++-
 drivers/iio/imu/inv_icm42600/inv_icm42600.h        |  1 +
 drivers/iio/imu/inv_icm42600/inv_icm42600_core.c   | 22 ++++-
 drivers/iio/imu/inv_icm42600/inv_icm42600_spi.c    |  3 +-
 drivers/iio/imu/kmx61.c                            |  2 +-
 drivers/iio/inkern.c                               |  2 +-
 drivers/iio/light/bh1745.c                         |  2 +
 drivers/iio/light/vcnl4035.c                       |  2 +-
 drivers/iio/pressure/zpa2326.c                     |  2 +
 drivers/iio/temperature/tmp006.c                   |  2 +
 drivers/iio/test/Kconfig                           |  2 +-
 drivers/iio/test/iio-test-rescale.c                |  4 +
 drivers/interconnect/icc-clk.c                     | 10 +++
 drivers/interconnect/qcom/icc-rpm.c                |  2 +-
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c    |  4 +-
 drivers/staging/iio/frequency/ad9832.c             |  2 +-
 drivers/staging/iio/frequency/ad9834.c             |  2 +-
 31 files changed, 173 insertions(+), 62 deletions(-)
