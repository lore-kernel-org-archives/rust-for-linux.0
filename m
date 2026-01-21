Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDA434D4F7
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 18:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769018823; cv=pass; b=XW6YF3Xa3EU/IRe4ceOvcqXkebA3xsDM8UP+GnQwGL99KIXh0XWAKSzIBHNU2XzbBdGUuDaWDpFQkAjaYZ6xnjFHYekcnw8eo/aTOrLuXUsvJ5Mx+MCdaJ9aOHW24kNu6II7vIFbaC/KxcbYsdpMRrd2ExugZnSCDV6l3IpJ2xA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769018823; c=relaxed/simple;
	bh=gxnExTZo3PAQ2BIabrWm2ATsRE3z/0kqCbYcomaAPoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fRqka3GXMB3cOr2smko+VMG4x5QwFTkBO+H3CE9HokZMqyG3QHC/o7D1shNPazSEJbrToQ91AmxRGaNUu7FlTVPaInt2pwFFPPHzYsMO0L9vKikhr2fqXTqMfNTJ45YB4UyBt1/bZ59YnKakESHcBDbYaAtWnYryCFdVs+Jpx7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVQnvW1G; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVQnvW1G"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-382fb535b73so1277341fa.0
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 10:07:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769018819; cv=none;
        d=google.com; s=arc-20240605;
        b=hspeXgZJId4wvFlLQrBOWmrsl+BsFOVJKIVrrKueea5Ya3PaJa3fXWERxoznoyvqnb
         kL5Q4qrXmRgm5nVlUZeHSBqheYsP4fBAuV1pxzOb24zTboqKyB99lAsFOtxbZhGIWc7N
         LmWTmbegZDsvDOcajrR7wBvYO7teafy7hz8Jm4saUWxYijMYUWnRDGeMH6FUbgzdJJuu
         TX/QsZMPJeCMCWI0t9HiQhc0UgyhTwhSxgJ6b2I/1W8kJy5yLZl9fTjyx43cAS73s0Jc
         feUySvlLX3EOLnSaL86mdPL3ezVLy7LmqwgSoN91vhGjcMUkPQH35mgwGj5GoFSPVBze
         K3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tUZXoAHs3yCWlbFchMbYYs2He5T1NQZ+Ch/K4IPKMmU=;
        fh=FKfUcxLSKDMqflHiov6yQlwEJYY8g1IoSmJy5j7IXwc=;
        b=ZJJOeYGhZ9RKK2QnHnMapyM1LpPf+9YLf/bUvhl2m9rMVa+Nsmx34PSFM131yrWxcx
         ax/aCme0mqCyzEVsU+i/iMFk6GQguyjPU5J4cD0p8b4L1if3ZM2ur6nPKdwSR7MqjcZl
         wQ6HmB8lzgIJPxrylDADYW5CM1Fv0XMo9GJ2z9PLORT3G2NtOWR2Zf5PiMFbl0T7gMoh
         S5V41aTnLjFvVcF2aOPJa92Ayg113lCLso+KDYLkxK9P3VTP/LRS4LtJ5X4PukxSbkFU
         kFinLCRrLX6XsYL3S8FNvcql2r4rs9GC7sLyUCYIONU4W+DTYEjGCsFL5dALrsFiQ6eM
         bPYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769018819; x=1769623619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUZXoAHs3yCWlbFchMbYYs2He5T1NQZ+Ch/K4IPKMmU=;
        b=BVQnvW1GddY80rvLzNB2ZVr6Q5hx2RQ59xKz+wLXQeQI5KcQyz0r44LmkN7snIqqh9
         uK3X68WkSHOjeoodKHJF8laXLm3P6EYJhjIGQQHAvSNdS5dhlEwuW90r2N4rc8sQi9ON
         qq6HWyK1DJw5CoTOsNcdj+U+LBaC5A4tghzTryv0Q9ImZBdMTgmdduSjYQz6EoLCXAh/
         0xchy7xDpVlsCAX4P8HGJgRk3UxSJA46ijDWPy/yj5lnfjWPj8gTUbSduVMl3G2izym+
         UWmhmq1jmtmftcMxhx+xdCHIVyeEnQJXTA8ZhIboruVjDr/37vmQEd5Po/Y9WCdnGjI4
         FVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769018819; x=1769623619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tUZXoAHs3yCWlbFchMbYYs2He5T1NQZ+Ch/K4IPKMmU=;
        b=pfVUIDLBCPdq+ItNNL+YYXuF6mYWdNJS+ULAV3+5CHX1ukrOhHdWiLb7XoPs4Sq51z
         Cqmp8lIkgPkyTcgBn1abUBF0dRwsU8lhM2CDM2w0qh7MnKJemKtTMzmOt3KHgTLrdhFi
         vZ4kjFT8qmeOVd3VDHuwHZML5vTU63zueik/C531wHGGBsxE4F22l3Zuvxv+Lh9A6yP3
         cmdE6lcuIyGNupWqV86Co/8K5rH5N4v/D0MmqSCdAZeeygO8+P8H5FFy8fvA2RC1atRF
         0a+ZuTW/v3wNCsqiFOu7I2xCdxvpK5C50hdhfNhaxbAwCHTw1S1wWNRziwLSl5qKGhUV
         A+Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ1wsyozMxJIEPIzNluAbG55g2xg3P3UsrV6odPYlxVi1Of4dsIW7hzUcMXYMZ9nUCaboBIfjdGkT3RCw14g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmClKwy9bw3y5TudW4r7RSpGXGmGsZUmCQTYO54LPJ1EVJQ5Zt
	EwF/W5Ukl4zjJ5WHoE7Yoq3aO/QACZpGvsv4zcLL8RNJDVmzMb5Z6rGa0OR/vod1s+12TgMXfud
	u3Ah+Z1V92uQBzOR51eP/ZJjt6V6DoD8=
