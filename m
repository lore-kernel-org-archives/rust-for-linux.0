Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E784E417368;
	Fri,  3 Jul 2026 15:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092566; cv=none; b=MUPPgVFfWeyRMufhWrO4j/GC1RThvEC5/zwT7nqEbGI8sH5rRnTwlhZ5NW5AmY2ZLRzpkSz2k8AsIj4+EjN/n745jQ5xg7PbaZh3qJsxfwS3WSM46hPQ9CcbmgtxZHTgLbll0qHQdRqLfFz+6YGXMCV61t4DQG/k0Yid7wYVtDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092566; c=relaxed/simple;
	bh=tYeL/EzsTr+oMHICp3nBN2RBAmqQUWA8dxNAnXZVunI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jFd63fOcQstkQUEHO+KPoayxJvsTJMuJU1GS6YhyyXjR5L9vCiDp9cy+ZBExiUhK2cZnIyDexQGwbY+veU4PzlfvO4DOMCa/EPb03uLsKxEcqAP3JuzISazecXAERAyeRTVyGwcVUq16yt6flti9A0pMGDW4gQTe3SRi/x79mq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sOsgEACi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sOsgEACi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90BB6C2BCFB;
	Fri,  3 Jul 2026 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783092565;
	bh=tYeL/EzsTr+oMHICp3nBN2RBAmqQUWA8dxNAnXZVunI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sOsgEACiyrjcdG8ELp5uXJgZK4uYgvicDsmnlrrBBdMAsuReaQK3ijp60WznG3i6H
	 CqSeidPm22qJ04ug7gGOVSYRIWtBUbwW0WgFVVvGr1QEDAIewGUVw557ROG446j7DE
	 5kl/oVrTDnaL+zC5VDFuG3kHi4a9IBaEHFH014HMvwKU7KhOF4ui8zWMr/YtLy8e05
	 jmNnOV0mNVbS1ifPHQYCKsXxYWcEvePhXda+RwlCRATT/py2P4UzC2W2u8SdDK+rSh
	 eyqqAc3yW/A5T62V4nDVkQP+SjtJ2cJE7++Sm1C+WVqnDUF/wU0szJK2k7/bJSCWbk
	 EuP3Y/QPIo6rg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FAEC44501;
	Fri,  3 Jul 2026 15:29:25 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Date: Fri, 03 Jul 2026 15:29:23 +0000
Subject: [PATCH 2/7] rust_binder: Implement the BINDER_DEBUG_USER_ERROR
 logging mask for freezer-related operation
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rust_binder_debug_mask-v1-2-9bdf12b5325c@google.com>
References: <20260703-rust_binder_debug_mask-v1-0-9bdf12b5325c@google.com>
In-Reply-To: <20260703-rust_binder_debug_mask-v1-0-9bdf12b5325c@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783092563; l=5227;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=+HqU/jcA5ROFNMDlUkYMxvVpht0ffASbIoUaPo8UaYk=;
 b=KFo052RBUFaYKi8znQFQd7RpFO05e99sbaY0tX3BGLjoGqD2sMZ5NylvaP667/2DXopUarkmI
 EJfQIvjYlT4CXkNUwA+mM1e+G9guCAWaR3Eqiqcjr6ASbt6aIPWmIVU
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
 drivers/android/binder/freeze.rs | 49 ++++++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/android/binder/freeze.rs b/drivers/android/binder/freeze.rs
