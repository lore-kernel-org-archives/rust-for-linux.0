Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175513E49EB;
	Wed, 30 Sep 2026 21:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790805217; cv=pass; b=THCA/JoW7LTPtXbNdilga6idkUu+J5okThku3aclzmbWD2mFe6RBX85kTPIl1Do0mUP4NJ3zQ/P6/I3/HElgmVcwNDUIxbsKOCeAgFtsn0pOFfGOrMBJuwbsMwfSf8q5p0c8cdPhnBDNugz450w/Jiz3Go/N66Shg6cIMsnh07Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790805217; c=relaxed/simple;
	bh=wdUs0AHi1Ytv4A0d1QcX28Pw52M9HIgFhj0Tkht4unA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=D/IFOKnDbjmqXgqArEOHy1WWezv2eadmkYNv7jzlhgFByhpDGEvhc49zSVK9Sil0O4hbJcF4feSLNWISBLOseyA3qQ0ovZqyk5Cv43q3UFgJANLQSMV9h4RZCspUeuh6fo1bYV4iFTE4kt1mMmZpuVLooO4sVNtOPT7BBVk8bQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=IdgqciPA; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="IdgqciPA"
ARC-Seal: i=1; a=rsa-sha256; t=1790805185; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kQFm1tzL3DibqLLPRJLVyxAscnhbQ1pKAGC160e3+/hTt/c6NxvTLXQoT5iLM3qveD545+swaDavOil1Q3CLeOn0XDdABTJ9VNo2caPBEK3AARaZ2jzzzhMsi6kOo/3cmRm2Nxhn/BYy9eNWw3ogJr4M+LQAt0ovRVMJox9FDDw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790805185; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IQbFj9vkXlAU1RllL2BnOdE6bNgQczsAPWHBAQ3Cq5U=; 
	b=Wcsf4L/z2qUWGOqHw1gFn/vPCS6L9tWjUOK2UAQGPBqmI5jttO7meEFWIF1IGse0oRn/YAE1QlUSxDTa/bOL1V9MjxPlJUn/9v2WCpW388yDhxl2Qf2m4aGPBhQy1MyPqF/Jteps24hdr3Q/vufdGhcarYKf/7N464c3gAAr6Co=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790805185;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=IQbFj9vkXlAU1RllL2BnOdE6bNgQczsAPWHBAQ3Cq5U=;
	b=IdgqciPAJsEF8Go6vugKFaoP5Od11R4XH6T2j3IQvS2+XSv2U797/Di9eC/gSJAo
	4M0kb7ysQTynNP+68CU6khAKDU6o3kGVZTBkMLGjy+nLaB/nnYBUoBmc8mgMOBNuMP2
	vwDoScHTkXfafXqV+9rGYqXjVANEJUEjNlHoiNbI=
Received: by smtp.zohomail.com with SMTPS id 1790805184754266.7622607061255;
	Wed, 30 Sep 2026 14:53:04 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v10 5/7] rust: ww_mutex: add Mutex, AcquireCtx and
 MutexGuard
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260103073554.34855-6-work@onurozkan.dev>
Date: Wed, 30 Sep 2026 18:52:47 -0300
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <21E654F4-884E-4027-B9DF-8BF0F2BE1DC9@collabora.com>
References: <20260103073554.34855-1-work@onurozkan.dev>
 <20260103073554.34855-6-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External

Hi Onur,

> +impl<'class, T: ?Sized> Mutex<'class, T> {
> +    /// Checks if this [`Mutex`] is currently locked.
> +    ///
> +    /// The returned value is racy as another thread can acquire
> +    /// or release the lock immediately after this call returns.
> +    pub fn is_locked(&self) -> bool {
> +        // SAFETY: It's safe to call `ww_mutex_is_locked` on
> +        // a valid mutex.
> +        unsafe { bindings::ww_mutex_is_locked(self.inner.get()) }
> +    }
> +
> +    /// Locks this [`Mutex`] without [`AcquireCtx`].
> +    pub fn lock(&self) -> Result<MutexGuard<'_, T>> {
> +        lock_common(self, None, LockKind::Regular)
> +    }
> +
> +    /// Similar to [`Self::lock`], but can be interrupted by signals.
> +    pub fn lock_interruptible(&self) -> Result<MutexGuard<'_, T>> {
> +        lock_common(self, None, LockKind::Interruptible)
> +    }
> +
> +    /// Locks this [`Mutex`] without [`AcquireCtx`] using the slow =
path.
> +    ///
> +    /// This function should be used when [`Self::lock`] fails =
(typically due
> +    /// to a potential deadlock).
> +    pub fn lock_slow(&self) -> Result<MutexGuard<'_, T>> {
> +        lock_common(self, None, LockKind::Slow)
> +    }
> +
> +    /// Similar to [`Self::lock_slow`], but can be interrupted by =
signals.
> +    pub fn lock_slow_interruptible(&self) -> Result<MutexGuard<'_, =
T>> {
> +        lock_common(self, None, LockKind::SlowInterruptible)
> +    }

