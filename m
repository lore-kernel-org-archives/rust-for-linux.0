Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4963D304BB3
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047725; cv=none; b=nhNFoAL6cYbOaS71kEwPiEFGXJg4SqSORq8iub71zeiwpQQE8xN3yTrzm/1E7bnU4ZVRltYEWt9oIqpTV5zog8Iz1Aen8Ze6uKeQT3cdilRktWoVjo0O55d7/iRVZcQkWUtWHZGbIVN0+2FqYoN7l/9wL3cRLUf7vdwvLjkgXfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047725; c=relaxed/simple;
	bh=SJ+2KGFnHCovNgowJ8J8TKTzxcye2f9b6WfXIPwMW1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fASu8UlhQw7WUWzxPxGw2ErZyF0pf6AA/OPmuUdqu9e08NbOPjsiWEBFJjY7BarJ5ddztukHCOrvyTRyFMRk/ulPRz0yrWNiAF2wlMBLIT9Z8q8/LCHCgBec2y6tbFUSswG5YgG1fxeno01l5BkpHwT0V2CBIKPu0GUIoG2dEeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=KPuWr3DW; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="KPuWr3DW"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47640541585so52824f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047722; x=1783652522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUgBn6zBfsTbi2CLsMgn9qh9uhx+O3ZRcBIzQDpiX/c=;
        b=KPuWr3DWQASF5qWkn68ePpcYzO5ICfirsARHKWY54kwkbK1v7GdMVAi12c8Jjr9dmU
         Vl1qxGZpYrjLLHZwQ8gzNVa2VsEEaX/P//Wn5iKxw0f+3Cf0cg3CVltXjDtLlQCiLyZ+
         VEclAe3vuj9j+WWDDr2VdPe+KK/uJdWKa44+yYDNpZxIF861hxAxgy4jLVjiubxdxCTW
         8yPB5YP5giuTeqvUsnfhY229bo74GEoejAKZO+91tK/ErlI3ZVnim0DbuztZ9X3ncCCX
         a+tAk2ZtzNUT1Z1vkvalUuIdvxKyIs9eQ/4c1sJmPET1dYoyKBvgYQQ+3aEhef79rqnm
         xMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047722; x=1783652522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LUgBn6zBfsTbi2CLsMgn9qh9uhx+O3ZRcBIzQDpiX/c=;
        b=mwVxKPcGX8z8iQ1bGTBAsNTvfKuoKkRRrIUrNQ2OPESqyu8hWq6DKbKwKjxC+SsaB+
         zWUaMJkhiZDBWcR2Y0Q4ZdORF2fruDtygBIeQgbE2a34gGOTBI/rBmMgtSsxyMHbnOQj
         pHtj6kpLDfZeUVDwjH0H5K70cKRX8PzpK+j+IO4NT70nkWfCn4Zp9EvzwaWiQHQ6T9g/
         mdqaYcIAxUmn5aI+HO9q3fnolB359168HNMKK9jOxxC+3Hjbenw7jj4nH7qdkWyzsbD3
         55xvLU9a2yoVql63Zrlce2WUI4gcIRYUroA1ywgyW0PmhycRHNz8l09uyTFNdg4scLxI
         BDTg==
X-Gm-Message-State: AOJu0Yw6yw1xj6QtyoXazl0y51feUYLEzbIrcl6EFfXLYiWpSeewYYcL
	aXy+kOd7CRzZwbmoE8ohDvHTW3tahEi5VaKGTWb4lfJlezzef9RGH/tP+rl8qo8TlUuQKCZVvpA
	abwz6D+uf
