Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF8633E36A
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 19:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774553810; cv=none; b=f6yHSRT1D/cCWqTzmGt4DIxlsC3QZRZel9WYdK4pyhlI2m1T/GJ5r2Pcw2kVPIIbmsD4jKdqU8o94Evy+Tqgi6Yf9O3mljEBuclim6RyOMwdH0Z/W4IQgooxyJ/V1TRJ34n5PACQq2NzxEdCt3mH2ZEUiCTbGoPEE6OoH5HzZ60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774553810; c=relaxed/simple;
	bh=Y8k7EXox3D+ZRP8LgBQgmnG8EtJyL3JiJ19+66b8wa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VbF5M1ZQcfROFo9/erKXVJnzaVYLHkftuwZ5FsIAIOHsXxcQUgLan5EmM1qTjbHz1hrV2wOGDyB8QtnM4/yWiwHN/Wrcy+HC0nRStcfwuzDozEomW68T4IOetoKD3oaVJa07tLOl9YDdO9FYkqUdQIGlHZ/DLnV6KsGVvghBE/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E01d4B3r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E01d4B3r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97505C2BCB4
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 19:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774553810;
	bh=Y8k7EXox3D+ZRP8LgBQgmnG8EtJyL3JiJ19+66b8wa0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E01d4B3rivNQ3saiDENbK/HATRwydbLq1rSl//CO+C2+PdIrTsXS4Wi2BIdjEVNEP
	 +3Pucv9BZFsO6R0w6J61YDFNuWGRyjLe33JbiW6vk67DqK+vPzwg421F8+uGGK9zJa
	 2KMBcRpeHePCJmArBugIqG5DpX+VvRDEaslK2RO6Utw/2nHFzlRuZg55tLbxwzmkJN
	 eRhdXMPEEwb/J4NuQ6qekVBbjn7FJyeiTLSU/UhM9hYy4aCIyWCeVK+dwAzDLYl74A
	 xyCJAUh0eLBwUP7dQJlWvJvhd/ZkNWt4H2QvvJwza1J2uCAJkVCOxWFJ3kdVMI+xPM
	 Cs+rSIumgkz/A==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66b18af8c88so529414a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 12:36:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWeeBtN3M98WmtpDhmIPGTqStcTKlLTOqkU+A+xMrELw0AkSEqiUZUVErPo0N5+hefK0Z0a4hMFvhn0Xb300g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXLKVojH48y1CbRw2B/HtqAcvi4haVoHORFJoEm33S6o11OG4u
	d+zQdy0eqdAdvK2+KuT/FL2YI4NJh4JPIA7oX8knzXhY0N3K/quQwHyi0ekR00eNt7UJ7bK9E3R
	mEF3wthfF4U5GhEyBLja/E2l1yk0emw==
X-Received: by 2002:a05:6402:210f:b0:66a:44cf:5fd7 with SMTP id
 4fb4d7f45d1cf-66a8264d347mr7059929a12.12.1774553808997; Thu, 26 Mar 2026
 12:36:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320-synology_microp_initial-v4-0-0423ddb83ca4@posteo.de>
 <20260320-synology_microp_initial-v4-1-0423ddb83ca4@posteo.de>
 <20260321-rose-armadillo-of-drama-09fdcf@quoll> <a6fe54fcf985100fc85450e680e8f7da49e6b067.camel@posteo.de>
 <56ece3e3-871f-4ef7-9ad1-cd7f68f9d003@kernel.org> <881644afe920a222a7fa6b2221fcc157c037ccd5.camel@posteo.de>
 <20260325220749.GA17597-robh@kernel.org> <3281ba870fff981a1c37989000fdc6a8c448a304.camel@posteo.de>
In-Reply-To: <3281ba870fff981a1c37989000fdc6a8c448a304.camel@posteo.de>
From: Rob Herring <robh@kernel.org>
Date: Thu, 26 Mar 2026 14:36:36 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJUVh1YnhmYYj4ara5BheaLOL1oayjtWNuPH53q1d4xXA@mail.gmail.com>
X-Gm-Features: AQROBzDUbL74pnQWe09zyuAlzStbPODF_iEUcDDeGxoFS3VJYkV-5Xlg4x2i55I
Message-ID: <CAL_JsqJUVh1YnhmYYj4ara5BheaLOL1oayjtWNuPH53q1d4xXA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: embedded-controller: Add
 synology,microp device
