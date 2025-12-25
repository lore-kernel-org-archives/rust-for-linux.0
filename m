Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBD52F5A0D
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766654406; cv=none; b=I96FtVyhR9SWOfzVR+544LwWmKfVkEKbg4jiPIJztWsOlQ5k3UB8deCEBUCpvwyzTHB8lEsksskPcR5Bnd07LFeqg+IhhMyoo1CV5FN9MaGKN+U3InUynZDei+rJH1sKG+/RpJoAWkInC597Q1vY/bkPpcspy90rEJ7njoObjcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766654406; c=relaxed/simple;
	bh=WCWwO8Pijg7+F+aBsNPQV/9rw5qjYlsYIWCq/G5Gbvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/dmPJpO67zyCUiIkk9JuRSQJ1FRLCQjj1AxmjThS9uvoPt4DuzOMp9jhRMpxjdAdvrES7IiWysnWsZrnNv2ApiuuCwm5+I1Dm121kknwbZk5MPtySbiZpJKxPsqUWNfAhwDviQ+I6D+/o1jP3ljMh6AIL2PdgUCmzSq4zCanqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kowQVGet; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kowQVGet"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43246af170aso3182982f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 01:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766654401; x=1767259201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Akv/kUbGeWXqJy5qAdFKRp8iNr/6IAjiwAcGjnA6Ev8=;
        b=kowQVGetLBq+Udd/gfgxyEGVxTE5JspCQr3lBn/Ym5Vh5Y1JhKxc1esEN4zgv5G6d2
         VA6RGvRFA4ITp4hSVkz6huNzovRmA18kGpik+B2Z49OrZ9KYzeMwYw/R3Ul9Qhl1Wkhv
         d2ngM0Y+x+R21Lm/LwJN9nCOiFk4tgblFYJ9c33MUKhNMrElBBN5oOyX+hR+nUSbswa0
         hKLIOkdZbBlqyKTAn5II8V+AUGDGuswHS503gr+/EBNGg5uY/5ZysOgLVgmeA3yHsz2o
         2LINOmiZidxV8sCUv/h+GWhJGeX9Xdnhx841zUYNDONVxO8vfKSBj3R6pgJ/F5cgu6WR
         pEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766654401; x=1767259201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Akv/kUbGeWXqJy5qAdFKRp8iNr/6IAjiwAcGjnA6Ev8=;
        b=w+cOydzAZpdLFu1PGTPL+ZQzhyW4TaV8lPPIQNr0NhbfFw4AzQmUVr5QX3NQyj14ba
         49rVucvzIGKt9o+dWr9evsUCQQpF9IiGqAnXF1k85YQnz0skh7aK9MaMOSOE0QJZ2To0
         nEd3kvLyXiQfSc3Pm8dpfXc6cXHsZS2txwiMmXFsmccfkqityTqMEPOvnzkLljpd5H4D
         RAuVFg4PMO1jyag8WKpKq51OYkH1aWM1mZ3Ya9IhwqRECxIi8ReVEgLeAohf0uhYXoBf
         k1ZYkXP6wqpGWUPHlsIYcajAEnHj4NJuvVa4PEcZeQDKVA4wNa9atUQpxipDWkTjZ0ND
         8vig==
X-Forwarded-Encrypted: i=1; AJvYcCXuMOL5DKMsTpk/obEbAZmAbJJibUDNvMOme38d0sdazqXTg6y/TItKT9MwbzRFIdWXsK4hk39YC4AYyUPGlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEL2Rp0Y0rurkgHoaI++Nrf0UKofs2HCHC8O7cZwMVK0oaiQKO
	PYOm2Q14hhgS0iS5wQsPgjs7/9YYuyzwn6Q0lPovUg6fxfZS9HFoD5SU48g44f8D
