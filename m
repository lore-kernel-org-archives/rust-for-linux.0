Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9AC225417
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Mar 2026 14:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772894616; cv=none; b=my/AxCHjSB79j/KcN231YK4HdEzucpFFU7+nwHicbtKnsjL6XuuhPr6338a82FAzY4BThmHSIgLJrQqwz3M/JvJRafucahNZGP83qwkcwEMMd8ojxZhtJpPJGP7HyYyOSJ/qjv3rlL4lQMOwbyNw8cCQm5Z2v8n1maIynGdVHuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772894616; c=relaxed/simple;
	bh=qD0U5lewz7426Q2YvwhJNhtvRwekMbJ2NJP5kc56hjI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gsd4iJjrJnaI680C5uP7OaMFlet8Mts9Oy3WhP1DKsof7GeUNH4PAAVYxMmfO977xVgPYjzs9AfFiWM3r0oHT5CjAU5IqcojiiM0dcNZAZ3230+N9ZgR1z6XhsFTVe+L6kL+9RDhJrEvIF80dhHeIYEkhY+DWZgquLYkRhjrh0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=hO/OPOlL; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="hO/OPOlL"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id D19A9240103
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Mar 2026 15:43:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1772894611; bh=gkn5VetmaVc1kf4PBy8wcklq2xsb1pnj9jUKQzNsy+o=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=hO/OPOlLamalCA0hRVQg+sPJZ43gjTIBuuatmOvqMvukShxRUrB/uTglX7LfZByjn
	 TUoOFWPHqrbaH1zlD4nmmo4UTHoAAwHO/m03aDA3IPxtS3udRrI3gyRXT15l0m63c5
	 aLLHw6KfBBq5wzBI/7yT+IgFYJQVWD9Vg5/FMepMqKOMpN3st3kSGcsSFV1biXGN3o
	 OBeaWz6JYFtH5OJ9C4j1vwU4dEbWQBeaaciGvugWFGwxwtpPBVymYRvK+l1qJpuxBp
	 aSne/HQCHR+iE0uxC5BooDPU4XaQe8jGPQgSjGkOZ+u4QUR84C/Oy57sryO/56/2MP
	 6CAG+9OnoYDUA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fSmH54Bpnz6tvk;
	Sat,  7 Mar 2026 15:43:29 +0100 (CET)
Message-ID: <347d1d2c676c70dd041e287e83b4bbe6a2784a9f.camel@posteo.de>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add binding for synology,microp
 devices
From: Markus Probst <markus.probst@posteo.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,  =?ISO-8859-1?Q?Bj=F6rn?=
 Roy Baron	 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, rust-for-linux@vger.kernel.org
Date: Sat, 07 Mar 2026 14:43:30 +0000
In-Reply-To: <be179573-edc3-4b6c-8c91-ae7b0c61c1b1@kernel.org>
References: <20260306-synology_microp_initial-v1-0-fcffede6448c@posteo.de>
	 <20260306-synology_microp_initial-v1-1-fcffede6448c@posteo.de>
	 <be179573-edc3-4b6c-8c91-ae7b0c61c1b1@kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Z9LPrWNQMdm4nklMoFU9"
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-Z9LPrWNQMdm4nklMoFU9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-03-07 at 11:20 +0100, Krzysztof Kozlowski wrote:
> On 06/03/2026 20:38, Markus Probst wrote:
> > Add the Synology Microp devicetree bindings. Those devices are
> > microcontrollers found on Synology NAS devices. They are connected to a
> > serial port on the host device.
>=20
> A nit, subject: drop second/last, redundant "binding for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetre=
e/bindings/submitting-patches.rst#L18
>=20
> >=20
> > Those devices are used to control certain LEDs, fan speeds, a beeper, t=
o
> > handle buttons, fan failures and to properly shutdown and reboot the
> > device.
> >=20
> > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > ---
> >  .../devicetree/bindings/mfd/synology,microp.yaml   | 75 ++++++++++++++=
++++++++
> >  1 file changed, 75 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/synology,microp.yaml=
 b/Documentation/devicetree/bindings/mfd/synology,microp.yaml
