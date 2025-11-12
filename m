Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E5C2D130B
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 15:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762962420; cv=none; b=AiYiWD2rrrUJHfPvHwfJkTDXQ20fFK5scg+8eTbpkQYiB6bHmta7Gx0DNPSPrdNaAGuFh6SyHZ1vGmugaaIcIvWAbPUjm/7jsbnC/MaZ0ty8f5hDFpeiAuk3x5sde4qtFChRlBOasJronKU4j2vkN4ob17lSYSHuwlwcOiFpv6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762962420; c=relaxed/simple;
	bh=qMFatwH+qRdBCYO6NtS5ZnxlfOaN4aF6q9dvUo7G0fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKNEggvNFACmkoegMsS/6s4Wo6fC0b6hlTcYSMEqNKH1WofKBJeK9Hx/vwP1xB+2yfzVsf0aJH/59eo9lrLL4sGCc65GCz7m/KJvfND23jGw543nAfrLDlfO8ugU0QfklKnaCJWpvqf4dC+Tf3s3JI4TA1SqtOHg6g5KH3dJ4v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pk/BfAne; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pk/BfAne"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-640f88b8613so906612d50.2
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 07:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762962417; x=1763567217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yjaOiSgy5Ro4vm88KAAre5JtSgOsFjJ/i4b/1e10pSc=;
        b=Pk/BfAnemRYgGSy3Nwbao27DuJB/6VC3bxTVz9ZZG8y7+NGaFJSLwAI6vLKqh9SiB5
         VijatWMdgD3z5JC8uBqEwOMY+527CM4KV8rBmWng9XQiCWobMGu9ICzFdsZohjfybqJK
         elkbVbYoM9TtubihENnEN9l+8wxYbbVHrAWIHgrK6GY8h9Lot+IGwcHAehbs9u5uR6ER
         EunFJg5HFmqp1EZr6J+ppEF8loVNsxTmeboaG1JSnSrDOCBQrx0+V/PVkqXYGOKf8Sah
         L1HFqWREreKPjbAdM56EvuBUFa8idqBWTOOjXMSwmQwmgeSpF8fuIB0auefcwfzJ/idX
         Z4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762962417; x=1763567217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjaOiSgy5Ro4vm88KAAre5JtSgOsFjJ/i4b/1e10pSc=;
        b=s9USQXcOgLtwllgk98hZnp+SXKu8xD8pM+Bs2C5lFw0NLPAeP+ZzMtKFx6/VQihfhJ
         OHKcmtpeYHbQTSM+VP21c5O/zfHTOAZiBYYpkEXMYIMsZQuemqjc8QP54W3S9dRo4Pi1
         HvCw13+3x8D6JjqGaxE39ctdPuZIr7nqazuTpzucnygyY7YKyKa+x7QU8f3AAyuSK7SM
         /d//JrKytAyFuDG5GlMQzifXKjdzhAhUFjDzmLh0t04JESIxfORt77ucUroI41aeWD5Y
         6yS+3JsdgIfWroirPmMPaz4TLSmrA5ra6D5L3e3k+Hh5zGbnr1aBA8A/CTt+zcbEQ4my
         4MhA==
X-Forwarded-Encrypted: i=1; AJvYcCU3CR9WdT5ILuCuXu1xoU3L1Mei0sKErPzYLe6Cn4IOAxuYmkRMKQ1XzL5vDRtKX1pT7YK1Xa4NV5CNgzvrvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywcvXZeS6J7bRv84AMfrQZ8s2Ghk30AWDKkMxHkTJDwO5/67U7
	RqZj5wBPvBAAqps7hiqMGH7qfI0bD1pmQFTOMnd3jjiG9HFFjoHyulhU
X-Gm-Gg: ASbGncsRfO2A0fDYo2H96Q0/yOT1/O4AUM+C40PJQllH72eGlzpOcjaFiJElPjEsK+C
	yNtRen6x+ENzslmCi/vNtR1THwSfFn9CfY8jMWrceejyn31nQ3Dkl2WPZCMXdkVe10IzhwUNm1k
	idjn0l86geGypv9Mxck2QisBZ+QpmdUFRe1HH6xJcjIQl5f9KjUmcZDhEm0BXETikYn3HLEPB34
	kVXCUagfEHRtkCcOf8m4zAZhkSNBAvZIuafV5+3sesFvuncOPa39owjzur8WDD5vyUuMB8ir1ie
	6J+HnZMZAz+x3NlaroIuUV13vVWBvQkOGHdv0cdnh0NPhSN/x1tGGpuPhR+AtLIItHfEmJGmwqq
	oB0579ms6dA99D2kEX6IMINREMIXOhPxprYT/6fyFm+h/MM07RUYr/1e9OVwlwMNsubwuN17ZSR
	mqkgfXRBdqgDKftfLzzOT12BJjtloIVjGI
