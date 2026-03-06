Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399CB426ED6
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Mar 2026 19:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772825924; cv=none; b=LXzltJZoJtYHCOQuKiZiTtO1BQxTJh8dOdvbmt3hQV5Xj2qrMyybGblljXtVeKadoHow2hpi6Nzs/BHLyS+qqSCe7vuImNh39HxS8guZr66rWcpKETzbJAQkJd+8urludugm1kxviBGigLC1cugYNpQ5IdLbW2fB40nL82HIzFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772825924; c=relaxed/simple;
	bh=gX0g9LfijMawVM2avstuXD8jqFulHA4evwgbIVWxvkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GuApesWhu2+MD8HBEBYRDPwZgHC3Hl3gwBH3C3RRouYrIrhFzRhPy/usHpesiHKwb2OKCDtY54rzoDDcr2K00ugdx9C53clDtj2fMF/7qG+otjyyTPZwjIzf5Dos7senvEkqudFlgtXK3GVxL04yESKMI1qf9L8tlFx35pB9Gg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=bvBimlQt; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="bvBimlQt"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id B9129240103
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Mar 2026 20:38:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1772825911; bh=JphZx8WJ4w5RE0+6MGlxWHM1KcEW/8NdJkZzsQGKZnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=bvBimlQtiLCWQ4Y5Hhf6B5nQCFGZWJxBrNYUViitGZ7cjGdimTiH9S/4kt3NOqlJx
	 /9RTwHAs3/Xr3bGXPqSXwZYsPm3xLNtN13wPQgknEDF3EAtiD3rkrEm9D9/VD2JIH5
	 ry/SurFJLA5/bKyhZVgInMsgSx53sL233ttBjYl24U47T7OIH6vaOZyvz1KjEE4NX2
	 RICDmciT8aYDx+f5W23PCuaV5njnRS296onNdV6vzxkPlHMYdFzSdZzk42jvOYXPfI
	 iiA2fVetQNWuNax77AUcyEF1n3VD/rmx5kPC+emaLxVTD/SFoIhEMZeLd8SErFnTYi
	 d+tRK/1LqL0uw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fSGsx12kqz6tyH;
	Fri,  6 Mar 2026 20:38:28 +0100 (CET)
From: Markus Probst <markus.probst@posteo.de>
Date: Fri, 06 Mar 2026 19:38:30 +0000
Subject: [PATCH 2/2] staging: Add initial synology microp driver
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-synology_microp_initial-v1-2-fcffede6448c@posteo.de>
References: <20260306-synology_microp_initial-v1-0-fcffede6448c@posteo.de>
In-Reply-To: <20260306-synology_microp_initial-v1-0-fcffede6448c@posteo.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=14844;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=gX0g9LfijMawVM2avstuXD8jqFulHA4evwgbIVWxvkc=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBpqy0uMRSuQuUWWgaBtIN6PWOBl1FHmcgzs0Lu9
 bMulSjzwZyJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaastLhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9Jn5BAAnaq3Pp0pVUZ15Yqp918HJhEyP9vxlPg
 Ost/gqwsw/uYWiqFTzV8odpjwNFZKi0y6vPuplOtu4S9G2fO8DhzmYJrU9XhPL8CcJ0z/OhsJ7s
 dALExmj6m0fxtJurmBGVtNp/9chI5uogijXCxFtLZTnSrXxWX4z7cn9yG4Qs6A20AZvE0zlaTZn
 KAvntKRgaZv0plsbiLaQpHC5AezI9kiNW8FYw1u8lfGravVAhnZe26Nh28bihQyqV3F7qT+EoLV
 JVkPtM3XYnGGQqspptcihxadz/yAVTphk/5LUM23ZSlp2r0ZQ33TlsmLI58t5WUPdTUSGjoUA5P
 OmE5KXe78D3JdpDwKV6OxArbizW0KGAHqlDK5ZoKKvew0Qz2RinaXia8qazFsXGetjJeZWQPQBA
 wnntaHYs8LELIYeTmT2E9s8W83z3/6wjFWVlGOhpB+6pt12C8pwJtKV66bpiskg5rHkxpTgjvRF
 WcAs+oM7hZQp08BKmKRcAcvkZETZYDJi1Ecy9ViWC16DjSa0qDfBWOeJFiS/CExqwO2e7qrpXTc
 4aBh4IPXB7KI8ivs9sfGK9S+UFfA+H+JT4+lJLfU5i3NE9iLkzXAOrSlTSBG1J/kn2oaBOsDZuA
 HLPRcY5d/p34kgzb64VOL6S81/Yh46WhqgQxb8Rt8SK3bTfAhMLo=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt

