Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4251738D40C
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 17:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975077; cv=none; b=cAkPlds9MiQEjBSPXJ21OC3OtkYbfURe123dGzQTsFMSGbTwnu0bMMGezIXb4BDXzag/CHF/pHH4+n0B+bSQZJU3a0Eyw+1WI7iabHVaqjoBAIjLzWqTfzl2B45uwH+EhUkHrunocLV4Teb7p/fu+SypMCHXEbOOdLV4daZos6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975077; c=relaxed/simple;
	bh=5fmz0pFJPOf69m13tgNlsodqPmqgLuXgeWBMtpj3Lzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jfo8lJnrPi0xDPLAc5cUgtvwM5rcjGJdtEUcbvIYc2VG0hi/jSlmbeLFNzjMl3rUZ+PM3Gf/xGvE5IC8mfMcUzhdEwzBw4kJ6oFCct50AQdqjs9KIHYhrSviolMeynI9MRqzgoEKW5PX9RfXcI+f1hkgKK/a8qp2sQGr6u/xdVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAkuDZ1f; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAkuDZ1f"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b7a9882e19so850801e87.0
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 10:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788975074; x=1789579874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=COlbN8g71PZLS8Vw0yv0Jnd68gVBxKrHka7KfWabY50=;
        b=RAkuDZ1f0eAj0mB/L0bBtScyb5ug6eTl+JAm5/lGgTrh+31IYaXu9y4D4OTDz1yTY2
         UrJsiQFR4RsMc/iZkjhsqlmAOm0k3jVk53IhC/j9rdzm1K/5QRAQ27c7IWkBCEyaWU8R
         7jBb3wgonLjA1j6dSuDprJqiJakFdR7zoWf1B3vrmVfVAcWPgT+g1xoxZSlCH+iQ9jGW
         I1+LnhzKnoJaoEOGWKE28bVOpa1HFs3RG1Oxkm83koARKa1/hTQZ1STxlNR64eTZTjME
         0f0By4K9hVUuXIGVODqE4p3ptyN5WW3JnX8d7udDgGMHlxOH4Jit3QpXBFczEdWSTSdJ
         XlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975074; x=1789579874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=COlbN8g71PZLS8Vw0yv0Jnd68gVBxKrHka7KfWabY50=;
        b=fKwMyfPDIBnHeN8uTeixXqb0cStNAkZW3arWLhzcdSETye5A3QX85Rsfp9E3L8Z/lw
         mhuT5na3erGmwth006t6Gp6p9KqOLgnq4XtsltnNdCqntehh2YdwpJjXe4LQGaKdfxX4
         xqhN4stzc1+NoqZF4+sQel2y1sqgIqTGpMIU45D9T+OH72bzT9IqN8BHPxZSKRJ8gPjr
         By0o84pT0v4DlN2ucFDfemFIe2OZ6grkSY3428emkWY0R7JhB2slsoC9gV19olkiAXvZ
         NEHs8T6Y3rykOFkSEnFDS72sxMiNiWu6OMYd9rNfHym6ZcpFtM729DHyka1yoH/pNYYf
         iuUg==
X-Forwarded-Encrypted: i=1; AKwUvBzGkeQj0WNqmCV0/c7UqMgfr7qgfNSKAjcWfg9L0/8eXMx8UPx7a87jqXfYElZUKgg6ATnX0L5jPmWxfKdsXg==@vger.kernel.org
X-Gm-Message-State: AFuF++kSy45O8yhdW8p4JhbZE8oMBxrCgkLhtXuICMkkvSsa0n6FwX3T
	qgy3NYRGZJ/d8VYUtfXqdjYFhCwU/RRQhv7Se+tmqvkD4ldkpDTi75yH
X-Gm-Gg: AYBFou05QqlybpRAIBp1t8HjKdfS8gVrJFHsP2upwG0zIBES/+AtqlXeY7nvceReExq
	+Hp8DI/eB9iNZR85HmQ4NLq6FAoX/kUXxXztjaJ10OFNws0bD2s0k19qgpwXJPw+YmSuvi7qdxP
	9hRq6vz2zDhIy9KPcBJafS5snCH0FgTS1rQ6yO3DZkR4OjBvCbh4iPrO0F/YX7acu781H57aaKG
	BlQjjAKwRiWH3+IfctTfw0E8sw+I8uHj+J/Zwhhv9eac2rXRkIeelHdKaJw7Ex5RbkZAITFX2PK
	SaHSaXBjL5xAEBkaaQjfjGWBiG8RTuggOJkPWhBuPoAWT5ZEfXcqFdmCHT+CxBS8VSiYMt3QnSJ
	Se2GyA9vd6H6YRg2gi2eWMRLrOYPinuxyevYDAy/6Z6uaTiSk539g2ZIbC9KuRGw8lkiowsHkhM
	CkMcrlSAr+7TcveRAkQbaPMot22zGNrLdn9oZvYmNPPZpXoEIlZ72uM0ngTCdoISzYc5ivpnHj0
	Agm6WKtHFCTczJ5sW07aM4us1o04VNnGw==
