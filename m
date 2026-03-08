Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E2614A62B
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 19:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772997321; cv=none; b=l/rFrtvYaX7yvsfPPr6svlCXCI+44245NRDIBmnhf0Gsuk//szJhB//xgDB0ygOvwSiFfma3qhiOnRDXW8pEtUK2xa/7YHbmMbMON5Y4J1A/XIUynPa7taXxsqzYlZMQy7DAYmbB5QAleDvkesen0NeENKDJmVU+Tkn4haZTuBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772997321; c=relaxed/simple;
	bh=7UvTC6xCZ3yeIe4Ffa62LfvXczu2vC3C8jGopGE8bQQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EJdj518icJ1eILrgYcG5TqRKOBPePkzr86mfu8rc7AKamg5isFLdJAd57MYHh/7JA1dpNMrp56dQ04pp7w/WPApCUsU+aw9qrLzf+t6wLmOBRhCKwwic6NAlZeOap+JxUuL8iDdP2OHUU96SfdkM1Jh1/+n67HCrzG3k3HALXfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=fiHq3o/u; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="fiHq3o/u"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 78F13240106
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 20:15:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1772997317; bh=g5HgZFXY3ZvnL63FgQ0uIHeXkwnilTEMYDmvJLJe3NY=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=fiHq3o/u5qkraUNjVzgP2Fa4WlUH3Jc0Kjl7H4+a5Ycwwk+m1PAn/ZvcBv3ZngpC9
	 SLvUFZPXHHG0uxDqqFtCvxMFFmEjphfQbSh4g0voXoBxg3m5X3Cnm12HC5OaVIufSl
	 Tu2GjqxrPWF4Dk3OLyu8x0FAb/zVd1oGePhs3V1qZrNrlaLQpsZ/ngKhzBsIbWuyRW
	 RyqangyjugyT2PZGdg2LAKtAWyW0uxd7KcHK/SF6dMarRdu3JMpTgIoV9ETjj5P1s9
	 /wZ18Wk2wNTQ9jnOz8es0fYSkWc1fncEGBgAVfu2b99KJEkJQOI6Y5PIBIRXFNUYl6
	 B9uKNMSHA9ieA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fTVGC3S8Rz6twH;
	Sun,  8 Mar 2026 20:15:15 +0100 (CET)
Message-ID: <8efdf3e1bbf24504d560c12131cade543bec82f5.camel@posteo.de>
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
Date: Sun, 08 Mar 2026 19:15:16 +0000
In-Reply-To: <2026030827-nautical-overplant-399c@gregkh>
References: <20260308-synology_microp_initial-v2-0-9389963f31c5@posteo.de>
	 <20260308-synology_microp_initial-v2-2-9389963f31c5@posteo.de>
	 <2026030827-nautical-overplant-399c@gregkh>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-R8hoP/UhcjTj/XsnmBb2"
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-R8hoP/UhcjTj/XsnmBb2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2026-03-08 at 19:55 +0100, Greg Kroah-Hartman wrote:
> On Sun, Mar 08, 2026 at 06:41:20PM +0000, Markus Probst wrote:
> > Add a initial synology microp driver, written in Rust.
> > The driver targets a microcontroller found in Synology NAS devices. It
> > currently only supports controlling of the power led, status led, alert
> > led and usb led. Other components such as fan control or handling
> > on-device buttons will be added once the required rust abstractions are
> > there.
>=20
> Why is this a mfd device?  Shouldn't it be an aux device?
>=20
> But this is just a serial port connection, so why is a kernel driver
> needed at all?
I am not sure what you mean.

It has multiple functions (leds, hwmon, power/reset, input etc.) and
does is a multifunction device (mfd).

It does not however use mfd-core or anything from the auxiliary device
and instead implements its functionality directly in this driver.

