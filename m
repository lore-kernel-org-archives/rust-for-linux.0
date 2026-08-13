Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B40474261
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 13:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628947; cv=none; b=EZ1rd9ydY+FQqN1rxpp2BK6o71Tji23tArS1qc3gruDUKFWlG3kJ6C1w39YfuROzcjwCIYDtOSmkDCd2dDI1XFkx8kM4+qSMyklBpMWzV5DETI57GNJ/djJHtID4QI5b2MjyEHOl0oaHLnXdAQwsREoXkkUaN3q8Mf01QXiCpC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628947; c=relaxed/simple;
	bh=NlmAo9amUf2fFDxGLy/u98HwvmwHn5GIXB0beS6IFlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UYbfjTZ/eAXjNfhwimG9NawW/tCJ39oROngkGjXy+dLS81IyMWVwnF6cOISs8kJzxd5yLdZR73dM6zSPf9seMVTeWFbtYT6AmU8ZoBYmNqHVFwxdOCMQYlCniB2TwE3u/0WCkhCRXbUFhUSx0iH19Pc1UfzdCNxjn8J0LbyMS98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=JUgd/BVs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eYF0iYMt; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="JUgd/BVs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eYF0iYMt"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 3BB2D13004D0;
	Thu, 13 Aug 2026 09:49:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 13 Aug 2026 09:49:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1786628944; x=
	1786632544; bh=PikmuubGux3tfbc10124aAkJPW+rcpun9T/wNugA9lw=; b=J
	Ugd/BVsYdePec1+1sgXyMyqk4oPLKkQUM5gDooZUIcpU8YR8ikbxff2IrqUJUOxn
	Yjh8CNCTyo586W0BqvkjZ7qypMrt61cJdFqyA7w8nwxtyU0D9dyOhcsfN+KwOnZf
	5mbeBYIoDPYsG3zoWl0bOpPq4JV1/qIrAUxnI9TXgGp5BUIEJMuKTCrFXpyqGrFC
	UdyiZSrNYScfcCA/W5Nlsans6odxsb962kBj0/t7k2rrbP6c4b7XN1ppPcQ0A5Hk
	T/dxp0UG82qkNLBoIRb/U1tHhqooJ1IEMKq8q155PIHFHCt0ajx1QrcvHXa8qT2q
	7cHCQgW1VOiB+8h1TyE2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786628944; x=1786632544; bh=P
	ikmuubGux3tfbc10124aAkJPW+rcpun9T/wNugA9lw=; b=eYF0iYMtfgJWpjAjF
	qCFxa2NWRWZcycSj32yID0nYG4DHtcTjdgqJWHTc4XZksD7cSq0Gxk4k7CYjiQqx
	N3N/hFCrtQv3ss4dQWqe9WtHD5WffsCbECY0znthxi3+swCuvPkzC0XNYAcHfBPG
	/tzi0IHnESjZpzZFIwpUsTlC9FGscxo0tlDinbXPXCJMMgc/hgGApLoc7noph5XS
	Yg6R6QSpWNtouqe3aYnCZKX5qOuF2bim7TyrsdUjKvNF96a26c4fWpTMksSbH2jx
	yO2OuVc65qwBIRpjUbKqh5ErtUHcYJ84W9fKSixEVSg8SmL35sp0NxX0cLUIY9+j
	quSfQ==
X-ME-Sender: <xms:T8t9avyWqr71fqTv8vhSUdb3JEIVt8A2wY-CJV7zgfSRz2FaY6CwKA>
    <xme:T8t9ajIAnAYBnFPxXXfCCnJdJhQSSjR3Wwhx-qXMN2yKlZ-MwgGGr7LcCGfERJ-4l
    glERnd8OC8I2arFmHj_Kifd0-Wa2i0L_ggYIbIsSTAxPOacGZj0K0Ep>
X-ME-Received: <xmr:T8t9ak3oxIvBnhUO3HN-ImfhKsDTgryuV1Zgc9jx0PlkX-uOu98t_qb2LpWI2uRYNEWDV5qm5S8bJP_whvI>
X-ME-Proxy-Cause: dmFkZTFHLk8/AeamtiqHNGJg6koFeN3TnQ269jIHIbGihXuRTlLVxZH4M6iiJNi6LcsHSg
    aVLZDAX4WS3j3lRXAvni41LZbWa4VogNxef0JQK00rdER5VJb2q6b2bD9dBwe7KAUZM8k7
    hJ98N1VEAa4h7m2EgYWbgu24hImph09thR7KqCQv42wMjY4jiRUr15ghsRLMJpZmkZAUTs
    KFpyzUj+eZxjrknb7P1h/IOhKXiBlmF1IHonSoetMNCW4py/kh85gvx0cpBG8ojFUTtI01
    SDJxDsXcZSpYSuXUv1AQGRxtxDWto3FdiPwy/mmzCA0H/1sGJWlp4Nxbr0bWcKmD2p63hG
    HqsoCQ1J6GYGfIzMUsOPst538Go95PVNOuVaXyq5YJcOOl/sgrlimieAwkBv/i2D7/mm1R
    ioS1kAxMNZ4wNT004v9+wI/UGZZm/4NtyMaVd5xAUy3VJDOEcI3KnPa2xk+w8CLCIV6Ril
    s6sdkB1RRB0fsehtZhZTrvo+40X+B+a6jWqbJUgJ/MUPfAB69uJac58nbVdn0VwmFPc0yg
    rWfrQR4UxGMzOyL2/wisfnJMihubYFUMXVHOGi9kzrEfxPuHi3N+QNWiXz9NTL3wlN4zae
    VsTwSI4ZAThy/2UqGe7i9hhohaTxssF6wdHqH7xT4kOFLb7r4xqN20VwgFxg
X-ME-Proxy: <xmx:T8t9atcA-6uhE1t4f1j2vBimgYQ7pBghPPiYr0gU6eojXR9o5k0Zrg>
    <xmx:T8t9ao4-QHDA0hE7g1_I49WfFQdXsNNpOwMts-eZjygd27MtHLHaBQ>
    <xmx:T8t9ag_N0RLGetGasVGo_s5waLVmgfViCNnLah8ffpQGm1QE83-pPQ>
    <xmx:T8t9avLqLZcwTQ9gw8kx91uc4WTKVvcPzQ96f1XdwciBmADzN9ivQw>
    <xmx:T8t9akBND1Imzkx4RSsAbPMtE1z8rf5lwXyp2AU1sRuZEKYhxQZ9HQux>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 09:48:57 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1 2/4] rust: hrtimer: Introduce HrTimerPin to make arming exclusive
Date: Thu, 13 Aug 2026 22:48:32 +0900
Message-ID: <20260813134834.1562995-3-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813134834.1562995-1-tomo@flapping.org>
References: <20260813134834.1562995-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Pin<&T> has the same hole that Arc<T> had: it is Copy and
ScopedHrTimerPointer::start_scoped() is safe, so a copy captured by the
closure can arm a timer while it is already armed and its callback may
be running.

Split the right to arm out of Pin<&T> into HrTimerPin<'a, T>, which is
created from a Pin<&'a mut T> and consumed by start_scoped(). The borrow
checker supplies the exclusivity here, and the closure keeps reading the
object through the shared pinned reference returned by
HrTimerPin::as_ref().

All four pointer types now separate sharing an object from arming its
timer, so the restart operation no longer exists in the safe API. Drop
it from the documentation.

Fixes: 3f2a5ba784b8 ("rust: hrtimer: Add HrTimerCallbackContext and ::forward()")
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time/hrtimer.rs     |  50 +++++++--------
 rust/kernel/time/hrtimer/pin.rs | 105 +++++++++++++++++++++++---------
 2 files changed, 98 insertions(+), 57 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index a7587db1d552..d94275f2e93f 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -9,15 +9,15 @@
 //!
 //! States:
 //!
