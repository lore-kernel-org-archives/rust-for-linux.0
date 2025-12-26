Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E0E26290
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 08:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766737036; cv=none; b=fvbsKR8Ibz7ZkvuKyWDIubGlspW2XZIPFtrZ0L2RlkY5qWoTMzvrJ+IPv70hTY7jlZKZNcdCbofCxmNhEY3Z/yhnnCC3HtEJOHK276cXL4F8+qrpeAWav4x7pd918oT02EVotd8W29Wcni9IwE1MCe+eK5QjsXnx8XmjHBEOezg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766737036; c=relaxed/simple;
	bh=3tWxT9NMltaNprrENpMSpzIGSyn1IALpAutpmw7Rz/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mma87Dl6uWq0W8KQI+umLOtuXhIxZmcVCnamwEmwSSwYk7SUEpUD505Gr91WTDukOQop0qN9qFZiXvix36MXCG8//dKRLbk2ksrsyEwGrJ5D4QohsgSNA/fBYOFgPOXbUZ8BjbTKhO+uDJGIEd9Z5rAyK86K0u//m6yBsLznYLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXZI/Zc4; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXZI/Zc4"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64b7b737eddso8502607a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 00:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766737033; x=1767341833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0inh1LlZSNsrBEvSly+lToheicxY3dsremTa/LCEFB0=;
        b=IXZI/Zc46FnwdHX6y3jak7oOWSqWeLJTLlER2QMCLSfHII+7QvCkV+5//lXvzdngzx
         noei+p7BJaKmQUuZRTEF+adgS6WQzXQt8hoFbLtdX4zHv0jY1ZEmhJXwLDQcrRepYtcv
         hk4Hwams3+SMSDYic4R5pxo9eGYHAu8wwLyBE+kRRKMAqcWwN3MV/gg37Yhnd9mEZVuC
         4Wb7E2S2W8f8FJIqGxNkbGcpOzex1937UVS0wHswdfY43JNXhrSpDpUntZ4XUwXIiPKx
         sRpsCPze1rFmdq0dCGf5MmYwJwa9Q3qlGQNFPJO+vU2rSJzoHtLnvvpTITKjQflAhnCR
         VWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766737033; x=1767341833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0inh1LlZSNsrBEvSly+lToheicxY3dsremTa/LCEFB0=;
        b=I56gV9ICw3hY49TQEOb+JHNX+CQbXY36W2/xf2gfUn/MtMvqTgnz3/lY/q+Z9/5oS0
         V0FqGlr+zvbvf4tW1ypNiDRZatMPinHjy60D8gNahBqAsV6wb1moFyCxM1V/JchjE/vB
         6IQoOqvxDwP8jxHOGSN9ReOPAzbHvWFm6cKyiwG1WE9X40BDBFOGncRLk1AG+IS/9vQy
         degQdloEdSThGe+sJpZoohgPUdEV2zHqE2/irkX/85YkFwziP52fKRqcuu/6CgR5q66X
         tYhF3O+/TmpsKxwuAgNJVF3FYkGf1nSg5AjjkbQkGZD7QDYyxSILpaTz9SM0hUN7b6Nu
         9FXw==
X-Forwarded-Encrypted: i=1; AJvYcCUcpkBpW93Z258jgWTWLDSOkSh+xW/zaJILWmVQEANNfFeQSTVgyzeN1oAA1XVE7l+p6Q/weXR3+7pfQ1o/Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC8oEFUHngqUX44gok/4uWeTvUqh5XwUw9E+e3R2RYttalwN6G
	nrmkOIHaROlp5yc27sAgaez0XjYwoMvUPKg9a4ktQGK6wueKAWBFVWWA
