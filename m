Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B71372EE2;
	Sun, 11 Oct 2026 13:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791723765; cv=none; b=jZVdQ65V/MGoXjZziSYQLYYvjJESwvE8ZtFXsqeReBAdoKFB1qvYbSQpVBkfDpzteBG48tI1KXofK/OR4pn821pVeGmNcIUk3hczXfaH87tx4oGBG2MnF5H2BkfVnA+qOUes5ZJ8Bg22KXcYLAGamy8gFXji6nsMWT0syd+QgG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791723765; c=relaxed/simple;
	bh=P+n86j8okCOeznEWp9KVywaGpyMGP8VFE2CnqdR5LA0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NajzsnWPTjf22edg93zz7VojBGzVyTVXZZB31zzs2Ra4c6tC5JsxBrtOBpvCCcBNTN+VEWSUHkyN8kGkfVfyiBCA2z+4UWbxA8UQO1hakM/h8OdX7TLbzfZ4RfVf2rSWG/3gcS0zuSwZhUR8xAfqB0m+P+8zpyH4B8tUUz+cF7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=midirus.com; spf=pass smtp.mailfrom=midirus.com; dkim=pass (2048-bit key) header.d=midirus.com header.i=@midirus.com header.b=BKk9189V; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=midirus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=midirus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=midirus.com header.i=@midirus.com header.b="BKk9189V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midirus.com;
	s=protonmail; t=1791723752; x=1791982952;
	bh=jfr5f/DSIPfDtGCicU0pkzS6ZTa+0WjCsLoiSuHGr4I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BKk9189V7bGgJoaPTK/4FOzA6K9fR/FiuewRGb4+K6+67IODIiA89tD9+pcn0+M02
	 TcPKYnX3Jb9N4Z8cupndfaXtg52g/TBXp2zl4RocLQSvS/JtKcqp+/DpYYsZW133rJ
	 5SYgJIDEmhF3UMZUKAEkrqdfMBoWQanxmJC3zaNdXH5XRQIO05ouSjkHeg5MtPgpYb
	 AzT4YPM/SR+YH6mth2XHCy3mzeDk5dcov8Ym6EovyYOSiAjejFMvVHWnWznLbs/0aH
	 Ng3AT36lTQ3JpIxbgcryeMcoeEl/c91/Mn3rFoH+kZdbm4NIerimHLWvI/cAJT+4nL
	 dUn+Le6QhkrPA==
Date: Sun, 11 Oct 2026 13:02:27 +0000
To: Takashi Iwai <tiwai@suse.de>, Miguel Ojeda <ojeda@kernel.org>
From: Tristan de Cacqueray <tristan@midirus.com>
Cc: linux-sound@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Tristan de Cacqueray <tristan@midirus.com>
Subject: [PATCH RFC 3/3] rust: snd: Add active rawmidi_substream helper
Message-ID: <20261011-rust-snd-v1-3-7974ecdcd345@midirus.com>
In-Reply-To: <20261011-rust-snd-v1-0-7974ecdcd345@midirus.com>
References: <20261011-rust-snd-v1-0-7974ecdcd345@midirus.com>
Feedback-ID: 135030709:user:proton
X-Pm-Message-ID: 309dd57411b62091ba18f1879f2525e824530322
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add helper to share the substream across execution contexts in Rust.

Signed-off-by: Tristan de Cacqueray <tristan@midirus.com>
---
 rust/kernel/snd.rs               | 67 ++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++--
 samples/rust/rust_midi_device.rs | 93 ++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 154 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/snd.rs b/rust/kernel/snd.rs
index 7285575c6257..d9df5af155b9 100644
--- a/rust/kernel/snd.rs
+++ b/rust/kernel/snd.rs
@@ -7,13 +7,13 @@
 //!
 //! C header: [`include/sound/core.h`](srctree/include/sound/core.h)
=20
-use core::marker::PhantomData;
+use core::{marker::PhantomData, ptr::NonNull};
 use kernel::{
     bindings,
     device::Device,
     error::{to_result, Result},
     prelude::*,
-    sync::Arc,
+    sync::{Arc, SpinLockIrq},
     types::ForeignOwnable,
 };
