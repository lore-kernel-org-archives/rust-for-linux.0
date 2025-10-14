Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F09C2D248E
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Oct 2025 06:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760424092; cv=none; b=reySc+STajhxlkBi5jYLhtCG7V/FHXU7/QhGti+eRJ9kDZ+fUbNABTuJYemmuHuQaA4OPb5Zqo6HM1eX1ZsMdeeB9Hd0h+ICWZ1fnIqO8wp72ePclm9/AZ+G46dJd6u6uQQsTMZVIKkZ5j2mcnVrAknDfASbfapyhH7PwRJsETQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760424092; c=relaxed/simple;
	bh=2bp7b8xMX3lCsqrOtDwzTcWHekQK/ojdxzFCW5PavL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=HB/drVsn1OOHBBiqg0HNoXT2cp2ijsWsM/7nkMysRt6X00u/R1JOcN2/fokxKSqtQyouNfhoBrkEnMj8GeJ+nlBd7ZP+jPPQNXqTvrtm2bL7AnwevOJeD/eJ3Q8NQM13DcotPdRUoVkdCEqn201btu9Emw7HoBAg3abWK7LZU1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QiUNOnJw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QiUNOnJw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760424088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8eo0rdDzh07ckiTBotN/0G7m7UlosQASIFmbI9q9Ybw=;
	b=QiUNOnJwusTbBsP4RTgJuZmkJoGpW7C889pryQUKpagMCG0Z2VKNOmOcnecb6F66IjXoMr
	8KPloS7sGBQGHqImKN64hWh8MZ7U78X6fviBWxIVrHnh00zd/+9UcLDnrvkK9SlckuI5eX
	aqk4iQG+edjZZ3CteqAnQDA4arn9A8g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-mdLuo43aMn62oXtKEtz4JQ-1; Tue, 14 Oct 2025 02:41:27 -0400
X-MC-Unique: mdLuo43aMn62oXtKEtz4JQ-1
X-Mimecast-MFC-AGG-ID: mdLuo43aMn62oXtKEtz4JQ_1760424086
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-426ce339084so3650626f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 23:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760424085; x=1761028885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8eo0rdDzh07ckiTBotN/0G7m7UlosQASIFmbI9q9Ybw=;
        b=py96FhNdFuvhjMTTTojPGltVGT3ELMZhs91FLIAYjG4lce3r/R6qFRCUXW3vV3Had1
         bKrBWBLPiiVlDEND6dcDUFPPzchQKKAQDo5uHURP7Z8SxzMiL45xKDnNNoAkNhT8+lye
         quOG234vOvK74jm8WVcRITDiNAyneOJpXgqm7Dn9ZRzkrzwAHpeZSpq/RcOtmVB5DHz5
         k3Yk2QH7BPZUnqqFxaFsVtUKwLBYA99WaE2c7mu2bKreyvUrAoOjOpbCRZXychct2AGL
         h/3i0CAczh4R48IQ7DJsayEDqE95IMRsDLnMtDasaKPrDNomSE/kMFm/7m3pebFeyEKs
         OLLA==
X-Forwarded-Encrypted: i=1; AJvYcCVBuogWx+rUE0DO7rYVrsF3IOnwsIaVWPRvClTxn8Qtih144wKoqWW/pwtYtgUZFFyjnWiKWZW59XnM48OmnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYsvLyoylbfe7gYKfXpKKaM1Iwa1Q4+MURJQtQm2TDsQCGu8sC
	/gN6i8/J+96fMQCAd2hesT4ckSN5W0fYxGtObAfzM7DYhRbPbc7SBcY3DocwHBtCmQFioDDknOd
	/s8D1ZRNittJwsE2Wkn/VQpGd11TA1xhWB1GJ90PzKBuiJCDyXwQO+CO9GFyeQzVoz4Y+
