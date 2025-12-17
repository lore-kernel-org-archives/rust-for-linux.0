Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EE93B75E2;
	Wed, 17 Dec 2025 10:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765967710; cv=none; b=O4rwfYC/34TZXUb9CBo0GMNDQH92i0XsL7moYJW3D4lqY1/1of2IuNLWC9kAbccOLu/wm5JcU+/Ez3ufW0TU8GpZw20RFxbygeUYGRwmhlRI8TshFB/KFClJuVZAcHLCJmfkMVo1BLqtYIiimBkF5s7s2rNx8CXNAQDmwGmsx/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765967710; c=relaxed/simple;
	bh=XE1hqLckWobzpG8Y8jPWhmabxeHpFKm0weDITLZmFR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=h+SK4Q3su1kEnCH6BQY0R85+CzKHBeEvUbEc8LGhVObsU56xznw9+1tA3v59upkK4iwTrytBXEYFIMAYhFHGn2TyfNenxtOezSR8VJflSiQW4sM/w/hBaqOcr6l94uhUdDEZfO2RpkCxjE4WADlMXla/jXWwRQhdb1xdvC3b1Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AVtKMMo7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AVtKMMo7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A27C4CEFB;
	Wed, 17 Dec 2025 10:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765967709;
	bh=XE1hqLckWobzpG8Y8jPWhmabxeHpFKm0weDITLZmFR4=;
	h=From:Date:Subject:To:Cc:From;
	b=AVtKMMo7p5cmBr+kPnVTB0niFJowAqx4VF1htuDR8zZ3SiNu1hSYrfDG8m8O6Ip6H
	 dxym/qBdvj0vHDF+9be+aSOtYDz2GOOgAkmbkHe4pPOUPwiKX5GqpplpDbqgyWOjmK
	 74NY4cbRTgabFHP1OrVwY8H8WVix8t+cJRWLbCTbqBMvOU4TrrLuC73kCVMNr1yPw2
	 OsrCyaut0aa45yfNGU1lfQ/9h7Lk5mDExojGDOyTeDiBHQ4Wx7Za0CnSFbopk6jvDG
	 6JCxujAUlHLyallIrtoSy/zA6DkuE+nDFlxWa2Cnqz0yBjywR5s/BJtK4JoWl/oRPA
	 CmdTsTuXVIyvg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 17 Dec 2025 11:30:21 +0100
Subject: [PATCH] hrtimer: add usage examples to documentation
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-hrtimer-examples-v6-19-rc1-v1-1-4ad0e7e4c4e0@kernel.org>
X-B4-Tracking: v=1; b=H4sIADyGQmkC/x3MTQqEMAwG0KtI1gZMoTJ6lWEWtn5qYPwhFRHEu
 1tcvs27KMEUidriIsOhSdclQ8qC4tQtI1j7bHKV8+LE82S7zjDG2c3bH4mPmqVhi8Ku9p+IJgT
 fV5SDzTDo+ebf330/lhuEcWwAAAA=
X-Change-ID: 20251215-hrtimer-examples-v6-19-rc1-2658ce9bb5d0
To: Andreas Hindborg <a.hindborg@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=10730;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=XE1hqLckWobzpG8Y8jPWhmabxeHpFKm0weDITLZmFR4=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpQoZkCjN0iW01zhwEL9oMjLeqoO4o/eieknn/S
 oGo0PpevFCJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaUKGZAAKCRDhuBo+eShj
 dwgHEACXKPmXzwETVwuJagTDd1nHDf5ubeeXFm9KaFPCaPHwYUKkKpbclLfOWQQz9uc+IeK+AuQ
 AziYkVDGb3aJNveTcHUeEmPpoHkTG2WETi1jrhU02jbMbDvuzu1G11Dl9pYD4n2qg+deQGsaFKh
 G//PPqmAsvCGSPpp2ApmWCYpP/3NiOJp4OTNKyjjc3NTK2qYmoYJ4C4EJN2fGp0JJxS5gp7XVNN
 KTJbeJD4QSROlkB6ft/IfAbATFvG6loni1Cmq8lcY9K8KhlwwBg83/oiuUvXrB9XTfvH8I11+DT
 Gm51P1/IS93czbMnCr9cNAazS8zKVK0idcgbMtbPMDSEkRe8/cR9zvovw4+v4TRXztsoUaTl6En
 Eo2E8FQmVlCBe2L7pQRBoudTE+gqMhhW0/NT0ainSF/0pKWUej26YkN2PiGK/FcWmubudvTdd6T
 NxCOF5H90Zb27ux6UaQMLdm2eaEsShhGqn0lR+BMvtw05U7NNNWpDJdEUkOAysVt0dyfn5zsOHB
 QeguGoZUHW1Ia5c5S60jHA0Myo1LZ+eI1/gSTvoh6oqX0Di3opVADSGbsL40g9VrsrZPqwDru4L
 oW7fXVstU+qbWppeWy3uj6Qm26BpDvaxApu5vclsml9x6AB7bjIIJHNB0/OGBBWtZa+VI2o7+zZ
 spFbQET0ONVINGg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add documentation examples showing various ways to use hrtimers:

- Box-allocated timers with shared state in Arc.
- Arc-allocated timers.
- Stack-based timers for scoped usage.
- Mutable stack-based timers with shared state.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs | 327 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 327 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 856d2d929a008..6ca198947b679 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -66,6 +66,333 @@
 //!
 //! A `restart` operation on a timer in the **stopped** state is equivalent to a
 //! `start` operation.
+//!
+//! When a type implements both `HrTimerPointer` and `Clone`, it is possible to
+//! issue the `start` operation while the timer is in the **started** state. In
+//! this case the `start` operation is equivalent to the `restart` operation.
+//!
+//! # Examples
+//!
+//! ## Using an intrusive timer living in a [`Box`]
+//!
+//! ```
+//! # use kernel::{
+//! #     alloc::flags,
+//! #     impl_has_hr_timer,
+//! #     prelude::*,
+//! #     sync::{
+//! #         atomic::{ordering, Atomic},
+//! #         completion::Completion,
+//! #         Arc,
+//! #     },
+//! #     time::{
+//! #         hrtimer::{
+//! #             RelativeMode, HrTimer, HrTimerCallback, HrTimerPointer,
+//! #             HrTimerRestart, HrTimerCallbackContext
+//! #         },
+//! #         Delta, Monotonic,
+//! #     },
+//! # };
+//!
+//! #[pin_data]
+//! struct Shared {
+//!     #[pin]
+//!     flag: Atomic<u64>,
+//!     #[pin]
+//!     cond: Completion,
+//! }
+//!
+//! impl Shared {
+//!     fn new() -> impl PinInit<Self, kernel::error::Error> {
+//!         try_pin_init!(Self {
+//!             flag <- Atomic::new(0),
+//!             cond <- Completion::new(),
+//!         })
+//!     }
+//! }
+//!
+//! #[pin_data]
+//! struct BoxIntrusiveHrTimer {
+//!     #[pin]
+//!     timer: HrTimer<Self>,
+//!     shared: Arc<Shared>,
+//! }
+//!
+//! impl BoxIntrusiveHrTimer {
+//!     fn new() -> impl PinInit<Self, kernel::error::Error> {
+//!         try_pin_init!(Self {
+//!             timer <- HrTimer::new(),
+//!             shared: Arc::pin_init(Shared::new(), flags::GFP_KERNEL).unwrap(),
+//!         })
+//!     }
+//! }
+//!
+//! impl HrTimerCallback for BoxIntrusiveHrTimer {
+//!     type Pointer<'a> = Pin<KBox<Self>>;
+//!
+//!     fn run(this: Pin<&mut Self>, _ctx: HrTimerCallbackContext<'_, Self>) -> HrTimerRestart {
+//!         pr_info!("Timer called\n");
+//!         let flag = this.shared.flag.fetch_add(1, ordering::Full);
+//!         this.shared.cond.complete_all();
+//!         if flag == 4 {
+//!             HrTimerRestart::NoRestart
+//!         } else {
+//!             HrTimerRestart::Restart
+//!         }
+//!     }
+//! }
+//!
+//! impl_has_hr_timer! {
+//!     impl HasHrTimer<Self> for BoxIntrusiveHrTimer {
+//!         mode: RelativeMode<Monotonic>, field: self.timer
+//!     }
+//! }
+//!
+//! let has_timer = Box::pin_init(BoxIntrusiveHrTimer::new(), GFP_KERNEL)?;
+//! let shared = has_timer.shared.clone();
+//! let _handle = has_timer.start(Delta::from_micros(200));
+//!
+//! while shared.flag.load(ordering::Relaxed) != 5 {
+//!     shared.cond.wait_for_completion();
+//! }
+//!
+//! pr_info!("Counted to 5\n");
+//! # Ok::<(), kernel::error::Error>(())
+//! ```
+//!
+//! ## An intrusive timer in an [`Arc`]
+//!
+//! ```
+//! # use kernel::{
+//! #     alloc::flags,
+//! #     impl_has_hr_timer,
+//! #     prelude::*,
+//! #     sync::{
+//! #         atomic::{ordering, Atomic},
+//! #         completion::Completion,
+//! #         Arc, ArcBorrow,
+//! #     },
+//! #     time::{
+//! #         hrtimer::{
+//! #             RelativeMode, HrTimer, HrTimerCallback, HrTimerPointer, HrTimerRestart,
+//! #             HasHrTimer, HrTimerCallbackContext
+//! #         },
+//! #         Delta, Monotonic,
+//! #     },
+//! # };
+//!
+//! #[pin_data]
+//! struct ArcIntrusiveHrTimer {
+//!     #[pin]
+//!     timer: HrTimer<Self>,
+//!     #[pin]
+//!     flag: Atomic<u64>,
+//!     #[pin]
+//!     cond: Completion,
+//! }
+//!
+//! impl ArcIntrusiveHrTimer {
+//!     fn new() -> impl PinInit<Self, kernel::error::Error> {
+//!         try_pin_init!(Self {
+//!             timer <- HrTimer::new(),
+//!             flag <- Atomic::new(0),
+//!             cond <- Completion::new(),
+//!         })
+//!     }
+//! }
+//!
+//! impl HrTimerCallback for ArcIntrusiveHrTimer {
+//!     type Pointer<'a> = Arc<Self>;
+//!
+//!     fn run(
+//!         this: ArcBorrow<'_, Self>,
+//!         _ctx: HrTimerCallbackContext<'_, Self>,
+//!     ) -> HrTimerRestart {
+//!         pr_info!("Timer called\n");
+//!         let flag = this.flag.fetch_add(1, ordering::Full);
+//!         this.cond.complete_all();
+//!         if flag == 4 {
+//!             HrTimerRestart::NoRestart
+//!         } else {
+//!             HrTimerRestart::Restart
+//!         }
+//!     }
+//! }
+//!
+//! impl_has_hr_timer! {
+//!     impl HasHrTimer<Self> for ArcIntrusiveHrTimer {
+//!         mode: RelativeMode<Monotonic>, field: self.timer
+//!     }
+//! }
+//!
+//! let has_timer = Arc::pin_init(ArcIntrusiveHrTimer::new(), GFP_KERNEL)?;
+//! let _handle = has_timer.clone().start(Delta::from_micros(200));
+//!
+//! while has_timer.flag.load(ordering::Relaxed) != 5 {
+//!     has_timer.cond.wait_for_completion();
+//! }
+//!
+//! pr_info!("Counted to 5\n");
+//! # Ok::<(), kernel::error::Error>(())
+//! ```
+//!
+//! ## Using a stack-based timer
+//!
+//! ```
+//! # use kernel::{
+//! #     impl_has_hr_timer,
+//! #     prelude::*,
+//! #     sync::{
+//! #         atomic::{ordering, Atomic},
+//! #         completion::Completion,
+//! #     },
+//! #     time::{
+//! #         hrtimer::{
+//! #             ScopedHrTimerPointer, HrTimer, HrTimerCallback, HrTimerPointer, HrTimerRestart,
+//! #             HasHrTimer, RelativeMode, HrTimerCallbackContext
+//! #         },
+//! #         Delta, Monotonic,
+//! #     },
+//! # };
+//! # use pin_init::stack_try_pin_init;
+//!
+//! #[pin_data]
+//! struct IntrusiveHrTimer {
+//!     #[pin]
+//!     timer: HrTimer<Self>,
+//!     #[pin]
+//!     flag: Atomic<u64>,
+//!     #[pin]
+//!     cond: Completion,
+//! }
+//!
+//! impl IntrusiveHrTimer {
+//!     fn new() -> impl PinInit<Self, kernel::error::Error> {
+//!         try_pin_init!(Self {
+//!             timer <- HrTimer::new(),
+//!             flag <- Atomic::new(0),
+//!             cond <- Completion::new(),
+//!         })
+//!     }
+//! }
+//!
+//! impl HrTimerCallback for IntrusiveHrTimer {
+//!     type Pointer<'a> = Pin<&'a Self>;
+//!
+//!     fn run(this: Pin<&Self>, _ctx: HrTimerCallbackContext<'_, Self>) -> HrTimerRestart {
+//!         pr_info!("Timer called\n");
+//!         this.flag.store(1, ordering::Release);
+//!         this.cond.complete_all();
+//!         HrTimerRestart::NoRestart
+//!     }
+//! }
+//!
+//! impl_has_hr_timer! {
+//!     impl HasHrTimer<Self> for IntrusiveHrTimer {
+//!         mode: RelativeMode<Monotonic>, field: self.timer
+//!     }
+//! }
+//!
+//! stack_try_pin_init!( let has_timer =? IntrusiveHrTimer::new() );
+//! has_timer.as_ref().start_scoped(Delta::from_micros(200), || {
+//!     while has_timer.flag.load(ordering::Relaxed) != 1 {
+//!         has_timer.cond.wait_for_completion();
+//!     }
+//! });
+//!
+//! pr_info!("Flag raised\n");
+//! # Ok::<(), kernel::error::Error>(())
+//! ```
+//!
+//! ## Using a mutable stack-based timer
+//!
+//! ```
+//! # use kernel::{
+//! #     alloc::flags,
+//! #     impl_has_hr_timer,
+//! #     prelude::*,
+//! #     sync::{
+//! #         atomic::{ordering, Atomic},
+//! #         completion::Completion,
+//! #         Arc,
+//! #     },
+//! #     time::{
+//! #         hrtimer::{
+//! #             ScopedHrTimerPointer, HrTimer, HrTimerCallback, HrTimerPointer, HrTimerRestart,
+//! #             HasHrTimer, RelativeMode, HrTimerCallbackContext
+//! #         },
+//! #         Delta, Monotonic,
+//! #     },
+//! # };
+//! # use pin_init::stack_try_pin_init;
+//!
+//! #[pin_data]
+//! struct Shared {
+//!     #[pin]
+//!     flag: Atomic<u64>,
+//!     #[pin]
+//!     cond: Completion,
+//! }
+//!
+//! impl Shared {
+//!     fn new() -> impl PinInit<Self, kernel::error::Error> {
+//!         try_pin_init!(Self {
+//!             flag <- Atomic::new(0),
+//!             cond <- Completion::new(),
+//!         })
+//!     }
+//! }
+//!
+//! #[pin_data]
+//! struct IntrusiveHrTimer {
+//!     #[pin]
+//!     timer: HrTimer<Self>,
+//!     shared: Arc<Shared>,
+//! }
+//!
+//! impl IntrusiveHrTimer {
+//!     fn new() -> impl PinInit<Self, kernel::error::Error> {
+//!         try_pin_init!(Self {
+//!             timer <- HrTimer::new(),
+//!             shared: Arc::pin_init(Shared::new(), flags::GFP_KERNEL).unwrap(),
+//!         })
+//!     }
+//! }
+//!
+//! impl HrTimerCallback for IntrusiveHrTimer {
+//!     type Pointer<'a> = Pin<&'a mut Self>;
+//!
+//!     fn run(this: Pin<&mut Self>, _ctx: HrTimerCallbackContext<'_, Self>) -> HrTimerRestart {
+//!         pr_info!("Timer called\n");
+//!         let flag = this.shared.flag.fetch_add(1, ordering::Full);
+//!         this.shared.cond.complete_all();
+//!         if flag == 4 {
+//!             HrTimerRestart::NoRestart
+//!         } else {
+//!             HrTimerRestart::Restart
+//!         }
+//!     }
+//! }
+//!
+//! impl_has_hr_timer! {
+//!     impl HasHrTimer<Self> for IntrusiveHrTimer {
+//!         mode: RelativeMode<Monotonic>, field: self.timer
+//!     }
+//! }
+//!
+//! stack_try_pin_init!( let has_timer =? IntrusiveHrTimer::new() );
+//! let shared = has_timer.shared.clone();
+//! has_timer.as_mut().start_scoped(Delta::from_micros(200), || {
+//!     while shared.flag.load(ordering::Relaxed) != 5 {
+//!         shared.cond.wait_for_completion();
+//!     }
+//! });
+//!
+//! pr_info!("Counted to 5\n");
+//! # Ok::<(), kernel::error::Error>(())
+//! ```
+//!
+//! [`Arc`]: kernel::sync::Arc
 
 use super::{ClockSource, Delta, Instant};
 use crate::{prelude::*, types::Opaque};

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251215-hrtimer-examples-v6-19-rc1-2658ce9bb5d0

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


