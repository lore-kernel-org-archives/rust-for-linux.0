Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEB534D390
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Oct 2025 22:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761862228; cv=none; b=hCAXlnxuAM7ugH1lrolNi3zsIKDoNywx2AyWNVM7bPWE6rpwbLvhwoF5XV7oKpXUg/NX/a1nU70jwr0/yzh8lvC1jFc8EhxtLlj8Sz2nXsKJAx60qPPS9qebvkmPiXKcJ/MQ+KuzrPXLBcDeKZdkTZb3pTB7VinDb49PYm6u+jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761862228; c=relaxed/simple;
	bh=yi3VN5iGYK0efOoeR4bO5a0LbuJ3TDjRF5ahHiHQFIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NegV86eeWff1fCIssEccQZ6u7caP4QRjWnQC6oJia5/wzpicjYQGQ3dHt1YOIq7XkpQa8VHIgq85mkxlgkRWSkhFaYTV/z4BBOSVWjBX1N8FsRdEAgRhiBHXsUMSgQFW8otWqWx8LbiouZRPrEm3EhUKj1iUqeQeMShINMwdfUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OzQ9cZTw; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OzQ9cZTw"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6406f3dcc66so2152414a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Oct 2025 15:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761862223; x=1762467023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yi3VN5iGYK0efOoeR4bO5a0LbuJ3TDjRF5ahHiHQFIw=;
        b=OzQ9cZTwp5Kdtm7TZ1v1+LSqhLknw5BJozH/7Jjiz0h+YDtceXWFnk4aXT2T+Vo3oO
         wtJuLnSlYNSMaxQ5LjSqOWs8X6tYxx42SyBGupbRvJ7htcbh71CEeTjx2ubcA88awNMM
         kG/hMK3fIn3rnChkrWtAH4J5sdWeFjP7e5PshZMQEsSuvSGg7ERZNNyBeyEgWtVskLs2
         jEMBVxtZjZmmNxcyGGzPGI0MBvE3qz5MYDYLgAaiXZJQwqmd5S3zWnfOKx6mWDAyquzw
         kDSlfxsXZjj3W8i8Zw7hDtMUKIqyX/e+kBa29t+0t6Sh4NI4N5AUUWOjk7U8qvRy2QC4
         rtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761862223; x=1762467023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yi3VN5iGYK0efOoeR4bO5a0LbuJ3TDjRF5ahHiHQFIw=;
        b=QP4Rcq+y8rHrgp4+JGtbiLj01+30TTP8Z3IN2GNvPoLRsPF01rO9KBQQON76ycFQnB
         DtjFQu6hBZMeIXT5NrafjmwEbkXohm+AARt+sAEytJ6vPzs4GAOeMDodo9umZBq86DYl
         jX7Ahwaeidd6hwoK1eufOMo1rijKMvQ5duzCEm55mK70y/2erlT1IgOb6aPdKI5Xggnz
         xVS94QfuKajClNsk2DYaA/AeLlKKDAGk2HZ4PkZt7wzHHVt5jwk/Nz8P0s27PsL/bJho
         csUUguOf6rIYED291VtQegLvEi7Gr4WWrXSbMRwXDpwBuoLSVq0CuBrHMXWfoK2Y+N5X
         Jd4A==
X-Forwarded-Encrypted: i=1; AJvYcCUhMR9qb2FCM/LUL7Il2ETP1+nev6OIzlkQzI8IqZHXt63JUe0nfiEE4v5PVPmopEgIVZSDIuC6ixs6B0wLQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEF4UZlwYFThQjxR15+L9gNzcw4UtYua34xAAHgu3Q0JKc0BYs
	zDsdaL4aLPsy/RnYAc97f9mprKYJ5lG3xM5BTaIrq/6o5KqN5pQ1Af6BheNMLTQTQ8xmfiEsc6g
	Dvr+S
