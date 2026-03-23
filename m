Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10A81A6807
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 16:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283669; cv=none; b=HZllg+F8SyqYvIp1QVzVOUkhXvs+172ij++21/p8vd3TuqfSJaJaxPcjuTPgkaGuyxeWd5MN4+S/IO6bOITqDgHfAnLvdmY5LHht/2jmEGY1dttH4li5eGy6ZrbEWnxS9Rn6/WWtqAFFIVQ7lg58+XQNFt9ANX5fmwVdneVkn5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283669; c=relaxed/simple;
	bh=v5CkPVEe0Kwf6E8N9mLRhZzkvJ3gzrPY3z3Y87SBGR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6sFwRMlGvqwp2XRTrNnORPxe22qgri1YbCcTXg20Qfx1KGGgIUZy1PKIVXdBxRTL4m0VlO6T+PoevWmUEN7ul8CBacCLdqh85E8bJH1eaCvV08w97tlKWZCE/z+nxxXM2djiaJySXce2X3BIV4xvVbOa2gmUi0itZgIW0Q7SKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VKyG8nUa; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VKyG8nUa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=opm1
	DCArKYus6xsrqNcegV6jxbry/zznhjUKRwBtwRk=; b=VKyG8nUaaqHQlyRISV0Z
	tMgNnEihONKjF6wzAihv4pxqpIpsmEhQ6oWkLrYaipkHgVM66V4ydW+Yay8F/pBM
	/bq62T3urar4k7cm/9JEkgHwaQBl3Sr8lVuSRX1bTJCY0tPycCkN0hv0pfpIspxq
	cxL95jeoITZi8LFrBbH2jRYF8MHIagWE3oVwK/BQmdyI5E1tTqf/7fvsDgO+eCxE
	WHgugf3Mm9JiIsSoLiDIEXdS2QR9y1BKNy66oTeB7ryikcbWY3L4h1PbSqWchn7p
	CRGPJME+j9UNZfLXP5ai7CRSV3PSgaDGs6Rcclk9MSUrFfoybyqLZPx6l5rST4B1
	pA==
Received: (qmail 2745228 invoked from network); 23 Mar 2026 17:34:22 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Mar 2026 17:34:22 +0100
X-UD-Smtp-Session: l3s3148p1@5apum7NN5NAujnsq
Date: Mon, 23 Mar 2026 17:34:21 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Igor Korotin via B4 Relay <devnull+igor.korotin.linux.gmail.com@kernel.org>,
	igor.korotin.linux@gmail.com, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update Rust I2C Subsystem entries
Message-ID: <acFrjfsk1RKsIj9A@shikoro>
References: <20260323-update-rust-i2c-maintainers-v1-1-0744ce44f846@gmail.com>
 <DHAB0HOXQJIV.2ZRJ1VMNEIEA6@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5Ifw2bJYWza162Hv"
Content-Disposition: inline
In-Reply-To: <DHAB0HOXQJIV.2ZRJ1VMNEIEA6@kernel.org>


--5Ifw2bJYWza162Hv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 05:31:53PM +0100, Danilo Krummrich wrote:
> (Cc: Wolfram)
>=20
> On Mon Mar 23, 2026 at 5:06 PM CET, Igor Korotin via B4 Relay wrote:
> > +T:	git https://github.com/ipv6forever/linux.git rust-i2c-next
>=20
> I assume you plan to send the corresponding PRs to Wolfram?

Works for me


--5Ifw2bJYWza162Hv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnBa4oACgkQFA3kzBSg
KbZhTxAAi2zNvw8SV4g39q1A/eygAQQapoLAy67nW4D/a5hagzmecL+HYI9ZmZKM
EqwOngTofcLrOhmmmaFJ7PMajVTA2BOJdMThD3qj+Ras4c0KOjTKOHSAcEvk/T7i
EVQnmiquHFA1HF7JV6Sw7OEfoMnZPAj9YAehGMKPvfbaNej4rn9V1uFYe/EuWezS
lAo9S5IKLaAV9mKP5tZ8dyhkS4ObeNtxynoBKRWKVNQaPD32uYluISxO7KVUG8XW
+wzpO/+5sx/w3rzbRtmobaBiUld8CkbweF3/UJIx5E8uLvzU7zqPUVlBrHUF/6tg
ev6LTzTg7PkNpNYzqzDBfvmpr2rLc+evt848DrOI6mJbppM1xLE/FpSwZLeVfHEm
BggFjovytDsQWvC+MGL8oL4YIlvup3bBDEWaSwwjVvVUngKOVpBirJkXiYMrFlkr
NO4WY73egfm4/KdTq5ZKbwKnm+2hfZG2Qtf3PAwxDFfNlB1MQd0lpFSp77ZnEOW1
VMF5F6HsHYz8UVUFFDq98Vo3/rfUugMiknLMj4r7sVzCJH3m8qYkHg0yg1yIfuvW
ujlW82P4HMIj5MV3IViT5NRSGZV6erjPCQM+lm8kCax/8u9TE8uQZ5dHXwhl59ee
lzLoXjsYzHEnxLAKdEP9f2hdkwhrFuFKei7l3VDDyXavsaA0i/g=
=F9Wp
-----END PGP SIGNATURE-----

--5Ifw2bJYWza162Hv--