>=20
> > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > ---
> >  MAINTAINERS                                    |   6 +
> >  drivers/mfd/Kconfig                            |   2 +
> >  drivers/mfd/Makefile                           |   2 +
> >  drivers/mfd/synology_microp/Kconfig            |  14 ++
> >  drivers/mfd/synology_microp/Makefile           |   2 +
> >  drivers/mfd/synology_microp/TODO               |   7 +
> >  drivers/mfd/synology_microp/command.rs         |  50 +++++
> >  drivers/mfd/synology_microp/led.rs             | 275 +++++++++++++++++=
++++++++
> >  drivers/mfd/synology_microp/synology_microp.rs |  82 ++++++++
> >  rust/uapi/uapi_helper.h                        |   2 +
> >  10 files changed, 442 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e9e83ab552c7..092cd9e8a730 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25550,6 +25550,12 @@ F:	drivers/dma-buf/sync_*
> >  F:	include/linux/sync_file.h
> >  F:	include/uapi/linux/sync_file.h
> > =20
> > +SYNOLOGY MICROP DRIVER
> > +M:	Markus Probst <markus.probst@posteo.de>
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/mfd/synology,microp.yaml
> > +F:	drivers/mfd/synology_microp/
> > +
> >  SYNOPSYS ARC ARCHITECTURE
> >  M:	Vineet Gupta <vgupta@kernel.org>
> >  L:	linux-snps-arc@lists.infradead.org
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 7192c9d1d268..bc269719749f 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -2580,5 +2580,7 @@ config MFD_MAX7360
> >  	  additional drivers must be enabled in order to use the functionalit=
y
> >  	  of the device.
> > =20
> > +source "drivers/mfd/synology_microp/Kconfig"
> > +
> >  endmenu
> >  endif
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index e75e8045c28a..0a6fa33d5c35 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -304,3 +304,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+=3D rsmu_spi.o rsmu_cor=
e.o
> >  obj-$(CONFIG_MFD_UPBOARD_FPGA)	+=3D upboard-fpga.o
> > =20
> >  obj-$(CONFIG_MFD_LOONGSON_SE)	+=3D loongson-se.o
> > +
> > +obj-$(CONFIG_MFD_SYNOLOGY_MICROP)	+=3D synology_microp/
> > diff --git a/drivers/mfd/synology_microp/Kconfig b/drivers/mfd/synology=
_microp/Kconfig
> > new file mode 100644
> > index 000000000000..4bbbcf0b6e94
> > --- /dev/null
> > +++ b/drivers/mfd/synology_microp/Kconfig
> > @@ -0,0 +1,14 @@
> > +
> > +config MFD_SYNOLOGY_MICROP
> > +	tristate "Synology Microp driver"
> > +	depends on RUST
> > +	depends on SERIAL_DEV_BUS
>=20
> We don't have rust serdev bindings yet, but if we do, shouldn't you just
> depend on them instead of two different things here?
I will add a `RUST_SERDEV_ABSTRACTIONS` Kconfig entry in the next
serdev rust abstraction patch revision then.
>=20
>=20
> > +	depends on LEDS_CLASS && LEDS_CLASS_MULTICOLOR
> > +	default n
>=20
> n is always the default, no need to say it again :)
I took some inspiration from the NOVA_CORE Kconfig entry, since that
driver is work in progress too.

>=20
> thanks,
>=20
> greg k-h

Thanks
- Markus Probst

--=-R8hoP/UhcjTj/XsnmBb2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmmtyr4bFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSj84P/3So/v/4BtnwrDs1HrpO
ZcnCndSBLbo/c/bd9WwsZ/NL+svAPel05jA2rLrhqwI/K9Hi8XCkjXFKUcbyQkX+
w9zFeVJDMoAAl965nHFSz/fnK6wgb91n0Uc6Fo3psyDU9m5Rk8AHuTHMlSq5wymU
mRA7nS082FyVS/fVygjbNQU8AtpXn4yuQVqhVH3Xc/QaXbq/qeEbhcejg+pSBnZP
PzhbWZZXKbjNzIOSjGddl/24691Cv6kz0yQfsAely0t+7QPu3Exjqwbf4RmyVvTl
uwaYSyBcG6fHc5zvXBX0llqB7xE+vaITOyA6uThc16uH8qfd7AmcdP2+CbqqCLY5
fVcJgch+Xhb2ifJNM+YUwutpZ5XYs5obUIxDn1ewhCRzxtD9fe+dKFp0gECC6hbW
EjmY1MXH3MHe6GCgRm59v7ZOUCJPyKf0IW/Wv49cOk5etp3Mb9yOi+02eL4HhMpo
uTL2xItsyohdTYZJGgyao38cS/oJGX4J+paeMnPKvuJuZBjrdZEvuF7iLHJCwJIp
NiEpln2LAnqV3XPkvCO4e0shtuvNbW1WBaO0B+Qpf3mYMI1Xcirm8YJQDaVPvXMO
W0dBXAoL9k3WPO2lp537rw/xlw6EjDcLIdBIUq14QljrVgQYHJR/vDlhGkRZDTub
sh8CuV3krLvtx7Fwma1kqVHA
=Vqq5
-----END PGP SIGNATURE-----

--=-R8hoP/UhcjTj/XsnmBb2--
