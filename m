Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3312A22B8B0
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 06:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768716616; cv=none; b=U/uv3lr4S96CJTy4yzSz1aBxJMjnwnbRrWR60FIRxHt5Ppwh6WtnOZhEB+otKj0W1rgxvd9hb1BRGHobpCPoKiJt/VG9UVMqk24hfafuR6+VTmBrnmkMmr0qr59E5h1FVnIX01kUCEPz74GysC85aZowF1qHx+dKQhQjH5GP4Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768716616; c=relaxed/simple;
	bh=DIXu1xJBWswCmGBRxFXgpv7cNPr9e4eOhTTy17+c9Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdK2N7uhD23pEUXMGwfgF1ZPITcLYQ6GUQbukdmo+zCoLXuv6bpaCDzhTt2ef29FNhc+U6Wx7jDVWq+Knxcb2yMaFmJWhWinNpuE6xZy5POD6TcsfIXgj6hXBr1K0R6jJw9rT9ZnHHWe2iaOMyyvGCZ27zsi6GeOmg1KBr/Tbp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PkFoGQbv; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PkFoGQbv"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b6bfb0004aso3781236eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 22:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768716614; x=1769321414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOiV0D+CNI6UsixBopTqJbDRkz4TgZfrfHbV+iHjkxE=;
        b=PkFoGQbv7d4izRvnHAfI6tsJxdfbZSYcXHyfV9Mgd/7UiJJ3wqKmIaRgeCgzFOmtD2
         nrLiTCv4ZfbljVntrMjr2INuti7Ke4nwXrdxrKJQmbxGmeEe3PogINeOvV2KOapVS6n8
         rrDgjp3ujpOpKITT6l6d5DWWvgxPpXta23wSk1k6l7rHYvBJXM4t3Q8iIUmPd03lESKB
         Z0d57eRcFzF05ilnTCAR69LeDBhvZl+ADcegdIeeiz8YviGTN6hOKIvYr3oE4JyHor2U
         1thpqyGjmk9RRrXc1KmAMu/oXllRyw8RhmvzkbPicITXXsP1ok0c1I2WwL4PZFNPsFMS
         mAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768716614; x=1769321414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sOiV0D+CNI6UsixBopTqJbDRkz4TgZfrfHbV+iHjkxE=;
        b=V8XdWz/f9OVRbl2DvFw0TI7imnfl6QZQr/yL4jy6CMNIO/UjD09csh0tnp0WDpWOk7
         BhTIIcExgw1XyZmG8PXCawcl31L9h0LeK4MwRH1DyNQCGm3OVVTMSBAnXkfnAKnkHcLc
         LLokORlY3B6FQ4nrYWC1+I1OaV2D6K+qagrcb879WKWUzZ6s17M7Wda9ZNC62/UveHmp
         sLJCR3vb/9pq5dgUxClYpEWNhNkiD5fPnPOSqUS8fADi8vaf96E2VUaY79hoNI8owBRk
         gIh6+b3ETRsNvQjRj7Nf0RA2ncbA/1axE8PfvVXBYU+cx2peY5Nrdz3xKBIO+mtvW3DN
         GDPQ==
X-Gm-Message-State: AOJu0Yw/vDY9YzDPQBi1Hv1nx5kllDZABlJhaMoUXF8gg2Axyu3M03Qa
	M0mRVfd14zSNKYqNF7MAIFbeY/aEXonINjYJWgE6WgULpZO2enxam+WPUWUDvMfc
X-Gm-Gg: AY/fxX5LJiXEHK7+B/Ikhgh0nAGCFf+ODfooOXKZw6ET+zXJXUpWTdKrqhfHboCzVFM
	ea1ncihtlglNuCQaB9jOEDyKG3dVS0nJpIdUveh3dq3DHz5kh6+gHXf9WLXZS7wKndgvlcYrFaI
	hIHEHK5OuS9+urEWPNzU9+MBFUQucIzYrSNpDVfuepAff2FNFZALlYrRWkYle150kOX7Vx+DDvZ
	YSnh44nZV4Co7koehIVhZ7+uBR9003MME9YazM9AjRnWjjP25wHfKETTnaR6/XAd+LFANyxtpUw
	At1c5DwdFr3t9UEXtUbDBq2GBb+XqWrR/aGiRCrNHSx1IzWQVuwc/6rBjgBLmz2EJffELanAP5p
	Owr473A+Ro4sxaFCJQTdWjqiMbGXGFAKj2gWkTdyZzwAySM5BaUy3U7Z/KSSS98nB8bXC/jciyC
	Sa5ehMCdZwa7shIi0ze0Gm4jNAQ+iDDZPNfWxQgomdwSSoTm2+horoIQhgMDLg/0IYXj0pz1ME4
	RyfrVPWNiKZ+zM=
