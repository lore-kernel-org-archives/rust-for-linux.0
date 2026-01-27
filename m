Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33232149C6F
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 08:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769503823; cv=none; b=hKxbmbwePdzkuwqMMqA1ppjqQQUZV06zZjJo9goV2oiFibUCMhoAx9zDvc/U/qLh1V5ggY1Hk+BHUBWT4OC+eFJ2MrHM1A8spAdaeCTVDiXQX6xDw+YmIq0CYE87rGclVE2c1aqBJ87SJKDFlo0lMKgpqVGXL/LbEpUdMkbtj28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769503823; c=relaxed/simple;
	bh=y5ixh+bg5BVJyvmj4uLXP9CDA9ORN6xN8K66gd8tbsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DeBQkkvA5ctdm+lUVOTYinpfo3+kVi7zBKLOcW35qNERFCvk1tTCAKWAk1UeS3h6c5ZLpm+AWy3iDP6jbMchUidrck/4t6xJ7mgj8+tsGzfTXK64e3b1G/AGByvTOi3Ta8Ck52Z0wCd4dknqjXYyR4peuwiBZ76pa3/dzylbPGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-649605d3664so3765511d50.3
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 00:50:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769503820; x=1770108620;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xyt1d6B5fGIIDvXrsblkgyRo6rVn7TLxW6LGzeuqD00=;
        b=QkNWV6jhxurGXX87TOQW+p8NsBMOT22HBwkEuqeaRCyx1rycqrkUDbeIXGugMTCq6b
         yYDXNcuL9QB+dpw1HOjkcVhm4d8xFg8fBqmju0VdEov5oJEeiqlirl7f36ySOyghzVTm
         02/zKLmRW7adTCYFPwlZ9Ivd1K1DulVS1s1wC3c9qVIxkrKPJ/KUzFwSsBY6e4ULq+tQ
         iSJoZBTGW7GBMWfx0sHGmq1I/nWTXADM7Z0FcYlf6LXnrnfA91Wv+MdyxFkOU0epVWEM
         nr0udSuHgFNnriqo14kKm6l6Sj/zmnoq1s4Xfyd5WzwwOC4LS3IH0CstH0jW5wSvw/yI
         U0wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbUjHiRdAeYco43vJvUYtK2z4NXoH1aZ6a7yGsS5vmRBuJrpIMPeQAwjm4ezCPnxiMFr2LWF+20zpopfkBBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJq0/hAJVu2i5DiyxYEfohEFfrdjKImhIaL5mWNkG4UaJLIxuG
	cQ3O3thjworXqiEkHmthAgXDgk7AtVknPxEJtAVCn1lfs4p+vffTTNiV
X-Gm-Gg: AZuq6aIrbrkfUnWv6sraBx7omX3Ln10FlBicFX1afYXQ6mw+GkXFbB0+ubaDbnfDfe5
	nxi61L9KnGmFWicVOIvAGaWzIrR06Q1UUyfnbtvGEO+GqX0uxG88/PgJ7lc+j8EyCNie85M17YC
	VnQS6Y36v+gT9j69s+8t6A0/l21MdxoitkzYlcpJpXXaM5//N7XULm/rGd0YDaD8MPzsglHUUxD
	x1oxT+vO3xBDlBIf12FPpwuevTVzuauJVdHbxp0weqMdVrn+QZ8mrUvIcodgjiyuON9Wzxg2xgB
	Tn/vgJ/mRST7M3qrKu88zUe2KnvVA//G/c1SmYxLc+VGZVBDP3WbEH79kMETCQxAZCe4y6wTxUN
	kJyZ/j8Xxwlo0QOtWE2YEiPCtdD4yxglXW3r+t+6DNRonInukftrzGMflrcrkXycPLIUGJp1gcI
	f9WLL+WktMuWeALBG0kWjngFFo4mNpSA==
