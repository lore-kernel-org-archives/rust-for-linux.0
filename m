Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CE13921C6
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Mar 2026 13:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773063269; cv=none; b=ffZPY9PNvtRqsX1OK8BqZ6VwPD+YMsrTeGBCkvvpr+Lv2BxxUciKTUQDraoF3rG1/QTGUjCR+Cuz6k2Q5Xf/XmKAL3Rrj+/nctXj8C2VTE7yCkrocGkND2vTCnhOBQNQ+cs30v0epBrun6q6AXWrRnRrlaxHMa4YSCE8QqeV0M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773063269; c=relaxed/simple;
	bh=0QNN8HJVsCLt3pMaP0UrdF87gLsstLUf1pALNscYM+c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FHVMUUqnXL9OT48oIvneXHCB6X0QpMQ5KA9yiiTf1FkUt7jXgh2sWO6miS1TMIQz/ZEpy71aVdlZNkPxbuOEwebXw8RnNMODDcKTRPHcauV/TAGKD5ye5fkf+cMkgewlCOSWB4OWsNZARQ5MuTCORxjjus9xBLEryOoHVkjJzN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=UPaDCqVy; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="UPaDCqVy"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 0B998240105
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Mar 2026 14:34:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1773063261; bh=78ffheznkvdd1hlXwgUlajWzxElEZrmPuuFUCA238J0=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=UPaDCqVyW6+9UdWSWkeq99kKJRBhJXOjnvwyc+shIV3qGrrV2mrSS+akTGp5Uu87j
	 sblAHqxdGWbhF/2LgI5+lIzoMu9ZS5Tcm5/y9xv608EBrXB3YOZ/eSnTzoGOrKH999
	 Tc53RnoT0n+rliP/49gCYPs1gF8SaTUyAr6x/0mV+EJYc/tLk9YqdakDShj6p4UHH3
	 j0tMXGuMUgdSoxyZhO4uN/TCJGDbAPwj/m704LQQ/tFbAFZDP5nfn/Rj4sDPUea+rC
	 j9W2T3kj1MEtruzaG45HZAshvUHLIHI917xSRrL3lDWLFjUfAVIv02hEfmchlWfcMQ
	 NoQJyoqzGgThg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fTyfL6JFFz9rxF;
	Mon,  9 Mar 2026 14:34:18 +0100 (CET)
