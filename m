Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2261D5226B0
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Sep 2026 08:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067269; cv=none; b=ok5xnxywMpP5eE0gXpqelkcVXZ/aPa1CPo9Eo3i1MqBhjTZG5OvBcQ97c8omY0lkduSeL22w4SM6qR0nykFBuPcAP8ha3RrAL+UbXktFUnMK71coi3oki6CCvgeYTCwcNlv4vICXVCjBOsuHWmY1yJW3r1kRGu+UvUpijiajvmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067269; c=relaxed/simple;
	bh=GJKx3kBbqw3bIaJdx0WaBjazDkGxvFNgq/uWi1J0Z5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNTQUg34smmr6yKhwrQZJHEgJoosmWYQqixomUcj0CY4/V6BhhE1PnsRlPFcIZbUWX2ujSxHsjrg9DMD52NdVTUhiuXH1b1Cv59L+MA96CdETd/a+/71vVOOftDrUOmWNKEV2L0UcMsBd87FGbUouMm3Ipc6BOqLs4QAs8xDLAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JTdoNrIE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JTdoNrIE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BBD1F00893;
	Tue, 22 Sep 2026 08:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790067265;
	bh=VnDVsbkiC5dkKQCpU5LN8N76fyHdQykc99V21eHimvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JTdoNrIEFs2JLh8WITHT4mOXCT4S3O1ErgVAddtdDg3Oqnn1yZ2nx6TeztraaYdj0
	 FXs5gyaTt9jdRGiEcSKxaSScOCN/eUraEW2VCd1l1Z2XxXGdJbCuTydpHSxnXb4Qff
	 rkCYQZpbfaEOwP3VoDFdtYCyU8dulf7gJE93PbmmJX0P4PBGa5gu+Utb6M3B/9aVEb
	 0N6avzSQP76sltbmxAPzMMJQsDglTvxXMpoOUnuJziUJxsBsG8P9UqQKBDWFxXrK9a
	 v1M+EOgUDYZJcPPvs64ph75fv3TR/TgSr50U3x8VUBAQgrDaqfwT1tGNEJalY5zxDD
	 2vhzPe6HvabEQ==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5F4D0F40066;
	Tue, 22 Sep 2026 04:54:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Tue, 22 Sep 2026 04:54:24 -0400
X-ME-Sender: <xms:QEKyajuu1PR5eW7OTZ3Yy4A01KE0Fa5tOTHaYzfpTiLOg6V9UuO3lw>
    <xme:QEKyau_YNsbVaT5V0agXcvjuNDimHmbXj-m0u1D7AxzfSmj_lW7gJskoSOh93z53c
    xNQr8dc4ccHHfs_3OZpzHLvD9qQCs32pqup3C50OtHmlv3lliDNlZA>
X-ME-Received: <xmr:QEKyaju1ujDmgkGJwp8mCYN-o6YihcYghji_qHpVbtQTjkiqqf2FtdexQIaUoIGIPQc1omEyb8Bi5myYX19sEi3uidxKUPhcFJ_FjAquYuzl1BY23rPPt3Io>
X-ME-Proxy-Cause: dmFkZTEIM0ODz3FKEQgfIhtYuGUbKe9bvsTfp8NVCGrFZpJkaXdFVj35pJh9S+V+/QPMLi
    sfX1GpS3t/W8Wa2MKw6nOc6+FOsKjQF/vKFFfJ6JXm1+4Q3D7hJQmFnoUmcIpY8+F/brL3
    bT1CxLqj8+mjpv1gozZE0ZFF65JJaDgeKnw4pg3cQwOgA+No5nymgQOzDwi+uz54yI0f6t
    trH83Rmwv4DXwaQmotsrRLKVyPAIjQgj2OIT5Pt3475Pc/UT81DyxGvj+bW1FvrZH1ch8z
    X2bQQzwgEqHwMD6Ntos0WLGejHODtq+1dLs18WhgYjND7D+RfXR3LqzU04uVSrTEJgUiEn
    q+F/ypUsuPfIXvL6ORmAYmkAqnnRgdRCblc/dWqiTluAVbBV1Ki0UUYIkTh31yN/qk3YEP
    g9ogDB6vq7V/fL1dofGk53wZPU4CCzwY+/F230/OvonVtGAtYzdMj9yST8ITIS3DtFWFqi
    HRgpN1fIzH/jRJ9P1use2zhAkgf2bcF3T8x9DZbBB4Ec2v/tc7Lxwop5zc8xow+WxxzHfc
    DXclNFpnaxmHg2DaR2RW3qoCDfGtjGfIUhfrJ1G536jNycTzsjgC0GiKLd0waNyYdoF1mK
    xt7dMZYM5zpIo6rb27KtKVxwt1TdQepxzolpxkm0J/5S9UsQ63WyIaRCQhKg
