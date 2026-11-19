Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092159;
	b=nN7PDJVOpDtoakNJd+5iyAlZdajkkjpsTY5BadFuABBD5YIO1bzn+KpvXdFE/QwN6adq
	 faEsURAWoLG5eSn9XSG5YLPIzoZC5wpuo+nUp6iU8WLhXEnHtgq0obsYTssQq2Jl8HJ72
	 BjWfNHxYH/1gFL1/LzdnSTe5j4od6btRHBloc3CQEoNM0f+/dVDVGN+pHGUU8MO8ib1sc
	 rvENtbtt2QKqtTt2Ktpn02GtrwueYG6hmOk2QocLm5mmGoZ3Oi2F/yoxHfLqAMB084e21
	 amr54TVJZccecb0TDxTXL1u2QOV5tPSd9AJYz8xO1vQ+8aWLsFxZILiAB9Lx3RMYJeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092159;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=lM4zbDVsCPSsDHsmfGlZKAfqrqsKb6hhzgK78oiN2hA=;
	b=z0MB17F7baOyDonOBrz3vMPTcJ8x4+1fgJkM93X3nTUeLDz2ptzCdEaOoSBApU3oaV2j
	 HeGIFbuQuNku8f2pxbOxIVsW9DNdAj6yI3Q2ML8UV/0m5CvRhq7BqZSahI512TnaC7kNt
	 s/xgp7L74Pqnb7Rp5/PIZkadmGu8lbwYDC5w2Hmj30RRZzJgB9OcfOvSUHAhXTg0ogWYJ
	 tZ0CcAm9sY6KXpxyAYjKB5dzKPSShJeIFFO8vZPf3EbxCfuhUREHCWhbAqb6/nTA3PK4m
	 wvnmxvPlyhDBxQzVGQkO5kVnjHflKlG/0erlvIfngUzNwXfMVmy2MhbCvMIDjohvPNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Jv765HMT;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD5A606A320;
	Thu, 19 Nov 2026 12:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDD5A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Jv765HMT
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B50D1477;
	Thu, 19 Nov 2026 04:42:35 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 074C33F673;
	Thu, 19 Nov 2026 04:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795092157; bh=RXAWQ8pRxi6qK5xZ/CdIK7XpQMSP9I8CLb20ybHXtqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jv765HMTRUh/tl1uUeem2YzCY5z2yu6D0lzjII/RqabeJHcfeLoKc5rAFYcj5L5sn
	 e7h6RL/rcCVACzoVwa0SMBaop/yCch2rqS8wmTonzebOd0AjLIpnARLYVm+M1ie+Ub
	 XhCqO5m+8CjA6PqlhBTopyJhCtrfgzcQsmqqY4Dg=
Date: Thu, 19 Nov 2026 13:42:23 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, lossin@kernel.org, lyude@redhat.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, longman@redhat.com,
	felipe_life@live.com, daniel@sedlak.dev,
	daniel.almeida@collabora.com, thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 6/7] rust: ww_mutex: implement DynLockSet
Message-ID: <av7ur4dNCArFPTSY@arm.com>
References: <20261020153112.299745-1-work@onurozkan.dev>
 <20261020153112.299745-7-work@onurozkan.dev>
 <avTIMTuuFnxHhS74@arm.com>
 <20261112144158.278467-1-work@onurozkan.dev>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261112144158.278467-1-work@onurozkan.dev>

Hi Onur,

Apologies for late reply, got wrapped up in other things.

