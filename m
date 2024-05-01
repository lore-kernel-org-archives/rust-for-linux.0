Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A96537E8
	for <rust-for-linux@vger.kernel.org>; Wed,  1 May 2024 13:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714571325; cv=none; b=kCMg3sjsS59pDULIbOdMuk4u4uD85aZ05+c4Av0z646yxkKrYsBWR57vZ5SaiELpE1yzfSPKcLn4Ao9iLR3UC+m90toq7jXJvA7ywLhMacu5ueCYA7c9mVB4IM27Pk6pvu2lUjv2LCGguP4QG86AKOcofQLvBBJHdWNrWHlJMkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714571325; c=relaxed/simple;
	bh=A+wH0Ri3Ib+o9OtNoFuxosQ5elT8T7UaWXlBhzlNRvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jviboMxDg8+OcgCWqUvnaTOiSJNJoqbDsDz7eT81XeY1NPQBoywWCw9qW/a2vowmM4D5fHW0ZVaSDuL4M3Hs/EMe3ditOp6NjYOULqNU0exadirALHEwqVqPP0IEqTTH0f6+E8ctmRq1qbB60UYWx4e3GJDFFS1gan7t7R91Jr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AZjFjDMC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AZjFjDMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714571322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I4Rx1gIUEp5037Kjj0CyBSmgs/y8vxJNHNDgtdUI8O4=;
	b=AZjFjDMCRvaQDD2xTYTp+SaSQ5CRFM+5mGWIsrDvPoqgIWjOYeIhe7G2G7pI4y20Qo0qtL
	fGcVO5TIibyEyTVvvfpwigvWpOyOelAAdyFdQWa9nSdFKHc1bg+WJ7vQJvDzS42CtH2nXC
	Asf2mldqkIzyccRAKNvpOV33AlO6kEM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-UIfd1xSTO0y9vw6SESl3DA-1; Wed, 01 May 2024 09:48:41 -0400
X-MC-Unique: UIfd1xSTO0y9vw6SESl3DA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-418a673c191so29301195e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 01 May 2024 06:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714571320; x=1715176120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I4Rx1gIUEp5037Kjj0CyBSmgs/y8vxJNHNDgtdUI8O4=;
        b=aBHEwS9KA8tASR6kQ5nCvPG0lO/KxnFIQOPSGYJu9/WNwhs41F3cvXwUIf7FVU++HZ
         ykaLFpRQgjbw3jozSN/DXyWhESJC0pntBRjUetGdggkK8UjmROvGwRIc0y2U6+xMSMUf
         2aVOGESa5DXeR+DWNNlcesEn7YdNCGT6GvMC4auDlP9ZfwWP6tHqECEt/Lqb7dVgFjKI
         Dx5qgGE/JU0wq3601gxYu64FfvdmyS6OO9iRZe+dM9+nWjvjwVRfRtEn/h6LT7AbM7Y8
         NTbfjd3Zsl+gpA+P88jAS28PSTjAlxkpeCtiRdvS3VxmKdQoG1Je4ZUI1kr2p1PVJ1vn
         31/A==
X-Gm-Message-State: AOJu0YzIlvBD/WraYytddA/DF/0eL/M90HUwNbRXd8SRVDJb3BO27Lrs
	0o9x3mD2B7Fhbo1SVP8CnDvcyegnotyLpn4P5SKp3dgvxc3EkuhZnm8E/Mvc6GJWbtoyyzthzk9
	j02yMTro0B0t5tU6Zi4WA9BLrpx5B6k/iYe2m6N8kNh/asSVL+1xM9at5p9T3aUgg
X-Received: by 2002:a05:600c:5249:b0:41b:c024:8e88 with SMTP id fc9-20020a05600c524900b0041bc0248e88mr1629118wmb.33.1714571320530;
        Wed, 01 May 2024 06:48:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMRzOEDA8t+OyLTm3lpT824gxjd1uqFEVXYvgcyrrX7QsGJElrj28fCo0QXS7FJFmzC8Yshw==
