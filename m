Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4E7395257
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 18:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772995290; cv=none; b=tGZQZ9U74czCwo0ArVXZNdJG6r+h3y4/kyJVV5SfdRiKlBeWhvhsbI0YqdtcWl/M1VNWl+qNZi/Cdg3Xu0t+NK5OiDRy2gZMcBGfklotBlDhiUJZpQJBJDYbGC9/khHJCisoMFfvKLxgBJQYh1WnbK1PjWrxeAEBnzd9i73AsA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772995290; c=relaxed/simple;
	bh=n8odO2PQarHTMURWKyPylSvysgSljfn0Dnb08u0SyQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cJA7bG2PLA4lksJBLBItUrx1jT+aCPncEWKaqw/FnlI3OOhtpA3kqQXtsebZHMY2Gk5nwIkcCbLUAQPXCvqzlvj4C0AQj6ovdpS1ljdpHpe1oYsTh5jN4ASKj1YiPeo2SZoLnWGltxlDAzmIAjmZOgKfLvG8kHWgLPJSuyF2wG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=SZbsws8c; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="SZbsws8c"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 3DBC7240105
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 19:41:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1772995281; bh=QXEnJ4ETar1yajx0jzW29UAXecsaIMgL1BdTch5gHPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=SZbsws8c0RyCYJuUg+qbkt9XuvLedhvRTdapqZ9uvUvOLGRgBAZT5Va9UgC+/9mUu
	 xaUWOF84flkHM1JSzPezNq/Z2NWyCxhY6jN5I2xvLyhr/8PcNERtEpFHJavA6Dmmjb
	 nypGd/ZUlRXuW+VdHl6W1HARcHeuUH7joN3juOIJZ8vfd/GV/Rv0f9S0poS66q9EXc
	 qWHuSyGdymepeFN0UFpkZ+RmbtBqcn5zj1ekfdb+DiY8XMJKb4jL81cQuJFr4KC7tU
	 6SueeMZRXzsGaCqHKMjPEpVfryBEEFnpz/WGy8WVflxVIThXHtUQQiOQ1rZw8FraTx
	 VRkisItsdSHsg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fTTW262yRz9rxM;
	Sun,  8 Mar 2026 19:41:18 +0100 (CET)
From: Markus Probst <markus.probst@posteo.de>
Date: Sun, 08 Mar 2026 18:41:20 +0000
Subject: [PATCH v2 2/2] mfd: Add initial synology microp driver
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-synology_microp_initial-v2-2-9389963f31c5@posteo.de>
References: <20260308-synology_microp_initial-v2-0-9389963f31c5@posteo.de>
In-Reply-To: <20260308-synology_microp_initial-v2-0-9389963f31c5@posteo.de>
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
 rust-for-linux@vger.kernel.org, Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=16787;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=n8odO2PQarHTMURWKyPylSvysgSljfn0Dnb08u0SyQM=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBprcLJ9K7vfI0ghv+h9nycC6CRcCcSyio1u6J0m
 whps7JuuFWJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaa3CyRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9KQaQ//WxrLNnCSMxGSH20+gcmrvmFCA10WLZg
 NYrlJ4RnNkfqsc8M6Ezw0IHmurLaMikZa8TiMgHgfEy4ln6fX6YVHmwWkiNZNlGHM0Qh8N4Hg0a
 enzi0bdUyEDkQT49hF0UttxEitlFgSPKUYApRk990d9c/tK4vOSaaTzj+hV2pzaJ2cFu6/TgT+g
 fCwoY6uzGI7Nm9KPNs+4NkARZfjY6pVStlMXvW4YowiKltRANgSIfRa1uQiBUlZDZolMSHCE8po
 YOcWqjk1cOHK2gMVUQUMpz1i9MfU2qzFMRDLc87D8j5v/1Pb3ao4WN2cnuaIvIke/OTh8SW4S2V
 Cm4swGee/uU6YixKv2g+oL2JQ1OIi0lw1mcTA6VFtf4/q7eXg+7Mh7WVjfACSHFh0zDYFPt9WfI
 7zJxjKNEU63DAfHy5q0FrjQpuQrAfdeWt+iBpiZVwTxbuHOa8aE+y2uT3QjWoOfFLpYo9a0OFjS
 N2h5F3W7GJYW+NiSL/8e1E7Jdsd9fo2JqaDGJh6ytS0WEp1opv2/NdOMivjCKYSBySHWz0mTv5E
 HPzEXT5Ee3uVSj7jz7FqaeCcLB90PyafxIzI14TNXBDzP4oGZWs0M5YpInWcJJnvOMRh4dEQ6W0
 F6WZ7JAaQnmIetFUXgKOAaLsSLoMM1jnWXQDhjX8AS52XL6Jple4=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt

