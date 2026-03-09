Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADFE3BFE2D
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Mar 2026 12:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060752; cv=none; b=NFdHV/6EESRY8cKgdyoONzhx3w9pl0hOknpvmhuGbajuHdoef2Do5aHkQKnONMFyiNhoGW0vC3DIAR6+e36br7DdmS3NaOVjYf5Disb2N+D3N7/PSyLTwtiSWHHQyr3jqiKrOKgrem0gZFwESdVNUypUSy1Sulr8GB+GvLbFfQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060752; c=relaxed/simple;
	bh=3ee+vYrC8/I1iVBEQkbZeVDI2ZLO382QP65f0djDO9I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tq38rEfH5Bt0JGrU/OE2GAD+1IMBENB3268DbCWBZRVLB49q7hJUnG9ZLKz2dunTSxewJ/OFmaMgDt3fDnt1YpwI+WVO4814s/MHMM7aB9yEGDaN5TI65vxWZbLHpZ0vKTpEcX6DY8BiYKFIKA+s9GoO6KrUPMYkxECSqKyM1js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=ZDqQYif3; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="ZDqQYif3"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 245AA240101
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Mar 2026 13:52:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1773060747; bh=L599HnIFbHI+ygQFPVs7pr+ijYVAhp9CYhIJ4BEsICo=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=ZDqQYif3lR2r8RudZPSjRfVTaUo5ZFvDTHRwKhcLBe8XKXewNhbWlBCLP50yjv69C
	 9nF8ORWprNEW7czTyLI5vTUMbKQCI5EwSWJnVuXLoNGK/JOA2emWw0TaWhakzxT94e
	 CVHmXc+AC0JQcip7KRjIcd2MY5mliww0kP7ItfXeEGRRhGNzqr1kyfIRMNt1/K1YzD
	 DEo5qNQ2biSqTu0cvNYhi6STMP+rC1zv06JjPagzcAgBvfi+nENtXnam17OshOnqxi
	 05F3oc6N/oFZoxbQYANbbSOY05oXYWoFUO4ONUjSJCje2Tww6xoQ9GfU9P1b/pXmQ9
	 vOSgrSIDKChPg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fTxk06wzxz9rxG;
	Mon,  9 Mar 2026 13:52:24 +0100 (CET)
Message-ID: <7f8d979a881b29398f524f526f52ba9727d95a7c.camel@posteo.de>
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
Date: Mon, 09 Mar 2026 12:52:26 +0000
In-Reply-To: <2026030913-agonizing-shoptalk-ed98@gregkh>
References: <20260308-synology_microp_initial-v2-0-9389963f31c5@posteo.de>
	 <20260308-synology_microp_initial-v2-2-9389963f31c5@posteo.de>
	 <2026030827-nautical-overplant-399c@gregkh>
	 <8efdf3e1bbf24504d560c12131cade543bec82f5.camel@posteo.de>
	 <2026030913-agonizing-shoptalk-ed98@gregkh>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-bgu6idqlxY5C4rF6OCfY"
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-bgu6idqlxY5C4rF6OCfY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-03-09 at 06:56 +0100, Greg Kroah-Hartman wrote:
> On Sun, Mar 08, 2026 at 07:15:16PM +0000, Markus Probst wrote:
> > On Sun, 2026-03-08 at 19:55 +0100, Greg Kroah-Hartman wrote:
> > > On Sun, Mar 08, 2026 at 06:41:20PM +0000, Markus Probst wrote:
> > > > Add a initial synology microp driver, written in Rust.
> > > > The driver targets a microcontroller found in Synology NAS devices.=
 It
> > > > currently only supports controlling of the power led, status led, a=
lert
> > > > led and usb led. Other components such as fan control or handling
> > > > on-device buttons will be added once the required rust abstractions=
 are
> > > > there.
> > >=20
> > > Why is this a mfd device?  Shouldn't it be an aux device?
> > >=20
> > > But this is just a serial port connection, so why is a kernel driver
> > > needed at all?
> > I am not sure what you mean.
>=20
> Can't this just be controlled from userspace over the tty device to the
> uart this device uses?  Why is a kernel driver needed at all?
Like with any other bus device, it can be controlled by userspace.

But the kernel already provides the necessary userspace interfaces for
leds, hwmon, input etc. for any userspace application to access.

Furthermore it is required for proper shutdown and reboot, which is a
kernel task.

On arm devices, it completely takes care of the poweroff and reboot.
There is already a driver here drivers/power/reset/qnap-poweroff.c,
which seems to be primarily developed for QNAP, but works for Synology
too.

On x86 devices, is uses ACPI Sleep, but must still announce the
poweroff / reboot prior to the firmware call to the device for proper
shutdown / reboot. There is no existing driver that takes care of this
yet.

>=20
> > It has multiple functions (leds, hwmon, power/reset, input etc.) and
> > does is a multifunction device (mfd).
> >=20
> > It does not however use mfd-core or anything from the auxiliary device
> > and instead implements its functionality directly in this driver.
>=20
> If it does not use mfd-core, then it should not be in drivers/mfd/
> right?  Instead, use the aux bus code to split this up into different
> devices and attach them that way, as that's what the aux bus code was
> created for.
Yes. I will split it into multiple drivers using the aux bus in the
next revision.

>=20
> thanks,
>=20
> greg k-h

Thanks
- Markus Probst

--=-bgu6idqlxY5C4rF6OCfY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmmuwm0bFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSem0P/RbVXmxxFd4wG7NlUrcx
aZMiQtoQ7rlk6M6wylBsJlm0zDJUmb3NnZ/7M/NMw3O1jLKRbdlvBd3L1K07CA9W
q9HRuUntbAxvSWDRHORNhq1uJFDHMSbqZ9OwrhvCdlb5DddRtPs52P39w+CGzosV
JMMb0v2K2/Fr1R2RcNbC5kfLQnVWIW/YDFtpOa4XivTSo1e5G/kVBfnWXeLYH09J
rGhw0ORe/Xli9AnuK3zXefceEHHTqGh/3LqpjA7wdMA5vCsNG1gjpm/X1ftgIfID
jkKF7PKV1bew9DjMdunhE+jClulLL+xMeCKuOt/7RPpjhuLn3nIk/TLqa69pGIGc
0S9b0XCR10gROwaeiDF2H9WJKNyhrdZOCHVulSXpCpU4PlDbQUdGLaEH96XrFxyB
aw6/qKPWWVPY5UrMMC3WXPxHTsw5emCnsQ4vE3KPLm9pIk3RfdJOP1uVWcyJzXPT
oT0NNfHI2d5kt6mLF+ApWdOxFGzRxjdDbNSCrcMfa51ok3FLf7TyAo9k1xNGcAI5
kTOtod4TU2DkuRbgywLdu0224YvFLjEg5QOYd9xXvwnN2Lk8vaE0HwmUCPerx6ud
Kcz/wAwWjeqiBlqC85yyAZRIWKip59ferlpcC3ofkmE2IipYwrmV0JVW+fSkwQUj
X/GFbQsmIN/M2IdETf4VycaQ
=5lLP
-----END PGP SIGNATURE-----

--=-bgu6idqlxY5C4rF6OCfY--
