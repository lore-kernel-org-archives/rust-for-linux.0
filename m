Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD401218EAB;
	Fri, 10 Jan 2025 20:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736540258; cv=none; b=CeQ2yHoXqtaVSjkeYbUl5JrKMzvmLCBhvFe2NULAooqYo9fwnRALAcrKH+1THfOPALMHUIru1rS02RuK7cyqDYTj0A3evTtjGYIiZfqrlgqsSVH3tdvU9YECKINf91XQlmS6TV8OvEDqA5Hliw1DTosmHE60+N6hwo5O9grzNIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736540258; c=relaxed/simple;
	bh=cmhFauQI7O/oexdgGkRHky+PEc+0YuhEk/L5EibWW7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U59kFkF2ClevHMQUgFX55moAKMf/J5gkNTe+4FdcpJByAsvcTidkIIL/IwwmDbigyiVFF7hgNUwNsqhGhoTA2AYieNOiLrhLLbxdjg6Twva4RWNTpe7QjbIRyThuEEIuepWFEdFEmdRJjNypnGHPwUTT5rZWsLJPgFvbUyxizAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHG1waOK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHG1waOK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08B9C4CED6;
	Fri, 10 Jan 2025 20:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736540258;
	bh=cmhFauQI7O/oexdgGkRHky+PEc+0YuhEk/L5EibWW7Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CHG1waOKDdZap58v4etPY0gb2mU4wNnq9hnHZm3Gvque2RJ4jC/uVxlxTLt4UJYh4
	 tYuXcypK2uvF6OBQVngXJIWjLzzGX4UnkCzdTHCesjQUF8oGEuL9nmN85kauT4fjdR
	 gI0Ddb4hWUHrxFM1KX3YSZMvlIGhO2NURA+9yaS1Pc9t7oIfuaVf38NYY6PLE9svlL
	 RonngYC6myVtia/LQ0BjQRxpK5rBVNywNsHJMjKht+IIS+UHgbfZpmCuzlGodLcgt+
	 8VtV28jR9owL5xM4/hlfRa48UGNKJl2GFp+6dlxc7VCIitW1xXpWgUH948h61aPjTs
	 ++R8ff6nBqSyQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 10 Jan 2025 21:15:32 +0100
Subject: [PATCH v6 09/14] rust: hrtimer: implement `UnsafeHrTimerPointer`
 for `Pin<&mut T>`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-hrtimer-v3-v6-12-rc2-v6-9-f71d50f16482@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4300; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=cmhFauQI7O/oexdgGkRHky+PEc+0YuhEk/L5EibWW7Y=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBngX/nIFloagUvml305A/oD00NwmJqUOyb8W7W1
 l+o+yTCxKiJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ4F/5wAKCRDhuBo+eShj
 d1B7EADDGS8fKhObnpKbqA9/q0G1Z10/jt4FSTtfV30dWxL9jQexu22m+pkXFk+d6S8/+ooH2t5
 6bh6IcTmBEwfq6OglMUi3c3Wu8dTyhapfwXxMLjXQhUJkMKvKKSSBOT17ui1UARFqGAE95SglCv
 XwM30TrqhB7aohgpNHVBO6yUH0OL6+0lF9A6JFFcEJTaLWF0p2l7oL0lpmBzwXLr/l+cMZztdj1
 7iP0/eunkGbreQpKTkQUe8iEL6hDIIU4B69sDuHL/B6tr+lK4KGL/+PSmXn7VSQPMt9xpTaezUA
 UoXZyrsNn7w4SmwiZHdvTO6vUjSy772QO6F7T5ONOXk3CYM91Ys7FLP2BTsdNgaINtmBrbljgED
 WdSUmbXEUVtbnwgepAuE8vYAeSkmRIxAdXRB5ZiqfrF39n3qzaYz6upDP/TaF2X3ZQaiUY76VGl
 m0SxEPo0uSKV9hW+ls+RyidT2BR7vG6ug1GwLPm+EqgRnDcW8P93L92cS/VQ6y71lFvA+9ewyK/
 NQ/ebJuZff5JKtCpTJn9xQNs5D5u5XRlJ1jfj3eR7msrimJgF7DisSMBH9fxYH/2aMG01XzsVCq
 UHFWVLWDAiMSVOTM/cUCLgB8DBPiLjmT/ybn9U4rn5q5a8A0TnrTlFQJ/V03g8OFR/KvKoe0oX2
 TsBpsV5CbZd6O3w==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Allow pinned mutable references to structs that contain a `HrTimer` node to
