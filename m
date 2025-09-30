Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56491EBA14
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Sep 2025 07:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759216649; cv=none; b=SdRAEnN7yPOpBS7+06LUiq6a/q1kVc+dy2x8ACQKizxzWeUh9SI3EUQkHobE8cowtADQoUdX/yKl4RNLoT8/uC7ZVU5CgRx6s+rbrO5+e4QUFC/okzQSNnFZgu9ff0M0b8riRmKBG5OpfBAdhrIAzPXYno/JaZwMh/Jcc1jkzVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759216649; c=relaxed/simple;
	bh=/D4lC7F+UGZr7Evn4mblI8m68a87qPsLaGhGWlKJem8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vDj9EOP/5uKiVfwJ98M178pF8Cqnfovs15p8JFPszzKkwJbdJIvIgGrksJvv0KqJnuRhFB+dPaWq2DWgRk63SE7afPuwi2KD9m599B1rw5U4jEvn5S4OApy3qBpuUirmnNYvVStI8vsFbHmNZ1A7cP3QYt+gz2XCxdoFRzhsloQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1Re8VBC; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1Re8VBC"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-4242bb22132so54561435ab.3
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Sep 2025 00:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759216647; x=1759821447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/RLYL9C2/J8Q8nWHpTOfcWgDV+Di6Gs1p9meRtJDAk=;
        b=V1Re8VBCkLcujQ649mKT7PUex8rLkfwEadFAqBSS7qyMebIr3qkCNMLAwDnuz6b2S9
         ilPTfkKU4xaZv8rCY7VyMfGsuIYpmpnKtdzFS0sDCEBmZVbuj64D4ZkRzYBokL59E1th
         Y4a9bcMN8te6lftPvU7rfo7zu7CPF0JGBYimNOpcsSgnnI1I9tU9AgxG7lUqTbQN3nEm
         fbbXL5a2PBKGWKdI/ySqdhzKs2DB0VG/4Cdh2N/SygnuYU8GWBkDbiOCVw6wgJu6ywvE
         JLOejQDCfk0NoVPMohg/Cr+yOuyxuEhVTekZBN8Rkg94PHZGh+I+SCFPV2M7++PCvCxU
         v45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759216647; x=1759821447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M/RLYL9C2/J8Q8nWHpTOfcWgDV+Di6Gs1p9meRtJDAk=;
        b=WzMv785hgyhX/En159kzC01cPbzAUld6n5KSXWJW/n7a1Ru/xnNsMXGF4DNQ/qFdUa
         1iyvcW9HR3rZr1L17iCbR5r3owa+gZFY/G7fdtGVZkW0fY+X06Wx7sjJopXbOtnMZO7q
         DzRzMb4PeT85ccYFmmf+1/0s4k8QL4cUJs/sQlhtkcDi55g7Yyb7TmX+pg/Bta2wJy7G
         EjZY+S9cEqEPuhdgxhIWOh6myi6XxJCsmYE3KSZyLuV1Kut6oy6A0YbDrcAazMf3mUER
         5zIVImCJRbWb2eY3vXJdq0ubipT2jeLLJPecEJAIMVVXh5hMprz3+RLa/gJvEbU19rRO
         rx5A==
X-Forwarded-Encrypted: i=1; AJvYcCWJvR+7Elybo8QePAZHInT3sftgLC3Q2oxCOCrU1XqvCfSyWlx3uLQM0H6AhDX+QLtTwgZJhf9yfeJgwi5o8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+VtgL5NLrCYcW7qwrJjvPNLp9QVoEk49rJ6SrXcqNQYS2e0Dy
	c+xWQdMoB413eEZqAOfE7nMZJRzwXghSz1ZHVV7V+WoCPxoHp7UPCnl7PJwDf30h4J1OwEQUTbM
	4FnxEgut6hmcPGVQH5XdEhVv05QbolrE=
X-Gm-Gg: ASbGncvJJLFiX2D5lPuxvugcWzYppuzCzzyQWkx8Fkl4AEBwKjPbUno7aB4zFzrYLXy
	FKVQJGzS9R5N80tUe1UY/UddIcoTofq1PsN9yBUGpRi9PjamTj5J6/qB7gVxX9s3yyFRA+GFzxU
	htm7YO6uT3WJKySPbDxy4zFMIyTJV1fkRDG58kPIcC0WgA4ZXBP5tz/FpA5aWTyaIuVIxXfqIgC
	ja8eBB4EWniGCh4kGKexNRlhfwkVtbvcZwSUum8dA==
