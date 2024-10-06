Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA1A16EB5D
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Oct 2024 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728210413; cv=none; b=EQ8s0Sj1RvSIzwu6aid3NIupYtNbrq7LHpZAaMFjwVcvEVKQfG3nAU0RMlAyonrZZ2keyXgt4xR7zzBcxVgM7BOcaXCDjT8Q6c7Z0NitfLoJln0utAN0TNKc13fmglHQ0LjcJ2nUtTNZVFVCj/kfLyp9nLl6zGSrMHDh3I+RvLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728210413; c=relaxed/simple;
	bh=Wh52MwBoE0Pj9f9WcQX2zf87Ad7o7FuKtoHCYkuPKmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YQiiHtGZo+Xg9wH0VWLnllibgLV3LhPEwgebrRH9nb1KkUVPBTjGc2MxZe7CwXyQY4Y4uvkyN8Kk9R2xRbkagZZibn1bYg4yUKDQdQVP5N8M3aQsQUnJqz2zlvb1VWzkwJU+aCzX6UoLAVTbF7YRgG9UscpyPKdeN+1OUr+djCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=qZn5QVQV; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="qZn5QVQV"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1728209819; bh=CzEitUDCctCjL6mzFL424QM8eZxcyDeEr3N9+fsulLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qZn5QVQVG2/Rc5AcmgY64RgqESK8luWG/Zg/xR1ICReemI2s6poO8Kd0DKi4Uif0G
	 FbNv6g6+ZM2n/ivjZcGF33UaFCvH6mMwi+NnHB1MBKbdAvIP/57Ep2XjKfFWHXnshh
	 SpiuN+CKzbbepEX1/EnxB27NG0dfeiGQhuf9iPlM=
To: Filipe Xavier <felipe_life@live.com>
Cc: ojeda@kernel.org, aliceryhl@google.com,
 Benno Lossin <benno.lossin@proton.me>, gary@garyguo.net,
 boqun.feng@gmail.com, alex.gaynor@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4] rust: optimize error type to use nonzero
Date: Sun, 06 Oct 2024 12:16:58 +0200
Message-ID: <4071E558-FC6E-4370-B3A8-5E2B9ED65BE0@kloenk.dev>
In-Reply-To: <BL0PR02MB4914B9B088865CF237731207E9732@BL0PR02MB4914.namprd02.prod.outlook.com>
References: <BL0PR02MB4914B9B088865CF237731207E9732@BL0PR02MB4914.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 5 Oct 2024, at 21:51, Filipe Xavier wrote:

> Optimize `Result<(), Error>` size by changing `Error` type to
> `NonZero*` for niche optimization.
>
> This reduces the space used by the `Result` type, as the `NonZero*`
> type enables the compiler to apply more efficient memory layout.
> For example, the `Result<(), Error>` changes size from 8 to 4 bytes.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1120
> Signed-off-by: Filipe Xavier <felipe_life@live.com>

One minor nitpick below, but don=E2=80=99t see that as to relevant

Reviewed-by: Fiona Behrens <me@kloenk.dev>

