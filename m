Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C7D4746A8
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762228; cv=none; b=uhQbu1IYY2ORS6HEiZk3Xns1QWvOZvO42fqWWui3jvluh7dfEEeWQV9kfm3wIxTQ4dIgG4z/0CDu3+liCpTwym8WoG84IHTXM3vMqQKaR7/xk7NZkIuQcBnQK9ARVEkJ7ZHlpWEwKWGEsEd9K9Z5AdEalcu+O3ffNXGgElJdAlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762228; c=relaxed/simple;
	bh=VP9UySbgVogmmdAeRnNdziP69tEiVatE/qDzuB9S4dU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pQ3gwKCGP5zlZ/l6fbSc56Ub7HEnSwpb+I5K5kmi2W28h+qKCp2D8sWkAT8HkDHBC1y4vyNCLIkeSxuagusoiBbtq4CZixs2imoEJOAQl3IU9XUs2KURMRcUxStL1zt9h4hWVUo2YnHutLp6denWdbQjnB4vjNj0uGMZxgvaO1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=HQbem1sh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="HQbem1sh"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499cb997b8fso7004065e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762212; x=1788367012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DCczfjf9T7Ydp41TvxvDhWF+Y5rWcZbW/UfbMTxim7Q=;
        b=HQbem1shn5dLWjVeiglO1KdEWoABbctDg9DWHNinfJwWs1WNCDxerSTof5qMyPcwr2
         YoEb5Crsf5+bb6hBzi8AA5GxT+q7b1gYjME1TW47fxBYMXeR7R5mpboEFZNl1orLZanX
         KyzVWJMO663KfVDQqGr3osrrTxle6Ubk+0vfq1AMfvFRHYp0wmxWRrGKQLHM4vERfBOG
         3d8xDnct//aOPDgYQc3scrJzoRdbF9bOu+6PyYozs+kIT4ZpKavH12UM9PuKbhxy5SLh
         cI60sxliQn5CU8vKzOxJRFePtKR/lOAhUMV5En/Vq8FH2uV0671T70IrTqmM87c2CVbP
         oAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762212; x=1788367012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DCczfjf9T7Ydp41TvxvDhWF+Y5rWcZbW/UfbMTxim7Q=;
        b=YW456zy9fuR0u2XmPisM8mIIgXkPqW4kSxrN+FxqF2Ixm/JMMxgFfR3vWHyUwX3sxB
         xnikzDyrwGfTiP8f2wYcKwLF5bIe95pSSzoNZOBF+SZqrtmvZTZSZ46bEaMMHlUz3sLo
         1DlBXi5xirvPvBS/m15wPodS8F6/mO33Rhcq0ziIOvDttwpvuXBI5bzrfAFaHMLqaXJT
         6MEU2kv12oi95LcHsbqLhhiIu0/dAsJv1VSNWO8qFWRVILgir8Pxri0qIVBk6TMUbW79
         QcKpUUKWO3QLZAfSz2J0bvrEREjLTEZuLUyBYXUubg7RCFKnCthpquo06qukqQqyOL3U
         YPTA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3hyHBVirnklvPNrZmp0xhnR752IOTjnDuiIc2Oa1wzvq+F8vgQX8Pg2px0PuZG7YCcJek9S5SiimFEgCMtw==@vger.kernel.org
X-Gm-Message-State: AFuF++kJstfRVRwDgZsMhOIIhuRL77LDjrNuO+WFw0YcaUUYsdxl9I90
	l4ovBawMAiaq5DF72nS0p3CCXqa8F+xpIgGGTghxXFp46kLqaFOz5O6khv51vUhorg==
X-Gm-Gg: AR+sD11kxUBXfYdPv5+2L7VR44FiLNXB0B86JdbyCjq7neIwjClQ3EpnfyXcV704nZl
	tnH8xvq/6+1jqM4dw0WN55VqALAK2QlJNMVX9nBtRtHX/zuEKNW/CmJcVDsfcoTuPUmOixAXmbC
	omBhKBbvQegybkwegL+Or+cH9EZJXx5C+4NHrEYN+t+lUXiKViZsVniMf2s99z7l2b8QfC9EWJQ
	2I8YgTD4Z3Iy56EltwcsLiZuWlr5sqX0lxpoxAkXThz9VYIdnc6HfP6PoELd1De4zojZKjBLWgl
	bD3Bz/CQ0uZ4HQemYOGgWFjxTkrJZlWoQZrL1NSnJwYXaOkX0OKIQD/S9ym0hBLQRuOjb4pPN8l
	BhrWYnc9iFfuM1mPIDnrfiYtFxQ3mCtdFM54yvB7/uOB4ZVifyWzVf4rQKReWirUewKUPscmB72
	MxR1Z1vxl3nt0Bgc0dYDc1InfwMaKQrr0mgLvZ0e3Wy21I8yTRYMGPOuJpI0++sh/hCQEimPJZx
	XTHtP+FRxDF62387hTchTkl8QMmXoQ9T5mc1A==
X-Received: by 2002:a05:600c:4692:b0:499:da8b:1476 with SMTP id 5b1f17b1804b1-499dc8306f2mr73366935e9.14.1787762211579;
        Wed, 26 Aug 2026 09:36:51 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:36:46 -0700 (PDT)
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
Subject: [PATCH v3 21/23] rust: drm: kms: read a connector's colorimetry and HDR metadata
Date: Wed, 26 Aug 2026 17:31:52 +0100
Message-ID: <20260826163359.4998-22-mike@fireburn.co.uk>
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

A driver that carries a transfer function to its sink needs the connector
state's colorimetry and HDR_OUTPUT_METADATA, and needs to reach the
connector state routed to a CRTC from the CRTC's own atomic callback.

Add ConnectorState::hdr_output_eotf() and
AtomicState::new_connector_state_for_crtc().

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/kms/atomic.rs    | 104 +++++++++++++++++++++++++++++++
 rust/kernel/drm/kms/connector.rs |  77 +++++++++++++++++++++++
 rust/kernel/drm/kms/crtc.rs      |  13 ++++
 3 files changed, 194 insertions(+)

diff --git a/rust/kernel/drm/kms/atomic.rs b/rust/kernel/drm/kms/atomic.rs
index 18dc136940f3..f9f91edc89c3 100644
--- a/rust/kernel/drm/kms/atomic.rs
+++ b/rust/kernel/drm/kms/atomic.rs
@@ -96,6 +96,88 @@ pub fn get_old_connector_state<C>(&self, connector: &C) -> Option<&C::State>
                 .map(|p| C::State::from_raw(p))
         }
     }
+
+    /// Return the new state of the first connector routed to `crtc` in this [`AtomicState`], if
+    /// any.
+    ///
+    /// This is the Rust spelling of walking `for_each_new_connector_in_state()` looking for
+    /// `conn_state->crtc == crtc`, which is how a CRTC callback reaches the connector properties
+    /// that describe the signal it is about to drive -- colorimetry, HDR metadata, `max bpc`.
+    /// Those live on the connector state, but the driver decisions they feed are frequently made
+    /// where only the CRTC is in hand.
+    ///
+    /// The state is returned opaquely because the caller is looking across mode objects and has
+    /// no way to name the connector's driver-private state type. A CRTC that clones to several
+    /// connectors gets the first; a driver that cares about the difference should walk the
+    /// connectors itself.
+    pub fn new_connector_state_for_crtc<C>(&self, crtc: &C) -> Option<&OpaqueConnectorState<T>>
+    where
+        C: ModesettableCrtc + ModeObject<Driver = T>,
+    {
+        let crtc_raw = crtc.as_raw();
+        // SAFETY: `state` is initialized via our type invariants, and `connectors` /
+        // `num_connector` are invariant for as long as we hold a reference to it.
+        let (connectors, num) = unsafe {
+            let raw = self.as_raw();
+            ((*raw).connectors, (*raw).num_connector)
+        };
+        if connectors.is_null() || num <= 0 {
+            return None;
+        }
+        for i in 0..num as usize {
+            // SAFETY: `connectors` points to `num_connector` initialized entries.
+            let new_state = unsafe { (*connectors.add(i)).new_state };
+            if new_state.is_null() {
+                continue;
+            }
+            // SAFETY: a non-null `new_state` is a valid `drm_connector_state` for the lifetime of
+            // the atomic state.
+            if unsafe { (*new_state).crtc } != crtc_raw {
+                continue;
+            }
+            // SAFETY: as above, and the returned reference borrows from `self`, so it cannot
+            // outlive the atomic state that owns the connector state.
+            return Some(unsafe { OpaqueConnectorState::<T>::from_raw(new_state) });
+        }
+        None
+    }
+
+    /// Return the old state of the first connector routed to `crtc` in this [`AtomicState`], if
+    /// any.
+    ///
+    /// The counterpart to [`Self::new_connector_state_for_crtc`], for a driver comparing the two
+    /// to decide whether a connector property it consumes has changed.
+    pub fn old_connector_state_for_crtc<C>(&self, crtc: &C) -> Option<&OpaqueConnectorState<T>>
+    where
+        C: ModesettableCrtc + ModeObject<Driver = T>,
+    {
+        let crtc_raw = crtc.as_raw();
+        // SAFETY: `state` is initialized via our type invariants, and `connectors` /
+        // `num_connector` are invariant for as long as we hold a reference to it.
+        let (connectors, num) = unsafe {
+            let raw = self.as_raw();
+            ((*raw).connectors, (*raw).num_connector)
+        };
+        if connectors.is_null() || num <= 0 {
+            return None;
+        }
+        for i in 0..num as usize {
+            // SAFETY: `connectors` points to `num_connector` initialized entries.
+            let old_state = unsafe { (*connectors.add(i)).old_state };
+            if old_state.is_null() {
+                continue;
+            }
+            // SAFETY: a non-null `old_state` is a valid `drm_connector_state` for the lifetime of
+            // the atomic state.
+            if unsafe { (*old_state).crtc } != crtc_raw {
+                continue;
+            }
+            // SAFETY: as above, and the returned reference borrows from `self`, so it cannot
+            // outlive the atomic state that owns the connector state.
+            return Some(unsafe { OpaqueConnectorState::<T>::from_raw(old_state) });
+        }
+        None
+    }
 }
 
 // SAFETY: DRM atomic state objects are always reference counted and the get/put functions satisfy