X-Gm-Gg: ASbGncujA4JQpTZfnbfrkqKi41V9TqVECvO7JFKdshBJatZ3TYQQSj6u5J6AjhhV/K/
	eOQCVdl6MrFyM9j/HziH3dxHeABYDZmJbEbTDucwveW02azzxzNTWKPyVtZhtACl37RA1U4TDJU
	l7h3JfF+a0/pEvseOZ+FOy76oMvvQBAM1ccCcLmnmFMtwDaG0I6yzGytmz744efBHqmdBgDBTBH
	QYm6OUCjwgOAuZPLzkXPHM9CjB0vhFGWEfyFK3GelWJETPiuCJGSCBDabPxqBQ8iF8eXbClzj+D
	8MsKH9h+uv3lQgYnVPL1nu5PRjgXQ1dv3OH4FgY2ogcw6WmBIcVrv++UByn445+H6lUKc6EDR34
	ah4GamsGkePFqjw==
X-Received: by 2002:a5d:5d86:0:b0:3eb:4e88:585 with SMTP id ffacd0b85a97d-4266e8f7f58mr14331635f8f.29.1760424085631;
        Mon, 13 Oct 2025 23:41:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVQ04e7UfQsRRayb/A53UoKDUPQdS7WxAqx3NLzVujqatyY5Y+mwqkqiVt78YRvyiQ00wF5w==
X-Received: by 2002:a5d:5d86:0:b0:3eb:4e88:585 with SMTP id ffacd0b85a97d-4266e8f7f58mr14331606f8f.29.1760424085157;
        Mon, 13 Oct 2025 23:41:25 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb4982c10sm217369235e9.5.2025.10.13.23.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 23:41:24 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] rust: drm: remove unneeded handling for config DRM_LEGACY
Date: Tue, 14 Oct 2025 08:41:20 +0200
Message-ID: <20251014064120.263455-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AqwRNwSphOx_Ih5lzbUVDOtnYsRHSvDFE9d9IXftmcM_1760424086
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Since commit 94f8f319cbcb ("drm: Remove Kconfig option for legacy support
(CONFIG_DRM_LEGACY)"), the special handling in the rust drm code for the
config DRM_LEGACY is not needed.

Remove the drm_legacy_fields macro and simply use bindings::drm_driver
unconditionally.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 rust/kernel/drm/device.rs | 33 +--------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 3ce8f62a0056..a1d92d8922a4 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -16,37 +16,6 @@
 };
 use core::{alloc::Layout, mem, ops::Deref, ptr, ptr::NonNull};
 
-#[cfg(CONFIG_DRM_LEGACY)]
-macro_rules! drm_legacy_fields {
-    ( $($field:ident: $val:expr),* $(,)? ) => {
-        bindings::drm_driver {
-            $( $field: $val ),*,
-            firstopen: None,
-            preclose: None,
-            dma_ioctl: None,
-            dma_quiescent: None,
-            context_dtor: None,
-            irq_handler: None,
-            irq_preinstall: None,
-            irq_postinstall: None,
-            irq_uninstall: None,
-            get_vblank_counter: None,
-            enable_vblank: None,
-            disable_vblank: None,
-            dev_priv_size: 0,
-        }
-    }
-}
-
-#[cfg(not(CONFIG_DRM_LEGACY))]
-macro_rules! drm_legacy_fields {
-    ( $($field:ident: $val:expr),* $(,)? ) => {
-        bindings::drm_driver {
-            $( $field: $val ),*
-        }
-    }
-}
-
 /// A typed DRM device with a specific `drm::Driver` implementation.
 ///
 /// The device is always reference-counted.
@@ -61,7 +30,7 @@ pub struct Device<T: drm::Driver> {
 }
 
 impl<T: drm::Driver> Device<T> {
-    const VTABLE: bindings::drm_driver = drm_legacy_fields! {
+    const VTABLE: bindings::drm_driver = bindings::drm_driver {
         load: None,
         open: Some(drm::File::<T::File>::open_callback),
         postclose: Some(drm::File::<T::File>::postclose_callback),
-- 
2.51.0

