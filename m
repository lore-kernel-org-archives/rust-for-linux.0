Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F2731E83E;
	Fri, 20 Mar 2026 22:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774044648; cv=none; b=lfxI1oqtx4AfAYZI7nwOA15vgRj9v1zwCsyeKLYThr2SpBB0aTqj/VL0nD7x8ifKdFC3VCNnXg02ELeMo/NSiB0OTnX6oF4lRlotFK9RaiqLJCg8G1EIfsd+ICyiWflEG+nlsfBym7O11ukMQBj585MMBg8Dbj61Rbuiq1JItPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774044648; c=relaxed/simple;
	bh=OjKTXWGP9W2CGA9Z9I5RMxPWoygssf0gph6CA7xzIEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G2QYTlvnmaeX9gYSJpASDsdIOnM7KZCMIT1ytPoXPNV0USB2/+WnWjjpPQ0XHrxoernl2OeAc7EaN42JxNeWUcBRugvydx7TmKrPD03t3Lhvv47GbH+A7U4CgzVipiiT+WoLE7rOXNbflKY3Noy4FNPm6pGZbdsYeB9YGWc9UcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bEzWG1W7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bEzWG1W7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DFABC2BC87;
	Fri, 20 Mar 2026 22:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774044647;
	bh=OjKTXWGP9W2CGA9Z9I5RMxPWoygssf0gph6CA7xzIEg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bEzWG1W7njf4TJeq5lw3Bc1XVofwcgKugHTAlzW/fYgQWUKV2qYdX4ltRWgPvmFGk
	 lFsWCiTc8ZpZxiQJpVc9nXlVzTBhCtM/MDUc0kDHpI3xWxyWrwRLrDdIy4WVdgiXXv
	 eLSg5xHWa/RjW/ZzEJ4x8CtQO01bUew+RJeONGo7rClVMIOb3ti47awkiSEHm6FLru
	 5Tt0kXCFrDudwfOGUXMeHNQ+wttIXcPYTzBt+xqqzWjISMo11Zjbmotufe7rM12Dhp
	 nWmcQu223YIBCi60l0DpCraRtcidUc4R+rEF7sRDktt/IQiuc+K9FxQ8z0IhgwPoWm
	 N05NldPbjtk2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0051099B40;
	Fri, 20 Mar 2026 22:10:47 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Date: Fri, 20 Mar 2026 23:09:54 +0100
Subject: [PATCH v4 2/2] platform: Add initial synology microp driver
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-synology_microp_initial-v4-2-0423ddb83ca4@posteo.de>
References: <20260320-synology_microp_initial-v4-0-0423ddb83ca4@posteo.de>
In-Reply-To: <20260320-synology_microp_initial-v4-0-0423ddb83ca4@posteo.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Markus Probst <markus.probst@posteo.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=15525;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=nnqWn4XYZoZ2BPJKs6dc6vOY6pY25i6oB9A/U5O30BY=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBpvcXiZOVCAAYd8XnZMre3R37vaFc2xBOa4CKjw
 11ZLKOJmVCJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCab3F4hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9KwQQ//Wz7S/ArDgdpw9IbFn9ORazCJ3/tKPU4
 RHzUZQ257QvVbJkNU0JBLPj4C2YkFJJR8z7F3fQ4lHPipkDqFyD2Jam2GFhYee/BRyFwa8htUeF
 Sx4zIGjbayGrHEqnhMdF/X8dpsiCOSr6JAMuNTn254aN7/JldKkR6rsVR9hjEuhzpsgvWKl98hp
 I7XtWiP9WVehTCcSLn610YkA6xoDT0nvQvGJW7z/WsckoC3xEfSXTnJCuzSzDURN3wSifJLNFLq
 U2j3o0TnAkqv6BUxptuOCRnUGdm781cB0dS3/OWFHroT3NWSkfl3ze4DEMkKBOHuDo4JkCO8BVV
 JvXc9sJoSDxGCq6DEamwvdBW/Ik+7J/IqdwVMj36rC2RodZuVyisuWG8lWqldN27XMHTtjXGGmG
 VrGOslW+IYlB2u+UxVCAEl0wSXA22fOM+zRh/Bn8arXBVJjXFiI/fIXr4mQz7+67tS454+w2Y+3
 hbYc7jgYvIoctt/9T9Y5Bx3OGP+Cjl89gMNFUy7B5Cjzcm7rsF2uFzDcWNJsigsAeUvZy1qwKY5
 lg2fiDAvGJjVThqjlX2iqsUO7VoZyljGOhkjtvNm8RjoKTBxZFby+ANeHf1ji2PvtmqzxnWsEFL
 N7wv8tQMlftwsLZr0Ayr5E0E3Ai6gA6Df6k0WCJ7KptZrCzKyba8=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
