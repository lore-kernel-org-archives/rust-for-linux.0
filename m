Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5942B298CAF
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 13:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791723757; cv=none; b=nF1FdyoFYhkrvHgmEGgvaJ2+YsSa/veY7lV8NOQKUZh26PpHRuS12fDYUm+9M6Ncv1uG3D9vfkR85/tqem0jHzalZkB0OLR/6Qhd3eUNxZVw2IwnJOiIo+PBrzC6FUJLBUkk4vVvfJaRUDHkoCthMsMaijkPILP9EGKSexKrZg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791723757; c=relaxed/simple;
	bh=dc6UoItEDVie9GQrnRqurDQjup0xg6U3bqiczLDKmCs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lkkIXFz413k4y1yz6hYNZknpjCNFhfHcm3olC9zBlesObmGGrmzjaO2ZVemRYtI5MD08pzMtoKQD1Cj0IdwvocghPRdgnGvHeBW7FojFT7BaqDzSCVRliAJnaIthZz2vK7gatq+oCQQ1/o9qPgXBKNCBs41p+3BHxWRTCztsWnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=midirus.com; spf=pass smtp.mailfrom=midirus.com; dkim=pass (2048-bit key) header.d=midirus.com header.i=@midirus.com header.b=kGP7Vq4z; arc=none smtp.client-ip=185.70.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=midirus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=midirus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=midirus.com header.i=@midirus.com header.b="kGP7Vq4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midirus.com;
	s=protonmail; t=1791723746; x=1791982946;
	bh=jFFoCybhYSPX/BI+IbSQmW6vIcs7I5hf9aL7OTcuohI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=kGP7Vq4zA4wpu8CHHz8VMavqUyBxr2AdH7H+rwNterNAKhVrpjdcYA5uDA/gSRkT/
	 zmdCutMNTk5bLNiiO0sEZfwDGFblBPy3gvSLHhBs7Z6fVjjtO6PIYYngQvt5ZjraEk
	 6FDgaSywU/du/NdQf5pImuhzUZJR9ogw45PEZIoZ16AMFsZr6lcgF4Cs8OablswwWC
	 cAu9sg+7dzyzqffxGmU51viRFlYwlU/zHc2gDpCeNeOEZCkazWqw5d8ee++0Hy9Hz/
	 QxKXbLqy9O+P0AMfm+8VhfEcqWXvQSvyHALKdqjerSpdrZaAGbMT9ALNYn7KInIT58
	 LBdNI13GK00HA==
Date: Sun, 11 Oct 2026 13:02:22 +0000
To: Takashi Iwai <tiwai@suse.de>, Miguel Ojeda <ojeda@kernel.org>
From: Tristan de Cacqueray <tristan@midirus.com>
Cc: linux-sound@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Tristan de Cacqueray <tristan@midirus.com>
Subject: [PATCH RFC 2/3] rust: snd: Add snd_rawmidi binding
Message-ID: <20261011-rust-snd-v1-2-7974ecdcd345@midirus.com>
In-Reply-To: <20261011-rust-snd-v1-0-7974ecdcd345@midirus.com>
References: <20261011-rust-snd-v1-0-7974ecdcd345@midirus.com>
Feedback-ID: 135030709:user:proton
X-Pm-Message-ID: 16c1aab6165789aa3c2f54df116d2dea1e907b49
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add minimal abstraction to create a snd_rawmidi along with
the input/output ops in Rust.

