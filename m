Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884272C3252
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 19:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769024789; cv=none; b=dTdwbFauXyULtu0MvnlZZMCks1+EubzuxwV1j1Rz0sPlQMkIzmyuDhBLBoyi6+/sGp+6ynolg4tRiAYcHCoLAKe2M/3Z5vCGcts9QamrQEGkCJhkkzCfkTVUZUahdqaBtwG3aIOJEDdZ6AUW8FBObBLGPW+dO83oLSRLrWSRzDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769024789; c=relaxed/simple;
	bh=viMKv7aIXQHvMWk93rQF7m6mTONl9ACco3KuhWzB4y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpKIsxiWubIO06OSwAr+C+d77jLR6DvioShbwrFByTU/7SeGXED/Vs22i7gF1xNej9qJaSp9HCw4HT6+7n8n6j5Nisf4JyTkkavtJ3mbXEzXwn2UQGueTKwNrbh+HSqISV54BXNCFDWa7X3U9FrXexqIHS0O8pQwwXptWLn+Ho8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMMkBsDA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EMMkBsDA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277F3C2BCB0
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 19:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769024789;
	bh=viMKv7aIXQHvMWk93rQF7m6mTONl9ACco3KuhWzB4y0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EMMkBsDAwtMu9MwjMfIBbSgEezRXDe1SLNYc3Q+Ltu2lRxuDd3lNbdoYg89ck/HvM
	 6VtKH5ZcvYOvJlucpjGt8oMSiU0Q5RxMASFNg0qn0TpAdPb2QLDY3fzZfCvuV0wpn4
	 zgiIA8UWs3zofD7hM97FvdIosU2hahl8FrVYZAmOTu0z8PrYlpGXiB1QLZqGXK1jGa
	 Gh0d5cu6V834s9LbnWoigvK975oH7rTmduvcOzm7cZgfLzvAfPjH9i1u+v0s5+RYsH
	 0sDT2gTG9Npp3w3uWjAgpf0wwS+c0OEGDGJB313z1T52hMInolPKKyoYC1icYkfLD1
	 HPeQG7+xoNEjA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59dcd9b89ecso243000e87.1
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 11:46:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUzh0aWpZxjHURqDkkj3Pdn8HEgUBkFDCjc8r/RZuY67BtP7/DhVz35SbEZqv5/kbWDljcT3hR1pokFZhaVtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3X/yyH3D3/DygAMrI3IdDRcziVVnwTIyYhlD6wWIVGFE1g8TF
	6Sqx4qJLd3QXwSZ/HQQgX7bxea/bYf+bMQ21/fTq/t3RDs4UcozFyONl+S0KKhhOxKVI0uK7JlX
	ktYFFjByVLv7GR7+9E0ALdiTT1VP7qQs=
X-Received: by 2002:a05:6512:3b81:b0:59d:d716:6f9d with SMTP id
 2adb3069b0e04-59dd7be0b0bmr192974e87.9.1769024787711; Wed, 21 Jan 2026
 11:46:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121165835.4097975-1-gary@kernel.org> <CAJ-ks9=J564pjPbMBaq5MOHy2W5MhyghR-0B1B4XwWQVVnEOSQ@mail.gmail.com>
 <DFUH3PDOQCZ2.2QQSIB9IQIFO1@garyguo.net>
In-Reply-To: <DFUH3PDOQCZ2.2QQSIB9IQIFO1@garyguo.net>
From: Tamir Duberstein <tamird@kernel.org>
Date: Wed, 21 Jan 2026 14:45:51 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9k30H8wWii-3MDiMiMQNzhA=TgvyiEkWnxkrrMqDUxyTA@mail.gmail.com>
X-Gm-Features: AZwV_QjkGgZ_BLe7blyzbAZI_yseBzegHCxZueebp8ujyPnwmhdHvu1UlpFaONo
Message-ID: <CAJ-ks9k30H8wWii-3MDiMiMQNzhA=TgvyiEkWnxkrrMqDUxyTA@mail.gmail.com>
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

On Wed, Jan 21, 2026 at 2:38=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Wed Jan 21, 2026 at 5:55 PM GMT, Tamir Duberstein wrote:
> > On Wed, Jan 21, 2026 at 11:58=E2=80=AFAM Gary Guo <gary@kernel.org> wro=
te:
> >>
> >> From: Gary Guo <gary@garyguo.net>
> >>
> >> As kernel always use unsigned char and not the platform ABI's default,=
 an
> >> user should always use `as_char_ptr` provided via `CStrExt` instead.
> >> Therefore configure `disallow-methods` feature of clippy to catch inco=
rrect
> >> usage.
> >>
> >> Signed-off-by: Gary Guo <gary@garyguo.net>
> >> ---
> >>  .clippy.toml       | 5 +++++
> >>  rust/kernel/str.rs | 2 ++
> >>  2 files changed, 7 insertions(+)
> >>
> >> diff --git a/.clippy.toml b/.clippy.toml
> >> index 137f41d203de..fd934bc04242 100644
> >> --- a/.clippy.toml
> >> +++ b/.clippy.toml
> >> @@ -9,3 +9,8 @@ disallowed-macros =3D [
> >>      # it here, see: https://github.com/rust-lang/rust-clippy/issues/1=
1303.
> >>      { path =3D "kernel::dbg", reason =3D "the `dbg!` macro is intende=
d as a debugging tool", allow-invalid =3D true },
> >>  ]
> >> +
> >> +[[disallowed-methods]]
> >> +path =3D "core::ffi::CStr::as_ptr"
> >> +replacement =3D "kernel::prelude::CStrExt::as_char_ptr"
> >> +reason =3D "Kernel's `char` is always unsigned. Use `as_char_ptr` ins=
tead."
> >
> > In the disallowed-macros section above we seem to use sentence
> > fragments (no capitalization, no trailing period).
>
> Ok.
>
> >
> >> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> >> index fa87779d2253..08b8e2ebc8ad 100644
> >> --- a/rust/kernel/str.rs
> >> +++ b/rust/kernel/str.rs
> >> @@ -189,6 +189,7 @@ macro_rules! b_str {
> >>  //
> >>  // - error[E0379]: functions in trait impls cannot be declared const
> >>  #[inline]
> >> +#[expect(clippy::disallowed_methods, reason =3D "internal implementat=
ion")]
> >>  pub const fn as_char_ptr_in_const_context(c_str: &CStr) -> *const c_c=
har {
> >>      c_str.as_ptr().cast()
> >>  }
> >> @@ -334,6 +335,7 @@ unsafe fn from_bytes_with_nul_unchecked_mut(bytes:=
 &mut [u8]) -> &mut Self {
> >>      }
> >>
> >>      #[inline]
> >> +    #[expect(clippy::disallowed_methods, reason =3D "internal impleme=
ntation")]
> >
> > Can this be inside the function, on the `as_ptr` call itself?
>
> You cannot apply attributes on expressions (yet). If this is to be moved =
into
> the function, there needs an additional block, which I think is just
> unnecessary.

Thought so. Should we add a TODO that links to the relevant upstream
issue, or track it in
https://github.com/Rust-for-Linux/linux/issues/2?

>
> Best,
> Gary
>
> >
> >>      fn as_char_ptr(&self) -> *const c_char {
> >>          self.as_ptr().cast()
> >>      }
> >>
> >> --
> >> 2.51.2
> >>
> >
> > Acked-by: Tamir Duberstein <tamird@kernel.org>
>
>
