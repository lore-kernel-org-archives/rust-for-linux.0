Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA1A3AAF53
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 07:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742216; cv=none; b=KXgN/YwjJElLNzDyYs3NgJrquW+SjlD0MeIbG1gvLM/c/PitMTQAX1snJ1Az/wkCxZ4GnvXpwvcrNRZFgEGciwz3NCBB/g09zisZl1fsc5wKTHe/B0P/A50eD30bmCCg3FjCTP+MSBAj5WuUQ7cBBguBq7+k5jcCO8C5d2aCXn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742216; c=relaxed/simple;
	bh=kR3igSBMNuHw5DyXS0ecHl3gAcxwBpKtHQmxuHd74C8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oAO6xp+bRPMOmv4NgpAcf47t8Yh8k+l4zXF+5cyJ9/xIZP8qJk4tmLDQeebS0/SN26kW8cQIdhkxPihrM6uADqosOiN5D4AsjqQirBpjYIqwS1+mrN4r3JsnwUMufagGucOE6wEoQy1DsHvMGkyxT1WqjF1j0oZU5E2MTDJ75s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=biub70tV; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="biub70tV"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4955ce558d8so18711885e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Aug 2026 00:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785742210; x=1786347010; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATqpTG9YB6fyY1MztwiHEaptgvNM5wT6TJQAgysBebM=;
        b=biub70tVb6Bwk4ZON7XxRcty7a58HMCjAoKjbO04VwU9jr06cbA2CKZIPgzj2DuQmO
         Im/g0fz6RL9opKgcfb+GdJ/5W5llNXG0i1XrG7SHNYV2gu91erpn9XdUSUA+SxK8iLIh
         lJBvNdpwe7KRlxGjKjZr/P48Hs9XOuRRP12tACKjM6PG1MFyspVH0FY0+eGP5e3FtkzO
         8YDl8Wpv1cw0TX9mB9hlWVJKVLCkSz0WsSUsz0BAh+AW9ERinpypTGImXJOjRV6pDdzF
         5XCfXxFY/x4iS8xCi5evE+oOlIr9/hOnQ6rmqZ39j8GXGF4f4mJrYp7/sz1owlk631L8
         Y66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742210; x=1786347010;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATqpTG9YB6fyY1MztwiHEaptgvNM5wT6TJQAgysBebM=;
        b=q/0xO2brpsqLv5kVd+/zHzNjoCGTMkOSBRxxAe+HQ9nb5fh2+fEKf0KZtjvJGrzUg0
         CRKln6ynyizw1u+jOXo0KXbbKuyMXz9ZuMqUnuZgHrkrREd29a+2E8ktbXYiLn0SJAFy
         MyOvFrpujhVkHkZIAh4RxFJ3aDMfyPCbRDen22/1UIbLtSlLqcCt0Wmapu2R5DitVsIW
         Tn8YboEAtZ8ZdW0eyFVEA7pAidVyw9TAnQlBwK/XV/L4cQoE9dIaSxkPyF8xg4SXA2HV
         VHIa9Dd7Ez/3qzHCyAUImikv7CqB6wvKk2s50y2cyZYFe/S9Q1p7PLuDQBYXSY+kBhn5
         IOuQ==
X-Forwarded-Encrypted: i=1; AHgh+RolbEPlnlYSfta1r4WUyMqm5RPZ0dkZyBk+byE2E3ikHKrkoKVqk6bBqJ1lbGIoEYqxrWOLndhPkUp2O1zWWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv3iZdSxmyOQDzMeEd2l35VP2Jk1e1MTHrGnvOugjycfd8sGM+
	qspuspb+16L76Zi818STHFtlcRIBDMllcKgA2d2rf+skx2iKGZxMPE2yIVuXGxRMYyuHZjglCle
	ZD27169FQq5Fb80zekg==
X-Received: from wmbfp13.prod.google.com ([2002:a05:600c:698d:b0:490:b058:c623])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6990:b0:495:4d00:2fc0 with SMTP id 5b1f17b1804b1-4980c673907mr201254305e9.12.1785742209796;
 Mon, 03 Aug 2026 00:30:09 -0700 (PDT)
