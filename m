Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0057B44F57C;
	Fri,  9 Oct 2026 13:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553246; cv=none; b=J++in0c4lYE2KJC6x/IOyop3dcT2yjZQ1tGR1sdU89NAidJUxnCNSuIme4F4o1hznAgOIuMIgV0+YiSaSTQ0yzOVBYm+bnRG70SAI8CFj9Qb/5mxBGj8FtqED1RyU4y1SCyncXXYNU70Kq0pWAHaik/SFTHpqKZmz99khpztWg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553246; c=relaxed/simple;
	bh=Xlus4qYO+0N7umQrZuhOKoq6nvuWBIJjxVyKZ6sPHTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VOT/etBjfbRgp9ee/ZcEBwfT286KYxmwzCVcKfKFlpZw54HniRAN5Ear2789hOsRcS8osnF/OjU3D8vYtiQUA0rbB98qn0QAm5mURzucX9fwCs887is8BBT3yB6vi5DwZ9gOioZdn/UpdFN9GXIjHSZpLad7v3PzIfawfzZPW9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=FNxZGWoY; arc=none smtp.client-ip=79.135.106.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="FNxZGWoY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1791553237; x=1791812437;
	bh=Wo9vi5+V4wJvCUyGT81k9xriIhL8Sz6oi0qP3s0zXW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FNxZGWoYp4VZ8duUUF+3PjKjb9+hFYA7SAGpkS/a75MfwVl5njIv0AawcLISXsfMn
	 deCS4sIr7y0aTrEoiqgHs5z58sY40c4q5Yen+h9/Dw430MoFFvpRnEV+nIU/2HD3YR
	 GPjZoI3XBihhrnd10+ligzP8PLUMpExe8XN6Nrux/qDn1MCZI3M3jy9FEgn+t/dxwH
	 AgEfS0/ZKEZcnWsQ6JB8bF8Zjv6KinhgZ10YjQnX97AgE/GC0cAZ8BW5YvLWTN9tJb
	 OFzzysQnFLf2BWaOWc5HGkuk2AbeF8Q2ZVrbZEYAKKbsulEDoNzsSzWUa/kwd+Od80
	 4O1gqYZpYqbow==
X-Pm-Submission-Id: 4j1Sfm5DX1z1DFgd
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Daniel Almeida <daniel.almeida@collabora.com>
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
	thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 5/7] rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard
Date: Fri,  9 Oct 2026 16:40:29 +0300
Message-ID: <20261009134031.314551-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <21E654F4-884E-4027-B9DF-8BF0F2BE1DC9@collabora.com>
References: <20260103073554.34855-1-work@onurozkan.dev> <20260103073554.34855-6-work@onurozkan.dev> <21E654F4-884E-4027-B9DF-8BF0F2BE1DC9@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Sep 2026 18:52:47 -0300=0D
Daniel Almeida <daniel.almeida@collabora.com> wrote:=0D
=0D
> Hi Onur,=0D
> =0D
> > +impl<'class, T: ?Sized> Mutex<'class, T> {=0D
> > +    /// Checks if this [`Mutex`] is currently locked.=0D
> > +    ///=0D
> > +    /// The returned value is racy as another thread can acquire=0D
> > +    /// or release the lock immediately after this call returns.=0D
> > +    pub fn is_locked(&self) -> bool {=0D
> > +        // SAFETY: It's safe to call `ww_mutex_is_locked` on=0D
> > +        // a valid mutex.=0D
> > +        unsafe { bindings::ww_mutex_is_locked(self.inner.get()) }=0D
> > +    }=0D
> > +=0D
> > +    /// Locks this [`Mutex`] without [`AcquireCtx`].=0D
> > +    pub fn lock(&self) -> Result<MutexGuard<'_, T>> {=0D
> > +        lock_common(self, None, LockKind::Regular)=0D
> > +    }=0D
> > +=0D
> > +    /// Similar to [`Self::lock`], but can be interrupted by signals.=
=0D
> > +    pub fn lock_interruptible(&self) -> Result<MutexGuard<'_, T>> {=0D
> > +        lock_common(self, None, LockKind::Interruptible)=0D
> > +    }=0D
> > +=0D
> > +    /// Locks this [`Mutex`] without [`AcquireCtx`] using the slow pat=
h.=0D
> > +    ///=0D
> > +    /// This function should be used when [`Self::lock`] fails (typica=
lly due=0D
> > +    /// to a potential deadlock).=0D
> > +    pub fn lock_slow(&self) -> Result<MutexGuard<'_, T>> {=0D
> > +        lock_common(self, None, LockKind::Slow)=0D
> > +    }=0D
> > +=0D
> > +    /// Similar to [`Self::lock_slow`], but can be interrupted by sign=
als.=0D
> > +    pub fn lock_slow_interruptible(&self) -> Result<MutexGuard<'_, T>>=
 {=0D
> > +        lock_common(self, None, LockKind::SlowInterruptible)=0D
> > +    }=0D
> =0D
> ^ Let's remove the slow path, this is equivalent to a normal lock(),=0D
> except that it also contains this dereference:=0D
> =0D
> static inline void=0D
> ww_mutex_lock_slow(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)=0D
> {=0D
>     int ret;=0D
> #ifdef DEBUG_WW_MUTEXES=0D
>     DEBUG_LOCKS_WARN_ON(!ctx->contending_lock); <-----=0D
> #endif=0D
>     ret =3D ww_mutex_lock(lock, ctx);=0D
>     (void)ret;=0D
> }=0D
> =0D
> But we (and most of the C API) allow null ctxs:=0D
> =0D
>     let ctx_ptr =3D match ctx {=0D
>         Some(acquire_ctx) =3D> {=0D
>             let ctx_ptr =3D acquire_ctx.inner.get();=0D
> =0D
>             // SAFETY: `ctx_ptr` is a valid pointer for the entire=0D
>             // lifetime of `ctx`.=0D
>             let ctx_class =3D unsafe { (*ctx_ptr).ww_class };=0D
> =0D
>             // SAFETY: `mutex_ptr` is a valid pointer for the entire=0D
>             // lifetime of `mutex`.=0D
>             let mutex_class =3D unsafe { (*mutex_ptr).ww_class };=0D
> =0D
>             // `ctx` and `mutex` must use the same class.=0D
>             if ctx_class !=3D mutex_class {=0D
>                 return Err(EINVAL);=0D
>             }=0D
> =0D
>             ctx_ptr=0D
>         }=0D
>         None =3D> core::ptr::null_mut(), <----=0D
>     };=0D
> =0D
> IOW, to call the slow path correctly, the Rust side would already have=0D
> to know the thing the slow path checks, and then the slow path adds=0D
> nothing.=0D
> =0D
> Even the docs say:=0D
> =0D
>  * Note that the slowpath lock acquiring can also be done by calling=0D
>  * ww_mutex_lock directly. This function here is simply to help w/w mutex=
=0D
>  * locking code readability by clearly denoting the slowpath.=0D
> =0D
> By the way, LockSet itself does not use it, so let's drop that. It also=0D
> solves some problems in the other patches too.=0D
> =0D
> > // SAFETY: `Mutex` can be shared across threads if the protected=0D
> > // data `T` can be.=0D
> > unsafe impl<T: ?Sized + Send + Sync> Sync for Mutex<'_, T> {}=0D
> =0D
> I don't exactly remember why this has to be different than sync::Lock?=0D
> i.e.:=0D
> =0D
> // SAFETY: `Lock` serialises the interior mutability it provides, so it i=
s `Sync` as long as the=0D
> // data it protects is `Send`.=0D
> unsafe impl<T: ?Sized + Send, B: Backend> Sync for Lock<T, B> {}=0D
> =0D
> Why does one require Send + Sync and the other just Send?=0D
> =0D
> > +impl<'a> MutexGuard<'a, ()> {=0D
> > +    /// Creates a [`MutexGuard`] from a raw pointer.=0D
> > +    ///=0D
> > +    /// If the given pointer refers to a mutex that is not locked,=0D
> > +    /// returns [`EINVAL`].=0D
> > +    ///=0D
> > +    /// This function is intended for interoperability with C code.=0D
> > +    ///=0D
> > +    /// # Safety=0D
> > +    ///=0D
> > +    /// The caller must ensure that:=0D
> > +    ///=0D
> > +    /// - `ptr` is a valid pointer to a `ww_mutex`.=0D
> > +    /// - `ptr` must remain valid for the lifetime `'b`.=0D
> > +    /// - The `ww_class` associated with the `ww_mutex` must be valid =
for the lifetime `'b`.=0D
> > +    pub unsafe fn from_raw<'b>(ptr: *mut bindings::ww_mutex) -> Result=
<MutexGuard<'b, ()>> {=0D
> > +        // SAFETY: By this function's safety contract, the caller guar=
antees that `ptr` points to a=0D
> > +        // valid `ww_mutex` which is the `inner` field of a `Mutex`. T=
he caller also guarantees=0D
> > +        // that both `ptr` and the associated `ww_class` are valid for=
 the lifetime `'b`.=0D
> > +        let mutex =3D unsafe { Mutex::from_raw(ptr) };=0D
> > +=0D
> > +        if !mutex.is_locked() {=0D
> > +            return Err(EINVAL);=0D
> > +        }=0D
> > +=0D
> > +        Ok(MutexGuard::new(mutex))=0D
> > +    }=0D
> > +}=0D
> =0D
> The caller must also guarantee that the current task holds this lock,=0D
> and that it won't unlock it itself afterwards. Otherwise we may release=0D
> someone else's lock, or release it twice.=0D
> =0D
> > +        LockKind::Slow =3D> {=0D
> > +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is `S=
ome`, it is pinned,=0D
> > +            // if `None`, it is set to `core::ptr::null_mut()`. Both c=
ases are safe.=0D
> > +            unsafe { bindings::ww_mutex_lock_slow(mutex_ptr, ctx_ptr) =
};=0D
> > +        }=0D
> > +        LockKind::SlowInterruptible =3D> {=0D
> > +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is `S=
ome`, it is pinned,=0D
> > +            // if `None`, it is set to `core::ptr::null_mut()`. Both c=
ases are safe.=0D
> > +            let ret =3D unsafe { bindings::ww_mutex_lock_slow_interrup=
tible(mutex_ptr, ctx_ptr) };=0D
> > +=0D
> > +            to_result(ret)?;=0D
> > +        }=0D
> =0D
> Also remove the slowpath in AcquireCtx, but for a different reason:=0D
> ww_mutex_lock_slow() throws away the return value of ww_mutex_lock().=0D
> That is only fine in C because they "require" that the caller not hold=0D
> any other lock of the context. Here nothing enforces that, so=0D
> ctx.lock(&m) followed by ctx.lock_slow(&m) returns Ok with a second=0D
> guard for m.=0D
> =0D
> =0D
> > +    /// Marks the end of the acquire phase.=0D
> > +    ///=0D
> > +    /// Calling this function is optional. It is just useful to docume=
nt=0D
> > +    /// the code and clearly designated the acquire phase from actuall=
y=0D
> > +    /// using the locked data structures.=0D
> > +    ///=0D
> > +    /// After calling this function, no more mutexes can be acquired w=
ith=0D
> > +    /// this context.=0D
> > +    ///=0D
> > +    /// # Safety=0D
> > +    ///=0D
> > +    /// The caller must ensure that this function is called only once=
=0D
> > +    /// and after calling it, no further mutexes are acquired using=0D
> > +    /// this context.=0D
> > +    pub unsafe fn done(&self) {=0D
> > +        // SAFETY: By the safety contract, the caller guarantees that =
this=0D
> > +        // function is called only once.=0D
> > +        unsafe { bindings::ww_acquire_done(self.inner.get()) };=0D
> > +    }=0D
> =0D
> ^ Are we sure that this needs to be unsafe? The function itself merely=0D
> sets a flag:=0D
> =0D
> /**=0D
>  * ww_acquire_done - marks the end of the acquire phase=0D
>  * @ctx: the acquire context=0D
>  *=0D
>  * Marks the end of the acquire phase, any further w/w mutex lock calls u=
sing=0D
>  * this context are forbidden.=0D
>  *=0D
>  * Calling this function is optional, it is just useful to document w/w m=
utex=0D
>  * code and clearly designated the acquire phase from actually using the =
locked=0D
>  * data structures.=0D
>  */=0D
> static inline void ww_acquire_done(struct ww_acquire_ctx *ctx)=0D
> {=0D
> #ifdef DEBUG_WW_MUTEXES=0D
>     lockdep_assert_held(ctx);=0D
> =0D
>     DEBUG_LOCKS_WARN_ON(ctx->done_acquire);=0D
>     ctx->done_acquire =3D 1;=0D
> #endif=0D
> }=0D
> =0D
> This is even a no-op if DEBUG_WW_MUTEXES is not set.=0D
> =0D
> > +    /// Locks the given [`Mutex`] on this [`AcquireCtx`].=0D
> > +    pub fn lock<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> Result<Mu=
texGuard<'a, T>> {=0D
> > +        lock_common(mutex, Some(self), LockKind::Regular)=0D
> > +    }=0D
> > +=0D
> > +    /// Similar to [`Self::lock`], but can be interrupted by signals.=
=0D
> > +    pub fn lock_interruptible<'a, T>(=0D
> > +        &'a self,=0D
> > +        mutex: &'a Mutex<'a, T>,=0D
> > +    ) -> Result<MutexGuard<'a, T>> {=0D
> > +        lock_common(mutex, Some(self), LockKind::Interruptible)=0D
> > +    }=0D
> > +=0D
> > +    /// Locks the given [`Mutex`] on this [`AcquireCtx`] using the slo=
w path.=0D
> > +    ///=0D
> > +    /// This function should be used when [`Self::lock`] fails (typica=
lly due=0D
> > +    /// to a potential deadlock).=0D
> > +    pub fn lock_slow<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> Resu=
lt<MutexGuard<'a, T>> {=0D
> > +        lock_common(mutex, Some(self), LockKind::Slow)=0D
> > +    }=0D
> > +=0D
> > +    /// Similar to [`Self::lock_slow`], but can be interrupted by sign=
als.=0D
> > +    pub fn lock_slow_interruptible<'a, T>(=0D
> > +        &'a self,=0D
> > +        mutex: &'a Mutex<'a, T>,=0D
> > +    ) -> Result<MutexGuard<'a, T>> {=0D
> > +        lock_common(mutex, Some(self), LockKind::SlowInterruptible)=0D
> > +    }=0D
> > +=0D
> > +    /// Tries to lock the [`Mutex`] on this [`AcquireCtx`] without blo=
cking.=0D
> > +    ///=0D
> > +    /// Unlike [`Self::lock`], no deadlock handling is performed.=0D
> > +    pub fn try_lock<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> Resul=
t<MutexGuard<'a, T>> {=0D
> > +        lock_common(mutex, Some(self), LockKind::Try)=0D
> > +    }=0D
> > +}=0D
> =0D
> These  suffer from the same mem::forget() issue that plagued a similar=0D
> patch recently.=0D
> =0D
> When you lock, the C side will remember the ctx in a field. If you=0D
> mem::forget() the Guard, the borrow on AcquireCtx is gone, and ctx can=0D
> drop, and lock->ctx dangles.=0D
> =0D
> My preferred solution is to make the locking functions unsafe fn if they=
=0D
> take a context, with the requirement that the lock is released before=0D
> the context goes away.=0D
=0D
Yeah, sounds reasonable since we have LockSet, a safe API anyway.=0D
=0D
> =0D
> -- Daniel=0D
