Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E63138E168;
	Wed, 17 Dec 2025 14:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765980292; cv=pass; b=YiqAcvRMeOjm2a4eHz+/WSLts28Jxcx5juH8b1rnO0tCBG1UzuH7R17Pe28SPCvVSBF8a/rFcXllzfSrE+QqIyQDZTX6V80h75Y6JqBdpE+vLCeQme0z1guMQhYbRRc6w9gViJmtZVVl5i/xIQftAmR9Wjzutw/zvh0klHcobjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765980292; c=relaxed/simple;
	bh=9djqxxlgqT1U1Br/7Gx1HS5y6Kex6pc1iAZVfmd6ZBo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Ex8YpHLZzP6Z/0MJtKCOkTnbIInr/6Wh0Ujd7FLGY4fXwGWPRbygw4Ixt6txP+d5kySsZucTdcDskCqrD4IDF5zkwaQRGiFaMrqwqKbXR5Ct1ilmnyPKJsKPQhEgklhWzOe3VP1AYHtyeDqsU5AlKNkn2tZSCSa43QwU+f7UFRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=W1kUNwkl; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="W1kUNwkl"
ARC-Seal: i=1; a=rsa-sha256; t=1765980248; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d7FYvzgHHLAWozb/DnDvubSltB+Ri2PFSdM1Ez+b3NR/4kr2kdroRGCFYj4DrKR9sy/WOL/Unyh426MhGIRVLT6l6S7k+MC5+keNWmCTn253lHz7PLrCVLAojzDm/2HPGczknOqVmCzyKraPJXYDDq/aPpZeVGjv6XD8TJeuXyE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765980248; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Dp17UFxxKHGg6NNEHcm07W/nKZBAVZyabC23LoyiySo=; 
	b=eNcrYUdqkzjhmXfmZEdQUw9NrpY0b6hkgluyLnaR7iHoyRv22DSWiDcQilCniop/mQOyaiFaIdKViEUC7QfifqBTGUAR4/jYR7goQUv9acm76gC7n+C2fkm/C/eG9cztBmbJcY8Qy33YnMVbCl6Nl6hOY4zvfRAw7GDhdeF2BdI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765980248;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=Dp17UFxxKHGg6NNEHcm07W/nKZBAVZyabC23LoyiySo=;
	b=W1kUNwkl7L7SwPZhsNZvmOR5mGZ13usDiWFQHJQWsXsk4fg0FoLuu+46cQey79AN
	G/DEZ6oOb68EPL9A1+tqJweUzgXFPb5DfOT3KfvEQcqM04YcAUgH0QfSN4ZuxULSx6u
	neqrTP1kKMVZwqqE+h1+IrfRNlRUncLQwT6rb6Sw=
Received: by mx.zohomail.com with SMTPS id 1765980245617184.63308842063577;
	Wed, 17 Dec 2025 06:04:05 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] hrtimer: add usage examples to documentation
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251217-hrtimer-examples-v6-19-rc1-v1-1-4ad0e7e4c4e0@kernel.org>
Date: Wed, 17 Dec 2025 11:03:48 -0300
Cc: Boqun Feng <boqun.feng@gmail.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 John Stultz <jstultz@google.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C1C6DB90-202A-45FF-9D01-D7304A8DC8B0@collabora.com>
References: <20251217-hrtimer-examples-v6-19-rc1-v1-1-4ad0e7e4c4e0@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Andreas,

> On 17 Dec 2025, at 07:30, Andreas Hindborg <a.hindborg@kernel.org> =
wrote:
>=20
> Add documentation examples showing various ways to use hrtimers:
>=20
> - Box-allocated timers with shared state in Arc.
> - Arc-allocated timers.
> - Stack-based timers for scoped usage.
> - Mutable stack-based timers with shared state.
>=20
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> rust/kernel/time/hrtimer.rs | 327 =
++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 327 insertions(+)
>=20
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 856d2d929a008..6ca198947b679 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -66,6 +66,333 @@
> //!
> //! A `restart` operation on a timer in the **stopped** state is =
equivalent to a
> //! `start` operation.
> +//!
> +//! When a type implements both `HrTimerPointer` and `Clone`, it is =
possible to
> +//! issue the `start` operation while the timer is in the **started** =
state. In
> +//! this case the `start` operation is equivalent to the `restart` =
operation.
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
> +//! #             RelativeMode, HrTimer, HrTimerCallback, =
HrTimerPointer,
> +//! #             HrTimerRestart, HrTimerCallbackContext
> +//! #         },
> +//! #         Delta, Monotonic,
> +//! #     },
> +//! # };
> +//!
> +//! #[pin_data]
> +//! struct Shared {
> +//!     #[pin]
> +//!     flag: Atomic<u64>,
> +//!     #[pin]
> +//!     cond: Completion,
> +//! }
> +//!
> +//! impl Shared {
> +//!     fn new() -> impl PinInit<Self, kernel::error::Error> {
> +//!         try_pin_init!(Self {
> +//!             flag <- Atomic::new(0),
> +//!             cond <- Completion::new(),
> +//!         })

