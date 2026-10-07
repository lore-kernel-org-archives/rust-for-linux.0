Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768C94B04AF
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Oct 2026 14:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383624; cv=none; b=WU06FVkw3z+PoJJTMer+N9bsYEWh38+ApSWcl3STs1nCD9qjQD+xTPVRvQUDxgBgDeKRh/kzLRJ2r+y6qEty7qPLSKpliAF0lGcQuCgLw0ndxzH8XS/agx/AX86VR1IKubatfuU1dmcnsMVv4S5hf2Yxrzc0XPqnAOhFA+2pebc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383624; c=relaxed/simple;
	bh=jItKKAu0homp071puHR08xx+XhFZE1mY06UORsD/xEs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sXV/9WHcdhYnzYKzbETac33q0XnnXcRVwgkP76cK6BfMwu9l7rLoIlkZHk96YYeNO/IfuKBhSFmjsQn7nwyl+DUC4zcvvYdZ0QW0RVIa2aQXKtKvZJurLvLwcBe4EOQ6iYHkEFYmRxW8JRpXmz8Ul78JsVThHGytYBJw0PLpJ94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XKSHDMpL; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XKSHDMpL"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1612c4b80so40137405e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Oct 2026 07:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791383615; x=1791988415; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rAzyrTux8mCJl/HvAWrWnfHv6KeU1NLe2Sh0GCx+Vc=;
        b=XKSHDMpLALp+lNJO6mczZLFPN84BtxnL/OT+0Z5wKlemy7j8xXLsC2f7850RTSZcfj
         DTUHXvNBtUISmiuRz3w+0BRR0TZEc6RPZ8MsjyD86K9W0mJCn/8UFlNCDhQ/n5aCJ066
         r9a++1xUTl8lYBYDT2qBZCKXDYHitvDIEb+yidT74o8Vv2ccX4ap9V2MpnbE2jTQ9hN9
         X955yP5JQstkohiNCoaCqruJr/j6o8xmiEHH6x3wb+5Rm+zVT8qhf/+Zt3cpqp3PxRQC
         OY653RgrEySEGn3YxUFLb/0wuT1uQPamM0v6gHB7F5LJ3Hj5zIEgvTh39DT2SeNH5yAl
         Y3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383615; x=1791988415;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7rAzyrTux8mCJl/HvAWrWnfHv6KeU1NLe2Sh0GCx+Vc=;
        b=TTqlH+Vvu6cEAEBYOliKnduiQTU1fyB8ofpoCDNwjUCgieDteuOY97H8oB9DhAN+Av
         3dvmLO/jQf+HbEUPBg/wmdbw0tribMHHQtTT/NePGkg2lSGvkJInvos7XGDh/gp5yuGi
         vKt/y/WO31IyIzXrNf6FPR+MzmFf0InuAFFBZ3nhGmNnz8RlxHAE1Iqbdn3CYmqvlq02
         /mNAx/I6uhFpMyWkIbfmpi0u+ejM7YcvpWe3RiAimP6ajSXypR9GmtgPl92Em1Nkw9UD
         jzt3yVTGm9J/NxdykxQSKT5pHz0XkUpYf0CDR7stKaTn1VNhYcQZgB4zrLPlJ13imMAt
         p2EA==
X-Forwarded-Encrypted: i=1; AKwUvBxgyzq5ehPtJcnNCWrARSPBZhWx64BccuASez3xQaiCr3xYLewyignL/znXZiD92YW4UnSL8ftYXlkUSNFo7A==@vger.kernel.org
X-Gm-Message-State: AFuF++lZekywDGgYd78f1wHcq5xa3EpYSNoAz7hwRjXJmfrjTwxhI/NF
	FSvdk4Fmo11EiJE13mfUvXhrpQ70es3ZqqZYDiAfxLYwqAoQ4Uylo6QMlf3WWztN3Qx6GQeL/Mk
	R9t0T+lOt/qu6pF30uw==
X-Received: from wmin15.prod.google.com ([2002:a7b:cbcf:0:b0:4a1:72d9:e07])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b2a:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-4a180650423mr35101145e9.31.1791383615215;
 Wed, 07 Oct 2026 07:33:35 -0700 (PDT)
Date: Wed, 07 Oct 2026 14:33:28 +0000
In-Reply-To: <20261007-binder-consolidate-txn-prints-v1-0-c1032ed3221f@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261007-binder-consolidate-txn-prints-v1-0-c1032ed3221f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7980; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=jItKKAu0homp071puHR08xx+XhFZE1mY06UORsD/xEs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqxlg56/ego1z1D5acbcFKrmt8egMDxWx5v9Ic7
 I2tzUgxVoiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCasZYOQAKCRAEWL7uWMY5
 Rn4fEAC6zGyLjNEWpDx+kBfmYfvpCZ+ORpy+uThyls8UgAWsSae2HcaiuYakyt4p/KdwPmr0fgt
 QAZdIOV/ZZcpfZjSAdfk2YpTEuBuoKbjTx8styG85dKyqtS0+5Xdk9swvvW2RlQh4HJ0DZAlH2m
 kuhrjBOzH8tQt+ddjPp8Djgnt7nKDp+Dvi50y02soxpSjgilSKGQVSngr5u3Qs/QBNlkTygEZvz
 9e0FU+1y2nDPpl0xbaWzj3jmuHDGUTVJhhfKAtcGoZVrbLmpthgpdxNg0rYNTEy4kXmQlxlv7BV
 chfEntKc21W60goVvTE32mbZnPp2+JwC1QPGhpZqL+cfGEsLtxuZuMx5nLTdioa6vCNT8q+Yfon
 XP0FQrimysChEtdKD+Utd2cwubnFUEWpV9bBIJT4zouWKL4jRz7hL70cc/0oaUtx+k5ShBQIIOU
 zogDWvkew1TtB4ChSof47owuzqD0kJN48PCXGazrNZOwqNi2utjuGMBnPPFfQsvloAMLFbr8w4k
 XkBf1m+VPjkRUQSJ3RGl7p1PTIzUUYxkQstU1GScQhtE5wkfncCBx2Jr4QH3WvkqiVCbU+RwkDE
 I0YaSnJprMsOy2AijLZdME82/HkSY6paftZkD1w7hjmD5OxIGihg60qbARis6LUXEQgQRkKx/1M NLrtB4f5/BCtjLA==
X-Mailer: b4 0.14.3
Message-ID: <20261007-binder-consolidate-txn-prints-v1-3-c1032ed3221f@google.com>
Subject: [PATCH 3/3] rust_binder: consolidate transaction failure prints
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
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
2.56.0.rc1.315.gc6ed9934b7-goog

