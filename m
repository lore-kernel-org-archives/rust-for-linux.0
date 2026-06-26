Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085963BF694
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 20:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507182; cv=none; b=ak/RAvvwYX9ZAS3Q7/On6vgNMsaTwZuewVqZ0AU76jOtl/v50w5VuqCPSCfb2FddemxQMo4YLUxI44PhXz7fBXKV4xgDRl2442lmBHk2yx4VAIVMlm6dJqWywQh0q5Pslmo8CcdC3eruk9HvsGwuZvCzOXCv5wIVqsozndJ6xcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507182; c=relaxed/simple;
	bh=gXW3dCe4WC3+rTR/lWPp+8k43M2LpCggBbClN6estak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZtIvX23ve/YvDxG+/grk8US1ymxrpTQ9L18IsbwVq/fk7cbzKYdL6EMjtknt0oxakxhJRGgHMBxVoHAJgKH2Q47S/dkRiKt2ClQW6Axr3BbOfCk491joWl042Fv5YZmi/IhvURi6CIGWSZFDasKg6tBoaKAsfoaxD9AXDLya0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UH/IrBm2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UH/IrBm2"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c813a45a65so3535ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 13:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782507180; x=1783111980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dS/M2HRldoM7WFjsowGr4rjNFpNg1xpcvyBkf4LjNgo=;
        b=UH/IrBm2vfd8OYeKRXL99VXP94ysFVLpUY1uWJzuHw42MLYkeMfaA908PaKk75SKxM
         98tzaRxUn9xiKrQ0P5IA85o+CbOr27Ihjbei37uX6lEa0EYxZznhkjNBmT78GeCKBBxY
         UL3/5ICgq45Zhz4FjJxsD0zJSvT5qUxILloDU6id4Qmo4AfEXQLmowVWl0+XvELKyaTP
         sjUuRnat7aPq46yuI/AnJvOGpVFRIeKYznVFphZPpGufr61HD4jF04wNpA2xe7N+Imng
         vaw6ON1jEmYhAOR1nY8bK3TCd7PHPgF2s6N7OVbwsNiVmQjSC1D1iVeI689RJQeQNpvY
         z+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782507180; x=1783111980;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dS/M2HRldoM7WFjsowGr4rjNFpNg1xpcvyBkf4LjNgo=;
        b=IzKMJtC5o1Fu1Li1KjyUSI+f7wcIIhybabnVk4AOpAOnrHR1j8aFLGoyBHq4zwAX95
         U3o5wnEhhvbgegy2WeH4lEwOuBsZJFcJBVuvh2AdVw8Egg9P84pc5ixtZiCQlAxob9lo
         OLrufDfSAjtpwKF/3ob95rj1ODALBY8s2U9yF9aC5Ebf37Z/dgiDpCGfzJN8OglpVIl/
         4oF7t8iiDqlPoQrS+2K+lZJ9OSMWOEYLAMe0AFHHH1NPhPMTalXUS983C85j+NYIKTjx
         gTYtbNEC5LPuZZoSxCdiv69phg1zPZe8iEddAFIh24s0w+uKYkpDMpZ0dzWExhOHVFmQ
         3nNA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2HqOvykD8hZJEYD1jIfCeNEzatxq+6MIIcvUs44lqkjl5ix1rVVvZqChZNDyWh87TKTNn6fjLZG3cHuepSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3t3Ew3GO30ZWqSJRxDhPeRURkTBfJVw9CmjSveiHC6zbIPWQU
	Bbwe580PHBszKMhN2e6lidYtevuKiDJ+Wadt+/Z5JhHfr4WFTpU2QbM+hzUKYDB3Rw==
