Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A791158D6A;
	Wed, 18 Dec 2024 09:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734515633; cv=none; b=Rh1xafohtjNynRlzM7woLPBkv1q5J6xCY2qQP+dHySrmNdD7510J+j/i0Sw4q6/XD8ljKTIHPYPi8lDM2PBDjL+y0+ZuVnexIy7pyGED+9f6MR4vpTTtdsdhYIN9QvbmFLKgYyCaidS/QKvKQPi5kPWL91SuQHl3pIP+t7S2MBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734515633; c=relaxed/simple;
	bh=+imrxZzvKlq+pLv4xQB9uQt2VAuOS7MrEOx9pLa1nA0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bpYbjmXnu84eWMF4zxDhkaefv/6tzotzK+mPcPdE+1vokWCg1/RLIA2wAxKfzTlZoSGplbefX6bil5hGmvuVfQsN9hiru8rxYgwr1WYIRxJZiFavghnoEKda/7gHk1IK1hzYVcSgh5DYCWKzvdMsMofQqEu+xopsAjURT5TYvCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zmd79QFD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zmd79QFD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25852C4CECE;
	Wed, 18 Dec 2024 09:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734515633;
	bh=+imrxZzvKlq+pLv4xQB9uQt2VAuOS7MrEOx9pLa1nA0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Zmd79QFDsY+aBQdTTlvqGUSijOxECX8w/k7yaW4THBPKexUSknA9QUK13wcqk20yF
	 SqNcF+8iAd6Nu+W5YxkVm8dXgOTfqESFD5dcZ+RflicHUKeIzXpJzxEnojv6ppZUoh
	 7yCreI1RHsAHOJ0VETtzi70bfr4APkk8btio0IJ6kthYp0TkrjvRpewMlh3aN7tAZA
	 JxVFb4T27fPNld+CWhd+mC5JFUIj9bXD4hguUK0W9EicSq4MbtfOuweAklsD5sws6/
	 18gtmfPY/ScZqWAixOv06N29sIVgYzpno9CH3U19pqa1fGXfbwNsgdhWTrBomCbmLx
	 dqg2tuJbgG6aw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Frederic Weisbecker" <frederic@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Anna-Maria Behnsen"
 <anna-maria@linutronix.de>,  "Thomas Gleixner" <tglx@linutronix.de>,
  "Danilo Krummrich" <dakr@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  "Lyude Paul" <lyude@redhat.com>,
  "Guangbo Cui" <2407018371@qq.com>,  "Dirk Behme" <dirk.behme@gmail.com>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 02/14] rust: hrtimer: introduce hrtimer support
In-Reply-To: <Z2GfRgwIA0-zQmXc@localhost.localdomain> (Frederic Weisbecker's
	message of "Tue, 17 Dec 2024 16:56:54 +0100")
References: <20241217-hrtimer-v3-v6-12-rc2-v5-0-b34c20ac2cb7@kernel.org>
	<20241217-hrtimer-v3-v6-12-rc2-v5-2-b34c20ac2cb7@kernel.org>
	<DLNygThTqxgUm54VoQR4z_EFPeuZF-BtOOQRUtiTTDj7PVQA3TVDKaVEvuZKOivfe2bZu33sux4l3pWVDBtGew==@protonmail.internalid>
	<Z2GfRgwIA0-zQmXc@localhost.localdomain>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 18 Dec 2024 10:53:21 +0100
Message-ID: <8734ilmi5q.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Frederic Weisbecker" <frederic@kernel.org> writes:

> Le Tue, Dec 17, 2024 at 04:17:33PM +0100, Andreas Hindborg a =C3=A9crit :
>> This patch adds support for intrusive use of the hrtimer system. For now,
>> only one timer can be embedded in a Rust struct.
>>
>> The hrtimer Rust API is based on the intrusive style pattern introduced =
by
>> the Rust workqueue API.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/time.rs         |   2 +
>>  rust/kernel/time/hrtimer.rs | 296 +++++++++++++++++++++++++++++++++++++=
+++++++
>>  2 files changed, 298 insertions(+)
>>
>> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
>> index f59e0fea79d3acfddd922f601f569353609aeec1..51c3532eee0184495ed5b7d7=
17860c9980ff2a43 100644
>> --- a/rust/kernel/time.rs
>> +++ b/rust/kernel/time.rs
>> @@ -10,6 +10,8 @@
>>
>>  use core::convert::Into;
>>
>> +pub mod hrtimer;
>> +
>>  /// The number of nanoseconds per millisecond.
>>  pub const NSEC_PER_MSEC: i64 =3D bindings::NSEC_PER_MSEC as i64;
>>
>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..b09bdb8bc2037bf116a9a87b=
16271f4045f53aa9
>> --- /dev/null
>> +++ b/rust/kernel/time/hrtimer.rs
>> @@ -0,0 +1,296 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Intrusive high resolution timers.
>> +//!
>> +//! Allows running timer callbacks without doing allocations at the tim=
e of
>> +//! starting the timer. For now, only one timer per type is allowed.
>> +//!
>> +//! # Vocabulary
>> +//!
>> +//! A timer is initialized in the **stopped** state. A stopped timer ca=
n be
>> +//! **started** with an **expiry** time. After the timer is started, it=
 is
