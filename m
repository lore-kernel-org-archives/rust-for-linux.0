Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDAB3AB460;
	Wed, 23 Sep 2026 03:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790135470; cv=none; b=iXNDcoMjm9kVnpWldOaZSC9B+W73K4Ce6gwyLCcyn4idnNZoycdBXY0yK+mrd41AQJuBKm8ytVXy3ayEYB/FH5+Yi9tEy2vbyIPF9WFEkYnSM2wsLd6yCH0Q3WCL2LZRzlxP0PHEwWBIfdwVX8/mp9f+7C0GepTpP+jef7LUcqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790135470; c=relaxed/simple;
	bh=8s6jU0aKnGk/YA0IlKoqmc3AWoJ/mjRmgYUqi8EJlgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A5QBEqCEXcxJETS4x1eZGQ1/L1vUVr/XQrmCGBmH3cK4YtkxCA5xQkubn7IKgp571IKf9GVeZvgnCypAP4oYhemH+VzmmsKML1GCViooUszYtk40VwpOavSCR5o88hkiqFQC7D1QNXM/BC+xDMnsQgn8RG1xY1ks08HNEtFVTjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=FPYAitRb; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="FPYAitRb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1790135456; x=1790394656;
	bh=cLtOiMBVxwJ7Zc4/pSq1GZIzkUFuN80SaRhh5oFDz7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FPYAitRbPheUQVCkExV2B8b53j2GRYY2Y5A8PB9zUBUTx63RYCGSZhMQrluDrhFIW
	 Vg0hOMTB/AQBnP9V7Rc9XcqGKKjnqFJiG8mh6iRY/n53e/q/4yjeoN4YflBXoPpnbw
	 RnjtkjcrnOWLe8KNrjC7NQ9N2TY8yV6Z1StQe7S0vH2FRQTrg2147Fta17xJTzRp8a
	 VB8tymgZ794bGcRZB6hfp5aBCkGeoD7IWj/C8ADyEfWoQ9z6l5BZ6hoUX3CQH0oaTf
	 7SAVE2Ru4ia2xeY0Q/g85r7bSHKAEak1WZLXJt0fjmnTX+SsOkB8QwkIXgijRQJ1BX
	 X7QeT5ojma6nw==
