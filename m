Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A7C3603E4
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 09:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000039; cv=pass; b=kCEeUAq4QWQDKv/9L988F5iaDUiZncaNeC/vQV2wNe/kdm8RCJYJFvuwaIeqvMWNuWXa0U4ApiAh+N18jYPUcR2yQxz+AhL6Pa5A1lecnG2ZvhfgehEO+hrDiKCCNY+Ddp6ThRkxiRjKoP26hYwBEHZ3HFQzU8OHCWlG0E8fOPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000039; c=relaxed/simple;
	bh=6NChBk2g/CcrG1pK4SnXVcSD4UNaf9g3wFoOyU2k3TI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRrEhHZWqtBrOAdIsrgiu9Out8/locCq0SexJjP+JK5JzBssVp//LllSssLjQSnT7jzOAIcHqm49UAU4dSI9cG/9AptabB8jfAv+GHBpcqUTVLWtz3DMgJ1uBo8iWfjZiC1xiDjOvxM/FyOTmLObgki3j4gWhz0V3tuE5g5s6wA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CT2ioVa2; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CT2ioVa2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso3178445e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 02:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774000036; cv=none;
        d=google.com; s=arc-20240605;
        b=XNxuJpFetDnc2GhLq2ymAxY412T89a9lkaI8DGGusdUCu7HJwVSZ0kQr0Ufy0NLvSx
         Afwug+mUrJ881kFKfGqJ2id0O7uGT3+6Jb8Cffe7bZqxRzC8UGOB7yu8n8U/kzyRcuWa
         Jp03fxr2syggZJzZj/nuSOEVabnhKXPkxdtv+9LJbve3O/cwiwn41++7WIULsqbmdcGR
         bDlCaUS3uvVFcQ4+9C5tvcEal28aVZZPzZR1KemeC6/ubV93oe6FdHa5zXytoMnlF/gD
         FvM0dSzgcK/iq4P82+5nSYfoJ1Oq3rjC0xSFZta4PgV4NDU+6Ol7jk+YeaVq90yzPBub
         HdGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=juyLmF5Z9zF2T9ykQQIPoKjz0SyC5z5fBHUYKOb8ayo=;
        fh=/LuhUH05l+7gUX1OhRp/eCwsiLxZokj8P8cisSFGZTI=;
        b=Xh4lreKPnoZjt/ZwEPFmkR2mhNfER6S9iDQmYGGOB1H2yJlpyJokJdkEqFf5Mpn043
         Km6cEQxtQ2c9BoZelqIkRBE7DAs5RaEKBIrCGtcybNR+UahfT6VqZsA4X5N4eI//ZUZF
         8uzF6/8V/qAmDbc/ZDTCd7/butH8gwuPNS8IIcYzJGnMbRHxQ0D8dXqKNcbDsFfYOajr
         uR50s+dehq2PTAvcNYXnZ3HCW66qGNiNkabIjz+NJdF7n7EnVgF0icuztBpeVxpY4lP4
         TcosDYHJqFF3UNBPF6Kv2MZRqVLJub1rjF/WjjVIPju8Fkba/V/wURWUJRheoxFP/AzP
         kpjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774000036; x=1774604836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juyLmF5Z9zF2T9ykQQIPoKjz0SyC5z5fBHUYKOb8ayo=;
        b=CT2ioVa2KJOSqkPX/GiPZULDk12pVTVdlnoJJwpg70xbTuICZuVe6zqn9ndF3CKPdx
         2qCoiOiQWmYj+6eHbCrw3VGh1RRPhfTeR7u7STxwyNf4to0zRAMMjjuDxwgIdWnMeMjQ
         73aO8zTyT473n4t6YYE3Yu4nsjTbo6fgIjCe8RiBcBN+v4oB5ntpqFKvFfIoN6DHaElR
         kwBVZfUzuJtEgH/NqujGVgZS4Dro9YHRojSyjPobuoLnSL4KCiX6ys5ll05JsHA7R2C7
         KbglQv6Xm4sCbAp0P0Nj98hUqXUYCU7AHaPGa8meeLEtMZE0Ps0fngnKdh346DCfQxtU
         SiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774000036; x=1774604836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=juyLmF5Z9zF2T9ykQQIPoKjz0SyC5z5fBHUYKOb8ayo=;
        b=L/1i0QHNpsBIJQ+hO4qHpmeZ0nx6gS5CkGlUgSnQ3jeJ0au65zQ3Ali16QapdOitht
         VJtW3GB9OZhyYbxhAI5vTzZPpg4RDrwrq7zxwR6hw8GyrHT8257vgePUkR2tw0MLX+4P
         DrGhhqUk8pTi50YY4++4T3Q+QSfgYOgWHlhDoDuUmivS3VltPYNcCvrV6SQq9IE2z0UW
         gBejGOPfe8VzDnjYp8g3n5otdr75LRseL9xiO4XS6QhRNKCy0xkY3+nUcz0dwXRsIl7F
         YrQ/rHzq5fmpVgEBrzdgqqX9JBaEFhSIHRrCNNqTzYyePgYDGRBzsFp+u3CPt31ynBMJ
         APqg==
