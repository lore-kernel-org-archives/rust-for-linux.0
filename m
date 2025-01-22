Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195811CEAA3;
	Wed, 22 Jan 2025 16:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564524; cv=pass; b=f2bJnxxyJHj/fPcz7M/StGyuch39Y+RTCJdoGY4+Wzq6hk2K7zCXUJnXlGrQzBr2vTzUcJaSJQ9IShzGV/GdbtYNhE9jr/uKhlWg+HnuR5i1u1kvRaD/p62ainBzQVOok3Yt/kE99uvUaWjRg9RLgAen3hSe/2v4QEfllSg1F5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564524; c=relaxed/simple;
	bh=3c227opxC+SjuNqiQUXHUKCX4Ij9/UC9jII3UR99iRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n2PSMK21imQ/ZS/n3+isKaBUWu0mn9td1UV3RMEIIUgp7jCwF67fs5f87vUjbXMjZSJju55IKA8U5Kq4SlF9gQlN7uiQlFecMSjRctohcd1BGxv6kDlMwZxi6Zt0Lw8F10Nq8yNw/skc/1X9D2ZlHpG//YBGzatSyXfjPannm2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=NrnLMiE9; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="NrnLMiE9"
ARC-Seal: i=1; a=rsa-sha256; t=1737564501; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lQYNNbJ4TArPsL9uahjpypaOpRZPdRW8h4F/r3Lm4gd+X8SK7/WmXstPy0g5EevpOjAkLw6/jjFFL5gB/Vdi3llNCkbYdg2E2W4f5jvIleID72/wVSrB+xB+RUlgB/17TjU9CpjqMR54xPuheHtafn9ww1axR+NK1orwJGKrJ3I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737564501; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MQT4nET+xt2MH+983Hj64OHlcMZCDbXJi4QLbAWqPMI=; 
	b=nvk4WHIP/YloXXSetTJ/r0eW6Ib4Oylqxuaibd6nvbSKnC8DkbrAqyfEp/Vc4Zj/x16QGr968LCj2eBhmzbuw8KTvZ6i2D/tzGVXmv8WzNAZZUjxhDujNU1xuLx8bnOp81kRDM31rgTIabL6DpIIb3pNmkFfS2XpwhhFcglJl/Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737564501;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MQT4nET+xt2MH+983Hj64OHlcMZCDbXJi4QLbAWqPMI=;
	b=NrnLMiE98PudqI0JPV8NfLF0DMh+oVYkJfigdOSD0PdpUmAQhorCGQKGXMVJ8FLS
	tAlvyHPOvzT8KZHJcrHMx8QYmUcWnZrSJMJ/7V4uktiB3wRuVh8m6q9o1t78cqKunxE
	s4ky0UtxCT88FLuTRB2otMRsUWE7fwdJk+jIGB50=
Received: by mx.zohomail.com with SMTPS id 1737564500060344.99387687864635;
	Wed, 22 Jan 2025 08:48:20 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	tmgross@umich.edu
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>
Subject: [PATCH v2] rust: irq: add support for request_irq()
Date: Wed, 22 Jan 2025 13:39:30 -0300
Message-ID: <20250122163932.46697-1-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add support for registering IRQ handlers in Rust.

IRQ handlers are extensively used in drivers when some peripheral wants to
obtain the CPU attention. Registering a handler will make the system invoke the
passed-in function whenever the chosen IRQ line is triggered.

Both regular and threaded IRQ handlers are supported through a Handler (or
ThreadedHandler) trait that is meant to be implemented by a type that:

a) provides a function to be run by the system when the IRQ fires and,

b) holds the shared data (i.e.: `T`) between process and IRQ contexts.

The requirement that T is Sync derives from the fact that handlers might run
concurrently with other processes executing the same driver, creating the
potential for data races.

Ideally, some interior mutability must be in place if T is to be mutated. This
should usually be done through the in-flight SpinLockIrq type.

Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---

Changes from v1:

- Added Co-developed-by tag to account for the work that Alice did in order to
figure out how to do this without Opaque<T> (Thanks!)
- Removed Opaque<T> in favor of plain T
- Fixed the examples
- Made sure that the invariants sections are the last entry in the docs
- Switched to slot.cast() where applicable,
- Mentioned in the safety comments that we require that T: Sync,
- Removed ThreadedFnReturn in favor of IrqReturn,
- Improved the commit message

