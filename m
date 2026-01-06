Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAB7243367
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 20:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767731514; cv=pass; b=Yvl9PGGfqkOniR+OKUk8/iBRln2txbrvut5dps+eG6MH0ayVuHyktkDz3cgXxhqE+96bc8PIxyIPJ1oE5/kvJD2qSlZtQ15A133LzDQjZhGIe+30E0vjtWTZXtgHHPwTZKqMg2TB1TjqUyPFs2P9UHECFY7vkD6PRRJO6WEW/3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767731514; c=relaxed/simple;
	bh=2E1CCL3hwI52982DZf/ohhbXsVbclHnxUB6zUZUwflc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IfwipHfqP8FQyX0/odcPBfvstX3OApweIKgoYl5iRFS1rp4MTYv2BlVQ1bYyfZjLE60K693rS+Zkx7q8I3RHqas0sCKS1zDCasQZtjkwsBIYdNcJYFcftcym57R53TCYdvgGl83xnXXtool2kcdt3DxL3CeqMn0ynqT0/k0uINU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qQKCJNRE; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qQKCJNRE"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64b72793544so132a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 12:31:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767731511; cv=none;
        d=google.com; s=arc-20240605;
        b=JEyKqpQFZUhaHRqTkfS3jpFpFBl5GuvB0SGt4MjpbjfYzFa/Nafh1C6D0LxRTDh+06
         Tz7lOPJ+GbWS2nMpZ8MFOgRC2yX3kVl2i4ZByUFVW3QgEQAc+PN17maOtv0o24q7Lzp0
         PSFxwYZ8YmVCO4EcgyZsAXXSrgeNtcRF81szdHJhMYMRwZYQ/7Vb6j1hhVMoyVNDMn0d
         PkDxNQOaCYbTMaNQSl+8zL14nfhTrY0ndVhxdXx1cS6G9dwAamakazxv0TGDAV5ga+eT
         MDdu7p1T6Bq7nRsSCRxmU9pw1QJg7SvlGbMuEnG00VWRBl+EoJrGFoMn1ddeRSeWn1uz
         OuQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2E1CCL3hwI52982DZf/ohhbXsVbclHnxUB6zUZUwflc=;
        fh=B6HeP4lNZIkdPJyz+WdMAck9aftuMP22UuZIUpiX2U0=;
        b=PY2ZI01bdroNyENQTJ2wJLYe5hdkaVPJH91F+fxwE91RwVuI9k3rD1Z1OqOrVH0LFr
         ZGeHeCJFALAcmYJG4c0IZkMVec/0yW6ELpG7jqkXQ+rHzGpzDGdRZ8SOJVIJ6VJI4Bjc
         qR9h0nOpZYOBSvLc46HhFSYN5a0D5GzuqhAWB2fxdXasX8eifojT3jlj/RUBSicomdkN
         OXMaiwN7dEUJQGZxiXIpFGNrq6kOf1o7yIZAi7o4IanHwxP2pfVoLdLb4Ioj1YaM139z
         /W4z/JNkYCYJgEpvIYnj8lEXtvpWG4jBj8Y2IBEFgCtIsvU9ptJyBO1DrWFsTpEDcRB3
         rmYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767731511; x=1768336311; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2E1CCL3hwI52982DZf/ohhbXsVbclHnxUB6zUZUwflc=;
        b=qQKCJNREqOCXOaFoDBhsPlDOH82NJhQYLKc3kWLYluqXr1UdtcmJruBOV5AOF9sEHj
         8luONYogfe1I4mnlyfY6XElsEnju/A+FKhWUo2VtJb+0AmKIkMRTBvjladd37A+hXfZn
         JMGinFd4xmPapW/IwwcalaPix6rfe84okzWsBbC7QtQML6lHYw6mO9gZOE8Vo+zxJmkz
         YPbHFcM3hLcQ7+d8cQ+mJNt48mCJ1ogZzIHHbImrMdea4KHK+QMRUyB0lXvKvk/Ch80i
         GU4I4C6t1RuM/KE16w++n1WhQZZoQ35+yYw5jKroT8OX2WQhE+7wFCIhRA5KrF3IuogX
         rFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767731511; x=1768336311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2E1CCL3hwI52982DZf/ohhbXsVbclHnxUB6zUZUwflc=;
        b=IikWbe4vYe7kDk2+HhlrIydh+LXjqx6VstISdo3zXRa9z3HvWfs3EaVx/Znd/NbjW/
         NXMHzvdN3keithyF69c9BzuQz4Fvi6lJq9Be4YBjlXA0ILx9Lx1w6L6ExP6qsv/8IWId
         td+hD3L92FoUXPe3xQBnygmJY0uG4teivxTy4a/hHTyiPrOHB1081HTQDrC6Syna4CDm
         NXO0z22Xrt9hiev+AjX206DqVsnSqCr12JPi4klVHkHQO0dOJZknt1u73mLADKxNMP+F
         u3W57R559q3SpV9rvDYEgKixDPGnM3Zv5YDZJdurdYEWnTpfue+Jdp2fPQOTe1ZMv4mS
         wg6g==
