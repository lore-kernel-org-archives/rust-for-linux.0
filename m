Received: from mail-244118.protonmail.ch (mail-244118.protonmail.ch [109.224.244.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E450F34C141
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 13:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791723747; cv=none; b=p6/WiS9S6rq8XdMCgQismw1Q2TrKHyvhNT+XKk3aGlUw/GA0Lv7neIIxj/FdAcVBcstdmkUi927YLTvPb2Wg9c9Pg7cB7f7Cj5mG4hfTAndPSe60aa+nPYdjQRHZHlauj4Bs2ypPwMKZZVa5MFdccwk1L1wPdlG6VBiSNEnjRdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791723747; c=relaxed/simple;
	bh=Pq7nFf0g+Fap2+Bar86YWQVOfrb/eOD2AoK6RpGr+k8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h256ev/8XhGiYOSjq5ssVlPhiQO2lHIh8z/aiuGQ1omVMG1CeVgk61WiF6tLxA4UJQalLv3lk5+uleJzXfMep+Y3IxbGX8/CyduTcc14/BKOMgl1IsIz1Zgu8Ghpm/UrngEBSRycJN7LkbU/DEU9vjKndAq3YbjgxyDJB1KF7OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=midirus.com; spf=pass smtp.mailfrom=midirus.com; dkim=pass (2048-bit key) header.d=midirus.com header.i=@midirus.com header.b=BdLmgeQS; arc=none smtp.client-ip=109.224.244.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=midirus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=midirus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=midirus.com header.i=@midirus.com header.b="BdLmgeQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midirus.com;
	s=protonmail; t=1791723740; x=1791982940;
	bh=ZjG/dHRfwwyp7KgN/J23zcZVMbFuVoNT8NYirwTEIko=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BdLmgeQSxnV3IIeymqheNGatJcpFJ5PvWFAMMsEdZv/86XpuS3e0hkF/b3UWsTlRk
	 4RbRAloo20z3YURie35By63y2eYubjtHGupkiczkYg1pHf15XvnO65p+8mHksFW2qd
	 AFJOXWipOo/ekQ2cLKUxLuUI9S7sb1avGiqODCXqJVi6fk7dvE6jOz8ks9tOV+wPZr
	 /1AI2PcnLDWxGtcJ/R1vrmzrgv6kIgSPTq39DRo+/UQtD8VvwseOmhOxYdabhLeqi6
	 MeBsmS0dyy7HactA8F/XbPYO+VpLoyJmeb7DBBYafG/8A0oNyQjuduYPt932BUYrO9
	 fXzCHR/pIms2w==
Date: Sun, 11 Oct 2026 13:02:17 +0000
To: Takashi Iwai <tiwai@suse.de>, Miguel Ojeda <ojeda@kernel.org>
From: Tristan de Cacqueray <tristan@midirus.com>
Cc: linux-sound@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Tristan de Cacqueray <tristan@midirus.com>
Subject: [PATCH RFC 1/3] rust: snd: Add initial snd_card binding
Message-ID: <20261011-rust-snd-v1-1-7974ecdcd345@midirus.com>
In-Reply-To: <20261011-rust-snd-v1-0-7974ecdcd345@midirus.com>
References: <20261011-rust-snd-v1-0-7974ecdcd345@midirus.com>
Feedback-ID: 135030709:user:proton
X-Pm-Message-ID: fd11d43e7260a7fec4e23ad608ca6fccd56f435f
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add minimal abstraction to create a snd_card in Rust.

Signed-off-by: Tristan de Cacqueray <tristan@midirus.com>
---
 rust/bindings/bindings_helper.h  |  1 +
 rust/kernel/lib.rs               |  2 ++
 rust/kernel/snd.rs               | 89 ++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++
 samples/rust/Kconfig             | 11 +++++++++++
 samples/rust/Makefile            |  1 +
 samples/rust/rust_midi_device.rs | 41 ++++++++++++++++++++++++++++++++++++=
+++++
 6 files changed, 145 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helpe=
r.h
index c706dda5b5ca..c624f073db04 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -97,6 +97,7 @@
 #include <linux/xarray.h>
 #include <net/genetlink.h>
 #include <net/netlink.h>
+#include <sound/core.h>
 #include <trace/events/rust_sample.h>
=20
 /*
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 7225abc64084..974b3e5ce7ac 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -130,6 +130,8 @@
 #[cfg(CONFIG_RUST_SERIAL_DEV_BUS_ABSTRACTIONS)]
 pub mod serdev;
 pub mod sizes;
+#[cfg(CONFIG_SND)]
+pub mod snd;
 #[cfg(CONFIG_SOC_BUS)]
 pub mod soc;
 #[doc(hidden)]
diff --git a/rust/kernel/snd.rs b/rust/kernel/snd.rs
new file mode 100644
index 000000000000..aaffe942b360
--- /dev/null
+++ b/rust/kernel/snd.rs
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (C) 2026 Tristan de Cacqueray
+
+//! Abstractions for the snd subsystem.
+//!
+//! This module provides bindings for working with ALSA in kernel modules.
+//!
+//! C header: [`include/sound/core.h`](srctree/include/sound/core.h)
+
+use kernel::{
+    bindings,
+    device::Device,
+    error::{Result},
+    prelude::*,
+};
+
+/// A sound card instance.
+pub struct SoundCard {
+    ptr: *mut bindings::snd_card,
+}
+
+impl SoundCard {
+    /// Creates a new sound card bound to a device lifecycle
+    pub fn new(dev: &Device, id: &CStr, module: &'static kernel::ThisModul=
e) -> Result<Self> {
+        let mut card_ptr: *mut bindings::snd_card =3D core::ptr::null_mut(=
);
+
+        // SAFETY: C helper copies the arguments.
+        let ret =3D unsafe {
+            bindings::snd_devm_card_new(
+                dev.as_raw(),
+                -1,
+                id.as_char_ptr(),
+                module.as_ptr(),
+                0,
+                &mut card_ptr,
+            )
+        };
+
+        if ret < 0 {
+            return Err(Error::from_errno(ret));
+        }
+
+        Ok(Self { ptr: card_ptr })
+    }
+
+    /// Sets the driver field of the sound card.
+    pub fn set_driver(&mut self, name: &CStr) -> Result<()> {
+        // SAFETY: `self.ptr` is valid and points to an initialized `snd_c=
ard`.
+        let card =3D unsafe { &mut *self.ptr };
+        copy_to_c_buf(&mut card.driver, name)
+    }
+
+    /// Sets the shortname field of the sound card.
+    pub fn set_shortname(&mut self, name: &CStr) -> Result<()> {
+        // SAFETY: `self.ptr` is valid and points to an initialized `snd_c=
ard`.
+        let card =3D unsafe { &mut *self.ptr };
+        copy_to_c_buf(&mut card.shortname, name)
+    }
+
+    /// Triggers registration of the card components to the user-space ALS=
A layers
+    pub fn register(self) -> Result<RegisteredSoundCard> {
+        // SAFETY: `self.ptr` is valid and points to an initialized `snd_c=
ard`.
+        let ret =3D unsafe { bindings::snd_card_register(self.ptr) };
+        if ret < 0 {
+            return Err(Error::from_errno(ret));
+        }
+        Ok(RegisteredSoundCard { _inner: self })
+    }
+}
+
+/// Helper to copy `src` (including its NUL) into the fixed-size C buffer =
`dest`.
+/// Returns `EINVAL` if `src` does not fit.
+fn copy_to_c_buf(dest: &mut [ffi::c_char], src: &CStr) -> Result<()> {
+    let bytes =3D src.to_bytes_with_nul();
+    if bytes.len() > dest.len() {
+        return Err(EINVAL);
+    }
+    let (used, rest) =3D dest.split_at_mut(bytes.len());
+    for (d, &b) in used.iter_mut().zip(bytes) {
+        *d =3D b as ffi::c_char;
+    }
+    rest.fill(0);
+    Ok(())
+}
+
+/// A sound card that is already registered.
+pub struct RegisteredSoundCard {
+    _inner: SoundCard,
+}
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 31d62533ef25..1cf8cf18cd2d 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -31,6 +31,17 @@ config SAMPLE_RUST_MINIMAL
=20
 =09  If unsure, say N.
=20
+config SAMPLE_RUST_MIDI_DEVICE
+=09tristate "MIDI device"
+=09depends on SND_RAWMIDI
+=09help
+=09  This option builds the Rust MIDI device.
+
+=09  To compile this as a module, choose M here:
+=09  the module will be called rust_midi_device.
+
+=09  If unsure, say N.
+
 config SAMPLE_RUST_MISC_DEVICE
 =09tristate "Misc device"
 =09help
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index b986b681cde5..170b7e3e5590 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -2,6 +2,7 @@
 ccflags-y +=3D -I$(src)=09=09=09=09# needed for trace events
=20
 obj-$(CONFIG_SAMPLE_RUST_MINIMAL)=09=09+=3D rust_minimal.o
+obj-$(CONFIG_SAMPLE_RUST_MIDI_DEVICE)=09=09+=3D rust_midi_device.o
 obj-$(CONFIG_SAMPLE_RUST_MISC_DEVICE)=09=09+=3D rust_misc_device.o
 obj-$(CONFIG_SAMPLE_RUST_PRINT)=09=09=09+=3D rust_print.o
 obj-$(CONFIG_SAMPLE_RUST_DEBUGFS)=09=09+=3D rust_debugfs.o
diff --git a/samples/rust/rust_midi_device.rs b/samples/rust/rust_midi_devi=
ce.rs
new file mode 100644
index 000000000000..5561a0437b59
--- /dev/null
+++ b/samples/rust/rust_midi_device.rs
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust MIDI minimal sample.
+
+use kernel::{
+    faux,
+    prelude::*,
+    snd,
+};
+
+impl kernel::Module for RustMidiDeviceModule {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        pr_debug!("Initializing sound card\n");
+        let reg =3D faux::Registration::new(c"rust-midi-device", None)?;
+        let fdev =3D reg.as_ref();
+        let mut card =3D snd::SoundCard::new(
+            fdev.as_ref(),
+            c"RustMIDI",
+            kernel::module::this_module::<RustMidiDeviceModule>(),
+        )?;
+        card.set_driver(c"rust-midi")?;
+        card.set_shortname(c"RustMIDI")?;
+
+        // Register the sndcard to ALSA.
+        card.register()?;
+
+        Ok(Self { _reg: reg })
+    }
+}
+
+struct RustMidiDeviceModule {
+    _reg: faux::Registration,
+}
+
+module! {
+    type: RustMidiDeviceModule,
+    name: "rust_midi_device",
+    authors: ["Rust for Linux Contributors"],
+    description: "Rust MIDI device sample",
+    license: "GPL",
+}

--=20
2.56.0