This doesn=E2=80=99t seem to be fallible? Can=E2=80=99t this use =
pin_init!() directly?

Ditto elsewhere.

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
> +//!             shared: Arc::pin_init(Shared::new(), =
flags::GFP_KERNEL).unwrap(),

Why the unwrap() here instead of the "?" operator? I think that having =
unwrap() in examples encourages
people to panic the kernel.


> +//!         })
> +//!     }
> +//! }
> +//!
> +//! impl HrTimerCallback for BoxIntrusiveHrTimer {
> +//!     type Pointer<'a> =3D Pin<KBox<Self>>;
> +//!
> +//!     fn run(this: Pin<&mut Self>, _ctx: HrTimerCallbackContext<'_, =
Self>) -> HrTimerRestart {
> +//!         pr_info!("Timer called\n");

Blanks here, ditto elsewhere.

> +//!         let flag =3D this.shared.flag.fetch_add(1, =
ordering::Full);
> +//!         this.shared.cond.complete_all();
> +//!         if flag =3D=3D 4 {
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
> +//! let has_timer =3D Box::pin_init(BoxIntrusiveHrTimer::new(), =
GFP_KERNEL)?;
> +//! let shared =3D has_timer.shared.clone();
> +//! let _handle =3D has_timer.start(Delta::from_micros(200));
> +//!
> +//! while shared.flag.load(ordering::Relaxed) !=3D 5 {
> +//!     shared.cond.wait_for_completion();
> +//! }
> +//!
> +//! pr_info!("Counted to 5\n");
> +//! # Ok::<(), kernel::error::Error>(())
> +//! ```
> +//!
> +//! ## An intrusive timer in an [`Arc`]

This one is the only one that reads differently, FYI.

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
> +//! #             RelativeMode, HrTimer, HrTimerCallback, =
HrTimerPointer, HrTimerRestart,
> +//! #             HasHrTimer, HrTimerCallbackContext
> +//! #         },
> +//! #         Delta, Monotonic,
> +//! #     },
> +//! # };
> +//!
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
> +//!     fn new() -> impl PinInit<Self, kernel::error::Error> {
> +//!         try_pin_init!(Self {
> +//!             timer <- HrTimer::new(),
> +//!             flag <- Atomic::new(0),
> +//!             cond <- Completion::new(),
> +//!         })
> +//!     }
> +//! }
> +//!
> +//! impl HrTimerCallback for ArcIntrusiveHrTimer {
> +//!     type Pointer<'a> =3D Arc<Self>;

> +//!
> +//!     fn run(
> +//!         this: ArcBorrow<'_, Self>,
> +//!         _ctx: HrTimerCallbackContext<'_, Self>,
> +//!     ) -> HrTimerRestart {
> +//!         pr_info!("Timer called\n");
> +//!         let flag =3D this.flag.fetch_add(1, ordering::Full);
> +//!         this.cond.complete_all();
> +//!         if flag =3D=3D 4 {
> +//!             HrTimerRestart::NoRestart
> +//!         } else {
> +//!             HrTimerRestart::Restart
> +//!         }
> +//!     }

Blanks as well ^

