Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2133644BD
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768827891; cv=pass; b=EdBgTaQ2SElPaW5gmFjSLeHYen8DIQj8FwpBCelaU4H2L5vEe5D6Y4ehMYZ3oaFaFiwa/udzySzSBro+6laZsdTl44X/Vt/sW6kDA6GYc7necQS4+aM1HSHFsDUdTye8LAbydh9ka3V+jktvl3uqn+HA7FIDbXNP5pmSczbfXm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768827891; c=relaxed/simple;
	bh=pR/YUF8ru2cp1g5wgzJO3QiAx6dKH8c1DsFJNCxXrws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IUe8X3trHehibsdft3eFbBkkXq3JR6nIhmvtiJPZ6rLnpUpOsefpbgymU21m5gkjFDCKMj5b5BNYOBJr5OXmKnx3OEz1+5yrAgJaBI6WMUV/dhPu2paxJ/lZ2s6ZAE1WFEa1z1rN7Mwn5fFJ/kWZgOHxc8p4hU/re+RSJ976snw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzP90yNU; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzP90yNU"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38310ee9d40so38411801fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 05:04:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768827886; cv=none;
        d=google.com; s=arc-20240605;
        b=DHREKeowOAOYJqOJo3XZ/o1iv2RyE4nkRAfBjDebDE+REFsldHsgODUx7ukpGCDm8e
         lZAc7IhLL1lLSPGovGmxL+E+tlcAynKHVjvMa3dWQp6iygVT6AoKeg5w5KwdENgDjjyv
         GU9kyiNGEaX9DHYXMq+nex/aNVbfo7AF2eKF9dStP1Fyt/ooanXPtwXzB7NfGvkBn+lA
         8eNtJP1TyVA0UjakbHDrOPznsMGynTNDT/ga5YbrRS2Jd5gSsH5Z+ooDvn6bGQmmn2oL
         FUg9bYb1lD0pI+u7aO6Qje7jS42nXHaWdt42E6lygbVg++G7zQ7vrVQ50ELgmmXY8d79
         l68w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M4vaC3yReP5tlOdReJqhAIm+poe9C7dcUXSwWskAS0w=;
        fh=0FQux8pzulXI0V6N4/pND4h6eNtoJoX3ml/myCUvleY=;
        b=VIBnhUPwnvyxGaJQJH9t6rxRr1c1gkfWeb9GZw7qLN9JjOoQLZBpIFY3jWAlJZnnbr
         vK427ZzgWU1eh3+4wWH+s+GJ07B49Zg48VbV/0i+s4L71GJf1h1VE2cZXFVL4McdYJ3w
         A8JARtdUMpRocbJ/J/wCoeFLM/3sfkpbWnlCvqZ7my6sYNcgizHgmobevSAZs45Dx9U8
         k9+GrGcxLEZ5t2Ow9AVQ4b8eWSVZfKmsIejWISXlY4Xj1sN9Q3tGXcJzCzBEWKrkMuH9
         IJNrjptdeBkByhK2gg+jKYC7HqU2HvBkFigxP1TGfONijzKk0eYKsKhhQNZxr56XbNbw
         NY0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768827886; x=1769432686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4vaC3yReP5tlOdReJqhAIm+poe9C7dcUXSwWskAS0w=;
        b=TzP90yNUz01ynCJ+/NrOwPaODGf983dNgZoNZ9T3tFG5aTCBcP+VWQfh4qu3lCtru0
         PuYjk9VgghYIbaJBwMugRfyg0sj3c3yHbuXt5+RZQexplX4gPsY44IBUXxnRyCTMSl+r
         dRIzgz6WkWo/6VSWDsd9yVlg6pwCRZqgQB+uPFvFR+F96fYix1p5zxqlDKK43tK8MUgJ
         QKKYVN4qjWs6nz0hCADxCxj9/KQSgsGde5mHes204JEZU4wbuIvjf5c9DMXIgpp1H3u6
         y21mOyeOYSTVRrjhgpeLJsV0g5H31+BDZIvfhFzdLifi9BnsgrKxE90YtVAwcrXeMFqD
         ec+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768827886; x=1769432686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M4vaC3yReP5tlOdReJqhAIm+poe9C7dcUXSwWskAS0w=;
        b=qcUvCq17TCln/rVrsr9XkbYBbBEeKBmYx3c5w2hxG0j3kyu/pf8qxj+wR2hlQLl3Hx
         LXFW1s4OCB792GTXGScCgSpvSWx7K8X2JMmecrRKEbmvtgp60HpXy2dvtZzCnHnaH/bY
         l2AGvfU/WHB4iSIESXy6RMoFAAIJAL+BXPsB5xtdBdiKTJ76hzVI4ZzQdFXtCvfqsXDM
         WK6wp/4QMaf68S0ikUICKCUbTqAU1KgpL5DkF19trYRVAAPSWyQU/7GYdnucX+LRWbBK
         +Dd8mhyXJdJ53b1xaUBN6YS8iUxTDAs6p2asTAlFsjR4KglQoCz0xh+9BO2h3jQk3jie
         T6Ww==
