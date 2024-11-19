Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1561D270C
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 16:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732034632; cv=none; b=PTxum+Pjel5/u3EoNzu21POLN3em7xff0Or7a4dBz8TJdRp/NlfOWE613qBJIgzfWdPgMFMKg9ZGC3LM6dSHAAGJQEdeaILY+pJbB1XKqc+IdP6Nr/ctZefms8gTZaNOLkmLAjswinIKANv6kz/MWlq9hoB6LxI+qs8l3PtjFCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732034632; c=relaxed/simple;
	bh=06C8iL7jJR5pqVCS0NR944j586zWrc6ftYHVIU0hZgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PzZmquCKK06mhx+/7HAANCe47CtR2/hZo9c0gtxUVlSJPwSZfpY5wa4zmdxTPH5GXeDrgWJqGHLvv64ji7zug5y2WJ5pG7OVIv5kdWJFayXzFNsSEOGH/0oTwzeQE8UzFosm5rNETkTn7Ooc+BxuhpOo1wDZXGqZ7aU5S6k6gcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EuAeIHy6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EuAeIHy6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so47871835e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 08:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732034629; x=1732639429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQNNPRvfJWv1lLSMGox/pdIABf3+bH9JsHaNFGozuek=;
        b=EuAeIHy6jTdVu3QLUe6oj8cYHqtcqgym/axyXMZXerA49iKnqgadO73xD0B2hx8xxN
         ndgYt14ICXeayx/n32RZjAWGkMkl+PSqZiLx0lWxjnmg5p7rWsSaZrRlE7HUhTpc0Hut
         QE7NDSjWpqgD864eSA/93elkIss+mY597VGtvnunNLZFfvJVnBgdDnTQBBGu+RERYNtz
         TWHIyaDPwE0jccxHXqXyVNjO2c1jAhyhDBHHT/5NU1OO6H8ZUQYXi0fxgg4HXzSHvpEL
         bbklY2kVByjuwgfTtY5M6t7p3FtLZYfMz9nquCUwYTppprMjtVsaTqh65JQH8HSwh7Yt
         2NfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732034629; x=1732639429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQNNPRvfJWv1lLSMGox/pdIABf3+bH9JsHaNFGozuek=;
        b=n+8Ulw6YWUI16/u8ZWMu24usqZsWrZt2Aox5azlPKGarw5zqPb3R3nXF89qDcm90Nv
         KlZlq+czMUH+r7ptV3P/cosXC0dkfgAtCxpIaAeZhkBAsemCTncqc5gbQgKH/9/TYjLO
         d4q0PyG7hg5zHkfqFqG5VGfb+p1Frn/7SlL3gK3KAwsPyxoHdSwfNZER84KqcvoGGsfz
         UFSIAR07AYhbCwlw76VrmJ+DwybFF2Cj4hk32EGTy7FbCcz6QDhB5Q8w+0TwrSXW/+C3
         GNmfXNTquRtdCeoAH0p36LQT22PS94HbrLHHDvIUpO+RdDkPmFtJgfmrmBLRTlfIvkcW
         uEbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZEEPOQiGtpgQjENBUpD8zgskkjE6geEdTjSB8yVXGfyliiHBiEH/31BSd0waq6v+esmZ2FbopCX4/35PvqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3kbhzYOrA8+jePFnzckbBlSDPlKkODanAGR+V3YUVP9cpV0WN
	duOl+TMo6cvqhzzqH/zR2sIdX+08fpU4zAlSuakgoYDaRpe9YWbVQwXcmaFZZIERLsisCXAQumA
	HtZ80x2V1EZNxDNcaqHxp6Vt2RRQ/cyCDi4pQ
X-Google-Smtp-Source: AGHT+IFGZ6eAu9UU+ZTzKYOhK/SYh97vKRs9TC+ZJNmOyXQFNM8NjB4qhcmXqz9FDTAWxohhbKptq6gxHDadcPNGhdQ=
X-Received: by 2002:a05:600c:1393:b0:431:52b7:a485 with SMTP id
 5b1f17b1804b1-432df74dcfdmr142762355e9.19.1732034628815; Tue, 19 Nov 2024
 08:43:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241118-rust-xarray-bindings-v9-0-3219cdb53685@gmail.com>
 <20241118-rust-xarray-bindings-v9-2-3219cdb53685@gmail.com>
 <Zzu9SzkDoq_1YQnJ@tardis.local> <CAJ-ks9mKArX37VzhcyymDoE-MsNxNcO8VvP4n3Xu1mdfOKiuag@mail.gmail.com>
 <CAH5fLggL7MTLVv2ym_tCCKH9hQtL=GpTwXjDUQzKQX9UdT7SkA@mail.gmail.com> <CAJ-ks9k4upcSfa2HXaMrtDJ37eTNc-ZiKZdcLuEYSnWHL5Bigw@mail.gmail.com>
In-Reply-To: <CAJ-ks9k4upcSfa2HXaMrtDJ37eTNc-ZiKZdcLuEYSnWHL5Bigw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 19 Nov 2024 17:43:37 +0100
Message-ID: <CAH5fLggBZsarrRkZ1Mf5ND9-A6kCc65QRwhUW5X9nQxRJUOXrQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] rust: xarray: Add an abstraction for XArray
To: Tamir Duberstein <tamird@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 5:40=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Tue, Nov 19, 2024 at 11:28=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > On Tue, Nov 19, 2024 at 5:24=E2=80=AFPM Tamir Duberstein <tamird@gmail.=
com> wrote:
> > >
> > > On Mon, Nov 18, 2024 at 5:18=E2=80=AFPM Boqun Feng <boqun.feng@gmail.=
com> wrote:
> > > >
> > > > On Mon, Nov 18, 2024 at 11:33:36AM -0500, Tamir Duberstein wrote:
> > > > [...]
> > > > > +
> > > > > +/// A lock guard.
> > > > > +///
> > > > > +/// The lock is unlocked when the guard goes out of scope.
> > > > > +#[must_use =3D "the lock unlocks immediately when the guard is u=
nused"]
> > > > > +pub struct Guard<'a, T: ForeignOwnable> {
> > > > > +    xa: &'a XArray<T>,
> > > > > +}
> > > >
> > > > `Guard` would be `Send` if `XArray<T>` is `Sync`, however, it's
> > > > incorrect since `Guard` represents an xa_lock() held, and that's a
> > > > spin_lock, so cannot be dropped on another thread/context. `Guard`
> > > > should probably be marked as `!Send`. Or am I missing something sub=
tle
> > > > here?
> > >
> > > I didn't know about this requirement, thanks for calling it out. I
> > > have added `_not_send: PhantomData<*mut ()>` in v10.
> >
> > You can use _nts: NotThreadSafe. The type in question has landed in
> > 6.13 and is available in Linus's tree since yesterday.
>
> TIL, thanks - though it looks like the field name is still `_not_send`.
>
> How do I set the base-commit/deps such that both
> https://github.com/torvalds/linux/commit/e7572e5deaf3bc36818f19ba35ac8e0c=
454c8bac
> and https://github.com/Rust-for-Linux/linux/commit/d072acda4862f095ec9056=
979b654cc06a22cc68
> are present, given that the former is in 6.13 and the latter in
> rust-next?

Either you merge them yourself or you wait for rust-next to get merged
into Linus's branch.

Alice
