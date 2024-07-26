Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89087176FCF
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jul 2024 11:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721991961; cv=none; b=ULnt0gbCn70wtPyjaF2Hak4qdPcB53BbanxTf1CkEXtjKJEQ5ZugZfDIgoUFU/8TOCwNf+lsol/+c5LUP88uB7d9bglpR/dyfO1+Y7pLduLd9avqGvm1dKktCsxbV8M0Mjp80wZ2xWeDSScbfyoInyQD22S79tZC7hKk/61miGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721991961; c=relaxed/simple;
	bh=/sVicTNfY3cet1chvNxxWo/ZPwMTD06+KwNxAx+VxkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dak659dcBRJtGCJjkpxq81Gn43Lc2JWcIcvDdiRMldUVoxd3h9E/LVnWfQrEPTTJUaB8JPrr1Gf2v6YSPgVAcH6HGU/Dvqe99nrAK+SL52znJ00n4DX4insJTij0GbKLv6WmlxAsnNDUtz+VESBy0LLtx+MGgTwHn8Pq08qPvHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=jpsvj+1Q; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="jpsvj+1Q"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-66ca5e8cc51so23417117b3.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Jul 2024 04:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1721991958; x=1722596758; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hckkNbMLOcuR+z008FLIKbuIPv1ZZE1XmBUhRiJCWk=;
        b=jpsvj+1QqfrU6RpxUyaUnk1qKTfifCukpkVum9XzEwhCZ1D70uT5FVBCZJNE4cS2iq
         1EJIF8a2ydTNl6kP6wAYgMQSD+hAyvtj7vvUBfzkNi0k43kEuiZwFFzDhQsFcKFKbKtz
         c3SAmoerVJLYxJjuzVYWlQKVlyxzJDFyaTxHiv3b0Eqrcb3UYrRy2HgTjXXPJcgLZkF3
         K7f28y00uJfJuY0TKAjrkPEMQRMcOD0ERvfIfzB6xFxnJoB7+/QfnBS2qPwiOz0GTIT5
         GLeNz8yXGxdRyQsG7Pcl00xzTNjrfQqZ/72Ag3cOUj/kaH13xy/mSGPJ+9b2xvt0ys49
         M5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721991958; x=1722596758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hckkNbMLOcuR+z008FLIKbuIPv1ZZE1XmBUhRiJCWk=;
        b=GivKRPe6jSkXUr0w5dOeq3ZXH+jFiZjXbkHB2AcK2BVrcshMvwqXH4Qr95hoGq/k1Z
         FCV5RvtQF92Q3uoFlvVgAy8NXkY68Wgsdg9GwGDxlO5/Omqr4/hTWz7x5qyLRarxNJ8w
         yjPe0kZo9baFjdHJvmzJtitGsFHMwPmFnSU8/GAHENFOipyv8eKEktTX0GSdvPmQk4B4
         mlHXsO+SSKwMse+wb772wzcpAKxc8J3M8/Vu0i0vERVuHp63SOvPZgiOxdM9DBHG358F
         XglUyruxdRaSH6d4GnNS8SmZF9QgGDAdKn3INYdz385Y6hkAGn1b/sS2rL+OPrRy7407
         KFBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6HpI9bljbQO1yVdABKUr2+b2iHGqFz0/D7X5kBoVcHEqkHeEQn2UMPbHjB7OUFPTA2vWF7Qs8V8SFNr/eaEuL8Zoptl1o1CTQYZnxS9I=
X-Gm-Message-State: AOJu0Yxo1GsfD7GnUuKBTHQzCsOerRrtr8mAzma21g9Tq+pyTfaAb4by
	OsvCwCAfTiwDhsjia1kI+LyQhvAmjyPD0uxeerjT0TUQw1wFp/yRP0KRbNWkW6XOqHgo75F8Awc
	ohY/R4yB6l5Ekb5ji7iEx0KfJb146666BXSUVOA==
X-Google-Smtp-Source: AGHT+IH9Is6Tym8XF86g8B+5uO9SsdZqfsnltWUtIJEd/+7smiIsMguxwMrcSPqNtyBKCgcvokKKDTSPDuMXdsI3m8U=
X-Received: by 2002:a0d:cd45:0:b0:651:79ee:d14b with SMTP id
 00721157ae682-675ba704897mr56298307b3.29.1721991958488; Fri, 26 Jul 2024
 04:05:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725184644.135185-1-ojeda@kernel.org>
In-Reply-To: <20240725184644.135185-1-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Fri, 26 Jul 2024 07:05:47 -0400
Message-ID: <CALNs47sFD_GqhXNa7v+eC=O96A+SpPm4QtZ3=GbSxZ4zkTm3Zg@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: indent list item in `module!`'s docs
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 2:47=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Like commit e516211f615f ("rust: macros: indent list item in `paste!`'s
> docs"), but for `module!`.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/macros/lib.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index 159e75292970..5be0cb9db3ee 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -94,7 +94,7 @@
>  ///   - `license`: ASCII string literal of the license of the kernel mod=
ule (required).
>  ///   - `alias`: array of ASCII string literals of the alias names of th=
e kernel module.
>  ///   - `firmware`: array of ASCII string literals of the firmware files=
 of
> -/// the kernel module.
> +///     the kernel module.
>  #[proc_macro]
>  pub fn module(ts: TokenStream) -> TokenStream {
>      module::module(ts)
>
> base-commit: b1263411112305acf2af728728591465becb45b0
> --
> 2.45.2


Not much needing review here, but

Reviewed-by: Trevor Gross <tmgross@umich.edu>

:)
