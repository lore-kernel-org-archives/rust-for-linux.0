Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC34334574B
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 04:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782190468; cv=none; b=EQB0V4GKSxLwKfgVZoMpWVGkQc2FmORUNPgnq5YoerMEbPJt6bZ+/ggicqaTCPs8vqwPEJwMMtVTbr/8ywYNMbrcUxom1NfiXLBOUi3y7cilEnlCrci14xnhqFBHT1olc93YPtIDI99hMBuJeP21wHPM0UpPpzJESNhk9YfpAgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782190468; c=relaxed/simple;
	bh=I7Eg9TZVIwhnpK+ZqS5PPnmgj8VTqwlD03DXcjwSxlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2122MZEexEvbTV4enQpM9aSSTqSJUcHGKa0YwhY9dHcd1IsaviAbUc3OHJFPGvhMPaXrC8Yp22KlQFhYIHX2Od0YMMrUR+5J0QgUA4foqoIWd5QfoR6XrkztJvCxkHTo9PJMniN39lYwhAbfept3GMhH3pNwhzMcgb/l6zqMx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GW+y05r6; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GW+y05r6"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c74383c93cso30202415ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jun 2026 21:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782190467; x=1782795267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xx28JPVuyxeseCDpMYT7ZYlVOLpmmCqBqgah6lMJbOw=;
        b=GW+y05r6PH0MOe1MP9yLR/u45HHE/f8LJ8fe6TybDeeYQ+bRQXKM6ifQ5X1bWUqDsH
         HiOvzMmJS7G9BK8zUYGRB4pbI1ZZzroIrokZyhoxi1GAvpg8jbddgLEvjIaiJe/YgsNm
         hS+soJYRU7V4rklOzGtp1KbFz0MQHsgbAqM38inBfCoWowTE4s+elnEiWYCBBrHVrwMY
         QpQRFPwBzJvpS5uRP+Mv7QOrAA9N4vvkNi0i8oXaOOCY8nBEVoI1t3ZBDk45oEohplnt
         +DfDm3ze4AEJdBQdqp0KMnQoAAgGPdMCJuU2A3K9vFL+sb87MbSkrWUJGp7L6vnT8HdH
         Rvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782190467; x=1782795267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xx28JPVuyxeseCDpMYT7ZYlVOLpmmCqBqgah6lMJbOw=;
        b=SDGZhnYaqB0nQQRLLumibyTKwt0+CeKjpCpT4v5n+4qzuck4QE4XxsOAP6eaMm1Y1u
         hv5w7pPAQAGoHDY7gvHYTQVr1uUvXQ8q8+kRg88RRNBDMgSlkUSy2Z9ivdKBbk5L0m6M
         0AfiLlRagowb20xc2rBJq8UvIM3VhQ4Ruild6jSVCx0g3LX/5fXCrB0SyBRrMnt+A3hO
         m0bsafVjvIqO4MVBDtFMjXbUw2snlkdhmvqJH/+Wsuq7YEj2afMDNTZpGWvBeZX/jNA1
         kVwU5YjLqjBY1kxEdt138catv2Rraj+Um7dJieI9bp1rA2xDsyGKQdexWPmFF3UTjQ81
         ZrVA==
X-Forwarded-Encrypted: i=1; AHgh+RokjR+dzaRbanfGhgLWss730bpChh+yJnkROJIjNJd4SX9RsbFYAPsQb4FthXM5SM3K17l3tX3xos+KwAe2aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBtLxWazyhxk7/AyugpP2Hgu9NbpQYYqfkjZsNcLxD5u1s1Eih
	+MYghMCgI2AXkHzC822x3OVGLxi3Yhhyft8cadMfAEwnJxlF1KSIxrpU
X-Gm-Gg: AfdE7cl6Zi3OoRHIwIGwQ4l82pdRXkSJyRN8q3Q+VIDSFutgFW5ULxxo9HIMcBznljy
	84Qc2TwFBqA7VtwmF3db8z98lGlP5+HZs1teHD/vTgr1AeX9fTwu3mQ4q8idZpXBiYpDmuKczt4
	GM7rNgNiGk/yZyO6/aiCp3qwPiy1P0Tif1NrM/eMn2AXnBNgrCjxKvG8pyD63HHQS8gfiPGyQqj
	jhKnSvmQL5dKh29l7EyZurnb+CPBY3XFGEqJYgy5qep91H5J2CHPsPQH+rww5mnj3dIyxhbWH10
	8UTj+0UJNYw9asEO7kjjEPpu5rd1/8n5obhEI3oVLwrwTMgtRISVR35rlcYAf1jX2M7dZlZZ8Kc
	nDRFTnhyQZiqnaKirZan1C5hmx9k8u7hiNYu/4QYsL2kz03sz4dnAMhX/1sykTcnNygfq336bZZ
	HZtcA+oJlG5NjmvBjBzDnqWx77atwWrQ==
X-Received: by 2002:a17:903:3d07:b0:2c2:be43:39bc with SMTP id d9443c01a7336-2c7c9a02a86mr9155795ad.22.1782190465984;
        Mon, 22 Jun 2026 21:54:25 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8cf0sm89734785ad.50.2026.06.22.21.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 21:54:25 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: akpm@linux-foundation.org,
	rust-for-linux@vger.kernel.org,
	linux-pci@vger.kernel.org,
	jic23@kernel.org,
	bhelgaas@google.com,
	lukas@wunner.de,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	djbw@kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan.Cameron@huawei.com
Cc: alistair23@gmail.com,
	boqun.feng@gmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	bjorn3_gh@protonmail.com,
	gary@garyguo.net,
	wilfred.mallawa@wdc.com,
	aliceryhl@google.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	tmgross@umich.edu
Subject: [PATCH v2 01/21] rust: transmute: add `cast_slice[_mut]` functions
Date: Tue, 23 Jun 2026 14:53:46 +1000
Message-ID: <20260623045406.2589547-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623045406.2589547-1-alistair.francis@wdc.com>
References: <20260623045406.2589547-1-alistair.francis@wdc.com>
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
2.54.0

