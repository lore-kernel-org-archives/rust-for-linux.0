Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCAF4FDA4F
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 12:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895087; cv=none; b=c+9fZopHcASG/EtTnHDx4kTrHZnh/Kr8ko2+RI9kUyF0cRDly0ktBFRgN/RB3SElnwnbOZ7rkHr+V3Op1WN/N0AgP8YZkEpZGkfrsqYjnXVCxwQOrrmVEDoyL5hSZp+fyryEDnEuexzoEXQkMlUIppIPC13GFqV0Xu1Yu/0LmHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895087; c=relaxed/simple;
	bh=VTf/NXYjc8H/9QTD6PmEu2SPvP7P4c1EO6ptCXjgTy8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Li9rIIRYae7Egu5vQl5XIo7xaQdwfm8LMOgsz2uyRzygR2B8kKW0+vvir1Y1Pz1rsnJdYlU8oVEZDukPhzIpWzfV6S6F5/NZHZGR3lP4no8LB2ieIuhWGvczkjGfSSpK3S3TeDHAfhocDf+XTwFupejeidjt0rqR+3i7odzbGE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kbzg2osW; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kbzg2osW"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a0228f4a1bso16906035e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 05:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791895084; x=1792499884; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/k2+io2rHynNSaY9Gu5miaGgXdOUtzLwmEF/+pw2tU4=;
        b=Kbzg2osWi+G7ShDiD2EE7jHD3AkqPed1xSIu5hmBE5/qkvK7eJ5bepe7HyjKF7fb+G
         fUDUit/YyNvBya2KxcxcQx7KEKoNyEWfCxFnAk64w1PQDy2kbcAkdhu/hjPjEF9/uEoF
         mnGjRN1W8X17DR0ljQZfHeHAWuqgQBLhazHjQ63aa3DTJKqrK2+cjyr2BWdT/bzb/ZSr
         u3PJyMHkUc0h//N+VLnSkMBBd924BR9+JLnyaglSb4FgyqjUK/k65pAfaZPUaSioJZku
         AvshENmoJMcZyA9x0+AhMTL7fi9PXXZqG+04Dfwzq2quGHb9K8HuV2/lYVdcwhNzHNRD
         Z33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895084; x=1792499884;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/k2+io2rHynNSaY9Gu5miaGgXdOUtzLwmEF/+pw2tU4=;
        b=z52dmktU/yS2wFNLoX6kzOG2dkzEVII9JlIprmSLrXzFsg7aeAVvBiLz6co8zfo7uN
         tFlXFYpEZlYt3Jh3Nk+3vm3F3Ec2qf1l2O0825zn9cxJxLpmEFVyIZlTVLPXW5WHwyYd
         phOcu3526RMBRYilLVtBacPYLZUWvirH3yYR+XS5XfOZ/3+yg52Jx5XLhwPBArzL8c+M
         htt0uy5BHPpT/xDGwKa/FqPJc7cSsIHF95paepx0gc/Ndz+g5I8FP3geySbhoU+LRGGx
         IjOC5h0NyDxkfkXYagY8mHQbQ3DhdMEu3GJVLjTN37jZp2st/8s4qEoiBf3TTKiIQC/y
         sv/A==
X-Forwarded-Encrypted: i=1; AKwUvBy8ZrE3o9qj4mYtCkRT50zqME89fuuMQqANKMdi8CRy1b5ZyBPR/01yFEz+bAEdEgEMWgmwDKpirGWXUjcQNg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5L83PA8ugx1iNncYK1n4nAUhvhuEGwdUL0k67TGCDgI33yOIR
	aIIjq/0dcA0K41f7LjeYmrCNw9dTLoxrKZpk7YUXEHsW4f6fXP4KN0aWOLJhH3By5ZJpVsGJfdH
	J8rmb9lABfQvbz9Hotw==
X-Received: from wmbbi26.prod.google.com ([2002:a05:600c:3d9a:b0:4a1:6b33:bb47])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3ba8:b0:4a0:174:579e with SMTP id 5b1f17b1804b1-4a18e4ab221mr280918715e9.28.1791895083831;
 Tue, 13 Oct 2026 05:38:03 -0700 (PDT)
