Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF30E2E8B82
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 15:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229100; cv=none; b=mtNSNtiWjBvBsw9zvZZAZiZLBFoTG6RAdp88UfDVlPttopjwgJioJR7Bjj2bHAZYTJoHiUWPkDK9X9aeHGmK65S6afUUgXBb9Ndyso1XSrXLx6V3q/XwXs5yf5KO9mgVgNalJXA1GuKg5Zv5PbeQWLEijopqoFUSDeMh1D1rX64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229100; c=relaxed/simple;
	bh=9jF5leQM7fhJ6qx5b4DTkepz5UIc5ydWzqSPxEgarhM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ezFqc0tu8dz/v4QGgyGBEyTpDNfojyDM4nSXCfhGUfHUZQcszsen6j//ZSttXeOkmLtFI1ptPwDSBxYxOfA06Pj8N/wMxAKLLmLkwvdRzM9JsRWosmSd5iW8aRhnviQUM2dTc2/Z+uVCf3nKUb8uE6YQw45VhAs8NQPls8szvbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mqkl+rZQ; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mqkl+rZQ"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-695796f97aeso6059250a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 08:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782229096; x=1782833896; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6OS66yqSTVH7SnBJixlBZKon1LrkOKu0gmbWPYRXCQ=;
        b=Mqkl+rZQ3hPtf2x4Y6HCHhDM24uz2eilJK7CZl+aVnK8ew5vUMFRiKZaDauVgBweAy
         8T2j+4bMKFUIM6k7CmRBkErOF3iuqnQCwd5m2+/VkyplPws0Zzn8RdO6F1I8mDmrzk68
         w0lectObjSjtUhp/nEd9r0cfi2aN56tKs7/Hr1ETUkRrKypOhI9+2AFCAzk86TP/p5dL
         msxxTPzSyyDkplSDEVo6php4GT1yGI01S+NNgEzWKSNJ0aOY0w3bUe4U7EQWwm1809kq
         OW6cTTijlfDRyzhdYoNNYR4yaGfyzvBnszRfARLZG5Q3EYFi7lv/+fnll9qQ7l+Kt+oR
         r2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782229096; x=1782833896;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6OS66yqSTVH7SnBJixlBZKon1LrkOKu0gmbWPYRXCQ=;
        b=Es/Vffrg+1tEJCCPtEaEEIHmtQ689iqCLurv03mwGHAt0+zJXvz/rNke0FvuxEEVCY
         df0/65gO62vczAY5eRsW8SfSzcQsLQGzl0RJCsWgb4amHNd59Gu4/b1d2D89TxOJhL+1
         vD/3IQki/Gn1EMfyaLd9XpfNMWrPCsDee8nVo4kRDK6laXN/3SoKJjkXJFBNGo/sRpZE
         aXwBK8dcYburvqARzo6UxllM6kgoOBjrfmhlN8tNdmjRAMomRMP1bfe0KL+eS1AQ7+K9
         A+TUYbIQDBRLC8gN+D5iibxBUfdIkiBJOQezfGoblQMNhDQem1rbeN5hBBOFkpxs/nXx
         nuIw==
X-Forwarded-Encrypted: i=1; AFNElJ+SLJg8jxFgR4X0QjMBxWt+78qt/iv8RmNI8nfHM49LYq9Jq24odJPyiDpavhfcyS4SpPvzsArlJe31JlyjNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7PGoCU7SBRCdyjGuf0BiPbRLYfsIS/4Pp3aIPQO9ZJUPjeXMD
	JLP6YdbNYn2/r+D0/zQ7z5T5QwpGW7qRDxIEInPodu8V39MMADdCSWoCBMtkcSKyEzDjWC1dhKI
	iHpKD6ti45CsZ0dKsrA==
