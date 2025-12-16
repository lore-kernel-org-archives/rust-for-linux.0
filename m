Received: from mail-oa1-f65.google.com (mail-oa1-f65.google.com [209.85.160.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281452D877B
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 19:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765913195; cv=none; b=FazHa+qa3wR53iJfXC+t97LzBA0f9kHztDcHp9wKx1yvFlXkVtEq0JZj//6ZwFRB/I7alJSb6umW8r472D2KHaLgzntvSYjie7WZV0HaNyrYvThS3SYlMiJBYVLfqn5KFCMKM8b4B7md6OCYlMmB/Eg5zr6c7bOQ7d3Rfmc8FU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765913195; c=relaxed/simple;
	bh=3tHXMsm1OCt5YZdYzFG9w4kHHx4igpk85I6TNsm48BA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmdJ2ZpgGa9O3dwxwIHV6c1bdLcoY3ej+Gkk8DtkYJ0C/ZxdEDGaRRcjTMroQJV5IZD0FPbOJ8nURtOowIGkFS1VVQurqHybqyCavT6hKNNlvv+pUiKRyRwpbOYiqXDDTUsr5MTStAJDTP93q9H6f41MoEBqyAR7D+XVSwYV+pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwRYSAod; arc=none smtp.client-ip=209.85.160.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwRYSAod"
Received: by mail-oa1-f65.google.com with SMTP id 586e51a60fabf-3ec41466a30so3948143fac.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 11:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765913193; x=1766517993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/zjAAqSV56UUsntmodF/ee5Fb5KCcdP290251Ad1szo=;
        b=EwRYSAodDqvAF4mz7cGTQvtL31n4lSVy+p4PF9ZBMoq5n+nQGFE3WG1KFRWOjB8HDa
         C3KtECLrZA+dN5+nCOEGOXT3EJG66jyeGL4f9j3hdS/IDp9ZLWEO+rwH2+IY4OGxh14F
         K969QJu18bLntggeLeUOEDq6+CZfIMLAEQzzizZAfydqYIba7VDSBSDIC6fRSXwN+iAx
         vpvfV1YWccNwzdq/N2XeQ2RRlc0I/t3Brj1qfL1ObSRWwE00Mu3o/iBqspLiu6JZIFew
         26W3YxqHNIUol56PJjEU6Zb5y18WMqa8Y8dSRG7wKZ8gHWGxcXMTHK9OVFsJvCwSnTbD
         VF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765913193; x=1766517993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zjAAqSV56UUsntmodF/ee5Fb5KCcdP290251Ad1szo=;
        b=Gyg5aF5ADY5qaQwx8susl2n44BC5lSpQGfNG5LA3GR80AdVyf0VQXbkaPPXpaFEbjB
         vxegZM3HICpTth7vP0OyjmrHyyABpV1r/9+6bWaBA9yvwL+HnNHzmbZjB3jEGSRKWHHD
         VnAmFef0Tvt48fq9hmhtmGYmOn7m8t2fgCPJlETZvEOyj4h8yUiPtXoFWcRiHHLEIuH9
         lgaXTWQNtFaOieKH2vD7la9mrWihfNMbjvbUYRQUqkD0GpAHACx/5EfNlJI4Jx2PzYCh
         THESEs0AFcTbFYcwHOnizPANDhYF9g6m5pyPGUy+H3s6XkvTH5PNe0if4laN801LTxiF
         AnXA==
X-Forwarded-Encrypted: i=1; AJvYcCXgGkw4YMFOxC2JMQK+IiIOdVPXd0QfmXhWnwdfJBeocmGkqRu8fnGKZ0Dg2/tkL0RHDvp9XRBCN34RsgB9vQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YypH4rYTBB7F+PZwux4v83lkUDougdeEDRZsYJI8rrDRkQjIM7S
	HpbVibYDyE0505tduRB1uA0QUZ/z97wlX62an1Xwy6IOUhXhOXIGIQewaYY+BQ+J
X-Gm-Gg: AY/fxX5n9m4d3KETOtQ1rgq8vAegFxiIgDfj2uLyhdWI3pKEjbCDwOX5PnExxZ+ki01
	lB6xIxXnkfn0t2/qAxWqsoZc/NfO1Md1xwYPefEbzK+ZRjcZBJJwe0YG3f/pid0RYtI3yfYiU3L
	0KD6XLixGsDopkvlb+IhiVq5LU0ze51klS/7v9G1KTWUUjNAdHe7X7W4y7eZjaCxr+DSD4pXxpQ
	TZh4da2GP+zlxcd4J2/61p+n3ObkRZJj0V8yLj4YB5+vCzmbawI2pxCr/bCOY10vQXHvy48RDMS
	IEwBR4tUtGbR2hleKfXkUoLssLh86Eripyxhjn5+HUfPCAua3ev4ZQXbp5Q3s+LOQyHaYHtu1cc
	3hd2x64XsA6PyeKHDO+9mTxvQD+hutUF5dwf1ehR6TvlIelNpV1SfzsUeNGzjKogMt/PMSbKExR
	xuJxe24gU=
X-Google-Smtp-Source: AGHT+IFMYpXXi8irMmk97Ph/W+8k6q63mI9S570vxddyywsfYt0minQQuMWna1s6EIOfhyTQaj75dA==
X-Received: by 2002:a05:690e:1502:b0:640:db57:8d93 with SMTP id 956f58d0204a3-6447a4e960dmr14167600d50.15.1765907240911;
        Tue, 16 Dec 2025 09:47:20 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:7f3c:658f:3c84:2aa3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78e748cfbf0sm41349807b3.7.2025.12.16.09.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 09:47:20 -0800 (PST)
Date: Tue, 16 Dec 2025 12:47:19 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Nakamura Shuta <nakamura.shuta@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: num: fix typos in Bounded documentation
Message-ID: <aUGbJ7IiFd1T9QZr@yury>
References: <20251204024336.246587-1-nakamura.shuta@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204024336.246587-1-nakamura.shuta@gmail.com>

On Thu, Dec 04, 2025 at 11:43:36AM +0900, Nakamura Shuta wrote:
> Fix several typos and grammatical errors in the Bounded type documentation:
> - "less significant bits" -> "least significant bits"
> - "with in" -> "within"
> - "withheld" -> "upheld"
> - "//  This" -> "// This" (double space)
> - "doesn't fits" -> "doesn't fit" (2 occurrences)
> 
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1210
> Link: https://github.com/Rust-for-Linux/linux/issues/1210

This prints the same link twice... Does that worth it?

Regardless,

Acked-by: Yury Norov (NVIDIA) <yury.norov@nvidia.com>

> Signed-off-by: Nakamura Shuta <nakamura.shuta@gmail.com>
> ---
>  rust/kernel/num/bounded.rs | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> index f870080af..c3ee79ba9 100644
> --- a/rust/kernel/num/bounded.rs
> +++ b/rust/kernel/num/bounded.rs
> @@ -40,11 +40,11 @@ fn fits_within<T: Integer>(value: T, num_bits: u32) -> bool {
>      fits_within!(value, T, num_bits)
>  }
>  
> -/// An integer value that requires only the `N` less significant bits of the wrapped type to be
> +/// An integer value that requires only the `N` least significant bits of the wrapped type to be
>  /// encoded.
>  ///
>  /// This limits the number of usable bits in the wrapped integer type, and thus the stored value to
> -/// a narrower range, which provides guarantees that can be useful when working with in e.g.
> +/// a narrower range, which provides guarantees that can be useful when working within e.g.
>  /// bitfields.
>  ///
>  /// # Invariants
> @@ -56,7 +56,7 @@ fn fits_within<T: Integer>(value: T, num_bits: u32) -> bool {
>  /// # Examples
>  ///
>  /// The preferred way to create values is through constants and the [`Bounded::new`] family of
> -/// constructors, as they trigger a build error if the type invariants cannot be withheld.
> +/// constructors, as they trigger a build error if the type invariants cannot be upheld.
>  ///
>  /// ```
>  /// use kernel::num::Bounded;
> @@ -82,7 +82,7 @@ fn fits_within<T: Integer>(value: T, num_bits: u32) -> bool {
>  /// ```
>  /// use kernel::num::Bounded;
>  ///
> -/// //  This succeeds because `15` can be represented with 4 unsigned bits.
> +/// // This succeeds because `15` can be represented with 4 unsigned bits.
>  /// assert!(Bounded::<u8, 4>::try_new(15).is_some());
>  ///
>  /// // This fails because `16` cannot be represented with 4 unsigned bits.
> @@ -221,7 +221,7 @@ fn fits_within<T: Integer>(value: T, num_bits: u32) -> bool {
>  /// let v: Option<Bounded<u16, 8>> = 128u32.try_into_bounded();
>  /// assert_eq!(v.as_deref().copied(), Some(128));
>  ///
> -/// // Fails because `128` doesn't fits into 6 bits.
> +/// // Fails because `128` doesn't fit into 6 bits.
>  /// let v: Option<Bounded<u16, 6>> = 128u32.try_into_bounded();
>  /// assert_eq!(v, None);
>  /// ```
> @@ -501,7 +501,7 @@ fn deref(&self) -> &Self::Target {
>  /// let v: Option<Bounded<u16, 8>> = 128u32.try_into_bounded();
>  /// assert_eq!(v.as_deref().copied(), Some(128));
>  ///
> -/// // Fails because `128` doesn't fits into 6 bits.
> +/// // Fails because `128` doesn't fit into 6 bits.
>  /// let v: Option<Bounded<u16, 6>> = 128u32.try_into_bounded();
>  /// assert_eq!(v, None);
>  /// ```
> -- 
> 2.51.0
