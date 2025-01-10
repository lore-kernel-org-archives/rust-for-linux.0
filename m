Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8486D1FFC58;
	Fri, 10 Jan 2025 20:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736540224; cv=none; b=nNdqbwBQQZE45UQO61bhEHgb8DXdWHxdzn+DiHFSUZzcKKNrd6KY3cCx2rcsZfVTHcgkxgRwF1ddgPYcWVgzQsRkGbKQiX+e7Dzj+St/7LIntHVsBu46ihWUkXteitxBjBHSSiu1euj4Zpt0yK0tsP5VG61Hw+ctBibl3a19d+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736540224; c=relaxed/simple;
	bh=qevyQGi54SiChRrkv5bMU+zfjKyXvB34zP2FU0YLPBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EUFHcV4OxPgBUCRJ4+Tw2XQdMhap790rCvZazxUG3s2mLrOISDhVS5yxP3MB2QAKdGSN2g7YvWDO+ZFnw8Z8tEHs1cegcDSY8rfLKEjyjUHaBzaoiKN5mRDJB8JEwdiXzBPv5RQ2do2tOUU3KlTxwEzkKKvZP8iRE/uJbwmrQes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSIAlsV8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSIAlsV8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5044C4CED6;
	Fri, 10 Jan 2025 20:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736540224;
	bh=qevyQGi54SiChRrkv5bMU+zfjKyXvB34zP2FU0YLPBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VSIAlsV8X8xXM4CdZT50c5IYE5Asov2ionP4SMqfwgEjr46AcxTO6hdwPajXf3I+w
	 UDp39Zwsz2HALodzt6EJ8p5L7cDlTOUn0bHQirhHuQVz240OuULm3eJ76rb2TavT6O
	 bubjoJm9Kypj2D8rHPcMdjzEcG5uiNaxqQyITFRPVdbqY4Kj24Zchm+xCEBsMMt69x
	 Iw4YHAMvlJtV0FH96ZRlSLLo38nAI6vokA3KS6er45Mh7aQsOgfEzC25HoYeSCTjDo
	 ExPcrVL7/dcZ75ufJfDuNZjdgthAdJ6SiegbYFUpo+je1ePXlBgRF3jElhwhJXpO2M
	 6l2lbKkIZS7Xg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 10 Jan 2025 21:15:27 +0100
Subject: [PATCH v6 04/14] rust: hrtimer: implement `HrTimerPointer` for
 `Arc`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-hrtimer-v3-v6-12-rc2-v6-4-f71d50f16482@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4149; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=qevyQGi54SiChRrkv5bMU+zfjKyXvB34zP2FU0YLPBU=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBngX/iLlWGjZB4syjgL3Eh8EKbHga7P7UGgteMP
 URVPZWQ7+iJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ4F/4gAKCRDhuBo+eShj
 dyrcD/4h9Ub08sfnkOMJyNBce0ubVEkDWIBz63fuGULjDWnS9CXfFWgGhz7udDHv1tGvT8hWwKe
 rjOP/kdB1DLHWVCMBAmJ/oB1aGU9MWSMxtWGRmcefWoxp8DnXIBKAQ+dXXQB6YsT0TELtxTc2PR
 9En1/si4Zdb5LUjjZSzboQsH75+e2Ce03jt9qYfbqhiL1F0h1+9LIRd7g3LhbhT+07b/6rCmWWP
 m84ztrXIy4etkMqP5qa+cbS2grmXUP3WvEwf0Rc0EhE7pMAlGB6Zm+6WwkUg/lBsHlUfecFYvPX
 gJMuQcKCr68aMSTRCG58SlIs3TUpz6RA/LYqbzQVpP0hAcGAvAw66ln3mEVVpplOsOpU68cpg4i
 ST8BDPxVtNRUXDx5b6SnAC4pJlqhix513eYHHu7SPHA1+vBfWl6OlWp6gMnpmypijN1+FOJ1J01
 EfS5ynuklZJrQi13LxQu6xqO9DJp/zWZxfMIGJEquEOKXz/na9+Ft8LmwvUBPPQ9W90jr4PyF11
 mBlNKlqlcGt5cVkHtjRvzNxMWxBhP5MgG1yu5pkg0/+XLVRCIZDOVFHFdpG+yEvCDhQDGUaehsJ
 EUBKBKnOqcaW2npfEgcz+3Agtdw5RVR68rxOgsyAl9cjmbTMgZ6fkU4ZrOeLrfTVPn7vcybJF8l
 vZJwIltnvLyyyAQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This patch allows the use of intrusive `hrtimer` fields in structs that are
