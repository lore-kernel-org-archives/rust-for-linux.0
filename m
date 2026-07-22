Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671C42571A9
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 00:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784679134; cv=none; b=eBzrbf/IqUc2BtsrXhauObysXN2B/FhPFJ3tVdy7FjEBHj5ZQwumPZqE2jjyea8NZl9kcGKzgHh2lGtvehyM3z0igVR6gNS/SKdbfDteY3973oCTY7YAkvv4Jm4Z48LkwIXWsX7jesI5k33kDLfpHYboJqofTshlZHliUw+wRhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784679134; c=relaxed/simple;
	bh=zTB+7I0r95TLpPdeiylW2iKxSQhVxp5Q9xolls7wJ2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ht5klrTnhtdCZyC7dA02ePf9vYnTjGA8vuNuX9jsIMxFiVp7XmIFuGgY1rKdIhYHfiTFOatSzGMhbsnZCaVtWJzhg+JvksfXpcKLB4b9xQboN0hKpYAEIuALBZpN6ezZH8+RU55t267pOp2SJdwzYu+xKZ0EFNZ0a4dRDb2c25E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=LuB/RBmr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GbBSoitn; arc=none smtp.client-ip=202.12.124.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="LuB/RBmr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GbBSoitn"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id D5E1E13000CF;
	Tue, 21 Jul 2026 20:12:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 21 Jul 2026 20:12:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1784679130; x=1784682730; bh=oUgvEbjb709wfobHaCXZp
	NRj8+rnKSAxmPrG6Df1DWw=; b=LuB/RBmrhtJkJ9Qhp6tFXkITzPwEvdkMO9CI/
	+YeMPCmjPwiLsNts6yeIDtv3EI4zxAhuV32U3xaP/vBSLO8ojTGYkaiqb/1DrrQa
	t5N6qZ7Rgbc3N8mtrzBRAvDPfI0fZNautxR8cGEgvGyyQYb1UpMczFR7NpQqqDnL
	n98Ov32FNP7ikoFaBWL8Tyba8wby3rU4aWjRBag5H46g+4OJKYUXTJF2Dh654RKD
	v9asrUdZ32rRG7XwQFtl+JhovsfHPpWtusvhq+CzFoJXy1oiOFSXRGWrdCTWWl6q
	LHYKDbmmDsS5VSxYw1V37hGr2qIrwegq2hv51OoEiW78bGk+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784679130; x=1784682730; bh=oUgvEbjb709wfobHaCXZpNRj8+rnKSAxmPr
	G6Df1DWw=; b=GbBSoitnYoMhP/n77rWSXarX7/TpKgkI7zrUltfCpM/VxdmKuCt
	8L7r8iSAGCYKE89twCm/W3HPwks5B1dqSCXXO47Y/ZF+gdAEN4of6Pc7w98c4gVM
	DV5jbeORlZDjek6JFJyBqLRkTyMhJy7ZfDQLfWwN1jl0kQj7IEXd2TX+l+E5uNW/
	zJSxXDZ6bBHwedbG1LbXal26h51nc/UZIZWoHhfW9cezpKcmqbcYEamnVyWW5Rih
	s8/D+o+h8rD7yvQDaiBGSi3DUyU8iFYn+88jmTItgyFQ/KlpOf6+ecf9YKPl44EI
	pJlAQnj++hF5j9qml0HeWqBAnKRNd7qH82g==
X-ME-Sender: <xms:2gpgaiiGbjRtB4Dc1pNhFcF3XHFT8RdxRcDkAuSDywAQ7MOQZjjJFA>
    <xme:2gpgau5deth9mtruss0Cq8uMv1-1nGQLm2obrLenzk3as-aBmG7uV4AUSN-sGj9_s
    2_Etq9QIfOk29QTL0Ixto48Qa7Er8VkJBJLeCmwKKFQV-ZMWOXY4H8>
