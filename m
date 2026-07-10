Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4511536CDFD;
	Fri, 10 Jul 2026 14:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693980; cv=none; b=jVeMogadZuCav8wW3RvwGrlRgEBjfHl7erbiflnxaT4+Sy3g8FevxIX7+0HcUbfrXESMb5aKJ2pUA4iuLRGThDpdUJ4AojDHsKLn/zho59ItdIKjfGQvHYRS/rgrsQO94JWcYuXYxo2rCxO8T7i4EtT/YVb/GO/ipY+zbZwFl/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693980; c=relaxed/simple;
	bh=WhDYJdCpKCTXhYkMv+LNMDAHQ54dcIJ/U7KLxddy8KQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JU0y+w046KqlWRBcimR4mMZIEPPIckke0DxnJ/5AlOKEQKUMQHtZb0ozXd8uYrd6UULymWgVbGyPWS+URSiBdJbeei8fpoyz8JTjKyu88H9Itz7wZ4ZGvsvk8l0Gl/QONJp71oRJaiZbnMdOXVXoCiV2Ao70NoGCLbdDogPXqC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kjVijTeJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kjVijTeJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E42A7C2BCFD;
	Fri, 10 Jul 2026 14:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783693979;
	bh=WhDYJdCpKCTXhYkMv+LNMDAHQ54dcIJ/U7KLxddy8KQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kjVijTeJBYVgbaMVfJQEIVqsq/U11pK9co1o4ucDIm3cLcXUQDcvUul5R4Q0ThSuM
	 6xf4C2Dn4P+Zy8NWzxPrAI1hjMiwV1F2hTKvO7UZCrOtBDdQNmh6AFKiZTxor9OWGV
	 BT+Jjc6Hp8IyLTUR6/TMJBDDu7xfZ+7SY8b3xCiZPEzKrin6sOlVnkImJx8ML+esRk
	 WloF/7fbvi2mU3avu/bmcz+f/UVBXp4sToHBrMWOuyiRhdesO+Xez5HIFLtC32udhE
	 x5w4YL8Sc4kgIcoKQy4k6QPez85QlLwxrZEs8ucEW7muPR8t/IRRFYzt68nSN6eQyV
	 eKXntnHzHotlw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA9BC44509;
	Fri, 10 Jul 2026 14:32:59 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Date: Fri, 10 Jul 2026 14:32:55 +0000
Subject: [PATCH v2 4/7] rust_binder: Implement BINDER_DEBUG_USER_ERROR for
 transaction parsing failures
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rust_binder_debug_mask-v2-4-2846410e3ae6@google.com>
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
In-Reply-To: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783693978; l=9054;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=1YVNRj8PS/8sCSHsoAqXFzbkSMi70215O1T4iGCIa+o=;
 b=lkorIkhbDEvTFPNVAkAAbSHP8zGKVgPCXUKMwzJPLfnAy8LnmaNGoOo2W2RT7gKZolEN5LJ14
 L8jhC+S5M+vBpy28+31Lmm+cwsJjbkY+xYWKKcqpFKv8YRUAGmoV/OR
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