X-Endpoint-Received: by B4 Relay for markus.probst@posteo.de/default with
 auth_id=680
X-Original-From: Markus Probst <markus.probst@posteo.de>
Reply-To: markus.probst@posteo.de

From: Markus Probst <markus.probst@posteo.de>

Add a initial synology microp driver, written in Rust.
The driver targets a microcontroller found in Synology NAS devices. It
currently only supports controlling of the power led, status led, alert
led and usb led. Other components such as fan control or handling
on-device buttons will be added once the required rust abstractions are
there.

This driver can be used both on arm and x86, thus it goes into the root
directory of drivers/platform.

Tested successfully on a Synology DS923+.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 MAINTAINERS                                        |   6 +
 drivers/platform/Kconfig                           |   2 +
 drivers/platform/Makefile                          |   1 +
 drivers/platform/synology_microp/Kconfig           |  13 ++
 drivers/platform/synology_microp/Makefile          |   3 +
 drivers/platform/synology_microp/TODO              |   7 +
 drivers/platform/synology_microp/command.rs        |  50 ++++
 drivers/platform/synology_microp/led.rs            | 254 +++++++++++++++++++++
 .../platform/synology_microp/synology_microp.rs    |  58 +++++
 9 files changed, 394 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bed1fac09d9f..7ea506ba3fe4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25542,6 +25542,12 @@ F:	drivers/dma-buf/sync_*
 F:	include/linux/sync_file.h
 F:	include/uapi/linux/sync_file.h
 
+SYNOLOGY MICROP DRIVER
+M:	Markus Probst <markus.probst@posteo.de>
+S:	Maintained
+F:	Documentation/devicetree/bindings/embedded-controller/synology,microp.yaml
+F:	drivers/platform/synology_microp/
+
 SYNOPSYS ARC ARCHITECTURE
 M:	Vineet Gupta <vgupta@kernel.org>
 L:	linux-snps-arc@lists.infradead.org
diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 312788f249c9..996050566a4a 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -22,3 +22,5 @@ source "drivers/platform/arm64/Kconfig"
 source "drivers/platform/raspberrypi/Kconfig"
 
 source "drivers/platform/wmi/Kconfig"
+
+source "drivers/platform/synology_microp/Kconfig"
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index fa322e7f8716..2381872e9133 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -15,3 +15,4 @@ obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
 obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+= arm64/
 obj-$(CONFIG_BCM2835_VCHIQ)	+= raspberrypi/
 obj-$(CONFIG_ACPI_WMI)		+= wmi/
