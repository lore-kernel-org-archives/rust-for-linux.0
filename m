Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3D68821
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 05:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766814981; cv=none; b=BNsMC9w0pndSeu1+QgPkL9Sd0YvqJYpLOhsc/6XZRJZJw6KdFKuSDCQxiP0jJLilxvuIkZIv50gzCcpGPMbXLdLlm/SBqshesNnP5/FJPxxnr6RIF9rl8iifPaWw83BpJxIjsgFeEEc0aaDKEijvymGQX7/300by6gfyyST9jog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766814981; c=relaxed/simple;
	bh=M4SoT+iwGjjUPowjiSOL2xsgu77nkulXNnnVckb5N28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0518ZbJnLe+XBMaYnRPihYl4cJvYyhxtk5W0c53knWRrj449omESCNTUqtlLeBETwDJ1MaFxJ+Iwpre9Z864TKg/JCid4XOwWexEf+roTaOvrmEZTqd5Q5WKhMwQ++fXBgSi12dLWrh6O95rJk5+wukyK/HG+h2/bv1MyvsQcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4sCm9sE; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4sCm9sE"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-88a2f2e5445so97556506d6.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 21:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766814978; x=1767419778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmzwU54Uz/00BopgLF1T4+20o/2kZIolx4V1Or2lvXE=;
        b=M4sCm9sEg02oyzw98Y3pS1+25zXDlu1OcvvEXI/IYbppnD31tnl2AHR58Zjs2qYwkB
         7SJ+m2Ul4VyNHAw+PyqhMmMWYvTd9KzSuPTBc3odEbd/rjgPsIcyKdORZOcoXxlxfm66
         YyJM2bTnNJ8Z+bOapESf/t2Im8XFj8zhlKa1+VJzL/Cg+j9yzq4IcFfBfl/sF1Ht0BhN
         bjpPSxzhX0GYcEKKbelajG1e8L4eMrPoOubKglAz08+0VMdUDNJBIAurA4Sv98vZYeXH
         5qVVLlmTsPCaLWFusnXjaPNMXpXPFsTjfB61gMTe5V+OASvIM+r9c9SghPGrlOUHHdfN
         tMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766814978; x=1767419778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BmzwU54Uz/00BopgLF1T4+20o/2kZIolx4V1Or2lvXE=;
        b=VQWOHQ3QK8X9sC7SOOW84Us0bCalE3YbSF5L8t2Voj7ppelNSStoD3/uSB70bLjzhr
         BqGgRdi8xyFv4MJRF1RfMiUKHFE4df5Ii1qfLqokixX4vXwePq489pMup5Jt6N4rtobm
         mlL6LDH3ApfC87aQMCjcr2gKvCyEQLe3FbwNNABTxiJUln1XuB+dqxeSwwbqE2KUEgSe
         RnLUnVtZ420EXHUD5Kmb94RiiU1oxEciQvuyD0vb3h1LtIWROtOyMREXxAatJZKyCs/n
         2kxNQP0gY75orFji925VjsPX4oau9ygRBxmHFtpOk9IvIiQY+5ZBDcvaliPMhn/2v7cg
         AqjA==
X-Forwarded-Encrypted: i=1; AJvYcCWczG9R/XeNWMqvSckM9LKUBXPSX6eq96s6GtROUN/CoBfXKcLuLN26OI4SJpKgk8/F1ZB2mmGXqy6HTvOrrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9V4sLcB3zAapSmiw7yXzOJ8iSFDEzxuacT5ymE2RiuKa/Uk9K
	g6m+z7As9jceJ+r5ySFKLtSCBfj/2hZ/LM5+oxIpopxma03/8kqevMox
X-Gm-Gg: AY/fxX61Y9aOnI3tNY+v6O7A9so7Dl4pxIy6O6Wjb0Df7wWwDcfrjfwl2T36MrSmfJj
	MTd69gQ3+x0Bjs+jSGdAvvPEtYzkqGK0sWT/P4aI33NXnZHvGbpzu56z5Jsw06VgFpVoupyS7aZ
	sCPznJbjJAe1862VVweKwi3zJQac9DQE74yKwQz+UkSaf92FWXcsIFd+hGiQEyjUtyYayVvDjPo
	PSxZYCT73GI6GxHaxRbmtje01GLycTC+difKBC1z863hwGtH5xZ7WaybrN+XXphqi+kmZGDBur7
	0xHMX8sFL/Xne1QTbGoTboK/kOWcOaakIWeWl7RAZrfDQ81k2UXYCUnbVUC72e7f3jHfzjuOLWm
	uJMArUmc77GPi71JgQ+I06Qwcwy3ccCybDli9NJEb8CFWxBl6aX6u6vtMOi0uU0Vwre7XF8Dnr2
	87X9MEET2BmOUrsxXm3JgVnO8SBLDvhMOk49I2nsHrAPiM2Fqw8rP47honBPUUz8wIq2LfESAnV
	fb5QeTQYB2BoTw=