X-Received: by 2002:a53:d018:0:b0:649:422e:a68d with SMTP id 956f58d0204a3-6498fc5d1femr503130d50.69.1769503820110;
        Tue, 27 Jan 2026 00:50:20 -0800 (PST)
Received: from [10.0.8.3] (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64968a8211csm4512047d50.13.2026.01.27.00.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 00:50:19 -0800 (PST)
Message-ID: <179c2a86-a5a6-4f56-895f-3ea112580d9b@kylinos.cn>
Date: Tue, 27 Jan 2026 16:50:14 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/1] rust: fmt: add safe pointer formatting support
To: Gary Guo <gary@garyguo.net>, Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
References: <CAJ-ks9k63auxfUEBrE+6HAeHrmgwmLZQiwo58MSd8+HSzQ7KQg@mail.gmail.com>
 <20260127080340.2886001-1-sunke@kylinos.cn>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <20260127080340.2886001-1-sunke@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/27/26 16:03, Ke Sun wrote:
> Add Pointer trait and two pointer wrapper types for safe pointer
> formatting:
>
> - Pointer trait: A copy of core::fmt::Pointer that, together with the
>    Adapter type and fmt! macro, ensures raw pointers are automatically
>    formatted using HashedPtr instead of being formatted directly.
>
> - HashedPtr: Formats pointers with kernel hashing (corresponds to %p).
>    This is now the default behavior when formatting raw pointers with
>    "{:p}", preventing kernel memory layout information leakage.
>
> - RawPtr: Formats raw address without hashing (corresponds to %px).
>    Should only be used for debugging purposes.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1219
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>   rust/kernel/fmt.rs | 162 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 160 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> index 84d634201d90a..56d505e120aa1 100644
> --- a/rust/kernel/fmt.rs
> +++ b/rust/kernel/fmt.rs
> @@ -5,6 +5,8 @@
>   //! This module is intended to be used in place of `core::fmt` in kernel code.
>   
>   pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
> +use crate::prelude::kunit_tests;
> +use kernel::str::CStrExt;
>   
>   /// Internal adapter used to route allow implementations of formatting traits for foreign types.
>   ///
> @@ -27,8 +29,8 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>       };
>   }
>   
> -use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
> -impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
> +use core::fmt::{Binary, LowerExp, LowerHex, Octal, UpperExp, UpperHex};
> +impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
>   
>   /// A copy of [`core::fmt::Display`] that allows us to implement it for foreign types.
>   ///
> @@ -90,3 +92,159 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>       {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::fmt::Display},
>       {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueArc<T>: core::fmt::Display},
>   );
> +
> +/// A copy of [`core::fmt::Pointer`] that exists to prevent raw pointers from
> +/// being formatted directly.
> +///
> +/// Together, the [`Adapter`] type, [`fmt!`] macro, and this trait ensure that
> +/// raw pointers (`*const T` and `*mut T`) are automatically formatted using
> +/// [`HashedPtr`] instead of being formatted directly, preventing kernel memory
> +/// layout information leakage.
> +///
> +/// [`fmt!`]: crate::prelude::fmt!
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
> +        let Self(t) = self;
> +        Pointer::fmt(t, f)
> +    }
> +}
> +
> +macro_rules! impl_hashed_pointer {
> +    ($($ptr_ty:ty),* $(,)?) => {
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
> +/// This is the default behavior for kernel pointers - they are hashed to
> +/// prevent leaking information about the kernel memory layout.
> +#[derive(Copy, Clone)]
> +pub struct HashedPtr<T>(pub *const T);
> +
> +impl<T> Pointer for HashedPtr<T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let ptr = self.0;
> +        // The default width for %p is 2 * sizeof(ptr) (see lib/vsprintf.c:
> +        // pointer_string() and ptr_to_id()), which is 16 characters on
> +        // 64-bit systems. With the "0x" prefix and null terminator, this
> +        // is at most 19 characters. 32 bytes is sufficient for all pointer
> +        // formats including hash values.
> +        let mut buf = [0u8; 32];
> +
> +        // SAFETY: scnprintf never writes more than size-1 characters, so
> +        // len is at most buf.len() - 1.
> +        let len =
> +            unsafe { bindings::scnprintf(buf.as_mut_ptr(), buf.len(), c"0x%p".as_char_ptr(), ptr) };
> +        // SAFETY: scnprintf with "%p" format always produces valid ASCII
> +        // output, which can be directly converted to UTF-8.
> +        let formatted = unsafe { core::str::from_utf8_unchecked(&buf[..len as usize]) };
> +
> +        // Use pad() to respect width and alignment.
> +        f.pad(formatted)
> +    }
> +}
> +
> +/// A wrapper that formats any type implementing [`core::fmt::Pointer`] as its
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
> +
> +#[kunit_tests(rust_kernel_fmt)]
> +mod tests {
> +    use crate::{
> +        bindings,
> +        prelude::fmt,
> +        str::CString, //
> +    };
> +
> +    #[test]
> +    fn test_ptr_formatting() -> core::result::Result<(), crate::error::Error> {
> +        // SAFETY: no_hash_pointers is a global variable.
> +        let no_hash_pointers = unsafe { bindings::no_hash_pointers };
> +
> +        #[cfg(CONFIG_64BIT)]
> +        {
> +            let ptr = 0xffffffffdeadbeef as *const u8;
> +
> +            // SAFETY: no_hash_pointers is a global variable.
> +            unsafe { bindings::no_hash_pointers = false; }
> +            let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
> +            let formatted = cstr.to_str()?;
> +            // On 64-bit systems, hashed pointers start with 0x00000000.
> +            assert!(formatted.starts_with("0x00000000"));
> +            assert_ne!(formatted, "0xffffffffdeadbeef");
> +
> +            // SAFETY: no_hash_pointers is a global variable.
> +            unsafe { bindings::no_hash_pointers = true; }
> +            let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
> +            // When hashing is disabled, fmt outputs the raw pointer directly.
> +            assert_eq!(cstr.to_str()?, "0xffffffffdeadbeef");
> +
> +            // HashedPtr uses scnprintf and pad to format pointers. The pad
> +            // method does not support zero-padding.
> +            let cstr = CString::try_from_fmt(fmt!("{:032p}", ptr))?;
> +            assert_eq!(cstr.to_str()?, "0xffffffffdeadbeef              ");
> +        }
> +
> +        #[cfg(not(CONFIG_64BIT))]
> +        {
> +            let ptr = 0xdeadbeef as *const u8;
> +
> +            // SAFETY: no_hash_pointers is a global variable.
> +            unsafe { bindings::no_hash_pointers = false; }
> +            let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
> +            let formatted = cstr.to_str()?;
> +            // On 32-bit systems, hashed pointers start with 0x, but the
> +            // content differs from the original pointer.
Sorry, I sent the wrong patch - the 32-bit and 64-bit comments are swapped.
Please ignore that and review the rest.


Best regards,
Ke Sun
> +            assert!(formatted.starts_with("0x"));
> +            assert_ne!(formatted, "0xdeadbeef");
> +
> +            // SAFETY: no_hash_pointers is a global variable.
> +            unsafe { bindings::no_hash_pointers = true; }
> +            let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
> +            // When hashing is disabled, fmt outputs the raw pointer directly.
> +            assert_eq!(cstr.to_str()?, "0xdeadbeef");
> +
> +            // HashedPtr uses scnprintf and pad to format pointers. The pad
> +            // method does not support zero-padding.
> +            let cstr = CString::try_from_fmt(fmt!("{:016p}", ptr))?;
> +            assert_eq!(cstr.to_str()?, "0xdeadbeef      ");
> +        }
> +
> +        // SAFETY: no_hash_pointers is a global variable.
> +        unsafe { bindings::no_hash_pointers = no_hash_pointers; }
> +
> +        Ok(())
> +    }
> +}
