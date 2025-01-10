Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740EA21576E;
	Fri, 10 Jan 2025 20:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736540229; cv=none; b=OPAEqmtuz9LoWXSM52a41mFajWwXaGSpm2UUfxEof/q1fUGKRHDoXXjKQNKWie95LEY9URMcMKfXLP4BbeCxXKTaUZQTR67Q74/Y7Fhj0M99T3GE/OdWu3bKr439nxCKPnA3btzIKRAxPOqoNLvYwse6ZBHCKplAnL1JJXMtyEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736540229; c=relaxed/simple;
	bh=2B8YKUuxQpOsHzf/q9lV+i1do3MHPZjzaDxDa768d2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a0TZ5nn5ZYbIJnP24vF0J+hlnu72ZqbIkRrMExMIHsZkwsU3GgBmkZwA0FwOq6OgFD2e3psZ/ZxqF9WMzA44jYrK8pMy0qweMA8f+R4eVbd+hWefmE9Vs2l1Nxch2K74HagOxuXDWA0dufEGIQgRDZHzF3QEXa/mlm4/FbhYdy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mijCMLQE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mijCMLQE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C91C4CED6;
	Fri, 10 Jan 2025 20:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736540229;
	bh=2B8YKUuxQpOsHzf/q9lV+i1do3MHPZjzaDxDa768d2A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mijCMLQEtTH4tTIu9MGSpNY0WMzhuFyMxY4/27UTiXxSAYL+I2lcjy63Sqem7aA5L
	 iDTKgG3GMRY78hPGPV3UWmRZMWmnyqokPDeWIb7aMlcTpm8s+si6Wy8It8ww0nmiep
	 nf8+YBFjGiuvo8dUJCsk7zY2msItceN5KnG3hLVl2Q5jfsgjY30Eq/n6Ay+8LWMK1K
	 /aeS5KYXWvOmmtRGi4jrFpOf4NIM6V1gfC/uCkDL2CxP0JCHeLKffUZ3Z97SRaQFya
	 jcqWWP6rQmV5fAJWcWurmobPFvOtwinIOAniAESx/E9tbTrFPa0uZ7PaI4F2k5QI6m
	 Q1J+8t3Iz32oQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 10 Jan 2025 21:15:35 +0100
Subject: [PATCH v6 12/14] rust: hrtimer: add `HrTimerMode`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-hrtimer-v3-v6-12-rc2-v6-12-f71d50f16482@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5755; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=2B8YKUuxQpOsHzf/q9lV+i1do3MHPZjzaDxDa768d2A=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBngX/qAunfSjPVSarQMG9m8wJTSIFkRKoIr7BlE
 SU9ZI/cdOqJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ4F/6gAKCRDhuBo+eShj
 d0TlD/0SuXfCjWDLVNGEuvYwrmwhY6XdNTVUl7v0m56D3HeWYyIFmuvKwxVkOzfxSRN1/jCiWce
 E6r6b+FMy7M7LJM5pydVynyaUYcjuzEQeE2Tb+NSkf6p+478pjq8jMwBDKtRcYGbldMAfChqxMJ
 taE4hKX7YiV9yEiyILkIORRdwTOpUl0zeFtMw8JnHBqvpVpQ1fiG/qKxV61lfSbADIj3n9rvWkZ
 BcvyyKrVfGKe0CCeEsF9CDBWwcY42nTnEV9cNs0l+3M3w6hdLMmohvY6EqadEaV19mQqSSHahcm
 YGNp9KS5DScA5DnkzfijItKQO226uLC5HBoQ6TRxhRQ/k5NQm27KS9l0xhP3jprTTBqH0xsrLDX
 +tSsFq2pply8EgFtJXXjrM/OuD4sD4eEPGoT1a3OC8vMRrFykq/WotvwV5KFOVXtzA8fGAeILvC
 hYXkkbRdGhPeRCWnMIVz/ohpnYZrPFX3TZ9wfr4EeBy+xREXvXihFhWEKQsf6vjB3NJY/k74smq
 9mHer5HccV1eHz30nbBkj+ebBWsr8oQ6Ce9YAgZWjXnliWxpUuv+Ui501/OVaoeeoDo1Xznp1Yg
 Du5KbaDlRF3VkhTjp2JaY+hxqNuWL06hlQHQVDyEXZJXnjv9IJsCEil+Ij7T+CHLWznXdJEXFl+
 WWtHKbsuACWxWDg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Allow selection of timer mode by passing a `HrTimerMode` variant to
`HrTimer::new`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs | 87 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 84 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 885d1772f7466725d2a421990f1ae154290ccf60..232af60f7c38370a4b2414a4c3780e06d2aa0c7d 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -43,6 +43,8 @@
 pub struct HrTimer<U> {
     #[pin]
     timer: Opaque<bindings::hrtimer>,
+    // This field goes away when `bindings::hrtimer_setup` is added.
+    mode: HrTimerMode,
     _t: PhantomData<U>,
 }
 
