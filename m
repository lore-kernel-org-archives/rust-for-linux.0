Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AB53F23D9;
	Thu, 16 Jul 2026 08:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191081; cv=none; b=DUGpA01LnMD+XVLqu8WRrF8xdDk81lXi+HF0zKZfYI8A/lLQcg8bokFkSHbc5Qh09YBSzbwSH1xBtisQMfy/9ggnGA5RJz9mRGddIBeWOz4V1/V8Lp146eSZszIbZPtsoZ3INKa+mmXYAj7gO86mOBqufCNlxuIKNCGK+dTYOb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191081; c=relaxed/simple;
	bh=SBi1trShH97zf8nrrdvyzKaSbwxiVpQL+okLmrxMFnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ufSgvlZ+T8FyTc2gBY4Po/zZJWzNYESpdBZ/sndvHwq0lmt/c6RSlvm1bVHmkTErvuRq9nmcZ0/P1oxpoHKMOKKmLWYG2n4UYQY7OQFv6PRLEGnRxUZN/3bzwXRpGXTaawxD5hPgT8O8kvwNgAD4XPuCSAmOSoFmmOfy3A8xwmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLUFkYNL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLUFkYNL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65BA2C2BCB9;
	Thu, 16 Jul 2026 08:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784191080;
	bh=SBi1trShH97zf8nrrdvyzKaSbwxiVpQL+okLmrxMFnw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FLUFkYNL+dXWt1JBoH5cI9g9/V9SHC9RRu7zhxqoYWO5KPV9YMuxGxMrUft1iNz4q
	 XQBYXQ2MXEnqAvMZkwxPZxXO0eT0W4WXuErzjATgKqqdW80lweWDzHmcVdVOOhBEfp
	 JS9bEwfzKiffdC0jpH/0tlyt3W15b2sI78rELKFLZosvN8IX+u81HEHgbYu2uczuwb
	 FhQTLdpFMt0VJ+5iPGDZGABmyBc/hwguF9jarnZ62C1nCRJ3DVkBOA06yso6y1U1qf
	 RU+czLck0XO9Q+K8sUURFmKKUfqpD8Fs9Q4iYH6eS4bwVwAE+43/F6Qmgh2htL5htS
	 1MVklROMsHQbA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489E8C44517;
	Thu, 16 Jul 2026 08:38:00 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Date: Thu, 16 Jul 2026 08:37:46 +0000
Subject: [PATCH v4 4/7] rust_binder: Implement BINDER_DEBUG_USER_ERROR for
 transaction parsing failures
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-rust_binder_debug_mask-v4-4-3d7436c2d2f2@google.com>
References: <20260716-rust_binder_debug_mask-v4-0-3d7436c2d2f2@google.com>
In-Reply-To: <20260716-rust_binder_debug_mask-v4-0-3d7436c2d2f2@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Jahnavi MN <jahnavimn@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784191078; l=8410;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=q4pagxc+LGq8HMGgmdSA8ewelGGdc1UF+C5kmn3peZM=;
 b=RwO/0NEJyZ1vzZkcLvbxcD4LoipP4eSshcvPTnb1CtTfGQB1BOKq1UCdIqRuPMKpv3LIQh4zI
 XW4PqUaxCNMB+SZzW+y5Z63qIEouzHJutWUYvUtArP0tirkGaAwQ+1r
X-Developer-Key: i=jahnavimn@google.com; a=ed25519;
 pk=9aLfw3FepTOJwTS7jRXm7pDH87eBeZMXBPrqwU0//RE=
X-Endpoint-Received: by B4 Relay for jahnavimn@google.com/20260702 with
 auth_id=849
X-Original-From: Jahnavi MN <jahnavimn@google.com>
Reply-To: jahnavimn@google.com

From: Jahnavi MN <jahnavimn@google.com>

This adds dynamic debug logs in `thread.rs` for:
- File descriptor array (FDA) parent offset and parent buffer address
  alignment misalignments.
- Memory copy, write, and translation failures during transaction
  serialization (including out-of-bounds pointer fixups).
- Incoming transactions or replies that do not match the expected
  thread calling stack (such as out-of-order replies).