> > new file mode 100644
> > index 000000000000..0fcb0b750bf0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/synology,microp.yaml
> > @@ -0,0 +1,75 @@
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/synology,microp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Synology NAS on-board Microcontroller
> > +
> > +maintainers:
> > +  - Markus Probst <markus.probst@posteo.de>
> > +
> > +description: |
>=20
> Do not need '|' unless you need to preserve formatting.
>=20
> > +  Synology devices contain a microcontroller on their device to contro=
l
> > +  certain leds, fan speeds, a beeper, to properly handle system shutdo=
wn
> > +  and reboot, buttons and fan failures.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - synology,microp
>=20
> Missing blank line. Look at other bindings how to write one.
>=20
> > +  power-led:
> > +    $ref: /schemas/leds/common.yaml
> > +    unevaluatedProperties: false
> > +  status-led:
> > +    $ref: /schemas/leds/common.yaml
> > +    unevaluatedProperties: false
> > +  alert-led:
> > +    $ref: /schemas/leds/common.yaml
> > +    unevaluatedProperties: false
> > +  usb-led:
> > +    $ref: /schemas/leds/common.yaml
> > +    unevaluatedProperties: false
>=20
> That's pretty unreadable code.
>=20
> > +  no-check-fan:
>=20
> Vendor prefix
>=20
> > +    type: boolean
> > +    description: |
> > +      Disable fan failure check.
>=20
> You described the desired Linux feature or behavior, not the actual
> hardware. The bindings are about the latter, so instead you need to
> rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.
>=20
> > +
> > +      The fan failure event is triggered on the device, even if the fa=
n
> > +      has been intentionally set to a low speed. This property prevent=
s a
> > +      hardware protection shutdown if a fan failure event is reported.
> > +  no-check-cpu-fan:
>=20
> You described the desired Linux feature or behavior, not the actual
> hardware. The bindings are about the latter, so instead you need to
> rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.
>=20
> > +    type: boolean
> > +    description: |
> > +      Disable cpu fan failure check.
> > +
> > +      The cpu fan failure event is triggered on the device, even if th=
e cpu
> > +      fan has been intentionally set to a low speed. This property pre=
vents
> > +      a hardware protection shutdown if a cpu fan failure event is
> > +      reported.
> > +
> > +required:
> > +  - compatible
> > +  - power-led
> > +  - status-led
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/leds/common.h>
> > +
> > +    uart {
>=20
> Drop, unuesed
The device uses the serial device bus. Thus the device node needs to be
inside a uart device node. The uart node represents a serial device
port in that example.

This is also done the same way in
- Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml
- Documentation/devicetree/bindings/net/nfc/marvell,nci.yaml
- Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml

>=20
> > +      microp {
>=20
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-device=
tree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).
"mcu" seems the most fitting, altough it is not part of the list.
It it used here though:
- Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml

>=20
> > +        compatible =3D "synology,microp";
> > +
> > +        power-led {
> > +          color =3D <LED_COLOR_ID_BLUE>;
> > +          function =3D LED_FUNCTION_POWER;
> > +        };
> > +
> > +        status-led {
> > +          color =3D <LED_COLOR_ID_MULTI>;
> > +          function =3D LED_FUNCTION_STATUS;
> > +        };
> > +      };
> > +    };
> >=20
>=20
>=20
> Best regards,
> Krzysztof

Thanks
- Markus Probst

--=-Z9LPrWNQMdm4nklMoFU9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmmsOY0bFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSHAcP/R4hsVTBVkVSs/+oHk4+
GLY7t2uaSeUFKsA7C2Y57r7cGkapvK62PkQItuSUpsyER2oXXGYfVqC6R+u1Z/3N
q18fgRk/oBOCfp5kbeZXTvmZEIFxteNrw5t9tvStJQuoQkN0vIp5WZ3B5UjS2WrE
Ws8P0y6C3azG4Cdep0Qshn58Tmw0MZg7M1DxGd2HJdvX/PZc8+hLkqMdgTiCTzc4
/BDblf5xIVYV+tD/xT8bGbz4q8zii0TwetuSkZBVw4ogs/6j2YE6w0z+0g4YZSbC
0kPJkfRwjUG/PEzz4Yo9moV6KEHhjE4yZ2hr6dfHOU+oEVMPL1NMM5YBSv4a07Rq
CPW8qF6Jb1cY/f7pRQ4Hs55BtLow9rUaF6pIyNg86STFxzUUO1uEooYVxAgr1mAa
yFw0PKnsNqKIo64oFPHutjPy/zGHeDwxBpx6YvZEFo13HO7OGl+VzXmIs23w2myh
IWaShykup365xbWyh3PFKzd0pELTqU3yPq+yy8RcOWGy+GcKF+y6LvQv+MHZCU/y
uTCrQdZDolE/8UPhcRkt4NLPoReWGsozA5kr9wH8/3RHFEWlhBxZbcFREGuxER6Q
dEiIKCJrfAN3U5Xavr7zRv7Qqs+UpNrAVdyMKtq2yosr/uL6pdTn6uTDolCPXCz5
3svU61qpWesk/wtc6FjMLVG/
=2ENr
-----END PGP SIGNATURE-----

--=-Z9LPrWNQMdm4nklMoFU9--
