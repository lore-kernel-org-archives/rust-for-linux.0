Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622873009C1
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 15:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528137; cv=none; b=LwkLm/GVIr+Jp6VYLOp9tjSiJnfc9MR1wU9WpAoRS4KcPYzj0+kkpiD8aTajaTa7q7Zioh5Fyt30S42/VR89hoYq/pz2fsLqzWiVUGX6XchxyI5fCLo+svdfh1CHobs/jI2vj6S+2SsboTRJo6rFdwupGVJRov6Tt2uVKYWMCgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528137; c=relaxed/simple;
	bh=eGw8Zrcp56z4P97UGB0NaoadmvzAYb/x7hXvO0rvr/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3Zq2aRKCKBtxOClOe7tyDgJumTG+eFNcMjLifUHI4ZtZudJSuVEPIDgj/6ZlEnJtBTSNf9I4SNQQaa/8spTlRTDl9VXzF6oUmD4vag6fYjcjIG/6PDiIeJWAjiPalf1Bm2dlEyx9x1A0eIDIy52dfhzcTBtFvLcvy38/769TP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4W0EPgP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4W0EPgP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6595AC16AAE;
	Tue, 27 Jan 2026 15:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769528136;
	bh=eGw8Zrcp56z4P97UGB0NaoadmvzAYb/x7hXvO0rvr/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U4W0EPgPGtUAtWQfxfuSuRUgukAIt3ugxafG2MIZ8ACbmvdEtWUpgT4fNe8a8DjRE
	 Rx7Uk7q4Wv1NIP3fe5UaLzaF1Qc12jJgGos0oyUoPm0ACU6k2OI7e3lEPMModycISX
	 OszuaG7tHxW2XesuppYAcbQPrtnfgs20NCf2UhKAosWExop5gGVJPqO+q+3xKEk17T
	 BVeQ5C/lfr14CbQYjhXrjvKpO7U2fmw0jw+B2H1xSaOsJfPFayg9isJL1lmgjJqGTD
	 2DVJc3vG1b3iWjzzL784USYRNrl/kJuLfEt4HsPOhcWMWymjOJ+30c2gYRDfH9hIv0
	 05Jbf4Ze3yBTw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 873E2F4006A;
	Tue, 27 Jan 2026 10:35:35 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 27 Jan 2026 10:35:35 -0500
X-ME-Sender: <xms:R9t4afdlU3wcKHFM1STARkwB4t99LUFJvOpdfH5kEZc1ezomRWAaEw>
    <xme:R9t4aRnUsk98cOcoFUrM3DW4dmc6svLgNfJqboS49z-IA0akjHdkHOKzE_kopYoG7
    Zu3yl3QmP65KHVmUBCchtPSJymMBrQUWmfIL5jEQ2zzgRB6rnXMWnw>
X-ME-Received: <xmr:R9t4ac9VehGV302ATla3pDY3EQRMBpctG2zc5U1LjS4soweq5HmYw3nygf6sj32NdpJj6tc4HbNrWYGWpiEqwp0l5zGw3gDL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedtkeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthho
    mhhosegrlhhirghsihhnghdrnhgvthdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgt
    phhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusg
    horhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohho
    ghhlvgdrtghomhdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilh
    drtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    ghgrrhihsehgrghrhihguhhordhnvght
X-ME-Proxy: <xmx:R9t4afGXN36O5zWScf5vndOKuNjgWnXIbFBCGLq6nKKJMLZHfL9uCQ>
    <xmx:R9t4aYLXIG3pw46_OFG0Bf_ZkHUbgeAfLJBv0Z45cv5iO16Sl6URow>
    <xmx:R9t4aXmy2XulBtbMGn-LbgnCDrKoEmMfISx8c8_cPPx_STh-9YdKLQ>
    <xmx:R9t4aZy4wFtTAKAQVkv4dXPyXYNjP--iLttwaL46h2EkS-F175wxag>
    <xmx:R9t4aZs1ZeJmDFwZBlByICxDuiwXajmjW1IsXr6vMxEywaIURpgcWkk2>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jan 2026 10:35:35 -0500 (EST)
Date: Tue, 27 Jan 2026 07:35:34 -0800
From: Boqun Feng <boqun@kernel.org>
To: FUJITA Tomonori <tomo@aliasing.net>
Cc: ojeda@kernel.org, peterz@infradead.org, will@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2 1/2] rust: sync: atomic: Add AtomicFlag::get_mut
Message-ID: <aXjbRq3Npqo7kr26@tardis.local>
References: <20260127125300.3656544-1-tomo@aliasing.net>
 <20260127125300.3656544-2-tomo@aliasing.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127125300.3656544-2-tomo@aliasing.net>

