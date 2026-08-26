Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B3F46EC79
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762130; cv=none; b=Gyl/5cuFuvltv+gQKZqnh8REyqzUpoPJ4kk6BSUCSgv+ucn4Jrhl8RPGtK/c0nl1IXo8DQLpFbmjc4/JLmZyZkHNHF/SzX1ox2UjX9CGZbUKzm1PiHrZ9ud3wPUhwMeGkucU+i/6Etb2zEZlO58dp/nK5S8bwOMOV+FQdbyfXzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762130; c=relaxed/simple;
	bh=YKymVUUyZ7UGeMDYKgVog3jhblqeyIsPz5g/YyB6uyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mtddP3Q6aaxjN9qyB0ia0XpPVewkbORWVfutoVD9pKwyAgx6s2ALyDIfqRnEbHgNBazlCBJrhyOAruEPg0N4S3GGk8vbo9MgpeS7IvUBBt3kXRU0fz5Xjtus4vJUBV0JQ8Iq/QZ4SOlvVW3yW9JA1ZC1ulrBjFp1/WS1dqrMifI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=mPyZdEQU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="mPyZdEQU"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so11422575e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762121; x=1788366921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SXEytlmX0vpXu3DnyTVijLx/cmaB8yZkZdcl8MvS/s=;
        b=mPyZdEQU4z7uFeUF0tVohpUDPgK/R8NyK+HYMBW5/xEyJyZKyb7K/4YUmt09k4vzL5
         3FA8CSzU6wgWGYHlAQB0Nf/GpO0QbeKad9G4yXLNTQR0Bq6gUyvksBKJfBbathOVDv0H
         XbHmQjRez/eqnRqB+sMq97Svj9IZ82aswIiiyYfoT9geu9e0lUnhLzxglKldx3R9+MlM
         aRmUqQlbXL8o59RgfkIbE9aBIhYtPnZjimRR80vC9PuIea3hQ0KxTNJQTsO5jCE9oHP3
         oIuhJji0qXeSRee0lqw9uA2Q8OXgdDA7kv46OjtOqwSzQQWan/i5XFh4GloYUuu4TiKB
         7K7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762121; x=1788366921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9SXEytlmX0vpXu3DnyTVijLx/cmaB8yZkZdcl8MvS/s=;
        b=S6K8oKRIcJ//mANIi0/S45p/X7XKfcc0bBdm6Ev6mJTzBkaxmaSQBBpEujTNjKFQJN
         iJa9Ve9+T1x/Y3ilULJkdNmZfzQbhCIMfViy3GeMhiDVjNCdZ4UIyFKzEbUJxuPZU3Xx
         D7v9fla0covGTZEG1CokLS7ePgb83pZqySMr95932aGR2QE5uSMMyrE5QaejeG32kyMc
         0T4qaWG9kf5rNrJmP5UTaHqfn15LMLbLbGFvZOHDk+1X6T0MEU3RlrMQsYclc72cXcyB
         Pk6y0F+xCikMe1ezfJQpUkHYYZDfS3tbHxdoqekcnDRv+04L7SdAaXl8nP9X10oELel8
         sVqA==
X-Forwarded-Encrypted: i=1; AHgh+RoPT/652xFhhDcamfLUbLsf7s7bPeKCamR7pTv99qInyqo1gJ/+n0Y0KGxnGQg18VHo3rDRTR+p6aWPEn26sw==@vger.kernel.org
X-Gm-Message-State: AFuF++lmsbGGaHBOQv3C27uyx60xB8tHYqAZbnz7b9IxTq7eHkyAt8dU
	fxAqcmtnwkMl7FrQ3A/WJwS+lOZ6VWpHUbP8Aa7Roh0vnmdE9tGjH6m/F3eRhe/YKg==
