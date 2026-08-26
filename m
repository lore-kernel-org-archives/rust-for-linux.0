Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B76246D2A6
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762205; cv=none; b=IMeoP6unWaU9/8FrUqarIVN4n7IsNqBe7vDf1a++pS+aNLibYf7m1b1yznz7B323atl7C9Y2W4pL43E+7snkCawFjpg7vu4Lto4d7i+rFQxaZkpRWos2DlKqWU/mSHsf/4sZoGQbcDPLbXHXyzlg1GwJo06d0DknVV3Kbe0tRms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762205; c=relaxed/simple;
	bh=rEf4n1Kh8Xb93atEZT5b4Fz96nymlHxC3FqWWW6hHpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4SHWQj3htE0AhFz3UgDFxF9zIr32SH7sD9vCKqVbudYp/oUNSuOGBkkotkjXefHBrezL57lEEBdeD0BnZwRZwFLUo1ghP3hzkNDxLglTSLjF5/OH2OTNLcKx/WvE2T4P/46pAU0xF2aLM/gFcZRgqadXLq0LucWqoHOa7CrYYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=OOxixpan; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="OOxixpan"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-495437bb891so326695e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762195; x=1788366995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/LkgDOv9ZSq7jkZTw2AZHwZhduIehY/kgCXnvUKoCU=;
        b=OOxixpaneONNUjAnyKIdnL6OR07fSoy2lXrXvYUkfrCbVYoan4cWGTE20ZaclTNY9W
         ANCnVo/csUJBelEBScG087qAfuqNUlI+W3sQRYZdG13aVx7DKI1tMINhW4gYJT289oWK
         zGKDnVvfPbb1TrvL6Dsego2WowNJG/+mgnoFVxm8PR2jaV1F+x1uObjB2l5TlA9vPuNk
         eBxo8ng6odNXDyJsVFQy82uKUlKA3qjY58VAS/HDwlSUe9FFGKZ9SULeLIdVp7aTtWNX
         woxGPGizB/JSo6DMJ+d/LqKVIKhHtwtu0HL9xts+oEkCVnFHsoNxeMX1ovb5xva6f0YK
         QSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762195; x=1788366995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/LkgDOv9ZSq7jkZTw2AZHwZhduIehY/kgCXnvUKoCU=;
        b=VFS5LMXkK2vjNDaXxszqeXh9c7kGk6KzjmFVAv1ra7N8tMk9VJ6Y1qQzaSQ4GxvQRv
         h0lto5b0RNpA6gJdwPXLzBh58htzW9D1SZMrKwxRQWuRs+7B20WxTOdgDzkJhopWYh5N
         5ABuQulSTpzrhY2NkitKafR5aI4HmBd7r9mAlx3p566DjZ/93gvp0hwQ8AKbubeAp4Oc
         LAZNl4Iz1tEUzRsfy0O4b/K5D7M07kMky2QBBsFSLw7G5kHbMsHfWcrox/l6OM38qlUl
         QFzzhwt45YYhhLyHkHwtU1QR1tBpLNHA5gTUDA8+bVjKnEiQ9vI4cw8rhhx6IspEViXW
         l9Bg==
X-Forwarded-Encrypted: i=1; AHgh+RrDA9C4so+E6Xry+Sd0xeX7rI6vostUiLGnwaQqxTy5XDyAZZ7s/pvKLCIgWebjy/Yj+Iw1EBlIir98YMIktw==@vger.kernel.org
X-Gm-Message-State: AFuF++nIb6CppRhHmMAFfHCfIRzq85Z0dFuvD3pJNKTu89QIIOajc6+x
	3Pw4NlxBuJMyxXD0vSnPLdXoyOPmbqgVBQqeKF0Drcp5l+WNnm467R5EQz7e1oJwFg==
X-Gm-Gg: AR+sD13K2ZMktQoMS/uUYEneAiDq2Qg4T7VCR5F5IUF+KNOhr8wVUGtfjdNIlZLY4da
	T8zeEO3NxL76rwjpZZ133eCkhLN935PYlcD/8fb3TuHBwo46oQPMXTn12lPdKTcxynbF4rCWTU9
	ubmzz7gJfKuBWt8+/w+KB4IyeNvNbxIS2g9Y+3dZ8uYpgN/oKPmj+lO9vVI/qgOA0WZsgIz8QeH
	g+MiEvOXzJmmafHktlJdvqFE++rFJcDcp9VuuFyYwn8WqSA+8ZbOqSBSYYMQSX2sbG7rcRie9jG
	ucKOpLiPTzhVtOH3rrHFCJxx6qdyk27PB/CRR+k98XQ/DLimQmxlSC+WKEBq1grwi+Do546Zx+q
	XceI1GMrpQRCmQ7c6A2tcpqQ2b//Q3ztb2I12N+gAJflbdRTvYJ4RQjx7Z6pai+hLKnGeZkRnRx
	mN5nJcibikBEsDwH+DPYdOH8f4upozb+38rKky3wD/SYe4fIrehu82QA5kuEz7VYRmPuQnYESvd
	LSR4JUu2KXV5D0P3bWpQ8uzG1bmqIYKv8gA
X-Received: by 2002:a05:600c:6792:b0:49a:5b84:a1a6 with SMTP id 5b1f17b1804b1-49b0dec57b6mr5628835e9.5.1787762195531;
        Wed, 26 Aug 2026 09:36:35 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:36:34 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
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
Subject: [PATCH v3 20/23] rust: drm: kms: add synthesized CVT connector modes
Date: Wed, 26 Aug 2026 17:31:51 +0100
Message-ID: <20260826163359.4998-21-mike@fireburn.co.uk>
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

