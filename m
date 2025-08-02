Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A678619F48D
	for <rust-for-linux@vger.kernel.org>; Sat,  2 Aug 2025 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754125637; cv=none; b=IELY/WdQqQph1zmBY7KO6hotZFW3+pts3letflTOYqBDUy6fPpg+lijn/pEHXl3pM8Zl39uvA5ZlrIVKEnegtpgHErGkArW75sKt6YbV+rgCt4kBVZP1kuxXsUU4Zga5h62EqUYom7otxDKL/2zn2OLgbghU0dpcv6QtqNkUJJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754125637; c=relaxed/simple;
	bh=JS8DWJLoNf76KgE2KPZa9aDkdQebkLzo+63fRLZV5eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLaESTcLZnucf/6VRal6vmUoXPeeBu6wqX1WRrX91ZXDGkvNd8IrEDFZmnlz3dfsiZ+uJa6SC5vi/iBWdkWDEc3htqCZCxoK5AyaeaCRktE/N4t3yX0UfxXPzUUoHazDU+2obUYtnuCzkIZUkWZS/gpIpki42Ec3A+oVX3oiQww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IoaoHBJ8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IoaoHBJ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WnrU
	o/4acUkLHlZAnQ3ycfO+ysk/6h4qrmwS55L5lSg=; b=IoaoHBJ8wDcbG01Ao1Rr
	Ibc8ct6CTqBmNXGRbfQ568DpZSdcqSTsBTWnRjIIzlmP1dJa9oJURWR90fIMZAe/
	gWCJA/9BSHlRJTfY6RNBRK6pb9H8XnB06opHBi1N1W36rlwpFdp2f9vewrKgcAzm
	Up0IxLd+ub6n7SeIRfxUb5KOqvQ9eJBngU1LS/1GQoiR2Mei0Q3BwY/AFZLiv3GH
	uMEntNvrBGPKqR5eiC1Vb6ZOyz1AwVQpQ/dVOt8iGRXezFIEkQj2ELk7tBVHbAKc
	UXo14oUASWEzQfQraEVHMuOfDO77IzWxiyY8XoiMhNfgBiC04/96N2E/SvtDta5X
	1g==
Received: (qmail 1135675 invoked from network); 2 Aug 2025 11:07:03 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Aug 2025 11:07:03 +0200
X-UD-Smtp-Session: l3s3148p1@WPmrMl47gOgujns9
Date: Sat, 2 Aug 2025 11:07:03 +0200
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
Message-ID: <aI3VN8WxZeu_DN9Q@shikoro>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
 <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hsUnxZOOqYL3gTxV"
Content-Disposition: inline
In-Reply-To: <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>


--hsUnxZOOqYL3gTxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 4f03e230f3c5..767beaa0f7c2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11514,6 +11514,13 @@ F:	include/linux/i2c.h
> >  F:	include/uapi/linux/i2c-*.h
> >  F:	include/uapi/linux/i2c.h
> > =20
> > +I2C SUBSYSTEM [RUST]
>=20
> Has this been agreed with Wolfram off-list? (I'm asking since I haven't s=
een a
> reply from him in v2.)
>=20
> In case you just did not receive an answer yet, it's fine to proceed with=
 a
> proposal as you do here. However, please make sure to keep Wolfram in the=
 loop.
> :)

Thank you for pointing out this thread, much appreciated. I think (I
hope) I said previously that I am supportive of the bindings in general
but I can't help at all because I don't speak Rust. Given that, I am
more than happy to see this MAINTAINERS entry for Rust I2C. This part is
definitely:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> In either case, which tree should patches flow through?

As long as you don't touch generic I2C header files, I suggest some Rust
tree. I guess patches will have more dependencies on what is in that
tree.

> > +M:	Igor Korotin <igor.korotin.linux@gmail.com>
> > +R:	Danilo Krummrich <dakr@kernel.org>
>=20
> If you'd like me to keep an eye on this as well, this is fine with me.
>=20
> > +L:	rust-for-linux@vger.kernel.org

I think it is worth adding the Linux I2C list here as well. Other people
there do speak Rust.

> > +S:	Maintained
> > +F:	rust/kernel/i2c.rs

Thanks,

   Wolfram

--hsUnxZOOqYL3gTxV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiN1TMACgkQFA3kzBSg
KbYdOQ//QM9Q6tLjf5xyh5TktJVwJHJRY57D9ajtvP2Nj6fgOnpD8pYsobeV/553
DvoSQU5ajyLyC0U85RgImaWr/JN8T0nK38CEaeTjqBrPImS4w6ggggILkrbRsgVh
vNU8ZBIyrfk3VWiqKX8z1yXL7WINY8bAPIpFJRDQNAmeTndtygoAefOe2npICYnJ
q/hGVwMg1ih0MRvEgICfh9GYkG7Swm4agItr22/zaWKm8OfeR6FP204Tk0AIEA+m
kj15Ogxxo8Y6lkh9J8NpZ5yLffsO5vvTykJG/EvAuF9YMBessTZyqPoc63J2mQKr
+q2QxSot5kVdbYQSGzK2x3zPrMGyijfrCyYqv8Zs2WliV9tqtQ89HT2HbUG3H4kj
B1hc9+H++tfQJfKo/BlPN26UPPx2hjDp6rYq1I+1deWpc+M2rzkJyqk6oN0bs03l
9AscJOF7276Y9X7QrGTSI9U05F7ddw7Z/18yrhO9F42NGgxXX1ydjh3LDjus8eev
bxi7x0DdgkHod4v/25AduWBU15Iik3WYWliYGg7lYE7PSa1CHz3D33MUMnz14MAG
3Fu4hwE+QQGhvqAO5VnTJ7R2q2TWT3vVraeqe1rcIJnkBW663CDsVBIidgfUCLE0
Up5N7YvYYLvbih/jrug5WpgEgF7aZU2bLrao4mnVJP2qSebjz/w=
=Yu+Y
-----END PGP SIGNATURE-----

--hsUnxZOOqYL3gTxV--