Date: Mon, 03 Aug 2026 07:29:55 +0000
In-Reply-To: <20260803-pr-ratelimited-v5-0-a77d456de974@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260803-pr-ratelimited-v5-0-a77d456de974@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8830; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=kR3igSBMNuHw5DyXS0ecHl3gAcxwBpKtHQmxuHd74C8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqcEN4USNgBKMPS/gQxSmcvb68AG7oIC/QpzoEd
 GPcd5J6t8iJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCanBDeAAKCRAEWL7uWMY5
 RnDQD/0X+OLrvYqM1gR4NCPrZ8ULyFKn30S8aZqZlU41NH1O+SMjYtdCvIuyG69u/qtehQispd0
 r13yxBFVUHLXuaP8JRl7qEasuxwHR0EofD8hnmR1v+wI/oy8OHNUen+L6FETiEKw6QDMp9k48Vn
 aAnEDa8VL44OMGfgcrrvXZLZEyRERE6GLcrE8uNdymXwoJmsMWePw/dEn7VB93+Ev8wOd6L4sGV
 KJReaAffs/tlvXUC+JeFjGIuGR75UnKNtBVEZHvLQGBaI0/M6MHeaX4TnKUlMunujCVapzbHSfP
 Qotvnyr6fhnR/lRFEVbqf7BGnXSZSLuhLEdaJU/WoFyheu3KEuYEeCkCb6WSyDo8/l5R4ofZqZd
 JcAZO8cKRrtM1wpUBEUHrPtHDYK9SEKGVmCIKpUgJ4JNyM/XEzQ6hriSdSoU2EmstuEZ2VadmMH
 U6KYXjgVZIeb7LkrSV5sfsM3tAQWk4+tVAkNBBFXT8DuBWYm8ynGAypWzq1uhtdFJdcKdzfYJ/H
 vx5s/rMm8j9d3kWWrHN46Ghqzo69O6riM+2nigMlmFr9kSMiruTQSuBL19ov8kWrhT865QShosy
 T0ANZBlkBwaCmGxEYwFMfvgli0R3F2RrYEdWP6NjNQcm0EGoLr5TuezzROo2YFgxzhOYHP4e/Rs nORHAjAphiY2yZQ==
X-Mailer: b4 0.14.3
Message-ID: <20260803-pr-ratelimited-v5-4-a77d456de974@google.com>
Subject: [PATCH v5 4/5] rust_binder: consolidate transaction failure prints
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

When a transaction fails, it currently hits multiple print statements
meaning that a single failure can result in several lines in the kernel
log. This is unnecessary, so consolidate them into one print used for
all transaction failures.

Acked-by: Carlos Llamas <cmllamas@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/error.rs       |  4 --
 drivers/android/binder/thread.rs      | 71 +++++++++++++++--------------------
 drivers/android/binder/transaction.rs | 20 ++--------
 rust/kernel/error.rs                  |  2 +-
 4 files changed, 34 insertions(+), 63 deletions(-)

diff --git a/drivers/android/binder/error.rs b/drivers/android/binder/error.rs
index 1296072c35d9..aed1c747640b 100644
--- a/drivers/android/binder/error.rs
+++ b/drivers/android/binder/error.rs
@@ -37,10 +37,6 @@ pub(crate) fn new_frozen_oneway() -> Self {
             source: None,
         }
     }
-
-    pub(crate) fn is_dead(&self) -> bool {
-        self.reply == BR_DEAD_REPLY
-    }
 }
 
 /// Convert an errno into a `BinderError` and store the errno used to construct it. The errno
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 18a14aa8a835..bdc43864f5bd 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -26,7 +26,7 @@
 use crate::{
     allocation::{Allocation, AllocationView, BinderObject, BinderObjectRef, NewAllocation},
     defs::*,
-    error::BinderResult,
+    error::{BinderError, BinderResult},
     process::{GetWorkOrRegister, Process},
     ptr_align,
     stats::GLOBAL_STATS,
@@ -1034,17 +1034,7 @@ pub(crate) fn copy_transaction_data(
             size_of::<u64>(),
         );
         let secctx_off = aligned_data_size + offsets_size + buffers_size;
-        let mut alloc = match to_process.buffer_alloc(debug_id, len, info) {
-            Ok(alloc) => alloc,
-            Err(err) => {
-                pr_warn!(
-                    "Failed to allocate buffer. len:{}, is_oneway:{}",
-                    len,
-                    info.is_oneway(),
-                );
-                return Err(err);
-            }
-        };
+        let mut alloc = to_process.buffer_alloc(debug_id, len, info)?;
 
         let mut buffer_reader = UserSlice::new(info.data_ptr, data_size).reader();
         let mut end_of_previous_object = 0;
@@ -1295,6 +1285,9 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
             self.transaction_inner(&mut info)
         };
 