^ Let's remove the slow path, this is equivalent to a normal lock(),
except that it also contains this dereference:

static inline void
ww_mutex_lock_slow(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
{
    int ret;
#ifdef DEBUG_WW_MUTEXES
    DEBUG_LOCKS_WARN_ON(!ctx->contending_lock); <-----
#endif
    ret =3D ww_mutex_lock(lock, ctx);
    (void)ret;
}

But we (and most of the C API) allow null ctxs:

    let ctx_ptr =3D match ctx {
        Some(acquire_ctx) =3D> {
            let ctx_ptr =3D acquire_ctx.inner.get();

            // SAFETY: `ctx_ptr` is a valid pointer for the entire
            // lifetime of `ctx`.
            let ctx_class =3D unsafe { (*ctx_ptr).ww_class };

            // SAFETY: `mutex_ptr` is a valid pointer for the entire
            // lifetime of `mutex`.
            let mutex_class =3D unsafe { (*mutex_ptr).ww_class };

            // `ctx` and `mutex` must use the same class.
            if ctx_class !=3D mutex_class {
                return Err(EINVAL);
            }

            ctx_ptr
        }
        None =3D> core::ptr::null_mut(), <----
    };

IOW, to call the slow path correctly, the Rust side would already have
to know the thing the slow path checks, and then the slow path adds
nothing.

Even the docs say:

 * Note that the slowpath lock acquiring can also be done by calling
 * ww_mutex_lock directly. This function here is simply to help w/w =
mutex
 * locking code readability by clearly denoting the slowpath.

By the way, LockSet itself does not use it, so let's drop that. It also
solves some problems in the other patches too.

> // SAFETY: `Mutex` can be shared across threads if the protected
> // data `T` can be.
> unsafe impl<T: ?Sized + Send + Sync> Sync for Mutex<'_, T> {}

I don't exactly remember why this has to be different than sync::Lock?
i.e.:

// SAFETY: `Lock` serialises the interior mutability it provides, so it =
is `Sync` as long as the
// data it protects is `Send`.
unsafe impl<T: ?Sized + Send, B: Backend> Sync for Lock<T, B> {}

Why does one require Send + Sync and the other just Send?

> +impl<'a> MutexGuard<'a, ()> {
> +    /// Creates a [`MutexGuard`] from a raw pointer.
> +    ///
> +    /// If the given pointer refers to a mutex that is not locked,
> +    /// returns [`EINVAL`].
> +    ///
> +    /// This function is intended for interoperability with C code.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that:
> +    ///
> +    /// - `ptr` is a valid pointer to a `ww_mutex`.
> +    /// - `ptr` must remain valid for the lifetime `'b`.
> +    /// - The `ww_class` associated with the `ww_mutex` must be valid =
for the lifetime `'b`.
> +    pub unsafe fn from_raw<'b>(ptr: *mut bindings::ww_mutex) -> =
Result<MutexGuard<'b, ()>> {
> +        // SAFETY: By this function's safety contract, the caller =
guarantees that `ptr` points to a
> +        // valid `ww_mutex` which is the `inner` field of a `Mutex`. =
The caller also guarantees
> +        // that both `ptr` and the associated `ww_class` are valid =
for the lifetime `'b`.
> +        let mutex =3D unsafe { Mutex::from_raw(ptr) };
> +
> +        if !mutex.is_locked() {
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(MutexGuard::new(mutex))
> +    }
> +}

The caller must also guarantee that the current task holds this lock,
and that it won't unlock it itself afterwards. Otherwise we may release
someone else's lock, or release it twice.

> +        LockKind::Slow =3D> {
> +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is =
`Some`, it is pinned,
> +            // if `None`, it is set to `core::ptr::null_mut()`. Both =
cases are safe.
> +            unsafe { bindings::ww_mutex_lock_slow(mutex_ptr, ctx_ptr) =
};
> +        }
> +        LockKind::SlowInterruptible =3D> {
> +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is =
`Some`, it is pinned,
> +            // if `None`, it is set to `core::ptr::null_mut()`. Both =
cases are safe.
> +            let ret =3D unsafe { =
bindings::ww_mutex_lock_slow_interruptible(mutex_ptr, ctx_ptr) };
> +
> +            to_result(ret)?;
> +        }

Also remove the slowpath in AcquireCtx, but for a different reason:
ww_mutex_lock_slow() throws away the return value of ww_mutex_lock().
That is only fine in C because they "require" that the caller not hold
any other lock of the context. Here nothing enforces that, so
ctx.lock(&m) followed by ctx.lock_slow(&m) returns Ok with a second
guard for m.


> +    /// Marks the end of the acquire phase.
> +    ///
> +    /// Calling this function is optional. It is just useful to =
document
> +    /// the code and clearly designated the acquire phase from =
actually
> +    /// using the locked data structures.
> +    ///
> +    /// After calling this function, no more mutexes can be acquired =
with
> +    /// this context.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that this function is called only once
> +    /// and after calling it, no further mutexes are acquired using
> +    /// this context.
> +    pub unsafe fn done(&self) {
> +        // SAFETY: By the safety contract, the caller guarantees that =
this
> +        // function is called only once.
> +        unsafe { bindings::ww_acquire_done(self.inner.get()) };
> +    }

^ Are we sure that this needs to be unsafe? The function itself merely
sets a flag:

/**
 * ww_acquire_done - marks the end of the acquire phase
 * @ctx: the acquire context
 *
 * Marks the end of the acquire phase, any further w/w mutex lock calls =
using
 * this context are forbidden.
 *
 * Calling this function is optional, it is just useful to document w/w =
mutex
 * code and clearly designated the acquire phase from actually using the =
locked
 * data structures.
 */
static inline void ww_acquire_done(struct ww_acquire_ctx *ctx)
{
#ifdef DEBUG_WW_MUTEXES
    lockdep_assert_held(ctx);

    DEBUG_LOCKS_WARN_ON(ctx->done_acquire);
    ctx->done_acquire =3D 1;
#endif
}

This is even a no-op if DEBUG_WW_MUTEXES is not set.

> +    /// Locks the given [`Mutex`] on this [`AcquireCtx`].
> +    pub fn lock<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> =
Result<MutexGuard<'a, T>> {
> +        lock_common(mutex, Some(self), LockKind::Regular)
> +    }
> +
> +    /// Similar to [`Self::lock`], but can be interrupted by signals.
> +    pub fn lock_interruptible<'a, T>(
> +        &'a self,
> +        mutex: &'a Mutex<'a, T>,
> +    ) -> Result<MutexGuard<'a, T>> {
> +        lock_common(mutex, Some(self), LockKind::Interruptible)
> +    }
> +
> +    /// Locks the given [`Mutex`] on this [`AcquireCtx`] using the =
slow path.
> +    ///
> +    /// This function should be used when [`Self::lock`] fails =
(typically due
> +    /// to a potential deadlock).
> +    pub fn lock_slow<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> =
Result<MutexGuard<'a, T>> {
> +        lock_common(mutex, Some(self), LockKind::Slow)
> +    }
> +
> +    /// Similar to [`Self::lock_slow`], but can be interrupted by =
signals.
> +    pub fn lock_slow_interruptible<'a, T>(
> +        &'a self,
> +        mutex: &'a Mutex<'a, T>,
> +    ) -> Result<MutexGuard<'a, T>> {
> +        lock_common(mutex, Some(self), LockKind::SlowInterruptible)
> +    }
> +
> +    /// Tries to lock the [`Mutex`] on this [`AcquireCtx`] without =
blocking.
> +    ///
> +    /// Unlike [`Self::lock`], no deadlock handling is performed.
> +    pub fn try_lock<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> =
Result<MutexGuard<'a, T>> {
> +        lock_common(mutex, Some(self), LockKind::Try)
> +    }
> +}

These  suffer from the same mem::forget() issue that plagued a similar
patch recently.

When you lock, the C side will remember the ctx in a field. If you
mem::forget() the Guard, the borrow on AcquireCtx is gone, and ctx can
drop, and lock->ctx dangles.

My preferred solution is to make the locking functions unsafe fn if they
take a context, with the requirement that the lock is released before
the context goes away.

-- Daniel=
