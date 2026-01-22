Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556A42C0F6E
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 14:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093536; cv=pass; b=VdLl61gobDkSaSLKhTxRyRafLKArX0U88o1YYPk7LBbCowRKkBa3aM2jSI75EZhu/TvyNjthbME6y/YfTGRH49ne/lcKLD5v0uqnjna0xjVSXe52oFG3zBHHyCHel10n0tI7LYa488YkNNHTSFYXDhicUz4g5bNGMC6c+PQfpxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093536; c=relaxed/simple;
	bh=JNVfadY+/sVzEL187Tu93ALWsnh3nMfWm1OcrhuXChQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BJPIcokkIz4Wb+92DRpbu9HBJhcf1GzkSSRCakMmMDKjzsvbQfK9/Euj3b/qKdvEXU1kP6eaSPg0l/LAhO8FxmJoK2l8rlZ7RJ9ET7iMPREmNauKYXiRs7DugzQSIo1lbYXvIdartTSaTzB5uo0noxsRZuxyx2zW0QOohegWoRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWf5gdo4; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWf5gdo4"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59b6c89d302so970741e87.1
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 06:52:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769093532; cv=none;
        d=google.com; s=arc-20240605;
        b=JmkLQK/6s+3ziPYbqCIh9/tgazbGEDH3kX/LCO2oYboEtDQxOma3TB0XuB9I43FRnx
         kiXoRiqXJNy/WsUQQqpMycRGWuxFjrSJu2LtlurGKKcKIBpLMrydFT2LcqAJRPOWWASy
         7ocxh3lmf1M6K1ohHI/0rL67WT7nS5LjtJevcRbJoSSvdSAwhljCDVAT6sM842rNsc1K
         vBu9SQVg5ScbjwW5tAkaGReXsnMosrlxyVyFfsSEXmjzbGlPdIPvvpoTgSuYTUgQU4vR
         qyHIDU9shZY6O/58coEP99zVyahdmJPyMVc7fGaPVc4Vm2QttbR02jaah+cxwlVrZ9CJ
         Vqrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NinIlbPFbtJh5aTAvTMkyfzdq7Xf8vT6Z24Y9ugFycw=;
        fh=RzaUIqYmQ+lKFCz5v0easaZJbBB/bJU8RawXgVzMoRA=;
        b=VNMZphD/HWQBEp9dTDWmyUASFDS099qTCg+mBwp1H9BMDgAJeMm6bCVc92FttrPTZC
         KrVex/fVg2UC4o6ymMjkEVq717QGdTjW8Ph+w1tZL1cBX7/4Ubn4OgJm16JMUK/x0wSg
         08/qW57ln05Yh+2K2AqWsJo/lSu7yhj/dKTAYswCeS3jgaqWKj9U8HcMpxQH/zNPUufW
         yw7Bn5d4TLcoaYmk81OMiiXgM8BjEDOxhqV7yXOYRI5eu+WBReXEHTSQ6mKP3WtEox+T
         bDktzq7MLurUm1hpAU1vkczpnqXDXXahBzGFkKebH746e1c61fKKxIuCJ6GYfjkqODjF
         rU/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769093532; x=1769698332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NinIlbPFbtJh5aTAvTMkyfzdq7Xf8vT6Z24Y9ugFycw=;
        b=VWf5gdo4OsgO9zFxOTBP7s0uCUlkrugxFRnwUJAdQO+Aic9voBaEHOeFG8xsLfMeeY
         AGAJVW3nkJVtF8cGU4iUvjVWMlDOsN/tLZ5JBeKzvKDeWjBsLUqgdofRxM3fVMxaAseR
         LZiP181c99i1JvWtiWe4n5Qr3oAiOR0/Ekyl+ZmrNATVIrkSpz+VYWrWFSferbtLa2Zb
         HPkSiM0GtazyfZZIBEL0lUOyrapJBw1NJgEZNd+jpPNoKuwDwiKWmoUtiQsF8KFCW9F3
         JHMxAOa2abo8/+9b9KScXy1J+kfoy7rOM79jSPDUlsRFsuYlqk+gOtEUQNSkZeGE3xb1
         LOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769093532; x=1769698332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NinIlbPFbtJh5aTAvTMkyfzdq7Xf8vT6Z24Y9ugFycw=;
        b=oCxLjG79WQ9/Om9BmNJOaKRTejnm9Lu6L/vLs5OLzP/5Sv+P5OOMdrKZFldizab4Xg
         w4E1wbasSwkmsBG1HfeLA4GCrhiPqz33+rQHHnyIlkgaeZvhPZPYj3LuKxjtKCgTR604
         zQ49Vq0qs82pIfH1UyEYocWCrIuZPb/WY+b3Rj9OTLgKMA+hjlD9rjGSJCvi9tIZiKwY
         iQkgR5+8DRd3t7+MSnWcQNabp2Hh6NxsgZJ+dI4CZeM48obRWao2x5iySS6Wh23fJeHy
         7ADjC88jL2XWzHxhmbpia3kcqaGiz2nr03kvX3jfJAE4nISlvzm/AcdikygcZwXyc9lv
         J4Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWaSDi2EwQYJaO+HazYtblSiw7BJcq/FnIT9xcz80gDLXt/RQaKwjhhyx3N430BnBkDihKbRjGS4p+tquyJiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjUf0IzrlNEIMeMlgcX7jrOqKBlXhKVs8FuLAUW9o9Dh7AwuJ6
	7XpUerKBSJuHKnb+vUYyaRLftP4mu3W3NXD/8l7TxVbOahV+RnKksj/h7V9hNpTMAI2N/XIcoF+
	f/QbfcQcJhufChXafTbPA6x+QE/Py5Ms=
