Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83602EAE6
	for <rust-for-linux@vger.kernel.org>; Sun, 13 Apr 2025 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744541828; cv=none; b=ib+w16fxizjr2IWKs4QyV8BZSH/6SBG0GN0SHPTthylJk0lHGd1ET+FUyNZ5HF6naPuT/5eU+Yr/bpVFtKc2J6hX1e0lUzpculwxjcL+qPO3ikRN80Fh0jILILtbRDj3Dvh9tQdKIbtvysWgkX4O3uAPinzsJvo+jF0mkxj6Ebk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744541828; c=relaxed/simple;
	bh=akgrvfXBdrqa7KjYI77GV1EQKwSV77oaHcgOb+VNmlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cVmPfX4C9sIgaIEQvyZtKFrEuZ1Xa8DVh7cy40QDXeMbjQQySE8JAPYgV31gWA+9Nyl7Zbq0mu6KYudODggEsYGUms16xduXwdfqa9/yiYIbUvzXpWZFDSa1vGVwT3fUy0KhVHIHyVFFPVzvEt/n1rdlxPe94FvOm1Tw7AQu3e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3Z4tB1B; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3Z4tB1B"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3081f72c271so2605634a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 13 Apr 2025 03:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744541825; x=1745146625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uac3QLDmtid4jIi1TnZr61zkC8rKdm6MHc4SXyacmQA=;
        b=H3Z4tB1B//kJPchn3e+hb9d6S+3gYdcyEVzIk+ltEj2/+srKDZJ+qP9MUcSKi3jxY4
         WmmO45XMwQqyTKe3sj/EEPewvE/etOWb6NsPRfI7nJjcSw6swMgIuU5SvC4qDCYMeDlB
         8dvKEemjBIxqf6gcXLHCNFS4X4a8bbde8ev50Zc6BmwYIv5tbNyM2aCfY4DDeRsaIgST
         zcmprjXkmS+xsF3LXGrtMC8oeQmGWiDls5VqeV+ValZLszFVdDZrbv4/pfCOJcmCy1mM
         /UKfUd5HiYbFIWxHTPFinfp8Dsvl9bBX6/rprkqcR59bAhEESP87NGl4vXX+baTB2bjW
         V4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744541825; x=1745146625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uac3QLDmtid4jIi1TnZr61zkC8rKdm6MHc4SXyacmQA=;
        b=YPVKF4chDawKwgWrHXeE4Jcp6cOxnlEaT5IM2mUWge+XxwLAjNP5m/UnRVrAqgzc19
         cusZTmn1bwcnVyCCoa/6J4iWuTFTRAo/EGqXuu2vNUTC98Ew2VuPaRICG24ZwwHAc3Ni
         5qQ05hk9+WjfvwNMrKUDRV/D/ttqweZuZE41FIFwK09DJwzPQfrXUyrhpGVUQOUttBk0
         fCIcdc/XBw0O6iqEq82ZvjGuU347dRlAsfm75dyN86TDFIRKAyviu+YiLusqpqVaagq4
         RAeJ3qxpCNeplkRf9lrxNbVJ9qbWUnRf1g7r3gaxdIZyOTHdSjSUAiNI5Xgd6XfoZsqi
         JoRg==
X-Gm-Message-State: AOJu0Yz8ZbTwoJwg62/6cE0OlvfU41Q20mPHyf4M18gZKtlaUqXSgag4
	HfNDfJxgkoGZnn7RseG0AYMi2HYvY4CFZHIwUKDZcqRSVUPXmC909+0vU36b
X-Gm-Gg: ASbGnctoa80a/EIDnSRcus4i1dXXtZs9yVFyFNRrLIGt/gX4cwirUIxP+C5GiOTUGqA
	Gm4GXdtZWOVaUCP8HxYjm6qeXxook2TI35Uiqlwk6lXhwtQVmPx2mwa4D5g18sgkoyBNeJAKRHd
	6ApeQEBBOqiIarjhmsqCKohqgQU/BDKxapLtbT6r+HxOlyIiVE+SmmRbgXPJacoCArg6w3tdyU0
	noRz0YKm6uczyx2oAWNJU3f0brek8/oYIIGQPzgp04UEMzpmEN3UtU2owPGeJoCDQ0EIAST85kb
	FmkyfyF6kIA6vwV4DHL3kdq+AW3SURPwsDWvGdR5ZjmFSABLBJBczGqauKBCFVJCkKCYGBbKBky
	fX+EOAVvfMYrP2LurfELOBAyKpa4j