Message-ID: <cb18efd0c3ef3be8fb71715e39a91a7b13089eca.camel@posteo.de>
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
Date: Mon, 09 Mar 2026 13:34:20 +0000
In-Reply-To: <2026030951-implant-girdle-d812@gregkh>
References: <20260308-synology_microp_initial-v2-0-9389963f31c5@posteo.de>
	 <20260308-synology_microp_initial-v2-2-9389963f31c5@posteo.de>
	 <2026030827-nautical-overplant-399c@gregkh>
	 <8efdf3e1bbf24504d560c12131cade543bec82f5.camel@posteo.de>
	 <2026030913-agonizing-shoptalk-ed98@gregkh>
	 <7f8d979a881b29398f524f526f52ba9727d95a7c.camel@posteo.de>
	 <2026030951-implant-girdle-d812@gregkh>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=mQINBGiDvXgBEADAXUceKafpl46S35UmDh2wRvvx+UfZbcTjeQOlSwKP7YVJ4JOZrVs93
 qReNLkOWguIqPBxR9blQ4nyYrqSCV+MMw/3ifyXIm6Pw2YRUDg+WTEOjTixRCoWDgUj1nOsvJ9tVA
 m76Ww+/pAnepVRafMID0rqEfD9oGv1YrfpeFJhyE2zUw3SyyNLIKWD6QeLRhKQRbSnsXhGLFBXCqt
 9k5JARhgQof9zvztcCVlT5KVvuyfC4H+HzeGmu9201BVyihJwKdcKPq+n/aY5FUVxNTgtI9f8wIbm
 fAjaoT1pjXSp+dszakA98fhONM98pOq723o/1ZGMZukyXFfsDGtA3BB79HoopHKujLGWAGskzClwT
 jRQxBqxh/U/lL1pc+0xPWikTNCmtziCOvv0KA0arDOMQlyFvImzX6oGVgE4ksKQYbMZ3Ikw6L1Rv1
 J+FvN0aNwOKgL2ztBRYscUGcQvA0Zo1fGCAn/BLEJvQYShWKeKqjyncVGoXFsz2AcuFKe1pwETSsN
 6OZncjy32e4ktgs07cWBfx0v62b8md36jau+B6RVnnodaA8++oXl3FRwiEW8XfXWIjy4umIv93tb8
 8ekYsfOfWkTSewZYXGoqe4RtK80ulMHb/dh2FZQIFyRdN4HOmB4FYO5sEYFr9YjHLmDkrUgNodJCX
 CeMe4BO4iaxUQARAQABtCdNYXJrdXMgUHJvYnN0IDxtYXJrdXMucHJvYnN0QHBvc3Rlby5kZT6JAl
 QEEwEIAD4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQSCdBjE9KxY53IwxHM0dh/4561
 D0gUCaIZ9HQIZAQAKCRA0dh/4561D0pKmD/92zsCfbD+SrvBpNWtbit7J9wFBNr9qSFFm2n/65qen
 NNWKDrCzDsjRbALMHSO8nigMWzjofbVjj8Nf7SDcdapRjrMCnidS0DuW3pZBo6W0sZqV/fLx+AzgQ
 7PAr6jtBbUoKW/GCGHLLtb6Hv+zjL17KGVO0DdQeoHEXMa48mJh8rS7VlUzVtpbxsWbb1wRZJTD88
 ALDOLTWGqMbCTFDKFfGcqBLdUT13vx706Q29wrDiogmQhLGYKc6fQzpHhCLNhHTl8ZVLuKVY3wTT+
 f9TzW1BDzFTAe3ZXsKhrzF+ud7vr6ff9p1Zl+Nujz94EDYHi/5Yrtp//+N/ZjDGDmqZOEA86/Gybu
 6XE/v4S85ls0cAe37WTqsMCJjVRMP52r7Y1AuOONJDe3sIsDge++XFhwfGPbZwBnwd4gEVcdrKhnO
 ntuP9TvBMFWeTvtLqlWJUt7n8f/ELCcGoO5acai1iZ59GC81GLl2izObOLNjyv3G6hia/w50Mw9MU
 dAdZQ2MxM6k+x4L5XeysdcR/2AydVLtu2LGFOrKyEe0M9XmlE6OvziWXvVVwomvTN3LaNUmaINhr7
 pHTFwDiZCSWKnwnvD2+jA1trKq1xKUQY1uGW9XgSj98pKyixHWoeEpydr+alSTB43c3m0351/9rYT
 TTi4KSk73wtapPKtaoIR3rOFHLQXbWFya3VzLnByb2JzdEBwb3N0ZW8uZGWJAlEEEwEIADsWIQSCd
 BjE9KxY53IwxHM0dh/4561D0gUCaIO9eAIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCR
 A0dh/4561D0oHZEACEmk5Ng9+OXoVxJJ+c9slBI2lYxyBO84qkWjoJ/0GpwoHk1IpyL+i+kF1Bb7y
 Hx9Tiz8ENYX7xIPTZzS8hXs1ksuo76FQUyD6onA/69xZIrYZ0NSA5HUo62qzzMSZL7od5e12R6OPR
 lR0PIuc4ecOGCEq3BLRPfZSYrL54tiase8HubXsvb6EBQ8jPI8ZUlr96ZqFEwrQZF/3ihyV6LILLk
 geExgwlTzo5Wv3piOXPTITBuzuFhBJqEnT25q2j8OumGQ+ri8oVeAzx24g1kc11pwpR0sowfa5MvZ
 WrrBcaIL7uJfR/ig7FyGnTQ1nS3btf3p0v8A3fc4eUu/K2No3l2huJp3+LHhCmpmeykOhSB63Mj3s
 3Q87LD0HE0HBkTEMwp+sD97ZRpO67H5shzJRanUaDTb/mREfzpJmRT1uuec0X2zItL7a6itgMJvYI
 KG29aJLX3fTzzVzFGPgzVZYEdhu4y53p0qEGrrC1JtKR6DRPE1hb/OdWOkjmJ75+PPLD9U5IuRd6y
 sHJWsEBR1F0wkMPkEofWsvMYJzWXx/rvTWO8N4D6HigTgBXAXNgbc3IHpHlkvKoBJptv6DRVRtIrz
 0G0cfBY0Sm7he4N2IYDWWdGnPBZ3rlLSdj5EiBU2YWgIgtLrb8ZNJ3ZlhYluGnBJDGRqy2jC9s1jY
 66sLA9rQZMHhJTzMyIDwweGlvMzJAcG9zdGVvLmV1PokCbQQTAQgAVxYhBIJ0GMT0rFjncjDEczR2
 H/jnrUPSBQJpa71VGxSAAAAAAAQADm1hbnUyLDIuNSsxLjExLDIsMgIbAwULCQgHAgIiAgYVCgkIC
 wIEFgIDAQIeBwIXgAAKCRA0dh/4561D0gKJD/9uOQKYlsDoQX65Gd0LiMT0C+5vXgr3VI0PHDOwcv
 51fJ3A1vNyPZRFPGrz8+mDEXUQOF/INfnz5Tu1QHwf+iYcWcTGAN/FHgVR6ET6VBNU2hJaKhu+Ggo
 kjYyJTOvyX+3yNRUfSny0GjTjIPuPTErjqmHF+BtjXslpgwqnNMznf3lRIuUjRORupos6p3k1DndE
 5vzUTmXSvMyXyOD2KhBl/kL76k0bHYyAQytZPag12pltrtFbA/r2phDGN2si8PooDT99bSTJjaM45
 MTAAHbHKJfvgfK41bNFD5mMtpWpL195XRtS0Nrxdg3PaYBxN5gtTG0RyZfpYRlkdEhm+jj/8RxuSG
 i/qdhRdbiI7K2IELWeQVHSNDi9JabR/UzlR4NSnhfAjRIVlRM+eFbUl8XwxwVrAkojF5IraH2qRvg
 VCmuFsHUW07FUlrDrzpjXsD73cKppoFGDCdDR0BHJepXbFLS9+AqkT+guRJlnCTg2p+TQtnbwPgKp
 Vj98JixovCl99zRYTsL2bRNU5+q8iET65VMJ1ydyNanvLd5vI/NqDkXhlXLsGmdaDTtu4R21PkToX
 dQNGrZ91M9nlIBKw8Y7c7xZ4098qX2b8JX/CxD+gC1r4C8vuA3GkhFLx+KlkON7LyiJPkrePp6Qky
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-VAzgw3m6gYEj11zVCIkY"
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-VAzgw3m6gYEj11zVCIkY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-03-09 at 14:07 +0100, Greg Kroah-Hartman wrote:
> On Mon, Mar 09, 2026 at 12:52:26PM +0000, Markus Probst wrote:
> > On Mon, 2026-03-09 at 06:56 +0100, Greg Kroah-Hartman wrote:
> > > On Sun, Mar 08, 2026 at 07:15:16PM +0000, Markus Probst wrote:
> > > > On Sun, 2026-03-08 at 19:55 +0100, Greg Kroah-Hartman wrote:
> > > > > On Sun, Mar 08, 2026 at 06:41:20PM +0000, Markus Probst wrote:
> > > > > > Add a initial synology microp driver, written in Rust.
> > > > > > The driver targets a microcontroller found in Synology NAS devi=
ces. It
> > > > > > currently only supports controlling of the power led, status le=
d, alert
> > > > > > led and usb led. Other components such as fan control or handli=
ng
> > > > > > on-device buttons will be added once the required rust abstract=
ions are
> > > > > > there.
> > > > >=20
> > > > > Why is this a mfd device?  Shouldn't it be an aux device?
> > > > >=20
> > > > > But this is just a serial port connection, so why is a kernel dri=
ver
> > > > > needed at all?
> > > > I am not sure what you mean.
> > >=20
> > > Can't this just be controlled from userspace over the tty device to t=
he
> > > uart this device uses?  Why is a kernel driver needed at all?
> > Like with any other bus device, it can be controlled by userspace.
>=20
> Great, then usually that means it should not be a kernel driver :)
Not sure if this is an argument. The same would apply to the majority
of kernel drivers.
>=20
> > But the kernel already provides the necessary userspace interfaces for
> > leds, hwmon, input etc. for any userspace application to access.
>=20
> True, but:
>=20
> > Furthermore it is required for proper shutdown and reboot, which is a
> > kernel task.
>=20
> What do you mean by this?  What does it do for shutdown and reboot?
>=20
> Is there an out-of-tree C kernel driver for this somewhere?  Or does it
> all just work through userspace today on these devices?
On the proprietary os of those devices,
the shutdown and reboot part is done in their modified version of the
4.4.x linux kernel.