X-Pm-Submission-Id: 4hqNKk355tz1DDs3
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Boqun Feng <boqun@kernel.org>
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
Subject: Re: [PATCH v9 5/7] rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard
Date: Wed, 23 Sep 2026 06:48:42 +0300
Message-ID: <20260923035048.20359-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <arJCPony_r8brzf7@MacBook-0RXW5>
References: <20260102175302.194435-1-work@onurozkan.dev> <20260102175302.194435-6-work@onurozkan.dev> <arJCPony_r8brzf7@MacBook-0RXW5>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Sep 2026 10:54:22 +0200=0D
Boqun Feng <boqun@kernel.org> wrote:=0D
=0D
> On Fri, Jan 02, 2026 at 08:53:00PM +0300, Onur =C3=96zkan wrote:=0D
> > Covers the entire low-level locking API (lock, try_lock,=0D
> > slow path, interruptible variants) and integration with=0D
> > kernel bindings.=0D
> > =0D
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> > ---=0D
> >  rust/kernel/sync/lock/ww_mutex.rs             | 433 ++++++++++++++++++=
=0D
> >  rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs | 172 +++++++=0D
> >  2 files changed, 605 insertions(+)=0D
> >  create mode 100644 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs=0D
> > =0D
> > diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/=
ww_mutex.rs=0D
> > index 727c51cc73af..d12d75169052 100644=0D
> > --- a/rust/kernel/sync/lock/ww_mutex.rs=0D
> > +++ b/rust/kernel/sync/lock/ww_mutex.rs=0D
> > @@ -1,7 +1,440 @@=0D
> >  // SPDX-License-Identifier: GPL-2.0=0D
> >  =0D
> >  //! Rust abstractions for the kernel's wound-wait locking primitives.=
=0D
> > +//!=0D
> > +//! It is designed to avoid deadlocks when locking multiple [`Mutex`]e=
s=0D
> > +//! that belong to the same [`Class`]. Each lock acquisition uses an=0D
> > +//! [`AcquireCtx`] to track ordering and ensure forward progress.=0D
> > +//!=0D
> > +//! See srctree/Documentation/locking/ww-mutex-design.rst for more det=
ails.=0D
> >  =0D
> > +use crate::error::to_result;=0D
> > +use crate::prelude::*;=0D
> > +use crate::types::{NotThreadSafe, Opaque};=0D
> > +use crate::{bindings, container_of};=0D
> > +=0D
> > +use core::cell::UnsafeCell;=0D
> > +use core::marker::PhantomData;=0D
> > +=0D
> > +pub use acquire_ctx::AcquireCtx;=0D
> >  pub use class::Class;=0D
> >  =0D
> >  mod class;=0D
> > +mod acquire_ctx;=0D
> > +mod class;=0D
> > +=0D
> > +/// A wound-wait (ww) mutex that is powered with deadlock avoidance=0D
> > +/// when acquiring multiple locks of the same [`Class`].=0D
> > +///=0D
> > +/// Each mutex belongs to a [`Class`], which the wound-wait algorithm=
=0D
> > +/// uses to figure out the order of acquisition and prevent deadlocks.=
=0D
> > +///=0D
> > +/// # Examples=0D
> > +///=0D
> > +/// ```=0D
> > +/// use kernel::define_ww_class;=0D
> > +/// use kernel::sync::Arc;=0D
> > +/// use kernel::sync::lock::ww_mutex::{AcquireCtx, Class, Mutex};=0D
> > +/// use pin_init::stack_pin_init;=0D
> > +///=0D
> > +/// define_ww_class!(SOME_WW_CLASS);=0D
> > +///=0D
> > +/// let mutex =3D Arc::pin_init(Mutex::new(42, &SOME_WW_CLASS), GFP_KE=
RNEL)?;=0D
> > +/// let ctx =3D KBox::pin_init(AcquireCtx::new(&SOME_WW_CLASS), GFP_KE=
RNEL)?;=0D
> > +///=0D
> > +/// let guard =3D ctx.lock(&mutex)?;=0D
> > +/// assert_eq!(*guard, 42);=0D
> > +///=0D
> > +/// # Ok::<(), Error>(())=0D
> > +/// ```=0D
> > +#[pin_data]=0D
> > +#[repr(C)]=0D
> > +pub struct Mutex<'a, T: ?Sized> {=0D
> > +    _p: PhantomData<&'a Class>,=0D
> =0D
> We should be able to do:=0D
> =0D
>     class: &'a Class,=0D
> =0D
> then we don't need to patch #2 in the series, right?=0D
> =0D
> Regards,=0D
> Boqun=0D
> =0D
=0D
I assume you are suggesting passing the Class reference to from_raw()=0D
functions as well?=0D
=0D
If so, we discussed this in previous revisions. Daniel suggested passing=0D
the class explicitly to from_raw() as an alternative [1]. We then=0D
discussed that approach versus making the C fields unconditional and both=0D
Lyude and Daniel supported the C change [2].=0D
=0D
That is the rationale for patch #2, it lets us validate class pairing=0D
while keeping from_raw() simple for existing C objects.=0D
=0D
It also keeps AcquireCtx::reinit() simpler by letting it recover the=0D
original class without requiring the caller to supply it again.=0D
=0D
[1] https://lore.kernel.org/all/FDF7EB09-BFCB-4E90-8D9F-8AA6E14B3D5B@collab=
ora.com=0D
[2] https://lore.kernel.org/all/ECC0425A-8B18-4626-8EA8-2F843C45E0A1@collab=
ora.com=0D
=0D
Thanks,=0D
Onur=0D
=0D
> > +    #[pin]=0D
> > +    inner: Opaque<bindings::ww_mutex>,=0D
> > +    data: UnsafeCell<T>,=0D
> > +}=0D
> > +=0D
> > +impl<'class, T> Mutex<'class, T> {=0D
> > +    /// Initializes [`Mutex`] with the given `data` and [`Class`].=0D
> > +    pub fn new(data: T, class: &'class Class) -> impl PinInit<Self> {=
=0D
> > +        let class_ptr =3D class.inner.get();=0D
> > +        pin_init!(Mutex {=0D
> > +            inner <- Opaque::ffi_init(|slot: *mut bindings::ww_mutex| =
{=0D
> > +                // SAFETY: `class` is valid for the lifetime `'class` =
captured by `Self`.=0D
> > +                unsafe { bindings::ww_mutex_init(slot, class_ptr) }=0D
> > +            }),=0D
> > +            data: UnsafeCell::new(data),=0D
> > +            _p: PhantomData=0D
> > +        })=0D
> > +    }=0D
> > +}=0D
> > +=0D
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
> > +=0D
> > +    /// Tries to lock this [`Mutex`] with no [`AcquireCtx`] and withou=
t blocking.=0D
> > +    ///=0D
> > +    /// Unlike [`Self::lock`], no deadlock handling is performed.=0D
> > +    pub fn try_lock(&self) -> Result<MutexGuard<'_, T>> {=0D
> > +        lock_common(self, None, LockKind::Try)=0D
> > +    }=0D
> > +}=0D
> > +=0D
> > +impl<'class> Mutex<'class, ()> {=0D
> > +    /// Creates a [`Mutex`] from a raw pointer.=0D
> > +    ///=0D
> > +    /// This function is intended for interoperability with C code.=0D
> > +    ///=0D
> > +    /// # Safety=0D
> > +    ///=0D
> > +    /// The caller must ensure that:=0D
> > +    ///=0D
> > +    /// - `ptr` is a valid pointer to a `ww_mutex`.=0D
> > +    /// - `ptr` must remain valid for the lifetime `'a`.=0D
> > +    /// - ww_class associated with this mutex must be valid for=0D
> > +    ///   the lifetime `'class`.=0D
> > +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::ww_mutex) -> &'a Se=
lf {=0D
> > +        // SAFETY: By the safety contract, the caller guarantees that =
`ptr`=0D
> > +        // points to a valid `ww_mutex` which is the `inner` field of =
`Mutex`,=0D
> > +        // that it remains valid for the lifetime `'a` and the associa=
ted=0D
> > +        // ww_class outlives `'class`.=0D
> > +        //=0D
> > +        // Because [`Mutex`] is `#[repr(C)]`, the `inner` field sits a=
t a=0D
> > +        // stable offset that `container_of!` can safely rely on.=0D
> > +        unsafe { &*container_of!(Opaque::cast_from(ptr), Self, inner) =
}=0D
> > +    }=0D
> > +}=0D
> > +=0D
> > +// SAFETY: `Mutex` can be sent to another thread if the protected=0D
> > +// data `T` can be.=0D
> > +unsafe impl<T: ?Sized + Send> Send for Mutex<'_, T> {}=0D
> > +=0D
> > +// SAFETY: `Mutex` can be shared across threads if the protected=0D
> > +// data `T` can be.=0D
> > +unsafe impl<T: ?Sized + Send + Sync> Sync for Mutex<'_, T> {}=0D
> > +=0D
> > +/// A guard that provides exclusive access to the data protected=0D
> > +/// by a [`Mutex`].=0D
> > +///=0D
> > +/// # Invariants=0D
> > +///=0D
> > +/// The guard holds an exclusive lock on the associated [`Mutex`]. The=
 lock is held=0D
