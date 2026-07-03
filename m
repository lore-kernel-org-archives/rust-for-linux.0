Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77B0417365;
	Fri,  3 Jul 2026 15:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092566; cv=none; b=BLUrJkjc2O7rLS7O342J6pNC4A7Kq+SkHErFaYDYdEUufwCo+rCPwVerwQ5DIvjhZKwg6OSsu3k1gN+LZsajAH33MxN7wdZhtbhizdCCwPCryuPXWk43l1XXhS4qct5cx1sqx2cN3i/i7yNBAOHTYHmkYzHPC0K9iYoRjATtUtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092566; c=relaxed/simple;
	bh=5XAwzcladAz5pMb0+c3ueXA4UMPmJxvFFcgHARpDTGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZEIZ8vAubWrlobJOd5r0Cjf8x9B2DEap+uK+rjAyy22B/cNriV9LmAf4Nk3ZhWAvXk2z4lLpeKYxmVLHflvW3LErY1I9AjoMrMQRqfvWt62ZdOZAQnxEJbQ7YTfWv3OTGBsjNL9g831fb0HM3F60zdePZo1b/GpQJnMpQ7APxLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pzZemGQg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzZemGQg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85839C2BCC6;
	Fri,  3 Jul 2026 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783092565;
	bh=5XAwzcladAz5pMb0+c3ueXA4UMPmJxvFFcgHARpDTGs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pzZemGQg5bxvCP16XXF8Mj63hDqjCcEYYJNCq3UHemLa/v7HliX1jE/0esa5Hxj9w
	 RVZ5DRtPpA02rUmpmqnFCQUJbVmLw8dXuvVRaQ9mQdiRHCDh+qkj3L7ZTly8iR5G7h
	 tMHsuPzub2S8lSL/b1yUSG1zaWWOLsdtzd26sHG4BGvbuoS6HOsKC0TwG9ZuRWJjfI
	 gchTzmAtQGqQ3eYQ1Zslfi+1PyYyeBUMJWD90pOs/NWaXLUMoeFEEwYPwtD84nrtBD
	 u7fwdET/ek1Ys/iyji6JiTTcGZ33jBB6helbq40/9RLLtrOazdvcKkN8tOhSlscSKk
	 CuxomU0IR0NQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6522CC44500;
	Fri,  3 Jul 2026 15:29:25 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Date: Fri, 03 Jul 2026 15:29:22 +0000
Subject: [PATCH 1/7] rust_binder: Add dynamic debug logging mask
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rust_binder_debug_mask-v1-1-9bdf12b5325c@google.com>
References: <20260703-rust_binder_debug_mask-v1-0-9bdf12b5325c@google.com>
In-Reply-To: <20260703-rust_binder_debug_mask-v1-0-9bdf12b5325c@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783092563; l=8292;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=R2ADnwZ1ZTomLvpirGqr4kfAUvhz/scAzPc1MLpGKdw=;
 b=hAdobNJ5RP/FOsc/GYA/ZmWXU0z90sNO4WAwOMw2h743qYsqaFJ6ddmr/Sd4CwjxxcQpN8VrR
 70ZMiSWLCEFCnl0BhPfojjusDjQAnE5WUVrG4u4rFifxsmavOehA6jm
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

Since the Rust `module!` macro in the current kernel build does not yet
support declaring module parameters directly in Rust, we define the
`debug_mask` variable in a C companion file to expose it to the kernel
runtime and import it using FFI with volatile reads.

To verify the setup, instrument process lifecycle events (open, flush,
and release) in `process.rs` under the new `BINDER_DEBUG_OPEN_CLOSE`
logging mask. These entry-point events are chosen for initial validation
because they represent the start of the Binder lifecycle and occur
at low frequency, allowing simple runtime verification of the dynamic
toggle without log noise.

