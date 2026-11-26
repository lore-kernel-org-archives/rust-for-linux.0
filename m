Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716707;
	b=eIBXZNA2JG5NRD23fNp9KQdAoKPctr/fH7rABv6/mYcsdnXGupRAVrQ6lE65nGN8EZ+s
	 zlnCgCA2pYbZjoLcNJZ9auut6zjERbR8ntCdj2R4OwH6uvkBFK1Ay3/5iZT1r+Ic4N6BS
	 24mGsotTUrV6hmxxWpqZ+7cBkoNjTjBAFH50qVL673lNkbP2LKKL2o/PZRQ1DBDIRGw/k
	 RgAzlbjOIMO5DnP1iBFjxP+tKeLKd61AHOzIFEw3AxJETHWfoMzlRBzEJkxx/YDwDT4hr
	 MPWvxCivpNCvWc0+IeySGLvQEv7cnnA8nbCg22JwBD/bk9JNGEZ438X/G/RtbZfFuwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716707;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=J45DM/79XkDUz+9MFe0paS9NLO9/t5HXTgpgj6CYPC4=;
	b=ZeDbdDIpuTPlJYPRi1oNhjCRHc0pr6C0MS0tc+0qmtl8QKxozjnMKpW5AnXyrKNE7cqi
	 9JHq8ja+1pZ02gxVEMO/+hTqX5yBaHydVWrpw0AWpznyJ1lFSKDDnI2yLyTb5kwBzaVbO
	 uEcCu+yJS8P9D2Dwdg3JZpJcZxUx2bdJ1qm7rqoLZFT7aq5TKGTg+7WFiHgU2z4GaOG17
	 /hVxfrayBMBxkWMpJTRGvyL3yczeNKqpJcvmEmA87WBXUvyUGVIFlFZZzt3NG3KeR4wlN
	 jbU05vUhFgbnzbYMEUq7hIkQHQQCGeqQC0PgmyU4tPX7l4MEUEctmDk77WvXn14hGmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KWTlFatz;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD4C606A326;
	Thu, 26 Nov 2026 18:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DD4C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KWTlFatz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795716704;
	bh=J45DM/79XkDUz+9MFe0paS9NLO9/t5HXTgpgj6CYPC4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=KWTlFatzLtdl87wEXNEn1azFU+URb5owRObPaG8hrTpBK5SzThztCt16mEhvNOP2f
	 NXs+mvOVupJga5wjEgEaBCQWvdHQ68KwKO0Yaqz/THJRQDrrOmYweeZP09QRNxGlte
	 sMlYy7l5YSXb60i7f9NnZrZlZK8i4tYxb3R7OoZztaqabKQj/lReBQAT83btNBANyz
	 hBCoOixT4zFOxIdjaDI20oUE+0VntNuWbnFmHJzc6cQP9BE59njzgSZop37OejP0Wd
	 2tyt4LA9pdMBxyMoEfda5ttiWJlCsCWTdh1quMMxPMKyP3jJcA+13j3tWf4VELIfjf
	 ieKRWkO3rFCqg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 55D2C17E02F2;
	Thu, 26 Nov 2026 19:11:42 +0100 (CET)
Message-ID: <ffb55e45af601f0afaf5071f92e123c81de22a70.camel@collabora.com>
Subject: Re: [PATCH 0/7] rust: reset: add reset control abstractions
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
	 <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Tamir Duberstein	 <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Onur =?ISO-8859-1?Q?=D6zkan?=	 <work@onurozkan.dev>,
 Philipp Zabel <p.zabel@pengutronix.de>, 	linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, 	dri-devel@lists.freedesktop.org, Detlev
 Casanova <detlev.casanova@collabora.com>
Date: Thu, 26 Nov 2026 13:11:40 -0500
In-Reply-To: <299B626E-DC60-4175-9D66-2DE58BA5070A@collabora.com>
References: <20261126-b4-rust-reset-v1-0-9c4c3d029080@collabora.com>
	 <6300821339d6891983af704e2044fd1ed25285f6.camel@collabora.com>
	 <299B626E-DC60-4175-9D66-2DE58BA5070A@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-CD3+zv2xaF645oZLhcaN"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-CD3+zv2xaF645oZLhcaN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 26 novembre 2026 =C3=A0 15:02 -0300, Daniel Almeida a =C3=A9crit=
=C2=A0:
> What does not work with shared resets on the C side?

Above make sense, for shared, you need a mechanism to coordinate the reset.=
 A
bit like the comment above you made about flushing active jobs, and holding=
 on
new jobs until the reset has completed. I think for multiple instance of th=
e
same driver its quite feasible, but when the triggering driver have no clue=
 what
other driver it shares with, there is nothing as far as I know to help with=
 this
coordination, and its possibly non-trivial, specially if that was not part =
of
the initial design.

Nicolas

--=-CD3+zv2xaF645oZLhcaN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawh2XAAKCRDZQZRRKWBy
9IFBAP0R4CNVguRuu1LdCKCpOw0V0DakpyddN93v30C5U7/NfAD7BqWyKtPGaZpc
JoJkkyS97s6EkFimhUg0uylSQ5V7yQA=
=XNtD
-----END PGP SIGNATURE-----

--=-CD3+zv2xaF645oZLhcaN--