Date: Tue, 13 Oct 2026 12:37:56 +0000
In-Reply-To: <20261013-binder-consolidate-txn-prints-v2-0-cf78927dab23@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013-binder-consolidate-txn-prints-v2-0-cf78927dab23@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7976; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=VTf/NXYjc8H/9QTD6PmEu2SPvP7P4c1EO6ptCXjgTy8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqziYjbr9XDzSaKBiZyjtC8y/D0eh1yrVMCM3cC
 WImnewRLKGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCas4mIwAKCRAEWL7uWMY5
 RjJ2D/97oXys64apHkNnmlmxfYMGrIksWa8+1zpcRmo79hjU4kpPr4nuYsbF+lW6usN0qqjZfQl
 AJQAPwZlyfyWKGTIIL2NfGk16VYxHJSfXdDES4OVJYqc3neNOvU+naw8fuvvFp3l0/TNe9nMfut
 SN7LpJ5VdgYq9LLFXSzoLHq3WQoqKglc+FTasMrjgkU0P2dlYfgMxb566/Ptr48g3E2+PjCMWn0
 i7Lxi82lzDDYgnt5E4G0kBPbo7CXslJLuT5/UQnav+RuD9tBPRc9c9vx5UY8k/Fp4rFfeSrXYIB
 TTh28ae5FGKgeNi3sjvwmZdvLUO4EeoZhj+T3T+zfIhcaV6rJ4Fh0qNu56ndMD1nk8GSsgAD0lH
 6KDRtP7nRXrOVpFNtocWtN7BGqoXN9XhhS8c9qk/8v6TdkmihkzGtB5XMWiwJbSjTWz0rBgxUa4
 OCd87T823HHsVGtQpxvuDgFkd5d8yGmpFgpfsDcFYwAYVLj6zcClRPwnsP9PBUO+sIPDQ4PyBXr
 63Eda0as2mU3r4JIP2RQDm6NCt57NLk+VJ6bBF0izOpBARN6klqw4dSMnJzYFx4tfcIwrLwXyGC
 LibT/wq/rGxDWR5bFgg4H53V6fduc2ZOQapxf5ODUBOL26RvwmaxOwaa78lbzI6+Wd0TdA/dzh9 xp/sCAoXRFKh9Kg==
X-Mailer: b4 0.14.3
Message-ID: <20261013-binder-consolidate-txn-prints-v2-3-cf78927dab23@google.com>
Subject: [PATCH v2 3/3] rust_binder: consolidate transaction failure prints
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	"=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

When a transaction fails, it currently hits multiple print statements
meaning that a single failure can result in several lines in the kernel
log. This is unnecessary, so consolidate them into one print used for
all transaction failures.

Acked-by: Carlos Llamas <cmllamas@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/error.rs       |  4 --
 drivers/android/binder/thread.rs      | 72 +++++++++++++++--------------------
 drivers/android/binder/transaction.rs | 20 ++--------
 3 files changed, 34 insertions(+), 62 deletions(-)

diff --git a/drivers/android/binder/error.rs b/drivers/android/binder/error.rs
index 41b07d687b30..89077c5baeaf 100644
--- a/drivers/android/binder/error.rs
+++ b/drivers/android/binder/error.rs
@@ -71,10 +71,6 @@ pub(crate) fn new_frozen_oneway() -> Self {
             line: ErrorLocation::caller(),
         }
     }
-
-    pub(crate) fn is_dead(&self) -> bool {
-        self.reply == BR_DEAD_REPLY
-    }
 }
 
 /// Convert an errno into a `BinderError` and store the errno used to construct it. The errno
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 5bb7ae2f7920..bcb2038b7550 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1065,17 +1065,7 @@ pub(crate) fn copy_transaction_data(
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
 
         trace_transaction_alloc_buf(debug_id, data_size, offsets_size, buffers_size);
 
@@ -1328,6 +1318,9 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
             self.transaction_inner(&mut info)
         };
 
+        // This runs when return work is passed to the caller. This is not
+        // always the same as the transaction failing, as reply errors are
+        // delivered to the remote process.
         if let Err(err) = ret {
             self.push_return_work(err.reply);
             if err.reply != BR_TRANSACTION_COMPLETE {
@@ -1336,30 +1329,8 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
                 if let Some(source) = err.source {
                     info.errno = Some(source);
 
-                    {
-                        let mut inner = self.inner.lock();
-                        inner.extended_error =
-                            ExtendedError::new(info.debug_id as u32, err.reply, source.to_errno());
-                    }
-
-                    binder_debug!(
-                        FailedTransaction,
-                        "transaction {} to {}:{} failed {:?}, code {} size {}-{} line {}",
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
-                        info.offsets_size,
-                        err.line
-                    );
+                    self.inner.lock().extended_error =
+                        ExtendedError::new(info.debug_id as u32, err.reply, source.to_errno());
                 }
             }
         }
@@ -1371,8 +1342,33 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
             // useful in case the transaction failed with BR_TRANSACTION_PENDING_FROZEN.
             info.report_netlink(BR_ONEWAY_SPAM_SUSPECT, &self.process.ctx);
         }
+        // This runs when the transaction failed.
         if info.reply != 0 {
             info.report_netlink(info.reply, &self.process.ctx);
+            if let Some(errno) = info.errno {
+                let error_line: &dyn kernel::fmt::Display = match &info.error_line {
+                    Some(line) => line,
+                    None => &0,
+                };
+                binder_debug!(
+                    FailedTransaction,
+                    "transaction {} to {}:{} failed {:?}, code {} size {}-{} line {}",
+                    if info.is_reply {
+                        "reply"
+                    } else if info.is_oneway() {
+                        "async"
+                    } else {
+                        "call"
+                    },
+                    info.to_pid,
+                    info.to_tid,
+                    errno,
+                    info.code,
+                    info.data_size,
+                    info.offsets_size,
+                    error_line
+                );
+            }
         }
 
         Ok(())
@@ -1465,12 +1461,6 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
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
index d934c6821b15..22558bdeef16 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -365,21 +365,13 @@ pub(crate) fn new(
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
@@ -420,13 +412,7 @@ pub(crate) fn new_reply(
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

-- 
2.56.0.385.gd3acb90ef8-goog

