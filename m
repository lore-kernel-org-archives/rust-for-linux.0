Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DB23DDAE2
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 08:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787646316; cv=pass; b=qwkrb7Mbfn7uyapNKu/bbYsXxIxt0lRr9Fn2tcv9migz3TFcuKeJEtDfWFMhN37UYYBdwzIP6DVhHYcPCdIWi1igv8GOc2YdSo6kaM3HtcNS2zI4R9Au8HMNbO/uw3MK0n2gt1oPBrHeoLmj11pw7bEf1vwlq6G6zg3TnWqfETg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787646316; c=relaxed/simple;
	bh=vN+lqQ1cw8Q+rzycmYP3JO5Z+XAODVd6qviDwRWW+fw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LTuIHUzcAgF2DS0pJAnkF5CTgiWxWpv6hmUXmP9PckX16faVWZ3z46Yfmj4TJgDaaKKQNeV/GsvwLjM7Vm7osgCX2jkVL/EyEEYmEaa7+WwGIMCzwPuTx97w2e9GZhuQv00glF/a67zq3hbBTC/SnQfj8Q0ud3O4kqJFdUNTLoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHA5hSUg; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHA5hSUg"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d319b84213so5572205ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 01:25:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787646314; cv=none;
        d=google.com; s=arc-20260327;
        b=PDvxLOo+wDM0TwMEl5tzjbXzLSU/PLs+0qymygl+MmOiNlBBg2IAOHKBCBm4SVIUGm
         EfIPZo6RCKH76/fhBC9mkYkQEIxhZNYm7Swfobz8YVFRQ150nh/9RBwE1AwrvuNm4nv0
         UYXeXDkeNk72evf3hxgTTwzRwoD6p8wEzpdlznPuT0DSGCq2aKDi/whrDbkYM9Sf002K
         93lUwyeLTgqsHuqrH14VSdpV8q3LX3lo7IiKCXw+fEPcMznTV92+metzbQY1xRVSB2eb
         P+/k/7nxPYDSN6tphW4KDpGyHpnAxwQAURVOsLEVvjKpZA2HyIIeXr97RZsgBT/QwH76
         G/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g+1YIeAgohPrZe/McJ1EJLwlBrZGsBgi02RJu4vUZyM=;
        fh=z6L+zF6XoERmKsS9Mx7t/F7sTA4COL75D8Ob7HAutQ8=;
        b=fB+L0BoE5jqWCOBnSrLOHJ3ZAxtMbFeJSbgfNvpfs7YMSBcV73Cl3kDMFaMpZe1JBG
         +8X14JoFURa7sULg47sTZt0xc95YhdKYGpPq0ipeLu/hAXZzm7Q/FZ+TNMqZhlNNR7Ft
         XO2KoJg6NdJCPbEMLxK7tbDebbF9oqQ/ra/SC+hl9/TKMuz4VihpoT1YjWxQkx+GlABR
         g1jAgEUjFfU4QwwiXwIgtbgSPb3FpNaMWJVCK/dqOzaAueGQrkaJvwvW2I6x8ISBhdPb
         Cnty/A6xH6FyJDjiTF5PFjzmC62xL3CUDf+zEEEheSvMLy+PHwYSiSnOKU5dpkHq6cuL
         0nAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787646314; x=1788251114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g+1YIeAgohPrZe/McJ1EJLwlBrZGsBgi02RJu4vUZyM=;
        b=mHA5hSUg7j2SMrmYbaEuiLCHgU1Iw1fAAgn7lygGXelFm4i4IjsegL3SwC6a3DgXwm
         RXqzhre0lV48Eo2H1RxyzikwNw/Hjruqt/z2IS1hdoV9KA9s6Uyk4VUVFXkGzpIQA9L3
         /HT/Lbwg7RCoGzJODwX1GPuS57AE7GHAyvzM3r/+qhP/5Ewrzxwdv28yoGq21wSkyorv
         cltNuIx4ewITuRgnQwtwQgIy5+gmedAQk8j/cNs6PBxtOWrLOnCF52l9vbMfVuxMoYEi
         yWYqSX5QTai6/DkgaxWSDvqM35r/3kFPCOpE5CHblxhj0gMASAEeoCc/GdMlUUTkzqya
         +HCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787646314; x=1788251114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+1YIeAgohPrZe/McJ1EJLwlBrZGsBgi02RJu4vUZyM=;
        b=pnukp5UFz6m6sKomvB0z/BBQXIp70UiFX2OPcP7K4i9BlPxRbC5eq7YtycTyeKqGYP
         pqoKHXN8tQmU9j7rG9L5+TSf1fkUwRO1LiF5xvcguipUvugZSej3EUNtxDVywWHAtRiE
         ancRT2+SIgPAEfTvPObMLLsa9ToESWhUjYHngtYh5aUp+Xso2Q4M416kbQT1av32CSdz
         VO4IVf2UUmO9is/gc3LDjJOMvOxxbJygKJfevQ4E8NEnYjdDW+b2AiBqIKUBQ/E3Y5jT
         eJM+QIphTD/evLJajBS+uveo6jGw0MJxaAiVSXsEHLICkfOwLJKWD7GF8IaR4Np+1GsQ
         Dqvw==
