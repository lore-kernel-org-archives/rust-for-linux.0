Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C61021D3E8
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 18:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765994507; cv=pass; b=C+afNAK1uGfJDHhRcgCBeC2oSqrgpaMF+aQghHAb69ec2TiQoq9ThyTvvl3OTdSAZqmV6Dn1WJu38JQX6DYjS38gDoaaLLS5Vl3ZEDPy3hI4OKZ/JDQSogRoAdQ7Lr0eOjCkxzfGGAG4dL4MDNLBeuVnTi8T9jHLDOdxaPjVfgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765994507; c=relaxed/simple;
	bh=KJK42aQsKP3zhpFhKKFUbUrJrVAWTNuU0BYG8woC0Pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6bCo7N6LxZmf9ofBj7VIEC3E7M/xGqzoIVVRHR+8AFcTsmrd0TINjjLj/VID0H19N7frdzsr7+RdKehi4/9Kgt/Xw6ZLChCk6oVq8vgyvinaQHHNfB8zrd78RzWBqd5wz1MzHUr6jxnmCLu9C6eo8mPPsATwsIqsFqy72Ptsls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z45/sW65; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z45/sW65"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-645ed666eceso291a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 10:01:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765994504; cv=none;
        d=google.com; s=arc-20240605;
        b=U/LkEYDV9/oOY8TW2FKwU+cR0P4DfikIxhsdlHlp6C9rpi5VVL0NmUR79gZRdAYaaQ
         Y1CyfpOWzfXJh8E+/OOLeHtvaBlL9fD5rc2sK6RtSjs7eTiPmNaJh+6FYSPVADKvKH5Y
         2U0icX8N62DCymUcRUbWYu+HIvQeIRVvPTRh7yAtYK2SsisKOJ2G5Ya0RyBj0QloOwBH
         hrGE8JIxXHcsJwJpNt+XctqvsSsv+ElNSf4+dSaOP7tlQK2GNPP5opSfygacaHFQlgsm
         RdmT8prt8H3hsg7XgMeFqfLcsxvlpIVMwIQckb+jt/EzpBOZaM6EIUHXQcb9ZUrxn48/
         ITkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bYm0euCESRjcpDzcyojsdpFeRbiA18k3+f9vNibZW8U=;
        fh=DV6v1UhsBBUvFsSgdbyhz8HFn7LwCEaeT7Ki2lmBS9g=;
        b=MbB3d65S3HH/jlzLFjCDZs8jXSpVOFsTglPDNTlZnnhhRn+RnqXtdVVthxZLKgIgpD
         h/chCqQo6OCdcUKcOi7/3VN2UzJ0ZDQLw7uw7DebE1Lgbskx0qnjVWW8uxkn3R4AhdE6
         Pj8Ntdkk20ez5IwBqQkQuQrfkxgJoV+WXsxKPqY39vxfQRoRihljVeDPfYxZk0v7TdyA
         6CBH727v5TKbsFgo7AfnOcRuh3dy+H3CzoYvYUIN6lpxeR9Y/nW5WPF5owh0CRwDG34y
         hHFnavPWYeRV7ITX1P6pQmCcVZD7N/T5rg5pkRga3FBbnSJE5VDEt1T4UIYMg7gBHuZC
         FaDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765994504; x=1766599304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYm0euCESRjcpDzcyojsdpFeRbiA18k3+f9vNibZW8U=;
        b=Z45/sW65sGLin7Jcy/dDlwSmkyb8Lzn8nvlBlzrX6yn48pivZEX1pNc6YOMzI/mzl/
         c1NYqotnHYIuHhvt302D09TSQ6sk+Kxw5RQUgXxYY66KMRJXEdVhJ5pIcXPT9JkBxrjC
         wz/ROG7dsKQLg2K+ORv9jirC9esjeb8OoNeA+snMe15k5Nhsqh31FirPHUxhgH4CPXo0
         FyCh/lLKpRaVotY9k7dcvwxYSODhU+c6/6Xj63qvxlnrp/1sWjg2JWbwJ0Zs3g4ZaiaM
         Zcq9VFFXvPesB5oXILsXXtwdL7DlGdtmBD6VFxcFg/3tluS5nlfD9X81CO9npWZZGfcr
         nyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765994504; x=1766599304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bYm0euCESRjcpDzcyojsdpFeRbiA18k3+f9vNibZW8U=;
        b=CSnobtjO8jTsBUHh7JhVCFlkG8c9rSUT9zAvtwkwdjWmYBvoZrAA81LQtkIoFU0rg4
         c+IL3Krqq25PENFdH46yyClibVvLZViBSnL3SB2BLz/6VC54Pt2qkdbdOLslc3Iv79Rd
         IhENEKJ09BgArbxcm+8p2PRQMjt+pZZr2E6P7sdzKahFTG6hwcBajfRIt0BVX+zOshnP
         XwZiUUuJ/nQAIsDk/F2rMh60/7E654I2afRnuHpDObCGPpbGVyHnWmZZ4QGa0+CMpOZK
         qqBtvJfbEL5XBDhHvDvPgF8RI81Oyos6lm0HorBDEIybiLgZBPvfBFVZF20zuwQDLg3x
         UH4w==
