Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8961CD2C
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 12:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771504265; cv=none; b=CZjG1MaEfB9+tRfjTWJ74xkx/oZQEQYlcbjLmsgqeggBellEIht+zQOFRIjZwEZ2EciyvuQjzp9FXVgoFGuns/sAd4pxeU2GJ1V200oP5EF5do0P5VKGfbMOmPwYMXVLdtL9ikzZHqNZEojq5YZUrgjxw2dRMtOAHi2zwCz0l1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771504265; c=relaxed/simple;
	bh=SglOXaocJSri1+cg9QojoLjoalnluMyJs2o9kgYfclQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MKZXWRsbl9039h9r3LmlMce/caeZPPW3DoXnCs9nV9yONEm2fJCGxkF6XE39QEQEpxOuuL7EfOsk5NWPZwrACvJYCaWO/Gok+/MC9yzdX3nsdrjr/lUyLYqHRiQbjqEjCK4RR0+DZ/pDFftbxSkDAUxmDCOA1E31EK83QN5L1wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wui6EOgZ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wui6EOgZ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4836c819456so6675835e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 04:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771504262; x=1772109062; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0MeTT6zxo5JS8Bu9lOzHpazg5f+GXnmmA7oRquxYx6E=;
        b=Wui6EOgZflrbVMN2u84L1Ji2QvymgVjnvTYUYxWEoJrCKaNXedp31DIjea1yeCwAzA
         i3WuX5oAA16cWDI3WoklpNL9dWvCsXrJsLYw4ndwpIUpWJbluC/zhUfIJB+A7FJuGlUn
         STDlzSk/gZCcCF9ZEz5wcfQ9zj13kDWPIgQ6nhSFDcjoU/XNKdHE8BS40kWvIYLfTKvj
         yJwz164Ev3IDSKuMhDCS4zxjeM84FVTkQjWPmuakFcneiBAIrCwqzCep+ohu1kiTRBfJ
         3l11mNp2KgRFhx4l355fLmIfIBDRc1QLJS9c3ii23maTCKmu5hwVc8H3dym4dL0LZQld
         aDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771504262; x=1772109062;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MeTT6zxo5JS8Bu9lOzHpazg5f+GXnmmA7oRquxYx6E=;
        b=nFOdyW6860BNSkq8fW95PiG0cnIZc7DXBihtriVghj37yArp5NjhtHarQ6aOPn6ire
         5keb6anvXDSexVhojOE19fEkS5V30q2rNcLRKAkgRoFg8MSDCf2MiQ5hGrP8Bzn9XNvN
         f5BD+rLhHsjLJnfLsW70+cyKStldn52Ul5S35bjjHtQMjgmfhxzp+6CTAsP4LutaWHJk
         VVOd+GL5uCL1iRxGEyS7fBwd9vWrAFpRbmekQOmTNVJ54YqgW0d835jo8th29VNsRR/E
         8cst1hB3YPaWjQnkkFNzT10y6llXA3Fvb1tTPKiUzCO1qwfW3vYNR/3Ucam9vu6I+wlZ
         nGrg==
X-Forwarded-Encrypted: i=1; AJvYcCX0wkQr3gB11tujisBjTzzinhKzY5Ef2dZOClvjM73KdJjLfRUc7sGhLiYcBiTM6P1rdDtea/If0lXhnRzvXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeSxtk/Qr8tW+nG8aHjE+g3NkojParT9Qw0RjA8SLIj+JJrqCf
	u89vmSPrsX3vyJw5hTj2D+sYl3zx99SpqGRhvtNLT9yAnwrDJzy4ZzAvIxqH/WLOwP4Q0gywn+V
	EeaaNYow01ZnmxrPIHw==
X-Received: from wmog4.prod.google.com ([2002:a05:600c:3104:b0:483:6fcc:920])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4687:b0:47a:935f:618e with SMTP id 5b1f17b1804b1-48371061414mr352072955e9.15.1771504261392;
 Thu, 19 Feb 2026 04:31:01 -0800 (PST)