X-Received: from edfy12.prod.google.com ([2002:a05:6402:a3cc:b0:697:d55a:76a8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:144d:b0:697:4e2c:c8ce with SMTP id 4fb4d7f45d1cf-697dbb3b56amr2084527a12.15.1782229095935;
 Tue, 23 Jun 2026 08:38:15 -0700 (PDT)
Date: Tue, 23 Jun 2026 15:38:07 +0000
In-Reply-To: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8896; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=9jF5leQM7fhJ6qx5b4DTkepz5UIc5ydWzqSPxEgarhM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqOqhgEJmSTuo5dmkeWd3MY+3aZS1MGmTpuAMaF
 ypHQdDos7mJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCajqoYAAKCRAEWL7uWMY5
 RnASD/wMFe5FEHC0OLIIIGNi1y1s3PNIT7GSYVQFKOnxlOYkgnVnedSuyOZirOJAGcj4p14wRRR
 UaXDtApoOCkLHZm/HcQPho08SXSSIRaITVcSUlhaGS/vQktNdgGwpby5H6Ae7KOoPA39KyY4It6
 x5hWrP8d7CaQqQUXPn81b/Qbe8V9ngFsQA9JWijJB7RBnbfJbQznpLUbTZvwjAVeDI3IqWTVbrr
 G7UjElB4jxQ97Oquz1OjCU0vocvVqPM5qj06zNh2FlPO8r2FhOZCoHdBSZOIt+WDA/eIfWYUCIW
 ER5+GaHI8CgMrTt4i3NMEKvKJdCM5r7DzVTNxR/s+KsCTEUoUuKVga4GQh7/xOtuRF9rjl61Awk
 IBTkvi3//1N7yCk+b6lhbabWaAAlu5pjtb31Z+5R5OGAFzGpVl7kBpSAS6/1ZBEhuGHuEiRkBCn
 MOWQjrubnYt6x8Bmi9CUtYF83scCzIO+wvtt+3d5wDhUx8XwJ4i0a3l4R2VjQjP+SPp3QnN75+e
 XL8mpRvW8HTQU1okocTnmT3tLIgdqvLKjoKc8juNZEAVy+kX9QssQveysI2D9voIZgTEEtSl/uL
 MEL46Ka8cSpuFU1Q9fy9/M0om1XsYs6Zwntt3uq354vpE02mt5HjSkwinU9XOpEBaWADNOMOAZH bHy7EiQ17eODajQ==
X-Mailer: b4 0.14.3
Message-ID: <20260623-pr-ratelimited-v1-4-cc922f544dc0@google.com>
Subject: [PATCH 4/5] rust_binder: consolidate transaction failure prints
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

When a transaction fails, it currently hits multiple pr_warn!
invocations meaning that a single failure can result in several lines in
the kernel log. This is unnecessary, so consolidate them into one print
used for all transaction failures.

For ENOSPC errors we want to know the transaction size, so a field is
added to TransactionInfo that bubbles up this information to the new
print location.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/error.rs       |  4 ---
 drivers/android/binder/thread.rs      | 59 ++++++++++++++++++++---------------
 drivers/android/binder/transaction.rs | 21 +++----------
 rust/kernel/error.rs                  |  2 +-
 4 files changed, 39 insertions(+), 47 deletions(-)

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
index def00edce9c4..a5b038877747 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -25,7 +25,7 @@
 use crate::{
     allocation::{Allocation, AllocationView, BinderObject, BinderObjectRef, NewAllocation},
     defs::*,
-    error::BinderResult,
+    error::{BinderError, BinderResult},
     process::{GetWorkOrRegister, Process},
     ptr_align,
     stats::GLOBAL_STATS,
@@ -1018,18 +1018,9 @@ pub(crate) fn copy_transaction_data(
                 .ok_or(ENOMEM)?,
             size_of::<u64>(),
         );
+        info.debug_total_size = len;
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
@@ -1259,6 +1250,15 @@ fn read_transaction_info(
 
         info.debug_id = super::next_debug_id();
 
+        // We don't yet know the real message size because it depends on the secctx size, so for
+        // now write an estimate. When the real value is computed, this estimate is replaced.
+        // Writing an estimate here ensures that the approx message size can still be printed if
+        // the transaction fails before it is computed exactly.
+        info.debug_total_size = info
+            .data_size
+            .saturating_add(info.offsets_size)
+            .saturating_add(info.buffers_size);
+
         Ok(())
     }
 
@@ -1277,6 +1277,9 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
             self.transaction_inner(&mut info)
         };
 
+        // This runs when return work is passed to the caller. This is not
+        // always the same as the transaction failing, as reply errors are
+        // delivered to the remote process.
         if let Err(err) = ret {
             self.push_return_work(err.reply);
             if err.reply != BR_TRANSACTION_COMPLETE {
@@ -1290,13 +1293,6 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
                             ExtendedError::new(info.debug_id as u32, err.reply, source.to_errno());
                     }
                 }
-
-                pr_warn!(
-                    "{}:{} transaction to {} failed: {err:?}",
-                    info.from_pid,
-                    info.from_tid,
-                    info.to_pid
-                );
             }
         }
 
@@ -1305,8 +1301,27 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
             // useful in case the transaction failed with BR_TRANSACTION_PENDING_FROZEN.
             info.report_netlink(BR_ONEWAY_SPAM_SUSPECT, &self.process.ctx);
         }
+        // This runs when the transaction failed.
         if info.reply != 0 {
             info.report_netlink(info.reply, &self.process.ctx);
+            let err = BinderError {
+                reply: info.reply,
+                source: Error::try_from_errno(info.errno),
+            };
+            pr_warn!(
+                "{}:{} {} to {} failed: {err:?}, {} bytes\n",
+                info.from_pid,
+                info.from_tid,
+                if info.is_reply {
+                    "reply"
+                } else if info.is_oneway() {
+                    "oneway"
+                } else {
+                    "transaction"
+                },
+                info.to_pid,
+                info.debug_total_size
+            );
         }
 
         Ok(())
@@ -1374,12 +1389,6 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
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
index 9aefa01599fb..316627e5f9ac 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -39,6 +39,7 @@ pub(crate) struct TransactionInfo {
     pub(crate) offsets_ptr: UserPtr,
     pub(crate) offsets_size: usize,
     pub(crate) buffers_size: usize,
+    pub(crate) debug_total_size: usize,
     pub(crate) target_handle: u32,
     pub(crate) errno: i32,
     pub(crate) reply: u32,
@@ -138,21 +139,13 @@ pub(crate) fn new(
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
@@ -193,13 +186,7 @@ pub(crate) fn new_reply(
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
         if info.flags & TF_CLEAR_BUF != 0 {
             alloc.set_info_clear_on_drop();
         }
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 05cf869ac090..89c247f150b3 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -137,7 +137,7 @@ pub fn from_errno(errno: crate::ffi::c_int) -> Error {
     /// Creates an [`Error`] from a kernel error code.
     ///
     /// Returns [`None`] if `errno` is out-of-range.
-    const fn try_from_errno(errno: crate::ffi::c_int) -> Option<Error> {
+    pub const fn try_from_errno(errno: crate::ffi::c_int) -> Option<Error> {
         if errno < -(bindings::MAX_ERRNO as i32) || errno >= 0 {
             return None;
         }

-- 
2.55.0.rc0.799.gd6f94ed593-goog

