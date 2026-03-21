Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB0626C38C
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 12:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774095457; cv=none; b=BngbIF3y9uZ2WQGDAFDSwPpKvnoLRa7e+uWyEmNqVDWrpy9G6loGSXbytyZeEUBm8s8j6ZIQS6SvDeOBEkoGPXtcamFVhXnUHFtH6o4+mGpcYchQiReRpZNHjHMaCaewI2qxj6fi7i90JKVzX1AwvDJZhJViOJIMp0N9hyK3LBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774095457; c=relaxed/simple;
	bh=8YyERlVk1ugoFsrCXCxUX2e2isFw4Z9+VwGapjxkz7s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rVfQji4UArEi59noez1eb38YFn6KKRJI2T8xyIx2DpZwUQiUgr1k9qpIiPNbbKav247kmTSw5nh9lITiPmctM7vQSmsK23lHrTCdBTsr5J2fyad16Ul7nWx83miO+q4sBzQTAZRobIuuPc2uQ55T21X8VGyxLo0kdgLurrqrYD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=LPnHqm/j; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="LPnHqm/j"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 7D6B624002B
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 13:17:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1774095454; bh=t6UujHxpDtqiV7GlLpWywT8G7k9NeQInk9XfF4zM49c=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=LPnHqm/jztESzdHCB0glXNuwd9deQqkZH9enYY7Aq0cIx0InBvJNOsy0EnX0ue8uQ
	 a5mXyDeLiw4KVQA1iiEhzUfaySxhWb60t44tpDvE1Dc+E4FlyqhtdPbf8hEWXgRrPo
	 UBFXKU1jN+wKhMU65nlp0bzZL0QFqAgQHRj+PB0QGSgn+63SMyCkDh7an+8SL0HfuM
	 pp1CEWnw+Kvjna0qWijovkwxmZFp2TpjQ47uc0Ikbn5Bi3H4LyX3EfrUsq0luBYpO0
	 ZjZ3i/5nkU4wmQGZBZuMwSRTi8VJERmO1mJQZzrTUoHPH0Y+RD+ef9hOYBCQOyRM0i
	 W9Q8eBN8IAoIQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fdJND42Zkz6twq;
	Sat, 21 Mar 2026 13:17:32 +0100 (CET)
Message-ID: <a6fe54fcf985100fc85450e680e8f7da49e6b067.camel@posteo.de>
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
Date: Sat, 21 Mar 2026 12:17:33 +0000
In-Reply-To: <20260321-rose-armadillo-of-drama-09fdcf@quoll>
References: <20260320-synology_microp_initial-v4-0-0423ddb83ca4@posteo.de>
	 <20260320-synology_microp_initial-v4-1-0423ddb83ca4@posteo.de>
	 <20260321-rose-armadillo-of-drama-09fdcf@quoll>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ke8ZPxphM5mlwUorS+WC"
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-ke8ZPxphM5mlwUorS+WC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-03-21 at 11:21 +0100, Krzysztof Kozlowski wrote:
> On Fri, Mar 20, 2026 at 11:09:53PM +0100, Markus Probst wrote:
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/leds/common.h>
> > +
> > +    embedded-controller {
> > +      compatible =3D "synology,microp";
> > +
> > +      power-led {
> > +        color =3D <LED_COLOR_ID_BLUE>;
> > +        function =3D LED_FUNCTION_POWER;
> > +      };
> > +
> > +      status-led {
> > +        color =3D <LED_COLOR_ID_MULTI>;
> > +        function =3D LED_FUNCTION_STATUS;
> > +      };
>=20
> Where are other leds? Binding mentions 4.
>=20
Status and Power leds exist on every Synology NAS model I am aware of.
But there are models which have additionally a usb or alert led. The
device nodes for those leds should only be present, if they exist
physically on the device.

> Does that mean that they
> differ on each device?  The EC is tied to specific model, so that would
> be surprising. And if they do not differ, what is exactly the point of
> describing the LEDs in DT?
The color of the leds is different on some models.

I suppose I should add this information to the description.

Thanks
- Markus Probst

>=20
> > +    };
> >=20
> > --=20
> > 2.52.0
> >=20

--=-ke8ZPxphM5mlwUorS+WC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmm+jFAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSI+MQAJfWzKsd3pZ/pE8Rqz7D
a4XefcBr/QKc6dyxDqpvz1HzeuFbHWB7qvoBCNZ3XvbgE/4RFRk/tvv3Z4enQi/P
4qNuPRgmI5d3YKDIgNvRmdEanShjuYn3j5iRza+9mvw/xgwbbWHf2i4yZ7mIS5i3
1wCrFrS/ihR+jTbBkFamQifjRfccxlhHbjtUrivdHfnwIbI1FfgPjPy0MLVR/JQT
fJgG6CiY1vR7Vo0QKBNejH7N43X/nIDM8EBC/WAA+MOwFtzO8yrDDpDWAsmGsi2G
RHRSxCAENm4/qW6zfzPTCkYIKsDWs9X9lXy1QO+YWjHT09jBnX1k3kyt9z8FVUGk
CRtYo2Pl+mPeiIpQ8Wb7jeBwj2UHEhR2imOrlxM1NW9ZGlMODxJtFsxghpiq2c/B
Y7MCMFGevyR0CVDei2J44m2NnNZaEXVi2z5ex4UTnUSiaVCFDr5xYI9emnXPbafV
V6yuK0WV0ZbuqDtKbN3blG/Q6yYulhyGi4Pnrk1Ofc5ayD+jIFwO/0nmZqZMm142
/Fzg8yLvWcE+X+n5cKul1Srd0Naz24BUTIDl4hBRVTjv7v2D41N6X28bfu22hQJa
IX7tOBDN2oUvylWyVVQ9dgumRRKXn7Th+53Uj6dy+4pWBPc6FPrVjI6pT+3r/3e3
mCsMfaqXvPb0GT/FhEcceDqU
=E5r/
-----END PGP SIGNATURE-----

--=-ke8ZPxphM5mlwUorS+WC--