Add a initial synology microp driver, written in Rust.
The driver targets a microcontroller found in Synology NAS devices. It
currently only supports controlling of the power led, status led, alert
led and usb led. Other components such as fan control or handling
on-device buttons will be added once the required rust abstractions are
there.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 MAINTAINERS                                    |   6 +
 drivers/mfd/Kconfig                            |   2 +
 drivers/mfd/Makefile                           |   2 +
 drivers/mfd/synology_microp/Kconfig            |  14 ++
 drivers/mfd/synology_microp/Makefile           |   2 +
 drivers/mfd/synology_microp/TODO               |   7 +
 drivers/mfd/synology_microp/command.rs         |  50 +++++
 drivers/mfd/synology_microp/led.rs             | 275 +++++++++++++++++++++++++
 drivers/mfd/synology_microp/synology_microp.rs |  82 ++++++++
 rust/uapi/uapi_helper.h                        |   2 +
 10 files changed, 442 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e9e83ab552c7..092cd9e8a730 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25550,6 +25550,12 @@ F:	drivers/dma-buf/sync_*
 F:	include/linux/sync_file.h
 F:	include/uapi/linux/sync_file.h
 
+SYNOLOGY MICROP DRIVER
+M:	Markus Probst <markus.probst@posteo.de>
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/synology,microp.yaml
+F:	drivers/mfd/synology_microp/
+
 SYNOPSYS ARC ARCHITECTURE
 M:	Vineet Gupta <vgupta@kernel.org>
 L:	linux-snps-arc@lists.infradead.org
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 7192c9d1d268..bc269719749f 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2580,5 +2580,7 @@ config MFD_MAX7360
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+source "drivers/mfd/synology_microp/Kconfig"
+
 endmenu
 endif
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e75e8045c28a..0a6fa33d5c35 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -304,3 +304,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
 obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
 
 obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
