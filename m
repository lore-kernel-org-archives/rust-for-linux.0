Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2831129B78D;
	Fri, 10 Jul 2026 14:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693980; cv=none; b=pS4h4m4ak9eyQa7ErDIqt9nUB4d09lwr8KR0ocYA968xX0s97g3C8tHv9spf7X+iejOPg2CEFDsxJP1OBLosSnRQzksKhMdAeILrT9WsfuwvTKxwfyXCXZrQxhsjnCHKt2gI4e1TdaBtUCrvIfJ94N36IZ8I1lZVp3vA70R/3/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693980; c=relaxed/simple;
	bh=5o+NcvE2pgmELmshF6tbtz61V7Wl5FDG9NlnCDkQMm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bowBvciUqT/jdMBIrjlKnzXUqJkfJzcGc/pJsFwDApkmdPdyi+0g++mXyQ/9IzSPXF3iuGQ+n4a4e/dtKBRfFJS44YG33X0lmxb42UF2nCsnAf7oHJhCuZ5af+dLgRcPZCAHGHBSGLqo76Ff98OnQFVLoYV/V5EirPcYmL3hhHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1j/bOov; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1j/bOov"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CED24C2BCF4;
	Fri, 10 Jul 2026 14:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783693979;
	bh=5o+NcvE2pgmELmshF6tbtz61V7Wl5FDG9NlnCDkQMm4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=N1j/bOovVkHJVyZ5EBv6bXLUV4PNQ2jzkyO/+H33WHRawUBcAh4zqVyl05vlxJWgW
	 UitFJMG8WiN9oxY1/9EeziBB1KFCeC2i6qxXrWMRCdtEitUeGiZfQSpX4YGo5hQvFr
	 U1poKifYv3mbW3ch2NRSBZsrWMU0R45Le7AeLb0j3AT9RcamgdiT7mDcEs1FMNBkuN
	 rbt1D3l6E7pvzgNym1uSyoTAX//eJaCGVv/GVzJ/+ElHbm7Kjmp4u7E0JD3Dr9Cw7x
	 nuUYDK0C/nsxSC+y/cc1kQkFReYPBJEpEGZ44DwLjgkUZBKqs5NMZAQ03Rk4yU5J90
	 B421f4S+qbcgg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF65AC44507;
	Fri, 10 Jul 2026 14:32:59 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Date: Fri, 10 Jul 2026 14:32:53 +0000
Subject: [PATCH v2 2/7] rust_binder: Implement BINDER_DEBUG_USER_ERROR for
 freezer-related operation
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rust_binder_debug_mask-v2-2-2846410e3ae6@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783693978; l=5012;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=8Dap4ytl+BCrevOGT3WYU8cDN0v6b+As9EacgUPak3Y=;
 b=KcxTFnQPvey+L2FhbeKqy/zFFhw54BLwA31VDx8pDiZGBpiWQb7N+WH8vygNZCL6SfyhTMSIB
 rDP8QyoLWzwC/5bXUKc/IamFB+iruJXcS/sYbwrVduH7DVzwhBtJ+he
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

Signed-off-by: Jahnavi MN <jahnavimn@google.com>
---
 drivers/android/binder/freeze.rs | 46 +++++++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/android/binder/freeze.rs b/drivers/android/binder/freeze.rs
index f43388ed6ae2..70b192ec199a 100644
--- a/drivers/android/binder/freeze.rs
+++ b/drivers/android/binder/freeze.rs
@@ -189,12 +189,18 @@ pub(crate) fn request_freeze_notif(
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
+                binder_debug!(
+                    UserError,
+                    "BC_REQUEST_FREEZE_NOTIFICATION already set"
+                );
                 return Err(EINVAL);
             }
             let node_ref = info.node_ref();
@@ -202,7 +208,10 @@ pub(crate) fn request_freeze_notif(
 
             if let rbtree::Entry::Occupied(ref dupe) = freeze_entry {
                 if !dupe.get().allow_duplicate(&node_ref.node) {
-                    pr_warn!("BC_REQUEST_FREEZE_NOTIFICATION duplicate cookie\n");
+                    binder_debug!(
+                        UserError,
+                        "BC_REQUEST_FREEZE_NOTIFICATION duplicate cookie"
+                    );
                     return Err(EINVAL);
                 }
             }
@@ -267,7 +276,11 @@ pub(crate) fn freeze_notif_done(self: &Arc<Self>, reader: &mut UserSliceReader)
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
@@ -277,8 +290,9 @@ pub(crate) fn freeze_notif_done(self: &Arc<Self>, reader: &mut UserSliceReader)
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
@@ -307,19 +321,31 @@ pub(crate) fn clear_freeze_notif(self: &Arc<Self>, reader: &mut UserSliceReader)
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


