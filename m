Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF83214F70
	for <rust-for-linux@vger.kernel.org>; Sat,  2 Aug 2025 12:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754136865; cv=none; b=bCvtIHRogfs2VCfbd+DJhvdkSZqkYKyuCVP0Qy2uOeClNXaxs1QvkR53SKsiAl/fMoNtfI3S08T78rNjmn1hGWVkvmagGxb3CRnMUVH06H/EaNqvN81p1sASw+beY5QaOBX86PPc/M+jDONf6z6Y3ZEND4MNu/BRy30SmQG237w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754136865; c=relaxed/simple;
	bh=70juT2PR9xXSMLORjtozow2bn7IP3spK8Qsbl9bn9xE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdClVU7eEPQj2h11Dq9G637EHB3Tb2os9l/FHVyI8HRK8j88IQuXtCu/+3AhfRx2IUAErNnXrPf8lQshxYZaekn0NLvtnnENux6q5zV+vgs7Qwz4YvzjjX6/v5SCIj42YVBcZTsvBfbzonMWNSn66mxSlg90nBVZANIo/ckjmvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=F0L2d49G; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="F0L2d49G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XVxu
	kVTDxiH/oST5FdjzaVqC7LnKA+guXeqr2Lg+IM4=; b=F0L2d49GA/YlmdREnNfA
	jfo/BwLRqBDKnKFzmdntuSvQGOcil7VNg2ik/xFFc0j4hJUlCNy6L+HbE79kcSQG
	Tb4sQAVmPDGVfX8bVG1dHBzftdNmDQ1bZRVGnnr3ibJs8mgf02cZO1Fcq0LMauVE
	lt6iOYAtVlPhoCM1MVBvVY63vw0XgDlsvHf4RIfSfMENNKvj3nAtJ+fIQUnh6ver
	FbJ1VQGWvqC3wDJqA/3Z0vlK6DqV2R1Clec2YOLsMGs8iPH3SsI3FEub3Rrnp4Zz
	APIhQTZhhVFRlbsvvNkYl0IfaDVYQVvLjJ/ZHBbh76UOBwObmDt8UsWvk5DVOF6w
	sA==
Received: (qmail 1189697 invoked from network); 2 Aug 2025 14:14:16 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Aug 2025 14:14:16 +0200
X-UD-Smtp-Session: l3s3148p1@Jd8z0GA75rsujns9
Date: Sat, 2 Aug 2025 14:14:15 +0200
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
Message-ID: <aI4BF1u5J1cTugEJ@shikoro>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
 <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
 <aI3VN8WxZeu_DN9Q@shikoro>
 <DBRVV7MYEJD8.2LNT14LTDOXSE@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0ZDdSurpyWCnk74H"
Content-Disposition: inline
In-Reply-To: <DBRVV7MYEJD8.2LNT14LTDOXSE@kernel.org>


--0ZDdSurpyWCnk74H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> Maybe it would also be a good option to take PRs from Igor? I think it co=
uld be
> a great way to get in touch with some of the Rust work over time without =
having
> to commit to maintaining it. (Of course, this is entirely up to you thoug=
h.)

Makes sense...

> While I encourage the above, one fallback alternative could be to take pa=
tches
> through the driver-core tree -- at least for now. Given that this is a bus
> abstraction and hence most infrastructure used is generic device / driver
> infrastructure, there's some synergy.

=2E.. especially if the alternative is "only" the driver core tree. My
tree makes more sense then. I thought there might be a more fitting
"Rust" tree. If that's not the case, I can pull from Igor, no problem.
We will see how this goes dependency-wise.

> >> > +L:	rust-for-linux@vger.kernel.org
> >
> > I think it is worth adding the Linux I2C list here as well. Other people
> > there do speak Rust.
>=20
> Agreed, maybe it'd also be good for you to be listed as reviewer?

Please no. I really can't review these patches. I will have a short look
at them when I pull from Igor. If you need my experience while
developing, just CC me in those (probably few) cases.

Have a nice weekend,

   Wolfram


--0ZDdSurpyWCnk74H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiOARQACgkQFA3kzBSg
KbbBghAAsbE5n2OodulYBmSO3aAZejsvvW8UdYvfnvUgvHiQGxhLiJBSlD3Sukvw
UTiGadY3iH4DxTAcl+x85yHzC4Qnj0uU093RN57MX47h92cftpklNNrh9ozpAeUT
x/iv0WYGeCjCunFSrnl0sG8iptjgJlZ/Vsy/hq41aTbumCj8XmmFxmnolhJUAZA6
ab+W1zsp5VTszdNlINKTeodx65UgHjyJMeJU+bp99DeDp1PPgMskVWxQFAXrVudX
KeM60vGK/oHTN8RaKJ+r8pK3As0A9d7zd9buFX9ICDKtHP1CIEtj2KMtdNCe73Ft
KNSvdi92ZUvy0LYbttF2e0hQdDDejacRTGNVPkiszE2lEjygHZtE/1qS5lPgdykf
46yt3Gvu1hqBhjbdBVtyzjOd+ZLLQwxkw6rhipFPuJtcWH42f4yHgpVbnthUrZL8
ZvxKgwpp7UCmB5QQ0IOgc0OeXurM9yGzEGHS+O/zb56RXIxppbQvE5TJ0UKQ8yQ9
OH7MMn8MibahQscFJy1LiKQ0f0DlSli2yKNt0FuS6/pYknPT+HEHJEbQ8+vpPHEB
W7djVnuVJcLvN03izETNRQrNfQdPI8ZRELhTaT2MXPva7XkhEWvKU/rdBGegdYqV
8prCtqqgv7NKhlX3LQWV8gz8LiwKgOqUi++E4U3pWQmnO6zXb/U=
=fYOJ
-----END PGP SIGNATURE-----

--0ZDdSurpyWCnk74H--
