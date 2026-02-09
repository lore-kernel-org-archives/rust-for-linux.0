Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE9F309F13
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 11:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770636628; cv=none; b=dhmYVjoLwzkJmCjI0Hz+0/7cWm/9NDsPKw7Ps/Dl8ZiQmDIEMcERg4e/7Z4qayZX1O+YVb4q/nBOUryRXcyrjsZs4dQn87yGeGib4WQWliHVo9rbhrRVIORoSfGqT5Ia7U6vZWyu3FqlAjTkWnzyNh88nkhny4/nTM3ykxsRggg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770636628; c=relaxed/simple;
	bh=QoCkRBGUPdHeeEONxNSG/v7ypDaj+Noume7ntAehjWc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kD5cObyZbP6ybhWMTM/5AX2CtOzvVEVb1sLSSNGn736r9rp0wqHHLIKAsJjqcoo7pcvt4t2SALZREfX/WIzwq4NXmh/oz15P2yrWb9J9yx5wDvc93T81sxaPxUUGF2+w4MFg8nvTypLztrd5BAJpMFzyeCbUy7QZmoFx/8v9LE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QctJ8tL0; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QctJ8tL0"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-4376c206493so912080f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 03:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770636627; x=1771241427; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B6UWN0OsE7QW1x3g1701AwzacxmXzQP0I4E5tISve+w=;
        b=QctJ8tL0Ir22NjWvPOQSSTHg977cHg04QSPp8IRjrn+wEMI+QpaojmU0BDpM6LHddp
         z+Oqh6quBpSSKEBcd9161FZwB/3efrgGzaWMHEzcFjzwe2ACDN8LQrGcgfOlScCFUrwa
         nxUcFecZg0Di4tRl1to4UhK3KQmBFtzuM4T4RHrG2A/7E4Fve21RtYnts7IlNfly5aFk
         piQDQgcL6HigYd7sXqElBI8dXOpLl3E7PaaBoJ1nN+EJ2KuTSAF/J4nGW6LwBaKXmR7i
         jzsz9HSmvIYw981KSfVgCsJ+mWu7Z5X6tQFjNyQ3MQzLih6K+EA+iOf8YmbZet0jyXlM
         QU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770636627; x=1771241427;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6UWN0OsE7QW1x3g1701AwzacxmXzQP0I4E5tISve+w=;
        b=HbOzk99TKRvpWt/YRm72gcMVBOPxV1bjhtx6kz5koTdR4pazOYGY+6Yi77wcvqggne
         HtwFpndmunjDHGbWMOknBVmcU6injkLMz27VA9rTeljNmJ3yCcWK1NxaS8XCj77op54L
         /mjKSqcVEHx7QAo3NL3JqYs8XZjWvSTzXLnU1M6nJRoaLrE4npyruyi3Rw378r08BsCG
         kFuyhbJkBN0qM6c91bwxkZCWA9FGelz3+ibij4HS/4Cm5OGTQHcYWERvUAbwLz1RzfLN
         xHW3cjYS0htAmEBnAexQOEc0Sw3XuGFC2z+h6LWE+U5gZIUgdhMV2hmf3rjwrKAjgzb9
         vEQg==
X-Forwarded-Encrypted: i=1; AJvYcCWFr5gOEJdDW6twMPMvu+NwzfcRuYD9tS+xyumN8uJk/K76nKG9qEhEgrxQ39LOdpDQR7yw6f4ZUsJxy3n3sA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoqPzJGmk5oGR6uUkyIJ/ZEusMHSmalN/dFgzIgvWG/NhTXOFP
	CcXNnBiX+vJdiLGHEsVxxcbwkHfGCHkacgqSitj61I5J36+S6CrJwm37hZyPPkZjJr4M/s7sn/g
	kJexdCVJccIHhbRLGZA==
X-Received: from wrgb9.prod.google.com ([2002:a05:6000:3c9:b0:437:7057:b172])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:230a:b0:437:678b:83ca with SMTP id ffacd0b85a97d-437678b8589mr8686513f8f.50.1770636626863;
 Mon, 09 Feb 2026 03:30:26 -0800 (PST)
Date: Mon, 9 Feb 2026 11:30:25 +0000
In-Reply-To: <20260203081403.68733-4-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203081403.68733-2-phasta@kernel.org> <20260203081403.68733-4-phasta@kernel.org>
Message-ID: <aYnFUX8mvsrH10RT@google.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 03, 2026 at 09:14:01AM +0100, Philipp Stanner wrote:
> +void rust_helper_dma_fence_get(struct dma_fence *f)
> +{
> +	dma_fence_get(f);
> +}
> +
> +void rust_helper_dma_fence_put(struct dma_fence *f)
> +{
> +	dma_fence_put(f);
> +}
> +
> +bool rust_helper_dma_fence_begin_signalling(void)
> +{
> +	return dma_fence_begin_signalling();
> +}
> +
> +void rust_helper_dma_fence_end_signalling(bool cookie)
> +{
> +	dma_fence_end_signalling(cookie);
> +}
> +
> +bool rust_helper_dma_fence_is_signaled(struct dma_fence *f)
> +{
> +	return dma_fence_is_signaled(f);
> +}

