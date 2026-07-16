Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2584E4229B7;
	Thu, 16 Jul 2026 13:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784206957; cv=none; b=LQmyiAEDUgG3MTOFVsQaeSkzuQESctLsT00TBG9pDtZUOwYfMyQuZaSMc6w/vyXgtzkH6me8jGiHtbP2uyRHl2rT4tB5fu3dVMQ4hIe5zBri2/j5TWvQ4GMbdfMMTPfApVB9q0wWVbpLV5KXWvvi+FizwSNGlgEGMQ0/Ux7F3Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784206957; c=relaxed/simple;
	bh=dQMV+W2VfC1tmU2YeNGRNWA1g2lP1PKU+Dgx9Fu46/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M41mig9lcQnTcPbGxrg7U+98fa4NED/y1b6t4Pamn8185iRuQ2BLX6TQ12uQwMOpMUwc7gLXzUBWmZvKWrAWrYIFH4v+4dSXvypIdOGBqh3xbRq7zQ86km6o/0DBLnvpQvq8+nZ6AtH3pJFfZMKA+5f+jAyyarrxrEVWZ2UXXS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uui9YvxU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uui9YvxU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2E24C2BCC9;
	Thu, 16 Jul 2026 13:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784206956;
	bh=dQMV+W2VfC1tmU2YeNGRNWA1g2lP1PKU+Dgx9Fu46/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Uui9YvxUgwvBeLNTPWvHi+iYcX8dNFTbzGU3t36gGdQjzPLqDIZD+Tf/+uhN4WoFw
	 JN25fXlgfWQlm4LHsoc9zctxOKYoMzxZDq6aRXAK6uX6TxmOMltTOBDMMo24dDR+w0
	 6SpzzbaEQyjVjs36Ve/pS2TP4fBhx0abgwJVSbsKXPpCASVx7GgUf1GZ2VT63rnoHD
	 0TwdlAZSIqxFmrSZc9MEfV3MwTYbU17IV+OGTPcd/e2MzH44S8hs06oUp+wN4xHQxP
	 INbqReq+pjAD/VkNZ0aCAX2JLFDyNs+wGkE24Y+hZnmOn7j9622gO9aaUx126aGde8
	 XMhfBWXPmHZrw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53C0C44516;
	Thu, 16 Jul 2026 13:02:36 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Date: Thu, 16 Jul 2026 13:02:35 +0000
Subject: [PATCH 2/3] rust_binder: Update looper_flags bitmaps to use
 kernel::impl_flags!
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-b4-rust_binder_impl_flags-v1-2-b4201d3f15b3@google.com>
References: <20260716-b4-rust_binder_impl_flags-v1-0-b4201d3f15b3@google.com>
In-Reply-To: <20260716-b4-rust_binder_impl_flags-v1-0-b4201d3f15b3@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Jahnavi MN <jahnavimn@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784206955; l=6991;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=NHc7ZxdM2zz9/HTYVSkr7TYNCRdc60q71RVGZ/8qDbE=;
 b=5yLBiMhon1Np9NeNBX8RToCG2jzFL6fT70EeKXgB/xeUHFvGImu0DknVwa0nJ21OoXWlQJduD
 Yq1BXz/Nm6PCioVcO0wjJEfKJ5qrURs4mvQGHgH6IS/3LpxUgu0WHd3
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