X-Gm-Gg: AZuq6aIymepoOg29PCBoXFkLmF7M7Soxtj0z8ES0wehsI2fdFztcNehhGJvoeKSOrhD
	Qup6tCVRIbY6wIBCDHlqpvEqgjKa2gXA9ldxJc6vqQjvWndN0dEZfJoqUSVNP01H6oVkz5bRiC0
	eNc9jCyl1iFxjkHYpgyaC2VfeKSwNXsK5SN70bQqjUKv8CzAjADqLCTTHvBL6Y98gMiAqTSly15
	WhHNrDrz23Io8q+PiCPl73pjdX3jQyxY8p/5818TYP9/T/PHgeQdooIa7lvz0+uLDZPfiSofcTo
	vehXpisLTlTJkKPLc1HwbiHpiVcAE7j5flwYve5zNSTf/cMmUAXwf91EiJ/QuNaq3vTU+teSmr/
	9z8741y0k9WOlz+gR
X-Received: by 2002:a2e:a581:0:b0:375:ffc2:1b40 with SMTP id
 38308e7fff4ca-385a54b736fmr21052641fa.35.1769018818732; Wed, 21 Jan 2026
 10:06:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121050059.2315091-1-sunke@kylinos.cn> <20260121050059.2315091-2-sunke@kylinos.cn>
