Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D97261B80
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 15:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769700800; cv=none; b=WyPBr4xrG0OYZeQUzKl8zpVVCtJtiTYD0JkzdcpL2d0/fq1LlAqQBTcUkS06MZQm61jxjLBNPGBM+QFyQJzhDucj3VYayz59vCDMYCcWjCoSCnScG5GNQn2dlEhEwGY0rFr70aUKpXidpdtiOM4j/AWSvwhak9BleOvhZSmEYoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769700800; c=relaxed/simple;
	bh=A2wllmiHS7tP7APOZ/neUqJgfYjdt1mo6JdpY0kLrC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TjeSPf57324bU1/wriBmTs6YQW6LjY4kBMkjQo+nsUEFLTdTcAhEDabQLZH0dQSgunVtT6xgqTQVOizaPkZWJJxCFxeu85ddpekFu0c4Xu9QRsULm33evnXr+RgGm3jnkTIeRo3mi8zZz67sgg1+WfVFFfsepyUNlkA4fIizjfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pG/TrsHl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pG/TrsHl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D15C19425;
	Thu, 29 Jan 2026 15:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769700799;
	bh=A2wllmiHS7tP7APOZ/neUqJgfYjdt1mo6JdpY0kLrC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pG/TrsHll3E7CB0r+SagqNMFpQRNLaKxBGhxWDCGWZ4bnZO4DVBeHr10wtoFAOY96
	 74RobI+THnktH31eAsCdAzHU62Jy9WIgs/PKhPYVUUHPjx6VSV8x+VSn8bpgQPht2K
	 pz7eD+0DDyH/yKJUa76QjFWb+MiySvL6cqjH79z0/u50e4crWY9bHTHEv3vpZ5dlU/
	 SWlJtt6EjWWEygaOTC0ypg5661raNVdCEWeyl3kfYyvVKwcFvtmePxp+38HxQKHNZ7
	 brXV67i4xUc0xabn/4DHAUWYLQmws1ELSr9zECZGzkqKmf2l1LAJWApSKa2l3GdiSH
	 Zh4MKk7dZYZ+w==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 77B42F40075;
	Thu, 29 Jan 2026 10:33:18 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Thu, 29 Jan 2026 10:33:18 -0500
X-ME-Sender: <xms:vn17aS6xCXPURJg-A32sx_Zft_h_TBNZpXNbobFoO-frZxCJumMKbw>
    <xme:vn17aYREmCuLaJVrf1IUbHu8qd2UHHmwOMApvsaAHFRJ6-yLaWMi-Sfc70bpZ5127
    WIJ57qRirGlU0vjieKv_T-H52Xwo5wpmpgEOheAQf-vL0ZZ-StgiYk>
X-ME-Received: <xmr:vn17aV5Vz0FMzBDSmsdHifvxuV6UnWalTZjzT7f61KRwzoH4roq317h49WZk79e63fPic3dTCBGETheeuyKoecM5so2xKZoB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieeiheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    elvedtfeegtdfggeelhefhjeelhfehgfefueetleffffegjeehhfegvdetffeltdenucff
    ohhmrghinhepiihulhhiphgthhgrthdrtghomhdpghhouggsohhlthdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhm
    vghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeejke
    ehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpdhn
    sggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgrrh
    ihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepthhomhhosegrlhhirghsihhnghdr
    nhgvthdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeifihhllheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphht
    thhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhope
    gurghkrheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:vn17adTh1gmyV9gYynlZVtW8J3fR27jSyapKm619a1TfF8jajnTk9Q>
    <xmx:vn17aSk_mfP1XGuU0s7Urwi2uTfHTDTC111afVjO3PH-w0sPhdLwuA>
    <xmx:vn17aZTeMUocGG_XrvRcSoCNMGH-AeEUHyTH2n6P-DbwJO63U0CTEg>
    <xmx:vn17aRvCz4H3c4cn3joX_4nxZt-gxbpj6MWRT5u5_IX2K_wbSePSrg>
    <xmx:vn17aa5aaHx4L_Yu9XRJ7ZFWcm1S9ThwoiiY0jKc8JiSxmKozjVm3XVW>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Jan 2026 10:33:17 -0500 (EST)
Date: Thu, 29 Jan 2026 07:33:17 -0800
From: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: FUJITA Tomonori <tomo@aliasing.net>, ojeda@kernel.org,
	peterz@infradead.org, will@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
	lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2 1/2] rust: sync: atomic: Add perfromance-optimal Flag
 type for atomic booleans
