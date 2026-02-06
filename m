Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F57314B94
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 17:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770398429; cv=none; b=oBu24vd6JWGiczm4BrPnN3aJYCdWodnVxUb6hWYCXBiM4ogyRmNPGCXxcQi17/EgmDsuA64BkIVrNSRuWnCte6B3cZbC+s1JADFfvvCRL29fKm+9V7uD4pKn/8tNGhmFW9qxN4j/b5yNLKqWPdfoWgQqK3e+agYzoXBRBVdv/c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770398429; c=relaxed/simple;
	bh=MggoUQowMSOgUaCPV745sqYA2AoXvvghPps9ruYPUrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u2SK/Woadk2wCR2XiCEVZjoPlZDN2dYALs8eyerOVfM8qtbEBaTWH5SOURXp24HakmbFfRsUtobL5RqmRgOHzI9AcoGIndVShyEACZZ2UyWAgGP59Ys3SUWZKLoaVnJsKf/FLc5Rd68pXR6SO3JUqU1kuu8dOT9Xs1+qJvQ2wcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDSZMu21; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDSZMu21"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1436FC19423
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 17:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770398429;
	bh=MggoUQowMSOgUaCPV745sqYA2AoXvvghPps9ruYPUrc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JDSZMu21G08ufAuuLkXfSUJ0yu7W6BKOFjoPGSDNzfMhOOqs8XBSVmRQv2sPeHxKC
	 wHYEFYLWTn1FClGwdD1X4cZMrEl8AwiBa1gVmADN4eJPQ+HGMwdq6GrjKiM4nG2TqM
	 +bpbQCNik9FRV/eHcRQOhPiYIkz+ks3w0m5qQQXLfLo7BC1bXb7aEHpFfqI3AIBj6W
	 fqMqzv4EwipVQ+3dfvqAhDOOrDNhem1GJdzFWvg+1xH2FpAhPjnidXGNZPNW+STlAm
	 33Aqku9xeCF7Ug4oTgv8fLVTnVP4t5WNYmHYTfK3oCCVFDvCmMDMUFw3OTlX9Yh0XF
	 GrDVKX4OjmYXA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-382fe06a9c4so7815691fa.2
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Feb 2026 09:20:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5B2Ufoft+lMCsY61TLbT5F6E6gyoBV25JY9LxX0GoKIi6P6kmGQlGFwmNYkG02Ql3VPGU6beEdOadUolkLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmsFcNm24b4wY5T42gz7BeFU03QeG0SFCjPcfbyQn6EkXyeACj
	awkkj2LXjVYHLDY/AjtFg5fnp394WKPHGUKUapCHGhUt7Pp3AwM6vqftNMaJboiuu69v/RvZSrg
	0yZxT+71/YgQ7uX0odXarBMUiC1y6lh0=
X-Received: by 2002:a05:651c:1541:b0:385:f235:51c5 with SMTP id
 38308e7fff4ca-386b512f3afmr11572471fa.35.1770398427639; Fri, 06 Feb 2026
 09:20:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206-xarray-lockdep-fix-v1-1-13315951b836@kernel.org>
In-Reply-To: <20260206-xarray-lockdep-fix-v1-1-13315951b836@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 6 Feb 2026 12:19:51 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9kUO3VNeOD2Qo5rpUj3sr2HW53dgx=YxpnPEupDP_0J4Q@mail.gmail.com>
X-Gm-Features: AZwV_QjD_DSZdiJrJsPc2vSIqxMo5hoYBDyIL61qHo7dw7Zq5CquyxY6kWG-Ah8
Message-ID: <CAJ-ks9kUO3VNeOD2Qo5rpUj3sr2HW53dgx=YxpnPEupDP_0J4Q@mail.gmail.com>
Subject: Re: [PATCH] rust: xarray: fix false positive lockdep warnings
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 12:11=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Replace the `xa_init_flags` helper with direct initialization of XArray
> structures using `__spin_lock_init`. This allows each XArray to have
> its own lock class key for lockdep, preventing false positive warnings
> about lock ordering violations.
>
> Add a `new_xarray!` macro that automatically generates a unique lock
> class key for each XArray instantiation site. The macro accepts an
> optional name parameter and uses the `optional_name!` and
> `static_lock_class!` macros to generate appropriate names and lock
> classes.
>
> Update the `XArray::new` method signature to accept explicit name and
> lock class key parameters. This enables proper lockdep tracking while
> maintaining flexibility for advanced use cases.
>
> Remove `rust_helper_xa_init_flags` as it is now dead code.
>
> This was previously part of the series at [1]
>
> Link: https://lore.kernel.org/r/20251203-xarray-entry-send-v1-0-9e5ffd5e3=
cf0@kernel.org [1]
> Fixes: 210b81578efbe ("rust: xarray: Add an abstraction for XArray")
> Acked-by: Tamir Duberstein <tamird@gmail.com>

Please replace with:

Acked-by: Tamir Duberstein <tamird@kernel.org>

> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/helpers/xarray.c |  5 -----
>  rust/kernel/xarray.rs | 43 +++++++++++++++++++++++++++++++++++++------
>  2 files changed, 37 insertions(+), 11 deletions(-)
>
> diff --git a/rust/helpers/xarray.c b/rust/helpers/xarray.c
> index 60b299f11451d..644b8b35b1bee 100644
> --- a/rust/helpers/xarray.c
> +++ b/rust/helpers/xarray.c
> @@ -7,11 +7,6 @@ int rust_helper_xa_err(void *entry)
>         return xa_err(entry);
>  }
>
> -void rust_helper_xa_init_flags(struct xarray *xa, gfp_t flags)
> -{
> -       return xa_init_flags(xa, flags);
> -}

I like Alice's suggestion in the previous version of doing the
initialization here. It gives a natural place to explain why
xa_init_flags cannot be used directly and avoids introducing a second
user of `bindings:: __spin_lock_init` which seems like something we
should discourage direct use of.

> -
>  int rust_helper_xa_trylock(struct xarray *xa)
>  {
>         return xa_trylock(xa);
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index a49d6db288458..62a2b2ebfb0bf 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -8,11 +8,31 @@
>      alloc, bindings, build_assert,
>      error::{Error, Result},
>      ffi::c_void,
> +    str::CStr,
> +    sync::LockClassKey,
>      types::{ForeignOwnable, NotThreadSafe, Opaque},
>  };
> -use core::{iter, marker::PhantomData, pin::Pin, ptr::NonNull};
> +use core::{
> +    iter,
> +    marker::PhantomData,
> +    pin::Pin,
> +    ptr::{null_mut, NonNull},
> +};
>  use pin_init::{pin_data, pin_init, pinned_drop, PinInit};
>
> +/// Creates a [`XArray`] initialiser with the given name and a newly-cre=
ated lock class.
> +///
> +/// It uses the name if one is given, otherwise it generates one based o=
n the file name and line
> +/// number.
> +#[macro_export]
> +macro_rules! new_xarray {
> +    ($kind:expr $(, $name:literal)? $(,)?) =3D> {
> +        $crate::xarray::XArray::new(
> +            $kind, $crate::optional_name!($($name)?), $crate::static_loc=
k_class!())
> +    };
> +}
> +pub use new_xarray;
> +
>  /// An array which efficiently maps sparse integer indices to owned obje=
cts.
>  ///
>  /// This is similar to a [`crate::alloc::kvec::Vec<Option<T>>`], but mor=
e efficient when there are
> @@ -27,9 +47,10 @@
>  ///
>  /// ```rust
>  /// use kernel::alloc::KBox;
> -/// use kernel::xarray::{AllocKind, XArray};
> +/// use kernel::xarray::{new_xarray, AllocKind, XArray};
>  ///
> -/// let xa =3D KBox::pin_init(XArray::new(AllocKind::Alloc1), GFP_KERNEL=
)?;
> +/// let xa: Pin<KBox<XArray<KBox<u32>>>> =3D
> +///     KBox::pin_init(new_xarray!(AllocKind::Alloc1), GFP_KERNEL)?;
>  ///
>  /// let dead =3D KBox::new(0xdead, GFP_KERNEL)?;
>  /// let beef =3D KBox::new(0xbeef, GFP_KERNEL)?;
> @@ -86,7 +107,11 @@ pub enum AllocKind {
>
>  impl<T: ForeignOwnable> XArray<T> {
>      /// Creates a new initializer for this type.
> -    pub fn new(kind: AllocKind) -> impl PinInit<Self> {
> +    pub fn new(
> +        kind: AllocKind,
> +        name: &'static CStr,
> +        key: Pin<&'static LockClassKey>,
> +    ) -> impl PinInit<Self> {
>          let flags =3D match kind {
>              AllocKind::Alloc =3D> bindings::XA_FLAGS_ALLOC,
>              AllocKind::Alloc1 =3D> bindings::XA_FLAGS_ALLOC1,
> @@ -95,8 +120,14 @@ pub fn new(kind: AllocKind) -> impl PinInit<Self> {
>              // SAFETY: `xa` is valid while the closure is called.
>              //
>              // INVARIANT: `xa` is initialized here to an empty, valid [`=
bindings::xarray`].
> -            xa <- Opaque::ffi_init(|xa| unsafe {
> -                bindings::xa_init_flags(xa, flags)
> +            xa <- Opaque::ffi_init(|xa: *mut bindings::xarray| unsafe {
> +                bindings::__spin_lock_init(
> +                    &raw mut (*xa).xa_lock,
> +                    name.as_ptr().cast(),
> +                    key.as_ptr(),
> +                );
> +                (*xa).xa_flags =3D flags;
> +                (*xa).xa_head =3D null_mut();
>              }),
>              _p: PhantomData,
>          })
>
> ---
> base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
> change-id: 20260206-xarray-lockdep-fix-10f1cc68e5d7
>
> Best regards,
> --
> Andreas Hindborg <a.hindborg@kernel.org>
>
>
