Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F7316C864
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Apr 2024 17:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713462746; cv=none; b=WOi0LpLVPJWvZiketndHCTeRYdjwLKQZ2s/1zEn0JkxDtlNqWFBkN9fM5PgqcXLh3lyN9Q0H81LCRK6oicAWsL46aZiLU7Bf0nwG20pNwDd6Z3ww0C48PnJe1Kr5VFJLRBPZWGfGrbJokX7Pn0uw8g7A6v/9bTdVBaNEpSK14+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713462746; c=relaxed/simple;
	bh=6Qed5vhGTcz1STV7H9fAkWDWQkTCrI3P/ws6hdROluw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cL0Ar5ucOhdxbRmmTy9fLjMJKK9y6XXUp1xiMFfQnPmFUEj6EHwUWOjs4l0FuQF5zrShFdv1QdOe5q9vyCLT9tdsGuXQYwoWggW8rfAkch90QSKxDV30NymcqaBVVl/LbK+zrX/A2f5Kvw+JUru7MOpGQ1eC38TGb+LuSEagA+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=UWbM272w; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="UWbM272w"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-61ae6c615aaso12682377b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Apr 2024 10:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1713462743; x=1714067543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fezWjsLogxXqyEuKKr9Hy9rCs7/m/0D7LZfJ5JnAum0=;
        b=UWbM272wKEru3SvTEgnLznGYhaaYuAhPDatXjQl1zOt6D6O8oDl7cvbRKNvzwfWOvg
         nDPQ408o4fZe9prdIOvJiP2HhjRtNT8+tN3T9j63+rPfCmcq2HYb2c1AL4op/F5ykv/v
         B/Oqz7xy+Et+Mso5/TKbyNrZnn4R+48Ba2Cb4mV6UkDWXEvnohssQMN0JNKXxbnAwjU0
         e5rbAHxpKbmCn5MmIpH/A0SeCbmyp27te79kmS15tCZlke629ASvZO40I6os41UYtl1A
         7KC0gp6L0WyMW47ow9+lc1WH5p48q5aN8/xGzoHvvdg7EycSaVkCBcgxIB1UpMaVvazm
         7a2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713462743; x=1714067543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fezWjsLogxXqyEuKKr9Hy9rCs7/m/0D7LZfJ5JnAum0=;
        b=fNyNf6x4nGuBsI13IY9LKXsIlelNeE/yhfsfEwX95jVUeu9ygNFuWgFQyp2rZMS47X
         //HkjczVvYOl1U4hsL4wp8D0hcs1R/FaIPH4zM0psxwEAWZMuTl8R1zHAMBylFpGGPya
         ZoyEmHVh8pwFtYly4tdbt6oGbwhgJsJ5LGrdilU56Zr47wtBrL1pSATdOx6oGeo1fFnd
         1OPRT/mFD7YA1qbVEJIuD6zgGC6A6FVrmCnR15Z3e+6rqSkygffabxEsZXvvUQ3aQqI3
         Qleeei3Nhcy0VK6NfNmdVAPeDFajbMJo5eEdUUArMMuZBNWH6Ocv6WhshTN/0kR5b4Fk
         4jLA==
X-Forwarded-Encrypted: i=1; AJvYcCURWkGZTNRY/RMxTxy3o715dGPQW9X0GRRhoXneKrtr+c4SSGXpLjkFy+zoGUOOBv3x+VD/IH3Mt7KlK7XsRIpOP0pIDOqooAWv+sl95FE=
X-Gm-Message-State: AOJu0YwDWbvrEjUWjeBk1S//pzVOEV+V97p17IEA2p/ZFH6cXKkUMoue
	tb2Hf2wAHQSC8tkb8lL4Qu7mWQu0t/ElF85V79Gkt/712ZdxrvLXwf183ZH9CM0SdHtKwlin9rn
	Jf8KfWxm76iJ+mdDjVHAavBltTdOpUc4lmpynhw==
X-Google-Smtp-Source: AGHT+IHLIxLV6AmwYctLpvdfNF/hPmIXNgahPf3Z+946bF20hsA3skulNWrlmiOhkxE68LjMsdpOYru+qXDZ9OIWRJE=
X-Received: by 2002:a25:8586:0:b0:dc6:4d0c:e9de with SMTP id
 x6-20020a258586000000b00dc64d0ce9demr4057848ybk.0.1713462743430; Thu, 18 Apr
 2024 10:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240418-alice-mm-v6-0-cb8f3e5d688f@google.com>
 <20240418-alice-mm-v6-3-cb8f3e5d688f@google.com> <5fd684d8-d46d-4009-bcf8-134dab342322@proton.me>
In-Reply-To: <5fd684d8-d46d-4009-bcf8-134dab342322@proton.me>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 18 Apr 2024 13:52:12 -0400
Message-ID: <CALNs47tJyrnmp-5AXs2mHU=JKC5ibHnn+Soy4U95NziRoc4z4Q@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] rust: uaccess: add typed accessors for userspace pointers
To: Benno Lossin <benno.lossin@proton.me>, Boqun Feng <boqun.feng@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 9:03=E2=80=AFAM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 18.04.24 10:59, Alice Ryhl wrote:
> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> > index 8fad61268465..9c57c6c75553 100644
> > --- a/rust/kernel/types.rs
> > +++ b/rust/kernel/types.rs
> > @@ -409,3 +409,67 @@ pub enum Either<L, R> {
> >      /// Constructs an instance of [`Either`] containing a value of typ=
e `R`.
> >      Right(R),
> >  }
> > +
> > +/// Types for which any bit pattern is valid.
> > +///
> > +/// Not all types are valid for all values. For example, a `bool` must=
 be either zero or one, so
> > +/// reading arbitrary bytes into something that contains a `bool` is n=
ot okay.
> > +///
> > +/// It's okay for the type to have padding, as initializing those byte=
s has no effect.
> > +///
> > +/// # Safety
> > +///
> > +/// All bit-patterns must be valid for this type. This type must not h=
ave interior mutability.
>
> What is the reason for disallowing interior mutability here? I agree
> that it is necessary for `AsBytes`, but I don't think we need it here.
> For example it is fine to convert `u8` to `UnsafeCell<u8>`. Niches also
> should not be a problem, since eg `Option<UnsafeCell<NonNull<u8>>>`
> already fails the "All bit-patterns must be valid for this type".
>
> --
> Cheers,
> Benno
>
> > +pub unsafe trait FromBytes {}

See also the reasoning in zerocopy [1] and bytemuck [2]

[1]: https://docs.rs/zerocopy/latest/zerocopy/derive.FromBytes.html#analysi=
s
[2]: https://docs.rs/bytemuck/latest/bytemuck/trait.AnyBitPattern.html#safe=
ty
