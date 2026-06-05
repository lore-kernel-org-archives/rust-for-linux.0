Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BCE288C2D;
	Fri,  5 Jun 2026 13:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780665109; cv=none; b=KMuAae9i6aaYzVBuR+/PIlJORg7jZef9PNiajSk2dc6vmkvdUiL1yNXxWyEuvUBxFfrfEMSgpOM9Z3IltlLSJNSzxwGJNDFS2dh09Ra12XlMbrOKIDCIsb7uI8gA9Mm58iwH2P9mYcIGq8mBNvzkgwSVmFUZF7zEsWQ0vjWgdyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780665109; c=relaxed/simple;
	bh=+Bc22omLbwxigVVncyGCyHEE6/bcGfQzOWx/Noxr+fU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LYVTCsWY5q06ljjSpLm/iFBa96kOuHis2bySlZ/vd4xZre0oYhWOS2bacsewOO4SlwpJu3DdPncr1U7ISLqRL+b+1eVk7hHcXJ2Q3hhT5zIqKnXHzfie6h5s98/I1+XzwYRkXsPgI800VF2ZjCC6sHi5YQqKSX9PxAFYVzOX1bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/rXSLJ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/rXSLJ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6949A1F00893;
	Fri,  5 Jun 2026 13:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780665107;
	bh=STTzipcp2KoXnVCU/F/vjHkCMCG9oGom2uX+xcaXvCI=;
	h=From:Date:Subject:To:Cc;
	b=E/rXSLJ3dhFlEXivNJBCXPM5OLYU3KRY2vhRfGB8RAupIswlkg/m73peF7Cyg5TDp
	 gt3/0F6oV/tD4TMJEmZjB1QVOePcow32dZWwM/6dDpr7GsMMZV45yMEPX9n37KvO8R
	 DHKrGf+SiyphrLPaKB/oR6t5JMwqstNtoD+IEoH6qIPxW7Hs+xoguL59jpw4ZeIkv0
	 YUxVENaL70pYGTotYHq6cKvlZO2L3ZFO+4PWI6EKMGxoxKpDI53IOFB5tMiUQ1boVC
	 s3JXhSiUXOqLQF/JbEi90CRc+R9T48DoJN3DzCkVBzeDRGfqS8l/4p9xWa2xBwMlh2
	 RF7lF0/m2UE6Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 05 Jun 2026 15:11:36 +0200
Subject: [PATCH v2] rust: hrtimer: add active() method to query timer state
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260605-hrtimer-active-v2-1-77d755c81fd7@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAfLImoC/3XMQQ6CMBCF4auQWVvD1ILKynsYFlimMFGpmTaNh
 vTuVvYu/5e8b4VAwhSgq1YQShzYLyX0rgI7D8tEisfSoGvd1hobNUvkJ4kabOREyuHpYBAdNe0
 Nyukl5Pi9gde+9MwhevlsfsLf+pdKqFANx8aMWJuztvpyJ1nosfcyQZ9z/gLKfiGarQAAAA==
X-Change-ID: 20260215-hrtimer-active-f183411fe56b
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boqun Feng <boqun@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4501; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=+Bc22omLbwxigVVncyGCyHEE6/bcGfQzOWx/Noxr+fU=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIssIfAVvZxpr6m/hVY0h1DOxAsjgCesrEphwO
 r1oyd2vpuOJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiLLCAAKCRD6UCkIqsW9
 0CJwD/4mmoOxhpUfOG13M+jm+s8CQi9EJXzL6UK3Wvid/p1R1fJjbta02NbVIZ1sG7NBVIMXKZn
 ik8OWT8kzRk1gMGlQKZgZg4t57jifM/lln8ELHH8k0t0uoX2raPR+rK6ORXmS4JH5TO5YrIJ5Rs
 TnUR0FoA70H4tzZjkVODBw/+UeRuV5RvepSWKgcXivxIk3wCmYIaxQZhA25aPw1z9NDEqtrjdyd
 6PIWXBhPu2B+aUVUD2zToG57NrA9uva+UYc0PL2c2WblSsuzMzG9UV5oQ9nSRxJzV7TtDFKfMig
 gQ3K7lREdHjKbWZdrLyncnilwt5yku8rnalWE0JPzgNwoRevPiNeofpr/kY2MazpnFHKu9QHTfr
 f2Thh+UGxz5nZJrVqwKiDzXJmJBfiQA4OyvwB5llnJCnxHXAqTRGxfNAYulsygPuyXA4MJhcBvi
 bGepX3BpNdawfZt7V7TUw2REnpfCHioPfByhUv3kv4h46imP2+6nRHZKz6sBa6qpq5cuNXSgk7V
 64ZPr6Jurc3sMv91/8Bmx9GPvFSOTzQCFXTcxiQxyATAXzCXqpGHoXhzSqTqOAmx1E08BQv39L1
 p8dYNeCy4dkElB9LY4GMiI/mpWs3NHHZDaE2iiMI79ViOR3NeiY69Qx2SMHimwcx7o8JfFfN6SP
 yrK1vG8evoUT1rQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add an `active()` method to HrTimer that returns true if the timer is in
