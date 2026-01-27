Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F6C360759
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 15:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769529573; cv=none; b=VlgC6PlulzjPQCFXJhkhR3E0ilvilbUl/hPkN2Nn/w50ttGH7LPYM0XLZ1IqzXT1DkcxUlbMWz2ROzrmVnMUyPbjUhNDrQOm3oFOIpK0vaz/zmXBh8mK3fnwB7KTr6syDUtw/hlUvbeh0Yc/JxcEGNkKVqkUCWL0zMZg9SDe6fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769529573; c=relaxed/simple;
	bh=x0bRRFUMVStNB7MrEPLcR443z0KvGEZWk+4QBFkRBB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qv1Xv2jTsJAq+6ish49N4lCcN5i9DlHRnP9zj2kV4Hsb1Sk1/IKCLdfciW8fx4zYwdtbj3vAQAFmIrqDPmL36k/4kQaWCOVr5qxXvfAmBSmg0RDKD2n6ueU5L46q613dpLXo28StlghpFSuvIyi9wdxPl84O2FC8Lzq7euqNyYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H80fAInF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H80fAInF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0335C116D0;
	Tue, 27 Jan 2026 15:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769529573;
	bh=x0bRRFUMVStNB7MrEPLcR443z0KvGEZWk+4QBFkRBB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H80fAInFFUc1qyEk6H4xfXnFUHZ7o4SRsixth7aiwh7SSFp7VSzu9TmqI2NI2dAbB
	 TDi40O8WM7ABwxQrHYqZCqYZ281TXxjsqa0sMUZM9dTmaV65RQ9x65sWV3wKFsqT26
	 R59KWc9W5qG6+lWeJUHXzyi6HF4EDLcBXwUveRgh6Nh8isLtQZ4z8qbG/nb53lM3Vi
	 7NIXKA+kgPKEbxFWRNkmkC0VsWCsDq7IjxMb+uJtzYsQ7YVKT60GWbOE4YKv2fHhLH
	 NA8osMLMt36k5g9hIQtkCjo8GEwyw6KqTKivAGf/OzwBM5ko2b/gHrshLrOaGOUkK+
	 2hzLq49l4zd8g==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0D284F4006D;
	Tue, 27 Jan 2026 10:59:32 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 27 Jan 2026 10:59:32 -0500
X-ME-Sender: <xms:4-B4aVEtd0sAklqh30GxsYLzPIAByHE-4wKdnq1-lwSgPhLKcn2bjQ>
    <xme:4-B4aaei3Hsmiuv2zboOD1BVNzm6iEu2zz-vbabS34SuYYiz6Ass8Uzmjz-6apibu
    s9rxMwpybbm23xyL6QUEi1yXZodXRlTwWaRwJCUqxDxtUqU-lDSpA>
X-ME-Received: <xmr:4-B4aelfPELrzzuRrqOlDoXpPElF-kBkrLexoURwndojyeE_spgwypahFSUYMpHfmbpZFaWFTXsDGyxf2bMAupA5u6uNPnUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedtleduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:4-B4aRrMcpfOlA9ekweMUX94OoBuR1pIlADznvUE_423KX0XzLBIaA>
    <xmx:5OB4aTFnn26FKlMrx4uttPqWmOHxi-UTDc8nJj_bLIxnuoFZXl0pzw>
    <xmx:5OB4afT664ORyZC35diWJaXkKp91ISc3F4j2qlMuRnvG48c0dBixow>
    <xmx:5OB4aROFi1NB5c38cSQtg88WouPtrJzWQkxRpseogc80C6VekVvqxw>
    <xmx:5OB4aUkrXnQRLS1iSs-hAtV5oz0KSa55mDCQdXkC5f7UPX6FRp5RX0ZW>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jan 2026 10:59:31 -0500 (EST)
Date: Tue, 27 Jan 2026 07:59:30 -0800
From: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: FUJITA Tomonori <tomo@aliasing.net>, ojeda@kernel.org,
	peterz@infradead.org, will@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
	lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2 1/2] rust: sync: atomic: Add AtomicFlag::get_mut
Message-ID: <aXjg4jv-3aQcy4O0@tardis.local>
References: <20260127125300.3656544-1-tomo@aliasing.net>
 <20260127125300.3656544-2-tomo@aliasing.net>
 <aXjbRq3Npqo7kr26@tardis.local>
 <DFZHIVE89VOW.1MQL8CO9K7SVI@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFZHIVE89VOW.1MQL8CO9K7SVI@garyguo.net>

