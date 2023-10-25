Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C28D8480
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Oct 2023 13:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hIktdwxp"
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E7812A
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Oct 2023 06:30:08 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-49dd647a477so2094543e0c.3
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Oct 2023 06:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698240607; x=1698845407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FCfEKDsSxj0UbnaNrhG13AiQF2xaylJwEFbU7V7KMs=;
        b=hIktdwxpd9E3a7a/b45fH2I/23koFstKRUL0OUVCY/6eEPeerRP8Sk0f+GP044xPj2
         fM+6cmb8yqX7AXWr90cqddHS7krSZZerL5gWsAy2xNonzoCTWwN6RvZ+gAYK3gT6hjil
         R0o+6KxKkSet9cDuNKgZJLOVEorn1vjyoWDg2nVQhiyD2MYZRqwPkk5LMladSs8MHiYr
         QtCiaSd72ERGxRwIgLNazjmOr/JPeyl986oAbHU4u+c0c4sZM9oXq8C81uMgLQ7fmB/c
         Y2p75VP372Ybhmd73h/xysJ9zHCbhfz37FQsGQGjng2wReEZah9glRoMYvgP5oirYbSR
         caNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698240607; x=1698845407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FCfEKDsSxj0UbnaNrhG13AiQF2xaylJwEFbU7V7KMs=;
        b=I5ZkXiyeHvuaGL3N6jLX20KGgiEUd3mexBUSosXITrufp5S3LWzowWTKZmgrpAmJt0
         p50FS+/wULsBtb2HfVjkuDG/P/5Zq1FrvbGij44IeKNTGd4JbdMeGOuqEWCRv94A/vBC
         2vo+4GxGopnj7n8oRaHqvxFJU/EHkCoMWUixzHlhcW/Ai1DGWCRVaoXlHUeFwpLYRDyd
         u7OvLMxvOuN1t1n37vKdIpALb/KOI74nhGmFtbZqjzIHYzQP/cC1f9fogeslUCoUTZMp
         NcgKYY/R3T94Bw0Bp3RSQb+9pmteqhTaKg5j3asDmSECNQusp2RPwFwH5CEZdRy9KvpK
         Oorg==
X-Gm-Message-State: AOJu0YwvM/7hIe3Q7fqXUvdIrrKpkYhHBu1Da+JS264uql8Pp2nrAWTh
	u+JxzAS5UvUIxIQK1zvYKbraTweFJ87VS6AXt92KSg==
X-Google-Smtp-Source: AGHT+IEZIO89GvjY7p6Onv9qJsiFS8XSTMJNgINxOt+FqqhdyaLpY0c4XnNgQgLeJNXkNJv6us7+wxUzs2ulyGkppzw=
X-Received: by 2002:a05:6122:d0e:b0:49a:6742:b176 with SMTP id
 az14-20020a0561220d0e00b0049a6742b176mr14979846vkb.16.1698240607437; Wed, 25
 Oct 2023 06:30:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231019171540.259173-1-benno.lossin@proton.me>
 <1cc11492-248e-4b37-9608-b475acde3da2@ryhl.io> <06d27457-6b6c-4392-9be1-d1fecfbfd9f3@proton.me>
In-Reply-To: <06d27457-6b6c-4392-9be1-d1fecfbfd9f3@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 25 Oct 2023 15:29:56 +0200
Message-ID: <CAH5fLgiT4A1jMcsUhPdnXZC0cd=GMWuwDmLjnAGxe55+9HBiJA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: macros: improve `#[vtable]` documentation
To: Benno Lossin <benno.lossin@proton.me>
Cc: Alice Ryhl <alice@ryhl.io>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <nmi@metaspace.dk>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 9:01=E2=80=AFAM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 21.10.23 14:45, Alice Ryhl wrote:
> > On 10/19/23 19:15, Benno Lossin wrote:
> >> Traits marked with `#[vtable]` need to provide default implementations
> >> for optional functions. The C side represents these with `NULL` in the
> >> vtable, so the default functions are never actually called. We do not
> >> want to replicate the default behavior from C in Rust, because that is
> >> not maintainable. Therefore we should use `build_error` in those defau=
lt
> >> implementations. The error message for that is provided at
> >> `kernel::error::VTABLE_DEFAULT_ERROR`.
> >>
> >> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >
> > There is a minor nit below, and in reviews sent by others, but overall
> > this looks fine to me.
> >
> >>    /// # Examples
> >>    ///
> >>    /// ```ignore
> >> +/// # use kernel::error::VTABLE_DEFAULT_ERROR;
> >>    /// use kernel::prelude::*;
> > I probably wouldn't hide the import of VTABLE_DEFAULT_ERROR from this
> > example.
>
> What do you guys think of putting the const it in the prelude?

I think it's fine to just import it.

Alice
