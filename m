Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECDD46EC83
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762147; cv=none; b=LLsW/QfRB2dYlSTrfu8/Fs0XzYC0bRRGia+sayEl6vBMoBgNCT6Miffta/U9Vk8/uUxL79oc1n97iEHdb6Zb3swKtxySgDQgtb5ZD6Im6Llt7tLE7mKB7KiunBcSNAMW+/1CFW00xGyow4zJdnawO6xWNOuhBuMnD7mtWeKNVp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762147; c=relaxed/simple;
	bh=CGdHbbzDPuxbg433p+h2jNb3pV5Krieikr8KFpMpWGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oNZvoFkXthiFPhmd6RjMn+wDFQGNMoJNVHppkVEvF3r1+H4ILs/sKonutmAVqTKp+tbF8HgcGzXf8NCOhY/seHf+Ndh7rKb4d4SxD7toWi/5Uk4dFQJtRxYvRqgk3WgfbarUwa/tLD4/sDPLv0lm4NLKAif1eJ+pYjpvEElibi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=DOMBRBkj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="DOMBRBkj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499a4d1d7f1so7294655e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762133; x=1788366933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5InOYNyXFRZKVSePul+WGyV/aEo1lwukf/GCH3cW8s=;
        b=DOMBRBkjOsGCEh/38hVY91O3gJrHUTEizE18jeHDSb7lxM/X8df+N/UHsV2S55eGej
         mA6tB5rClu6GehEfAG7eywLvibjsTauZ4n0B3SCr1VmSVpjZZUc2BPs+p7A67QoWuxnx
         GiHMxMiCvMgYLV9BINGxjZfbDGM13t4ixVXsMwuCAqk/QxWRBYJy57LujTBIXgeSUx9o
         D1yN2MUkzlOc/AeZnP4NEuVxXYSNuFH3U4Yyznbw9oStAraoeFeY9upLP7IW3zwqnDIn
         S0EXnX3418BgWt6u+oDtTNZpU0IY2C3RQoH0/S1ThCP1bX9W9z7umLyra2srKn+WlW8n
         paHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762133; x=1788366933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j5InOYNyXFRZKVSePul+WGyV/aEo1lwukf/GCH3cW8s=;
        b=KwyqmwiKsEbmZqhZ3rnsB6iejw5J+75xaELwLH54OlAN24t7KByzv+mjjpMLF7Yv7h
         TBh6OrAXwI5baF/bCHa7ahjmu3aOumD/4CI0TPNF5UI6TpblIY1lFiTpu1CPx/Mlu7Xc
         XHupm5G/s0obx9mLBqqXNi+5mgKKWdDC7MxqZjzq2bg1xVvZPU2ZKzV4GDvqiaNW7Ukh
         lKzBxi+rf0dcTXfiO7UtC/rXz8N9EPNIU45+sOtLRiLRyjepUR7YfC54H/fW7FI2ws0o
         rKyqrc4cXy4pYrDbMTGoLZ2YSIUcYBGXBzwdsc33vGm/yLnzMSgZl8aaa/oYpCdcXx21
         ZJmg==
X-Forwarded-Encrypted: i=1; AHgh+RrA5oK18Y2/udnQHR1hLblLKcKstuhBKerNi/Ew56KiFPsTF1jDyk03F6QpkJ4uQuv37EM755iKLml9dsFsTA==@vger.kernel.org
X-Gm-Message-State: AFuF++kDMobKvDOD/kJLgFLJlQBbdmGm2q/5rxlnmPb97+GI+cCNNEum
	/k7t+yPsCAxnwFdYWYbNGQ0zizKVQYmW9MofT7kPhZgAgoJ6YhuGB+Tnn1rItYsmpw==
X-Gm-Gg: AR+sD10NR+4OQDTOfKfBFOYyEMlsFhtlg/9SigvYpUWySJEHblwYykSHX+BM5YAZYfc
	dPdGV0CRVi17oDxGrMwtWDLk2OokJUdngBOd1SlztXK9c2ILG7hoUDNdf1xx1ElhnJEbocfwK8D
	mRJ+AeHrOTikQyX8rKON9lbkZrBoA6OIs6fOk4MaZCgIU+lMmLABtLkPmNbeR4QqwxdQTboJc61
	f9N/VAtYpZGhrUd5g4V3+Bot4i9B+zF1IQwkvdjDmt+tonRebX981dO9ZIA/off47v3/HAcHlI+
	d9v209gfPtpbl3bplGeo+vAW0JLno+kz9H5HOddx6KafPneQox3xUsqIQ0Xo0fkoShIjvosPCC5
	3khvuR0WJiT7EORtLXh4dhXFTo/h2uOZRHF8L42avZLSCmvs0Irg/zTX+pQXsfwWXhvkm88WPzH
	UeQzVeKzlT1ncFcV4X0S7FCrdYFRARakEkzINS6f670+WYeJiszVHbhYPglo8uM8Qe4JEQc6QLZ
	Yuw+wQo/S8jee4TxLoknQjnDVXU16fvaLzl
X-Received: by 2002:a05:600c:4585:b0:498:952:e276 with SMTP id 5b1f17b1804b1-499dc6f7ec9mr70086385e9.8.1787762132870;
        Wed, 26 Aug 2026 09:35:32 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:35:31 -0700 (PDT)
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
	Asahi Lina <lina+kernel@asahilina.net>,
	Matthew Maurer <mmaurer@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 9/23] rust: drm: kms: add plane damage-clip accessors
Date: Wed, 26 Aug 2026 17:31:40 +0100
Message-ID: <20260826163359.4998-10-mike@fireburn.co.uk>
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

