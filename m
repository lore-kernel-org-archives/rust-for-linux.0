Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFED338DD3
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 09:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766999007; cv=none; b=qffpef3j4gYzX6qzzC3uNu2FUh5Y5Jn1dE2JwYZveX8H9EMGM3bVFjwnTRXJQBZIcFRgsO/tYnzh9YANZWooKEBCP9buPopUAZsC6yhSVWotAyAnbIp+QkvlduF3pCsthOmzr/duGIFnbqruU7f3PJ+iJBPBUJTCnDINt9osP5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766999007; c=relaxed/simple;
	bh=7o97vxRS4vjSOCJNKyML2SpAQbax77jjV4E2waXoKRs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CJKlLVGRqYfBX+UCck4kjB6ZabLGcxBp+rV59a1iXT8TjevzDmShdXJ8Ceb4gJ4vhZI/4GdHXEjLB2j3NZ1x7hbXPAKQjTNMN9KKEaEUArIX21CTDZa5+nhrkPMNkmLbAjOF1gBeNQpu7LeHzXf2lZGl93JXP1wMOMLNaVRZqcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f8ct1Egz; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f8ct1Egz"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47a97b719ccso52983945e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 01:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766999004; x=1767603804; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XzDzUqoZnCAv+iT1q6k8Xmojj7AGHfxoK93t2A1q4TI=;
        b=f8ct1EgzZMNWbYE5b6mpDMFnzJDqRACnAYLRF1y8nCbtZUOpGP4X9TumLE1RkYaSPh
         KVHmkmQNbjsKKdE6dwvkC0yTRe5tkiXG3TcZkBTduheTwcd6YTtDXJqbv/nwwsgZwnGt
         90abE2v+R9jqT/W8H9FUXzuWDr/ObOCAPXvVnnXbYI7WBHfTyE4vzvGknzKxNCXHusn1
         2eUgnbca3kSVAbuF9nJTTZ7TVH2FKsueHZibYCy4Vdut1T64kiWUW5gS9uW3IBfn1L0v
         IcMO4XYLH8kgD7Dejz5qIW55UUv+bGbflq0ViBZvHX3XS6IddiawVk68h6464eTjrkM1
         2q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766999004; x=1767603804;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XzDzUqoZnCAv+iT1q6k8Xmojj7AGHfxoK93t2A1q4TI=;
        b=GniH5vrPRIubIaBQA++2L8iCEj+Jf+iBDImovD/cNe/aRTBFHUjvD/wFUXqI3aY6TC
         p8+VRiVcm9Sa2Z1gQ3l/Hxuy5pM+G60pLBtBycuHajzS5bVR6+Hj5oSGNFJ9auesApcr
         uSdEKI6nLEP7HHez9NQfOHb7f1T2kQxM2VZKqleOMqPdBp4JaroZZc8lY8hAULl1BCvq
         nw9f3z9Oo5h2JgvS7cqWHFcub1Szk0LXcJic4MfUSl2D2gD4kj2Q11I4dd7ThEqW4cwl
         P3lSrUiPgj4F0BVWnMcea1ThBLkGL6W1cA7ydkNLtM3kmwKr1YrfIaYFmDYLDL8C6Js0
         KQ1A==
X-Forwarded-Encrypted: i=1; AJvYcCVMwlRh1XoV/d9zbzT8EiH5FUQiZmuUXxD1mxXKkjOIKJUM1Gci8SCNN0ioDEPQX9am/Xal839nqB6HI+nceg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy848cqUoMfTsro8TF2m9xrVNlM+mQOMQjYTEaiwL2Z3IWIPJB7
	s/FjP3raL7KwYNrFJbXOmloT6jH3fDrqEYkEu6qqKKUZTp10sCkf/sJLiY5eLj/T8dT/MTZ4o/G
	SttHuF2QVa3nLWWfXBA==
