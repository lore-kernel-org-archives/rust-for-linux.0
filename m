Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0F1331ECC
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 13:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628939; cv=none; b=hWvS1qS9YO+H2G3Z4SlqjSPokzhhMFrcLsVqWgKaA+BQ/MsapwTkq+TfY5Y7IMvv9dwrKo6wM59gtu9Qtt4hBojrN8F32tKOEbHw9wBhXSmXg4UnhMiP/baiRUmyo2pokqT4DkeAWQAX1BU47Hl2dMAhoi6MUirZgYP7OWCGix0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628939; c=relaxed/simple;
	bh=Z50X2ewzRr+VJF/J5bbH1paG7az0+povc3302L6Jya4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pb8KD5ns6sSgUTsqMkNSlmMyBS0mpvYIIsGGP5NAOV+QsiO0vs3Y6BHzz0TH7X6NpDk/aQuaDGmhw9NWo3cLL5uyTWMd0VX9mGAmsogZD+lMB9OsS87spWymZeZyF1EW+rVnClISQ7cVexUL38P7/mn9Lj32B+ZlNUq3Kvpt4pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=p1A+PKDB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PTNVx6aq; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="p1A+PKDB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PTNVx6aq"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 7983113004CD;
	Thu, 13 Aug 2026 09:48:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 13 Aug 2026 09:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1786628936; x=
	1786632536; bh=AwlPJZIYQp7aCPMNALKypQ3Jh0u94B8K/rHTOYPA/rk=; b=p
	1A+PKDBKTPQBgx2Q64aQcmncdPJuaISXRerANCcRj/KPcaAyf0CzrOvYdq+S+8EW
	Vkzvr2KW9ko3C/irS3JeLJ595oiySQvl4q6Z3HM1sl2UXYhO5vLni8ToClQ/6C3B
	HxoMtWE3dj+qsUGtorrqUUI/0876xwJwFZ0Yt4h8Ws21xogEyLYBQmPCHDkhKzUW
	j/1Ug26frX64dvssOROkhuVgrC5TaQd9oSUsNZ0lx8SnCT/OhvZCDz7r4chEuZb3
	dbMbarCWYlhn28W3rUDnn6AqzGFrURlZhEFG8U+ZQPZHDqjW48oCErSn+84VNSAr
	IcgJBc3ydnYFKc7+/uqug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786628936; x=1786632536; bh=A
	wlPJZIYQp7aCPMNALKypQ3Jh0u94B8K/rHTOYPA/rk=; b=PTNVx6aqywBSW7/ug
	+iffKnEUmZsbyQWdnK7+5wJU0yARWSvLzLO3IinLs4e7KQuYfn76uePP6ijKHb+O
	DbJkJRM+i582DHkgRuWWapZwR/Zd/d51bWtLhaG3q60ZuV3LIcBo654JS56MiuX6
	G+PyuDEpy/QyKzEMew0qGs3zDt3Bux+3iHzTvL1LtTKj4UOfVUilGFh9nqOja+G1
	U3ehZoOtVlnr6dlMkCmcAxXhRX+e9FOasiQJg/5aBDL5nF2bCg8hCmkWLrHCiYxt
	dHobMetA9Q03VsiAgK5IGfm58dyaEhdtjWjJ1Q524puq4EqRAimayGJ5scG2V9DX
	lrE3A==
X-ME-Sender: <xms:SMt9alB4M1FJUljb-hXADtKkxzMjBe0J-ZcQxPSXRxgJWt-iifsvIw>
    <xme:SMt9avZoxfYYk2f0VFHpLeY3_4ziZF7MLH4QXd8ycYueJqiFyLgDxd11gLxO_gG2m
    JBiC2JrYPGdGA3j79EzQ0-n1JxO_xtIFKdOq6Y7WJzvhOg6aL8qJS_Y>