To: Markus Probst <markus.probst@posteo.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 8:02=E2=80=AFAM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> On Wed, 2026-03-25 at 17:07 -0500, Rob Herring wrote:
> > On Sat, Mar 21, 2026 at 01:02:22PM +0000, Markus Probst wrote:
> > > On Sat, 2026-03-21 at 13:32 +0100, Krzysztof Kozlowski wrote:
> > > > On 21/03/2026 13:17, Markus Probst wrote:
> > > > > On Sat, 2026-03-21 at 11:21 +0100, Krzysztof Kozlowski wrote:
> > > > > > On Fri, Mar 20, 2026 at 11:09:53PM +0100, Markus Probst wrote:
> > > > > > > +
> > > > > > > +examples:
> > > > > > > +  - |
> > > > > > > +    #include <dt-bindings/leds/common.h>
> > > > > > > +
> > > > > > > +    embedded-controller {
> > > > > > > +      compatible =3D "synology,microp";
> > > > > > > +
> > > > > > > +      power-led {
> > > > > > > +        color =3D <LED_COLOR_ID_BLUE>;
> > > > > > > +        function =3D LED_FUNCTION_POWER;
> > > > > > > +      };
> > > > > > > +
> > > > > > > +      status-led {
> > > > > > > +        color =3D <LED_COLOR_ID_MULTI>;
> > > > > > > +        function =3D LED_FUNCTION_STATUS;
> > > > > > > +      };
> > > > > >
> > > > > > Where are other leds? Binding mentions 4.
> > > > > >
> > > > > Status and Power leds exist on every Synology NAS model I am awar=
e of.
> > > > > But there are models which have additionally a usb or alert led. =
The
> > > > > device nodes for those leds should only be present, if they exist
> > > > > physically on the device.
> > > >
> > > > Then help me to understand - are these different models?
> > > Yes, even with different CPU architectures.
> > > How much the "microp" device differs is not clear, but the
> > > communication protocol is the same.
> > > >
> > > > EC is not a generic purpose component and is tightly coupled with t=
he
> > > > actual board it is being present on. Unless exactly same board is u=
sed
> > > > in different models (unlikely) then the compatible defines the LEDs=
 and
> > > > they are not needed in DT.
> > > So for instance "synology,ds923p-microp", "synology,ds723p-microp" et=
c.
> > > ?
> > >
> > > I can do that, but that would be many.
> >
> > How many is many?
> Estimated 300.

Okay, that's a lot and probably safe to say there are not 300
variations of the EC.

> As a side note: I only have 1 model I can test the driver with.
> >
> > > Having it generic seems more flexible.
> >
> > Is there firmware for these ECs? If so is it the same or different
> > firmware for each device? If the former or the functionality is really
> > trivial, then I'd be more comfortable with 1 or a few compatibles.
> The firmware is not public and the exact differences between them isn't
> documented. The communication protocol is the same though.
>
> >
> > Generic means you'll need to add quirk properties when there is some
> > difference the OS needs to handle which we'll reject. So stuck with one
> > compatible and no way to distinguish different ECs is anything but
> > flexible.
> Describing the physical leds that are present on the NAS device are not
> quirk properties, at least in my definition.

That's not what I mean. I mean things like this other device needs
some different timing for power-on/reset or delays between accesses or
some LED control is inverted or some protocol difference... Could be
about anything. The key thing is you have specific enough information
(compatible) to start with that you can handle any issue that comes up
*without* changing the DT.

As you said, you only have 1 device. Make the binding specific to that
1 device. If the next one that comes along can reuse the binding as
it, then great. Nothing to do. If it can't, then it gets its own new
compatible. Strictly speaking we would add a new compatible for each
device, but it's a judgement call that there aren't going to be
differences to handle. In this case, there likely aren't 300 versions
of h/w, the functionality is simple enough, and the functionality is
entirely optional (just a guess). But that's all really your argument
to make.

Rob
