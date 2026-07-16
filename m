Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CB33F1AB7;
	Thu, 16 Jul 2026 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191081; cv=none; b=EIaNKF7z9xYdlOGzreCIQ/xm4HCRBGP7xyh8mn2puu0WYJzBDoHvJfLWSxFde4dW+Ft9OeufCcYl9y9aFIl+8gkqQLcXfEF++ZD6T6oMBsnhgTlOrscQJfREchkGn0ck/oXDwMusOAtjBQPNPkgj/yHm9frteZR9XVL54jz3gzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191081; c=relaxed/simple;
	bh=dTrU65SmAPkR6BctDTxJqsfV7mqivmFMC3XCyyM8rLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R22vckTwtmrjZY4hQsHHorXr1V5V+z49T/u5y9PRN7Z8HHQoT/sQjZOSCr3wZdwhoEc4452pGlN8tje3P11GyDeIpaR7ooZBnJ03eTRNI2YDUPLd9G7fq0qlkgr/55U13BIGSuvBxm+NB5aOVzCv/MQ6IfxzlVivfAwoi10nXZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOe2ZEG6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOe2ZEG6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35879C2BCC9;
	Thu, 16 Jul 2026 08:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784191080;
	bh=dTrU65SmAPkR6BctDTxJqsfV7mqivmFMC3XCyyM8rLs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eOe2ZEG6KJMSkBBXbrjTRBF9MaGP8rBp4E3cXlau6IXOD1KQsT8eZM3dOjqnmq9L0
	 j7rtiS0sDX+3gUIEH6nZJFAfYF6AEDm/fST/3m0B/k7E54187N8/Q3SauN75+tbyJq
	 syQz9Cx/QfOWjU0I6dcYDkrRfZUjEkGPrJDBfOhQHKNxGv1ayJz7P4tIAZEuYsIJF/
	 FkxIUpLeaf41zX7ZBPNuzdefH6NooxDv0SrbAgDWepKxQr/zQSk0JjE8pqSnftFCW0
	 VIycl9EZrPy0Hp0m/cZdRkV/sFhZet0ot3PpswoHyC7vbjFdjTFLX/6rL1VGM1W5Yz
	 1Pln5TtngRHpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171E9C44501;
	Thu, 16 Jul 2026 08:38:00 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Date: Thu, 16 Jul 2026 08:37:43 +0000
Subject: [PATCH v4 1/7] rust_binder: Add dynamic debug logging mask
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-rust_binder_debug_mask-v4-1-3d7436c2d2f2@google.com>
References: <20260716-rust_binder_debug_mask-v4-0-3d7436c2d2f2@google.com>
In-Reply-To: <20260716-rust_binder_debug_mask-v4-0-3d7436c2d2f2@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Jahnavi MN <jahnavimn@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784191078; l=7221;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=fNLXc//OvN2pQlLuxzKG8kuvx445LewB4RHamhDF4X4=;
 b=HcGTHC0GmEHRibHoUcbipqs50rjpjI032Aq6za1JpQUs3pHRudozkXrMm7c4fxa0/sTmRU8aR
 8ZNM3C7ICUZCxzIQbLH6d6tWg46WsAj4WQxLWchK9lsAI/zjztwIX9f
X-Developer-Key: i=jahnavimn@google.com; a=ed25519;
 pk=9aLfw3FepTOJwTS7jRXm7pDH87eBeZMXBPrqwU0//RE=
X-Endpoint-Received: by B4 Relay for jahnavimn@google.com/20260702 with
 auth_id=849
X-Original-From: Jahnavi MN <jahnavimn@google.com>
Reply-To: jahnavimn@google.com

From: Jahnavi MN <jahnavimn@google.com>

Implement a dynamic debug logging mask (`debug_mask`) for the
`rust_binder` module to allow dynamic runtime configuration of log
levels. This enables parity with the legacy C driver's debug mask.

Since the Rust `module!` macro in the current kernel build does not
yet support declaring module parameters directly in Rust, we define
the `debug_mask` variable in Rust as an `Atomic<u32>` exported via
FFI using `#[no_mangle]`, and link to it as `extern` in a C companion
file to expose it to the kernel runtime.

To verify the setup, instrument process lifecycle events (open, flush,
and release) in `process.rs` under the new `BINDER_DEBUG_OPEN_CLOSE`
logging mask. These entry-point events are chosen for initial validation
because they represent the start of the Binder lifecycle and occur
at low frequency, allowing simple runtime verification of the dynamic
toggle without log noise.

Reviewed-by: Carlos Llamas <cmllamas@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Jahnavi MN <jahnavimn@google.com>
---
 drivers/android/binder/debug.rs            | 76 ++++++++++++++++++++++++++++++
 drivers/android/binder/process.rs          |  7 ++-
 drivers/android/binder/rust_binder_main.rs |  2 +
 drivers/android/binder/rust_binderfs.c     |  3 ++
 rust/kernel/task.rs                        |  7 +++
 5 files changed, 94 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder/debug.rs b/drivers/android/binder/debug.rs
