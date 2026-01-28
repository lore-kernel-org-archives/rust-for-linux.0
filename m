Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFFA33B6E0
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 23:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769644610; cv=none; b=H3RHeR9nEv0XkuRKKX4qcFcg6cd8R3GFBqz/gR3Hgtps3vdf2WqGcMTaG1ygmyMwg+zUI7JanU8L7SR+dD4Ht3Z7ed+makRtekr68AH9phW/2FV+ApbtmZgn3TTa/sCbv9m3TjuzCvtDjqsfe+2/9XPf0PUzf41E/ayxMr8a/ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769644610; c=relaxed/simple;
	bh=XgjO+cs6pRsa3wwRa0d5aJ97gdA5DUHLV0ogLChYTT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aV/2mlrqkqpSLlTmvWmT3w7XoKMWN+ywbRy6gaUJGfZcc2aJxHgzK0SYo3hKzxWGEeI/CWUnhZAV9YGEzFDMZUh5gUEc4LC0KF0aP7k3Nr09spjrDg6DvP7fCta5xFtB4nXGbLjE5gLxO7SLoTb0HbObfWZQ715rbc34ZC9CoZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t2iUjLlL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t2iUjLlL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42303C16AAE;
	Wed, 28 Jan 2026 23:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769644609;
	bh=XgjO+cs6pRsa3wwRa0d5aJ97gdA5DUHLV0ogLChYTT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t2iUjLlL6BH/vYRXkkQvBdTJ3/KxFHl1bqQOc4sLd3e5xI2VdrChPlo6JzKSbEmhh
	 NOTMCLCPED5qAJDTpAM6+Lnotw6BG5gjY4ha7e4ruZHG3c5HyQcLLNzcuQpy2Jtz1n
	 JYsieWo9tZWCyN6yhrq2oQzCYXYBV269nc0QyLEFGjlod+1dfDUOOwhmNSZg5h+Y5b
	 JpgWzFVqC7yae0qQRvKSD8N/pIhnSbpMb9XvuSF3g7Y6cY/1+aNUfxc29TisLrPekg
	 n03oaevEzAHMA8MV3yc5FYRGrVWul2Lydxkn+D71n+njn1iDP9TE+UvjAXHWR7CsBd
	 RsJ48C/E7uohg==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4620AF40070;
	Wed, 28 Jan 2026 18:56:48 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 28 Jan 2026 18:56:48 -0500
X-ME-Sender: <xms:QKJ6aXt8JHOEU4k_g1vDXR_6zf9GSCKggnK1y9d9hTHowqpvIcNJjA>
    <xme:QKJ6aY71bW3igqbTNXXuPlAtnHdvhLcZnBqzSz3NYtrEcJBFiiu4ncFlPolU2TEFp
    dNEyngT1Y7pGSibp_MCVebq6aiSMdecTV7Ts-S18SFcpSqxbrG9>
X-ME-Received: <xmr:QKJ6aaiROkauLAOTZ3LzEnBMQgwcpWEn9ciygMZ12E-sSeO-1FRnkgufpS_YHVAruGe277bNC_NsSwK31PJtRuFnmye-GVHu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieegieelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthho
    mhhosegrlhhirghsihhnghdrnhgvthdprhgtphhtthhopehgrghrhiesghgrrhihghhuoh
    drnhgvthdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgt
    phhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghrii
    esihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopegsjhho
    rhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:QKJ6aSnEPtMcvpZvDIgKGRCoaD7QLgYBCCidnXJ2KrA2ae4SJ5rBKw>
    <xmx:QKJ6aRtmbdT6hocjBuVUueeKUjNdPbmDRcoHQC0saohmhz7BZKC1Ug>
    <xmx:QKJ6aQAb6PoRjANsd7c31Joo0lD8t-4l7hR1CGIteqX-OVldskDyyQ>
    <xmx:QKJ6aeUGZ1WO01KwmFrvKchfBH32EkF9wtiWKjdLt2DIgl1v7ehiGA>
    <xmx:QKJ6aZHrsb0rgCxoG29s1UQDfg_ysjEGFK0JYEyErX4h84wLzVScN90e>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 18:56:47 -0500 (EST)
Date: Wed, 28 Jan 2026 15:56:46 -0800
From: Boqun Feng <boqun@kernel.org>
To: FUJITA Tomonori <tomo@aliasing.net>
Cc: gary@garyguo.net, boqun.feng@gmail.com, ojeda@kernel.org,
	peterz@infradead.org, will@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
	lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v1 1/2] rust: sync: atomic: Add perfromance-optimal Flag
 type for atomic booleans