X-Google-Smtp-Source: AGHT+IFFUgMPvlPHBZEOXTqLIzBcMhiW234Y94ji3etMu7wd7uTmYvrM/TzFxPFPQZUJMH/TN9EfRg==
X-Received: by 2002:a17:90b:50ce:b0:301:1bce:c26f with SMTP id 98e67ed59e1d1-3082365a464mr10897918a91.3.1744541824819;
        Sun, 13 Apr 2025 03:57:04 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccab77sm80667215ad.214.2025.04.13.03.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 03:57:04 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: boqun.feng@gmail.com,
	a.hindborg@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@linutronix.de,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org
Subject: [PATCH v1 2/3] rust: time: make Instant generic over ClockSource
Date: Sun, 13 Apr 2025 19:56:27 +0900
Message-ID: <20250413105629.162349-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413105629.162349-1-fujita.tomonori@gmail.com>
References: <20250413105629.162349-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the Instant type to be generic over a ClockSource type
parameter, enabling static enforcement of clock correctness across
APIs that deal with time. Previously, the clock source was implicitly
fixed (typically CLOCK_MONOTONIC), and developers had to ensure
compatibility manually.

This design eliminates runtime mismatches between clock sources, and
enables stronger type-level guarantees throughout the timer subsystem.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs                 | 21 ++++++++++++++++-----
 rust/kernel/time/hrtimer.rs         | 20 ++++++++++----------
 rust/kernel/time/hrtimer/arc.rs     |  5 +++--
 rust/kernel/time/hrtimer/pin.rs     |  5 +++--
 rust/kernel/time/hrtimer/pin_mut.rs |  7 ++++---
 rust/kernel/time/hrtimer/tbox.rs    |  5 +++--
 6 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 64f36476d519..db9a783631ec 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -24,6 +24,7 @@
 //! C header: [`include/linux/jiffies.h`](srctree/include/linux/jiffies.h).
 //! C header: [`include/linux/ktime.h`](srctree/include/linux/ktime.h).
 
+use core::marker::PhantomData;
 pub mod delay;
 pub mod hrtimer;
 
