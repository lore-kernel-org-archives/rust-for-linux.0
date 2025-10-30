Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921332F0676
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Oct 2025 22:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761862029; cv=none; b=fOpJI0tm0J7Psut8FehczEj6Th5knoehhaQM88lZeBN9ReJ4QZQegIZABC2wM+CqLXuKiLQFYKqymZ7uTj3Ach5WEpg3Li3DY+i7m0TPv925EMcEh5WvSpWzq/D+OiTNgd+YIP9Bwks1dxGMpIGGk81EqqLG9z0AZ0h1K2ivH+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761862029; c=relaxed/simple;
	bh=cM5UgoO7go2rE7T8BZEbNJTCGD0wetmJNdz4fRUhSBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ql7CP+TYBNv6ijgMxNX9CIPpsNSU6fOlSuKfBzKBq9wVeK46wzEWzTLzuFYW5ERUcsD/JlGSQOaH+OReHA+lbs4lBMPphftU61p52xnAiEYkoXzWwTFpcF6ve/aEOlMLzR8LEtv0Jq60GFIxUOZ5KCERtMs2iZ2ILoYuTM7srJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XqcxcQzZ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XqcxcQzZ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b6d78062424so210376866b.1
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Oct 2025 15:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761862021; x=1762466821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R7VDAtmUsZqMlwI/PTPaPA8FAzUrtYhiM6kTYyXudhE=;
        b=XqcxcQzZsIuF7Z9eY4vu6l/8cFSBnhsnRxUbbvAdHglPqdzjfa0UYrAKvQuHo5iSGn
         bW3sA2LgtZUMQ2JXh989ZA7H/qo2pCKYEgmxtxnt9j5eEGS6UeTNnUYWlz6po54Q6oXN
         wpSHUkPCwKxWio2aUryhQdncZgg/TlesguQxf0joioAuwNDQQCn2K08kmapjAuK29HH0
         /8MTLGXZucXTyXXR/4BRbdxyhSS1tjKfefMaMCnMzcVfWu3UF8AnsmcMl7+JRwuuIXlJ
         YSymN/MAHTbI3ma1ShhxWyyAhxwHRawP334oXYXsakp6m+I65NTLWdoKwypM2TkUSBnR
         YaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761862021; x=1762466821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7VDAtmUsZqMlwI/PTPaPA8FAzUrtYhiM6kTYyXudhE=;
        b=G7IWZJYt5s8Vo8pqvrNUaYr5unZ/rNpHyxQyzIThHn/baZj2kV1O9mKDTq3dlKttR8
         F3FNRLRUHwrczd3si6JlQyOyeu8nKRsth0MIplOk30AN1TL7SILq3dTndQQzMejThnwF
         CjUCK0jkF0YvEdDioRofIwwGbkS3Oo3zf4v528isKXxN82HUqDYVsA979cyPnuOdYFWv
         rJVOorgG1amrp6odfoUC1ErbcRoFiJTt2dgD9gVoZ7dLDBdNoTPepxK/o5YSN5R0yKfM
         qtn4PJEi7RBm9APIKGoltJP8cmTwOfkEnqLBWn6JPkegE5yCPo6ZGsp+Es4p0z+asJWy
         2UMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMA8nLjx5B//rpowT1SlE/TM6vbjtxSmzxHZS0nkasz+oBznhqPO/Fe2g82eQZqouWOYG4j1/nKhvrSU1JIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsDbaiUmRW0PC2kaUAjrTBqZos6QD0LqiwAOKLNYlxp9y8MtP/
	1WTc4fraKVlrgPDELyUp2zeqt6KeeuyAMKf2TXBxt5OZwJhg/rwSvMWxTTXI4Gg4pbO06/MYeKp
	QxWR1