>> +//! **running**. When the timer **expires**, the timer handler is execu=
ted.
>> +//! After the handler has executed, the timer may be **restarted** or
>> +//! **stopped**. A running timer can be **cancelled** before it's handl=
er is
>> +//! executed. A timer that is cancelled enters the **stopped** state.
>> +//!
>> +//! States:
>> +//!
>> +//! * Stopped
>> +//! * Running
>> +//!
>> +//! Operations:
>> +//!
>> +//! * Start
>> +//! * Cancel
>> +//! * Stop
>> +//! * Restart
>> +//!
>> +//! Events:
>> +//!
>> +//! * Expire
>> +
>> +use crate::{init::PinInit, prelude::*, time::Ktime, types::Opaque};
>> +use core::marker::PhantomData;
>> +
>> +/// A timer backed by a C `struct hrtimer`.
>> +///
>> +/// # Invariants
>> +///
>> +/// * `self.timer` is initialized by `bindings::hrtimer_setup`.
>> +#[pin_data]
>> +#[repr(C)]
>> +pub struct Timer<U> {
>
> I seem to remember we had a debate on that. Why not call that Hrtimer?
> Timer is a bit too generic for a name. I suspect you'll need to introduce
> jiffies based timer bindings in the future as well and then some confusion
> may arise.

Yes, let's rename it. Good call.

>
>> +    #[pin]
>> +    timer: Opaque<bindings::hrtimer>,
>> +    _t: PhantomData<U>,
>> +}
>> +
>> +// SAFETY: A `Timer` can be moved to other threads and used/dropped fro=
m there.
>> +unsafe impl<U> Send for Timer<U> {}
>> +
>> +// SAFETY: Timer operations are locked on C side, so it is safe to oper=
ate on a
>> +// timer from multiple threads
>> +unsafe impl<U> Sync for Timer<U> {}
>> +
>> +impl<T> Timer<T> {
>> +    /// Return an initializer for a new timer instance.
>> +    pub fn new() -> impl PinInit<Self>
>> +    where
>> +        T: TimerCallback,
>> +    {
>> +        pin_init!(Self {
>> +            // INVARIANTS: We initialize `timer` with `hrtimer_setup` b=
elow.
>> +            timer <- Opaque::ffi_init(move |place: *mut bindings::hrtim=
er| {
>> +                // SAFETY: By design of `pin_init!`, `place` is a point=
er live
>> +                // allocation. hrtimer_setup will initialize `place` an=
d does
>> +                // not require `place` to be initialized prior to the c=
all.
>> +                unsafe {
>> +                    bindings::hrtimer_setup(
>> +                        place,
>> +                        Some(T::CallbackTarget::run),
>> +                        bindings::CLOCK_MONOTONIC as i32,
>> +                        bindings::hrtimer_mode_HRTIMER_MODE_REL,
>
> Always relative?

`TimerMode` is introduced in patch 12.

>
>> +                    );
>> +                }
>> +            }),
>> +            _t: PhantomData,
>> +        })
>> +    }
>> +
>> +    /// Get a pointer to the contained `bindings::hrtimer`.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// `ptr` must point to a live allocation of at least the size of `=
Self`.
>> +    unsafe fn raw_get(ptr: *const Self) -> *mut bindings::hrtimer {
>> +        // SAFETY: The field projection to `timer` does not go out of b=
ounds,
>> +        // because the caller of this function promises that `ptr` poin=
ts to an
>> +        // allocation of at least the size of `Self`.
>> +        unsafe { Opaque::raw_get(core::ptr::addr_of!((*ptr).timer)) }
>> +    }
>> +
>> +    /// Cancel an initialized and potentially running timer.
>> +    ///
>> +    /// If the timer handler is running, this will block until the hand=
ler is
>> +    /// finished.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// `self_ptr` must point to a valid `Self`.
>> +    #[allow(dead_code)]
>> +    pub(crate) unsafe fn raw_cancel(self_ptr: *const Self) -> bool {
>> +        // SAFETY: timer_ptr points to an allocation of at least `Timer=
` size.
>> +        let c_timer_ptr =3D unsafe { Timer::raw_get(self_ptr) };
>> +
>> +        // If handler is running, this will wait for handler to finish =
before
>> +        // returning.
>> +        // SAFETY: `c_timer_ptr` is initialized and valid. Synchronizat=
ion is
>> +        // handled on C side.
>> +        unsafe { bindings::hrtimer_cancel(c_timer_ptr) !=3D 0 }
>> +    }
>> +}
>> +
>> +/// Implemented by pointer types that point to structs that embed a [`T=
imer`].
>> +///
>> +/// Typical implementers would be [`Box<T>`], [`Arc<T>`], [`ARef<T>`] w=
here `T`
>> +/// has a field of type `Timer`.
>> +///
>> +/// Target must be [`Sync`] because timer callbacks happen in another t=
hread of
>> +/// execution (hard or soft interrupt context).
>> +///
>> +/// Starting a timer returns a [`TimerHandle`] that can be used to mani=
pulate
>> +/// the timer. Note that it is OK to call the start function repeatedly=
, and
>> +/// that more than one [`TimerHandle`] associated with a `TimerPointer`=
 may
>> +/// exist. A timer can be manipulated through any of the handles, and a=
 handle
>> +/// may represent a cancelled timer.
>> +///
>> +/// [`Box<T>`]: Box
>> +/// [`Arc<T>`]: crate::sync::Arc
>> +/// [`ARef<T>`]: crate::types::ARef
>> +pub trait TimerPointer: Sync + Sized {
>> +    /// A handle representing a running timer.
>> +    ///
>> +    /// If the timer is running or if the timer callback is executing w=
hen the
>> +    /// handle is dropped, the drop method of `TimerHandle` should not =
return
>> +    /// until the timer is stopped and the callback has completed.
>> +    ///
>> +    /// Note: It must be safe to leak the handle.
>> +    type TimerHandle: TimerHandle;
>> +
>> +    /// Start the timer with expiry after `expires` time units. If the =
timer was
>> +    /// already running, it is restarted with the new expiry time.
>> +    fn start(self, expires: Ktime) -> Self::TimerHandle;
>> +}
>> +
>> +/// Implemented by [`TimerPointer`] implementers to give the C timer ca=
llback a
>> +/// function to call.
>> +// This is split from `TimerPointer` to make it easier to specify trait=
 bounds.
>> +pub trait RawTimerCallback {
>
> RawHrtimerCallback ?

Yes!

>
>> +    /// Callback to be called from C when timer fires.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// Only to be called by C code in `hrtimer` subsystem. `ptr` must =
point to
>> +    /// the `bindings::hrtimer` structure that was used to start the ti=
mer.
>> +    unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::=
hrtimer_restart;
>> +}
>> +
>> +/// Implemented by structs that can the target of a timer callback.
>> +pub trait TimerCallback {
>
> HrtimerCallback ? etc...

Will do a rename pass.


Best regards,
Andreas Hindborg



