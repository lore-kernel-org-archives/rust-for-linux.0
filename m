Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC954BCAB2
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 10:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715149; cv=none; b=HyQBOqdWfxL7kLneDJXPADYbE+7kTUm65B40iCRjOxzhSCb79MLMtHP0+QaF/ed9FzkTOjTs5d+2YwANTtO4k3ocwH6/HOjnGROtJTCHfzKI247X5bbLaqHhfYTu8iDQtezJGOt49KpFnmwETMnsLP1HKa9Ql4GN/tRwvlstaKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715149; c=relaxed/simple;
	bh=u8+XbXW/iqU3Zl/tDYSpWCpJulWxkMNYKzxdzveTm3c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RFwwtpiAVoVdV7KCQRuNhulZVBCpQRZewC4l/HnXrDGfu01+Z8sIrtFBN+HikdmyhA7p47oOPkLDVBv+JVR2J38JvHmk1Xn/cdFbBnejRFwFGjc58jfIO3N3ISFelIz1UMkZuZZxCRjhckNOXbmsRBRJHseXzhEiGxLyR+UV1CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cbos2NP2; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cbos2NP2"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47f6e8b5996so4220933f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 03:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784715145; x=1785319945; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OPrehYfXohkL1JQRHKrXSg8FGuetOVxo37j+PsWbvzY=;
        b=Cbos2NP2lgc7mv4usVvt7bJIBRdE6EZU2w7FeBkAM421K6eHYUdkapENl+/i+CDD8g
         ZsCuLhIBtnBblCFJHgYqcjpFK/CI5Xd6R9YEVLxFmuUsfpHqvaUWSoGoHg96JssA6tGl
         Q2y4C7Brk/Y27JMfiNALoJ/ngVjwaa7YKNsImS0VFb4L1FNnBBplVUgcRW1mm+laKE1V
         qcW8SqTiIn7KKClnROItk7EtilNvNdVC3yULfNDp6QfQjOzE7aIhkeNMK1EvO0Phzee2
         0eOc4myVSzS8D+Iq0ZEOn1McH9HMXR03Z4LCap4OSXMtfhQytGJ3a5pF0gnSkI/9HLJY
         h2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784715145; x=1785319945;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OPrehYfXohkL1JQRHKrXSg8FGuetOVxo37j+PsWbvzY=;
        b=szTxe7b0j8eOjPNPNaF26SIF3l85Qcoz2Dwa7se/W9v8IJC77rxegjQ43SLr2V7D/z
         d3ERd1cwuy70mKRzM8GIBh0rxZNNmiiwIuWSLWZWlM4RMZFR9wzgo05IuN6c3nnL8zNO
         i433WTnBOJ0Rp8nXpuD0q1aAmihQ74ohoECNqH7EbsKXsDs+bMTlmHK9gUzgnQrZJo8i
         shsKeWO3KetmXw8RBJRM+Irf8smCX8wcNUKhfPGUxtgfJZ8SIjhvYZcZmRkBgdITEqkn
         chKcOqKTNpYVRrPeCpoz0h2AJV0cYW6uXv/Isnw24IvEMzWnbc1rcQFM1bFGfqSVYBRL
         Tovw==
X-Forwarded-Encrypted: i=1; AHgh+RpA2NViFPx8QlcSqjacaKVommuQIm2WBByCy45p95H12BPy2AVddskktIdZyhlJsgmO5cM4VntI8JuKrkMzUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoefLzJ4r+iVhY2t0rddxTNGts/CwimJCKO9katSKE7RGTAUdo
	8O4mAgAY3XcxCpAMauF3s3MsJba8ZSm0R/Q68zu4HDUAc/zXtwHGrTsJBPp3U3qTCpjvsAmc51H
	Xb7/NuigL6o+mf3OrHQ==
X-Received: from wrtw5.prod.google.com ([2002:a5d:6085:0:b0:45e:edca:cb12])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:22c4:b0:47f:81a9:3f36 with SMTP id ffacd0b85a97d-47f81a93fb8mr6950952f8f.18.1784715144748;
 Wed, 22 Jul 2026 03:12:24 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:12:12 +0000