X-Gm-Gg: ASbGncswJyKObtwJ2vJdVFIOFgMBpaTFmZ9szC2Iq3ygA9FDfHll/8niGVaVtiY9u8q
	XKGeE44NA1asVvRzR/D7KaL9xfql+07Dt5x9LrVjI8a3zA6lmXFWO8og0vj1YBnLANreJ2pNesY
	qBebnqCgaF9f24hZEGRrXgVAn3vRmh+HzJrrweUmCJ2VCKT2VGcN3tbHKD2wuiujDSKWGpGegLG
	fsPtb/c1kIvfTf73l1EgOYgjbc6SgOrvcjKzI/XPHJ1rGCPR+8XOfuWzrL+WPiW8lCv3cozAfdq
	bYF3DwWBI0ABBJTfBUiM5TvdGWuUn2GX/Q/iEaJ8SbDV9KYlOT5vhmPpVWdaC/OAh0aUurIReuP
	FiO7RKYvai/nNhLMoorBVTnO5GTkKULNr1WnN595F2ci7ICNbRTGWuFS/cBfJnxS/fftkuwAlK8
	huMw2inA==
X-Google-Smtp-Source: AGHT+IEr5KfO9g5XB5M1oZw7bGno87HZnZZWw7Q18m6dtyDaC7sCL6xNw6zqoj036IrByLM0+eD+5w==
X-Received: by 2002:a05:6402:3596:b0:63e:b49:c9c3 with SMTP id 4fb4d7f45d1cf-64077082133mr839973a12.31.1761862223219;
        Thu, 30 Oct 2025 15:10:23 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6407b390d7dsm60738a12.10.2025.10.30.15.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 15:10:22 -0700 (PDT)
Date: Thu, 30 Oct 2025 23:10:19 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Subject: Re: [PATCH] pwm: fix Rust formatting
Message-ID: <m3shamaznoachabbsxsknzk3snp7nrkmkwqmnfibbwmdfbhgy4@3seayfxsb7kh>
References: <20251029182502.783392-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="stxqejammn4geqdw"
Content-Disposition: inline
In-Reply-To: <20251029182502.783392-1-ojeda@kernel.org>


--stxqejammn4geqdw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: fix Rust formatting
MIME-Version: 1.0

Hello,

On Wed, Oct 29, 2025 at 07:25:02PM +0100, Miguel Ojeda wrote:
> We do our best to keep the repository `rustfmt`-clean [1], thus run the
> tool to fix the formatting issue.
>=20
> A trailing empty comment [2] is added in order to preserve the wanted
> style for imports (otherwise the tool will compact the first two items).
>=20
> Link: https://rust-for-linux.com/contributing#submit-checklist-addendum [=
1]
> Link: https://docs.kernel.org/rust/coding-guidelines.html#style-formattin=
g [2]
> Fixes: a3d5a2b8da94 ("rust: pwm: Add complete abstraction layer")
> Fixes: 121931a7b4dc ("rust: pwm: Add Kconfig and basic data structures")
> Fixes: fb3957af9ec6 ("pwm: Add Rust driver for T-HEAD TH1520 SoC")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

Thanks!
Uwe

--stxqejammn4geqdw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkD4kgACgkQj4D7WH0S
/k7ZFwgArUy6vPY6bP//G90gYhm0oJvRmV9rUOHtEWSHy7Y+GEm32WlMa6z3ojWB
DHu/TuxL8wOTYetKoEyYOvVeP8RJuRB3y9PX5FUJBUKTan2TyLB6UglIsCOYmICn
KHSXiLmsiXBkCwCiNZW7v/3kFsfBbzL7oGsbGEUOuV9V53F6Eg2vSkmWVQ4TgmpA
IqUvkgohJ/HvrJcXJhy8wrCvKVtpkaTnA4rEtJPyCeGm3EJhitm1NF1VjVg1aT7U
iPgPBELbJYM+X1j9V6lmfaLGNo1wJ5ubgmXzyAnSwuaS5Tj+XOFYkhAwynjOyQS3
L3ute5H0Sj2hyzf7FHvWac/JBcO9EQ==
=IT7F
-----END PGP SIGNATURE-----

--stxqejammn4geqdw--
