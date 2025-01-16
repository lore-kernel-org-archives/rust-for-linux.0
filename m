Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535361547E2;
	Thu, 16 Jan 2025 19:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737054380; cv=none; b=AlkGrgECZ2qRbPPvqenV42dmiCKq3n+0Vr2kioqigLapv9pL4KnddShWajdmNZYIUIBgwtC0NeBDRZrjDP1JXz27lmart1HikUISdAqwOAKhlDlhhxXVYNwAA4SLOIxlurcDNXFX2JIZToOvpgfY3kaXvWwTsorLZMmUx56OsDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737054380; c=relaxed/simple;
	bh=R2pCj0e+4jRatD1NU57sqvKzAYS4HmQU1QSDTa8Fwvo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aHAOgE1hVPsj4SK+W6oOXUZqrCAroq6dXBTcJb4AaSdDUoKtOdCzpGLoENBuGDYdd5OVcWHUCtJ6/8W4owvKLL0R2vN7kEZytVX2/TwWSI0sKXonM2E9zUxUGrguWBf8hAmpQZNJix2I8Q8QmxOAlJpF6PYA0OtkzVaDlqCDJQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGJsETlL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGJsETlL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891FDC4CEDF;
	Thu, 16 Jan 2025 19:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737054379;
	bh=R2pCj0e+4jRatD1NU57sqvKzAYS4HmQU1QSDTa8Fwvo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UGJsETlLwHdwyJzW6Q1udL9aiZs0LA/gGkHVtsp2lvMKbuTvQWvisjbX0JQtYHCna
	 u+v9pNZadftewgAKR7TdP+Gbh3R8GSnB95pY55kV+m8NvO0cm6HHMXnD5asPMyDGnj
	 3Nqx+RV6vsYUNVSktJW1Cre3iaqrw6guD+HTu1D0Yl2knFkF6nt9Fyiz29hcYGKDuB
	 osM8MfoYfoG0Q2XfTaZ0Xp9kiLZuMY3Zd41b5+EQsr2TqT+hz0U+3XK2at1LiaYyEu
	 OPD9LbTTQ4y4diOPqzRwV2eplNyKMWw1wheo7xQDCjuCWecKUEgcFGCRsbr5Q5oVj3
	 7HHhNop4XtFjg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Anna-Maria Behnsen"
 <anna-maria@linutronix.de>,  "Frederic Weisbecker" <frederic@kernel.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,  "Danilo Krummrich"
 <dakr@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Lyude Paul" <lyude@redhat.com>,  "Guangbo Cui" <2407018371@qq.com>,
  "Dirk Behme" <dirk.behme@gmail.com>,  "Daniel Almeida"
 <daniel.almeida@collabora.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 02/14] rust: hrtimer: introduce hrtimer support
