Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718812;
	b=CBIy3GVf0+/vNpMpuOLiOq1S2mBgp+SKASmqylxfMaG7+T9epjUw/gjRM7Ra7pEHHPDa
	 eTnGY1iBUcqxT98sf9Aqjosk+qpoL/Fcp3j7moW3IW3i82fAuRmtomEIRveI+Gc0uIzXZ
	 OKh6gjU/vELBXEjnphOSiFiy4p8zRBFeZ17V2n2wppkL4xyOAFkusXeq9qS5aFWs+HANA
	 /IsUXzG67EAZRu4wzwReRp75SnuOUKkIML1VQKRpczPaD/UwAzQVW/a80UeFcFVsvRhXt
	 8kDxRUdhn5vKc7l/jUM3t8WTL21LuNLsoE6mV2c9h8U05q5fnaIbxKcR3kQV6qWkzDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718812;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=15MjkrZo96Wtk7+oJJeShfMhLRx962x5eFfNDruHPYs=;
	b=D7FSXV9PITuJwOiDfkd4MTMTR0VAqdLetrnBGRYOgzhGpq9Fvr7sZMOi3LRmeucJNdWn
	 mF3rFXt4/F3azz85OQi5lUg2bVbzaDlswcrTshAbaL1xy75dEucdd+fBXwQyd5mIaFKFK
	 mm2eYAAvVDNdqEEgvrBvqIYBukk+iXCpxSHWe5xpTgdGQKxcrICbqK6PyMCr7vAFPrYnw
	 zZeBrE2MtWpldJQ1C7IMw7zxAOAULkFCz/F+Xq2fIXW7tD4rt9Lw059Jpl3nTmubtAOGn
	 0XE5yQ0gt462kSqu0uz6PXV/Ol3yYeH0Eg6i5PpDk+8Xe7qxhoRhyLh981tbMf/+1dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qwXQWvlx;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FAE606A31E;
	Thu, 26 Nov 2026 18:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34FAE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qwXQWvlx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795718810;
	bh=15MjkrZo96Wtk7+oJJeShfMhLRx962x5eFfNDruHPYs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=qwXQWvlxAorgriUDT67rJAZK2UFFeGfNH7SV/wtVTH9C1W5nS1eY2a8IhC+qx2+7h
	 tShfulZB2KOamEPgntoO2BslP+gVZ8GRQz1S1/66X+7dLhaHoYWpo6MsV1YULuqqu/
	 tDVqKfymS0YvCSFDMjYWJLxkyzN1wMwQv2ONzrlOVmDpwVjeCtRpkKIuotEnbrKPiK
	 T21APHxSdxkqAnLAdTVEcwkxkZ9RR1oCLqQfacIVUsFPe78Z1yxiKYSK8w8SFbIqYO
	 Lhs9CoAzzR4RbV7g04DTb5k2qHUlS0TUoDWpEikNoPDIlBBuy+awLnxP9cud6B/HCY
	 8/dcWeU2Ncufw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EA0A717E0DCD;
	Thu, 26 Nov 2026 19:46:47 +0100 (CET)
Message-ID: <6e6bc569248e4d72a83de38b8aa83c66abc831f6.camel@collabora.com>
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
Date: Thu, 26 Nov 2026 13:46:46 -0500
In-Reply-To: <D28A86A5-8077-49BA-B366-FF29E9E75736@collabora.com>
References: <20261126-b4-rust-reset-v1-0-9c4c3d029080@collabora.com>
	 <6300821339d6891983af704e2044fd1ed25285f6.camel@collabora.com>
	 <299B626E-DC60-4175-9D66-2DE58BA5070A@collabora.com>
	 <ffb55e45af601f0afaf5071f92e123c81de22a70.camel@collabora.com>
	 <D28A86A5-8077-49BA-B366-FF29E9E75736@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-SnTR6pbYW0CfO0KFqPeH"
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

--=-SnTR6pbYW0CfO0KFqPeH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 26 novembre 2026 =C3=A0 15:36 -0300, Daniel Almeida a =C3=A9crit=
=C2=A0:
>=20
> > On 26 Nov 2026, at 15:11, Nicolas Dufresne <nicolas.dufresne@collabora.=
com> wrote:
> >=20
> > Le jeudi 26 novembre 2026 =C3=A0 15:02 -0300, Daniel Almeida a =C3=A9cr=
it :
> > > What does not work with shared resets on the C side?
> >=20
> > Above make sense, for shared, you need a mechanism to coordinate the re=
set. A
> > bit like the comment above you made about flushing active jobs, and hol=
ding on
> > new jobs until the reset has completed. I think for multiple instance o=
f the
> > same driver its quite feasible, but when the triggering driver have no =
clue what
> > other driver it shares with, there is nothing as far as I know to help =
with this
> > coordination, and its possibly non-trivial, specially if that was not p=
art of
> > the initial design.
> >=20
> > Nicolas
>=20
>=20
> My understanding (correct me if I am wrong?) is that this coordination is
> indeed needed, but baked into the C assert/deassert API:
>=20
> Someone on a shared line has no power to assert the line
> unconditionally, all a single consumer can say is "I'd like this line to
> be asserted". The line is only asserted when all users agree (i.e.: when
> all other users also ask for a reset).
>=20
> So if driver A wants a reset, it gets its house in order, and asks for
> it. Same for all other drivers, and it goes through when the last one
> does so. This is the de-facto coordination between consumers and it is
> not something that Rust influences one way or the other.
>=20
> Sure, B is not told that A wants a reset, and A is not told by the reset
> APIs when the reset goes through, but at least no user gets its hardware
> yanked from them all of a sudden.

Which comes back to my point, if the drivers have no back-channel, the lone=
ly
driver wanting to reset will wait forever. And the interaction with runtime=
 PM
seems a bit undefined too no? My question is if this is actually usable in
practice.

>=20
> In fact, we do enforce this even harder by making sure that one cannot
> construct a SharedResetControl<Asserted>, for the reasons above.

Maybe I'm just missing concrete examples.

Nicolas

>=20
> -- Daniel

--=-SnTR6pbYW0CfO0KFqPeH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawh+lgAKCRDZQZRRKWBy
9I8pAQDBxtsGXueaBkl3fN6Srv2E9qjon97wkLGnrGJfbcFA3wEA4SYuf5FQpGbA
iUJZwtoIA620HHS9JmbtT3AaTThrIw0=
=0emc
-----END PGP SIGNATURE-----

--=-SnTR6pbYW0CfO0KFqPeH--
