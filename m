Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5D3406837
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 17:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781543695; cv=none; b=QRpxJ1aIS93i7dxXKGshlEgUJ5cTOYlelNk8ivvPyI9KJQgr+y231r+/+pWOCuFxycqLPDpvo/lobgNUQAtjI+QVttrOwBxKw4C+Cbnl+RJWtnsv5wtgXYMeIMUyU9FqMTlGefBZd+ibEujrtN3YeGjwxQl7HtayZMdort0v9d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781543695; c=relaxed/simple;
	bh=izxdvq5WQhcHohcCuek37mjaI5xh8opkEcYEGdyaYOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h14DCTxOazUh7hewIXTupjaGlCc12H3MIJA3AGUIPv3ODThDoATa015YKl9lyOTqVO8wIkzXTnYtvvf6weYSy9qk8Za8hlUI99Rs0Y329/IfDg2aBdRhrmwvvKRnjiUwvaAEQXeNQlbXmI47yjeVqFUJ2TJ343mY6HIQ8Ss92pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtTGQTTL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtTGQTTL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E881F00ACA
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 17:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781543694;
	bh=WEx8hFcrY94rhHXDt0zP1UA3BUZSaVPyyokRtUx2gpc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LtTGQTTLw2DyG7n8+FfbQ0yI9bctkwhRX2m+ZXNjyuJ4H/51hdLC9NCXu7lBVE2Lj
	 Zf4MhqLIYu7r9lQj+AtAKsvGRi6QCDxLG7JDI/VR/gfnI7atVQgj5dWBsfchhofOsS
	 NeKNDxix7ErJHBjotk9EHloHncxAv7IDbbR/Bkht8Dy7q5P62baGPfOElhCjya+8FF
	 0zJuHQBdm92Jrx7QYkL1y47Iocs3mXLDqgBFIsgNmgIwODrb+9iIwQvOmvB7IIhBem
	 gi34mXq53p+sU7yuXDvJBhkwwFjX8eUTCJ+XSs8gciawp20SIOVurHarkyR8+lVvNO
	 35OLlyEO0tq8Q==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-396aacc5bcfso33195001fa.3
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 10:14:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8+Ed46xlOoY4n6OpJhbGdzHTYAobk+S6vgl8PqD5GAEzVMrzvI4KpBKdfH5emhAH4TndKDcAhEo9Lp1WX4LA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHItAcDCyewb52qDG1xEDP5t9WyxO1R9s7ij5rCx7/sASG/GrU
	tWD8hp9lr345eqnErDqE7ldj9rjHW0eXjdhwajyC8ACl5mVHdpCq0hca8KlbNZfHr5Svypucz7X
	b5hlYMFG61o7SgZQ8CPibJP4I9/18bHg=
X-Received: by 2002:a05:651c:884:b0:396:7603:7d03 with SMTP id
 38308e7fff4ca-3995c79fee0mr740331fa.1.1781543693160; Mon, 15 Jun 2026
 10:14:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615143225.471756-1-ojeda@kernel.org> <DJ9SF78YADPV.3ECKCC88GFR64@garyguo.net>
In-Reply-To: <DJ9SF78YADPV.3ECKCC88GFR64@garyguo.net>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 15 Jun 2026 10:14:16 -0700
X-Gmail-Original-Message-ID: <CAJ-ks9=sfqTV5sGgyPseKBZAOYP6OTbFWbkNf08wX7mk3rR4YA@mail.gmail.com>
X-Gm-Features: AVVi8Ce36UuV4Ir7Zfy6f2rB6YI2ZhPkFzujftAtjfVmAwt3XFAzPlDoZO-FiAk
Message-ID: <CAJ-ks9=sfqTV5sGgyPseKBZAOYP6OTbFWbkNf08wX7mk3rR4YA@mail.gmail.com>
Subject: Re: [PATCH] rust: allow `suspicious_runtime_symbol_definitions` lint
 for Rust >= 1.98
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, Urgau <urgau@numericable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 1:09=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Mon Jun 15, 2026 at 3:32 PM BST, Miguel Ojeda wrote:
> > Starting with Rust 1.98.0 (expected 2026-08-20), Rust is introducing a
> > couple new lints, `invalid_runtime_symbol_definitions` (deny-by-default=
)
> > and `suspicious_runtime_symbol_definitions` (warn-by-default), which ch=
eck
> > the signature of items whose symbol name is a runtime symbol expected b=
y
> > `core`.
> >
> > Our build hits the second one, i.e. the warning:
> >
> >     error: suspicious definition of the runtime `strlen` symbol used by=
 the standard library
> >          --> rust/bindings/bindings_generated.rs:20018:5
> >           |
> >     20018 |     pub fn strlen(s: *const ffi::c_char) -> usize;
> >           |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >           |
> >           =3D note: expected `unsafe extern "C" fn(*const i8) -> usize`
> >                   found    `unsafe extern "C" fn(*const u8) -> usize`
> >           =3D help: either fix the signature or remove any attributes l=
ike `#[unsafe(no_mangle)]`, `#[unsafe(export_name =3D "strlen")]`, or `#[li=
nk_name =3D "strlen"]`
> >           =3D help: allow this lint if the signature is compatible
> >           =3D note: `-D suspicious-runtime-symbol-definitions` implied =
by `-D warnings`
> >           =3D help: to override `-D warnings` add `#[allow(suspicious_r=
untime_symbol_definitions)]`
> >
> >     error: suspicious definition of the runtime `strlen` symbol used by=
 the standard library
> >          --> rust/uapi/uapi_generated.rs:14236:5
> >           |
> >     14236 |     pub fn strlen(s: *const ffi::c_char) -> usize;
> >           |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >           |
> >           =3D note: expected `unsafe extern "C" fn(*const i8) -> usize`
> >                   found    `unsafe extern "C" fn(*const u8) -> usize`
> >           =3D help: either fix the signature or remove any attributes l=
ike `#[unsafe(no_mangle)]`, `#[unsafe(export_name =3D "strlen")]`, or `#[li=
nk_name =3D "strlen"]`
> >           =3D help: allow this lint if the signature is compatible
> >           =3D note: `-D suspicious-runtime-symbol-definitions` implied =
by `-D warnings`
> >           =3D help: to override `-D warnings` add `#[allow(suspicious_r=
untime_symbol_definitions)]`
> >
> > Thus `allow` the lint in `bindings` and `uapi`.
> >
> > A more targeted alternative to avoid `allow`ing it would be to pass
> > `--blocklist-function strlen` to `bindgen`, but we would perhaps need
> > to adjust if other C headers end up adding more (or Rust checking more)=
.
> > Since it is just the less critical one that we hit, and since eventuall=
y
> > this should be properly fixed by getting upstream Rust to provide a fla=
g
> > like GCC/Clang's `-funsigned-char` [2][3], just `allow` it for now.
> >
> > Cc: Urgau <urgau@numericable.fr>
> > Link: https://github.com/rust-lang/rust/pull/155521 [1]
> > Link: https://github.com/rust-lang/rust/issues/138446 [2]
> > Link: https://github.com/Rust-for-Linux/linux/issues/355 [3]
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>
> Reviewed-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Tamir Duberstein <tamird@kernel.org>
