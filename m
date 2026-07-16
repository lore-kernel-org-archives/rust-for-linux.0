Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2578342254B;
	Thu, 16 Jul 2026 13:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784206957; cv=none; b=dwm85J5WDTlf9of22F3GWOELsnHpkAke8SY8YKP1Bun1jIURZKHbc5TsZj6NXEq9+U7TjIILgmiCAu7zHkR8hP+XPcMU+s/WpCIECnH92ta9EZBTMx6GP2I08qXNMw5+YW7Kzq+0MwtHFfYCv8Eq5ptyx4frLRhBYgPM/xmV6yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784206957; c=relaxed/simple;
	bh=qIL8QuHbUrwyzTpKXzVBIOWwCUaj9QgegeYC6ojWEy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cDHQ2qzcsSE/lUWfS2I4TksOJPB5CAnXk5rojfmozLSTE6tqQMAA0r7UVh6N8wTKpPQFN6w51GIcVOgIoYy+RW7UXXgnqgrm9ZtT9kAg7yqHIC9c01bANcXghh+oCLqtHPSZz72ZHW3QpAeLBIlr8cfRJuViG3lSS+bXqkPHV8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYjLGdPb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYjLGdPb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDB1CC2BCF6;
	Thu, 16 Jul 2026 13:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784206956;
	bh=qIL8QuHbUrwyzTpKXzVBIOWwCUaj9QgegeYC6ojWEy0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PYjLGdPbooPjffAH5Ib5ru0AQUIigUOC73xeKa6w1zLSVQYmWbna37c6LzNtOOJU7
	 CVyfy3z5pcJbGY2u8bWeVwqdU1z9oydTVo/r4iXMBFEEZWfpqb+uBGZYojKaej38yH
	 M34pFEIXmWntkr4+0nfuR7APf9QeWhzdcLjwuVTb5wuBkZfaxD9ikNburFzkxtQf3J
	 DU6KqHSwg7P+WlwY0e1r4pedoin9nj+99pyar0/geDWS/rImNfLlIoFZrVOfH+3vU7
	 vbkdE0C1culs2T9Oyv1fdtYimC1CzcY1FgPUTinkDfZrQUzvLgSrlCVFJeFaX9O2Vf
	 jpDJCQfF2vXEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3862C4450A;
	Thu, 16 Jul 2026 13:02:36 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Date: Thu, 16 Jul 2026 13:02:36 +0000
Subject: [PATCH 3/3] rust_binder: Update transaction flags to use
 kernel::impl_flags!
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-b4-rust_binder_impl_flags-v1-3-b4201d3f15b3@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784206955; l=8816;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=GcxzYl/7E1EvBuuuo65EndTTI/b1qEm8RIoCciK/dwQ=;
 b=8q4Z4Kwau2V3LVZUyqnhDmGnyims9ifNRA+omX0dJUc8ZKHmMVglyDZkAwjXTYffoswfF0zsC
 jxlgIm6KT5JAZkqhtdcwK8oC1R4Kxu/qp7wqICTYHAA5RQhr/XP64yw
X-Developer-Key: i=jahnavimn@google.com; a=ed25519;
 pk=9aLfw3FepTOJwTS7jRXm7pDH87eBeZMXBPrqwU0//RE=
X-Endpoint-Received: by B4 Relay for jahnavimn@google.com/20260702 with
 auth_id=849
X-Original-From: Jahnavi MN <jahnavimn@google.com>
Reply-To: jahnavimn@google.com

From: Jahnavi MN <jahnavimn@google.com>

- Define `TransactionFlags(u32)` and `TransactionFlag` with 4 variants.
- Change flags field type to `TransactionFlags` in structs.
- Add `is_oneway` helper on `TransactionFlags` to simplify checks.
- Update `can_replace` logic to use type-safe combined flag checks.
- Convert `flags` to `u32` for FFI boundaries and logging.

Signed-off-by: Jahnavi MN <jahnavimn@google.com>
---
 drivers/android/binder/thread.rs      |  6 ++--
 drivers/android/binder/transaction.rs | 56 ++++++++++++++++++++++++++---------
 2 files changed, 45 insertions(+), 17 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index e5bf1eaeeb17..1d10c6a95ff5 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -31,7 +31,7 @@
     process::{GetWorkOrRegister, Process},
     ptr_align,
     stats::GLOBAL_STATS,