X-Received: by 2002:a05:622a:14cb:b0:501:4b22:b9c0 with SMTP id d75a77b69052e-502a175e37dmr104860631cf.79.1768709979829;
        Sat, 17 Jan 2026 20:19:39 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6214c5sm54662016d6.25.2026.01.17.20.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 20:19:39 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5F538F4007B;
	Sat, 17 Jan 2026 23:19:38 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 17 Jan 2026 23:19:38 -0500
X-ME-Sender: <xms:Wl9saajb0DH3KIV8b33TqfrgR5j4k10izHdb2sqmhk9TFfWcktvEhA>
    <xme:Wl9saUFslWPPVLFMNQYNwRty1L8Zh1R2xOGYAI1NctpwvWFotCONqubeb_YgLJ5lQ
    lYV_nnSHx6pgnXDplRFPqVg-Y_jk6vLDBdDlIh-S6qmNm1R49aVKA>
X-ME-Received: <xmr:Wl9sabLaOdSVrjVtl-DFjDPjqxdGBfypElxy89kXs2285BO1LH5MSO9J>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeefjeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepvdeipdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopehruhhsthdqfh
    horhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrtg
    husehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrd
    gtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvg
    hrhihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:Wl9safCIGHBhENOWy5WUjh1Bh9zd3-Y8log6Y52dZw16mxAqqYJGTg>
    <xmx:Wl9saRD1kXkA1n3u-JxGcvUDiP4LWh6MBRACLR_26PAyfaMbcsI4MA>
    <xmx:Wl9saQlvwpcdVNe5xNSpWUZuAmfFi74eBCgHCzXi7fdPsJ82d-2Fjw>
    <xmx:Wl9safgxX65m4fwY9ZAYk8pXI1S45l8DlnBw5au2XceaeoBltcqsWQ>
    <xmx:Wl9saZdc5zghvgxioK2PiaVpuo_cMMPeyLVS0IYzovuz24pULWBCMM19>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 23:19:37 -0500 (EST)
Date: Sun, 18 Jan 2026 12:19:35 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH 4/5] rust: sync: atomic: Add Atomic<*mut T> support
Message-ID: <aWxfV4Y3fnNR0Kje@tardis-2.local>
References: <20260117122243.24404-1-boqun.feng@gmail.com>
 <20260117122243.24404-5-boqun.feng@gmail.com>
 <DFR0Z3KHYS62.37Y0R286DPTUQ@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFR0Z3KHYS62.37Y0R286DPTUQ@garyguo.net>

On Sat, Jan 17, 2026 at 05:03:15PM +0000, Gary Guo wrote:
> On Sat Jan 17, 2026 at 12:22 PM GMT, Boqun Feng wrote:
> > Atomic pointer support is an important piece of synchronization
> > algorithm, e.g. RCU, hence provide the support for that.
> >
> > Note that instead of relying on atomic_long or the implementation of
> > `Atomic<usize>`, a new set of helpers (atomic_ptr_*) is introduced for
> > atomic pointer specifically, this is because ptr2int casting would
> > lose the provenance of a pointer and even though in theory there are a
> > few tricks the provenance can be restored, it'll still be a simpler
> > implementation if C could provide atomic pointers directly. The side
> > effects of this approach are: we don't have the arithmetic and logical
> > operations for pointers yet and the current implementation only works
> > on ARCH_SUPPORTS_ATOMIC_RMW architectures, but these are implementation
> > issues and can be added later.
> >
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> 
> I am happy that this is now using dedicated helpers for pointers, and not going
> through an intermediate integer which can lose provenance.
> 
> Some feedbacks below, but in general LGTM.
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> 

Thanks!

