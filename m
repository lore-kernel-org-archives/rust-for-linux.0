Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E789C39E175
	for <rust-for-linux@vger.kernel.org>; Tue, 12 May 2026 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577998; cv=none; b=rC9Hz5mZzHUvLcdxyleKwPnIYDsqky8t41qfjyKIFUiyuP9BHxv9Vrc4CVXn2qC2mVErQqJXG/kgC9NTp1NriIgwLDiAEzQgFqj+HptT23qJXO/t1z3ij4+Xk874b9SV+tOsyFe7afsS/Epj+YTsWj361R7okV6oQ9NsLnqixN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577998; c=relaxed/simple;
	bh=tCRYZq8hJZVMf3Ouvv4EMhvMJcorzdZvM5EjoVT6y7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bSWEIR56l7zELamnRvqt36uGd11WQwA5lx9D2XR+7mHDii+zhTmEr35ovWHpddPVtUqiP9tVL+4w/7wpObPcrjjwgXvJ0BuKEXUfooGL77iZVBx9361TPKtQAxCBXij14sN2w8UDe611Pssd1B4XnX22s+5YP/5i9ZQJJE//jmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=E/EK4kOt; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="E/EK4kOt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1778577991; x=1778837191;
	bh=Wrc0KB0qLj14ccE/CS4uJd+Lc3K2CtvGzuDgPJKzs8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=E/EK4kOttF34sKgqjXod4H32k5W+g0RqyMUxzfAWm1+6GQEfpADH2SB5ONvTARH7J
	 KsDjwKduX2zEE/JYsTWmoE4Aue5h4PWzeXKKSoMTNck+HoTT5vmNLVtWrvPWZALbkT
	 zOqXTRhYOd0v1FXa9XW3247+UZQcWjnk3p8BQkWhhZsibeM+Z+0NRDz+CiykZKSrJ0
	 dj0T9qHcPcNwJsnSBeU19b1L5M+me1MLhmej79NN04GZLc3ecBUrTgwSbAuMiCNnhR
	 qci3UJc+DTOvbQc/mBOpzX7ZIqt6ZuDqzVjZ/55hoxuNBRaYcTFvlOM0/C2KG7/DdG
	 R0EkIELfMJLWQ==