> > +/// for the entire lifetime of this guard and is automatically release=
d when the=0D
> > +/// guard is dropped.=0D
> > +#[must_use =3D "the lock unlocks immediately when the guard is unused"=
]=0D
> > +pub struct MutexGuard<'a, T: ?Sized> {=0D
> > +    mutex: &'a Mutex<'a, T>,=0D
> > +    _not_send: NotThreadSafe,=0D
> > +}=0D
> > +=0D
> > +impl<'a, T: ?Sized> MutexGuard<'a, T> {=0D
> > +    /// Creates a new guard for the given [`Mutex`].=0D
> > +    fn new(mutex: &'a Mutex<'a, T>) -> Self {=0D
> > +        assert!(mutex.is_locked());=0D
> > +=0D
> > +        Self {=0D
> > +            mutex,=0D
> > +            _not_send: NotThreadSafe,=0D
> > +        }=0D
> > +    }=0D
> > +}=0D
> > +=0D
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
> > +=0D
> > +impl<T: ?Sized> core::ops::Deref for MutexGuard<'_, T> {=0D
> > +    type Target =3D T;=0D
> > +=0D
> > +    fn deref(&self) -> &Self::Target {=0D
> > +        // SAFETY: self.mutex is locked, so we have exclusive access.=
=0D
> > +        unsafe { &*self.mutex.data.get() }=0D
> > +    }=0D
> > +}=0D
> > +=0D
> > +impl<T: ?Sized + Unpin> core::ops::DerefMut for MutexGuard<'_, T> {=0D
> > +    fn deref_mut(&mut self) -> &mut Self::Target {=0D
> > +        // SAFETY: self.mutex is locked, so we have exclusive access.=
=0D
> > +        unsafe { &mut *self.mutex.data.get() }=0D
> > +    }=0D
> > +}=0D
> > +=0D
> > +impl<T: ?Sized> Drop for MutexGuard<'_, T> {=0D
> > +    fn drop(&mut self) {=0D
> > +        // SAFETY: self.mutex is locked and are about to release it.=0D
> > +        unsafe { bindings::ww_mutex_unlock(self.mutex.inner.get()) };=
=0D
> > +    }=0D
> > +}=0D
> > +=0D
> > +// SAFETY: `MutexGuard` can be shared between threads if the data can.=
=0D
> > +unsafe impl<T: ?Sized + Sync> Sync for MutexGuard<'_, T> {}=0D
> > +=0D
> > +/// Locking kinds used by [`lock_common`] to unify the internal=0D
> > +/// locking logic.=0D
> > +///=0D
> > +/// It's best not to expose this type (and [`lock_common`]) to the=0D
> > +/// kernel, as it allows internal API changes without worrying=0D
> > +/// about breaking external compatibility.=0D
> > +#[derive(Copy, Clone, Debug)]=0D
> > +enum LockKind {=0D
> > +    /// Blocks until lock is acquired.=0D
> > +    Regular,=0D
> > +    /// Blocks but can be interrupted by signals.=0D
> > +    Interruptible,=0D
> > +    /// Used in slow path after deadlock detection.=0D
> > +    Slow,=0D
> > +    /// Slow path but interruptible.=0D
> > +    SlowInterruptible,=0D
> > +    /// Does not block, returns immediately if busy.=0D
> > +    Try,=0D
> > +}=0D
> > +=0D
> > +/// Internal helper that unifies the different locking kinds.=0D
> > +///=0D
> > +/// Returns [`EINVAL`] if the [`Mutex`] has a different [`Class`].=0D
> > +fn lock_common<'a, T: ?Sized>(=0D
> > +    mutex: &'a Mutex<'a, T>,=0D
> > +    ctx: Option<&AcquireCtx<'_>>,=0D
> > +    kind: LockKind,=0D
> > +) -> Result<MutexGuard<'a, T>> {=0D
> > +    let mutex_ptr =3D mutex.inner.get();=0D
> > +=0D
> > +    let ctx_ptr =3D match ctx {=0D
> > +        Some(acquire_ctx) =3D> {=0D
> > +            let ctx_ptr =3D acquire_ctx.inner.get();=0D
> > +=0D
> > +            // SAFETY: `ctx_ptr` is a valid pointer for the entire=0D
> > +            // lifetime of `ctx`.=0D
> > +            let ctx_class =3D unsafe { (*ctx_ptr).ww_class };=0D
> > +=0D
> > +            // SAFETY: `mutex_ptr` is a valid pointer for the entire=0D
> > +            // lifetime of `mutex`.=0D
> > +            let mutex_class =3D unsafe { (*mutex_ptr).ww_class };=0D
> > +=0D
> > +            // `ctx` and `mutex` must use the same class.=0D
> > +            if ctx_class !=3D mutex_class {=0D
> > +                return Err(EINVAL);=0D
> > +            }=0D
> > +=0D
> > +            ctx_ptr=0D
> > +        }=0D
> > +        None =3D> core::ptr::null_mut(),=0D
> > +    };=0D
> > +=0D
> > +    match kind {=0D
> > +        LockKind::Regular =3D> {=0D
> > +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is `S=
ome`, it is pinned,=0D
> > +            // if `None`, it is set to `core::ptr::null_mut()`. Both c=
ases are safe.=0D
> > +            let ret =3D unsafe { bindings::ww_mutex_lock(mutex_ptr, ct=
x_ptr) };=0D
> > +=0D
> > +            to_result(ret)?;=0D
> > +        }=0D
> > +        LockKind::Interruptible =3D> {=0D
> > +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is `S=
ome`, it is pinned,=0D
> > +            // if `None`, it is set to `core::ptr::null_mut()`. Both c=
ases are safe.=0D
> > +            let ret =3D unsafe { bindings::ww_mutex_lock_interruptible=
(mutex_ptr, ctx_ptr) };=0D
> > +=0D
> > +            to_result(ret)?;=0D
> > +        }=0D
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
> > +        LockKind::Try =3D> {=0D
> > +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is `S=
ome`, it is pinned,=0D
> > +            // if `None`, it is set to `core::ptr::null_mut()`. Both c=
ases are safe.=0D
> > +            let ret =3D unsafe { bindings::ww_mutex_trylock(mutex_ptr,=
 ctx_ptr) };=0D
> > +=0D
> > +            if ret =3D=3D 0 {=0D
> > +                return Err(EBUSY);=0D
> > +            } else {=0D
> > +                to_result(ret)?;=0D
> > +            }=0D
> > +        }=0D
> > +    };=0D
> > +=0D
> > +    Ok(MutexGuard::new(mutex))=0D
> > +}=0D
> > +=0D
> > +#[kunit_tests(rust_kernel_ww_mutex)]=0D
> > +mod tests {=0D
> > +    use crate::prelude::*;=0D
> > +    use crate::sync::Arc;=0D
> > +    use crate::{define_wd_class, define_ww_class};=0D
> > +=0D
> > +    use super::*;=0D
> > +=0D
> > +    define_ww_class!(TEST_WOUND_WAIT_CLASS);=0D
> > +    define_wd_class!(TEST_WAIT_DIE_CLASS);=0D
> > +=0D
> > +    #[test]=0D
> > +    fn test_ww_mutex_basic_lock_unlock() -> Result {=0D
> > +        let mutex =3D Arc::pin_init(Mutex::new(42, &TEST_WOUND_WAIT_CL=
ASS), GFP_KERNEL)?;=0D
> > +        let ctx =3D KBox::pin_init(AcquireCtx::new(&TEST_WOUND_WAIT_CL=
ASS), GFP_KERNEL)?;=0D
> > +=0D
> > +        let guard =3D ctx.lock(&mutex)?;=0D
> > +        assert_eq!(*guard, 42);=0D
> > +=0D
> > +        // Drop the lock.=0D
> > +        drop(guard);=0D
> > +=0D
> > +        let mut guard =3D ctx.lock(&mutex)?;=0D
> > +        *guard =3D 100;=0D
> > +        assert_eq!(*guard, 100);=0D
> > +=0D
> > +        Ok(())=0D
> > +    }=0D
> > +=0D
> > +    #[test]=0D
> > +    fn test_ww_mutex_trylock() -> Result {=0D
> > +        let mutex =3D Arc::pin_init(Mutex::new(123, &TEST_WAIT_DIE_CLA=
SS), GFP_KERNEL)?;=0D
> > +        let ctx =3D KBox::pin_init(AcquireCtx::new(&TEST_WAIT_DIE_CLAS=
S), GFP_KERNEL)?;=0D
> > +=0D
> > +        // `try_lock` on unlocked mutex should succeed.=0D
> > +        let guard =3D ctx.try_lock(&mutex)?;=0D
> > +        assert_eq!(*guard, 123);=0D
> > +=0D
> > +        // Now it should fail immediately as it's already locked.=0D
> > +        assert!(ctx.try_lock(&mutex).is_err());=0D
> > +=0D
> > +        Ok(())=0D
> > +    }=0D
> > +=0D
> > +    #[test]=0D
> > +    fn test_ww_mutex_is_locked() -> Result {=0D
> > +        let mutex =3D Arc::pin_init(Mutex::new("hello", &TEST_WOUND_WA=
IT_CLASS), GFP_KERNEL)?;=0D
> > +        let ctx =3D KBox::pin_init(AcquireCtx::new(&TEST_WOUND_WAIT_CL=
ASS), GFP_KERNEL)?;=0D
> > +=0D
> > +        // Should not be locked initially.=0D
> > +        assert!(!mutex.is_locked());=0D
> > +=0D
> > +        let guard =3D ctx.lock(&mutex)?;=0D
> > +        assert!(mutex.is_locked());=0D
> > +=0D
> > +        drop(guard);=0D
> > +        assert!(!mutex.is_locked());=0D
> > +=0D
> > +        Ok(())=0D
> > +    }=0D
> > +=0D
> > +    #[test]=0D
> > +    fn test_ww_acquire_context_done() -> Result {=0D
> > +        let mutex1 =3D Arc::pin_init(Mutex::new(1, &TEST_WAIT_DIE_CLAS=
S), GFP_KERNEL)?;=0D
> > +        let mutex2 =3D Arc::pin_init(Mutex::new(2, &TEST_WAIT_DIE_CLAS=
S), GFP_KERNEL)?;=0D
> > +        let ctx =3D KBox::pin_init(AcquireCtx::new(&TEST_WAIT_DIE_CLAS=
S), GFP_KERNEL)?;=0D
> > +=0D
> > +        // Acquire multiple mutexes with the same context.=0D
> > +        let guard1 =3D ctx.lock(&mutex1)?;=0D
> > +        let guard2 =3D ctx.lock(&mutex2)?;=0D
> > +=0D
> > +        assert_eq!(*guard1, 1);=0D
> > +        assert_eq!(*guard2, 2);=0D
> > +=0D
> > +        // SAFETY: It's called exactly once here and nowhere else.=0D
> > +        unsafe { ctx.done() };=0D
> > +=0D
> > +        // We shouldn't be able to lock once it's `done`.=0D
> > +        assert!(ctx.lock(&mutex1).is_err());=0D
> > +        assert!(ctx.lock(&mutex2).is_err());=0D
> > +=0D
> > +        Ok(())=0D
> > +    }=0D
> > +=0D
> > +    #[test]=0D
> > +    fn test_mutex_without_ctx() -> Result {=0D
> > +        let mutex =3D Arc::pin_init(Mutex::new(100, &TEST_WOUND_WAIT_C=
LASS), GFP_KERNEL)?;=0D
> > +        let guard =3D mutex.lock()?;=0D
> > +=0D
> > +        assert_eq!(*guard, 100);=0D
> > +        assert!(mutex.is_locked());=0D
> > +=0D
> > +        drop(guard);=0D
> > +=0D
> > +        assert!(!mutex.is_locked());=0D
> > +=0D
> > +        Ok(())=0D
> > +    }=0D
> > +=0D
> > +    #[test]=0D
> > +    fn test_guard_from_raw_with_unlocked_mutex() -> Result {=0D
> > +        let mutex =3D Arc::pin_init(Mutex::new((), &TEST_WOUND_WAIT_CL=
ASS), GFP_KERNEL)?;=0D
> > +=0D
> > +        assert!(!mutex.is_locked());=0D
> > +=0D
> > +        // SAFETY: `mutex` remains valid for the duration of this test=
.=0D
> > +        match unsafe { MutexGuard::from_raw(mutex.inner.get()) } {=0D
> > +            // Should fail with `EINVAL` because the mutex is not lock=
ed.=0D
> > +            Err(e) =3D> assert_eq!(e, EINVAL),=0D
> > +            _ =3D> unreachable!(),=0D
> > +        };=0D
> > +=0D
> > +        Ok(())=0D
> > +    }=0D
> > +}=0D
> > +>>>>>>> 90f935950ff8 (rust: ww_mutex: add Mutex, AcquireCtx and MutexG=
uard)=0D
> > diff --git a/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs b/rust/kerne=
l/sync/lock/ww_mutex/acquire_ctx.rs=0D
> > new file mode 100644=0D
> > index 000000000000..4b773c76bd2c=0D
> > --- /dev/null=0D
> > +++ b/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs=0D
> > @@ -0,0 +1,172 @@=0D
> > +// SPDX-License-Identifier: GPL-2.0=0D
> > +=0D
> > +//! Provides [`AcquireCtx`] for managing multiple wound/wait=0D
> > +//! mutexes from the same [`Class`].=0D
> > +=0D
> > +use crate::bindings;=0D
> > +use crate::prelude::*;=0D
> > +use crate::types::Opaque;=0D
> > +=0D
> > +use core::marker::PhantomData;=0D
> > +=0D
> > +use super::{lock_common, Class, LockKind, Mutex, MutexGuard};=0D
> > +=0D
> > +/// Groups multiple [`Mutex`]es for deadlock avoidance when acquired=0D
> > +/// with the same [`Class`].=0D
> > +///=0D
> > +/// # Examples=0D
> > +///=0D
> > +/// ```=0D
> > +/// use kernel::sync::lock::ww_mutex::{Class, AcquireCtx, Mutex};=0D
> > +/// use kernel::define_ww_class;=0D
> > +/// use kernel::sync::Arc;=0D
> > +/// use pin_init::stack_pin_init;=0D
> > +///=0D
> > +/// define_ww_class!(SOME_WW_CLASS);=0D
> > +///=0D
> > +/// // Create mutexes.=0D
> > +/// let mutex1 =3D Arc::pin_init(Mutex::new(1, &SOME_WW_CLASS), GFP_KE=
RNEL)?;=0D
> > +/// let mutex2 =3D Arc::pin_init(Mutex::new(2, &SOME_WW_CLASS), GFP_KE=
RNEL)?;=0D
> > +///=0D
> > +/// // Create acquire context for deadlock avoidance.=0D
> > +/// let ctx =3D KBox::pin_init(AcquireCtx::new(&SOME_WW_CLASS), GFP_KE=
RNEL)?;=0D
> > +///=0D
> > +/// let guard1 =3D ctx.lock(&mutex1)?;=0D
> > +/// let guard2 =3D ctx.lock(&mutex2)?;=0D
> > +///=0D
> > +/// // Mark acquisition phase as complete.=0D
> > +/// // SAFETY: It's called exactly once here and nowhere else.=0D
> > +/// unsafe { ctx.done() };=0D
> > +///=0D
> > +/// # Ok::<(), Error>(())=0D
> > +/// ```=0D
> > +#[pin_data(PinnedDrop)]=0D
> > +#[repr(transparent)]=0D
> > +pub struct AcquireCtx<'a> {=0D
> > +    #[pin]=0D
> > +    pub(super) inner: Opaque<bindings::ww_acquire_ctx>,=0D
> > +    _p: PhantomData<&'a Class>,=0D
> > +}=0D
> > +=0D
> > +impl<'class> AcquireCtx<'class> {=0D
> > +    /// Initializes a new [`AcquireCtx`] with the given [`Class`].=0D
> > +    pub fn new(class: &'class Class) -> impl PinInit<Self> {=0D
> > +        let class_ptr =3D class.inner.get();=0D
> > +        pin_init!(AcquireCtx {=0D
> > +            inner <- Opaque::ffi_init(|slot: *mut bindings::ww_acquire=
_ctx| {=0D
> > +                // SAFETY: `class` is valid for the lifetime `'class` =
captured=0D
> > +                // by `AcquireCtx`.=0D
> > +                unsafe { bindings::ww_acquire_init(slot, class_ptr) }=
=0D
> > +            }),=0D
> > +            _p: PhantomData=0D
> > +        })=0D
> > +    }=0D
> > +=0D
> > +    /// Creates a [`AcquireCtx`] from a raw pointer.=0D
> > +    ///=0D
> > +    /// This function is intended for interoperability with C code.=0D
> > +    ///=0D
> > +    /// # Safety=0D
> > +    ///=0D
> > +    /// The caller must ensure that `ptr` is a valid pointer to the `i=
nner` field=0D
> > +    /// of [`AcquireCtx`] and that it remains valid for the lifetime `=
'a`.=0D
> > +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::ww_acquire_ctx) -> =
&'a Self {=0D
> > +        // SAFETY: By the safety contract, `ptr` is valid to construct=
 `AcquireCtx`.=0D
