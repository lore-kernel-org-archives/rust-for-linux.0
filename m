Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B9338F926
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Mar 2026 13:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773063502; cv=none; b=RW2TocEEaEAyG0X95/7AKNsRE3bKB5xyK7ZdoKGSk7ymy/8YOWIFc5DGcuH99JYyFst3tcJcN7rxwg+QnFe8q/n2U/gbPYAf7QwJ6T+SQTgeZ/wMs/gBnak25VZJSHAz2NRdsjMvBU7McEecQuKXchHIajse6yyuVk7krRZzKD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773063502; c=relaxed/simple;
	bh=1yk/AaFqZ5eTtD6jLp0moB92iHRkui1C5UJ2tWvrYUY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cx6CCqW7Hl6LzUuEfVITlq0DPUaQoMZWyRTsXDJ3SGmL2b+eogX11wX+gh2Nng+/GfQAhQeLUgURZ9/vzSksmk28tQhnwTNWPMMIiSn46vjwAVcFfASB86s0++q777vipu/T5OTuQHOZwNrd4I610LZ8ObTxtYy0POiPnn5/nag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=i4eHRj/g; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="i4eHRj/g"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id F2818240027
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Mar 2026 14:38:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1773063493; bh=gq9ebAuGGJA9NtSsveQno863GgzvqZJtZwBh9ZIL2sI=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=i4eHRj/giRDXHia4UAYMi+u8Qj8yzwtR4QxBupBKCayTmkLp+HHMV4EBV2hUWPViQ
	 KT9IBAptvrFMwJwJeDopoN/GSUFRJULHLpBNy/RCBCCFk3nnj0eHMgz4t5fyHVw1W/
	 K9RwpchjF6owTT/qDJsNodetOkxNwxzdBqBa3c1TmU2DNzUE79sUUW0ZObZsmAqaVz
	 +8VGxkRE7ivhbN5epdqZr3aYK17l28GcMRVxoH1aUKskh6IsawNnK3Uv99QaM4xS8t
	 je/QBoYsPzPuBj85+0wUBVj4a6NbeJk5TzCmU7H6FV49dC+xFJl2XgybC9K6SK4YsM
	 dxGm2+MhLq2YA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fTykq0hqkz6twg;
	Mon,  9 Mar 2026 14:38:11 +0100 (CET)
Message-ID: <e43ca445ec7887d3d15676adb7db04f5685f4195.camel@posteo.de>
Subject: Re: [PATCH v2 2/2] mfd: Add initial synology microp driver
From: Markus Probst <markus.probst@posteo.de>
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Miguel
 Ojeda <ojeda@kernel.org>,  Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross	 <tmgross@umich.edu>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	rust-for-linux@vger.kernel.org
Date: Mon, 09 Mar 2026 13:38:12 +0000
In-Reply-To: <DGYAFNSJ7576.1E0JZ2W499ZQ7@kernel.org>
References: <20260308-synology_microp_initial-v2-0-9389963f31c5@posteo.de>
	 <20260308-synology_microp_initial-v2-2-9389963f31c5@posteo.de>
	 <2026030827-nautical-overplant-399c@gregkh>
	 <8efdf3e1bbf24504d560c12131cade543bec82f5.camel@posteo.de>
	 <2026030913-agonizing-shoptalk-ed98@gregkh>
	 <7f8d979a881b29398f524f526f52ba9727d95a7c.camel@posteo.de>
	 <DGYAFNSJ7576.1E0JZ2W499ZQ7@kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-T1kMmmIZGIBf266lMpSU"
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-T1kMmmIZGIBf266lMpSU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-03-09 at 14:32 +0100, Danilo Krummrich wrote:
> On Mon Mar 9, 2026 at 1:52 PM CET, Markus Probst wrote:
> > Yes. I will split it into multiple drivers using the aux bus in the
> > next revision.
>=20
> Independent of the other discussion whether this belongs into the kernel =
in the
> first place, reading over the cover letter and commit message I understoo=
d the
> following.
>=20
>   "Synology uses a microcontroller in their NAS devices connected to a se=
rial
>   port [...]" controlling LEDs, fan speeds, a beeper, etc.
>=20
>   I.e. it muliplexes several physical functions that belong to different
>   subsystems, such as hwmon, input, etc. over a single serial port.
>=20
> This sounds like a textbook candidate for MFD to me.
>=20
> I.e. there is a very loose coupling of the different functions that make =
up for
> entirely independent drivers, except that they share the same serial port
> connection.
>=20
> Whereas the auxiliary bus is more for very complicated devices to be brok=
en down
> into more managable (sometimes optional) sub-domains, where the correspon=
ding
> drivers usually have driver specific APIs to interact with each other.
>=20
> - Danilo

QNAP and Synology do things very similarly.
There is already a driver for QNAP devices:

drivers/mfd/qnap-mcu.c
drivers/leds/leds-qnap-mcu.c
drivers/input/misc/qnap-mcu-input.c
drivers/hwmon/qnap-mcu-hwmon.c
drivers/nvmem/qnap-mcu-eeprom.c

drivers/power/reset/qnap-poweroff.c (this one is not part of the mfd)

and I try to implement the equivalent for Synology devices.
Given its a MFD I would assume the same applies to this driver?

Thanks
- Markus Probst


--=-T1kMmmIZGIBf266lMpSU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmmuzT8bFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSc8wP/0Isj7yZNFcmzSeM04qd
XJftgRON1Dgru3b3iXtVhBxQNslTe+hxxEUNwgl1Vnr1meu7R82AASIvlms8Vy2Y
n+SpIwLj7HIAqIkmVVa9NbAquX7DgpqMUTJZKnW6oyiy1gHSzyYsG/6l2BrxqoHH
kfgfFoZywOCigXMyRFqzNI+EHQYsnOGL++L+/pTWV4hjdPUHCjRb95ajcofHMGix
MjA1aSpI4M+ptTlwjb9H4zrwg2YljeqvjotTHewayN6yxaRwtn5rmrmretRq9QQH
PRMHEJqUtO54OFkM1wsyknP5dvwrBkbfDtt40O7KF2fpOrroIBXL76tL1a7InPAm
n6qc4qWYx3q0jCNewr0unuQLxUEnq4271JGHqnx3jHqXJarVuuTg8KwE3z8oABX9
4X9oDVozQBeK6kKv/25yqMQU4+yT4QBQu2k3ggP/21PglBg4cybFeLyU1nG1C88P
HaStDmCy4og2MGHUjSS5wTYhQo/kOfS8TTnlTDs9eFMvdG1CFeCTDyJtxkoAwnE9
CGKDZYRM2NvGlQx58w4mq+W7I2hvyhayHfnOwBmv9/wNi2acHBijqyYFXd93WwEG
xybEit1Ph9I1P+hsjqhUF8sFX8aw1jQjJB1BpixgBxt2tGCuNISyYUM4DGRbot17
y4BSwMWxg3tJ7td7E/2OeSyp
=KSKl
-----END PGP SIGNATURE-----

--=-T1kMmmIZGIBf266lMpSU--