In-Reply-To: <CAJ-ks9m9B1ibFtJNSTo0-e9y01-7+Rk=d8i2_L6Zq+qOeBvY5g@mail.gmail.com>
 (Tamir
	Duberstein's message of "Tue, 14 Jan 2025 12:23:42 -0500")
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
	<20250110-hrtimer-v3-v6-12-rc2-v6-2-f71d50f16482@kernel.org>
	<0DHwVcXV7YQr2_Xu8VEFljnhO7nfFVzGiV7jNm7CMv47TGte0u04V3Xqu3nJuPfGaJ0D06qqFGPY6CZvg5MH_w==@protonmail.internalid>
	<CAJ-ks9m9B1ibFtJNSTo0-e9y01-7+Rk=d8i2_L6Zq+qOeBvY5g@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 16 Jan 2025 20:06:00 +0100
Message-ID: <878qrad1ev.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi Tamir,

Thanks for the comments!

"Tamir Duberstein" <tamird@gmail.com> writes:

> On Fri, Jan 10, 2025 at 3:18=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:

[cut]

>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..31c461ddd2c377101ed6c1c7=
e009f7dccf458ebc
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
>
> s/it's/its/
>
> I find this pretty hard to read because it contains a mix of
> descriptions of states and descriptions of state transitions. Can we
> state all the states first, and then all the transitions? Diagrams are
> always helpful.

You mean start the section with the state list from below?

>
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
>> +pub struct HrTimer<U> {
>> +    #[pin]
>> +    timer: Opaque<bindings::hrtimer>,
>> +    _t: PhantomData<U>,
>> +}
>> +
>> +// SAFETY: A `HrTimer` can be moved to other threads and used/dropped f=
rom there.
>
> Is that because it's on the heap on the C side, and the Rust type is
> roughly a pointer to it?

No it's unrelated to stack/heap allocation. It's just that the data
structure, and the methods on it, are constructed in such a way that there
is nothing that makes it unsafe to transfer ownership to another thread.
The `Opaque` field is removing this marker so we are just adding it
back.

`HrTimer` is not a pointer to a timer, it _is_ (contains) a
`bindings::hrtimer` struct.

>
>> +unsafe impl<U> Send for HrTimer<U> {}
>> +
>> +// SAFETY: Timer operations are locked on C side, so it is safe to oper=
ate on a
>> +// timer from multiple threads
>> +unsafe impl<U> Sync for HrTimer<U> {}
>> +
>> +impl<T> HrTimer<T> {
>> +    /// Return an initializer for a new timer instance.
>
> What's an initializer?

A function that initialize a data structure. See
https://rust.docs.kernel.org/kernel/init/trait.PinInit.html . It is a
concept widely used in kernel rust. Perhaps I should add a link to the
return type in the text [initializer]: `kernel::init::PinInit`?

>
>> +    pub fn new() -> impl PinInit<Self>
>> +    where
>> +        T: HrTimerCallback,
>> +    {
>> +        pin_init!(Self {
>> +            // INVARIANTS: We initialize `timer` with `hrtimer_setup` b=
elow.
>> +            timer <- Opaque::ffi_init(move |place: *mut bindings::hrtim=
er| {
>> +                // SAFETY: By design of `pin_init!`, `place` is a point=
er live
>
> pointer *to a* live allocation?

=F0=9F=91=8D

>
>> +                // allocation. hrtimer_setup will initialize `place` an=
d does
>> +                // not require `place` to be initialized prior to the c=
all.
>> +                unsafe {
>> +                    bindings::hrtimer_setup(
>> +                        place,
>> +                        Some(T::CallbackTarget::run),
>> +                        bindings::CLOCK_MONOTONIC as i32,
>
> Is it possible to avoid this as cast?

I don't think so, because bindgen generates CLOCK_MONOTONIC as u32. We
could `try_into`, but i don't think that makes sense.

>
>> +                        bindings::hrtimer_mode_HRTIMER_MODE_REL,
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
>
> This function is private, this doc comment won't ever be rendered by rust=
doc.

But that is OK, right? I think there is an option for rustdoc to render pri=
vate
functions as well.

>
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
>
> Why does this need to be raw? This can be explained in the commit
> message or the cover letter IMO.

I named it `raw_` to indicate that this is not what a user of the API
would call. They would call some safe code that wraps this method in a
way that is always safe. Some people use double underscore prefix to
same effect. I wanted to convey the message "this is not the cancel you
are looking for (jedi hand wave)".

>
>> +    pub(crate) unsafe fn raw_cancel(self_ptr: *const Self) -> bool {
>> +        // SAFETY: timer_ptr points to an allocation of at least `HrTim=
er` size.
>> +        let c_timer_ptr =3D unsafe { HrTimer::raw_get(self_ptr) };
>> +
>> +        // If handler is running, this will wait for handler to finish =
before
>> +        // returning.
>
> Missing article in both halves; s/handler/the handler/.

=F0=9F=91=8D

>
>> +        // SAFETY: `c_timer_ptr` is initialized and valid. Synchronizat=
ion is
>> +        // handled on C side.
>> +        unsafe { bindings::hrtimer_cancel(c_timer_ptr) !=3D 0 }
>> +    }
>> +}
>> +
>> +/// Implemented by pointer types that point to structs that embed a [`H=
rTimer`].
>> +///
>> +/// Typical implementers would be [`Box<T>`], [`Arc<T>`], [`ARef<T>`] w=
here `T`
>> +/// has a field of type [`HrTimer`].
>
> nit: this paragraph is over specifying things.

I can remove the paragraph.

>
>> +///
>> +/// Target must be [`Sync`] because timer callbacks happen in another t=
hread of
>> +/// execution (hard or soft interrupt context).
>
> What is "Target"?

That would be the pointee of the pointer<T: HasHrTimer>. Should I
replace "Target" with "The pointee"?

>
>> +///
>> +/// Starting a timer returns a [`HrTimerHandle`] that can be used to ma=
nipulate
>> +/// the timer. Note that it is OK to call the start function repeatedly=
, and
>> +/// that more than one [`HrTimerHandle`] associated with a [`HrTimerPoi=
nter`] may
>> +/// exist. A timer can be manipulated through any of the handles, and a=
 handle
>> +/// may represent a cancelled timer.
>
> "Cancel" is a transition, not a state, so I think this should say "a
> stopped timer".

The vocabulary says:

> A running timer can be **cancelled** before it's handler is executed. A
> timer that is canceled enters the **stopped** state.

So I guess it should be fine as is? Alternatively it should be
"... represent a timer in the stopped state". Either is fine for me. Which
one do you like better?

>
>> +///
>> +/// [`Box<T>`]: Box
>> +/// [`Arc<T>`]: crate::sync::Arc
>> +/// [`ARef<T>`]: crate::types::ARef
>> +pub trait HrTimerPointer: Sync + Sized {
>> +    /// A handle representing a running timer.
>
> The comment just above says that a handle can represent a stopped
> timer. Which is it?

It will be a handle that completed the start or restart operation. When
the handle is initially returned, the timer will probably be running.
But it could be canceled or it could expire at any point and then the
handle no longer represents a running timer. So how about:

"A handle representing a started or restarted timer."

>
>> +    ///
>> +    /// If the timer is running or if the timer callback is executing w=
hen the
>> +    /// handle is dropped, the drop method of [`HrTimerHandle`] should =
not return
>> +    /// until the timer is stopped and the callback has completed.
>> +    ///
>> +    /// Note: It must be safe to leak the handle.
>
> What does "safe" mean exactly?

It means that the implementer of `HrTimerPointer` should consider that
leaking the handle does not require unsafe code and that it can be done
in safe rust. It might be better put as this:

    /// Note: When implementing this trait, consider that it is not unsafe =
to
    /// leak the handle.

> Also, this comment seems to be
> describing the trait `HrTimerHandle` rather than the associated type
> `TimerHandle`.

The note is for implementers of `HrTimerPointer`. They have to select a
type for `TimerHandle`.

>
>> +    type TimerHandle: HrTimerHandle;
>> +
>> +    /// Start the timer with expiry after `expires` time units. If the =
timer was
>> +    /// already running, it is restarted with the new expiry time.
>> +    fn start(self, expires: Ktime) -> Self::TimerHandle;
>> +}
>> +
>> +/// Implemented by [`HrTimerPointer`] implementers to give the C timer =
callback a
>> +/// function to call.
>> +// This is split from `HrTimerPointer` to make it easier to specify tra=
it bounds.
>> +pub trait RawHrTimerCallback {
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
>
> Missing verb: s/can the/can be the/

=F0=9F=91=8D

>
>> +pub trait HrTimerCallback {
>> +    /// The type that was used for starting the timer.
>
> This comment isn't very helpful, is it? I think it should say "The
> type whose `run` method will be invoked when the timer expires.".

Yes, that is better.

>
>> +    type CallbackTarget<'a>: RawHrTimerCallback;
>> +
>> +    /// This type is passed to the timer callback function. It may be a=
 borrow
>> +    /// of [`Self::CallbackTarget`], or it may be `Self::CallbackTarget=
` if the
>> +    /// implementation can guarantee exclusive access to the target dur=
ing timer
>> +    /// handler execution.
>> +    type CallbackTargetParameter<'a>;
>> +
>> +    /// Called by the timer logic when the timer fires.
>> +    fn run(this: Self::CallbackTargetParameter<'_>)
>> +    where
>> +        Self: Sized;
>> +}
>> +
>> +/// A handle representing a potentially running timer.
>> +///
>> +/// More than one handle representing the same timer might exist.
>> +///
>> +/// # Safety
>> +///
>> +/// When dropped, the timer represented by this handle must be cancelle=
d, if it
>> +/// is running. If the timer handler is running when the handle is drop=
ped, the
>> +/// drop method must wait for the handler to finish before returning.
>
> See my note above anchored on `type TimerHandle: HrTimerHandle`; it
> repeats this comment.

Oh, I see your point regarding the paragraph above the note. Hmm, do you
think I should remove it from the associated type of
`HrTimerPointer::TimerHandle`? Is it a problem to refer to the safety
requirement from the associated type docs?

[cut]

>> +/// Use to implement the [`HasHrTimer<T>`] trait.
>> +///
>> +/// See [`module`] documentation for an example.
>> +///
>> +/// [`module`]: crate::time::hrtimer
>> +#[macro_export]
>> +macro_rules! impl_has_hr_timer {
>> +    (
>> +        impl$({$($generics:tt)*})?
>> +            HasHrTimer<$timer_type:ty>
>> +            for $self:ty
>> +        { self.$field:ident }
>> +        $($rest:tt)*
>> +    ) =3D> {
>> +        // SAFETY: This implementation of `raw_get_timer` only compiles=
 if the
>> +        // field has the right type.
>> +        unsafe impl$(<$($generics)*>)? $crate::time::hrtimer::HasHrTime=
r<$timer_type> for $self {
>> +            const OFFSET: usize =3D ::core::mem::offset_of!(Self, $fiel=
d) as usize;
>> +
>> +            #[inline]
>> +            unsafe fn raw_get_timer(ptr: *const Self) ->
>> +                *const $crate::time::hrtimer::HrTimer<$timer_type>
>> +            {
>> +                // SAFETY: The caller promises that the pointer is not =
dangling.
>> +                unsafe {
>> +                    ::core::ptr::addr_of!((*ptr).$field)
>> +                }
>> +            }
>> +        }
>> +    }
>> +}
>
> It'd be helpful to understand these design choices; why is so much of
> this written in terms of raw pointers?

A lot of this design is dictated by the underlying C API. We have a C
structure that is embedded into a rust structure (the timer structure).
This C structure is used to place the Rust structure into trees and
linked lists on the C side. To start (arm) a timer we have to pass a raw
pointer to this embedded C structure to the C API. When the timer fires,
the C API notifies us by calling a repr(C) function with a pointer to
the embedded C struct. So we have to do some offset calculations to get
back to the rust struct that embeds the timer struct. That is not
possible without raw pointers.

The design borrows most of its ideas from the worktree abstractions,
which have almost the same challenges.


Best regards,
Andreas Hindborg


