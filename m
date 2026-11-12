Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494530;
	b=K4ODIwgqfJGDR0bBIvjAAu8bo4ekCi3pbAaYt1NK9Iv9qHRc770YJC0MRmgW2DvP/5Pl
	 Jyha9RPdfQOX/3QDOfFXqnAPBtSwucFUwh7+lDXu1q8MbX5OCdwWemAdMPhELMBb5eu/1
	 z3k3GhF0sWwXXC5FhFduuA5VtxJG/alZkxBDOaO07pl7UcVtQXM2HwvJsSQ5j167ij6dS
	 Lc05V66R9WvWauGsebO6MLz7FW1DkKq8NpuX+xKjAkQ3iKYS+BM9nFA7Ki+CSUlws/SdX
	 m1NV69LNepHh/Cu3a95garGON7TqpSpR6E44A5plRM5oXPsL1wekgeHP3YcO15GpTZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494530;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=YXM0Wvdr0eBO6GxRfOSKus0wOw5DtryttRn9R+Ft0ug=;
	b=qdjLd3Ztt67ghpOmfVGo/H85AUbzLanRZvo5DPl+43vePLI5EFN+w369R49e8v1Ux0pF
	 N3heEZfLr4OaLNA8uVKYVx4Ga4i6Z1gL/5h2elkBsp4u325fmXSBtZPfZV41m77xmbWff
	 oGgY8z7MaNuNVxeeEhi+8IKp6llYQxWpb/tx1lZu30lVvw+rrFJPjZYOx3lqVkBaykKSw
	 BZHJw/5DKBn0pvdCiMc9E5jV0OEx05HtPyNZ9/uXzH82+y+D1WCXYTmpItRrD/cTSq+k+
	 4MBx9ZauB1AOAs2UDYRMUX2AUBgwDBEh/c0yl6MLMZWxeTcYUapi9iA2J6bdiHWLEkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onurozkan.dev;
	spf=pass smtp.mailfrom=onurozkan.dev;
	dkim=pass header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=XOyiAHUB;
	arc=none smtp.remote-ip=109.224.244.108
Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F290F606A31C;
	Thu, 12 Nov 2026 14:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F290F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=XOyiAHUB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1794494525; x=1794753725;
	bh=YXM0Wvdr0eBO6GxRfOSKus0wOw5DtryttRn9R+Ft0ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=XOyiAHUB8vxfb6rl5aQ7DS1hKbW0Otz+B3ZlTVSR4tyg2RCIBimHD8+L20kn4IHZb
	 8d1FHM74SxWD9TWSi19LU/Dm8BbbIHVCgqJ9jWtTrkak3HX1Fmmm+sWzmKWhH/7iRT
	 nqbR5BkwruuzKXliTMKnosGBNK71w1HjcnB/1nMzT7Bk+19sGjTgdkPkPIefUBaFK/
	 YRugjSdoPgx3Pllm426syyoS/na7PAtvHB3NEben17DI0YjbEXdupTew/WjNPztqCB
	 IjKr6/qLTjNaevwm9E2U0RmoDKCoKgah4fm3HJrFI6hF+8TUvVd6CweYI8ioSUA2Qe
	 ocHBvjKEQS6iQ==
X-Pm-Submission-Id: 4jQNQ04C7pz1DDLZ
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Beata Michalska <beata.michalska@arm.com>
Cc: rust-for-linux@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	felipe_life@live.com,
	daniel@sedlak.dev,
	daniel.almeida@collabora.com,
	thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 6/7] rust: ww_mutex: implement DynLockSet
