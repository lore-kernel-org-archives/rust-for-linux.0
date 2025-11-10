Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D339030FC18
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 14:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762783990; cv=none; b=kw1ra5/AXZahCJgY4c4g+pzxb+d2t8kx1G/N5c/5wQjyUDiiaYSD+tRfaL7tL3ao+ug/e7RXZxeCijIrUyJFbc+x7qFGvUzFQgfDlGO/kfdLf22szMsQa3mBH0dgv7sUfouGCAkGjQCI2zXPo5w5/iY38lpLSbCjzxB8FFf0GfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762783990; c=relaxed/simple;
	bh=gydaMykgl28bOlVrMMqlUHuRkgVIgUMmfBcimtoFJ+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/k1/qAm3OKWr0OgWqRwCaonX6IBoUm1XXuguGeLjCG0z6Pz+opIGFjK8xhhcB6D9W5ZuIPhIhy9j4HHP5FU94vHGS85U3I5Rot+mmfqIRx59XZKr4f8SRsRwAvuVE/wd3JaE0U1nXWxl8dbpTlgVTZ/G148CRWWsL9dOoExgTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0y28qIWe; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0y28qIWe"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4439ecf6004so1492891b6e.1
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 06:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762783987; x=1763388787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9Tz3xZNmCEgsWElQVOlO7V5YKmuSlEmAD6OBg5hRHY=;
        b=0y28qIWenb07DK8F7cTL+XuZlyuwIC7YAwzvMtKuAQxwxHFht7eN2cmybfU8b/ygC0
         avRgNfzEH+LqPSr1DumnSP46hbMHvjfrY4I9qjZAFVoUiYhuUDNUs0KK0aelAxMJt86L
         wLU/msQrUwS7/FuZZdt7t+N3Q/81sYCCB07e+NT6YFCA4TNVYUrdJJwA99sgOjFy0IvQ
         fHdpHBlDjJQI6ClCp2qO+VATbcPj/SvpF7Qy9bbtXcc5FKSw9s+NRkj2vTGkEj079MWz
         ZxpV2aVlWvsLze/ncejSSp91VhkPUc7jjAJGzs/OR4ek4EYAd4C0MGUXAr0cNGPdbxeP
         n4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762783987; x=1763388787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E9Tz3xZNmCEgsWElQVOlO7V5YKmuSlEmAD6OBg5hRHY=;
        b=MsYEs1huPh0VCT7aXpOOQr7xjFTVtBUsktUut4kh4A3X7wOLt6/Hd0YhW+Uks3Dqn7
         1MIxSSN0nhqdQyta/hOuYWWxp629ihfDCkSc2fcTIiJULKxZ+Sf4i5JTIPXUPJow/aFr
         oAQxdDLpyNVKz4B4o6Ty/Wb5JWXVZ8R1TGfooKnZXzPfUV1T1spsYtfSymJ+yWsXpORb
         R06NNym35oT4E6c7PqwboAQeObIP+cJY6Os/fRD0t33UeUUsWtVwHxEFkABy+7i8eK9t
         tvFaH/Wu4M9ToDSO3r8pTT/P29n3uiLYn6XCthuR7dwG9Eg7duztc2QzTmowRb782pf0
         l5Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVlcetrvSg5E8EEL9iMwyEkcowTBnSU/zb/slnBBqN8LYq6UC6nRnIXHSWWtgPoZxUm9Yw+Od3I/Ah+ooyaTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwczDaoHn5E7nVSxRuJxAkrnOF2GMmI7Q6h7aFe5yo1t7jl15GV
	bMtTafhOwcq5iPeBh7ejaVSvaDVXkQpWF2OfMOyFE/xeEDm6Cs/2vu76vIaOG5VyfPjusjFvt6x
	mR2CKXuyObguHd7OpZXQf6eF1KhwkTxmUKw8iUadd
X-Gm-Gg: ASbGncvECbXIdlibw8zzFMrQ3dE15/yPHtCvdlGWdoXSr51xyN/UUiO5Y+/qagTmNOW
	6TYq5VFOtGoqQWi/ZtnayLbgzrY1FADd7fdlkSRW+1A3EJtqpxzvrzCZZfoVC/w/wYSQXNXrmKf
	umgpRsIeM09woUrNBfGEGnv+KVu079u9H2fOXaQ5CStHJ9X/V82J4N2Nb92NeT+Zug9+HaMczAe
	Uf6xfhwJPtd9Hp8kMi7gH1/eqg3PcgaFfdMzrwVG8otcJvo6us0Vr0JAM+hwA5iUsDV/v8QNzZC
	xnEab609lldbTpC9FjfNwvnjq8voz2kVcrE=
