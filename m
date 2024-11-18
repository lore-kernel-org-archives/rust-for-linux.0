Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D251405FB
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Nov 2024 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731925178; cv=none; b=LmTcqOnsBLBfo98t3vIh6D4/tbO2epHoP+xVzzVMOR6lowPhIJMHEGUXsQH9FhBiJZ0nWmL4qLPSBMrkKvncyr0jrtEQBKoVEdBMECKJuryZd75h2EDPLfTiMJq70BiU3XCipgIqHYCCtjG1BsGsTRxFybOr5QWZPgAHu5zuIMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731925178; c=relaxed/simple;
	bh=Rax6lueyWacS3m5xDCDewow2hehHpuuYcm6qKoAPoGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oy4pr32QKdELr+INmrmoGUbXbAxdwVm/EWIgzL7GrEElaWdtIXX81fFAnFgq3n/lI+VD3LIePW1gDu2PBnoyPM48a36IEkN8eWnPvgQrlIV+mPzZ/nPhzpnSzCUQNyTdktOSlH30qjhu3LVpsPvJwVoNcwtKB3EvGoGJWxI+EXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OyWSlQSP; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OyWSlQSP"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3824709ee03so554065f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Nov 2024 02:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731925174; x=1732529974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwWADfyCr2BC5TAT+DCbNFAyRnnXgdXIFe6xs1I/TUI=;
        b=OyWSlQSPHZtr5DN+PzopxWo+28jsbGU7otKxAv4a1NRTHBMDRoALWHbH0mEFrhttHB
         jArR3DCPtZ9z8r4fYhSnfaKijBTziiuDNEQRWNoskp5W7d9cj10Uwps0weHvndTkb4p0
         Pik++Pk94o0tweOOoYkf8fq/ILah09OpRTeiaPXYDTq/XJ7MPr7HmayEY/dMDWA/GX2r
         kSZeVstZ6nCC6Ezey+sMQLqJljmN/qLU0YpUQUACcN42mkUNDkKMYZmx1+EzwQxEd/DE
         SliGp3qy5FO66lGIaHmefBS1kifR7O0UkuIyhrz+f4Yx2p80ZPbmhu1TeYMKor4an7fA
         jR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731925174; x=1732529974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwWADfyCr2BC5TAT+DCbNFAyRnnXgdXIFe6xs1I/TUI=;
        b=X9z/VORbKmY3j+nDUv0fkiQAyPwQml4OHOi3OxTePUriwPTH2rdz2nKMSTK6h5tfYR
         Rk/TBBKg3inYnuWG6sU5vcTfVmqBW6Ole9c6WLIJ6v8ZgT2ef2gqrKeAkMs+hNEMgaHj
         e6hsIRGH7hRQXv+oSvuGtKjWNoXNRD3cQBAN8zyfhq4qhRLP37C4mNTLqTpa5zo18jl/
         Icru7YDEWAZjMxQuXD1IxrEypGXeZIo9f8ebzsg78UVt3Bi8S/dosb8ahU2OQxnlt/mw
         iPVe7w35F8/xYj9cf4szwDFv4TYjEU0K0BMDbkDqX1rmaxu7h+RiPjdEZD3xkXXBlILS
         mn7A==
X-Forwarded-Encrypted: i=1; AJvYcCW9V7aIfA96naHwwJ8T0oWP3Ce079JpLGdmjX8s+2n7hfOYArD0LLjC2SNgwPM3PtjgBBmEspjiPuDrAhNM8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCaiGgqDlTWP073TUdQieMS3KMAwkuYq3o9wMdqRIrCe3hsnJc
	Vw/e0khM4iP1C3Li/MGj6UMMDv82zE4ufcsB7LWErU8mGBW598XKaJTklyqmf3eaA8ELux1LxC1
	89sb58v246kZZR9KvMDolgXwNPQ8bRed5xDNC
X-Google-Smtp-Source: AGHT+IFDuCFFF9qAITz79FZE1ou75NV3hWq3UbrD7F/i3+vJePDzNP2hkzupaucOBe8Jv8KaJYYyGiWVfLp+FISbZC4=
X-Received: by 2002:a05:6000:2587:b0:37e:d2b7:acd5 with SMTP id
 ffacd0b85a97d-38225a428f4mr8915076f8f.8.1731925172936; Mon, 18 Nov 2024
 02:19:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009105759.579579-1-me@kloenk.dev> <20241009105759.579579-2-me@kloenk.dev>
 <snsf4cc6valp5ovrrbjv7fefxtkthifsis5el4teajzwjhmv4x@ghxovfdqkhop>