X-Received: by 2002:a05:6512:3e09:b0:5b6:4ad:77b5 with SMTP id 2adb3069b0e04-5b616f4e76fmr5968551e87.29.1788975073832;
        Wed, 09 Sep 2026 10:31:13 -0700 (PDT)
Received: from soda.int.kasm.eu (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b752df233bsm2780995e87.25.2026.09.09.10.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:31:13 -0700 (PDT)
From: Klara Modin <klarasmodin@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Mukul Joshi <mukul.joshi@amd.com>,
	Felix Kuehling <felix.kuehling@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Manuel Ebner <manuelebner@mailbox.org>,
	Gary Guo <gary@garyguo.net>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	Klara Modin <klarasmodin@gmail.com>
Subject: [PATCH v2] rust/drm/gem: initialize callbacks with ..pin_init::zeroed()
Date: Wed,  9 Sep 2026 19:31:03 +0200
Message-ID: <20260909173103.73656-1-klarasmodin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the commit b67d2d039f64 ("drm/gem: Add callback for when handle
count goes to 0") added the handle_free callback, it did not update the
rust abstraction, which will cause a build failure when that is enabled.
Rather than just adding another None initializer, use
..pin_init::zeroed() to make all unlisted callbacks None, and remove the
existing zero-initializations.

Fixes: b67d2d039f64 ("drm/gem: Add callback for when handle count goes to 0")
Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
Closes: https://lore.kernel.org/all/aaef18cd-ab55-4fb8-8563-ca3a5ea9cbc6@leemhuis.info
Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
Closes: https://lore.kernel.org/all/4da62a4b-c4ef-492a-9a27-b56bd4784acf@suse.de
Suggested-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Klara Modin <klarasmodin@gmail.com>
---
v2:
- also remove initialization of vm_ops, which is also handled by
  ..pin_init::zeroed() (thanks Gary)
- fix the same issue in the shmem helper (thanks Thomas, also reported
  by Sashiko)
- v1: https://lore.kernel.org/lkml/20260908175427.47207-1-klarasmodin@gmail.com
---
 rust/kernel/drm/gem/mod.rs   | 13 +------------
 rust/kernel/drm/gem/shmem.rs |  5 +----
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 80d8f524f9d5..9d4280002765 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -266,18 +266,7 @@ impl<T: DriverObject, Ctx: DeviceContext> Object<T, Ctx> {
         free: Some(Self::free_callback),
         open: Some(open_callback::<T>),
         close: Some(close_callback::<T>),
-        print_info: None,
-        export: None,
-        pin: None,
-        unpin: None,
-        get_sg_table: None,
-        vmap: None,
-        vunmap: None,
-        mmap: None,
-        status: None,
-        vm_ops: core::ptr::null_mut(),
-        evict: None,
-        rss: None,
+        ..pin_init::zeroed()
     };
 
     /// Returns the `Device` that owns this GEM object.
diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index a687d46d170d..24cb5343e0db 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -132,19 +132,16 @@ impl<T: DriverObject> Object<T> {
         open: Some(super::open_callback::<T>),
         close: Some(super::close_callback::<T>),
         print_info: Some(bindings::drm_gem_shmem_object_print_info),
-        export: None,
         pin: Some(bindings::drm_gem_shmem_object_pin),
         unpin: Some(bindings::drm_gem_shmem_object_unpin),
         get_sg_table: Some(bindings::drm_gem_shmem_object_get_sg_table),
         vmap: Some(bindings::drm_gem_shmem_object_vmap),
         vunmap: Some(bindings::drm_gem_shmem_object_vunmap),
         mmap: Some(bindings::drm_gem_shmem_object_mmap),
-        status: None,
-        rss: None,
         #[allow(unused_unsafe, reason = "Safe since Rust 1.82.0")]
         // SAFETY: `drm_gem_shmem_vm_ops` is a valid, static const on the C side.
         vm_ops: unsafe { &raw const bindings::drm_gem_shmem_vm_ops },
-        evict: None,
+        ..pin_init::zeroed()
     };
 
     /// Return a raw pointer to the embedded drm_gem_shmem_object.
-- 
2.55.0

