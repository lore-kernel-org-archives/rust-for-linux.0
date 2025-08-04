Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCC04430
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 22:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754344949; cv=none; b=PuycM9XDqV1Q/1V/spcwuiQXG2+ujdiUheKmqE3/v1WiP7vSrRAxdNm+elYbFcOU59wSQoc/eeb3absYAcj1kMfJSk+o0DNCxCaAQut7nC/M/UzGXdPGBVg5K4TwhxLMF7K4qBlmGCqfa19ZPzjCPOoBv9gb87VMiy6j9JDnK4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754344949; c=relaxed/simple;
	bh=u1jV7qJhJ6CF50uVkW8dvFEm0eZG9bwQXYvhnHxlTko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rzx/2HUrj0guSwCjT82u06UTXKpuume7QXQ5G3AvM6vR4eVPQRbbpxeYICS+G/KZM+RSKpjZ1MVvpsTbUbWFnej++WVhaQqf+qEW4fSp8Q3c6LMOSYcjP13JPJlbv/BmLaQIuTnGo3u+oPRx6wNjGQUuRIUmVifbRN71klFHTsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Zj2qTDxU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Zj2qTDxU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=u1jV
	7qJhJ6CF50uVkW8dvFEm0eZG9bwQXYvhnHxlTko=; b=Zj2qTDxUQWBkuC3HPItP
	4oebsmzCMtiOdLPb7kPTJHVOyfjk/rL3K89YIvdSmV6I0+ePrYXVd2f6UD66kktv
	UT+wPWW9ilN3DZA3LR8A32L1TVAHRpgH3FWvL8j8UrjnzAJ2IvaadUPXABXOnhKO
	C4xuOWgNFDsYqZjPVfJRRzHfqZIUTFt60AkIUAvh94CpC0PJGniPvBu2WSlZ3NjF
	ETe6ZAa5YvJ8xT80jNJ4hBBVUYZQdg778/lSAs6w9YUUN1PO9NnedRrrAKJUgxBE
	TYh8GwRS56ByJ/aUdRuRC1OqdvTHHVEC+b5/6OHFkIZADF6yR3rB4B6gd4u3Qv/g
	bQ==
Received: (qmail 3130 invoked from network); 5 Aug 2025 00:02:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Aug 2025 00:02:24 +0200
X-UD-Smtp-Session: l3s3148p1@Ab07Q5E7ZtYujnuw
Date: Tue, 5 Aug 2025 00:01:16 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Igor Korotin <igor.korotin.linux@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver
 abstractions
Message-ID: <aJEtrI6RlU1tiflq@shikoro>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
 <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
 <08e89f95-6c95-4998-988c-e25f3cbfb389@gmail.com>
 <DBTQRIGWJDYB.2VNIOFWLKZFG3@kernel.org>
 <3e53e2c8-4988-448e-b2ac-6eaf6d62e050@gmail.com>
 <aJDbmFx3QAm-TY4L@shikoro>
 <DBTTAEC8HLGA.QYJ0UZOIDYEZ@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vJAKMr/EVj/qThn6"
Content-Disposition: inline
In-Reply-To: <DBTTAEC8HLGA.QYJ0UZOIDYEZ@kernel.org>


--vJAKMr/EVj/qThn6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Besides the I2C infrastructure they require (which doesn't seem too much at a
> first glance), I think we also have to consider how drivers should be routed
> eventually.

Well, I2C client drivers go to their specific subsystem, of course. I2C
controller drivers will go to I2C. But as I can't review them, I need a
maintainer for them. Is Igor willing to do this? Review I2C controller
drivers written in Rust? Or is he only interested in the Rust I2C
bindings? Anything is fine with me, we should only make sure that the
MAINTATINERS file describes this correctly.


--vJAKMr/EVj/qThn6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiRLawACgkQFA3kzBSg
KbZVRA/+OF+jI/MvDQMqVzRtq5elyUZpDlxhtYMY80Vg059OGrRcOrQk/pbTN9jA
AA45RjiU83M/YnET16t9VCOODZzdy7EjzfnIqlJaqaMlzTJEYQvVRN7CeNmiZKVK
JPtuXaqXxb6AalNUlKrpA3LCnfeO6BrCpUBEFF3yC+sda2v5GVo1GrxVODFlKdhy
P60d+l15RxTVC8oUMXDyKitoPEQLHyhibPASFMncfkJUqwoTWIeWRIpo3R5IagUU
GgQKAnPScH8AjADM301o8oKRLdezPUBh+RyP8XnexGlfo9r/S3K28q3e/zbKvS5T
plzg/8f6DYKGfSL2216VJsjYThIeNLDE6U/4L+KDiKl+m9N1WzGtG4ddkdRsc4YQ
XSJlVvAXan9ouG+jTLkK6g5rMGlzFzx0ObNE8qdeUE3q9JFj/Fm9M17g0CoT4Lyp
+VjvX/T5BAKdVE3/3tCZH0Wocr2NCtEfED3HS3U72DWereb/JPus9VjRLMWXx/z5
PTc7GHYu+ynjcChmRxRkBa/teOn45yue5p4Ls5lYDRmm9nRkqKu7anjcQevTt02j
pRAVWqYU7vXdLxpNoCF3k93MscYypa8XsjyiESUXy8srl71pBikbw6a6zLe3leaM
3iBEAx/6spTNpr6a2ALBXCjcsYpNFiqPsSNkXOzQgLod/EVWObY=
=O0pf
-----END PGP SIGNATURE-----

--vJAKMr/EVj/qThn6--