X-Google-Smtp-Source: AGHT+IF6oX4c1oT2QtGdImEkUmXn1fXUlDQYi0f+7OA8UeT8rnRYJ0Dbg7DVj5ZgRDIjPNT7QjcBtGER6b7SwehrbY4=
X-Received: by 2002:a05:6e02:1686:b0:427:511c:f86f with SMTP id
 e9e14a558f8ab-42bfab93823mr84067065ab.17.1759216646727; Tue, 30 Sep 2025
 00:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1755235180.git.y.j3ms.n@gmail.com> <948a28f26a0e9924d82eb1d8d377e3ddc7335b24.1755235180.git.y.j3ms.n@gmail.com>
 <DD5VAPG2QFWA.2A58AL13VHPN2@nvidia.com>
In-Reply-To: <DD5VAPG2QFWA.2A58AL13VHPN2@nvidia.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Tue, 30 Sep 2025 16:17:15 +0900
X-Gm-Features: AS18NWCt4CiaOBLLw6E3ZJGY5ZpvbTCUTklAJf6rpPrTAabktBULuqhmTF6POuo
Message-ID: <CA+tqQ4L9PN9n0e2A5BfGhn4n02v8LKSK+BRpHcfbK_fNUKBJPA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] rust: macros: extend custom `quote!()` macro
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 30, 2025 at 1:58=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
[...]
> On Fri Aug 15, 2025 at 2:32 PM JST, Jesung Yang wrote:
> > Extend the `quote_spanned!()` macro to support additional punctuation
> > tokens: `->`, `<`, `>`, and `=3D=3D`. This symbols are commonly needed =
when
> > dealing with functions, generic bounds, and equality comparisons.
> >
> > Tested-by: Alexandre Courbot <acourbot@nvidia.com>
> > Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
> > ---
>
> Note that this patch doesn't apply cleanly in `rust-next`, I've had to
> add the following on top of it.

Thanks for pointing out the conflict. I see that the commit
9578c3906c7d ("rust: macros: reduce collections in `quote!` macro") was
added after my patch series.

> I suggest waiting for -rc1 to be released and using it as a base for a
> new version - hopefully this will also give time for more feedback to
> come.

Sure, happy to wait until -rc1 and perhaps we'll get more feedback by
then. Once it's out, I'll rebase on top of it and send v3.

Best Regards,
Jesung

>
> diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
> index 76a99f7e01c4..bb6970fd2a26 100644
> --- a/rust/macros/quote.rs
> +++ b/rust/macros/quote.rs
> @@ -147,33 +147,33 @@ macro_rules! quote_spanned {
>          quote_spanned!(@proc $v $span $($tt)*);
>      };
>      (@proc $v:ident $span:ident -> $($tt:tt)*) =3D> {
> -        $v.push(::proc_macro::TokenTree::Punct(
> +        $v.extend([::proc_macro::TokenTree::Punct(
>                  ::proc_macro::Punct::new('-', ::proc_macro::Spacing::Joi=
nt)
> -        ));
> -        $v.push(::proc_macro::TokenTree::Punct(
> +        )]);
> +        $v.extend([::proc_macro::TokenTree::Punct(
>                  ::proc_macro::Punct::new('>', ::proc_macro::Spacing::Alo=
ne)
> -        ));
> +        )]);
>          quote_spanned!(@proc $v $span $($tt)*);
>      };
>      (@proc $v:ident $span:ident < $($tt:tt)*) =3D> {
> -        $v.push(::proc_macro::TokenTree::Punct(
> +        $v.extend([::proc_macro::TokenTree::Punct(
>                  ::proc_macro::Punct::new('<', ::proc_macro::Spacing::Alo=
ne)
> -        ));
> +        )]);
>          quote_spanned!(@proc $v $span $($tt)*);
>      };
>      (@proc $v:ident $span:ident > $($tt:tt)*) =3D> {
> -        $v.push(::proc_macro::TokenTree::Punct(
> +        $v.extend([::proc_macro::TokenTree::Punct(
>                  ::proc_macro::Punct::new('>', ::proc_macro::Spacing::Alo=
ne)
> -        ));
> +        )]);
>          quote_spanned!(@proc $v $span $($tt)*);
>      };
>      (@proc $v:ident $span:ident =3D=3D $($tt:tt)*) =3D> {
> -        $v.push(::proc_macro::TokenTree::Punct(
> +        $v.extend([::proc_macro::TokenTree::Punct(
>                  ::proc_macro::Punct::new('=3D', ::proc_macro::Spacing::J=
oint)
> -        ));
> -        $v.push(::proc_macro::TokenTree::Punct(
> +        )]);
> +        $v.extend([::proc_macro::TokenTree::Punct(
>                  ::proc_macro::Punct::new('=3D', ::proc_macro::Spacing::A=
lone)
> -        ));
> +        )]);
>          quote_spanned!(@proc $v $span $($tt)*);
>      };
>      (@proc $v:ident $span:ident # $($tt:tt)*) =3D> {
