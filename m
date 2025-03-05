Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EAB2080E8
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 23:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741216155; cv=none; b=cKW/fZdylXQIhVcRLeBEdBaZTDd4bKIV82NqcpW+zmFndReTo8o4FcCysaxabORTCVBunNXAy6xDRkJw/zAmPk4VyJxojxOQ8KlJNzBEB/UZr+K8Ytg4JsP8qT0Mcf/731IvqripcY4e1zbbKjKjvv3gT60t9cHUvoUPqU/FmoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741216155; c=relaxed/simple;
	bh=1AlMbMSXreNWTCZYtXzrd8FRwnzaFMGvrbGfeij5zYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=foszhDnJVwwnL82R5aiIR36g6lgeVCu3s2b7mgSZzifWauaPJzjkoiINtntUsF2xt+jnL3FgCgF1VX3sKtqG3WLe2PBJ0mc1egrfKRCTLjyOuEVDzXEGIwWXwsBCXJaRLiIZzsgPqmEbVPTZhBq8n5JRk/jRrv7mWYqn+yOedEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gcDnX7LZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gcDnX7LZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741216152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ky7nPuh5GrbUWyu2d6ZrknkHnXgJb5d1NGj1huVerQ=;
	b=gcDnX7LZ39OteAa69DP40oHT3S7S37n32eGZ0zMU83MlG/dg5T42hQcGPaWj7+Y5TkonM+
	IFct6agIm3THfYISYLb6G/yT54CP+1+ESC/1bQZK3cYZHAYyPYs9V62xnjnGo73+u5Nf0H
	0faREZkqNQtO54/lM+44T0tb4YiIPAo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-dvQIoEmzNHGzBncmaxMr1w-1; Wed,
 05 Mar 2025 18:08:54 -0500
X-MC-Unique: dvQIoEmzNHGzBncmaxMr1w-1
X-Mimecast-MFC-AGG-ID: dvQIoEmzNHGzBncmaxMr1w_1741216132
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 66278180025E;
	Wed,  5 Mar 2025 23:08:52 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0B3BB300019E;
	Wed,  5 Mar 2025 23:08:48 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
	mcanal@igalia.com,
	Alice Ryhl <aliceryhl@google.com>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <sima@ffwll.ch>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC v3 30/33] rust: drm/kms: Add Device::num_crtcs()
Date: Wed,  5 Mar 2025 17:59:46 -0500
Message-ID: <20250305230406.567126-31-lyude@redhat.com>
In-Reply-To: <20250305230406.567126-1-lyude@redhat.com>
References: <20250305230406.567126-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

A binding for checking drm_device.num_crtcs. We'll need this in a moment
for vblank support, since setting it up requires knowing the number of
CRTCs that a driver has initialized.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
index 429ce28229c9e..36a0b4c4454ba 100644
--- a/rust/kernel/drm/kms.rs
+++ b/rust/kernel/drm/kms.rs
@@ -311,6 +311,17 @@ pub fn mode_config_lock(&self) -> ModeConfigGuard<'_, T> {
         // held throughout ModeConfigGuard's lifetime.
         ModeConfigGuard(self.mode_config_mutex().lock(), PhantomData)
     }
+
+    /// Return the number of registered CRTCs
+    #[inline]
+    pub fn num_crtcs(&self) -> u32 {
+        // SAFETY:
+        // * This can only be modified during the single-threaded context before registration, so
+        //   this is safe
+        // * num_crtc could be >= 0, but no less - so casting to u32 is fine (and better to prevent
+        //   errors)
+        unsafe { (*self.as_raw()).mode_config.num_crtc as u32 }
+    }
 }
 
 /// A modesetting object in DRM.
-- 
2.48.1

