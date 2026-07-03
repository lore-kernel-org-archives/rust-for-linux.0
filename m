Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F46F27FD4F
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047735; cv=none; b=XXG/kGga2dOddvKVlZnIGw2IdauSvFoAPP2S5DKoZLwHJKrmv4HenwMjSQQu5XEOaj3kSxeBoYbS7283W/ZxEJhRIOGUd9mivnJMj+dW2UX5dbBMa3LKHT3QVON1VcwA4mxpsGI0dQ4CIkcB3kO+pFgj90HPayAiP/D8HOCX6jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047735; c=relaxed/simple;
	bh=1uqvohIdAq62wj82E4SBuODnbfJ/O9m3po4KKTfsvrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VaLFJ4BnxZQ/M8WJBIw+V6yeSNwfgX7B/aRBaXW3oC+6XcUcsiPKj4PcDClZvBLZM7AndNncMGd5oek/XRrxxK2yJ51zsPMWGuHF9Sm2xUhQf/YOwS98nf3RRAB8ax5TaxRqT5ZvwQeWTaKGCN2cg7aNegWROcnziAlm9VRQ7L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=ctZhMcDM; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="ctZhMcDM"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4631679f204so721668f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047732; x=1783652532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TbX8MznRE/lSK8zDxNF2GQ6yML1Vz7QFki+Q6IYGOU=;
        b=ctZhMcDMevIzW+mS5Rvag5U8rR5tNjs9JVPYOv57Ars2gaXMpSLYaKYtNk8cWJ8h4J
         jlXSAYneoRmLXOAc/JrLBZac5Nw+hrvGEecGDr+aFmjr5t+tdUeb3JDXOcZjpg1pDvoD
         YcMJU/zc4fUpYGWlA/KREpGWIaE5Ykg63jYrKvq9wKMWe3JuoHKKg2ctGdP9QBA886VL
         Hj05xheaR6LBTR1UHUW4I8i/513EGEriNYxR+mORqZamLWZO28UfNGhqbkkXGkVRi1KH
         I9C72EBkTEEP9Yf01u+/c84ShXfd7LPAPeZ8b8VJeB0+nO6UoNd8Lp+zVmoK4l5Ne9ET
         QFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047732; x=1783652532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4TbX8MznRE/lSK8zDxNF2GQ6yML1Vz7QFki+Q6IYGOU=;
        b=GdXWf4hoSZh4A0XYoXogoT2A+SEb0AmuZPOlDy5U3hWEYew8L4UiLgmQZJwbe7UXHp
         TRiDQtsh12Dw7trRD3dwu8afyKAC0sbkON1GVBEVb6uNAB7xS3omApFof1bDzstU/qxj
         sItlc1/9t3ajnwJNUTY7OocEiKrFJDLldoicoUQXw3XLKIGx8EQRG1+moTGI4ZCfIYSI
         Px8BtBfUF10Z6ny3f+Z7xzu+S0LCTQ0JLOBZb1J2CmZjA6i1grTi7Loh+gMaLEGfKU9o
         mrc4WLSezmNvI5W3wV2iFZ3c0+kF2spg7RsWxslvuz9fyvXcu96CejYub5jzPMAqjw0F
         nU6Q==
X-Gm-Message-State: AOJu0YwarXc9QLVEEu6F4iCMJ6mq1K4iC4FyjN2k7u+ZUM0kkQJ2cXmQ
	ocbWfOUlsBtxsijC5ID8hawcpZVTf3UwxBCCxGejLNO9xi2+pKm5/8pq2UmUeOQrtmIFcKjlKjm
	Q+iLvaQlu
X-Gm-Gg: AfdE7ckZ36BDV9qGAfqK6FejAzoxBY3ZwG52lgxOhV5FSqR1OV8SHzVk0povdLibBEs
	t4EkkzZk0WBlri9DgTXOUUtt/DZRC+USs7fTD7Kl7Z1Woq2wPMlgYoEFLV/CdYMLjLbo+SD+HLV
	OfFvu/NADiwT0fFuk28+hbavafvgbCwVrvAKxltbRAKRRbvChJfi2klnp2JJnGc9wyfuNhh0eiX
	Oxz/FxKhHl6R56C6Qz7npAo2oSW8T1DMyd/Z0OnSKJy9PPVdP1Q5Jk8b5os6sipfaxRkQvk5Jbh
	szLlpWSk+y0BXkjcImjjf70V88EkRyaHlUIArwkfhKjCgdgjyWpDjqgzJvxXdMel5vu+lbnL67F
	nAcxGvXXayvIe3o59+AgnrkhYsCYIx9DhNpSvaQ0D63Q0tzg8e15BEsz6UCrAK8FsRwI+nOQvzr
	t0EHCJj18MyCb3ItW3FHgdQc6PwnWDgeOgqGUDxxxoh60JlBgFsfy+1cz7
X-Received: by 2002:a05:6000:41fe:b0:46f:8561:fe60 with SMTP id ffacd0b85a97d-4793685fe58mr3081792f8f.17.1783047731472;
        Thu, 02 Jul 2026 20:02:11 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbacbsm14466500f8f.4.2026.07.02.20.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:02:09 -0700 (PDT)
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
Subject: [RFC PATCH v2 16/18] rust: drm: add CRTC gamma LUT and plane rotation property bindings
Date: Fri,  3 Jul 2026 04:01:03 +0100
Message-ID: <20260703030123.2814-17-mike@fireburn.co.uk>
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