X-Gm-Gg: AR+sD13OMoJZjkwVtwCH9xZR/a9dNN8LYQT7Xvl9TwfFySrHtTFou4Yak/uTjwtykno
	caaGWIY2dfDfyIuAqFAoBYlZoKID0gO0oKxULJqVavu/ZLah1feymlFkr3/hqmrNWn1u0K4zIme
	p3nOLhGEY1rMmqIqrk9dE312t+SIy36fPBuyxgSy4FRpkfxUrJhdlCVpeG7oZGPgIywOJ+GaDPG
	LhvlXkVLqpzT5Xg1nz+zBVD1kOvMALu7NdsbwTrvkKDKdAVvF/3iQxo8jeuFSedae7GxQYr/EEs
	/2/KreBUAczvkY0liiWEp/PoRUPAz6w7WynKTbZzHV/+kRpz1NTfjcKbgzvEjKEmDbmVVeiIPHj
	NFqWt0NKRZ9i21N4NGzJA4S4tPIXpYJGvxBqTADZmkkiafQs/bSwdAWIHqDB7ALa4U/FhIH0DUa
	pjwNyLWLgzoZX8yvdYSjwuna19KUQsS1WP5vwP2xJkud0oQzYAeE9P47GLtgehEADe6PBP13dwc
	CuURN1g0LhSUhtNt/RttUq9rtzIcnMJpQNJ
X-Received: by 2002:a05:600c:4585:b0:499:db6c:6abd with SMTP id 5b1f17b1804b1-499dc6f3200mr70550645e9.2.1787762121399;
        Wed, 26 Aug 2026 09:35:21 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:35:20 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lyude Paul <lyude@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Burak Emir <bqe@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/23] rust: drm: kms: add typed color and rotation properties
Date: Wed, 26 Aug 2026 17:31:38 +0100
Message-ID: <20260826163359.4998-8-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163359.4998-1-mike@fireburn.co.uk>
References: <20260826163359.4998-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add typed KMS property support for CRTC gamma lookup tables and
plane rotation.

ColorLut exposes validated drm_color_lut entries without generated
bindings. Rotation represents only combinations accepted by the DRM
rotation property, while the plane state accessors expose placement
and cursor-hotspot coordinates needed by software and transport
scanout drivers.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/drm/kms/crtc.rs     | 53 ++++++++++++++++++
 rust/kernel/drm/kms/plane.rs    | 95 +++++++++++++++++++++++++++++++++
 3 files changed, 149 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index ae3017539767..38ad80fae0ed 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -37,6 +37,7 @@
 #include <drm/display/drm_hdcp.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index a3217f8c55e8..a7024d8921ca 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -25,6 +25,27 @@
 };
 use macros::vtable;
 
+/// One entry in a DRM gamma or degamma lookup table.
+#[repr(transparent)]
+pub struct ColorLut(bindings::drm_color_lut);
+
+impl ColorLut {
+    /// Red channel value.
+    pub fn red(&self) -> u16 {
+        self.0.red
+    }
+
+    /// Green channel value.
+    pub fn green(&self) -> u16 {
+        self.0.green
+    }
+
+    /// Blue channel value.
+    pub fn blue(&self) -> u16 {
+        self.0.blue
+    }
+}
+
 /// The main trait for implementing the [`struct drm_crtc`] API for [`Crtc`].
 ///
 /// Any KMS driver should have at least one implementation of this type, which allows them to create
@@ -357,6 +378,17 @@ pub fn new<'a, PrimaryData, CursorData>(
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
@@ -686,6 +718,27 @@ fn mode(&self) -> &DisplayMode {
         // atomic-state API serializes access while the mode can be changed.
         unsafe { DisplayMode::as_ref(core::ptr::addr_of!((*self.as_raw()).mode)) }
     }
+
+    /// Returns the CRTC's gamma LUT for this state as an array of [`ColorLut`] entries, or
+    /// [`None`] if no gamma LUT is programmed. Requires gamma to have been enabled on the CRTC
+    /// (see [`UnregisteredCrtc::enable_gamma`]).
+    ///
+    fn gamma_lut(&self) -> Option<&[ColorLut]> {
+        // SAFETY: `as_raw()` is a valid `drm_crtc_state`.
+        let blob = unsafe { (*self.as_raw()).gamma_lut };
+        if blob.is_null() {
+            return None;
+        }
+        // SAFETY: a non-null gamma_lut blob is valid for the state's lifetime.
+        let (data, length) = unsafe { ((*blob).data, (*blob).length) };
+        let n = length / core::mem::size_of::<ColorLut>();
+        if data.is_null() || n == 0 {
+            return None;
+        }
+        // SAFETY: `ColorLut` is transparent over `drm_color_lut`; the blob holds `n` contiguous
+        // entries valid for the state's lifetime.
+        Some(unsafe { core::slice::from_raw_parts(data.cast::<ColorLut>(), n) })
+    }
 }
 impl<T: AsRawCrtcState> RawCrtcState for T {}
 
diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index 3a95c45b6728..8e3f711b0767 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -25,6 +25,72 @@
     ptr::{null, null_mut, NonNull},
 };
 
+/// Plane rotation and reflection properties.
+#[derive(Copy, Clone, Debug, PartialEq, Eq)]
+pub struct Rotation(u32);
+
+impl Rotation {
+    /// No rotation.
+    pub const ROTATE_0: Self = Self(bindings::DRM_MODE_ROTATE_0);
+    /// Rotate clockwise by 90 degrees.
+    pub const ROTATE_90: Self = Self(bindings::DRM_MODE_ROTATE_90);
+    /// Rotate clockwise by 180 degrees.
+    pub const ROTATE_180: Self = Self(bindings::DRM_MODE_ROTATE_180);
+    /// Rotate clockwise by 270 degrees.
+    pub const ROTATE_270: Self = Self(bindings::DRM_MODE_ROTATE_270);
+    /// Reflect across the X axis after rotation.
+    pub const REFLECT_X: Self = Self(bindings::DRM_MODE_REFLECT_X);
+    /// Reflect across the Y axis after rotation.
+    pub const REFLECT_Y: Self = Self(bindings::DRM_MODE_REFLECT_Y);
+
+    /// Return whether every bit in `other` is set.
+    pub const fn contains(self, other: Self) -> bool {
+        self.0 & other.0 == other.0
+    }
+
+    /// Return the selected rotation without reflection bits.
+    pub const fn angle(self) -> Self {
+        Self(self.0 & bindings::DRM_MODE_ROTATE_MASK)
+    }
+
+    fn bits(self) -> u32 {
+        self.0
+    }
+}
+
+impl BitOr for Rotation {
+    type Output = Self;
+
+    fn bitor(self, rhs: Self) -> Self::Output {
+        Self(self.0 | rhs.0)
+    }
+}
+
+/// Supported plane pixel-blend modes.
+#[derive(Copy, Clone, Debug, PartialEq, Eq)]
+pub struct BlendModes(u32);
+
+impl BlendModes {
+    /// Source pixels are premultiplied by alpha.
+    pub const PREMULTIPLIED: Self = Self(1 << bindings::DRM_MODE_BLEND_PREMULTI);
+    /// Source pixels provide straight alpha coverage.
+    pub const COVERAGE: Self = Self(1 << bindings::DRM_MODE_BLEND_COVERAGE);
+    /// Ignore per-pixel alpha.
+    pub const PIXEL_NONE: Self = Self(1 << bindings::DRM_MODE_BLEND_PIXEL_NONE);
+
+    fn bits(self) -> u32 {
+        self.0
+    }
+}
+
+impl BitOr for BlendModes {
+    type Output = Self;
+
+    fn bitor(self, rhs: Self) -> Self::Output {
+        Self(self.0 | rhs.0)
+    }
+}
+
 /// The main trait for implementing the [`struct drm_plane`] API for [`Plane`].
 ///
 /// Any KMS driver should have at least one implementation of this type, which allows them to create
@@ -350,6 +416,28 @@ pub fn new<'a>(
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
+        default_rotation: Rotation,
+        supported_rotations: Rotation,
+    ) -> Result {
+        // SAFETY: `as_raw()` is a valid, not-yet-registered plane.
+        to_result(unsafe {
+            bindings::drm_plane_create_rotation_property(
+                self.as_raw(),
+                default_rotation.bits(),
+                supported_rotations.bits(),
+            )
+        })
+    }
 }
 
 /// A trait implemented by any type that acts as a [`struct drm_plane`] interface.
@@ -627,6 +715,13 @@ fn crtc_h(&self) -> u32 {
         self.as_raw().crtc_h
     }
 
+    /// The plane's rotation/reflection (`DRM_MODE_ROTATE_*` | `DRM_MODE_REFLECT_*` bitmask), for a
+    /// plane with a rotation property (see
+    /// [`UnregisteredPlane::create_rotation_property`]). Defaults to `DRM_MODE_ROTATE_0`.
+    fn rotation(&self) -> Rotation {
+        Rotation(self.as_raw().rotation)
+    }
+
     /// Return the current [`OpaqueCrtc`] assigned to this plane, if there is one.
     ///
     /// The returned CRTC reference cannot outlive the plane-state borrow:
