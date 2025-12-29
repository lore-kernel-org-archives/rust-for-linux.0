Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF72323B61B
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 07:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766993917; cv=none; b=l4O3lhUZEahs3fp6BDNOT22nTPr5tzfmJFZVQa0+5nP8VoZoEXhketnYRkJ/mieMQy/pagSutE6pKlIIamOcKyPpHB6A7BWtdfY0joyDWMOcex+L7hkuWY36DmtOUXIh+l5B6oad15N8Wb/0h5upFqikA7eHRs8hbiLN4ryMubo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766993917; c=relaxed/simple;
	bh=nT1jntmnqjkUMUxhcpP7+m/oppNGRUhvcWMAm7KWSIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JUWoF0MfHH5vycGEIyQWjbM9/ZBdWkwE99VRz2e6bGKN8pBs48CpAyrp72AR86IbIth5wg8HLPvxoNvrZIrTrXTLEwb1zTpQMe3zUoJe80lxbtZ7lfRtucFCOIaC/QB0rybGrj9TDf7JMvkh164D+jYjuD+SXpQUdMWTs/QUKXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S65/t0ki; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S65/t0ki"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0fe77d141so95296835ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 23:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766993910; x=1767598710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnsLrEi13ldlb22+myllhyHwK2BcouvyBmdDWHUOEaQ=;
        b=S65/t0ki6oTXACTtRnmknj6O7KA0xPthY7vxGNDqWORd6mkUT4CBTM+4aTeqh1Dzih
         1+WpkX2LhfQ6IU01L6qUyV9OvECYl6CZOnvo0SRnd7NUbxdYDgFNtp1wOfaPn8a10STd
         X24IIYDj1RSH/blALuLBy4dVbReBhrTMWIfttjjHvuo3AGeetp+y41HGOhkyQRIfmSIz
         +YCWmEp1P+eX9klh3LtZ8bmDIz9FjJOFb3WERSRIMAUQ29k0OF1JypOtQzsyWkuSZwcR
         VS+e511yXVytbtpmYOSyHwimYFj80FKVRmsVf4x8k138XfblCS5+CDNRsEG8Qi3Awbqo
         586w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766993911; x=1767598711;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EnsLrEi13ldlb22+myllhyHwK2BcouvyBmdDWHUOEaQ=;
        b=V6oPdpcpdvaKKcYA+ijH0mRizXP5bDC91ry9DB4Re1z0TDKsnYbaJqXU/3qfnaFanJ
         2/V7MmcCgOGR6VMkt9UsowzsMke71AiOr5mUzGj7KZYACeDWz6yNDCTphpri8ScCuKUP
         T/wTd3XL6YPhwzi+eEFkRwVo5g3ff7Axufy+YIu9s9xoodn0gykug4s9dq1eGybe9Kt6
         JiGVQoabui1t/JZaFmpp+ozrKvUkyqC8fbatkscfv8WTe0+5AzRu5T7x/l55CutEV089
         kRIBRovYhgqlBwWY3yLFdZ+imhhEJl4Lsc4UHmSt7rFDQ/8KnHLnpdoe499RAaIqfMrw
         GoMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV31wCbFWzgk8gdLAONeGx32r9ZfsKLjFJVB2+uRRJ54iOtrbGhtdthM8MfhgCeqtXvQqEJGVeA6VqF7XonUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw99+yE4lLX3A9jy7Gj/2uMMlBy54GT/+43GI5c0EeIwy3SR7sh
	hke4lIx9ap/zOr7qQHGELdad8EGpP6rFqVwgm6uYbot5nSB9DKFyX/oY
X-Gm-Gg: AY/fxX4Pb0PgRfeQT3WkAReeSS18ZCzQREt/0YVJzM9n+Au0wYfIQnXJZGaIQ5O/lA+
	B8/Q+puxnj4YDhVNgucAjTJMFV5BIwplulgJ8tMi583k0rK1UMsPYJ90L2ojkdvwfwQGgHligYI
	5ErsrFmLosZ246ubQnJPvDzenUoO+FZSE/szCRn59GNC9TykqC+gJ/ikUag09cbCmq7UKuiIw6x
	HQHYI0IuLn3+yp1aRtlTTqGtyfxQLLI28m2tHvnRstCLGr0m6ysd66xkSQ7xp/G8kzSc+XTzaBj
	gsuU5UM8B/iJiZjUa1sg+jvKU8UphWRrEG8wE101YU9TmJgegl8GV7VcUeCYYlHpdyl3xef2cAh
	l8nnI8QfAoX6ZyikcBdeWbQeqfBYHQ0Xi1+xTOQJ7J32+x9yBzfbJTrJvBeeq8hdajSRPAXONs1
	P+EMXy67qgWCAAjn6uzjKx4tR6wu5iRl0zw2ZGHkkRQzAoL1Y=
