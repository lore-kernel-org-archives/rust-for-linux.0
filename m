Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F67B13DDA0
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Jun 2024 23:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717717450; cv=none; b=G9GUw7TFQ7iX3fhZdPMwUPhz/xIlYX+PPO7dVyyO7D4/MqP0SF4DvVTyFJlMj+wbCoF73Ss3ZnbyoCIDSwcaWzbicg6a1KcUSGThLFbk27uytJTmCaK9s/CTQ8yCwrcJdxArNKZWjnTEUvN3zx7vyqxVh56pNH9DZm3usJXUplI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717717450; c=relaxed/simple;
	bh=VDDj6jzaTCuSSDrrKX+kna8Teyj8rLorL/UVeh298tA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KvZ7KgsFS7D5t/Br1sxKZ9S2PD4zgJA0a7qmkTYDbc1cEdRNrR1oCuHOOnRUm8ha327XtcXSz5TTiNn9q/LdJNlcjh0zwL54mOKz9VfXTr3GCHbMZBXldO4WvUdaK641QGfNcxzX/c76Rn67s06rEVifcMhcufuSYIhWxG50KYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=Ywo6EZ+0; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="Ywo6EZ+0"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-df771b45e13so1704200276.2
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Jun 2024 16:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1717717447; x=1718322247; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njBMNSK84cja7ZCWozMeEx6Bd0h6tsa8kjIjqvFXUWU=;
        b=Ywo6EZ+0ezhnELz6Tr7fLCzeYCHohrnT3DHPZJ1SOwfZOhx4hqPoT25z72x+nvcpAo
         GY7TJMLCyCr38AwQ6G+KR/rKfCZ2lcv40v1XARpuNrYq/KNBpjhBnZCL3U1ZrDKH/z7B
         noWKnJ2pz2XTR4wHG2mwJ7nahqwWAoJpUgR+NFq7FtIZP7HAvvpchqow65yZvwQabp3r
         x6FbtTzFVC9neQb9bKgeQb7EfetWvEMQ4pahYlSyVCwy7H3IvEk+Zue0cIiMF4GlLp77
         UJ3lOVW2MVlHvRbJsJ7A/oygph6+36B0oGQIJMbWRLCDKtNAZ6JQfLuLOnEI46dysPon
         JTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717717447; x=1718322247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njBMNSK84cja7ZCWozMeEx6Bd0h6tsa8kjIjqvFXUWU=;
        b=FkU0QKaFX2dZ3nZWQrnQ3NYHcBtOVfg2vO6sKzFvXzLiMWB1KyjppxJAFvnLhEUU6s
         Zj9KUVuZHyfczoQP9pN2tC7YhOOotc2XoWVekvTrgrdwdlvVX9p7bDpYJxOuT8noYcqK
         6GYYlOa0BblzdOGG6h7krlgxuHoAmi/8VuC+S52HuLnchst3LthAlxTWnm8/7JnVVFML
         /69pSocuMYfLUEpe6L6bMAUlILEJOjyvuXklqRZFP3Etdmm+cvcJNYs7s6cqPs0CRZcd
         3Led+w+kGKR3VBSWllb4AnkJYxrlWryhIerdM6jLEXnVVyNKjekSiSeEYtJzJkErbxUD
         ItXw==
X-Gm-Message-State: AOJu0Yx9nZ7Fc5lPhp69UivYcaQQtTYbEO9Poni37j5aBTpjvwzOnsJP
	5wV1chEX0/yCa4B0GoturkN87bwgyBf7U9qfP6xBu4sG+ce6p6k7YPV5sLWPbfySgJyDNzjF6Cl
	sKYwm50T7gCOR5VBogxMr7pQ/NTgi0Pi4FcuPUg==