Reviewed-by: Carlos Llamas <cmllamas@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Jahnavi MN <jahnavimn@google.com>
---
 drivers/android/binder/thread.rs | 54 ++++++++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 19f881948a84..9f0178a13d6f 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -728,11 +728,12 @@ fn translate_object(
                 let alloc_offset = match sg_state.unused_buffer_space.claim_next(obj_length) {
                     Ok(alloc_offset) => alloc_offset,
                     Err(err) => {
-                        pr_warn!(
-                            "Failed to claim space for a BINDER_TYPE_PTR. (offset: {}, limit: {}, size: {})",
+                        binder_debug!(
+                            UserError,
+                            "failed to claim space for a BINDER_TYPE_PTR (offset: {}, limit: {}, size: {})",
                             sg_state.unused_buffer_space.offset,
                             sg_state.unused_buffer_space.limit,
-                            obj_length,
+                            obj_length
                         );
                         return Err(err.into());
                     }
@@ -811,6 +812,7 @@ fn translate_object(
                 let fds_len = num_fds.checked_mul(size_of::<u32>()).ok_or(EINVAL)?;
 
                 if !is_aligned(parent_offset, size_of::<u32>()) {
+                    binder_debug!(UserError, "FDA parent offset not aligned correctly");
                     return Err(EINVAL.into());
                 }
 
@@ -829,6 +831,7 @@ fn translate_object(
                 };
 
                 if !is_aligned(parent_entry.sender_uaddr, size_of::<u32>()) {
+                    binder_debug!(UserError, "FDA parent buffer not aligned correctly");
                     return Err(EINVAL.into());
                 }
 
@@ -912,12 +915,9 @@ fn apply_sg(&self, alloc: &mut Allocation, sg_state: &mut ScatterGatherState) ->
 
                 let target_offset_end = fixup_offset.checked_add(fixup_len).ok_or(EINVAL)?;
                 if fixup_offset < end_of_previous_fixup || offset_end < target_offset_end {
-                    pr_warn!(
-                        "Fixups oob {} {} {} {}",
-                        fixup_offset,
-                        end_of_previous_fixup,
-                        offset_end,
-                        target_offset_end
+                    binder_debug!(
+                        UserError,
+                        "fixups oob {fixup_offset} {end_of_previous_fixup} {offset_end} {target_offset_end}"
                     );
                     return Err(EINVAL.into());
                 }
@@ -925,18 +925,21 @@ fn apply_sg(&self, alloc: &mut Allocation, sg_state: &mut ScatterGatherState) ->
                 let copy_off = end_of_previous_fixup;
                 let copy_len = fixup_offset - end_of_previous_fixup;
                 if let Err(err) = alloc.copy_into(&mut reader, copy_off, copy_len) {
-                    pr_warn!("Failed copying into alloc: {:?}", err);
+                    binder_debug!(UserError, "failed copying into alloc: {err:?}");
                     return Err(err.into());
                 }
                 if let PointerFixupEntry::Fixup { pointer_value, .. } = fixup {
                     let res = alloc.write::<u64>(fixup_offset, pointer_value);
                     if let Err(err) = res {
-                        pr_warn!("Failed copying ptr into alloc: {:?}", err);
+                        binder_debug!(UserError, "failed copying ptr into alloc: {err:?}");
                         return Err(err.into());
                     }
                 }
                 if let Err(err) = reader.skip(fixup_len) {
-                    pr_warn!("Failed skipping {} from reader: {:?}", fixup_len, err);
+                    binder_debug!(
+                        UserError,
+                        "failed skipping {fixup_len} from reader: {err:?}"
+                    );
                     return Err(err.into());
                 }
                 end_of_previous_fixup = target_offset_end;
@@ -944,7 +947,7 @@ fn apply_sg(&self, alloc: &mut Allocation, sg_state: &mut ScatterGatherState) ->
             let copy_off = end_of_previous_fixup;
             let copy_len = offset_end - end_of_previous_fixup;
             if let Err(err) = alloc.copy_into(&mut reader, copy_off, copy_len) {
-                pr_warn!("Failed copying remainder into alloc: {:?}", err);
+                binder_debug!(UserError, "failed copying remainder into alloc: {err:?}");
                 return Err(err.into());
             }
         }
@@ -1048,7 +1051,7 @@ pub(crate) fn copy_transaction_data(
                 let offset: usize = offset.try_into().map_err(|_| EINVAL)?;
 
                 if offset < end_of_previous_object || !is_aligned(offset, size_of::<u32>()) {
-                    pr_warn!("Got transaction with invalid offset.");
+                    binder_debug!(UserError, "got transaction with invalid offset");
                     return Err(EINVAL.into());
                 }
 
@@ -1073,7 +1076,7 @@ pub(crate) fn copy_transaction_data(
                 ) {
                     Ok(()) => end_of_previous_object = offset + object.size(),
                     Err(err) => {
-                        pr_warn!("Error while translating object.");
+                        binder_debug!(UserError, "error while translating object: {err:?}");
                         return Err(err);
                     }
                 }
@@ -1093,15 +1096,12 @@ pub(crate) fn copy_transaction_data(
         )?;
 
         if let Some(sg_state) = sg_state.as_mut() {
-            if let Err(err) = self.apply_sg(&mut alloc, sg_state) {
-                pr_warn!("Failure in apply_sg: {:?}", err);
-                return Err(err);
-            }
+            self.apply_sg(&mut alloc, sg_state)?;
         }
 
         if let Some((off_out, secctx)) = secctx.as_mut() {
             if let Err(err) = alloc.write(secctx_off, secctx.as_bytes()) {
-                pr_warn!("Failed to write security context: {:?}", err);
+                binder_debug!(UserError, "failed to write security context: {err:?}");
                 return Err(err.into());
             }
             **off_out = secctx_off;
@@ -1303,7 +1303,7 @@ fn transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResu
         {
             let mut inner = self.inner.lock();
             if !transaction.is_stacked_on(&inner.current_transaction) {
-                pr_warn!("Transaction stack changed during transaction!");
+                binder_debug!(UserError, "got new transaction with bad transaction stack");
                 return Err(EINVAL.into());
             }
             inner.current_transaction = Some(transaction.clone_arc());
@@ -1326,8 +1326,18 @@ fn transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResu
     }
 
     fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
-        let orig = self.inner.lock().pop_transaction_to_reply(self)?;
+        let orig = match self.inner.lock().pop_transaction_to_reply(self) {
+            Ok(orig) => orig,
+            Err(err) => {
+                binder_debug!(UserError, "got reply transaction with no transaction stack");
+                return Err(err.into());
+            }
+        };
         if !orig.from.is_current_transaction(&orig) {
+            binder_debug!(
+                UserError,
+                "got reply transaction with bad transaction stack"
+            );
             return Err(EINVAL.into());
         }
 

-- 
2.55.0.229.g6434b31f56-goog