X-Gm-Gg: AZuq6aLsKu4TDykyTIsXdMvSWlDCNuJ4kdcleDD5N8UrNBLe+W9KeXnDI3kyTdBJFsa
	BCgbylWm2zZm/xvwI37fWDjt+fRnpjxdOrQjo7bPln3sENLDEXKGhj+MvvIfQc1qiqjshVuz8jv
	dsr56vlsx6pTzpU0/ox1ki1Jg9jQtODYLgfZHP337mN4TZddllzyniEuNyHZ9GuQnXuwbq2oTeh
	RAGofWBrWGqUgvaCNS19LawpKS49XtHqoZR4Ee18ZdUFpq9tnxAi+cBr7AhTWQ4biHPGMASjX03
	uRWLI9Rs5zSeysF9UfkkzEYMqp1RTo0PpxUARq77q7FJNdnjfJM6EOmyiD48H+Z5YUz8CuEt6ib
	4JJANMR4S/uqYufeP
X-Received: by 2002:a05:6512:3d19:b0:59d:e018:5648 with SMTP id
 2adb3069b0e04-59de0185821mr676770e87.32.1769093531945; Thu, 22 Jan 2026
 06:52:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121050059.2315091-2-sunke@kylinos.cn> <20260122085228.2449409-1-sunke@kylinos.cn>
In-Reply-To: <20260122085228.2449409-1-sunke@kylinos.cn>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 22 Jan 2026 09:51:35 -0500
X-Gm-Features: AZwV_Qh1Y8VJu9dOiwwD7byQq3cq7eVyBZahC-_HX_mQwxn0zMF673xNVlTxC6w
Message-ID: <CAJ-ks9k63auxfUEBrE+6HAeHrmgwmLZQiwo58MSd8+HSzQ7KQg@mail.gmail.com>
Subject: Re: [PATCH v10 1/1] rust: fmt: add safe pointer formatting support
To: Ke Sun <sunke@kylinos.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 3:52=E2=80=AFAM Ke Sun <sunke@kylinos.cn> wrote:
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
>  rust/kernel/fmt.rs | 142 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 140 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> index 84d634201d90a..5d4d9b72eeb37 100644
> --- a/rust/kernel/fmt.rs
> +++ b/rust/kernel/fmt.rs
> @@ -5,6 +5,7 @@
>  //! This module is intended to be used in place of `core::fmt` in kernel=
 code.
