Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD87253F07
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 17:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769620758; cv=none; b=eJnuJVojzWzYv+IL1R0xPz3Ws1CSGRTVn0yBE5Gs21b1bydhSeJgoGEGFp9VNSPzs1MtxZ3Lhlyn0oiXBv78g5bCbQwL7QtGPIHGS/dvLmYh2lOWfyu3g7lohjQazq6BtK2207qYMFlcnX5H3C483iNrWwkCO74mplfDjIu/nR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769620758; c=relaxed/simple;
	bh=J/uZ0qHlm/BEALDkt6iu/cGRqZNrk48aZx9nZF+ntzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KKIs6Jn3xfiaFmx+nLQy/b69vX8lcYGkwsmceHyilnZp+hFTOwcu4z3zxhcPrU69Fklu/RQ+BgmZVcIdOuxMMDobx58Y0i2T6gNTpVa8sxnEG0Ks3k8tZjDbMraxo5UUCTvMW4gg0vzRNmq6wLo92+J+QOzd2LE/Qg813Wj5ztA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRu9oEOA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRu9oEOA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542E8C4AF09;
	Wed, 28 Jan 2026 17:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769620757;
	bh=J/uZ0qHlm/BEALDkt6iu/cGRqZNrk48aZx9nZF+ntzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hRu9oEOAS4B/9msVvmDYu/1XAOkslFlTOHE1P3uTE3EmJSBAkdi0tLMOUrw17YQ4Q
	 3Fsd+jToTBGIStSVNHgSfFlXhHbdeOkNCAYpQbw+IBh/wu140baET/0rMvJwB96Hcl
	 VmrMQYReQnBm0foP9VNw9dmO+e5P5s+xpeet/0RBp2xOs6IjCcgsvX3eDiHQrmCiBx
	 vyRjI5olb0NQCMZ9yCCXZqqjJsHzhZxFuwaLah9Iiqq4u12ceg4nsePzT0POTKXoeZ
	 QkmH3oF9+jh4n81Fu1lZ8aX223xEW+x28kwIou/z3vaaOuaDwyz27d4b+xrjj1TPBP
	 /F1TMdpF8lYlQ==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5B296F4006D;
	Wed, 28 Jan 2026 12:19:16 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 28 Jan 2026 12:19:16 -0500
X-ME-Sender: <xms:FEV6ac7sj0wHU4weLZFcJFUaXu-LCI3sDNbCs4r9J-2mrj8sPb2t0g>
    <xme:FEV6aeVamw2SfaqH987Dbpr5cOGvqxe8WKKAHfnhBHp44JPe3zN1rD_hyLgECsnfM
    wVs0vhuPkCVkOZIQfufqsJC6S8v4w0_akDzQliQOO_wHmCtNfmE>
X-ME-Received: <xmr:FEV6abPhziCTFutqorl19TGJPtfbh0Mu0A4bE8-_q9YYn3kFLZgk86AUde3FRqg-FfMusWfm144wW3pQJOtis7JyvExx7yGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieefledtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgr
    rhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepthhomhhosegrlhhirghsihhngh
    drnhgvthdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgt
    phhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghrii
    esihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopegsjhho
    rhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:FEV6adi6cnjWHXydUwA-tpxg905J6u_5y7T-18755h3qzEv6OktmNw>
    <xmx:FEV6aZ6oggZUNb0pxi1H5iAd9r5lkRTx5XdiHASgqXEKgbqqX1GgdQ>
    <xmx:FEV6accee1JAk55iMjO-4I6_XFzwEQhMk6wvYlhtEB2JzH9so10NQQ>
    <xmx:FEV6aaBs2MHxFMUNa3BFHkuhE1Ublbacz9zvzApzxqC2ZDvRrO_GDg>
    <xmx:FEV6aTA-xL2s378-0HWDSRG6vyQ1uwowxiMG4nuEdHU9uAxgeRql7x9G>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 12:19:15 -0500 (EST)
Date: Wed, 28 Jan 2026 09:19:14 -0800
From: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: FUJITA Tomonori <tomo@aliasing.net>, boqun.feng@gmail.com,
	ojeda@kernel.org, peterz@infradead.org, will@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, lossin@kernel.org,
	mark.rutland@arm.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1 1/2] rust: sync: atomic: Add perfromance-optimal Flag
 type for atomic booleans
Message-ID: <aXpFEhJxbF6cRhAZ@tardis.local>
References: <20260128115200.3820113-1-tomo@aliasing.net>
 <20260128115200.3820113-2-tomo@aliasing.net>
 <DG09KR1O5JL3.3VYRDKRR8UXX8@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG09KR1O5JL3.3VYRDKRR8UXX8@garyguo.net>