+        // This runs when return work is passed to the caller. This is not
+        // always the same as the transaction failing, as reply errors are
+        // delivered to the remote process.
         if let Err(err) = ret {
             self.push_return_work(err.reply);
             if err.reply != BR_TRANSACTION_COMPLETE {
@@ -1302,29 +1295,8 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
                 if let Some(source) = &err.source {
                     info.errno = source.to_errno();
 
-                    {
-                        let mut inner = self.inner.lock();
-                        inner.extended_error =
-                            ExtendedError::new(info.debug_id as u32, err.reply, source.to_errno());
-                    }
-
-                    binder_debug!(
-                        FailedTransaction,
-                        "transaction {} to {}:{} failed {:?}, code {} size {}-{}",
-                        if info.is_reply {
-                            "reply"
-                        } else if info.is_oneway() {
-                            "async"
-                        } else {
-                            "call"
-                        },
-                        info.to_pid,
-                        info.to_tid,
-                        err,
-                        info.code,
-                        info.data_size,
-                        info.offsets_size
-                    );
+                    self.inner.lock().extended_error =
+                        ExtendedError::new(info.debug_id as u32, err.reply, source.to_errno());
                 }
             }
         }
@@ -1334,8 +1306,31 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
             // useful in case the transaction failed with BR_TRANSACTION_PENDING_FROZEN.
             info.report_netlink(BR_ONEWAY_SPAM_SUSPECT, &self.process.ctx);
         }
+        // This runs when the transaction failed.
         if info.reply != 0 {
             info.report_netlink(info.reply, &self.process.ctx);
+            if info.errno != 0 {
+                binder_debug!(
+                    FailedTransaction,
+                    "transaction {} to {}:{} failed {:?}, code {} size {}-{}",
+                    if info.is_reply {
+                        "reply"
+                    } else if info.is_oneway() {
+                        "async"
+                    } else {
+                        "call"
+                    },
+                    info.to_pid,
+                    info.to_tid,
+                    BinderError {
+                        reply: info.reply,
+                        source: Error::try_from_errno(info.errno),
+                    },
+                    info.code,
+                    info.data_size,
+                    info.offsets_size
+                );
+            }
         }
 
         Ok(())
@@ -1419,12 +1414,6 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
             // At this point we only return `BR_TRANSACTION_COMPLETE` to the caller, and we must let
             // the sender know that the transaction has completed (with an error in this case).
 
-            pr_warn!(
-                "{}:{} reply to {} failed: {err:?}",
-                info.from_pid,
-                info.from_tid,
-                info.to_pid
-            );
             let param = err.source.as_ref().map_or(0, |e| e.to_errno());
             let ee = ExtendedError::new(info.debug_id as u32, err.reply, param);
             orig.from
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index 245f1556b5db..81df588d96ad 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -166,21 +166,13 @@ pub(crate) fn new(
         let txn_security_ctx = node_ref.node.flags & FLAT_BINDER_FLAG_TXN_SECURITY_CTX != 0;
         let mut txn_security_ctx_off = if txn_security_ctx { Some(0) } else { None };
         let to = node_ref.node.owner.clone();
-        let mut alloc = match from.copy_transaction_data(
+        let mut alloc = from.copy_transaction_data(
             to.clone(),
             info,
             info.debug_id,
             allow_fds,
             txn_security_ctx_off.as_mut(),
-        ) {
-            Ok(alloc) => alloc,
-            Err(err) => {
-                if !err.is_dead() {
-                    pr_warn!("Failure in copy_transaction_data: {:?}", err);
-                }
-                return Err(err);
-            }
-        };
+        )?;
         if info.is_oneway() {
             if from_parent.is_some() {
                 pr_warn!("Oneway transaction should not be in a transaction stack.");
@@ -221,13 +213,7 @@ pub(crate) fn new_reply(
         allow_fds: bool,
     ) -> BinderResult<DLArc<Self>> {
         let mut alloc =
-            match from.copy_transaction_data(to.clone(), info, info.debug_id, allow_fds, None) {
-                Ok(alloc) => alloc,
-                Err(err) => {
-                    pr_warn!("Failure in copy_transaction_data: {:?}", err);
-                    return Err(err);
-                }
-            };
+            from.copy_transaction_data(to.clone(), info, info.debug_id, allow_fds, None)?;
         if info.flags.contains(TransactionFlag::ClearBuf) {
             alloc.set_info_clear_on_drop();
         }
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index a56ba6309594..380cd3f7276b 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -135,7 +135,7 @@ pub fn from_errno(errno: crate::ffi::c_int) -> Error {
     /// Creates an [`Error`] from a kernel error code.
     ///
     /// Returns [`None`] if `errno` is out-of-range.
-    const fn try_from_errno(errno: crate::ffi::c_int) -> Option<Error> {
+    pub const fn try_from_errno(errno: crate::ffi::c_int) -> Option<Error> {
         if errno < -(bindings::MAX_ERRNO as i32) || errno >= 0 {
             return None;
         }

-- 
2.55.0.508.g3f0d502094-goog

