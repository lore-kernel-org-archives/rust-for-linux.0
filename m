Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0CB17109E
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714480441; cv=none; b=P9G5bkHrRwjgFZ/yqddBAX3LWOSKK0l6sdM3VGuf1HzuZ4rjTYgTDjnMj/9hwvSMfuWKd6/QMyo82zojBgMLCBwbjNbkb+GKthSfW3Aa1pr5HwZm3TtOoXmFfLryGS18xqyDZ2XuEZS73m4PDV4VJl4JPwQS/aYGYx6Nvey48Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714480441; c=relaxed/simple;
	bh=xwcL0Ml9mJ5uptb3sd/pMQvy35nQD+xQZJwauXAa6RM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pmd5V9i2camSHHsAU7BiLkmjTdH37G+nQK5tYvlzrfyyZwtdXN5YTZ9muj7u7F+leEuB7JuAHOaeS8tPLFRAZuTskSNQXENTdAswuBYNiF+eNSRTALevuib19ari34Cpbi9m5zg/XBRV4PbbOUlBg9DBKiK4vmcwGjAxqNJ7rGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=dV3je0Da; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="dV3je0Da"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56e69888a36so5918292a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 05:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1714480436; x=1715085236; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OIpDrd3C8t83O7GUW+qfsPc1eJYABE3LjCMwbC92HRw=;
        b=dV3je0DaPTivYQLKoUj5GIQPOD7kqI4rOl/bFejCl73IE7um7nwD/xx9ncIFWSP7Ye
         uvR0sPsUo7RPgGzKimEPqi6o6ZURCVIvtm5/WmBgdFkJyRL2d7asxnxaOOO47bmLBtoE
         sa+FtcvH7az0FnQgCqnOoxweBFXSC0SqOkZCBqRFPpDot/utpISwaMHtzo9rNtBW39HQ
         srSBVtk9JdD8ADdImcypAG4Xrdo5/FOEYGGzbhaj/MOSxhp7S9yIeryvf38N5+Q1DdkX
         GNg1eQ1+PawJp+CKwS2JQqdduojty9qzw8PYQ15HlFtAVDXexeFg2J6fsEtz1OY6hjZK
         zfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714480436; x=1715085236;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIpDrd3C8t83O7GUW+qfsPc1eJYABE3LjCMwbC92HRw=;
        b=G4ispEWISa00nvwhYqDMa81NktwoPvaj1DGt5ctSjRDsGX8TpBMooTTepEU4TOSRNj
         4A2wj4eKWfbklFnUDba9uprJnAY1LyWeAGGtr6ChM6TkBiPFddOGLN+2gekUB6gsvTRX
         WbvSbpKZqrjEDYb2qIIuXt5Em4howBLXEzUDF0rfS/K79W6mBspP4cqYdpvXD+984m0t
         U6w2R8tUwXtR/+Ru+nkL73kvNpKIh3R47LDZYKl18iMn0xIV8Ba46o+KAjHRVMuExtRb
         TqJBSgRirATAQDb2dVUNq3qlHsuWsFiV8wcqI7D85ZAbW9LFhsoj9jN9PF257zWsN8IT
         /zHA==
X-Forwarded-Encrypted: i=1; AJvYcCWpiEMiMuchrluc8ONKERTW/Ign4PsSVS9i43WeWytsvcmjtmTxcsP1CFVyHf0wZCcl/GxKhkydZx6CWadCeUAvORtkoRJ17B0qIHeFfIo=
X-Gm-Message-State: AOJu0YwL9ME4DG2Li4hgazc0CcG8+m4RyBiYycO7X6QVJU2snDKRuN6/
	aTiAPV1agCKpALhEcq+iwfw8ZHkFuha5bcVI5LENtxLlk2VdyXP5f5jqpwD5tAk=
X-Google-Smtp-Source: AGHT+IE4VYByIkNz4qJPQaJuO9yZQGrB82spKaQBnv6egBGr5fQOHLku27zYrFOWTWCPkEYclnyqaw==
X-Received: by 2002:a17:906:2409:b0:a55:b2bf:2be8 with SMTP id z9-20020a170906240900b00a55b2bf2be8mr7730732eja.56.1714480435808;
        Tue, 30 Apr 2024 05:33:55 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id hg7-20020a170906f34700b00a4e5a6b57a2sm14970317ejb.163.2024.04.30.05.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 05:33:55 -0700 (PDT)
From: Andreas Hindborg <nmi@metaspace.dk>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>,  Miguel Ojeda <ojeda@kernel.org>,
  Alex Gaynor <alex.gaynor@gmail.com>,  Wedson Almeida Filho
 <wedsonaf@gmail.com>,  Anna-Maria Behnsen <anna-maria@linutronix.de>,
  Frederic Weisbecker <frederic@kernel.org>,  Thomas Gleixner
 <tglx@linutronix.de>,  Andreas Hindborg <a.hindborg@samsung.com>,  Gary
 Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  Alice Ryhl <aliceryhl@google.com>,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: hrtimer: introduce hrtimer support