X-Gm-Gg: AY/fxX6AqWBYTwjB/8XUaomObtjGckTc99vr/WT5eCnERbjzeqaxk7iFLs/tlgP6OL+
	2GMTjKDYRzNmL8Dnpu/Wsa/hEbuqYF45qwVd1rOsXyBbQ4WMqpqMkXo6yW3cA54Pyxy8nLud1R2
	0UnK0knjGutbgxjLGsulgJTuuyDUAZTCb3EIpSZEDDxhA+3qTHw7exsHfDcRcuaPm7IQHkGH6j0
	ta5uNdOVPqC7JW8/9nuOqw+yyQTYlhkNU8tFj0TaCahZdjXjrKWxEfWo//qtkYeSozaDvcReXsJ
	he7jttpE6VUULLHYP88DrZmjUGx6pnrIoFkoo/TkBgKPYpn4y6Tcth/Ese4Xo3bQ1WNY4Ax1poX
	F/iw5YlAAsmXgLyuHo74UtLwSrm1oQn0Sw23OVWY/35t6yGNHHGG6OIluPqtohMbpu3w5Pw1fY3
	lmxpTSX8rAv5Ucgk5IwmQFZT5tEJSii6qufOqMOBIhZiPDw9hXHo9QJGErzcvyyV5QMRKGngXoN
	+T40TbrgITx/M3Ht3/grVE0HanlUfiamOyQREOqHdNgPw==