Date: Thu, 12 Nov 2026 17:41:46 +0300
Message-ID: <20261112144158.278467-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <avTIMTuuFnxHhS74@arm.com>
References: <20261020153112.299745-1-work@onurozkan.dev> <20261020153112.299745-7-work@onurozkan.dev> <avTIMTuuFnxHhS74@arm.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Nov 2026 20:55:29 +0100=0D
Beata Michalska <beata.michalska@arm.com> wrote:=0D
=0D
> Hi Onur,=0D
> =0D
> On Tue, Oct 20, 2026 at 06:29:42PM +0300, Onur =C3=96zkan wrote:=0D
> > DynLockSet is a high-level and safe API built on top of ww_mutex=0D
> > for dynamically discovered locks. It keeps acquired locks held,=0D
> > handles repeated objects and provides access to their data.=0D
> > =0D
> > When EDEADLK is hit it drops all held locks and waits for the=0D
> > contended mutex. It then retries the given (by the user)=0D
> > locking algorithm with that mutex held and the same acquire=0D
> > context until it succeeds.=0D
> > =0D
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> > ---=0D
> >  rust/kernel/sync/lock/ww_mutex.rs             |   4 +=0D
> >  .../sync/lock/ww_mutex/acquire_ctx_backoff.rs | 138 ++++++-=0D
> >  .../kernel/sync/lock/ww_mutex/dyn_lock_set.rs | 351 ++++++++++++++++++=
=0D
> >  3 files changed, 489 insertions(+), 4 deletions(-)=0D
> >  create mode 100644 rust/kernel/sync/lock/ww_mutex/dyn_lock_set.rs=0D
> > =0D
> > diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/=
ww_mutex.rs=0D
> > index 2249214959b1c..fea2603d1bd1f 100644=0D
> > --- a/rust/kernel/sync/lock/ww_mutex.rs=0D
> > +++ b/rust/kernel/sync/lock/ww_mutex.rs=0D
> > @@ -7,6 +7,8 @@=0D
> >  //! [`AcquireCtx`] to track ordering and ensure forward progress.=0D
> >  //!=0D
> >  //! [`ww_transaction`] provides automatic deadlock recovery for ordina=
ry guards.=0D
> > +//! Use [`DynLockSet::ww_transaction`] for dynamically discovered lock=
s and=0D
> > +//! separate acquisition and work callbacks.=0D
> >  //!=0D
> >  //! See srctree/Documentation/locking/ww-mutex-design.rst for more det=
ails.=0D
> >  =0D
> > @@ -28,10 +30,12 @@=0D
> >      AcquireCtxBackoff, //=0D
> >  };=0D
> >  pub use class::Class;=0D
> > +pub use dyn_lock_set::DynLockSet;=0D
> >  =0D
> >  mod acquire_ctx;=0D
> >  mod acquire_ctx_backoff;=0D
> >  mod class;=0D
> > +mod dyn_lock_set;=0D
> >  =0D
> >  /// A wound-wait (ww) mutex that is powered with deadlock avoidance=0D
=0D
[...]=0D
=0D
> > +=0D
> > +    /// Acquires a dynamic set, retrying on deadlock then runs `work` =
once.=0D
> > +    ///=0D
> > +    /// Each call releases existing locks and starts a new transaction=
. Retries keep=0D
> > +    /// the same ticket. The set retains its allocation across retries=
 and calls.=0D
