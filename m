Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E747271A71;
	Mon, 13 Jul 2026 12:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783946132; cv=none; b=sBPjdyCDTt9VqOExaeNGQk/ArAHJrQmCFCEB8eMvO71KMjfgsaxkpWY0cPNIbwbEgKM/WPI+Uv327tD8eUtN1PoSEz6ax0cKFLX5AVzRZA499yKMWnp35ezuvHLgbWpm0cHzuXuYNBWPXPuRKxDEYlAu7SJXAydLrcJ/mH/15GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783946132; c=relaxed/simple;
	bh=ZMjGWIqGKLGEc2OHOnUE0lFXnlBz0ipjagGrnfNuT/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j6+INE5ZKUZ2h+q01oE79qLkMfbQ6dr5dknpyLRRkskSu18w06rCdvudT6Rdb9dbjUWca5MTglLWdfQ7wbLpKmOEu6jJn43CeQxzeAcxENYYUQUKXMpfxNJbMpLkscndSv6mdfDYAPqED/6AGrpCaPF7Fa6n5cjeCRS18xCi3ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFkw0dzA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFkw0dzA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F077C2BCB9;
	Mon, 13 Jul 2026 12:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783946132;
	bh=ZMjGWIqGKLGEc2OHOnUE0lFXnlBz0ipjagGrnfNuT/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FFkw0dzAn1U1e5EtQWGJWdXGXM+8ABcvYx8k0mLDL5jjMF/KEzcILMw5bWD3xYXJC
	 /2jtUzguf+n48o1DeyldRKgbngqQFhJ/KqW5ANSrCZHIZNgOUUzvTlfKZ8Z5B6k4Vu
	 mG46ZuzQdvhMfsTCp3AqGJmRExuxpTXDPoH7sRC2rovRc7p/wz98TACLrBVkMuvqzR
	 1cdaWbYaa1r0jcLnei/yV9r9CSZ/ISIAPZsrlvwBRhUlW+nsOMj1M+lslSuMlaE5Bv
	 jK+MBJTIXceTIxdB8eNIEATsbwidltNGXEVnsh6u9ZFprn4JvFbFxI0GOVS5AQGDei
	 YUXcMjnMWePqw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2965C44501;
	Mon, 13 Jul 2026 12:35:31 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Date: Mon, 13 Jul 2026 12:35:24 +0000
Subject: [PATCH v3 2/7] rust_binder: Implement BINDER_DEBUG_USER_ERROR for
 freezer-related operation
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-rust_binder_debug_mask-v3-2-0de91bbbbf69@google.com>
References: <20260713-rust_binder_debug_mask-v3-0-0de91bbbbf69@google.com>
In-Reply-To: <20260713-rust_binder_debug_mask-v3-0-0de91bbbbf69@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783946130; l=4969;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=mOE8lfucp+ZhQzg83Pu34+Skf+PAioBlv/HfP2YLQJw=;
 b=AOCRSEa+HRPEMcVRM/VJtkNksGDNJA4N5qzBtL2blprukN4UKzrYAyU13OryzxjbdseoG//cu
 ob4V2q8MFq8A54aThqbtLNyaybjOzPXkN4nS1MNCmtP8h6xJJKPAETs
X-Developer-Key: i=jahnavimn@google.com; a=ed25519;
 pk=9aLfw3FepTOJwTS7jRXm7pDH87eBeZMXBPrqwU0//RE=
X-Endpoint-Received: by B4 Relay for jahnavimn@google.com/20260702 with
 auth_id=849
X-Original-From: Jahnavi MN <jahnavimn@google.com>
Reply-To: jahnavimn@google.com

From: Jahnavi MN <jahnavimn@google.com>

This adds dynamic debug logs for:
- Requesting freeze notifications on invalid references, duplicate
  cookies, or already active registrations.
- Completing freeze notifications that are not pending or not found.
- Clearing freeze notifications on invalid references, inactive
  notifications, or cookie mismatches.

Reviewed-by: Carlos Llamas <cmllamas@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Jahnavi MN <jahnavimn@google.com>
---
 drivers/android/binder/freeze.rs | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/android/binder/freeze.rs b/drivers/android/binder/freeze.rs