Expose a lock-scoped helper for adding a driver-synthesized CVT timing
to a connector probe result. This lets virtual and transport-backed
displays offer valid continuous-frequency modes without reaching into
DRM mode lists.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/kms/connector.rs | 84 ++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
index dd126469788f..952c8e02777b 100644
--- a/rust/kernel/drm/kms/connector.rs
+++ b/rust/kernel/drm/kms/connector.rs
@@ -495,6 +495,60 @@ pub fn attach_encoder<E>(&self, encoder: &UnregisteredEncoder<E>) -> Result
             bindings::drm_connector_attach_encoder(self.as_raw(), encoder.as_raw())
         })
     }
+
+    /// Attach the HDR output metadata property to this [`Connector`].
+    ///
+    /// This property carries a blob supplied by userspace. Drivers must still validate and apply
+    /// the metadata in their atomic commit path before claiming that HDR output is supported.
+    pub fn attach_hdr_output_metadata_property(&self) {
+        // SAFETY: `self` is an initialized connector owned by this DRM device. The helper only
+        // attaches the mode-config-owned standard property to its mode object.
+        unsafe {
+            bindings::drm_connector_attach_hdr_output_metadata_property(self.as_raw());
+        }
+    }
+
+    /// Create and attach the standard DP colorspace property to this [`Connector`].
+    ///
+    /// A zero mask asks DRM to expose every colorspace defined for DisplayPort. A driver must
+    /// still reject values its sink or transport cannot actually carry in its atomic check.
+    pub fn attach_colorspace_property(&self) -> Result {
+        to_result(unsafe { bindings::drm_mode_create_dp_colorspace_property(self.as_raw(), 0) })?;
+        // SAFETY: the successful create call above initialized `colorspace_property` for this
+        // connector; the C helper only attaches that property to this connector's mode object.
+        to_result(unsafe { bindings::drm_connector_attach_colorspace_property(self.as_raw()) })
+    }
+
+    /// Attach the standard `max bpc` range property to this [`Connector`].
+    ///
+    /// `min_bpc` and `max_bpc` are validated before conversion so callers cannot wrap an invalid
+    /// range through the C `int` API. DRM requires the connector to have an atomic state before
+    /// this helper is called; newly-created Rust connectors acquire that state here.
+    pub fn attach_max_bpc_property(&self, min_bpc: u32, max_bpc: u32) -> Result {
+        if min_bpc == 0 || min_bpc > max_bpc || max_bpc > i32::MAX as u32 {
+            return Err(EINVAL);
+        }
+
+        // `drm_connector_attach_max_bpc_property()` writes the initial bpc values into the
+        // connector state. `KmsDriver::create_objects()` runs before the mode-config-wide reset,
+        // so initialize our state through the driver's Rust reset callback when necessary.
+        let state = unsafe { (*self.as_raw()).state };
+        if state.is_null() {
+            // SAFETY: `self` is a newly initialized `Connector<T>` and this unregistered typestate
+            // prevents concurrent access. The callback creates the matching `ConnectorState<T>`.
+            unsafe { connector_reset_callback::<T::State>(self.as_raw()) };
+        }
+
+        // SAFETY: `self` is initialized and now owns a connector state. The validated bounds fit
+        // the C API's signed integer parameters, and the helper only installs a DRM core property.
+        to_result(unsafe {
+            bindings::drm_connector_attach_max_bpc_property(
+                self.as_raw(),
+                min_bpc as i32,
+                max_bpc as i32,
+            )
+        })
+    }
 }
 
 /// Common methods available on any type which implements [`AsRawConnector`].
@@ -723,6 +777,36 @@ pub fn set_preferred_mode(&self, (h_pref, w_pref): (u32, u32)) {
         unsafe { bindings::drm_set_preferred_mode(self.as_raw(), h_pref, w_pref) }
     }
 
+    /// Add a driver-synthesised CVT mode to this connector's probed mode list.
+    ///
+    /// For a display whose EDID declares continuous frequencies, a driver may legitimately offer a
+    /// timing the EDID does not itself enumerate. `reduced` selects CVT reduced blanking (CVT-RB),
+    /// which matters when the *pixel clock* rather than the pixel rate is the constrained
+    /// resource -- RB cuts the clock for the same active pixels.
+    ///
+    /// Returns `EINVAL` if the core could not build the timing.
+    pub fn add_cvt_mode(
+        &self,
+        hdisplay: i32,
+        vdisplay: i32,
+        vrefresh: i32,
+        reduced: bool,
+    ) -> Result {
+        let dev = self.drm_dev().as_raw();
+        // SAFETY: `dev` is this connector's live `drm_device`; `drm_cvt_mode` only computes a
+        // timing and allocates it, and we hold the mode-config lock via our type invariants.
+        let mode = unsafe {
+            bindings::drm_cvt_mode(dev, hdisplay, vdisplay, vrefresh, reduced, false, false)
+        };
+        if mode.is_null() {
+            return Err(EINVAL);
+        }
+        // SAFETY: `mode` was just allocated by `drm_cvt_mode` and ownership passes to the
+        // connector here; we hold the locks required to modify its mode list.
+        unsafe { bindings::drm_mode_probed_add(self.as_raw(), mode) };
+        Ok(())
+    }
+
     /// Parse an EDID, update the connector information, and add its advertised modes.
     ///
     /// Returns the number of modes added.