> > +    ///=0D
> > +    /// `work` runs once after acquisition and must not acquire more l=
ocks. Its errors=0D
> > +    /// are returned without retrying. All locks and pending backoff s=
tate are released=0D
> > +    /// on return. The callbacks must not change the set's context or =
nest transactions=0D
> > +    /// on that context.=0D
> > +    ///=0D
> > +    /// # Panics=0D
> > +    ///=0D
> > +    /// Panics if the context holds caller-owned locks outside this se=
t at a transaction=0D
> > +    /// boundary, including forgotten guards.=0D
> > +    ///=0D
> > +    /// # Examples=0D
> > +    ///=0D
> > +    /// ```=0D
> > +    /// use kernel::{=0D
> > +    ///     define_ww_class,=0D
> > +    ///     prelude::*,=0D
> > +    ///     sync::lock::ww_mutex::{=0D
> > +    ///         AcquireCtx,=0D
> > +    ///         AcquireCtxBackoff,=0D
> > +    ///         DynLockSet,=0D
> > +    ///         Mutex, //=0D
> > +    ///     }, //=0D
> > +    /// };=0D
> > +    /// use pin_init::stack_pin_init;=0D
> > +    ///=0D
> > +    /// define_ww_class!(CLASS);=0D
> > +    ///=0D
> > +    /// stack_pin_init!(let first =3D Mutex::new(1, &CLASS));=0D
> > +    /// stack_pin_init!(let second =3D Mutex::new(2, &CLASS));=0D
> > +    ///=0D
> > +    /// stack_pin_init!(let acquire_ctx =3D AcquireCtx::new(&CLASS));=
=0D
> > +    /// let ctx =3D AcquireCtxBackoff::new(acquire_ctx.as_mut());=0D
> > +    /// let mut set =3D DynLockSet::new(&ctx);=0D
> > +    ///=0D
> > +    /// set.ww_transaction(=0D
> > +    ///     |set| {=0D
> > +    ///         set.lock(&first)?;=0D
> > +    ///=0D
> > +    ///         if set.with_locked(&first, |value| *value > 0)? {=0D
> > +    ///             set.lock(&second)?;=0D
> > +    ///         }=0D
> > +    ///=0D
> > +    ///         Ok(())=0D
> > +    ///     },=0D
> > +    ///     |set| set.with_locked(&first, |value| *value +=3D 1),=0D
> > +    /// )?;=0D
> > +    /// # Ok::<(), Error>(())=0D
> > +    /// ```=0D
> > +    pub fn ww_transaction<R>(=0D
> > +        &mut self,=0D
> > +        mut acquire: impl FnMut(&mut Self) -> Result,=0D
> > +        work: impl FnOnce(&mut Self) -> Result<R>,=0D
> > +    ) -> Result<R> {=0D
> So I have been pondering a bit on that one, in a context of drm_exec and=
=0D
> potentially having a Rust version of drm_gpuvm_exec_lock & co, and I'm ha=
ving=0D
> some doubts really. The `drm_exec` implementation, apart from locking and=
=0D
> reserving fences, also plays with the `drm_gem_object` reference counting=
.=0D
> The `drm_exec` pairs each tracked lock with a GEM reference and releases =
both=0D
> during backoff or cleanup. Proposed implementation makes it rather cumber=
some=0D
> to drop the reference when unlocking the mutex on a rollback (or backoff =
in=0D
> this series terminology). I assume that would require some sort of extens=
ion=0D
> to the `DynLockSet` ? Or am I missing smth ?=0D
> =0D
> ---=0D
> BR=0D
> Beata=0D
=0D
Current API tracks the locks but leaves ownership of the objects to the cal=
ler=0D
and, yes, we need some sort of extension on DynLockSet probably together wi=
th=0D
AcqureCtx and its wrapper type.=0D
=0D
Does current API limit your GPUVM use case? Could you share an example of t=
he=0D
flow you need? I would be happy to extend the API if that's needed.=0D
=0D
Thanks,=0D
Onur=0D
=0D
> =0D
> > +        let ctx =3D self.ctx;=0D
> > +        self.clear();=0D
> > +        ctx.restart();=0D
> > +=0D
> > +        let result =3D retry(ctx, || {=0D
> > +            if let Some(guard) =3D self.ctx.take_contended_guard() {=0D
> > +                self.add_guard(guard)?;=0D
> > +            }=0D
> > +=0D
> > +            let result =3D acquire(self);=0D
> > +            if result.is_err() {=0D
> > +                self.clear();=0D
> > +            }=0D
> > +=0D
> > +            result=0D
> > +        });=0D
> > +=0D
> > +        let result =3D result.and_then(|()| work(self));=0D
> > +=0D
> > +        self.clear();=0D
> > +        ctx.clear_backoff();=0D
> > +        ctx.assert_no_locks_held();=0D
> > +=0D
> > +        result=0D
> > +    }=0D
> > +=0D
=0D
[...]=0D
=0D
> > +=0D
> > +        assert_eq!(set.with_locked(&mutex, |v| *v), Err(EINVAL));=0D
> > +=0D
> > +        Ok(())=0D
> > +    }=0D
> > +=0D
> > +    #[test]=0D
> > +    fn test_class_mismatch() -> Result {=0D
> > +        stack_pin_init!(let mutex =3D Mutex::new(5, &TEST_WOUND_WAIT_C=
LASS));=0D
> > +        stack_pin_init!(let acquire_ctx =3D AcquireCtx::new(&TEST_WAIT=
_DIE_CLASS));=0D
> > +        let ctx =3D AcquireCtxBackoff::new(acquire_ctx.as_mut());=0D
> > +        let mut set =3D DynLockSet::new(&ctx);=0D
> > +=0D
> > +        assert_eq!(set.lock(&mutex), Err(EINVAL));=0D
> > +        assert!(!mutex.is_locked());=0D
> > +=0D
> > +        Ok(())=0D
> > +    }=0D
> > +}=0D
> > -- =0D
> > 2.51.2=0D
> > =0D
> > =0D