X-Forwarded-Encrypted: i=1; AJvYcCUFvbseksdqx9GUuyjK/bkipGzX/qVdMjtDn4vTjl6fGJasN8u2Xjk16CAtAfQvoUPHixPkl7mwLEcX10aibA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKYOYrm27cVRuu8cAwMp8pFi1XoOMstnFjnlKfIVekE0iVMyuO
	cLjOK4g4VeXL4kQHHJmjmULQFFy2OQ3gMNZ4PmaA6Q/FYe6MTzhYJiHWRB51Po6XLoQ8zPYY+gl
	WOlLaBkjKdvgOS7HMESHRdBjA7eO9hrbtRwsxxoz0
X-Gm-Gg: ATEYQzyZt6aGHOKAm2S7q+ABSstyMvyymf/BBy61iq0/cVc7gluTiiQpFTWObPV0yVb
	bKqyHBJTfiwMbSkl9cJC99YIpv086Fplbb3bEwgqgbScudRuGi1TA+t24/BTqmJmq6L8iPSHKYw
	XpQJsWGRhI1+85M+yCiXGaF30EJS+DtW3CSnLBM3xp+ZbVYnrwsHegEx9pCKNSX9tilFDwXflU0
	EXFQveyYM7imMXyeQmW9hezm+3Sh8Qh+MzVFLq8fb2RupNHU7tCicwEPnNOtwL87d8Vh9US+48i
	Ok4cocSh5MExah4TJmpU4PwIDe3ByttZzPIz+tT6E+45achM+6JsATJWdMNVJlv0/z04OMcRH3N
	/61on
X-Received: by 2002:a05:600c:c111:b0:485:35ee:f836 with SMTP id
 5b1f17b1804b1-486febbc310mr27533145e9.2.1774000035744; Fri, 20 Mar 2026
 02:47:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317225355.549853-1-jhubbard@nvidia.com> <20260317225355.549853-17-jhubbard@nvidia.com>
 <125cb5fd-55fe-4c54-bdda-0478f5a8aabd@app.fastmail.com> <CAH5fLgieAZz4YAp4-Y1240mVt2V_Pu3TJ8YZyMkP1ZG_neafwA@mail.gmail.com>
 <d766522d-ef82-4300-919c-fed89f2f04fb@app.fastmail.com> <CAH5fLggFsjciKKxv7_k6tXqL=_8JrgAVWq-+xVH1PkGOew44KA@mail.gmail.com>
 <6163dea3-fa75-4403-929e-8ba9ba22eab5@app.fastmail.com>
In-Reply-To: <6163dea3-fa75-4403-929e-8ba9ba22eab5@app.fastmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 20 Mar 2026 10:47:03 +0100
X-Gm-Features: AaiRm53Yyy-JzkF0b8Wl4NP7CZD5sMymyoTgizXdQEmummakjSRHVk3pacKA4Lw
Message-ID: <CAH5fLgh1WMaUpLGTGpWiVjrnTtgFt=hhoutQqxV5DOtrGVsfkA@mail.gmail.com>
Subject: Re: [PATCH v7 16/31] rust: ptr: add const_align_up()
To: David Rheinsberg <david@readahead.eu>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 10:27=E2=80=AFAM David Rheinsberg <david@readahead.=
eu> wrote:
>
> Hi!
>
> On Fri, Mar 20, 2026, at 10:03 AM, Alice Ryhl wrote:
> > The Alignment type can only hold values that are a power of two.
>
> That solves my concern!
>
> Kinda off-topic: why doesn't `Alignment` store a u8 that represents the e=
xponent, rather than the power? The left-shift when needing the power shoul=
d be effectively free, shouldn't it? It would avoid all the unsafety in the=
 impl.

For one, it mirrors the design of the unstable stdlib Alignment type.
For another, it'd make Alignment::of and similar a pain to implement.

> >> >> FYI, `core` provides `usize::checked_next_multiple_of()` ((const-)s=
table since 1.73). So an alternative would be:
> >> >>
> >> >> pub const fn const_align_up(value: usize, align: Alignment) -> Opti=
on<usize> {
> >> >>     value.checked_next_multiple_of(align.as_usize())
> >> >> }
> >> >
> >> > That would return value+align when value is already aligned, which i=
s wrong.
> >>
> >> You sure? (emphasis mine:)
> >>
> >> "Calculates the smallest value greater than or **EQUAL TO** self that =
is a multiple of rhs."
> >>
> >> assert_eq!(16_u64.next_multiple_of(8), 16);
> >
> > Okay, well, weird naming then.
>
> Do you need this helper then at all? I assume it is added because `Aligna=
ble` cannot be used in const. But it hard-codes `usize` as type, yet does n=
ot reflect that in the name. It comes down to which one is more readable, I=
 guess:
>
>     const_align_up(value, align)
> vs
>     value.checked_next_multiple_of(align.as_usize())
>
> Meh, I don't mind too much. Just wanted to point out that the standard li=
brary provides this exactly.

The stdlib implementation probably invokes an expensive division
operation in place of our bitwise-and operation when the argument is
not a compile-time constant value.

Alice