X-ME-Received: <xmr:SMt9asGbNo4iuBv8q3kIaBZ7eMUBZTEafUooLrCEx5yRd8dWB8kJAHj-H4iQ-qfSSkj6O_YT0C0sqGJapp8>
X-ME-Proxy-Cause: dmFkZTEpZrFsQA6lFB0ZuvhKE8ib6L2ObCjJzDZZ+xev36rK5clhcLRa3oqSvib5fsncav
    Vhh7EXPyzwrDpREaN+3RDKFez6objhMHOUtDP/q6WvUcKLGb1N3X6WxwehttAoTY5e2Pob
    6JtLwv8d3zYyTNF825ZlmefKABN3lRjvRfA9/FktUiY2tg5Yy7DxXgcMixbiiYzS7ETEr9
    CtK+4EdkQ6tyul+PpNrqvf7Wwe3717dUDyieQGRCOAtdy3f9jkJH09u2D9nEL/5DJ2RHWr
    5VXoOat0bOeTbdmNlH9ZUtk47VzEHl/eUxHFSmw2ov/ocaY57KR8LNPNeAwUMsuIrlraEr
    hYrhpv8+XfBpvuVX087nu0mUUpB/EUTf3TCrIqYPAl7uH6DHL44IZnG25cefcTCGWombkn
    1h9WeuTXyJsG6BbIS9KTAFzxgcjpbZaDilwFdq8QJZL2MEkISx5vndOvj0GDCPwtTySFbE
    Ie3v9fN4/waOl2Z+fOkjZa2vvJfTBgBmvQ3Ry6JgeZ5KtAEwA5M5Z6/0qmtkEi0VGf/qHO
    rqK6/hJnCmo+8Y2bzmQysGgxODD+Bu7RD2Bdi+iZ1uEaoE89Vbt74wGaUiUImvw27QsMR1
    doRacRtoEIkFVgRTfK8ggMSkiH6kwg10qQmdnYnugwRE9E/6soADu5sh5X8g
X-ME-Proxy: <xmx:SMt9ajuhjuRLwf6rTnI8R9jrhmIY2ZRDAhJyv5k6oysVKpdBvefidQ>
    <xmx:SMt9aiJhZb13szQ9LhTU6djTj0Voai55jr7SuOW_Smd3kSOEYxcrzw>
    <xmx:SMt9ahN-IoERtv8WGhpQtnnFDE6RE22mSesKeasWjchtxvUhSNj4QA>
    <xmx:SMt9aqbhQrYBmqegyjpZ9Sfti1PXywjCb6RBfWjk_wS4M7rQezazfQ>
    <xmx:SMt9avS_V9CQ5SrQqCEu3so-T62rtA25JigGczsoRdAjGET_fkIoqyPV>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 09:48:51 -0400 (EDT)
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
Subject: [PATCH v1 1/4] rust: hrtimer: Introduce HrTimerArc to make arming exclusive
Date: Thu, 13 Aug 2026 22:48:31 +0900
Message-ID: <20260813134834.1562995-2-tomo@flapping.org>
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

A hrtimer callback may change its own expiry time with
hrtimer_forward(), which is sound only because __run_hrtimer() dequeues
the timer for the duration of the callback. Arming the same timer from
another CPU puts it back into the rbtree while the callback runs, so
that expiry update lands on a queued timer and the tree ordering goes
stale. Arc<T> is Clone and Arc<T>::start() is safe, so safe Rust can arm
a timer on any CPU, including while its callback is running.

"No arming while the callback runs" cannot be expressed in the type
system, because the callback begins when the timer expires rather than
at any point in the Rust program, so use the stronger "no arming while
armed" instead. hrtimer_cancel() waits for the handler to return, which
makes that the point where the right to arm can be handed back.
Pin<Box<T, A>> and Pin<&mut T> already work this way through ownership
and exclusive borrow.

Split the right to arm out of Arc<T> into HrTimerArc<T>, a non-clonable
wrapper modelled on ListArc that is created from a Pin<UniqueArc<T>> and
consumed by start(); the object stays shareable through plain Arc
references.

Fixes: 3f2a5ba784b8 ("rust: hrtimer: Add HrTimerCallbackContext and ::forward()")
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time/hrtimer.rs     |  33 +++++-----
 rust/kernel/time/hrtimer/arc.rs | 111 +++++++++++++++++++++++++-------
 2 files changed, 103 insertions(+), 41 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 2d7f1131a813..a7587db1d552 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -172,12 +172,12 @@
 //! #     sync::{
 //! #         atomic::{ordering, Atomic},
 //! #         completion::Completion,
-//! #         Arc, ArcBorrow,
+//! #         ArcBorrow,
 //! #     },
 //! #     time::{
 //! #         hrtimer::{
-//! #             RelativeMode, HrTimer, HrTimerCallback, HrTimerPointer, HrTimerRestart,
-//! #             HasHrTimer, HrTimerCallbackContext
+//! #             RelativeMode, HrTimer, HrTimerArc, HrTimerCallback, HrTimerPointer,
+//! #             HrTimerRestart, HasHrTimer, HrTimerCallbackContext
 //! #         },
 //! #         Delta, Monotonic,
 //! #     },
@@ -204,7 +204,7 @@
 //! }
 //!
 //! impl HrTimerCallback for ArcIntrusiveHrTimer {
-//!     type Pointer<'a> = Arc<Self>;
+//!     type Pointer<'a> = HrTimerArc<Self>;
 //!
 //!     fn run(
 //!         this: ArcBorrow<'_, Self>,
