Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E22333441
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 05:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777439328; cv=none; b=EXnUSqmXqtclDDZ2UHkof56+U53Tsbn5/kzTEOJtR70Krrfzcguu/hjz34JcZwxBURuMD7Uk0WTBJ2EMlPu0UyaCLrhXMzhONZfFXS2ECs4QyWiCv1iVeLR0tQ3rm7hOQcuuBfjL+EzbF1hZ0Xdi7GJIV62IJ4M22XAdVbm0g9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777439328; c=relaxed/simple;
	bh=3vr4LweU0XG/MdC/ybUiaL5dNvZ69Fa30FXvIM4R2N4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M1Sc0CabGRptI3Sg8Px5y05Sr28QQdw7JxriT0FzoxKSvg/byDTlh2BW2ULNw6J2XG2tTQu2XQa2Zf0y4GhAxuvd05ZO8Vpflq81vaFH0jQjwYtSSc3LaPAuqHYOnj4Ke+Mmdw9APxbYwxjxRH6RIgPO9ZIzVUKgeswncDQG3cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2AqHOaj; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2AqHOaj"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35d965648a2so10862280a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 22:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777439326; x=1778044126; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KPbd8CPced3p+R7AG2gDS8UVQl+Rhqk52G90qEr4h9s=;
        b=U2AqHOajgV+w4Lc4aOHZkRFpSgkS/QmIoqzQeKDJE8tDs9W5bE0dyYS/Krx9YO6g6N
         7/5Q9TCCrDKetEQpy2UWEeOSuh+KM9EjTcbfZYCLOiQ+R5+QqgtCj8tJGp74Bk/gnmEd
         r0G0/1EsrH+h69Q43s7cDrNj9HwzdaLmuzwUgy5SvVLRRgCgpgzeJMLu4C/FXEdQFqop
         Ybk4RDOy7rK0coz994NYgotHApcY1nioeoJjZFHEvS2ZRariijXGcFMh/VtzqyNNTPSY
         L3C6/qA8ES2e5hXvTy0T66t9La2HVT5VGG8CjJ7fjb3zBM+KCKGUtu6oj2fxv0mQ90w5
         jLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777439326; x=1778044126;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPbd8CPced3p+R7AG2gDS8UVQl+Rhqk52G90qEr4h9s=;
        b=AbGXy1MYjeF4V+oUUEV+MG9pclmv5yF8s4Yxr1nJ3zJR3p45Jsq13ccKNKOWXzeTu9
         7GVdj3NvpHir5gssSXJ9RbJuW1qyP1n+J1AubhOLVkAJpsqLAfHGCqINNIXKUliQ7Nb1
         jtaCpoSflD4cQrHXSiknNMUsrsbr/vl0Y0kYYLZecenNatWCv+y0WGiF0vxh1AAYAt6s
         eZNrG34n3UwiclO9dj9DGIWInLCpxz1GKd/wAT4lgQwjlJbYEfXUpCdBZP81LUjLwiYP
         36qfCtMANnkolm6rFz7SY2yUtGS2johLGwUahWLwoIMXiMghv8PvERZc+/PVPR6zntIR
         /XIg==
X-Forwarded-Encrypted: i=1; AFNElJ/aqz0imYhmw43gS6pVCCKY/Hr/ewiMAvAt1RCJMCXvltF0uJGduIzmFgVN8ziKtXcaJ2pjxv7+BfSHxkTTRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWq4H39ZCbfGoS2vZx4RtkF25l9QDY7ArinpASM1ChzGdTpXpD
	nJs8Q9mqvGe3D0xA+z97QlWAx99eem3O9pLZEgsA6DPk6w6oysua75Qr