In-Reply-To: <20260722-pr-ratelimited-v3-0-57faa37fdfbd@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260722-pr-ratelimited-v3-0-57faa37fdfbd@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8538; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=u8+XbXW/iqU3Zl/tDYSpWCpJulWxkMNYKzxdzveTm3c=;
 b=kA0DAAoBBFi+7ljGOUYByyZiAGpgl4GgZJD1g2npFcsrYldSO6FBD9gIOEhhSSuuqEl/bX5ZP
 IkCMwQAAQoAHRYhBIOSopRNZAcK8Ui9sgRYvu5YxjlGBQJqYJeBAAoJEARYvu5YxjlG3DoP/03S
 HadXx/3SMtc/ZZyF/BUUGh40/F06jGYSTTJUMYGh7a0VnLMuXaY75bX0uJvL5sBMz3unF6pXY/B
 XFAiPkugB0O7KMY9Niz4T+bsMFsLcsJ+GOpD6JoEl+SFTZaFR1fx/dHGCq3CYxbXTyc3BtpQ8L0
 8BhNAHhJtG3dA2qDrDdVEKHespVqe7dosE+RKvRKCWdsEVosHVKd4YrG5QXDStaSGiQv/uJ/hde
 /acpQNVcecWIacNxTegKhFIX7ocnHllkNLTS8MZjaXNQNDNVAmEvl7qITF4BowTeMKaevn9sru8
 pJPO688n5B4wuoO7SILRbkeOxHV5jvZTjFw0tzQpwF0u1bQSVH1Kf5X/u0NqfdoVrilsOrELfGV
 8YjE/Oookom5J2UGVbNSQymG15zuLIPasKVkW6fu1WEZ3Spkcen1vLKZXV6Zo0oXTHw+HXbjGkB
 f6KHHSAWpgCO1+OYKFhV3gUVTqI1kU5FfzghNUoEIHzN2beFjUhtykt9sS7wMYBE7T80OArjieg
 DxjXa8xguXPw0mSN8Wu6jRldX4qc3len5jaRPRAtaf3tbGW8t6xrh4GWar6TvjK7aGN/5ROx6nz
 48C/acc2vbzYLUwCZHkyIyYU9R5H0LnDr3UU8l6BztKI9QPOpRn+qsUIzRClY/n4qicwwoEAHdj m45T+
X-Mailer: b4 0.14.3
Message-ID: <20260722-pr-ratelimited-v3-4-57faa37fdfbd@google.com>
Subject: [PATCH v3 4/5] rust_binder: consolidate transaction failure prints
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

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/error.rs       |  4 ---
 drivers/android/binder/thread.rs      | 55 ++++++++++++++---------------------
 drivers/android/binder/transaction.rs | 20 ++-----------
 rust/kernel/error.rs                  |  2 +-
 4 files changed, 26 insertions(+), 55 deletions(-)

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
index a51821dde0ad..44ad4c2e8786 100644
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
@@ -1022,17 +1022,7 @@ pub(crate) fn copy_transaction_data(
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
@@ -1283,6 +1273,9 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
             self.transaction_inner(&mut info)
         };
 
+        // This runs when return work is passed to the caller. This is not
+        // always the same as the transaction failing, as reply errors are
+        // delivered to the remote process.
         if let Err(err) = ret {
             self.push_return_work(err.reply);
             if err.reply != BR_TRANSACTION_COMPLETE {
@@ -1290,13 +1283,21 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
                 if let Some(source) = &err.source {
                     info.errno = source.to_errno();
 
-                    {
-                        let mut inner = self.inner.lock();
-                        inner.extended_error =
-                            ExtendedError::new(info.debug_id as u32, err.reply, source.to_errno());
-                    }
+                    self.inner.lock().extended_error =
+                        ExtendedError::new(info.debug_id as u32, err.reply, source.to_errno());
                 }
+            }
+        }
 
+        if info.oneway_spam_suspect {
+            // If this is both a oneway spam suspect and a failure, we report it twice. This is
+            // useful in case the transaction failed with BR_TRANSACTION_PENDING_FROZEN.
+            info.report_netlink(BR_ONEWAY_SPAM_SUSPECT, &self.process.ctx);
+        }
+        // This runs when the transaction failed.
+        if info.reply != 0 {
+            info.report_netlink(info.reply, &self.process.ctx);
+            if info.errno != 0 {
                 binder_debug!(
                     FailedTransaction,
                     "transaction {} to {}:{} failed {:?}, code {} size {}-{}",
@@ -1309,7 +1310,10 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
                     },
                     info.to_pid,
                     info.to_tid,
-                    err,
+                    BinderError {
+                        reply: info.reply,
+                        source: Error::try_from_errno(info.errno),
+                    },
                     info.code,
                     info.data_size,
                     info.offsets_size
@@ -1317,15 +1321,6 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
             }
         }
 
-        if info.oneway_spam_suspect {
-            // If this is both a oneway spam suspect and a failure, we report it twice. This is
-            // useful in case the transaction failed with BR_TRANSACTION_PENDING_FROZEN.
-            info.report_netlink(BR_ONEWAY_SPAM_SUSPECT, &self.process.ctx);
-        }
-        if info.reply != 0 {
-            info.report_netlink(info.reply, &self.process.ctx);
-        }
-
         Ok(())
     }
 
@@ -1407,12 +1402,6 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
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
index 13dfb5c5c955..9c9e11d08c7e 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -139,21 +139,13 @@ pub(crate) fn new(
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
@@ -194,13 +186,7 @@ pub(crate) fn new_reply(
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
2.55.0.229.g6434b31f56-goog