X-Gm-Gg: AY/fxX6QDYqdvQClsYQFqXZCQGuIPFXjTbT122d2s2nW0PQVUGuZC4nd7e8YSLeFA6Y
	xDpxCxsmtwdCJ+IVWTPtoiuJI4bfVZLfioo6moaGcTDS1uhQ72uDbkSNHH1Y/KjpDi5bVLVSgJ6
	pszviSZEh4i/v9ioLLniYH+PvBEc951sBOSmtmHffzQ2y8IZtZIcMlER2GskWWPZa12w/gpc7GS
	5Uzo0Zc9BPMop0kN0/iJ+769l2tXFJZgvP3LRj1PdKrYrWIFaDc24Q4mE+yiVTGcYBVibQc33WO
	9YC6oToH3HaxskaBgGmQm9AGKM4ZCeUEdkzJVOpt7wHWYXK8idDvJJ3OYZpb/JSspmFgCJiQcN8
	+MN7irQamdXymD7DhkrLBRoiuKvU4IiHiNq8GAkeKqf3+Rl7V51Va4jDfqzhitW/m+zv+YAaWDJ
	b0yELME5phgkPoWjj42u8fqZ+8RJh02Y2WhwKpuY9APPgP4TktxwaByl5qulctk18IYUTZnAREN
	I0IHpLmBf4qC+wQEW6mX0RffY6thtTelT6FgSCtDnUElERyOCfHnwlo
X-Google-Smtp-Source: AGHT+IGCATcAV6/wQmE4ib3yQEu1nLEXvYuRcyQXsRpfrklcsrNaEjCN3wq1QEaVbi6tNUSqeY4WCw==
X-Received: by 2002:a05:6402:2808:b0:649:cec1:6cf1 with SMTP id 4fb4d7f45d1cf-64b8e3bc83emr21595991a12.0.1766737032501;
        Fri, 26 Dec 2025 00:17:12 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:c021:66e1:bdea:4b58? (p200300dfbf2de300c02166e1bdea4b58.dip0.t-ipconnect.de. [2003:df:bf2d:e300:c021:66e1:bdea:4b58])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm22503106a12.31.2025.12.26.00.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 00:17:11 -0800 (PST)
Message-ID: <39a81139-00f0-4721-9be6-7a51072cc310@gmail.com>
Date: Fri, 26 Dec 2025 09:17:09 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] rust: kernel: Add pointer wrapper types for safe
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
References: <20251225225709.3944255-1-sunke@kylinos.cn>
 <20251225225709.3944255-3-sunke@kylinos.cn>
Content-Language: de-AT-frami
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251225225709.3944255-3-sunke@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.12.25 23:57, Ke Sun wrote:
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
>     pr_info!("{:p}\n", RestrictedPtr::from(ptr));
>     pr_info!("{:p}\n", RawPtr::from(ptr));
> 
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>  rust/helpers/fmt.c     |  61 ++++++++++++
>  rust/helpers/helpers.c |   3 +-
>  rust/kernel/ptr.rs     | 215 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 278 insertions(+), 1 deletion(-)
>  create mode 100644 rust/helpers/fmt.c
> 
> diff --git a/rust/helpers/fmt.c b/rust/helpers/fmt.c
> new file mode 100644
> index 0000000000000..9c8991cb8726d
> --- /dev/null
> +++ b/rust/helpers/fmt.c
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/kernel.h>
> +#include <linux/cred.h>
> +#include <linux/capability.h>
> +#include <linux/hardirq.h>
> +#include <linux/printk.h>
> +
> +/*
> + * Helper function for Rust to format a restricted pointer (%pK).
> + *
> + * This function determines what pointer value should be printed based on the
> + * kptr_restrict sysctl setting:
> + *
> + * - kptr_restrict == 0: Returns the original pointer (will be hashed by caller)
> + * - kptr_restrict == 1: Returns the original pointer if the current process has
> + *                       CAP_SYSLOG and same euid/egid, NULL otherwise
> + * - kptr_restrict >= 2: Always returns NULL
> + *
> + * Returns:
> + *   - The original pointer if it should be printed (case 0 or case 1 with permission)
> + *   - NULL if it should not be printed (no permission, IRQ context, or restrict >= 2)
> + */
> +const void *rust_helper_kptr_restrict_value(const void *ptr)
> +{
> +	switch (kptr_restrict) {
> +	case 0:
> +		/* Handle as %p - return original pointer for hashing */
> +		return ptr;
> +	case 1: {
> +		const struct cred *cred;
> +
> +		/*
> +		 * kptr_restrict==1 cannot be used in IRQ context because the
> +		 * capability check would be meaningless (no process context).
> +		 */
> +		if (in_hardirq() || in_serving_softirq() || in_nmi())
> +			return NULL;
> +
> +		/*
> +		 * Only return the real pointer value if the current process has
> +		 * CAP_SYSLOG and is running with the same credentials it started with.
> +		 * This prevents privilege escalation attacks where a process opens a
> +		 * file with %pK, then elevates privileges before reading it.
> +		 */
> +		cred = current_cred();
> +		if (!has_capability_noaudit(current, CAP_SYSLOG) ||
> +		    !uid_eq(cred->euid, cred->uid) ||
> +		    !gid_eq(cred->egid, cred->gid))
> +			return NULL;
> +		break;
> +	}
> +	case 2:
> +	default:
> +		/* Always hide pointer values when kptr_restrict >= 2 */
> +		return NULL;
> +	}
> +
> +	return ptr;
> +}
> +

