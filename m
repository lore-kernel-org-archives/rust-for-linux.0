Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33C3368D57
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 01:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788224651; cv=none; b=qRmV6+mGJ6EW917oLwosz0XP8gfQDHGYqDEVcrXi440qps3/RePRDQKhnIsFcPIcLxqFiItoGqJWQPLScLAF69UzUfmhXMQ+hvpViimFFKjWcavtM/BpB50n8vO5DHkpD/bsy/YtO8KuO3i7oZ4cuXzHVC65XJmdZj6nL+BzUdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788224651; c=relaxed/simple;
	bh=CoPPRCtaESHUG9OwZb9CyMVn08i9IGh5mH8Q+LlV8pU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pj6iBRvxlapCYiJ6QUO9gb7YceRgPpwAUYvHd52So/hNp4KAdgag3l1jVlDP+3vYN9zzF594wEzD9r+uGwJIBMmsQielmw7kRFt/DmMJBCvIVVswvSXU+K/1pd/ISf3CHc6Np3YIB9dYbg5C0HSoyzE6tSTzS8ZsofWPbD4pCQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gok1GWMs; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gok1GWMs"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398b3c37877so2966097a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 18:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788224649; x=1788829449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AYXVDMNHLbdJmU4DKZR7fcyBrcg7wKS5d7QhF+qczOE=;
        b=Gok1GWMsICvbvt7A9OQY99NKTu1NKdA11Iggvri7Wp12kyZsKtrRG/YU67JygJvdnM
         6SzGpPLzAqA+Qt+9z7NYIzLIY/gb/vVdpVaJoUObtHEWD066WaD0j/IaF4c305ZYcZ0H
         MypzaSHpNbgE6s1xrU709N1/zgv1d1KxXT3heawYNmL2Mw2KLw6LJwv3yLFaL+cYHtzl
         y2VWmN2ogcOFoDIoUajqnI0VFS0k48Y7V99CG74fY8GdCMqtaMvGothbkd8UesQ0/vmV
         C9VtyQri6Pc1zg3CoV9ft8Rdw2pxcKZdhN9Yjr9qIhxQVrmXYzvQihsisRC9TppkHWZ/
         tMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788224649; x=1788829449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AYXVDMNHLbdJmU4DKZR7fcyBrcg7wKS5d7QhF+qczOE=;
        b=lXVAYExMwWcPXrX86/13DMP8eY2nSjq4RA4medNO4JWp+d65aCVvR8pgPwC26eVG8r
         c1rqG2mZGvK7pu9wbdBC1nD+x1mqnd8IVqRIyYyWPIabV8fL7JVYlTe+SF04pdzYl7Bg
         WC+1yU7UlBjOOJ7cOjHDs2UTr2aW3RksHGjxmevs59c67jBKk8BfHWx6tdrpAOx09CBM
         0vHKQwHSF/4czikolZ91VOW+DlljeNXQGbgDpXD9vnJMTswVTiWGYiCi4rDzonlkbY16
         NA57FwYWAIvAbtKGpjltqyY6JjmmykTShPmH+AwkLYyli380Qq7LiKhwmBq4RlaihUel
         XLMw==
X-Forwarded-Encrypted: i=1; AKwUvBwv44OIwXccboFAjups+b5n7Mcu8FiSRYe0Z51qpSzgHV9Ok6LU1aA2hX5z/GElSLkjwObvUdKHkXxMkWq6Hw==@vger.kernel.org
X-Gm-Message-State: AFuF++lSxWg0hmqjIKYmmccqz8kG8zuR3qkCFCWNlkSfgUqRHwngtyCa
	fXuL09N7z1lrPjStSUJbB8WZ9CiCz9X73Zu3G22EnnVHHiO0dIBhSJNU
X-Gm-Gg: AYBFou3JLDYOc1yQAViMNsttl0hhQ6hSBYcXgwhOa2NktCMzobhaTvg+0+TKyaKv7Vx
	kfFaPcXKgeVfSjQuQ6Av9/inDPAg42PlbzaCl7UMH0hlvBR4V8TIjj9kpFE1b3LzcpfdMw3mABJ
	3ueg6zQapajipAk6ogIRHidOkcAPzb6BEICRRMOxUYiyyUlRnzdoR+W9uaXFahD9xf4I2e8x/sT
	OE515ueS6bp/wNuEGvKRC/YHJ/G+3TR1In0HJjNHSb5zfL6jWHPZyTVqmSUgh7Z4WwdZYWNFfWz
	HkzvseMBo9kKAutIpihmeTggBvImMh4cnBGOIT/TEQVKYh5+RWr3BneK0Ah4GTthX212UWxNY/8
	PWFyQkt05KyvF/0h8uSGPFT8WWCv8BltamUdVOWSzaopY6N4eJTTOX7hLJYdzORpSPC6WKJh++T
	+x6FSCV04FgIhGcxWOPd7VjhymFcQApo8GhaujZ6h4ySwOS3AJ4722BUBHvt+QqPwY5gKqz3NZy
	p2c+w==