Most of the interactions with this device however is in a proprietary
kernel module called "synobios" (source code not available), which
exposes this via their own proprietary ioctls.

>=20
> > On arm devices, it completely takes care of the poweroff and reboot.
> > There is already a driver here drivers/power/reset/qnap-poweroff.c,
> > which seems to be primarily developed for QNAP, but works for Synology
> > too.
>=20
> But that's not this device, that's a different device and driver.
Different driver, but supports the same device. See the "Can also be
used on Synology devices." comment on top and the "synology,power-off"
entry in the of_match_table.

>=20
> > On x86 devices, is uses ACPI Sleep, but must still announce the
> > poweroff / reboot prior to the firmware call to the device for proper
> > shutdown / reboot. There is no existing driver that takes care of this
> > yet.
>=20
> Then that should be a kernel driver, no need for the led blinks to be a
> kernel driver if they don't have to, right?  We try to only put stuff in
> the kernel that _has_ to be in the kernel, within reason.
Are you trying to refer to the led part of this driver, or to a prior
patch series by me regarding a more feature-rich disk trigger for led
blinking ("leds: extend disk trigger") ?

In case of the later, I have started working on a non-device-specific
userspace daemon as replacement.

>=20
> thanks,
>=20
> greg k-h

Thanks
- Markus Probst

