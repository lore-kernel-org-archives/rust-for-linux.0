Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F92C335564;
	Fri, 20 Feb 2026 08:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771575130; cv=none; b=QABHQUe9cyMrunjCt1sGCyM75nTG/DEl1aXCfkTKXqv8va2zlgwELSZyYEC4x8zJgMgGSa7dyiaIUAHPT3b2ag4lx27eb6V8HE5k8qKqWN/pQ6GfZGuSqe318Jcses5A5kntql9lKWM4b5mfdwr5d0xXMVxrXJF4xDrUXkuKEKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771575130; c=relaxed/simple;
	bh=8qllAnK2E4ExfRqT/ejd3hRkBoAdErW5tI+Astup0Es=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=frHsFlE7JJTg3Oflnd8FulN3E2nNZrYTSEC5FX+46CI7Usw7RQYYMmkY5ZItOza9F2CkC7On18T1/fBiHDxukQ/EprWQki43/ww1sfXMTq1YRgeXhf8cupZcpY7jZkUFGbWCITnRrbRqd+aDjJY/WrlCpQpEZwLCWnJIhAEtyLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyCX/Clz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyCX/Clz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14ACCC116C6;
	Fri, 20 Feb 2026 08:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771575129;
	bh=8qllAnK2E4ExfRqT/ejd3hRkBoAdErW5tI+Astup0Es=;
	h=From:Date:Subject:To:Cc:From;
	b=fyCX/ClzTa7k36FGjMCRodmxYuum0OClaHpAciO/qwqRzun0wnZ6KFiZVC+I+BKBZ
	 Bybani0fEFfHCAMp5KtWBwExCR2IUxCYuA6OcqyU+ykS/+etcj4s9RAPU4NY30qmNI
	 ySSJjMWdeHF9xp/RJwQCYN8uhDoafZMzhcJi82jxUfrDCQUBYZiCv4g/hhdxz2z79W
	 W27YdV7tmTU4XU9TPpmIJxvd36VupCBFdXMVEK773qDRFdiikN3YbBWinxiHQjCx9X
	 2JzbDW9JGoXHE96Nm1/wnK52i2qMXXiYDVz5c42rfWiwIa95cnggvDU9rKjcsep4c1
	 pfPhYGjoFvCZQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 20 Feb 2026 09:11:59 +0100
Subject: [PATCH v3] hrtimer: add usage examples to documentation
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-hrtimer-examples-v6-19-rc1-v3-1-ddfc19a90741@kernel.org>
X-B4-Tracking: v=1; b=H4sIAE4XmGkC/33NTQqDMBCG4auUrDslSU3UrnqP0kWMo4b6x0SCR
 bx7o+CiG5fvB/PMwjySQ88el4URBufd0Me4Xy/MNqavEVwZm0kulZBCQUOT65AAZ9ONLXoIGkQ
 OZAVIrTKLeVGokrMIjISVm3f89Y7dOD8N9N1/BbGtB5uesUGAgMSUHFNMbIL8+UHqsb0NVLPND
 fKwNJfx6MyS0coEt5Zra/JK/1nruv4AQnP/whEBAAA=
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
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=11068;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=8qllAnK2E4ExfRqT/ejd3hRkBoAdErW5tI+Astup0Es=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpmBdPZ/4uwvJMPtOltVgo1Y1A0MV2tzFjx/3q0
 lEn/P0ExeyJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZgXTwAKCRDhuBo+eShj
 dzQZEACnDfXN/Z467Mzv9jDA/FYW2krGxvau7rVL3umJclIEN7UPdbG1PoefhysOEMUEiFWpiD8
 /6d+6r9hlxI4dcqMHwABP9gJ7+PM0FMb79zSkUAZ2HweDqkGOiNh7O/nLCRkqsC+OdmP9fxHjiH
 2RpiyR3Lj5EGjl3NIQdy55RZc1g+SQmrX8d2COSQecz39fgOXmwaY2qEoSuX+iVND0qQT4xh0y2
 8PdDllC31h0CLfWVUEXJioTcjFhdZeidwZ5EYR+Po3qdGthZFD8rFLm9s3jCs2HB/vbEf8XlKwt
 J6aJTK6/7qx4DNbuT+hVOkrgH1u9w6PNgquxk43mWGP4uLVuRQHOOnHhZxYQuYm3yPZ4x/jaIjd
 BTxCi5kaq8OAqaTXvcs3GshZxulVLE3ifBIVk+Yl+6KDaP/YXbaYqyRT3BL0nIFfPrIfMLrnyGZ
 mf8ocWifvtfxz5jv1SB0olrI4QgrxDyC+2B9maeBxSupiPSZg63cngwZ3xOOOk9Wjueus6OYoNv
 2ufWrPOIS2h6FrUdRszpdqCSFcguBSkNXCx8LyP6Rs2AO6ZVxdE6XV/OmygJPl/XUtM8iu7JzCl
 fIMxBi0bSpbDC8hJXX4hYRkjx9b/nmJvVw33CHL/1DrWNkUPKdTsffzfeVXEbk8oNsOiaitJDar
 yD1aUcivf8UTdBg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add documentation examples showing various ways to use hrtimers:

- Box-allocated timers with shared state in Arc.
- Arc-allocated timers.
- Stack-based timers for scoped usage.
- Mutable stack-based timers with shared state.

Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v3:
- Do not hide imports in examples.
- Link to v2: https://msgid.link/20260219-hrtimer-examples-v6-19-rc1-v2-1-810cc06ca9f6@kernel.org

Changes in v2:
- Sprinkle blank lines for readability
- Change heading for Arc example
- Fix error handling.
- Link to v1: https://lore.kernel.org/r/20251217-hrtimer-examples-v6-19-rc1-v1-1-4ad0e7e4c4e0@kernel.org
---
 rust/kernel/time/hrtimer.rs | 336 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 336 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 856d2d929a008..0362bb8492716 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -66,6 +66,342 @@
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
+//! use kernel::{
+//!     alloc::flags,
+//!     impl_has_hr_timer,
+//!     prelude::*,
+//!     sync::{
+//!         atomic::{ordering, Atomic},
+//!         completion::Completion,
+//!         Arc,
+//!     },
+//!     time::{
+//!         hrtimer::{
+//!             RelativeMode, HrTimer, HrTimerCallback, HrTimerPointer,
+//!             HrTimerRestart, HrTimerCallbackContext
+//!         },
+//!         Delta, Monotonic,
+//!     },
+//! };
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
+//!     fn new() -> impl PinInit<Self> {
+//!         pin_init!(Self {
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
+//!             shared: Arc::pin_init(Shared::new(), flags::GFP_KERNEL)?,
+//!         })
+//!     }
+//! }
+//!
+//! impl HrTimerCallback for BoxIntrusiveHrTimer {
+//!     type Pointer<'a> = Pin<KBox<Self>>;
+//!
+//!     fn run(this: Pin<&mut Self>, _ctx: HrTimerCallbackContext<'_, Self>) -> HrTimerRestart {
+//!         pr_info!("Timer called\n");
+//!
+//!         let flag = this.shared.flag.fetch_add(1, ordering::Full);
+//!         this.shared.cond.complete_all();
+//!
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
+//! ## Using an intrusive timer in an [`Arc`]
+//!
+//! ```
+//! use kernel::{
+//!     alloc::flags,
+//!     impl_has_hr_timer,
+//!     prelude::*,
+//!     sync::{
+//!         atomic::{ordering, Atomic},
+//!         completion::Completion,
+//!         Arc, ArcBorrow,
+//!     },
+//!     time::{
+//!         hrtimer::{
+//!             RelativeMode, HrTimer, HrTimerCallback, HrTimerPointer, HrTimerRestart,
+//!             HasHrTimer, HrTimerCallbackContext
+//!         },
+//!         Delta, Monotonic,
+//!     },
+//! };
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
+//!     fn new() -> impl PinInit<Self> {
+//!         pin_init!(Self {
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
+//!
+//!         let flag = this.flag.fetch_add(1, ordering::Full);
+//!         this.cond.complete_all();
+//!
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
+//! use kernel::{
+//!     impl_has_hr_timer,
+//!     prelude::*,
+//!     sync::{
+//!         atomic::{ordering, Atomic},
+//!         completion::Completion,
+//!     },
+//!     time::{
+//!         hrtimer::{
+//!             ScopedHrTimerPointer, HrTimer, HrTimerCallback, HrTimerPointer, HrTimerRestart,
+//!             HasHrTimer, RelativeMode, HrTimerCallbackContext
+//!         },
+//!         Delta, Monotonic,
+//!     },
+//! };
+//! use pin_init::stack_pin_init;
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
+//!     fn new() -> impl PinInit<Self> {
+//!         pin_init!(Self {
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
+//!
+//!         this.flag.store(1, ordering::Release);
+//!         this.cond.complete_all();
+//!
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
+//! stack_pin_init!( let has_timer = IntrusiveHrTimer::new() );
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
+//! use kernel::{
+//!     alloc::flags,
+//!     impl_has_hr_timer,
+//!     prelude::*,
+//!     sync::{
+//!         atomic::{ordering, Atomic},
+//!         completion::Completion,
+//!         Arc,
+//!     },
+//!     time::{
+//!         hrtimer::{
+//!             ScopedHrTimerPointer, HrTimer, HrTimerCallback, HrTimerPointer, HrTimerRestart,
+//!             HasHrTimer, RelativeMode, HrTimerCallbackContext
+//!         },
+//!         Delta, Monotonic,
+//!     },
+//! };
+//! use pin_init::stack_try_pin_init;
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
+//!     fn new() -> impl PinInit<Self> {
+//!         pin_init!(Self {
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
+//!             shared: Arc::pin_init(Shared::new(), flags::GFP_KERNEL)?,
+//!         })
+//!     }
+//! }
+//!
+//! impl HrTimerCallback for IntrusiveHrTimer {
+//!     type Pointer<'a> = Pin<&'a mut Self>;
+//!
+//!     fn run(this: Pin<&mut Self>, _ctx: HrTimerCallbackContext<'_, Self>) -> HrTimerRestart {
+//!         pr_info!("Timer called\n");
+//!
+//!         let flag = this.shared.flag.fetch_add(1, ordering::Full);
+//!         this.shared.cond.complete_all();
+//!
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
+//!
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