Date: Thu, 19 Feb 2026 12:31:00 +0000
In-Reply-To: <20260219-hrtimer-examples-v6-19-rc1-v2-1-810cc06ca9f6@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260219-hrtimer-examples-v6-19-rc1-v2-1-810cc06ca9f6@kernel.org>
Message-ID: <aZcChDe_Y3eyLuYS@google.com>
Subject: Re: [PATCH v2] hrtimer: add usage examples to documentation
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 19, 2026 at 12:57:45PM +0100, Andreas Hindborg wrote:
> Add documentation examples showing various ways to use hrtimers:
> 
> - Box-allocated timers with shared state in Arc.
> - Arc-allocated timers.
> - Stack-based timers for scoped usage.
> - Mutable stack-based timers with shared state.
> 
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> ---
> Changes in v2:
> - Sprinkle blank lines for readability
> - Change heading for Arc example
> - Fix error handling.
> - Link to v1: https://lore.kernel.org/r/20251217-hrtimer-examples-v6-19-rc1-v1-1-4ad0e7e4c4e0@kernel.org
> ---
>  rust/kernel/time/hrtimer.rs | 336 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 336 insertions(+)
> 
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 856d2d929a008..2d7f1131a8131 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -66,6 +66,342 @@
>  //!
>  //! A `restart` operation on a timer in the **stopped** state is equivalent to a
>  //! `start` operation.
> +//!
> +//! When a type implements both `HrTimerPointer` and `Clone`, it is possible to
> +//! issue the `start` operation while the timer is in the **started** state. In
> +//! this case the `start` operation is equivalent to the `restart` operation.
> +//!
> +//! # Examples
> +//!
> +//! ## Using an intrusive timer living in a [`Box`]
> +//!
> +//! ```
> +//! # use kernel::{
> +//! #     alloc::flags,
> +//! #     impl_has_hr_timer,
> +//! #     prelude::*,
> +//! #     sync::{
> +//! #         atomic::{ordering, Atomic},
> +//! #         completion::Completion,
> +//! #         Arc,
> +//! #     },
> +//! #     time::{
> +//! #         hrtimer::{
> +//! #             RelativeMode, HrTimer, HrTimerCallback, HrTimerPointer,
> +//! #             HrTimerRestart, HrTimerCallbackContext
> +//! #         },
> +//! #         Delta, Monotonic,
> +//! #     },
> +//! # };
> +//!

Either do not hide the imports, or remove this empty newline.

> +//! #[pin_data]
> +//! struct Shared {
> +//!     #[pin]
> +//!     flag: Atomic<u64>,
> +//!     #[pin]
> +//!     cond: Completion,
> +//! }
> +//!
> +//! impl Shared {
> +//!     fn new() -> impl PinInit<Self> {
> +//!         pin_init!(Self {
> +//!             flag <- Atomic::new(0),
> +//!             cond <- Completion::new(),
> +//!         })
> +//!     }
> +//! }
> +//!
> +//! #[pin_data]
> +//! struct BoxIntrusiveHrTimer {
> +//!     #[pin]
> +//!     timer: HrTimer<Self>,
> +//!     shared: Arc<Shared>,
> +//! }
> +//!
> +//! impl BoxIntrusiveHrTimer {
> +//!     fn new() -> impl PinInit<Self, kernel::error::Error> {
> +//!         try_pin_init!(Self {
> +//!             timer <- HrTimer::new(),
> +//!             shared: Arc::pin_init(Shared::new(), flags::GFP_KERNEL)?,
> +//!         })
> +//!     }
> +//! }
> +//!
> +//! impl HrTimerCallback for BoxIntrusiveHrTimer {
> +//!     type Pointer<'a> = Pin<KBox<Self>>;
> +//!
> +//!     fn run(this: Pin<&mut Self>, _ctx: HrTimerCallbackContext<'_, Self>) -> HrTimerRestart {
> +//!         pr_info!("Timer called\n");
> +//!
> +//!         let flag = this.shared.flag.fetch_add(1, ordering::Full);
> +//!         this.shared.cond.complete_all();
> +//!
> +//!         if flag == 4 {
> +//!             HrTimerRestart::NoRestart
> +//!         } else {
> +//!             HrTimerRestart::Restart
> +//!         }
> +//!     }
> +//! }
> +//!
> +//! impl_has_hr_timer! {
> +//!     impl HasHrTimer<Self> for BoxIntrusiveHrTimer {
> +//!         mode: RelativeMode<Monotonic>, field: self.timer
> +//!     }
> +//! }
> +//!
> +//! let has_timer = Box::pin_init(BoxIntrusiveHrTimer::new(), GFP_KERNEL)?;
> +//! let shared = has_timer.shared.clone();
> +//! let _handle = has_timer.start(Delta::from_micros(200));
> +//!
> +//! while shared.flag.load(ordering::Relaxed) != 5 {
> +//!     shared.cond.wait_for_completion();
> +//! }
> +//!
> +//! pr_info!("Counted to 5\n");
> +//! # Ok::<(), kernel::error::Error>(())
> +//! ```
> +//!
> +//! ## Using an intrusive timer in an [`Arc`]
> +//!
> +//! ```
> +//! # use kernel::{
> +//! #     alloc::flags,
> +//! #     impl_has_hr_timer,
> +//! #     prelude::*,
> +//! #     sync::{
> +//! #         atomic::{ordering, Atomic},
> +//! #         completion::Completion,
> +//! #         Arc, ArcBorrow,
> +//! #     },
> +//! #     time::{
> +//! #         hrtimer::{
> +//! #             RelativeMode, HrTimer, HrTimerCallback, HrTimerPointer, HrTimerRestart,
> +//! #             HasHrTimer, HrTimerCallbackContext
> +//! #         },
> +//! #         Delta, Monotonic,
> +//! #     },
> +//! # };
> +//!