On Thu, Nov 12, 2026 at 05:41:46PM +0300, Onur Özkan wrote:
> On Wed, 11 Nov 2026 20:55:29 +0100
> Beata Michalska <beata.michalska@arm.com> wrote:
> 
> > Hi Onur,
> > 
> > On Tue, Oct 20, 2026 at 06:29:42PM +0300, Onur Özkan wrote:
> > > DynLockSet is a high-level and safe API built on top of ww_mutex
> > > for dynamically discovered locks. It keeps acquired locks held,
> > > handles repeated objects and provides access to their data.
> > > 
> > > When EDEADLK is hit it drops all held locks and waits for the
> > > contended mutex. It then retries the given (by the user)
> > > locking algorithm with that mutex held and the same acquire
> > > context until it succeeds.
> > > 
> > > Signed-off-by: Onur Özkan <work@onurozkan.dev>
> > > ---
> > >  rust/kernel/sync/lock/ww_mutex.rs             |   4 +
> > >  .../sync/lock/ww_mutex/acquire_ctx_backoff.rs | 138 ++++++-
> > >  .../kernel/sync/lock/ww_mutex/dyn_lock_set.rs | 351 ++++++++++++++++++
> > >  3 files changed, 489 insertions(+), 4 deletions(-)
> > >  create mode 100644 rust/kernel/sync/lock/ww_mutex/dyn_lock_set.rs
> > > 
> > > diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/ww_mutex.rs
> > > index 2249214959b1c..fea2603d1bd1f 100644
> > > --- a/rust/kernel/sync/lock/ww_mutex.rs
> > > +++ b/rust/kernel/sync/lock/ww_mutex.rs
> > > @@ -7,6 +7,8 @@
> > >  //! [`AcquireCtx`] to track ordering and ensure forward progress.
> > >  //!
> > >  //! [`ww_transaction`] provides automatic deadlock recovery for ordinary guards.
> > > +//! Use [`DynLockSet::ww_transaction`] for dynamically discovered locks and
> > > +//! separate acquisition and work callbacks.
> > >  //!
> > >  //! See srctree/Documentation/locking/ww-mutex-design.rst for more details.
> > >  
> > > @@ -28,10 +30,12 @@
> > >      AcquireCtxBackoff, //
> > >  };
> > >  pub use class::Class;
> > > +pub use dyn_lock_set::DynLockSet;
> > >  
> > >  mod acquire_ctx;
> > >  mod acquire_ctx_backoff;
> > >  mod class;
> > > +mod dyn_lock_set;
> > >  
> > >  /// A wound-wait (ww) mutex that is powered with deadlock avoidance
> 
> [...]
> 
> > > +
> > > +    /// Acquires a dynamic set, retrying on deadlock then runs `work` once.
> > > +    ///
> > > +    /// Each call releases existing locks and starts a new transaction. Retries keep
> > > +    /// the same ticket. The set retains its allocation across retries and calls.
> > > +    ///
> > > +    /// `work` runs once after acquisition and must not acquire more locks. Its errors
> > > +    /// are returned without retrying. All locks and pending backoff state are released
> > > +    /// on return. The callbacks must not change the set's context or nest transactions
> > > +    /// on that context.
> > > +    ///
> > > +    /// # Panics
> > > +    ///
> > > +    /// Panics if the context holds caller-owned locks outside this set at a transaction
> > > +    /// boundary, including forgotten guards.
> > > +    ///
> > > +    /// # Examples
> > > +    ///
> > > +    /// ```
> > > +    /// use kernel::{
> > > +    ///     define_ww_class,
> > > +    ///     prelude::*,
> > > +    ///     sync::lock::ww_mutex::{
> > > +    ///         AcquireCtx,
> > > +    ///         AcquireCtxBackoff,
> > > +    ///         DynLockSet,
> > > +    ///         Mutex, //
> > > +    ///     }, //
> > > +    /// };
> > > +    /// use pin_init::stack_pin_init;
> > > +    ///
> > > +    /// define_ww_class!(CLASS);
> > > +    ///
> > > +    /// stack_pin_init!(let first = Mutex::new(1, &CLASS));
> > > +    /// stack_pin_init!(let second = Mutex::new(2, &CLASS));
> > > +    ///
> > > +    /// stack_pin_init!(let acquire_ctx = AcquireCtx::new(&CLASS));
> > > +    /// let ctx = AcquireCtxBackoff::new(acquire_ctx.as_mut());
> > > +    /// let mut set = DynLockSet::new(&ctx);
> > > +    ///
> > > +    /// set.ww_transaction(
> > > +    ///     |set| {
> > > +    ///         set.lock(&first)?;
> > > +    ///
> > > +    ///         if set.with_locked(&first, |value| *value > 0)? {
> > > +    ///             set.lock(&second)?;
> > > +    ///         }
> > > +    ///
> > > +    ///         Ok(())
> > > +    ///     },
> > > +    ///     |set| set.with_locked(&first, |value| *value += 1),
> > > +    /// )?;
> > > +    /// # Ok::<(), Error>(())
> > > +    /// ```
> > > +    pub fn ww_transaction<R>(
> > > +        &mut self,
> > > +        mut acquire: impl FnMut(&mut Self) -> Result,
> > > +        work: impl FnOnce(&mut Self) -> Result<R>,
> > > +    ) -> Result<R> {
> > So I have been pondering a bit on that one, in a context of drm_exec and
> > potentially having a Rust version of drm_gpuvm_exec_lock & co, and I'm having
> > some doubts really. The `drm_exec` implementation, apart from locking and
> > reserving fences, also plays with the `drm_gem_object` reference counting.
> > The `drm_exec` pairs each tracked lock with a GEM reference and releases both
> > during backoff or cleanup. Proposed implementation makes it rather cumbersome
> > to drop the reference when unlocking the mutex on a rollback (or backoff in
> > this series terminology). I assume that would require some sort of extension
> > to the `DynLockSet` ? Or am I missing smth ?
> > 
> > ---
> > BR
> > Beata
> 
> Current API tracks the locks but leaves ownership of the objects to the caller
> and, yes, we need some sort of extension on DynLockSet probably together with
> AcqureCtx and its wrapper type.
> 
> Does current API limit your GPUVM use case? Could you share an example of the
> flow you need? I would be happy to extend the API if that's needed.
> 

So what I have been looking into, is locking selected BO's - which is where the
`DynLockSet` comes into play. The tricky bit is when we need/should pair each
lock taken with bumped reference count on the object itself, and drop that
reference on releasing the lock. And as the first step is pretty
straightforward, the second is the one that needs a bit of attention.
That said, It has been suggested (credits for Gary) that we could simply
bump the reference count before entering the retry loop, so we do not have to go
back and forth on each retry.
I still need to explore the viability of this approach but it looks like it is
worth the shot.

---
BR
Beata
> Thanks,
> Onur
> 
> > 
> > > +        let ctx = self.ctx;
> > > +        self.clear();
> > > +        ctx.restart();
> > > +
> > > +        let result = retry(ctx, || {
> > > +            if let Some(guard) = self.ctx.take_contended_guard() {
> > > +                self.add_guard(guard)?;
> > > +            }
> > > +
> > > +            let result = acquire(self);
> > > +            if result.is_err() {
> > > +                self.clear();
> > > +            }
> > > +
> > > +            result
> > > +        });
> > > +
> > > +        let result = result.and_then(|()| work(self));
> > > +
> > > +        self.clear();
> > > +        ctx.clear_backoff();
> > > +        ctx.assert_no_locks_held();
> > > +
> > > +        result
> > > +    }
> > > +
> 
> [...]
> 
> > > +
> > > +        assert_eq!(set.with_locked(&mutex, |v| *v), Err(EINVAL));
> > > +
> > > +        Ok(())
> > > +    }
> > > +
> > > +    #[test]
> > > +    fn test_class_mismatch() -> Result {
> > > +        stack_pin_init!(let mutex = Mutex::new(5, &TEST_WOUND_WAIT_CLASS));
> > > +        stack_pin_init!(let acquire_ctx = AcquireCtx::new(&TEST_WAIT_DIE_CLASS));
> > > +        let ctx = AcquireCtxBackoff::new(acquire_ctx.as_mut());
> > > +        let mut set = DynLockSet::new(&ctx);
> > > +
> > > +        assert_eq!(set.lock(&mutex), Err(EINVAL));
> > > +        assert!(!mutex.is_locked());
> > > +
> > > +        Ok(())
> > > +    }
> > > +}
> > > -- 
> > > 2.51.2
> > > 
> > > 