@@ -188,6 +270,28 @@ pub fn get_old_connector_state<C>(&self, connector: &C) -> Option<&C::State>
         self.state.get_old_connector_state(connector)
     }
 
+    /// Return the new state of the first connector routed to `crtc`, if any.
+    ///
+    /// See [`AtomicState::new_connector_state_for_crtc`]. This borrows the connector state rather
+    /// than taking a mutator out for it, so it does not participate in the mutator bookkeeping and
+    /// cannot conflict with [`Self::get_new_connector_state`].
+    pub fn new_connector_state_for_crtc<C>(&self, crtc: &C) -> Option<&OpaqueConnectorState<T>>
+    where
+        C: ModesettableCrtc + ModeObject<Driver = T>,
+    {
+        self.state.new_connector_state_for_crtc(crtc)
+    }
+
+    /// Return the old state of the first connector routed to `crtc`, if any.
+    ///
+    /// See [`AtomicState::old_connector_state_for_crtc`].
+    pub fn old_connector_state_for_crtc<C>(&self, crtc: &C) -> Option<&OpaqueConnectorState<T>>
+    where
+        C: ModesettableCrtc + ModeObject<Driver = T>,
+    {
+        self.state.old_connector_state_for_crtc(crtc)
+    }
+
     /// Retrieve the last committed atomic state for `plane` if `plane` has already been added to
     /// the atomic state being composed.
     ///
diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
index 952c8e02777b..231857cc1f20 100644
--- a/rust/kernel/drm/kms/connector.rs
+++ b/rust/kernel/drm/kms/connector.rs
@@ -922,7 +922,84 @@ fn connector(&self) -> &Self::Connector {
         // `self.state.connector` points to a valid instance of a `Connector<T>`
         unsafe { Self::Connector::from_raw((*self.as_raw()).connector) }
     }