Link to v1: https://lore.kernel.org/rust-for-linux/20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com/


---
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/helpers.c          |   1 +
 rust/helpers/irq.c              |   9 +
 rust/kernel/irq.rs              |   6 +
 rust/kernel/irq/request.rs      | 517 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 6 files changed, 535 insertions(+)
 create mode 100644 rust/helpers/irq.c
 create mode 100644 rust/kernel/irq.rs
 create mode 100644 rust/kernel/irq/request.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 5c4dfe22f41a..0331c6273def 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -15,6 +15,7 @@
 #include <linux/ethtool.h>
 #include <linux/file.h>
 #include <linux/firmware.h>
+#include <linux/interrupt.h>
 #include <linux/fs.h>
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index dcf827a61b52..bfc499d7f4c1 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -13,6 +13,7 @@
 #include "build_bug.c"
 #include "cred.c"
 #include "err.c"
+#include "irq.c"
 #include "fs.c"
 #include "jump_label.c"
 #include "kunit.c"
diff --git a/rust/helpers/irq.c b/rust/helpers/irq.c
new file mode 100644
index 000000000000..1faca428e2c0
--- /dev/null
+++ b/rust/helpers/irq.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/interrupt.h>
+
+int rust_helper_request_irq(unsigned int irq, irq_handler_t handler,
+			    unsigned long flags, const char *name, void *dev)
+{
+	return request_irq(irq, handler, flags, name, dev);
+}
diff --git a/rust/kernel/irq.rs b/rust/kernel/irq.rs
new file mode 100644
index 000000000000..3ab83c5bdb83
--- /dev/null
+++ b/rust/kernel/irq.rs
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! IRQ abstractions
+
+/// IRQ allocation and handling
+pub mod request;
diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
new file mode 100644
index 000000000000..61e7d4a8f555
--- /dev/null
+++ b/rust/kernel/irq/request.rs
@@ -0,0 +1,517 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright 2025 Collabora ltd.
+
+//! IRQ allocation and handling
+
+use core::marker::PhantomPinned;
+use core::ptr::addr_of_mut;
+
+use init::pin_init_from_closure;
+
+use crate::error::to_result;
+use crate::prelude::*;
+use crate::str::CStr;
+
+/// Flags to be used when registering IRQ handlers.
+///
+/// They can be combined with the operators `|`, `&`, and `!`.
+///
+/// Values can be used from the [`flags`] module.
+#[derive(Clone, Copy)]
+pub struct Flags(u64);
+
+impl core::ops::BitOr for Flags {
+    type Output = Self;
+    fn bitor(self, rhs: Self) -> Self::Output {
+        Self(self.0 | rhs.0)
+    }
+}
+
+impl core::ops::BitAnd for Flags {
+    type Output = Self;
+    fn bitand(self, rhs: Self) -> Self::Output {
+        Self(self.0 & rhs.0)
+    }
+}
+
+impl core::ops::Not for Flags {
+    type Output = Self;
+    fn not(self) -> Self::Output {
+        Self(!self.0)
+    }
+}
+
+/// The flags that can be used when registering an IRQ handler.
+pub mod flags {
+    use super::Flags;
+
+    use crate::bindings;
+
+    /// Use the interrupt line as already configured.
+    pub const TRIGGER_NONE: Flags = Flags(bindings::IRQF_TRIGGER_NONE as _);
+
+    /// The interrupt is triggered when the signal goes from low to high.
+    pub const TRIGGER_RISING: Flags = Flags(bindings::IRQF_TRIGGER_RISING as _);
+
+    /// The interrupt is triggered when the signal goes from high to low.
+    pub const TRIGGER_FALLING: Flags = Flags(bindings::IRQF_TRIGGER_FALLING as _);
+
+    /// The interrupt is triggered while the signal is held high.
+    pub const TRIGGER_HIGH: Flags = Flags(bindings::IRQF_TRIGGER_HIGH as _);
+
+    /// The interrupt is triggered while the signal is held low.
+    pub const TRIGGER_LOW: Flags = Flags(bindings::IRQF_TRIGGER_LOW as _);
+
+    /// Allow sharing the irq among several devices.
+    pub const SHARED: Flags = Flags(bindings::IRQF_SHARED as _);
+
+    /// Set by callers when they expect sharing mismatches to occur.
+    pub const PROBE_SHARED: Flags = Flags(bindings::IRQF_PROBE_SHARED as _);
+
+    /// Flag to mark this interrupt as timer interrupt.
+    pub const TIMER: Flags = Flags(bindings::IRQF_TIMER as _);
+
+    /// Interrupt is per cpu.
+    pub const PERCPU: Flags = Flags(bindings::IRQF_PERCPU as _);
+
+    /// Flag to exclude this interrupt from irq balancing.
+    pub const NOBALANCING: Flags = Flags(bindings::IRQF_NOBALANCING as _);
+
+    /// Interrupt is used for polling (only the interrupt that is registered
+    /// first in a shared interrupt is considered for performance reasons).
+    pub const IRQPOLL: Flags = Flags(bindings::IRQF_IRQPOLL as _);
+
+    /// Interrupt is not reenabled after the hardirq handler finished. Used by
+    /// threaded interrupts which need to keep the irq line disabled until the
+    /// threaded handler has been run.
+    pub const ONESHOT: Flags = Flags(bindings::IRQF_ONESHOT as _);
+
+    /// Do not disable this IRQ during suspend. Does not guarantee that this
+    /// interrupt will wake the system from a suspended state.
+    pub const NO_SUSPEND: Flags = Flags(bindings::IRQF_NO_SUSPEND as _);
+
+    /// Force enable it on resume even if [`NO_SUSPEND`] is set.
+    pub const FORCE_RESUME: Flags = Flags(bindings::IRQF_FORCE_RESUME as _);
+
+    /// Interrupt cannot be threaded.
+    pub const NO_THREAD: Flags = Flags(bindings::IRQF_NO_THREAD as _);
+
+    /// Resume IRQ early during syscore instead of at device resume time.
+    pub const EARLY_RESUME: Flags = Flags(bindings::IRQF_EARLY_RESUME as _);
+
+    /// If the IRQ is shared with a NO_SUSPEND user, execute this interrupt
+    /// handler after suspending interrupts. For system wakeup devices users
+    /// need to implement wakeup detection in their interrupt handlers.
+    pub const COND_SUSPEND: Flags = Flags(bindings::IRQF_COND_SUSPEND as _);
+
+    /// Don't enable IRQ or NMI automatically when users request it. Users will
+    /// enable it explicitly by `enable_irq` or `enable_nmi` later.
+    pub const NO_AUTOEN: Flags = Flags(bindings::IRQF_NO_AUTOEN as _);
+
+    /// Exclude from runnaway detection for IPI and similar handlers, depends on
+    /// `PERCPU`.
+    pub const NO_DEBUG: Flags = Flags(bindings::IRQF_NO_DEBUG as _);
+}
+
+/// The value that can be returned from an IrqHandler or a ThreadedIrqHandler.
+pub enum IrqReturn {
+    /// The interrupt was not from this device or was not handled.
+    None = bindings::irqreturn_IRQ_NONE as _,
+
+    /// The interrupt was handled by this device.
+    Handled = bindings::irqreturn_IRQ_HANDLED as _,
+}
+
+/// Callbacks for an IRQ handler.
+pub trait Handler: Sync {
+    /// The actual handler function. As usual, sleeps are not allowed in IRQ
+    /// context.
+    fn handle_irq(&self) -> IrqReturn;
+}
+
+/// A registration of an IRQ handler for a given IRQ line.
+///
+/// # Examples
+///
+/// The following is an example of using `Registration`:
+///
+/// ```
+/// use kernel::prelude::*;
+/// use kernel::irq::request::flags;
+/// use kernel::irq::request::Registration;
+/// use kernel::irq::request::IrqReturn;
+/// use kernel::sync::Arc;
+/// use kernel::sync::SpinLock;
+/// use kernel::c_str;
+/// use kernel::alloc::flags::GFP_KERNEL;
+///
+/// // Declare a struct that will be passed in when the interrupt fires. The u32
+/// // merely serves as an example of some internal data.
+/// struct Data(SpinLock<u32>);
+///
+/// // [`handle_irq`] takes &self. This example illustrates interior
+/// // mutability can be used when share the data between process context and IRQ
+/// // context.
+/// //
+/// // Ideally, this example would be using a version of SpinLock that is aware
+/// // of `spin_lock_irqsave` and `spin_lock_irqrestore`, but that is not yet
+/// // implemented.
+///
+/// type Handler = Data;
+///
+/// impl kernel::irq::request::Handler for Handler {
+///     // This is executing in IRQ context in some CPU. Other CPUs can still
+///     // try to access to data.
+///     fn handle_irq(&self) -> IrqReturn {
+///         // We now have exclusive access to the data by locking the SpinLock.
+///         let mut data = self.0.lock();
+///         *data += 1;
+///
+///         IrqReturn::Handled
+///     }
+/// }
+///
+/// // This is running in process context.
+/// fn register_irq(irq: u32, handler: Handler) -> Result<Arc<Registration<Handler>>> {
+///     let registration = Registration::register(irq, flags::SHARED, c_str!("my-device"), handler);
+///
+///     // You can have as many references to the registration as you want, so
+///     // multiple parts of the driver can access it.
+///     let registration = Arc::pin_init(registration, GFP_KERNEL)?;
+///
+///     // The handler may be called immediately after the function above
+///     // returns, possibly in a different CPU.
+///
+///     {
+///         // The data can be accessed from the process context too.
+///         let mut data = registration.handler().0.lock();
+///         *data = 42;
+///     }
+///
+///     Ok(registration)
+/// }
+///
+/// # Ok::<(), Error>(())
+///```
+///
+/// # Invariants
+///
+/// * We own an irq handler using `&self` as its private data.
+///
+#[pin_data(PinnedDrop)]
+pub struct Registration<T: Handler> {
+    irq: u32,
+    #[pin]
+    handler: T,
+    #[pin]
+    /// Pinned because we need address stability so that we can pass a pointer
+    /// to the callback.
+    _pin: PhantomPinned,
+}
+
+impl<T: Handler> Registration<T> {
+    /// Registers the IRQ handler with the system for the given IRQ number. The
+    /// handler must be able to be called as soon as this function returns.
+    pub fn register(
+        irq: u32,
+        flags: Flags,
+        name: &'static CStr,
+        handler: T,
+    ) -> impl PinInit<Self, Error> {
+        let closure = move |slot: *mut Self| {
+            // SAFETY: The slot passed to pin initializer is valid for writing.
+            unsafe {
+                slot.write(Self {
+                    irq,
+                    handler,
+                    _pin: PhantomPinned,
+                })
+            };
+
+            // SAFETY:
+            // - The callbacks are valid for use with request_irq.
+            // - If this succeeds, the slot is guaranteed to be valid until the
+            // destructor of Self runs, which will deregister the callbacks
+            // before the memory location becomes invalid.
+            let res = to_result(unsafe {
+                bindings::request_irq(
+                    irq,
+                    Some(handle_irq_callback::<T>),
+                    flags.0,
+                    name.as_char_ptr(),
+                    &*slot as *const _ as *mut core::ffi::c_void,
+                )
+            });
+
+            if res.is_err() {
+                // SAFETY: We are returning an error, so we can destroy the slot.
+                unsafe { core::ptr::drop_in_place(addr_of_mut!((*slot).handler)) };
+            }
+
+            res
+        };
+
+        // SAFETY:
+        // - if this returns Ok, then every field of `slot` is fully
+        // initialized.
+        // - if this returns an error, then the slot does not need to remain
+        // valid.
+        unsafe { pin_init_from_closure(closure) }
+    }
+
+    /// Returns a reference to the handler that was registered with the system.
+    pub fn handler(&self) -> &T {
+        // SAFETY: `handler` is initialized in `register`, and we require that
+        // T: Sync.
+        &self.handler
+    }
+}
+
+#[pinned_drop]
+impl<T: Handler> PinnedDrop for Registration<T> {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY:
+        // - `self.irq` is the same as the one passed to `reques_irq`.
+        // -  `&self` was passed to `request_irq` as the cookie. It is
+        // guaranteed to be unique by the type system, since each call to
+        // `register` will return a different instance of `Registration`.
+        //
+        // Notice that this will block until all handlers finish executing,
+        // i.e.: at no point will &self be invalid while the handler is running.
+        unsafe { bindings::free_irq(self.irq, &*self as *const Self as *mut core::ffi::c_void) };
+    }
+}
+
+/// The value that can be returned from `ThreadedHandler::handle_irq`.
+pub enum ThreadedIrqReturn {
+    /// The interrupt was not from this device or was not handled.
+    None = bindings::irqreturn_IRQ_NONE as _,
+
+    /// The interrupt was handled by this device.
+    Handled = bindings::irqreturn_IRQ_HANDLED as _,
+
+    /// The handler wants the handler thread to wake up.
+    WakeThread = bindings::irqreturn_IRQ_WAKE_THREAD as _,
+}
+
+/// Callbacks for a threaded IRQ handler.
+pub trait ThreadedHandler: Sync {
+    /// The actual handler function. As usual, sleeps are not allowed in IRQ
+    /// context.
+    fn handle_irq(&self) -> ThreadedIrqReturn;
+
+    /// The threaded handler function. This function is called from the irq
+    /// handler thread, which is automatically created by the system.
+    fn thread_fn(&self) -> IrqReturn;
+}
+
+/// A registration of a threaded IRQ handler for a given IRQ line.
+///
+/// Two callbacks are required: one to handle the IRQ, and one to handle any
+/// other work in a separate thread.
+///
+/// The thread handler is only called if the IRQ handler returns `WakeThread`.
+///
+/// # Examples
+///
+/// The following is an example of using `ThreadedRegistration`:
+///
+/// ```
+/// use kernel::prelude::*;
+/// use kernel::irq::request::flags;
+/// use kernel::irq::request::ThreadedIrqReturn;
+/// use kernel::irq::request::ThreadedRegistration;
+/// use kernel::irq::request::IrqReturn;
+/// use kernel::sync::Arc;
+/// use kernel::sync::SpinLock;
+/// use kernel::alloc::flags::GFP_KERNEL;
+/// use kernel::c_str;
+///
+/// // Declare a struct that will be passed in when the interrupt fires. The u32
+/// // merely serves as an example of some internal data.
+/// struct Data(SpinLock<u32>);
+///
+/// // [`handle_irq`] takes &self. This example illustrates interior
+/// // mutability can be used when share the data between process context and IRQ
+/// // context.
+/// //
+/// // Ideally, this example would be using a version of SpinLock that is aware
+/// // of `spin_lock_irqsave` and `spin_lock_irqrestore`, but that is not yet
+/// // implemented.
+///
+/// type Handler = Data;
+///
+/// impl kernel::irq::request::ThreadedHandler for Handler {
+///     // This is executing in IRQ context in some CPU. Other CPUs can still
+///     // try to access to data.
+///     fn handle_irq(&self) -> ThreadedIrqReturn {
+///         // We now have exclusive access to the data by locking the SpinLock.
+///         let mut data = self.0.lock();
+///         *data += 1;
+///
+///         // By returning `WakeThread`, we indicate to the system that the
+///         // thread function should be called. Otherwise, return
+///         // ThreadedIrqReturn::Handled.
+///         ThreadedIrqReturn::WakeThread
+///     }
+///
+///     // This will run (in a separate kthread) iff `handle_irq` returns
+///     // `WakeThread`.
+///     fn thread_fn(&self) -> IrqReturn {
+///         // We now have exclusive access to the data by locking the SpinLock.
+///         let mut data = self.0.lock();
+///         *data += 1;
+///
+///         IrqReturn::Handled
+///     }
+/// }
+///
+/// // This is running in process context.
+/// fn register_threaded_irq(irq: u32, handler: Handler) -> Result<Arc<ThreadedRegistration<Handler>>> {
+///     let registration = ThreadedRegistration::register(irq, flags::SHARED, c_str!("my-device"), handler);
+///
+///     // You can have as many references to the registration as you want, so
+///     // multiple parts of the driver can access it.
+///     let registration = Arc::pin_init(registration, GFP_KERNEL)?;
+///
+///     // The handler may be called immediately after the function above
+///     // returns, possibly in a different CPU.
+///
+///     {
+///         // The data can be accessed from the process context too.
+///         let mut data = registration.handler().0.lock();
+///         *data = 42;
+///     }
+///
+///     Ok(registration)
+/// }
+///
+///
+/// # Ok::<(), Error>(())
+///```
+///
+/// # Invariants
+///
+/// * We own an irq handler using `&self` as its private data.
+///
+#[pin_data(PinnedDrop)]
+pub struct ThreadedRegistration<T: ThreadedHandler> {
+    irq: u32,
+    #[pin]
+    handler: T,
+    #[pin]
+    /// Pinned because we need address stability so that we can pass a pointer
+    /// to the callback.
+    _pin: PhantomPinned,
+}
+
+impl<T: ThreadedHandler> ThreadedRegistration<T> {
+    /// Registers the IRQ handler with the system for the given IRQ number. The
+    /// handler must be able to be called as soon as this function returns.
+    pub fn register(
+        irq: u32,
+        flags: Flags,
+        name: &'static CStr,
+        handler: T,
+    ) -> impl PinInit<Self, Error> {
+        let closure = move |slot: *mut Self| {
+            // SAFETY: The slot passed to pin initializer is valid for writing.
+            unsafe {
+                slot.write(Self {
+                    irq,
+                    handler,
+                    _pin: PhantomPinned,
+                })
+            };
+
+            // SAFETY:
+            // - The callbacks are valid for use with request_threaded_irq.
+            // - If this succeeds, the slot is guaranteed to be valid until the
+            // destructor of Self runs, which will deregister the callbacks
+            // before the memory location becomes invalid.
+            let res = to_result(unsafe {
+                bindings::request_threaded_irq(
+                    irq,
+                    Some(handle_threaded_irq_callback::<T>),
+                    Some(thread_fn_callback::<T>),
+                    flags.0,
+                    name.as_char_ptr(),
+                    slot.cast(),
+                )
+            });
+
+            if res.is_err() {
+                // SAFETY: We are returning an error, so we can destroy the slot.
+                unsafe { core::ptr::drop_in_place(addr_of_mut!((*slot).handler)) };
+            }
+
+            res
+        };
+
+        // SAFETY:
+        // - if this returns Ok(()), then every field of `slot` is fully
+        // initialized.
+        // - if this returns an error, then the slot does not need to remain
+        // valid.
+        unsafe { pin_init_from_closure(closure) }
+    }
+
+    /// Returns a reference to the handler that was registered with the system.
+    pub fn handler(&self) -> &T {
+        // SAFETY: `handler` is initialized in `register`, and we require that
+        // T: Sync.
+        &self.handler
+    }
+}
+
+#[pinned_drop]
+impl<T: ThreadedHandler> PinnedDrop for ThreadedRegistration<T> {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY:
+        // - `self.irq` is the same as the one passed to `request_threaded_irq`.
+        // -  `&self` was passed to `request_threaded_irq` as the cookie. It is
+        // guaranteed to be unique by the type system, since each call to
+        // `register` will return a different instance of
+        // `ThreadedRegistration`.
+        //
+        // Notice that this will block until all handlers finish executing, so,
+        // at no point will &self be invalid while the handler is running.
+        unsafe { bindings::free_irq(self.irq, &*self as *const Self as *mut core::ffi::c_void) };
+    }
+}
+
+/// # Safety
+///
+/// This function should be only used as the callback in `request_irq`.
+unsafe extern "C" fn handle_irq_callback<T: Handler>(
+    _irq: i32,
+    ptr: *mut core::ffi::c_void,
+) -> core::ffi::c_uint {
+    // SAFETY: `ptr` is a pointer to T set in `Registration::new`
+    let data = unsafe { &*(ptr as *const T) };
+    T::handle_irq(data) as _
+}
+
+/// # Safety
+///
+/// This function should be only used as the callback in `request_threaded_irq`.
+unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler>(
+    _irq: i32,
+    ptr: *mut core::ffi::c_void,
+) -> core::ffi::c_uint {
+    // SAFETY: `ptr` is a pointer to T set in `ThreadedRegistration::new`
+    let data = unsafe { &*(ptr as *const T) };
+    T::handle_irq(data) as _
+}
+
+/// # Safety
+///
+/// This function should be only used as the callback in `request_threaded_irq`.
+unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler>(
+    _irq: i32,
+    ptr: *mut core::ffi::c_void,
+) -> core::ffi::c_uint {
+    // SAFETY: `ptr` is a pointer to T set in `ThreadedRegistration::new`
+    let data = unsafe { &*(ptr as *const T) };
+    T::thread_fn(data) as _
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index e1065a7551a3..bba782e138c5 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -41,6 +41,7 @@
 pub mod fs;
 pub mod init;
 pub mod ioctl;
+pub mod irq;
 pub mod jump_label;
 #[cfg(CONFIG_KUNIT)]
 pub mod kunit;
-- 
2.48.0