Signed-off-by: Jahnavi MN <jahnavimn@google.com>
---
 drivers/android/binder/thread.rs | 63 ++++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 25 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 19f881948a84..e5bf1eaeeb17 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -9,6 +9,7 @@
 
 use kernel::{
     bindings,
+    bits::bit_u32,
     fs::{File, LocalFile},
     list::{AtomicTracker, List, ListArc, ListLinks, TryNewListArc},
     prelude::*,
@@ -243,7 +244,7 @@ fn is_ok(&self) -> bool {
 struct InnerThread {
     /// Determines the looper state of the thread. It is a bit-wise combination of the constants
     /// prefixed with `LOOPER_`.
-    looper_flags: u32,
+    looper_flags: LooperFlags,
 
     /// Determines whether the looper should return.
     looper_need_return: bool,
@@ -270,13 +271,23 @@ struct InnerThread {
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
     fn new() -> Result<Self> {
@@ -286,7 +297,7 @@ fn next_err_id() -> u32 {
         }
 
         Ok(Self {
-            looper_flags: 0,
+            looper_flags: LooperFlags::default(),
             looper_need_return: false,
             is_dead: false,
             process_work_list: false,
@@ -373,26 +384,27 @@ fn pop_transaction_replied(&mut self, transaction: &DArc<Transaction>) -> bool {
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
@@ -404,7 +416,7 @@ fn should_use_process_work_queue(&self) -> bool {
     }
 
     fn poll(&mut self) -> u32 {
-        self.looper_flags |= LOOPER_POLL;
+        self.looper_flags |= LooperFlag::Poll;
         if self.process_work_list || self.looper_need_return {
             bindings::POLLIN
         } else {
@@ -470,7 +482,7 @@ pub(crate) fn debug_print(self: &Arc<Self>, m: &SeqFile, print_all: bool) -> Res
                 m,
                 "  thread {}: l {:02x} need_return {}\n",
                 self.id,
-                inner.looper_flags,
+                u32::from(inner.looper_flags),
                 inner.looper_need_return,
             );
         }
@@ -543,9 +555,9 @@ fn get_work_local(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn Deliv
                 return Ok(Some(work));
             }
 
-            inner.looper_flags |= LOOPER_WAITING;
+            inner.looper_flags |= LooperFlag::Waiting;
             let signal_pending = self.work_condvar.wait_interruptible_freezable(&mut inner);
-            inner.looper_flags &= !LOOPER_WAITING;
+            inner.looper_flags &= !LooperFlag::Waiting;
 
             if signal_pending {
                 return Err(EINTR);
@@ -597,9 +609,9 @@ fn get_work(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn DeliverToRe
                 return Ok(Some(work));
             }
 
-            inner.looper_flags |= LOOPER_WAITING | LOOPER_WAITING_PROC;
+            inner.looper_flags |= LooperFlag::Waiting | LooperFlag::WaitingProc;
             let signal_pending = self.work_condvar.wait_interruptible_freezable(&mut inner);
-            inner.looper_flags &= !(LOOPER_WAITING | LOOPER_WAITING_PROC);
+            inner.looper_flags &= !(LooperFlag::Waiting | LooperFlag::WaitingProc);
 
             if signal_pending || inner.looper_need_return {
                 // We need to return now. We need to pull the thread off the list of ready threads
@@ -1589,7 +1601,7 @@ pub(crate) fn poll(&self, file: &File, table: PollTable<'_>) -> (bool, u32) {
     /// Make the call to `get_work` or `get_work_local` return immediately, if any.
     pub(crate) fn exit_looper(&self) {
         let mut inner = self.inner.lock();
-        let should_notify = inner.looper_flags & LOOPER_WAITING != 0;
+        let should_notify = inner.looper_flags.contains(LooperFlag::Waiting);
         if should_notify {
             inner.looper_need_return = true;
         }
@@ -1603,7 +1615,8 @@ pub(crate) fn exit_looper(&self) {
     pub(crate) fn notify_if_poll_ready(&self, sync: bool) {
         // Determine if we need to notify. This requires the lock.
         let inner = self.inner.lock();
-        let notify = inner.looper_flags & LOOPER_POLL != 0 && inner.should_use_process_work_queue();
+        let notify =
+            inner.looper_flags.contains(LooperFlag::Poll) && inner.should_use_process_work_queue();
         drop(inner);
 
         // Now that the lock is no longer held, notify the waiters if we have to.

-- 
2.55.0.229.g6434b31f56-goog