X-Gm-Gg: ASbGncsZhVek2tkDB3oIEWdM96HjfF/qVbt9k98smEq2C409UPlk6JJtYC5C+ou29o6
	tIVjvt1peLZJjm/40+jjJprlHRFYk/Q21mu48uJN4rF64vrbBjjNVerYnb29JbD0tkc+pZBKvCG
	ciOyBmzY6Mo6cDGRT6yAhZqmsRFCfcgrXlnMrbpmZBhhyLnJlGHo+XOi/PylCx2aGw8xg1lQ/JL
	uxbAESU53VW3M4LF1tq+5o7FrqkvM3ZZo517ie6PfX4P4zJQnkl6Jp6KuuZicIc6H9Hgw1iYPuW
	CQQNOfUQ4P0ZtvfTRRVseRq8RiZy9rHNhFgNO5LL5jeHCtShZuN/WxtcyAQCxHrBXvFcJAJ+hgu
	F4x6iWoGXFkCRNqLbefYtK3efuF0QUD0fPXoP5cFYmnXQ/oNv0FYDDYpyju+sXjYHvVfSTJ9yFX
	8fi9GBLw==
X-Google-Smtp-Source: AGHT+IH9eCQJTs+bhi7CI6SroWMhn/3mdEfGkB2E7DEbuVLquzoetKoSMx33oHVxd2NAWHRemdfmPQ==
X-Received: by 2002:a17:907:8693:b0:b6d:2f32:844a with SMTP id a640c23a62f3a-b7070188912mr115508366b.22.1761862020683;
        Thu, 30 Oct 2025 15:07:00 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6407b427fb9sm41824a12.23.2025.10.30.15.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 15:06:59 -0700 (PDT)
Date: Thu, 30 Oct 2025 23:06:55 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Subject: Re: [PATCH] pwm: fix broken intra-doc link
Message-ID: <7e4oucjmnxaike4jnjmsdvwnc6hif4koww7al6cxeymccb3rn6@5blaoo4k5pfh>
References: <20251029181940.780629-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hug6oxx7fhrrhezp"
Content-Disposition: inline
In-Reply-To: <20251029181940.780629-1-ojeda@kernel.org>


--hug6oxx7fhrrhezp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: fix broken intra-doc link
MIME-Version: 1.0

Hello Miguel,

On Wed, Oct 29, 2025 at 07:19:40PM +0100, Miguel Ojeda wrote:
> `rustdoc` reports a broken intra-doc link:
>=20
>     error: unresolved link to `Devres::register`
>        --> rust/kernel/pwm.rs:722:11
>         |
>     722 | /// via [`Devres::register`]. This ties the lifetime of the PWM=
 chip registration
>         |           ^^^^^^^^^^^^^^^^ no item named `Devres` in scope
>         |
>         =3D note: `-D rustdoc::broken-intra-doc-links` implied by `-D war=
nings`
>         =3D help: to override `-D warnings` add `#[allow(rustdoc::broken_=
intra_doc_links)]`
>=20
> Thus fix it.
>=20
> Fixes: a3d5a2b8da94 ("rust: pwm: Add complete abstraction layer")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

I don't consider my tree stable, so if you still want to send review
tags, I'll add them.

Best regards and thanks,
Uwe

--hug6oxx7fhrrhezp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkD4X0ACgkQj4D7WH0S
/k4eFQf/ZjsorP2D+YGhhk8euCCluVFbuQEubtS0Z3Je2gFlkvzRE0D18hod09MU
TwAYRoSCd2wfs2EEB2EKgUBhXF8pJS/19uXB6SaM8pMR3FSgd2QSB5ciZXB3qtH3
edtBZAhbnVOXdT4bNRC/qUXXtXKFjZdJXTDkuREy8pA5NX6r5qRdOcgodUGXyCpA
Jv4uUNhZnAlUsRgcHmg6bFmPFSlW2rEEpfEH5dTViBFp3SsdkLROP85EL+n0fX5W
Mc3ETvq6/pbBddJH6IJ/lHj8BGryCPxlp88e4LGC0FD+X3utOfjZWt2IR0A3k4Ds
+9crP6VCHVDWLH9EFTgTAUFRpjOy0A==
=SgWV
-----END PGP SIGNATURE-----

--hug6oxx7fhrrhezp--
