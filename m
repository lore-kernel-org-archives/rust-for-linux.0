Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2113125AA
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 15:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777391595; cv=none; b=cd/yScjJk0lws48Hy1kzVAdE/cZCqTfgzqeb0s+nE53zsl4XZaz9TpKgZFBf5xhdKwjGhq6ouh5d7RTO5KI2ZhkiSPBjQImB0GRSSM+YONg4YjCcoZh+ZJHr4a9IXvk+GnGMuHy86hMfA6i3jzNxCKiC5IfSIBwHg0cKhjmQr0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777391595; c=relaxed/simple;
	bh=1CnzfR9FRM1yCGhQEtPNIFkBJWaLazsz5lBHABU78c4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tsdAZPEfk3e6tnlTiBtj6orFqDEaEKJAl9cIvGDCC5XZv6s6cuRi8FX74iLOQvakh6L525nyWOwujrspURn7jJKjYW3TqaBE2HDAV0JO6IGZ1DH2xeFtO4Qw42yDKhIS+mzHKe1LHT2MTQl5/LaLkOByTrgPoXtXPFbDYNxxl18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYMR+BX4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYMR+BX4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E6EC4AF0D
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 15:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777391595;
	bh=1CnzfR9FRM1yCGhQEtPNIFkBJWaLazsz5lBHABU78c4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eYMR+BX4BY8u5DwMnf5cEyC34erpRZpdQShabO+OZDpkV3UU1xFOuW1xCwZywl0pI
	 im5oMCzfBJq5v+Nf5IM/RxWGGo44fkC4Spmvus878/hA0QNsrf8KV8iugEtUzEGkmm
	 74inETVHptW/9oY+038zk0CsBOUtHuWwgJQoLm/UZO4YFIObYexth9DfyvKYYyImK1
	 8dWQLMH+8zIhLpskpLXuvVnRCvpYkZ1LS7SJIisL9uI54wFrL184ETKAZibc3W/BLN
	 jJZrT9M1g/7zLA0M76faOFjCz7QG9KQMc69kgp//1qtElEC+xaFjmIB3NtjnWz6W7n
	 aeNkp/946cuwg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38be5e86918so128952051fa.3
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 08:53:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/5THvfbS4H2vLBDvnvi9U83+2HKB/l2I5U4zLjDIdq3Lz+pf/OwYvKcmQOqOLz1RugvMAyGegYGEY12BgSIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyxN7QaYyGoX+zl6NlG6q/PQTw6yTLMhSyR74nU9xoHl99NBcm
	dM00YUI2ELXigCWVs5yBIQyNlX3mRIbCRGOcKf5Re6rCYoxItPWb8E+ldxxkGeO1sFHLURtl6JD
	dBvAcuPfKsV0VMsBzmSIRA2VLAqRt/Vk=
X-Received: by 2002:a05:651c:324c:b0:38c:50ed:d7ff with SMTP id
 38308e7fff4ca-3924bbc98cemr907441fa.2.1777391593915; Tue, 28 Apr 2026
 08:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-rust-analyzer-import-typing-as-t-v1-1-5bb33ad12396@kernel.org>
 <ae907fWOUEoIl18K@luna> <CAJ-ks9mUHw57S0b3Zg4WWa9yDYaD-DtRpj4PwD_X30+A4iQWOQ@mail.gmail.com>
 <CA+tqQ4LvnGAsHDXc5yXfC5E2AwP9TP7h3UOYoL3YCF=9vY8_gA@mail.gmail.com>
 <CAJ-ks9mTbkwwQzv8dC7DUjpanG-Gd4LU0EoGgzroZWzh2OUiZA@mail.gmail.com> <CA+tqQ4L-MEz07Q0BeXfC0CcOE7XwMn4MHtLXk3XydRv4RjXy-g@mail.gmail.com>
In-Reply-To: <CA+tqQ4L-MEz07Q0BeXfC0CcOE7XwMn4MHtLXk3XydRv4RjXy-g@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 28 Apr 2026 11:52:37 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9mfAJ7Sm+u9vi5ha9+RixLssem0OvfC_u4OibwZzuAThA@mail.gmail.com>
X-Gm-Features: AVHnY4IxKv1f0A4img5pCVsNH8KSvP31CD79OaV0bw-jg7QIhAu6rQHmTL-IdCw
Message-ID: <CAJ-ks9mfAJ7Sm+u9vi5ha9+RixLssem0OvfC_u4OibwZzuAThA@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: reduce import noise
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Link Mauve <linkmauve@linkmauve.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 10:24=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> w=
rote:
>
> On Tue, Apr 28, 2026 at 1:56=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> > On Tue, Apr 28, 2026 at 9:36=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com=
> wrote:
> > > Other than that, given that declaring all imports at the top is not
> > > mandatory, I wonder if we could just conditionally import `ParamSpec`=
 as
> > > follows:
> > >
> > > ```
> > > from typing import Any, Callable, TypeVar
> > >
> > > T =3D TypeVar('T')
> > > if sys.version_info < (3, 10):
> > >     def wrapper(func: Callable[..., T]) -> Callable[..., T]:
> > >         def wrapper(*args: Any, **kwargs: Any) -> T:
> > >             return func(*args, **kwargs)
> > >         return wrapper
> > > else:
> > >     from typing import ParamSpec
> > >
> > >     P =3D ParamSpec('P')
> > >     def wrapper(func: Callable[P, T]) -> Callable[P, T]:
> > >         def wrapper(*args: P.args, **kwargs: P.kwargs) -> T:
> > >             return func(*args, **kwargs)
> > >         return wrapper
> > > ```
> > >
> > > In this case, we don't need the `t.` prefix.
> >
> > This would work. It introduces the need to be careful about unused
> > imports. Do you prefer this?
>
> Yes, as long as you're also OK with it :)

Sure. I still think this patch is tidier but will shelve it for now.
