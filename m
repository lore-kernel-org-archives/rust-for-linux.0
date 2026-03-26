Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67922347FFE
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 06:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774508153; cv=none; b=KM5zzQWRt0IT8GcD0EeibgjGPwXewzfBPBBRqF/T5Ps+qTBHS9swROO345FberNtl/3G/uQvlIAGZSEakf+rEorBLqTVFESTUzSRn+x/dTAsRSNbQrEW7spzD2BbAismkhMT8GwBDwSDUSy55S14X0e4JL9ExTetA4Kh5rnppkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774508153; c=relaxed/simple;
	bh=SytIgt6vozG/m7mKrWMtN9I/xCnkOKzotNdgnHBSKms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0NjTVUDyx3PGZYSgmnax51uroZZehgBWhWEsD+wfc2Ry/95HmOsN49xJJibgHMgZ/G4NuWFOrxTO/CytlzCyHvcYntLvYdZZMyFvczG84ieoGTc08px7WYOF4TUwjwW8BbtZPGYYbKpW+3UDTsDz9n/+6ijwnHFTubIuf4zVSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FMrqbgs2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FMrqbgs2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23F6CC2BCB6;
	Thu, 26 Mar 2026 06:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1774508153; bh=SytIgt6vozG/m7mKrWMtN9I/xCnkOKzotNdgnHBSKms=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FMrqbgs2DlpldKJWSHjElK/dUxRGFRonAohwzQHdhZ0XUWbRvoJjbE2GWwr8hV7UL
	 bomhbAUXsZDw7BlxeXzNNvd3lRhnRgS/3J9CTlTPo4Qh1KwMFKQIwV84mg7wkXQ7hw
	 BD3KhmHI7jKzCGAAfkmCXhQLxW53981ri1XQZX5E=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1D1103A9A0;
	Thu, 26 Mar 2026 06:55:53 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Thu, 26 Mar 2026 14:53:02 +0800
Subject: [PATCH 09/13] rust: drm/gem/shmem: add resident_size() and madv()
 for debugfs
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-tyr-debugfs-v1-9-074badd18716@linux.dev>
References: <20260326-b4-tyr-debugfs-v1-0-074badd18716@linux.dev>
In-Reply-To: <20260326-b4-tyr-debugfs-v1-0-074badd18716@linux.dev>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774508149; l=1568;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=SytIgt6vozG/m7mKrWMtN9I/xCnkOKzotNdgnHBSKms=;
 b=Ea7ydItVYP4cJFCZjIvjMC/oeE5RvEUs+qTXYnefnkzU4Xko+9pE9PboTNYV6i5KsfdrGtuoz
 eaU/ysJ1tHoDCEteIG+NuIrnhVchMD6ObkkGXU6pw/2kL1Gqax8xznX
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Expose resident size and madvise state of shmem GEM objects so drivers
can show per-BO memory usage and reclaimable size in debugfs.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/kernel/drm/gem/shmem.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 065bdd78d1ba6..ba25a4a832db6 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -196,6 +196,27 @@ extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
         let _ = unsafe { KBox::from_raw(this) };
     }
 
+    /// Returns the resident size of this object.
+    #[inline]
+    pub fn resident_size(&self) -> usize {
+        // SAFETY: `self.as_raw_shmem()` is guaranteed to be a valid pointer to a
+        // drm_gem_shmem_object.
+        if unsafe { (*self.as_raw_shmem()).pages }.is_null() {
+            0
+        } else {
+            // SAFETY: `self.as_raw()` is guaranteed to be a valid pointer to a drm_gem_object.
+            unsafe { (*self.as_raw()).size }
+        }
+    }
+
+    /// Returns the state for madvise of this object.
+    #[inline]
+    pub fn madv(&self) -> i32 {
+        // SAFETY: `self.as_raw_shmem()` is guaranteed to be a valid pointer to a
+        // drm_gem_shmem_object.
+        unsafe { (*self.as_raw_shmem()).madv }
+    }
+
     /// Creates (if necessary) and returns an immutable reference to a scatter-gather table of DMA
     /// pages for this object.
     ///

-- 
2.43.0


