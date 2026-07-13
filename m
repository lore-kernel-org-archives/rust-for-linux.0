Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E2137B40E;
	Mon, 13 Jul 2026 12:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783946132; cv=none; b=ktsoFZ1on+pOTX8vHx+zae82dcUHTfcT0U24EC2CPneEp6vKUnHhnTr8y+qNXthr9FAMswt/aNix4YW3GL+3JT0vN0dRVuS3XCQ44YF/GNBzaOYt1FCdpUYRVVAbFZ+N4pJtfRdUU7GhFJMzqvLxwMM0phgb7MoyK4/ueaRImFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783946132; c=relaxed/simple;
	bh=OEJqGCGraOc2xljPbhiZUKlm9vDXZ7opcLl4ICt4sXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hSlaBJuKzlKpJnG1BP2/RUEVoE4VgX93a3OkWk9e9ctn55Nwwet4O0DqOTsi/VSHKYtTd1H5YobvptOX8he+Iip5b0gSoMQtIR6CnQwkuytdUsRSqGuRc4ZeJ20XLCYpQTsisQh4zdGk/4NRNZFSktTnguPEXWI2DtGuwKLSsEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSs+FGFL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSs+FGFL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F1F4C32781;
	Mon, 13 Jul 2026 12:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783946132;
	bh=OEJqGCGraOc2xljPbhiZUKlm9vDXZ7opcLl4ICt4sXc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LSs+FGFLGlR911W54QkQinnp5Po8MDhxDOp9u6QXgmhNBBXZeQ+HBF0lOMdXHdSXN
	 LJlUSPG7axUQuyr7mdCEGQuTy+SyxbOaaAqN8tYe+NzACv4VhU7aCqmrbB/+pmkyOj
	 vRWEW7qkMqkqKgsYFSx6a+mOZFCB7V0nIhmMGbQx95ydrDrkOmkCNpQiCYGUsHwHJ/
	 RbAhsja6XKV0l9DbA6yn2FnCjOaNPFhFq1IILHVE6pMt6zb/LmpdVp+RTuQlnyF4oy
	 oCnrpvvjtLYW25NVkCFDfPbYvLFrHMak1QKnzUD1jedN9ZTtxve2VuXli4fk/n/6/Y
	 CAr8ryqIt/zyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374EBC44507;
	Mon, 13 Jul 2026 12:35:32 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Date: Mon, 13 Jul 2026 12:35:28 +0000
Subject: [PATCH v3 6/7] rust_binder: Implement
 BINDER_DEBUG_DEATH_NOTIFICATION
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-rust_binder_debug_mask-v3-6-0de91bbbbf69@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783946130; l=2692;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=Ac2/HhH4s3DlFi55GxIloHEGDjTqfnRwxNUHDja4HeI=;
 b=yfGc+GP3VvqjNRlJmoaDXFpEMxjfZRjbMUxz0D4asGe7UYhryD5Cbyby6Z9wSDNV7/0QvQRIx
 KRCNr1vOHtSBlM1fz8qBveTrC+nc9LL9ev3rLKSb49HhCyOobmILnN8
X-Developer-Key: i=jahnavimn@google.com; a=ed25519;
 pk=9aLfw3FepTOJwTS7jRXm7pDH87eBeZMXBPrqwU0//RE=
X-Endpoint-Received: by B4 Relay for jahnavimn@google.com/20260702 with
 auth_id=849
X-Original-From: Jahnavi MN <jahnavimn@google.com>
Reply-To: jahnavimn@google.com

From: Jahnavi MN <jahnavimn@google.com>

This adds dynamic debug logs for:
- Memory allocation (OOM) failures when requesting
  death notifications
- Registration and cancellation lifecycle events
  (BC_REQUEST / BC_CLEAR)
- Delivery of death notification events to userspace
  (BR_DEAD_BINDER)

Reviewed-by: Carlos Llamas <cmllamas@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Jahnavi MN <jahnavimn@google.com>
---
 drivers/android/binder/node.rs    |  5 +++++
 drivers/android/binder/process.rs | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index 3f0757058b84..87a2e613a816 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -1105,6 +1105,11 @@ fn do_work(
             // We're still holding the inner lock, so it cannot be aborted while we insert it into
             // the delivered list.
             process_inner.death_delivered(self.clone());
+            binder_debug!(
+                DeathNotification,
+                "sending death notification, cookie {:016x}",
+                cookie
+            );
             BR_DEAD_BINDER
         };
 
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 38190aaa462d..42330fd409c4 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1239,6 +1239,10 @@ pub(crate) fn request_death(
         // Queue BR_ERROR if we can't allocate memory for the death notification.
         let death = UniqueArc::new_uninit(GFP_KERNEL).inspect_err(|_| {
             thread.push_return_work(BR_ERROR);
+            binder_debug!(
+                DeathNotification,
+                "BC_REQUEST_DEATH_NOTIFICATION failed due to memory allocation failure"
+            );
         })?;
         let mut refs = self.node_refs.lock();
         let Some(info) = refs.by_handle.get_mut(&handle) else {
@@ -1282,6 +1286,11 @@ pub(crate) fn request_death(
                 info.node_ref().node.add_death(death, &mut owner_inner);
             }
         }
+        binder_debug!(
+            DeathNotification,
+            "BC_REQUEST_DEATH_NOTIFICATION handle {handle} cookie {:016x}",
+            cookie
+        );
         Ok(())
     }
 
@@ -1325,6 +1334,11 @@ pub(crate) fn clear_death(&self, reader: &mut UserSliceReader, thread: &Thread)
             }
         }
 
+        binder_debug!(
+            DeathNotification,
+            "BC_CLEAR_DEATH_NOTIFICATION handle {handle} cookie {:016x}",
+            cookie
+        );
         Ok(())
     }
 

-- 
2.55.0.795.g602f6c329a-goog


