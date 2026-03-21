Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BAC2C08AD
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 13:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774098146; cv=none; b=HwUfm1PdNSgeJg/cDLWVPi97Oac4nNrjx9zXQrtwdVDR9ByoUEu2OeXrDLADumtxI+1k6/j4MgZystn+EB9mA3RnUBfQ9gmKTJfd99d+0gH+LEa3viwomG2GjVmcl77ZZkhk/zPGfQBNj3YYINfJc68slPl6S/jJ3m9A8hvC7ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774098146; c=relaxed/simple;
	bh=94fgN99Kp9vLA/kTmFjz+yrK0c2tIHQxGwXYHWLnRQg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E2j4icIc0bApTU0Wl+mLloJClhRIsd0hb/S2kijpPkAkZx08eUwgCY9ajNNxo+zKvcEk0tzfyd3k8FzQLc9Zu50RwZ5YOGJfntqa7lYPNC5zc4Lpr2PMqihCLkLi9+H9YK8/E/gn7p4T+10VJDYDH61K9fbHzOl4pDCntY1piz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=O3JwoyjL; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="O3JwoyjL"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 1923424002A
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 14:02:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1774098143; bh=YFK5oLAzYD/Rn70jt6sbMKD6/t6QfwsLJhJfS0Hp0Kg=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=O3JwoyjLtU8BWAGLjr1TJJ19a3Qq2nR9rs9hnE90pKZ4fHd5Vzczw3UVv+G9EDGp/
	 dT7Dby4ciQPXU+u+sBDlkV4cs+z+u8oEm0oDdOlWU/zXOVa6fQ8uX0ExclQnr8t4Qq
	 HxepfnGJJE02/r4xFCTrrsac1zr8SHXiIxfYTHgFhZ2SSUwUo5WRYU0Y+kG+NBF2r0
	 DAyuD+K1L7fzoitvrr9HKYVVZQsGfrPxLUMFyh2jiaCco5MK2NT9m+4HD4FY0x6Tdq
	 0VoCdh7kTAfGqbnqUTvkSpbRuZngS2X3uwc8InPUgBIaAw3jS2CKtivUmzazq5eBsM
	 VlcQdobsD0lCA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fdKMx0rGBz6txq;
	Sat, 21 Mar 2026 14:02:21 +0100 (CET)
Message-ID: <881644afe920a222a7fa6b2221fcc157c037ccd5.camel@posteo.de>
Subject: Re: [PATCH v4 1/2] dt-bindings: embedded-controller: Add
 synology,microp device
From: Markus Probst <markus.probst@posteo.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo	 <gary@garyguo.net>,
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Andreas Hindborg	 <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Sat, 21 Mar 2026 13:02:22 +0000
In-Reply-To: <56ece3e3-871f-4ef7-9ad1-cd7f68f9d003@kernel.org>
References: <20260320-synology_microp_initial-v4-0-0423ddb83ca4@posteo.de>
	 <20260320-synology_microp_initial-v4-1-0423ddb83ca4@posteo.de>
	 <20260321-rose-armadillo-of-drama-09fdcf@quoll>
	 <a6fe54fcf985100fc85450e680e8f7da49e6b067.camel@posteo.de>
	 <56ece3e3-871f-4ef7-9ad1-cd7f68f9d003@kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ZIy6Ya0iOe+LqzFnFY6X"
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-ZIy6Ya0iOe+LqzFnFY6X
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-03-21 at 13:32 +0100, Krzysztof Kozlowski wrote:
> On 21/03/2026 13:17, Markus Probst wrote:
> > On Sat, 2026-03-21 at 11:21 +0100, Krzysztof Kozlowski wrote:
> > > On Fri, Mar 20, 2026 at 11:09:53PM +0100, Markus Probst wrote:
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/leds/common.h>
> > > > +
> > > > +    embedded-controller {
> > > > +      compatible =3D "synology,microp";
> > > > +
> > > > +      power-led {
> > > > +        color =3D <LED_COLOR_ID_BLUE>;
> > > > +        function =3D LED_FUNCTION_POWER;
> > > > +      };
> > > > +
> > > > +      status-led {
> > > > +        color =3D <LED_COLOR_ID_MULTI>;
> > > > +        function =3D LED_FUNCTION_STATUS;
> > > > +      };
> > >=20
> > > Where are other leds? Binding mentions 4.
> > >=20
> > Status and Power leds exist on every Synology NAS model I am aware of.
> > But there are models which have additionally a usb or alert led. The
> > device nodes for those leds should only be present, if they exist
> > physically on the device.
>=20
> Then help me to understand - are these different models?
Yes, even with different CPU architectures.
How much the "microp" device differs is not clear, but the
communication protocol is the same.
>=20
> EC is not a generic purpose component and is tightly coupled with the
> actual board it is being present on. Unless exactly same board is used
> in different models (unlikely) then the compatible defines the LEDs and
> they are not needed in DT.
So for instance "synology,ds923p-microp", "synology,ds723p-microp" etc.
?

I can do that, but that would be many.
Having it generic seems more flexible.

>=20
> I should have brought this earlier, so apologies for that.
>=20
Thanks
- Markus Probst

> >=20
> > > Does that mean that they
> > > differ on each device?  The EC is tied to specific model, so that wou=
ld
> > > be surprising. And if they do not differ, what is exactly the point o=
f
> > > describing the LEDs in DT?
> > The color of the leds is different on some models.
> >=20
> > I suppose I should add this information to the description.
> >=20
>=20
>=20
> Best regards,
> Krzysztof

--=-ZIy6Ya0iOe+LqzFnFY6X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmm+ls8bFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSqYUP/1hpGRY2FYcsqqCFyAKY
FOCy0h1R7PczDeEV2umd2e2SHna5MHRK7gdwTsOJhHgXgHFUfO0xLPMFxkibfIiv
AhNDa64eAWEu+FZ6kpVXOI4aa2Xkjsv1Q19DoJ98uxW8Sdpb0uIYZlVRVnPOEn5F
mL4L3SFchXRqg74df9TbksZA0eO5DPbQxeGSF5Rjdb8B2XrHQzCKNNA0yMPvvj0s
xt8YnuPTJBaLZwzFChF29KKXtgsFiVzeQsyADvV5FR8wgh9fpOOxLj0Vdf+N+ylu
dd/FBhNWlzBpa/A7cqb2Iwcjgxp/NBWKdmPw8m1pIdj5GCmf7UucCO3/6w8RCUqi
8qe8A7ZXcSinykZYlI74QtWATQSAZ2kr76UDe5w8SGHmkPi96ZzbvSBkbTSQxqYk
QvEB0rVqvfJjgECF3NRYiD4F6OSkTc4I8wgkeYzMwSh3pXQwT6jJBTBsMrwP1EmD
u4GUvyaptOCeUFSW83CkM7FnkCQLnn/xUamvJg+xBK9CtIbX7ihoh32iTnc/aUqD
xRJaZXe1Lhw0dF4d7pgYGTBOVmjxzADIQKHWoicOc+z6AexPrHDA+7nJcgDP8VeO
ax7TouKhMihFS9Lur2oGTAJB3arPukYd0aGxGhYfN4ElEc91t/m9K+XzrLGqPaKv
0z0TNw2FfDyfdWrbQqwMbbjr
=zy5p
-----END PGP SIGNATURE-----

--=-ZIy6Ya0iOe+LqzFnFY6X--