index 53b60035639a..d0559ed308ef 100644
--- a/drivers/android/binder/freeze.rs
+++ b/drivers/android/binder/freeze.rs
@@ -176,11 +176,18 @@ pub(crate) fn request_freeze_notif(
         let mut node_refs_guard = self.node_refs.lock();
         let node_refs = &mut *node_refs_guard;
         let Some(info) = node_refs.by_handle.get_mut(&handle) else {
-            pr_warn!("BC_REQUEST_FREEZE_NOTIFICATION invalid ref {}\n", handle);
+            binder_debug!(
+                crate::debug::BINDER_DEBUG_USER_ERROR,
+                "BC_REQUEST_FREEZE_NOTIFICATION invalid ref {}",
+                handle
+            );
             return Err(EINVAL);
         };
         if info.freeze().is_some() {
-            pr_warn!("BC_REQUEST_FREEZE_NOTIFICATION already set\n");
+            binder_debug!(
+                crate::debug::BINDER_DEBUG_USER_ERROR,
+                "BC_REQUEST_FREEZE_NOTIFICATION already set"
+            );
             return Err(EINVAL);
         }
         let node_ref = info.node_ref();
@@ -188,7 +195,10 @@ pub(crate) fn request_freeze_notif(
 
         if let rbtree::Entry::Occupied(ref dupe) = freeze_entry {
             if !dupe.get().allow_duplicate(&node_ref.node) {
-                pr_warn!("BC_REQUEST_FREEZE_NOTIFICATION duplicate cookie\n");
+                binder_debug!(
+                    crate::debug::BINDER_DEBUG_USER_ERROR,
+                    "BC_REQUEST_FREEZE_NOTIFICATION duplicate cookie"
+                );
                 return Err(EINVAL);
             }
         }
@@ -238,7 +248,11 @@ pub(crate) fn freeze_notif_done(self: &Arc<Self>, reader: &mut UserSliceReader)
         let mut node_refs_guard = self.node_refs.lock();
         let node_refs = &mut *node_refs_guard;
         let Some(freeze) = node_refs.freeze_listeners.get_mut(&cookie) else {
-            pr_warn!("BC_FREEZE_NOTIFICATION_DONE {:016x} not found\n", cookie.0);
+            binder_debug!(
+                crate::debug::BINDER_DEBUG_USER_ERROR,
+                "BC_FREEZE_NOTIFICATION_DONE {:016x} not found",
+                cookie.0
+            );
             return Err(EINVAL);
         };
         let mut clear_msg = None;
@@ -248,8 +262,9 @@ pub(crate) fn freeze_notif_done(self: &Arc<Self>, reader: &mut UserSliceReader)
             freeze.num_cleared_duplicates += 1;
         } else {
             if !freeze.is_pending {
-                pr_warn!(
-                    "BC_FREEZE_NOTIFICATION_DONE {:016x} not pending\n",
+                binder_debug!(
+                    crate::debug::BINDER_DEBUG_USER_ERROR,
+                    "BC_FREEZE_NOTIFICATION_DONE {:016x} not pending",
                     cookie.0
                 );
                 return Err(EINVAL);
@@ -277,19 +292,33 @@ pub(crate) fn clear_freeze_notif(self: &Arc<Self>, reader: &mut UserSliceReader)
         let mut node_refs_guard = self.node_refs.lock();
         let node_refs = &mut *node_refs_guard;
         let Some(info) = node_refs.by_handle.get_mut(&handle) else {
-            pr_warn!("BC_CLEAR_FREEZE_NOTIFICATION invalid ref {}\n", handle);
+            binder_debug!(
+                crate::debug::BINDER_DEBUG_USER_ERROR,
+                "BC_CLEAR_FREEZE_NOTIFICATION invalid ref {}",
+                handle
+            );
             return Err(EINVAL);
         };
         let Some(info_cookie) = info.freeze() else {
-            pr_warn!("BC_CLEAR_FREEZE_NOTIFICATION freeze notification not active\n");
+            binder_debug!(
+                crate::debug::BINDER_DEBUG_USER_ERROR,
+                "BC_CLEAR_FREEZE_NOTIFICATION freeze notification not active"
+            );
             return Err(EINVAL);
         };
         if *info_cookie != cookie {
-            pr_warn!("BC_CLEAR_FREEZE_NOTIFICATION freeze notification cookie mismatch\n");
+            binder_debug!(
+                crate::debug::BINDER_DEBUG_USER_ERROR,
+                "BC_CLEAR_FREEZE_NOTIFICATION freeze notification cookie mismatch"
+            );
             return Err(EINVAL);
         }
         let Some(listener) = node_refs.freeze_listeners.get_mut(&cookie) else {
-            pr_warn!("BC_CLEAR_FREEZE_NOTIFICATION invalid cookie {}\n", handle);
+            binder_debug!(
+                crate::debug::BINDER_DEBUG_USER_ERROR,
+                "BC_CLEAR_FREEZE_NOTIFICATION invalid cookie {}",
+                handle
+            );
             return Err(EINVAL);
         };
         listener.is_clearing = true;

-- 
2.55.0.rc0.799.gd6f94ed593-goog