X-Google-Smtp-Source: AGHT+IEnnMb999dlELDSOO6waaqYiLqObQJJ7ZWli1NgHLxoKdGOfngAtMPMvI2ceXb6+n1JqmNXuA==
X-Received: by 2002:a17:902:ec8b:b0:2a2:c1a3:63df with SMTP id d9443c01a7336-2a2f2830da5mr289829075ad.31.1766993910413;
        Sun, 28 Dec 2025 23:38:30 -0800 (PST)
Received: from [10.0.10.3] (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83961sm266234145ad.38.2025.12.28.23.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 23:38:29 -0800 (PST)
Message-ID: <b7aab77c-43d1-4c59-84d3-a8b0b31c34ae@gmail.com>
Date: Mon, 29 Dec 2025 15:38:22 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] rust: kernel: Add pointer wrapper types for safe
 pointer formatting
To: Boqun Feng <boqun.feng@gmail.com>, Ke Sun <sunke@kylinos.cn>
Cc: Dirk Behme <dirk.behme@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>,
 rust-for-linux@vger.kernel.org
References: <20251227033958.3713232-1-sunke@kylinos.cn>
 <20251227033958.3713232-3-sunke@kylinos.cn> <aU90-0sVL81fJ2ON@tardis-2.local>
From: Ke Sun <sk.alvin.x@gmail.com>
In-Reply-To: <aU90-0sVL81fJ2ON@tardis-2.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/27/25 13:56, Boqun Feng wrote:
> On Sat, Dec 27, 2025 at 11:39:53AM +0800, Ke Sun wrote:
>> Add three pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr) to
>> rust/kernel/ptr.rs that correspond to C kernel's printk format specifiers
>> %p, %pK, and %px. These types provide type-safe pointer formatting that
>> matches C kernel patterns.
>>
>> These wrapper types implement core::fmt::Pointer and delegate to the
>> corresponding kernel formatting functions, enabling safe pointer
>> formatting in Rust code that prevents information leaks about kernel
>> memory layout.
>>
>> Users can explicitly use these types:
>>      pr_info!("{:p}\n", HashedPtr::from(ptr));
>>      pr_info!("{:p}\n", RestrictedPtr::from(ptr));
>>      pr_info!("{:p}\n", RawPtr::from(ptr));
>>
>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
>> ---
>>   rust/helpers/fmt.c     |  65 +++++++++++
> I don't think the new function should be put in rust/helpers/, helpers
> are for macros/inline functions that we cannot directly call via FFI,
> they are basically mapping a Rust bindings call into a C function. So
> the functions defined in rust/helpers/ should be simple, and
> rust_helper_kptr_restrict_value() is not the case. Moreover, seems to me
> that this function basically repeats part of the logic of
> restricted_pointer(), hence it's not a good idea to duplicate this from
> restricted_pointer().
>
> I suggest you introduce a kptr_restrict_value() in lib/vsprintf.c and
> make it EXPORT_GPL_SYMBOL, restricted_pointer() can reuse it as well,
> you will probably need to rework kptr_restrict_value() to be something
> like
>
> 	/*
> 	 * Return `kptr_restrict` (0, 1 or 2) if `*pptr` should be used
> 	 * for print. Otherwise return -1, which indicates the
> 	 * error_string() branch in restricted_pointer().
> 	 */
> 	int kptr_restrict_value(const void **pptr)
>
> and restricted_pointer() can be:
>
> 	static noinline_for_stack
> 	char *restricted_pointer(char *buf, char *end, const void *ptr,
> 				 struct printf_spec spec)
> 	{
> 		int ret = kptr_restrict_value(&ptr);
>
> 		if (ret < 0) {
> 			if (spec.field_width == -1)
> 				spec.field_width = 2 * sizeof(ptr);
> 			return error_string(buf, end, "pK-error", spec);
> 		}
>
> 		if (ret == 0)
> 			return default_pointer(buf, end, ptr, spec);
>
> 		return pointer_string(buf, end, ptr, spec);
> 	}

Thanks for the suggestion. I've already implemented this in v7.

>
>
> With the new kptr_restrict_value() function, you can also avoid reading
> `kptr_restrict` in `RestrictedPtr::fmt`, which is subject to data race
> if I'm not missing anything.
>
> Regards,
> Boqun
>
>>   rust/helpers/helpers.c |   3 +-
>>   rust/kernel/ptr.rs     | 241 ++++++++++++++++++++++++++++++++++++++++-
>>   3 files changed, 305 insertions(+), 4 deletions(-)
>>   create mode 100644 rust/helpers/fmt.c
>>
>> diff --git a/rust/helpers/fmt.c b/rust/helpers/fmt.c
>> new file mode 100644
>> index 0000000000000..4ee716bbfe284
>> --- /dev/null
>> +++ b/rust/helpers/fmt.c
>> @@ -0,0 +1,65 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/*
>> + * Copyright (C) 2018 - 2025 KylinSoft Co., Ltd. All rights reserved.
>> + * Copyright (C) 2018 - 2025 Ke Sun <sunke@kylinos.cn>
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/cred.h>
>> +#include <linux/capability.h>
>> +#include <linux/hardirq.h>
>> +#include <linux/printk.h>
>> +
>> +/*
>> + * Helper function for Rust to format a restricted pointer (%pK).
>> + *
>> + * This function determines what pointer value should be printed based on the
>> + * kptr_restrict sysctl setting:
>> + *
>> + * - kptr_restrict == 0: Returns the original pointer (will be hashed by caller)
>> + * - kptr_restrict == 1: Returns the original pointer if the current process has
>> + *                       CAP_SYSLOG and same euid/egid, NULL otherwise
>> + * - kptr_restrict >= 2: Always returns NULL
>> + *
>> + * Returns:
>> + *   - The original pointer if it should be printed (case 0 or case 1 with permission)
>> + *   - NULL if it should not be printed (no permission, IRQ context, or restrict >= 2)
>> + */
>> +const void *rust_helper_kptr_restrict_value(const void *ptr)
>> +{
>> +	switch (kptr_restrict) {
>> +	case 0:
>> +		/* Handle as %p - return original pointer for hashing */
>> +		return ptr;
>> +	case 1: {
>> +		const struct cred *cred;
>> +
>> +		/*
>> +		 * kptr_restrict==1 cannot be used in IRQ context because the
>> +		 * capability check would be meaningless (no process context).
>> +		 */
>> +		if (in_hardirq() || in_serving_softirq() || in_nmi())
>> +			return NULL;
>> +
>> +		/*
>> +		 * Only return the real pointer value if the current process has
>> +		 * CAP_SYSLOG and is running with the same credentials it started with.
>> +		 * This prevents privilege escalation attacks where a process opens a
>> +		 * file with %pK, then elevates privileges before reading it.
>> +		 */
>> +		cred = current_cred();
>> +		if (!has_capability_noaudit(current, CAP_SYSLOG) ||
>> +		    !uid_eq(cred->euid, cred->uid) ||
>> +		    !gid_eq(cred->egid, cred->gid))
>> +			return NULL;
>> +		break;
>> +	}
>> +	case 2:
>> +	default:
>> +		/* Always hide pointer values when kptr_restrict >= 2 */
>> +		return NULL;
>> +	}
>> +
>> +	return ptr;
>> +}
>> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
>> index 79c72762ad9c4..b6877fe8dafc0 100644
>> --- a/rust/helpers/helpers.c
>> +++ b/rust/helpers/helpers.c
>> @@ -27,8 +27,9 @@
>>   #include "dma.c"
>>   #include "drm.c"
>>   #include "err.c"
>> -#include "irq.c"
>> +#include "fmt.c"
>>   #include "fs.c"
>> +#include "irq.c"
>>   #include "io.c"
>>   #include "jump_label.c"
>>   #include "kunit.c"
>> diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
>> index e3893ed04049d..8b58221c2ec4b 100644
>> --- a/rust/kernel/ptr.rs
>> +++ b/rust/kernel/ptr.rs
>> @@ -1,11 +1,22 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   
>>   //! Types and functions to work with pointers and addresses.
>> +//!
>> +//! This module provides wrapper types for formatting kernel pointers that correspond to the
>> +//! C kernel's printk format specifiers `%p`, `%pK`, and `%px`.
>>   
>> -use core::mem::align_of;
>> -use core::num::NonZero;
>> +use core::{
>> +    fmt,
>> +    fmt::Pointer,
>> +    mem::align_of,
>> +    num::NonZero, //
>> +};
>>   
>> -use crate::build_assert;
>> +use crate::{
>> +    bindings,
>> +    build_assert,
>> +    ffi::c_void, //
>> +};
>>   
>>   /// Type representing an alignment, which is always a power of two.
>>   ///
>> @@ -225,3 +236,227 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
>>   }
>>   
>>   impl_alignable_uint!(u8, u16, u32, u64, usize);
>> +
>> +/// Placeholder string used when pointer hashing is not ready yet.
>> +const PTR_PLACEHOLDER: &str = if core::mem::size_of::<*const c_void>() == 8 {
>> +    "(____ptrval____)"
>> +} else {
>> +    "(ptrval)"
>> +};
>> +
>> +/// Macro to implement common methods for pointer wrapper types.
>> +macro_rules! impl_ptr_wrapper {
>> +    ($($name:ident),* $(,)?) => {
>> +        $(
>> +            impl $name {
>> +                /// Creates a new instance from a raw pointer.
>> +                #[inline]
>> +                pub fn from<T>(ptr: *const T) -> Self {
>> +                    Self(ptr.cast())
>> +                }
>> +
>> +                /// Creates a new instance from a mutable raw pointer.
>> +                #[inline]
>> +                pub fn from_mut<T>(ptr: *mut T) -> Self {
>> +                    Self(ptr.cast())
>> +                }
>> +
>> +                /// Returns the inner raw pointer.
>> +                #[inline]
>> +                pub fn as_ptr(&self) -> *const c_void {
>> +                    self.0
>> +                }
>> +            }
>> +
>> +            impl<T> From<*const T> for $name {
>> +                #[inline]
>> +                fn from(ptr: *const T) -> Self {
>> +                    Self::from(ptr)
>> +                }
>> +            }
>> +
>> +            impl<T> From<*mut T> for $name {
>> +                #[inline]
>> +                fn from(ptr: *mut T) -> Self {
>> +                    Self::from_mut(ptr)
>> +                }
>> +            }
>> +        )*
>> +    };
>> +}
>> +
>> +/// Helper function to hash a pointer and format it.
>> +///
>> +/// Returns `Ok(())` if the hash was successfully computed and formatted,
>> +/// or the placeholder string if hashing is not ready yet.
>> +fn format_hashed_ptr(ptr: *const c_void, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>> +    let mut hashval: crate::ffi::c_ulong = 0;
>> +    // SAFETY: We're calling the kernel's ptr_to_hashval function which handles
>> +    // hashing. This is safe as long as ptr is a valid pointer value.
>> +    let ret = unsafe { bindings::ptr_to_hashval(ptr, core::ptr::addr_of_mut!(hashval)) };
>> +
>> +    if ret != 0 {
>> +        // Hash not ready yet, print placeholder with formatting options applied
>> +        // Using `pad()` ensures width, alignment, and padding options are respected
>> +        return f.pad(PTR_PLACEHOLDER);
>> +    }
>> +
>> +    // Successfully got hash value, format it using Pointer::fmt to preserve
>> +    // formatting options (width, alignment, padding, etc.)
>> +    Pointer::fmt(&(hashval as *const c_void), f)
>> +}
>> +
>> +/// A pointer that will be hashed when printed (corresponds to `%p`).
>> +///
>> +/// This is the default behavior for kernel pointers - they are hashed to prevent
>> +/// leaking information about the kernel memory layout.
>> +///
>> +/// # Example
>> +///
>> +/// ```
>> +/// use kernel::{
>> +///     prelude::fmt,
>> +///     ptr::HashedPtr,
>> +///     str::CString, //
>> +/// };
>> +///
>> +/// let ptr = HashedPtr::from(0x12345678 as *const u8);
>> +/// pr_info!("Hashed pointer: {:016p}\n", ptr);
>> +///
>> +/// // Width option test
>> +/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr))?;
>> +/// let width_30 = cstr.to_str()?;
>> +/// assert_eq!(width_30.len(), 30);
>> +/// # Ok::<(), kernel::error::Error>(())
>> +/// ```
>> +#[repr(transparent)]
>> +#[derive(Copy, Clone, Debug)]
>> +pub struct HashedPtr(*const c_void);
>> +
>> +impl fmt::Pointer for HashedPtr {
>> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>> +        // Handle NULL pointers - print them directly
>> +        if self.0.is_null() {
>> +            return Pointer::fmt(&self.0, f);
>> +        }
>> +
>> +        format_hashed_ptr(self.0, f)
>> +    }
>> +}
>> +
>> +/// A pointer that will be restricted based on `kptr_restrict` when printed (corresponds to `%pK`).
>> +///
>> +/// This is intended for use in procfs/sysfs files that are read by userspace.
>> +/// The behavior depends on the `kptr_restrict` sysctl setting.
>> +///
>> +/// # Example
>> +///
>> +/// ```
>> +/// use kernel::{
>> +///     prelude::fmt,
>> +///     ptr::RestrictedPtr,
>> +///     str::CString, //
>> +/// };
>> +///
>> +/// let ptr = RestrictedPtr::from(0x12345678 as *const u8);
>> +/// pr_info!("Restricted pointer: {:016p}\n", ptr);
>> +///
>> +/// // Width option test
>> +/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr))?;
>> +/// let width_30 = cstr.to_str()?;
>> +/// assert_eq!(width_30.len(), 30);
>> +/// # Ok::<(), kernel::error::Error>(())
>> +/// ```
>> +#[repr(transparent)]
>> +#[derive(Copy, Clone, Debug)]
>> +pub struct RestrictedPtr(*const c_void);
>> +
>> +impl fmt::Pointer for RestrictedPtr {
>> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>> +        // Handle NULL pointers
>> +        if self.0.is_null() {
>> +            return Pointer::fmt(&self.0, f);
>> +        }
>> +
>> +        // Use kptr_restrict_value to handle all kptr_restrict cases.
>> +        // SAFETY: kptr_restrict_value handles capability checks and IRQ context.
>> +        // - Returns NULL if no permission, IRQ context, or kptr_restrict >= 2
>> +        // - Returns the original pointer if kptr_restrict == 0 (needs hashing)
>> +        // - Returns the original pointer if kptr_restrict == 1 with permission (print raw)
>> +        let restricted_ptr = unsafe { bindings::kptr_restrict_value(self.0) };
>> +
>> +        if restricted_ptr.is_null() {
>> +            // No permission, IRQ context, or kptr_restrict >= 2 - print 0
>> +            return Pointer::fmt(&core::ptr::null::<c_void>(), f);
>> +        }
>> +
>> +        // restricted_ptr is non-null, meaning we should print something.
>> +        // SAFETY: Reading kptr_restrict is safe as it's a kernel variable.
>> +        let restrict = unsafe { bindings::kptr_restrict };
>> +
>> +        if restrict == 0 {
>> +            // kptr_restrict == 0: hash the pointer (same as %p)
>> +            format_hashed_ptr(self.0, f)
>> +        } else {
>> +            // kptr_restrict == 1 with permission: print the raw pointer directly (like %px)
>> +            // This matches C behavior: pointer_string() prints the raw address
>> +            Pointer::fmt(&restricted_ptr, f)
>> +        }
>> +    }
>> +}
>> +
>> +/// A pointer that will be printed as its raw address (corresponds to `%px`).
>> +///
>> +/// **Warning**: This exposes the real kernel address and should only be used
>> +/// for debugging purposes. Consider using [`HashedPtr`] or [`RestrictedPtr`] instead.
>> +///
>> +/// # Example
>> +///
>> +/// ```
>> +/// use kernel::{
>> +///     prelude::fmt,
>> +///     ptr::RawPtr,
>> +///     str::CString, //
>> +/// };
>> +///
>> +/// let ptr = RawPtr::from(0x12345678 as *const u8);
>> +///
>> +/// // Basic formatting
>> +/// let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
>> +/// let formatted = cstr.to_str()?;
>> +/// assert_eq!(formatted, "0x12345678");
>> +///
>> +/// // Right align with zero padding, width 30
>> +/// let cstr = CString::try_from_fmt(fmt!("{:0>30p}", ptr))?;
>> +/// let right_zero = cstr.to_str()?;
>> +/// assert_eq!(right_zero, "000000000000000000000x12345678");
>> +///
>> +/// // Left align with zero padding, width 30
>> +/// let cstr = CString::try_from_fmt(fmt!("{:0<30p}", ptr))?;
>> +/// let left_zero = cstr.to_str()?;
>> +/// assert_eq!(left_zero, "0x1234567800000000000000000000");
>> +///
>> +/// // Center align with zero padding, width 30
>> +/// let cstr = CString::try_from_fmt(fmt!("{:0^30p}", ptr))?;
>> +/// let center_zero = cstr.to_str()?;
>> +/// assert_eq!(center_zero, "00000000000x123456780000000000");
>> +/// # Ok::<(), kernel::error::Error>(())
>> +/// ```
>> +#[repr(transparent)]
>> +#[derive(Copy, Clone, Debug)]
>> +pub struct RawPtr(*const c_void);
>> +
>> +impl fmt::Pointer for RawPtr {
>> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>> +        // Directly format the raw address - no hashing or restriction.
>> +        // This corresponds to %px behavior.
>> +        Pointer::fmt(&self.0, f)
>> +    }
>> +}
>> +
>> +// Implement common methods for all pointer wrapper types
>> +impl_ptr_wrapper!(
>> +    HashedPtr,
>> +    RawPtr,
>> +    RestrictedPtr, //
>> +);
>> -- 
>> 2.43.0
>>
