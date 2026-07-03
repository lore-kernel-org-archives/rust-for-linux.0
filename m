Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688E62DCBFA
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047710; cv=none; b=es9fJ3wk8ktd3PHpynBEf3uTmCECc8sP+5U2sp5HQNjhfNko8lcb/gSuAzSQbkQmlgX690Rmgc4NDlBfyzj38q1g5L+2vTZby/l6MVzPKemFkGhvYh+K60PHxu+OqDXjBqmuvz+f2eDzeZAQ1yop5GJGxDAkKjFq6/aI2WVLXlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047710; c=relaxed/simple;
	bh=49o7iQehUzzXLjEc4rnX2yNZzvxbN0E2UjMy04lft4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h0DQSemo2R0syyj3ynOvPE6lRYt0JJYZbHf4JljPTQ+1A//E7Tjx80yj+vwJAnrMZVNiKpkSq+O0O5PCfuG4/X5Zwk17QaIaIRmy0KWH2M/hvJ9DSqbJWJQ6FQrNz+uYP4ew0UVpaOV5lJiiMoUXmKGxR3XU5Z692k8KN0pGSQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=ygGxZp8v; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="ygGxZp8v"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47640541585so52751f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047707; x=1783652507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DO10bahdwhwvl3OteTgaG/ReLzyVlHiXZrXAAYDCZ/0=;
        b=ygGxZp8vO+PMorq7gZFV2IKnwKKhLLSa7bAb2r+f9hf29A9m8O8UdKGdNXbqOJiGc5
         51NhtB0FIElN1ZyQz0MHzEvMj91fXBeqfoTsGf9N/KmoWjqGikl2s7IPiKzZYvCit96o
         6lGbP70ruNRM/5kqueCXePD+Qhg0OB+e7FlzSqxemJx7B6ndMsrRxe/dGho2McX+tzfx
         z+fCASZ2JHU/+RaKFZ0AZSnEsPG0xZ9ylyAjjLroPz8ruINH1sIJrp+y8QLF3Vmffwqz
         SiECEmqRCG57L2Zv8SMfCVKSeD6mlPdk5DCmq/Ejgillr/fIbajS7ZmdpHhZQCFIHY35
         8aXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047707; x=1783652507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DO10bahdwhwvl3OteTgaG/ReLzyVlHiXZrXAAYDCZ/0=;
        b=EMB2z7Q+LJEsU3HOI+Evl+IHPf7BGtj7pBxNSy2TyS1WP6w481Zpv0BpwSyBcHKduu
         R9uaeHNuVNyBbXXU7nWiyilaWHtmhxks//eqBskTaISBQDzo5IL9Nd/ibIT/aw+FEPuq
         2AHNqZ2QHObn7K4VlSPn/HdLJoxxgF4P6Wdso7gqjwBzKPTT55klCVXUl80Jegkh0c4c
         qXAX74Eeb6EX+50c+2M8qWMyn5EAyDHrw7Z5eo6Blj6NInVah/jNYBt4fg+Wazfmepwx
         JUjmpMzG1XkPcKWW6O158p4cpMtr5pP5947oNOZOlD3/1g7gnBKde2SiCfAzdabK+vxD
         V3xA==
X-Gm-Message-State: AOJu0Yw1jWCImQ7UH14Fo5pheglO1oQhLkHp26VpE4NqXlAaGdlCzRKp
	eMPoRg1Yn3Ci9hw9sBEDPQ8rDFNMTm+NRFbu3123nkgm3bGqxmFmiBSxTK/Cp/H17aomCcW5e8a
	2TWZPk0D3
X-Gm-Gg: AfdE7cnZSdMB6Vfr9fKC9edgfN7/How/0jKPA2Z9qxyzJq57zH7NUW45X6x4WwceJYV
	+mZz3mQa0XXnMX2Sc8P41849DXX3/OtF3ScLLLN14qTGNIPSj7ddc2ouRjb+RMj0hvUhFPsnssQ
	vay4pA6ou0XMbxEseiOE8wncFEj/1F1E6pTzV8R9jq5933tkRk89ykAjsOhUfCQ0DKn252k7AKv
	UtXgxTFZUkueCd9BKdJJPKxANphXX2A4htZnyfiL3XewNDUAMveeicD+lmwfmeTbhDp+G6g6zwm
	5K1bXErse50IMvr+5/RCJAa3gu5eDWPRRqIKdM6GbQFyxgph62Q4yfGhi4z7skq3Mmma+QeXP03
	GlKumsyvzTN43Xf0+zWdzn2ugQHSPn7mq5wR1E6RDUTUw+EsZ145kl5Qal2adlkq372rYcAGZ9E
	crbQkOxhJNCY6BXqwdy8TFKJSJDze/uNiAZDcCHLFQvIVwOzsX+5CMH/oz
X-Received: by 2002:a05:6000:5c5:b0:474:530:9d with SMTP id ffacd0b85a97d-47757797bf8mr13513555f8f.13.1783047706825;
        Thu, 02 Jul 2026 20:01:46 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbacbsm14466500f8f.4.2026.07.02.20.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:01:45 -0700 (PDT)
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
Subject: [RFC PATCH v2 06/18] rust: drm: kms: add a Framebuffer::vmap() guard
Date: Fri,  3 Jul 2026 04:00:53 +0100
Message-ID: <20260703030123.2814-7-mike@fireburn.co.uk>
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
Content-Transfer-Encoding: 8bit

