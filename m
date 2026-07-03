Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A4B30D3FE
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047738; cv=none; b=V+u3V0DQ2gz95ZKNZQYzC/NETSa4kz143b8q+8tR9N0xUZPNOUb1WUn/cvEEtz6ohK6OdADISdF6GtPX40qHSb7YKmFAFG/wVy2J470HkUhJ9JR9F6AfMEOIak3L78RR7/MRTZyXdyp692aT7hdYd0M4etonRrV8ZNmd5HQGnwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047738; c=relaxed/simple;
	bh=GwvU+9h7Qtl04FVjBGVuSwmPigpE3mB+Cvb7wXRtfdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uUhIVC8h5cdlxCD4g67Fx50JtxWXuHyTmn2qqTX601YRaZIye0fLAAZoMsztTRCqh4p/QR6TyEpMQwkLVyhkV7nDpCqlqosk9XJ+yUy4NfNCLYfEkp7kix1CaAsy5/vyoywd9/seTUNRzyLKvifZHKOvoW/NUxbQqxdcnUTy81o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=cozcn3t9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="cozcn3t9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c733f15aso528205e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047735; x=1783652535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmuYxCXQJW79g/7IjZ0oN+EYDyNRyHCs4/1RFHrUzwg=;
        b=cozcn3t9bYk+iR2nNPKsnG7WqefYv0xWBD2Sy/aG5++WHSS1MydUSfVoOAa2Y/0WaM
         jyE7HoUupwBvg/mrSKD2TlRvL2gxlxfdtHUxS1h4h9KgBySY7y2E+Zng5fAN6clmWyEM
         cxZbMfI+O8te5rcszV3OCgGEHG/E4y9Mknif4JNisAvuNVBfxMq6mKgIKdjpwSAaxOjF
         oMvJXNiAOKrno0vM324GPiw17Ad00+I9N2le9+mqzAgQ9yiyDiaW3PNU45oqOk8a4wRA
         boXjTNzrWE0Z8FqjFenvdZltG62bMPW68RoW44jPhXUUSzEWbgwEgeQJY63Lop+sB2Q4
         k0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047735; x=1783652535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qmuYxCXQJW79g/7IjZ0oN+EYDyNRyHCs4/1RFHrUzwg=;
        b=XZ89Epyr0Yss6DO+ZsJEQrXSuZ55ocgAuVwzjxmcbK2vVpHRCojfsKakr/0OZIZooj
         OBLVIK5CHWsL+nVsjrfHpnF+z4dTtTuEG8HhiYYqbZEqzA+WFcBr0d+OTkEfJ/7dch1E
         +Zs3xkF+rDYfDJ6CHODwgxOoFoMIX3ojJXrHpe6xPB9pICn2QQ1+XLB0QjZH4ewlEys6
         XA+LtqUmiSg8XVJ0ZVq0zq/krlrOrgtLEXJrtqOkgB3dFfOZFhEdmSxaOo2I2xb+zNeJ
         kXxQwSlV1gLLHcBHtBIGT2/wufKwUnxHrlEY1UUUv13ptS+MTui0kswHV5lt5HDhyhGX
         rdNg==
X-Gm-Message-State: AOJu0YyFxMbaeMDa52M+mqbp3JY/YaJQMRFCjeXSQre72xhFyeS4Bmfc
	TZ8V7F834pCzcaXrhIXrxe99RLEttw6NXMcPanD5PbiLfzb/07nErqZiPuVZnUUoBEk4ZqNybeW
	aMB/b9RzW
X-Gm-Gg: AfdE7cmYwuxn3njeE3HvdHabfxvhX7vQEKgEW7YO5ZyDz4hXD3a9ah5kCARorRH3Fba
	HgdBA6qz3t6XMhAoS+QDDYpNUym4j5zD8E2vcYxchw+kwuVRUo+CaSJ/2mUrnooG0JBTnKaICqE
	f/5Qh3RbhMT5KV/c4EpaUjjZWOFG79QUytjC6PnYJFptqzmlQhIRoeExiK8U3PQ/DgbZ8dhE/3c
	Ad+m8VkWWq2CmFJlVXCo6fbGrlvKQMNjx0mRNv8y2ZSvgt8eUvVv/xDR10Zui1ev6anuZ2Jdvi5
	6hirVxIeaTCQ1apjIpNVafPtiJ+txueRCDI5AfEd1caV8JaxebpF5Rjt4opGEBcYKEA6gx7p86Q
	axhzVCajCzID5arqMEPxF4tbb4jSyf7RqOf5D0qOVi6XYo2J2HjIhaLoNZqXApDhN4d1U4MdwKx
	5OubVkOo/FjzMsTXD8wBKXH9Kv4EEVUza5NtUhDMjIXFmhoH9axJFm8lPU
X-Received: by 2002:a05:600c:a404:b0:493:b783:ad59 with SMTP id 5b1f17b1804b1-493c2b374c7mr103666075e9.14.1783047735339;
        Thu, 02 Jul 2026 20:02:15 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbacbsm14466500f8f.4.2026.07.02.20.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:02:14 -0700 (PDT)
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
Subject: [RFC PATCH v2 18/18] rust: drm: kms: add plane damage-clip accessors
Date: Fri,  3 Jul 2026 04:01:05 +0100
Message-ID: <20260703030123.2814-19-mike@fireburn.co.uk>
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

A driver whose "scanout" is an expensive encode-and-send (like a USB
display) wants to repaint only the region a client marked dirty rather
than the whole framebuffer every flip. Add two RawPlaneState accessors
over the client's FB_DAMAGE_CLIPS (relative to the old plane state), both
intersected with the visible source area:

  - damage_merged(), wrapping drm_atomic_helper_damage_merged(): merges the
    clips into one rectangle and returns it as a new Rect type (with
    width()/height() helpers). None means nothing to repaint; if the client
    supplied no clips, the full plane rectangle is returned, so a driver can
    always treat Some as "repaint this box".

  - for_each_damage_clip(), driving drm_atomic_helper_damage_iter: invokes a
    closure once per individual clip (the rectangles damage_merged() collapses
    into one), so a driver that forwards each changed region separately -- e.g.
    over USB -- can repaint just those rectangles instead of their bounding box.

drm_atomic_helper_damage_{merged,iter_*} live in <drm/drm_damage_helper.h>,
so add that to bindings_helper.h.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/kms/plane.rs    | 105 ++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 7d04abec1215..b8675642c1a8 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -39,6 +39,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index ead875316829..4ae11cec88a4 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -605,6 +605,49 @@ pub trait FromRawPlaneState: AsRawPlaneState {
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
@@ -691,6 +734,68 @@ fn atomic_helper_check<S, D>(
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
-- 
2.55.0