Signed-off-by: Jahnavi MN <jahnavimn@google.com>
---
 drivers/android/binder/debug.rs            | 49 ++++++++++++++++++++++++++++++
 drivers/android/binder/process.rs          | 15 +++++++--
 drivers/android/binder/rust_binder_main.rs |  2 ++
 drivers/android/binder/rust_binderfs.c     |  3 ++
 drivers/android/binder/thread.rs           |  1 +
 drivers/android/binder/transaction.rs      |  5 +--
 6 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/android/binder/debug.rs b/drivers/android/binder/debug.rs
new file mode 100644
index 000000000000..5e4daa823377
--- /dev/null
+++ b/drivers/android/binder/debug.rs
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2026 Google LLC.
+
+//! Binder debugging helpers.
+
+#![allow(dead_code)]
+
+pub(crate) const BINDER_DEBUG_USER_ERROR: u32 = 1 << 0;
+pub(crate) const BINDER_DEBUG_FAILED_TRANSACTION: u32 = 1 << 1;
+pub(crate) const BINDER_DEBUG_DEAD_TRANSACTION: u32 = 1 << 2;
+pub(crate) const BINDER_DEBUG_OPEN_CLOSE: u32 = 1 << 3;
+pub(crate) const BINDER_DEBUG_DEAD_BINDER: u32 = 1 << 4;
+pub(crate) const BINDER_DEBUG_DEATH_NOTIFICATION: u32 = 1 << 5;
+pub(crate) const BINDER_DEBUG_READ_WRITE: u32 = 1 << 6;
+pub(crate) const BINDER_DEBUG_USER_REFS: u32 = 1 << 7;
+pub(crate) const BINDER_DEBUG_THREADS: u32 = 1 << 8;
+pub(crate) const BINDER_DEBUG_TRANSACTION: u32 = 1 << 9;
+pub(crate) const BINDER_DEBUG_TRANSACTION_COMPLETE: u32 = 1 << 10;
+pub(crate) const BINDER_DEBUG_FREE_BUFFER: u32 = 1 << 11;
+pub(crate) const BINDER_DEBUG_INTERNAL_REFS: u32 = 1 << 12;
+pub(crate) const BINDER_DEBUG_PRIORITY_CAP: u32 = 1 << 13;
+pub(crate) const BINDER_DEBUG_SPINLOCKS: u32 = 1 << 14;
+
+extern "C" {
+    static rust_binder_debug_mask: u32;
+}
+
+/// Checks if the given debug logging category is enabled in the mask.
+pub(crate) fn debug_mask_enabled(mask: u32) -> bool {
+    let ptr = &raw const rust_binder_debug_mask;
+    // SAFETY: `rust_binder_debug_mask` is defined in the companion C code linked in the module.
+    let current_mask = unsafe { core::ptr::read_volatile(ptr) };
+    (current_mask & mask) != 0
+}
+
+/// Prints a debug log if the specified mask category is enabled.
+#[macro_export]
+macro_rules! binder_debug {
+    ($mask:expr, $fmt:literal $(, $($arg:tt)*)?) => {
+        if $crate::debug::debug_mask_enabled($mask) {
+            kernel::pr_info!(
+                "{}: {}\n",
+                kernel::current!().pid(),
+                format_args!($fmt $(, $($arg)*)?)
+            );
+        }
+    };
+}
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 96b8440ceac6..c13a04a3afcb 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -898,7 +898,6 @@ pub(crate) fn insert_or_update_handle(
     }
 
     pub(crate) fn get_transaction_node(&self, handle: u32) -> BinderResult<NodeRef> {
-        // When handle is zero, try to get the context manager.
         if handle == 0 {
             Ok(self.ctx.get_manager_node(true)?)
         } else {
@@ -1314,6 +1313,11 @@ pub(crate) fn lock_with_nodes(&self) -> WithNodes<'_> {
     }
 
     fn deferred_flush(&self) {
+        binder_debug!(
+            crate::debug::BINDER_DEBUG_OPEN_CLOSE,
+            "binder_flush: process {}",
+            self.pid_in_current_ns()
+        );
         let inner = self.inner.lock();
         for thread in inner.threads.values() {
             thread.exit_looper();
@@ -1321,6 +1325,11 @@ fn deferred_flush(&self) {
     }
 
     fn deferred_release(self: Arc<Self>) {
+        binder_debug!(
+            crate::debug::BINDER_DEBUG_OPEN_CLOSE,
+            "binder_deferred_release: process {}",
+            self.pid_in_current_ns()
+        );
         let is_manager = {
             let mut inner = self.inner.lock();
             inner.is_dead = true;
@@ -1616,7 +1625,9 @@ fn ioctl_write_read(
 /// The file operations supported by `Process`.
 impl Process {
     pub(crate) fn open(ctx: ArcBorrow<'_, Context>, file: &File) -> Result<Arc<Process>> {
-        Self::new(ctx.into(), ARef::from(file.cred()))
+        let proc = Self::new(ctx.into(), ARef::from(file.cred()))?;
+        binder_debug!(crate::debug::BINDER_DEBUG_OPEN_CLOSE, "opened process");
+        Ok(proc)
     }
 
     pub(crate) fn release(this: Arc<Process>, _file: &File) {
diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index dc1941cd2407..bf15021524a4 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -37,6 +37,8 @@
 mod context;
 mod deferred_close;
 mod defs;
+#[macro_use]
+mod debug;
 mod error;
 mod node;
 mod page_range;
diff --git a/drivers/android/binder/rust_binderfs.c b/drivers/android/binder/rust_binderfs.c
index ade1c4d92499..fa8b38465550 100644
--- a/drivers/android/binder/rust_binderfs.c
+++ b/drivers/android/binder/rust_binderfs.c
@@ -51,6 +51,9 @@ DEFINE_SHOW_ATTRIBUTE(rust_binder_proc);
 char *rust_binder_devices_param = CONFIG_ANDROID_BINDER_DEVICES;
 module_param_named(rust_devices, rust_binder_devices_param, charp, 0444);
 
+u32 rust_binder_debug_mask = 7;
+module_param_named(debug_mask, rust_binder_debug_mask, uint, 0644);
+
 static dev_t binderfs_dev;
 static DEFINE_MUTEX(binderfs_minors_mutex);
 static DEFINE_IDA(binderfs_minors);
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 97d5f31e8fe3..c908dde5796a 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1222,6 +1222,7 @@ fn read_transaction_info(
         info.buffers_size = td.buffers_size as usize;
         // SAFETY: Above `read` call initializes all bytes, so this union read is ok.
         info.target_handle = unsafe { td.transaction_data.target.handle };
+        info.debug_id = super::next_debug_id();
         Ok(())
     }
 
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index 1d9b66920a21..f9285eb93fc0 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -42,6 +42,7 @@ pub(crate) struct TransactionInfo {
     pub(crate) reply: u32,
     pub(crate) oneway_spam_suspect: bool,
     pub(crate) is_reply: bool,
+    pub(crate) debug_id: usize,
 }
 
 impl TransactionInfo {
@@ -93,7 +94,7 @@ pub(crate) fn new(
         from: &Arc<Thread>,
         info: &mut TransactionInfo,
     ) -> BinderResult<DLArc<Self>> {
-        let debug_id = super::next_debug_id();
+        let debug_id = info.debug_id;
         let allow_fds = node_ref.node.flags & FLAT_BINDER_FLAG_ACCEPTS_FDS != 0;
         let txn_security_ctx = node_ref.node.flags & FLAT_BINDER_FLAG_TXN_SECURITY_CTX != 0;
         let mut txn_security_ctx_off = if txn_security_ctx { Some(0) } else { None };
@@ -152,7 +153,7 @@ pub(crate) fn new_reply(
         info: &mut TransactionInfo,
         allow_fds: bool,
     ) -> BinderResult<DLArc<Self>> {
-        let debug_id = super::next_debug_id();
+        let debug_id = info.debug_id;
         let mut alloc =
             match from.copy_transaction_data(to.clone(), info, debug_id, allow_fds, None) {
                 Ok(alloc) => alloc,

-- 
2.55.0.rc0.799.gd6f94ed593-goog


