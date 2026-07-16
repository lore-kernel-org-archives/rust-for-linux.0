Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258773E00B0;
	Thu, 16 Jul 2026 08:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191081; cv=none; b=SuLyh+vbVNmO6lOIo6sMhdNhtjA5rKgVgjv05c+LekA/uNd1NywpZGzFjwXnCdaMN75kZWnmC9LHm9a4rnpYQ0J9IzJO1HpD5neU7pUl/lF49btcKyyQqpOihjs+KZk6Vm/2ZzqKOYD+xcdHrbLtiKJMWQKjEcbdg5BfXkHaGDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191081; c=relaxed/simple;
	bh=MukFFFnDQ4BtAdIVjvGO+JcNUd67e1LDSEkPePnHsZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HUmmZcyXcwigjR00e8uWI9C3qRxhBzozJs4wz1iiKBGf/Ce75XlYR+FfYufzXr7HekA2PRWL9lBRq+MUpflLVjh/Q+W3vUeq0Yju8Hm8MEMWP8nsTBnPRXdkLl7iZ31PNMsSdFym9OavpBrPP1I+M/gAT3qKciIPQlY2RMybsB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JsMPoh+J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JsMPoh+J"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D6BCC2BCF6;
	Thu, 16 Jul 2026 08:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784191080;
	bh=MukFFFnDQ4BtAdIVjvGO+JcNUd67e1LDSEkPePnHsZI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JsMPoh+JWbJPs1RyHxeH/XNR9TKA1GSv14cwpPc8cM/SQ8rgvvqHw7bVlWPev5AJ4
	 6IB+3+1FYv2e5IGUz7Ba57ULxgYTstRZ53oe9cxrlkJl3RLVPmu507QPpoCe1vdlMz
	 MOs+FJUIxFFNCR7JDEYPbYLspp+pf2LhurnugSZfgBsL0iSX5V4fa/vtLkPfGH093p
	 rQs7rYtmtQv8dsoh4ZPw/wnJNmmFYCtsU4Weom7s3xbqNfYYieeqzBfkPZO2Or04mQ
	 yDiUQnbIDQJ1AUCAqE4qdYXh1J02/S9jp72BpWIvjp9VG0Ln3E9EqxnZE/hB9Zu0AY
	 2xAZvAHh1nqqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38922C44511;
	Thu, 16 Jul 2026 08:38:00 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Date: Thu, 16 Jul 2026 08:37:45 +0000
Subject: [PATCH v4 3/7] rust_binder: Implement BINDER_DEBUG_USER_ERROR for
 refcounting and death notifications
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-rust_binder_debug_mask-v4-3-3d7436c2d2f2@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784191078; l=5466;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=MPq1+4h96Y5W36DnAhziQal0q+gRTp87hMmSes2tm2c=;
 b=GWCh9VpDuZZBw2SxZbwOkHILOj25ubXD76KhOKATbv5c2LYatkyZVthJU5yzv7aWLXr9HEtNZ
 LZ4gp4ukGxPD+9Kqu632d/gWC+GcWpdrcbCDr/aKjSr9RWhTooOBPUI
X-Developer-Key: i=jahnavimn@google.com; a=ed25519;
 pk=9aLfw3FepTOJwTS7jRXm7pDH87eBeZMXBPrqwU0//RE=
X-Endpoint-Received: by B4 Relay for jahnavimn@google.com/20260702 with
 auth_id=849
X-Original-From: Jahnavi MN <jahnavimn@google.com>
Reply-To: jahnavimn@google.com

From: Jahnavi MN <jahnavimn@google.com>

This adds dynamic debug logs for:
- Decrementing handle reference counts that are already zero.
- Mismatched reference states (calling inc_ref_done with no active
  inc_refs, or using a weak reference as a strong reference).
- Requesting or clearing death notifications on invalid references,
  already active notifications, or with mismatched cookies.

