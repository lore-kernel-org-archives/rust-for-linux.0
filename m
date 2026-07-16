Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC9041F7F4
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 12:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205295; cv=none; b=fyHvrDPAdt6Bdwr2XZ6iEz7Q7Y+eZTeJBdzv+6JhPFFctZ4xZGBaf/4xc77Q8MNGQxkLVtRsatR81qCKBvXwWmA2LZixLz0qc3O9k96PjFh1BcwhfDRYnhP3Mp95QSHjo63dVTzexTuktEOPlzP3Sg6Kh6dCXrVz5U+BrMs+yr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205295; c=relaxed/simple;
	bh=sPWTdk5viFFF5Xgw6GPE35F7F4u3/XG+ZSS6RXW19Rs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NZSnmv/8jvTULPmr7DD+WgnbOZ859QQTjzEYrm7xqoAC73heENucZaZpo/fGpifcjhl7atSEgfpmnROYm3gUMnq9tHUVPcKVTk0iusjj8oc0E8E2VsUyIbzaAhFMwmdSxvTZw3DV+Bb+KicQd2bnmfnk9+IrU+bfv5pjI5KjpME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VhqrqgxI; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VhqrqgxI"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-47bbe3b9705so5853568f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 05:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784205291; x=1784810091; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isRQFGzDT8CkPr6fpN8oIVeTrpIvrNhUjiJ8li5WdOo=;
        b=VhqrqgxIMzmAoU1L4QKyI34kZHqT2YnW0r1hfoxH9zxNbik50Q3OiVfb26jEQPVQJ2
         VnSZXXvJv72wlDRoOB11FYjfURGySYCyT+iPPrA0h0S6oF0B/F3IS8nAVBxDVLwWgZZQ
         FKfpBxcum1FXACl49565n+IJxr528h5AvkNh7ofvOY3qFzxNlaHZ2gOuPgR68NLpoMi7
         gBnU7kA+F3l2Kyp6Tuuh5k9chaJzlcnCIzd9WxkeTiDM+B2HnAxXVjNg9LHwDwoANIrj
         7f6I+/QS2u+Wq+59Rx3m02U9k8Hdm0l7w0strDYbDYtYleMXsVcYsTwAn2KdopAgLHly
         Yb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205291; x=1784810091;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=isRQFGzDT8CkPr6fpN8oIVeTrpIvrNhUjiJ8li5WdOo=;
        b=bDvDv0LFwu8YQMCLXhKcrHhVGRzZPGR8/3pVTKzNML3/dOAmxOIisjeeew5h4vyk1/
         nasIFHhfFWV7E9sy2584Y41uhGtAKHl/T83+Q1fHq5u7m1ZdyTqicS0tq66XGMQsw8Nh
         KjIO8D9Qu2WpTkFEm1nRviMye1NKsvav6WWyLK2oh5PWMskzKih8RrVQWzU/qSOKrNfL
         HHu1ptqzrc94cskt30x4QY6oQLjfme0ke7Es38bRnX5QhlBCGgcm9INUZ3ysFM0DoX8t
         b+sNNo7NPyjaLmDRtnewSX24X4gOvaCESfvCHvBWRe3ERAXkcjlxrBItYTitZ7znuFcM
         j1mQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJflgK3aNNeoaq3V/wHYxOrBP955duOO+StKHxGNTZH7HfeQnXyfLXyfEqFB5Wt+dwtNcWtZ6thqn76C83NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK4VHE6ncq8Q089SV43wNLC2Tgj1CdHClS2mrsCecKsMBkYR/8
	1yIphL4ERxJsMVV6s9OOMWqsnQfa5w7DoWO49dcpQ/KV+vwjmDgCSfuKBP8H39HmupRYvmV6NJD
	oFZvZeJhrpTUYntsv7Q==
X-Received: from wrqk14.prod.google.com ([2002:a5d:428e:0:b0:47f:4fe5:ee23])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:588f:0:b0:472:edc7:b4c9 with SMTP id ffacd0b85a97d-47f4fd11350mr8667275f8f.38.1784205290405;
 Thu, 16 Jul 2026 05:34:50 -0700 (PDT)
Date: Thu, 16 Jul 2026 12:34:28 +0000
In-Reply-To: <20260716-pr-ratelimited-v2-0-31c27a4543d2@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260716-pr-ratelimited-v2-0-31c27a4543d2@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8538; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=sPWTdk5viFFF5Xgw6GPE35F7F4u3/XG+ZSS6RXW19Rs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqWM/iwcDPRFZ5+rqpToLC8ZRknqMrFBsmrdSb0
 nQRQz5OasWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaljP4gAKCRAEWL7uWMY5
 RvTHEACErEEabcQ3ppkojTof8Pwo29bb8aq8peKoSdlj8Ts5YeTgAfivsf3YPBgvHYZsuXSfWt7
 VlJ0XLT6ikF4OHpv43zrJiW/Yh7miVoyjRFRvw6yGlsO0tE7Ibzl1MMzNSMMNTvS3AxTgKwGvWl
 I2L9vRM12rd9IjOd2ynHuRDH0S2XmQXugF3UDHd1Anmx5vLd6PGxk8X5FHYdt79yLwe2Sg2MuPo
 0CysFGcXnh58UniwcfG5VmMZZ2gCm1x+eoHccYe8viM+SqnNsRNYCSp7Mar8doioZaDP5sDGg7I
 yAPIwkPsWRpPChVA/EQ9kkx5zVvuyvGeepiWMNgcsDhm+cOuszX1CsosBDyTGfWmNYh4RCYVce8
 QZtG+SBvoknj1Wdl/cJT0LPVdxQsiOUrV54GTxFWBWfm0YiMSTUMdE3MqM5YdaBVrFEacAxFz1N
 Gvq/8FpnAJHFNdG8W3IV0LFBUKa4sBGRJAAXlF9dvQNkepfezwSyO9eX7TnGgtzX+JhjCcRcA+r
 rhmcBjy4dUP7AV55C12RMnpZcqT6NwqZx1BMutv6YiW+VoxZo8Uo9sRtL6CuWa/XGbPQuBMZqRN
 Yd0S93pGQOMAem5rvDQN3GR0tJiplcoJrawc1AGwIjujaecDXb+1J7Bk+ppctReu33TUTiCq7ec 5Uh8UNM2usMxuJQ==
X-Mailer: b4 0.14.3
Message-ID: <20260716-pr-ratelimited-v2-4-31c27a4543d2@google.com>
Subject: [PATCH v2 4/5] rust_binder: consolidate transaction failure prints
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
index a7a190e1b000..bcdf0adfaaff 100644
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
@@ -1007,17 +1007,7 @@ pub(crate) fn copy_transaction_data(
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
@@ -1267,6 +1257,9 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
             self.transaction_inner(&mut info)
         };
 
+        // This runs when return work is passed to the caller. This is not
+        // always the same as the transaction failing, as reply errors are
+        // delivered to the remote process.
         if let Err(err) = ret {
             self.push_return_work(err.reply);
             if err.reply != BR_TRANSACTION_COMPLETE {
@@ -1274,13 +1267,21 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
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
@@ -1293,7 +1294,10 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
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
@@ -1301,15 +1305,6 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
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
 
@@ -1390,12 +1385,6 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
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
index 96d45c6816fe..19ad37b0b294 100644
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

