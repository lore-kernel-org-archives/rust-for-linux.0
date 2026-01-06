Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642A12D595D
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 20:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767730737; cv=pass; b=rn3km0Dq8ZOz/XvXnrtobtnXG0RsS5C0DGq9b8G8llCR0y5uXrQSINSZTA96hg0c+GM5XRv7VKBbZY+PfdfM6b9r0h8is4GawIn9m4pUB28RQy35fr/Hxilzu9OrpSF2YDGhZeao7QQITj+vrZeOmzC2TNvqXw758syjkhlCz2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767730737; c=relaxed/simple;
	bh=mJK7tEWaEaayBdll/gB1qp/cEoE2uWlT5/NoPth/who=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PFKzG+yVIF31LM4UdPOOjWW4aFkVQ17/GTmQOTpctvOY0BElMdqGzXkHKMgn6uQ0EHp1uauoeg/2jLk4KLzWrmPXbcSnMTYBO1xTT26hNgPf7iaTs90DxIZyJ+MNBoFoockJKXfM1L1lyCmIqTVjStltuEK5usZj4jgjLoPHir4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zNUhjPV5; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zNUhjPV5"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6505d147ce4so2215a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 12:18:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767730734; cv=none;
        d=google.com; s=arc-20240605;
        b=fYJejqTH1zfBY5VQHVHR+EgHFae6sYRuWWRCD6Qox1qcXu84ovdMxE/1MGOjUgCL+p
         f2Q8SKWUog5SwxaJvEq9il1VGYNMvW/6jV+jR3VqRhWMG8uNzf5n6+zpW5MGLp8uIrD/
         ufATGqAIbthsPt6YUnrXXezmGGh3g9/HVpH3VRsDcuSl+s+V7gqf6MyvjXlmbxxaOpYA
         C1C+epmejKBW8SvGJiH1grGNMoRMaYhHCHAR5nh4Xd4sjvMt4qFnQaARdQPSkvbSX98o
         Zg2woQhlURtTWABsb5C1J+MceUFH/I5RjnNPm4//0KZfpwHKozM04VC67sHMRcRToqkG
         6ZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mJK7tEWaEaayBdll/gB1qp/cEoE2uWlT5/NoPth/who=;
        fh=azFXAwfYihhCLyHwxonXQ/ObEOYQBIrcSfBZdSET9gk=;
        b=TtkX16uFcl71uIoqvBggpKgoBwSoJDy84yPCVOGFFXqUiY2lgLfiS8EaidMr6L1WFY
         MnW0f8gFqW+om/T0zQzHa5I/cowDLhVioxTDEeQuhihJ600N9Kqk/ckNkEPQQQr1pUKK
         SgZ6gY/d59b324amjXxWCZ37de3zm+sOBzU6uWvFc7Gdo/gcQD28ldMtl3eOTwK6+uwf
         toXY+zs9051tn9ekJdR12ML+t0MZjn22mE56MqereU/0Tw9G6RVmYpecYYxZm6EOrNp2
         6l1VYXn3w3ntha0XsRRqVMcTmONR1gDnZrbImjW0ef9abNLhKGpmlY7BN2bIO/56TMWa
         SEug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767730734; x=1768335534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJK7tEWaEaayBdll/gB1qp/cEoE2uWlT5/NoPth/who=;
        b=zNUhjPV5s2imQ911T0uYm9O4FeQviAmT8sOLp2tQm0W5pbN+5pvSTQz9d8HGr26DpC
         71xcRQvwF4Dk9lYEzIhfXMbJtBI1FclSfOCtu8IVZz/waUkN6jG6YkZ0vATchftxO5CF
         qPracSKs6pASijBNy4dCmjYeK9Sr4JeHhZVQB3sVsCoinDUe8FPMTrxVVl99MopcqHjX
         Ll3kYnr9hu4hIP3UDPsqKpJ1FL6qpjiYglhy4SHdo4EXp7+I9/UiQgdmSYOg1VT4iUX8
         lxqw7SqXxomm29pvyaviTTwF9FCzt6hZTWKR3fF25AOX9oFS5lK+sWthiM9Y5+ekteFC
         FCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767730734; x=1768335534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mJK7tEWaEaayBdll/gB1qp/cEoE2uWlT5/NoPth/who=;
        b=u5iLOzLC9fgEyvx4Q9/Ni42qSazd+IrvtABOGcP2iByywLcFgSfxVNFpZEPaErA1V0
         HLbQ8cIdpJmxiOCeBlclFUiXGKivJ9e9oOPLrdkeNUTK8K1C6xNWpsxL6OP+FhZS0BF2
         TFc22xOTN0G/403/PAkUvJ1LV3f5flnYmCBnSrsvC8acvo5hIBgsqdab2NjAbCoLtp4S
         E6LHOzsnFhoYmszQ6r8SWZG/h61bLwzmj4ixEVY0bZCxkayhMHaaN1xh2EQNIN0u6tv6
         3r2Zyi/WKO4EfZ76mf3h21HZTDMHs3FvkW6EiO1z2ESiHC091Nc9xsgK+mX9Jm9rrxjt
         Ovig==
X-Forwarded-Encrypted: i=1; AJvYcCUBmjfrP+XwB+3BSPIcS4+DMK15d5FWrIY2NZ2RJ/DPZIm/Nvkfu58lUmiRuvE4rF95FGiDPTRJdYaQkN7k2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTd0vETpg+OYCiFDv2cFTg9aUk5rNgK+IKJBRg1IY4BOZ6PAUh
	0sNNQiCDyEjaObI7zT4rbCOZ4YKwbpxWMUD4/ydze2j0gBPW/wT7LWF+B9Ri6dpB62O+HsTtEKM
	nTL/l7a+lBt0jtLabNgK0SnmuX62d/JW8VUJYxdkW
X-Gm-Gg: AY/fxX7af0GH4+iYl/QLOQz5gloOJvOJ1el9dgC3/BcryEzoaBLBLfSh7BaPrpdQf46
	FVHYrhjzhXumf8xm78fG7DReI0SCoF/tzj8msF4UNyBAeK79Yom/t9HAATOxWscNfHSTzpx+Df4
	KA2f9bXU1sOyLnFtG3VZzu+4NCB3JbQVTkDmiZD00wMdf2UG4lcOJ2Fsq+vZlfThiJBZpRzwmt1
	cu3FOwHAxwcs/PtJ0ZnLxVUkyTCs/bv+EmN1NgPB9p9juR9c9D+jCCHkOgfv/axQN6ptg9LT4qy
	8j8wNvfOigMTdzFV/dBgaD9hgg==
X-Received: by 2002:aa7:d592:0:b0:643:bfa:62ca with SMTP id
 4fb4d7f45d1cf-65097c02ddfmr5462a12.8.1767730733466; Tue, 06 Jan 2026 12:18:53
 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105-cfi-lru-status-v1-1-0b2401f7c5b2@google.com> <202601061201.2CFE0303CB@keescook>
In-Reply-To: <202601061201.2CFE0303CB@keescook>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 6 Jan 2026 12:18:41 -0800
X-Gm-Features: AQt7F2pgAjPKmZWd5vfjF0iM3tJfeFfEXyVrED-mDk1znELbOf9gP0jZaRVjTis
Message-ID: <CAGSQo000gN5-33yQnuXw08v3+4ZNDbDH780-P+mHmGmtSz9=mw@mail.gmail.com>
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

On Tue, Jan 6, 2026 at 12:01=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Mon, Jan 05, 2026 at 04:12:47PM +0000, Alice Ryhl wrote:
> > By default bindgen will convert 'enum lru_status' into a typedef for an
> > integer, but this leads to the wrong cfi type. It's supposed to be a
> > type called "lru_status" rather than the underlying native integer type=
.
>
> Is this a bug in bindgen?

Kind of, kind of not. The things that are interacting here:

Rust assumes that enums have all their variants defined in its
codegen. This means that if the Rust definition for an integer enum
has variants A=3D0, B=3D1, and C=3D2, and we get sent `0xffff` from C,
undefined behavior occurs. To mitigate that, `bindgen` usually (unless
explicitly told otherwise) *does not* represent C enums as Rust enums.
There are several ways to do this. The default, usually used in the
kernel, is to represent them as integers of the correct size with a
set of constants available to compare them against. Alice has added an
exception for this type which switches it to use
`#[repr(transparent)]` struct lru_status(int_of_appropriate_width)` as
the type.

The Rust CFI implementation assumes:

1. `#[repr(C)] struct MyStruct {` should have an encoding equivalent
to a C type named `MyStruct` in the root namespace, similar to using
`extern "C" {` in C++.
2. `#[repr(transparent)] struct Foo {` uses an encoding equivalent to
that of its only non-zero-sized field. This is done because the usual
reason for `#[repr(transparent)]` is to guarantee that the layout is
identical to that field so you can safely transmute between the struct
and its field in certain scenarios. There are several places in
commonly used Rust libraries where CFI will report if
`#[repr(transparent)] struct Foo { bar: Bar }` is not encoded
equivalently to `Bar` as a result.

If `bindgen` output `#[repr(C)] struct
lru_status(int_of_appropriate_width)`, it would just work, since that
encodes as a C struct named `lru_status`, which happens to be the same
as a C enum named `lru_status`. However, outside the scope of CFI,
labeling this as `#[repr(C)]` rather than `#[repr(transparent)]` makes
no sense.

What Alice is doing would create a struct with `#[cfi_encoding =3D
"myencoding"] #[repr(transparent)] struct lru_status(i32);`, which
would get treated as a transparent struct, but have the provided
encoding.

The possible fixes in bindgen would be to provide
yet-another-enum-generation-mode which causes `#[repr(C)] struct
lru_status(` to be generated (easiest) or to automatically attach
`#[cfi_encoding =3D "correctencoding"]` for all declared types, possibly
by querying clang first. This latter approach could theoretically come
with an error to emit if CFI encodings were being generated but a type
that would need one is using a raw integer (which can't have a CFI
encoding attached).

>
> --
> Kees Cook
