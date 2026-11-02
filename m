Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629911;
	b=LtJC4i3Gv4K4nOZtCF7v8o6Tfb/LCItfVHiZuvLZhB7QZJb8uFX7QU82ewn7T+fdbV3V
	 j0jASI3PuktD+2MBDAycdsd6IupqNBbUUeV2goccEIbp1gk0LKdZynRwe32N9t3VY6w6h
	 tY1lE5K5msC/3rdRlIl0sFfKq/LEM5q2gI+7UuCOeHxdEpdH70nPTkSJLMhj79paYjhsm
	 Ke044Y0RDZSWR2bMJ9HzSbBymT2NKxh3RkfMjqHi7TAjLCokaMG0KwVt9kxL4o5HRi68H
	 /BiIwM5ibp955Zs5MuFBsJ3NxxF4lLecaC+alkeI8clnUXliXe00iKKIpBTDIA1IQtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629911;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=EADj3oz0HceiukJerydzd/3azbpo7sbSh0I5gR2Mzh8=;
	b=Z/ICzLR8WWCgnTpNbXehFX3gFirazlPFe2Y7dnl8/KWqtWtORCYIy9zYjYrCgI9otHm+
	 8/LIYBlr9z0EjLJe9RJeWsL/JhYbtXgy4AsnydiMc6Y6eS/Xr8qBLryNAkMbXsvzz/bYW
	 I22HzRlMh/o+A2RpT173cI6seiiOgXcaOxGiXZl/eVwoOLb6lC7hgD+Rgez9CtE3Hh+5r
	 K5YYXZdAFnjusWhMJvesdPWwGr1uJ+6wbHgsNDe0RJe0PutdiW2cHohwGo80myVMXYQlv
	 5LrQxzcaDxD6DXEFeBCp0gb1iZDHFcN/u3SG9OB9GEAs75m3+000E5gr/1jDUIU5qDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ElU9iWrh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC2B606ABB1;
	Mon,  2 Nov 2026 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ElU9iWrh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF8B1F00A16;
	Mon,  2 Nov 2026 14:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629910;
	bh=EADj3oz0HceiukJerydzd/3azbpo7sbSh0I5gR2Mzh8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ElU9iWrhu0YQHjQTjPtxM/WVTYCu20MyFnNwUk6FX9ryxp095L7VRFjLJSvfcetLO
	 EZyh620eanXGoZjU5eFS50DvdRBambG7SVEAB3iLIk+bFBeVnP5geqKWqZTSZbfOJT
	 rwqhpJrL3smQk9iZkner7YRif5NYhzWghQV9K8YhO+30W/s/KgrUMxdARP4G1DzTg+
	 Eiy6yoNKm4/LmOKnrqS43EP1j8HsYEcLnm1XpRm/gpuO2B+v0D7tWSZNln8hOa4fy6
	 Z9mAwfuae7OUg6FYaHkpDACSQLUC+KA/cOVCOS+ZZoDSq4y9tLHKChG/+9/JGldZ4t
	 iyLGZYch1UsFw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, anna-maria@linutronix.de,
 frederic@kernel.org, gary@garyguo.net, ojeda@kernel.org, tglx@kernel.org
Cc: acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, FUJITA
 Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1 2/2] rust: hrtimer: Use
 hrtimer_forward_safe_from_callback()
In-Reply-To: <20261101232829.593680-3-tomo@flapping.org>
References: <20261101232829.593680-1-tomo@flapping.org>
 <uqohX3cKDZh17tB-JJSkR4WV6BtvMvP4NMJC5JJoemnBUsIjS3tgB2c1emjwPLLUo2s0unyBH-LAcKmQkHedhg==@protonmail.internalid>
 <20261101232829.593680-3-tomo@flapping.org>
Date: Mon, 02 Nov 2026 15:31:35 +0100
Message-ID: <87se1jmhiw.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Safe Rust code can start a timer while its callback runs. A timer
> started through Arc<T> or Pin<&T> can be started again from another
> clone or copy of the pointer. HrTimerCallbackContext::forward() calls
> hrtimer_forward(), which writes the expiry without the base lock, so
> the write can race with the concurrent hrtimer_start().
>
> Call hrtimer_forward_safe_from_callback() instead. It does the update
> with the base lock held. If the timer is already queued by a concurrent
> start, the expiry is left alone and 0 is returned.
>
> HrTimer::forward() keeps calling hrtimer_forward(). It takes
> Pin<&mut Self>, so no other reference to the timer exists and no
> concurrent start is possible. Narrow the safety requirement of
> raw_forward() to exclusive access, since the callback context no longer
> uses it.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

This looks good to me.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

While reading this, I thought we should expand the safety requirement
for the handle trait, because even though handles keep the callback
target alive, they do not own the target. The armed timer does. And so a
(future) &mut method on the handle is not allowed to mutably access the
target. This implicit today, but I thought maybe we should make it
explicit.

