Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FFA40B392;
	Wed, 10 Jun 2026 14:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100868; cv=none; b=ndt6FF5QKvnIxWtxfr5BhPXbbwCuXuTqoCpQg+uVW1qpBrm3xxzAPPSwX5rr6L19uHcLQfNzCLErr6Q7mhQp91U2RFQFiWiivOPrR8M4/iIG0F/RkMYlWYEBjL/zoWFzn4JTGrtwRF/B5FrN9vwD6j1+9sCQXuHalQRGmeYgtN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100868; c=relaxed/simple;
	bh=W9s1E0r3ukWe+7fZYR8noYuMzW/ARW1K3YK0VbhtXWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WF6DNZ8UWiY1MFG3NC8YMeOQPYjDKqXnXkOGVrF6Hu5Exgd+zowt9BiNzArBNG7q/N+FLhfskmxnOba79dWTLr081iZ8GfvlMSeV+LDS/npCg501+ksOE3Y9t121mmuB3BegJTQnmrLKh1YlrHYjPhmrueA0Wl8khF9ZCGjQ1Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRfkm673; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRfkm673"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45EBE1F00893;
	Wed, 10 Jun 2026 14:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781100867;
	bh=KPiX8TGWPsoMZqa7PdhBx71whabtl3ZRcCCVFIwYALE=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=eRfkm673gMKYrhae5FF7BN1DR7yX0fQXJNlU/EU7gYjhkNfsSr/mtEHVDxYEdnJqq
	 XLkjMdeK/BbqDAUYhZr0LkyhiSijQIcZdJ6xoRMFQLZgTQIO7oT0SoSXnPOHGqDz+2
	 9Ur8x2Xh4TkAaPPiTODa4o3F9zDLJw2Nhz4sdChq0eTpesEV51xqBgA5OSBJtt9l7r
	 6QHLBQ+CZU7vsxEOZtD0OZesxgXX/R55FnM9R6l2bTkhBz+JzX5PY6BiOibBXpI5DC
	 LBZry63mKf6X2aW1ThYwQrO9TJ26rdqxVuEv4BK9GaFWwYwO+f2c5RRWFtxCJRdQ71
	 1Pto6jqxq4Rgg==
From: Gary Guo <gary@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] drm/tyr: remove imports available from prelude
Date: Wed, 10 Jun 2026 15:13:58 +0100
Message-ID: <20260610141359.1033755-1-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

No functional changes intended.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 drivers/gpu/drm/tyr/regs.rs | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index 562023e5df2f..831357a8ef87 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -48,17 +48,12 @@ pub(crate) fn read_u64_no_tearing(lo_read: impl Fn() -> u32, hi_read: impl Fn()
 /// These registers correspond to the GPU_CONTROL register page.
 /// They are involved in GPU configuration and control.
 pub(crate) mod gpu_control {
-    use core::convert::TryFrom;
     use kernel::{
-        error::{
-            code::EINVAL,
-            Error, //
-        },
         num::Bounded,
+        prelude::*,
         register,
         uapi, //
     };
-    use pin_init::Zeroable;
 
     register! {
         /// GPU identification register.
@@ -964,14 +959,9 @@ pub(crate) mod mmu_control {
     ///
     /// This array contains 16 instances of the MMU_AS_CONTROL register page.
     pub(crate) mod mmu_as_control {
-        use core::convert::TryFrom;
-
         use kernel::{
-            error::{
-                code::EINVAL,
-                Error, //
-            },
             num::Bounded,
+            prelude::*,
             register, //
         };
 

base-commit: 7d570075805918f5ec33f03949c6a7c610397340
-- 
2.54.0