@@ -55,7 +57,7 @@ unsafe impl<U> Sync for HrTimer<U> {}
 
 impl<T> HrTimer<T> {
     /// Return an initializer for a new timer instance.
-    pub fn new() -> impl PinInit<Self>
+    pub fn new(mode: HrTimerMode) -> impl PinInit<Self>
     where
         T: HrTimerCallback,
     {
@@ -70,10 +72,11 @@ pub fn new() -> impl PinInit<Self>
                         place,
                         Some(T::CallbackTarget::run),
                         bindings::CLOCK_MONOTONIC as i32,
-                        bindings::hrtimer_mode_HRTIMER_MODE_REL,
+                        mode.into(),
                     );
                 }
             }),
+            mode: mode,
             _t: PhantomData,
         })
     }
@@ -320,7 +323,7 @@ unsafe fn start(self_ptr: *const Self, expires: Ktime) {
                 Self::c_timer_ptr(self_ptr).cast_mut(),
                 expires.to_ns(),
                 0,
-                bindings::hrtimer_mode_HRTIMER_MODE_REL,
+                (*Self::raw_get_timer(self_ptr)).mode.into(),
             );
         }
     }
@@ -361,6 +364,84 @@ fn from(value: HrTimerRestart) -> Self {
     }
 }
 
+/// Operational mode of [`HrTimer`].
+#[derive(Clone, Copy)]
+pub enum HrTimerMode {
+    /// Timer expires at the given expiration time.
+    Absolute,
+    /// Timer expires after the given expiration time interpreted as a duration from now.
+    Relative,
+    /// Timer does not move between CPU cores.
+    Pinned,
+    /// Timer handler is executed in soft irq context.
+    Soft,
+    /// Timer handler is executed in hard irq context.
+    Hard,
+    /// Timer expires at the given expiration time.
+    /// Timer does not move between CPU cores.
+    AbsolutePinned,
+    /// Timer expires after the given expiration time interpreted as a duration from now.
+    /// Timer does not move between CPU cores.
+    RelativePinned,
+    /// Timer expires at the given expiration time.
+    /// Timer handler is executed in soft irq context.
+    AbsoluteSoft,
+    /// Timer expires after the given expiration time interpreted as a duration from now.
+    /// Timer handler is executed in soft irq context.
+    RelativeSoft,
+    /// Timer expires at the given expiration time.
+    /// Timer does not move between CPU cores.
+    /// Timer handler is executed in soft irq context.
+    AbsolutePinnedSoft,
+    /// Timer expires after the given expiration time interpreted as a duration from now.
+    /// Timer does not move between CPU cores.
+    /// Timer handler is executed in soft irq context.
+    RelativePinnedSoft,
+    /// Timer expires at the given expiration time.
+    /// Timer handler is executed in hard irq context.
+    AbsoluteHard,
+    /// Timer expires after the given expiration time interpreted as a duration from now.
+    /// Timer handler is executed in hard irq context.
+    RelativeHard,
+    /// Timer expires at the given expiration time.
+    /// Timer does not move between CPU cores.
+    /// Timer handler is executed in hard irq context.
+    AbsolutePinnedHard,
+    /// Timer expires after the given expiration time interpreted as a duration from now.
+    /// Timer does not move between CPU cores.
+    /// Timer handler is executed in hard irq context.
+    RelativePinnedHard,
+}
+
+impl From<HrTimerMode> for bindings::hrtimer_mode {
+    fn from(value: HrTimerMode) -> Self {
+        use bindings::*;
+        match value {
+            HrTimerMode::Absolute => hrtimer_mode_HRTIMER_MODE_ABS,
+            HrTimerMode::Relative => hrtimer_mode_HRTIMER_MODE_REL,
+            HrTimerMode::Pinned => hrtimer_mode_HRTIMER_MODE_PINNED,
+            HrTimerMode::Soft => hrtimer_mode_HRTIMER_MODE_SOFT,
+            HrTimerMode::Hard => hrtimer_mode_HRTIMER_MODE_HARD,
+            HrTimerMode::AbsolutePinned => hrtimer_mode_HRTIMER_MODE_ABS_PINNED,
+            HrTimerMode::RelativePinned => hrtimer_mode_HRTIMER_MODE_REL_PINNED,
+            HrTimerMode::AbsoluteSoft => hrtimer_mode_HRTIMER_MODE_ABS_SOFT,
+            HrTimerMode::RelativeSoft => hrtimer_mode_HRTIMER_MODE_REL_SOFT,
+            HrTimerMode::AbsolutePinnedSoft => hrtimer_mode_HRTIMER_MODE_ABS_PINNED_SOFT,
+            HrTimerMode::RelativePinnedSoft => hrtimer_mode_HRTIMER_MODE_REL_PINNED_SOFT,
+            HrTimerMode::AbsoluteHard => hrtimer_mode_HRTIMER_MODE_ABS_HARD,
+            HrTimerMode::RelativeHard => hrtimer_mode_HRTIMER_MODE_REL_HARD,
+            HrTimerMode::AbsolutePinnedHard => hrtimer_mode_HRTIMER_MODE_ABS_PINNED_HARD,
+            HrTimerMode::RelativePinnedHard => hrtimer_mode_HRTIMER_MODE_REL_PINNED_HARD,
+        }
+    }
+}
+
+impl From<HrTimerMode> for u64 {
+    fn from(value: HrTimerMode) -> Self {
+        Into::<bindings::hrtimer_mode>::into(value) as u64
+    }
+}
+
 /// Use to implement the [`HasHrTimer<T>`] trait.
 ///
 /// See [`module`] documentation for an example.

-- 
2.47.0