Ditto.

> +//! #[pin_data]
> +//! struct ArcIntrusiveHrTimer {
> +//!     #[pin]
> +//!     timer: HrTimer<Self>,
> +//!     #[pin]
> +//!     flag: Atomic<u64>,
> +//!     #[pin]
> +//!     cond: Completion,
> +//! }
> +//!
> +//! impl ArcIntrusiveHrTimer {
> +//!     fn new() -> impl PinInit<Self> {
> +//!         pin_init!(Self {
> +//!             timer <- HrTimer::new(),
> +//!             flag <- Atomic::new(0),
> +//!             cond <- Completion::new(),
> +//!         })
> +//!     }
> +//! }
> +//!
> +//! impl HrTimerCallback for ArcIntrusiveHrTimer {
> +//!     type Pointer<'a> = Arc<Self>;
> +//!
> +//!     fn run(
> +//!         this: ArcBorrow<'_, Self>,
> +//!         _ctx: HrTimerCallbackContext<'_, Self>,
> +//!     ) -> HrTimerRestart {
> +//!         pr_info!("Timer called\n");
> +//!
> +//!         let flag = this.flag.fetch_add(1, ordering::Full);
> +//!         this.cond.complete_all();
> +//!
> +//!         if flag == 4 {
> +//!             HrTimerRestart::NoRestart
> +//!         } else {
> +//!             HrTimerRestart::Restart
> +//!         }
> +//!     }
> +//! }
> +//!
> +//! impl_has_hr_timer! {
> +//!     impl HasHrTimer<Self> for ArcIntrusiveHrTimer {
> +//!         mode: RelativeMode<Monotonic>, field: self.timer
> +//!     }
> +//! }
> +//!
> +//! let has_timer = Arc::pin_init(ArcIntrusiveHrTimer::new(), GFP_KERNEL)?;
> +//! let _handle = has_timer.clone().start(Delta::from_micros(200));
> +//!
> +//! while has_timer.flag.load(ordering::Relaxed) != 5 {
> +//!     has_timer.cond.wait_for_completion();
> +//! }
> +//!
> +//! pr_info!("Counted to 5\n");
> +//! # Ok::<(), kernel::error::Error>(())
> +//! ```
> +//!
> +//! ## Using a stack-based timer
> +//!
> +//! ```
> +//! # use kernel::{
> +//! #     impl_has_hr_timer,
> +//! #     prelude::*,
> +//! #     sync::{
> +//! #         atomic::{ordering, Atomic},
> +//! #         completion::Completion,
> +//! #     },
> +//! #     time::{
> +//! #         hrtimer::{
> +//! #             ScopedHrTimerPointer, HrTimer, HrTimerCallback, HrTimerPointer, HrTimerRestart,
> +//! #             HasHrTimer, RelativeMode, HrTimerCallbackContext
> +//! #         },
> +//! #         Delta, Monotonic,
> +//! #     },
> +//! # };
> +//! # use pin_init::stack_pin_init;
> +//!

Ditto.