X-Gm-Gg: AfdE7ckP8rVRQ1hSCvtX3Tg6hYvDqa+Sr5r+bFhMHzhSfhtyQpC7atGgBfLcvZaQxkk
	Vjekv0leQqUEW80b8AuRvSf41lCk4ZXhWYaXKz0OUBe0ArlJixNN+O9SgdlVtHlGZruUvekqpm+
	WHLXuzs2Sk+F1l9EUHpYibSX4XiGFIhOjqdOQnpA4BKZwCF93y3I7IB/OsdnPJgzwy2k+W2LdV8
	ELDX1BGxtq3CtTgDJrPB4scNZzGwYMIVHeYjat6XlTzjYnZsZyHtgVjd55FbhddNmMa/7a9rnWc
	QuQkncqGd6LwE+sG8uZ9OH/5e7zwcvRZyb6AcN9vYXslCF1N9alNkwpTbtPGEYwjxpDQx0V2vln
	/kP+b15dELsN1pQQebvEb+wuyE35fsFZRj0B2YwcVWxRh3Y4l0rfwjM9pbZX1KQ/cY3sCumio9y
	r0+U/SlhJdoxoFCS53IskFP6J0veQ1T+E0kAB48JcMd0QnKPJlc7xoU+8u
X-Received: by 2002:a5d:5f54:0:b0:472:3090:d878 with SMTP id ffacd0b85a97d-477571cb785mr12685227f8f.4.1783047721804;
        Thu, 02 Jul 2026 20:02:01 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbacbsm14466500f8f.4.2026.07.02.20.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:01:59 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	Mike Lothian <mike@fireburn.co.uk>
Subject: [RFC PATCH v2 12/18] rust: drm: framebuffer: add geometry accessors, refcounting and a byte-slice vmap
Date: Fri,  3 Jul 2026 04:00:59 +0100
Message-ID: <20260703030123.2814-13-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703030123.2814-1-mike@fireburn.co.uk>
References: <20260617150232.2210-1-mike@fireburn.co.uk>
 <20260703030123.2814-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A driver that reads back a framebuffer's pixels (e.g. DisplayLink's evdi, whose
scanout is pulled by userspace via a GRABPIX ioctl rather than pushed to
hardware) needs three things the Framebuffer binding did not provide:

  - width()/height()/pitch() geometry accessors;

  - reference counting, so the framebuffer flipped in during an atomic commit can
    be held (ARef<Framebuffer>) and mapped later from an ioctl -- add
    AlwaysRefCounted backed by new drm_framebuffer_get()/put() helpers;

  - a way to read the mapping without unsafe in the driver -- add
    FramebufferVmap::as_bytes(), returning the plane-0 mapping as a &[u8] of
    height * pitch(0) bytes, valid for the guard's lifetime.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/helpers/drm/drm.c             |  1 +
 rust/helpers/drm/framebuffer.c     | 13 +++++++
 rust/kernel/drm/kms/framebuffer.rs | 54 ++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)
 create mode 100644 rust/helpers/drm/framebuffer.c

diff --git a/rust/helpers/drm/drm.c b/rust/helpers/drm/drm.c
index 5d700d75c0c9..24c531841ba1 100644
--- a/rust/helpers/drm/drm.c
+++ b/rust/helpers/drm/drm.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include "atomic.c"
+#include "framebuffer.c"
 #include "gem.c"
 #include "vma_manager.c"
 #include "vblank.c"
diff --git a/rust/helpers/drm/framebuffer.c b/rust/helpers/drm/framebuffer.c
new file mode 100644
index 000000000000..280538ffb82c
--- /dev/null
+++ b/rust/helpers/drm/framebuffer.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <drm/drm_framebuffer.h>
+
+void rust_helper_drm_framebuffer_get(struct drm_framebuffer *fb)
+{
+	drm_framebuffer_get(fb);
+}
+
+void rust_helper_drm_framebuffer_put(struct drm_framebuffer *fb)
+{
+	drm_framebuffer_put(fb);
+}
diff --git a/rust/kernel/drm/kms/framebuffer.rs b/rust/kernel/drm/kms/framebuffer.rs
index 1ec6779ba7de..c7089b12d0d1 100644
--- a/rust/kernel/drm/kms/framebuffer.rs
+++ b/rust/kernel/drm/kms/framebuffer.rs
@@ -9,6 +9,7 @@
     drm::device::Device,
     error::{code::EINVAL, to_result},
     prelude::*,