Add a initial synology microp driver, written in Rust, to the staging tree.
The driver targets a microcontroller found in Synology NAS devices. It
currently only supports controlling of the power led, status led, alert
led and usb led. Other components such as fan control or handling
on-device buttons will be added once the required rust abstractions are
there.
---
 MAINTAINERS                                        |   6 +
 drivers/staging/Kconfig                            |   2 +
 drivers/staging/Makefile                           |   1 +
 drivers/staging/synology_microp/Kconfig            |   4 +
 drivers/staging/synology_microp/Makefile           |   2 +
 drivers/staging/synology_microp/TODO               |   8 +
 drivers/staging/synology_microp/command.rs         |  48 +++++
 drivers/staging/synology_microp/led.rs             | 229 +++++++++++++++++++++
 drivers/staging/synology_microp/synology_microp.rs |  73 +++++++
 rust/uapi/uapi_helper.h                            |   2 +
 10 files changed, 375 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e9e83ab552c7..a1f8dec31db2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25143,6 +25143,12 @@ L:	linux-fbdev@vger.kernel.org
 S:	Maintained
 F:	drivers/staging/sm750fb/
 
+STAGING - SYNOLOGY MICROP DRIVER
+M:  Markus Probst <markus.probst@posteo.de>
+S:  Maintained
+F: Documentation/devicetree/bindings/mfd/synology,microp.yaml
+F: drivers/staging/synology_microp/
+
 STAGING SUBSYSTEM
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 L:	linux-staging@lists.linux.dev
diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index 2f92cd698bef..193d4a5d7f56 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -48,4 +48,6 @@ source "drivers/staging/axis-fifo/Kconfig"
 
 source "drivers/staging/vme_user/Kconfig"
 
+source "drivers/staging/synology_microp/Kconfig"
+
 endif # STAGING
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index f5b8876aa536..cb0cadd08ae2 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -13,3 +13,4 @@ obj-$(CONFIG_MOST)		+= most/
 obj-$(CONFIG_GREYBUS)		+= greybus/
 obj-$(CONFIG_BCM2835_VCHIQ)	+= vc04_services/
 obj-$(CONFIG_XIL_AXIS_FIFO)	+= axis-fifo/