X-Google-Smtp-Source: AGHT+IEh8KXfGYnv4j/Oqphaw8OMDYBYuaXejb1qbuD67MgmuWOTV02L2DJsrdQvFrTlQEHyUFzYdjoBRqlpVfV0HHU=
X-Received: by 2002:a25:d88a:0:b0:dfa:4a32:3c04 with SMTP id
 3f1490d57ef6-dfaf65f9f80mr888456276.23.1717717447034; Thu, 06 Jun 2024
 16:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240602231749.57111-1-fujita.tomonori@gmail.com>
 <20240602231749.57111-2-fujita.tomonori@gmail.com> <CALNs47sQeXZExxQK-vdx0zh6-aC376KYLbLcS6_e2rsFe_piZQ@mail.gmail.com>
 <20240607.080236.199306626197602234.fujita.tomonori@gmail.com>
In-Reply-To: <20240607.080236.199306626197602234.fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 6 Jun 2024 19:43:55 -0400
Message-ID: <CALNs47urAkARWg+e4eAqXDpOJFUjoe73WZxYHjL-_DvvzWtOZg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: net::phy unified read/write API for C22 and
 C45 registers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 7:03=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Thu, 6 Jun 2024 03:41:18 -0500
> Trevor Gross <tmgross@umich.edu> wrote:
>
> > On Sun, Jun 2, 2024 at 6:18=E2=80=AFPM FUJITA Tomonori
> > <fujita.tomonori@gmail.com> wrote:
> [..]
> >> +use super::Device;
> >> +use crate::build_assert;
> >> +use crate::error::*;
> >> +use crate::uapi;
> >> +
> >> +/// Accesses PHY registers.
> >> +///
> >> +/// This trait is used to implement the unified interface to access
> >> +/// C22 and C45 PHY registers.
> >> +pub trait Register {
> >
> > Since we don't use this anywhere could it be sealed?
>
> Yeah. Only reg module implements it. How it can be done?
>
> diff --git a/rust/kernel/net/phy/reg.rs b/rust/kernel/net/phy/reg.rs
> index 7628eb09e902..0dfae4677574 100644
> --- a/rust/kernel/net/phy/reg.rs
> +++ b/rust/kernel/net/phy/reg.rs
> @@ -12,11 +12,18 @@
>  use crate::error::*;
>  use crate::uapi;
>
> +mod private {
> +    pub trait Sealed {}
> +
> +    impl Sealed for super::C22 {}
> +    impl Sealed for super::C45 {}
> +}
> +
>  /// Accesses PHY registers.
>  ///
>  /// This trait is used to implement the unified interface to access
>  /// C22 and C45 PHY registers.
> -pub trait Register {
> +pub trait Register: private::Sealed {
>      /// Reads a PHY register.
>      fn read(&self, dev: &mut Device) -> Result<u16>;
>
>
> > This might not even need to be public since it should probably only be
> > used as a method on `Device` (i.e. `my_device.read(C22::BMCR)` rather
> > than importing the trait and using `C22::BCMR::read(my_device)`).
>
> If I drop public, I got the following error:
>
> error[E0603]: trait `Register` is private
>    --> rust/kernel/net/phy.rs:181:25
>     |
> 181 |     pub fn read<R: reg::Register>(&mut self, reg: R) -> Result<u16>=
 {
>     |                         ^^^^^^^^ private trait
>     |
> note: the trait `Register` is defined here
>    --> rust/kernel/net/phy/reg.rs:19:1
>     |
> 19  | trait Register {
>     | ^^^^^^^^^^^^^^:
>
> (snip)

Oh, I did mean `pub(crate)`.

If that doesn't work, usually the sealed pattern looks like this:

    /* lib.rs */
    mod private {
        /// Marker that a trait cannot be implemented outside of this crate
        trait Sealed {}
    }

    /* reg.rs or other modules */
    use crate::private::Sealed;

    // Traits that aren't meant to be implemented outside of the crate
    // get `Sealed` as a bound
    pub trait Register: Sealed { /* ... */ }

    // Anything with a `Register` impl now also needs `Sealed`
    impl Sealed for C22 {}
    impl Register for C22 { /* ... */ }

    // And then nobody from a different crate can implement `Register` on
    // some random type, because they have no way to access/implement
    // private `Sealed`

I also asked about this because I'm a bit surprised it hasn't come up yet [=
1].

But if `pub(crate)` works then that is easier, of course.

- Trevor

[1]: https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/top=
ic/Sealed.20traits/near/443180412