+    sync::aref::AlwaysRefCounted,
     types::*,
 };
 use bindings;
@@ -46,6 +47,23 @@ fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
 }
 
 // SAFETY: References to framebuffers are safe to be accessed from any thread
+// SAFETY: `struct drm_framebuffer` is refcounted via `drm_framebuffer_get()`/`drm_framebuffer_put()`,
+// which are the correct increment/decrement operations for it.
+unsafe impl<T: KmsDriver> AlwaysRefCounted for Framebuffer<T> {
+    #[inline]
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees the refcount is non-zero.
+        unsafe { bindings::drm_framebuffer_get(self.as_raw()) };
+    }
+
+    #[inline]
+    unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee the refcount is non-zero; `Framebuffer<T>` has
+        // the same layout as `struct drm_framebuffer`.
+        unsafe { bindings::drm_framebuffer_put(obj.as_ptr().cast()) };
+    }
+}
+
 unsafe impl<T: KmsDriver> Send for Framebuffer<T> {}
 // SAFETY: References to framebuffers are safe to be accessed from any thread
 unsafe impl<T: KmsDriver> Sync for Framebuffer<T> {}
@@ -79,6 +97,30 @@ pub(crate) fn as_raw(&self) -> *mut bindings::drm_framebuffer {
         self.0.get()
     }
 
+    /// The framebuffer's width in pixels.
+    #[inline]
+    pub fn width(&self) -> u32 {
+        // SAFETY: `as_raw()` is a valid framebuffer; `width` is set at creation and immutable.
+        unsafe { (*self.as_raw()).width }
+    }
+
+    /// The framebuffer's height in pixels.
+    #[inline]
+    pub fn height(&self) -> u32 {
+        // SAFETY: `as_raw()` is a valid framebuffer; `height` is set at creation and immutable.
+        unsafe { (*self.as_raw()).height }
+    }
+
+    /// The byte stride (pitch) of colour plane `index`.
+    ///
+    /// A `drm_framebuffer` has at most four colour planes; `index` is masked into `0..=3`.
+    #[inline]
+    pub fn pitch(&self, index: usize) -> u32 {
+        // SAFETY: `pitches` has four elements; `index & 3` keeps the access in bounds. The pitches
+        // are set at creation and immutable.
+        unsafe { (*self.as_raw()).pitches[index & 3] }
+    }
+
     /// Map this framebuffer's plane-0 backing pages into the kernel address space for CPU
     /// access, for the duration of the returned guard.
     ///
@@ -123,6 +165,18 @@ pub fn as_ptr(&self) -> *const u8 {
         // SAFETY: set non-null in `Framebuffer::vmap`; `vaddr` is the active union member.
         (unsafe { self.map[0].__bindgen_anon_1.vaddr }) as *const u8
     }
+
+    /// Plane 0's mapped pixels as a byte slice.
+    ///
+    /// The slice covers `height * pitch(0)` bytes — the full extent of colour plane 0 — and is
+    /// valid for the guard's lifetime. This lets callers read the scanout buffer without `unsafe`.
+    #[inline]
+    pub fn as_bytes(&self) -> &[u8] {
+        let len = self.fb.height() as usize * self.fb.pitch(0) as usize;
+        // SAFETY: `drm_gem_fb_vmap` mapped colour plane 0 contiguously at `as_ptr()` for at least
+        // `height * pitch(0)` bytes, and the mapping is live for `self`'s lifetime.
+        unsafe { core::slice::from_raw_parts(self.as_ptr(), len) }
+    }
 }
 
 impl<'a, T: KmsDriver> Drop for FramebufferVmap<'a, T> {
-- 
2.55.0

