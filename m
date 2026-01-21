Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906AD331216
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 20:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769025751; cv=none; b=Is35wmllL3mA3RRsyZAv63i2fldB+P61y6BY5C3oIX+TMUjCUCV3cpQz3+GIYwTXdtp13s5lsKLTndyMDii7NZPz5nPbuoHttdJEOdDhp2U0cGnsxi39AbFIQRyPysR0ccBBuj+mFqNaTeijf9VEUbTTUYPULbrb91+MWOTXvDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769025751; c=relaxed/simple;
	bh=Zf8rBhri+Anyzvysob4KOcoV5pXQr74SZvf1jz8fGUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=irILlYegWQuAKcsqm8RE3+QDNjOZ1aX65ooYGHlQQQayeXS3SwzI/oniMRd1RbtsIrg9t2g01IqHIOl72y7KbFOcKARTROdz44o/b+c/uJFRnX4g+YOeAQbGh05+YXm715p6NpKR7A7CGZih7/4n6FdmmTMuSFAk3bE2nBXuhv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMagpWjx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMagpWjx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B582C4CEF1
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 20:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769025751;
	bh=Zf8rBhri+Anyzvysob4KOcoV5pXQr74SZvf1jz8fGUg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kMagpWjxDqL1NfGm/mScc+7KlyZ5+M6VmUJKojSdz/1RaEb0V1a6/TTjNOddmeANK
	 dpasj2kHQSP6BMJ9TZ80tMStlZQYVGO+Uv+aEarUSIbYO8qSpRKfFnpA1RLXsARpuN
	 Xij1HNXmkO586p9r87r9/GpJOV4dksQCOfupBvWeQGlNYk1UO661UyleB/CTvCSyzB
	 ZnCVC34lZ9/CvDD9bCFGSHtA28cikIDOFKWN/kEkus110gZacKDBifwQdDI8L3qJ42
	 FkkjAEjJHrAFaypUFaJuVoNQ2jlQnHXQQ1zQZJDsDw3FslSmymr+3N5OpoWv4Ci8lG
	 /87mtGM9pTPIw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-382fceabddfso1887161fa.1
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 12:02:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfHTJ2rkeG4oRx4RGyZhdKvAtlO/Wg3VTaMJ5QAnIMQrsajIgbA1qongw+/2J3GGY0Ca8Ayx5AACxhqDXLdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx9De7B4ohRvSlVPg8a1vmwFXZHkyvDPgWcsrV9xx/Qx9IEc2+
	0toMZ7fxgJdQMwvT8bAnHoddi+srCDYWr+48Snk+OUu5+FgBWi4Iml3dhL3u+g74Sn4V1eKgt36
	3TE9GNBhI/lbIDXagaaKzPaJlOLVTr0s=
X-Received: by 2002:a2e:be89:0:b0:352:6aa4:3cee with SMTP id
 38308e7fff4ca-385a541ea9emr21569681fa.17.1769025749891; Wed, 21 Jan 2026
 12:02:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121165835.4097975-1-gary@kernel.org> <CAJ-ks9=J564pjPbMBaq5MOHy2W5MhyghR-0B1B4XwWQVVnEOSQ@mail.gmail.com>
 <DFUH3PDOQCZ2.2QQSIB9IQIFO1@garyguo.net> <CAJ-ks9k30H8wWii-3MDiMiMQNzhA=TgvyiEkWnxkrrMqDUxyTA@mail.gmail.com>
 <DFUJ9ECRB2GJ.ZK9ZCKMIFQYJ@garyguo.net>