Framebuffer::vmap() maps a framebuffer's plane-0 backing pages into the
kernel address space via drm_gem_fb_vmap()/vunmap(), returning an RAII
FramebufferVmap guard that unmaps on drop. Only single-CPU-visible-plane
framebuffers are supported (packed formats backed by GEM-shmem/CMA;
multi-plane YUV or an unmapped imported dma-buf return EINVAL). This is
the driver-side FbVmap guard the v1 series carried, moved into the layer
proper so every KMS driver gets it instead of hand-rolling the same
map/use/unmap dance.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-sonnet-5 [Claude-Code]
---
 rust/kernel/drm/kms/framebuffer.rs | 67 +++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/kms/framebuffer.rs b/rust/kernel/drm/kms/framebuffer.rs
index 54d0391388a9..1ec6779ba7de 100644
--- a/rust/kernel/drm/kms/framebuffer.rs
+++ b/rust/kernel/drm/kms/framebuffer.rs
@@ -5,7 +5,12 @@
 //! C header: [`include/drm/drm_framebuffer.h`](srctree/include/drm/drm_framebuffer.h)
 
 use super::{KmsDriver, ModeObject, Sealed};
-use crate::{drm::device::Device, types::*};
+use crate::{
+    drm::device::Device,
+    error::{code::EINVAL, to_result},
+    prelude::*,
+    types::*,
+};
 use bindings;
 use core::{marker::*, ptr};
 
@@ -67,4 +72,64 @@ pub(super) unsafe fn from_raw<'a>(ptr: *const bindings::drm_framebuffer) -> &'a
         // SAFETY: Our data layout is identical to drm_framebuffer
         unsafe { &*ptr.cast() }
     }
+
+    /// Return the raw `bindings::drm_framebuffer` for this framebuffer.
+    #[inline]
+    pub(crate) fn as_raw(&self) -> *mut bindings::drm_framebuffer {
+        self.0.get()
+    }
+
+    /// Map this framebuffer's plane-0 backing pages into the kernel address space for CPU
+    /// access, for the duration of the returned guard.
+    ///
+    /// Only framebuffers with a single, CPU-visible plane are supported (i.e. packed formats
+    /// backed by GEM-shmem/CMA memory, not multi-plane YUV or an IMPORTED dma-buf without a
+    /// CPU mapping); other cases return `EINVAL`.
+    pub fn vmap(&self) -> Result<FramebufferVmap<'_, T>> {
+        // SAFETY: `iosys_map` is POD (a pointer union plus a bool); all-zero is a valid
+        // "not mapped" value that `drm_gem_fb_vmap` overwrites for present planes.
+        let mut map: [bindings::iosys_map; 4] = unsafe { core::mem::zeroed() };
+        let mut data_map: [bindings::iosys_map; 4] = unsafe { core::mem::zeroed() };
+        // SAFETY: `self.as_raw()` is a valid, GEM-backed framebuffer for the lifetime of `self`.
+        to_result(unsafe {
+            bindings::drm_gem_fb_vmap(self.as_raw(), map.as_mut_ptr(), data_map.as_mut_ptr())
+        })?;
+        // SAFETY: `map[0]` was just filled in by `drm_gem_fb_vmap` above.
+        let vaddr = unsafe { map[0].__bindgen_anon_1.vaddr };
+        if vaddr.is_null() {
+            // SAFETY: balances the vmap just done, with the same `map`.
+            unsafe { bindings::drm_gem_fb_vunmap(self.as_raw(), map.as_mut_ptr()) };
+            return Err(EINVAL);
+        }
+        Ok(FramebufferVmap { fb: self, map, _p: PhantomData })
+    }
+}
+
+/// An RAII guard over a CPU mapping of a [`Framebuffer`]'s plane-0 backing pages, created by
+/// [`Framebuffer::vmap`].
+///
+/// The mapping is torn down when this guard is dropped, so an early return between mapping and
+/// use can never leak it.
+pub struct FramebufferVmap<'a, T: KmsDriver> {
+    fb: &'a Framebuffer<T>,
+    map: [bindings::iosys_map; 4],
+    _p: PhantomData<T>,
+}
+
+impl<'a, T: KmsDriver> FramebufferVmap<'a, T> {
+    /// Plane 0's CPU virtual base address (guaranteed non-null for the guard's lifetime).
+    #[inline]
+    pub fn as_ptr(&self) -> *const u8 {
+        // SAFETY: set non-null in `Framebuffer::vmap`; `vaddr` is the active union member.
+        (unsafe { self.map[0].__bindgen_anon_1.vaddr }) as *const u8
+    }
+}
+
+impl<'a, T: KmsDriver> Drop for FramebufferVmap<'a, T> {
+    fn drop(&mut self) {
+        // SAFETY: `self.fb.as_raw()`/`self.map` are exactly the pair passed to
+        // `drm_gem_fb_vmap` in `Framebuffer::vmap`, and the mapping has not been released
+        // since.
+        unsafe { bindings::drm_gem_fb_vunmap(self.fb.as_raw(), self.map.as_mut_ptr()) };
+    }
 }
-- 
2.55.0