+obj-$(CONFIG_MFD_SYNOLOGY_MICROP) += synology_microp/
diff --git a/drivers/staging/synology_microp/Kconfig b/drivers/staging/synology_microp/Kconfig
new file mode 100644
index 000000000000..8d315d2576d8
--- /dev/null
+++ b/drivers/staging/synology_microp/Kconfig
@@ -0,0 +1,4 @@
+
+config MFD_SYNOLOGY_MICROP
+	tristate "Synology Microp driver"
+	depends on RUST && SERIAL_DEV_BUS && LEDS_CLASS && LEDS_CLASS_MULTICOLOR
diff --git a/drivers/staging/synology_microp/Makefile b/drivers/staging/synology_microp/Makefile
new file mode 100644
index 000000000000..d762cada20c9
--- /dev/null
+++ b/drivers/staging/synology_microp/Makefile
@@ -0,0 +1,2 @@
+
+obj-y	+= synology_microp.o
diff --git a/drivers/staging/synology_microp/TODO b/drivers/staging/synology_microp/TODO
new file mode 100644
index 000000000000..d432ddd8403c
--- /dev/null
+++ b/drivers/staging/synology_microp/TODO
@@ -0,0 +1,8 @@
+TODO:
+- not all devices have a alert or usb led. Only register them, if a fwnode entry is present.
+- add missing components:
+  - handle on-device buttons (Power, Factory reset, "USB Copy")
+  - handle fan failure
+  - beeper
+  - fan speed control
+  - correctly perform device power-off and restart on Synology devices
diff --git a/drivers/staging/synology_microp/command.rs b/drivers/staging/synology_microp/command.rs
new file mode 100644
index 000000000000..e98e46423e2d
--- /dev/null
+++ b/drivers/staging/synology_microp/command.rs
@@ -0,0 +1,48 @@
+use kernel::{
+    device::Bound,
+    error::Result,
+    serdev, //
+};
+
+use crate::led;
+
+#[derive(Copy, Clone)]
+#[expect(
+    clippy::enum_variant_names,
+    reason = "future variants will not end with Led"
+)]
+pub(crate) enum Command {
+    PowerLed(led::State),
+    StatusLed(led::StatusLedColor, led::State),
+    AlertLed(led::State),
+    UsbLed(led::State),
+}
+
+impl Command {
+    pub(crate) fn write(self, dev: &serdev::Device<Bound>) -> Result<()> {
+        dev.write_all(
+            match self {
+                Command::PowerLed(led::State::On) => &[0x34],
+                Command::PowerLed(led::State::Blink) => &[0x35],
+                Command::PowerLed(led::State::Off) => &[0x36],
+
+                Command::StatusLed(_, led::State::Off) => &[0x37],
+                Command::StatusLed(led::StatusLedColor::Green, led::State::On) => &[0x38],
+                Command::StatusLed(led::StatusLedColor::Green, led::State::Blink) => &[0x39],
+                Command::StatusLed(led::StatusLedColor::Orange, led::State::On) => &[0x3A],
+                Command::StatusLed(led::StatusLedColor::Orange, led::State::Blink) => &[0x3B],
+
+                Command::AlertLed(led::State::On) => &[0x4C, 0x41, 0x31],
+                Command::AlertLed(led::State::Blink) => &[0x4C, 0x41, 0x32],
+                Command::AlertLed(led::State::Off) => &[0x4C, 0x41, 0x33],
+
+                Command::UsbLed(led::State::On) => &[0x40],
+                Command::UsbLed(led::State::Blink) => &[0x41],
+                Command::UsbLed(led::State::Off) => &[0x42],
+            },
+            serdev::Timeout::Max,
+        )?;
+        dev.wait_until_sent(serdev::Timeout::Max);
+        Ok(())
+    }
+}
diff --git a/drivers/staging/synology_microp/led.rs b/drivers/staging/synology_microp/led.rs
new file mode 100644
index 000000000000..deeece661937
--- /dev/null
+++ b/drivers/staging/synology_microp/led.rs
@@ -0,0 +1,229 @@
+use core::sync::atomic::{
+    AtomicBool,
+    Ordering, //
+};
+
+use kernel::{
+    device::Bound,
+    devres::Devres,
+    error::Error,
+    led::{self, MultiColorSubLed},
+    macros::vtable,
+    prelude::*,
+    serdev, //
+};
+
+use crate::command::Command;
+
+pub(crate) struct SynologyMicropLedHandler {
+    blink: AtomicBool,
+    map: fn(State) -> Command,
+}
+
+pub(crate) struct SynologyMicropStatusLedHandler {
+    blink: AtomicBool,
+}
+
+#[derive(Copy, Clone)]
+pub(crate) enum State {
+    On,
+    Blink,
+    Off,
+}
+
+#[derive(Copy, Clone)]
+pub(crate) enum StatusLedColor {
+    Green,
+    Orange,
+}
+
+impl SynologyMicropLedHandler {
+    fn register<'a>(
+        parent: &'a serdev::Device<Bound>,
+        fwnode_child_name: &'static CStr,
+        default_trigger: &'static CStr,
+        brightness: u32,
+        color: led::Color,
+        map: fn(State) -> Command,
+    ) -> impl PinInit<Devres<led::Device<Self>>, Error> + 'a {
+        led::DeviceBuilder::new()
+            .fwnode(
+                parent
+                    .as_ref()
+                    .fwnode()
+                    .and_then(|fwnode| fwnode.get_child_by_name(fwnode_child_name)),
+            )
+            .default_trigger(default_trigger)
+            .initial_brightness(brightness)
+            .devicename(c"synology-microp")
+            .color(color)
+            .build(
+                parent,
+                Ok(Self {
+                    blink: AtomicBool::new(true),
+                    map,
+                }),
+            )
+    }
+
+    pub(crate) fn register_power<'a>(
+        parent: &'a serdev::Device<Bound>,
+    ) -> impl PinInit<Devres<led::Device<Self>>, Error> + 'a {
+        Self::register(
+            parent,
+            c"power-led",
+            c"timer",
+            1,
+            led::Color::Blue,
+            Command::PowerLed,
+        )
+    }
+
+    pub(crate) fn register_alert<'a>(
+        parent: &'a serdev::Device<Bound>,
+    ) -> impl PinInit<Devres<led::Device<Self>>, Error> + 'a {
+        Self::register(
+            parent,
+            c"alert-led",
+            c"none",
+            0,
+            led::Color::Orange,
+            Command::AlertLed,
+        )
+    }
+
+    pub(crate) fn register_usb<'a>(
+        parent: &'a serdev::Device<Bound>,
+    ) -> impl PinInit<Devres<led::Device<Self>>, Error> + 'a {
+        Self::register(
+            parent,
+            c"usb-led",
+            c"none",
+            0,
+            led::Color::Green,
+            Command::UsbLed,
+        )
+    }
+}
+
+#[vtable]
+impl led::LedOps for SynologyMicropLedHandler {
+    type Bus = serdev::Device<Bound>;
+    type Mode = led::Normal;
+    const BLOCKING: bool = true;
+    const MAX_BRIGHTNESS: u32 = 1;
+
+    fn brightness_set(
+        &self,
+        dev: &Self::Bus,
+        _classdev: &led::Device<Self>,
+        brightness: u32,
+    ) -> Result<()> {
+        (self.map)(if brightness == 0 {
+            self.blink.store(false, Ordering::Relaxed);
+            State::Off
+        } else if self.blink.load(Ordering::Relaxed) {
+            State::Blink
+        } else {
+            State::On
+        })
+        .write(dev)
+    }
+
+    fn blink_set(
+        &self,
+        dev: &Self::Bus,
+        _classdev: &led::Device<Self>,
+        delay_on: &mut usize,
+        delay_off: &mut usize,
+    ) -> Result<()> {
+        *delay_on = 167;
+        *delay_off = 167;
+
+        self.blink.store(true, Ordering::Relaxed);
+        (self.map)(State::Blink).write(dev)
+    }
+}
+
+impl SynologyMicropStatusLedHandler {
+    pub(crate) fn register(
+        parent: &serdev::Device<Bound>,
+    ) -> impl PinInit<Devres<led::MultiColorDevice<Self>>, Error> + '_ {
+        const SUBLEDS: &[MultiColorSubLed] = &[
+            MultiColorSubLed::new(led::Color::Green).initial_intensity(1),
+            MultiColorSubLed::new(led::Color::Orange),
+        ];
+
+        led::DeviceBuilder::new()
+            .fwnode(
+                parent
+                    .as_ref()
+                    .fwnode()
+                    .and_then(|fwnode| fwnode.get_child_by_name(c"status-led")),
+            )
+            .devicename(c"synology-microp")
+            .color(led::Color::Multi)
+            .build_multicolor(
+                parent,
+                Ok(SynologyMicropStatusLedHandler {
+                    blink: AtomicBool::new(false),
+                }),
+                SUBLEDS,
+            )
+    }
+}
+
+#[vtable]
+impl led::LedOps for SynologyMicropStatusLedHandler {
+    type Bus = serdev::Device<Bound>;
+    type Mode = led::MultiColor;
+    const BLOCKING: bool = true;
+    const MAX_BRIGHTNESS: u32 = 1;
+
+    fn brightness_set(
+        &self,
+        dev: &Self::Bus,
+        classdev: &led::MultiColorDevice<Self>,
+        brightness: u32,
+    ) -> Result<()> {
+        if brightness == 0 {
+            self.blink.store(false, Ordering::Relaxed);
+        }
+
+        let (color, subled_brightness) = if classdev.subleds()[1].brightness == 0 {
+            (StatusLedColor::Green, classdev.subleds()[0].brightness)
+        } else {
+            (StatusLedColor::Orange, classdev.subleds()[1].brightness)
+        };
+
+        if subled_brightness == 0 {
+            Command::StatusLed(color, State::Off)
+        } else if self.blink.load(Ordering::Relaxed) {
+            Command::StatusLed(color, State::Blink)
+        } else {
+            Command::StatusLed(color, State::On)
+        }
+        .write(dev)
+    }
+
+    fn blink_set(
+        &self,
+        dev: &Self::Bus,
+        classdev: &led::MultiColorDevice<Self>,
+        delay_on: &mut usize,
+        delay_off: &mut usize,
+    ) -> Result<()> {
+        *delay_on = 167;
+        *delay_off = 167;
+
+        self.blink.store(true, Ordering::Relaxed);
+
+        let color = if classdev.subleds()[1].brightness == 0 {
+            StatusLedColor::Green
+        } else {
+            StatusLedColor::Orange
+        };
+
+        Command::StatusLed(color, State::Blink).write(dev)
+    }
+}
diff --git a/drivers/staging/synology_microp/synology_microp.rs b/drivers/staging/synology_microp/synology_microp.rs
new file mode 100644
index 000000000000..abc513edc590
--- /dev/null
+++ b/drivers/staging/synology_microp/synology_microp.rs
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Synology Microp driver
+
+use kernel::{
+    device,
+    devres::Devres,
+    of,
+    prelude::*,
+    serdev, //
+};
+use pin_init::pin_init_scope;
+
+use crate::{
+    led::{
+        SynologyMicropLedHandler,
+        SynologyMicropStatusLedHandler, //
+    }, //
+};
+
+pub(crate) mod command;
+mod led;
+
+kernel::module_serdev_device_driver! {
+    type: SynologyMicropDriver,
+    name: "synology_microp",
+    authors: ["Markus Probst <markus.probst@posteo.de>"],
+    description: "Synology Microp driver",
+    license: "GPL v2",
+}
+
+#[pin_data]
+struct SynologyMicropDriver {
+    #[pin]
+    power_led: Devres<kernel::led::Device<SynologyMicropLedHandler>>,
+    #[pin]
+    status_led: Devres<kernel::led::MultiColorDevice<SynologyMicropStatusLedHandler>>,
+    #[pin]
+    alert_led: Devres<kernel::led::Device<SynologyMicropLedHandler>>,
+    #[pin]
+    usb_led: Devres<kernel::led::Device<SynologyMicropLedHandler>>,
+}
+
+kernel::of_device_table!(
+    OF_TABLE,
+    MODULE_OF_TABLE,
+    <SynologyMicropDriver as serdev::Driver>::IdInfo,
+    [(of::DeviceId::new(c"synology,microp"), ()),]
+);
+
+#[vtable]
+impl serdev::Driver for SynologyMicropDriver {
+    type IdInfo = ();
+    const OF_ID_TABLE: Option<kernel::of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe(
+        dev: &serdev::Device<device::Core>,
+        _id_info: Option<&Self::IdInfo>,
+    ) -> impl PinInit<Self, kernel::error::Error> {
+        pin_init_scope(move || {
+            let _ = dev.set_baudrate(9600);
+            dev.set_flow_control(false);
+            dev.set_parity(serdev::Parity::None)?;
+
+            Ok(try_pin_init!(Self {
+                power_led <- SynologyMicropLedHandler::register_power(dev),
+                status_led <- SynologyMicropStatusLedHandler::register(dev),
+                alert_led <- SynologyMicropLedHandler::register_alert(dev),
+                usb_led <- SynologyMicropLedHandler::register_usb(dev),
+            }))
+        })
+    }
+}
diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
index 06d7d1a2e8da..94b6c1b59e56 100644
--- a/rust/uapi/uapi_helper.h
+++ b/rust/uapi/uapi_helper.h
@@ -14,3 +14,5 @@
 #include <uapi/linux/mdio.h>
 #include <uapi/linux/mii.h>
 #include <uapi/linux/ethtool.h>
+#include <uapi/linux/serial_reg.h>
+

-- 
2.52.0