> > ---
> > diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
[...]
> > index 4aebeacb961a..4d2a5228c2e4 100644
> > --- a/rust/kernel/sync/atomic.rs
> > +++ b/rust/kernel/sync/atomic.rs
> > @@ -51,6 +51,10 @@
> >  #[repr(transparent)]
> >  pub struct Atomic<T: AtomicType>(AtomicRepr<T::Repr>);
> >  
> > +// SAFETY: `Atomic<T>` is safe to transfer between execution contexts because of the safety
> > +// requirement of `AtomicType`.
> > +unsafe impl<T: AtomicType> Send for Atomic<T> {}
> > +
> >  // SAFETY: `Atomic<T>` is safe to share among execution contexts because all accesses are atomic.
> >  unsafe impl<T: AtomicType> Sync for Atomic<T> {}
> >  
> > @@ -68,6 +72,11 @@ unsafe impl<T: AtomicType> Sync for Atomic<T> {}
> >  ///
> >  /// - [`Self`] must have the same size and alignment as [`Self::Repr`].
> >  /// - [`Self`] must be [round-trip transmutable] to  [`Self::Repr`].
> > +/// - [`Self`] must be safe to transfer between execution contexts, if it's [`Send`], this is
> > +///   automatically satisfied. The exception is pointer types that are even though marked as
> > +///   `!Send` (e.g. raw pointers and [`NonNull<T>`]) but requiring `unsafe` to do anything
> > +///   meaningful on them. This is because transferring pointer values between execution contexts is
> > +///   safe as long as the actual `unsafe` dereferencing is justified.
> 
> I think the discussion about `Send` on pointers should be moved to the `impl<T>
> AtomicType for *mut T` side.
> 

The reason I put something here was to answer the potential question
"why don't you require AtomicType being a subtrait of Send?", that's
more of a question for people who read about `AtomicType`, so I figured
we need some explanation. But I'm fine if you think we should move some
of the comments to the impl block, or we duplicate some. Although I
don't think the current version is worse. Considering we do:

    /// - [`Self`] must have the same size and alignment as [`Self::Repr`].
    /// - [`Self`] must be [round-trip transmutable] to  [`Self::Repr`].
    /// - [`Self`] must be safe to transfer between execution contexts, if it's [`Send`], this is
    ///   automatically satisfied.

for AtomicType, I'm not sure someone read about `AtomicType` could have
everything they need to understand why it's not `: Send`.

[...]
> > +// SAFETY:
> > +//
> > +// - `*mut T` has the same size and alignment with `*const c_void`, and is round-trip
> > +//   transmutable to `*const c_void`.
> > +// - `*mut T` is safe to transfer between execution contexts. See the safety requirement of
> > +//   [`AtomicType`].
> > +unsafe impl<T: Sized> super::AtomicType for *mut T {
> > +    type Repr = *const c_void;
> > +}
> 
> How about *const T?
> 

In general I want to avoid const raw pointers since it provides very
little extra compared to mut raw pointers. For compiler optimization,
provenenace is more important than "const vs mut" modifier, for
dereference, it's unsafe anyway and users need to provide reasoning
(including knowing the provenance and other accesses may happen to the
same address), so I feel the type difference of "*const T" vs "*mut T"
doesn't do anything extra either.

Think about it, in Rust std, there are two pointer types only maps to
"*mut T": NonNull<T> (as_ptr() returns a `*mut T`) and AtomicPtr<T>
(as_ptr() returns a `*mut *mut T`). And there is no type like
NonNullConst<T> and AtomicConstPtr<T>. This is a lint to me that we may
not need to support `*const T` in most cases.

But maybe I'm missing something? If you have a good reason, we can
obviously add the support for `*const T`.

Regards,
Boqun

> > +
> >  // SAFETY: `i32` has the same size and alignment with itself, and is round-trip transmutable to
> >  // itself.
> >  unsafe impl super::AtomicType for i32 {
> > @@ -215,4 +226,16 @@ fn atomic_bool_tests() {
> >          assert_eq!(false, x.load(Relaxed));
> >          assert_eq!(Ok(false), x.cmpxchg(false, true, Full));
> >      }
> > +
> > +    #[test]
> > +    fn atomic_ptr_tests() {
> > +        let mut v = 42;
> > +        let mut u = 43;
> > +        let x = Atomic::new(&raw mut v);
> > +
> > +        assert_eq!(x.load(Acquire), &raw mut v);
> > +        assert_eq!(x.cmpxchg(&raw mut u, &raw mut u, Relaxed), Err(&raw mut v));
> > +        assert_eq!(x.cmpxchg(&raw mut v, &raw mut u, Relaxed), Ok(&raw mut v));
> > +        assert_eq!(x.load(Relaxed), &raw mut u);
> > +    }
> >  }
> 