X-Gm-Gg: AeBDiesPFcg4l+TjJF1CKC8xUVpcLYWFixYOD9n/0oJijZhqPADie4VTROA/ed27N9M
	u0ZH6McqHOTEjG8j4hfG2ly1/wVRva+wc+GWkkF4+fnDqfG+Q89+yaR3m/Wr9FaV07o6GM+VjSz
	owA/qsde3CX6EHebSFjqPluKlBrlCdyScZy+C28M8NU2HBlBj5CvdIBNMsatpCB4/xRGR5XXWZl
	hbKoRDuZ84E1ITZZrNs3VVyzgmrznTH+J3rBVny8qnFuEw5wAZy/9fK7jJCd/iOhEdI32MJW8sE
	5/FiuVDveHXT03v3ZK/uHow77tLswM26PWIRCsmRHC2WgLAUJM6VOUsw/Q4BDDVYA/p/sO8oLdR
	pve9Z6pOilwd72Ix7UDq39uw27LWxpVLXpbHDCXBeQvqqrLWzvCD2UbbOg/BBcotfDjwAjlIQmf
	1nXOB/Qeh+qc+gwM8iBgYt3bXgFmPYoIcC7/TTlUndO/Bn6tk=
X-Received: by 2002:a17:90b:1a8e:b0:35b:9b77:d7c with SMTP id 98e67ed59e1d1-364a0d08580mr2433235a91.14.1777439326204;
        Tue, 28 Apr 2026 22:08:46 -0700 (PDT)
Received: from yuwhisper-pc. ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a4152b85sm1158871a91.4.2026.04.28.22.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 22:08:45 -0700 (PDT)
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
Date: Wed, 29 Apr 2026 13:08:14 +0800
Subject: [PATCH] rust: drm: fix incorrect type name in `Device` doc comment
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-fix-drm-device-comment-v1-1-d8876b44d688@gmail.com>
X-B4-Tracking: v=1; b=H4sIAD2S8WkC/yWMQQqDMBAAvyJ7dkFTK9GviIe6WesKiSWxRRD/7
 lqPAzOzQ+IonKDNdoj8kyRLUCjzDGh6hTejOGUwhamLyjQ4yoYuenQqEyMt3nNYsSrts7H24Wg
 cQONPZDX/466/OX2HmWm9bnAcJ00Rqed6AAAA
X-Change-ID: 20260429-fix-drm-device-comment-41859883dcfb
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Maxime Ripard <mripard@kernel.org>, 
 Asahi Lina <lina+kernel@asahilina.net>, Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Hsiu Che Yu <yu.whisper.personal@gmail.com>
X-Mailer: b4 0.15.2

The invariant documentation incorrectly referenced `struct device`
instead of `struct drm_device`. Fix it.

Fixes: 1e4b8896c0f3c ("rust: drm: add device abstraction")
Cc: stable@vger.kernel.org
Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>
---
 rust/kernel/drm/device.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index adbafe8db54d..301c9f7859e2 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -72,7 +72,7 @@ macro_rules! drm_legacy_fields {
 ///
 /// # Invariants
 ///
-/// `self.dev` is a valid instance of a `struct device`.
+/// `self.dev` is a valid instance of a `struct drm_device`.
 #[repr(C)]
 pub struct Device<T: drm::Driver> {
     dev: Opaque<bindings::drm_device>,
@@ -160,7 +160,7 @@ pub(crate) fn as_raw(&self) -> *mut bindings::drm_device {
 
     /// # Safety
     ///
-    /// `ptr` must be a valid pointer to a `struct device` embedded in `Self`.
+    /// `ptr` must be a valid pointer to a `struct drm_device` embedded in `Self`.
     unsafe fn from_drm_device(ptr: *const bindings::drm_device) -> *mut Self {
         // SAFETY: By the safety requirements of this function `ptr` is a valid pointer to a
         // `struct drm_device` embedded in `Self`.
@@ -184,7 +184,7 @@ unsafe fn into_drm_device(ptr: NonNull<Self>) -> *mut bindings::drm_device {
     /// to can't drop to zero, for the duration of this function call and the entire duration when
     /// the returned reference exists.
     ///
-    /// Additionally, callers must ensure that the `struct device`, `ptr` is pointing to, is
+    /// Additionally, callers must ensure that the `struct drm_device`, `ptr` is pointing to, is
     /// embedded in `Self`.
     #[doc(hidden)]
     pub unsafe fn from_raw<'a>(ptr: *const bindings::drm_device) -> &'a Self {

---
base-commit: b4e07588e743c989499ca24d49e752c074924a9a
change-id: 20260429-fix-drm-device-comment-41859883dcfb

Best regards,
--  
Hsiu Che Yu <yu.whisper.personal@gmail.com>

