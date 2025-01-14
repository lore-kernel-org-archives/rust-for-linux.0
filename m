Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DA51D5CD1;
	Tue, 14 Jan 2025 17:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736875464; cv=none; b=CauoqNQtbyR95Xd+O3ZJGyRkiB/NrwR9aTP0at0Nqz7JghjWOGxIH4GHn5AwE3u1rsGQWGfqTWC0LnVWdX1kTsdkZh9lZ5GgDFt+tS87ZrzaOOAY+RvRQwsr10gAdM0ep8Vwe/XJ0H9SJXjinLCjayHHoBEiXVWJyZ50TaK8TrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736875464; c=relaxed/simple;
	bh=SH7pTinFA9SBryLYgjnO8PsSlZ/EkD1C+0kBde2rwSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aJHbxWDyndmOqjMYBRRjjRmtuTEb9CCEYHLGHr9pV0YWbnwXeRFsdYAGZG/pJ8P3tx9VQFK4qNtNol9wfGJLar1fdV6fJR107cz1tQ+yQOs8t7i4asZwJz0VBTgDUyx1FeM6v1E9IF5GICKIW0Rt0VAq+0g/mrPsi7K0+lj096o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5L9MTVk; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5L9MTVk"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-303489e8775so51536181fa.3;
        Tue, 14 Jan 2025 09:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736875460; x=1737480260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prhGbdJSrqACd9C17CIcC0NR8SvWUxa0txC13rrEzhM=;
        b=h5L9MTVkMPoHD+gVsuwE7/EmrMRns3aFW7IaA+YtLr0/nE+Qqv7RPM5FCm51EjDSxT
         +HTqsDFpGo9qaQzFsRUQ4qSA5bnfcDizTU1aTQv+ZdACDZZCeXbxUGtW9lXeaZ7rUvuT
         /vkjB4qOPBrIXPlWGOCKFDcAPxzYUz9hLlqdkc7ZBMRKqJ9Hv8UIWsCC8H2+WB1Aoyf8
         jZfoLqzITaizGNxNX/kTCv3THaXsGcAr1uTB9+nFCbraYrjoNZOOnOD1ffw95gFYbHrx
         zTiNuoZyDaW9BTmBG6PhLdLgG7cwg37TfuCvwBhDNdT3HqwNCJGMXMeQPjn5mRD9ykUB
         Jjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736875460; x=1737480260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prhGbdJSrqACd9C17CIcC0NR8SvWUxa0txC13rrEzhM=;
        b=saAgXz8ZShmLNYHqXSOPgA0owCTVScsVyqv40Xv5eU50oEOeSIXiLlsziav59tdZSW
         S6Mw27+baReCgFGOTX+619gijCJDEpqLkt9CClCD+igDI+LV6i5QtHLo0Sml5xJt/9Xq
         DAxGn+dWY5cQHHvVH+OqrMcyi+62hYvPw3ucdEgE1UC9yfY2EDRIu1dZeAQlyHY/Zc/g
         O0W8d9Pdf/yw7l90dmXJBRhm2HKeqS5plaWbJDrE2woOu4PZJqRk5r2bILjKBAVyWhfO
         vUHDtxfY+PbYaTf6O4YDnj8+1ZhHQgLcYPvKTWqvUsXaYzns5d+Qb6ZQ8qomCfrVybFj
         0w/A==
X-Forwarded-Encrypted: i=1; AJvYcCW15+gzg/vCqW7JtsJsQUTDADqH75Okb3KmLkekjf2at7B1F9q/Y67d/e7po3bMiZ/Q61xkCP5/M2ARl5s=@vger.kernel.org, AJvYcCXO1N1eM7HGsuUwgb9Z/3xAaIZ8dvFX+vi5n9IlMgMES7ooQJ/sOsvcMVY2LZA8+uiA7k0lZ07DHijsDN+OIsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ8+hy2HsC5QWwXx9i/fhQtnMTMDEUoQyqbLGcNVUMAL774X8B
	SLqvKFJvcVMFgSn4mZ9ByO7Huvei9JnhtXFoFhV92+pkwBCQ9nhOX4AllDVpsDNPxsVaJy6x3Nj
	REnMC8+H9XOLumqUZk/u014ER3DI=