X-Received: by 2002:a05:600c:5249:b0:41b:c024:8e88 with SMTP id fc9-20020a05600c524900b0041bc0248e88mr1629098wmb.33.1714571320123;
        Wed, 01 May 2024 06:48:40 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id s7-20020a05600c384700b0041c12324eb6sm2278791wmr.22.2024.05.01.06.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 06:48:39 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com
Cc: rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v3] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
Date: Wed,  1 May 2024 15:47:43 +0200
Message-ID: <20240501134834.22323-1-dakr@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
passing a dangling pointer (instead of NULL) to krealloc() whenever a new
Vec<T>'s backing storage is allocated through VecExt<T> extension
functions.

This only works as long as align_of::<T>(), used by Unique::dangling() to
derive the dangling pointer, resolves to a value between 0x0 and
ZERO_SIZE_PTR (0x10) and krealloc() hence treats it the same as a NULL
pointer however.

This isn't a case we should rely on, since there may be types whose
alignment may exceed the range still covered by krealloc(), plus other
kernel allocators are not as tolerant either.

Instead, pass a real NULL pointer to krealloc_aligned() if Vec<T>'s
capacity is zero.

Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation flags")
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
Changes in v3:
  - correct description of which cases actually can cause the issue (Wedson)
  - use the old pointer to rebuild the old vector on allocation failure (Wedson)
  - add RB tag (Benno)

Note: I did not remove the "Fixes" tag, if you think it will be invalidated,
      feel free to remove it when applying the patch.

Changes in v2:
  - correct the description of the pointer value produced by
    Unique::dangling() (Alice)
  - add RB tags (Alice, Boqun)
---
 rust/kernel/alloc/vec_ext.rs | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/alloc/vec_ext.rs b/rust/kernel/alloc/vec_ext.rs
index 6a916fcf8bf1..2fefc5623455 100644
--- a/rust/kernel/alloc/vec_ext.rs
+++ b/rust/kernel/alloc/vec_ext.rs
@@ -4,6 +4,7 @@
 
 use super::{AllocError, Flags};
 use alloc::vec::Vec;
+use core::ptr;
 use core::result::Result;
 
 /// Extensions to [`Vec`].
@@ -135,14 +136,23 @@ fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocError>
         let new_cap = core::cmp::max(cap * 2, len.checked_add(additional).ok_or(AllocError)?);
         let layout = core::alloc::Layout::array::<T>(new_cap).map_err(|_| AllocError)?;
 
-        let (ptr, len, cap) = destructure(self);
+        let (old_ptr, len, cap) = destructure(self);
+
+        // We need to make sure that `ptr` is either NULL or comes from a previous call to
+        // `krealloc_aligned`. A `Vec<T>`'s `ptr` value is not guaranteed to be NULL and might be
+        // dangling after being created with `Vec::new`. Instead, we can rely on `Vec<T>`'s capacity
+        // to be zero if no memory has been allocated yet.
+        let ptr = match cap {
+            0 => ptr::null_mut(),
+            _ => old_ptr,
+        };
 
         // SAFETY: `ptr` is valid because it's either NULL or comes from a previous call to
         // `krealloc_aligned`. We also verified that the type is not a ZST.
         let new_ptr = unsafe { super::allocator::krealloc_aligned(ptr.cast(), layout, flags) };
         if new_ptr.is_null() {
             // SAFETY: We are just rebuilding the existing `Vec` with no changes.
-            unsafe { rebuild(self, ptr, len, cap) };
+            unsafe { rebuild(self, old_ptr, len, cap) };
             Err(AllocError)
         } else {
             // SAFETY: `ptr` has been reallocated with the layout for `new_cap` elements. New cap

base-commit: 2c1092853f163762ef0aabc551a630ef233e1be3
-- 
2.44.0