@@ -137,12 +138,21 @@ impl ClockSource for Tai {
 ///
 /// The `inner` value is in the range from 0 to `KTIME_MAX`.
 #[repr(transparent)]
-#[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord)]
-pub struct Instant {
+#[derive(PartialEq, PartialOrd, Eq, Ord)]
+pub struct Instant<C: ClockSource> {
     inner: bindings::ktime_t,
+    _c: PhantomData<C>,
 }
 
-impl Instant {
+impl<C: ClockSource> Clone for Instant<C> {
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+
+impl<C: ClockSource> Copy for Instant<C> {}
+
+impl<C: ClockSource> Instant<C> {
     /// Get the current time using `CLOCK_MONOTONIC`.
     #[inline]
     pub fn now() -> Self {
@@ -151,6 +161,7 @@ pub fn now() -> Self {
         Self {
             // SAFETY: It is always safe to call `ktime_get()` outside of NMI context.
             inner: unsafe { bindings::ktime_get() },
+            _c: PhantomData,
         }
     }
 
@@ -166,12 +177,12 @@ pub(crate) fn as_nanos(self) -> i64 {
     }
 }
 
-impl core::ops::Sub for Instant {
+impl<C: ClockSource> core::ops::Sub for Instant<C> {
     type Output = Delta;
 
     // By the type invariant, it never overflows.
     #[inline]
-    fn sub(self, other: Instant) -> Delta {
+    fn sub(self, other: Instant<C>) -> Delta {
         Delta {
             nanos: self.inner - other.inner,
         }
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 12c359dbb895..b1e64e879836 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -176,7 +176,7 @@ pub(crate) unsafe fn raw_cancel(this: *const Self) -> bool {
 /// that more than one [`HrTimerHandle`] associated with a [`HrTimerPointer`] may
 /// exist. A timer can be manipulated through any of the handles, and a handle
 /// may represent a cancelled timer.
-pub trait HrTimerPointer: Sync + Sized {
+pub trait HrTimerPointer<C: ClockSource>: Sync + Sized {
     /// A handle representing a started or restarted timer.
     ///
     /// If the timer is running or if the timer callback is executing when the
@@ -189,7 +189,7 @@ pub trait HrTimerPointer: Sync + Sized {
 
     /// Start the timer with expiry after `expires` time units. If the timer was
     /// already running, it is restarted with the new expiry time.
-    fn start(self, expires: Instant) -> Self::TimerHandle;
+    fn start(self, expires: Instant<C>) -> Self::TimerHandle;
 }
 
 /// Unsafe version of [`HrTimerPointer`] for situations where leaking the
@@ -203,7 +203,7 @@ pub trait HrTimerPointer: Sync + Sized {
 /// Implementers of this trait must ensure that instances of types implementing
 /// [`UnsafeHrTimerPointer`] outlives any associated [`HrTimerPointer::TimerHandle`]
 /// instances.
-pub unsafe trait UnsafeHrTimerPointer: Sync + Sized {
+pub unsafe trait UnsafeHrTimerPointer<C: ClockSource>: Sync + Sized {
     /// A handle representing a running timer.
     ///
     /// # Safety
@@ -220,7 +220,7 @@ pub unsafe trait UnsafeHrTimerPointer: Sync + Sized {
     ///
     /// Caller promises keep the timer structure alive until the timer is dead.
     /// Caller can ensure this by not leaking the returned [`Self::TimerHandle`].
-    unsafe fn start(self, expires: Instant) -> Self::TimerHandle;
+    unsafe fn start(self, expires: Instant<C>) -> Self::TimerHandle;
 }
 
 /// A trait for stack allocated timers.
@@ -229,10 +229,10 @@ pub unsafe trait UnsafeHrTimerPointer: Sync + Sized {
 ///
 /// Implementers must ensure that `start_scoped` does not return until the
 /// timer is dead and the timer handler is not running.
-pub unsafe trait ScopedHrTimerPointer {
+pub unsafe trait ScopedHrTimerPointer<C: ClockSource> {
     /// Start the timer to run after `expires` time units and immediately
     /// after call `f`. When `f` returns, the timer is cancelled.
-    fn start_scoped<T, F>(self, expires: Instant, f: F) -> T
+    fn start_scoped<T, F>(self, expires: Instant<C>, f: F) -> T
     where
         F: FnOnce() -> T;
 }
@@ -240,11 +240,11 @@ fn start_scoped<T, F>(self, expires: Instant, f: F) -> T
 // SAFETY: By the safety requirement of [`UnsafeHrTimerPointer`], dropping the
 // handle returned by [`UnsafeHrTimerPointer::start`] ensures that the timer is
 // killed.
-unsafe impl<T> ScopedHrTimerPointer for T
+unsafe impl<T, C: ClockSource> ScopedHrTimerPointer<C> for T
 where
-    T: UnsafeHrTimerPointer,
+    T: UnsafeHrTimerPointer<C>,
 {
-    fn start_scoped<U, F>(self, expires: Instant, f: F) -> U
+    fn start_scoped<U, F>(self, expires: Instant<C>, f: F) -> U
     where
         F: FnOnce() -> U,
     {
@@ -366,7 +366,7 @@ unsafe fn c_timer_ptr(this: *const Self) -> *const bindings::hrtimer {
     /// - `this` must point to a valid `Self`.
     /// - Caller must ensure that the pointee of `this` lives until the timer
     ///   fires or is canceled.
-    unsafe fn start(this: *const Self, expires: Instant) {
+    unsafe fn start<C: ClockSource>(this: *const Self, expires: Instant<C>) {
         // SAFETY: By function safety requirement, `this` is a valid `Self`.
         unsafe {
             bindings::hrtimer_start_range_ns(
diff --git a/rust/kernel/time/hrtimer/arc.rs b/rust/kernel/time/hrtimer/arc.rs
index acc70a0ea1be..455c4dba6226 100644
--- a/rust/kernel/time/hrtimer/arc.rs
+++ b/rust/kernel/time/hrtimer/arc.rs
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use super::ClockSource;
 use super::HasHrTimer;
 use super::HrTimer;
 use super::HrTimerCallback;
@@ -47,7 +48,7 @@ fn drop(&mut self) {
     }
 }
 
-impl<T> HrTimerPointer for Arc<T>
+impl<T, C: ClockSource> HrTimerPointer<C> for Arc<T>
 where
     T: 'static,
     T: Send + Sync,
@@ -56,7 +57,7 @@ impl<T> HrTimerPointer for Arc<T>
 {
     type TimerHandle = ArcHrTimerHandle<T>;
 
-    fn start(self, expires: Instant) -> ArcHrTimerHandle<T> {
+    fn start(self, expires: Instant<C>) -> ArcHrTimerHandle<T> {
         // SAFETY:
         //  - We keep `self` alive by wrapping it in a handle below.
         //  - Since we generate the pointer passed to `start` from a valid
diff --git a/rust/kernel/time/hrtimer/pin.rs b/rust/kernel/time/hrtimer/pin.rs
index dba22d11a95f..179887c4b3c8 100644
--- a/rust/kernel/time/hrtimer/pin.rs
+++ b/rust/kernel/time/hrtimer/pin.rs
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use super::ClockSource;
 use super::HasHrTimer;
 use super::HrTimer;
 use super::HrTimerCallback;
@@ -48,7 +49,7 @@ fn drop(&mut self) {
 
 // SAFETY: We capture the lifetime of `Self` when we create a `PinHrTimerHandle`,
 // so `Self` will outlive the handle.
-unsafe impl<'a, T> UnsafeHrTimerPointer for Pin<&'a T>
+unsafe impl<'a, T, C: ClockSource> UnsafeHrTimerPointer<C> for Pin<&'a T>
 where
     T: Send + Sync,
     T: HasHrTimer<T>,
@@ -56,7 +57,7 @@ unsafe impl<'a, T> UnsafeHrTimerPointer for Pin<&'a T>
 {
     type TimerHandle = PinHrTimerHandle<'a, T>;
 
-    unsafe fn start(self, expires: Instant) -> Self::TimerHandle {
+    unsafe fn start(self, expires: Instant<C>) -> Self::TimerHandle {
         // Cast to pointer
         let self_ptr: *const T = self.get_ref();
 
diff --git a/rust/kernel/time/hrtimer/pin_mut.rs b/rust/kernel/time/hrtimer/pin_mut.rs
index aeff8e102e1d..ead56fe4a7d7 100644
--- a/rust/kernel/time/hrtimer/pin_mut.rs
+++ b/rust/kernel/time/hrtimer/pin_mut.rs
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use super::{
-    HasHrTimer, HrTimer, HrTimerCallback, HrTimerHandle, RawHrTimerCallback, UnsafeHrTimerPointer,
+    ClockSource, HasHrTimer, HrTimer, HrTimerCallback, HrTimerHandle, RawHrTimerCallback,
+    UnsafeHrTimerPointer,
 };
 use crate::time::Instant;
 use core::{marker::PhantomData, pin::Pin, ptr::NonNull};
@@ -46,7 +47,7 @@ fn drop(&mut self) {
 
 // SAFETY: We capture the lifetime of `Self` when we create a
 // `PinMutHrTimerHandle`, so `Self` will outlive the handle.
-unsafe impl<'a, T> UnsafeHrTimerPointer for Pin<&'a mut T>
+unsafe impl<'a, T, C: ClockSource> UnsafeHrTimerPointer<C> for Pin<&'a mut T>
 where
     T: Send + Sync,
     T: HasHrTimer<T>,
@@ -54,7 +55,7 @@ unsafe impl<'a, T> UnsafeHrTimerPointer for Pin<&'a mut T>
 {
     type TimerHandle = PinMutHrTimerHandle<'a, T>;
 
-    unsafe fn start(mut self, expires: Instant) -> Self::TimerHandle {
+    unsafe fn start(mut self, expires: Instant<C>) -> Self::TimerHandle {
         // SAFETY:
         // - We promise not to move out of `self`. We only pass `self`
         //   back to the caller as a `Pin<&mut self>`.
diff --git a/rust/kernel/time/hrtimer/tbox.rs b/rust/kernel/time/hrtimer/tbox.rs
index 3df4e359e9bb..4212756c7494 100644
--- a/rust/kernel/time/hrtimer/tbox.rs
+++ b/rust/kernel/time/hrtimer/tbox.rs
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use super::ClockSource;
 use super::HasHrTimer;
 use super::HrTimer;
 use super::HrTimerCallback;
@@ -56,7 +57,7 @@ fn drop(&mut self) {
     }
 }
 
-impl<T, A> HrTimerPointer for Pin<Box<T, A>>
+impl<T, A, C: ClockSource> HrTimerPointer<C> for Pin<Box<T, A>>
 where
     T: 'static,
     T: Send + Sync,
@@ -66,7 +67,7 @@ impl<T, A> HrTimerPointer for Pin<Box<T, A>>
 {
     type TimerHandle = BoxHrTimerHandle<T, A>;
 
-    fn start(self, expires: Instant) -> Self::TimerHandle {
+    fn start(self, expires: Instant<C>) -> Self::TimerHandle {
         // SAFETY:
         //  - We will not move out of this box during timer callback (we pass an
         //    immutable reference to the callback).
-- 
2.43.0