> ---
> Changes in v4:
> - Created const fn try_from_errno to use on macro.
> - Adjusted macro declare_err to use try_from_errno and remain safe.
> Link to v3: https://lore.kernel.org/rust-for-linux/BL0PR02MB491443BD775=
D5D63635C3F4FE9712@BL0PR02MB4914.namprd02.prod.outlook.com/
>
> Changes in v3:
> - Adjusted safety comment of function from_errno.
> - Adjusted macro declare_err to check if error code is valid and
>   its safety comment fixed.
> Link to v2: https://lore.kernel.org/rust-for-linux/BL0PR02MB49141A17256=
9679932EBA20CE9712@BL0PR02MB4914.namprd02.prod.outlook.com/
>
> Changes in v2:
> - Adjusted on commit message.
> - Added safety comment on macro.
> - Reverted signature of function from_errno.
> - Removed explicit type on function to_ptr.
> Link to v1: https://lore.kernel.org/rust-for-linux/BL0PR02MB49142BDF011=
175DADD6E79D0E9702@BL0PR02MB4914.namprd02.prod.outlook.com/
>
>  rust/kernel/error.rs | 38 +++++++++++++++++++++++++++++---------
>  1 file changed, 29 insertions(+), 9 deletions(-)
>
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index d7965ded2973..36015ed7b258 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -9,6 +9,7 @@
>  use alloc::alloc::LayoutError;
>
>  use core::fmt;
> +use core::num::NonZeroI32;
>  use core::num::TryFromIntError;
>  use core::str::Utf8Error;
>
> @@ -20,7 +21,12 @@ macro_rules! declare_err {
>              $(
>              #[doc =3D $doc]
>              )*
> -            pub const $err: super::Error =3D super::Error(-(crate::bin=
dings::$err as i32));
> +            pub const $err: super::Error =3D {
> +                match super::Error::try_from_errno(-(crate::bindings::=
$err as i32)) {
> +                    Some(err) =3D> err,
> +                    None =3D> panic!("Invalid errno in declare_err!"),=

> +                }
> +            };
>          };
>      }
>
> @@ -88,7 +94,7 @@ macro_rules! declare_err {
>  ///
>  /// The value is a valid `errno` (i.e. `>=3D -MAX_ERRNO && < 0`).
>  #[derive(Clone, Copy, PartialEq, Eq)]
> -pub struct Error(core::ffi::c_int);
> +pub struct Error(NonZeroI32);
>
>  impl Error {
>      /// Creates an [`Error`] from a kernel error code.
> @@ -107,7 +113,20 @@ pub fn from_errno(errno: core::ffi::c_int) -> Erro=
r {
>
>          // INVARIANT: The check above ensures the type invariant
>          // will hold.
> -        Error(errno)
> +        // SAFETY: `errno` is checked above to be in a valid range.
> +        unsafe { Error::from_errno_unchecked(errno) }
> +    }
> +
> +    /// Creates an [`Error`] from a kernel error code.
> +    ///
> +    /// Returns `None` if `errno` is out-of-range.
> +    const fn try_from_errno(errno: core::ffi::c_int) -> Option<Error> =
{
> +        if errno < -(bindings::MAX_ERRNO as i32) || errno >=3D 0 {
> +            return None;
> +        }
> +
> +        // SAFETY: `errno` is checked above to be in a valid range.
> +        Some(unsafe { Error::from_errno_unchecked(errno) })
>      }
>
>      /// Creates an [`Error`] from a kernel error code.
> @@ -115,21 +134,22 @@ pub fn from_errno(errno: core::ffi::c_int) -> Err=
or {
>      /// # Safety
>      ///
>      /// `errno` must be within error code range (i.e. `>=3D -MAX_ERRNO=
 && < 0`).
> -    unsafe fn from_errno_unchecked(errno: core::ffi::c_int) -> Error {=

> +    const unsafe fn from_errno_unchecked(errno: core::ffi::c_int) -> E=
rror {
>          // INVARIANT: The contract ensures the type invariant
>          // will hold.
> -        Error(errno)
> +        // SAFETY: The caller guarantees `errno` is non-zero.
> +        Error(unsafe { NonZeroI32::new_unchecked(errno) })
>      }
>
>      /// Returns the kernel error code.
>      pub fn to_errno(self) -> core::ffi::c_int {
> -        self.0
> +        self.0.get()
>      }
>
>      #[cfg(CONFIG_BLOCK)]
>      pub(crate) fn to_blk_status(self) -> bindings::blk_status_t {
>          // SAFETY: `self.0` is a valid error due to its invariant.
> -        unsafe { bindings::errno_to_blk_status(self.0) }
> +        unsafe { bindings::errno_to_blk_status(self.0.get()) }

Would it make sense to use to_errno here instead of get, should the inner=
 type ever get changed again?
(Maybe even inline to_errno, but that would be rather out of scope for th=
is change)

>      }
>
>      /// Returns the error encoded as a pointer.
> @@ -137,7 +157,7 @@ pub fn to_ptr<T>(self) -> *mut T {
>          #[cfg_attr(target_pointer_width =3D "32", allow(clippy::useles=
s_conversion))]
>          // SAFETY: `self.0` is a valid error due to its invariant.
>          unsafe {
> -            bindings::ERR_PTR(self.0.into()) as *mut _
> +            bindings::ERR_PTR(self.0.get().into()) as *mut _
>          }
>      }
>
> @@ -145,7 +165,7 @@ pub fn to_ptr<T>(self) -> *mut T {
>      #[cfg(not(testlib))]
>      pub fn name(&self) -> Option<&'static CStr> {
>          // SAFETY: Just an FFI call, there are no extra safety require=
ments.
> -        let ptr =3D unsafe { bindings::errname(-self.0) };
> +        let ptr =3D unsafe { bindings::errname(-self.0.get()) };
>          if ptr.is_null() {
>              None
>          } else {
> -- =

> 2.46.0