X-Received: by 2002:a17:90b:1a8e:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-396d0fe45damr45825286a91.11.1788224648978;
        Mon, 31 Aug 2026 18:04:08 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d49e9e0sm2372024a91.11.2026.08.31.18.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:04:08 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: linux-pci@vger.kernel.org,
	Jonathan.Cameron@huawei.com,
	djbw@kernel.org,
	rust-for-linux@vger.kernel.org,
	lukas@wunner.de,
	alistair@alistair23.me,
	jic23@kernel.org,
	linux-cxl@vger.kernel.org,
	bhelgaas@google.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: gary@garyguo.net,
	ojeda@kernel.org,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	alistair23@gmail.com,
	boqun.feng@gmail.com,
	bjorn3_gh@protonmail.com,
	alex.gaynor@gmail.com,
	aliceryhl@google.com
Subject: [PATCH v3 01/21] rust: transmute: add `cast_slice[_mut]` functions
Date: Tue,  1 Sep 2026 11:03:27 +1000
Message-ID: <20260901010347.2614656-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901010347.2614656-1-alistair.francis@wdc.com>
References: <20260901010347.2614656-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Benno Lossin <benno.lossin@proton.me>

Add functions to make casting slices only one `unsafe` block.

Signed-off-by: Benno Lossin <benno.lossin@proton.me>
Message-ID: <20250814124424.516191-2-lossin@kernel.org>
---
 rust/kernel/transmute.rs | 59 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index 654b5ede2fe2..c1282fcc9e65 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -3,6 +3,7 @@
 //! Traits for transmuting types.
 
 use core::mem::size_of;
+use core::slice;
 
 /// Types for which any bit pattern is valid.
 ///
@@ -227,3 +228,61 @@ macro_rules! impl_asbytes {
     {<T: AsBytes>} [T],
     {<T: AsBytes, const N: usize>} [T; N],
 }
+
+/// Casts the type of a slice to another.
+///
+/// Also see [`cast_slice_mut`].
+///
+/// # Examples
+///
+/// ```rust
+/// # use kernel::transmute::cast_slice;
+/// #[repr(transparent)]
+/// #[derive(Debug)]
+/// struct Container<T>(T);
+///
+/// let array = [0u32; 42];
+/// let slice = &array;
+/// // SAFETY: `Container<u32>` transparently wraps a `u32`.
+/// let container_slice = unsafe { cast_slice::<u32, Container<u32>>(slice) };
+/// pr_info!("{container_slice:?}");
+/// ```
+///
+/// # Safety
+///
+/// - `T` and `U` must have the same layout.
+pub unsafe fn cast_slice<T, U>(slice: &[T]) -> &[U] {
+    // CAST: by the safety requirements, `T` and `U` have the same layout.
+    let ptr = slice.as_ptr().cast::<U>();
+    // SAFETY: `ptr` and `len` come from the same slice reference.
+    unsafe { slice::from_raw_parts(ptr, slice.len()) }
+}
+
+/// Casts the type of a slice to another.
+///
+/// Also see [`cast_slice`].
+///
+/// # Examples
+///
+/// ```rust
+/// # use kernel::transmute::cast_slice_mut;
+/// #[repr(transparent)]
+/// #[derive(Debug)]
+/// struct Container<T>(T);
+///
+/// let mut array = [0u32; 42];
+/// let slice = &mut array;
+/// // SAFETY: `Container<u32>` transparently wraps a `u32`.
+/// let container_slice = unsafe { cast_slice_mut::<u32, Container<u32>>(slice) };
+/// pr_info!("{container_slice:?}");
+/// ```
+///
+/// # Safety
+///
+/// - `T` and `U` must have the same layout.
+pub unsafe fn cast_slice_mut<T, U>(slice: &mut [T]) -> &mut [U] {
+    // CAST: by the safety requirements, `T` and `U` have the same layout.
+    let ptr = slice.as_mut_ptr().cast::<U>();
+    // SAFETY: `ptr` and `len` come from the same slice reference.
+    unsafe { slice::from_raw_parts_mut(ptr, slice.len()) }
+}
-- 
2.55.0

