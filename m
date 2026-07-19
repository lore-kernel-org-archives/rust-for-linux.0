Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6560383334;
	Sun, 19 Jul 2026 09:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784455022; cv=none; b=a9LzfMS+1CNkgi8BROkJTtXjhQ/5rmOJSwhLBxtVMSrkw+JByLvNtyeygQRmhfXAerbwFWLIOemZULvVDJl4idOBahKHTrkb39lzY3fsxqlL/bk7etFsYfv653nfvuZ9dA347zRH9MyPaNZW3Kn5P9+g8vAx+ZXC9RDvzCU1K/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784455022; c=relaxed/simple;
	bh=OMffry9RSiN96PTbDN+HvcTH5vjDdBJQC37n83ZZOhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jeKoaOh4V6ddn+iCxSk3BdM7bitxdj+k8Kcwedp0+OTIKqiTvJTZ8KrWD3RJ0FykMCeLXLWyLYZmaB692VB/xn967hhRURyy1MlGG+2OkV2Za87LIOXjo2y10D9ypmuMq2kwrpl1Kd44hDHgWjyR4Cam14mDCTz0Zb6CTBM4dpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2QSnifr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2QSnifr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D1E6C2BCC9;
	Sun, 19 Jul 2026 09:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784455021;
	bh=OMffry9RSiN96PTbDN+HvcTH5vjDdBJQC37n83ZZOhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L2QSnifr6yBEvJbCnpk53cMBbZTkilNwd+e2ZXB/vUI774hGjnKb2YXQbBjPtb8/y
	 RDMA9vz1QeOqil0QdyjwP6Wr2VFx2qdbeikWFsyUW02pGSeP2B1M3VWy+LXtlntvg7
	 hPyL3pix8Xc/KsXVJXRkByhHQVifq85La4MeQv0odOOZIZx84EawK54sJcnl3mhoO7
	 n3kPU8Qz7ucwz9OM4RcuXYmllD3KzCXY2R1HBqx35XGeWS0/M32wVep/G46XtHwSEy
	 po1VBRpBM6+fto9ObYFZkeMw5ieQ8WvutoV7cdaYK6es+I0nUd23pfC4iwK478wzP2
	 7qnZomb1f260Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E97BC4450A;
	Sun, 19 Jul 2026 09:57:01 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Date: Sun, 19 Jul 2026 09:56:58 +0000
Subject: [PATCH v2 1/2] rust_binder: Update looper_flags bitmaps to use
 kernel::impl_flags!
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-b4-rust_binder_impl_flags-v2-1-7a5debdfa39c@google.com>
References: <20260719-b4-rust_binder_impl_flags-v2-0-7a5debdfa39c@google.com>
In-Reply-To: <20260719-b4-rust_binder_impl_flags-v2-0-7a5debdfa39c@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Jahnavi MN <jahnavimn@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784455020; l=6834;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=uQuRb/NTeFFfhMWk9YGduC3NdaCf5f7oGhMDsvKoArg=;
 b=iPK5I9OnqV5GERplinOCxyA08Tqqbh/s9BcXLkZ0ja960tjMSY5YEcmjLM/u2eDThgLlmpQaO
 AQlJQ6yTZ1mCt9swuFVFDEA8CFjBj2ZC9Vz+A81HBf/ndj38GPzuOiO
X-Developer-Key: i=jahnavimn@google.com; a=ed25519;
 pk=9aLfw3FepTOJwTS7jRXm7pDH87eBeZMXBPrqwU0//RE=
X-Endpoint-Received: by B4 Relay for jahnavimn@google.com/20260702 with
 auth_id=849
X-Original-From: Jahnavi MN <jahnavimn@google.com>
Reply-To: jahnavimn@google.com

From: Jahnavi MN <jahnavimn@google.com>

