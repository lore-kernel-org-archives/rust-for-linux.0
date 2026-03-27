Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CAF34B434
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 13:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774618451; cv=none; b=NYsyMI9owVa43iFhmjW+p6ivBqwYMpNnJx4WvACaQNioiZ7s7SFGrleDUtlPuV2a3fpkq4IbgfrA8dK73k6bEUBZST6YILHWqXPBgK0JdvgCc2Ala6TNGsIiQXLA+mmKmEI9AfYs7Fp/ECgboZb/TLgXmeMYT6DkmX+5Zv5+OhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774618451; c=relaxed/simple;
	bh=I9YYmUqjmwDAglHQt+TdLLFYv6Br2Cvm3hV87CemV6M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W5id+uR8ax2N6ozdzytxuohtE6sT833G+fgSHOGLl8g5N+w3hW2RKQrslZqFMUhQg5I/Ng/cDAtVv6n//hgzRlJ2hmkQPjiDKoMsJjDRQRkS8ly0ZzCz7yyy7xYRLeGsnW1eyyzTxX83ZS78PXvqFXdjhc82aGqWj0XkehtCmmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=VRHCRqHK; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="VRHCRqHK"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 53DFD240104
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 14:34:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1774618442; bh=B1HXLdfLQtkgXuwTVMV/gzXIibl5wOZ8hLFBdEzZ17I=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=VRHCRqHKDpOK7yBvG0CJwOI1af0EaJiHkNt8pTX1mjssDRXSWrhMRtaHNzZO/sWfV
	 rDOqKimZVjxh496PBB3njwTbxPIALZuSqjRGyID9H1FKpNenhKMuQwA5RtlbXNvGgh
	 aSCp2OfQ9G/XrqoACFYfgPdj+VColDTb50jNHiExbd1W94V6mj3YvRL5Bj/JyGkpdJ
	 yM9yAxk8tqIVyGFnRVm8WOOVIDQRdVLtb8n7BLwMztUhX3i/XAW65EwsR9hJWDvCHG
	 YsP83bNjIoANGR1fZtvI4FLVWzG0K1svgW9IqQ/1FF21yKl8lM8yRb/kQrG09SnTnQ
	 ciog2tSb3KOHg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fj1ng6c0Hz9rxM;
	Fri, 27 Mar 2026 14:33:59 +0100 (CET)
Message-ID: <a2f8a64cf2281e11b5287049bc06697e65e41c9c.camel@posteo.de>
Subject: Re: [PATCH v4 1/2] dt-bindings: embedded-controller: Add
 synology,microp device
From: Markus Probst <markus.probst@posteo.de>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda	
 <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>,  =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Greg
 Kroah-Hartman	 <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Fri, 27 Mar 2026 13:34:01 +0000