In-Reply-To: <Zi_Zb1lBOBBUFJFV@boqun-archlinux> (Boqun Feng's message of "Mon,
	29 Apr 2024 10:31:27 -0700")
References: <20240425094634.262674-1-nmi@metaspace.dk>
	<a7a560c7-fb8c-4adf-9f46-2e272f24b335@proton.me>
	<87v844lbhm.fsf@metaspace.dk> <Zi_Zb1lBOBBUFJFV@boqun-archlinux>
User-Agent: mu4e 1.12.4; emacs 29.3
Date: Tue, 30 Apr 2024 14:33:50 +0200
Message-ID: <87plu7jahd.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Boqun Feng <boqun.feng@gmail.com> writes:

> On Fri, Apr 26, 2024 at 11:27:49AM +0200, Andreas Hindborg wrote:
>> Benno Lossin <benno.lossin@proton.me> writes:
>> 
>> > On 25.04.24 11:46, Andreas Hindborg wrote:
>> >> From: Andreas Hindborg <a.hindborg@samsung.com>
>> >> 
>> >> This patch adds support for intrusive use of the hrtimer system. For now, only
>> >> one timer can be embedded in a Rust struct.
>> >> 
>> >> The hrtimer Rust API is based on the intrusive style pattern introduced by the
>> >> Rust workqueue API.
>> >> 
>> >> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
>> >> 
>> >> ---
>> >> 
>> >> This patch is a dependency for the Rust null block driver [1].
>> >> 
>> >> Link: https://lore.kernel.org/rust-for-linux/20240313110515.70088-1-nmi@metaspace.dk/T/#me0990150b9ba9f5b3d00293ec9a473c7bc3cc506 [1]
>> >> 
>> >>  rust/kernel/hrtimer.rs | 283 +++++++++++++++++++++++++++++++++++++++++
>> >>  rust/kernel/lib.rs     |   1 +
>> >>  2 files changed, 284 insertions(+)
>> >>  create mode 100644 rust/kernel/hrtimer.rs
>> >> 
>> >> diff --git a/rust/kernel/hrtimer.rs b/rust/kernel/hrtimer.rs
>> >
>> > Hmm is this the right place? I imagine there are other timers, does this
>> > fit better into the `time` module (ie make `hrtimer` a submodule of
>> > `time`) or should we later introduce a `timer` parent module?
>> 
>> We can always move it. We will move stuff anyway when the kernel crate
>> is split.
>> 
>> We can also take it to `kernel::time::hrtimer` now, either way is fine.
>> 
>
> I think `kernel::time::hrtimer` makes more sense, since ideally
> schedule() function should take a time delta type as the input instead
> of `u64`. So hrtimer has some logical connection to timekeeping module.

Yes, there is a bit of race condition with the ktime series. I guess I
will update this when the ktime patch is in. I am not sure if that was
picked yet or what tree it is going to go through.

>
>> >
>> >> new file mode 100644
>> >> index 000000000000..1e282608e70c
>> >> --- /dev/null
>> >> +++ b/rust/kernel/hrtimer.rs
>> >> @@ -0,0 +1,283 @@
>> >> +// SPDX-License-Identifier: GPL-2.0
>> >> +
>> >> +//! Intrusive high resolution timers.
>> >> +//!
>> >> +//! Allows scheduling timer callbacks without doing allocations at the time of
>> >> +//! scheduling. For now, only one timer per type is allowed.
>> >> +//!
>> >> +//! # Example
>> >> +//!
>> >> +//! ```rust
>> >> +//! use kernel::{
>> >> +//!     sync::Arc, hrtimer::{RawTimer, Timer, TimerCallback},
>> >> +//!     impl_has_timer, prelude::*, stack_pin_init
>> >> +//! };
>> >> +//! use core::sync::atomic::AtomicBool;
>> >> +//! use core::sync::atomic::Ordering;
>> >> +//!
>> >> +//! #[pin_data]
>> >> +//! struct IntrusiveTimer {
>> >> +//!     #[pin]
>> >> +//!     timer: Timer<Self>,
>> >> +//!     flag: AtomicBool,
>
> Could you see if you can replace this with a `SpinLock<bool>` +
> `CondVar`? We shouldn't use Rust atomic in kernel now. I know it's
> unfortunate that LKMM atomics are still work in process, but in real
> world, you won't do busy waiting for a timer to fire, so a
> `CondVar::wait` is better for example purpose.

Since this is only using the atomic from Rust code, it should be fine
right? There is no mixing of memory models on this memory location.

>
>> >> +//! }
>> >> +//!
>> >> +//! impl IntrusiveTimer {
>> >> +//!     fn new() -> impl PinInit<Self> {
>> >> +//!         pin_init!(Self {
>> >> +//!             timer <- Timer::new(),
>> >> +//!             flag: AtomicBool::new(false),
>> >> +//!         })
>> >> +//!     }
>> >> +//! }
>> >> +//!
>> >> +//! impl TimerCallback for IntrusiveTimer {
>> >> +//!     type Receiver = Arc<IntrusiveTimer>;
>> >> +//!
>> >> +//!     fn run(this: Self::Receiver) {
>> >> +//!         pr_info!("Timer called\n");
>> >> +//!         this.flag.store(true, Ordering::Relaxed);
>> >> +//!     }
>> >> +//! }
>> >> +//!
>> >> +//! impl_has_timer! {
>> >> +//!     impl HasTimer<Self> for IntrusiveTimer { self.timer }
>> >> +//! }
>> >> +//!
>> >> +//! let has_timer = Arc::pin_init(IntrusiveTimer::new())?;
>> >
>> > I would not name this variable `has_timer`. Maybe `my_timer` is better?
>> 
>> Right, thanks.
>> 
>> >
>> >> +//! has_timer.clone().schedule(200_000_000);
>> >> +//! while !has_timer.flag.load(Ordering::Relaxed) { core::hint::spin_loop() }
>> >
>> > Weird formatting, we should also use `rustfmt` in examples.
>> 
>> `format_code_in_doc_comments` is a nightly `rustfmt` feature. I tried
>> enabling it in `.rustfmt.toml` and running `rustfmt +nightly
>> hrtimer.rs`. It did not have any effect. There is some discussion here:
>> https://github.com/rust-lang/rustfmt/issues/3348
>> 
>> >
> [...]
>> >> +#[pinned_drop]
>> >> +impl<T> PinnedDrop for Timer<T> {
>> >> +    fn drop(self: Pin<&mut Self>) {
>> >> +        // SAFETY: By struct invariant `self.timer` was initialized by
>> >> +        // `hrtimer_init` so by C API contract it is safe to call
>> >> +        // `hrtimer_cancel`.
>> >> +        unsafe {
>> >> +            bindings::hrtimer_cancel(self.timer.get());
>> >> +        }
>> >> +    }
>> >> +}
>> >
>> > Why is this needed? The only way to schedule a timer using this API is
>> > by having an `Arc` with a timer-containing struct inside. But to
>> > schedule the `Arc`, you consume one refcount which is then sent to the
>> > timer subsystem. So it is impossible for the refcount to drop below zero
>> > while the timer is scheduled, but not yet running.
>> > Do you need to call `hrtimer_cancel` after/while a timer is running?
>> 
>> This is not required any longer. It is a leftover from an earlier
>> revision where timers could be stack allocated. I will remove it.
>> 
>
> So the plan is to add Arc<HasTimer> support first and stack allocated
> timer later? If so, please do add a paragraph in the module level doc
> describing the limition (e.g. stack allocated timers are not supported).

I do not currently have any plans to add support for stack allocated
timers. I can give it another try if someone needs it. I ran into
problems with drop order when I tried it.

I will update the docs to mention this only supports heap allocated timers.

>
>> > Also is it ok to call `hrtimer_cancel` inside the timer callback? Since
>> > that can happen when the timer callback owns the last refcount.
>> 
>> That should be fine, `self` is still valid when the drop method is run?
>> 
>> >
>> >> +
>> >> +/// Implemented by pointer types to structs that embed a [`Timer`]. This trait
>> >> +/// facilitates queueing the timer through the pointer that implements the
>> >> +/// trait.
>> >> +///
>> >> +/// Typical implementers would be [`Box<T>`], [`Arc<T>`], [`ARef<T>`] where `T`
>> >> +/// has a field of type `Timer`.
>> >> +///
>> >> +/// Target must be [`Sync`] because timer callbacks happen in another thread of
>> >> +/// execution.
>> >> +///
>> >> +/// [`Box<T>`]: Box
>> >> +/// [`Arc<T>`]: Arc
>> >> +/// [`ARef<T>`]: crate::types::ARef
>> >> +pub trait RawTimer: Sync {
>> >> +    /// Schedule the timer after `expires` time units
>> >> +    fn schedule(self, expires: u64);
>
> This function should have a return value, see below:
>
>> >> +}
> [...]
>> >> +impl<T> RawTimer for Arc<T>
>> >> +where
>> >> +    T: Send + Sync,
>> >> +    T: HasTimer<T>,
>> >> +{
>> >> +    fn schedule(self, expires: u64) {
>> >> +        let self_ptr = Arc::into_raw(self);
>> >> +
>
> so if the timer is already scheduled, re-scheduling will leak it, e.g.
>
> 	let timer: Arc<SomeTimer> = ...;
>
> 	let reschedule_handle = timer.clone(); // refcount == 2
> 	timer.schedule(...);
>
> 	...
>
> 	// later on, a reschedule is needed
> 	reschedule_handle.schedule(...); // refcount == 2
>
> 	// <timer callback invoked>
> 	Arc::drop();
> 	// refcount == 1, the Arc is leaked.
>
> Looks to me `schedule()` should return the `Arc` back if it's already
> in the queue.

Nice catch. We can use `bindings::hrtimer_cancel` to drop the `Arc` used
to enqueue if the timer was already enqueued. I think that should be OK
as far as usability of the API goes?

> TBH, if you don't need the re-schedule and cancel functionality, maybe
> start with `impl<T> RawTimer for Pin<Box<T>>` first.

I do not need to reschedule, but I need to support reference counted
types, and cancel would be nice to have eventually.

Best regards,
Andreas