index 918c4e98b66f..2c99e0995554 100644
--- a/drivers/android/binder/freeze.rs
+++ b/drivers/android/binder/freeze.rs
@@ -182,12 +182,15 @@ pub(crate) fn request_freeze_notif(
             info = match node_refs.by_handle.get_mut(&handle) {
                 Some(info) => info,
                 None => {
-                    pr_warn!("BC_REQUEST_FREEZE_NOTIFICATION invalid ref {}\n", handle);
+                    binder_debug!(
+                        UserError,
+                        "BC_REQUEST_FREEZE_NOTIFICATION invalid ref {handle}"
+                    );
                     return Err(EINVAL);
                 }
             };
             if info.freeze().is_some() {
-                pr_warn!("BC_REQUEST_FREEZE_NOTIFICATION already set\n");
+                binder_debug!(UserError, "BC_REQUEST_FREEZE_NOTIFICATION already set");
                 return Err(EINVAL);
             }
             let node_ref = info.node_ref();
@@ -195,7 +198,7 @@ pub(crate) fn request_freeze_notif(
 
             if let rbtree::Entry::Occupied(ref dupe) = freeze_entry {
                 if !dupe.get().allow_duplicate(&node_ref.node) {
-                    pr_warn!("BC_REQUEST_FREEZE_NOTIFICATION duplicate cookie\n");
+                    binder_debug!(UserError, "BC_REQUEST_FREEZE_NOTIFICATION duplicate cookie");
                     return Err(EINVAL);
                 }
             }
@@ -260,7 +263,11 @@ pub(crate) fn freeze_notif_done(self: &Arc<Self>, reader: &mut UserSliceReader)
         let mut node_refs_guard = self.node_refs.lock();
         let node_refs = &mut *node_refs_guard;
         let Some(freeze) = node_refs.freeze_listeners.get_mut(&cookie) else {
-            pr_warn!("BC_FREEZE_NOTIFICATION_DONE {:016x} not found\n", cookie.0);
+            binder_debug!(
+                UserError,
+                "BC_FREEZE_NOTIFICATION_DONE {:016x} not found",
+                cookie.0
+            );
             return Err(EINVAL);
         };
         let mut clear_msg = None;
@@ -270,8 +277,9 @@ pub(crate) fn freeze_notif_done(self: &Arc<Self>, reader: &mut UserSliceReader)
             freeze.num_cleared_duplicates += 1;
         } else {
             if !freeze.is_pending {
-                pr_warn!(
-                    "BC_FREEZE_NOTIFICATION_DONE {:016x} not pending\n",
+                binder_debug!(
+                    UserError,
+                    "BC_FREEZE_NOTIFICATION_DONE {:016x} not pending",
                     cookie.0
                 );
                 return Err(EINVAL);
@@ -300,19 +308,31 @@ pub(crate) fn clear_freeze_notif(self: &Arc<Self>, reader: &mut UserSliceReader)
         let mut node_refs_guard = self.node_refs.lock();
         let node_refs = &mut *node_refs_guard;
         let Some(info) = node_refs.by_handle.get_mut(&handle) else {
-            pr_warn!("BC_CLEAR_FREEZE_NOTIFICATION invalid ref {}\n", handle);
+            binder_debug!(
+                UserError,
+                "BC_CLEAR_FREEZE_NOTIFICATION invalid ref {handle}"
+            );
             return Err(EINVAL);
         };
         let Some(info_cookie) = info.freeze() else {
-            pr_warn!("BC_CLEAR_FREEZE_NOTIFICATION freeze notification not active\n");
+            binder_debug!(
+                UserError,
+                "BC_CLEAR_FREEZE_NOTIFICATION freeze notification not active"
+            );
             return Err(EINVAL);
         };
         if *info_cookie != cookie {
-            pr_warn!("BC_CLEAR_FREEZE_NOTIFICATION freeze notification cookie mismatch\n");
+            binder_debug!(
+                UserError,
+                "BC_CLEAR_FREEZE_NOTIFICATION freeze notification cookie mismatch"
+            );
             return Err(EINVAL);
         }
         let Some(listener) = node_refs.freeze_listeners.get_mut(&cookie) else {
-            pr_warn!("BC_CLEAR_FREEZE_NOTIFICATION invalid cookie {}\n", handle);
+            binder_debug!(
+                UserError,
+                "BC_CLEAR_FREEZE_NOTIFICATION invalid cookie {handle}"
+            );
             return Err(EINVAL);
         };
         listener.is_clearing = true;

-- 
2.55.0.795.g602f6c329a-goog