These should use the __rust_helper #define. See:
https://lore.kernel.org/r/20260105-define-rust-helper-v2-0-51da5f454a67@google.com

> +void rust_helper_spin_lock_init(spinlock_t *lock)
> +{
> +	spin_lock_init(lock);
> +}
> [..]
> +#[pin_data]
> +pub struct DmaFenceCtx {
> +    /// An opaque spinlock. Only ever passed to the C backend, never used by Rust.
> +    #[pin]
> +    lock: Opaque<bindings::spinlock_t>,
> [...]
> +}
> +
> +impl DmaFenceCtx {
> +    /// Create a new `DmaFenceCtx`.
> +    pub fn new() -> Result<Arc<Self>> {
> +        let ctx = pin_init!(Self {
> +            // Feed in a non-Rust spinlock for now, since the Rust side never needs the lock.
> +            lock <- Opaque::ffi_init(|slot: *mut bindings::spinlock| {
> +                // SAFETY: `slot` is a valid pointer to an uninitialized `struct spinlock_t`.
> +                unsafe { bindings::spin_lock_init(slot) };
> +            }),

We already have a __spin_lock_init() helper used by our SpinLock type. Can we
just use that one instead of adding a new one?

But actually I think it's simpler to just use SpinLock<()> as the type here. We
have (or should add) a method to get the `state` field from a SpinLock<()>,
which gets you a raw spinlock_t you can pass to C code.

> +use core::{
> [...]
> +    sync::atomic::{AtomicU64, Ordering},
> +};

This should use kernel::sync::atomic instead.

> +use kernel::c_str;
> [...]
> +    extern "C" fn get_driver_name(_ptr: *mut bindings::dma_fence) -> *const c_char {
> +        c_str!("DRIVER_NAME_UNUSED").as_char_ptr()
> +    }
> +
> +    extern "C" fn get_timeline_name(_ptr: *mut bindings::dma_fence) -> *const c_char {
> +        c_str!("TIMELINE_NAME_UNUSED").as_char_ptr()
> +    }

We have c-strings literals now:

	extern "C" fn get_driver_name(_ptr: *mut bindings::dma_fence) -> *const c_char {
	    c"DRIVER_NAME_UNUSED".as_char_ptr()
	}
	
	extern "C" fn get_timeline_name(_ptr: *mut bindings::dma_fence) -> *const c_char {
	    c"TIMELINE_NAME_UNUSED".as_char_ptr()
	}

> +pub trait DmaFenceCbFunc {
> +    /// The callback function. `cb` is a container of the data which the driver passed in
> +    /// [`DmaFence::register_callback`].
> +    fn callback(cb: Pin<KBox<DmaFenceCb<Self>>>)
> +    where
> +        Self: Sized;
> +}

Just make Sized into a super-trait.

	pub trait DmaFenceCbFunc: Sized {
	    /// The callback function. `cb` is a container of the data which the driver passed in
	    /// [`DmaFence::register_callback`].
	    fn callback(cb: Pin<KBox<DmaFenceCb<Self>>>);
	}

Probably also include 'static next to Sized instead of specifying it on
register_callback().

> +impl<T: DmaFenceCbFunc + 'static> DmaFenceCb<T> {
> +    unsafe extern "C" fn callback(
> +        _fence_ptr: *mut bindings::dma_fence,
> +        cb_ptr: *mut bindings::dma_fence_cb,
> +    ) {
> [...]
> +        // SAFETY: `cp_ptr` is the heap memory of a Pin<Kbox<Self>> because it was created by
> +        // invoking ForeignOwnable::into_foreign() on such an instance.
> +        let cb = unsafe { <Pin<KBox<Self>> as ForeignOwnable>::from_foreign(cb_ptr) };
> +    }
> +}
> [...]
> +    pub fn register_callback<U: DmaFenceCbFunc + 'static>(&self, data: impl PinInit<U>) -> Result {
> +        let cb = DmaFenceCb::new(data)?;
> +        let ptr = cb.into_foreign() as *mut DmaFenceCb<U>;

The ForeignOwnable trait provides no guarantees about where the void pointer
points. The only legal usage of such a void pointer is to pass it to
from_foreign() and borrow() and other similar methods defined on the
ForeignOwnable trait. Casting it to DmaFenceCb<U> and dereferencing it is
illegal because it might point elsewhere in the box than at the DmaFenceCb<U>
value. (Yes for Box it happens to point there, but for e.g. Arc it points at the
refcount_t value instead.)

Please replace this usage of ForeignOwnable with Box::into_raw() /
Box::from_raw() calls, or use ForeignOwnable::borrow[_mut]() to access the
value.

> +    pub fn register_callback<U: DmaFenceCbFunc + 'static>(&self, data: impl PinInit<U>) -> Result {
> +        let cb = DmaFenceCb::new(data)?;
> +        let ptr = cb.into_foreign() as *mut DmaFenceCb<U>;
> +        // SAFETY: `ptr` was created validly directly above.
> +        let inner_cb = unsafe { (*ptr).inner.get() };
> +
> +        // SAFETY: `self.as_raw()` is valid because `self` is refcounted, `inner_cb` was created
> +        // validly above and was turned into a ForeignOwnable, so it won't be dropped. `callback`
> +        // has static life time.
> +        let ret = unsafe {
> +            bindings::dma_fence_add_callback(
> +                self.as_raw(),
> +                inner_cb,
> +                Some(DmaFenceCb::<U>::callback),
> +            )
> +        };
> +        if ret != 0 {
> +            return Err(Error::from_errno(ret));
> +        }
> +        Ok(())

On error, this function leaks the DmaFenceCb allocation. It should be converted
back to a Box so that the destructor may run.

	drop(unsafe { Box::from_raw(ptr) });
	// or perhaps:
	drop(unsafe { DmaFenceCb::from_raw(...) });

Also this should use to_result().


> +impl<T: DmaFenceCbFunc + 'static> DmaFenceCb<T> {
> +    fn new(data: impl PinInit<T>) -> Result<Pin<KBox<Self>>> {
> [...]
> +        KBox::pin_init(cb, GFP_KERNEL)
> [...]
> +impl DmaFenceCtx {
> +    /// Create a new `DmaFenceCtx`.
> +    pub fn new() -> Result<Arc<Self>> {
> [...]
> +        Arc::pin_init(ctx, GFP_KERNEL)

Shouldn't the gfp flags be provided by the caller instead of hard-coding
GFP_KERNEL here?

> +unsafe impl<T> AlwaysRefCounted for DmaFence<T> {
> +    /// # Safety
> +    ///
> +    /// `ptr`must be a valid pointer to a [`DmaFence`].
> +    unsafe fn dec_ref(ptr: NonNull<Self>) {
> +        // SAFETY: `ptr` is never a NULL pointer; and when `dec_ref()` is called
> +        // the fence is by definition still valid.
> +        let fence = unsafe { (*ptr.as_ptr()).inner.get() };
> +
> +        // SAFETY: Valid because `fence` was created validly above.
> +        unsafe { bindings::dma_fence_put(fence) }

The safety requirements of `dec_ref()` as described here are incomplete. The
caller must also give up ownership of one refcount to the value before they may
call this method. But you may simply delete that section because this is a trait
implementation, and the safety requirements are inherited from the declaration
of AlwaysRefCounted.

The safety comment on `let fence` is also not quite right. I don't think it's
useful to talk about NULL because you require something stronger than NULL for
this operation - for example `0xDEADBEEF as *mut DmaFence<T>` is not NULL but
would also be illegal here.

A better wording would be to say that by the safety requirements, the caller
passes a valid pointer to a `DmaFence<T>`.

And the safety comment on dma_fence_put() is also incomplete. The caller must
pass ownership of one refcount, so the safety comment should mention why we can
pass ownership of a refcount here (it is because caller must pass ownership of a
refcount to us by the safety requirments).

> +    /// Mark the beginning of a DmaFence signalling critical section. Should be called once a fence
> +    /// gets published.
> +    ///
> +    /// The signalling critical section is marked as finished automatically once the fence signals.
> +    pub fn begin_signalling(&mut self) {

I doubt it's legal to have a `&mut DmaFence<T>` because I could call
`mem::swap()` with two of them, which likely invalidates stuff inside `inner`.

> +    const fn ops_create() -> bindings::dma_fence_ops {
> +        // SAFETY: Zeroing out memory on the stack is always safe.
> +        let mut ops: bindings::dma_fence_ops = unsafe { core::mem::zeroed() };

No it's not always safe. If I have a local variable of type reference,
then it's not safe to zero that value because NULL is not a legal value
for references. The reason this is ok is because all fields of
dma_fence_ops are values that are nullable.

This should probably just use the safe pin_init::zeroed() function.

> +impl<T> DmaFence<T> {
> +    /// Create an initializer for a new [`DmaFence`].
> +    fn new(
> +        fctx: Arc<DmaFenceCtx>,
> +        data: impl PinInit<T>, // TODO: The driver data should implement PinInit<T, Error>
> +        lock: &Opaque<bindings::spinlock_t>,
> +        context: u64,
> +        seqno: u64,
> +    ) -> Result<ARef<Self>> {

This function should be unsafe. There are clearly some safety requirements here.
For example, I suspect it's required that `lock` does not get freed before the
returned value?

Making this function unsafe reveals that DmaFenceCtx::new_fence is missing a
safety requirement explaining why self.lock is alive for long enough.

Alice
