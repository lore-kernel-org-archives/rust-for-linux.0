Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEFD634
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 21:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754344662; cv=none; b=AWIjd3DfYXRsoUZ+bfSxRQa/Utx7zLk+MBbvAVvlRBXXJlBcv/kbEK00Bhx1T/bBiNukMMXybPqKteNNvWA9XCdmbB4FTY9B0uA5QRVu94HJeqNJhPJCN9BFsyUlFWlRn7BMMqF8vXqSamTv5jxS1anCwy38YwvPs7tekKP7z5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754344662; c=relaxed/simple;
	bh=+os6Lim4WO1r4EN0+C1XSgvIjI3Px4E/Ifo74/QxMVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slOWpvmefYFu33/QX7DdyfVQueADJ54fwS1DcglmvgF0tJXhJyVWYy7F+1etJXZdywDZ+40nt+IiSq6dQAdyXHG3CVezd7ai0WPRXqDTjXCK5F+SMnqhU6qy3UN29iT90XuZYn1K1FGYaJGmXaj/AnkTav8ZjdCUlxw7h3Rro98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Zs+8fVcP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Zs+8fVcP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+os6
	Lim4WO1r4EN0+C1XSgvIjI3Px4E/Ifo74/QxMVA=; b=Zs+8fVcPOFAxDal7LEn/
	bzYqZNnUgN0HZSGDBs5/GxXGBDIWNx9czvb2iipU8XT8k2r1gQI6WHfxTURmHrS0
	ZO6wjn0XgYcWWyLI4vMeP9QUlSEtveF34JtxSEf6Dda7r0MxVng0B76oD0uC2KoZ
	ITvk3T1rOeCVUUM6q9blNq9HUbRVrRFd34wUfIlt8EU7MDLuEgSja3aQfb4Vt/S5
	xlgM1qwFu2UCoof3vj558IIBac71EmgpyOESKB7O9lleuaiAWvtgd4t/neR0ezR9
	gauEw3mq4KJXdMe07CAiSsN367whlZ0GYU2cblyuLWOJf8jrgKgFwQzfc6kVlIiw
	wQ==
Received: (qmail 2118624 invoked from network); 4 Aug 2025 23:57:29 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Aug 2025 23:57:29 +0200
X-UD-Smtp-Session: l3s3148p1@Y8ihMZE7WrMujnuw
Date: Mon, 4 Aug 2025 23:57:28 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver
 abstractions
Message-ID: <aJEsyBGCOlqErYiY@shikoro>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
 <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
 <08e89f95-6c95-4998-988c-e25f3cbfb389@gmail.com>
 <DBTQRIGWJDYB.2VNIOFWLKZFG3@kernel.org>
 <3e53e2c8-4988-448e-b2ac-6eaf6d62e050@gmail.com>
 <aJDbmFx3QAm-TY4L@shikoro>
 <663019c6-af05-44bb-ad9e-3b88cbc399a8@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zyuoGotJDhVfr3fh"
Content-Disposition: inline
In-Reply-To: <663019c6-af05-44bb-ad9e-3b88cbc399a8@gmail.com>


--zyuoGotJDhVfr3fh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Anyway, as far as I see, we can always adjust the workflow later if
> needed. For now, we just need to start somewhere.

Yes. So, if you send v4 of your patches, please include the linux-i2c
list, so patchwork will pick them up. Reviews from other Rust
maintainers are welcome, of course.


--zyuoGotJDhVfr3fh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiRLMgACgkQFA3kzBSg
Kba+5g//RH5qLN9Nc8QtpH6y3ba8wd0E7i6sqrnE0B3HKW4KfWAvT7tiuL/IbiHp
tIIq14Etm8ssiIkkDMtes/3BBjQVK2/VFJHu1Jsp6CXhgTH41N+X8tZjFt0fHSBI
5cKwoKADmh1YH3mJmlU9AmfCVzlUsIyG0wGbN8shAwGGlmTd0KcKzkM18MsBWnAO
YhkYLvmyFuy2qNcmYGhE1zLbd+IYck8t5LB+vNbJqEgXBADqOyikPs2PR46oL08S
WsckuWFcfCmSS8leKbZ9cau+gM9vVvKLu7X1FWgTysRS5sPpEHvkIi8NE1nMo5nT
43hYLQe6DFpkIadODVO00R8VX4+0vlXcaKbHStmUTrVqJBOrTxIpF1AufVaSmNbO
gdP/yQQh8oxdjng+R09d4MZcNMz7t3j3oxP/XCreuBbnw5PBFGxb45WqYvAdN5ZI
Qk2KTucaSJPTcc6eJfbMHpDp3emhOMCekPGKlqtBke4jGfoLWoezK7A9lp7Q7LTp
6SD50MK4mhAu0FP0xoJywHVb82wD1jctiN7ITvd2gyrkjO3sksf2TkF7h7YX1+vT
6lCvlLirY2viMN153IMLGagoJ8z9nACnebYXrJgSMqj62c+G08QlQsm+XSjeDNGd
3Csp/nzYz+mcLXCPBOGtbkcCKZW2Ax7+4E0RLljB/Qb6eQ/HR64=
=ONNp
-----END PGP SIGNATURE-----

--zyuoGotJDhVfr3fh--