--=-VAzgw3m6gYEj11zVCIkY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmmuzEsbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSHHMQAKss59Cqe9XmLAyUJrGz
dWgxoJ3M6d7PPVxv8ZDb428gpVt7kcHUvwuDm73b9W1/HRbL0+4oIPOdfJVTJBwD
ufcBexjhVeg460o4dpfncfEzi9PK9qJ/syv/VpPzwCpXegUsA5iVTsJrYyGnpgUw
5DsUMQrn9ObY95dQtXcS3UL8avwbIXQT5cSrRZJ49SbbqMSPr0In8yHtqi9x74MK
8BF4xGOjpCeya2pUH+4qnZ3CdGzswA5mWKBjBw/ebwg+pg5ypYN+NL2/r8VazLU4
CzFcQCwNQetrzMSJVGUNFe4pNARygqlHVoAqw3AN+fq38IVF51kYD4NfDbsDibuG
ic1BeE++scMaxBvawnYpP5gSC+wQ2lin8mZc2GfBja8RKJOpXAfVBaaNfol/j9g9
lP97PCickr58pgyQOhF3uF4kxZ/1QcoZX61lrgWiKJCXHRMNJjzgeESpcHAL8v0V
uKqzgX4RFaw1719ShOjuFr+EcBUPRf4zsrrau6Hh7b4Hr3NvH2wgM9BvmO60rZa3
ZGETgqrKP9OjhqJ3E48Ug47QL6a2A07powxM79Rd6yw89KaZvc3LFBXpHVddSClI
Jebl3JbxT8nFYyvx+Ioq5mFVacNRlqKNG75wxVo0CULX93eLY0nsxoCdl+oYroap
gx1idLV79sqg0jEy+12+TyJ8
=22RV
-----END PGP SIGNATURE-----

--=-VAzgw3m6gYEj11zVCIkY--
