Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0832080C8
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 19:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764617342; cv=none; b=PuGmvDnpbs6J6DZ2zOswVQhifGNIydviSYoNx23ICb6mqiVyBQ3f72I2VEnrQRKc3E6Sj2DxlKRgKRIyspslf69ZPQ5nE5iHesknUEDaUL/jFNeBBs6cVtZc+GSW6MRR19fxINHu0Jk98rClUsm0/CtTVn6487eobyqB8oEn9AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764617342; c=relaxed/simple;
	bh=zfeMB2LmDcZWaYDjv7dMc5Q8/0QMwZt5kUiecWTGvyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dY4glxTnobspUVa6mMVG7v5847FjGhluR+xuHQdzEUx0/GfKm4sujvcQ9t1+lTqHEdCr7q7FA0BZ/ou6UJYx25m7Uupa0gn9bV799b5AKsKKqMYINWtu2gvUOUxrtqh37G5jdXqRBS/XjablClXm1APnTYL+W6qRhg5GCZwbhAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BrSfb6b8; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrSfb6b8"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-787e35ab178so37547317b3.2
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 11:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764617339; x=1765222139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=APljFRXaMCw5fST76I/JdjoAg3NunNjrMcBFSHPBuyM=;
        b=BrSfb6b8Zn0E9ux4nn3O4x7dicge5iSK9nYgBuysy+AFo2EdH/eLpkRdzBok1ewZOJ
         IGOHvLVs1hwoFs8NYcftFeyxM3VDexUSJcWWc0CG7JzboclczRb4XBOK2ZHHyBQuVJfQ
         Le1BbXRj1k9/R/SisTQeDVZy/QbToA6JYtDL0HPGeqsxLjyPjyQ1joT1ZpDy/nd+5iTC
         eQ7y8syQX3SGAMJgcMzfH2iAVuCMxh+DTNjAJ+19ix2CrujxKjJu/O7Hp4CbQD30VPfS
         8LWml3GfzvMKVvJk9dlzG16aLHC+Q7z4if4AnZclNJ6Xbwb9awwDekBuH5TUZyQ3AKNF
         BT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764617339; x=1765222139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APljFRXaMCw5fST76I/JdjoAg3NunNjrMcBFSHPBuyM=;
        b=R56VYVD/V0iK6MU5hZ6dd6XFXqr4Dm2V3htmGQXEilBKUCCyoC9+RUmMuUJWiDzhLe
         dm9eJHFtU/q848CGuf8EDpux6/oP5xMta8LfEu2auGYbJx2X3avwpqZBM9Lin9FUXXpu
         kSe20YDXPJN4JgBruJSfA+sK9z9v7p+nREe/Xyet7YppJvcR9SyLYoXzDUyf/RxBjwEU
         7xnppJujQgJ/uqv8EJ3JVU/ZLPuaIX2VOdSxBPdkoq0GOi/o9LS2YKiBgaUGRAb5xkcc
         y2WoFJWfqWNpEwhHvvbyB42EF3cUAHoiAiuF4lR55DfVNJEUHgNzEKIPJ40KqYyHlYBm
         mFQw==
X-Forwarded-Encrypted: i=1; AJvYcCW2DKSrBEC76pAIJcRVj7PexGC0J/DAwgR+p7Yzx4qdc5t2osLENVFDFt7y2aS1d0JQ+h0gEGWdTIaXoRuQEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWa59riZ5WQTlcYuha66LSNm0VM80vXK/VCizz+5bEsdu4CUms
	TZ57RsgBqhMigMim4guY9nOni4gm0lnUSBATH4Fm+coA4bKmKH076CbS
X-Gm-Gg: ASbGnctravJqinR2XbuZyR7seUqkwabsOAuJFfhAvBei5iJc3rcvQzwdHu9e3d0QTHE
	af1VIsYeP5rOOvkrS50gDREN+fRwqq89+YKhNTSdsyOdW7OJOLMzwDxGgsc+/v+n9ZIqURyk/Kb
	P2Ie++Vf1l+cBdCcxDaF477WcJguhq7s6y+yvmBAV8VCmFt7K87Zt3jyDm5TqLtTy8nneg+q0Hb
	Tb7vmmb0sAk6TZFGbpVkpzKOtsXPwRhMl8CJS0Ny8U2QYdCPJHQDj5P5USvonMFgfjF5fCTeV1u
	s8Jr0LUfr4CwFmnldTA5xK2SoEj2vZXMR7wg6yf8JKw5OZAalZPYoIaEEQaRsASIr0ajv17Ok4f
	HA2TVY+v2kx2trzWQS2S6AW0wxUDhvPg4YQWUDm8z6+rU4pIyki5pLt3Gaenpu4YQzksFqJDROw
	ODwojW/SU=
X-Google-Smtp-Source: AGHT+IEttKn+//7++pOLi55YpQ9X7GejnUD2spd1fxC6Tw+xPr7mkrw42iQi7Zwskp5SI1O4LeCa3g==
X-Received: by 2002:a05:690c:4483:b0:784:8647:4958 with SMTP id 00721157ae682-78a8b56803bmr355020387b3.67.1764617338630;
        Mon, 01 Dec 2025 11:28:58 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:affb:cf6e:b908:f700])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78ad102d25csm53088337b3.44.2025.12.01.11.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 11:28:58 -0800 (PST)
Date: Mon, 1 Dec 2025 14:28:57 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <bqe@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH] rust: id_pool: fix example
Message-ID: <aS3seTNRum3ZXMom@yury>
References: <20251201000949.1626363-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201000949.1626363-1-ojeda@kernel.org>

On Mon, Dec 01, 2025 at 01:09:49AM +0100, Miguel Ojeda wrote:
> When building with KUnit doctests enabled, `rustc` reports:
> 
>     error[E0599]: no method named `acquire_next_id` found for struct `IdPool` in the current scope
>         --> rust/doctests_kernel_generated.rs:6722:24
>          |
>     6722 |     assert_eq!(i, pool.acquire_next_id(i).ok_or(ENOSPC)?);
>          |                        ^^^^^^^^^^^^^^^ method not found in `IdPool`
> 
> Thus fix it.
> 
> Fixes: a5726454470c ("rust: id_pool: do not immediately acquire new ids")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Thanks Miguel,

I applied this, but the fact that you've sent a second fix to
documentation that actually is a build fix, raises the questions.

Because Rust documentation bears compilable chunks of code, I think
we need to enable rustdoc tests target by default, so that developers
will not send broken tests.

Thanks,
Yury

> ---
> I saw this in -next.
> 
>  rust/kernel/id_pool.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
> index 73a952d7dd83..384753fe0e44 100644
> --- a/rust/kernel/id_pool.rs
> +++ b/rust/kernel/id_pool.rs
> @@ -28,7 +28,7 @@
>  ///
>  /// let mut pool = IdPool::with_capacity(64, GFP_KERNEL)?;
>  /// for i in 0..64 {
> -///     assert_eq!(i, pool.acquire_next_id(i).ok_or(ENOSPC)?);
> +///     assert_eq!(i, pool.find_unused_id(i).ok_or(ENOSPC)?.acquire());
>  /// }
>  ///
>  /// pool.release_id(23);
> 
> base-commit: 00c5ce039598e692e1dd4bf2b3ad5bc08bdf3270
> --
> 2.52.0