Reviewed-by: Carlos Llamas <cmllamas@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Jahnavi MN <jahnavimn@google.com>
---
 drivers/android/binder/node.rs    | 10 ++++++----
 drivers/android/binder/process.rs | 35 ++++++++++++++++++++++++++++-------
 2 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index 59c5ab747bf4..fefa723d13c4 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -345,7 +345,7 @@ pub(crate) fn inc_ref_done_locked(
     ) -> Option<DLArc<Node>> {
         let inner = self.inner.access_mut(owner_inner);
         if inner.active_inc_refs == 0 {
-            pr_err!("inc_ref_done called when no active inc_refs");
+            binder_debug!(UserError, "inc_ref_done called when no active inc_refs");
             return None;
         }
 
@@ -821,6 +821,7 @@ pub(crate) fn get_count(&self) -> (usize, usize) {
 
     pub(crate) fn clone(&self, strong: bool) -> Result<NodeRef> {
         if strong && self.strong_count == 0 {
+            binder_debug!(UserError, "tried to use weak ref as strong ref");
             return Err(EINVAL);
         }
         Ok(self
@@ -861,9 +862,10 @@ pub(crate) fn update(&mut self, inc: bool, strong: bool) -> bool {
             *count += 1;
         } else {
             if *count == 0 {
-                pr_warn!(
-                    "pid {} performed invalid decrement on ref\n",
-                    kernel::current!().pid()
+                binder_debug!(
+                    UserError,
+                    "performed invalid {} decrement on ref",
+                    if strong { "strong" } else { "weak" }
                 );
                 return false;
             }
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 5240686324cf..1d3a71292de0 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -912,7 +912,13 @@ pub(crate) fn get_transaction_node(&self, handle: u32) -> BinderResult<NodeRef>
             }
             Ok(node_ref)
         } else {
-            Ok(self.get_node_from_handle(handle, true)?)
+            match self.get_node_from_handle(handle, true) {
+                Ok(node_ref) => Ok(node_ref),
+                Err(err) => {
+                    binder_debug!(UserError, "got transaction to invalid handle {handle}");
+                    Err(err.into())
+                }
+            }
         }
     }
 
@@ -997,7 +1003,7 @@ pub(crate) fn update_ref(
         } else {
             // All refs are cleared in process exit, so this warning is expected in that case.
             if !self.inner.lock().is_dead {
-                pr_warn!("{}: no such ref {handle}\n", self.pid_in_current_ns());
+                binder_debug!(UserError, "no such ref {handle}");
             }
         }
         Ok(())
@@ -1250,13 +1256,19 @@ pub(crate) fn request_death(
         })?;
         let mut refs = self.node_refs.lock();
         let Some(info) = refs.by_handle.get_mut(&handle) else {
-            pr_warn!("BC_REQUEST_DEATH_NOTIFICATION invalid ref {handle}\n");
+            binder_debug!(
+                UserError,
+                "BC_REQUEST_DEATH_NOTIFICATION invalid ref {handle}"
+            );
             return Ok(());
         };
 
         // Nothing to do if there is already a death notification request for this handle.
         if info.death().is_some() {
-            pr_warn!("BC_REQUEST_DEATH_NOTIFICATION death notification already set\n");
+            binder_debug!(
+                UserError,
+                "BC_REQUEST_DEATH_NOTIFICATION death notification already set"
+            );
             return Ok(());
         }
 
@@ -1293,17 +1305,26 @@ pub(crate) fn clear_death(&self, reader: &mut UserSliceReader, thread: &Thread)
 
         let mut refs = self.node_refs.lock();
         let Some(info) = refs.by_handle.get_mut(&handle) else {
-            pr_warn!("BC_CLEAR_DEATH_NOTIFICATION invalid ref {handle}\n");
+            binder_debug!(
+                UserError,
+                "BC_CLEAR_DEATH_NOTIFICATION invalid ref {handle}"
+            );
             return Ok(());
         };
 
         let Some(death) = info.death().take() else {
-            pr_warn!("BC_CLEAR_DEATH_NOTIFICATION death notification not active\n");
+            binder_debug!(
+                UserError,
+                "BC_CLEAR_DEATH_NOTIFICATION death notification not active"
+            );
             return Ok(());
         };
         if death.cookie != cookie {
             *info.death() = Some(death);
-            pr_warn!("BC_CLEAR_DEATH_NOTIFICATION death notification cookie mismatch\n");
+            binder_debug!(
+                UserError,
+                "BC_CLEAR_DEATH_NOTIFICATION death notification cookie mismatch"
+            );
             return Ok(());
         }
 

-- 
2.55.0.229.g6434b31f56-goog


