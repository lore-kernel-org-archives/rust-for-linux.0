Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C07E273D81
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763890002; cv=none; b=JFyDX7yX7D7QBpF35ncdCh76oqMLwC3ye2yxc53wUERzT2M0vwRj2M+qd9CF9a0KXeeRo2flEFE6uwOhw2C6SdfeKRQqmrmGyji9kZ9kANm93a+WVIywnzJyIO+cBM2UZam9r7/xyKMImDELIi/PlJzGAW6znhlw/L8cEymlmBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763890002; c=relaxed/simple;
	bh=vKoO79hHEPcCQYl/tNMLa4IXudiHam4RZkBRwZbei0g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CAVf9xq1cbPIa933EcAQ08rE8AGj68Oqy7etjU3Ux7BXR9PKFhIDw1aHYOufBoqf5gm9ap12Ln8UNctnohwyWsRunb4ecNJimMB77tv5q5DYD9UWqGXr1cv9rirSo55PGvG577yAetin7cBgPC5iQ8OmhdvSjWg5VTD5+lH/ZNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1syOFK/; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1syOFK/"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29568d93e87so30482145ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 01:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763890000; x=1764494800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HepyoJQ30V+nS3WwhUyswnLGOzdzEO2vo/wcuCFozBE=;
        b=l1syOFK/G37q9PN7BrZKA9mj4Be5qzWE5IlcmClTr8OeaMahODUx21koQqvABB6wCX
         8ClhO7CfqhHbFVZjh0pJT+jBL88ySAgO64dYzaPbJHiMFelNsX4PfV/qde5i6TjfTyVT
         k0DLwAiciToHUtYEYYj7TqTUHtYbiLMyguYVVbnt2M5et6ewgrZVDL2mQETplvbm43+W
         BUCFARN9c+mRQj2At0Pq8OX15gmydPNXTzK56E38OEBL+JwB9a3Fd6kBNW83saevUhoM
         VE+HTbAmP8PbY1x/9cEH+ZhpKxUemc0oFlwNc0bCpvTUn6oOFJ3G0vBboNZDiZqqWSp1
         3/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763890000; x=1764494800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HepyoJQ30V+nS3WwhUyswnLGOzdzEO2vo/wcuCFozBE=;
        b=kxCJ7rH62+0afjDScksgmtgeHLY2y0szKD72ccEyYpAG2JEzYxYOV4/B4lwjqZj5F8
         siAV7qSq1O4KoLlsjiRwNG24hzVQmCqJH0174/kaV9HBKClnQT2sXHW2I/EX+cXLFfqZ
         LJOMsFZVHAuAI9RumaYMq0PXnitPe2fTpsgr/R2JUDu8xqW/OkggGlZPPd6Eo8r+meSo
         vILl/oBUsfPQDj1+19Ws5pLKCTDgVEdvixAYP/2WpK27fS+PTrlBBD5M9ukIPHS2MJOo
         0WZFZjZJyp4NXtmGf8P55SboVog+fzbK8zrSqqF18OS/FzyMiVRiRF/XHdMYBMb/zyfJ
         CPvA==
X-Forwarded-Encrypted: i=1; AJvYcCU32mlGQXBoGoNwOR0gV7TlegzC0UmA1IlENyO4eE6kLp/f/5n4zJ8OFwY/VqdFduOdWjo3oQMfhItdE4msrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1KbGlYXJ8wGz9kt/j0mS16z10eBfRztzEbzSdD7NQP7Nrgm2Z
	GPVt8AX6kO2+3fCviq8gGe33m9pDDNQCDS+KMpsPf7u5KXKDxkBL3nOv
X-Gm-Gg: ASbGnct9e3FTG7j3sNH0zzPFbrA+TtlMUpHHihFXBbDjRoadAwmUA9NAsSVvW/oJXA6
	j5nwyEPJG9AwTTwc6VCMrSPaHxVpaP2JBuhU0Dz8JEpRzSyT2YILW1Dy/PZgYR3fBLvcjbXXKXV
	ymMsfpaq5qvqbB+F7SG69kXVmhbvLMYPLsi8GHmBhJVoSUBcqtnD0S9lreaCiDw8Fe5uu4k7plz
	cA9Z0KfqrYFdN1E06KppGQOo6kWQjB1HJypFqecLOSUAKWeXUf2jSwRjG5ceg9jbedTciZp+SC8
	2dOo7wySGy4xtXjdT8n7Cr2B463UYRlQNVNqSf0dL+Mn6rhtrMXIlysWIWR2K+GqOfz/s29Zvj3
	eYJBD0pciZt9ZosCbP+wMhOmakaHl4B2snNUSxdlDaoO7GP9U54CUFKS8qQ8yFfXrTnE6+3hZtd
	923oRHSaR5t/XH0BBHHexvOIrK5w==
X-Google-Smtp-Source: AGHT+IHnc+TnFjT4Ewq3NCmcVSOlFxFcCR7lWrTNRkJuldxiSn0BMR95iGNmXPyBh157L0RjhglO7g==
X-Received: by 2002:a17:903:2c06:b0:295:6427:87d4 with SMTP id d9443c01a7336-29b6bf77fedmr93037125ad.50.1763890000307;
        Sun, 23 Nov 2025 01:26:40 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 01:26:39 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alexandre Courbot <acourbot@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH 05/10] rust: kernel: Update ARef and AlwaysRefCounted imports to use sync::aref
Date: Sun, 23 Nov 2025 14:54:33 +0530
Message-Id: <20251123092438.182251-6-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251123092438.182251-1-shankari.ak0208@gmail.com>
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update call sites in `i2c.rs` to import `ARef` and
`AlwaysRefCounted` from `sync::aref` instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 rust/kernel/i2c.rs | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 1aee46f59460..c50ca464d87c 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -17,10 +17,8 @@
     of,
     prelude::*,
     str::CStrExt as _,
-    types::{
-        AlwaysRefCounted,
-        Opaque, //
-    }, //
+    sync::aref::AlwaysRefCounted,
+    types::Opaque, //
 };
 
 use core::{
@@ -32,7 +30,7 @@
     }, //
 };
 
-use kernel::types::ARef;
+use kernel::sync::aref::ARef;
 
 /// An I2C device id table.
 #[repr(transparent)]
@@ -408,7 +406,7 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
 kernel::impl_device_context_into_aref!(I2cAdapter);
 
 // SAFETY: Instances of `I2cAdapter` are always reference-counted.
-unsafe impl crate::types::AlwaysRefCounted for I2cAdapter {
+unsafe impl crate::sync::aref::AlwaysRefCounted for I2cAdapter {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
         unsafe { bindings::i2c_get_adapter(self.index()) };
-- 
2.34.1