On Wed, Jan 28, 2026 at 01:41:41PM +0000, Gary Guo wrote:
> On Wed Jan 28, 2026 at 11:51 AM GMT, FUJITA Tomonori wrote:
> > From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> >
> > Add AtomicFlag type for boolean flags.
> >
> > Document when AtomicFlag is generally preferable to Atomic<bool>: in
> > particular, when RMW operations such as xchg()/cmpxchg() may be used
> > and minimizing memory usage is not the top priority. On some
> > architectures without byte-sized RMW instructions, Atomic<bool> can be
> > slower for RMW operations.
> >
> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > ---
> >  rust/kernel/sync/atomic.rs           | 121 +++++++++++++++++++++++++++
> >  rust/kernel/sync/atomic/predefine.rs |  17 ++++
> >  2 files changed, 138 insertions(+)
> >
> > diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> > index 4aebeacb961a..7d06193709c0 100644
> > --- a/rust/kernel/sync/atomic.rs
> > +++ b/rust/kernel/sync/atomic.rs
> > @@ -560,3 +560,124 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
> >          unsafe { from_repr(ret) }
> >      }
> >  }
> > +
> > +/// # Invariants
> > +///
> > +/// `padding` must be all zeroes.
> > +#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
> 
> This config repeats too much.
> 
> I think probably we should just not let `AtomicFlag` alias `Atomic<u8>` (this
> has the benefit of creating a type mismatch, so code cannot rely on this on x86
> and fail to compile on, say, RV).
> 
> This way the `struct Flag`, `struct AtomicFlag` and `impl AtomicFlag` would
> always exist and the config is only needed for much fewer times (plus, you don't
> need to macro to avoid duplicating docs).
> 

You probably still need configs for `#[repr(align(_))]` in that case or
two definitions of `Flag` anyway. but yes the duplicate docs can be
avoided, so are some impl blocks.

BTW, while we are at it, maybe we should use arches that don't support
byte-wise atomic instructions here instead of the ones do, i.e. 

    #[cfg(not(any(CONFIG_RISCV, CONFIG_LOONGARCH)))]
    #[repr(C)]
    #[derive(Clone, Copy)]
    struct Flag {
        bool_flag: bool,
    }

    #[cfg(any(CONFIG_RISCV, CONFIG_LOONGARCH))]
    #[repr(C, align(4)]
    #[derive(Clone, Copy)]
    struct Flag {
        #[cfg(target_endian = "big")]
        padding: [u8; 3],
        bool_flag: bool,
        #[cfg(target_endian = "little")]
        padding: [u8; 3],
    }

and we should do

    unsafe impl AtomicType for Flag {
        #[cfg(any(CONFIG_RISCV, CONFIG_LOONGARCH)))]
	type Repr = i32;
        #[cfg(not(any(CONFIG_RISCV, CONFIG_LOONGARCH)))]
	type Repr = i8;
    }

as well.