-//! - Stopped: initialized but not started, or cancelled, or not restarted.
-//! - Started: initialized and started or restarted.
+//! - Stopped: initialized but not started, cancelled, or the callback returned
+//!   `NoRestart`.
+//! - Started: initialized and started, or the callback returned `Restart`.
 //! - Running: executing the callback.
 //!
 //! Operations:
 //!
 //! * Start
 //! * Cancel
-//! * Restart
 //!
 //! Events:
 //!
@@ -42,11 +42,7 @@
 //! --------->|    Stopped      |                 |      Started     +---------->|     Running     |
 //!           |                 |     Cancel      |                  |           |                 |
 //!           |                 |<----------------+                  |           |                 |
-//!           +-----------------+                 +---------------+--+           +-----------------+
-//!                                                     ^         |
-//!                                                     |         |
-//!                                                     +---------+
-//!                                                      Restart
+//!           +-----------------+                 +------------------+           +-----------------+
 //! ```
 //!
 //!
@@ -60,16 +56,13 @@
 //! by the `cancel` operation. A timer that is cancelled enters the **stopped**
 //! state.
 //!
-//! A `cancel` or `restart` operation on a timer in the **running** state takes
-//! effect after the handler has returned and the timer has transitioned
-//! out of the **running** state.
+//! A `cancel` operation on a timer in the **running** state takes effect after
+//! the handler has returned and the timer has transitioned out of the
+//! **running** state.
 //!
-//! A `restart` operation on a timer in the **stopped** state is equivalent to a
-//! `start` operation.
-//!
-//! When a type implements both `HrTimerPointer` and `Clone`, it is possible to
-//! issue the `start` operation while the timer is in the **started** state. In
-//! this case the `start` operation is equivalent to the `restart` operation.
+//! The `start` operation consumes the pointer it is called on, so a timer in the
+//! **started** or **running** state cannot be started again. It has to be
+//! **cancelled** first.
 //!
 //! # Examples
 //!
@@ -253,8 +246,8 @@
 //! #     },
 //! #     time::{
 //! #         hrtimer::{
-//! #             ScopedHrTimerPointer, HrTimer, HrTimerCallback, HrTimerPointer, HrTimerRestart,
-//! #             HasHrTimer, RelativeMode, HrTimerCallbackContext
+//! #             ScopedHrTimerPointer, HrTimer, HrTimerCallback, HrTimerPin, HrTimerPointer,
+//! #             HrTimerRestart, HasHrTimer, RelativeMode, HrTimerCallbackContext
 //! #         },
 //! #         Delta, Monotonic,
 //! #     },
@@ -282,7 +275,7 @@
 //! }
 //!
 //! impl HrTimerCallback for IntrusiveHrTimer {
-//!     type Pointer<'a> = Pin<&'a Self>;
+//!     type Pointer<'a> = HrTimerPin<'a, Self>;
 //!
 //!     fn run(this: Pin<&Self>, _ctx: HrTimerCallbackContext<'_, Self>) -> HrTimerRestart {
 //!         pr_info!("Timer called\n");
@@ -301,9 +294,12 @@
 //! }
 //!
 //! stack_pin_init!( let has_timer = IntrusiveHrTimer::new() );
-//! has_timer.as_ref().start_scoped(Delta::from_micros(200), || {
-//!     while has_timer.flag.load(ordering::Relaxed) != 1 {
-//!         has_timer.cond.wait_for_completion();
+//! let timer_pin = HrTimerPin::new(has_timer);
+//! let shared = timer_pin.as_ref();
+//!
+//! timer_pin.start_scoped(Delta::from_micros(200), || {
+//!     while shared.flag.load(ordering::Relaxed) != 1 {
+//!         shared.cond.wait_for_completion();
 //!     }
 //! });
 //!