Add safe access to the FB_DAMAGE_CLIPS rectangles intersected with
the visible source area.

damage_merged() returns the bounding rectangle produced by
drm_atomic_helper_damage_merged(). for_each_damage_clip() wraps
the DRM damage iterator for drivers that can process the individual
rectangles without repainting their bounding box.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/kms/plane.rs    | 105 ++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 38ad80fae0ed..c4abdd887699 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -41,6 +41,7 @@
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index 8e3f711b0767..3bff4091abb2 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -693,6 +693,49 @@ pub trait FromRawPlaneState: AsRawPlaneState {
     unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_plane_state) -> &'a mut Self;
 }
 
+/// A rectangle in a plane's source (pixel) space, as produced by
+/// [`RawPlaneState::damage_merged`].
+///
+/// The box is inclusive on the top-left and exclusive on the bottom-right (`[x1, x2)` by
+/// `[y1, y2)`), matching [`struct drm_rect`].
+///
+/// [`struct drm_rect`]: srctree/include/drm/drm_rect.h
+#[derive(Copy, Clone, Debug, PartialEq, Eq)]
+pub struct Rect {
+    /// Left edge, inclusive.
+    pub x1: i32,
+    /// Top edge, inclusive.
+    pub y1: i32,
+    /// Right edge, exclusive.
+    pub x2: i32,
+    /// Bottom edge, exclusive.
+    pub y2: i32,
+}
+
+impl Rect {
+    #[inline]
+    fn from_raw(r: &bindings::drm_rect) -> Self {
+        Self {
+            x1: r.x1,
+            y1: r.y1,
+            x2: r.x2,
+            y2: r.y2,
+        }
+    }
+
+    /// The width of the rectangle in pixels.
+    #[inline]
+    pub fn width(&self) -> i32 {
+        self.x2 - self.x1
+    }
+
+    /// The height of the rectangle in pixels.
+    #[inline]
+    pub fn height(&self) -> i32 {
+        self.y2 - self.y1
+    }
+}
+
 /// Common methods available on any type which implements [`AsRawPlane`].
 ///
 /// This is implemented internally by DRM, and provides many of the basic methods for working with
@@ -774,6 +817,68 @@ fn atomic_helper_check<S, D>(
         })
     }
 
+    /// Merge all frame-damage clips on this (new) plane state -- relative to `old` -- into a
+    /// single bounding rectangle, intersected with the plane's visible source area.
+    ///
+    /// Returns [`None`] when the plane is not visible or there is nothing to update. If the client
+    /// supplied no explicit damage clips, the full plane rectangle is returned, so a driver can
+    /// always treat [`Some`] as "repaint this rectangle" and fall back to a full-frame update.
+    /// Coordinates are integer pixels in the plane's source space.
+    ///
+    /// [`drm_atomic_helper_damage_merged`]: srctree/include/drm/drm_damage_helper.h
+    fn damage_merged(&self, old: &impl AsRawPlaneState) -> Option<Rect> {
+        let mut rect = bindings::drm_rect {
+            x1: 0,
+            y1: 0,
+            x2: 0,
+            y2: 0,
+        };
+
+        // SAFETY:
+        // - `old` and `self` are valid initialized `drm_plane_state`s via their type invariants.
+        // - `drm_atomic_helper_damage_merged` only reads the two states (to gather the damage
+        //   clips and the source rectangle) and writes the merged result into `rect`; it does not
+        //   mutate the plane state, so deriving a `*mut` from our shared reference is sound.
+        let visible = unsafe {
+            bindings::drm_atomic_helper_damage_merged(
+                core::ptr::from_ref(old.as_raw()),
+                core::ptr::from_ref(self.as_raw()).cast_mut(),
+                &mut rect,
+            )
+        };
+
+        visible.then(|| Rect::from_raw(&rect))
+    }
+
+    /// Invoke `f` once per frame-damage clip on this (new) plane state relative to `old`, each
+    /// intersected with the plane's visible source area -- i.e. the individual rectangles that
+    /// [`Self::damage_merged`] collapses into one. If the client supplied no explicit damage clips,
+    /// `f` is called once with the full plane rectangle. Coordinates are integer pixels in the
+    /// plane's source space.
+    ///
+    /// This lets a driver forward each changed region separately (e.g. to a remote display) instead
+    /// of the bounding box of them all.
+    ///
+    /// [`drm_atomic_helper_damage_iter`]: srctree/include/drm/drm_damage_helper.h
+    fn for_each_damage_clip(&self, old: &impl AsRawPlaneState, mut f: impl FnMut(Rect)) {
+        let mut iter = bindings::drm_atomic_helper_damage_iter::default();
+        let mut clip = bindings::drm_rect::default();
+        // SAFETY:
+        // - `old` and `self` are valid initialized `drm_plane_state`s via their type invariants.
+        // - `drm_atomic_helper_damage_iter_init` only reads the two states to set up `iter`, and
+        //   `_next` only reads `iter` and writes `clip`; neither escapes a pointer.
+        unsafe {
+            bindings::drm_atomic_helper_damage_iter_init(
+                &mut iter,
+                core::ptr::from_ref(old.as_raw()),
+                core::ptr::from_ref(self.as_raw()),
+            );
+            while bindings::drm_atomic_helper_damage_iter_next(&mut iter, &mut clip) {
+                f(Rect::from_raw(&clip));
+            }
+        }
+    }
+
     /// Return the framebuffer currently set for this plane state
     #[inline]
     fn framebuffer<D>(&self) -> Option<&Framebuffer<D>>
