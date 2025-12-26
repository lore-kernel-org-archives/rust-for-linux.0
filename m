Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11181D63EF
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 15:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766761812; cv=none; b=mHkeLiV8Fxx/SNUEwrbH4/6dxrGJz1iJejEKn1KTRM4G6ljG5O99+rjrRt0yONWnO1bgAvF41EkgmbHjHyXVt11JtgRIxHa/MOg9TBghDKyqliQK7yu0bwlY79U8N711EgtcRUy/sD90I4BWE1nNYUT+CAsG11KWJFEDiRJ7L3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766761812; c=relaxed/simple;
	bh=9cJ5qY6CSdJWPEcWxBMLinhj9l6uacWLavuZ9cqDIJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIjhpwlJpsrPeOLrNj58iZD7irAjApSc21mhjE+pDc6rFv4BJ8IHzd12esXiSeNqtrabsNewCZJhtVLOX+bgfQFneum41ASLh+zZBfKB7MIAVzJ4l08rUfyB608SpSK3bDEPxBc12oZNb6lJpQ6E5uwYdVFi2o853Z/e8WGsJUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PV0wtTEX; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PV0wtTEX"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so1614186866b.2
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 07:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766761809; x=1767366609; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Li6nID7Dm0vkPKdmH0SYT2o0ZF8gILQbk9Xv2tEcANI=;
        b=PV0wtTEXwh2DaIQSUMHWSL3gi+RMWoRwcO42f2BKSQKfSm2PA2Iu46Lrb2OfLbYtSV
         p/opHaWLCyiNv06rL4YWFTSZgPpRUlKbFvWJmVZ0A0rIcakxs8OXcUoo6u8NA+FA/ICu
         3xShxByO8BCwBGtoprY86Ck0mE2QJvouxIyr9HSmmWNTLwV7SLIM21YjCmVjCAXxBvQW
         bFPMxboC1iWQZT0nlTsgTdJE9hcpsLNb4gKH18OtJPM+QyhXAdsj4ir54xtDXL4QX8jF
         TJQE8vkSPNoWi6lmWlNcGOsQFppo1n3+AtOmR15uILNmRU/kMCNfyFxbRvHhzEwKICDK
         07Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766761809; x=1767366609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Li6nID7Dm0vkPKdmH0SYT2o0ZF8gILQbk9Xv2tEcANI=;
        b=dySxBonNWIiAjP0IRUpuTXH33J5vyZE00QyiNiVnE6LC3SQsrLMEaGYIqnVDsRWwpd
         +3HxwtF8vh1ZiazolGS8xRTHtG21pRU/Poo6ovQ7gJkqDu66Tkuls9JpicrnFcimWuX9
         +pz7edgC4e67ihdRR8omeuC2G0uPPp43NyBf+MHK0WmgaZFusa4c3Rq5cMEEmKFm/VtR
         cd9nyDYoC1WNQHpCnbCLBXTsL8bP6pDy3rosPrmLAHa7yKlvIEM45npt272Bojzad1VA
         BiLRn8BUm2aDHRUKTy4BdxmDAnH6T6OjwnFmddoqLyBjTngUI5OJ2I4JQHi18ei3II3q
         1ENA==
X-Forwarded-Encrypted: i=1; AJvYcCXpxS15CdjMBKQ0xd+UcZuYe2Y0P+2nKdt+N2tTNvjr4MNxSITyBaplA3zJbSICCBT+dpwolyuucSGFiQ81lA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsQNL8o3zcmvKgis9K+gM/Yi/Z2egk+fR0V7jrS6fjzm4ukYJ7
	Y3QKQCTsdgXaESg2JE9LPkAuPjobY/2xtRUCK8TAUrdVsBiFDTnviNrA
X-Gm-Gg: AY/fxX4NsTPg09PMS1Ox468oDFv5dqHXFoKENg5CqSunSmawmI1ufs4lGgQY8yQqD3Z
	+a5BDer4Hgjn3zrTyhaMIM3I263iGNN227w6GArDzPDSjXy4kjfer1MQB16vK0h8pOXCfGRH3zz
	j4FQR7kCvw9sYUGVwIGNMWRCQ1A9R9sUe8mwP9xlD4Qxm53KvBs04Kg06RYl67/ALgzhQq7BC9h
	syTUV72r/601wJoID97R+TjEarBVVHUlanGHwXTUZoch0T7JkgX8tvXiLDlRz344PCBRvhCowHb
	394FbpcOzKFci0yjk3SWH6J6EtvnPMoSvrSAOZquLdFvXxtQ+hCa8foYIKqonHqJvGcg5yjuwJC
	BndUdD/svISgEVM8GW3YZTvTUGyFda8MU75iM08Gqj48Od624w22zjg8rbiOGWzD6s+Cy9qsvRk
	/KiOuoeblHFCLTOjkp3pghbM18UHQiAq+qNQ22TAUxrjuuu06jNPV7mhDCwVxhjGkNCmNaeL5aU
	5JzzGIYI4KqdUs0NTIGU8VPrsvZsq1/DO68noXOKNQajg==
