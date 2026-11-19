Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099986;
	b=UsfQSVbl+7FgIJAlLADWEnBWxfett5XnlqnEwzJqFPUmOWht/YKZPbsf5lSqBZcsViEU
	 4yalxs3p3FZcv+SO6xuT5nJZ1I5spJroxlHm+H7kgTuJ8CKCXDV1QdkIbQPKJ3BkY30SZ
	 d8BDvcRJvH9BqZ6OWKAVZT7cVDHqNeEThGueizz8KTc5tJLeOtl35abXAtM+tKgMq6btd
	 S+s3oGGHncWlv7IZ50keOiwMb61RiHm7pWhYBQJmAhWOl3fg3WdhT6hJnduTFByrORBzy
	 IIHgoF9pnMExmyREtdNokXd/2RQm+3GOT+GDlCYmb762CfM+v1t2zdr16P+aImcK81Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099986;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=NA7RQBA3b3IBGkBYkpIY+Rfig6IT7PZbrntvh1R1GUQ=;
	b=rFP8Oks6khNhpiweMnzSqn2VBlhMgqfl7QXsX+/X5QLraWlfe2XkVv0NfcoY0fm4e9nT
	 9ZJO12RLKxd8Pe0Qqzjlgw6nRZZHKs39wFAbzmOABN1bWXTfsPquBcMyOE6gc/zYde7mw
	 UN5lUTNn6KnVaYkjXaO1bRl21Ocrkl3DzhzygPIJkG0EBvO9L99xbb4vD1WyH09+v/uoe
	 wv+4DrDIvwupzfx88RDjIM7GUDFnlH+7pX7UQIVEbffxdewF+zkN3zaKlYqaUxBseuBTJ
	 70AYdSC5sSuT+svQqm4bBh1Cr5WIhAiyyMycx6ZMhpmIwBo5M1c3OfJuJV11hOj34RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gZLHbXbd;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5855606A334;
	Thu, 19 Nov 2026 14:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5855606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gZLHbXbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795099984;
	bh=NA7RQBA3b3IBGkBYkpIY+Rfig6IT7PZbrntvh1R1GUQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gZLHbXbdDazblkbFcqz+EyUYzyxojGjHNi0rE4Z9xAb7ijeOE8I6qOaT5ftI1f8zn
	 4+CtSrr5pcLOFd+oV+ut5EVIYCaHiggDq4y03fcLyid2xKEuqKJ9N0Nm7JrQFp1R33
	 eMIImxJNNmWOcLQNj3G4auBJWF4Ss9KR2ey4fuvDh+S/kpfJyp/R7zLe7aphTV+Yu+
	 d80n/Pe9A+eAFfKI73IJnDc1dnrrQyu/xPmpVIdVH5iEtCSqBJ7+1dQVCa+ERSEEJ9
	 6QFsshvYNZ/vhQnAMguNCIFpepBhlFeUzxi9jMX00Yz5qn+z1zp1sDG//cPySg66HG
	 rxAwzhLrTN1Xg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 68A2117E00AF;
	Thu, 19 Nov 2026 15:53:01 +0100 (CET)
Message-ID: <32a64e144c11bec72908ce143044773808be5115.camel@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Almeida
	 <daniel.almeida@collabora.com>
Cc: Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)"
 <joro@8bytes.org>,  Will Deacon <will@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo	
 <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Tamir Duberstein	 <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Onur =?ISO-8859-1?Q?=D6zkan?=	 <work@onurozkan.dev>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 	iommu@lists.linux.dev,
 rust-for-linux@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev, Detlev Casanova	
 <detlev.casanova@collabora.com>
Date: Thu, 19 Nov 2026 09:52:59 -0500
In-Reply-To: <20261119143151.GH3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
	 <20261116193821.GC2452510@ziepe.ca>
	 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
	 <20261117202055.GA3115493@ziepe.ca>
	 <b145b2ceb92c73a4fa0477d7b3895a6e3b4adf99.camel@collabora.com>
	 <20261118160909.GC3115493@ziepe.ca>
	 <fe60c0bd-1ee2-4b33-8ca3-564ee08e6db5@arm.com>
	 <CF2BE3BB-4F16-49FC-8421-B2B823BB7BB4@collabora.com>
	 <20261119143151.GH3115493@ziepe.ca>
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
	protocol="application/pgp-signature"; boundary="=-cQtIT83PANfhDEpRr1Ju"
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

--=-cQtIT83PANfhDEpRr1Ju
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 19 novembre 2026 =C3=A0 10:31 -0400, Jason Gunthorpe a =C3=A9crit=
=C2=A0:
> With the additional twist that alot of embedded HW has apparently
> choosen to not implement SSID but instead has a pool of SIDs that one
> device can use, functionally similar to SSID.
>=20
> We'd need also API support for unbundling the DT iommus=3D[] SID list
> into something that the SIDs can be attached more like a PASID.=C2=A0 Tha=
t
> need, I think, has become clear with all the DT tricks and fake busses
> to try to work around this issue. :|

The word "fake" never flies with the DT maintainers. On that subject, I sti=
ll
don't know what you mean with iommus=3D[].

On the SSID / PASID route, physically I understood these have a limited cou=
nt,
is the iommu implementation manages more then the HW supports? (or has goal=
 to)

Nicolas

--=-cQtIT83PANfhDEpRr1Ju
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav8NSwAKCRDZQZRRKWBy
9NdrAPoCYDz5yGypmvSXub7WMaVIrRjbSqey4T91XcUF9WhFAwEAwBUrFYqOrUpF
H8q7RtyfoFsL5gcrRl/mvJTF5VRgxw4=
=vh9V
-----END PGP SIGNATURE-----

--=-cQtIT83PANfhDEpRr1Ju--