Two more mode-object properties a real driver reaches for, and the last
the DisplayLink vino driver needs to match its pre-safe-KMS feature set:

  - CRTC gamma: UnregisteredCrtc::enable_gamma()
    (drm_crtc_enable_color_mgmt, creating a GAMMA_LUT property) and
    RawCrtcState::gamma_lut() to read the set ramp back as a
    &[drm_color_lut].

  - Plane rotation: UnregisteredPlane::create_rotation_property()
    (drm_plane_create_rotation_property) and RawPlaneState::rotation() /
    crtc_x()/crtc_y()/hotspot_x()/hotspot_y() to read the plane's
    placement and orientation.

drm_plane_create_rotation_property lives in <drm/drm_blend.h>, so add
that to bindings_helper.h.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/drm/kms/crtc.rs     | 33 +++++++++++++++++++++++++++++++++
 rust/kernel/drm/kms/plane.rs    | 29 +++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index e5cfda610781..7d04abec1215 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -39,6 +39,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_framebuffer.h>
diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index fbe113676e2f..b5128ae1ca95 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -356,6 +356,17 @@ pub fn new<'a, 'b: 'a, PrimaryData, CursorData>(
         // SAFETY: We just allocated the crtc above, so this pointer must be valid
         Ok(unsafe { &*this })
     }
+
+    /// Enable colour management on this CRTC, creating a `GAMMA_LUT` property of `gamma_size`
+    /// entries that userspace can program (no degamma LUT, no CTM). The set LUT is then readable
+    /// from the CRTC state via [`RawCrtcState::gamma_lut`].
+    ///
+    /// Call this during [`KmsDriver::probe`](crate::drm::kms::KmsDriver::probe), before the device
+    /// is registered.
+    pub fn enable_gamma(&self, gamma_size: u32) {
+        // SAFETY: `as_raw()` is a valid, not-yet-registered CRTC.
+        unsafe { bindings::drm_crtc_enable_color_mgmt(self.as_raw(), 0, false, gamma_size) };
+    }
 }
 
 // SAFETY: We inherit all relevant invariants of `Crtc`
@@ -686,6 +697,28 @@ fn mode(&self) -> &DisplayMode {
         // interface can ensure this access is serialized.
         unsafe { DisplayMode::as_ref(&(*self.as_raw()).mode) }
     }
+
+    /// Returns the CRTC's gamma LUT for this state as an array of [`drm_color_lut`] entries, or
+    /// [`None`] if no gamma LUT is programmed. Requires gamma to have been enabled on the CRTC
+    /// (see [`UnregisteredCrtc::enable_gamma`]).
+    ///
+    /// [`drm_color_lut`]: bindings::drm_color_lut
+    fn gamma_lut(&self) -> Option<&[bindings::drm_color_lut]> {
+        // SAFETY: `as_raw()` is a valid `drm_crtc_state`.
+        let blob = unsafe { (*self.as_raw()).gamma_lut };
+        if blob.is_null() {
+            return None;
+        }
+        // SAFETY: a non-null gamma_lut blob is valid for the state's lifetime.
+        let (data, length) = unsafe { ((*blob).data, (*blob).length) };
+        let n = length / core::mem::size_of::<bindings::drm_color_lut>();
+        if data.is_null() || n == 0 {
+            return None;
+        }
+        // SAFETY: the blob's `data` holds `n` contiguous `drm_color_lut` entries (the blob length
+        // is a multiple of the entry size), valid for the state's lifetime.
+        Some(unsafe { core::slice::from_raw_parts(data.cast::<bindings::drm_color_lut>(), n) })
+    }
 }
 impl<T: AsRawCrtcState> RawCrtcState for T {}
 
diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index fcaa8ba550fe..ead875316829 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -328,6 +328,28 @@ pub fn new<'a, 'b: 'a>(
         // SAFETY: We just allocated the plane above, so this pointer must be valid
         Ok(unsafe { &*this })
     }
+
+    /// Attach a rotation property to this plane, advertising `supported_rotations` (a bitmask of
+    /// `DRM_MODE_ROTATE_*` | `DRM_MODE_REFLECT_*`) with initial value `default_rotation`. The
+    /// selected value is then readable from the plane state via
+    /// [`RawPlaneState::rotation`](crate::drm::kms::plane::RawPlaneState::rotation).
+    ///
+    /// Call this during [`KmsDriver::probe`](crate::drm::kms::KmsDriver::probe), before the device
+    /// is registered.
+    pub fn create_rotation_property(
+        &self,
+        default_rotation: u32,
+        supported_rotations: u32,
+    ) -> Result {
+        // SAFETY: `as_raw()` is a valid, not-yet-registered plane.
+        to_result(unsafe {
+            bindings::drm_plane_create_rotation_property(
+                self.as_raw(),
+                default_rotation,
+                supported_rotations,
+            )
+        })
+    }
 }
 
 /// A trait implemented by any type that acts as a [`struct drm_plane`] interface.
@@ -625,6 +647,13 @@ fn hotspot_y(&self) -> i32 {
         self.as_raw().hotspot_y
     }
 
+    /// The plane's rotation/reflection (`DRM_MODE_ROTATE_*` | `DRM_MODE_REFLECT_*` bitmask), for a
+    /// plane with a rotation property (see
+    /// [`UnregisteredPlane::create_rotation_property`]). Defaults to `DRM_MODE_ROTATE_0`.
+    fn rotation(&self) -> u32 {
+        self.as_raw().rotation
+    }
+
     /// Return the current [`OpaqueCrtc`] assigned to this plane, if there is one.
     fn crtc<'a, 'b: 'a, D>(&'a self) -> Option<&'b OpaqueCrtc<D>>
     where
-- 
2.55.0