X-Gm-Gg: AfdE7cmhZ5Rk1pYq5Vvh5pvocoYxmkeDkx7BjJfYmldzgXHSASaH8gtc+YRSpXIPvuB
	XWQUHcYqvYt217OTMLuK8qBM1+Gmd5DWgN3tF2H2aFnn9iUGeGFNNlNA5ad1ioYqglM3jHcC8+A
	2LiVRMZp6HqehRUtP4qSlRcylbTTYfkR2LkDbBaPO/7FsDtzGKBg8AImPCWdBenMwrB+n6hNf7n
	H+zJ2UBOmfM+UNr/+zzdJPRqF3k4T9kPqRXNW53Zey4wMh3E/OXpBFVnIIyMKq7ujaMxoqQT2za
	mUxglsDixnWBsGivlcVFAgcNdIPwXP2i+OdL3NQfNMlk6eWy2CbzNEVM41I2o+t8f7Wgsq/2uHc
	MS4ye3a/BRqBiNT4unYctZitZ2S9GzXD5zeYF9R07idNby+thTZrGYzbGqT+MEIfFaPz6KoODHF
	66cALRiCBz0r9+ZOj/Otr9DBj86BlnmpHrKkPLMbPFjmPXPaNtaT+yvx3uO2lIoZaR6e8Ksu+vT
	H+AtpJcR5D//F5e7TOEHZQUkmoMNKw0iCo=
X-Received: by 2002:a17:903:2ad0:b0:2bd:6dad:3dfb with SMTP id d9443c01a7336-2c9ae984803mr129675ad.25.1782507179731;
        Fri, 26 Jun 2026 13:52:59 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5afb1e0sm46815795ad.29.2026.06.26.13.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:52:58 -0700 (PDT)
Date: Fri, 26 Jun 2026 20:52:54 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/5] rust: sync: add const constructor for raw_spinlock_t
Message-ID: <aj7mpkvobbQVLLcx@google.com>
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-2-cc922f544dc0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-pr-ratelimited-v1-2-cc922f544dc0@google.com>

On Tue, Jun 23, 2026 at 03:38:05PM +0000, Alice Ryhl wrote:
> The abstractions for pr_*_ratelimited! need to construct a global
> `struct ratelimit_state`, which contains a `raw_spinlock_t` field. Thus,
> add a const constructor for the `raw_spinlock_t` type.
> 
> The SPINLOCK_OWNER_INIT constant isn't mirrored via a const helper
> because bindgen generates a 'static mut' instead of a constant from the
> pointer constant.,
> 
> The __ARCH_SPIN_LOCK_UNLOCKED constant cannot be translated by bindgen
> because it's a define for a struct without type annotations, so it's
> explicitly declared in Rust.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  include/linux/spinlock_types_raw.h |  4 ++++
>  rust/bindings/lib.rs               | 24 ++++++++++++++++++++++++
>  rust/kernel/sync/lock/spinlock.rs  | 29 +++++++++++++++++++++++++++++
>  rust/kernel/sync/lockdep.rs        | 22 ++++++++++++++++++++++
>  4 files changed, 79 insertions(+)
> 
> diff --git a/include/linux/spinlock_types_raw.h b/include/linux/spinlock_types_raw.h
> index e5644ab2161f..942c229c90bb 100644
> --- a/include/linux/spinlock_types_raw.h
> +++ b/include/linux/spinlock_types_raw.h
> @@ -11,6 +11,10 @@
>  
>  #include <linux/lockdep_types.h>
>  
> +/*
> + * Keep in sync with rust/kernel/sync/lock/spinlock.rs
> + */
> +
>  context_lock_struct(raw_spinlock) {
>  	arch_spinlock_t raw_lock;
>  #ifdef CONFIG_DEBUG_SPINLOCK
> diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> index 854e7c471434..adde41e41edc 100644
> --- a/rust/bindings/lib.rs
> +++ b/rust/bindings/lib.rs
> @@ -77,3 +77,27 @@ mod bindings_helper {
>          None
>      }
>  };
> +
> +// Explicitly list architectures where this logic is checked correct.
> +#[cfg(any(
> +    CONFIG_ARM,
> +    CONFIG_ARM64,
> +    CONFIG_LOONGARCH,
> +    CONFIG_PPC,
> +    CONFIG_RISCV,
> +    CONFIG_S390,
> +    CONFIG_X86,
> +))]

I guess this is done explicitly because we can't test if
__ARCH_SPIN_LOCK_UNLOCKED is defined by the arch?