In-Reply-To: <DFUJ9ECRB2GJ.ZK9ZCKMIFQYJ@garyguo.net>
From: Tamir Duberstein <tamird@kernel.org>
Date: Wed, 21 Jan 2026 15:01:51 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9mT7nTv-1yLFuGGgxRY5XhAEC3tyC348MwTSjT2ypJOKg@mail.gmail.com>
X-Gm-Features: AZwV_QjQrLvLBNPZH7HIw0gvCcJuzpD9BMCPhSfu-Vzt0AxGIClJd-xvIL6Azyg
Message-ID: <CAJ-ks9mT7nTv-1yLFuGGgxRY5XhAEC3tyC348MwTSjT2ypJOKg@mail.gmail.com>
Subject: Re: [PATCH] rust: disallow use of `CStr::as_ptr`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 3:01=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Wed Jan 21, 2026 at 7:45 PM GMT, Tamir Duberstein wrote:
> > On Wed, Jan 21, 2026 at 2:38=E2=80=AFPM Gary Guo <gary@garyguo.net> wro=
te:
> >>
> >> On Wed Jan 21, 2026 at 5:55 PM GMT, Tamir Duberstein wrote:
> >> > On Wed, Jan 21, 2026 at 11:58=E2=80=AFAM Gary Guo <gary@kernel.org> =
wrote:
> >> >>
> >> >> From: Gary Guo <gary@garyguo.net>
> >> >>
> >> >> As kernel always use unsigned char and not the platform ABI's defau=
lt, an
> >> >> user should always use `as_char_ptr` provided via `CStrExt` instead=
.
> >> >> Therefore configure `disallow-methods` feature of clippy to catch i=
ncorrect
> >> >> usage.
> >> >>
> >> >> Signed-off-by: Gary Guo <gary@garyguo.net>
> >> >> ---
> >> >>  .clippy.toml       | 5 +++++
> >> >>  rust/kernel/str.rs | 2 ++
> >> >>  2 files changed, 7 insertions(+)
> >> >>
> >> >> diff --git a/.clippy.toml b/.clippy.toml
> >> >> index 137f41d203de..fd934bc04242 100644
> >> >> --- a/.clippy.toml
> >> >> +++ b/.clippy.toml
> >> >> @@ -9,3 +9,8 @@ disallowed-macros =3D [
> >> >>      # it here, see: https://github.com/rust-lang/rust-clippy/issue=
s/11303.
> >> >>      { path =3D "kernel::dbg", reason =3D "the `dbg!` macro is inte=
nded as a debugging tool", allow-invalid =3D true },
> >> >>  ]
> >> >> +
> >> >> +[[disallowed-methods]]
> >> >> +path =3D "core::ffi::CStr::as_ptr"
> >> >> +replacement =3D "kernel::prelude::CStrExt::as_char_ptr"
> >> >> +reason =3D "Kernel's `char` is always unsigned. Use `as_char_ptr` =
instead."
> >> >
> >> > In the disallowed-macros section above we seem to use sentence
> >> > fragments (no capitalization, no trailing period).
> >>
> >> Ok.
> >>
> >> >
> >> >> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> >> >> index fa87779d2253..08b8e2ebc8ad 100644
> >> >> --- a/rust/kernel/str.rs
> >> >> +++ b/rust/kernel/str.rs
> >> >> @@ -189,6 +189,7 @@ macro_rules! b_str {
> >> >>  //
> >> >>  // - error[E0379]: functions in trait impls cannot be declared con=
st
> >> >>  #[inline]
> >> >> +#[expect(clippy::disallowed_methods, reason =3D "internal implemen=
tation")]
> >> >>  pub const fn as_char_ptr_in_const_context(c_str: &CStr) -> *const =
c_char {
> >> >>      c_str.as_ptr().cast()
> >> >>  }
> >> >> @@ -334,6 +335,7 @@ unsafe fn from_bytes_with_nul_unchecked_mut(byt=
es: &mut [u8]) -> &mut Self {
> >> >>      }
> >> >>
> >> >>      #[inline]
> >> >> +    #[expect(clippy::disallowed_methods, reason =3D "internal impl=
ementation")]
> >> >
> >> > Can this be inside the function, on the `as_ptr` call itself?
> >>
> >> You cannot apply attributes on expressions (yet). If this is to be mov=
ed into
> >> the function, there needs an additional block, which I think is just
> >> unnecessary.
> >
> > Thought so. Should we add a TODO that links to the relevant upstream
> > issue, or track it in
> > https://github.com/Rust-for-Linux/linux/issues/2?
>
> I don't think we really this need this.
>
> If Miguel thinks this is useful then he can add it to the tracking issue.

Well, what is "it"? Do you know the upstream issue?

>
> Best,
> Gary
>
> >>
> >> >
> >> >>      fn as_char_ptr(&self) -> *const c_char {
> >> >>          self.as_ptr().cast()
> >> >>      }
> >> >>
> >> >> --
> >> >> 2.51.2
> >> >>
> >> >
> >> > Acked-by: Tamir Duberstein <tamird@kernel.org>
> >>
> >>
>