Signed-off-by: Jahnavi MN <jahnavimn@google.com>
---
 drivers/android/binder/thread.rs | 84 +++++++++++++++++++++++++++++-----------
 1 file changed, 62 insertions(+), 22 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 541ca947cc52..54b98efdd0ec 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -743,11 +743,12 @@ fn translate_object(
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
@@ -826,6 +827,10 @@ fn translate_object(
                 let fds_len = num_fds.checked_mul(size_of::<u32>()).ok_or(EINVAL)?;
 
                 if !is_aligned(parent_offset, size_of::<u32>()) {
+                    binder_debug!(
+                        UserError,
+                        "FDA parent offset not aligned correctly"
+                    );
                     return Err(EINVAL.into());
                 }
 
@@ -844,6 +849,10 @@ fn translate_object(
                 };
 
                 if !is_aligned(parent_entry.sender_uaddr, size_of::<u32>()) {
+                    binder_debug!(
+                        UserError,
+                        "FDA parent buffer not aligned correctly"
+                    );
                     return Err(EINVAL.into());
                 }
 
@@ -927,12 +936,9 @@ fn apply_sg(&self, alloc: &mut Allocation, sg_state: &mut ScatterGatherState) ->
 
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
@@ -940,18 +946,27 @@ fn apply_sg(&self, alloc: &mut Allocation, sg_state: &mut ScatterGatherState) ->
                 let copy_off = end_of_previous_fixup;
                 let copy_len = fixup_offset - end_of_previous_fixup;
                 if let Err(err) = alloc.copy_into(&mut reader, copy_off, copy_len) {
-                    pr_warn!("Failed copying into alloc: {:?}", err);
+                    binder_debug!(
+                        UserError,
+                        "failed copying into alloc: {err:?}"
+                    );
                     return Err(err.into());
                 }
                 if let PointerFixupEntry::Fixup { pointer_value, .. } = fixup {
                     let res = alloc.write::<u64>(fixup_offset, pointer_value);
                     if let Err(err) = res {
-                        pr_warn!("Failed copying ptr into alloc: {:?}", err);
+                        binder_debug!(
+                            UserError,
+                            "failed copying ptr into alloc: {err:?}"
+                        );
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
@@ -959,7 +974,10 @@ fn apply_sg(&self, alloc: &mut Allocation, sg_state: &mut ScatterGatherState) ->
             let copy_off = end_of_previous_fixup;
             let copy_len = offset_end - end_of_previous_fixup;
             if let Err(err) = alloc.copy_into(&mut reader, copy_off, copy_len) {
-                pr_warn!("Failed copying remainder into alloc: {:?}", err);
+                binder_debug!(
+                    UserError,
+                    "failed copying remainder into alloc: {err:?}"
+                );
                 return Err(err.into());
             }
         }
@@ -1063,7 +1081,10 @@ pub(crate) fn copy_transaction_data(
                 let offset: usize = offset.try_into().map_err(|_| EINVAL)?;
 
                 if offset < end_of_previous_object || !is_aligned(offset, size_of::<u32>()) {
-                    pr_warn!("Got transaction with invalid offset.");
+                    binder_debug!(
+                        UserError,
+                        "got transaction with invalid offset"
+                    );
                     return Err(EINVAL.into());
                 }
 
@@ -1088,7 +1109,10 @@ pub(crate) fn copy_transaction_data(
                 ) {
                     Ok(()) => end_of_previous_object = offset + object.size(),
                     Err(err) => {
-                        pr_warn!("Error while translating object.");
+                        binder_debug!(
+                            UserError,
+                            "error while translating object: {err:?}"
+                        );
                         return Err(err);
                     }
                 }
@@ -1108,15 +1132,15 @@ pub(crate) fn copy_transaction_data(
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
+                binder_debug!(
+                    UserError,
+                    "failed to write security context: {err:?}"
+                );
                 return Err(err.into());
             }
             **off_out = secctx_off;
@@ -1328,7 +1352,10 @@ fn transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResu
         {
             let mut inner = self.inner.lock();
             if !transaction.is_stacked_on(&inner.current_transaction) {
-                pr_warn!("Transaction stack changed during transaction!");
+                binder_debug!(
+                    UserError,
+                    "got new transaction with bad transaction stack"
+                );
                 return Err(EINVAL.into());
             }
             inner.current_transaction = Some(transaction.clone_arc());
@@ -1351,8 +1378,21 @@ fn transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResu
     }
 
     fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
-        let orig = self.inner.lock().pop_transaction_to_reply(self)?;
+        let orig = match self.inner.lock().pop_transaction_to_reply(self) {
+            Ok(orig) => orig,
+            Err(err) => {
+                binder_debug!(
+                    UserError,
+                    "got reply transaction with no transaction stack"
+                );
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
2.55.0.795.g602f6c329a-goog