X-ME-Proxy: <xmx:QEKyak7zItYXR8fbOGRZPgvxrfdbTS6T2_pGoVTzZH6z5x_v3ZhJLw>
    <xmx:QEKyasPvH1h3ZQNJMnY3D7hFcv4tG4lP81mvypotZlus9EGMCrkVvg>
    <xmx:QEKyagKf_m6aSlBZ7Dtrf1T3dcqE4NWCvvBRmzXTXC7O-fKgmtNL5A>
    <xmx:QEKyanz41E7hqCldaPFNgVugIPkHajZxyPm-i0tTs8H9c7paZejxRw>
    <xmx:QEKyag48BphMmla9IxiVPIFxoWXbBMTkuyC3QLJiapTh7yE7Dx2Vn-RM>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Sep 2026 04:54:23 -0400 (EDT)
Date: Tue, 22 Sep 2026 10:54:22 +0200
From: Boqun Feng <boqun@kernel.org>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, lossin@kernel.org, lyude@redhat.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, longman@redhat.com,
	felipe_life@live.com, daniel@sedlak.dev,
	daniel.almeida@collabora.com, thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 5/7] rust: ww_mutex: add Mutex, AcquireCtx and
 MutexGuard
Message-ID: <arJCPony_r8brzf7@MacBook-0RXW5>
References: <20260102175302.194435-1-work@onurozkan.dev>
 <20260102175302.194435-6-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260102175302.194435-6-work@onurozkan.dev>

On Fri, Jan 02, 2026 at 08:53:00PM +0300, Onur Özkan wrote:
> Covers the entire low-level locking API (lock, try_lock,
> slow path, interruptible variants) and integration with
> kernel bindings.
> 
> Signed-off-by: Onur Özkan <work@onurozkan.dev>
> ---
>  rust/kernel/sync/lock/ww_mutex.rs             | 433 ++++++++++++++++++
>  rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs | 172 +++++++
>  2 files changed, 605 insertions(+)
>  create mode 100644 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
> 
> diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/ww_mutex.rs
> index 727c51cc73af..d12d75169052 100644
> --- a/rust/kernel/sync/lock/ww_mutex.rs
> +++ b/rust/kernel/sync/lock/ww_mutex.rs
> @@ -1,7 +1,440 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  //! Rust abstractions for the kernel's wound-wait locking primitives.
> +//!
> +//! It is designed to avoid deadlocks when locking multiple [`Mutex`]es
> +//! that belong to the same [`Class`]. Each lock acquisition uses an
> +//! [`AcquireCtx`] to track ordering and ensure forward progress.
> +//!
> +//! See srctree/Documentation/locking/ww-mutex-design.rst for more details.
>  
> +use crate::error::to_result;
> +use crate::prelude::*;
> +use crate::types::{NotThreadSafe, Opaque};
> +use crate::{bindings, container_of};
> +
> +use core::cell::UnsafeCell;
> +use core::marker::PhantomData;
> +
> +pub use acquire_ctx::AcquireCtx;
>  pub use class::Class;
>  
>  mod class;
> +mod acquire_ctx;
> +mod class;
> +
> +/// A wound-wait (ww) mutex that is powered with deadlock avoidance
> +/// when acquiring multiple locks of the same [`Class`].
> +///
> +/// Each mutex belongs to a [`Class`], which the wound-wait algorithm
> +/// uses to figure out the order of acquisition and prevent deadlocks.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::define_ww_class;
> +/// use kernel::sync::Arc;
> +/// use kernel::sync::lock::ww_mutex::{AcquireCtx, Class, Mutex};
> +/// use pin_init::stack_pin_init;
> +///
> +/// define_ww_class!(SOME_WW_CLASS);
> +///
> +/// let mutex = Arc::pin_init(Mutex::new(42, &SOME_WW_CLASS), GFP_KERNEL)?;
> +/// let ctx = KBox::pin_init(AcquireCtx::new(&SOME_WW_CLASS), GFP_KERNEL)?;
> +///
> +/// let guard = ctx.lock(&mutex)?;
> +/// assert_eq!(*guard, 42);
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +#[pin_data]
> +#[repr(C)]
> +pub struct Mutex<'a, T: ?Sized> {
> +    _p: PhantomData<&'a Class>,