X-Google-Smtp-Source: AGHT+IHkysAorjf0CGraM8GpwG0LHoxaXqABPs3QgmbsX9qZZXOwQJrVd2Q6nENTiKAmb+RjnKXEbbMY+EGplvA=
X-Received: from wmph10.prod.google.com ([2002:a05:600c:498a:b0:477:a148:c6bf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8287:b0:479:3a89:121e with SMTP id 5b1f17b1804b1-47d1959d0cfmr287987255e9.37.1766999004158;
 Mon, 29 Dec 2025 01:03:24 -0800 (PST)
Date: Mon, 29 Dec 2025 09:03:23 +0000
In-Reply-To: <20251229072157.3857053-3-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251229072157.3857053-1-sunke@kylinos.cn> <20251229072157.3857053-3-sunke@kylinos.cn>
Message-ID: <aVJD2z7p93NlEg0o@google.com>
Subject: Re: [PATCH v7 2/4] rust: kernel: Add pointer wrapper types for safe
 pointer formatting
From: Alice Ryhl <aliceryhl@google.com>
To: Ke Sun <sunke@kylinos.cn>
Cc: Dirk Behme <dirk.behme@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	John Ogness <john.ogness@linutronix.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>, Ke Sun <sk.alvin.x@gmail.com>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Dec 29, 2025 at 03:21:20PM +0800, Ke Sun wrote:
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

These ::from calls are inconvenient. Why not just make the field public
and let users write:

	pr_info!("{:p}\n", HashedPtr(ptr));
	pr_info!("{:p}\n", RestrictedPtr(ptr));
	pr_info!("{:p}\n", RawPtr(ptr));

If the only concern is casts, then just make the struct generic:

	pub struct HashedPtr<T>(pub *const T);

Since *mut T will automatically downgrade to *const T, this should allow
HashedPtr(ptr) to work with any raw pointer.

> -use crate::build_assert;
> +use crate::{
> +    bindings,
> +    build_assert,
> +    ffi::c_void, //
> +};

Please use prelude::* instead of ffi::c_void.

>  /// Type representing an alignment, which is always a power of two.
>  ///
> @@ -225,3 +236,240 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
>  }
>  
>  impl_alignable_uint!(u8, u16, u32, u64, usize);
> +
> +/// Placeholder string used when pointer hashing is not ready yet.
> +const PTR_PLACEHOLDER: &str = if core::mem::size_of::<*const c_void>() == 8 {

size_of is in the kernel prelude.

> +impl fmt::Pointer for RestrictedPtr {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        // Handle NULL pointers
> +        if self.0.is_null() {
> +            return Pointer::fmt(&self.0, f);
> +        }
> +
> +        // Use kptr_restrict_value to handle all kptr_restrict cases.
> +        // - Returns 0: kptr_restrict == 0, use original pointer (needs hashing)
> +        // - Returns 1: kptr_restrict == 1, *pptr may be modified to NULL if no permission
> +        // - Returns 2: kptr_restrict >= 2, *pptr is set to NULL
> +        // - Returns -1: IRQ context with kptr_restrict == 1 (error case)
> +        let mut ptr_value = self.0;
> +        // SAFETY: kptr_restrict_value handles capability checks and IRQ context.
> +        // It may modify ptr_value to NULL if there's no permission.
> +        let ret = unsafe { bindings::kptr_restrict_value(core::ptr::addr_of_mut!(ptr_value)) };

Simplifies to:

	let ret = unsafe { bindings::kptr_restrict_value(&raw mut ptr_value) };

or even:

	let ret = unsafe { bindings::kptr_restrict_value(&mut ptr_value) };

> +        match ret {
> +            -1 => {
> +                // IRQ context with kptr_restrict == 1 - print error placeholder
> +                // This should not happen in normal Rust code, but handle it gracefully
> +                f.pad("(pK-error)")

Why can't this happen in Rust code? Rust can run in IRQ context.

> +            }
> +            0 => {
> +                // kptr_restrict == 0: hash the pointer (same as %p)
> +                format_hashed_ptr(self.0, f)
> +            }
> +            1 => {
> +                // kptr_restrict == 1: print raw pointer if ptr_value is non-null,
> +                // otherwise print 0 (no permission)
> +                if ptr_value.is_null() {
> +                    Pointer::fmt(&core::ptr::null::<c_void>(), f)
> +                } else {
> +                    // Print the raw pointer directly (like %px)
> +                    // This matches C behavior: pointer_string() prints the raw address
> +                    Pointer::fmt(&ptr_value, f)
> +                }
> +            }
> +            _ => {
> +                // kptr_restrict >= 2: always print 0
> +                // ptr_value should already be NULL, but check to be safe
> +                Pointer::fmt(&core::ptr::null::<c_void>(), f)
> +            }
> +        }
> +    }
> +}

Alice