new file mode 100644
index 000000000000..824b10c004c3
--- /dev/null
+++ b/drivers/android/binder/debug.rs
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2026 Google LLC.
+
+//! Binder debugging helpers.
+
+#![allow(dead_code)]
+
+use kernel::bits::bit_u32;
+use kernel::sync::atomic::Atomic;
+
+kernel::impl_flags!(
+    /// Represents multiple debug mask flags.
+    #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
+    pub struct DebugMasks(u32);
+
+    /// Represents a single debug mask category.
+    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
+    pub enum DebugMask {
+        UserError = bit_u32(0),
+        FailedTransaction = bit_u32(1),
+        DeadTransaction = bit_u32(2),
+        OpenClose = bit_u32(3),
+        DeadBinder = bit_u32(4),
+        DeathNotification = bit_u32(5),
+        ReadWrite = bit_u32(6),
+        UserRefs = bit_u32(7),
+        Threads = bit_u32(8),
+        Transaction = bit_u32(9),
+        TransactionComplete = bit_u32(10),
+        FreeBuffer = bit_u32(11),
+        InternalRefs = bit_u32(12),
+        PriorityCap = bit_u32(13),
+        Spinlocks = bit_u32(14),
+    }
+);
+
+#[no_mangle]
+pub(crate) static rust_binder_debug_mask: Atomic<u32> = Atomic::new(
+    (DebugMask::UserError as u32)
+        | (DebugMask::FailedTransaction as u32)
+        | (DebugMask::DeadTransaction as u32),
+);
+
+/// Checks if the given debug logging category is enabled in the mask.
+pub(crate) fn debug_mask_enabled(mask: DebugMask) -> bool {
+    let current_mask = rust_binder_debug_mask.load(kernel::sync::atomic::Relaxed);
+    DebugMasks(current_mask).contains(mask)
+}
+
+/// Prints a debug log if the specified mask category is enabled.
+#[macro_export]
+macro_rules! binder_debug {
+    // Rule to explicitly specify a PID (used in kworkers).
+    (pid=$pid:expr, $mask:ident, $($arg:tt)*) => {
+        if $crate::debug::debug_mask_enabled($crate::debug::DebugMask::$mask) {
+            kernel::pr_info!(
+                "{}: {}\n",
+                $pid,
+                kernel::prelude::fmt!($($arg)*)
+            );
+        }
+    };
+
+    // Default rule (automatically prepends "PID:TID" of the current calling thread).
+    ($mask:ident, $($arg:tt)*) => {
+        if $crate::debug::debug_mask_enabled($crate::debug::DebugMask::$mask) {
+            let thread = kernel::current!();
+            kernel::pr_info!(
+                "{}:{} {}\n",
+                thread.tgid(),
+                thread.pid(),
+                kernel::prelude::fmt!($($arg)*)
+            );
+        }
+    };
+}
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 0555c4bd503e..5240686324cf 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1341,6 +1341,7 @@ pub(crate) fn lock_with_nodes(&self) -> WithNodes<'_> {
     }
 
     fn deferred_flush(&self) {
+        binder_debug!(pid = self.task.pid(), OpenClose, "flushing process");
         let inner = self.inner.lock();
         for thread in inner.threads.values() {
             thread.exit_looper();
@@ -1348,6 +1349,8 @@ fn deferred_flush(&self) {
     }
 
     fn deferred_release(self: Arc<Self>) {
+        binder_debug!(pid = self.task.pid(), OpenClose, "releasing process");
+
         let is_manager = {
             let mut inner = self.inner.lock();
             inner.is_dead = true;
@@ -1641,7 +1644,9 @@ fn ioctl_write_read(
 /// The file operations supported by `Process`.
 impl Process {
     pub(crate) fn open(ctx: ArcBorrow<'_, Context>, file: &File) -> Result<Arc<Process>> {
-        Self::new(ctx.into(), ARef::from(file.cred()))
+        let proc = Self::new(ctx.into(), ARef::from(file.cred()))?;
+        binder_debug!(OpenClose, "opened process");
+        Ok(proc)
     }
 
     pub(crate) fn release(this: Arc<Process>, _file: &File) {
diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index 432390aab25b..29829cb210a4 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -31,6 +31,8 @@
 mod context;
 mod deferred_close;
 mod defs;
+#[macro_use]
+mod debug;
 mod error;
 mod node;
 mod page_range;
diff --git a/drivers/android/binder/rust_binderfs.c b/drivers/android/binder/rust_binderfs.c
index ade1c4d92499..300cc65562d1 100644
--- a/drivers/android/binder/rust_binderfs.c
+++ b/drivers/android/binder/rust_binderfs.c
@@ -51,6 +51,9 @@ DEFINE_SHOW_ATTRIBUTE(rust_binder_proc);
 char *rust_binder_devices_param = CONFIG_ANDROID_BINDER_DEVICES;
 module_param_named(rust_devices, rust_binder_devices_param, charp, 0444);
 
+extern u32 rust_binder_debug_mask;
+module_param_named(debug_mask, rust_binder_debug_mask, uint, 0644);
+
 static dev_t binderfs_dev;
 static DEFINE_MUTEX(binderfs_minors_mutex);
 static DEFINE_IDA(binderfs_minors);
diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 38273f4eedb5..1b290c61714d 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -210,6 +210,13 @@ pub fn pid(&self) -> Pid {
         unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
     }
 
+    /// Returns the TGID (Thread Group ID / Process ID) of the given task.
+    pub fn tgid(&self) -> Pid {
+        // SAFETY: The tgid of a task never changes after initialization, so reading this field is
+        // not a data race.
+        unsafe { *ptr::addr_of!((*self.as_ptr()).tgid) }
+    }
+
     /// Returns the UID of the given task.
     #[inline]
     pub fn uid(&self) -> Kuid {

-- 
2.55.0.229.g6434b31f56-goog


