Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0E027EFE9;
	Thu, 19 Feb 2026 11:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771502291; cv=none; b=WSknNs7/rtd8z8EWP0OpYpGVhQHfxewEQTv7YByVBUctSypqZ8OcyD1JjbL5MkQDWc+4lzF5MyLw/sT/TMIh9E87T5HzsIYFknyKIrGEqJ060xK3SFX8zMLQ4UNnGkZPmEG7N0FTk0It/yxH1jvMsWThrVBiKYcqcnYV47Sqd8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771502291; c=relaxed/simple;
	bh=QZXDc2rJpT9hCdG3Xp4FIwU2qwOY9HPnhtehLOi8tSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oss6wTdePPmsUAPT+iBoIux55baM5B00bjGBkQ+laBxkkVY0cTTJ7c6pBOnyZqrpY1puCLuewB+dyFeoKCiaXhnvMZApmL0/2GjL95GXgUKGpyyr1dZRNspeo3yZB0KtbhMmhDUOCq+VZSY/cPVNpzY07yiG/4LTIDNVotBYLek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmqYn4pj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmqYn4pj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6340EC116C6;
	Thu, 19 Feb 2026 11:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771502290;
	bh=QZXDc2rJpT9hCdG3Xp4FIwU2qwOY9HPnhtehLOi8tSs=;
	h=From:Date:Subject:To:Cc:From;
	b=lmqYn4pjB56IQBFR6mPIFDZKbdk5H+3NtsH3WqO7qfOfTAD88rHspRdPlEsSHAt3M
	 Mb+UV/sJ48B8UyiB0UraExkTKf5Zf/Wa2zf/FB77YzWrnsXx66Das3CGb15YRZ/lag
	 TyeazWbLuz0O1V2PAU5QigZY3AnKOfh594gaCfnc+ipT5pA4rW8ela96oOCmQZdhnJ
	 sAeljkhnrPTYMZzeWla9ftMvU7T9BocXY2h0MFfoOeo7h4Yex532Dvz1eOg6/3K1O9
	 WYcBBRRvgp8E19XaJEQlPKqlRFFdXhgTV2a26uzCMYCFep2PdZBWbrMZwD0mwefBfB
	 h173DRn0tiaug==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 19 Feb 2026 12:57:45 +0100
Subject: [PATCH v2] hrtimer: add usage examples to documentation
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-hrtimer-examples-v6-19-rc1-v2-1-810cc06ca9f6@kernel.org>
X-B4-Tracking: v=1; b=H4sIALj6lmkC/33Nyw6CMBCF4Vchs3ZMp6EgrngPwwLKCI3cMiUNh
 vDuVhK3Lv+z+M4OnsWxh3uyg3Bw3s1TDH1JwPb11DG6NjZopQ1pMtjL6kYW5K0el4E9hgypQLG
 EOjM3y0XTmFZBBBbhp9tO/FHF7p1fZ3mfX4G+64/N/7GBkDCtW8U5pzZlVb5YJh6us3RQHcfxA
 U2ZAh7FAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11003;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=QZXDc2rJpT9hCdG3Xp4FIwU2qwOY9HPnhtehLOi8tSs=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBplvrCxTiPjzsk7neCIC7HuX1R4bS6qEKKJehsY
 qOuwNlxSBSJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZb6wgAKCRDhuBo+eShj
 d7XkD/44BXFvvBUleUv/aj8nYvO6t2kb44DS8XGCRjjrQ0KlCJZvrK3AtX+5tCpCS137/uATWlh
 ix7ho9RpG5JE+pT68yEOEfo2aZtyuWJryqp3HPVliaEToAL6uA8PthP3b4tY5e2a7wJjuB1VfD9
 gyD3eHb77SLvifYfLn+EhWctjo5c1kKkQsD5TWfeUnDCWxMenwxijpWkFC2BZs7bsDxlJAxzDfK
 pdi/G3Sgi0F06wLXh9XcyybXZy7DhtMWDMRK/SjiipD3fvDbt+MEjmcVCcM0B7gYh9OhpQja8Ux
 oe8XgGsrTGXlwimHaO7z9+j0L/s396u3iEJ3+nKZFzioTfOg3bTEEvYemkZBA09i/4o6PB9F+EG
 FLWi3G74pXprOqRmgs3NuSCZxMK7lTjmltAg2CuuQcR0fXQF6FQ/l5qNjza1dsdiuM4Fcp6FafA
 ojWUSkx4rIGTIBn97i54Edo7Yuq+MeUFStCLC0LM7/U1tFq+3fLbhz6/lnd4oIQjoAoV4S9l19y
 0pj2xB3SYMTc9bQ4Z3Jy2iwNH3Lskakm/8A8cDI3CC1XGeTxIRAtwOxPyd4NKUv84bD0RFx9aBs
 xzf1NZBZyTYEpcMSg3veMK0YAjtvuQnywqVZFpLDgWR9FPB5B5k9yAOcfY5q99ocvjAEA1hSgfR
 JQTLwnZQJi5rLUg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add documentation examples showing various ways to use hrtimers:

- Box-allocated timers with shared state in Arc.
- Arc-allocated timers.
- Stack-based timers for scoped usage.
- Mutable stack-based timers with shared state.

Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v2:
- Sprinkle blank lines for readability
- Change heading for Arc example
- Fix error handling.
- Link to v1: https://lore.kernel.org/r/20251217-hrtimer-examples-v6-19-rc1-v1-1-4ad0e7e4c4e0@kernel.org
---
 rust/kernel/time/hrtimer.rs | 336 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 336 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 856d2d929a008..2d7f1131a8131 100644
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
+//! # use pin_init::stack_pin_init;
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