+obj-$(CONFIG_SYNOLOGY_MICROP)	+= synology_microp/
diff --git a/drivers/platform/synology_microp/Kconfig b/drivers/platform/synology_microp/Kconfig
new file mode 100644
index 000000000000..0c145a5b7174
--- /dev/null
+++ b/drivers/platform/synology_microp/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config SYNOLOGY_MICROP
+	tristate "Synology Microp driver"
+	depends on LEDS_CLASS && LEDS_CLASS_MULTICOLOR
+	depends on RUST_SERIAL_DEV_BUS_ABSTRACTIONS
+	help
+	  Enable support for the MCU found in Synology NAS devices.
+
+	  This is needed to properly shutdown and reboot the device, as well as
+	  additional functionality like fan and LED control.
+
+	  This driver is work in progress and may not be fully functional.
diff --git a/drivers/platform/synology_microp/Makefile b/drivers/platform/synology_microp/Makefile
new file mode 100644
index 000000000000..63585ccf76e4
--- /dev/null
+++ b/drivers/platform/synology_microp/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-y += synology_microp.o
diff --git a/drivers/platform/synology_microp/TODO b/drivers/platform/synology_microp/TODO
new file mode 100644
index 000000000000..1961a33115db
--- /dev/null
+++ b/drivers/platform/synology_microp/TODO
@@ -0,0 +1,7 @@
+TODO:
+- add missing components:
+  - handle on-device buttons (Power, Factory reset, "USB Copy")
+  - handle fan failure
+  - beeper
+  - fan speed control
+  - correctly perform device power-off and restart on Synology devices
diff --git a/drivers/platform/synology_microp/command.rs b/drivers/platform/synology_microp/command.rs
new file mode 100644
index 000000000000..92deaf5ce3b2
--- /dev/null
+++ b/drivers/platform/synology_microp/command.rs
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
+    pub(crate) fn write(self, dev: &serdev::Device<Bound>) -> Result {
+        dev.write_all(
+            match self {
+                Self::PowerLed(led::State::On) => &[0x34],
+                Self::PowerLed(led::State::Blink) => &[0x35],
+                Self::PowerLed(led::State::Off) => &[0x36],
+
+                Self::StatusLed(_, led::State::Off) => &[0x37],
+                Self::StatusLed(led::StatusLedColor::Green, led::State::On) => &[0x38],
+                Self::StatusLed(led::StatusLedColor::Green, led::State::Blink) => &[0x39],
+                Self::StatusLed(led::StatusLedColor::Orange, led::State::On) => &[0x3A],
+                Self::StatusLed(led::StatusLedColor::Orange, led::State::Blink) => &[0x3B],
+
+                Self::AlertLed(led::State::On) => &[0x4C, 0x41, 0x31],
+                Self::AlertLed(led::State::Blink) => &[0x4C, 0x41, 0x32],
+                Self::AlertLed(led::State::Off) => &[0x4C, 0x41, 0x33],
+
+                Self::UsbLed(led::State::On) => &[0x40],
+                Self::UsbLed(led::State::Blink) => &[0x41],
+                Self::UsbLed(led::State::Off) => &[0x42],
+            },
+            serdev::Timeout::Max,
+        )?;
+        dev.wait_until_sent(serdev::Timeout::Max);
+        Ok(())
+    }
+}
diff --git a/drivers/platform/synology_microp/led.rs b/drivers/platform/synology_microp/led.rs
new file mode 100644
index 000000000000..239d063bc0e9
--- /dev/null
+++ b/drivers/platform/synology_microp/led.rs
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{
+    device::{property::FwNode, Bound},
+    devres::{self, Devres},
+    led::{
+        self,
+        LedOps,
+        MultiColorSubLed, //
+    },
+    new_mutex,
+    prelude::*,
+    serdev,
+    sync::Mutex, //
+};
+use pin_init::pin_init_scope;
+
+use crate::command::Command;
+
+#[pin_data]
+pub(crate) struct Data {
+    #[pin]
+    status: Devres<led::MultiColorDevice<StatusLedHandler>>,
+    #[pin]
+    power: Devres<led::Device<LedHandler>>,
+}
+
+impl Data {
+    pub(super) fn register<'a>(
+        dev: &'a serdev::Device<Bound>,
+        fwnode: &'a FwNode,
+    ) -> impl PinInit<Self, Error> + 'a {
+        pin_init_scope(move || {
+            if let Some(alert_fwnode) = fwnode.get_child_by_name(c"alert-led") {
+                devres::register(
+                    dev.as_ref(),
+                    led::DeviceBuilder::new()
+                        .fwnode(Some(alert_fwnode))
+                        .devicename(c"synology-microp/alert-led")
+                        .color(led::Color::Orange)
+                        .build(
+                            dev,
+                            try_pin_init!(LedHandler {
+                                blink <- new_mutex!(false),
+                                command: Command::AlertLed,
+                            }),
+                        ),
+                    GFP_KERNEL,
+                )?;
+            }
+
+            if let Some(alert_fwnode) = fwnode.get_child_by_name(c"usb-led") {
+                devres::register(
+                    dev.as_ref(),
+                    led::DeviceBuilder::new()
+                        .fwnode(Some(alert_fwnode))
+                        .devicename(c"synology-microp/usb-led")
+                        .color(led::Color::Green)
+                        .build(
+                            dev,
+                            try_pin_init!(LedHandler {
+                                blink <- new_mutex!(false),
+                                command: Command::UsbLed,
+                            }),
+                        ),
+                    GFP_KERNEL,
+                )?;
+            }
+
+            Ok(try_pin_init!(Self {
+                status <- led::DeviceBuilder::new()
+                    .fwnode(Some(fwnode.get_child_by_name(c"status-led").ok_or(EINVAL)?))
+                    .devicename(c"synology-microp/status-led")
+                    .color(led::Color::Multi)
+                    .build_multicolor(
+                        dev,
+                        try_pin_init!(StatusLedHandler {
+                            blink <- new_mutex!(false),
+                        }),
+                        StatusLedHandler::SUBLEDS,
+                    ),
+                power <- led::DeviceBuilder::new()
+                    .fwnode(Some(fwnode.get_child_by_name(c"power-led").ok_or(EINVAL)?))
+                    .devicename(c"synology-microp/power-led")
+                    .color(led::Color::Blue)
+                    .default_trigger(c"timer")
+                    .build(
+                        dev,
+                        try_pin_init!(LedHandler {
+                            blink <- new_mutex!(true),
+                            command: Command::PowerLed,
+                        }),
+                    ),
+            }))
+        })
+    }
+}
+
+#[derive(Copy, Clone)]
+pub(crate) enum StatusLedColor {
+    Green,
+    Orange,
+}
+
+#[derive(Copy, Clone)]
+pub(crate) enum State {
+    On,
+    Blink,
+    Off,
+}
+
+#[pin_data]
+struct LedHandler {
+    #[pin]
+    blink: Mutex<bool>,
+    command: fn(State) -> Command,
+}
+
+#[vtable]
+impl LedOps for LedHandler {
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
+        let mut blink = self.blink.lock();
+        (self.command)(if brightness == 0 {
+            *blink = false;
+            State::Off
+        } else if *blink {
+            State::Blink
+        } else {
+            State::On
+        })
+        .write(dev)?;
+
+        Ok(())
+    }
+
+    fn blink_set(
+        &self,
+        dev: &Self::Bus,
+        _classdev: &led::Device<Self>,
+        delay_on: &mut usize,
+        delay_off: &mut usize,
+    ) -> Result<()> {
+        let mut blink = self.blink.lock();
+
+        (self.command)(if *delay_on == 0 && *delay_off != 0 {
+            State::Off
+        } else if *delay_on != 0 && *delay_off == 0 {
+            State::On
+        } else {
+            *blink = true;
+            *delay_on = 167;
+            *delay_off = 167;
+
+            State::Blink
+        })
+        .write(dev)
+    }
+}
+
+#[pin_data]
+struct StatusLedHandler {
+    #[pin]
+    blink: Mutex<bool>,
+}
+
+impl StatusLedHandler {
+    const SUBLEDS: &[MultiColorSubLed] = &[
+        MultiColorSubLed::new(led::Color::Green).initial_intensity(1),
+        MultiColorSubLed::new(led::Color::Orange),
+    ];
+}
+
+#[vtable]
+impl LedOps for StatusLedHandler {
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
+        let mut blink = self.blink.lock();
+        if brightness == 0 {
+            *blink = false;
+        }
+
+        let (color, subled_brightness) = if classdev.subleds()[1].intensity == 0 {
+            (StatusLedColor::Green, classdev.subleds()[0].brightness)
+        } else {
+            (StatusLedColor::Orange, classdev.subleds()[1].brightness)
+        };
+
+        Command::StatusLed(
+            color,
+            if subled_brightness == 0 {
+                State::Off
+            } else if *blink {
+                State::Blink
+            } else {
+                State::On
+            },
+        )
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
+        let mut blink = self.blink.lock();
+        *blink = true;
+
+        let (color, subled_intensity) = if classdev.subleds()[1].intensity == 0 {
+            (StatusLedColor::Green, classdev.subleds()[0].intensity)
+        } else {
+            (StatusLedColor::Orange, classdev.subleds()[1].intensity)
+        };
+        Command::StatusLed(
+            color,
+            if *delay_on == 0 && *delay_off != 0 {
+                *blink = false;
+                State::Off
+            } else if subled_intensity == 0 {
+                State::Off
+            } else if *delay_on != 0 && *delay_off == 0 {
+                *blink = false;
+                State::On
+            } else {
+                *delay_on = 167;
+                *delay_off = 167;
+
+                State::Blink
+            },
+        )
+        .write(dev)
+    }
+}
diff --git a/drivers/platform/synology_microp/synology_microp.rs b/drivers/platform/synology_microp/synology_microp.rs
new file mode 100644
index 000000000000..4e3162aa5375
--- /dev/null
+++ b/drivers/platform/synology_microp/synology_microp.rs
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Synology Microp driver
+
+use kernel::{
+    device,
+    of,
+    prelude::*,
+    serdev, //
+};
+use pin_init::pin_init_scope;
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
+    led: led::Data,
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
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe(
+        dev: &serdev::Device<device::Core>,
+        _id_info: Option<&Self::IdInfo>,
+    ) -> impl PinInit<Self, kernel::error::Error> {
+        pin_init_scope(move || {
+            let fwnode = dev.as_ref().fwnode().ok_or(EINVAL)?;
+
+            dev.set_baudrate(9600).map_err(|_| EINVAL)?;
+            dev.set_flow_control(false);
+            dev.set_parity(serdev::Parity::None)?;
+
+            Ok(try_pin_init!(Self {
+                led <- led::Data::register(dev, fwnode),
+            }))
+        })
+    }
+}

-- 
2.52.0