In-Reply-To: <20260121050059.2315091-2-sunke@kylinos.cn>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 21 Jan 2026 13:06:22 -0500
X-Gm-Features: AZwV_Qjih-bxTiby6Ys92NbkRf4JWOpcdVrb1WI7lx1uSb0bWS24cvm230ZQqn4
Message-ID: <CAJ-ks9=5NWkeOUVQ+PwSB7nfSxgn1brseC=OP5cG+78oT34WUg@mail.gmail.com>
Subject: Re: [PATCH v10 1/1] rust: fmt: add safe pointer formatting support
To: Ke Sun <sunke@kylinos.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 12:01=E2=80=AFAM Ke Sun <sunke@kylinos.cn> wrote:
>
> Add Pointer trait and two pointer wrapper types for safe pointer
> formatting:
>
> - Pointer trait: A copy of core::fmt::Pointer for foreign types.
>
> - HashedPtr: Formats pointers with kernel hashing (corresponds to %p).
>   This is now the default behavior when formatting raw pointers with
>   "{:p}", preventing kernel memory layout information leakage.
>
> - RawPtr: Formats raw address without hashing (corresponds to %px).
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>  rust/kernel/fmt.rs | 168 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 166 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> index 84d634201d90a..d53184d0a12bc 100644
> --- a/rust/kernel/fmt.rs
> +++ b/rust/kernel/fmt.rs
> @@ -27,8 +27,8 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>      };
>  }
>
> -use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, Up=
perHex};
> -impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Poin=
ter, LowerExp, UpperExp);
> +use core::fmt::{Binary, LowerExp, LowerHex, Octal, UpperExp, UpperHex};
> +impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Lowe=
rExp, UpperExp);
>
>  /// A copy of [`core::fmt::Display`] that allows us to implement it for =
foreign types.
>  ///
> @@ -90,3 +90,167 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>      {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::=
fmt::Display},
>      {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueAr=
c<T>: core::fmt::Display},
>  );
> +
> +/// A copy of [`core::fmt::Pointer`] that allows us to implement it for
> +/// foreign types.
> +///
> +/// Types should implement this trait rather than [`core::fmt::Pointer`]=
.
> +/// Together with the [`Adapter`] type and [`fmt!`] macro, it allows for
> +/// formatting foreign types (e.g. types from core) which do not impleme=
nt
> +/// [`core::fmt::Pointer`] directly.

This doesn't seem applicable here.

> +///
> +/// By default, raw pointers (`*const T` and `*mut T`) are formatted usi=
ng
> +/// [`HashedPtr`], which hashes the pointer value to prevent leaking ker=
nel
> +/// memory layout information.

This seems odd to mention on the trait given the description above
states the trait is for implementing on foreign types. We should
probably state that this exists *only* to prevent raw pointers from
being formatted.

> +///
> +/// [`fmt!`]: crate::prelude::fmt!
> +/// # Example

Can we have some proper tests instead? i.e. this doesn't show us what
the hashed result looks like. It might be tricky to get the correct
CONFIG conditions.

> +///
> +/// ```
> +/// use kernel::{
> +///     prelude::fmt,
> +///     str::CString, //
> +/// };
> +///
> +/// // Works with const pointers
> +/// let ptr_const =3D 0x12345678 as *const u8;
> +/// pr_info!("Default pointer: {:p}\n", ptr_const);
> +///
> +/// // Works with mut pointers
> +/// let ptr_mut =3D 0x12345678 as *mut u8;
> +/// pr_info!("Default pointer: {:p}\n", ptr_mut);
> +///
> +/// // Width option test
> +/// let cstr =3D CString::try_from_fmt(fmt!("{:30p}", ptr_const))?;
> +/// assert_eq!(cstr.to_str()?.len(), 30);
> +/// # Ok::<(), kernel::error::Error>(())
> +/// ```
> +pub trait Pointer {
> +    /// Same as [`core::fmt::Pointer::fmt`].
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result;
> +}
> +
> +impl<T: ?Sized + Pointer> Pointer for &T {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        Pointer::fmt(*self, f)
> +    }
> +}
> +
> +impl<T: ?Sized + Pointer> core::fmt::Pointer for Adapter<&T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let Self(t) =3D self;
> +        Pointer::fmt(t, f)
> +    }
> +}
> +
> +macro_rules! impl_hashed_pointer {
> +    ($($ptr_ty:ty),* $(,)?) =3D> {
> +        $(
> +            impl<T> Pointer for $ptr_ty {
> +                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +                    Pointer::fmt(&HashedPtr(*self), f)
> +                }
> +            }
> +        )*
> +    };
> +}
> +
> +impl_hashed_pointer!(*const T, *mut T);
> +
> +/// A pointer that will be hashed when printed (corresponds to `%p`).
> +///
> +/// This is the default behavior for kernel pointers - they are hashed t=
o
> +/// prevent leaking information about the kernel memory layout.
> +///
> +/// # Example
> +///
> +/// ```
> +/// use kernel::{
> +///     fmt::HashedPtr,
> +///     prelude::fmt,
> +///     str::CString, //
> +/// };
> +///
> +/// let ptr =3D HashedPtr(0x12345678 as *const u8);
> +/// pr_info!("Hashed pointer: {:p}\n", ptr);
> +///
> +/// // Width option test
> +/// let cstr =3D CString::try_from_fmt(fmt!("{:30p}", ptr))?;
> +/// let width_30 =3D cstr.to_str()?;
> +/// assert_eq!(width_30.len(), 30);
> +/// # Ok::<(), kernel::error::Error>(())
> +/// ```
> +#[repr(transparent)]

