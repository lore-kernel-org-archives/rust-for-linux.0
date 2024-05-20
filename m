Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7525C4C8E
	for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 17:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716225695; cv=none; b=nYj5ssXtjBkWwkK4ngE55qIBKCuWTEOxKRzY0rJ+Vyg3qIIGjliYwmH9pvWGs4clyy+lnSg4Z9IAIS3XssZPNZ5Lf7Hri9uveaWgu8xMtpP4KjewDxyeaeStO2Yco8vv6NfHNKE9dpAEXxL1J2suBasUBNv6SsqtnvUQeOQVwA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716225695; c=relaxed/simple;
	bh=zafxp5VcRumxwW1Q5m8geHIqCqPMfs7HS4dC+lQb8O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cTPOJNBjWRngZuy/XD7jlnnoe8IsQvwp7aeWWGWAPtLkZDb1tgIdo6qRhuyatLk9KjT1q3awnLiOTYDg4f0uMJ0gOGeR+BJpZqGrCGy79hC4j+/PcarsF4yO3T0SspuCGQqI+mJ3mCJQfdac0yHlLu68WxbL1KA7Hjc1IOLB2WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gPv6sbGa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gPv6sbGa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716225693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ieml4cQgLdOB6f1Tq+rgmDncA9spVWDVEosV1A4OpmA=;
	b=gPv6sbGaFREhiljNh3to3Y8xK/K1v8yLPxnyqhEXAAWscK3l4ffAxfYhFgALNEaeaxZNcZ
	KJsP6vi3jqZmQqviDrvOIT1DMA1lRfqMojcEMc2Bg9aBjrJSw+O69L9o6/kgaw6/IdRMG/
	qDhYwD9ezCNUOG6C2PxFN02tuT9+sA8=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-GyY7kCQpOVCejZq9-tY8Cw-1; Mon, 20 May 2024 13:21:31 -0400
X-MC-Unique: GyY7kCQpOVCejZq9-tY8Cw-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2e2c06094b0so95013751fa.0
        for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 10:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716225690; x=1716830490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ieml4cQgLdOB6f1Tq+rgmDncA9spVWDVEosV1A4OpmA=;
        b=Wo+JxMfbjVZf1mVFNLkr7BfE27d3Bwhfjm4yly2RUQUTgivYV1A5cesp3BkasPpL2G
         wC3xOWS25138Lxx8U4GzXiidViaSsZjOAqsMtWlJw9Vw63WW2UH9+VtZ391k2NRFA0we
         aDW4CEgkrsa25OMkXCABBTflGiNaFOAkPSontET2i5rRucFmUL2aeKxHR2d8msAbAPz0
         owuFyP9HXrNylzQbVUBfgIt7Jlf8F0ZqkVH8YUcUOjcxjXgnoNDPADarkIN6Igdxxm+B
         xNr7nZ7kHrpFJCboSB3tYa3UA2iYiDhnehrQSkbASEoTpz/Zj617ziM5XCoL6FQ3Cxtg
         Ks+A==
X-Gm-Message-State: AOJu0YytcwwopPlKe70ME6hT11sLmNYrkGntOY9wYyI0gskT0OZcutgZ
	qlRANaVD68QY800SVbkFc+5Unn/XLBJfr4BGvuQl42R0M5wi53tsVb99PD7L2Ip3S36fmGTN8mu
	9b7rWKtVhMqouBn7XsGze4+AqoCXnji3354av4A5cWSgWteOIah3vTl3y5sl0pkUg
X-Received: by 2002:a2e:d09:0:b0:2e5:2eaf:b095 with SMTP id 38308e7fff4ca-2e52eafb1f7mr191077761fa.39.1716225690433;
        Mon, 20 May 2024 10:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7q/RlyHXDaQZTvhlrA4Lq5+xbLf2b2bh7WpMR1SX2pe4dg+hi0hk9TL8lOhimdQzmJb/j0w==
X-Received: by 2002:a2e:d09:0:b0:2e5:2eaf:b095 with SMTP id 38308e7fff4ca-2e52eafb1f7mr191077521fa.39.1716225690105;
        Mon, 20 May 2024 10:21:30 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42013bf1a5dsm326293055e9.30.2024.05.20.10.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 10:21:27 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	fujita.tomonori@gmail.com,
	lina@asahilina.net,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com,
	gregkh@linuxfoundation.org
Cc: rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH 4/8] rust: drm: implement `AsRef` for DRM device
Date: Mon, 20 May 2024 19:20:51 +0200
Message-ID: <20240520172059.181256-5-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520172059.181256-1-dakr@redhat.com>
References: <20240520172059.181256-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Implement `AsRef<device::Device>` for `drm::device::Device` such that
`dev_*` print macros can be used conveniently.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/drm/device.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index f72bab8dd42d..aef947893dab 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -79,6 +79,14 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
 
+impl<T: drm::drv::Driver> AsRef<device::Device> for Device<T> {
+    fn as_ref(&self) -> &device::Device {
+        // SAFETY: `bindings::drm_device::dev` is valid as long as the DRM device itself is valid,
+        // which is guaranteed by the type invariant.
+        unsafe { device::Device::as_ref((*self.as_raw()).dev) }
+    }
+}
+
 // SAFETY: `Device` only holds a pointer to a C device, which is safe to be used from any thread.
 unsafe impl<T: drm::drv::Driver> Send for Device<T> {}
 
-- 
2.45.1