`git am` complains about

rust: kernel: Add pointer wrapper types for safe pointer formatting
.git/rebase-apply/patch:74: new blank line at EOF.
+

> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 79c72762ad9c4..b6877fe8dafc0 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -27,8 +27,9 @@
>  #include "dma.c"
>  #include "drm.c"
>  #include "err.c"
> -#include "irq.c"
> +#include "fmt.c"
>  #include "fs.c"
> +#include "irq.c"
>  #include "io.c"
>  #include "jump_label.c"
>  #include "kunit.c"
> diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> index e3893ed04049d..2b36968aa90fd 100644
> --- a/rust/kernel/ptr.rs
> +++ b/rust/kernel/ptr.rs
> @@ -1,11 +1,18 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  //! Types and functions to work with pointers and addresses.
> +//!
> +//! This module provides wrapper types for formatting kernel pointers that correspond to the
> +//! C kernel's printk format specifiers `%p`, `%pK`, and `%px`.
>  
> +use core::fmt;
> +use core::fmt::Pointer;
>  use core::mem::align_of;
>  use core::num::NonZero;
>  
> +use crate::bindings;
>  use crate::build_assert;
> +use crate::ffi::c_void;
>  
>  /// Type representing an alignment, which is always a power of two.
>  ///
> @@ -225,3 +232,211 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
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
> +    let mut hashval: crate::ffi::c_ulong = 0;
> +    // SAFETY: We're calling the kernel's ptr_to_hashval function which handles
> +    // hashing. This is safe as long as ptr is a valid pointer value.
> +    let ret = unsafe { bindings::ptr_to_hashval(ptr, core::ptr::addr_of_mut!(hashval)) };
> +
> +    if ret != 0 {
> +        // Hash not ready yet, print placeholder
> +        return f.write_str(PTR_PLACEHOLDER);
> +    }
> +
> +    // Successfully got hash value, format it using Pointer::fmt to preserve
> +    // formatting options (width, alignment, padding, etc.)
> +    // SAFETY: hashval is a valid pointer value from ptr_to_hashval.
> +    Pointer::fmt(&(hashval as *const c_void), f)

CLIPPY=1 complains about:

error: expression has unnecessary safety comment
   --> rust/kernel/ptr.rs:302:5
    |
302 |     Pointer::fmt(&(hashval as *const c_void), f)
    |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |
help: consider removing the safety comment
   --> rust/kernel/ptr.rs:301:8
    |
301 |     // SAFETY: hashval is a valid pointer value from ptr_to_hashval.
    |        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    = help: for further information visit
https://rust-lang.github.io/rust-clippy/rust-1.92.0/index.html#unnecessary_safety_comment
    = note: `-D clippy::unnecessary-safety-comment` implied by `-D
warnings`
    = help: to override `-D warnings` add
`#[allow(clippy::unnecessary_safety_comment)]`

error: aborting due to 1 previous error


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
> +/// use kernel::{ptr::HashedPtr, prelude::fmt, str::CString};

You might want to sort this alphabetically (everywhere).

Same for

(HashedPtr, RestrictedPtr, RawPtr)

in the comments, commit message and macro invocation (I think in the
`use` you have fixed it as mentioned by the kernel test robot).

And please use kernel vertical style:

https://docs.kernel.org/rust/coding-guidelines.html#imports


Dirk
