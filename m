Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945A03F39DC;
	Thu, 16 Jul 2026 08:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191081; cv=none; b=tG9VTmMWN2OavY98QdjpjcNK7PjOWACxOQ35W4nkb3mW6h8cbVuY8DTKFJ6srZHq2Px94FOOiul3nMeLmzQYm+I6WbKUYE0f0Y6wM0fdEuYxDNXHIEIv2dJ42wOXq1fJBH/OxChFqjEXRrroJ77Rj3gQ4p3wg01yIcVrm7ty6RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191081; c=relaxed/simple;
	bh=T82V1oVLu3MC1fe9ouNqKKzzEAuMrq4/uaOCVzuAqDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YHMujOk09INuqjWh8sQ5gaLS1Ob6f342jdXmVd32y5dbvw0v6ny0gNxWgbRnvj1vZb3GwPWSPdZGHrHs26E4LT0Sj4X5zQKFFvhPZcAru1RWMQ5ZIURb2Yjw1ElHiPtMjGBzw83VEhsVp0Ju1Amo9CsIaxomZ4EJYkQnJ61WpGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lx4lfLaw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lx4lfLaw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D461C32782;
	Thu, 16 Jul 2026 08:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784191080;
	bh=T82V1oVLu3MC1fe9ouNqKKzzEAuMrq4/uaOCVzuAqDA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lx4lfLaw9IUK5vbcByb+5LFYIEdVQhcEO8T364YWOLT0rQ9F15hs9UMqKSRIW/zFh
	 fUBUwdcDCwBRO8DBDJgoS1JptodCv623evIv/H+5pcN7yZxzCsNYNMv318fLV3Lu/G
	 hbAfjdOBtcaN7ngLYEA7/tQEmYSEvjciF7bjmsM50rBvQ8cR9dvU41kXy7QrYAB5W+
	 I5nAhbxskPFF2FXmuamrPUyd85jwFvpgoL4omJvwSp1Km4+y6E5JVJM7c3WlcV8TNq
	 smnAabNx0o8q4j6ytwvYkXp3rKJtUhaUgEVdM8/ARyMcHigLb3fjnR9npUojfzHBoX
	 2rXkXTuIk81fw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CD0C44518;
	Thu, 16 Jul 2026 08:38:00 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Date: Thu, 16 Jul 2026 08:37:48 +0000
Subject: [PATCH v4 6/7] rust_binder: Implement
 BINDER_DEBUG_DEATH_NOTIFICATION
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-rust_binder_debug_mask-v4-6-3d7436c2d2f2@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784191078; l=2692;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=JbTuHL6w3vDZL9VcRbA4qukZLLJuEs0Io07aTcZSl3U=;
 b=0SD0pPCuRQaNLetd1aYsu2934fsLU8mPM1QD1uuqVY6lPn/IXkmXrtoMFC5eoh4urjdqgZKwG
 kKUbIR2kStsA2LBvGUcWdHBXXFvTSrp7f+oDMeFHFKX9PQ199R4aEcf
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
index fefa723d13c4..8a87dc366aa9 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -1107,6 +1107,11 @@ fn do_work(
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
index 1d3a71292de0..eb2f08bec655 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1253,6 +1253,10 @@ pub(crate) fn request_death(
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
@@ -1296,6 +1300,11 @@ pub(crate) fn request_death(
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
 
@@ -1339,6 +1348,11 @@ pub(crate) fn clear_death(&self, reader: &mut UserSliceReader, thread: &Thread)
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
2.55.0.229.g6434b31f56-goog


