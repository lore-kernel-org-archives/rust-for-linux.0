Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635133148BF;
	Mon,  6 Jul 2026 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334326; cv=none; b=DqXK9CKfllbq2USVUlJp1Kut+NnNzT0keNk9DF5mnPlfB0UThHFJS4b7j4oPJk4uzOvYbmzo9KoORJyGmVZHyiOD3W9CWyH5WEJyujpN/Y6qiXxIH19CA7LRNzlukmYkKuXXt+Kk0v+pADX9isyBirtlEVKmeHntMT6vPgyvn/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334326; c=relaxed/simple;
	bh=mUtAjUIQYJeXa1ZojNqvCQWzjNhdNk8A/ZaufZofoYU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=SMVgoxNlI82p0t/qe7jTq/dTqZpdVLlXX28f3oMBeaR2+EkY7yuqJXwY4eZAaZ6S+MQjmFFgntmobKrjuji2r3pT8dDOakkM82OqKXFAQuaaVCQ4m8PcVZ5HfgUkP8j+kmfcRUAXcBsPYDM8mH28QK4UeFaYv1MDFHVhylpFBEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSG8KtMi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSG8KtMi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D96541F00A3E;
	Mon,  6 Jul 2026 10:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783334325;
	bh=pMgj55IXUypGb9Ko5R1G2j4VwdquC2pu5IcWHtz9W/I=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=TSG8KtMimch934ojUdWQYos57cgXTlWxgM/JljrjgxoRJm4dMvGQOojHZ1mr36TNd
	 fb4PzNiGzXubQ3RomaXIzqH2sYZ6Moy3D58sR6iDm7C20y2N1Nf9y0VTBoI2Km/Phr
	 QYTkTm9nhl0X1CGtjNAOjfDL2uRbCuiY9MKUCUtEsPM43yfaF6SSxmwyavmhsnVlr7
	 n5OurvUVkpFSp902rVzWhjErP1cpDS4cxYBscuWc/NtYHaySWyVETabqEBNpbm0Hvf
	 PZxwCa2f69tJ67w1rvxJiM8BUFq6ooq8Txdik4ZLZSFEbzkv/GZALQ3Rg6zrs1giWt
	 YoKgKmP+9V/mQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 12:38:40 +0200
Message-Id: <DJRF98V7SMXT.14BS8WGBEESZ8@kernel.org>
Subject: Re: [RFC PATCH v2 10/11] rust: usb: keep usb::Device private and
 gate transfers on Interface<Bound>
Cc: "Mike Lothian" <mike@fireburn.co.uk>, <rust-for-linux@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Alexandre Courbot" <acourbot@nvidia.com>, <linux-kernel@vger.kernel.org>
To: "Oliver Neukum" <oneukum@suse.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260617145946.1894-1-mike@fireburn.co.uk>
 <20260703030020.2694-1-mike@fireburn.co.uk>
 <20260703030020.2694-11-mike@fireburn.co.uk>
 <fddbeaed-ff21-4962-b09f-d975c96cd926@suse.com>
In-Reply-To: <fddbeaed-ff21-4962-b09f-d975c96cd926@suse.com>

On Mon Jul 6, 2026 at 11:45 AM CEST, Oliver Neukum wrote:
>
>
> On 03.07.26 05:00, Mike Lothian wrote:
>> Address the v1 RFC review (Danilo Krummrich):
>>=20
>>   - Do not make `usb::Device` public. Writing a `usb::Interface` driver =
should
>>     not require naming the underlying `usb::Device` (cf. commit 22d693e4=
5d4a
>>     ("rust: usb: keep usb::Device private for now")), so the struct is
>>     private again and the device-wide transfer operations are exposed on
>>     the interface.

I didn't say we never need interface drivers to deal with the usb device, b=
ut
there doesn't seem to be any value in taking this indirection for I/O
primitives.

I.e. there's no value for drivers to write

	let dev =3D intf.device();
	dev.bulk_recv();

over

	intf.bulk_recv();

With the latter we can enforce that any I/O can only be made for an interfa=
ce
that is bound to a driver (usb::Interface<Bound>).

AFAIK, it is not necessarily valid to assume that if an interface is bound =
to an
interface driver, the parent USB device is also bound to a USB device drive=
r
(which is what usb::Device<Bound> represents).

If that is correct, we can't just derive a usb::Device<Bound> from a
usb::Interface<Bound>, and hence can't gate I/O behind the USB device's dev=
ice
context type state.

IOW, we'd need another layer of indirection if we want to properly gate USB=
 I/O
with the device driver lifecycle.

By providing helpers that operate on the interface directly, this goes away
regardless.

> Hi,
>
> I would say that this is just conceptually wrong.
>
> 1. drivers talk to the common control endpoint of the _device_
> not their interface
> 2. drivers ought to be able to set a configuration (That's a device prope=
rty)
> 3. Drivers need to be able to claim secondary interfaces (we have an API =
for that)
> 4. Devices and links (and functions) have states, not interfaces.
>
> These operations operate on the device level. Hiding that fact behind an
> interface (which may not even be accepted at that point) is just a layeri=
ng
> violation. Even calling a device reset through an interface is strictly s=
peaking
> wrong.
> We even have a driver that can ride piggyback on another driver's interfa=
ce
> and use only control transfers to endpoint 0.
>
> This patch is fundamentally flawed because it operates on assumptions
> that are just not true. USB does device level operations. Just drop it.

This seems overstated, the only thing the patch does is providing helpers t=
o
avoid the above indirection.

However, I agree that reset_configuration() and set_interface() seem mispla=
ced.

That said, I'm happy with any solution as long as it considers the device d=
river
lifecycle and gates I/O operations (and other operations that belong in the
bound scope) correspondingly.