@@ -618,7 +614,8 @@ pub trait HrTimerPointer: Sync + Sized {
 /// [`HrTimerHandle`] returned by `start` would be unsound. This is the case for
 /// stack allocated timers.
 ///
-/// Typical implementers are pinned references such as [`Pin<&T>`].
+/// Typical implementers are [`HrTimerPin`] and pinned references such as
+/// [`Pin<&mut T>`].
 ///
 /// # Safety
 ///
@@ -640,8 +637,7 @@ pub unsafe trait UnsafeHrTimerPointer: Sync + Sized {
     /// until the timer is stopped and the callback has completed.
     type TimerHandle: HrTimerHandle;
 
-    /// Start the timer after `expires` time units. If the timer was already
-    /// running, it is restarted at the new expiry time.
+    /// Start the timer after `expires` time units.
     ///
     /// # Safety
     ///
@@ -1111,7 +1107,7 @@ unsafe fn timer_container_of(
 mod arc;
 pub use arc::{ArcHrTimerHandle, HrTimerArc};
 mod pin;
-pub use pin::PinHrTimerHandle;
+pub use pin::{HrTimerPin, PinHrTimerHandle};
 mod pin_mut;
 pub use pin_mut::PinMutHrTimerHandle;
 // `box` is a reserved keyword, so prefix with `t` for timer
diff --git a/rust/kernel/time/hrtimer/pin.rs b/rust/kernel/time/hrtimer/pin.rs
index 4d39ef781697..f44ac07cb722 100644
--- a/rust/kernel/time/hrtimer/pin.rs
+++ b/rust/kernel/time/hrtimer/pin.rs
@@ -10,50 +10,58 @@
 use super::UnsafeHrTimerPointer;
 use core::pin::Pin;
 
-/// A handle for a `Pin<&HasHrTimer>`. When the handle exists, the timer might be
-/// running.
-pub struct PinHrTimerHandle<'a, T>
+/// A wrapper around a pinned shared reference that's guaranteed unique.
+///
+/// The `HrTimerPin` type can be thought of as a special pinned reference to an object that
+/// owns the permission to arm the [`HrTimer`] stored in the object. By ensuring that each
+/// object has only one `HrTimerPin`, the owner of it is assured exclusive access to the arming
+/// operation. Starting a timer consumes the `HrTimerPin`, and the returned
+/// [`PinHrTimerHandle`] keeps the object borrowed, so the timer cannot be armed again until the
+/// handle is dropped.
+///
+/// While this `HrTimerPin` is unique, shared pinned references to the object can still be
+/// obtained with [`HrTimerPin::as_ref`].
+///
+/// # Invariants
+///
+/// * Each object has at most one `HrTimerPin`.
+pub struct HrTimerPin<'a, T>
 where
     T: HasHrTimer<T>,
 {
-    pub(crate) inner: Pin<&'a T>,
+    pin: Pin<&'a T>,
 }
 
-// SAFETY: We cancel the timer when the handle is dropped. The implementation of
-// the `cancel` method will block if the timer handler is running.
-unsafe impl<'a, T> HrTimerHandle for PinHrTimerHandle<'a, T>
+impl<'a, T> HrTimerPin<'a, T>
 where
     T: HasHrTimer<T>,
 {
-    fn cancel(&mut self) -> bool {
-        let self_ptr: *const T = self.inner.get_ref();
-
-        // SAFETY: As we got `self_ptr` from a reference above, it must point to
-        // a valid `T`.
-        let timer_ptr = unsafe { <T as HasHrTimer<T>>::raw_get_timer(self_ptr) };
-
-        // SAFETY: As `timer_ptr` is derived from a reference, it must point to
-        // a valid and initialized `HrTimer`.
-        unsafe { HrTimer::<T>::raw_cancel(timer_ptr) }
+    /// Create a `HrTimerPin` from an exclusive pinned reference to a `T`.
+    #[inline]
+    pub fn new(inner: Pin<&'a mut T>) -> Self {
+        // INVARIANT: We have an exclusive reference, so there is no `HrTimerPin` for this
+        // object.
+        Self {
+            pin: inner.into_ref(),
+        }
     }
-}
 
-impl<'a, T> Drop for PinHrTimerHandle<'a, T>
-where
-    T: HasHrTimer<T>,
-{
-    fn drop(&mut self) {
-        self.cancel();
+    /// Get a shared pinned reference to the object.
+    ///
+    /// The returned reference can be used to access the object, but not to arm its timer.
+    #[inline]
+    pub fn as_ref(&self) -> Pin<&'a T> {
+        self.pin
     }
 }
 
 // SAFETY: We capture the lifetime of `Self` when we create a `PinHrTimerHandle`,
 // so `Self` will outlive the handle.
-unsafe impl<'a, T> UnsafeHrTimerPointer for Pin<&'a T>
+unsafe impl<'a, T> UnsafeHrTimerPointer for HrTimerPin<'a, T>
 where
     T: Send + Sync,
     T: HasHrTimer<T>,
-    T: HrTimerCallback<Pointer<'a> = Self>,
+    T: HrTimerCallback<Pointer<'a> = HrTimerPin<'a, T>>,
 {
     type TimerMode = <T as HasHrTimer<T>>::TimerMode;
     type TimerHandle = PinHrTimerHandle<'a, T>;
@@ -63,7 +71,7 @@ unsafe fn start(
         expires: <<T as HasHrTimer<T>>::TimerMode as HrTimerMode>::Expires,
     ) -> Self::TimerHandle {
         // Cast to pointer
-        let self_ptr: *const T = self.get_ref();
+        let self_ptr: *const T = self.pin.get_ref();
 
         // SAFETY:
         //  - As we derive `self_ptr` from a reference above, it must point to a
@@ -71,16 +79,53 @@ unsafe fn start(
         //  - We keep `self` alive by wrapping it in a handle below.
         unsafe { T::start(self_ptr, expires) };
 
-        PinHrTimerHandle { inner: self }
+        PinHrTimerHandle { inner: self.pin }
+    }
+}
+
+/// A handle for a `Pin<&HasHrTimer>`. When the handle exists, the timer might be
+/// running.
+pub struct PinHrTimerHandle<'a, T>
+where
+    T: HasHrTimer<T>,
+{
+    pub(crate) inner: Pin<&'a T>,
+}
+
+// SAFETY: We cancel the timer when the handle is dropped. The implementation of
+// the `cancel` method will block if the timer handler is running.
+unsafe impl<'a, T> HrTimerHandle for PinHrTimerHandle<'a, T>
+where
+    T: HasHrTimer<T>,
+{
+    fn cancel(&mut self) -> bool {
+        let self_ptr: *const T = self.inner.get_ref();
+
+        // SAFETY: As we got `self_ptr` from a reference above, it must point to
+        // a valid `T`.
+        let timer_ptr = unsafe { <T as HasHrTimer<T>>::raw_get_timer(self_ptr) };
+
+        // SAFETY: As `timer_ptr` is derived from a reference, it must point to
+        // a valid and initialized `HrTimer`.
+        unsafe { HrTimer::<T>::raw_cancel(timer_ptr) }
+    }
+}
+
+impl<'a, T> Drop for PinHrTimerHandle<'a, T>
+where
+    T: HasHrTimer<T>,
+{
+    fn drop(&mut self) {
+        self.cancel();
     }
 }
 
-impl<'a, T> RawHrTimerCallback for Pin<&'a T>
+impl<'a, T> RawHrTimerCallback for HrTimerPin<'a, T>
 where
     T: HasHrTimer<T>,
     T: HrTimerCallback<Pointer<'a> = Self>,
 {
-    type CallbackTarget<'b> = Self;
+    type CallbackTarget<'b> = Pin<&'a T>;
 
     unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::hrtimer_restart {
         // `HrTimer` is `repr(C)`
-- 
2.43.0