X-Google-Smtp-Source: AGHT+IEBf8tDnvO549PDH/zIlJhpC0jp90snEeAeIG8kTQCgKW3Jg1lC4uNYt/QUlcZ1XOOIeMeKwg==
X-Received: by 2002:a05:6000:b92:b0:432:59d4:f54a with SMTP id ffacd0b85a97d-43259d4f619mr15245590f8f.30.1766654400443;
        Thu, 25 Dec 2025 01:20:00 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:420b:3ef1:a6b8:1c3c? (p200300dfbf2de300420b3ef1a6b81c3c.dip0.t-ipconnect.de. [2003:df:bf2d:e300:420b:3ef1:a6b8:1c3c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1afbfsm39682303f8f.9.2025.12.25.01.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Dec 2025 01:19:59 -0800 (PST)
Message-ID: <1e63cddd-7be2-4734-8c83-9a916a94a388@gmail.com>
Date: Thu, 25 Dec 2025 10:19:56 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] rust: kernel: Add pointer wrapper types for safe
 pointer formatting
To: Ke Sun <sunke@kylinos.cn>, Miguel Ojeda <ojeda@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Benno Lossin <lossin@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>,
 rust-for-linux@vger.kernel.org
References: <20251224081315.729684-1-sunke@kylinos.cn>
 <20251224081315.729684-3-sunke@kylinos.cn>
Content-Language: en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251224081315.729684-3-sunke@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.12.25 09:13, Ke Sun wrote:
> Add three pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr) to
> rust/kernel/ptr.rs that correspond to C kernel's printk format specifiers
> %p, %pK, and %px. These types provide type-safe pointer formatting that
> matches C kernel patterns.
> 
> These wrapper types implement core::fmt::Pointer and delegate to the
> corresponding kernel formatting functions, enabling safe pointer
> formatting in Rust code that prevents information leaks about kernel
> memory layout.
> 
> Users can explicitly use these types:
>     pr_info!("{:p}\n", HashedPtr::from(ptr));
>     seq_print!(seq_file, "{:p}\n", RestrictedPtr::from(ptr));
>     pr_info!("{:p}\n", RawPtr::from(ptr));
> 
> Changes:
> - Add HashedPtr for %p (hashed, default behavior)
> - Add RestrictedPtr for %pK (restricted, respects kptr_restrict)
> - Add RawPtr for %px (raw address, debug only)
> - Add helper function kptr_restrict_value() in rust/helpers/fmt.c
> - Add impl_ptr_wrapper! macro to reduce code duplication
> 
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>  rust/helpers/fmt.c     |  61 ++++++++++++++
>  rust/helpers/helpers.c |   3 +-
>  rust/kernel/ptr.rs     | 186 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 249 insertions(+), 1 deletion(-)
>  create mode 100644 rust/helpers/fmt.c
....
> diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> index e3893ed04049d..deb4d72bcecca 100644
> --- a/rust/kernel/ptr.rs
> +++ b/rust/kernel/ptr.rs
> @@ -1,11 +1,17 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  //! Types and functions to work with pointers and addresses.
> +//!
> +//! This module provides wrapper types for formatting kernel pointers that correspond to the
> +//! C kernel's printk format specifiers `%p`, `%pK`, and `%px`.
>  
> +use core::fmt;
>  use core::mem::align_of;
>  use core::num::NonZero;
>  
> +use crate::bindings;
>  use crate::build_assert;
> +use crate::ffi::c_void;
>  
>  /// Type representing an alignment, which is always a power of two.
>  ///
> @@ -225,3 +231,183 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
>  }
>  
>  impl_alignable_uint!(u8, u16, u32, u64, usize);
> +
> +/// Placeholder string used when pointer hashing is not ready yet.
> +const PTR_PLACEHOLDER: &str = if core::mem::size_of::<*const c_void>() == 8 {
> +    "(____ptrval____)"
> +} else {
> +    "(ptrval)"
> +};
> +
> +/// Macro to implement common methods for pointer wrapper types.
> +macro_rules! impl_ptr_wrapper {
> +    ($($name:ident),* $(,)?) => {
> +        $(
> +            impl $name {
> +                /// Creates a new instance from a raw pointer.
> +                #[inline]
> +                pub fn from<T>(ptr: *const T) -> Self {
> +                    Self(ptr.cast())
> +                }
> +
> +                /// Creates a new instance from a mutable raw pointer.
> +                #[inline]
> +                pub fn from_mut<T>(ptr: *mut T) -> Self {
> +                    Self(ptr.cast())
> +                }
> +
> +                /// Returns the inner raw pointer.
> +                #[inline]
> +                pub fn as_ptr(&self) -> *const c_void {
> +                    self.0
> +                }
> +            }
> +
> +            impl<T> From<*const T> for $name {
> +                #[inline]
> +                fn from(ptr: *const T) -> Self {
> +                    Self::from(ptr)
> +                }
> +            }
> +
> +            impl<T> From<*mut T> for $name {
> +                #[inline]
> +                fn from(ptr: *mut T) -> Self {
> +                    Self::from_mut(ptr)
> +                }
> +            }
> +        )*
> +    };
> +}
> +
> +/// Helper function to hash a pointer and format it.
> +///
> +/// Returns `Ok(())` if the hash was successfully computed and formatted,
> +/// or the placeholder string if hashing is not ready yet.
> +fn format_hashed_ptr(ptr: *const c_void, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +    // SAFETY: We're calling the kernel's ptr_to_hashval function which handles
> +    // hashing. This is safe as long as ptr is a valid pointer value.
> +    unsafe {

Would it be possible to limit the scope of the unsafe? E.g. to just

let ret = unsafe { bindings::ptr_to_hashval(ptr,
core::ptr::addr_of_mut!(hashval))};

> +        let mut hashval: crate::ffi::c_ulong = 0;
> +        let ret = bindings::ptr_to_hashval(ptr, core::ptr::addr_of_mut!(hashval));
> +
> +        if ret == 0 {
> +            // Successfully got hash value, format it
> +            write!(f, "{:p}", hashval as *const c_void)
> +        } else {
> +            // Hash not ready yet, print placeholder
> +            f.write_str(PTR_PLACEHOLDER)
> +        }

Whats about making the happy path the default and with this have less
indentation?

if ret != 0 {
     // Hash not ready yet, print placeholder
     return f.write_str(PTR_PLACEHOLDER);
}

// Successfully got hash value, format it
write!(f, "{:p}", hashval as *const c_void)


> +    }
> +}
> +
> +/// A pointer that will be hashed when printed (corresponds to `%p`).
> +///
> +/// This is the default behavior for kernel pointers - they are hashed to prevent
> +/// leaking information about the kernel memory layout.
> +///
> +/// # Example
> +///
> +/// ```
> +/// use kernel::ptr::HashedPtr;
> +///
> +/// let ptr = HashedPtr::from(0x12345678 as *const u8);
> +/// pr_info!("Pointer: {:p}\n", ptr);
> +/// ```
> +#[repr(transparent)]
> +#[derive(Copy, Clone, Debug)]
> +pub struct HashedPtr(*const c_void);
> +
> +impl fmt::Pointer for HashedPtr {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        let ptr = self.0;
> +
> +        // Handle NULL pointers - print them directly
> +        if ptr.is_null() {
> +            return write!(f, "{:p}", ptr);
> +        }
> +
> +        format_hashed_ptr(ptr, f)
> +    }
> +}
> +
> +/// A pointer that will be restricted based on `kptr_restrict` when printed (corresponds to `%pK`).
> +///
> +/// This is intended for use in procfs/sysfs files that are read by userspace.
> +/// The behavior depends on the `kptr_restrict` sysctl setting.
> +///
> +/// # Example
> +///
> +/// ```
> +/// use kernel::ptr::RestrictedPtr;
> +///
> +/// let ptr = RestrictedPtr::from(0x12345678 as *const u8);
> +/// seq_print!(seq_file, "Pointer: {:p}\n", ptr);
> +/// ```