+
+obj-$(CONFIG_MFD_SYNOLOGY_MICROP)	+= synology_microp/
diff --git a/drivers/mfd/synology_microp/Kconfig b/drivers/mfd/synology_microp/Kconfig
new file mode 100644
index 000000000000..4bbbcf0b6e94
--- /dev/null
+++ b/drivers/mfd/synology_microp/Kconfig
@@ -0,0 +1,14 @@
+
+config MFD_SYNOLOGY_MICROP
+	tristate "Synology Microp driver"
+	depends on RUST
+	depends on SERIAL_DEV_BUS
+	depends on LEDS_CLASS && LEDS_CLASS_MULTICOLOR
+	default n
+	help
+	  Enable support for the MCU found in Synology NAS devices.
+
+	  This is needed to properly shutdown and reboot the device, as well as
+	  additional functionality like fan and LED control.
+
+	  This driver is work in progress and may not be fully functional.
diff --git a/drivers/mfd/synology_microp/Makefile b/drivers/mfd/synology_microp/Makefile
new file mode 100644
index 000000000000..d762cada20c9
--- /dev/null
+++ b/drivers/mfd/synology_microp/Makefile
@@ -0,0 +1,2 @@
+
+obj-y	+= synology_microp.o
diff --git a/drivers/mfd/synology_microp/TODO b/drivers/mfd/synology_microp/TODO
new file mode 100644
index 000000000000..1961a33115db
--- /dev/null
+++ b/drivers/mfd/synology_microp/TODO
@@ -0,0 +1,7 @@
+TODO:
+- add missing components:
+  - handle on-device buttons (Power, Factory reset, "USB Copy")
+  - handle fan failure
+  - beeper
+  - fan speed control
+  - correctly perform device power-off and restart on Synology devices
diff --git a/drivers/mfd/synology_microp/command.rs b/drivers/mfd/synology_microp/command.rs
new file mode 100644
index 000000000000..78f82a86f1b2
--- /dev/null
+++ b/drivers/mfd/synology_microp/command.rs
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+
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
diff --git a/drivers/mfd/synology_microp/led.rs b/drivers/mfd/synology_microp/led.rs
new file mode 100644
index 000000000000..28a765b1e6c2
--- /dev/null
+++ b/drivers/mfd/synology_microp/led.rs
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::sync::atomic::{
+    AtomicBool,
+    Ordering, //
+};
+
+use kernel::{
+    device::{
+        property::FwNode,
+        Bound, //
+    },
+    devres::Devres,
+    error::Error,
+    led::{self, MultiColorSubLed},
+    macros::vtable,
+    prelude::*,
+    serdev,
+    types::ARef, //
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
+    fn register_by_fwnode<'a>(
+        parent: &'a serdev::Device<Bound>,
+        default_trigger: &'static CStr,
+        brightness: u32,
+        color: led::Color,
+        map: fn(State) -> Command,
+        fwnode: Option<ARef<FwNode>>,
+    ) -> impl PinInit<Devres<led::Device<Self>>, Error> + 'a {
+        led::DeviceBuilder::new()
+            .fwnode(fwnode)
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
+    fn register<'a>(
+        parent: &'a serdev::Device<Bound>,
+        fwnode_child_name: &'static CStr,
+        default_trigger: &'static CStr,
+        brightness: u32,
+        color: led::Color,
+        map: fn(State) -> Command,
+    ) -> impl PinInit<Devres<led::Device<Self>>, Error> + 'a {
+        Self::register_by_fwnode(
+            parent,
+            default_trigger,
+            brightness,
+            color,
+            map,
+            parent
+                .as_ref()
+                .fwnode()
+                .and_then(|fwnode| fwnode.get_child_by_name(fwnode_child_name)),
+        )
+    }
+
+    fn register_optional<'a>(
+        parent: &'a serdev::Device<Bound>,
+        fwnode_child_name: &'static CStr,
+        default_trigger: &'static CStr,
+        brightness: u32,
+        color: led::Color,
+        map: fn(State) -> Command,
+    ) -> Option<impl PinInit<Devres<led::Device<Self>>, Error> + 'a> {
+        parent
+            .as_ref()
+            .fwnode()
+            .and_then(|fwnode| fwnode.get_child_by_name(fwnode_child_name))
+            .map(|fwnode| {
+                Self::register_by_fwnode(
+                    parent,
+                    default_trigger,
+                    brightness,
+                    color,
+                    map,
+                    Some(fwnode),
+                )
+            })
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
+    ) -> Option<impl PinInit<Devres<led::Device<Self>>, Error> + 'a> {
+        Self::register_optional(
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
+    ) -> Option<impl PinInit<Devres<led::Device<Self>>, Error> + 'a> {
+        Self::register_optional(
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
diff --git a/drivers/mfd/synology_microp/synology_microp.rs b/drivers/mfd/synology_microp/synology_microp.rs
new file mode 100644
index 000000000000..e92de7da3e46
--- /dev/null
+++ b/drivers/mfd/synology_microp/synology_microp.rs
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Synology Microp driver
+
+use kernel::{
+    device,
+    devres::{self, Devres},
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
+    params: {
+        check_fan: i32 {
+            default: 1,
+            description: "Check for cpu fan failures",
+        },
+    },
+}
+
+#[pin_data]
+struct SynologyMicropDriver {
+    #[pin]
+    power_led: Devres<kernel::led::Device<SynologyMicropLedHandler>>,
+    #[pin]
+    status_led: Devres<kernel::led::MultiColorDevice<SynologyMicropStatusLedHandler>>,
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
+            // TODO: Replace with Option field on SynologyMicropDriver once
+            // https://github.com/Rust-for-Linux/pin-init/issues/59 has been resolved.
+            if let Some(alert_led) = SynologyMicropLedHandler::register_alert(dev) {
+                devres::register(dev.as_ref(), alert_led, GFP_KERNEL)?;
+            }
+            if let Some(usb_led) = SynologyMicropLedHandler::register_usb(dev) {
+                devres::register(dev.as_ref(), usb_led, GFP_KERNEL)?;
+            }
+
+            Ok(try_pin_init!(Self {
+                power_led <- SynologyMicropLedHandler::register_power(dev),
+                status_led <- SynologyMicropStatusLedHandler::register(dev),
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