X-Forwarded-Encrypted: i=1; AJvYcCXvHf2ZGmiI8qOLs9u8j+sGG8JjkIQYP7xusgAtCmOWU1vyeJguzkj8ad4lMFx4fp2AC5PphgCFfVZtCb6TjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxfDT+nsDicDbSElL51+C8OwhPdPT5cOr2J54hx7Ja58xujwHj
	KP2bAZ6kRztqA1TSLG7EvgjoTEGvWNp7ibxszWvyzsnhjAhPG8q1co/8Ld1eE8Ok/LjP+SHAWdy
	GSSPEOAv0H3zJJDUbT0I5SK4ehy5MbSX7K8EG32EF
X-Gm-Gg: AY/fxX694X1XPWWldKNI7P9Z7jZrcmhwTtZTAzvlX/zm2tYN1zd9QEl0NPoTbZIDBN9
	p9zGPq6eXH4ZTYQzkGJWZQki0/JPs0+xqrCNSH6xVKwGu5o06DgdN+lbEKJLPn/B+7BWmyW8N9y
	CoNwaIAwRYGqmbWsu5iJ0amFiV82CS9HC7bVKYYsRamwjyXP/X8nVCQCFqf3jmkNQPcA2sL8GwO
	uug70JFLAwm5+ztOVzGJNHE5JVEGJyz3SsEpRkcDbjfdO241ISPXzu1xBPqPPN+SoakzZDsyHYN
	XG2PPMZBwvONvRx8l1UBli2E0g==
X-Google-Smtp-Source: AGHT+IFHWQGLw0S1eiFpeRxUl2gvoI5zsSoZl7Yt9sUAXIbCD6ZXZnY4qYky91A+td57SNxDM81IwEXNAVfQvXEs8YY=
X-Received: by 2002:a05:6402:20d6:10b0:643:e9f:2e5c with SMTP id
 4fb4d7f45d1cf-64b420ce21emr47219a12.9.1765994503440; Wed, 17 Dec 2025
 10:01:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-transmute-v2-0-b23e5277ad02@google.com>
 <20251216-transmute-v2-2-b23e5277ad02@google.com> <DF05VVOUA70W.30GJE9P4Z3OL9@nvidia.com>
In-Reply-To: <DF05VVOUA70W.30GJE9P4Z3OL9@nvidia.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 17 Dec 2025 10:01:32 -0800
X-Gm-Features: AQt7F2qzB-Mw47N6boXw26l0bJNZMt-5H5vREBW6SwuC51Tr9mVZDZtFrktZct8
Message-ID: <CAGSQo00qe74q-Ztn2UubrMR+F-knO-DhrznSgM8Gk3j9OjNfKg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rust: Add support for deriving `AsBytes` and `FromBytes`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 7:12=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Tue Dec 16, 2025 at 9:44 AM JST, Matthew Maurer wrote:
> > This provides a derive macro for `AsBytes` and `FromBytes` for structs
> > only. For both, it checks the respective trait on every underlying
> > field. For `AsBytes`, it emits a const-time padding check that will fai=
l
> > the compilation if derived on a type with padding.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
>
> I like this a lot. We have a bunch of unsafe impls in Nova that this
> could help us get rid of.
>
> Amazed that this even seems to work on tuple structs!
>
> > ---
> >  rust/macros/lib.rs       | 63 ++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  rust/macros/transmute.rs | 58 ++++++++++++++++++++++++++++++++++++++++=
++++
> >  2 files changed, 121 insertions(+)
> >
> > diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> > index b38002151871a33f6b4efea70be2deb6ddad38e2..d66397942529f67697f74a9=
08e257cacc4201d84 100644
> > --- a/rust/macros/lib.rs
> > +++ b/rust/macros/lib.rs
> > @@ -20,9 +20,14 @@
> >  mod kunit;
> >  mod module;
> >  mod paste;
> > +mod transmute;
> >  mod vtable;
> >
> >  use proc_macro::TokenStream;
> > +use syn::{
> > +    parse_macro_input,
> > +    DeriveInput, //
> > +};
> >
> >  /// Declares a kernel module.
> >  ///
> > @@ -475,3 +480,61 @@ pub fn paste(input: TokenStream) -> TokenStream {
> >  pub fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream =
{
> >      kunit::kunit_tests(attr, ts)
> >  }
> > +
> > +/// Implements `FromBytes` for a struct.
> > +///
> > +/// It will fail compilation if the struct you are deriving on cannot =
be determined to implement
> > +/// `FromBytes` safely. It may still fail for some types which would b=
e safe to implement
> > +/// `FromBytes` for, in which case you will need to write the implemen=
tation and justification
> > +/// yourself.
> > +///
> > +/// Main reasons your type may be rejected:
> > +/// * Not a `struct`
> > +/// * One of the fields is not `FromBytes`
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// #[derive(FromBytes)]
> > +/// #[repr(C)]
> > +/// struct Foo {
> > +///   x: u32,
> > +///   y: u16,
> > +///   z: u16,
> > +/// }
> > +/// ```
>
> One thing I have noticed is that I could sucessfully derive `FromBytes`
> on a struct that is not `repr(C)`... Is that something we want to
> disallow?
>

Why should we disallow this? I can enforce it very easily if we want
it, but the only difference between `#[repr(C)]` and `#[repr(Rust)]`
is whether we can statically predict their layout. In theory you can
use this to elide the padding check for `#[repr(C)]` structs (and
`zerocopy` does this), but it's significantly more complicated.

The only argument I see in favor of disallowing `#[repr(Rust)]` here
is that if it's not a struct that also supports `AsBytes`, there's a
question about where you're getting the bytes to load from.

I will point out that we probably don't *just* want to restrict to
`#[repr(C)]` because `#[repr(transparent)]` and `#[repr(packed)]` are
also great use cases.
