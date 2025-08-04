Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8688B1F1527
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 16:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754323871; cv=none; b=CwXEcgokugwq4y8yeHECu20yhPB9zT3FOjFUtNyX6UcMpVgOcy0LcNrPQ79nkGT7Iyex+D1pGmt7QoRXYizTFcsCG7C/xaWo4rbvOIBHSf2qm23VfyMuhhYZJv+8DZVXONAF1QnIE0hoDVtxxGrl8/BCq4j+IRpoZ72G/PbCkwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754323871; c=relaxed/simple;
	bh=4P3uqKrz75ngOrJjvr4Hoarkt3AuGy4nwung5e4uNXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JEECF7xzw63JTlF+7T5ZkQZFBZNtV1ib0d7Xs/EhHQ8saqYlyjSocBGkFWBO/+FN0D3j8RFjQHE3h0NKaFH81DqBWQzKcuMjxfOL+lLPUZCVQcAp2zt7J0JhjjsSfyp7+QE0MQzyCH1Pgsh4K7Inq6u+h3vvaz0vlX9En/UUk2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jSMGrxau; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jSMGrxau"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=4P3u
	qKrz75ngOrJjvr4Hoarkt3AuGy4nwung5e4uNXI=; b=jSMGrxauisB7EUyfw0hp
	8HhjGG5Wxjf29LxAIer8rn4Ld3ro60PCb51CBHIqcfPIyyS3yN5FnJ7wFPXGTIjl
	oV8a6oCZV5q+B8X92zkzrzvc9qjypPwow/qpi2erOpEa4Ra3VpOOK0vDXQZTh8UP
	T6yC2PTs+ofQivqU5DGfl4C/IoJoNYzPPdOyJbvV2MxB2VyMlw8jNkwA1z+9ByAt
	uVtnqIFj7T/LUXbPTmbJhSQNU6xVQEfo2Sr1+1Ep55hf/6F+Ettl+KHeHbhq1XqB
	gQbxa68JQIZgKgekvQD+lVNvg0RUs6BKlPMGEPZLbNvEUrdHrMSI/rj7GmCDJ2dS
	dQ==
Received: (qmail 2016372 invoked from network); 4 Aug 2025 18:11:04 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Aug 2025 18:11:04 +0200
X-UD-Smtp-Session: l3s3148p1@aMK/Wow7AtAujnuw
Date: Mon, 4 Aug 2025 18:11:04 +0200
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
Message-ID: <aJDbmFx3QAm-TY4L@shikoro>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
 <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
 <08e89f95-6c95-4998-988c-e25f3cbfb389@gmail.com>
 <DBTQRIGWJDYB.2VNIOFWLKZFG3@kernel.org>
 <3e53e2c8-4988-448e-b2ac-6eaf6d62e050@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4+PJZAIH7dAYl7WH"
Content-Disposition: inline
In-Reply-To: <3e53e2c8-4988-448e-b2ac-6eaf6d62e050@gmail.com>


--4+PJZAIH7dAYl7WH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Wow, that=E2=80=99s a lot to take in =E2=80=94 but thanks a lot for the d=
etailed
> explanation.
>=20
> I=E2=80=99m a bit worried about it, to be honest, but I=E2=80=99ll give i=
t a try at least.

Then, we can also start simple.

If there is a Rust related patch on the i2c-list, I will not do anything
with it unless it got a Reviewed-by from Igor. If it got one, I will
apply it to my tree. If there any dependencies, it would be helpful if
this will be mentioned.

So, for starters, we can use my tree in the seperate I2C RUST entry. We
did a similar thing with the I2C MUX subsubsystem. By the time, we can
move to a dedicated tree, if there is a need. Thinking about it, there
will not be a lot of patches for I2C Rust, or?


--4+PJZAIH7dAYl7WH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiQ25QACgkQFA3kzBSg
KbZePA//QLULYHHuVi6xtcAnpZU6CjxOHIJ6fRFtDoOi7Idut3qJ/MIhDVJhK4gB
c3MP0shKvyFcd60ITTIgXmdImcEstxAnVh0Jr7BQ8aEksQb3NE5uGOuxjzxznfK6
e/jxt0y2E9NyWIDpjsyG94nsR+ZkbLbyl5FDD1AahpMCRLtFLWNigy0B49Q0SidM
xoKHRg/jrUdc0oLn6/70OjE/8b5oL+aAua1ACvOw/rM2eGu7/b+n8G/spqfDLjFD
I15kG10Ylq2cZbhDf7DvwO8FheQbBAkgwt0D5lO486efT3dCU2u0GUpWuZ5Yw70w
L89xHztx7DU++ZTMjkQIyXf/OkjqlrclAFf5nz4ncp7EqFgJOWBIheCIjhUH9pLh
pcdE2w3KmuV6m2MQxLGlMR4CKt6A+4b2sVhfvsROvGYjVgLnMzx/cnDOisxiBSYR
c8/jy3SWCDDHA4dl/tbJ/rQ1xjWrG4hHt+Kp1ILv5LTE2wBwP+rk9W/R/se4zEGi
Is2iEglYfJIK+ozA5eWXbaq2zsW947d9F1t3sGtpEqFH3Zh/5kYjtIVFKfR++vGq
dVKeNBQjOLq1HbCWdAAYqeCTtRSDAdMrVMHLAvgmUQ4/Lkcizdm2/mgI1eHjG9g0
ZmUez9oK1LPtbAwIWdffGW8JoHjYOv19TEs1RWGjTD2LQKi4KTw=
=dWRU
-----END PGP SIGNATURE-----

--4+PJZAIH7dAYl7WH--