managed by an `Arc`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs     |  3 +-
 rust/kernel/time/hrtimer/arc.rs | 89 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 31c461ddd2c377101ed6c1c7e009f7dccf458ebc..d0842c7c4c6ddffeef9a79cbf9727819060e4333 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -98,7 +98,6 @@ unsafe fn raw_get(ptr: *const Self) -> *mut bindings::hrtimer {
     /// # Safety
     ///
     /// `self_ptr` must point to a valid `Self`.
-    #[allow(dead_code)]
     pub(crate) unsafe fn raw_cancel(self_ptr: *const Self) -> bool {
         // SAFETY: timer_ptr points to an allocation of at least `HrTimer` size.
         let c_timer_ptr = unsafe { HrTimer::raw_get(self_ptr) };
@@ -294,3 +293,5 @@ unsafe fn raw_get_timer(ptr: *const Self) ->
         }
     }
 }
+
+mod arc;
diff --git a/rust/kernel/time/hrtimer/arc.rs b/rust/kernel/time/hrtimer/arc.rs
new file mode 100644
index 0000000000000000000000000000000000000000..4c1812f190bc7a9e0b2fcd5ea2e320f45ba584bc
--- /dev/null
+++ b/rust/kernel/time/hrtimer/arc.rs
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use super::HasHrTimer;
+use super::HrTimer;
+use super::HrTimerCallback;
+use super::HrTimerHandle;
+use super::HrTimerPointer;
+use super::RawHrTimerCallback;
+use crate::sync::Arc;
+use crate::sync::ArcBorrow;
+use crate::time::Ktime;
+
+/// A handle for an `Arc<HasHrTimer<U>>` returned by a call to
+/// [`HrTimerPointer::start`].
+pub struct ArcHrTimerHandle<U>
+where
+    U: HasHrTimer<U>,
+{
+    pub(crate) inner: Arc<U>,
+}
+
+// SAFETY: We implement drop below, and we cancel the timer in the drop
+// implementation.
+unsafe impl<U> HrTimerHandle for ArcHrTimerHandle<U>
+where
+    U: HasHrTimer<U>,
+{
+    fn cancel(&mut self) -> bool {
+        let self_ptr = Arc::as_ptr(&self.inner);
+
+        // SAFETY: As we obtained `self_ptr` from a valid reference above, it
+        // must point to a valid `U`.
+        let timer_ptr = unsafe { <U as HasHrTimer<U>>::raw_get_timer(self_ptr) };
+
+        // SAFETY: As `timer_ptr` points into `U` and `U` is valid, `timer_ptr`
+        // must point to a valid `HrTimer` instance.
+        unsafe { HrTimer::<U>::raw_cancel(timer_ptr) }
+    }
+}
+
+impl<U> Drop for ArcHrTimerHandle<U>
+where
+    U: HasHrTimer<U>,
+{
+    fn drop(&mut self) {
+        self.cancel();
+    }
+}
+
+impl<U> HrTimerPointer for Arc<U>
+where
+    U: Send + Sync,
+    U: HasHrTimer<U>,
+    U: for<'a> HrTimerCallback<CallbackTarget<'a> = Self>,
+{
+    type TimerHandle = ArcHrTimerHandle<U>;
+
+    fn start(self, expires: Ktime) -> ArcHrTimerHandle<U> {
+        // SAFETY: Since we generate the pointer passed to `start` from a
+        // valid reference, it is a valid pointer.
+        unsafe { U::start(Arc::as_ptr(&self), expires) };
+
+        ArcHrTimerHandle { inner: self }
+    }
+}
+
+impl<U> RawHrTimerCallback for Arc<U>
+where
+    U: HasHrTimer<U>,
+    U: for<'a> HrTimerCallback<CallbackTarget<'a> = Self>,
+    U: for<'a> HrTimerCallback<CallbackTargetParameter<'a> = ArcBorrow<'a, U>>,
+{
+    unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::hrtimer_restart {
+        // `HrTimer` is `repr(C)`
+        let timer_ptr = ptr.cast::<super::HrTimer<U>>();
+
+        // SAFETY: By C API contract `ptr` is the pointer we passed when
+        // queuing the timer, so it is a `HrTimer<T>` embedded in a `T`.
+        let data_ptr = unsafe { U::timer_container_of(timer_ptr) };
+
+        // SAFETY: `data_ptr` points to the `U` that was used to queue the
+        // timer. This `U` is contained in an `Arc`.
+        let receiver = unsafe { ArcBorrow::from_raw(data_ptr) };
+
+        U::run(receiver);
+
+        bindings::hrtimer_restart_HRTIMER_NORESTART
+    }
+}

-- 
2.47.0