Does this matter?

> +#[derive(Copy, Clone)]
> +pub struct HashedPtr<T>(pub *const T);
> +
> +impl<T> Pointer for HashedPtr<T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let ptr =3D self.0;
> +        // The default width for %p is 2 * sizeof(ptr) (see lib/vsprintf=
.c:
> +        // pointer_string() and ptr_to_id()), which is 16 characters on
> +        // 64-bit systems. With the "0x" prefix and null terminator, thi=
s
> +        // is at most 19 characters. 32 bytes is sufficient for all poin=
ter
> +        // formats including hash values.
> +        let mut buf =3D [0u8; 32];
> +
> +        // SAFETY: scnprintf never writes more than size-1 characters, s=
o
> +        // len is at most buf.len() - 1.
> +        // The "%p" format produces a fixed pointer format: "0x..." (e.g=
.,
> +        // "0x00000000b231c2e6").
> +        let len =3D
> +            unsafe { bindings::scnprintf(buf.as_mut_ptr(), buf.len(), c"=
0x%p".as_ptr(), ptr) };
> +        let formatted =3D core::str::from_utf8(&buf[..len as usize]).map=
_err(|_| Error)?;

Instead of erroring, can we use str::from_utf8_unchecked with a safety comm=
ent?

> +
> +        // Use pad() to respect width and alignment. Padding with explic=
it
> +        // characters (e.g., {:0>16p}) is supported, but zero-padding
> +        // shorthand (e.g., {:016p}) is not.
> +        f.pad(formatted)
> +    }
> +}
> +
> +/// A wrapper that formats any type implementing [`core::fmt::Pointer`] =
as its
> +/// raw address without hashing (corresponds to `%px`).
> +///
> +/// **Warning**: This exposes the real kernel address and should only be
> +/// used for debugging purposes.
> +///
> +/// # Example
> +///
> +/// ```
> +/// use kernel::{
> +///     fmt::RawPtr,
> +///     prelude::fmt,
> +///     str::CString, //
> +/// };
> +///
> +/// // Works with const pointers
> +/// let ptr_const =3D RawPtr(0x12345678 as *const u8);
> +/// pr_info!("Raw pointer: {:018p}\n", ptr_const);
> +///
> +/// // Works with mut pointers
> +/// let ptr_mut =3D RawPtr(0x12345678 as *mut u8);
> +/// pr_info!("Raw pointer: {:018p}\n", ptr_mut);
> +///
> +/// // Works with references
> +/// let value =3D 42u8;
> +/// let ptr_ref =3D RawPtr(&value);
> +/// pr_info!("Raw pointer: {:018p}\n", ptr_ref);
> +///
> +/// // Width option test
> +/// let cstr =3D CString::try_from_fmt(fmt!("{:30p}", ptr_const))?;
> +/// let width_30 =3D cstr.to_str()?;
> +/// assert_eq!(width_30.len(), 30);
> +/// # Ok::<(), kernel::error::Error>(())
> +/// ```

Ditto here.

> +#[repr(transparent)]

Same question here.

> +#[derive(Copy, Clone)]
> +pub struct RawPtr<T>(pub T);
> +
> +impl<T: core::fmt::Pointer> Pointer for RawPtr<T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        // Directly format the raw address - no hashing or restriction.
> +        // This corresponds to %px behavior.
> +        core::fmt::Pointer::fmt(&self.0, f)
> +    }
> +}
> --
> 2.43.0
>
