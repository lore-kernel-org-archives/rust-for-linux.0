Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFB8223302;
	Fri, 10 Jan 2025 20:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736540269; cv=none; b=s85jfuC1iE1W29nm83ecU293I8qTS+S45sp9k1/JuL5j7caTn8N/8/qbKoOvSj+Ni3ASSvxVNtIeHUgYeunPV9QfHm8NlupIaha7Vklrhdw5uUi0GwHQ01wwzCtXfEwPbJOlUiRZyhiI1ep+JXRtR46fb5F69IXR+WbySvdXbaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736540269; c=relaxed/simple;
	bh=KHFb+IIBdpz2xEoLQwymEqJKgA02luyWT3ITRG1L3T0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nGVpNEo3vuNrgKzU1PKfhp0HV4dWvxBxMHCydNs5ReTOK1K/3NQsH0MxeFwP0UPBmg37Bqh2XJeMrLPqH440UAUmh9RbZpsjJyKhNuO+5wfpLDEPOgHwmMsQ0LM7PfQ61zhm7gAp8B7x3acJEU3MCt6Jkw7cfaUFI459GJKh/Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dWfNMsx8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dWfNMsx8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C35C4CED6;
	Fri, 10 Jan 2025 20:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736540268;
	bh=KHFb+IIBdpz2xEoLQwymEqJKgA02luyWT3ITRG1L3T0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dWfNMsx8FEtfj501J1ijdXyPsa5Jk283UzeCkvt4mLXAUIHVboYkarZq+DxMKjXFd
	 nF9WZ8Pr/EtD8baqqiz+pstTCiZlciJKz0IK9XnM0Y10WZDvZdObd2XIiE9j8zAAOm
	 ZuLCnjMNMpISyJ2aDfnk9abSzE44OnXXoiqwOSC225w8jBhWFbiUHtwnkzU9i7eYcu
	 eB+BZDTURDyDPC679Ku0W7gv+ezNnF2uhCodKGqgUC38RF+u3u1Nkk9Ztz4wBr5KEP
	 aQlIx32Rp3sugGQhZETVgZZw5H47Ojap7VlSqlCP6EcAhdEu7o83WgDkB9BcyIEDmp
	 SuDRqx0o1bd2Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 10 Jan 2025 21:15:34 +0100
Subject: [PATCH v6 11/14] rust: hrtimer: implement `HrTimerPointer` for
 `Pin<Box<T>>`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-hrtimer-v3-v6-12-rc2-v6-11-f71d50f16482@kernel.org>
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
In-Reply-To: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Danilo Krummrich <dakr@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, 
 Guangbo Cui <2407018371@qq.com>, Dirk Behme <dirk.behme@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4491; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=KHFb+IIBdpz2xEoLQwymEqJKgA02luyWT3ITRG1L3T0=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBngX/pLLmxswTtGDeunIFRnAQ0SzJrga3tn5D6A
 qpWM3TqVYyJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ4F/6QAKCRDhuBo+eShj
 d4JtD/4i0TiVEfyHUkux+vyLMAzAP8haAi5HuyJnrmHgXIFgi0SehATaOxZKOcfGbeJbtlTO/86
 aQpIJvKUQINRyWz0xY0E2qD1cBxqBbnfytT2E6hsa0L2Xkpc4N/Tty+HtiHE2STFykpHFqOqwbZ
 MBcAN7X/NAJ44fKmm1H+t/OCe9R2PfpOy4eKYQsfyZGW/KMYIsj7SGoUDjKUJqmb2YDjuxt9BOz
 uZvFL5zZaHBaL3CsgYl0twWZMwwtg1lTh4814LAgS8VgIewy8mURrDyyESubsC8UZT3Mj5Vh9eK
 nBH3qVNajfAv0k5MJrCzJf7XUjokAOmvddg3AyjKps3+deXACTOEvsrpvON0YnYE+ib4j26Za1X
 FrQk/brK/gy3Ctm8FnylsIiNP2boBzVOzxhX8VXoI0/YeaLKOYTZ2M2Lz+rJrVKuB4WjeAfTm3D
 sgsmy51PqMOo/NaJygyxhDGko9fxvMw5I29EcQ5tAvV0qqrPScb7VnKA+snOrrvsIGBj34a0y/s
 zWc9bK6RxK9b3XN88raYzNt+4nPvpaABbQsSFIWO+SeNcTDnvT4dttk683hUXFsy3KQyuAQgtuQ
 PWVuL1bUEa/w2g2V5ckwFYryJwkCPubF4Y/5Z9SxMiZuoLFtQikQgcN2OU2upWIQOEHdRNQtCgC
 WNIGGkOhL5xjRrg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Allow `Pin<Box<T>>` to be the target of a timer callback.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs      |   2 +
 rust/kernel/time/hrtimer/tbox.rs | 102 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 9220a8f559271c7eda8d457dbd52cf9e4800ec14..885d1772f7466725d2a421990f1ae154290ccf60 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -396,3 +396,5 @@ unsafe fn raw_get_timer(ptr: *const Self) ->
 mod arc;
 mod pin;
 mod pin_mut;
