Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6919447125F
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762194; cv=none; b=ZIo7je0L0eqYFueh2fEJoR7QF3AYacxIx7yuJk7eu1YJ+zCw4f6dxmbSyvQkPyck1ODXagWZQkh1zscMYSJulqWj5P7RkGikWsu+7aetEgQYBvT8Mqejwx8f5ESc70eLcOHBf/mTzdCMWiiHukHQ5ySfHwVv8RDzHQ9vPC0VH14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762194; c=relaxed/simple;
	bh=Y7VjXlDQgp/aKeZnfRWcQRiSV5T5cNHT60JqrhFIbK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1zWcllLe3pZOcQi2ghEy/8bDIt185e2oFqzg+mv3KZp0/Y9nfZFK3bkkmUwuo/bUWGIJ0V4Pra7XBiedwluLhsE7zpIfVoUe4rfNry5RcNROhcSJ/OWCGkSIrGQAyH0q0kEPWLUZZ7ne3pRJ0VCaA20QzWUyMeOL1MSWBZ9lx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=z5hMej3Y; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="z5hMej3Y"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49557167508so9264405e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762174; x=1788366974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lg0T4eac/Y9rCRkDaKLkO7bKQ8WziroJWF3w/38eu1A=;
        b=z5hMej3YNIG1eTuTCIN0Nf1XT1p5IqA0IOSE+MGJJdN9q7HpIbUymC1yGw+r+AzCM2
         Uq9HbGV1zt88HfAnlORzptCTkQSCzGm0/MOjDKbSKfZksgGGRMgnlu1NAI7emitzGQTC
         C6Hshcdsj2tkWgVRXSi/1IR4iIOL/RNAaEJv6/aH05tlFOB+cdHaCSVQEzYS+WxNH0cf
         u/IgXwuy90EjBHZvtuvLmeCgsXq4XkbalA+46aKtMufVbCrrR6BAQrxJtYJPH3Wt6uzs
         gHRoSxPsj/4spWZvMK9iNX5s5TrZX4RToEUVqs8Sy3uXOFrRbvX2nLEvgtEZxTqqYXhB
         I0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762174; x=1788366974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lg0T4eac/Y9rCRkDaKLkO7bKQ8WziroJWF3w/38eu1A=;
        b=KUX5bonDi0jAp7bs1JPCPFf1xvOW2p36pHtdaL+LomsTpIpgDqq3omN4tGIdZkUUz9
         T3Ly8kT0rGNTKQAZeL0lAOLZfx0phOtF3BVcTpg/nn7aLJ/oJqx0Dt5pbF0ZXhj4RAj1
         +lVL3oQeEhTVPwPksY6uPkF8MQXo/Nj9Ykj7R+KEhIM+zU0S43FISwd44+kOJrrc3MMW
         82ApXwpx0TrkRHLZjw34P0jXsQ66RpmuXhUwi0g7fbrkgU3BFeg3M3jNIYf8+a1Wtaye
         jny4L2cKu5ExtiU8WnuuHGsDcHkhWOgaKYTG0VOuaQyJf6QNyugcFRHRIR0AS0ALMsL1
         H6sA==
X-Forwarded-Encrypted: i=1; AHgh+RqwJ4aVSQ3Dllm9HSgg8VqQFGEoHXb9BQJWbiFP4nHtQ4k7LUQumuH+JsbH7JPUEYFwn97nXtEpS7Z2hrN1vw==@vger.kernel.org
X-Gm-Message-State: AFuF++kCcu00u+nSxNyrjZ4eijY5HGeatSrsPhK9sQL5qQ9eF2IUDB57
	6Q3ZNCykvZF1TjMM8AWl+h2x1WiWw/ecU1zhHjO6SlMEDNA0764NsCca/sZDy6earQ==
X-Gm-Gg: AR+sD11Fn3XTPTHaIFaY6A3ytbceUFVyNrFzpKgYuwB13K5prWQwsKE7lKI+AefAGyQ
	TasgQSCxvyqMA/x71hb9qYa3XGwvek6YLPoAv5X8Au2eAKEaWYxng834py9I7z+MZrfzY8SRUqG
	jZnqdFd76tT1/nzHARlfv/meOZ6gG/fwo1hAcMoqNaSZ+I1QpgLTLZo84Tl15WIHzHxKjec/GpT
	PwujEQ7sEiemuCEMmfb/AgdX6hrIG+ZW1RyI/RMD2aAYxCDVW/F6dA1mzIH6dLDvPW4s6q6mkIA
	qfDwyx+vccT/Vo9i0KBlUWdDJ3HYqVp9JRwzMaQYTSZ0Dpf1HfinaXfBks5YLo/aMkUdwYQ+DZE
	rY0nl+pVjFWZ/qHrsqSaB1JBVA28tVo7J1Gajd+ykzTv4zmw3nOyK7Ru1LIP2sOt9YP+7/Ta6SK
	eA9cOw4PF5wqsZSZKmCBSooATkMKGU6rgLhZ23DE8aG2Mw9fvsnm+rOX+HPrP/3lN5L34Qq6/cP
	TqCLwPSxvE5I5RqRrx4ii7uNFhc0VvWESNb
X-Received: by 2002:a05:600c:3105:b0:49a:5b88:f54f with SMTP id 5b1f17b1804b1-49a5b890381mr45490455e9.15.1787762174080;
        Wed, 26 Aug 2026 09:36:14 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:36:12 -0700 (PDT)
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
Subject: [PATCH v3 16/23] rust: drm: kms: add the plane blend-mode property
Date: Wed, 26 Aug 2026 17:31:47 +0100
Message-ID: <20260826163359.4998-17-mike@fireburn.co.uk>
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

Expose drm_plane_create_blend_mode_property() so Rust KMS drivers
advertising alpha formats can declare how userspace should interpret
the alpha channel.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/kms/plane.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index 62de8a1dad19..f148aed812f2 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -459,6 +459,22 @@ pub fn enable_fb_damage_clips(&self) {
         // registration is exactly what this helper is for.
         unsafe { bindings::drm_plane_enable_fb_damage_clips(self.as_raw()) }
     }
+
+    /// Attaches the `pixel blend mode` property to this plane.
+    ///
+    /// `supported_modes` is a bitmask of `BIT(DRM_MODE_BLEND_*)`; `DRM_MODE_BLEND_PREMULTI` must
+    /// always be included. Any plane that advertises a pixel format with an alpha channel is
+    /// required to have this property -- `drm_mode_config_validate()` `WARN`s at registration
+    /// otherwise, because userspace has no way to know how the alpha will be interpreted.
+    ///
+    /// Call this during [`KmsDriver::create_objects`](crate::drm::kms::KmsDriver::create_objects),
+    /// before the device is registered.
+    pub fn create_blend_mode_property(&self, supported_modes: BlendModes) -> Result {
+        // SAFETY: `as_raw()` is a valid, not-yet-registered plane.
+        to_result(unsafe {
+            bindings::drm_plane_create_blend_mode_property(self.as_raw(), supported_modes.bits())
+        })
+    }
 }
 
 /// A trait implemented by any type that acts as a [`struct drm_plane`] interface.
