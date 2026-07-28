Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFD241E6A6
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 09:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231190; cv=none; b=qOTJk1HsCnrtBgaKD7F4zndHTNY/lk1uQDAY59T+VnUswg8fLvQ9c2tNpsSM+W8v5tES4ri0f5fla0q/FIW0uEfTcb0pd1Jka7qc/rwGnbpO6D8bYF902qkh58uEErGMMCtL92730gCoc4GzBAGs6DCiwfJfiH35rojwndD4PuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231190; c=relaxed/simple;
	bh=gVjhXZpBoUVAmGSbFx+etKJxiyDVA3ym69G+snS3y98=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=riFf5L+WNio/VSefYC73v0XD+4Z/gnu5OW2Fq5V9xrvBnkGYw6QkuFhCc8pFCxlQZuEYKhbtkXTnx7zUBRnPvJ/HfqUzD5sUMrQ1g4p6KNXvs+LMyeNfPIfW90w4ocBuGbeeu/POC/0eNLcEkx+edi7p62j+gyMRYt5nzXpfThQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pxFuccxQ; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pxFuccxQ"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-495529a93f9so32428025e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 02:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785231187; x=1785835987; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=emeZAOqhJSguP7RRtkSUnApMJwECBEyZSrFXh7XK7Tc=;
        b=pxFuccxQXFk5dKQr6fElM7QLdngEk1wVrVtlmNqZbD34sQy9sNJv9+h92dNQLdZ44R
         X9EtKyt2zyn6xzQ8xGspmtfJGhQunUKvGyi+wmLXQLsWhkC776mJQtn9Cy9e6bEim2mz
         jVQ1GZySvBM/CvfR8av6Ue7aAW/up7vYiDa3k85N6dv/g4SVOqtMmGP2SNEtdCzbVC2b
         4KObVX6unpity903TFAsHcmKUPjfEGm0zDI1lEjuYCMwq+8ICJiKZXpSuU0GOyT8j4J5
         /e6DJ+c4g+pVk13ZLy99hySUCUIfS/Wi3TO+MZTO6Khl/uT1jIlF7zjgfUaJx6Su1tkg
         HcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231187; x=1785835987;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=emeZAOqhJSguP7RRtkSUnApMJwECBEyZSrFXh7XK7Tc=;
        b=Mmsl4MzM5rT0/iLl4aukYLUAV+x2eutFwgvMbUghJzpl1NjtNDA/9sC7dHo23//7+r
         qctgjf8WSIxw2ohx4SGcEiqsFfj7N/ESs+bbKTWDWSGqpCmjJqMJsS7iWnq2gtpmwkoE
         n+je2RkaIc5iB14DYSK3Kd47+cqMAtaJxsIQQRwzU4iE86rtpShnfy6rEM+1+hPiJnxZ
         ik6BNdx9I1irH8DWwzrWzF4UFeBZK0wCKQrezfG6XYxhzRocOPuux7EBXF0fpcNTCqrZ
         zWm1NvW2lDTFwYTp/jWEiU6/D5ttN07Jwu7ceSZVkqU2aVVcgd/Diq4/MHZ9x9C8uqC1
         TzHQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZmgeoyskZ3/ecxHiCRsIbUxTNOg7RtiP6dVCE6nT+WyQqYmX9+tg442P3oYjEZtTb7u5O7hSufktPrIm3Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzel77nNfFOr5pVsA90m5fBL5Ee//FZwskNHY+YF9uEQ9zckeF9
	muqRw7JkmF7zaC2jqA1Og0PjWk9PPVmadIbnMwvBo9Dbqv8OI3UsqH1Mpb3Xg+Ekp5EEwfq050/
	/kXe0Km38P4ka338+qg==
X-Received: from wmot19.prod.google.com ([2002:a05:600c:4513:b0:493:fb57:3896])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:529a:b0:493:be13:98b with SMTP id 5b1f17b1804b1-496c6569042mr16503775e9.23.1785231186419;
 Tue, 28 Jul 2026 02:33:06 -0700 (PDT)
Date: Tue, 28 Jul 2026 09:32:54 +0000
In-Reply-To: <20260728-pr-ratelimited-v4-0-435f8d6e9605@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728-pr-ratelimited-v4-0-435f8d6e9605@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8767; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=gVjhXZpBoUVAmGSbFx+etKJxiyDVA3ym69G+snS3y98=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqaHdLHC6uHberWU4yf4CYCy3MBz1n+4daovH7U
 llC3UTd45eJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCamh3SwAKCRAEWL7uWMY5
 Rj3CD/9bzsKCE7wMUvuiv3ELZnUG0R+jitfABs5FVchyoWXtzudNUW/S4ZmhgQALQxy0d7+Ds5D
 Em3ftwZR/jGxs8OPCgRsRuoq9t28KdF6/1NeB48eHtQiJJC0ZuvCh961TrpM1yJgN15hSB2drTK
 OGSx+ne9aIfTLjtj5ylMN4/UiUH6C3b3dmQmSuh2MjxQ/PZwEMfhKKRIvBFKZQh3f9nejdYvWbn
 l03SZWMardj9L0rjRlw3ZhDFTJfHwDQRjD0TZmvSvmGlHFVvYKVqWopZ6UWMcfH77X7D0UuOcLF
 CqqQiEDCSS+BzVaEiPXqPguuYhEkCaD972YwuH4GjqG2WIvuX8RAT6BcveUTXg/EiAuGkhhBVff
 dx3RRTxzQ8nlYVCQv0tE1iVLTcuLGxyjob6yTsqzKlvSPruPOXJt4CuNcyPZ6WlH2O4ClrJsCI6
 esahXjpgel+BvmWkDCeXEMMqwiCru7J53F6j7g4lIto0o+O0K1HHsRE/eeLfgE75IFFOoPmebtn
 mhRYNHDKpZ6Kby9ZsbGh+wfa4Hqe1d0pIdHgVIiQbCCSn8WBVXPoc+ktMowbzl9qjNm2w/r2s+9
 KaRwqbA1/xAWEgsitZd9NSfCtibypALplNVbKg1vOXucT2scDyaCkflxNLbSF/yar+FXw0otCoy AVxxToXiyuOeH4Q==
X-Mailer: b4 0.14.3
Message-ID: <20260728-pr-ratelimited-v4-4-435f8d6e9605@google.com>
Subject: [PATCH v4 4/5] rust_binder: consolidate transaction failure prints
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
index 96e69eb1539e..44ad4c2e8786 100644
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
@@ -1290,29 +1283,8 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
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
@@ -1322,8 +1294,31 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
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