Message-ID: <aXt9vTuVpEdkzdYD@tardis.local>
References: <20260129122622.3896144-1-tomo@aliasing.net>
 <20260129122622.3896144-2-tomo@aliasing.net>
 <DG14WXLRULYY.268U7911TMRLE@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG14WXLRULYY.268U7911TMRLE@garyguo.net>

On Thu, Jan 29, 2026 at 02:15:10PM +0000, Gary Guo wrote:
> On Thu Jan 29, 2026 at 12:26 PM GMT, FUJITA Tomonori wrote:
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
> 
> Hi Fujita,
> 
> Thanks for the patch. I think this looks nice, so from design point of view:
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> 
> However, Boqun reported that the codegen of `.bool_field` may involve a bit
> masking instruction.
> 

Yeah, but at the moment, I haven't found any elegant way to reduce that
see [1], plus I've tried to transmute the 32-bit Flag struct into a
32-bit enum, but for example on riscv64 an `sext.w` instruction is still
generated [2]. That's a sign to me that the micro-optimization here may
not bring actual performance gain. But of course, open to any
improvement, let's ship what we have now and improve the codegen later.

[1]: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/A.20.60AlwaysZero.60.20type.20for.20padding.3F/near/570631532
[2]: https://godbolt.org/z/3PMK3EK1r

Regards,
Boqun

> Best,
> Gary
> 
> > ---
> >  rust/kernel/sync/atomic.rs           | 125 +++++++++++++++++++++++++++
> >  rust/kernel/sync/atomic/predefine.rs |  17 ++++
> >  2 files changed, 142 insertions(+)
> >
> > diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> > index 4aebeacb961a..bfc393d98aa9 100644
> > --- a/rust/kernel/sync/atomic.rs
> > +++ b/rust/kernel/sync/atomic.rs
> > @@ -560,3 +560,128 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
> >          unsafe { from_repr(ret) }
> >      }
> >  }
> > +
> > +#[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
> > +#[repr(C)]
> > +#[derive(Clone, Copy)]
> > +struct Flag {
> > +    bool_field: bool,
> > +}
> > +
> > +/// # Invariants
> > +///
> > +/// `padding` must be all zeroes.
> > +#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
> > +#[repr(C, align(4))]
> > +#[derive(Clone, Copy)]
> > +struct Flag {
> > +    #[cfg(target_endian = "big")]
> > +    padding: [u8; 3],
> > +    bool_field: bool,
> > +    #[cfg(target_endian = "little")]
> > +    padding: [u8; 3],
> > +}
> > +
> > +impl Flag {
> > +    #[inline(always)]
> > +    const fn new(b: bool) -> Self {
> > +        // INVARIANT: `padding` is all zeroes.
> > +        Self {
> > +            bool_field: b,
> > +            #[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
> > +            padding: [0; 3],
> > +        }
> > +    }
> > +}
> > +
> > +// SAFETY: `Flag` and `Repr` have the same size and alignment, and `Flag` is round-trip
> > +// transmutable to the selected representation (`i8` or `i32`).
> > +unsafe impl AtomicType for Flag {
> > +    #[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
> > +    type Repr = i8;
> > +    #[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
> > +    type Repr = i32;
> > +}
> > +
> > +/// An atomic flag type intended to be backed by performance-optimal integer type.
> > +///
> > +/// The backing integer type is an implementation detail; it may vary by architecture and change
> > +/// in the future.
> > +///
> > +/// [`AtomicFlag`] is generally preferable to [`Atomic<bool>`] when you need read-modify-write
> > +/// (RMW) operations (e.g. [`Atomic::xchg()`]/[`Atomic::cmpxchg()`]) or when [`Atomic<bool>`] does
> > +/// not save memory due to padding. On some architectures that do not support byte-sized atomic
> > +/// RMW operations, RMW operations on [`Atomic<bool>`] are slower.
> > +///
> > +/// If you only use [`Atomic::load()`]/[`Atomic::store()`], [`Atomic<bool>`] is fine.
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::sync::atomic::{AtomicFlag, Relaxed};
> > +///
> > +/// let flag = AtomicFlag::new(false);
> > +/// assert_eq!(false, flag.load(Relaxed));
> > +/// flag.store(true, Relaxed);
> > +/// assert_eq!(true, flag.load(Relaxed));
> > +/// ```
> > +pub struct AtomicFlag(Atomic<Flag>);
> > +
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
