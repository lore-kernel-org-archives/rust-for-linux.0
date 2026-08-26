Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C725C404BF9
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762173; cv=none; b=GjeC5Zpwk3s4YjjR4aCjirwnJU7bsf87BwF3tZAGPAh+9+/j6ayyR8+orkVDSijBEjpIvRvDx6N4Au0M8c18JE8hteOT8+1pJlEEMsif345Il2nyxjyWnX/35MkjOgZEyo+p6nRdMb/M9ikcnLo3ETepsZwHoMvKvr12Fx6aT68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762173; c=relaxed/simple;
	bh=yQ0pM9ZOnPii4Sm92oul1R9mC3eiZPYkUd6ztoSoOec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ASeYN5ULJ3p/r/lvocFVkmWK3KsVTMGqMXaX4utqi0SherG42O8eeVICdHc0ITUnGr8z98i0HlnCE1G3MQRahCc2JvUr/T1hfjdFL/o2cvpuW+qmNKSe7HVFg+a7u+ENrFsq8VPmyhro0cKobEvZ9TYmEzVS9WrGN7YJYs9Mr6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=h+xZeIqz; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="h+xZeIqz"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so10748095e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762160; x=1788366960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nvAIuzjWICzRaerW41m6ADpOsCWM5ip30oIcAiVpx0=;
        b=h+xZeIqzvbTs/nnF+GfCKiP5t9mAU7Pj99LHVua4tW0ejjsaOt7n7UuVM+Q39wsnib
         jKXhSHxpEXh83xEf6jg+6cCCSfsgi0tnUSVs1ahcjFc9sZ/SjTKppG4BrtgcPB2hq69J
         z8zj3e4uo2GJPCgaCxpkkShIjgO9onPrwx9pgsIVrlXMspWoYO8JcKNYxPaLWCraBcgl
         xtHpQoj2Jj2hohH5iiqUNdbn40mohy0BZDiibucOkd9t9llaKdnvFdkiKsH46ry/jNP8
         uIUYNw8qStW9e6LENfYDwcrcOfHX9D4+KfEVlTqXTIWxwD/n7uWyLW1iCcNO3uNA9SwG
         nkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762160; x=1788366960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0nvAIuzjWICzRaerW41m6ADpOsCWM5ip30oIcAiVpx0=;
        b=jWG6jgtd4TaAAd89POmL0Pa23fOmFfKPCXS7QPHX0PNlhl9RiA7g2U6L8fRpvKzS5+
         9F2qxE/MClqhi24wyBwhc+Ad7uR56DYG0oPHkFFouJFaVJPI1PBUBIgdNaPkLisv9HLb
         6PEsikguXqrTUUPTKeR/1+3DMZBV9f5OcAr9p4dmmNYXqP+4JOhGUZNZDyIZ8JhqDfUI
         31EIie1NezpJz/Jjm+VQwsyVn9iTzUnpWKwW5Z6V/OYOhVsKdjfKIx9qra0Xb+BJZkjO
         tC65KjwidwLQYLIq5rZ+gXLKNw/hSdDSANSFqKkSlJ1hhwOc4gc5jzA1+FA1vBaSOfrO
         jqqA==
X-Forwarded-Encrypted: i=1; AHgh+RrwH0Y9aSZgC1wivyumBIVsjx9xBsYI6mMJNWlesaWdFfTD6AhzxY102xQxFHFovoZ7WgeNONMYk2djpVyDcA==@vger.kernel.org
X-Gm-Message-State: AFuF++lS1yjrhoZUFc7QyrQSclW+ufmlW+Ppbdqz9SAf3AGKQANRD0oh
	Rz7X6t2/f+nXB/GjcyxEXcdt1zeNZFQyVehIx/3LYC7JI8iRYQp1e8BxYP9O4egDJw==
X-Gm-Gg: AR+sD11p54GFAmVci+GfnHjODH197ZgXZ0vfesm1dhg1/0hU7Bd9+ZVXkL2UsKxRGf6
	UPxWMT5cxWU9HC6EQNQvRzL9CMBGIblnHtGPSOXK9xpNCoyWuKw+4I5juAz5KSMUkLIuzD3zx3/
	xwVqelnJTcm5dMdQusmsO305ydO+w0ulCKvoc4lMvfNYzv9tcCZAZP3Emyu5mGIYePyE/n6O2Cl
	Qu2T0WklEnfHNrUHosSNVvU8C1uQXjyVsuOO8XjOwGeCe7adoMvFU1O1m/HoKJHPWcuJ1einLKQ
	dqMb2VfVeYHnEgxIat/JipvlPSHQnk7jHfasBAVXiTJCQFnyEsw0f95AxrOv55fCSksZVYO6hSV
	NL4a/YzwUpCFLIdbYRr1j/UJgsVV/rACjkCnKKFrTFbpAfSmRcU+u+NKwFrFST7bOdJI3a+0bgE
	3CAnqJjAwK4LDqIpPMuEAh+LQdgveUvTxJy7mcXcmFK+K/i0TDQR8T3vqFZ699ZLmAGt1gHFA0Q
	nHs42j8LFnIZN0=
X-Received: by 2002:a05:600c:4503:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-499dc6f6856mr83360345e9.4.1787762160620;
        Wed, 26 Aug 2026 09:36:00 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:36:00 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/23] rust: drm: kms: plane: add FB_DAMAGE_CLIPS property support
Date: Wed, 26 Aug 2026 17:31:44 +0100
Message-ID: <20260826163359.4998-14-mike@fireburn.co.uk>
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

Userspace can only hand a driver the rectangles that actually changed
between two framebuffers if the plane advertises the FB_DAMAGE_CLIPS
property. Without it a compositor supplies nothing, and unchanged
commits are indistinguishable from missing damage information --
which forces a driver either to freeze or to re-send whole frames.

That matters most for drivers uploading their scanout over a slow link.
Wrap `drm_plane_enable_fb_damage_clips()` so a plane can attach
the property before registration, alongside the existing rotation
property helper.

The consumer is the vino DisplayLink driver, which encodes and sends
only the changed strips of each frame over USB.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/kms/plane.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index bc830503b142..62de8a1dad19 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -438,6 +438,27 @@ pub fn create_rotation_property(
             )
         })
     }
+
+    /// Attaches the `FB_DAMAGE_CLIPS` property to this plane.
+    ///
+    /// Userspace can then hand the driver the list of rectangles that actually changed between two
+    /// framebuffers, instead of leaving it to infer damage from a buffer swap. Drivers that upload
+    /// their scanout over a slow link -- USB display adapters especially -- need this to send only
+    /// the changed regions.
+    ///
+    /// Without the property attached, a compositor cannot supply clips at all: unchanged commits
+    /// arrive with an empty list, which is indistinguishable from "no damage information".
+    ///
+    /// The clips are read back through
+    /// [`RawPlaneState::damage_clips`](crate::drm::kms::plane::RawPlaneState::damage_clips).
+    ///
+    /// Call this during [`KmsDriver::create_objects`](crate::drm::kms::KmsDriver::create_objects),
+    /// before the device is registered.
+    pub fn enable_fb_damage_clips(&self) {
+        // SAFETY: `as_raw()` is a valid, not-yet-registered plane; attaching a property before
+        // registration is exactly what this helper is for.
+        unsafe { bindings::drm_plane_enable_fb_damage_clips(self.as_raw()) }
+    }
 }
 
 /// A trait implemented by any type that acts as a [`struct drm_plane`] interface.