X-Gm-Gg: ASbGncsOSBjNtX0kjihhH/tCyo7U972SZbHOMTMqKSIoTsJ+/wi+mZyqWcD9ClsTOJo
	kUj5mHg6wUpe0NLejGN3H//Q7J89u7KHSE0+t9tQkySaVyz4+g+I9qZi4s0O0TTet66gVxS4=
X-Google-Smtp-Source: AGHT+IHZXTnFhzBwdeexYtn8jwklI6JG4HjVY5z0tCyYA+9EDzcqOeDPAp93kyljiisE6Z44ROH2XZpXmhd+KR/kgUA=
X-Received: by 2002:a05:651c:1a0b:b0:2ff:cc65:68aa with SMTP id
 38308e7fff4ca-305f45ebec5mr69484101fa.31.1736875459004; Tue, 14 Jan 2025
 09:24:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org> <20250110-hrtimer-v3-v6-12-rc2-v6-2-f71d50f16482@kernel.org>
In-Reply-To: <20250110-hrtimer-v3-v6-12-rc2-v6-2-f71d50f16482@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 14 Jan 2025 12:23:42 -0500
X-Gm-Features: AbW1kvbC4P8yaciB9PgfMG6v0q5Yv_gt6Q77mD51BCvTUHxE8ICtAKbHxKlG1X8
Message-ID: <CAJ-ks9m9B1ibFtJNSTo0-e9y01-7+Rk=d8i2_L6Zq+qOeBvY5g@mail.gmail.com>
Subject: Re: [PATCH v6 02/14] rust: hrtimer: introduce hrtimer support
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, Guangbo Cui <2407018371@qq.com>, 
	Dirk Behme <dirk.behme@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 3:18=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> This patch adds support for intrusive use of the hrtimer system. For now,
> only one timer can be embedded in a Rust struct.
>
> The hrtimer Rust API is based on the intrusive style pattern introduced b=
y
> the Rust workqueue API.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/time.rs         |   2 +
>  rust/kernel/time/hrtimer.rs | 296 ++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 298 insertions(+)
>
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index f59e0fea79d3acfddd922f601f569353609aeec1..51c3532eee0184495ed5b7d71=
7860c9980ff2a43 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -10,6 +10,8 @@
>
>  use core::convert::Into;
>
> +pub mod hrtimer;
> +
>  /// The number of nanoseconds per millisecond.
>  pub const NSEC_PER_MSEC: i64 =3D bindings::NSEC_PER_MSEC as i64;
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..31c461ddd2c377101ed6c1c7e=
009f7dccf458ebc
> --- /dev/null
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -0,0 +1,296 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Intrusive high resolution timers.
> +//!
> +//! Allows running timer callbacks without doing allocations at the time=
 of
> +//! starting the timer. For now, only one timer per type is allowed.
> +//!
> +//! # Vocabulary
> +//!
> +//! A timer is initialized in the **stopped** state. A stopped timer can=
 be
> +//! **started** with an **expiry** time. After the timer is started, it =
is
> +//! **running**. When the timer **expires**, the timer handler is execut=
ed.
> +//! After the handler has executed, the timer may be **restarted** or
> +//! **stopped**. A running timer can be **cancelled** before it's handle=
r is
> +//! executed. A timer that is cancelled enters the **stopped** state.

s/it's/its/

I find this pretty hard to read because it contains a mix of
descriptions of states and descriptions of state transitions. Can we
state all the states first, and then all the transitions? Diagrams are
always helpful.

