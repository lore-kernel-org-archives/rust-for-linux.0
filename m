Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7241231C56D
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 15:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770131713; cv=none; b=Eoe51jDGNsAFE2mx5oz9744vdisKnHr70JhWRvewxvpwMzw4wMWPfft36bKbx2QZzFImCpw6EwOTz96zRV3v0zaR0Pylufxr3qnf3q4T/yj2j1asLk+Ud1U6K++hDkrcPR3uo1OvpYy398edE+6rNmP7xtgH7hX1jystnbeqGpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770131713; c=relaxed/simple;
	bh=+Otgw8oOyICZrCSD3VtDB0krKc/oDhFZvaRHuKhv+sM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AbwDKYG7oRK9+EpvL3DVI9HJgvKK3bu7ByKhguWln2TSpkxqXA9TeFBhfKLDIN5QbLoS0WT5vuAw7x9ltBM1V/NphSTZrL26o/KYFH3gknpm4tvZKuvVuOJuTrJQ1RRejFdNKxLIi8i0dXLX8Jx4mhQkTS9GXZhZ8NAe1PMouEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWjDHTEF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWjDHTEF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8D8C2BC87
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 15:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770131712;
	bh=+Otgw8oOyICZrCSD3VtDB0krKc/oDhFZvaRHuKhv+sM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HWjDHTEFYljPpODH10eGy6OyPyqMsLjHRWXPG+um0RrQYhS0KDOcA55UUZRD5GmyO
	 PFsZ3M2pAvJ9DSmm1Xxx5uUxgjn3NkeCkmTa8F3T3dAFhScJP/eWiaWHeNDrrNJPzs
	 hZOoloV0MLJm24o63IhouIGYQQMXWLe5ByseTc5tUYIX9le11nAHS9z5brqdB7QEn1
	 DoGxw5uYJRT3i5KKKKMi+sh6JZ5Jy2eNB4KYjA80C/8RHuxnb0jc2AdvDEfA0dSs1m
	 guOxVXzhBxOEabF8K32ukEv13BDH3iXqLTzqhGvuTtpJuOo/24IpT5sIrI4+T6hXL1
	 a+vJN3ALgTIfA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38305d006faso49502311fa.3
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Feb 2026 07:15:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUJ7UaTK1PKWhCO96sGqnR9kp8DYhU0qKgMa1hYdCQ3JlkIDsAo30qJc1mP/+kgJpDbFL9aXsdzm0g/rztiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YywfWSdwc9uLzYKyrokchWeie3a/E8dd68favpUn1X5N55ia3ql
	yY2pm2HYTuQrtXaF4roZHgKB9H4Wgv29cLyt/KLypfFeOlg6eT2z239MGGwfT/yzn/Us41Y4WeG
	ZyHbFlMfa0AVwb/0GH9q7T09GYYQmVEk=
X-Received: by 2002:a2e:ab0f:0:b0:383:1d66:c1fa with SMTP id
 38308e7fff4ca-386465399c8mr50708911fa.10.1770131711461; Tue, 03 Feb 2026
 07:15:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203130745.868762-1-gary@kernel.org> <20260203130745.868762-2-gary@kernel.org>
In-Reply-To: <20260203130745.868762-2-gary@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 3 Feb 2026 10:14:35 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9kDoD8yXpLAm4K9V9+SzKC7+zd+Rg1eMrPMbz9Yr2uzeA@mail.gmail.com>
X-Gm-Features: AZwV_QhFaqRXnSlnIul4HoIQssvVKM_GXGPoeISjAKEVkgzXzP1DW1fGNi8akUI
Message-ID: <CAJ-ks9kDoD8yXpLAm4K9V9+SzKC7+zd+Rg1eMrPMbz9Yr2uzeA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: disallow use of `CStr::as_ptr` and `CStr::from_ptr`
To: Gary Guo <gary@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Panagiotis Foliadis <pfoliadis@posteo.net>, 
	Shankari Anand <shankari.ak0208@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	kernel test robot <lkp@intel.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 8:08=E2=80=AFAM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> As kernel always use unsigned char and not the platform ABI's default, an
> user should always use `as_char_ptr` provided via `CStrExt` instead.
> Therefore configure `disallow-methods` feature of clippy to catch incorre=
ct
> usage.
>
> Similarly, the dual `from_ptr` is also disallowed.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

> ---
> Changes since v2:
> - Also disallow `CStr::from_ptr`
> ---
>  .clippy.toml       | 10 ++++++++++
>  rust/kernel/str.rs |  3 +++
>  2 files changed, 13 insertions(+)
>
> diff --git a/.clippy.toml b/.clippy.toml
> index 137f41d203de..a51de9a46380 100644
> --- a/.clippy.toml
> +++ b/.clippy.toml
> @@ -9,3 +9,13 @@ disallowed-macros =3D [
>      # it here, see: https://github.com/rust-lang/rust-clippy/issues/1130=
3.
>      { path =3D "kernel::dbg", reason =3D "the `dbg!` macro is intended a=
s a debugging tool", allow-invalid =3D true },
>  ]
> +
> +[[disallowed-methods]]
> +path =3D "core::ffi::CStr::as_ptr"
> +replacement =3D "kernel::prelude::CStrExt::as_char_ptr"
> +reason =3D "kernel's `char` is always unsigned, use `as_char_ptr` instea=
d"
> +
> +[[disallowed-methods]]
> +path =3D "core::ffi::CStr::from_ptr"
> +replacement =3D "kernel::prelude::CStrExt::from_char_ptr"
> +reason =3D "kernel's `char` is always unsigned, use `from_char_ptr` inst=
ead"
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index fa87779d2253..97bf9427af59 100644
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
> @@ -319,6 +320,7 @@ unsafe fn to_bytes_mut(s: &mut CStr) -> &mut [u8] {
>
>  impl CStrExt for CStr {
>      #[inline]
> +    #[expect(clippy::disallowed_methods, reason =3D "internal implementa=
tion")]
>      unsafe fn from_char_ptr<'a>(ptr: *const c_char) -> &'a Self {
>          // SAFETY: The safety preconditions are the same as for `CStr::f=
rom_ptr`.
>          unsafe { CStr::from_ptr(ptr.cast()) }
> @@ -334,6 +336,7 @@ unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &m=
ut [u8]) -> &mut Self {
>      }
>
>      #[inline]
> +    #[expect(clippy::disallowed_methods, reason =3D "internal implementa=
tion")]
>      fn as_char_ptr(&self) -> *const c_char {
>          self.as_ptr().cast()
>      }
> --
> 2.51.2
>