X-Forwarded-Encrypted: i=1; AJvYcCV1F7JM9UkUqLFx4X2jdnlWnl3n+FfDLQLlgEhUTQ/Crgw6ikwmPu91FOIlum6PCmlQa2CXXYryTLNe/auhxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiVXmv/XsabzhBfYvuyzuB1cSIs+dVWqvbp3lXB6UQN0ISvAo4
	+CAyV1wLqQfefdLQslK0p9wn5jrBenPz8oDDuh0NeQv4fvR/TcKS0eBvy0F/+Dkhi2ExsyZGWeX
	MZW4WTZo1eyealhXfcv4RR7dsFgZTtIM=
X-Gm-Gg: AY/fxX6uV+0GlNKkLBhh6ezihbZPrrxuMLKDn44ELN+04Qiq+MwB/ilil+OxFednJ/P
	WFEu6cakNRCPZLvoT/yVViXtUin7ohNVkC1/YklrVIs5Oc4gMOaFH9+XfOGDXlXeUJ5Pv8gbZsu
	agnPROsEz4BpYPbz/J0zQU5T/KkuLrAHVIKshlWPEby3ZZvUoGk1byMqPX1idEIeA47+a/sbPgQ
	isCozUFA9SNqHsUMLUuS6MaU1d9zwCrMfpAdj53R1ynZHKgxLYRYfOSb1KR9K1zCs85qZxLoMp8
	hrn4TPqFLEJhuWAzeSa3wZ+pi0cCOy3sylcc29/u1CF0cin556IqtuVGSw7OLy8m9B7mVU/TqhV
	p09+8qwgr7juEUCmfn3aOdaOV/4p2HOyf/bsgpSpWGw==
X-Received: by 2002:a05:651c:1547:b0:383:1232:379a with SMTP id
 38308e7fff4ca-3838417349bmr35037251fa.2.1768827885528; Mon, 19 Jan 2026
 05:04:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119033006.1453006-1-sunke@kylinos.cn> <20260119033006.1453006-2-sunke@kylinos.cn>
In-Reply-To: <20260119033006.1453006-2-sunke@kylinos.cn>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 19 Jan 2026 08:04:07 -0500
X-Gm-Features: AZwV_QiQ6J_4XWyrE-z29B_3aDu2EibFnX8N0Lu__62NFUWrMzqdOj_hJVOGzJA
Message-ID: <CAJ-ks9=b3XU9vFxQDGY2Sp+-WRmGGTfWDDHWkXBQFBuO7HbhwQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] rust: fmt: add Pointer trait for foreign type formatting
To: Ke Sun <sunke@kylinos.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 10:30=E2=80=AFPM Ke Sun <sunke@kylinos.cn> wrote:
>
> Add a Pointer trait similar to Display trait to allow implementing
> pointer formatting for foreign types. This provides the foundation
> for safe pointer formatting in the kernel.
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>  rust/kernel/fmt.rs | 49 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 47 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> index 84d634201d90a..059c26dfcfa21 100644
> --- a/rust/kernel/fmt.rs
> +++ b/rust/kernel/fmt.rs
> @@ -27,8 +27,8 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>      };
>  }
>
> -use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, Up=
perHex};
> -impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Poin=
ter, LowerExp, UpperExp);
> +use core::fmt::{Binary, LowerExp, LowerHex, Octal, UpperExp, UpperHex};
> +impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Lowe=
rExp, UpperExp);
>
>  /// A copy of [`core::fmt::Display`] that allows us to implement it for =
foreign types.
>  ///
> @@ -90,3 +90,48 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>      {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::=
fmt::Display},
>      {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueAr=
c<T>: core::fmt::Display},
>  );
> +
> +/// A copy of [`core::fmt::Pointer`] that allows us to implement it for
> +/// foreign types.
> +///
> +/// Types should implement this trait rather than [`core::fmt::Pointer`]=
.
> +/// Together with the [`Adapter`] type and [`fmt!`] macro, it allows for
> +/// formatting foreign types (e.g. types from core) which do not impleme=
nt
> +/// [`core::fmt::Pointer`] directly.

This is copied from Display, but the rationale here is different - is it no=
t?

> +///
> +/// [`fmt!`]: crate::prelude::fmt!
> +pub trait Pointer {
> +    /// Same as [`core::fmt::Pointer::fmt`].
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result;
> +}
> +
> +impl<T: ?Sized + Pointer> Pointer for &T {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        Pointer::fmt(*self, f)
> +    }
> +}
> +
> +impl<T: ?Sized + Pointer> core::fmt::Pointer for Adapter<&T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let Self(t) =3D self;
> +        Pointer::fmt(t, f)
> +    }
> +}
> +
> +/// Macro to implement `core::fmt::Pointer` bridge for types that alread=
y
> +/// implement `Pointer`. This creates a bridge from `core::fmt::Pointer`
> +/// to `Pointer`.
> +#[allow(unused_macros)]
> +macro_rules! impl_pointer_forward {
> +    ($(
> +        $( { $($generics:tt)* } )? $ty:ty $( { where $($where:tt)* } )?
> +    ),* $(,)?) =3D> {
> +        $(
> +            impl$($($generics)*)? core::fmt::Pointer for $ty $(where $($=
where)*)? {
> +                fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core:=
:fmt::Result {
> +                    <Self as Pointer>::fmt(self, f)
> +                }
> +            }
> +        )*
> +    };
> +}

Isn't this almost a copy of impl_display_forward? Seems it would be
better to make that macro general enough to fit your needs, instead.

> --
> 2.43.0
>