X-ME-Received: <xmr:2gpgalm5-SAA5a0CZmq22zYtO-AbnUpmU8dir8__WFTsDToZLBvnQMfLfIaQB4cskJ0XMPccKU-Z45Xn6bQ>
X-ME-Proxy-Cause: dmFkZTF96yeq+KGQ/2n7H1hNQHXNDXt3vq/FHmIQAlzUsLNHWarX4/yeFobQ9NA1LT7apS
    Ni2t/IoMLgZZ6lj2vpg0FUmEnl/hdRsGodFPkDb3vGL+7/+ns6JAE5WJw0nRvOA0vGvaIE
    vtXIokJq7e2+K9uTB6uEWiK+E1QDMI4ULiyH+ig65qPQc1h+jgY+h7km4N4O7jhUrFdCvI
    /SeKpUkSyU9M6gVEk335MjwtVmPSzbPLlau6/1bDaXyXNkUhgDcEwXgnKApXdYEzMAiJZ6
    nfN7cLgTpVLV3A9KEeLqjQMeCCqkfAHq49oG1QQcA9fOFvyfqOc0fErCLxC9sRc4nzWPLh
    +UwktSLH+7kdnsb/S3NfS+Cjd+gh9/hI2AGTQIc1817WzZHQFgSWnDh3u81gAPOGOHvuGG
    DuSGs0hMkYfBa7iHlwda4FPgt7AcTNIO822QoevbNxShcsL9ZjXANNPGGiu28BOYso0+4D
    nkvtHzKJsOGyKDtzfAmnqDA0VtJ6oQiNqrnXRbHbNrf1Vdi6ki0FDVfwOndZN3cvAHH+rb
    dbphsX57cGWNqU01r4acmI3pqnc1Voj50vO7/7CGZ4rQkhx4jpjpvkwiR63nTGL9v+ckef
    vdNlwtPK08Xn73JUkR6uA9NVfveMH9m30eqUlxSNtM8pQLm/U/DYuqQGxTSg
X-ME-Proxy: <xmx:2gpgavPKWMZqoihvZ-cpIgc-MHNfQ3RR0Z5Wt692YuBKRV4Q1VzxqQ>
    <xmx:2gpganp0lIfOTP1PmZs0xJc7zw-2vnVODk2kH44XFgGLsrv_cJqZYQ>
    <xmx:2gpgaovKrgfoC_JWG5ya36orDu8vqREGOnRwBjotnJPXsXk_NfOeDQ>
    <xmx:2gpgar5AU5sZFQTu2CTuZ_Qjvz-9tnZtJpHa454eKTFTdzA2f5TSpg>
    <xmx:2gpgagvN04EwmzHXsl2HqF2pGzsFyTPgYnnz2X6BxW7J50YIyqc1kAfX>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jul 2026 20:12:05 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	ojeda@kernel.org,
	jstultz@google.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1] rust: time: rename ClockSource trait to ClockId
Date: Wed, 22 Jul 2026 09:10:50 +0900
Message-ID: <20260722001050.4115708-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

The `ClockSource` trait has nothing to do with the C `struct clocksource`
in `include/linux/clocksource.h`, which abstracts the hardware counter
used as a source of time for the majority of the clockids. The trait
instead carries a `clockid_t` `ID`, i.e. one of the IDs of "the various
system clocks (for POSIX.1b interval timers)" as described in
include/uapi/linux/time.h (CLOCK_MONOTONIC, CLOCK_REALTIME, ...). It thus
plays the role of a `clockid_t`, and the `ClockSource` name overlaps
confusingly with the C `clocksource` concept when reading across C and
Rust code.

Rename the trait to `ClockId` to reflect that it represents a
`clockid_t`. This is a pure rename; there is no functional change.

Suggested-by: John Stultz <jstultz@google.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Link: https://lore.kernel.org/rust-for-linux/CANDhNCrKMdHCmL76LWCROVF2Ly-9NxmfmQ2T+P=iv34aVkO2uQ@mail.gmail.com/
---
 rust/kernel/time.rs         | 34 +++++++--------
 rust/kernel/time/hrtimer.rs | 82 ++++++++++++++++++-------------------
 2 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 363e93cbb139..4fecab6692b6 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -53,9 +53,9 @@ pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
     unsafe { bindings::__msecs_to_jiffies(msecs) }
 }
 
-/// Trait for clock sources.
+/// Trait for kernel clock identifiers.
 ///