We should be able to do:

    class: &'a Class,

then we don't need to patch #2 in the series, right?

Regards,
Boqun

> +    #[pin]
> +    inner: Opaque<bindings::ww_mutex>,
> +    data: UnsafeCell<T>,
> +}
> +
> +impl<'class, T> Mutex<'class, T> {
> +    /// Initializes [`Mutex`] with the given `data` and [`Class`].
> +    pub fn new(data: T, class: &'class Class) -> impl PinInit<Self> {
> +        let class_ptr = class.inner.get();
> +        pin_init!(Mutex {
> +            inner <- Opaque::ffi_init(|slot: *mut bindings::ww_mutex| {
> +                // SAFETY: `class` is valid for the lifetime `'class` captured by `Self`.
> +                unsafe { bindings::ww_mutex_init(slot, class_ptr) }
> +            }),
> +            data: UnsafeCell::new(data),
> +            _p: PhantomData
> +        })
> +    }
> +}
> +
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
> +    /// Locks this [`Mutex`] without [`AcquireCtx`] using the slow path.
> +    ///
> +    /// This function should be used when [`Self::lock`] fails (typically due
> +    /// to a potential deadlock).
> +    pub fn lock_slow(&self) -> Result<MutexGuard<'_, T>> {
> +        lock_common(self, None, LockKind::Slow)
> +    }
> +
> +    /// Similar to [`Self::lock_slow`], but can be interrupted by signals.
> +    pub fn lock_slow_interruptible(&self) -> Result<MutexGuard<'_, T>> {
> +        lock_common(self, None, LockKind::SlowInterruptible)
> +    }
> +
> +    /// Tries to lock this [`Mutex`] with no [`AcquireCtx`] and without blocking.
> +    ///
> +    /// Unlike [`Self::lock`], no deadlock handling is performed.
> +    pub fn try_lock(&self) -> Result<MutexGuard<'_, T>> {
> +        lock_common(self, None, LockKind::Try)
> +    }
> +}
> +
> +impl<'class> Mutex<'class, ()> {
> +    /// Creates a [`Mutex`] from a raw pointer.
> +    ///
> +    /// This function is intended for interoperability with C code.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that:
> +    ///
> +    /// - `ptr` is a valid pointer to a `ww_mutex`.
> +    /// - `ptr` must remain valid for the lifetime `'a`.
> +    /// - ww_class associated with this mutex must be valid for
> +    ///   the lifetime `'class`.
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::ww_mutex) -> &'a Self {
> +        // SAFETY: By the safety contract, the caller guarantees that `ptr`
> +        // points to a valid `ww_mutex` which is the `inner` field of `Mutex`,
> +        // that it remains valid for the lifetime `'a` and the associated
> +        // ww_class outlives `'class`.
> +        //
> +        // Because [`Mutex`] is `#[repr(C)]`, the `inner` field sits at a
> +        // stable offset that `container_of!` can safely rely on.
> +        unsafe { &*container_of!(Opaque::cast_from(ptr), Self, inner) }
> +    }
> +}
> +
> +// SAFETY: `Mutex` can be sent to another thread if the protected
> +// data `T` can be.
> +unsafe impl<T: ?Sized + Send> Send for Mutex<'_, T> {}
> +
> +// SAFETY: `Mutex` can be shared across threads if the protected
> +// data `T` can be.
> +unsafe impl<T: ?Sized + Send + Sync> Sync for Mutex<'_, T> {}
> +
> +/// A guard that provides exclusive access to the data protected
> +/// by a [`Mutex`].
> +///
> +/// # Invariants
> +///
> +/// The guard holds an exclusive lock on the associated [`Mutex`]. The lock is held
> +/// for the entire lifetime of this guard and is automatically released when the
> +/// guard is dropped.
> +#[must_use = "the lock unlocks immediately when the guard is unused"]
> +pub struct MutexGuard<'a, T: ?Sized> {
> +    mutex: &'a Mutex<'a, T>,
> +    _not_send: NotThreadSafe,
> +}
> +
> +impl<'a, T: ?Sized> MutexGuard<'a, T> {
> +    /// Creates a new guard for the given [`Mutex`].
> +    fn new(mutex: &'a Mutex<'a, T>) -> Self {
> +        assert!(mutex.is_locked());
> +
> +        Self {
> +            mutex,
> +            _not_send: NotThreadSafe,
> +        }
> +    }
> +}
> +
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
> +    /// - The `ww_class` associated with the `ww_mutex` must be valid for the lifetime `'b`.
> +    pub unsafe fn from_raw<'b>(ptr: *mut bindings::ww_mutex) -> Result<MutexGuard<'b, ()>> {
> +        // SAFETY: By this function's safety contract, the caller guarantees that `ptr` points to a
> +        // valid `ww_mutex` which is the `inner` field of a `Mutex`. The caller also guarantees
> +        // that both `ptr` and the associated `ww_class` are valid for the lifetime `'b`.
> +        let mutex = unsafe { Mutex::from_raw(ptr) };
> +
> +        if !mutex.is_locked() {
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(MutexGuard::new(mutex))
> +    }
> +}
> +
> +impl<T: ?Sized> core::ops::Deref for MutexGuard<'_, T> {
> +    type Target = T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: self.mutex is locked, so we have exclusive access.
> +        unsafe { &*self.mutex.data.get() }
> +    }
> +}
> +
> +impl<T: ?Sized + Unpin> core::ops::DerefMut for MutexGuard<'_, T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        // SAFETY: self.mutex is locked, so we have exclusive access.
> +        unsafe { &mut *self.mutex.data.get() }
> +    }
> +}
> +
> +impl<T: ?Sized> Drop for MutexGuard<'_, T> {
> +    fn drop(&mut self) {
> +        // SAFETY: self.mutex is locked and are about to release it.
> +        unsafe { bindings::ww_mutex_unlock(self.mutex.inner.get()) };
> +    }
> +}
> +
> +// SAFETY: `MutexGuard` can be shared between threads if the data can.
> +unsafe impl<T: ?Sized + Sync> Sync for MutexGuard<'_, T> {}
> +
> +/// Locking kinds used by [`lock_common`] to unify the internal
> +/// locking logic.
> +///
> +/// It's best not to expose this type (and [`lock_common`]) to the
> +/// kernel, as it allows internal API changes without worrying
> +/// about breaking external compatibility.
> +#[derive(Copy, Clone, Debug)]
> +enum LockKind {
> +    /// Blocks until lock is acquired.
> +    Regular,
> +    /// Blocks but can be interrupted by signals.
> +    Interruptible,
> +    /// Used in slow path after deadlock detection.
> +    Slow,
> +    /// Slow path but interruptible.
> +    SlowInterruptible,
> +    /// Does not block, returns immediately if busy.
> +    Try,
> +}
> +
> +/// Internal helper that unifies the different locking kinds.
> +///
> +/// Returns [`EINVAL`] if the [`Mutex`] has a different [`Class`].
> +fn lock_common<'a, T: ?Sized>(
> +    mutex: &'a Mutex<'a, T>,
> +    ctx: Option<&AcquireCtx<'_>>,
> +    kind: LockKind,
> +) -> Result<MutexGuard<'a, T>> {
> +    let mutex_ptr = mutex.inner.get();
> +
> +    let ctx_ptr = match ctx {
> +        Some(acquire_ctx) => {
> +            let ctx_ptr = acquire_ctx.inner.get();
> +
> +            // SAFETY: `ctx_ptr` is a valid pointer for the entire
> +            // lifetime of `ctx`.
> +            let ctx_class = unsafe { (*ctx_ptr).ww_class };
> +
> +            // SAFETY: `mutex_ptr` is a valid pointer for the entire
> +            // lifetime of `mutex`.
> +            let mutex_class = unsafe { (*mutex_ptr).ww_class };
> +
> +            // `ctx` and `mutex` must use the same class.
> +            if ctx_class != mutex_class {
> +                return Err(EINVAL);
> +            }
> +
> +            ctx_ptr
> +        }
> +        None => core::ptr::null_mut(),
> +    };
> +
> +    match kind {
> +        LockKind::Regular => {
> +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is `Some`, it is pinned,
> +            // if `None`, it is set to `core::ptr::null_mut()`. Both cases are safe.
> +            let ret = unsafe { bindings::ww_mutex_lock(mutex_ptr, ctx_ptr) };
> +
> +            to_result(ret)?;
> +        }
> +        LockKind::Interruptible => {
> +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is `Some`, it is pinned,
> +            // if `None`, it is set to `core::ptr::null_mut()`. Both cases are safe.
> +            let ret = unsafe { bindings::ww_mutex_lock_interruptible(mutex_ptr, ctx_ptr) };
> +
> +            to_result(ret)?;
> +        }
> +        LockKind::Slow => {
> +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is `Some`, it is pinned,
> +            // if `None`, it is set to `core::ptr::null_mut()`. Both cases are safe.
> +            unsafe { bindings::ww_mutex_lock_slow(mutex_ptr, ctx_ptr) };
> +        }
> +        LockKind::SlowInterruptible => {
> +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is `Some`, it is pinned,
> +            // if `None`, it is set to `core::ptr::null_mut()`. Both cases are safe.
> +            let ret = unsafe { bindings::ww_mutex_lock_slow_interruptible(mutex_ptr, ctx_ptr) };
> +
> +            to_result(ret)?;
> +        }
> +        LockKind::Try => {
> +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is `Some`, it is pinned,
> +            // if `None`, it is set to `core::ptr::null_mut()`. Both cases are safe.
> +            let ret = unsafe { bindings::ww_mutex_trylock(mutex_ptr, ctx_ptr) };
> +
> +            if ret == 0 {
> +                return Err(EBUSY);
> +            } else {
> +                to_result(ret)?;
> +            }
> +        }
> +    };
> +
> +    Ok(MutexGuard::new(mutex))
> +}
> +
> +#[kunit_tests(rust_kernel_ww_mutex)]
> +mod tests {
> +    use crate::prelude::*;
> +    use crate::sync::Arc;
> +    use crate::{define_wd_class, define_ww_class};
> +
> +    use super::*;
> +
> +    define_ww_class!(TEST_WOUND_WAIT_CLASS);
> +    define_wd_class!(TEST_WAIT_DIE_CLASS);
> +
> +    #[test]
> +    fn test_ww_mutex_basic_lock_unlock() -> Result {
> +        let mutex = Arc::pin_init(Mutex::new(42, &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
> +        let ctx = KBox::pin_init(AcquireCtx::new(&TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
> +
> +        let guard = ctx.lock(&mutex)?;
> +        assert_eq!(*guard, 42);
> +
> +        // Drop the lock.
> +        drop(guard);
> +
> +        let mut guard = ctx.lock(&mutex)?;
> +        *guard = 100;
> +        assert_eq!(*guard, 100);
> +
> +        Ok(())
> +    }
> +
> +    #[test]
> +    fn test_ww_mutex_trylock() -> Result {
> +        let mutex = Arc::pin_init(Mutex::new(123, &TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
> +        let ctx = KBox::pin_init(AcquireCtx::new(&TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
> +
> +        // `try_lock` on unlocked mutex should succeed.
> +        let guard = ctx.try_lock(&mutex)?;
> +        assert_eq!(*guard, 123);
> +
> +        // Now it should fail immediately as it's already locked.
> +        assert!(ctx.try_lock(&mutex).is_err());
> +
> +        Ok(())
> +    }
> +
> +    #[test]
> +    fn test_ww_mutex_is_locked() -> Result {
> +        let mutex = Arc::pin_init(Mutex::new("hello", &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
> +        let ctx = KBox::pin_init(AcquireCtx::new(&TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
> +
> +        // Should not be locked initially.
> +        assert!(!mutex.is_locked());
> +
> +        let guard = ctx.lock(&mutex)?;
> +        assert!(mutex.is_locked());
> +
> +        drop(guard);
> +        assert!(!mutex.is_locked());
> +
> +        Ok(())
> +    }
> +
> +    #[test]
> +    fn test_ww_acquire_context_done() -> Result {
> +        let mutex1 = Arc::pin_init(Mutex::new(1, &TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
> +        let mutex2 = Arc::pin_init(Mutex::new(2, &TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
> +        let ctx = KBox::pin_init(AcquireCtx::new(&TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
> +
> +        // Acquire multiple mutexes with the same context.
> +        let guard1 = ctx.lock(&mutex1)?;
> +        let guard2 = ctx.lock(&mutex2)?;
> +
> +        assert_eq!(*guard1, 1);
> +        assert_eq!(*guard2, 2);
> +
> +        // SAFETY: It's called exactly once here and nowhere else.
> +        unsafe { ctx.done() };
> +
> +        // We shouldn't be able to lock once it's `done`.
> +        assert!(ctx.lock(&mutex1).is_err());
> +        assert!(ctx.lock(&mutex2).is_err());
> +
> +        Ok(())
> +    }
> +
> +    #[test]
> +    fn test_mutex_without_ctx() -> Result {
> +        let mutex = Arc::pin_init(Mutex::new(100, &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
> +        let guard = mutex.lock()?;
> +
> +        assert_eq!(*guard, 100);
> +        assert!(mutex.is_locked());
> +
> +        drop(guard);
> +
> +        assert!(!mutex.is_locked());
> +
> +        Ok(())
> +    }
> +
> +    #[test]
> +    fn test_guard_from_raw_with_unlocked_mutex() -> Result {
> +        let mutex = Arc::pin_init(Mutex::new((), &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
> +
> +        assert!(!mutex.is_locked());
> +
> +        // SAFETY: `mutex` remains valid for the duration of this test.
> +        match unsafe { MutexGuard::from_raw(mutex.inner.get()) } {
> +            // Should fail with `EINVAL` because the mutex is not locked.
> +            Err(e) => assert_eq!(e, EINVAL),
> +            _ => unreachable!(),
> +        };
> +
> +        Ok(())
> +    }
> +}
> +>>>>>>> 90f935950ff8 (rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard)
> diff --git a/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs b/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
> new file mode 100644
> index 000000000000..4b773c76bd2c
> --- /dev/null
> +++ b/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
> @@ -0,0 +1,172 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Provides [`AcquireCtx`] for managing multiple wound/wait
> +//! mutexes from the same [`Class`].
> +
> +use crate::bindings;
> +use crate::prelude::*;
> +use crate::types::Opaque;
> +
> +use core::marker::PhantomData;
> +
> +use super::{lock_common, Class, LockKind, Mutex, MutexGuard};
> +
> +/// Groups multiple [`Mutex`]es for deadlock avoidance when acquired
> +/// with the same [`Class`].
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::sync::lock::ww_mutex::{Class, AcquireCtx, Mutex};
> +/// use kernel::define_ww_class;
> +/// use kernel::sync::Arc;
> +/// use pin_init::stack_pin_init;
> +///
> +/// define_ww_class!(SOME_WW_CLASS);
> +///
> +/// // Create mutexes.
> +/// let mutex1 = Arc::pin_init(Mutex::new(1, &SOME_WW_CLASS), GFP_KERNEL)?;
> +/// let mutex2 = Arc::pin_init(Mutex::new(2, &SOME_WW_CLASS), GFP_KERNEL)?;
> +///
> +/// // Create acquire context for deadlock avoidance.
> +/// let ctx = KBox::pin_init(AcquireCtx::new(&SOME_WW_CLASS), GFP_KERNEL)?;
> +///
> +/// let guard1 = ctx.lock(&mutex1)?;
> +/// let guard2 = ctx.lock(&mutex2)?;
> +///
> +/// // Mark acquisition phase as complete.
> +/// // SAFETY: It's called exactly once here and nowhere else.
> +/// unsafe { ctx.done() };
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +#[pin_data(PinnedDrop)]
> +#[repr(transparent)]
> +pub struct AcquireCtx<'a> {
> +    #[pin]
> +    pub(super) inner: Opaque<bindings::ww_acquire_ctx>,
> +    _p: PhantomData<&'a Class>,
> +}
> +
> +impl<'class> AcquireCtx<'class> {
> +    /// Initializes a new [`AcquireCtx`] with the given [`Class`].
> +    pub fn new(class: &'class Class) -> impl PinInit<Self> {
> +        let class_ptr = class.inner.get();
> +        pin_init!(AcquireCtx {
> +            inner <- Opaque::ffi_init(|slot: *mut bindings::ww_acquire_ctx| {
> +                // SAFETY: `class` is valid for the lifetime `'class` captured
> +                // by `AcquireCtx`.
> +                unsafe { bindings::ww_acquire_init(slot, class_ptr) }
> +            }),
> +            _p: PhantomData
> +        })
> +    }
> +
> +    /// Creates a [`AcquireCtx`] from a raw pointer.
> +    ///
> +    /// This function is intended for interoperability with C code.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that `ptr` is a valid pointer to the `inner` field
> +    /// of [`AcquireCtx`] and that it remains valid for the lifetime `'a`.
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::ww_acquire_ctx) -> &'a Self {
> +        // SAFETY: By the safety contract, `ptr` is valid to construct `AcquireCtx`.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Marks the end of the acquire phase.
> +    ///
> +    /// Calling this function is optional. It is just useful to document
> +    /// the code and clearly designated the acquire phase from actually
> +    /// using the locked data structures.
> +    ///
> +    /// After calling this function, no more mutexes can be acquired with
> +    /// this context.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that this function is called only once
> +    /// and after calling it, no further mutexes are acquired using
> +    /// this context.
> +    pub unsafe fn done(&self) {
> +        // SAFETY: By the safety contract, the caller guarantees that this
> +        // function is called only once.
> +        unsafe { bindings::ww_acquire_done(self.inner.get()) };
> +    }
> +
> +    /// Re-initializes the [`AcquireCtx`].
> +    ///
> +    /// Must be called after releasing all locks when [`EDEADLK`] occurs.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure no locks are held in this [`AcquireCtx`].
> +    pub unsafe fn reinit(self: Pin<&mut Self>) {
> +        let ctx = self.inner.get();
> +
> +        // SAFETY: `ww_class` is always a valid pointer in properly initialized
> +        // `AcquireCtx`.
> +        let class_ptr = unsafe { (*ctx).ww_class };
> +
> +        // SAFETY:
> +        //  - Lifetime of any guard (which hold an immutable borrow of `self`) cannot overlap
> +        //    with the execution of this function. This enforces that all locks acquired via
> +        //    this context have been released.
> +        //
> +        //  - `ctx` is guaranteed to be initialized because `ww_acquire_fini`
> +        //    can only be called from the `Drop` implementation.
> +        //
> +        //  - `ww_acquire_fini` is safe to call on an initialized context.
> +        unsafe { bindings::ww_acquire_fini(ctx) };
> +
> +        // SAFETY: `ww_acquire_init` is safe to call with valid pointers
> +        // to initialize an uninitialized context.
> +        unsafe { bindings::ww_acquire_init(ctx, class_ptr) };
> +    }
> +
> +    /// Locks the given [`Mutex`] on this [`AcquireCtx`].
> +    pub fn lock<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> Result<MutexGuard<'a, T>> {
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
> +    /// Locks the given [`Mutex`] on this [`AcquireCtx`] using the slow path.
> +    ///
> +    /// This function should be used when [`Self::lock`] fails (typically due
> +    /// to a potential deadlock).
> +    pub fn lock_slow<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> Result<MutexGuard<'a, T>> {
> +        lock_common(mutex, Some(self), LockKind::Slow)
> +    }
> +
> +    /// Similar to [`Self::lock_slow`], but can be interrupted by signals.
> +    pub fn lock_slow_interruptible<'a, T>(
> +        &'a self,
> +        mutex: &'a Mutex<'a, T>,
> +    ) -> Result<MutexGuard<'a, T>> {
> +        lock_common(mutex, Some(self), LockKind::SlowInterruptible)
> +    }
> +
> +    /// Tries to lock the [`Mutex`] on this [`AcquireCtx`] without blocking.
> +    ///
> +    /// Unlike [`Self::lock`], no deadlock handling is performed.
> +    pub fn try_lock<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> Result<MutexGuard<'a, T>> {
> +        lock_common(mutex, Some(self), LockKind::Try)
> +    }
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for AcquireCtx<'_> {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY: Given the lifetime bounds we know no locks are held,
> +        // so calling `ww_acquire_fini` is safe.
> +        unsafe { bindings::ww_acquire_fini(self.inner.get()) };
> +    }
> +}
> -- 
> 2.51.2
> 
