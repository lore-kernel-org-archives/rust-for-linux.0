Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976721A2841
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Sep 2024 23:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727739578; cv=none; b=sZrJ59KUX8Aq2DIM2vfJX34wK8YgbL8HymBKTrQQ2SH6Unt7pmKbKqdVRlMdOPNVR8HiTFEF5kOS6QMQvJWV0zM5222ccNUr8AMu+gxQhESr0Ecm+gLI6+3mlSn9hVru7WU1DRLJtgUeFxOovT+1lvGI79Lz4jbLOY7p6SUQUGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727739578; c=relaxed/simple;
	bh=e/S2FECgTIuFJBMe60KsljWBZ/900VoXYuQsDe4xbJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fMm1CogzMxk2gNdkHMZEEHicVvXm9CFUbM0NHPUco/w7JDHwoChO5LBVs8G16E3s8iU+I01RAGeAsEvQGGUgefw5Q1+/kgSEwGJ/CFTaVTEXqm9aWCjF3LTUd+WifRn040pEWXrTdcPStRZtcR0Y1eNsDZ66cYZpu40qJXj0qTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M9KuBWV4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M9KuBWV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727739575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l2ZqNS7fpaukLWUM4ISWNMCXuLZuLhXZJI56Y+VCkes=;
	b=M9KuBWV49UlP8lvIc8uNAypxtp/xnzGH1k7ou99BfDPcDrWg+/mifQoDIKWuNlbq7HWcHY
	M0cBufWsu5H5Kj7ghm70rdSuLXHwUL79TZP5wU1FZUtYeBpALNHAIxx+mMIzNBWf+f9Fxi
	uwJsjTqCGCCuXYKnrjjX+vn5G+UCmN4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-323-Nr2P90v3PYGPy62zTVK3og-1; Mon,
 30 Sep 2024 19:39:32 -0400
X-MC-Unique: Nr2P90v3PYGPy62zTVK3og-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E21B19626D4;
	Mon, 30 Sep 2024 23:39:30 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7C0EF3003DEC;
	Mon, 30 Sep 2024 23:39:26 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Asahi Lina <lina@asahilina.net>,
	Danilo Krummrich <dakr@kernel.org>,
	mcanal@igalia.com,
	airlied@redhat.com,
	zhiw@nvidia.com,
	cjia@nvidia.com,
	jhubbard@nvidia.com,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org (open list)
Subject: [WIP RFC v2 17/35] rust: drm/kms: Add RawCrtc and RawCrtcState
Date: Mon, 30 Sep 2024 19:10:00 -0400
Message-ID: <20240930233257.1189730-18-lyude@redhat.com>
In-Reply-To: <20240930233257.1189730-1-lyude@redhat.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Same thing as RawConnector and RawConnectorState, just for CRTCs now.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/crtc.rs | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index 1a3c9c448afcc..246d15a15c14d 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -302,6 +302,25 @@ unsafe fn from_raw<'a>(ptr: *mut bindings::drm_crtc) -> &'a Self {
     }
 }
 
+/// Common methods available on any type which implements [`AsRawCrtc`].
+///
+/// This is implemented internally by DRM, and provides many of the basic methods for working with
+/// CRTCs.
+pub trait RawCrtc: AsRawCrtc {
+    /// Return the index of this CRTC.
+    fn index(&self) -> u32 {
+        // SAFETY: The index is initialized by the time we expose Crtc objects to users, and is
+        // invariant throughout the lifetime of the Crtc
+        unsafe { (*self.as_raw()).index }
+    }
+
+    /// Return the index of this DRM CRTC in the form of a bitmask.
+    fn mask(&self) -> u32 {
+        1 << self.index()
+    }
+}
+impl<T: AsRawCrtc> RawCrtc for T {}
+
 /// A [`struct drm_crtc`] without a known [`DriverCrtc`] implementation.
 ///
 /// This is mainly for situations where our bindings can't infer the [`DriverCrtc`] implementation
@@ -447,8 +466,10 @@ pub trait AsRawCrtcState {
 
 pub(super) use private::AsRawCrtcState as AsRawCrtcStatePrivate;
 
-/// A trait for providing common methods which can be used on any type that can be used as an atomic
-/// CRTC state.
+/// Common methods available on any type which implements [`AsRawCrtcState`].
+///
+/// This is implemented internally by DRM, and provides many of the basic methods for working with
+/// the atomic state of [`Crtc`]s.
 pub trait RawCrtcState: AsRawCrtcState {
     /// Return the CRTC that owns this state.
     fn crtc(&self) -> &Self::Crtc {
-- 
2.46.1

