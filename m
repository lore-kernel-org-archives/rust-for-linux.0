Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83F448C405
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 12:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066452; cv=none; b=V7ddt+FzoMjGG1/qAZ7C4L95jIPPCvhjKmtmaOwFfhaqsSMy12F/j2/g+qtu6Dg7m+0d4OMytIT6NrIsrD7X+bjmH2dCZ/06A7Tyu9qQvUooUi+VEusG2cN8+g4MC/k+/8uaJsIJS931SsdjUUEcdOiPetA+FyNFKcMdZ/kKJ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066452; c=relaxed/simple;
	bh=9/rm91qYHsq2mZjdSEzH/191bXnPNYsYAFZRdWiiBcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cTuDUNE0OzVQN0RjemfI14MBVy6aA+hPMuoIWTOe0+cuwD3XT2JpqD6K70gQld1mng4NOu0DBY+zEhCIZHcY1QJcVGhMOnCOF1WIeOZw+P3mEQe6zvdWDMj0WEfoX/qplyeqo6iy3E6hW0w1i0EeJxHppbmxmAgpp5kND7aznU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=aHBBRYTL; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="aHBBRYTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1792066442; x=1792325642;
	bh=A/tVk4jKiJ3RcTYjkXknfhHM/PGhJFcY3cYdbAqwAoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aHBBRYTLg65kk4asVrpf5ty3bMYuhzGpdRt1DluWro1U0plWi3fAT9tYde9uhhSmw
	 IdHdWpHr7SkFrzTGz/8i8MOr2uzhLtdaR1VZVi+WmGhs6llayayG4NMk0Ecnx08cKh
	 wiMrXrb6FBp6aloAgdS9MZ+2/mH502EpDinGrszu7XIittk7g1dH2cgkc37QDGK7Ys
	 wfRiOgQsshnCkt4Z4ywpEP0VX3XgERtW4zmbR54Ff7d2APFuEwaNz5tcgxX0WUXboX
	 17e7oDUHp1BQARDdzcOs3QWtVycZg3AmlaJQazfUtAku56DGB+jL4DWagHhNSqdgrV
	 84KqXb4n3RdgA==
X-Pm-Submission-Id: 4j56S55yZDz2ScPL
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Gary Guo <gary@garyguo.net>
Cc: rust-for-linux@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
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
Subject: Re: [PATCH v12 4/6] rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard
Date: Thu, 15 Oct 2026 15:13:55 +0300
Message-ID: <20261015121356.127765-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <DM2TYBTREPLQ.XJ06PWPOXG4H@garyguo.net>
References: <cover.1791799751.git.work@onurozkan.dev> <36bddd73ca29658a7d01c5a3f3a19ab13477235a.1791799752.git.work@onurozkan.dev> <DM2TYBTREPLQ.XJ06PWPOXG4H@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Oct 2026 12:40:57 +0100=0D
Gary Guo <gary@garyguo.net> wrote:=0D
=0D
> On Mon Oct 12, 2026 at 11:26 AM BST, Onur =C3=96zkan wrote:=0D
> > Covers the low-level locking API (lock, try_lock and=0D
> > interruptible variants) and integration with kernel bindings.=0D
> >=0D
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>=0D
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> > ---=0D
> >  rust/kernel/sync/lock/ww_mutex.rs             | 434 ++++++++++++++++++=
=0D
> >  rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs | 149 ++++++=0D
> >  2 files changed, 583 insertions(+)=0D
> >  create mode 100644 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs=0D
> >=0D
> > diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/=
ww_mutex.rs=0D
> > index 727c51cc73af8..2423f89a7e762 100644=0D
> > --- a/rust/kernel/sync/lock/ww_mutex.rs=0D
> > +++ b/rust/kernel/sync/lock/ww_mutex.rs=0D
> > @@ -1,7 +1,441 @@=0D
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
> > +use crate::{=0D
> > +    bindings,=0D
> > +    container_of,=0D
> > +    error::to_result,=0D
> > +    prelude::*,=0D
> > +    types::{=0D
> > +        NotThreadSafe,=0D
> > +        Opaque, //=0D
> > +    }, //=0D
> > +};=0D
> > +use core::{=0D
> > +    cell::UnsafeCell,=0D
> > +    marker::PhantomData, //=0D
> > +};=0D
> > +=0D
> > +pub use acquire_ctx::AcquireCtx;=0D
> >  pub use class::Class;=0D
> >  =0D
> > +mod acquire_ctx;=0D
> >  mod class;=0D
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
> > +/// use kernel::{=0D
> > +///     define_ww_class,=0D
> > +///     sync::{=0D
> > +///         lock::ww_mutex::{=0D
> > +///             AcquireCtx,=0D
> > +///             Class,=0D
> > +///             Mutex, //=0D
> > +///         },=0D
> > +///         Arc,=0D
> > +///     },=0D
> > +/// };=0D
> > +/// use pin_init::stack_pin_init;=0D
> > +///=0D
> > +/// define_ww_class!(SOME_WW_CLASS);=0D
> > +///=0D
> > +/// let mutex =3D Arc::pin_init(Mutex::new(42, &SOME_WW_CLASS), GFP_KE=
RNEL)?;=0D
> > +/// let ctx =3D KBox::pin_init(AcquireCtx::new(&SOME_WW_CLASS), GFP_KE=
RNEL)?;=0D
> > +///=0D
> > +/// // SAFETY: The guard is dropped before `ctx`.=0D
> > +/// let guard =3D unsafe { ctx.lock(&mutex) }?;=0D
> > +/// assert_eq!(*guard, 42);=0D
> > +///=0D
> > +/// # Ok::<(), Error>(())=0D
> > +/// ```=0D
> > +#[pin_data]=0D
> > +#[repr(C)]=0D
> > +pub struct Mutex<'a, T: ?Sized> {=0D
> > +    _p: PhantomData<&'a Class>,=0D
> =0D
> Do you expect any users that have non-static class?=0D
> =0D
> So far all in-kernel user of ww mutex has a static class.=0D
=0D
Good finding. No, I don't have a non-static class user in mind. The lifetim=
e was=0D
carried over from the earlier versions.=0D
=0D
> =0D
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
> > +    #[inline]=0D
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
> > +    /// Tries to lock this [`Mutex`] with no [`AcquireCtx`] and withou=
t blocking.=0D
> > +    ///=0D
> > +    /// Unlike [`Self::lock`], no deadlock handling is performed.=0D
> > +    pub fn try_lock(&self) -> Result<MutexGuard<'_, T>> {=0D
> =0D
> `try_lock` failure should return `Option` instead.=0D
=0D
Okay.=0D
=0D
> =0D
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
> > +// SAFETY: `Mutex` serialises access to the protected data, so it is=0D
> > +// `Sync` as long as the data is `Send`.=0D
> > +unsafe impl<T: ?Sized + Send> Sync for Mutex<'_, T> {}=0D
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
> > +        // INVARIANT: `lock_common` and `from_raw` ensure that the cur=
rent task holds the mutex=0D
> > +        // and transfer sole responsibility for unlocking it to this g=
uard.=0D
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
> > +    /// - The current task holds the mutex.=0D
> > +    /// - The caller transfers responsibility for unlocking the mutex =
to the returned guard=0D
> > +    ///   and must not unlock it separately (including through another=
 guard).=0D