What do you think:

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index ab7c568b8855..84f45a7a3a17 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -771,6 +771,14 @@ fn run(
 /// is running. If the timer handler is running when the handle is dropped, the
 /// drop method must wait for the handler to return before returning.
 ///
+/// While the timer is armed, the callback target is borrowed by the timer: the
+/// timer callback can create a reference to the target at any time, and for
+/// some pointer types that reference is exclusive. Implementers must not create
+/// a reference to the callback target that would conflict with the reference
+/// that [`RawHrTimerCallback::run`] creates for the pointer type in question.
+/// Deriving raw pointers from the target, as the [`Self::cancel`]
+/// implementations do, always satisfies this.
+///
 /// Note: One way to satisfy the safety requirement is to call `Self::cancel` in
 /// the drop implementation for `Self.`
 pub unsafe trait HrTimerHandle {
diff --git a/rust/kernel/time/hrtimer/arc.rs b/rust/kernel/time/hrtimer/arc.rs
index 46ccff9e0024..eef4900cea7a 100644
--- a/rust/kernel/time/hrtimer/arc.rs
+++ b/rust/kernel/time/hrtimer/arc.rs
@@ -20,8 +20,12 @@ pub struct ArcHrTimerHandle<T>
     pub(crate) inner: Arc<T>,
 }
 
-// SAFETY: We implement drop below, and we cancel the timer in the drop
-// implementation.
+// SAFETY:
+//  - We implement drop below, and we cancel the timer in the drop
+//    implementation.
+//  - The callback for this pointer type receives an `ArcBorrow<T>`, so the
+//    timer only ever takes shared access to the callback target. References
+//    derived from `self.inner` are shared as well, so they cannot conflict.
 unsafe impl<T> HrTimerHandle for ArcHrTimerHandle<T>
 where
     T: HasHrTimer<T>,
diff --git a/rust/kernel/time/hrtimer/pin.rs b/rust/kernel/time/hrtimer/pin.rs
index 5fd374fdc480..3498c78f99f4 100644
--- a/rust/kernel/time/hrtimer/pin.rs
+++ b/rust/kernel/time/hrtimer/pin.rs
@@ -19,8 +19,13 @@ pub struct PinHrTimerHandle<'a, T>
     pub(crate) inner: Pin<&'a T>,
 }
 
-// SAFETY: We cancel the timer when the handle is dropped. The implementation of
-// the `cancel` method will block if the timer handler is running.
+// SAFETY:
+//  - We cancel the timer when the handle is dropped. The implementation of the
+//    `cancel` method will block if the timer handler is running.
+//  - The callback for this pointer type receives a `Pin<&T>`, so the timer only
+//    ever takes shared access to the callback target. The `Pin<&T>` held by the
+//    handle and references derived from it are shared as well, so they cannot
+//    conflict.
 unsafe impl<'a, T> HrTimerHandle for PinHrTimerHandle<'a, T>
 where
     T: HasHrTimer<T>,
diff --git a/rust/kernel/time/hrtimer/pin_mut.rs b/rust/kernel/time/hrtimer/pin_mut.rs
index 2bba3c41d6e9..7a54889173ba 100644
--- a/rust/kernel/time/hrtimer/pin_mut.rs
+++ b/rust/kernel/time/hrtimer/pin_mut.rs
@@ -17,8 +17,12 @@ pub struct PinMutHrTimerHandle<'a, T>
     _p: PhantomData<&'a mut T>,
 }
 
-// SAFETY: We cancel the timer when the handle is dropped. The implementation of
-// the `cancel` method will block if the timer handler is running.
+// SAFETY:
+//  - We cancel the timer when the handle is dropped. The implementation of the
+//    `cancel` method will block if the timer handler is running.
+//  - `cancel` only derives raw pointers from `self.inner`, so it does not
+//    create a reference that could conflict with the `Pin<&mut T>` that the
+//    callback creates.
 unsafe impl<'a, T> HrTimerHandle for PinMutHrTimerHandle<'a, T>
 where
     T: HasHrTimer<T>,
diff --git a/rust/kernel/time/hrtimer/tbox.rs b/rust/kernel/time/hrtimer/tbox.rs
index 399ad7677043..c13a24e19550 100644
--- a/rust/kernel/time/hrtimer/tbox.rs
+++ b/rust/kernel/time/hrtimer/tbox.rs
@@ -26,8 +26,14 @@ pub struct BoxHrTimerHandle<T, A>
     _p: core::marker::PhantomData<A>,
 }
 
-// SAFETY: We implement drop below, and we cancel the timer in the drop
-// implementation.
+// SAFETY:
+//  - We implement drop below, and we cancel the timer in the drop
+//    implementation.
+//  - `cancel` only derives raw pointers from `self.inner`, so it does not
+//    create a reference that could conflict with the `Pin<&mut T>` that the
+//    callback creates. The drop implementation reconstructs the `Box` only
+//    after `cancel` has returned, and as it owns the `T`, no other pointer
+//    exists that could arm the timer again.
 unsafe impl<T, A> HrTimerHandle for BoxHrTimerHandle<T, A>
 where
     T: HasHrTimer<T>,
---

Best regards,
Andreas Hindborg