- Define `LooperFlags(u32)` and `LooperFlag` enum with 7 variants.
- Change `InnerThread.looper_flags` type to `LooperFlags`.
- Update looper state transitions and checks to use type-safe methods.
- Convert `looper_flags` to `u32` for hex formatting in `debug_print`.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Jahnavi MN <jahnavimn@google.com>
---
 drivers/android/binder/thread.rs | 62 ++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 25 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index a51821dde0ad..ef692fe79201 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -9,6 +9,7 @@
 
 use kernel::{
     bindings,
+    bits::bit_u32,
     fs::LocalFile,
     list::{AtomicTracker, List, ListArc, ListLinks, TryNewListArc},
     prelude::*,
@@ -245,7 +246,7 @@ fn is_ok(&self) -> bool {
 struct InnerThread {
     /// Determines the looper state of the thread. It is a bit-wise combination of the constants
     /// prefixed with `LOOPER_`.
-    looper_flags: u32,
+    looper_flags: LooperFlags,
 
     /// Determines whether the looper should return.
     looper_need_return: bool,
@@ -272,13 +273,23 @@ struct InnerThread {
     extended_error: ExtendedError,
 }
 
-const LOOPER_REGISTERED: u32 = 0x01;
-const LOOPER_ENTERED: u32 = 0x02;
-const LOOPER_EXITED: u32 = 0x04;
-const LOOPER_INVALID: u32 = 0x08;
-const LOOPER_WAITING: u32 = 0x10;
-const LOOPER_WAITING_PROC: u32 = 0x20;
-const LOOPER_POLL: u32 = 0x40;
+kernel::impl_flags!(
+    /// Represents multiple looper flags.
+    #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
+    pub struct LooperFlags(u32);
+
+    /// Represents a single looper flag.
+    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
+    pub enum LooperFlag {
+        Registered = bit_u32(0),
+        Entered = bit_u32(1),
+        Exited = bit_u32(2),
+        Invalid = bit_u32(3),
+        Waiting = bit_u32(4),
+        WaitingProc = bit_u32(5),
+        Poll = bit_u32(6),
+    }
+);
 
 impl InnerThread {
     fn new(pid: i32) -> Result<Self> {
@@ -288,7 +299,7 @@ fn next_err_id() -> u32 {
         }
 
         Ok(Self {
-            looper_flags: 0,
+            looper_flags: LooperFlags::default(),
             looper_need_return: false,
             is_dead: false,
             process_work_list: false,
@@ -316,7 +327,7 @@ fn push_work(&mut self, work: DLArc<dyn DeliverToRead>) -> PushWorkRes {
         }
         self.work_list.push_back(work);
         self.process_work_list = true;
-        if self.looper_flags & LOOPER_POLL != 0 {
+        if self.looper_flags.contains(LooperFlag::Poll) {
             PushWorkRes::OkNotifyPoll
         } else {
             PushWorkRes::Ok
@@ -380,26 +391,27 @@ fn pop_transaction_replied(&mut self, transaction: &DArc<Transaction>) -> bool {
     }
 
     fn looper_enter(&mut self) {
-        self.looper_flags |= LOOPER_ENTERED;
-        if self.looper_flags & LOOPER_REGISTERED != 0 {
-            self.looper_flags |= LOOPER_INVALID;
+        self.looper_flags |= LooperFlag::Entered;
+        if self.looper_flags.contains(LooperFlag::Registered) {
+            self.looper_flags |= LooperFlag::Invalid;
         }
     }
 
     fn looper_register(&mut self, valid: bool) {
-        self.looper_flags |= LOOPER_REGISTERED;
-        if !valid || self.looper_flags & LOOPER_ENTERED != 0 {
-            self.looper_flags |= LOOPER_INVALID;
+        self.looper_flags |= LooperFlag::Registered;
+        if !valid || self.looper_flags.contains(LooperFlag::Entered) {
+            self.looper_flags |= LooperFlag::Invalid;
         }
     }
 
     fn looper_exit(&mut self) {
-        self.looper_flags |= LOOPER_EXITED;
+        self.looper_flags |= LooperFlag::Exited;
     }
 
     /// Determines whether the thread is part of a pool, i.e., if it is a looper.
     fn is_looper(&self) -> bool {
-        self.looper_flags & (LOOPER_ENTERED | LOOPER_REGISTERED) != 0
+        self.looper_flags
+            .contains_any(LooperFlag::Entered | LooperFlag::Registered)
     }
 
     /// Determines whether the thread should attempt to fetch work items from the process queue.
@@ -411,7 +423,7 @@ fn should_use_process_work_queue(&self) -> bool {
     }
 
     fn poll(&mut self) -> u32 {
-        self.looper_flags |= LOOPER_POLL;
+        self.looper_flags |= LooperFlag::Poll;
         if self.process_work_list || self.looper_need_return {
             bindings::POLLIN
         } else {
@@ -477,7 +489,7 @@ pub(crate) fn debug_print(self: &Arc<Self>, m: &SeqFile, print_all: bool) -> Res
                 m,
                 "  thread {}: l {:02x} need_return {}\n",
                 self.id,
-                inner.looper_flags,
+                u32::from(inner.looper_flags),
                 inner.looper_need_return,
             );
         }
@@ -550,9 +562,9 @@ fn get_work_local(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn Deliv
                 return Ok(Some(work));
             }
 
-            inner.looper_flags |= LOOPER_WAITING;
+            inner.looper_flags |= LooperFlag::Waiting;
             let signal_pending = self.work_condvar.wait_interruptible_freezable(&mut inner);
-            inner.looper_flags &= !LOOPER_WAITING;
+            inner.looper_flags &= !LooperFlag::Waiting;
 
             if signal_pending {
                 return Err(EINTR);
@@ -604,9 +616,9 @@ fn get_work(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn DeliverToRe
                 return Ok(Some(work));
             }
 
-            inner.looper_flags |= LOOPER_WAITING | LOOPER_WAITING_PROC;
+            inner.looper_flags |= LooperFlag::Waiting | LooperFlag::WaitingProc;
             let signal_pending = self.work_condvar.wait_interruptible_freezable(&mut inner);
-            inner.looper_flags &= !(LOOPER_WAITING | LOOPER_WAITING_PROC);
+            inner.looper_flags &= !(LooperFlag::Waiting | LooperFlag::WaitingProc);
 
             if signal_pending || inner.looper_need_return {
                 // We need to return now. We need to pull the thread off the list of ready threads
@@ -1649,7 +1661,7 @@ pub(crate) fn poll(&self) -> Result<(bool, u32)> {
     /// Make the call to `get_work` or `get_work_local` return immediately, if any.
     pub(crate) fn exit_looper(&self) {
         let mut inner = self.inner.lock();
-        let should_notify = inner.looper_flags & LOOPER_WAITING != 0;
+        let should_notify = inner.looper_flags.contains(LooperFlag::Waiting);
         if should_notify {
             inner.looper_need_return = true;
         }

-- 
2.55.0.229.g6434b31f56-goog


