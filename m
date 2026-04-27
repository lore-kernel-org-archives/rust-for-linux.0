Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FAF3D4138
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 14:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299789; cv=none; b=l4waHtyEWEzfrHG/djE31cH7ibsAHWJ4WVZ0d1Rm92u1vgVtHhEPfbaO0HFIKLniXaUzbfwvo+TJo1p4oypAFAph8dKLCc/MfEM9oLZeFKHk+PZY0QkmjkFWVvwC6EKDkmU/ldEQQegoMf6K+a+3ExvB5phMua52i8FyAU/tvxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299789; c=relaxed/simple;
	bh=e7+x/d7ileckR/lYxYO/K9aj7LTEEzrrhvvW50OAXN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m8Y4TXYAdHOSy7zmIAh8/U5aA2wpMi3q+W4UEEdbyV+S4rqupdPFPva+7+8MO+S5ui7HyCBB4H6rheV4nZLzaFhw1O92OtreWq07PoEfDolaMXzmEbcNT2qzoPCWndM/rOX3IvA3sVOTKXIWAqGhoxYoZ8dvednoa8Qves6lPjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kio+wf0o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kio+wf0o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57CCC4AF0C
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 14:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299788;
	bh=e7+x/d7ileckR/lYxYO/K9aj7LTEEzrrhvvW50OAXN4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Kio+wf0oo2F1Sm2aNHqDqmpoDu9DXIxrFRoMUqBy8mxe+E1qNAmFpZPbFGypAFr1J
	 Qr3aHKslJ1hV8tam8b3ngR9vlALBHYpgirz7Jv4MGN4cRecuQ64fKkcZrn4NqxvxIG
	 KnCpC1glzJU2urRPA5tiARYNqxtA2fYRENj3b6dd/6++04gIqDQ9FEAd3xiEMoDIte
	 ttBt88IcHB2NxBfZL/9B9lYNnO8aI8FoS6A8s03HKSbKnpAujNXoIpZpGjr7/smDHx
	 MWpB6pBX7ozyL3QsmTaSc0yI6HQ34kRZAFSWFHf5NOCCUH7IhfYqpoByZGjuIkvphZ
	 sV91QhbxN5DLQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38eab6cf7d8so97571441fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 07:23:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+EEW5RL7FDUw09pOUEWmTLw9nxMVd2j8D2IvVmyDHTqusRJ7XIXqhLyeG/TJi4QcrUxOxy9t1M311RMNzQ/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDz0ijiMTQEx8H/6zIs9mNkYDNyJ0JpgtVa9ogz5P3NVRNHU1D
	STLTQuQWiM+bCwXuKxLx8HbtqHg/qHqW8pZM/GIi2Mr4B2+xHXr3v6qHhcZqaB5vJ541ajNZEh2
	fGI9uHzaKj5BmpzzDGW0kVS0Uz6vxc60=
X-Received: by 2002:a2e:bea1:0:b0:38e:a74c:7ccf with SMTP id
 38308e7fff4ca-38ec7b3e686mr134716381fa.26.1777299787583; Mon, 27 Apr 2026
 07:23:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317-ra-fix-primitive-v4-0-bc06709c8243@gmail.com>
 <20260317-ra-fix-primitive-v4-1-bc06709c8243@gmail.com> <177393252080.237.233380198774445367.b4-review@b4>
 <CA+tqQ4JcmO_E0xHJPX3HxgDiqv+KQk4q-xBvYk7DSEkifWhtWg@mail.gmail.com>
 <177712995819.98244.11409833540971152770.b4-reply@b4> <CA+tqQ4+dBGDToYESFedHmi2hjwZaQL4LK_HZaPqRw18Vt0mgQg@mail.gmail.com>
 <CAJ-ks9=GUgrn4paEXfcume2iUbyhfoM5=qp_SFfK0PLrS9HPAA@mail.gmail.com> <CA+tqQ4KzOUS49vn3SkKjA89=VaDECsLz+Q_XBs0PguK82zr5Vw@mail.gmail.com>
In-Reply-To: <CA+tqQ4KzOUS49vn3SkKjA89=VaDECsLz+Q_XBs0PguK82zr5Vw@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 27 Apr 2026 07:22:30 -0700
X-Gmail-Original-Message-ID: <CAJ-ks9=p3i5xbnDojJ7QopmUanec0ZPZ_x3_zD0Csyad5L7FEA@mail.gmail.com>
X-Gm-Features: AVHnY4I70urteLRNHE0fPTKIGwkSHa64Xu1WfyYgLyBO0n-06ICl5pasSSlFeA4
Message-ID: <CAJ-ks9=p3i5xbnDojJ7QopmUanec0ZPZ_x3_zD0Csyad5L7FEA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] scripts: generate_rust_analyzer.py: add versioning infrastructure
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 7:14=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> wr=
ote:
>
> On Sun, Apr 26, 2026 at 1:50=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> > On Sun, Apr 26, 2026 at 8:42=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com=
> wrote:
> [...]
>
> I've experimented with `ParamSpec`, but it seems we can't use it in 3.9.
> If I understand correctly, neither `from typing import ParamSpec` nor
> the `def func[**P]` syntax is available in Python 3.9, and both cause
> runtime crashes. Could you elaborate on what you have in mind?

Some options:

```
T =3D t.TypeVar('T')
if sys.version_info < (3, 10):
    import typing_extensions as te

    P =3D te.ParamSpec('P')
else:
    P =3D t.ParamSpec('P')


def wrapper(func: t.Callable[P, T]) -> t.Callable[P, T]:
    def wrapper(*args: P.args, **kwargs: P.kwargs) -> T:
        return func(*args, **kwargs)
    return wrapper
```

This requires typing_extensions, so is not ideal, but mypy passes with
both --python 3.9 and --python 3.10.

```
T =3D t.TypeVar('T')
if sys.version_info < (3, 10):
    def wrapper(func: t.Callable[..., T]) -> t.Callable[..., T]:
        def wrapper(*args: t.Any, **kwargs: t.Any) -> T:
            return func(*args, **kwargs)
        return wrapper
else:
    P =3D t.ParamSpec('P')

    def wrapper(func: t.Callable[P, T]) -> t.Callable[P, T]:
        def wrapper(*args: P.args, **kwargs: P.kwargs) -> T:
            return func(*args, **kwargs)
        return wrapper
```

This also works and type checks in both versions. Of course, the type
information is discarded on 3.9, but as long as we run mypy on 3.10 we
are OK.