X-Google-Smtp-Source: AGHT+IHbAQTZP8cf5QDCra25NqFo3B6ThRnT0eE9+zyp+K6kNxF4aWBLjWEpCIerYpvI8+Ev5tdvVA==
X-Received: by 2002:a05:690e:4289:20b0:63e:3011:58dc with SMTP id 956f58d0204a3-64101a9c447mr2465584d50.20.1762962417453;
        Wed, 12 Nov 2025 07:46:57 -0800 (PST)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-787d69ba6cfsm42457517b3.34.2025.11.12.07.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:46:56 -0800 (PST)
Date: Wed, 12 Nov 2025 10:46:54 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/6] rust: bitmap: rename IdPool::new() to
 with_capacity()
Message-ID: <aRSr7o_MU8zWAdLL@yury>
References: <20251112-binder-bitmap-v5-0-8b9d7c7eca82@google.com>
 <20251112-binder-bitmap-v5-3-8b9d7c7eca82@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-binder-bitmap-v5-3-8b9d7c7eca82@google.com>

On Wed, Nov 12, 2025 at 12:47:21PM +0000, Alice Ryhl wrote:
> We want to change ::new() to take no parameters and produce a pool that
> is as large as possible while also being inline because that is the
> constructor that Rust Binder actually needs.
> 
> However, to avoid complications in examples, we still need the current
> constructor. So rename it to with_capacity(), which is the idiomatic
> Rust name for this kind constructor.
> 
> Reviewed-by: Burak Emir <bqe@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/id_pool.rs | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
> index 8f68b45a3da1f62dd0d010480837de49b9a343ba..90836b05c6155f98ab8393c8291749f408dbd4da 100644
> --- a/rust/kernel/id_pool.rs
> +++ b/rust/kernel/id_pool.rs
> @@ -26,7 +26,7 @@
>  /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
>  /// use kernel::id_pool::IdPool;
>  ///
> -/// let mut pool = IdPool::new(64, GFP_KERNEL)?;
> +/// let mut pool = IdPool::with_capacity(64, GFP_KERNEL)?;
>  /// for i in 0..64 {
>  ///     assert_eq!(i, pool.acquire_next_id(i).ok_or(ENOSPC)?);
>  /// }
> @@ -93,14 +93,14 @@ pub fn realloc(&self, flags: Flags) -> Result<PoolResizer, AllocError> {
>  }
>  
>  impl IdPool {
> -    /// Constructs a new [`IdPool`].
> +    /// Constructs a new [`IdPool`] with space for a specific number of bits.
>      ///
>      /// A capacity below [`MAX_INLINE_LEN`] is adjusted to [`MAX_INLINE_LEN`].
>      ///
>      /// [`MAX_INLINE_LEN`]: BitmapVec::MAX_INLINE_LEN
>      #[inline]
> -    pub fn new(num_ids: usize, flags: Flags) -> Result<Self, AllocError> {
> -        let num_ids = usize::max(num_ids, BitmapVec::MAX_INLINE_LEN);
> +    pub fn with_capacity(num_ids: usize, flags: Flags) -> Result<Self, AllocError> {
> +        let num_ids = usize::max(num_ids, BITS_PER_LONG);

           let num_ids = usize::max(num_ids, MAX_INLINE_LEN);

>          let map = BitmapVec::new(num_ids, flags)?;
>          Ok(Self { map })
>      }
> @@ -123,7 +123,7 @@ pub fn capacity(&self) -> usize {
>      /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
>      /// use kernel::id_pool::{ReallocRequest, IdPool};
>      ///
> -    /// let mut pool = IdPool::new(1024, GFP_KERNEL)?;
> +    /// let mut pool = IdPool::with_capacity(1024, GFP_KERNEL)?;
>      /// let alloc_request = pool.shrink_request().ok_or(AllocError)?;
>      /// let resizer = alloc_request.realloc(GFP_KERNEL)?;
>      /// pool.shrink(resizer);
> 
> -- 
> 2.51.2.1041.gc1ab5b90ca-goog