On Tue, Jan 27, 2026 at 03:42:42PM +0000, Gary Guo wrote:
> On Tue Jan 27, 2026 at 3:35 PM GMT, Boqun Feng wrote:
> > [For some unknown reasons, I cannot send my reply via gmail hence reply
> >  via kernel.org account, I might switch from gmail later on]
> >
> > On Tue, Jan 27, 2026 at 09:52:59PM +0900, FUJITA Tomonori wrote:
> >> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> >> 
> >> AtomicFlag exposes a bool API, but it lacks a get_mut() equivalent to
> >> Atomic<T>::get_mut().
> >> 
> >> Also add kunit tests for AtomicFlag.
> >> 
> >> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> >> ---
> >>  rust/kernel/sync/atomic.rs           | 20 ++++++++++++++++++++
> >>  rust/kernel/sync/atomic/predefine.rs | 17 +++++++++++++++++
> >>  2 files changed, 37 insertions(+)
> >> 
> >> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> >> index 6c46335bdb8c..b6c01d9f3a46 100644
> >> --- a/rust/kernel/sync/atomic.rs
> >> +++ b/rust/kernel/sync/atomic.rs
> >> @@ -591,6 +591,26 @@ pub fn store<Ordering: ordering::ReleaseOrRelaxed>(&self, b: bool, o: Ordering)
> >>          self.0.store(b.into(), o)
> >>      }
> >>  
> >> +    /// Returns a mutable reference to the underlying flag as a `bool`.
> >> +    ///
> >> +    /// This is safe because the mutable reference of the atomic flag guarantees exclusive access.
> >> +    pub fn get_mut(&mut self) -> &mut bool {
> >> +        let byte_ptr = {
> >> +            let ptr = self.0.as_ptr().cast::<u8>();
> >> +            let offset = if cfg!(target_endian = "big") {
> >> +                core::mem::size_of::<Flag>() - 1
> >> +            } else {
> >> +                0
> >> +            };
> >
> > The idea is solid, but I want to avoid endian handling in the function,
> > I would prefer a "struct declaration" solution like:
> >
> >     #[cfg(target_endian = "big")]
> >     #[repr(align(4))]
> >     pub(super) struct FlagInner {
> >         _pad: [i8; 3],
> > 	bool_field: bool,
> >     }
> >
> >     #[cfg(target_endian = "little")]
> >     #[repr(align(4))]
> >     struct FlagInner {
> > 	bool_field: bool,
> >         _pad: [i8; 3],
> >     }
> >
> > redefine `Flag` as `BoolFlag`
> >
> >     #[repr(i32)]
> >     pub enum BoolFlag {
> >         Clear = 0,
> > 	Set = 1,
> >     }
> >
> > and `Flag` becomes a union of `BoolFlag` and `FlagInner`:
> >
> >     /// # Invariants
> >     /// `Flag` is either 0 or 1 in a i32 representation which implies
> >     /// that `inner` is always valid as long as `_pad` stays 0.
> >     pub union Flag {
> >         pub(super) inner: FlagInner,
> >         pub flag: BoolFlag,
> >     }
> >
> >     // can static_assert that `Flag` and `BoolFlag` has the same
> >     // alignement and size.
> >
> > then
> >
> >     impl AtomicFlag {
> >         pub fn get_mut(&mut self) -> &mut bool {
> > 	    let flag = self.0.get_mut(); // <- &mut Flag
> >
> >             // INVARIANTS: flag.inner._pad cannot be modified via the
> > 	    // returned reference.
> > 	    // SAFETY: Per type invariants, `flag.inner.bool_field` is
> > 	    // always a valid bool.
> > 	    unsafe { &mut flag.inner.bool_field }
> > 	}
> >     }
> >
> > Thoughts?
> >
> > Regards,
> > Boqun
> 
> I think we really need special handling for endianness for this one single
> function, so doing all the extra stuff feels really unnecessary.
> 

First, this one single function changes the design actually, previously
you can even implement a Flag as:

   enum Flag {
       Clear = 6,
       Set = 7,
   }

and it'll work, that is as long as `Flag` behaves like a bool, it's
fine. But now this function implies there is actually a bool in `Flag`,
which is kinda totally different.

Besides, by using the current implement, we set an example about "how to
do a byte offset in an i32 for different endians", and then if anyone
wanted to do something similar, very likely they would copy-paste and
modify what we have here. The potential tech debts are significant. So I
would like to do it in a right way ("right" is probably subjective, but
it comes from someone who needs to live with the code as a maintainer
;-) and I'm happy to switch to a better way if necessary).

Hope this can explain why I want to do this right now.

Regards,
Boqun

> I prefer Fujita's current version.
> 
> Best,
> Gary
> 
> >
> >> +
> >> +            // SAFETY: `ptr` is valid for `size_of::<Flag>()` bytes; `offset` selects the LSB.
> >> +            unsafe { ptr.add(offset) }
> >> +        };
> >> +
> >> +        // SAFETY: The LSB holds `0`/`1` for `Flag::Clear/Set`, and `bool` is `i8`-sized/aligned.
> >> +        unsafe { &mut *byte_ptr.cast::<bool>() }
> >> +    }
> >> +
> >>      /// Stores a value to the atomic flag and returns the previous value.
> >>      #[inline(always)]
> >>      pub fn xchg<Ordering: ordering::Ordering>(&self, b: bool, o: Ordering) -> bool {
> >> diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
> >> index 11bc67ab70a3..e413b9e9fe21 100644
> >> --- a/rust/kernel/sync/atomic/predefine.rs
> >> +++ b/rust/kernel/sync/atomic/predefine.rs
> >> @@ -351,6 +351,23 @@ fn atomic_bool_tests() {
> >>          assert_eq!(Ok(false), x.cmpxchg(false, true, Full));
> >>      }
> >>  
> >> +    #[test]
> >> +    fn atomic_flag_tests() {
> >> +        let mut flag = AtomicFlag::new(false);
> >> +
> >> +        assert_eq!(false, flag.load(Relaxed));
> >> +
> >> +        *flag.get_mut() = true;
> >> +        assert_eq!(true, flag.load(Relaxed));
> >> +
> >> +        assert_eq!(true, flag.xchg(false, Relaxed));
> >> +        assert_eq!(false, flag.load(Relaxed));
> >> +
> >> +        *flag.get_mut() = true;
> >> +        assert_eq!(Ok(true), flag.cmpxchg(true, false, Full));
> >> +        assert_eq!(false, flag.load(Relaxed));
> >> +    }
> >> +
> >>      #[test]
> >>      fn atomic_ptr_tests() {
> >>          let mut v = 42;
> >> -- 
> >> 2.43.0
> >> 
> 
