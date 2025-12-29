Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2342733121C
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 16:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767025824; cv=none; b=fDRq0+Qpgd2okv3LM1uZnP6VSalpgULLTMtEzuviO2zmL6WCAnUMVwIuUi1hPID2q+eFHzvbfz+JaDCFkkR1F6Nf1oysLwDXi07gqE9EeR1nDl+qp7vw0Nd4HriUO37IVi+Ir49IIC7YNT1CViOeVVBV9jNOWpOCph4lF7Ng550=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767025824; c=relaxed/simple;
	bh=djtWTq8tn5+YMxiSNs+x5TYD2HbCAzMBu2fVoWe8z1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBreh9e4He+5+PSQeUAU+6qf0lpiBE3MB6ManCu9/H7kkwlDNk+XwTJIBalmKxBtFNxcSNwSmx5DG0ziicfqde0SuOeQ04e1gHSweD/pus+DsMj+x7spWqRtLYOeDzaiqiJgNfNZ2mGYqfhTpdwb09bWtyU7BZTPLg2oJ01ZYZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkW0YDhF; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkW0YDhF"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37b495ce059so70096551fa.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 08:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767025818; x=1767630618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0a9chJlIbELol8kiCt8zRbx2L4PIDKiFbic2084AkmA=;
        b=RkW0YDhF+iP/vmOMpMDYQLULQ1mGUn9lrAyaLh0c5SmF/lJDo22ihsfDFmjkULz5pj
         02fgt9qZLb3FD7sQWlNuBVpHZSEw9b6WGBsZwmp7i6ArDlno/vjhxlVF7q3eW1GU9oM+
         FT2aazCSPvZwT1VhsAvDEjRB9y1BqTPSTQIjZlHxqzlkVpPPPKG8FwB1a7QDhs+QH25v
         cnEtk8nZ3AqwDSeUVia1YxMQILaG6AqyhZRWHEdTBoDHGfz/nJPQ5SKQ7mMIgMxbVWj+
         t4djgtPGPLv5IGqnY9OcCyYdiboGY4OKfgljyMHdFD6j/GRtSUMtfX35wl2b6GQV/MVM
         6boQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767025818; x=1767630618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0a9chJlIbELol8kiCt8zRbx2L4PIDKiFbic2084AkmA=;
        b=eH54GP/4fwQtpevGvDVLnElLBcXyiisL2VVg3E9IYaycXNHk9RN2l9cC8XFW/qauhm
         J6BQ726O8DpdNTQ5lvD9OD+aQiorKqewV76d9x01utzPUxR5brOjQs3L4hBhnu5larF1
         7cmxqPRn89Tx9/RmSmTz/75JX46/RWY2+0JeH2Hbt+SbSdqXv+hp9OZmIximQsHe2y/W
         93cqM7A+WVs3njxyngKrhv0TV5XJpctpL38rKU0P1ObcedkL6vK9+HK/lnAmYtzo38Sp
         lyBlA0EcjjdHObhsc19xZC9NvKEQQ2MpYpR73e5pQ1MQWLA0j0LXxs4FZJL89zW8Jya2
         Rx1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZhn2T4ZLH6Cw43LVmbL34WxV63OjHxtP/1jqQS+h1tG79r0uU46DKfKuVO+xKek+bopnavniyJlo9pRzFaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3YLFnvew3MG+HiuZh2Ja2NZmuP3d3x4IatHvnSxsgBzCMrnRd
	1FxoBLhabr8YbnInOSCP1POZ538Ml0LMl5PKQEa836Xgy2dg7q9dipZx1r2EBnpLj4urNdhM8ZK
	e/a69sKkXWmFvSZsGzRQb4hBtoKbejQk=
X-Gm-Gg: AY/fxX4XsXVbRiqKRMYrp0LREj2OgvLBTIgnopdYAJMeuztPg9ifSeLekfbSOGcOUQL
	bcrO4LxhFZ6fDnwLnQmqjhs72OmY2BtbajjIDiZCQL3QVUd/AAzWceOwMEZXIdl5q7WpzbznU17
	UE/N5uUkHzhdhx4E2KS2pSdPMgcu0gCcLKjgb1nfq93OwAooToiC44yZh1+q8XFsPQhBpDWpjTw
	sq6nMxnkbL1ovAlB+2GzdAKP6No17DHrzdW8+Hg2s8L1L0M14Oip7hSev3NUdhrTHwAY0W/aZRz
	GaL+MNEdRYKC2AkVl671bpLIMb9G3qqY7rZ4hCGQ/JsGQMWH4J3zbpO3SlF1m/k4KznlHO00Hxu
	HopObB/nyvZ3rdmkGe5PmBERVI34YsrirwLO1X2TRaLozkjRvtlmH
X-Google-Smtp-Source: AGHT+IHAgqwp8PU4ivhRVKiHioSa1dfRpOzc6druLYPPiYLLz9JiZ1RBVkZGRawvzm4KmJiA3OcE3oPZ24ORA4as6VA=
X-Received: by 2002:a2e:be87:0:b0:37b:9b58:dd04 with SMTP id
 38308e7fff4ca-3812152698dmr112394221fa.7.1767025817829; Mon, 29 Dec 2025
 08:30:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org> <20251203-xarray-entry-send-v1-10-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-10-9e5ffd5e3cf0@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 29 Dec 2025 11:29:41 -0500