This example doesn't build:

error: cannot find macro `seq_print` in this scope
     --> rust/doctests_kernel_generated.rs:12492:1
      |
12492 | seq_print!(seq_file, "Pointer: {:p}\n", ptr);
      | ^^^^^^^^^
      |
help: consider importing this macro
      |
    3 + use kernel::seq_print;
      |

Adding that results in

error[E0425]: cannot find value `seq_file` in this scope
     --> rust/doctests_kernel_generated.rs:12493:12
      |
12493 | seq_print!(seq_file, "Pointer: {:p}\n", ptr);
      |            ^^^^^^^^ not found in this scope


> +#[repr(transparent)]
> +#[derive(Copy, Clone, Debug)]
> +pub struct RestrictedPtr(*const c_void);
> +
> +impl fmt::Pointer for RestrictedPtr {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        let ptr = self.0;
> +
> +        // Handle NULL pointers
> +        if ptr.is_null() {
> +            return write!(f, "{:p}", ptr);
> +        }
> +
> +        // Use kptr_restrict_value to handle all kptr_restrict cases.
> +        // SAFETY: kptr_restrict_value handles capability checks and IRQ context.
> +        // - Returns NULL if no permission, IRQ context, or kptr_restrict >= 2
> +        // - Returns the original pointer if kptr_restrict == 0 (needs hashing)
> +        // - Returns the original pointer if kptr_restrict == 1 with permission (print raw)
> +        let restricted_ptr = unsafe { bindings::kptr_restrict_value(ptr) };
> +
> +        if restricted_ptr.is_null() {
> +            // No permission, IRQ context, or kptr_restrict >= 2 - print 0
> +            write!(f, "{:p}", core::ptr::null::<c_void>())
> +        } else {
> +            // restricted_ptr is non-null, meaning we should print something.
> +            // SAFETY: Reading kptr_restrict is safe as it's a kernel variable.
> +            let restrict = unsafe { bindings::kptr_restrict };
> +
> +            if restrict == 0 {
> +                // kptr_restrict == 0: hash the pointer (same as %p)
> +                format_hashed_ptr(ptr, f)
> +            } else {
> +                // kptr_restrict == 1 with permission: print the raw pointer directly (like %px)
> +                // This matches C behavior: pointer_string() prints the raw address
> +                write!(f, "{:p}", restricted_ptr)
> +            }
> +        }


Same if formatting like above here? E.g.

if restricted_ptr.is_null() {
    // No permission, IRQ context, or kptr_restrict >= 2 - print 0
    return write!(f, "{:p}", core::ptr::null::<c_void>());
}

// restricted_ptr is non-null, meaning we should print something.
// SAFETY: Reading kptr_restrict is safe as it's a kernel variable.
let restrict = unsafe { bindings::kptr_restrict };

if restrict == 0 {
    // kptr_restrict == 0: hash the pointer (same as %p)
    return format_hashed_ptr(ptr, f);
}

// kptr_restrict == 1 with permission: print the raw pointer directly
(like %px)
// This matches C behavior: pointer_string() prints the raw address
write!(f, "{:p}", restricted_ptr)


> +    }
> +}
> +
> +/// A pointer that will be printed as its raw address (corresponds to `%px`).
> +///
> +/// **Warning**: This exposes the real kernel address and should only be used
> +/// for debugging purposes. Consider using [`HashedPtr`] or [`RestrictedPtr`] instead.
> +///
> +/// # Example
> +///
> +/// ```
> +/// use kernel::ptr::RawPtr;
> +///
> +/// let ptr = RawPtr::from(0x12345678 as *const u8);
> +/// pr_info!("Debug pointer: {:p}\n", ptr);
> +/// ```
> +#[repr(transparent)]
> +#[derive(Copy, Clone, Debug)]
> +pub struct RawPtr(*const c_void);
> +
> +impl fmt::Pointer for RawPtr {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        // Directly format the raw address - no hashing or restriction
> +        // This corresponds to %px behavior
> +        write!(f, "{:p}", self.0)
> +    }
> +}
> +
> +// Implement common methods for all pointer wrapper types
> +impl_ptr_wrapper!(HashedPtr, RestrictedPtr, RawPtr);


Btw, would all this work with e.g. some format specifiers? E.g. with
{:016p} ?

Cheers,

Dirk