X-Forwarded-Encrypted: i=1; AJvYcCXueBj4M7r5IyIkM3rz3LfTgkh76sqDAVJJ0DtQrJ2Fmh07vYHrKXjkFQllYK6ELBuftanIXBRIoOgoyavYLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywQsWtEh6kep0ahTkaCvcMjcrxyO+7llaymAR/sR5/hLcn8uiY
	psCIRvxHSAqphlMP+M5z0ic52rMFU8WqH7LVM8VV6ctXfCCz3NoQqD+gmiBep/uhWpa50vzXpcO
	eXvb77U/3M+97TwkRkSO3gAq/bkC6JFUi9LrQ21a+
X-Gm-Gg: AY/fxX7cQOWfRft3kerbayF5xwRhUPeyOVQNPqSc6AV6W12jVbFG8G+OBsVKjVo1kfJ
	P3zU6i/FVxpIkraOZlWCrdscsF5LqXKIiOZIXfSSYhs7ab3fI21CdMn58pjX6omUArtUuhRcS/h
	WkONt0iLqbOHMYy2bvkCQEp4kET3wCMmuHPf+ZTPu6MV2Cu1WV5kiFmz29Ncqy7bC+xOBDRAF/L
	oVa+MNDsMzLu6eTkPmZ2SrQ0YW9Sanv8ZMLoeSH3FxUHlr9n1TSgGen6dQ3902vjAfGdwPKrRoT
	VK0W4HKfLBAGm+J5L9sYC+QKrQ==
X-Received: by 2002:a05:6402:20cc:10b0:650:14ec:b17d with SMTP id
 4fb4d7f45d1cf-65097c02af0mr7341a12.10.1767731510416; Tue, 06 Jan 2026
 12:31:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105-cfi-lru-status-v1-1-0b2401f7c5b2@google.com>
 <202601061201.2CFE0303CB@keescook> <CAGSQo000gN5-33yQnuXw08v3+4ZNDbDH780-P+mHmGmtSz9=mw@mail.gmail.com>
 <202601061223.E39B079CA@keescook>