the started or running states. This wraps the kernel's hrtimer_active()
function.

Also add documentation clarifying the definition of an active timer.

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v2:
- Mark `active()` `#[inline]` (Gary).
- Use the `[`true`]` intra-doc link in the rustdoc (Miguel).
- Document that `active()` does not require exclusive access to the timer,
  and reflect this in the SAFETY comment (Gary).
- Add a doctest example that initializes a timer and asserts it is not
  active (Miguel).
- Link to v1: https://msgid.link/20260215-hrtimer-active-v1-1-a754d10492c2@kernel.org

To: Andreas Hindborg <a.hindborg@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: Frederic Weisbecker <frederic@kernel.org>
To: Lyude Paul <lyude@redhat.com>
To: Thomas Gleixner <tglx@kernel.org>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
To: John Stultz <jstultz@google.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 rust/kernel/time/hrtimer.rs | 60 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 2d7f1131a813..d57276496ed6 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -71,6 +71,8 @@
 //! issue the `start` operation while the timer is in the **started** state. In
 //! this case the `start` operation is equivalent to the `restart` operation.
 //!
+//! A timer is **active** if it is either in the **started** or **running** states.
+//!
 //! # Examples
 //!
 //! ## Using an intrusive timer living in a [`Box`]
@@ -582,6 +584,64 @@ pub fn expires(&self) -> HrTimerInstant<T>
             )
         }
     }
+
+    /// Query the state of the timer.
+    ///
+    /// Returns [`true`] if the timer is in the started or running states.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{
+    /// #     impl_has_hr_timer,
+    /// #     prelude::*,
+    /// #     time::{
+    /// #         hrtimer::{
+    /// #             HasHrTimer, HrTimer, HrTimerCallback, HrTimerCallbackContext,
+    /// #             HrTimerRestart, RelativeMode,
+    /// #         },
+    /// #         Monotonic,
+    /// #     },
+    /// # };
+    /// # use pin_init::stack_pin_init;
+    /// #[pin_data]
+    /// struct ExampleTimer {
+    ///     #[pin]
+    ///     timer: HrTimer<Self>,
+    /// }
+    ///
+    /// impl ExampleTimer {
+    ///     fn new() -> impl PinInit<Self> {
+    ///         pin_init!(Self { timer <- HrTimer::new() })
+    ///     }
+    /// }
+    ///
+    /// impl HrTimerCallback for ExampleTimer {
+    ///     type Pointer<'a> = Pin<&'a Self>;
+    ///     fn run(_this: Pin<&Self>, _ctx: HrTimerCallbackContext<'_, Self>) -> HrTimerRestart {
+    ///         HrTimerRestart::NoRestart
+    ///     }
+    /// }
+    ///
+    /// impl_has_hr_timer! {
+    ///     impl HasHrTimer<Self> for ExampleTimer {
+    ///         mode: RelativeMode<Monotonic>, field: self.timer
+    ///     }
+    /// }
+    ///
+    /// stack_pin_init!(let has_timer = ExampleTimer::new());
+    /// assert!(!has_timer.timer.active());
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    ///
+    /// This method synchronizes internally and does not require exclusive access to the timer.
+    #[inline]
+    pub fn active(&self) -> bool {
+        // SAFETY: By type invariant, `self.timer` is valid. `hrtimer_active`
+        // synchronizes internally and is safe to call without exclusive
+        // access to the timer.
+        unsafe { bindings::hrtimer_active(self.timer.get()) }
+    }
 }
 
 /// Implemented by pointer types that point to structs that contain a [`HrTimer`].

---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260215-hrtimer-active-f183411fe56b

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