@@ -229,11 +229,12 @@
 //!     }
 //! }
 //!
-//! let has_timer = Arc::pin_init(ArcIntrusiveHrTimer::new(), GFP_KERNEL)?;
-//! let _handle = has_timer.clone().start(Delta::from_micros(200));
+//! let has_timer = HrTimerArc::pin_init(ArcIntrusiveHrTimer::new(), GFP_KERNEL)?;
+//! let shared = has_timer.clone_arc();
+//! let _handle = has_timer.start(Delta::from_micros(200));
 //!
-//! while has_timer.flag.load(ordering::Relaxed) != 5 {
-//!     has_timer.cond.wait_for_completion();
+//! while shared.flag.load(ordering::Relaxed) != 5 {
+//!     shared.cond.wait_for_completion();
 //! }
 //!
 //! pr_info!("Counted to 5\n");
@@ -589,18 +590,17 @@ pub fn expires(&self) -> HrTimerInstant<T>
 /// `Self` must be [`Sync`] because it is passed to timer callbacks in another
 /// thread of execution (hard or soft interrupt context).
 ///
-/// Starting a timer returns a [`HrTimerHandle`] that can be used to manipulate
-/// the timer. Note that it is OK to call the start function repeatedly, and
-/// that more than one [`HrTimerHandle`] associated with a [`HrTimerPointer`] may
-/// exist. A timer can be manipulated through any of the handles, and a handle
-/// may represent a cancelled timer.
+/// Starting a timer consumes `Self` and returns a [`HrTimerHandle`] that can be
+/// used to manipulate the timer. As a timer in the **started** or **running**
+/// state cannot be started again, at most one [`HrTimerHandle`] for a timer
+/// exists at a time. A handle may represent a cancelled timer.
 pub trait HrTimerPointer: Sync + Sized {
     /// The operational mode associated with this timer.
     ///
     /// This defines how the expiration value is interpreted.
     type TimerMode: HrTimerMode;
 
-    /// A handle representing a started or restarted timer.
+    /// A handle representing a started timer.
     ///
     /// If the timer is running or if the timer callback is executing when the
     /// handle is dropped, the drop method of [`HrTimerHandle`] should not return
@@ -610,8 +610,7 @@ pub trait HrTimerPointer: Sync + Sized {
     /// leak the handle.
     type TimerHandle: HrTimerHandle;
 
-    /// Start the timer with expiry after `expires` time units. If the timer was
-    /// already running, it is restarted with the new expiry time.
+    /// Start the timer with expiry after `expires` time units.
     fn start(self, expires: <Self::TimerMode as HrTimerMode>::Expires) -> Self::TimerHandle;
 }
 
@@ -1110,7 +1109,7 @@ unsafe fn timer_container_of(
 }
 
 mod arc;
-pub use arc::ArcHrTimerHandle;
+pub use arc::{ArcHrTimerHandle, HrTimerArc};
 mod pin;
 pub use pin::PinHrTimerHandle;
 mod pin_mut;
diff --git a/rust/kernel/time/hrtimer/arc.rs b/rust/kernel/time/hrtimer/arc.rs
index 7be82bcb352a..2134d12d558c 100644
--- a/rust/kernel/time/hrtimer/arc.rs
+++ b/rust/kernel/time/hrtimer/arc.rs
@@ -8,47 +8,71 @@
 use super::HrTimerMode;
 use super::HrTimerPointer;
 use super::RawHrTimerCallback;
-use crate::sync::Arc;
-use crate::sync::ArcBorrow;
+use crate::alloc::Flags;
+use crate::error::{Error, Result};
+use crate::init::InPlaceInit;
+use crate::sync::{Arc, ArcBorrow, UniqueArc};
+use core::pin::Pin;
+use pin_init::PinInit;
 
-/// A handle for an `Arc<HasHrTimer<T>>` returned by a call to
-/// [`HrTimerPointer::start`].
-pub struct ArcHrTimerHandle<T>
+/// A wrapper around [`Arc`] that's guaranteed unique.
+///
+/// The `HrTimerArc` type can be thought of as a special reference to a refcounted object that owns
+/// the permission to arm the [`HrTimer`] stored in the refcounted object. By ensuring that each
+/// object has only one `HrTimerArc` reference, the owner of that reference is assured exclusive
+/// access to the arming operation. When a timer is started, the returned [`ArcHrTimerHandle`] takes
+/// ownership of the `HrTimerArc` reference.
+///
+/// While this `HrTimerArc` is unique, there still might exist normal [`Arc`] references to the
+/// object. Use [`HrTimerArc::clone_arc`] to obtain one.
+///
+/// # Invariants
+///
+/// * Each reference counted object has at most one `HrTimerArc`.
+pub struct HrTimerArc<T>
 where
     T: HasHrTimer<T>,
 {
-    pub(crate) inner: Arc<T>,
+    arc: Arc<T>,
 }
 
-// SAFETY: We implement drop below, and we cancel the timer in the drop
-// implementation.
-unsafe impl<T> HrTimerHandle for ArcHrTimerHandle<T>
+impl<T> HrTimerArc<T>
 where
     T: HasHrTimer<T>,
 {
-    fn cancel(&mut self) -> bool {
-        let self_ptr = Arc::as_ptr(&self.inner);
-
-        // SAFETY: As we obtained `self_ptr` from a valid reference above, it
-        // must point to a valid `T`.
-        let timer_ptr = unsafe { <T as HasHrTimer<T>>::raw_get_timer(self_ptr) };
+    /// Use the given pin-initializer to pin-initialize a `T` inside of a new `HrTimerArc`.
+    #[inline]
+    pub fn pin_init<E>(init: impl PinInit<T, E>, flags: Flags) -> Result<Self>
+    where
+        Error: From<E>,
+    {
+        Ok(Self::from(UniqueArc::pin_init(init, flags)?))
+    }
 
-        // SAFETY: As `timer_ptr` points into `T` and `T` is valid, `timer_ptr`
-        // must point to a valid `HrTimer` instance.
-        unsafe { HrTimer::<T>::raw_cancel(timer_ptr) }
+    /// Clone an [`Arc`] from this `HrTimerArc`.
+    ///
+    /// The returned [`Arc`] can be used to access the object, but not to arm its timer.
+    #[inline]
+    pub fn clone_arc(&self) -> Arc<T> {
+        self.arc.clone()
     }
 }
 
-impl<T> Drop for ArcHrTimerHandle<T>
+impl<T> From<Pin<UniqueArc<T>>> for HrTimerArc<T>
 where
     T: HasHrTimer<T>,
 {
-    fn drop(&mut self) {
-        self.cancel();
+    /// Convert a pinned [`UniqueArc`] into a [`HrTimerArc`].
+    #[inline]
+    fn from(unique: Pin<UniqueArc<T>>) -> Self {
+        // INVARIANT: We have a `UniqueArc`, so there is no `HrTimerArc` for this object.
+        Self {
+            arc: Arc::from(unique),
+        }
     }
 }
 
-impl<T> HrTimerPointer for Arc<T>
+impl<T> HrTimerPointer for HrTimerArc<T>
 where
     T: 'static,
     T: Send + Sync,
@@ -66,12 +90,51 @@ fn start(
         //  - We keep `self` alive by wrapping it in a handle below.
         //  - Since we generate the pointer passed to `start` from a valid
         //    reference, it is a valid pointer.
-        unsafe { T::start(Arc::as_ptr(&self), expires) };
+        unsafe { T::start(Arc::as_ptr(&self.arc), expires) };
         ArcHrTimerHandle { inner: self }
     }
 }
 
-impl<T> RawHrTimerCallback for Arc<T>
+/// A handle for a [`HrTimerArc`] returned by a call to [`HrTimerPointer::start`].
+///
+/// This handle owns the [`HrTimerArc`] reference for the object, so the timer cannot be armed
+/// again while this handle exists.
+pub struct ArcHrTimerHandle<T>
+where
+    T: HasHrTimer<T>,
+{
+    pub(crate) inner: HrTimerArc<T>,
+}
+
+// SAFETY: We implement drop below, and we cancel the timer in the drop
+// implementation.
+unsafe impl<T> HrTimerHandle for ArcHrTimerHandle<T>
+where
+    T: HasHrTimer<T>,
+{
+    fn cancel(&mut self) -> bool {
+        let self_ptr = Arc::as_ptr(&self.inner.arc);
+
+        // SAFETY: As we obtained `self_ptr` from a valid reference above, it
+        // must point to a valid `T`.
+        let timer_ptr = unsafe { <T as HasHrTimer<T>>::raw_get_timer(self_ptr) };
+
+        // SAFETY: As `timer_ptr` points into `T` and `T` is valid, `timer_ptr`
+        // must point to a valid `HrTimer` instance.
+        unsafe { HrTimer::<T>::raw_cancel(timer_ptr) }
+    }
+}
+
+impl<T> Drop for ArcHrTimerHandle<T>
+where
+    T: HasHrTimer<T>,
+{
+    fn drop(&mut self) {
+        self.cancel();
+    }
+}
+
+impl<T> RawHrTimerCallback for HrTimerArc<T>
 where
     T: 'static,
     T: HasHrTimer<T>,
-- 
2.43.0