In-Reply-To: <CAL_JsqJUVh1YnhmYYj4ara5BheaLOL1oayjtWNuPH53q1d4xXA@mail.gmail.com>
References: <20260320-synology_microp_initial-v4-0-0423ddb83ca4@posteo.de>
	 <20260320-synology_microp_initial-v4-1-0423ddb83ca4@posteo.de>
	 <20260321-rose-armadillo-of-drama-09fdcf@quoll>
	 <a6fe54fcf985100fc85450e680e8f7da49e6b067.camel@posteo.de>
	 <56ece3e3-871f-4ef7-9ad1-cd7f68f9d003@kernel.org>
	 <881644afe920a222a7fa6b2221fcc157c037ccd5.camel@posteo.de>
	 <20260325220749.GA17597-robh@kernel.org>
	 <3281ba870fff981a1c37989000fdc6a8c448a304.camel@posteo.de>
	 <CAL_JsqJUVh1YnhmYYj4ara5BheaLOL1oayjtWNuPH53q1d4xXA@mail.gmail.com>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-l/3+qkQAWaxnFt1MJeEB"
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-l/3+qkQAWaxnFt1MJeEB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-03-26 at 14:36 -0500, Rob Herring wrote:
> On Thu, Mar 26, 2026 at 8:02=E2=80=AFAM Markus Probst <markus.probst@post=
eo.de> wrote:
> >=20
> > On Wed, 2026-03-25 at 17:07 -0500, Rob Herring wrote:
> > > On Sat, Mar 21, 2026 at 01:02:22PM +0000, Markus Probst wrote:
> > > > On Sat, 2026-03-21 at 13:32 +0100, Krzysztof Kozlowski wrote:
> > > > > On 21/03/2026 13:17, Markus Probst wrote:
> > > > > > On Sat, 2026-03-21 at 11:21 +0100, Krzysztof Kozlowski wrote:
> > > > > > > On Fri, Mar 20, 2026 at 11:09:53PM +0100, Markus Probst wrote=
:
> > > > > > > > +
> > > > > > > > +examples:
> > > > > > > > +  - |
> > > > > > > > +    #include <dt-bindings/leds/common.h>
> > > > > > > > +
> > > > > > > > +    embedded-controller {
> > > > > > > > +      compatible =3D "synology,microp";
> > > > > > > > +
> > > > > > > > +      power-led {
> > > > > > > > +        color =3D <LED_COLOR_ID_BLUE>;
> > > > > > > > +        function =3D LED_FUNCTION_POWER;
> > > > > > > > +      };
> > > > > > > > +
> > > > > > > > +      status-led {
> > > > > > > > +        color =3D <LED_COLOR_ID_MULTI>;
> > > > > > > > +        function =3D LED_FUNCTION_STATUS;
> > > > > > > > +      };
> > > > > > >=20
> > > > > > > Where are other leds? Binding mentions 4.
> > > > > > >=20
> > > > > > Status and Power leds exist on every Synology NAS model I am aw=
are of.
> > > > > > But there are models which have additionally a usb or alert led=
. The
> > > > > > device nodes for those leds should only be present, if they exi=
st
> > > > > > physically on the device.
> > > > >=20
> > > > > Then help me to understand - are these different models?
> > > > Yes, even with different CPU architectures.
> > > > How much the "microp" device differs is not clear, but the
> > > > communication protocol is the same.
> > > > >=20
> > > > > EC is not a generic purpose component and is tightly coupled with=
 the
> > > > > actual board it is being present on. Unless exactly same board is=
 used
> > > > > in different models (unlikely) then the compatible defines the LE=
Ds and
> > > > > they are not needed in DT.
> > > > So for instance "synology,ds923p-microp", "synology,ds723p-microp" =
etc.
> > > > ?
> > > >=20
> > > > I can do that, but that would be many.
> > >=20
> > > How many is many?
> > Estimated 300.
>=20
> Okay, that's a lot and probably safe to say there are not 300
> variations of the EC.
>=20
> > As a side note: I only have 1 model I can test the driver with.
> > >=20
> > > > Having it generic seems more flexible.
> > >=20
> > > Is there firmware for these ECs? If so is it the same or different
> > > firmware for each device? If the former or the functionality is reall=
y
> > > trivial, then I'd be more comfortable with 1 or a few compatibles.
> > The firmware is not public and the exact differences between them isn't
> > documented. The communication protocol is the same though.
> >=20
> > >=20
> > > Generic means you'll need to add quirk properties when there is some
> > > difference the OS needs to handle which we'll reject. So stuck with o=
ne
> > > compatible and no way to distinguish different ECs is anything but
> > > flexible.
> > Describing the physical leds that are present on the NAS device are not
> > quirk properties, at least in my definition.
>=20
> That's not what I mean. I mean things like this other device needs
> some different timing for power-on/reset or delays between accesses or
> some LED control is inverted or some protocol difference... Could be
> about anything. The key thing is you have specific enough information
> (compatible) to start with that you can handle any issue that comes up
> *without* changing the DT.
>=20
> As you said, you only have 1 device. Make the binding specific to that
> 1 device. If the next one that comes along can reuse the binding as
> it, then great. Nothing to do. If it can't, then it gets its own new
> compatible. Strictly speaking we would add a new compatible for each
> device, but it's a judgement call that there aren't going to be
> differences to handle. In this case, there likely aren't 300 versions
> of h/w, the functionality is simple enough, and the functionality is
> entirely optional (just a guess). But that's all really your argument
> to make.
I think I will go with different compatible, but instead of 1 I will
compile a small list of devices, which:
- are most similar to my testing device
- have unique functionality (like having additionally a "cpu fan" or
similar). This way I can implement every functionality in the driver,
which makes it easier to add devices in the future.
- I know are owned by people who like to experiment with their device
(including my device)

Thanks
- Markus Probst

>=20
> Rob

--=-l/3+qkQAWaxnFt1MJeEB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnGhzsbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSPwIP/1Jz/Y1Rr5cQEs7B6/De
bELTI3cyFlsLlPnrjjMJHHmsWdaCOnP6/tq9j916t+b9d18G9u0n6YCzOJSYM8Bc
rknvuSm5VaYS3rjFASfsMfWqgXDR9+Y4tEkBDVt6p6J7a2+qIFn+2itmN1ZRfvwL
LPKoniu2G3cGBSiNj7bKtOuXo0/g0AaXMAvKKNIi63SL2voqHQNdkWnl8ebdc5Ve
B0laeTRHobQmbcZpajrCK7JL4MeOFEyBEQX9oViorP25DzSJycKWJGYF1YYnb86m
AsS5SRrsN1ePFu5X5qiO7+AspzZ39HAqKBAKDX1VJs6jO+0if6j6n0ztnpIKRkIm
v5SQ+q7nKPur4YT/tt3g+BvGVVH/r3w90v6GWP/1y+l+joZWBDEOtQw+6auSvtBI
vMyUDpVsBWjZ0FG8Cz7e6lhRxa+fTO/eCJ4ZFM+BElksOsh9U/itznXdD3ctY8r/
DSgW3+0uTikb9oOqewpxKcD5RzUP11LmzqS8BiKnNtMJ3AT1E/Z8c9ejjF8rlDqA
HG/DV7CnFnsNFf2c4n4hveOfA8wdXa0QtnnwI013rS4Ft40knJjgQUFMj3sQVLqS
GH0HQmTMdC4L2tUeAZp09+KwzMPLky1Tpey8C7atrS/ljHdx+UQid1MjHwrmdpst
N9YKumtSiDrYZGhyn3i6soLG
=lpC6
-----END PGP SIGNATURE-----

--=-l/3+qkQAWaxnFt1MJeEB--