>
>  pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
> +use kernel::str::CStrExt;
>
>  /// Internal adapter used to route allow implementations of formatting t=
raits for foreign types.
>  ///
> @@ -27,8 +28,8 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
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
> @@ -90,3 +91,140 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>      {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::=
fmt::Display},
>      {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueAr=
c<T>: core::fmt::Display},
>  );
> +
> +/// A copy of [`core::fmt::Pointer`] that ensures raw pointers (`*const =
T`
> +/// and `*mut T`) are automatically formatted using [`HashedPtr`] instea=
d
> +/// of being formatted directly, preventing kernel memory layout
> +/// information leakage.

The trait, of course, does not ensure anything. The trait, taken
together with Adapter and the fmt macro, allows us to supply custom
pointer-printing machinery.

> +///
> +/// [`fmt!`]: crate::prelude::fmt!
> +/// # Example
> +///
> +/// ```
> +/// use kernel::{
> +///     bindings,
> +///     prelude::fmt,
> +///     str::CString, //
> +/// };
> +///
> +/// // SAFETY: no_hash_pointers is a global variable.
> +/// let no_hash_pointers =3D unsafe { bindings::no_hash_pointers };
> +///
> +/// #[cfg(CONFIG_64BIT)]
> +/// {
> +///     let ptr_const =3D 0xffffffff12345678 as *const u8;
> +///     let ptr_mut =3D 0xffffffff12345678 as *mut u8;
> +///
> +///     // SAFETY: no_hash_pointers is a global variable.
> +///     unsafe { bindings::no_hash_pointers =3D false; }
> +///     let cstr =3D CString::try_from_fmt(fmt!("{:p}", ptr_const))?;
> +///     assert_eq!(cstr.to_str()?.starts_with("0x00000000"), true);
> +///
> +///     // SAFETY: no_hash_pointers is a global variable.
> +///     unsafe { bindings::no_hash_pointers =3D true; }
> +///     let cstr =3D CString::try_from_fmt(fmt!("{:p}", ptr_mut))?;
> +///     assert_eq!(cstr.to_str()?, "0xffffffff12345678");
> +/// }
> +///
> +/// #[cfg(not(CONFIG_64BIT))]
> +/// {
> +///     let ptr_const =3D 0x12345678 as *const u8;
> +///     let ptr_mut =3D 0x12345678 as *mut u8;
> +///
> +///     // SAFETY: no_hash_pointers is a global variable.
> +///     unsafe { bindings::no_hash_pointers =3D false; }
> +///     let cstr =3D CString::try_from_fmt(fmt!("{:p}", ptr_const))?;
> +///     assert_ne!(cstr.to_str()?, "0x12345678");
> +///
> +///     // SAFETY: no_hash_pointers is a global variable.
> +///     unsafe { bindings::no_hash_pointers =3D true; }
> +///     let cstr =3D CString::try_from_fmt(fmt!("{:p}", ptr_mut))?;
> +///     assert_eq!(cstr.to_str()?, "0x12345678");
> +/// }
> +///
> +/// // SAFETY: no_hash_pointers is a global variable.
> +/// unsafe { bindings::no_hash_pointers =3D no_hash_pointers; }
> +///
> +/// # Ok::<(), kernel::error::Error>(())
> +/// ```

All this should just be a normal test, in a `mod tests { ... }`.
Please see Documentation/rust/testing.rst.

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
0x%p".as_char_ptr(), ptr) };
> +        // SAFETY: scnprintf with "%p" format always produces valid ASCI=
I
> +        // output, which can be directly converted to UTF-8.
> +        let formatted =3D unsafe { core::str::from_utf8_unchecked(&buf[.=
.len as usize]) };
> +
> +        // Use pad() to respect width and alignment. Padding with explic=
it
> +        // characters (e.g., {:0>16p}) is supported, but zero-padding
> +        // shorthand (e.g., {:016p}) is not.

What does it mean that zero-padding is not supported? Would this
comment make more sense in a test that demonstrates the deficiency?

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

Thinking about the API a bit: do HashedPtr and RawPtr need to be pub?
We could have an extension trait to provide a method on raw pointers
that returns `impl Pointer` for the case where raw printing is
required.