X-Google-Smtp-Source: AGHT+IEpdIa3St3Z0x5kamBV9u2B/8FOyvzzuXASe9/+bPwRBN8Tm4KEv15823q8N8X/BmQ7Fb6+a8zOGoj2/yiGiCA=
X-Received: by 2002:a05:6808:1a13:b0:44f:6dc9:f84f with SMTP id
 5614622812f47-4502934182cmr4705881b6e.29.1762783986573; Mon, 10 Nov 2025
 06:13:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110-binder-bitmap-v4-0-5ed8a7fab1b9@google.com> <20251110-binder-bitmap-v4-3-5ed8a7fab1b9@google.com>
In-Reply-To: <20251110-binder-bitmap-v4-3-5ed8a7fab1b9@google.com>
From: Burak Emir <bqe@google.com>
Date: Mon, 10 Nov 2025 15:12:54 +0100
X-Gm-Features: AWmQ_bl6OCmsZ676vGaSNKW5J1glpz42ajwZbct4pX_ztA8bfSLu6YX1DC3NV_c
Message-ID: <CACQBu=Vg1H1eF7AXyJmUWmNuqif+cw-6hzyk63y=LC_H9jmoxA@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] rust: bitmap: rename IdPool::new to with_capacity
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 2:06=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> We want to change ::new() to take no parameters and produce a pool that
> is as large as possible while also being inline because that is the
> constructor that Rust Binder actually needs.
>
> However, to avoid complications in examples, we still need the current
> constructor. So rename it to with_capacity(), which is the idiomatic
> Rust name for this kind constructor.
>
Reviewed-by: Burak Emir <bqe@google.com>

> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/id_pool.rs | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
> index a41a3404213ca92d53b14c80101afff6ac8c416e..5942f678db015e902fa482eb6=
4c38512a468e449 100644
> --- a/rust/kernel/id_pool.rs
> +++ b/rust/kernel/id_pool.rs
> @@ -28,7 +28,7 @@
>  /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
>  /// use kernel::id_pool::IdPool;
>  ///
> -/// let mut pool =3D IdPool::new(64, GFP_KERNEL)?;
> +/// let mut pool =3D IdPool::with_capacity(64, GFP_KERNEL)?;
>  /// for i in 0..64 {
>  ///     assert_eq!(i, pool.acquire_next_id(i).ok_or(ENOSPC)?);
>  /// }
> @@ -95,14 +95,14 @@ pub fn realloc(&self, flags: Flags) -> Result<PoolRes=
izer, AllocError> {
>  }
>
>  impl IdPool {
> -    /// Constructs a new [`IdPool`].
> +    /// Constructs a new [`IdPool`] with space for a specific number of =
bits.
>      ///
> -    /// A capacity below [`BITS_PER_LONG`] is adjusted to
> -    /// [`BITS_PER_LONG`].
> +    /// A capacity below [`NO_ALLOC_MAX_LEN`] is adjusted to
> +    /// [`NO_ALLOC_MAX_LEN`].
>      ///
> -    /// [`BITS_PER_LONG`]: srctree/include/asm-generic/bitsperlong.h
> +    /// [`NO_ALLOC_MAX_LEN`]: BitmapVec::NO_ALLOC_MAX_LEN
>      #[inline]
> -    pub fn new(num_ids: usize, flags: Flags) -> Result<Self, AllocError>=
 {
> +    pub fn with_capacity(num_ids: usize, flags: Flags) -> Result<Self, A=
llocError> {
>          let num_ids =3D core::cmp::max(num_ids, BITS_PER_LONG);
>          let map =3D BitmapVec::new(num_ids, flags)?;
>          Ok(Self { map })
> @@ -126,7 +126,7 @@ pub fn capacity(&self) -> usize {
>      /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
>      /// use kernel::id_pool::{ReallocRequest, IdPool};
>      ///
> -    /// let mut pool =3D IdPool::new(1024, GFP_KERNEL)?;
> +    /// let mut pool =3D IdPool::with_capacity(1024, GFP_KERNEL)?;
>      /// let alloc_request =3D pool.shrink_request().ok_or(AllocError)?;
>      /// let resizer =3D alloc_request.realloc(GFP_KERNEL)?;
>      /// pool.shrink(resizer);
>
> --
> 2.51.2.1041.gc1ab5b90ca-goog
>