> > +        unsafe { &*ptr.cast() }=0D
> > +    }=0D
> > +=0D
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
> > +=0D
> > +    /// Re-initializes the [`AcquireCtx`].=0D
> > +    ///=0D
> > +    /// Must be called after releasing all locks when [`EDEADLK`] occu=
rs.=0D
> > +    ///=0D
> > +    /// # Safety=0D
> > +    ///=0D
> > +    /// The caller must ensure no locks are held in this [`AcquireCtx`=
].=0D
> > +    pub unsafe fn reinit(self: Pin<&mut Self>) {=0D
> > +        let ctx =3D self.inner.get();=0D
> > +=0D
> > +        // SAFETY: `ww_class` is always a valid pointer in properly in=
itialized=0D
> > +        // `AcquireCtx`.=0D
> > +        let class_ptr =3D unsafe { (*ctx).ww_class };=0D
> > +=0D
> > +        // SAFETY:=0D
> > +        //  - Lifetime of any guard (which hold an immutable borrow of=
 `self`) cannot overlap=0D
> > +        //    with the execution of this function. This enforces that =
all locks acquired via=0D
> > +        //    this context have been released.=0D
> > +        //=0D
> > +        //  - `ctx` is guaranteed to be initialized because `ww_acquir=
e_fini`=0D
> > +        //    can only be called from the `Drop` implementation.=0D
> > +        //=0D
> > +        //  - `ww_acquire_fini` is safe to call on an initialized cont=
ext.=0D
> > +        unsafe { bindings::ww_acquire_fini(ctx) };=0D
> > +=0D
> > +        // SAFETY: `ww_acquire_init` is safe to call with valid pointe=
rs=0D
> > +        // to initialize an uninitialized context.=0D
> > +        unsafe { bindings::ww_acquire_init(ctx, class_ptr) };=0D
> > +    }=0D
> > +=0D
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
> > +=0D
> > +#[pinned_drop]=0D
> > +impl PinnedDrop for AcquireCtx<'_> {=0D
> > +    fn drop(self: Pin<&mut Self>) {=0D
> > +        // SAFETY: Given the lifetime bounds we know no locks are held=
,=0D
> > +        // so calling `ww_acquire_fini` is safe.=0D
> > +        unsafe { bindings::ww_acquire_fini(self.inner.get()) };=0D
> > +    }=0D
> > +}=0D
> > -- =0D
> > 2.51.2=0D
> > =0D