> +pub const __ARCH_SPIN_LOCK_UNLOCKED: arch_spinlock_t = {
> +    // SAFETY: The `arch_spinlock_t` type can be zeroed.
> +    #[allow(unused_mut)]
> +    let mut lock: arch_spinlock_t = unsafe { core::mem::zeroed() };
> +
> +    #[cfg(not(CONFIG_SMP))]
> +    #[cfg(CONFIG_DEBUG_SPINLOCK)]
> +    {
> +        lock.slock = 1;
> +    }
> +
> +    lock
> +};
> diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
> index ef76fa07ca3a..8babfb79098f 100644
> --- a/rust/kernel/sync/lock/spinlock.rs
> +++ b/rust/kernel/sync/lock/spinlock.rs
> @@ -4,6 +4,8 @@
>  //!
>  //! This module allows Rust code to use the kernel's `spinlock_t`.
>  
> +use kernel::prelude::*;
> +
>  /// Creates a [`SpinLock`] initialiser with the given name and a newly-created lock class.
>  ///
>  /// It uses the name if one is given, otherwise it generates one based on the file name and line
> @@ -144,3 +146,30 @@ unsafe fn assert_is_held(ptr: *mut Self::State) {
>          unsafe { bindings::spin_assert_is_held(ptr) }
>      }
>  }
> +
> +/// Helper for creating a raw unlocked `bindings::raw_spinlock_t`.
> +///
> +/// For use in statics containing raw spinlocks.
> +pub const fn raw_spin_lock_unlocked(name: &'static CStr) -> bindings::raw_spinlock_t {
> +    // Silence unused variable warnings.
> +    #[cfg(not(CONFIG_DEBUG_LOCK_ALLOC))]
> +    let _ = name;
> +
> +    bindings::raw_spinlock_t {
> +        raw_lock: bindings::__ARCH_SPIN_LOCK_UNLOCKED,
> +
> +        #[cfg(CONFIG_DEBUG_SPINLOCK)]
> +        magic: bindings::SPINLOCK_MAGIC,
> +        #[cfg(CONFIG_DEBUG_SPINLOCK)]
> +        owner_cpu: u32::MAX,
> +        #[cfg(CONFIG_DEBUG_SPINLOCK)]
> +        owner: usize::MAX as *mut c_void,
> +
> +        #[cfg(CONFIG_DEBUG_LOCK_ALLOC)]
> +        dep_map: kernel::sync::lockdep::raw_lockdep_map(
> +            name,
> +            kernel::sync::lockdep::LD_WAIT_SPIN,
> +            kernel::sync::lockdep::LD_WAIT_INV,
> +        ),
> +    }
> +}

This seems identical to the __RAW_SPIN_LOCK_UNLOCKED equivalent.

> diff --git a/rust/kernel/sync/lockdep.rs b/rust/kernel/sync/lockdep.rs
> index 784821cc2a39..c0f8b196c084 100644
> --- a/rust/kernel/sync/lockdep.rs
> +++ b/rust/kernel/sync/lockdep.rs
> @@ -137,3 +137,25 @@ macro_rules! optional_name {
>          $crate::c_str!($name)
>      };
>  }
> +
> +/// Not checked, catch all.
> +pub const LD_WAIT_INV: u8 = bindings::lockdep_wait_type_LD_WAIT_INV as u8;
> +/// Spin loops, `raw_spinlock_t` etc
> +pub const LD_WAIT_SPIN: u8 = bindings::lockdep_wait_type_LD_WAIT_SPIN as u8;
> +
> +/// Helper for declaring a raw `struct lockdep_map` for locks in statics.
> +///
> +/// It's up to the caller to use the returned `struct lockdep_map` correctly.
> +#[cfg(CONFIG_LOCKDEP)]
> +pub const fn raw_lockdep_map(
> +    name: &'static CStr,
> +    wait_type_inner: u8,
> +    wait_type_outer: u8,
> +) -> bindings::lockdep_map {
> +    // SAFETY: All zeros is valid for this type.
> +    let mut map: bindings::lockdep_map = unsafe { core::mem::zeroed() };
> +    map.name = kernel::str::as_char_ptr_in_const_context(name);
> +    map.wait_type_inner = wait_type_inner;
> +    map.wait_type_outer = wait_type_outer;
> +    map
> +}
> 
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog
> 

Looks good to me,

Reviewed-by: Carlos Llamas <cmllamas@google.com>