-    transaction::{Transaction, TransactionInfo},
+    transaction::{Transaction, TransactionFlag, TransactionFlags, TransactionInfo},
     BinderReturnWriter, DArc, DLArc, DTRWrap, DeliverCode, DeliverToRead,
 };
 
@@ -1244,7 +1244,7 @@ fn read_transaction_info(
         info.from_pid = self.process.task.pid();
         info.from_tid = self.id;
         info.code = td.transaction_data.code;
-        info.flags = td.transaction_data.flags;
+        info.flags = TransactionFlags::from_bits(td.transaction_data.flags);
         info.data_ptr = UserPtr::from_addr(trd_data_ptr.buffer as usize);
         info.data_size = td.transaction_data.data_size as usize;
         info.offsets_ptr = UserPtr::from_addr(trd_data_ptr.offsets as usize);
@@ -1350,7 +1350,7 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
         let out = (|| -> BinderResult<_> {
             let completion = DTRWrap::arc_try_new(DeliverCode::new(BR_TRANSACTION_COMPLETE))?;
             let process = orig.from.process.clone();
-            let allow_fds = orig.flags & TF_ACCEPT_FDS != 0;
+            let allow_fds = orig.flags.contains(TransactionFlag::AcceptFds);
             let reply = Transaction::new_reply(self, process, info, allow_fds)?;
             self.inner.lock().push_work(completion);
             orig.from.deliver_reply(Ok(reply), &orig, None);
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index afef5b46eac2..4e2ef99e512f 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -25,6 +25,33 @@
     BinderReturnWriter, DArc, DLArc, DTRWrap, DeliverToRead,
 };
 
+kernel::impl_flags!(
+    /// Represents multiple transaction flags.
+    #[derive(Debug, Clone, Default, Copy, PartialEq, Eq, Zeroable)]
+    pub struct TransactionFlags(u32);
+
+    /// Represents a single transaction flag.
+    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
+    pub enum TransactionFlag {
+        OneWay = TF_ONE_WAY,
+        AcceptFds = TF_ACCEPT_FDS,
+        ClearBuf = TF_CLEAR_BUF,
+        UpdateTxn = TF_UPDATE_TXN,
+    }
+);
+
+impl TransactionFlags {
+    /// Creates a `TransactionFlags` from a raw `u32` value.
+    pub(crate) fn from_bits(bits: u32) -> Self {
+        Self(bits)
+    }
+
+    /// Checks if the Oneway flag is set.
+    pub(crate) fn is_oneway(self) -> bool {
+        self.contains(TransactionFlag::OneWay)
+    }
+}
+
 #[derive(Zeroable)]
 pub(crate) struct TransactionInfo {
     pub(crate) from_pid: Pid,
@@ -32,7 +59,7 @@ pub(crate) struct TransactionInfo {
     pub(crate) to_pid: Pid,
     pub(crate) to_tid: Pid,
     pub(crate) code: u32,
-    pub(crate) flags: u32,
+    pub(crate) flags: TransactionFlags,
     pub(crate) data_ptr: UserPtr,
     pub(crate) data_size: usize,
     pub(crate) offsets_ptr: UserPtr,
@@ -49,7 +76,7 @@ pub(crate) struct TransactionInfo {
 impl TransactionInfo {
     #[inline]
     pub(crate) fn is_oneway(&self) -> bool {
-        self.flags & TF_ONE_WAY != 0
+        self.flags.is_oneway()
     }
 }
 
@@ -75,7 +102,7 @@ pub(crate) struct Transaction {
     allocation: SpinLock<Option<Allocation>>,
     is_outstanding: Atomic<bool>,
     code: u32,
-    pub(crate) flags: u32,
+    pub(crate) flags: TransactionFlags,
     data_size: usize,
     offsets_size: usize,
     data_address: usize,
@@ -121,7 +148,7 @@ pub(crate) fn new(
             }
             alloc.set_info_oneway_node(node_ref.node.clone());
         }
-        if info.flags & TF_CLEAR_BUF != 0 {
+        if info.flags.contains(TransactionFlag::ClearBuf) {
             alloc.set_info_clear_on_drop();
         }
         let target_node = node_ref.node.clone();
@@ -161,7 +188,7 @@ pub(crate) fn new_reply(
                     return Err(err);
                 }
             };
-        if info.flags & TF_CLEAR_BUF != 0 {
+        if info.flags.contains(TransactionFlag::ClearBuf) {
             alloc.set_info_clear_on_drop();
         }
         Ok(DTRWrap::arc_pin_init(pin_init!(Transaction {
@@ -194,7 +221,7 @@ pub(crate) fn debug_print_inner(&self, m: &SeqFile, prefix: &str) {
             self.from.id,
             self.to.task.pid(),
             self.code,
-            self.flags,
+            u32::from(self.flags),
             self.start_time.elapsed().as_millis(),
         );
         if let Some(target_node) = &self.target_node {
@@ -273,7 +300,7 @@ pub(crate) fn submit(self: DLArc<Self>, info: &mut TransactionInfo) -> BinderRes
         let _t_outdated;
         let _oneway_node;
 
-        let oneway = self.flags & TF_ONE_WAY != 0;
+        let oneway = self.flags.is_oneway();
         let process = self.to.clone();
         let mut process_inner = process.inner.lock();
 
@@ -284,7 +311,7 @@ pub(crate) fn submit(self: DLArc<Self>, info: &mut TransactionInfo) -> BinderRes
                 crate::trace::trace_transaction(false, &self, None);
                 if process_inner.is_frozen.is_frozen() {
                     process_inner.async_recv = true;
-                    if self.flags & TF_UPDATE_TXN != 0 {
+                    if self.flags.contains(TransactionFlag::UpdateTxn) {
                         if let Some(t_outdated) =
                             target_node.take_outdated_transaction(&self, &mut process_inner)
                         {
@@ -355,7 +382,8 @@ pub(crate) fn can_replace(&self, old: &Transaction) -> bool {
             return false;
         }
 
-        if self.flags & old.flags & (TF_ONE_WAY | TF_UPDATE_TXN) != (TF_ONE_WAY | TF_UPDATE_TXN) {
+        let required = TransactionFlag::OneWay | TransactionFlag::UpdateTxn;
+        if !(self.flags.contains_all(required) && old.flags.contains_all(required)) {
             return false;
         }
 
@@ -392,7 +420,7 @@ fn do_work(
         writer: &mut BinderReturnWriter<'_>,
     ) -> Result<bool> {
         let send_failed_reply = ScopeGuard::new(|| {
-            if self.target_node.is_some() && self.flags & TF_ONE_WAY == 0 {
+            if self.target_node.is_some() && !self.flags.is_oneway() {
                 let reply = Err(BR_FAILED_REPLY);
                 self.from.deliver_reply(reply, &self, None);
             }
@@ -415,7 +443,7 @@ fn do_work(
             tr.cookie = cookie as uapi::binder_uintptr_t;
         };
         tr.code = self.code;
-        tr.flags = self.flags;
+        tr.flags = u32::from(self.flags);
         tr.data_size = self.data_size as uapi::binder_size_t;
         tr.data.ptr.buffer = self.data_address as uapi::binder_uintptr_t;
         tr.offsets_size = self.offsets_size as uapi::binder_size_t;
@@ -425,7 +453,7 @@ fn do_work(
         }
         tr.sender_euid = self.sender_euid.into_uid_in_current_ns();
         tr.sender_pid = 0;
-        if self.target_node.is_some() && self.flags & TF_ONE_WAY == 0 {
+        if self.target_node.is_some() && !self.flags.is_oneway() {
             // Not a reply and not one-way.
             tr.sender_pid = self.from.process.pid_in_current_ns();
         }
@@ -477,7 +505,7 @@ fn cancel(self: DArc<Self>) {
         drop(allocation);
 
         // If this is not a reply or oneway transaction, then send a dead reply.
-        if self.target_node.is_some() && self.flags & TF_ONE_WAY == 0 {
+        if self.target_node.is_some() && !self.flags.is_oneway() {
             let reply = Err(BR_DEAD_REPLY);
             self.from.deliver_reply(reply, &self, None);
         }
@@ -486,7 +514,7 @@ fn cancel(self: DArc<Self>) {
     }
 
     fn should_sync_wakeup(&self) -> bool {
-        self.flags & TF_ONE_WAY == 0
+        !self.flags.is_oneway()
     }
 
     fn debug_print(&self, m: &SeqFile, _prefix: &str, tprefix: &str) -> Result<()> {

-- 
2.55.0.229.g6434b31f56-goog