-/// Selection of the clock source depends on the use case. In some cases the usage of a
+/// Selection of the clock depends on the use case. In some cases the usage of a
 /// particular clock is mandatory, e.g. in network protocols, filesystems. In other
 /// cases the user of the clock has to decide which clock is best suited for the
 /// purpose. In most scenarios clock [`Monotonic`] is the best choice as it
@@ -66,13 +66,13 @@ pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
 /// Implementers must ensure that `ktime_get()` returns a value in the inclusive range
 /// `0..=KTIME_MAX` (i.e., greater than or equal to 0 and less than or equal to
 /// `KTIME_MAX`, where `KTIME_MAX` equals `i64::MAX`).
-pub unsafe trait ClockSource {
-    /// The kernel clock ID associated with this clock source.
+pub unsafe trait ClockId {
+    /// The kernel clock ID associated with this clock.
     ///
     /// This constant corresponds to the C side `clockid_t` value.
     const ID: bindings::clockid_t;
 
-    /// Get the current time from the clock source.
+    /// Get the current time from the clock.
     ///
     /// The function must return a value in the range `0..=KTIME_MAX`.
     fn ktime_get() -> bindings::ktime_t;
@@ -93,7 +93,7 @@ pub unsafe trait ClockSource {
 
 // SAFETY: The kernel's `ktime_get()` is guaranteed to return a value
 // in `0..=KTIME_MAX`.
-unsafe impl ClockSource for Monotonic {
+unsafe impl ClockId for Monotonic {
     const ID: bindings::clockid_t = bindings::CLOCK_MONOTONIC as bindings::clockid_t;
 
     fn ktime_get() -> bindings::ktime_t {
@@ -120,7 +120,7 @@ fn ktime_get() -> bindings::ktime_t {
 
 // SAFETY: The kernel's `ktime_get_real()` is guaranteed to return a value
 // in `0..=KTIME_MAX`.
-unsafe impl ClockSource for RealTime {
+unsafe impl ClockId for RealTime {
     const ID: bindings::clockid_t = bindings::CLOCK_REALTIME as bindings::clockid_t;
 
     fn ktime_get() -> bindings::ktime_t {
@@ -140,7 +140,7 @@ fn ktime_get() -> bindings::ktime_t {
 
 // SAFETY: The kernel's `ktime_get_boottime()` is guaranteed to return a value
 // in `0..=KTIME_MAX`.
-unsafe impl ClockSource for BootTime {
+unsafe impl ClockId for BootTime {
     const ID: bindings::clockid_t = bindings::CLOCK_BOOTTIME as bindings::clockid_t;
 
     fn ktime_get() -> bindings::ktime_t {
@@ -164,7 +164,7 @@ fn ktime_get() -> bindings::ktime_t {
 
 // SAFETY: The kernel's `ktime_get_clocktai()` is guaranteed to return a value
 // in `0..=KTIME_MAX`.
-unsafe impl ClockSource for Tai {
+unsafe impl ClockId for Tai {
     const ID: bindings::clockid_t = bindings::CLOCK_TAI as bindings::clockid_t;
 
     fn ktime_get() -> bindings::ktime_t {
@@ -180,24 +180,24 @@ fn ktime_get() -> bindings::ktime_t {
 /// The `inner` value is in the range from 0 to `KTIME_MAX`.
 #[repr(transparent)]
 #[derive(PartialEq, PartialOrd, Eq, Ord)]
-pub struct Instant<C: ClockSource> {
+pub struct Instant<C: ClockId> {
     inner: bindings::ktime_t,
     _c: PhantomData<C>,
 }
 
-impl<C: ClockSource> Clone for Instant<C> {
+impl<C: ClockId> Clone for Instant<C> {
     fn clone(&self) -> Self {
         *self
     }
 }
 
-impl<C: ClockSource> Copy for Instant<C> {}
+impl<C: ClockId> Copy for Instant<C> {}
 
-impl<C: ClockSource> Instant<C> {
+impl<C: ClockId> Instant<C> {
     /// Get the current time from the clock source.
     #[inline]
     pub fn now() -> Self {
-        // INVARIANT: The `ClockSource::ktime_get()` function returns a value in the range
+        // INVARIANT: The `ClockId::ktime_get()` function returns a value in the range
         // from 0 to `KTIME_MAX`.
         Self {
             inner: C::ktime_get(),
@@ -239,7 +239,7 @@ pub(crate) unsafe fn from_ktime(ktime: bindings::ktime_t) -> Self {
     }
 }
 
-impl<C: ClockSource> ops::Sub for Instant<C> {
+impl<C: ClockId> ops::Sub for Instant<C> {
     type Output = Delta;
 
     // By the type invariant, it never overflows.
@@ -251,7 +251,7 @@ fn sub(self, other: Instant<C>) -> Delta {
     }
 }
 
-impl<T: ClockSource> ops::Add<Delta> for Instant<T> {
+impl<T: ClockId> ops::Add<Delta> for Instant<T> {
     type Output = Self;
 
     #[inline]
@@ -271,7 +271,7 @@ fn add(self, rhs: Delta) -> Self::Output {
     }
 }
 
-impl<T: ClockSource> ops::Sub<Delta> for Instant<T> {
+impl<T: ClockId> ops::Sub<Delta> for Instant<T> {
     type Output = Self;
 
     #[inline]
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 2d7f1131a813..87aafbee0ce9 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -403,14 +403,14 @@
 //!
 //! [`Arc`]: kernel::sync::Arc
 
-use super::{ClockSource, Delta, Instant};
+use super::{ClockId, Delta, Instant};
 use crate::{prelude::*, types::Opaque};
 use core::{marker::PhantomData, ptr::NonNull};
 use pin_init::PinInit;
 
 /// A type-alias to refer to the [`Instant<C>`] for a given `T` from [`HrTimer<T>`].
 ///
-/// Where `C` is the [`ClockSource`] of the [`HrTimer`].
+/// Where `C` is the [`ClockId`] of the [`HrTimer`].
 pub type HrTimerInstant<T> = Instant<<<T as HasHrTimer<T>>::TimerMode as HrTimerMode>::Clock>;
 
 /// A timer backed by a C `struct hrtimer`.
@@ -855,7 +855,7 @@ pub trait HrTimerExpires {
     fn as_nanos(&self) -> i64;
 }
 
-impl<C: ClockSource> HrTimerExpires for Instant<C> {
+impl<C: ClockId> HrTimerExpires for Instant<C> {
     #[inline]
     fn as_nanos(&self) -> i64 {
         Instant::<C>::as_nanos(self)
@@ -870,22 +870,22 @@ fn as_nanos(&self) -> i64 {
 }
 
 mod private {
-    use crate::time::ClockSource;
+    use crate::time::ClockId;
 
     pub trait Sealed {}
 
-    impl<C: ClockSource> Sealed for super::AbsoluteMode<C> {}
-    impl<C: ClockSource> Sealed for super::RelativeMode<C> {}
-    impl<C: ClockSource> Sealed for super::AbsolutePinnedMode<C> {}
-    impl<C: ClockSource> Sealed for super::RelativePinnedMode<C> {}
-    impl<C: ClockSource> Sealed for super::AbsoluteSoftMode<C> {}
-    impl<C: ClockSource> Sealed for super::RelativeSoftMode<C> {}
-    impl<C: ClockSource> Sealed for super::AbsolutePinnedSoftMode<C> {}
-    impl<C: ClockSource> Sealed for super::RelativePinnedSoftMode<C> {}
-    impl<C: ClockSource> Sealed for super::AbsoluteHardMode<C> {}
-    impl<C: ClockSource> Sealed for super::RelativeHardMode<C> {}
-    impl<C: ClockSource> Sealed for super::AbsolutePinnedHardMode<C> {}
-    impl<C: ClockSource> Sealed for super::RelativePinnedHardMode<C> {}
+    impl<C: ClockId> Sealed for super::AbsoluteMode<C> {}
+    impl<C: ClockId> Sealed for super::RelativeMode<C> {}
+    impl<C: ClockId> Sealed for super::AbsolutePinnedMode<C> {}
+    impl<C: ClockId> Sealed for super::RelativePinnedMode<C> {}
+    impl<C: ClockId> Sealed for super::AbsoluteSoftMode<C> {}
+    impl<C: ClockId> Sealed for super::RelativeSoftMode<C> {}
+    impl<C: ClockId> Sealed for super::AbsolutePinnedSoftMode<C> {}
+    impl<C: ClockId> Sealed for super::RelativePinnedSoftMode<C> {}
+    impl<C: ClockId> Sealed for super::AbsoluteHardMode<C> {}
+    impl<C: ClockId> Sealed for super::RelativeHardMode<C> {}
+    impl<C: ClockId> Sealed for super::AbsolutePinnedHardMode<C> {}
+    impl<C: ClockId> Sealed for super::RelativePinnedHardMode<C> {}
 }
 
 /// Operational mode of [`HrTimer`].
@@ -894,16 +894,16 @@ pub trait HrTimerMode: private::Sealed {
     const C_MODE: bindings::hrtimer_mode;
 
     /// Type representing the clock source.
-    type Clock: ClockSource;
+    type Clock: ClockId;
 
     /// Type representing the expiration specification (absolute or relative time).
     type Expires: HrTimerExpires;
 }
 
 /// Timer that expires at a fixed point in time.
-pub struct AbsoluteMode<C: ClockSource>(PhantomData<C>);
+pub struct AbsoluteMode<C: ClockId>(PhantomData<C>);
 
-impl<C: ClockSource> HrTimerMode for AbsoluteMode<C> {
+impl<C: ClockId> HrTimerMode for AbsoluteMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS;
 
     type Clock = C;
@@ -911,9 +911,9 @@ impl<C: ClockSource> HrTimerMode for AbsoluteMode<C> {
 }
 
 /// Timer that expires after a delay from now.
-pub struct RelativeMode<C: ClockSource>(PhantomData<C>);
+pub struct RelativeMode<C: ClockId>(PhantomData<C>);
 
-impl<C: ClockSource> HrTimerMode for RelativeMode<C> {
+impl<C: ClockId> HrTimerMode for RelativeMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL;
 
     type Clock = C;
@@ -921,8 +921,8 @@ impl<C: ClockSource> HrTimerMode for RelativeMode<C> {
 }
 
 /// Timer with absolute expiration time, pinned to its current CPU.
-pub struct AbsolutePinnedMode<C: ClockSource>(PhantomData<C>);
-impl<C: ClockSource> HrTimerMode for AbsolutePinnedMode<C> {
+pub struct AbsolutePinnedMode<C: ClockId>(PhantomData<C>);
+impl<C: ClockId> HrTimerMode for AbsolutePinnedMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_PINNED;
 
     type Clock = C;
@@ -930,8 +930,8 @@ impl<C: ClockSource> HrTimerMode for AbsolutePinnedMode<C> {
 }
 
 /// Timer with relative expiration time, pinned to its current CPU.
-pub struct RelativePinnedMode<C: ClockSource>(PhantomData<C>);
-impl<C: ClockSource> HrTimerMode for RelativePinnedMode<C> {
+pub struct RelativePinnedMode<C: ClockId>(PhantomData<C>);
+impl<C: ClockId> HrTimerMode for RelativePinnedMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_PINNED;
 
     type Clock = C;
@@ -939,8 +939,8 @@ impl<C: ClockSource> HrTimerMode for RelativePinnedMode<C> {
 }
 
 /// Timer with absolute expiration, handled in soft irq context.
-pub struct AbsoluteSoftMode<C: ClockSource>(PhantomData<C>);
-impl<C: ClockSource> HrTimerMode for AbsoluteSoftMode<C> {
+pub struct AbsoluteSoftMode<C: ClockId>(PhantomData<C>);
+impl<C: ClockId> HrTimerMode for AbsoluteSoftMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_SOFT;
 
     type Clock = C;
@@ -948,8 +948,8 @@ impl<C: ClockSource> HrTimerMode for AbsoluteSoftMode<C> {
 }
 
 /// Timer with relative expiration, handled in soft irq context.
-pub struct RelativeSoftMode<C: ClockSource>(PhantomData<C>);
-impl<C: ClockSource> HrTimerMode for RelativeSoftMode<C> {
+pub struct RelativeSoftMode<C: ClockId>(PhantomData<C>);
+impl<C: ClockId> HrTimerMode for RelativeSoftMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_SOFT;
 
     type Clock = C;
@@ -957,8 +957,8 @@ impl<C: ClockSource> HrTimerMode for RelativeSoftMode<C> {
 }
 
 /// Timer with absolute expiration, pinned to CPU and handled in soft irq context.
-pub struct AbsolutePinnedSoftMode<C: ClockSource>(PhantomData<C>);
-impl<C: ClockSource> HrTimerMode for AbsolutePinnedSoftMode<C> {
+pub struct AbsolutePinnedSoftMode<C: ClockId>(PhantomData<C>);
+impl<C: ClockId> HrTimerMode for AbsolutePinnedSoftMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_PINNED_SOFT;
 
     type Clock = C;
@@ -966,8 +966,8 @@ impl<C: ClockSource> HrTimerMode for AbsolutePinnedSoftMode<C> {
 }
 
 /// Timer with absolute expiration, pinned to CPU and handled in soft irq context.
-pub struct RelativePinnedSoftMode<C: ClockSource>(PhantomData<C>);
-impl<C: ClockSource> HrTimerMode for RelativePinnedSoftMode<C> {
+pub struct RelativePinnedSoftMode<C: ClockId>(PhantomData<C>);
+impl<C: ClockId> HrTimerMode for RelativePinnedSoftMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_PINNED_SOFT;
 
     type Clock = C;
@@ -975,8 +975,8 @@ impl<C: ClockSource> HrTimerMode for RelativePinnedSoftMode<C> {
 }
 
 /// Timer with absolute expiration, handled in hard irq context.
-pub struct AbsoluteHardMode<C: ClockSource>(PhantomData<C>);
-impl<C: ClockSource> HrTimerMode for AbsoluteHardMode<C> {
+pub struct AbsoluteHardMode<C: ClockId>(PhantomData<C>);
+impl<C: ClockId> HrTimerMode for AbsoluteHardMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_HARD;
 
     type Clock = C;
@@ -984,8 +984,8 @@ impl<C: ClockSource> HrTimerMode for AbsoluteHardMode<C> {
 }
 
 /// Timer with relative expiration, handled in hard irq context.
-pub struct RelativeHardMode<C: ClockSource>(PhantomData<C>);
-impl<C: ClockSource> HrTimerMode for RelativeHardMode<C> {
+pub struct RelativeHardMode<C: ClockId>(PhantomData<C>);
+impl<C: ClockId> HrTimerMode for RelativeHardMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_HARD;
 
     type Clock = C;
@@ -993,8 +993,8 @@ impl<C: ClockSource> HrTimerMode for RelativeHardMode<C> {
 }
 
 /// Timer with absolute expiration, pinned to CPU and handled in hard irq context.
-pub struct AbsolutePinnedHardMode<C: ClockSource>(PhantomData<C>);
-impl<C: ClockSource> HrTimerMode for AbsolutePinnedHardMode<C> {
+pub struct AbsolutePinnedHardMode<C: ClockId>(PhantomData<C>);
+impl<C: ClockId> HrTimerMode for AbsolutePinnedHardMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_PINNED_HARD;
 
     type Clock = C;
@@ -1002,8 +1002,8 @@ impl<C: ClockSource> HrTimerMode for AbsolutePinnedHardMode<C> {
 }
 
 /// Timer with relative expiration, pinned to CPU and handled in hard irq context.
-pub struct RelativePinnedHardMode<C: ClockSource>(PhantomData<C>);
-impl<C: ClockSource> HrTimerMode for RelativePinnedHardMode<C> {
+pub struct RelativePinnedHardMode<C: ClockId>(PhantomData<C>);
+impl<C: ClockId> HrTimerMode for RelativePinnedHardMode<C> {
     const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_PINNED_HARD;
 
     type Clock = C;

base-commit: 7059bdf4f04a3e14f4fafb3ac35fdca913e3e21a
-- 
2.43.0