X-Google-Smtp-Source: AGHT+IG9mBEGbCFLPuuUN8lzCPWFdBxoKlfmkNOQg7CtadacORd7E8I3UE156ak6FlVg1n0+cDnv1A==
X-Received: by 2002:ad4:5bad:0:b0:880:498e:a63e with SMTP id 6a1803df08f44-88d81662839mr501791926d6.2.1766814977606;
        Fri, 26 Dec 2025 21:56:17 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a44fe52sm183411256d6.45.2025.12.26.21.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 21:56:17 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8A40CF40068;
	Sat, 27 Dec 2025 00:56:16 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 27 Dec 2025 00:56:16 -0500
X-ME-Sender: <xms:AHVPaey2fyJYi96quk7Wpf2tI5QxMpGBR2XZV2x6Ux9mdg_VfmyZVQ>
    <xme:AHVPaYwoz5emUbDFiPEUSbqs3NlM3P86prsDlkYejgUFoLDYElBhxipFWsMEHG8qk
    muRfwG95_nkcoKrpJuJwtxPPyvLtlRkv54SG3FPx85RrCeIGrMoxQ>
X-ME-Received: <xmr:AHVPaXInrgBISKCn1xvjE6pKhIBRO01vdJWOVV8L6G2I0Fhjq7hHFvL8Gov0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejtdehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepshhunhhkvgeskhihlhhinhhoshdrtghnpdhrtghpthhtohepughirhhkrdgsvg
    hhmhgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepphhmlhgruggvkhesshhushgvrdgtohhmpdhrtghpthhtoheprh
    hoshhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtthhopehtthgrsghisehnvhhi
    ughirgdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgr
    rhihghhuohdrnhgvth
X-ME-Proxy: <xmx:AHVPaUiDFczhOSzFh1hiLM8Zl5qdnitNSx6LFKIj-_iRXPxAFtBUBw>
    <xmx:AHVPaYPTen9kjSxhvzK3ahBUg8-GVdvhECR_aesrgGu_9APMzglWcA>
    <xmx:AHVPaf4-UHTMJtmXGLiJ4YOvis5FREqCbFfpu5bouRRXmUH0Heod0w>
    <xmx:AHVPafkLmNNI9LwxP6rpuyE2hFUFu9_pIgX4kSgios-HU5_WaLKqUw>
    <xmx:AHVPafKYjFfq7zX9uz7phjBWomvkYtCnnBjAbOUOltYuaZQ2JO4Qt6qi>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 Dec 2025 00:56:15 -0500 (EST)
Date: Sat, 27 Dec 2025 13:56:11 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Ke Sun <sunke@kylinos.cn>
Cc: Dirk Behme <dirk.behme@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>, Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 2/4] rust: kernel: Add pointer wrapper types for safe
 pointer formatting
Message-ID: <aU90-0sVL81fJ2ON@tardis-2.local>
References: <20251227033958.3713232-1-sunke@kylinos.cn>
 <20251227033958.3713232-3-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227033958.3713232-3-sunke@kylinos.cn>

On Sat, Dec 27, 2025 at 11:39:53AM +0800, Ke Sun wrote:
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

I don't think the new function should be put in rust/helpers/, helpers
are for macros/inline functions that we cannot directly call via FFI,
they are basically mapping a Rust bindings call into a C function. So
the functions defined in rust/helpers/ should be simple, and
rust_helper_kptr_restrict_value() is not the case. Moreover, seems to me
that this function basically repeats part of the logic of
restricted_pointer(), hence it's not a good idea to duplicate this from
restricted_pointer().

I suggest you introduce a kptr_restrict_value() in lib/vsprintf.c and
make it EXPORT_GPL_SYMBOL, restricted_pointer() can reuse it as well,
you will probably need to rework kptr_restrict_value() to be something
like

	/*
	 * Return `kptr_restrict` (0, 1 or 2) if `*pptr` should be used
	 * for print. Otherwise return -1, which indicates the
	 * error_string() branch in restricted_pointer().
	 */
	int kptr_restrict_value(const void **pptr)

and restricted_pointer() can be:

	static noinline_for_stack
	char *restricted_pointer(char *buf, char *end, const void *ptr,
				 struct printf_spec spec)
	{
		int ret = kptr_restrict_value(&ptr);

		if (ret < 0) {
			if (spec.field_width == -1)
				spec.field_width = 2 * sizeof(ptr);
			return error_string(buf, end, "pK-error", spec);
		}

		if (ret == 0)
			return default_pointer(buf, end, ptr, spec);

		return pointer_string(buf, end, ptr, spec);
	}


With the new kptr_restrict_value() function, you can also avoid reading
`kptr_restrict` in `RestrictedPtr::fmt`, which is subject to data race
if I'm not missing anything.

Regards,
Boqun