be scheduled with the `hrtimer` subsystem.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs         |  1 +
 rust/kernel/time/hrtimer/pin_mut.rs | 97 +++++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index d776e93584a87dfdc646816a16bacf19e444217d..9220a8f559271c7eda8d457dbd52cf9e4800ec14 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -395,3 +395,4 @@ unsafe fn raw_get_timer(ptr: *const Self) ->
 
 mod arc;
 mod pin;
+mod pin_mut;
diff --git a/rust/kernel/time/hrtimer/pin_mut.rs b/rust/kernel/time/hrtimer/pin_mut.rs
new file mode 100644
index 0000000000000000000000000000000000000000..adcbba2b5ca9759fbdcc235ba75e006e35724d10
--- /dev/null
+++ b/rust/kernel/time/hrtimer/pin_mut.rs
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use super::HasHrTimer;
+use super::HrTimer;
+use super::HrTimerCallback;
+use super::HrTimerHandle;
+use super::RawHrTimerCallback;
+use super::UnsafeHrTimerPointer;
+use crate::time::Ktime;
+use core::pin::Pin;
+
+/// A handle for a `Pin<&mut HasHrTimer>`. When the handle exists, the timer might
+/// be running.
+pub struct PinMutHrTimerHandle<'a, U>
+where
+    U: HasHrTimer<U>,
+{
+    pub(crate) inner: Pin<&'a mut U>,
+}
+
+// SAFETY: We cancel the timer when the handle is dropped. The implementation of
+// the `cancel` method will block if the timer handler is running.
+unsafe impl<'a, U> HrTimerHandle for PinMutHrTimerHandle<'a, U>
+where
+    U: HasHrTimer<U>,
+{
+    fn cancel(&mut self) -> bool {
+        // SAFETY: We are not moving out of `self` or handing out mutable
+        // references to `self`.
+        let self_ptr = unsafe { self.inner.as_mut().get_unchecked_mut() as *mut U };
+
+        // SAFETY: As we got `self_ptr` from a reference above, it must point to
+        // a valid `U`.
+        let timer_ptr = unsafe { <U as HasHrTimer<U>>::raw_get_timer(self_ptr) };
+
+        // SAFETY: As `timer_ptr` is derived from a reference, it must point to
+        // a valid and initialized `HrTimer`.
+        unsafe { HrTimer::<U>::raw_cancel(timer_ptr) }
+    }
+}
+
+impl<'a, U> Drop for PinMutHrTimerHandle<'a, U>
+where
+    U: HasHrTimer<U>,
+{
+    fn drop(&mut self) {
+        self.cancel();
+    }
+}
+
+// SAFETY: We capture the lifetime of `Self` when we create a
+// `PinMutHrTimerHandle`, so `Self` will outlive the handle.
+unsafe impl<'a, U> UnsafeHrTimerPointer for Pin<&'a mut U>
+where
+    U: Send + Sync,
+    U: HasHrTimer<U>,
+    U: HrTimerCallback<CallbackTarget<'a> = Self>,
+{
+    type TimerHandle = PinMutHrTimerHandle<'a, U>;
+
+    unsafe fn start(self, expires: Ktime) -> Self::TimerHandle {
+        // Cast to pointer
+        let self_ptr: *const U = <Self as core::ops::Deref>::deref(&self);
+
+        // SAFETY: As we derive `self_ptr` from a reference above, it must point
+        // to a valid `U`.
+        unsafe { U::start(self_ptr, expires) };
+
+        PinMutHrTimerHandle { inner: self }
+    }
+}
+
+impl<'a, U> RawHrTimerCallback for Pin<&'a mut U>
+where
+    U: HasHrTimer<U>,
+    U: HrTimerCallback<CallbackTarget<'a> = Self>,
+    U: HrTimerCallback<CallbackTargetParameter<'a> = Self>,
+{
+    unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::hrtimer_restart {
+        // `HrTimer` is `repr(C)`
+        let timer_ptr = ptr as *mut HrTimer<U>;
+
+        // SAFETY: By the safety requirement of this function, `timer_ptr`
+        // points to a `HrTimer<U>` contained in an `U`.
+        let receiver_ptr = unsafe { U::timer_container_of(timer_ptr) };
+
+        // SAFETY: By the safety requirement of this function, `timer_ptr`
+        // points to a `HrTimer<U>` contained in an `U`.
+        let receiver_ref = unsafe { &mut *receiver_ptr };
+
+        // SAFETY: `receiver_ref` only exists as pinned, so it is safe to pin it
+        // here.
+        let receiver_pin = unsafe { Pin::new_unchecked(receiver_ref) };
+
+        U::run(receiver_pin).into()
+    }
+}

-- 
2.47.0


