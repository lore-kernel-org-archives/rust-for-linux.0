Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799893161B1
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 16:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769531701; cv=none; b=gIIN5wcF8rp8W9A5WMqEci6MsQtMtRSGW+Cr7NyTlUTZ9U/+n7r8AE6IEKd7gWj2DRQ9vQuFDzOKFoIfqdTUFGC7nhD+jDJ5jhEQTLSaQU2a/gu6sTLuk7xn3up1xPIVFo4JblTPzRJVo4EDI/eD2rTgHpfiun8yQOStSEbfdc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769531701; c=relaxed/simple;
	bh=W4JtxEzEenl5PxUDblZN2MvsIKktvMuI0/Oyf9vxqzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IM22+mf08aFxiOpcCiRyk+sJAlwxGxLhOXs2jnL9z08vWKmVNNuRX/u/QaA5gf+eN0uMns582TifRRD+Z8nIcOSK76atS7Qvbm3uz0Btgg/4rlTNMzf3xh+o+016a5D5Ixbi1/EuL/zbme5m+3t2dShHVFN4W7xIZWrg4v918qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/tmvtWF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/tmvtWF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC648C116D0;
	Tue, 27 Jan 2026 16:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769531701;
	bh=W4JtxEzEenl5PxUDblZN2MvsIKktvMuI0/Oyf9vxqzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A/tmvtWF6gmysU3cIzT4ahNFcptKU9pS4bS0QGwCFUzcHqc5tvwiXLVSHURfvKVi4
	 CNYBaAO6R2g2b7rZEA5To6piy7kFLnCQd8q9B8jQ0UEv9UfWRn/dmPkWlmijTSt+ZV
	 +bXDm93Y190PBN+hFm9mvkT3ado3FVIkfGNRa8SF4dCGCn7ZwliUto+74yr/ldJnyt
	 FVa2BDOSOzZA7MM2AoGP3D39k/LmVUX/kA/MB7wLMo6ZvOelgKEpOeKclVV4pUOSIg
	 gleaaJm1dQBCExARngZcv3KABTlBo8v4fKgndbffcIzwW5ojaXPaz0sIpjFXYlUr6R
	 mXKT2jO8t63dg==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id C67ABF40073;
	Tue, 27 Jan 2026 11:34:59 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 27 Jan 2026 11:34:59 -0500
X-ME-Sender: <xms:M-l4aTt4vHUPLhYX8Y6PnAMpAhI55fQE2KYaaNF0GOqrT6TbS1yzGQ>
    <xme:M-l4aQ2ziLYOgxMC4RGPkfJLSVBv3E7qvpWyhjPoaoIMFYb9LleNWvqjZRhiMEkao
    W4ZSUWDYGS_trbOfZVpwlBY_-xc639xUr_459OxR-Ii3qEDbZb2Ng>
X-ME-Received: <xmr:M-l4abN7ySHxMh1b2keKsw-GC0SfgspqKmDIgaA4ZQdTZ5PzgOxSuFRnq5tbmiu6sY3Kc1zLEwU8N4Ka_emuH-7RZMpxLlD0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedtleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgr
    rhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepthhomhhosegrlhhirghsihhngh
    drnhgvthdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeifihhllheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtph
    htthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthho
    pegurghkrheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:M-l4aQWSJTJiVTCtNgePNFnK7h6NXD1V4ans-tSrC66qz2AN3J5yBQ>
    <xmx:M-l4aQZKkrqjWicav7YbKg6o62fwh1oJX9dwVy7MPV5XMgEu96Sx8g>
    <xmx:M-l4aa0MumsJ8ZBoDLNr9V_gwfNd4uNk_h9Zudwmej0lJX0tJN_8OQ>
    <xmx:M-l4acDYQU-Bd5OTR-NKlSfR3__9EhD-fRs9rMKKU7H-2D1KDzEv-g>
    <xmx:M-l4ae88cGyIUZ3VXAk3S3hI5m_84AZugS_NQ2qBILvdDKrkKhKDfvMR>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jan 2026 11:34:59 -0500 (EST)
Date: Tue, 27 Jan 2026 08:34:58 -0800
From: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: FUJITA Tomonori <tomo@aliasing.net>, ojeda@kernel.org,
	peterz@infradead.org, will@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
	lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2 1/2] rust: sync: atomic: Add AtomicFlag::get_mut
Message-ID: <aXjpMhRytX-W3AX9@tardis.local>
References: <20260127125300.3656544-1-tomo@aliasing.net>
 <20260127125300.3656544-2-tomo@aliasing.net>
 <aXjbRq3Npqo7kr26@tardis.local>
 <DFZHIVE89VOW.1MQL8CO9K7SVI@garyguo.net>
 <aXjg4jv-3aQcy4O0@tardis.local>
 <DFZI47QW7VTE.1PF5P6LUTASVS@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFZI47QW7VTE.1PF5P6LUTASVS@garyguo.net>

