Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4005D27FB37
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Apr 2026 06:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775715024; cv=none; b=dbJAvLNZyHmx5w9tYMq8FkN0CTWUcNAr/Pwbjh5ivzg0vDYJOjEQQOYiLXV7BGi12ftLBLvPse30iiHfsGJI0dZc/7sPyVkc8uU0TdcG08Lg3W9HwTgW5KcxBgLnVYE1IPPcCowUI+H9s+iEYu1KqAYXosaFm+cY/qd2QkR9ojw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775715024; c=relaxed/simple;
	bh=YwHEDcOeAUXeIskBMc6znoculgL3oG71ZoYMsJuc6z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/AVJKeT06O1AA0FA4SXSyaYhmcOM1crAi7nk4e89TqNKjnVypjYNjEGVAg1Ev7xscyJvjRa6KPhIYY2AHogURAOcNjtSTRYDRsElr6fFV5wDAkoOO5j5aP/valtmm+USPrCq3dnVRqmrDFQ03RvwOadRScKX+D/x+4rGFSF7g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UIuMObKM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UIuMObKM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=YwHE
	DcOeAUXeIskBMc6znoculgL3oG71ZoYMsJuc6z0=; b=UIuMObKMuhaQf0b1NLF0
	Zr0KFvUtJaA39/7uu7nC0j1tOdP2PeYVz54WOmxfThkIOv5SpfcMOEGwmpCGA5Ds
	WGM+dth6GQHzvX4BvX5W76cDHbsgUhgiqL53b6xmm9RWYc/cRxvk5V95PpkX+3uD
	QK4NSM5NBdp0bGSnU9uf29By0pOy7eMkJK2VA/O3XytXKPcIa3mwdCQGOCnOKyC2
	Ni1Y4Hp2qacI26yuOkQKIQFMFTHKduZtWIk8SED4r6rVH2vhSq4ONxwAxxqmDCdJ
	zBhGDT/3GBe+CHgTp7aHWoBXVBpRpiMxMtwX7yccFf8zT6d6V3LdWGYVuXHgwtOP
	uQ==
Received: (qmail 714177 invoked from network); 9 Apr 2026 08:10:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Apr 2026 08:10:17 +0200
X-UD-Smtp-Session: l3s3148p1@f1DK3gBPSOQujnsc
Date: Thu, 9 Apr 2026 08:10:16 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: Igor Korotin <igor.korotin@linux.dev>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: add Rust I2C tree and update Igor
 Korotin's email
Message-ID: <addCyCVBJuVHfwhs@shikoro>
References: <20260404-update-rust-i2c-maintainers-v2-1-42f929828eb1@linux.dev>
 <CANiq72nzNa29_YduauW_qwPq9sLbYa+28ykq42_bbfLnOqUm9Q@mail.gmail.com>
 <707e9f2e-048a-469e-adbb-17334dd027ab@linux.dev>
 <adGOXajATeerw91I@shikoro>
 <c26d043d-43a8-49a9-a866-d2bd5922b549@linux.dev>
 <ada3tSA4LdRl_nTL@shikoro>
 <85e8de3e-cb00-4911-95b4-282bd7ec21e4@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8EpwqM4Ry14EKKCQ"
Content-Disposition: inline
In-Reply-To: <85e8de3e-cb00-4911-95b4-282bd7ec21e4@gmail.com>


--8EpwqM4Ry14EKKCQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Should I wait for an Ack, or is this good to go for the upcoming pull
> request?

You are the maintainer, you decide if it needs an ack ;) However, you
are modifying only your MAINTAINER entries, so it doesn't need an ack
=66rom someone else, I'd say.


--8EpwqM4Ry14EKKCQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnXQsQACgkQFA3kzBSg
KbaE1Q//TfrrbNh4/ciqvmvua3Gj6QZzw1vHPvdAlmF2hAXxKAuMi1fL56tAxg74
AQAB2aG3yd9P4GkNfIJtNhgW3nwHFh2WpAPMTZ8+S1p3g9uoy6p4GnR2mZK+lUFG
0kbS3SVQJy0ZyzcU1Tunlq0vANT4Fdey7klZgvE7ByHyDavcKDITSChduUxcI/bx
p/khn4pR20hr9NVuE6Ux399y5zaUoSrCIdxQTu3IPl0fzOmnc/HByzLWtcHoLJ5V
rAbygOdyBzJh4hle3H5M3wSq9GHA2dHWdDIL+VLnciKW0bvSklgO8aL8jm4OosxG
itxzrwOynQvrk8vM5PdVUwpTqLIS82DACu99vsH9JLIRSJvCEZMuJshTP5DHnodu
Nc8CH4HkzpoWXF0fTTO7VR8ZcxOjZTCOMri03DRS47NK0t+GBBi2qpSYetWkEHRu
KPuJ6Zzo6MBmuTWGRqsuOd7Bnvf7H3ZSI4u2kZJjIHJ0LNQEyAuGWDdrbmPyXlta
llKvf/IJHdyWY9qZLQpJhUDpiVxquXJy2FioVySz+BuhxaqhTmcHRG0RqZ8PtDLw
TSMPhlOhElV0YNFid3N7MKreNh2XyVF5GbGTt3MQLa6oHN0MiFXRjMTAHZH8kONo
2pro2nKA1En0KYVP+qFNX8wrlsc8YcEnoAaXC3AKo333sXUVo3Q=
=uRsN
-----END PGP SIGNATURE-----

--8EpwqM4Ry14EKKCQ--