+
+    /// The colorimetry userspace has requested through the `Colorspace` property, as a
+    /// [`enum drm_colorspace`] value.
+    ///
+    /// Meaningful only on a connector that
+    /// [`UnregisteredConnector::attach_colorspace_property`] was called for; everything else
+    /// leaves it at `DRM_MODE_COLORIMETRY_DEFAULT`.
+    ///
+    /// [`enum drm_colorspace`]: srctree/include/drm/drm_connector.h
+    fn colorspace(&self) -> u32 {
+        self.as_raw().colorspace
+    }
+
+    /// The electro-optical transfer function from the `HDR_OUTPUT_METADATA` blob, or [`None`] if
+    /// userspace has not set one.
+    ///
+    /// This is deliberately just the curve: the rest of the infoframe is mastering-display
+    /// metadata for the sink, and a driver that only needs to know *which curve the pixels are
+    /// encoded in* should not have to reason about the union's other members or their versioning.
+    ///
+    /// [`struct hdr_output_metadata`]: srctree/include/uapi/drm/drm_mode.h
+    fn hdr_output_eotf(&self) -> Option<Eotf> {
+        let blob = self.as_raw().hdr_output_metadata;
+        if blob.is_null() {
+            return None;
+        }
+        // SAFETY: a non-null `hdr_output_metadata` blob is valid for the state's lifetime.
+        let (data, length) = unsafe { ((*blob).data, (*blob).length) };
+        // DRM validates the blob length when the property is set, but this is the boundary where
+        // a short blob would become an out-of-bounds read.
+        if data.is_null() || length < core::mem::size_of::<bindings::hdr_output_metadata>() {
+            return None;
+        }
+        // SAFETY: the blob is at least a whole `hdr_output_metadata` and lives as long as the
+        // state. `eotf` is the first byte of the only union member DRM defines.
+        let eotf = unsafe {
+            (*data.cast::<bindings::hdr_output_metadata>())
+                .__bindgen_anon_1
+                .hdmi_metadata_type1
+                .eotf
+        };
+        Some(Eotf::from_raw(eotf))
+    }
+}
+/// An electro-optical transfer function named by a `HDR_OUTPUT_METADATA` blob.
+///
+/// Mirrors the `HDMI_EOTF_*` values in [`enum hdmi_eotf`]. A driver matches on this rather than
+/// comparing against the raw constants, so the one place that has to agree with the C enum is
+/// [`Eotf::from_raw`].
+///
+/// [`enum hdmi_eotf`]: srctree/include/linux/hdmi.h
+#[derive(Copy, Clone, Debug, PartialEq, Eq)]
+pub enum Eotf {
+    /// Ordinary SDR gamma.
+    TraditionalGammaSdr,
+    /// The traditional HDR gamma curve.
+    TraditionalGammaHdr,
+    /// SMPTE ST 2084, i.e. PQ. What a compositor sets to drive an output in HDR10.
+    SmpteSt2084,
+    /// BT.2100 hybrid log-gamma.
+    Bt2100Hlg,
+    /// A value this kernel does not name, carried through rather than discarded.
+    Other(u8),
 }
+
+impl Eotf {
+    /// Classify the raw `eotf` byte from an infoframe.
+    fn from_raw(eotf: u8) -> Self {
+        match u32::from(eotf) {
+            bindings::hdmi_eotf_HDMI_EOTF_TRADITIONAL_GAMMA_SDR => Self::TraditionalGammaSdr,
+            bindings::hdmi_eotf_HDMI_EOTF_TRADITIONAL_GAMMA_HDR => Self::TraditionalGammaHdr,
+            bindings::hdmi_eotf_HDMI_EOTF_SMPTE_ST2084 => Self::SmpteSt2084,
+            bindings::hdmi_eotf_HDMI_EOTF_BT_2100_HLG => Self::Bt2100Hlg,
+            _ => Self::Other(eotf),
+        }
+    }
+}
+
 impl<T: AsRawConnectorState> RawConnectorState for T {}
 
 /// The main interface for a [`struct drm_connector_state`].
diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index 9e888c4e2f68..ec01ae0430f7 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -1047,6 +1047,19 @@ pub(super) fn new<D: KmsDriver>(
     }
 }
 
+impl<'a, T: FromRawCrtcState> CrtcStateMutator<'a, T> {
+    /// Require a full mode set for this CRTC.
+    ///
+    /// Called from [`DriverCrtc::atomic_check`] when something the core does not track has changed
+    /// in a way the hardware can only adopt by being reprogrammed, such as a connector property
+    /// that forms part of the signal description the driver sends to its device.
+    pub fn set_mode_changed(&mut self, changed: bool) {
+        // SAFETY: `as_raw()` is a valid `drm_crtc_state`, and holding this mutator is proof that
+        // no other reference to it exists.
+        unsafe { (*self.as_raw()).set_mode_changed(changed) };
+    }
+}
+
 impl<'a, T: DriverCrtcState> CrtcStateMutator<'a, CrtcState<T>> {
     super::impl_from_opaque_mode_obj! {
         fn <D, C>(CrtcStateMutator<'a, OpaqueCrtcState<D>>) -> Self
