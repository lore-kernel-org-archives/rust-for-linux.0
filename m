Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C071521D582;
	Fri, 10 Jan 2025 20:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736540253; cv=none; b=pya1mLoZoIgCYlFlZXC3iX/HFS3K4ZAkuIUZQ36cJfNvBGLJNHgVxTfHqiG206Knaalb9ZiFhuZlw79lPbexksJdxq7kv4pTXft11wuYZ8X/R8/A5Jiq0BDNTKNAnSiZA/pa93k54Ab6Vo0EnZmVwGhYxV6z2OVlE+CVWmEKL7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736540253; c=relaxed/simple;
	bh=zomgbshZi6OHqg5Y1mE0Df1ZCQ0F2yAc8VQTQ21hLQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q/KMfFyZ9TWs+BuHzW+/CSQbYNtQg4g54WWp1KwhmpSsbt2RHswqqB2iwuTWUAbyPNRYtNWCUkpP5XVEikkrTfl01LHKRYz5greBL0hYkCU4octmZ2egUL3m7O5Ekr7Nh2BPcXcJ65ZjtELZFz3yH5l/MxAP4WABfz5hNeEUvRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDRwvUpd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDRwvUpd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E3DC4CED6;
	Fri, 10 Jan 2025 20:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736540253;
	bh=zomgbshZi6OHqg5Y1mE0Df1ZCQ0F2yAc8VQTQ21hLQc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HDRwvUpdGPzVM8tH98Q9AASYdYQK9Ie10xe0lgCG5jhabIliaH2zMUBdr9DsP/krr
	 DhXcOAPwkDgVC8mm4Y7ovQsLWzEa/HNsUIbQk8/Pkou0sPOnH0cMnz2lJTPdV+GAZ/
	 z5l3h99mfBezGVqYGC78g/MglmgFkTH37lsaPwrI/vlNf0V5h03GKGRC8nfD+hBPCH
	 KPf162nJBwDRDw3Ds6MSrUgdXgvgkgchtCk0LxB572w3RFyYfXTvPlW2VQ1M1ctqbw
	 2Ydl8lxA3vYcacE10wU2yzB2E73eJbIPg6n76Q5lUnGNr1PKd0O6lBAzV1KhY91iSv
	 e9BunkQUXnKgw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 10 Jan 2025 21:15:31 +0100
Subject: [PATCH v6 08/14] rust: hrtimer: implement `UnsafeHrTimerPointer`
 for `Pin<&T>`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-hrtimer-v3-v6-12-rc2-v6-8-f71d50f16482@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4086; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=zomgbshZi6OHqg5Y1mE0Df1ZCQ0F2yAc8VQTQ21hLQc=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBngX/mRVS9CM6G+mx+PmnxWVWSs8v9zDpM+R+gm
 461iuvRL8CJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ4F/5gAKCRDhuBo+eShj
 d+5DEACn94SoGniFSSy5vS7DaoGk2UMUi1nIn8ywJJHbbDUOSDDeInDahPWM9l+yOwVo+n5jnRu
 e1k17SSNelLxD7B0rntvuICt6i3t0limCEFVKPEZkxGULvvxeHKODdSnz+2GJEovqmOuoQHOTGa
 iLn7uc4K9WMfN7JZp+OQOMTxpDaWWtL9W8DDPJnHv+4oIqXW7IgRP8JvejJ19ujF+ZO4oYuF0S2
 GHYuflPaIjA35tt7kRbRrqGczKYLjeuLVzqr7e8Ud1WAxf1Wady1uWUyC9uCf0vLRXDiy3XAD0V
 xtbSTuy8jZnY8IGXIMfC5m7UadjlTUmMW65Ns62o5nJ8kKap0G0tft61GhwOld52dT80EId/J9v
 7yLdHldmknrTVjm8pW229S1C9Kzy2dbi2xmmZ12YfgdmzW9QnatrEb+e0y3GtUbo5kPAp0Vz5BJ
 VhcFMPw7sDRiRNbO2blXfeRcEOF+rDIIioglk3VFq95Uzuaw7n+7F5CiPBXYA9Q2uh/85B5i8By
 CM5/vnR9urZ2VhiLVpterKxgTamMLwUtqaE2zOR424dMGDodziS4Mll7zSGGfV+Jg29yhJBq8+Q
 joAmRUxOpQVfTpFbPno9yjvpcHomEZhUDsE+v4CW4sltZUrbIWFSAM4zHCZ4xBJGAuzxRTSPXDk
 slV9T154ChsJkOA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Allow pinned references to structs that contain a `HrTimer` node to be
scheduled with the `hrtimer` subsystem.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs     |  1 +
 rust/kernel/time/hrtimer/pin.rs | 95 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 3cf81b5bb4c7071e095948f3220232a15116ed5b..d776e93584a87dfdc646816a16bacf19e444217d 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -394,3 +394,4 @@ unsafe fn raw_get_timer(ptr: *const Self) ->
 }
 
 mod arc;
+mod pin;
diff --git a/rust/kernel/time/hrtimer/pin.rs b/rust/kernel/time/hrtimer/pin.rs
new file mode 100644
index 0000000000000000000000000000000000000000..2f2d1312566c5b8a763fdb8e0283dedb0ca3e231
--- /dev/null
+++ b/rust/kernel/time/hrtimer/pin.rs
@@ -0,0 +1,95 @@
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
+/// A handle for a `Pin<&HasHrTimer>`. When the handle exists, the timer might be
+/// running.
+pub struct PinHrTimerHandle<'a, U>
+where
+    U: HasHrTimer<U>,
+{
+    pub(crate) inner: Pin<&'a U>,
+}
+
+// SAFETY: We cancel the timer when the handle is dropped. The implementation of
+// the `cancel` method will block if the timer handler is running.
+unsafe impl<'a, U> HrTimerHandle for PinHrTimerHandle<'a, U>
+where
+    U: HasHrTimer<U>,
+{
+    fn cancel(&mut self) -> bool {
+        let self_ptr: *const U = self.inner.get_ref();
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
+impl<'a, U> Drop for PinHrTimerHandle<'a, U>
+where
+    U: HasHrTimer<U>,
+{
+    fn drop(&mut self) {
+        self.cancel();
+    }
+}
+
+// SAFETY: We capture the lifetime of `Self` when we create a `PinHrTimerHandle`,
+// so `Self` will outlive the handle.
+unsafe impl<'a, U> UnsafeHrTimerPointer for Pin<&'a U>
+where
+    U: Send + Sync,
+    U: HasHrTimer<U>,
+    U: HrTimerCallback<CallbackTarget<'a> = Self>,
+{
+    type TimerHandle = PinHrTimerHandle<'a, U>;
+
+    unsafe fn start(self, expires: Ktime) -> Self::TimerHandle {
+        // Cast to pointer
+        let self_ptr: *const U = <Self as core::ops::Deref>::deref(&self);
+
+        // SAFETY: As we derive `self_ptr` from a reference above, it must point
+        // to a valid `U`.
+        unsafe { U::start(self_ptr, expires) };
+
+        PinHrTimerHandle { inner: self }
+    }
+}
+
+impl<'a, U> RawHrTimerCallback for Pin<&'a U>
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
+        let receiver_ref = unsafe { &*receiver_ptr };
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