> > +    /// - Any associated acquire context remains valid until the mutex=
 is unlocked,=0D
> > +    ///   even if the returned guard is forgotten. The context must no=
t be finalized or=0D
> > +    ///   reinitialized before then.=0D
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
> =0D
> Why is this checked despite being an unsafe function. Do you expect users=
 to=0D
> call this without knowing the lock is already locked? I think that's unli=
kely.=0D
> Perhaps make this a debug_assert instead?=0D
=0D
Sure, I don't have strong feeling on keeping it the same or making it=0D
debug_assert.=0D
=0D
> =0D
> > +=0D
> > +        Ok(MutexGuard::new(mutex))=0D
> > +    }=0D
> > +}=0D
> > +=0D
> > +impl<T: ?Sized> core::ops::Deref for MutexGuard<'_, T> {=0D
> > +    type Target =3D T;=0D
> > +=0D
> =0D
> `#[inline]` for this and others.=0D
> =0D
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
> > +    #[inline]=0D
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
> =0D
> I think we should have 3 helpers, to avoid having to branch on `kind` whi=
ch is=0D
> compile-tiome known information.=0D
> =0D
> The only part between the 3 kinds that is shared is the ctx_ptr computati=
on. I=0D
> think it should be extracted to its own helper, and be used for 3 types o=
f=0D
> locking.=0D
=0D
This one also carries the design from earlier versions. Previously we had s=
low=0D
locks as well so it wasn't only 3. I will fix this one too.=0D
=0D
> =0D
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
> =0D
> This is supposed to be a error condition?=0D
=0D
Yes, or panic. Both works.=0D
=0D
> =0D
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
> >=0D
> > [snip]=0D
> >=0D
> > diff --git a/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs b/rust/kerne=
l/sync/lock/ww_mutex/acquire_ctx.rs=0D
> > new file mode 100644=0D
> > index 0000000000000..18f4654e7df26=0D
> > --- /dev/null=0D
> > +++ b/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs=0D
> > @@ -0,0 +1,149 @@=0D
> > +// SPDX-License-Identifier: GPL-2.0=0D
> > +=0D
> > +//! Provides [`AcquireCtx`] for managing multiple wound/wait=0D
> > +//! mutexes from the same [`Class`].=0D
> > +=0D
> > +use super::{=0D
> > +    lock_common,=0D
> > +    Class,=0D
> > +    LockKind,=0D
> > +    Mutex,=0D
> > +    MutexGuard, //=0D
> > +};=0D
> > +use crate::{=0D
> > +    bindings,=0D
> > +    prelude::*,=0D
> > +    types::Opaque, //=0D
> > +};=0D
> > +use core::marker::PhantomData;=0D
> > +=0D
> > +/// Groups multiple [`Mutex`]es for deadlock avoidance when acquired=0D
> > +/// with the same [`Class`].=0D
> > +///=0D
> > +/// # Examples=0D
> > +///=0D
> > +/// ```=0D
> > +/// use kernel::{=0D
> > +///     define_ww_class,=0D
> > +///     sync::{=0D
> > +///         lock::ww_mutex::{=0D
> > +///             AcquireCtx,=0D
> > +///             Class,=0D
> > +///             Mutex, //=0D
> > +///         },=0D
> > +///         Arc,=0D
> > +///     },=0D
> > +/// };=0D
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
> > +/// // SAFETY: The guard is dropped before `ctx`.=0D
> > +/// let guard1 =3D unsafe { ctx.lock(&mutex1) }?;=0D
> > +/// // SAFETY: The guard is dropped before `ctx`.=0D
> > +/// let guard2 =3D unsafe { ctx.lock(&mutex2) }?;=0D
> > +///=0D
> > +/// // Mark acquisition phase as complete.=0D
> > +/// ctx.done();=0D
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
> =0D
> I wonder if a better API would be=0D
> =0D
>     class.new_context()=0D
> =0D
> vs.=0D
> =0D
>     AcquireCtx::new(&class)=0D
> =0D
> ?=0D
=0D
I would prefer to keep AcquireCtx::new(&class). It follows the same constru=
ctor=0D
style as Mutex::new(data, &class). I don't see much benefit in moving it to=
=0D
Class::new_context().=0D
=0D
> =0D
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
> > +    #[inline]=0D
> > +    pub fn done(&self) {=0D
> > +        // SAFETY: `self.inner` contains a valid, initialized acquire =
context.=0D
> > +        unsafe { bindings::ww_acquire_done(self.inner.get()) };=0D
> > +    }=0D
> > +=0D
> > +    /// Locks the given [`Mutex`] on this [`AcquireCtx`].=0D
> > +    ///=0D
> > +    /// # Safety=0D
> > +    ///=0D
> > +    /// On success, the caller must keep this context valid until the =
mutex is unlocked,=0D
> > +    /// even if the returned guard is forgotten. The context must not =
be finalized or=0D
> > +    /// reinitialized while the mutex remains locked.=0D
> > +    pub unsafe fn lock<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> Re=
sult<MutexGuard<'a, T>> {=0D
> > +        lock_common(mutex, Some(self), LockKind::Regular)=0D
> > +    }=0D
> > +=0D
> > +    /// Similar to [`Self::lock`], but can be interrupted by signals.=
=0D
> > +    ///=0D
> > +    /// # Safety=0D
> > +    ///=0D
> > +    /// The same requirements as [`Self::lock`] apply.=0D
> > +    pub unsafe fn lock_interruptible<'a, T>(=0D
> > +        &'a self,=0D
> > +        mutex: &'a Mutex<'a, T>,=0D
> > +    ) -> Result<MutexGuard<'a, T>> {=0D
> > +        lock_common(mutex, Some(self), LockKind::Interruptible)=0D
> > +    }=0D
> > +=0D
> > +    /// Tries to lock the [`Mutex`] on this [`AcquireCtx`] without blo=
cking.=0D
> > +    ///=0D
> > +    /// Unlike [`Self::lock`], no deadlock handling is performed.=0D
> > +    ///=0D
> > +    /// # Safety=0D
> > +    ///=0D
> > +    /// The same requirements as [`Self::lock`] apply.=0D
> > +    pub unsafe fn try_lock<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -=
> Result<MutexGuard<'a, T>> {=0D
> > +        lock_common(mutex, Some(self), LockKind::Try)=0D
> > +    }=0D
> > +}=0D
> > +=0D
> > +#[pinned_drop]=0D
> > +impl PinnedDrop for AcquireCtx<'_> {=0D
> > +    fn drop(self: Pin<&mut Self>) {=0D
> =0D
> I wonder if we can just do=0D
> =0D
>     let acquired =3D unsafe { (*self.inner.get()).acquired };=0D
>     assert!(!acquired);=0D
> =0D
> to get rid of the `unsafe`. Somewhat similar to what we do with srcu. Of =
course,=0D
> ultimately we want to use `!Leak` for this and can remove the check.=0D
=0D
I didn't understand this. You also wrote an unsafe code?=0D
=0D
> =0D
> Thoughts?=0D
> =0D
> Best,=0D
> Gary=0D
> =0D
> > +        // SAFETY: The locking methods require callers to release all =
acquired locks=0D
> > +        // before this context is dropped.=0D
> > +        unsafe { bindings::ww_acquire_fini(self.inner.get()) };=0D
> > +    }=0D
> > +}=0D
> =0D
> =0D