In-Reply-To: <snsf4cc6valp5ovrrbjv7fefxtkthifsis5el4teajzwjhmv4x@ghxovfdqkhop>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 18 Nov 2024 11:19:21 +0100
Message-ID: <CAH5fLghthWr4r0v=2xNE_UJntG6o6qRzdqHj_nu8AKUwUWh2Aw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] rust: LED abstraction
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Fiona Behrens <me@kloenk.dev>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-leds@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 16, 2024 at 4:47=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> On Wed, Oct 09, 2024 at 12:57:58PM +0200, Fiona Behrens wrote:
>
> > +/// Color of an LED.
> > +#[derive(Copy, Clone)]
> > +pub enum Color {
> > +    /// White
> > +    White,
> > +    /// Red
> > +    Red,
> > +    /// Green
> > +    Green,
> > +    /// Blue
> > +    Blue,
> > +    /// Amber
> > +    Amber,
> > +    /// Violet
> > +    Violet,
> > +    /// Yellow
> > +    Yellow,
> > +    /// Purple
> > +    Purple,
> > +    /// Orange
> > +    Orange,
> > +    /// Pink
> > +    Pink,
> > +    /// Cyan
> > +    Cyan,
> > +    /// Lime
> > +    Lime,
>
> Why these repetitions?

My guess is that it's to silence the warning about undocumented public
items. It may make sense to just silence the warning in this case.

> > +impl TryFrom<u32> for Color {
> > +    type Error =3D Error;
> > +
> > +    fn try_from(value: u32) -> Result<Self, Self::Error> {
> > +        Ok(match value {
> > +            bindings::LED_COLOR_ID_WHITE =3D> Color::White,
> > +            bindings::LED_COLOR_ID_RED =3D> Color::Red,
> > +            bindings::LED_COLOR_ID_GREEN =3D> Color::Green,
> > +            bindings::LED_COLOR_ID_BLUE =3D> Color::Blue,
> > +            bindings::LED_COLOR_ID_AMBER =3D> Color::Amber,
> > +            bindings::LED_COLOR_ID_VIOLET =3D> Color::Violet,
> > +            bindings::LED_COLOR_ID_YELLOW =3D> Color::Yellow,
> > +            bindings::LED_COLOR_ID_PURPLE =3D> Color::Purple,
> > +            bindings::LED_COLOR_ID_ORANGE =3D> Color::Orange,
> > +            bindings::LED_COLOR_ID_PINK =3D> Color::Pink,
> > +            bindings::LED_COLOR_ID_CYAN =3D> Color::Cyan,
> > +            bindings::LED_COLOR_ID_LIME =3D> Color::Lime,
> > +            bindings::LED_COLOR_ID_IR =3D> Color::IR,
> > +            bindings::LED_COLOR_ID_MULTI =3D> Color::Multi,
> > +            bindings::LED_COLOR_ID_RGB =3D> Color::RGB,
> > +            _ =3D> return Err(EINVAL),
> > +        })
> > +    }
> > +}
>
> How does Rust compile these? If these constants compile to the same
> numeric values, i.e. if
>   LED_COLOR_ID_AMBER =3D=3D Color::Amber,
> will the compiler compile away the function?

Well, it can't compile away the part where it returns EINVAL when the
u32 is not a valid color. But other than that, these matches are
usually optimized pretty well. I just tried a few different examples
in godbolt to confirm it. See e.g.:
https://rust.godbolt.org/z/WWM7891zW

That said, this relies on the assumption that they are represented
using the same values. We probably want to change the declaration to
this:

#[derive(Copy, Clone)]
pub enum Color {
    White =3D bindings::LED_COLOR_ID_WHITE,
    Red =3D bindings::LED_COLOR_ID_RED,
    Green =3D bindings::LED_COLOR_ID_GREEN,
    ...
}

That way we are guaranteed that the enum uses the right values for the
enum to make the conversion free.

> How do enums work in Rust?

In this case, the enum has no fields. In that case, the enum is a
value that is only allowed to have certain values.

Enums are also allowed to have fields. In this case, you can think of
it as a discriminated union, though in some cases Rust will store it
in a more clever way. You can look up the "null pointer optimization"
for an example of that.

> > +impl<'a, T> Led<T>
>
> offtopic, what is 'a ? What does the ' mean? Is impl<> something like
> template in c++?

Things starting with a tick are lifetimes, so 'a is the name of a
lifetime. That said, this usage of lifetimes looks incorrect to me, so
I wouldn't look too closely at this instance.

As for impl<>, then yes sort of. It is the <> that makes it like a
template. When you have an `impl TypeName { ... }` block, then that
defines methods for `TypeName`, which you can call as either
`value.method(...)` or `TypeName::method(...)` depending on the
signature. When you write `impl<T>`, then this means that it is a
template (we use the word "generic" in Rust rather than "template"),
that is

impl<T> TypeName<T> { ... }

becomes the following infinite list of impl blocks:

impl TypeName<i32> { ... }
impl TypeName<u32> { ... }
impl TypeName<String> { ... }
impl TypeName<TcpStream> { ... }
// ... and so on for all possible types

This logic works anywhere that <T> appears. For example, `struct
TypeName<T> { ... }` is short-hand for the following infinite list of
structs:

struct TypeName<i32> { ... }
struct TypeName<u32> { ... }
struct TypeName<String> { ... }
struct TypeName<TcpStream> { ... }
// ... and so on for all possible types

Of course, only things in this infinite list that you actually use end
up in the final binary.

The `where T: Operations` part is a filter for the infinite list. It
restricts it so that only types `T` that implement the `Operations`
trait are present in the list; all other types are filtered out.

> > +where
> > +    T: Operations + 'a,
>
> What does + mean here?

This is the same as:
where
    T: Operations,
    T: 'a
that is, apply two filters to the infinite list I mentioned above. The
meaning of `T: 'a` when the RHS is a lifetime is that `T` must not be
a type containing a lifetime annotation shorter than 'a.

> > +/// LED brightness.
> > +#[derive(Debug, Copy, Clone)]
> > +pub enum Brightness {
> > +    /// LED off.
> > +    Off,
> > +    /// Led set to the given value.
> > +    On(NonZeroU8),
> > +}
> > +
> > +impl Brightness {
> > +    /// Half LED brightness
> > +    // SAFETY: constant value non zero
> > +    pub const HALF: Self =3D Self::On(unsafe { NonZeroU8::new_unchecke=
d(127) });
> > +    /// Full LED brightness.
> > +    pub const FULL: Self =3D Self::On(NonZeroU8::MAX);
>
> These LED_OFF, LED_ON, LED_HALF and LED_FULL are deprecated constants
> that should not be used anymore. enum led_brightness will be either
> uint8_t or usigned int in the future.
>
> Is it possible to not infect Rust with these deprecated constants?
>
> Marek