Signed-off-by: Tristan de Cacqueray <tristan@midirus.com>
---
 rust/bindings/bindings_helper.h  |   1 +
 rust/kernel/snd.rs               | 253 +++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 samples/rust/rust_midi_device.rs |  33 +++++++++++++
 3 files changed, 286 insertions(+), 1 deletion(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helpe=
r.h
index c624f073db04..71999651aebf 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -98,6 +98,7 @@
 #include <net/genetlink.h>
 #include <net/netlink.h>
 #include <sound/core.h>
+#include <sound/rawmidi.h>
 #include <trace/events/rust_sample.h>
=20
 /*
diff --git a/rust/kernel/snd.rs b/rust/kernel/snd.rs
index aaffe942b360..7285575c6257 100644
--- a/rust/kernel/snd.rs
+++ b/rust/kernel/snd.rs
@@ -7,11 +7,14 @@
 //!
 //! C header: [`include/sound/core.h`](srctree/include/sound/core.h)
=20
+use core::marker::PhantomData;
 use kernel::{
     bindings,
     device::Device,
-    error::{Result},
+    error::{to_result, Result},
     prelude::*,
+    sync::Arc,
+    types::ForeignOwnable,
 };
=20
 /// A sound card instance.
@@ -87,3 +90,251 @@ fn copy_to_c_buf(dest: &mut [ffi::c_char], src: &CStr) =
-> Result<()> {
 pub struct RegisteredSoundCard {
     _inner: SoundCard,
 }
+
+/// A rawmidi substream instance. Must not be shared outside of the RawMid=
iInput/Output operations.
+pub struct RawMidiSubstream {
+    ptr: *mut bindings::snd_rawmidi_substream,
+}
+
+impl RawMidiSubstream {
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is a valid pointer provided by t=
he ALSA core.
+    unsafe fn from_raw(ptr: *mut bindings::snd_rawmidi_substream) -> Self =
{
+        Self { ptr }
+    }
+
+    /// Copies data from hardware to the ALSA core input ring buffer.
+    ///
+    /// Returns the number of bytes successfully copied
+    pub fn receive(&self, buffer: &[u8]) -> Result<usize> {
+        let count: c_int =3D buffer.len().try_into().map_err(|_| EINVAL)?;
+        // SAFETY: `self.ptr` is valid and the buffer length matched the b=
uffer ptr.
+        let ret =3D unsafe { bindings::snd_rawmidi_receive(self.ptr, buffe=
r.as_ptr(), count) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(ret as usize)
+        }
+    }
+
+    /// Retrieves data from the ALSA core output ring buffer to be transmi=
tted to hardware.
+    ///
+    /// Returns the number of bytes successfully copied into `buffer`.
+    pub fn transmit(&self, buffer: &mut [u8]) -> Result<usize> {
+        let count: c_int =3D buffer.len().try_into().map_err(|_| EINVAL)?;
+        // SAFETY: `self.ptr` is valid between `open` and `close`.
+        // C writes at most `count` bytes into the `buffer`.
+        let ret =3D unsafe { bindings::snd_rawmidi_transmit(self.ptr, buff=
er.as_mut_ptr(), count) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(ret as usize)
+        }
+    }
+}
+
+/// Operations for a MIDI input stream.
+pub trait RawMidiInput: Send + Sync {
+    /// Call when the input substream is opened.
+    fn open(&self, _substream: &RawMidiSubstream) -> Result<()> {
+        Ok(())
+    }
+    /// Called when the input substream is closed.
+    fn close(&self, _substream: &RawMidiSubstream) -> Result<()> {
+        Ok(())
+    }
+    /// Called to start or stop reading input data.
+    fn trigger(&self, _substream: &RawMidiSubstream, _up: bool);
+}
+
+/// Operations for a MIDI output stream.
+pub trait RawMidiOutput: Send + Sync {
+    /// Called when the output substream is opened.
+    fn open(&self, _substream: &RawMidiSubstream) -> Result<()> {
+        Ok(())
+    }
+    /// Called when the output substream is closed.
+    fn close(&self, _substream: &RawMidiSubstream) -> Result<()> {
+        Ok(())
+    }
+    /// Called to start or stop transmitting output data.
+    fn trigger(&self, _substream: &RawMidiSubstream, _up: bool);
+}
+
+struct RawMidiOps<T>(PhantomData<T>);
+impl<T: 'static> RawMidiOps<T> {
+    /// # Safety
+    ///
+    /// rawmidi must contain Arc<T> in private_data.
+    unsafe extern "C" fn private_free_cb(rmidi: *mut bindings::snd_rawmidi=
) {
+        // SAFETY: paired with `into_foreign` in `new`.
+        drop::<Arc<T>>(unsafe { Arc::from_foreign((*rmidi).private_data) }=
);
+    }
+}
+
+impl<T: RawMidiInput + 'static> RawMidiOps<T> {
+    const INPUT: bindings::snd_rawmidi_ops =3D bindings::snd_rawmidi_ops {
+        open: Some(Self::open_input),
+        close: Some(Self::close_input),
+        trigger: Some(Self::trigger_input),
+        drain: None,
+    };
+
+    /// # SAFETY
+    ///
+    /// substream must contain Arc<T> in private_data.
+    unsafe extern "C" fn open_input(s: *mut bindings::snd_rawmidi_substrea=
m) -> c_int {
+        with_ctx_err::<T>(s, |dev, sub| T::open(dev, sub))
+    }
+
+    /// # SAFETY
+    ///
+    /// substream must contain Arc<T> in private_data.
+    unsafe extern "C" fn close_input(s: *mut bindings::snd_rawmidi_substre=
am) -> c_int {
+        with_ctx_err::<T>(s, |dev, sub| T::close(dev, sub))
+    }
+
+    /// # SAFETY
+    ///
+    /// substream must contain Arc<T> in private_data.
+    unsafe extern "C" fn trigger_input(s: *mut bindings::snd_rawmidi_subst=
ream, up: c_int) {
+        with_ctx::<T, _>(s, |dev, sub| T::trigger(dev, sub, up !=3D 0))
+    }
+}
+
+impl<T: RawMidiOutput + 'static> RawMidiOps<T> {
+    const OUTPUT: bindings::snd_rawmidi_ops =3D bindings::snd_rawmidi_ops =
{
+        open: Some(Self::open_output),
+        close: Some(Self::close_output),
+        trigger: Some(Self::trigger_output),
+        drain: None,
+    };
+
+    /// # SAFETY
+    ///
+    /// substream must contain Arc<T> in private_data.
+    unsafe extern "C" fn open_output(s: *mut bindings::snd_rawmidi_substre=
am) -> c_int {
+        with_ctx_err::<T>(s, |dev, sub| T::open(dev, sub))
+    }
+
+    /// # SAFETY
+    ///
+    /// substream must contain Arc<T> in private_data.
+    unsafe extern "C" fn close_output(s: *mut bindings::snd_rawmidi_substr=
eam) -> c_int {
+        with_ctx_err::<T>(s, |dev, sub| T::close(dev, sub))
+    }
+
+    /// # SAFETY
+    ///
+    /// substream must contain Arc<T> in private_data.
+    unsafe extern "C" fn trigger_output(s: *mut bindings::snd_rawmidi_subs=
tream, up: c_int) {
+        with_ctx::<T, _>(s, |dev, sub| T::trigger(dev, sub, up !=3D 0))
+    }
+}
+
+// Helper for C FFI
+fn with_ctx_err<T: 'static>(
+    s: *mut bindings::snd_rawmidi_substream,
+    f: impl FnOnce(&T, &RawMidiSubstream) -> Result,
+) -> c_int {
+    with_ctx::<T, _>(s, |dev, sub| match f(dev, sub) {
+        Ok(()) =3D> 0,
+        Err(e) =3D> e.to_errno(),
+    })
+}
+
+// Helper for C FFI
+fn with_ctx<T: 'static, R>(
+    s: *mut bindings::snd_rawmidi_substream,
+    f: impl FnOnce(&T, &RawMidiSubstream) -> R,
+) -> R {
+    // SAFETY: caller contract (see callbacks): `s` and `rmidi` are valid,
+    // `private_data` is a live foreign-owned `Arc<T>`.
+    let data =3D unsafe { <Arc<T> as ForeignOwnable>::borrow((*(*s).rmidi)=
.private_data) };
+    // SAFETY: substream is valid.
+    let substream =3D unsafe { RawMidiSubstream::from_raw(s) };
+    f(&data, &substream)
+}
+
+/// A rawmidi instance.
+///
+/// TODO: track lifetime with the parent sndcard?
+pub struct RawMidi {
+    ptr: *mut bindings::snd_rawmidi,
+}
+
+impl RawMidi {
+    /// Creates a new rawmidi instance bound to a parent soundcard.
+    ///
+    /// Note: this presently requires both a Input and Output implementati=
on
+    /// even if the input_count or output_count is 0.
+    /// TODO: enforce correctness in the API.
+    pub fn new<T: RawMidiInput + RawMidiOutput + 'static>(
+        card: &SoundCard,
+        id: &CStr,
+        device_idx: u16,
+        output_count: u16,
+        input_count: u16,
+        data: Arc<T>,
+    ) -> Result<Self> {
+        let mut rmidi_ptr: *mut bindings::snd_rawmidi =3D core::ptr::null_=
mut();
+
+        // SAFETY: `card.ptr` is a valid soundcard allocation.
+        // id is converted to match the C API.
+        // The bindings expect a mut but snd_rawmidi_init just uses strcpy=
.
+        to_result(unsafe {
+            bindings::snd_rawmidi_new(
+                card.ptr,
+                id.as_char_ptr().cast_mut(),
+                device_idx.into(),
+                output_count.into(),
+                input_count.into(),
+                &mut rmidi_ptr,
+            )
+        })?;
+
+        // SAFETY: `rmidi_ptr` is validated by the return check above.
+        let rmidi =3D unsafe { &mut *rmidi_ptr };
+
+        rmidi.private_data =3D Arc::into_foreign(data).cast();
+        // Note: private_free will drop the private_data from the foreign =
ptr.
+        // need to make sure it is freed in the event the cb is not called=
!
+        rmidi.private_free =3D Some(RawMidiOps::<T>::private_free_cb);
+
+        if input_count > 0 {
+            rmidi.info_flags |=3D bindings::SNDRV_RAWMIDI_INFO_INPUT;
+            // SAFETY: rmidi_ptr is validated above.
+            unsafe {
+                bindings::snd_rawmidi_set_ops(
+                    rmidi_ptr,
+                    bindings::SNDRV_RAWMIDI_STREAM_INPUT as i32,
+                    &RawMidiOps::<T>::INPUT,
+                )
+            };
+        }
+        if output_count > 0 {
+            rmidi.info_flags |=3D bindings::SNDRV_RAWMIDI_INFO_OUTPUT;
+            // SAFETY: rmidi_ptr is validated above.
+            unsafe {
+                bindings::snd_rawmidi_set_ops(
+                    rmidi_ptr,
+                    bindings::SNDRV_RAWMIDI_STREAM_OUTPUT as i32,
+                    &RawMidiOps::<T>::OUTPUT,
+                );
+            }
+        }
+        if input_count > 0 && output_count > 0 {
+            rmidi.info_flags |=3D bindings::SNDRV_RAWMIDI_INFO_DUPLEX;
+        }
+
+        Ok(Self { ptr: rmidi_ptr })
+    }
+
+    /// Set the rawmidi device name.
+    pub fn set_name(&mut self, name: &CStr) -> Result<()> {
+        // SAFETY: `self.ptr` is valid between `new` and card free.
+        let mut rmidi =3D unsafe { *self.ptr };
+        copy_to_c_buf(&mut rmidi.name, name)
+    }
+}
diff --git a/samples/rust/rust_midi_device.rs b/samples/rust/rust_midi_devi=
ce.rs
index 5561a0437b59..1465ba9544d6 100644
--- a/samples/rust/rust_midi_device.rs
+++ b/samples/rust/rust_midi_device.rs
@@ -1,15 +1,44 @@
 // SPDX-License-Identifier: GPL-2.0
=20
 //! Rust MIDI minimal sample.
+//!
+//! This driver demonstrates usage of the kernel::snd subsystem:
+//! - Create a rawmidi device
+//! - Print received event
=20
 use kernel::{
     faux,
     prelude::*,
     snd,
+    sync::Arc,
 };
=20
+struct RustMidiDevice;
+
+impl snd::RawMidiInput for RustMidiDevice {
+    fn trigger(&self, _substream: &snd::RawMidiSubstream, up: bool) {
+        pr_debug!("input trigger up:{up}!\n");
+    }
+}
+
+// Implement midi output ops: just display transmitted event.
+impl snd::RawMidiOutput for RustMidiDevice {
+    fn trigger(&self, substream: &snd::RawMidiSubstream, up: bool) {
+        pr_debug!("output trigger up:{up}!\n");
+        if up {
+            let mut buf =3D [0; 64];
+            match substream.transmit(&mut buf) {
+                Ok(count) =3D> pr_info!("transmit got: {:?}\n", buf[..coun=
t]),
+                Err(err) =3D> pr_err!("transmit failed: {err:?}"),
+            };
+        }
+    }
+}
+
 impl kernel::Module for RustMidiDeviceModule {
     fn init(_module: &'static ThisModule) -> Result<Self> {
+        let state =3D Arc::new(RustMidiDevice, GFP_KERNEL)?;
+
         pr_debug!("Initializing sound card\n");
         let reg =3D faux::Registration::new(c"rust-midi-device", None)?;
         let fdev =3D reg.as_ref();
@@ -21,6 +50,10 @@ fn init(_module: &'static ThisModule) -> Result<Self> {
         card.set_driver(c"rust-midi")?;
         card.set_shortname(c"RustMIDI")?;
=20
+        pr_debug!("Initializing rawmidi card\n");
+        let mut rmidi =3D snd::RawMidi::new(&card, c"RustRMIDI", 0, 1, 1, =
state.clone())?;
+        rmidi.set_name(c"RustRMIDI")?;
+
         // Register the sndcard to ALSA.
         card.register()?;
=20

--=20
2.56.0


