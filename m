Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8FF35972;
	Tue, 30 Jun 2026 03:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782791103; cv=none; b=pzgvkE7SummjkIarZbVobfZPU+wDJOFQ55kuw/Mr4kaqqikxyLt1W1bVJBrgS6QutkgjjgFHL4DzdALLCTFlL1KpUHfzqKK7KJjWVZ3VD5FK7Wjy8IcFpgVMSufSZrwZctRWPhQRfgsROrKNEpvCAr6LUAV/s3VwV6diGnmEjwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782791103; c=relaxed/simple;
	bh=tciBjbUpHW3Pmeex9c2J6f72QHGya1CzECqcA0FHzY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9+Y2cuTabHf5dtfJ/5+yrnoOKnEdFKpI5bnXB9iXrd7Kr3avazkhnDht3Fskb2ot+/W55bD4+A3wawukqp0aHE8lmagorsobv/lJbrjsGAiXADU4GRtiz6jeNhdPzXL7SrdrGW3XweFdTGQ2GYNEUgqanfT9AxoUV6NnLk8I1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZJdHjy5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZJdHjy5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276061F000E9;
	Tue, 30 Jun 2026 03:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782791101;
	bh=7pY4Hy+39yt7riKmaowxEhuWA57O2lpbOi9v+7DAjsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nZJdHjy5s+tHaGq/DGRsxs6s5b5Gqryf+xWCsME8Lv61i+tPwBe56PVCjIfxZtLLT
	 Pth+BD6usNYvdNJ1OXNP402y7rH6Bl3LhiaUmpdiZ6OD6jHBQzBlcsq0fiQ0FTGXZ+
	 UtiOSmpk5tk/zavNoVLIghfvOiKr1lJw6NlZ2V8EYWTo9MEcko0Wd7eTxdYaV0FJoR
	 f79o8O4i7Nvv/Sge9HGjBE0W44ns5w+whZpBY7hpLdOiK9tJhrUQs1c1zs8B2AO8vz
	 /od+tvUjDpRYWZhk0BGE0CApoNEei6QU6iTA1IOfvRLKkxC6oAP8LoXs6C5ZfLYdlg
	 eXvpKv4ujRErQ==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5C66DF40073;
	Mon, 29 Jun 2026 23:45:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 29 Jun 2026 23:45:00 -0400
X-ME-Sender: <xms:vDtDapdE_DwKfDlfYjxkUDB_8e3Ay3AE2UynTZw_CbLQdvKTUiVb6A>
    <xme:vDtDamcW8-7cxx7djlK4Opilb4_Uu9AO2i1EF_SUu3MvWcKCEJEfsXQC0K2cQqhUe
    KAf4jl7XfclmXtyJiPPMarh5u328OqGGVd5cPGca4SJMsavYuafyA>
X-ME-Received: <xmr:vDtDalUI9DYHjrrhc25E911O9pQnl8GGuz3bxT_0pSF_S5ObJnedujG3oO22PdTao9G70_5bI5nWrxozNB5EmhOB4HUqdDEp>
X-ME-Proxy-Cause: dmFkZTFISLqnMToRLvPaQoumWemX1asS6Wo6FbkPVMIQBlKu/Zh09CszNOBkT+VtVdgBEd
    8pBpH9nt9/PVr1J2SCK3tVSOM1fwTOG0VjzoOM8NZMTp+MuuUeViea2durC+P1hnaBTTMT
    P5FbawTGpyEjlP6VfgW/cpDJ+pwri8wV23P9mOfcFigdgNwaIu37aoc+ECuH6gadYF+Egu
    6b9t69wQT+2oWvt43WUEhAPXe1IA9ZnawHQ6XHfBM9IFVQcEC1ZsOua4WKor6EqENP/cFr
    R8p/R472Saf3Tn4OyAukslhlSvs6qTZ32DGAtNrln9doXIZ0SM+ktIMNfPT7P4B2FiGlRG
    b7H7hVbennFmjXmJ+hNcQaqgVrFhPIUQRvuZgkgUo8iw4ju9m9S9BUH79vwL5t+DrSdMps
    Tz5Veto9iERQLP+sRgdsMHqs3YSQq4Ak0lKY4VE83AHcpfYaU5I9QjhRerIzDhZI5/U4aE
    s2yWLHLCuSVugMIe1yJIRo/2uzFcmuVEklAXBXYQRKdVEEjuClZyB+wOWJTQ5ezxaAlnr9
    wZlY1/fSt5imCNhZYPgJblFDcc72CP9YVGC/9D0ByRxfYoP2nm7obZFJJec9KRMXK1HfbW
    M8sMl1agmMMel2Ap4wwngaELrZVNcX3pUMVDZqiVlvsqIeYaPHspDoCaIgcg
X-ME-Proxy: <xmx:vDtDaqfBkYZZeGS2GoovVTtCSN6zATtOdDQPEiLRpSoEiZHu_rS4tw>
    <xmx:vDtDap_GS8usnXN277cC5_VMX4jMyaw7e4h4DrcJJ_b2IpTnkiIcIA>
    <xmx:vDtDapm6TXzzgGKcAWArWQf8rqNnGY4bbGKoYFvkn0S_lQZ27Uv5kg>
    <xmx:vDtDaijQ3X5uJwAQMV8Nkw5NJGb42vAOa61T25prVB5Dx3yxw1bKeA>
    <xmx:vDtDahZ7yDXu_qTyN4dbsJ5bXj9DI0371tUtdl-SyYu2ui0vH_0ZdNI6>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Jun 2026 23:44:59 -0400 (EDT)
Date: Mon, 29 Jun 2026 20:44:58 -0700
From: Boqun Feng <boqun@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Carlos Llamas <cmllamas@google.com>, Gary Guo <gary@garyguo.net>,
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
Message-ID: <akM7upgsb5y9d67B@MacBook-0RXW5>
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
> +pub const __ARCH_SPIN_LOCK_UNLOCKED: arch_spinlock_t = {
> +    // SAFETY: The `arch_spinlock_t` type can be zeroed.
> +    #[allow(unused_mut)]
> +    let mut lock: arch_spinlock_t = unsafe { core::mem::zeroed() };
> +
> +    #[cfg(not(CONFIG_SMP))]
> +    #[cfg(CONFIG_DEBUG_SPINLOCK)]
> +    {
> +        lock.slock = 1;

Ingo & Peter, any particular reason that UP & DEBUG_SPINLOCK defines
unlock value as 1? We could define it as 0, no?

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

I think 

	#[doc(alias("__SPIN_LOCK_UNLOCKED", "DEFINE_SPINLOCK"))]

is not a bad idea here?

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

Do you plan to have this go via binder tree? (Sorry you might already
me the plan, but I couldn't recall). Anyway,

Reviewed-by: Boqun Feng <boqun@kernel.org>

Regards,
Boqun

> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog
> 