+// `box` is a reserved keyword, so prefix with `t` for timer
+mod tbox;
diff --git a/rust/kernel/time/hrtimer/tbox.rs b/rust/kernel/time/hrtimer/tbox.rs
new file mode 100644
index 0000000000000000000000000000000000000000..8dec40f7313921cd9f5bf357bb84962480385359
--- /dev/null
+++ b/rust/kernel/time/hrtimer/tbox.rs
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use super::HasHrTimer;
+use super::HrTimer;
+use super::HrTimerCallback;
+use super::HrTimerHandle;
+use super::HrTimerPointer;
+use super::RawHrTimerCallback;
+use crate::prelude::*;
+use crate::time::Ktime;
+use core::mem::ManuallyDrop;
+
+/// A handle for a [`Box<HasHrTimer<U>>`] returned by a call to
+/// [`HrTimerPointer::start`].
+pub struct BoxHrTimerHandle<U, A>
+where
+    U: HasHrTimer<U>,
+    A: crate::alloc::Allocator,
+{
+    pub(crate) inner: *mut U,
+    _p: core::marker::PhantomData<A>,
+}
+
+// SAFETY: We implement drop below, and we cancel the timer in the drop
+// implementation.
+unsafe impl<U, A> HrTimerHandle for BoxHrTimerHandle<U, A>
+where
+    U: HasHrTimer<U>,
+    A: crate::alloc::Allocator,
+{
+    fn cancel(&mut self) -> bool {
+        // SAFETY: As we obtained `self.inner` from a valid reference when we
+        // created `self`, it must point to a valid `U`.
+        let timer_ptr = unsafe { <U as HasHrTimer<U>>::raw_get_timer(self.inner) };
+
+        // SAFETY: As `timer_ptr` points into `U` and `U` is valid, `timer_ptr`
+        // must point to a valid `HrTimer` instance.
+        unsafe { HrTimer::<U>::raw_cancel(timer_ptr) }
+    }
+}
+
+impl<U, A> Drop for BoxHrTimerHandle<U, A>
+where
+    U: HasHrTimer<U>,
+    A: crate::alloc::Allocator,
+{
+    fn drop(&mut self) {
+        self.cancel();
+        // SAFETY: `self.inner` came from a `Box::into_raw` call
+        drop(unsafe { Box::<U, A>::from_raw(self.inner) })
+    }
+}
+
+impl<U, A> HrTimerPointer for Pin<Box<U, A>>
+where
+    U: Send + Sync,
+    U: HasHrTimer<U>,
+    U: for<'a> HrTimerCallback<CallbackTarget<'a> = Pin<Box<U, A>>>,
+    U: for<'a> HrTimerCallback<CallbackTargetParameter<'a> = Pin<&'a U>>,
+    A: crate::alloc::Allocator,
+{
+    type TimerHandle = BoxHrTimerHandle<U, A>;
+
+    fn start(self, expires: Ktime) -> Self::TimerHandle {
+        let self_ptr: *const U = <Self as core::ops::Deref>::deref(&self);
+
+        // SAFETY: Since we generate the pointer passed to `start` from a valid
+        // reference, it is a valid pointer.
+        unsafe { U::start(self_ptr, expires) };
+
+        // SAFETY: We will not move out of this box during timer callback (we
+        // pass an immutable reference to the callback).
+        let inner = unsafe { Pin::into_inner_unchecked(self) };
+
+        BoxHrTimerHandle {
+            inner: Box::into_raw(inner),
+            _p: core::marker::PhantomData,
+        }
+    }
+}
+
+impl<U, A> RawHrTimerCallback for Pin<Box<U, A>>
+where
+    U: HasHrTimer<U>,
+    U: for<'a> HrTimerCallback<CallbackTarget<'a> = Pin<Box<U, A>>>,
+    U: for<'a> HrTimerCallback<CallbackTargetParameter<'a> = Pin<&'a U>>,
+    A: crate::alloc::Allocator,
+{
+    unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::hrtimer_restart {
+        // `HrTimer` is `repr(C)`
+        let timer_ptr = ptr.cast::<super::HrTimer<U>>();
+
+        // SAFETY: By C API contract `ptr` is the pointer we passed when
+        // queuing the timer, so it is a `HrTimer<T>` embedded in a `T`.
+        let data_ptr = unsafe { U::timer_container_of(timer_ptr) };
+
+        // SAFETY: We called `Box::into_raw` when we queued the timer.
+        let tbox = ManuallyDrop::new(Box::into_pin(unsafe { Box::<U, A>::from_raw(data_ptr) }));
+
+        U::run(tbox.as_ref()).into()
+    }
+}

-- 
2.47.0