X-Pm-Submission-Id: 4gFB6r2Qn1z1DDXM
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Ke Sun <sunke@kylinos.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v12 2/2] rust: fmt: route {:p} through HashedPtr to prevent address leaks
Date: Tue, 12 May 2026 12:26:20 +0300
Message-ID: <20260512092626.15303-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260512-hashedptr-v12-2-61d5c7786889@kylinos.cn>
References: <20260512-hashedptr-v12-0-61d5c7786889@kylinos.cn> <20260512-hashedptr-v12-2-61d5c7786889@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 12 May 2026 16:55:28 +0800=0D
Ke Sun <sunke@kylinos.cn> wrote:=0D
=0D
> Define a custom `kernel::fmt::Pointer` trait and `HashedPtr` wrapper=0D
> so that `{:p}` formatting uses the kernel's `%p` hashed format instead=0D
> of printing raw pointer values, preventing kernel address space leaks.=0D
> =0D
> Signed-off-by: Ke Sun <sunke@kylinos.cn>=0D
> ---=0D
>  rust/kernel/fmt.rs | 172 +++++++++++++++++++++++++++++++++++++++++++++++=
+++++-=0D
>  1 file changed, 170 insertions(+), 2 deletions(-)=0D
> =0D
> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs=0D
> index aba9f3dbd3175..19f422ff7f0ed 100644=0D
> --- a/rust/kernel/fmt.rs=0D
> +++ b/rust/kernel/fmt.rs=0D
> @@ -27,10 +27,95 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {=0D
>      };=0D
>  }=0D
>  =0D
> -use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, Up=
perHex};=0D
> +use core::fmt::{Binary, LowerExp, LowerHex, Octal, UpperExp, UpperHex};=
=0D
>  impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Lowe=
rExp, UpperExp);=0D
>  =0D
> -impl<T: ?Sized + Pointer> Pointer for Adapter<&T> {=0D
> +/// A copy of [`core::fmt::Pointer`] that allows implementing pointer fo=
rmatting=0D
> +/// for foreign types.=0D
> +///=0D
> +/// Together with the [`Adapter`] type and [`fmt!`] macro, it enables ra=
w pointer=0D
> +/// formatting to be intercepted and routed to [`HashedPtr`] (kernel's `=
%p` hashed=0D
> +/// format), preventing kernel address leaks.=0D
> +///=0D
> +/// [`fmt!`]: crate::prelude::fmt!=0D
> +pub trait Pointer {=0D
> +    /// Same as [`core::fmt::Pointer::fmt`].=0D
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result;=0D
> +}=0D
> +=0D
> +/// A wrapper for pointers that formats them using kernel's `%p` format =
specifier.=0D
> +///=0D
> +/// By default, `%p` prints a hashed representation of the pointer addre=
ss to prevent=0D
> +/// kernel address leaks. When the `no_hash_pointers` kernel command-lin=
e parameter is=0D
> +/// enabled, the real address is printed instead (for debugging purposes=
).=0D
> +pub struct HashedPtr<T: ?Sized>(pub *const T);=0D
> +=0D
> +impl<T: ?Sized> Pointer for HashedPtr<T> {=0D
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {=0D
> +        use crate::str::CStrExt as _;=0D
> +=0D
> +        let mut buf =3D [0u8; 32];=0D
> +=0D
> +        // SAFETY:=0D
> +        // - `buf` is a valid writable buffer. 32 bytes is sufficient fo=
r all architectures:=0D
> +        //   64-bit: "0x" + 16 hex digits (zero-padded by `pointer_strin=
g`) =3D 18 bytes;=0D
> +        //   32-bit: "0x" + 8 hex digits (zero-padded by `pointer_string=
`) =3D 10 bytes.=0D
> +        // - The format string is valid and `%p` expects a pointer argum=
ent=0D
> +        // - `scnprintf` is safe to call with proper arguments=0D
> +        //=0D
> +        // Note: "0x" is added because Rust's `{:p}` includes a "0x" pre=
fix,=0D
> +        // but the kernel's `%p` does not.=0D
> +        let len =3D unsafe {=0D
> +            crate::bindings::scnprintf(=0D
> +                buf.as_mut_ptr().cast(),=0D
> +                buf.len(),=0D
> +                c"0x%p".as_char_ptr(),=0D
> +                self.0.cast::<core::ffi::c_void>(),=0D
> +            )=0D
> +        };=0D
> +=0D
> +        // SAFETY:=0D
> +        // - `buf` is a valid buffer (see above for size justification)=
=0D
> +        // - `scnprintf` returns the number of characters written (exclu=
ding null terminator),=0D
> +        //   which is always non-negative (see `vsnprintf` and `vscnprin=
tf` in lib/vsprintf.c)=0D
> +        // - `len` is bounded by `scnprintf` to at most `buf.len() - 1`=
=0D
> +        // - The format string "0x%p" produces ASCII hex digits and "0x"=
 prefix,=0D
> +        //   which are valid UTF-8 (ASCII is a strict subset of UTF-8)=0D
> +        let hashed_str =3D unsafe { core::str::from_utf8_unchecked(&buf[=
..len as usize]) };=0D
> +=0D
> +        // Use `f.pad` to handle width/alignment formatting.=0D
> +        f.pad(hashed_str)=0D
> +    }=0D
> +}=0D
> +=0D
> +// Raw pointers are formatted via `HashedPtr` (kernel `%p`: hashed by de=
fault, plain with=0D
> +// `no_hash_pointers`).=0D
> +impl<T: ?Sized> Pointer for *const T {=0D
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {=0D
> +        Pointer::fmt(&HashedPtr(*self), f)=0D
> +    }=0D
> +}=0D
> +=0D
> +impl<T: ?Sized> Pointer for *mut T {=0D
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {=0D
> +        <*const T as Pointer>::fmt(&(*self).cast_const(), f)=0D
> +    }=0D
> +}=0D
> +=0D
> +impl<T: ?Sized> Pointer for &T {=0D
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {=0D
> +        <*const T as Pointer>::fmt(&core::ptr::from_ref(*self), f)=0D
> +    }=0D
> +}=0D
> +=0D
> +impl<T: ?Sized> Pointer for &mut T {=0D
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {=0D
> +        <*const T as Pointer>::fmt(&core::ptr::from_ref(*self), f)=0D
> +    }=0D
> +}=0D
> +=0D
> +// `Adapter<&T>` bridges our `Pointer` trait to `core::fmt::Pointer`=0D
> +impl<T: Pointer> core::fmt::Pointer for Adapter<&T> {=0D
>      fn fmt(&self, f: &mut Formatter<'_>) -> Result {=0D
>          Pointer::fmt(self.0, f)=0D
>      }=0D
> @@ -96,3 +181,86 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {=0D
>      {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::=
fmt::Display},=0D
>      {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueAr=
c<T>: core::fmt::Display},=0D
>  );=0D
> +=0D
> +#[macros::kunit_tests(rust_kernel_fmt)]=0D
> +mod tests {=0D
> +    use crate::{=0D
> +        bindings,=0D
> +        prelude::fmt,=0D
> +        str::CString, //=0D
> +    };=0D
> +=0D
> +    /// A RAII guard that temporarily sets `no_hash_pointers` and restor=
es it on drop.=0D
> +    ///=0D
> +    /// # Safety=0D
> +    ///=0D
> +    /// `no_hash_pointers` is a `__ro_after_init` global variable. KUnit=
 tests run during=0D
> +    /// `kernel_init_freeable()` (init/main.c), before `mark_readonly()`=
 makes the=0D
> +    /// `.data..ro_after_init` section read-only. At this point there ar=
e no concurrent=0D
> +    /// readers or writers, so it is safe to modify.=0D
> +    struct NoHashPointersGuard {=0D
> +        original: bool,=0D
> +    }=0D
> +=0D
> +    impl NoHashPointersGuard {=0D
> +        /// Sets `no_hash_pointers` to `value` and returns a guard that =
will restore=0D
> +        /// the original value on drop.=0D
> +        ///=0D
> +        /// # Safety=0D
> +        ///=0D
> +        /// See struct-level documentation.=0D
=0D
This is not how we usually write safety contracts and comments. You can wri=
te=0D
invariants on the type and put the contract on the unsafe function then exp=
lain=0D
at the call site why using `unsafe` is sound. Most of the safety related te=
xts=0D
in this patch look wrong.=0D
=0D
> +        unsafe fn new(value: bool) -> Self {=0D
> +            // SAFETY: See `NoHashPointersGuard` safety documentation.=0D
> +            let original =3D unsafe { bindings::no_hash_pointers };=0D
> +            // SAFETY: See `NoHashPointersGuard` safety documentation.=0D
> +            unsafe { bindings::no_hash_pointers =3D value };=0D
> +            Self { original }=0D
> +        }=0D
> +    }=0D
> +=0D
> +    impl Drop for NoHashPointersGuard {=0D
> +        fn drop(&mut self) {=0D
> +            // SAFETY: See `NoHashPointersGuard` safety documentation.=0D
> +            unsafe { bindings::no_hash_pointers =3D self.original };=0D
> +        }=0D
> +    }=0D
> +=0D
> +    #[cfg(CONFIG_64BIT)]=0D
> +    mod expected {=0D
> +        pub(super) const PTR_VALUE: usize =3D 0xffffffffdeadbeef;=0D
> +        pub(super) const HASHED_PREFIX: &str =3D "0x00000000";=0D
> +        pub(super) const RAW_POINTER: &str =3D "0xffffffffdeadbeef";=0D
> +        pub(super) const PADDED_LEFT: &str =3D "0xffffffffdeadbeef      =
";=0D
> +    }=0D
> +=0D
> +    #[cfg(not(CONFIG_64BIT))]=0D
> +    mod expected {=0D
> +        pub(super) const PTR_VALUE: usize =3D 0xdeadbeef;=0D
> +        pub(super) const HASHED_PREFIX: &str =3D "0x";=0D
> +        pub(super) const RAW_POINTER: &str =3D "0xdeadbeef";=0D
> +        pub(super) const PADDED_LEFT: &str =3D "0xdeadbeef              =
";=0D
> +    }=0D
> +=0D
> +    #[test]=0D
> +    fn test_ptr_formatting() -> core::result::Result<(), crate::error::E=
rror> {=0D
> +        let ptr =3D expected::PTR_VALUE as *const u8;=0D
> +=0D
> +        // SAFETY: See `NoHashPointersGuard` safety documentation.=0D
> +        let _hashed =3D unsafe { NoHashPointersGuard::new(false) };=0D
> +        let cstr =3D CString::try_from_fmt(fmt!("{:p}", ptr))?;=0D
> +        let formatted =3D cstr.to_str()?;=0D
> +        assert!(formatted.starts_with(expected::HASHED_PREFIX));=0D
> +        assert_ne!(formatted, expected::RAW_POINTER);=0D
> +        drop(_hashed);=0D
> +=0D
> +        // SAFETY: See `NoHashPointersGuard` safety documentation.=0D
> +        let _guard =3D unsafe { NoHashPointersGuard::new(true) };=0D
> +        let cstr =3D CString::try_from_fmt(fmt!("{:p}", ptr))?;=0D
> +        assert_eq!(cstr.to_str()?, expected::RAW_POINTER);=0D
> +=0D
> +        let cstr =3D CString::try_from_fmt(fmt!("{:024p}", ptr))?;=0D
> +        assert_eq!(cstr.to_str()?, expected::PADDED_LEFT);=0D
> +=0D
> +        Ok(())=0D
> +    }=0D
> +}=0D
> =0D
> -- =0D
> 2.43.0=0D
> =0D