> +//!
> +//! States:
> +//!
> +//! * Stopped
> +//! * Running
> +//!
> +//! Operations:
> +//!
> +//! * Start
> +//! * Cancel
> +//! * Stop
> +//! * Restart
> +//!
> +//! Events:
> +//!
> +//! * Expire
> +
> +use crate::{init::PinInit, prelude::*, time::Ktime, types::Opaque};
> +use core::marker::PhantomData;
> +
> +/// A timer backed by a C `struct hrtimer`.
> +///
> +/// # Invariants
> +///
> +/// * `self.timer` is initialized by `bindings::hrtimer_setup`.
> +#[pin_data]
> +#[repr(C)]
> +pub struct HrTimer<U> {
> +    #[pin]
> +    timer: Opaque<bindings::hrtimer>,
> +    _t: PhantomData<U>,
> +}
> +
> +// SAFETY: A `HrTimer` can be moved to other threads and used/dropped fr=
om there.

Is that because it's on the heap on the C side, and the Rust type is
roughly a pointer to it?

> +unsafe impl<U> Send for HrTimer<U> {}
> +
> +// SAFETY: Timer operations are locked on C side, so it is safe to opera=
te on a
> +// timer from multiple threads
> +unsafe impl<U> Sync for HrTimer<U> {}
> +
> +impl<T> HrTimer<T> {
> +    /// Return an initializer for a new timer instance.

What's an initializer?

> +    pub fn new() -> impl PinInit<Self>
> +    where
> +        T: HrTimerCallback,
> +    {
> +        pin_init!(Self {
> +            // INVARIANTS: We initialize `timer` with `hrtimer_setup` be=
low.
> +            timer <- Opaque::ffi_init(move |place: *mut bindings::hrtime=
r| {
> +                // SAFETY: By design of `pin_init!`, `place` is a pointe=
r live

pointer *to a* live allocation?

> +                // allocation. hrtimer_setup will initialize `place` and=
 does
> +                // not require `place` to be initialized prior to the ca=
ll.
> +                unsafe {
> +                    bindings::hrtimer_setup(
> +                        place,
> +                        Some(T::CallbackTarget::run),
> +                        bindings::CLOCK_MONOTONIC as i32,

Is it possible to avoid this as cast?

> +                        bindings::hrtimer_mode_HRTIMER_MODE_REL,
> +                    );
> +                }
> +            }),
> +            _t: PhantomData,
> +        })
> +    }
> +
> +    /// Get a pointer to the contained `bindings::hrtimer`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must point to a live allocation of at least the size of `S=
elf`.

This function is private, this doc comment won't ever be rendered by rustdo=
c.

> +    unsafe fn raw_get(ptr: *const Self) -> *mut bindings::hrtimer {
> +        // SAFETY: The field projection to `timer` does not go out of bo=
unds,
> +        // because the caller of this function promises that `ptr` point=
s to an
> +        // allocation of at least the size of `Self`.
> +        unsafe { Opaque::raw_get(core::ptr::addr_of!((*ptr).timer)) }
> +    }
> +
> +    /// Cancel an initialized and potentially running timer.
> +    ///
> +    /// If the timer handler is running, this will block until the handl=
er is
> +    /// finished.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `self_ptr` must point to a valid `Self`.
> +    #[allow(dead_code)]

Why does this need to be raw? This can be explained in the commit
message or the cover letter IMO.

> +    pub(crate) unsafe fn raw_cancel(self_ptr: *const Self) -> bool {
> +        // SAFETY: timer_ptr points to an allocation of at least `HrTime=
r` size.
> +        let c_timer_ptr =3D unsafe { HrTimer::raw_get(self_ptr) };
> +
> +        // If handler is running, this will wait for handler to finish b=
efore
> +        // returning.

Missing article in both halves; s/handler/the handler/.

> +        // SAFETY: `c_timer_ptr` is initialized and valid. Synchronizati=
on is
> +        // handled on C side.
> +        unsafe { bindings::hrtimer_cancel(c_timer_ptr) !=3D 0 }
> +    }
> +}
> +
> +/// Implemented by pointer types that point to structs that embed a [`Hr=
Timer`].
> +///
> +/// Typical implementers would be [`Box<T>`], [`Arc<T>`], [`ARef<T>`] wh=
ere `T`
> +/// has a field of type [`HrTimer`].

nit: this paragraph is over specifying things.

> +///
> +/// Target must be [`Sync`] because timer callbacks happen in another th=
read of
> +/// execution (hard or soft interrupt context).

What is "Target"?

> +///
> +/// Starting a timer returns a [`HrTimerHandle`] that can be used to man=
ipulate
> +/// the timer. Note that it is OK to call the start function repeatedly,=
 and
> +/// that more than one [`HrTimerHandle`] associated with a [`HrTimerPoin=
ter`] may
> +/// exist. A timer can be manipulated through any of the handles, and a =
handle
> +/// may represent a cancelled timer.

"Cancel" is a transition, not a state, so I think this should say "a
stopped timer".

> +///
> +/// [`Box<T>`]: Box
> +/// [`Arc<T>`]: crate::sync::Arc
> +/// [`ARef<T>`]: crate::types::ARef
> +pub trait HrTimerPointer: Sync + Sized {
> +    /// A handle representing a running timer.

The comment just above says that a handle can represent a stopped
timer. Which is it?

> +    ///
> +    /// If the timer is running or if the timer callback is executing wh=
en the
> +    /// handle is dropped, the drop method of [`HrTimerHandle`] should n=
ot return
> +    /// until the timer is stopped and the callback has completed.
> +    ///
> +    /// Note: It must be safe to leak the handle.

What does "safe" mean exactly? Also, this comment seems to be
describing the trait `HrTimerHandle` rather than the associated type
`TimerHandle`.

> +    type TimerHandle: HrTimerHandle;
> +
> +    /// Start the timer with expiry after `expires` time units. If the t=
imer was
> +    /// already running, it is restarted with the new expiry time.
> +    fn start(self, expires: Ktime) -> Self::TimerHandle;
> +}
> +
> +/// Implemented by [`HrTimerPointer`] implementers to give the C timer c=
allback a
> +/// function to call.
> +// This is split from `HrTimerPointer` to make it easier to specify trai=
t bounds.
> +pub trait RawHrTimerCallback {
> +    /// Callback to be called from C when timer fires.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Only to be called by C code in `hrtimer` subsystem. `ptr` must p=
oint to
> +    /// the `bindings::hrtimer` structure that was used to start the tim=
er.
> +    unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::h=
rtimer_restart;
> +}
> +
> +/// Implemented by structs that can the target of a timer callback.

Missing verb: s/can the/can be the/

> +pub trait HrTimerCallback {
> +    /// The type that was used for starting the timer.

This comment isn't very helpful, is it? I think it should say "The
type whose `run` method will be invoked when the timer expires.".

> +    type CallbackTarget<'a>: RawHrTimerCallback;
> +
> +    /// This type is passed to the timer callback function. It may be a =
borrow
> +    /// of [`Self::CallbackTarget`], or it may be `Self::CallbackTarget`=
 if the
> +    /// implementation can guarantee exclusive access to the target duri=
ng timer
> +    /// handler execution.
> +    type CallbackTargetParameter<'a>;
> +
> +    /// Called by the timer logic when the timer fires.
> +    fn run(this: Self::CallbackTargetParameter<'_>)
> +    where
> +        Self: Sized;
> +}
> +
> +/// A handle representing a potentially running timer.
> +///
> +/// More than one handle representing the same timer might exist.
> +///
> +/// # Safety
> +///
> +/// When dropped, the timer represented by this handle must be cancelled=
, if it
> +/// is running. If the timer handler is running when the handle is dropp=
ed, the
> +/// drop method must wait for the handler to finish before returning.

See my note above anchored on `type TimerHandle: HrTimerHandle`; it
repeats this comment.

> +pub unsafe trait HrTimerHandle {
> +    /// Cancel the timer, if it is running. If the timer handler is runn=
ing, block
> +    /// till the handler has finished.
> +    fn cancel(&mut self) -> bool;
> +}
> +
> +/// Implemented by structs that contain timer nodes.
> +///
> +/// Clients of the timer API would usually safely implement this trait b=
y using
> +/// the [`crate::impl_has_hr_timer`] macro.
> +///
> +/// # Safety
> +///
> +/// Implementers of this trait must ensure that the implementer has a [`=
HrTimer`]
> +/// field at the offset specified by `OFFSET` and that all trait methods=
 are
> +/// implemented according to their documentation.
> +///
> +/// [`impl_has_timer`]: crate::impl_has_timer
> +pub unsafe trait HasHrTimer<U> {
> +    /// Offset of the [`HrTimer`] field within `Self`
> +    const OFFSET: usize;
> +
> +    /// Return a pointer to the [`HrTimer`] within `Self`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must point to a valid struct of type `Self`.
> +    unsafe fn raw_get_timer(ptr: *const Self) -> *const HrTimer<U> {
> +        // SAFETY: By the safety requirement of this trait, the trait
> +        // implementor will have a `HrTimer` field at the specified offs=
et.
> +        unsafe { ptr.cast::<u8>().add(Self::OFFSET).cast::<HrTimer<U>>()=
 }
> +    }
> +
> +    /// Return a pointer to the struct that is embedding the [`HrTimer`]=
 pointed
> +    /// to by `ptr`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must point to a [`HrTimer<U>`] field in a struct of type `=
Self`.
> +    unsafe fn timer_container_of(ptr: *mut HrTimer<U>) -> *mut Self
> +    where
> +        Self: Sized,
> +    {
> +        // SAFETY: By the safety requirement of this function and the `H=
asHrTimer`
> +        // trait, the following expression will yield a pointer to the `=
Self`
> +        // containing the timer addressed by `ptr`.
> +        unsafe { ptr.cast::<u8>().sub(Self::OFFSET).cast::<Self>() }
> +    }
> +
> +    /// Get pointer to embedded `bindings::hrtimer` struct.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `self_ptr` must point to a valid `Self`.
> +    unsafe fn c_timer_ptr(self_ptr: *const Self) -> *const bindings::hrt=
imer {
> +        // SAFETY: `self_ptr` is a valid pointer to a `Self`.
> +        let timer_ptr =3D unsafe { Self::raw_get_timer(self_ptr) };
> +
> +        // SAFETY: timer_ptr points to an allocation of at least `HrTime=
r` size.
> +        unsafe { HrTimer::raw_get(timer_ptr) }
> +    }
> +
> +    /// Start the timer contained in the `Self` pointed to by `self_ptr`=
. If
> +    /// it is already running it is removed and inserted.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `self_ptr` must point to a valid `Self`.
> +    unsafe fn start(self_ptr: *const Self, expires: Ktime) {
> +        // SAFETY: By function safety requirement, `self_ptr`is a valid =
`Self`.
> +        unsafe {
> +            bindings::hrtimer_start_range_ns(
> +                Self::c_timer_ptr(self_ptr).cast_mut(),
> +                expires.to_ns(),
> +                0,
> +                bindings::hrtimer_mode_HRTIMER_MODE_REL,
> +            );
> +        }
> +    }
> +}
> +
> +/// Use to implement the [`HasHrTimer<T>`] trait.
> +///
> +/// See [`module`] documentation for an example.
> +///
> +/// [`module`]: crate::time::hrtimer
> +#[macro_export]
> +macro_rules! impl_has_hr_timer {
> +    (
> +        impl$({$($generics:tt)*})?
> +            HasHrTimer<$timer_type:ty>
> +            for $self:ty
> +        { self.$field:ident }
> +        $($rest:tt)*
> +    ) =3D> {
> +        // SAFETY: This implementation of `raw_get_timer` only compiles =
if the
> +        // field has the right type.
> +        unsafe impl$(<$($generics)*>)? $crate::time::hrtimer::HasHrTimer=
<$timer_type> for $self {
> +            const OFFSET: usize =3D ::core::mem::offset_of!(Self, $field=
) as usize;
> +
> +            #[inline]
> +            unsafe fn raw_get_timer(ptr: *const Self) ->
> +                *const $crate::time::hrtimer::HrTimer<$timer_type>
> +            {
> +                // SAFETY: The caller promises that the pointer is not d=
angling.
> +                unsafe {
> +                    ::core::ptr::addr_of!((*ptr).$field)
> +                }
> +            }
> +        }
> +    }
> +}

It'd be helpful to understand these design choices; why is so much of
this written in terms of raw pointers?

Tamir