=20
@@ -338,3 +338,66 @@ pub fn set_name(&mut self, name: &CStr) -> Result<()> =
{
         copy_to_c_buf(&mut rmidi.name, name)
     }
 }
+
+/// A thread-safe helper for sharing ALSA substream across execution conte=
xts.
+///
+/// # Safety
+///
+/// Implementations MUST clear any [`ActiveMidiSubstream`] before `close` =
returns.
+/// TODO: enforce in framework.
+#[pin_data(PinnedDrop)]
+pub struct ActiveMidiSubstream {
+    #[pin]
+    ptr: SpinLockIrq<Option<NonNull<bindings::snd_rawmidi_substream>>>,
+}
+
+impl ActiveMidiSubstream {
+    /// Creates a new initialiser for an empty substream.
+    pub fn new() -> impl PinInit<Self> {
+        pin_init!(Self {
+            ptr <- kernel::sync::new_spinlock_irq!(None),
+        })
+    }
+
+    /// Stores the given substream reference as the active target.
+    pub fn store(&self, substream: &RawMidiSubstream) {
+        let mut guard =3D self.ptr.lock();
+        *guard =3D NonNull::new(substream.ptr);
+    }
+
+    /// Clears the tracked substream reference.
+    pub fn clear(&self) {
+        let mut guard =3D self.ptr.lock();
+        *guard =3D None;
+    }
+
+    /// Executes a closure while holding the spinlock with a temporary ref=
erence
+    /// to the active substream, if present.
+    ///
+    /// Returns `None` if no stream is currently active.
+    pub fn with_active<F, R>(&self, f: F) -> Option<R>
+    where
+        F: FnOnce(&RawMidiSubstream) -> R,
+    {
+        let guard =3D self.ptr.lock();
+        let nn_ptr =3D (*guard)?;
+        // SAFETY: The raw ptr can only be stored using a valid rawmidi_su=
bstream.
+        let safe_substream =3D unsafe { RawMidiSubstream::from_raw(nn_ptr.=
as_ptr()) };
+
+        Some(f(&safe_substream))
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for ActiveMidiSubstream {
+    fn drop(self: Pin<&mut Self>) {
+        self.clear()
+    }
+}
+
+// SAFETY: snd_rawmidi_substream is accessed only under the SpinLockIrq an=
d it is
+// only ever valid between the ALSA `open` and `close` callbacks, during
+// which the ALSA core guarantees the substream is alive (see the type doc=
s).
+unsafe impl Send for ActiveMidiSubstream {}
+// SAFETY: snd_rawmidi_substream is accessed only under the SpinLockIrq. S=
ee above.
+unsafe impl Sync for ActiveMidiSubstream {}
diff --git a/samples/rust/rust_midi_device.rs b/samples/rust/rust_midi_devi=
ce.rs
index 1465ba9544d6..9c6a03baa42e 100644
--- a/samples/rust/rust_midi_device.rs
+++ b/samples/rust/rust_midi_device.rs
@@ -5,19 +5,88 @@
 //! This driver demonstrates usage of the kernel::snd subsystem:
 //! - Create a rawmidi device
 //! - Print received event
+//! - Periodically send note events
+//!
+//! Its goal is to simulate a real device driver usage.
=20
+use core::sync::atomic::{AtomicBool, Ordering};
 use kernel::{
     faux,
     prelude::*,
     snd,
     sync::Arc,
+    workqueue,
+    workqueue::{DelayedWork, WorkItem},
 };
=20
-struct RustMidiDevice;
+// The internal state data to perform a hardware simulation.
+#[pin_data]
+struct RustMidiDevice {
+    // toggle sent note on and off.
+    note_playing: AtomicBool,
+    #[pin]
+    // substream to send note.
+    input_substream: snd::ActiveMidiSubstream,
+    #[pin]
+    // delayed work to send note periodically.
+    timer_work: DelayedWork<RustMidiDevice>,
+}
+
+kernel::impl_has_delayed_work! {
+    impl HasDelayedWork<Self> for RustMidiDevice { self.timer_work }
+}
+
+impl RustMidiDevice {
+    // Initialize the simulation internal state.
+    fn new() -> Result<Arc<Self>> {
+        Arc::pin_init(
+            pin_init!(RustMidiDevice {
+                note_playing: AtomicBool::new(false),
+                input_substream <- snd::ActiveMidiSubstream::new(),
+                timer_work <- kernel::new_delayed_work!("RustMidiDevice::t=
imer_work"),
+            }),
+            GFP_KERNEL,
+        )
+    }
+}
+
+impl WorkItem for RustMidiDevice {
+    type Pointer =3D Arc<Self>;
+
+    // Send a note event, as-if coming from external interrupt.
+    fn run(this: Self::Pointer) {
+        this.input_substream.with_active(|substream| {
+            let playing =3D this.note_playing.fetch_not(Ordering::Relaxed)=
;
+            let velocity =3D if playing { 0x0 } else { 0x7F };
+            let event =3D [0x90, 0x42, velocity];
+            match substream.receive(&event) {
+                Ok(count) =3D> pr_info!("worker submitted {} ({:?})", coun=
t, event),
+                Err(err) =3D> pr_err!("worker submit failed: {:?}", err),
+            };
+        });
+        pr_debug!("Periodic worker completed!");
+
+        // Re-enqueue continuously every 500 jiffies
+        let _ =3D workqueue::system().enqueue_delayed(this, 500);
+    }
+}
=20
+// Implement midi input ops: store the substream for external context.
 impl snd::RawMidiInput for RustMidiDevice {
-    fn trigger(&self, _substream: &snd::RawMidiSubstream, up: bool) {
+    fn close(&self, _substream: &snd::RawMidiSubstream) -> Result<()> {
+        pr_debug!("input close!\n");
+        // note: maybe input_substream should be managed by the binding,
+        // otherwise the user may forget to call clear when the device is =
closed.
+        self.input_substream.clear();
+        Ok(())
+    }
+    fn trigger(&self, substream: &snd::RawMidiSubstream, up: bool) {
         pr_debug!("input trigger up:{up}!\n");
+        if up {
+            self.input_substream.store(substream);
+        } else {
+            self.input_substream.clear();
+        }
     }
 }
=20
@@ -37,7 +106,7 @@ fn trigger(&self, substream: &snd::RawMidiSubstream, up:=
 bool) {
=20
 impl kernel::Module for RustMidiDeviceModule {
     fn init(_module: &'static ThisModule) -> Result<Self> {
-        let state =3D Arc::new(RustMidiDevice, GFP_KERNEL)?;
+        let state =3D RustMidiDevice::new()?;
=20
         pr_debug!("Initializing sound card\n");
         let reg =3D faux::Registration::new(c"rust-midi-device", None)?;
@@ -57,14 +126,30 @@ fn init(_module: &'static ThisModule) -> Result<Self> =
{
         // Register the sndcard to ALSA.
         card.register()?;
=20
-        Ok(Self { _reg: reg })
+        pr_debug!("Kick off the background worker\n");
+        let _ =3D workqueue::system().enqueue_delayed(state.clone(), 0);
+
+        Ok(Self { _reg: reg, state })
     }
 }
=20
 struct RustMidiDeviceModule {
+    state: Arc<RustMidiDevice>,
     _reg: faux::Registration,
 }
=20
+impl Drop for RustMidiDeviceModule {
+    fn drop(&mut self) {
+        // Safety: the timer_work is a valid delayed work. It seems necess=
ary to cancel the work
+        // to avoid a panic when unloading the module. This is just for si=
mulation purpose.
+        // TODO: add a safe cancel helper to kernel::workqueue and remove =
unsafe bindings here
+        unsafe {
+            let dwork_ptr =3D core::ptr::from_ref(&self.state.timer_work) =
as *mut _;
+            kernel::bindings::cancel_delayed_work_sync(dwork_ptr);
+        }
+    }
+}
+
 module! {
     type: RustMidiDeviceModule,
     name: "rust_midi_device",

--=20
2.56.0