[For some unknown reasons, I cannot send my reply via gmail hence reply
 via kernel.org account, I might switch from gmail later on]

On Tue, Jan 27, 2026 at 09:52:59PM +0900, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> AtomicFlag exposes a bool API, but it lacks a get_mut() equivalent to
> Atomic<T>::get_mut().
> 
> Also add kunit tests for AtomicFlag.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/sync/atomic.rs           | 20 ++++++++++++++++++++
>  rust/kernel/sync/atomic/predefine.rs | 17 +++++++++++++++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> index 6c46335bdb8c..b6c01d9f3a46 100644
> --- a/rust/kernel/sync/atomic.rs
> +++ b/rust/kernel/sync/atomic.rs
> @@ -591,6 +591,26 @@ pub fn store<Ordering: ordering::ReleaseOrRelaxed>(&self, b: bool, o: Ordering)
>          self.0.store(b.into(), o)
>      }
>  
> +    /// Returns a mutable reference to the underlying flag as a `bool`.
> +    ///
> +    /// This is safe because the mutable reference of the atomic flag guarantees exclusive access.
> +    pub fn get_mut(&mut self) -> &mut bool {
> +        let byte_ptr = {
> +            let ptr = self.0.as_ptr().cast::<u8>();
> +            let offset = if cfg!(target_endian = "big") {
> +                core::mem::size_of::<Flag>() - 1
> +            } else {
> +                0
> +            };

The idea is solid, but I want to avoid endian handling in the function,
I would prefer a "struct declaration" solution like:

    #[cfg(target_endian = "big")]
    #[repr(align(4))]
    pub(super) struct FlagInner {
        _pad: [i8; 3],
	bool_field: bool,
    }

    #[cfg(target_endian = "little")]
    #[repr(align(4))]
    struct FlagInner {
	bool_field: bool,
        _pad: [i8; 3],
    }

redefine `Flag` as `BoolFlag`

    #[repr(i32)]
    pub enum BoolFlag {
        Clear = 0,
	Set = 1,
    }

and `Flag` becomes a union of `BoolFlag` and `FlagInner`:

    /// # Invariants
    /// `Flag` is either 0 or 1 in a i32 representation which implies
    /// that `inner` is always valid as long as `_pad` stays 0.
    pub union Flag {
        pub(super) inner: FlagInner,
        pub flag: BoolFlag,
    }

    // can static_assert that `Flag` and `BoolFlag` has the same
    // alignement and size.

then

    impl AtomicFlag {
        pub fn get_mut(&mut self) -> &mut bool {
	    let flag = self.0.get_mut(); // <- &mut Flag

            // INVARIANTS: flag.inner._pad cannot be modified via the
	    // returned reference.
	    // SAFETY: Per type invariants, `flag.inner.bool_field` is
	    // always a valid bool.
	    unsafe { &mut flag.inner.bool_field }
	}
    }

Thoughts?

Regards,
Boqun

> +
> +            // SAFETY: `ptr` is valid for `size_of::<Flag>()` bytes; `offset` selects the LSB.
> +            unsafe { ptr.add(offset) }
> +        };
> +
> +        // SAFETY: The LSB holds `0`/`1` for `Flag::Clear/Set`, and `bool` is `i8`-sized/aligned.
> +        unsafe { &mut *byte_ptr.cast::<bool>() }
> +    }
> +
>      /// Stores a value to the atomic flag and returns the previous value.
>      #[inline(always)]
>      pub fn xchg<Ordering: ordering::Ordering>(&self, b: bool, o: Ordering) -> bool {
> diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
> index 11bc67ab70a3..e413b9e9fe21 100644
> --- a/rust/kernel/sync/atomic/predefine.rs
> +++ b/rust/kernel/sync/atomic/predefine.rs
> @@ -351,6 +351,23 @@ fn atomic_bool_tests() {
>          assert_eq!(Ok(false), x.cmpxchg(false, true, Full));
>      }
>  
> +    #[test]
> +    fn atomic_flag_tests() {
> +        let mut flag = AtomicFlag::new(false);
> +
> +        assert_eq!(false, flag.load(Relaxed));
> +
> +        *flag.get_mut() = true;
> +        assert_eq!(true, flag.load(Relaxed));
> +
> +        assert_eq!(true, flag.xchg(false, Relaxed));
> +        assert_eq!(false, flag.load(Relaxed));
> +
> +        *flag.get_mut() = true;
> +        assert_eq!(Ok(true), flag.cmpxchg(true, false, Full));
> +        assert_eq!(false, flag.load(Relaxed));
> +    }
> +
>      #[test]
>      fn atomic_ptr_tests() {
>          let mut v = 42;
> -- 
> 2.43.0
> 