In-Reply-To: <202601061223.E39B079CA@keescook>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 6 Jan 2026 12:31:39 -0800
X-Gm-Features: AQt7F2oeT4qKSswkI8YdyJTBclps5hrxHzJqxnNzoP_LPHSXYxoNcwm0EkXRP1o
Message-ID: <CAGSQo02jXz72=-9TUcbSUxOc0Yx9-3AA24mw1PjrwFP-ajq0+Q@mail.gmail.com>
Subject: Re: [PATCH] rust: declare cfi_encoding for lru_status
To: Kees Cook <kees@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Ramon de C Valle <rcvalle@google.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026 at 12:25=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Tue, Jan 06, 2026 at 12:18:41PM -0800, Matthew Maurer wrote:
> > On Tue, Jan 6, 2026 at 12:01=E2=80=AFPM Kees Cook <kees@kernel.org> wro=
te:
> > >
> > > On Mon, Jan 05, 2026 at 04:12:47PM +0000, Alice Ryhl wrote:
> > > > By default bindgen will convert 'enum lru_status' into a typedef fo=
r an
> > > > integer, but this leads to the wrong cfi type. It's supposed to be =
a
> > > > type called "lru_status" rather than the underlying native integer =
type.
> > >
> > > Is this a bug in bindgen?
> >
> > Kind of, kind of not. The things that are interacting here:
> >
> > Rust assumes that enums have all their variants defined in its
> > codegen. This means that if the Rust definition for an integer enum
> > has variants A=3D0, B=3D1, and C=3D2, and we get sent `0xffff` from C,
> > undefined behavior occurs. To mitigate that, `bindgen` usually (unless
> > explicitly told otherwise) *does not* represent C enums as Rust enums.
> > There are several ways to do this. The default, usually used in the
> > kernel, is to represent them as integers of the correct size with a
> > set of constants available to compare them against. Alice has added an
> > exception for this type which switches it to use
> > `#[repr(transparent)]` struct lru_status(int_of_appropriate_width)` as
> > the type.
> >
> > The Rust CFI implementation assumes:
> >
> > 1. `#[repr(C)] struct MyStruct {` should have an encoding equivalent
> > to a C type named `MyStruct` in the root namespace, similar to using
> > `extern "C" {` in C++.
> > 2. `#[repr(transparent)] struct Foo {` uses an encoding equivalent to
> > that of its only non-zero-sized field. This is done because the usual
> > reason for `#[repr(transparent)]` is to guarantee that the layout is
> > identical to that field so you can safely transmute between the struct
> > and its field in certain scenarios. There are several places in
> > commonly used Rust libraries where CFI will report if
> > `#[repr(transparent)] struct Foo { bar: Bar }` is not encoded
> > equivalently to `Bar` as a result.
> >
> > If `bindgen` output `#[repr(C)] struct
> > lru_status(int_of_appropriate_width)`, it would just work, since that
> > encodes as a C struct named `lru_status`, which happens to be the same
> > as a C enum named `lru_status`. However, outside the scope of CFI,
> > labeling this as `#[repr(C)]` rather than `#[repr(transparent)]` makes
> > no sense.
> >
> > What Alice is doing would create a struct with `#[cfi_encoding =3D
> > "myencoding"] #[repr(transparent)] struct lru_status(i32);`, which
> > would get treated as a transparent struct, but have the provided
> > encoding.
> >
> > The possible fixes in bindgen would be to provide
> > yet-another-enum-generation-mode which causes `#[repr(C)] struct
> > lru_status(` to be generated (easiest) or to automatically attach
> > `#[cfi_encoding =3D "correctencoding"]` for all declared types, possibl=
y
> > by querying clang first. This latter approach could theoretically come
> > with an error to emit if CFI encodings were being generated but a type
> > that would need one is using a raw integer (which can't have a CFI
> > encoding attached).
>
> I see; thanks for the detailed explanation! My main reason for asking
> about this was wondering if this was going to be something that needed
> to be fixed for all enums, or if this was more of a one-off.

It needs to be fixed in some form for any enum which appears in a
function pointer type where Rust either calls the function pointer or
defines a function that will be used as a function pointer. It would
be best if we got a comprehensive solution at some point (either all
`#[repr(C)]` or always attaching `#[cfi_encoding]`). It just isn't
common at the moment in C APIs to combine function pointers and `enum
foo`.

> It sounds
> like it's basically a one-off due to how the enum was chosen to be
> mapped in this case, so that's less concerning. I guess we just need to
> make note of this when choosing that kind of mapping in the future?

Arguably the C code triggering this is doing the right thing by
referring to the type as `enum foo` rather than `int`. None of the
default Rust representations in `bindgen` will get us a compatible
representation, which results in things like people writing a manual
`#[cfi_encoding]`, so in an ideal world I would like to see something
done in bindgen about this.

>
> --
> Kees Cook
