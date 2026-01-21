Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E84248893
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 17:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769018163; cv=none; b=kOhnPREWfj6SLHusE0c5pM8HldyzxHEHr1OCA7FazVLVoNHENJvD1rTN3wiU60oVBuu+BwyrDtpGcAaLtZX87FaPpF8ULKKJ30Zwx1znNilFLqxHfGZWrF3lyCXeeIo3Lihv8vtL304EmvFF26SRed/UMHccE1qYAxl2RiMyZPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769018163; c=relaxed/simple;
	bh=zUejZn2ji4t5M6rhhw8/UtgkSC0JC4+lotPw5ZfYmQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ph8yUoQrNGj+N8wLgKFjeSyZd9+1dbZYQ/AV8QishWKzQggXtDOJFLgGDIZCM4OI3vNjmgc+x36lYKCF6/ezGuk6bkIa5fg3eZyJ8ZaRaQtwcFyhT4gztPew7cQ3GGyVucRcIq6DJ/Vd9LY/HLPNgjdMOZka5grZOaEuHiylvic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=haPKc+I+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="haPKc+I+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2331AC19424
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 17:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769018163;
	bh=zUejZn2ji4t5M6rhhw8/UtgkSC0JC4+lotPw5ZfYmQY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=haPKc+I+v9WsKq/9W8LWJeyxeRnG0z9uJIKeeAc+//3gNpqGIufCqUcvelCqLBxLj
	 OJdEXLsmgx1LPNyHDsx+z/zycWs6NonBOlFhJEPdFtP48Pby1Mx0w8IeNUlqJnJDnr
	 cofqrkQ40oQby3F+FpHFkeXpfX5MbBuWCWkx1WljjfeoW+Uu2857E3QEwy9+hKWn1K
	 TnKFYtprDNB/gdsKcrAEqnIYg9Ao+n+1N9ZEQnulUiYqqmg1aKhm+brqOB8Sm/r4Za
	 SEkLnF/a7ryOtvm1BuAQ8UeNThAKfYNC/PMFSlomHp/5/REwnpeBlNKCyhF65PTl6z
	 60y3oLeAdUVqw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382fea4a160so1213001fa.2
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 09:56:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUWqkyWm5EFfcawlz7Cqyy/0qGNznXE9YYDLLAacAnT7CxB/7rmWgqH4MCfm/YQQsJ4b7vuI5Eh61JLsuRF1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJg0XMIx1tLMpoP3f3AFgsi0D/yIEmxed8Zws/ZGwvRM0WGS9s
	0hmLZ3XVgeuHgZ4S/B+VMPiWKUCkj2gwjY808CEfTA/Eww19lNLIUqkC5iXUuIGFmwRQvFI9WLa
	XKes7IywYXnOaXHNpQXFPGkmW0dDQcpE=
X-Received: by 2002:a05:651c:b13:b0:37a:4085:c83d with SMTP id
 38308e7fff4ca-383842ac9f3mr74647251fa.29.1769018161789; Wed, 21 Jan 2026
 09:56:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121165835.4097975-1-gary@kernel.org>
In-Reply-To: <20260121165835.4097975-1-gary@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Wed, 21 Jan 2026 12:55:25 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9=J564pjPbMBaq5MOHy2W5MhyghR-0B1B4XwWQVVnEOSQ@mail.gmail.com>
X-Gm-Features: AZwV_QgtJmS4kPVz_bMYGXfSk3wHjqZyqSP7aGJoUtrDR2EbAG_BRcErZEcvo6g
Message-ID: <CAJ-ks9=J564pjPbMBaq5MOHy2W5MhyghR-0B1B4XwWQVVnEOSQ@mail.gmail.com>
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

On Wed, Jan 21, 2026 at 11:58=E2=80=AFAM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> As kernel always use unsigned char and not the platform ABI's default, an
> user should always use `as_char_ptr` provided via `CStrExt` instead.
> Therefore configure `disallow-methods` feature of clippy to catch incorre=
ct
> usage.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  .clippy.toml       | 5 +++++
>  rust/kernel/str.rs | 2 ++
>  2 files changed, 7 insertions(+)
>
> diff --git a/.clippy.toml b/.clippy.toml
> index 137f41d203de..fd934bc04242 100644
> --- a/.clippy.toml
> +++ b/.clippy.toml
> @@ -9,3 +9,8 @@ disallowed-macros =3D [
>      # it here, see: https://github.com/rust-lang/rust-clippy/issues/1130=
3.
>      { path =3D "kernel::dbg", reason =3D "the `dbg!` macro is intended a=
s a debugging tool", allow-invalid =3D true },
>  ]
> +
> +[[disallowed-methods]]
> +path =3D "core::ffi::CStr::as_ptr"
> +replacement =3D "kernel::prelude::CStrExt::as_char_ptr"
> +reason =3D "Kernel's `char` is always unsigned. Use `as_char_ptr` instea=
d."

In the disallowed-macros section above we seem to use sentence
fragments (no capitalization, no trailing period).

> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index fa87779d2253..08b8e2ebc8ad 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -189,6 +189,7 @@ macro_rules! b_str {
>  //
>  // - error[E0379]: functions in trait impls cannot be declared const
>  #[inline]
> +#[expect(clippy::disallowed_methods, reason =3D "internal implementation=
")]
>  pub const fn as_char_ptr_in_const_context(c_str: &CStr) -> *const c_char=
 {
>      c_str.as_ptr().cast()
>  }
> @@ -334,6 +335,7 @@ unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &m=
ut [u8]) -> &mut Self {
>      }
>
>      #[inline]
> +    #[expect(clippy::disallowed_methods, reason =3D "internal implementa=
tion")]

Can this be inside the function, on the `as_ptr` call itself?

>      fn as_char_ptr(&self) -> *const c_char {
>          self.as_ptr().cast()
>      }
>
> --
> 2.51.2
>

Acked-by: Tamir Duberstein <tamird@kernel.org>
