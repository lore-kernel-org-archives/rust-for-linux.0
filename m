Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B4133263E
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 19:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772997809; cv=none; b=sLCZD1NhtbQdxsztHhbBH+af6f0eII9bc9ZJIzG4fZUHv+zBq88rqvQUDG2GdKf57TMLZSYZghjUPw22ePRAHQBaE4GVUVAZU5sNkVeHInDu42z9ToMxFDYLiPfKyG/oZF2fHFM67gmaBWLC9q5VYPfH5NxQ8kZFIuCEXUlr310=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772997809; c=relaxed/simple;
	bh=xihVpT5t3yGzukukyCC5y7BNAC5zNdc1OPNdh7cS9HQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=II/HaPBXTcdXqrpgUtwUNRbNYYbHxOEgBoIefmcKRHKbP0hvX7ct7B6iB/ucSXrzHGQYPuRvQ32BWoWIpYCsRzew7fQTEDKQFo9SY5YwiDFl1bJukAok8WizF9/q8ZUECqCVpSYYMd+RSmmTaWtpubZJ8kj6bntJQnlEaXmGeEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=fQ/GYSR+; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="fQ/GYSR+"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 1DD6224002B
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 20:23:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1772997806; bh=VMIAFOgNSso9aT66tTAOxXE8s8eAGET6wZgGMCzMmW8=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=fQ/GYSR+xjemUMrTa52mx+8SMqDa9FDJ2EgwPbQygiTCwj6s0x5jKJ1bSzXgP9LCq
	 mEkeeX3BEOk9+ZCu56da3N6WD6Paiu/1v0IHVsvsdEgYrerwDFJzLocLROlHpZ8BOV
	 xAs1A/giAoqFZJofQUm4OmMmxwn5T1cmryMtskaykUjmuMyxQBxT8rgi1Aj9mfG03b
	 Pn3VJKQWOnjnmGesOnV40/+975H6aV8xZQ+JaF1LcjJlm3gr0yarrLZBGle34VmZQl
	 Gmc/YPjcfrNJbafsKawf7sdq43cdX30KCkjvge49bR7NmhE94fpE/rAh92rhOko2k/
	 WW8l9w/jqJ0WQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fTVRc1YsWz9rxG;
	Sun,  8 Mar 2026 20:23:24 +0100 (CET)
Message-ID: <33a7bfd923ebf118714dd79f4af0d4d8c4120d73.camel@posteo.de>
Subject: Re: [PATCH v2 2/2] mfd: Add initial synology microp driver
From: Markus Probst <markus.probst@posteo.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Miguel
 Ojeda <ojeda@kernel.org>,  Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Date: Sun, 08 Mar 2026 19:23:25 +0000
In-Reply-To: <2026030850-quickstep-blinking-b853@gregkh>
References: <20260308-synology_microp_initial-v2-0-9389963f31c5@posteo.de>
	 <20260308-synology_microp_initial-v2-2-9389963f31c5@posteo.de>
	 <2026030850-quickstep-blinking-b853@gregkh>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-OkxVV+ihTBYocaFXg3Ag"
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-OkxVV+ihTBYocaFXg3Ag
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2026-03-08 at 19:56 +0100, Greg Kroah-Hartman wrote:
> On Sun, Mar 08, 2026 at 06:41:20PM +0000, Markus Probst wrote:
> > +kernel::module_serdev_device_driver! {
> > +    type: SynologyMicropDriver,
> > +    name: "synology_microp",
> > +    authors: ["Markus Probst <markus.probst@posteo.de>"],
> > +    description: "Synology Microp driver",
> > +    license: "GPL v2",
> > +    params: {
> > +        check_fan: i32 {
> > +            default: 1,
> > +            description: "Check for cpu fan failures",
> > +        },
> > +    },
>=20
> This is not the 1990's, please do not add new module parameters for no
> good reason.  This should be dynamic and per-device, not per-module.
agreed.

> why would you NOT want to check for cpu fan failures?

Because it is also triggered at low fan speeds, even if they are
intentionally set by the driver. While the parameter is 1, the driver
would enable those checks for fan failures and would prevent low fan
speeds. The parameter would allow it to disable this check and allow
for low fan speeds.

>=20
> thanks,
>=20
> greg k-h


Thanks
- Markus Probst

--=-OkxVV+ihTBYocaFXg3Ag
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmmtzKkbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSc1oP/i2i9L1poaiTYuQWgWeo
SxGi5N4hZYJZ24TNnMIWkZUNmAFvfQD71UUzBLhN+M8GuLJwLeIjaO7LMHnDJf7z
6JdNh4RZ1kIRRt1tz/xJzZkQcCmqC9vKruHQjtY0DqK/BhOvVWO8BE3fgg2rYyRq
GJPa4/gGG+LbRE58S+P/O+iTzhcyVYbgFCpyDl28n4gI0kRsYXoaK5g/yRROho/1
Tau+zNxS+Ikw1MTAVQqapp3hAGQOfl/zUVFoxEAUAfeOIBUqOZRFm4qZjdLYp6xA
fBJAR2QvWZw3rUifBWceEN27ivNJgTdWBJ6lRVT+4TEllICXpYDWgIjtyQQs7CAq
GmYLDpedg3f413mdMFPEN90xX1OTL/J4RkrqIgpZ/6qS3eWMtg1ItzwGGxyUSqWJ
TePxkJAlaR7hbtQZwOPopt6oNZDb+D5pbRlRwPeg3Qmp7dXrbQKubB6ft/frqfXu
si6DCET47fg+VXkoBu0yLxlAUtLD1u8z+AqMphDbyWZX7VZ8VQuV41ZZgRNwYCfa
j+gRFBhA97TeMTCsBeU8flH0BKAxIM699MNEpErdB9Pb/MtE9xUBQWSj1Fuzzei/
cJJZk9kA1ZJ6rV60R7nB8nVk6ll/Q2TyTt1QHcA5DBYYHDUZEWhoRS0cGAv4Ia58
LiPYVjBz1y/L5QtJAv7WtDxM
=T8rS
-----END PGP SIGNATURE-----

--=-OkxVV+ihTBYocaFXg3Ag--