>  rust/helpers/helpers.c |   3 +-
>  rust/kernel/ptr.rs     | 241 ++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 305 insertions(+), 4 deletions(-)
>  create mode 100644 rust/helpers/fmt.c
> 
> diff --git a/rust/helpers/fmt.c b/rust/helpers/fmt.c
> new file mode 100644
> index 0000000000000..4ee716bbfe284
> --- /dev/null
> +++ b/rust/helpers/fmt.c
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Copyright (C) 2018 - 2025 KylinSoft Co., Ltd. All rights reserved.
> + * Copyright (C) 2018 - 2025 Ke Sun <sunke@kylinos.cn>
> + */
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
> index e3893ed04049d..8b58221c2ec4b 100644
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
> @@ -225,3 +236,227 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
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
> +        // Hash not ready yet, print placeholder with formatting options applied
> +        // Using `pad()` ensures width, alignment, and padding options are respected
> +        return f.pad(PTR_PLACEHOLDER);
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
> +#[repr(transparent)]
> +#[derive(Copy, Clone, Debug)]
> +pub struct HashedPtr(*const c_void);
> +
> +impl fmt::Pointer for HashedPtr {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        // Handle NULL pointers - print them directly
> +        if self.0.is_null() {
> +            return Pointer::fmt(&self.0, f);
> +        }
> +
> +        format_hashed_ptr(self.0, f)
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
> +/// use kernel::{
> +///     prelude::fmt,
> +///     ptr::RestrictedPtr,
> +///     str::CString, //
> +/// };
> +///
> +/// let ptr = RestrictedPtr::from(0x12345678 as *const u8);
> +/// pr_info!("Restricted pointer: {:016p}\n", ptr);
> +///
> +/// // Width option test
> +/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr))?;
> +/// let width_30 = cstr.to_str()?;
> +/// assert_eq!(width_30.len(), 30);
> +/// # Ok::<(), kernel::error::Error>(())
> +/// ```
> +#[repr(transparent)]
> +#[derive(Copy, Clone, Debug)]
> +pub struct RestrictedPtr(*const c_void);
> +
> +impl fmt::Pointer for RestrictedPtr {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        // Handle NULL pointers
> +        if self.0.is_null() {
> +            return Pointer::fmt(&self.0, f);
> +        }
> +
> +        // Use kptr_restrict_value to handle all kptr_restrict cases.
> +        // SAFETY: kptr_restrict_value handles capability checks and IRQ context.
> +        // - Returns NULL if no permission, IRQ context, or kptr_restrict >= 2
> +        // - Returns the original pointer if kptr_restrict == 0 (needs hashing)
> +        // - Returns the original pointer if kptr_restrict == 1 with permission (print raw)
> +        let restricted_ptr = unsafe { bindings::kptr_restrict_value(self.0) };
> +
> +        if restricted_ptr.is_null() {
> +            // No permission, IRQ context, or kptr_restrict >= 2 - print 0
> +            return Pointer::fmt(&core::ptr::null::<c_void>(), f);
> +        }
> +
> +        // restricted_ptr is non-null, meaning we should print something.
> +        // SAFETY: Reading kptr_restrict is safe as it's a kernel variable.
> +        let restrict = unsafe { bindings::kptr_restrict };
> +
> +        if restrict == 0 {
> +            // kptr_restrict == 0: hash the pointer (same as %p)
> +            format_hashed_ptr(self.0, f)
> +        } else {
> +            // kptr_restrict == 1 with permission: print the raw pointer directly (like %px)
> +            // This matches C behavior: pointer_string() prints the raw address
> +            Pointer::fmt(&restricted_ptr, f)
> +        }
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
> +/// use kernel::{
> +///     prelude::fmt,
> +///     ptr::RawPtr,
> +///     str::CString, //
> +/// };
> +///
> +/// let ptr = RawPtr::from(0x12345678 as *const u8);
> +///
> +/// // Basic formatting
> +/// let cstr = CString::try_from_fmt(fmt!("{:p}", ptr))?;
> +/// let formatted = cstr.to_str()?;
> +/// assert_eq!(formatted, "0x12345678");
> +///
> +/// // Right align with zero padding, width 30
> +/// let cstr = CString::try_from_fmt(fmt!("{:0>30p}", ptr))?;
> +/// let right_zero = cstr.to_str()?;
> +/// assert_eq!(right_zero, "000000000000000000000x12345678");
> +///
> +/// // Left align with zero padding, width 30
> +/// let cstr = CString::try_from_fmt(fmt!("{:0<30p}", ptr))?;
> +/// let left_zero = cstr.to_str()?;
> +/// assert_eq!(left_zero, "0x1234567800000000000000000000");
> +///
> +/// // Center align with zero padding, width 30
> +/// let cstr = CString::try_from_fmt(fmt!("{:0^30p}", ptr))?;
> +/// let center_zero = cstr.to_str()?;
> +/// assert_eq!(center_zero, "00000000000x123456780000000000");
> +/// # Ok::<(), kernel::error::Error>(())
> +/// ```
> +#[repr(transparent)]
> +#[derive(Copy, Clone, Debug)]
> +pub struct RawPtr(*const c_void);
> +
> +impl fmt::Pointer for RawPtr {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        // Directly format the raw address - no hashing or restriction.
> +        // This corresponds to %px behavior.
> +        Pointer::fmt(&self.0, f)
> +    }
> +}
> +
> +// Implement common methods for all pointer wrapper types
> +impl_ptr_wrapper!(
> +    HashedPtr,
> +    RawPtr,
> +    RestrictedPtr, //
> +);
> -- 
> 2.43.0
> 