> +//! #[pin_data]
> +//! struct IntrusiveHrTimer {
> +//!     #[pin]
> +//!     timer: HrTimer<Self>,
> +//!     #[pin]
> +//!     flag: Atomic<u64>,
> +//!     #[pin]
> +//!     cond: Completion,
> +//! }
> +//!
> +//! impl IntrusiveHrTimer {
> +//!     fn new() -> impl PinInit<Self> {
> +//!         pin_init!(Self {
> +//!             timer <- HrTimer::new(),
> +//!             flag <- Atomic::new(0),
> +//!             cond <- Completion::new(),
> +//!         })
> +//!     }
> +//! }
> +//!
> +//! impl HrTimerCallback for IntrusiveHrTimer {
> +//!     type Pointer<'a> = Pin<&'a Self>;
> +//!
> +//!     fn run(this: Pin<&Self>, _ctx: HrTimerCallbackContext<'_, Self>) -> HrTimerRestart {
> +//!         pr_info!("Timer called\n");
> +//!
> +//!         this.flag.store(1, ordering::Release);
> +//!         this.cond.complete_all();
> +//!
> +//!         HrTimerRestart::NoRestart
> +//!     }
> +//! }
> +//!
> +//! impl_has_hr_timer! {
> +//!     impl HasHrTimer<Self> for IntrusiveHrTimer {
> +//!         mode: RelativeMode<Monotonic>, field: self.timer
> +//!     }
> +//! }
> +//!
> +//! stack_pin_init!( let has_timer = IntrusiveHrTimer::new() );
> +//! has_timer.as_ref().start_scoped(Delta::from_micros(200), || {
> +//!     while has_timer.flag.load(ordering::Relaxed) != 1 {
> +//!         has_timer.cond.wait_for_completion();
> +//!     }
> +//! });
> +//!
> +//! pr_info!("Flag raised\n");
> +//! # Ok::<(), kernel::error::Error>(())
> +//! ```
> +//!
> +//! ## Using a mutable stack-based timer
> +//!
> +//! ```
> +//! # use kernel::{
> +//! #     alloc::flags,
> +//! #     impl_has_hr_timer,
> +//! #     prelude::*,
> +//! #     sync::{
> +//! #         atomic::{ordering, Atomic},
> +//! #         completion::Completion,
> +//! #         Arc,
> +//! #     },
> +//! #     time::{
> +//! #         hrtimer::{
> +//! #             ScopedHrTimerPointer, HrTimer, HrTimerCallback, HrTimerPointer, HrTimerRestart,
> +//! #             HasHrTimer, RelativeMode, HrTimerCallbackContext
> +//! #         },
> +//! #         Delta, Monotonic,
> +//! #     },
> +//! # };
> +//! # use pin_init::stack_try_pin_init;
> +//!

Ditto.

> +//! #[pin_data]
> +//! struct Shared {
> +//!     #[pin]
> +//!     flag: Atomic<u64>,
> +//!     #[pin]
> +//!     cond: Completion,
> +//! }
> +//!
> +//! impl Shared {
> +//!     fn new() -> impl PinInit<Self> {
> +//!         pin_init!(Self {
> +//!             flag <- Atomic::new(0),
> +//!             cond <- Completion::new(),
> +//!         })
> +//!     }
> +//! }
> +//!
> +//! #[pin_data]
> +//! struct IntrusiveHrTimer {
> +//!     #[pin]
> +//!     timer: HrTimer<Self>,
> +//!     shared: Arc<Shared>,
> +//! }
> +//!
> +//! impl IntrusiveHrTimer {
> +//!     fn new() -> impl PinInit<Self, kernel::error::Error> {
> +//!         try_pin_init!(Self {
> +//!             timer <- HrTimer::new(),
> +//!             shared: Arc::pin_init(Shared::new(), flags::GFP_KERNEL)?,
> +//!         })
> +//!     }
> +//! }
> +//!
> +//! impl HrTimerCallback for IntrusiveHrTimer {
> +//!     type Pointer<'a> = Pin<&'a mut Self>;
> +//!
> +//!     fn run(this: Pin<&mut Self>, _ctx: HrTimerCallbackContext<'_, Self>) -> HrTimerRestart {
> +//!         pr_info!("Timer called\n");
> +//!
> +//!         let flag = this.shared.flag.fetch_add(1, ordering::Full);
> +//!         this.shared.cond.complete_all();
> +//!
> +//!         if flag == 4 {
> +//!             HrTimerRestart::NoRestart
> +//!         } else {
> +//!             HrTimerRestart::Restart
> +//!         }
> +//!     }
> +//! }
> +//!
> +//! impl_has_hr_timer! {
> +//!     impl HasHrTimer<Self> for IntrusiveHrTimer {
> +//!         mode: RelativeMode<Monotonic>, field: self.timer
> +//!     }
> +//! }
> +//!
> +//! stack_try_pin_init!( let has_timer =? IntrusiveHrTimer::new() );
> +//! let shared = has_timer.shared.clone();
> +//!
> +//! has_timer.as_mut().start_scoped(Delta::from_micros(200), || {
> +//!     while shared.flag.load(ordering::Relaxed) != 5 {
> +//!         shared.cond.wait_for_completion();
> +//!     }
> +//! });
> +//!
> +//! pr_info!("Counted to 5\n");
> +//! # Ok::<(), kernel::error::Error>(())
> +//! ```
> +//!
> +//! [`Arc`]: kernel::sync::Arc
>  
>  use super::{ClockSource, Delta, Instant};
>  use crate::{prelude::*, types::Opaque};
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251215-hrtimer-examples-v6-19-rc1-2658ce9bb5d0
> 
> Best regards,
> -- 
> Andreas Hindborg <a.hindborg@kernel.org>
> 
> 