X-Google-Smtp-Source: AGHT+IFF3wxJjr2teMyI6xAeqH8enn81h90yFaKuH5/HmUEa3MwyEL+ShxML9eJ4710QnAKpzhsuzQ==
X-Received: by 2002:a17:906:99c3:b0:b79:f9b4:4c5d with SMTP id a640c23a62f3a-b803715359emr2518098566b.39.1766761808675;
        Fri, 26 Dec 2025 07:10:08 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:c021:66e1:bdea:4b58? (p200300dfbf2de300c02166e1bdea4b58.dip0.t-ipconnect.de. [2003:df:bf2d:e300:c021:66e1:bdea:4b58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f37edasm2376025266b.58.2025.12.26.07.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 07:10:08 -0800 (PST)
Message-ID: <fb0f146c-8d0d-47e0-82ae-e815eb9bd2dc@gmail.com>
Date: Fri, 26 Dec 2025 16:10:06 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] rust: kernel: Add pointer wrapper types for safe
 pointer formatting
To: Ke Sun <sunke@kylinos.cn>, Miguel Ojeda <ojeda@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Benno Lossin <lossin@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>,
 Ke Sun <sk.alvin.x@gmail.com>, rust-for-linux@vger.kernel.org
References: <20251226140751.2215563-1-sunke@kylinos.cn>
 <20251226140751.2215563-3-sunke@kylinos.cn>
Content-Language: de-AT-frami
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251226140751.2215563-3-sunke@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.12.25 15:07, Ke Sun wrote:
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
>  rust/helpers/fmt.c     |  65 +++++++++++
>  rust/helpers/helpers.c |   3 +-
>  rust/kernel/ptr.rs     | 240 ++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 304 insertions(+), 4 deletions(-)
>  create mode 100644 rust/helpers/fmt.c
....
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
> index e3893ed04049d..ed5069c954146 100644
> --- a/rust/kernel/ptr.rs
> +++ b/rust/kernel/ptr.rs
> @@ -1,11 +1,22 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  //! Types and functions to work with pointers and addresses.
> +//!
> +//! This module provides wrapper types for formatting kernel pointers that correspond to the
> +//! C kernel's printk format specifiers `%p`, `%pK`, and `%px`.
>  
> -use core::mem::align_of;
> -use core::num::NonZero;
> +use core::{
> +    fmt,
> +    fmt::Pointer,
> +    mem::align_of,
> +    num::NonZero, //
> +};
>  
> -use crate::build_assert;
> +use crate::{
> +    bindings,
> +    build_assert,
> +    ffi::c_void, //
> +};
>  
>  /// Type representing an alignment, which is always a power of two.
>  ///
> @@ -225,3 +236,226 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
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
> +    Pointer::fmt(&(hashval as *const c_void), f)
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
> +/// use kernel::{
> +///     prelude::fmt,
> +///     ptr::HashedPtr,
> +///     str::CString, //
> +/// };
> +///
> +/// let ptr = HashedPtr::from(0x12345678 as *const u8);
> +/// pr_info!("Hashed pointer: {:016p}\n", ptr);
> +///
> +/// // Width option test
> +/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr))?;
> +/// let width_30 = cstr.to_str()?;
> +/// assert_eq!(width_30.len(), 30);
> +/// # Ok::<(), kernel::error::Error>(())
> +/// ```


Is this intended?

[    1.932037]     # rust_doctest_kernel_ptr_rs_6.location:
rust/kernel/ptr.rs:315
[    1.932322] rust_doctests_kernel: Hashed pointer: (____ptrval____)
[    1.933032]     # rust_doctest_kernel_ptr_rs_6: ASSERTION FAILED at
rust/kernel/ptr.rs:329
[    1.933032]     Expected width_30.len() == 30 to be true, but is false
[    1.933892]     not ok 179 rust_doctest_kernel_ptr_rs_6


[    1.934097]     # rust_doctest_kernel_ptr_rs_7.location:
rust/kernel/ptr.rs:353
[    1.934434] rust_doctests_kernel: Restricted pointer: (____ptrval____)
[    1.934707]     # rust_doctest_kernel_ptr_rs_7: ASSERTION FAILED at
rust/kernel/ptr.rs:367
[    1.934707]     Expected width_30.len() == 30 to be true, but is false
[    1.935156]     not ok 180 rust_doctest_kernel_ptr_rs_7

This is v5 on top of v6.19-rc1 with x86_64_defconfig booting on QEMU.

Cheers

Dirk