X-Forwarded-Encrypted: i=1; AHgh+RqBnsu1JUZ0pU53PJ4oEC5wJA0S0o0WXBJ/X2JaoAZnXQ0mf+F8mJdHP87+PyZGh+7iJdqWc72nlWgCLOghHw==@vger.kernel.org
X-Gm-Message-State: AFuF++nhq29rdtjYV3SPvXWJSUDIQE+9ZdCqAZYa+oFretrq2mRJVReg
	OCStMrrzOSNP+2Eid3lHYsOlQxbv67mDlWG0BANTZQWdX76vSkKocP6BiAtUBMhR38bfdY0wt5p
	A7E9fYEeDqvMsDZ9k6VTvJPewffwrWwQ=
X-Gm-Gg: AR+sD10yhW8cnsLGCTSAqxEv4aHvVIR5NTXmsnTeoY0sixrxEJLzTmtzod4ASjlEABh
	j476BnnqmQd15M1ZJJJXGC1scUJHNf4z+RAlo1jvFSDzcj83mMsxIL9LsvyMu1T/FDaVj419NS2
	bKkYcgWEhu7hnn3oIXithvCKDtic8wNdZsvScrE5YFQIosXa2No8KNRkIRxEBAIJy5ZuxeFfV77
	NEof8MoLRCpdJi7WFs+z4/92QRBSxYGZrY3Psl/wkUCW4pGWRC/RXIjONo01rngR2j7ZgyfZvCp
	7OFOC4/AWUazg0cNkwksNbEFs66VRHvgGsxEaUxcRxdP/NvZZEbrFQXz0Qm87JWxoTN8minxaXR
	LihNP25Ab9kdw9plNnsKoniHJW58rADMcFS/uQtTxWUU4dGOgD1aFL1kRHmcV
X-Received: by 2002:a17:903:234a:b0:2d6:3c1a:85ef with SMTP id
 d9443c01a7336-2d6e3711667mr34626415ad.4.1787646314097; Tue, 25 Aug 2026
 01:25:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com> <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
In-Reply-To: <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 25 Aug 2026 10:25:00 +0200
X-Gm-Features: AcwNN1WiqBK6DPw3KNUBUFoCCm95GG9T8sdCr01st0jWIRGTbY2d4Hbg3YnemNM
Message-ID: <CANiq72mYW0wQGzWRBvGqnatjysi4BnXBFLUpLPvrS0Q=JB2A0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: num: casts: replace const type narrowing
 methods with a macro
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 4:45=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
>     const DMA_LEN: u32 =3D casts::usize_into_u32::<{ MEM_BLOCK_ALIGNMENT =
}>();
>
> into
>
>     const DMA_LEN: u32 =3D casts::const_as!(MEM_BLOCK_ALIGNMENT =3D> u32)=
;

Hmm... I have been following the discussion and listening to both
sides of the argument.

The macro interface looks obvious enough, and we could consider adding
it to the prelude.

Having said that, macros have a cost too when they introduce new
"syntax", so since the beginning we have tried to minimize their use
to where we feel is worth it.

The former line above is not perfect by any means, but it is
nevertheless syntax that one needs to already know. Personally
speaking, I don't care if I have to write the former or the latter, to
be honest, so I am OK with both ways. But I worked with C++ TMP in the
past, so my eyes may be desensitized. :)

Apart from readability concerns, we are saving here a few characters;
getting possibly different codegen (forced textual inline), and maybe
having better or worse compiler-side time/memory/disk numbers. Is that
about it? It would be good to measure any actual difference.

What I wouldn't want is a raw `as`, because the point of the saga we
started a long time ago is to introduce better tools that allow us to
get rid of the almighty `as` into weaker (i.e. safer) options, even if
some uses of `as` may be "obviously right".

Cheers,
Miguel