> > +#[repr(C, align(4))]
> > +#[derive(Clone, Copy)]
> > +struct Flag {
> > +    bool_field: bool,
> > +    padding: [u8; 3],
> 
> You probably still want, on big endian platforms, put padding first, so the
> generated instruction uses small immediates (0 & 1) instead of 0 & 0x01000000.
> 
> Best,
> Gary
> 
> > +}
> > +
> > +#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
> > +impl Flag {
> > +    #[inline(always)]
> > +    const fn new(b: bool) -> Self {
> > +        // INVARIANT: `padding` is all zeroes.
> > +        Self {
> > +            bool_field: b,
> > +            padding: [0; 3],
> > +        }
> > +    }
> > +}
> > +
> > +// SAFETY: `Flag` and `i32` have the same size and alignment, and it's round-trip
> > +// transmutable to `i32`.
> > +#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
> > +unsafe impl AtomicType for Flag {
> > +    type Repr = i32;
> > +}
> > +
> > +macro_rules! atomic_flag_doc {
> > +    () => {
> > +        concat!(
> > +            "An atomic flag type intended to be backed by performance-optimal integer type.\n\n",
> > +            "The backing integer type is an implementation detail; it may vary by architecture and change\n",
> > +            "in the future.\n\n",
> > +            "[`AtomicFlag`] is generally preferable to [`Atomic<bool>`] when you need read-modify-write\n",
> > +            "(RMW) operations (e.g. [`Atomic::xchg()`]/[`Atomic::cmpxchg()`]) or when [`Atomic<bool>`] does\n",
> > +            "not save memory due to padding. On some architectures that do not support byte-sized atomic\n",
> > +            "RMW operations, RMW operations on [`Atomic<bool>`] are slower.\n\n",
> > +            "If you only use [`Atomic::load()`]/[`Atomic::store()`], [`Atomic<bool>`] is fine.\n\n",
> > +            "# Examples\n\n",
> > +            "```\n",
> > +            "use kernel::sync::atomic::{Atomic, AtomicFlag, Relaxed};\n\n",
> > +            "let flag = AtomicFlag::new(false);\n",
> > +            "assert_eq!(false, flag.load(Relaxed));\n",
> > +            "flag.store(true, Relaxed);\n",
> > +            "assert_eq!(true, flag.load(Relaxed));\n",
> > +            "```\n"
> > +        )
> > +    };
> > +}
> > +
> > +#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
> > +#[doc = atomic_flag_doc!()]
> > +pub struct AtomicFlag(Atomic<Flag>);
> > +
> > +#[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
> > +#[doc = atomic_flag_doc!()]
> > +pub type AtomicFlag = Atomic<bool>;
> > +
> > +#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
> > +impl AtomicFlag {
> > +    /// Creates a new atomic flag.
> > +    #[inline(always)]
> > +    pub const fn new(b: bool) -> Self {
> > +        Self(Atomic::new(Flag::new(b)))
> > +    }
> > +
> > +    /// Returns a mutable reference to the underlying flag as a [`bool`].
> > +    ///
> > +    /// This is safe because the mutable reference of the atomic flag guarantees exclusive access.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// use kernel::sync::atomic::{AtomicFlag, Relaxed};
> > +    ///
> > +    /// let mut atomic_flag = AtomicFlag::new(false);
> > +    /// assert_eq!(false, atomic_flag.load(Relaxed));
> > +    /// *atomic_flag.get_mut() = true;
> > +    /// assert_eq!(true, atomic_flag.load(Relaxed));
> > +    /// ```
> > +    #[inline(always)]
> > +    pub fn get_mut(&mut self) -> &mut bool {
> > +        &mut self.0.get_mut().bool_field
> > +    }
> > +
> > +    /// Loads the value from the atomic flag.
> > +    #[inline(always)]
> > +    pub fn load<Ordering: ordering::AcquireOrRelaxed>(&self, o: Ordering) -> bool {
> > +        self.0.load(o).bool_field

For load(), xchg() and cmpxchg(), I think we should not use
`.bool_field`, because we know that `padding` is always zero, but
compilers don't. Using `.bool_field` will make the compiler generate i32
to i8 or a bit mask instruction to get the boolean. We need to implement
`From<Flag>` for `bool` and use `.into()` here.

Regards,
Boqun


> > +    }
> > +
> > +    /// Stores a value to the atomic flag.
> > +    #[inline(always)]
> > +    pub fn store<Ordering: ordering::ReleaseOrRelaxed>(&self, v: bool, o: Ordering) {
> > +        self.0.store(Flag::new(v), o);
> > +    }
> > +
> > +    /// Stores a value to the atomic flag and returns the previous value.
> > +    #[inline(always)]
> > +    pub fn xchg<Ordering: ordering::Ordering>(&self, new: bool, o: Ordering) -> bool {
> > +        self.0.xchg(Flag::new(new), o).bool_field
> > +    }
> > +
> > +    /// Store a value to the atomic flag if the current value is equal to `old`.
> > +    #[inline(always)]
> > +    pub fn cmpxchg<Ordering: ordering::Ordering>(
> > +        &self,
> > +        old: bool,
> > +        new: bool,
> > +        o: Ordering,
> > +    ) -> Result<bool, bool> {
> > +        match self.0.cmpxchg(Flag::new(old), Flag::new(new), o) {
> > +            Ok(_) => Ok(old),
> > +            Err(f) => Err(f.bool_field),
> > +        }
> > +    }
> > +}
> > diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
> > index 42067c6a266c..d14e10544dcf 100644
> > --- a/rust/kernel/sync/atomic/predefine.rs
> > +++ b/rust/kernel/sync/atomic/predefine.rs
> > @@ -215,4 +215,21 @@ fn atomic_bool_tests() {
> >          assert_eq!(false, x.load(Relaxed));
> >          assert_eq!(Ok(false), x.cmpxchg(false, true, Full));
> >      }
> > +
> > +    #[test]
> > +    fn atomic_flag_tests() {
> > +        let mut flag = AtomicFlag::new(false);
> > +
> > +        assert_eq!(false, flag.load(Relaxed));
> > +
> > +        *flag.get_mut() = true;
> > +        assert_eq!(true, flag.load(Relaxed));
> > +
> > +        assert_eq!(true, flag.xchg(false, Relaxed));
> > +        assert_eq!(false, flag.load(Relaxed));
> > +
> > +        *flag.get_mut() = true;
> > +        assert_eq!(Ok(true), flag.cmpxchg(true, false, Full));
> > +        assert_eq!(false, flag.load(Relaxed));
> > +    }
> >  }
> 
