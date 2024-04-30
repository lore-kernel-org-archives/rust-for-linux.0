Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647D4181CF6
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 18:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714501129; cv=none; b=lukuuqjhybab5cKEOMfFZE/vWYCqD08PAacCZSgP1YKObhoZOgl3sFvsgI56GbvjnqKe/Q+Lz/Dk9ZfaZTkn4jyQwpYHd1+OPfoGXjNClDEGvb5v9H9WN3AeZqSFmchDqR+VzUpoalxLAMAeKCdr6NNmZrahIyPrPyp49NlZdXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714501129; c=relaxed/simple;
	bh=FFxl8qB//45QrjrchX4PxOQlS4a82kqp/tHErEGvzkA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uYZAUaC3kFYycDHxLhj5OdBuUsQoP6LmGNbMi4cc8UpvUalWdg22ViskWJ6ccRW4CTOFwin63sVRg/5u4g0tdZTf3ZgQisD5YIXV6bxxKYZUHcLQdk7eYBz4zLrQ2Tke81RF0adm6VCQ5n9troS5f6tjrsjvg+hfOEkPSkBQVXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=HFeneyXh; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="HFeneyXh"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5729fd821ebso1151466a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 11:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1714501124; x=1715105924; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XwbT0bDJS4cuvIKYJ5MCUzOonBi2XeLe/vBSN6rjmh0=;
        b=HFeneyXhXnVGHGOCFHWSBQ1CKckNYAptrzjn//RxR7UeowGzO+Oz3T1FOhQpN/QZzI
         Bh1+iWiQl3i7O8/+7FoB8PEvCab+K7CJf3xNF0IMs7uOTYHQxdgahn5uHi6PvVPGSgL4
         9Z4HEOpZffD2r/nnAP2CRqLp0tzi62Lz9Wa1TXQRrJRFZ2RLCWLyZ+ureyIYj4AHXxDn
         0QfYe31zTda2HAD3KyPNSOhnVz5MThhMpNl3OyKHNKeNjpVKCMr3UUsWhO/qQLPQe+SV
         a8LUhEemzUCdmzsFlqP55uHKrvX5sQ695mWK3m5oxE3uMK14zBNNXkHD6b/7voI2rPGo
         +uyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714501124; x=1715105924;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwbT0bDJS4cuvIKYJ5MCUzOonBi2XeLe/vBSN6rjmh0=;
        b=oBZtPNxOpGgNpWqU0sFXUiZu+CNBMs8Y4V4UOZTbJLT1qanzbiRvqFvkCQajJC4eie
         zP1JQj89TNDDZI58YtAlYSMleG2Oa3FKe8TQX2kkYbIef6jbH78d++p79XSQv5GKkRah
         i17PVDBx2qOVWpCi6PA2UHy6RbWMY63+lEq+A8OwdmDdjnwRaAkL5St/xfBoS3TNcVRJ
         p/8h+zeD8GWLnxAc5rZDPnGx8i8Kc/LKgn/ls/VydulrCdPeR4Ql3rH9lJBDSAxhB/HC
         kDu70IcCv+yplVgmEytG3k2jV2rdhPhoYFB0WFU8qUn564d3IJAhuPh6fkudnh3E/G9V
         AF3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRzUQWhofL5Twy7JtTVU5+AHb2weiSmqV8XVWthrnK9B9uT6Rd4xech5akXPu+6i1VFlb9/Znd6Ls8zbmeLLt8Zebe+cat+MSgEhjLc+E=
X-Gm-Message-State: AOJu0YxH/YWIQWiAkOWR6r2BVRi0Dxp0xV0KwadtAWM/s56oSKriLJkk
	M3POAfvDCSQUQbimycNfmQ2xarnjktktJ37d5KUXSlBcdz5PdsYrbvS5adFUw4E=
X-Google-Smtp-Source: AGHT+IGHmGpIIrCMvisGBGS0iI+hXs6bA+6kK8qgiREhkWEPZLRoNxMG2EyvoduAixViwuWUVHvVww==
X-Received: by 2002:a50:9e25:0:b0:56b:dd0f:52e0 with SMTP id z34-20020a509e25000000b0056bdd0f52e0mr404637ede.18.1714501124267;
        Tue, 30 Apr 2024 11:18:44 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id n5-20020a056402434500b0057278b1b139sm3442878edc.29.2024.04.30.11.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 11:18:43 -0700 (PDT)