> +//! }
> +//!
> +//! impl_has_hr_timer! {
> +//!     impl HasHrTimer<Self> for ArcIntrusiveHrTimer {
> +//!         mode: RelativeMode<Monotonic>, field: self.timer
> +//!     }
> +//! }
> +//!
> +//! let has_timer =3D Arc::pin_init(ArcIntrusiveHrTimer::new(), =
GFP_KERNEL)?;
> +//! let _handle =3D has_timer.clone().start(Delta::from_micros(200));
> +//!
> +//! while has_timer.flag.load(ordering::Relaxed) !=3D 5 {
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
> +//! #             ScopedHrTimerPointer, HrTimer, HrTimerCallback, =
HrTimerPointer, HrTimerRestart,
> +//! #             HasHrTimer, RelativeMode, HrTimerCallbackContext
> +//! #         },
> +//! #         Delta, Monotonic,
> +//! #     },
> +//! # };
> +//! # use pin_init::stack_try_pin_init;
> +//!
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
> +//!     fn new() -> impl PinInit<Self, kernel::error::Error> {
> +//!         try_pin_init!(Self {
> +//!             timer <- HrTimer::new(),
> +//!             flag <- Atomic::new(0),
> +//!             cond <- Completion::new(),
> +//!         })
> +//!     }
> +//! }
> +//!
> +//! impl HrTimerCallback for IntrusiveHrTimer {
> +//!     type Pointer<'a> =3D Pin<&'a Self>;
> +//!
> +//!     fn run(this: Pin<&Self>, _ctx: HrTimerCallbackContext<'_, =
Self>) -> HrTimerRestart {
> +//!         pr_info!("Timer called\n");
> +//!         this.flag.store(1, ordering::Release);
> +//!         this.cond.complete_all();
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
> +//! stack_try_pin_init!( let has_timer =3D? IntrusiveHrTimer::new() =
);

??? Benno, the syntax is getting more interesting with each passing day =
:)

> +//! has_timer.as_ref().start_scoped(Delta::from_micros(200), || {
> +//!     while has_timer.flag.load(ordering::Relaxed) !=3D 1 {
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
> +//! #             ScopedHrTimerPointer, HrTimer, HrTimerCallback, =
HrTimerPointer, HrTimerRestart,
> +//! #             HasHrTimer, RelativeMode, HrTimerCallbackContext
> +//! #         },
> +//! #         Delta, Monotonic,
> +//! #     },
> +//! # };
> +//! # use pin_init::stack_try_pin_init;
> +//!
> +//! #[pin_data]
> +//! struct Shared {
> +//!     #[pin]
> +//!     flag: Atomic<u64>,
> +//!     #[pin]
> +//!     cond: Completion,
> +//! }
> +//!
> +//! impl Shared {
> +//!     fn new() -> impl PinInit<Self, kernel::error::Error> {
> +//!         try_pin_init!(Self {
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
> +//!             shared: Arc::pin_init(Shared::new(), =
flags::GFP_KERNEL).unwrap(),
> +//!         })
> +//!     }
> +//! }
> +//!
> +//! impl HrTimerCallback for IntrusiveHrTimer {
> +//!     type Pointer<'a> =3D Pin<&'a mut Self>;
> +//!
> +//!     fn run(this: Pin<&mut Self>, _ctx: HrTimerCallbackContext<'_, =
Self>) -> HrTimerRestart {
> +//!         pr_info!("Timer called\n");
> +//!         let flag =3D this.shared.flag.fetch_add(1, =
ordering::Full);
> +//!         this.shared.cond.complete_all();
> +//!         if flag =3D=3D 4 {
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
> +//! stack_try_pin_init!( let has_timer =3D? IntrusiveHrTimer::new() =
);
> +//! let shared =3D has_timer.shared.clone();
> +//! has_timer.as_mut().start_scoped(Delta::from_micros(200), || {
> +//!     while shared.flag.load(ordering::Relaxed) !=3D 5 {
> +//!         shared.cond.wait_for_completion();
> +//!     }
> +//! });
> +//!
> +//! pr_info!("Counted to 5\n");
> +//! # Ok::<(), kernel::error::Error>(())
> +//! ```
> +//!
> +//! [`Arc`]: kernel::sync::Arc
>=20
> use super::{ClockSource, Delta, Instant};
> use crate::{prelude::*, types::Opaque};
>=20
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251215-hrtimer-examples-v6-19-rc1-2658ce9bb5d0
>=20
> Best regards,
> --=20
> Andreas Hindborg <a.hindborg@kernel.org>
>=20
>=20
>=20

FWIW:

[10:52:46] [PASSED] rust_doctest_kernel_time_hrtimer_rs_0
[10:52:46] [PASSED] rust_doctest_kernel_time_hrtimer_rs_1
[10:52:46] [PASSED] rust_doctest_kernel_time_hrtimer_rs_2
[10:52:46] [PASSED] rust_doctest_kernel_time_hrtimer_rs_3

This looks good to me. The rendering looks ok as well.

With the nits addressed:

Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