On Tue, Jan 27, 2026 at 04:10:35PM +0000, Gary Guo wrote:
> On Tue Jan 27, 2026 at 3:59 PM GMT, Boqun Feng wrote:
> > On Tue, Jan 27, 2026 at 03:42:42PM +0000, Gary Guo wrote:
> >> On Tue Jan 27, 2026 at 3:35 PM GMT, Boqun Feng wrote:
> >> > [For some unknown reasons, I cannot send my reply via gmail hence reply
> >> >  via kernel.org account, I might switch from gmail later on]
> >> >
> >> > On Tue, Jan 27, 2026 at 09:52:59PM +0900, FUJITA Tomonori wrote:
> >> >> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> >> >> 
> >> >> AtomicFlag exposes a bool API, but it lacks a get_mut() equivalent to
> >> >> Atomic<T>::get_mut().
> >> >> 
> >> >> Also add kunit tests for AtomicFlag.
> >> >> 
> >> >> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> >> >> ---
> >> >>  rust/kernel/sync/atomic.rs           | 20 ++++++++++++++++++++
> >> >>  rust/kernel/sync/atomic/predefine.rs | 17 +++++++++++++++++
> >> >>  2 files changed, 37 insertions(+)
> >> >> 
> >> >> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> >> >> index 6c46335bdb8c..b6c01d9f3a46 100644
> >> >> --- a/rust/kernel/sync/atomic.rs
> >> >> +++ b/rust/kernel/sync/atomic.rs
> >> >> @@ -591,6 +591,26 @@ pub fn store<Ordering: ordering::ReleaseOrRelaxed>(&self, b: bool, o: Ordering)
> >> >>          self.0.store(b.into(), o)
> >> >>      }
> >> >>  
> >> >> +    /// Returns a mutable reference to the underlying flag as a `bool`.
> >> >> +    ///
> >> >> +    /// This is safe because the mutable reference of the atomic flag guarantees exclusive access.
> >> >> +    pub fn get_mut(&mut self) -> &mut bool {
> >> >> +        let byte_ptr = {
> >> >> +            let ptr = self.0.as_ptr().cast::<u8>();
> >> >> +            let offset = if cfg!(target_endian = "big") {
> >> >> +                core::mem::size_of::<Flag>() - 1
> >> >> +            } else {
> >> >> +                0
> >> >> +            };
> >> >
> >> > The idea is solid, but I want to avoid endian handling in the function,
> >> > I would prefer a "struct declaration" solution like:
> >> >
> >> >     #[cfg(target_endian = "big")]
> >> >     #[repr(align(4))]
> >> >     pub(super) struct FlagInner {
> >> >         _pad: [i8; 3],
> >> > 	bool_field: bool,
> >> >     }
> >> >
> >> >     #[cfg(target_endian = "little")]
> >> >     #[repr(align(4))]
> >> >     struct FlagInner {
> >> > 	bool_field: bool,
> >> >         _pad: [i8; 3],
> >> >     }
> >> >
> >> > redefine `Flag` as `BoolFlag`
> >> >
> >> >     #[repr(i32)]
> >> >     pub enum BoolFlag {
> >> >         Clear = 0,
> >> > 	Set = 1,
> >> >     }
> >> >
> >> > and `Flag` becomes a union of `BoolFlag` and `FlagInner`:
> >> >
> >> >     /// # Invariants
> >> >     /// `Flag` is either 0 or 1 in a i32 representation which implies
> >> >     /// that `inner` is always valid as long as `_pad` stays 0.
> >> >     pub union Flag {
> >> >         pub(super) inner: FlagInner,
> >> >         pub flag: BoolFlag,
> >> >     }
> >> >
> >> >     // can static_assert that `Flag` and `BoolFlag` has the same
> >> >     // alignement and size.
> >> >
> >> > then
> >> >
> >> >     impl AtomicFlag {
> >> >         pub fn get_mut(&mut self) -> &mut bool {
> >> > 	    let flag = self.0.get_mut(); // <- &mut Flag
> >> >
> >> >             // INVARIANTS: flag.inner._pad cannot be modified via the
> >> > 	    // returned reference.
> >> > 	    // SAFETY: Per type invariants, `flag.inner.bool_field` is
> >> > 	    // always a valid bool.
> >> > 	    unsafe { &mut flag.inner.bool_field }
> >> > 	}
> >> >     }
> >> >
> >> > Thoughts?
> >> >
> >> > Regards,
> >> > Boqun
> >> 
> >> I think we really need special handling for endianness for this one single
> >> function, so doing all the extra stuff feels really unnecessary.
> >> 
> >
> > First, this one single function changes the design actually, previously
> > you can even implement a Flag as:
> >
> >    enum Flag {
> >        Clear = 6,
> >        Set = 7,
> >    }
> >
> > and it'll work, that is as long as `Flag` behaves like a bool, it's
> > fine. But now this function implies there is actually a bool in `Flag`,
> > which is kinda totally different.
> >
> > Besides, by using the current implement, we set an example about "how to
> > do a byte offset in an i32 for different endians", and then if anyone
> > wanted to do something similar, very likely they would copy-paste and
> > modify what we have here. The potential tech debts are significant. So I
> > would like to do it in a right way ("right" is probably subjective, but
> > it comes from someone who needs to live with the code as a maintainer
> > ;-) and I'm happy to switch to a better way if necessary).
> 
> I think what Fujita has is more "proper". Your approach still have the issue of
> requiring a specific ordering of the fields. If this is messed up, then the
> entire thing is broken. I.e. the safety proof of `get_mut` depends on the fields
> being ordered correctly in `FlagInner`.
> 
> If you want to go down this route then I would just scrap `enum Flag` all
> together and always define it as struct, with an internal `bool` + 3 bytes of
> zero padding. This way we don't even need unsafe for `get_mut`.
> 

Hmm.. so like:

    const PAD_SIZE: usize = <3 or 0 depending on ARCHs>

    /// # Invariants
    /// `pad` has to be all zero.
    struct Flag {
        bool_field: bool,
	pad: [i8; PAD_SIZE],
    }

    impl Flag {
        pub const fn set() -> Flag {
	    Self { true, pad: [0; PAD_SIZE] }
	}

        pub const fn clear() -> Flag {
	    Self { false, pad: [0; PAD_SIZE] }
	}
    }

?

Yes, I think it's better ;-)

Also, now given that `AtomicFlag` behaves exactly like a `Atomic<bool>`,
should we do:

    /// `AtomicFlag` documentation here.
    #[cfg(<Arch supports byte-wise atomic>)]
    type AtomicFlag = Atomic<bool>;
    #[cfg(<Arch doesn't supprot byte-wise atomic>)]
    struct AtomicFlag(Atomic<BooleanFlag>);

    // `Flag` doesn't even need to be public.
    #[cfg(<Arch doesn't supprot byte-wise atomic>)]
    struct BooleanFlag { ... }

(I renamed `Flag` -> `BooleanFlag`)

Thoughts? I don't think there is any extra benefit of exposing
`Atomic<BooleanFlag>`.

Regards,
Boqun

> Best,
> Gary
> >
> > Hope this can explain why I want to do this right now.
> >
> > Regards,
> > Boqun
> >
> >> I prefer Fujita's current version.
> >> 
> >> Best,
> >> Gary
> >> 
> >> >
> >> >> +
> >> >> +            // SAFETY: `ptr` is valid for `size_of::<Flag>()` bytes; `offset` selects the LSB.
> >> >> +            unsafe { ptr.add(offset) }
> >> >> +        };
> >> >> +
> >> >> +        // SAFETY: The LSB holds `0`/`1` for `Flag::Clear/Set`, and `bool` is `i8`-sized/aligned.
> >> >> +        unsafe { &mut *byte_ptr.cast::<bool>() }
> >> >> +    }
> >> >> +
> >> >>      /// Stores a value to the atomic flag and returns the previous value.
> >> >>      #[inline(always)]
> >> >>      pub fn xchg<Ordering: ordering::Ordering>(&self, b: bool, o: Ordering) -> bool {
> >> >> diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
> >> >> index 11bc67ab70a3..e413b9e9fe21 100644
> >> >> --- a/rust/kernel/sync/atomic/predefine.rs
> >> >> +++ b/rust/kernel/sync/atomic/predefine.rs
> >> >> @@ -351,6 +351,23 @@ fn atomic_bool_tests() {
> >> >>          assert_eq!(Ok(false), x.cmpxchg(false, true, Full));
> >> >>      }
> >> >>  
> >> >> +    #[test]
> >> >> +    fn atomic_flag_tests() {
> >> >> +        let mut flag = AtomicFlag::new(false);
> >> >> +
> >> >> +        assert_eq!(false, flag.load(Relaxed));
> >> >> +
> >> >> +        *flag.get_mut() = true;
> >> >> +        assert_eq!(true, flag.load(Relaxed));
> >> >> +
> >> >> +        assert_eq!(true, flag.xchg(false, Relaxed));
> >> >> +        assert_eq!(false, flag.load(Relaxed));
> >> >> +
> >> >> +        *flag.get_mut() = true;
> >> >> +        assert_eq!(Ok(true), flag.cmpxchg(true, false, Full));
> >> >> +        assert_eq!(false, flag.load(Relaxed));
> >> >> +    }
> >> >> +
> >> >>      #[test]
> >> >>      fn atomic_ptr_tests() {
> >> >>          let mut v = 42;
> >> >> -- 
> >> >> 2.43.0
> >> >> 
> >> 
> 