Message-ID: <aXqiPmSiPmOC5M2m@tardis.local>
References: <20260128115200.3820113-2-tomo@aliasing.net>
 <DG09KR1O5JL3.3VYRDKRR8UXX8@garyguo.net>
 <aXpFEhJxbF6cRhAZ@tardis.local>
 <20260129.082243.2839763699303055.fujita@bee>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129.082243.2839763699303055.fujita@bee>

On Thu, Jan 29, 2026 at 08:22:43AM +0900, FUJITA Tomonori wrote:
> On Wed, 28 Jan 2026 09:19:14 -0800
> Boqun Feng <boqun@kernel.org> wrote:
> 
> > On Wed, Jan 28, 2026 at 01:41:41PM +0000, Gary Guo wrote:
> >> On Wed Jan 28, 2026 at 11:51 AM GMT, FUJITA Tomonori wrote:
> >> > From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> >> >
> >> > Add AtomicFlag type for boolean flags.
> >> >
> >> > Document when AtomicFlag is generally preferable to Atomic<bool>: in
> >> > particular, when RMW operations such as xchg()/cmpxchg() may be used
> >> > and minimizing memory usage is not the top priority. On some
> >> > architectures without byte-sized RMW instructions, Atomic<bool> can be
> >> > slower for RMW operations.
> >> >
> >> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> >> > ---
> >> >  rust/kernel/sync/atomic.rs           | 121 +++++++++++++++++++++++++++
> >> >  rust/kernel/sync/atomic/predefine.rs |  17 ++++
> >> >  2 files changed, 138 insertions(+)
> >> >
> >> > diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> >> > index 4aebeacb961a..7d06193709c0 100644
> >> > --- a/rust/kernel/sync/atomic.rs
> >> > +++ b/rust/kernel/sync/atomic.rs
> >> > @@ -560,3 +560,124 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
> >> >          unsafe { from_repr(ret) }
> >> >      }
> >> >  }
> >> > +
> >> > +/// # Invariants
> >> > +///
> >> > +/// `padding` must be all zeroes.
> >> > +#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
> >> 
> >> This config repeats too much.
> >> 
> >> I think probably we should just not let `AtomicFlag` alias `Atomic<u8>` (this
> >> has the benefit of creating a type mismatch, so code cannot rely on this on x86
> >> and fail to compile on, say, RV).
> >> 
> >> This way the `struct Flag`, `struct AtomicFlag` and `impl AtomicFlag` would
> >> always exist and the config is only needed for much fewer times (plus, you don't
> >> need to macro to avoid duplicating docs).
> >> 
> > 
> > You probably still need configs for `#[repr(align(_))]` in that case or
> > two definitions of `Flag` anyway. but yes the duplicate docs can be
> > avoided, so are some impl blocks.
> 
> If we go with cfg_attr, we get something like the followings:
> 
> #[cfg_attr(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64), repr(C))]
> #[cfg_attr(
>     not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)),
>     repr(C, align(4))
> )]
> #[derive(Clone, Copy)]
> struct Flag {
>     #[cfg(all(
>         target_endian = "big",
>         not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))
>     ))]
>     padding: [u8; 3],
>     bool_field: bool,
>     #[cfg(all(
>         target_endian = "little",
>         not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))
>     ))]
>     padding: [u8; 3],
> }
> 
> I think that two definitions of `Flag` is more readable here.
> 

Agreed ;-)

> 
> > BTW, while we are at it, maybe we should use arches that don't support
> > byte-wise atomic instructions here instead of the ones do, i.e. 
> > 
> >     #[cfg(not(any(CONFIG_RISCV, CONFIG_LOONGARCH)))]
> >     #[repr(C)]
> >     #[derive(Clone, Copy)]
> >     struct Flag {
> >         bool_flag: bool,
> >     }
> > 
> >     #[cfg(any(CONFIG_RISCV, CONFIG_LOONGARCH))]
> >     #[repr(C, align(4)]
> >     #[derive(Clone, Copy)]
> >     struct Flag {
> >         #[cfg(target_endian = "big")]
> >         padding: [u8; 3],
> >         bool_flag: bool,
> >         #[cfg(target_endian = "little")]
> >         padding: [u8; 3],
> >     }
> > 
> > and we should do
> > 
> >     unsafe impl AtomicType for Flag {
> >         #[cfg(any(CONFIG_RISCV, CONFIG_LOONGARCH)))]
> > 	type Repr = i32;
> >         #[cfg(not(any(CONFIG_RISCV, CONFIG_LOONGARCH)))]
> > 	type Repr = i8;
> >     }
> > 
> > as well.
> 
> Is the idea to list only arches without byte-wise atomics so new
> byte-atomic-capable arches don't require updates?

Yes, but I guess I was wrong here. More archs are actually
byte-atomic-incapable, so what you had is making sense. Feel free to
ignore that.

Regards,
Boqun