X-Gm-Features: AQt7F2qhpEDCOTTCLbeBiioYHOB8vmT-rXco0N-srRHKEx1wA4Vxw8efg11HtFY
Message-ID: <CAJ-ks9=WhEyMexy47gWRCBLmje8PUoaJKeNbjS53dfnQzPAPAQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] rust: xarray: fix false positive lockdep warnings
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 5:28=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
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
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/helpers/xarray.c       |  5 ---
>  rust/kernel/xarray.rs       | 74 +++++++++++++++++++++++++++++++++------=
------
>  rust/kernel/xarray/entry.rs | 55 ++++++++++++++++++---------------
>  3 files changed, 86 insertions(+), 48 deletions(-)
>
> diff --git a/rust/helpers/xarray.c b/rust/helpers/xarray.c
> index 425a6cc494734..2852f63388eea 100644
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
> -
>  int rust_helper_xa_trylock(struct xarray *xa)
>  {
>         return xa_trylock(xa);
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index a405f2b6fdcad..c393d4c01af2a 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -29,6 +29,8 @@
>          Result, //
>      },
>      ffi::c_void,
> +    str::CStr,
> +    sync::LockClassKey,
>      types::{
>          ForeignOwnable,
>          NotThreadSafe,
> @@ -48,6 +50,19 @@
>
>  mod preload;
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
> @@ -62,9 +77,10 @@
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
> @@ -124,7 +140,11 @@ pub enum AllocKind {
>
>  impl<T: ForeignOwnable> XArray<T> {
>      /// Creates a new initializer for this type.

Should this be #[doc(hidden)] now?

> -    pub fn new(kind: AllocKind) -> impl PinInit<Self> {
> +    pub fn new(
> +        kind: AllocKind,
> +        name: &'static CStr,
> +        key: Pin<&'static LockClassKey>,
> +    ) -> impl PinInit<Self> {
>          let flags =3D match kind {
>              AllocKind::Alloc =3D> bindings::XA_FLAGS_ALLOC,
>              AllocKind::Alloc1 =3D> bindings::XA_FLAGS_ALLOC1,
> @@ -133,8 +153,14 @@ pub fn new(kind: AllocKind) -> impl PinInit<Self> {
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
> @@ -236,8 +262,12 @@ fn load(&self, index: usize) -> Option<NonNull<c_voi=
d>> {
>      /// # Examples
>      ///
>      /// ```
> -    /// # use kernel::{alloc::{flags::GFP_KERNEL, kbox::KBox}, xarray::{=
AllocKind, XArray}};
> -    /// let xa =3D KBox::pin_init(XArray::new(AllocKind::Alloc), GFP_KER=
NEL)?;
> +    /// # use kernel::{
> +    /// #     alloc::{flags::GFP_KERNEL, kbox::KBox},
> +    /// #     xarray::{new_xarray, AllocKind, XArray},
> +    /// # };
> +    /// let xa: Pin<KBox<XArray<KBox<u32>>>> =3D
> +    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
>      ///
>      /// let mut guard =3D xa.lock();
>      /// assert_eq!(guard.contains_index(42), false);
> @@ -272,8 +302,9 @@ pub fn get_mut(&mut self, index: usize) -> Option<T::=
BorrowedMut<'_>> {
>      /// # Examples
>      ///
>      /// ```
> -    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> -    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArra=
y, Entry}};
> +    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =3D
> +    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
>      /// let mut guard =3D xa.lock();
>      ///
>      /// assert_eq!(guard.contains_index(42), false);
> @@ -309,8 +340,9 @@ fn load_next(&self, index: usize) -> Option<(usize, N=
onNull<c_void>)> {
>      /// # Examples
>      ///
>      /// ```
> -    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
> -    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArra=
y}};
> +    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =3D
> +    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
>      /// let mut guard =3D xa.lock();
>      ///
>      /// guard.store(10, KBox::new(10u32, GFP_KERNEL)?, GFP_KERNEL)?;
> @@ -339,8 +371,9 @@ pub fn find_next(&self, index: usize) -> Option<(usiz=
e, T::Borrowed<'_>)> {
>      /// # Examples
>      ///
>      /// ```
> -    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
> -    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArra=
y}};
> +    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =3D
> +    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
>      /// let mut guard =3D xa.lock();
>      ///
>      /// guard.store(10, KBox::new(10u32, GFP_KERNEL)?, GFP_KERNEL)?;
> @@ -366,8 +399,9 @@ pub fn find_next_mut(&mut self, index: usize) -> Opti=
on<(usize, T::BorrowedMut<'
>      /// # Examples
>      ///
>      /// ```
> -    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
> -    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArra=
y}};
> +    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =3D
> +    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
>      /// let mut guard =3D xa.lock();
>      ///
>      /// guard.store(10, KBox::new(10u32, GFP_KERNEL)?, GFP_KERNEL)?;
> @@ -401,8 +435,9 @@ pub fn find_next_entry<'b>(&'b mut self, index: usize=
) -> Option<OccupiedEntry<'
>      /// # Examples
>      ///
>      /// ```
> -    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
> -    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArra=
y}};
> +    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =3D
> +    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
>      /// let mut guard =3D xa.lock();
>      ///
>      /// guard.store(100, KBox::new(42u32, GFP_KERNEL)?, GFP_KERNEL)?;
> @@ -505,8 +540,9 @@ pub fn store(
>      /// # Examples
>      ///
>      /// ```
> -    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
> -    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArra=
y}};
> +    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =3D
> +    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
>      /// let mut guard =3D xa.lock();
>      ///
>      /// assert_eq!(guard.get(42), None);
> diff --git a/rust/kernel/xarray/entry.rs b/rust/kernel/xarray/entry.rs
> index 2d6ef4781f47d..6e370252309fc 100644
> --- a/rust/kernel/xarray/entry.rs
> +++ b/rust/kernel/xarray/entry.rs
> @@ -26,8 +26,9 @@ impl<T: ForeignOwnable> Entry<'_, '_, T> {
>      /// # Examples
>      ///
>      /// ```
> -    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> -    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArra=
y, Entry}};
> +    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =3D
> +    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
>      /// let mut guard =3D xa.lock();
>      ///
>      /// let entry =3D guard.get_entry(42);
> @@ -100,17 +101,17 @@ fn insert_internal(
>      ///
>      /// Returns a reference to the newly inserted value.
>      ///
> -    /// - This method will fail if the nodes on the path to the index
> -    ///   represented by this entry are not present in the XArray and no=
 memory
> -    ///   is available via the `preload` argument.
> +    /// - This method will fail if the nodes on the path to the index re=
presented by this entry are
> +    ///   not present in the XArray and no memory is available via the `=
preload` argument.
>      /// - This method will not drop the XArray lock.
>      ///
>      ///
>      /// # Examples
>      ///
>      /// ```
> -    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> -    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArra=
y, Entry}};
> +    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =3D
> +    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
>      /// let mut guard =3D xa.lock();
>      ///
>      /// assert_eq!(guard.get(42), None);
> @@ -139,16 +140,16 @@ pub fn insert(
>
>      /// Inserts a value and returns an occupied entry representing the n=
ewly inserted value.
>      ///
> -    /// - This method will fail if the nodes on the path to the index
> -    ///   represented by this entry are not present in the XArray and no=
 memory
> -    ///   is available via the `preload` argument.
> +    /// - This method will fail if the nodes on the path to the index re=
presented by this entry are
> +    ///   not present in the XArray and no memory is available via the `=
preload` argument.
>      /// - This method will not drop the XArray lock.
>      ///
>      /// # Examples
>      ///
>      /// ```
> -    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> -    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArra=
y, Entry}};
> +    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =3D
> +    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
>      /// let mut guard =3D xa.lock();
>      ///
>      /// assert_eq!(guard.get(42), None);
> @@ -182,8 +183,9 @@ pub fn insert_entry(
>      /// # Examples
>      ///
>      /// ```
> -    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> -    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArra=
y, Entry}};
> +    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =3D
> +    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
>      /// let mut guard =3D xa.lock();
>      ///
>      /// assert_eq!(guard.get(42), None);
> @@ -221,8 +223,9 @@ pub(crate) fn new(guard: &'b mut Guard<'a, T>, index:=
 usize, ptr: NonNull<c_void
>      /// # Examples
>      ///
>      /// ```
> -    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> -    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArra=
y, Entry}};
> +    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =3D
> +    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
>      /// let mut guard =3D xa.lock();
>      ///
>      /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
> @@ -266,8 +269,9 @@ pub fn remove(mut self) -> T {
>      /// # Examples
>      ///
>      /// ```
> -    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> -    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArra=
y, Entry}};
> +    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =3D
> +    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
>      /// let mut guard =3D xa.lock();
>      ///
>      /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
> @@ -287,8 +291,9 @@ pub fn index(&self) -> usize {
>      /// # Examples
>      ///
>      /// ```
> -    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> -    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArra=
y, Entry}};
> +    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =3D
> +    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
>      /// let mut guard =3D xa.lock();
>      ///
>      /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
> @@ -334,8 +339,9 @@ pub fn insert(&mut self, value: T) -> T {
>      /// # Examples
>      ///
>      /// ```
> -    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> -    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArra=
y, Entry}};
> +    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =3D
> +    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
>      /// let mut guard =3D xa.lock();
>      ///
>      /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
> @@ -361,8 +367,9 @@ pub fn into_mut(self) -> T::BorrowedMut<'b> {
>      /// # Examples
>      ///
>      /// ```
> -    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> -    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArra=
y, Entry}};
> +    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =3D
> +    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
>      /// let mut guard =3D xa.lock();
>      ///
>      /// guard.store(42, KBox::new(100u32, GFP_KERNEL)?, GFP_KERNEL)?;
>
> --
> 2.51.2
>
>

Acked-by: Tamir Duberstein <tamird@gmail.com>