From: Andreas Hindborg <nmi@metaspace.dk>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Wedson Almeida Filho <wedsonaf@gmail.com>,  Anna-Maria Behnsen
 <anna-maria@linutronix.de>,  Frederic Weisbecker <frederic@kernel.org>,
  Andreas Hindborg <a.hindborg@samsung.com>,  Boqun Feng
 <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6?=
 =?utf-8?Q?rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  Benno Lossin <benno.lossin@proton.me>,  Alice
 Ryhl <aliceryhl@google.com>,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: hrtimer: introduce hrtimer support
In-Reply-To: <87r0emss0j.ffs@tglx> (Thomas Gleixner's message of "Tue, 30 Apr
	2024 19:02:36 +0200")
References: <20240425094634.262674-1-nmi@metaspace.dk> <87r0emss0j.ffs@tglx>
User-Agent: mu4e 1.12.4; emacs 29.3
Date: Tue, 30 Apr 2024 20:18:37 +0200
Message-ID: <87le4uk936.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi Thomas,

Thomas Gleixner <tglx@linutronix.de> writes:

> Andreas!
>
> On Thu, Apr 25 2024 at 11:46, Andreas Hindborg wrote:
>
> I'm looking at this purely from a hrtimer perspective and please excuse
> my minimal rust knowledge.

Thanks for taking a look!

>
>> +// SAFETY: A `Timer` can be moved to other threads and used from there.
>> +unsafe impl<T> Send for Timer<T> {}
>> +
>> +// SAFETY: Timer operations are locked on C side, so it is safe to operate on a
>> +// timer from multiple threads
>
> Kinda. Using an hrtimer from different threads needs some thought in the
> implementation as obviously ordering matters:
>
>      T1                              T2
>      hrtimer_start()                 hrtimer_cancel()
>
> So depending on whether T1 gets the internal lock first or T2 the
> outcome is different. If T1 gets it first the timer is canceled by
> T2. If T2 gets it first the timer ends up armed.

That is all fine. What is meant here is that we will not get UB in the
`hrtimer` subsystem when racing these operations. As far as I can tell
from the C source, the operations are atomic, even though their
interleaving will not be deterministic.

>
>> +unsafe impl<T> Sync for Timer<T> {}
>> +
>> +impl<T: TimerCallback> Timer<T> {
>> +    /// Return an initializer for a new timer instance.
>> +    pub fn new() -> impl PinInit<Self> {
>> +        crate::pin_init!( Self {
>> +            timer <- Opaque::ffi_init(move |place: *mut bindings::hrtimer| {
>> +                // SAFETY: By design of `pin_init!`, `place` is a pointer live
>> +                // allocation. hrtimer_init will initialize `place` and does not
>> +                // require `place` to be initialized prior to the call.
>> +                unsafe {
>> +                    bindings::hrtimer_init(
>> +                        place,
>> +                        bindings::CLOCK_MONOTONIC as i32,
>> +                        bindings::hrtimer_mode_HRTIMER_MODE_REL,
>
> This is odd. The initializer really should take a clock ID and a mode
> argument. Otherwise you end up implementing a gazillion of different
> timers.

I implemented the minimum set of features to satisfy the requirements
for the Rust null block driver. It is my understanding that most
maintainers of existing infrastructure prefers to have a user for the
implemented features, before wanting to merge them.

I can try to extend the abstractions to cover a more complete `hrtimer`
API. Or we can work on this subset and try to get that ready to merge,
and then expand scope later.

What would you prefer?

>
>> +                    );
>> +                }
>> +
>> +                // SAFETY: `place` is pointing to a live allocation, so the deref
>> +                // is safe. The `function` field might not be initialized, but
>> +                // `addr_of_mut` does not create a reference to the field.
>> +                let function: *mut Option<_> = unsafe { core::ptr::addr_of_mut!((*place).function) };
>> +
>> +                // SAFETY: `function` points to a valid allocation.
>> +                unsafe { core::ptr::write(function, Some(T::Receiver::run)) };
>
> We probably should introduce hrtimer_setup(timer, clockid, mode, function)
> to avoid this construct. That would allow to cleanup existing C code too.

Do you want me to cook up a C patch for that, or would you prefer to do
that yourself?

>
>> +            }),
>> +            _t: PhantomData,
>> +        })
>> +    }
>> +}
>> +
>> +#[pinned_drop]
>> +impl<T> PinnedDrop for Timer<T> {
>> +    fn drop(self: Pin<&mut Self>) {
>> +        // SAFETY: By struct invariant `self.timer` was initialized by
>> +        // `hrtimer_init` so by C API contract it is safe to call
>> +        // `hrtimer_cancel`.
>> +        unsafe {
>> +            bindings::hrtimer_cancel(self.timer.get());
>> +        }
>> +    }
>> +}
>> +
>> +/// Implemented by pointer types to structs that embed a [`Timer`]. This trait
>> +/// facilitates queueing the timer through the pointer that implements the
>> +/// trait.
>> +///
>> +/// Typical implementers would be [`Box<T>`], [`Arc<T>`], [`ARef<T>`] where `T`
>> +/// has a field of type `Timer`.
>> +///
>> +/// Target must be [`Sync`] because timer callbacks happen in another thread of
>> +/// execution.
>
> Timer callbacks happen in hard or soft interrupt context.

Thanks, I'll be sure to add that to the documentation.

>
>> +/// [`Box<T>`]: Box
>> +/// [`Arc<T>`]: Arc
>> +/// [`ARef<T>`]: crate::types::ARef
>> +pub trait RawTimer: Sync {
>> +    /// Schedule the timer after `expires` time units
>> +    fn schedule(self, expires: u64);
>
> Don't we have some time related rust types in the kernel by now?

There are patches on the list, but I think they are not applied to any
tree yet? I did not want to depend on those patches before they are
staged somewhere. Would you prefer this patch on top of the Rust `ktime`
patches?

>
>> +}
>
>> +/// Implemented by pointer types that can be the target of a C timer callback.
>> +pub trait RawTimerCallback: RawTimer {
>> +    /// Callback to be called from C.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// Only to be called by C code in `hrtimer`subsystem.
>> +    unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::hrtimer_restart;
>> +}
>> +
>> +/// Implemented by pointers to structs that can the target of a timer callback
>> +pub trait TimerCallback {
>> +    /// Type of `this` argument for `run()`.
>> +    type Receiver: RawTimerCallback;
>> +
>> +    /// Called by the timer logic when the timer fires
>> +    fn run(this: Self::Receiver);
>> +}
>> +
>> +impl<T> RawTimer for Arc<T>
>> +where
>> +    T: Send + Sync,
>> +    T: HasTimer<T>,
>> +{
>> +    fn schedule(self, expires: u64) {
>> +        let self_ptr = Arc::into_raw(self);
>> +
>> +        // SAFETY: `self_ptr` is a valid pointer to a `T`
>> +        let timer_ptr = unsafe { T::raw_get_timer(self_ptr) };
>> +
>> +        // `Timer` is `repr(transparent)`
>> +        let c_timer_ptr = timer_ptr.cast::<bindings::hrtimer>();
>> +
>> +        // Schedule the timer - if it is already scheduled it is removed and
>> +        // inserted
>> +
>> +        // SAFETY: c_timer_ptr points to a valid hrtimer instance that was
>> +        // initialized by `hrtimer_init`
>> +        unsafe {
>> +            bindings::hrtimer_start_range_ns(
>> +                c_timer_ptr.cast_mut(),
>> +                expires as i64,
>
> same comment vs. time
>
>> +                0,
>> +                bindings::hrtimer_mode_HRTIMER_MODE_REL,
>
> and mode.
>
>> +            );
>> +        }
>> +    }
>> +}
>> +
>> +impl<T> kernel::hrtimer::RawTimerCallback for Arc<T>
>> +where
>> +    T: Send + Sync,
>> +    T: HasTimer<T>,
>> +    T: TimerCallback<Receiver = Self>,
>> +{
>> +    unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::hrtimer_restart {
>> +        // `Timer` is `repr(transparent)`
>> +        let timer_ptr = ptr.cast::<kernel::hrtimer::Timer<T>>();
>> +
>> +        // SAFETY: By C API contract `ptr` is the pointer we passed when
>> +        // enqueing the timer, so it is a `Timer<T>` embedded in a `T`
>> +        let data_ptr = unsafe { T::timer_container_of(timer_ptr) };
>> +
>> +        // SAFETY: This `Arc` comes from a call to `Arc::into_raw()`
>> +        let receiver = unsafe { Arc::from_raw(data_ptr) };
>> +
>> +        T::run(receiver);
>> +
>> +        bindings::hrtimer_restart_HRTIMER_NORESTART
>
> One of the common use cases of hrtimers is to create periodic schedules
> where the timer callback advances the expiry value and returns
> HRTIMER_RESTART. It might be not required for your initial use case at
> hand, but you'll need that in the long run IMO.

If you are OK with taking that feature without a user, I will gladly add
it.

Best regards,
Andreas
