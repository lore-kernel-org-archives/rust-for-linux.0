Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610111;
	b=v0dbR1qXDZAcYDIbXKZgsZIVSqZ4oZUxIyx8y0gr4uh9xzjSg9xxdhTzZCJ4FlOnQd9y
	 B5y1mO2WUZv9wbLsC6VXOxap2y18i4uUezee5wYhQUy8DDr/7qx6icLpNAVHrMyPPkeQH
	 hRM+bce1NfH6/HRLMhdW1jwE9Es/d2VG/8BeIJQGHBV4bjb6puLBPmizi7EgWrCcSqoXV
	 dAg0Uxy5qcDDRSXDCIqSsgx0FRe014nGhDE9f0ZiDaA9JxbWv+HXwhIXik/sFx+dcrzXp
	 wbJaPQROug1BEHwAOhGe1vfRJsxMSUvTsuaP+crVRqpbR8dPhEwkHi4xEgndwjbrhSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610111;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rVOPSuCPCMoFE6LpX/yeyRJrgFANkWdlpHje0lxXp0s=;
	b=zh37/kkEpt4pKcc+QSumgsFnAO+7FSrUaD3K29T88FjZUgxkA1umuncqw3fzr5oMzvr+
	 nDb7DEc56K/2tTcB1YbWJR2pismShFvFDscTVOIY1DYX5jlRDtXhyLiv+5mQGZLV7Sap8
	 iGz04jdqMclyWdFds43nIS1663DYIO183WpQy+kUMMvP3ME6IjtkHzZwytlzmhVsSNv/G
	 0uquAq6ARZ5HqYB0vvmnfWGPTJz7l8vJX4NezLITSqwvUKYWbTlSI6wjNC0Pq07QYJHjH
	 WJjC8/d83gHmjEAkeV17I8GzWb+QbyVu4xQV2oH5kvhpRvmjrKekRsiFaUjLv3wpCnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CWRcd7aG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CC1606A31E;
	Wed, 25 Nov 2026 12:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CWRcd7aG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5451F000C0;
	Wed, 25 Nov 2026 12:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795610110;
	bh=rVOPSuCPCMoFE6LpX/yeyRJrgFANkWdlpHje0lxXp0s=;
	h=From:Date:Subject:To:Cc;
	b=CWRcd7aG1TqVibq/S8JQaKZSnADcLNvNk2m5ePAz0YKyQo3ZsDhQdeFHAZ16uwupF
	 Du7eHryQzUz8ANYTZcKl5a/h/9byH5UVlogrlQ5AipYOUSZb1n42cmSfqlqU+pkxsb
	 n+LLlc61FnM1Jy/ZlL6f/WwupTguHyAg8EHD3S0hXovInO44wj3FIIdd/DBtN9LfV5
	 aZObPbLEs31phGNELmFgnS3I1GgEOEzqHU/ZUpEcvZrHbGcDrW0McM0YCqEBK525In
	 xLN8AyYYezpX3nq1UCnINkL6PKaQ1kSjBDd2GlWNEIJnL/2nhYi5DHNNgH1vnH1+yQ
	 dUQ+/+gsZu+Ng==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 25 Nov 2026 13:34:41 +0100
Subject: [PATCH v4] rust: hrtimer: add active() method to query timer state
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-hrtimer-active-v4-1-415a37b74d67@kernel.org>
X-B4-Tracking: v=1; b=H4sIAODVBmsC/3XMQQ7CIBRF0a00jMXwoUB15D6MA4TflqitgYZom
 u5d2oHGVIfvJeeOJGLwGMm+GEnA5KPvuzzKTUFsa7oGqXd5E864YhwkbcPgbxiosYNPSGuoRAl
 Qo1RnktE9YO0fS/B4yrv1cejDc+knmN+/qQQUqNGydMDKHbf8cMHQ4XXbh4bMrcQ/XrG159lr7
 bSUtoLa6ZUXbw/ww4vsJVdCVayy1pkvP03TC2Q2FgotAQAA
X-Change-ID: 20260215-hrtimer-active-f183411fe56b
To: Boqun Feng <boqun@kernel.org>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5392; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=QbtPrO25iXB/Sjm97X9K8N9s3R2++njTj+CzrlqoDz8=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBrBtXmcSj/iRWcGmlNlAwDP+ToJPau3/CK0F32s
 9vDWnn3bPmJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCawbV5gAKCRD6UCkIqsW9
 0BEbD/47uW73krVM+Udac/H9jsqmviy22cbUBmN8/IZkbLtwvsKpioEYKE2y18adfYImbGSkP27
 UpJVKqSNBa59h5uns7cruq9jfImYYvs14OjvUUUBn8iNxqH+YvDi3E3D4E/batCSCuezzmmFvoE
 qw08+ZPKYYG3tEHSQvhHtAGExrw6vYiWIRgc9D/3gld5v6/7kwBd6LQ5k521mxT0h37Z5zaYNhw
 bmiXZnFSI1lrsIHq/Q0tx9AhFQepL08DKhKOdaZbVU8LnrtDqbIxGmyT85H/P1nIlspJgayPNlP
 BQTF9mgOrlfZGeiC5SFAR3bA5ltkuTYVSwIqoT0PH1krUIorILoOslJ7LIiPX+XqDuZX6oQ4/tE
 i48XRGD6t1i+pZ+UP5gMYCTlVcKl5BooEWUmulm2ApGplxV8jyK68nJe8JxcPAL8sAOnqBElGg4
 jhOiwar7oMnuuZYxP3XaU0fcXa2TJuy0I+a1XwE/9rndvVpuv2kXXHFgg7M0tFp5fmx7a5rHufT
 8zudCF/aU5ZWgY5g7xpK5gTgCh2Y8LxGii8/71iSN8V6e6NLq9VOFaoupEfh17V0N8svBDpfoqi
 FkGIVcZNuLqvl4Y1Y1uvAt4wVsPB+At/Jhf7oeocEOY0pbnaEuqBRDs6/dyYEWQ6L7cCLy3+van
 bHFd5UMW6Xw2PYg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add an `active()` method to HrTimer that returns true if the timer is in
the started or running states. This wraps the kernel's hrtimer_active()
function.

Unlike a direct read of `node.expires`, this does not race with a
concurrent start operation. hrtimer_active() reads the timer state inside a
seqcount retry loop and re-reads `timer->base` with READ_ONCE(), and the
core documents that it must not return a false negative. No exclusive
access to the timer is therefore required, and the SAFETY comment reflects
that.

The returned value is still only a snapshot: a concurrent event can
change the state right after the call. Callers that need a stable answer
have to serialize against such events themselves, exactly as C callers of
hrtimer_active() do. This is documented on the method.

Also add documentation clarifying the definition of an active timer.

Introduce the term `active` as a set of timer states composed of `started`
and `running`.

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v4:
- Reword the snapshot note to not name specific events (Tomonori).
- Link to v3: https://msgid.link/20261105-hrtimer-active-v3-1-52636808ccda@kernel.org

Changes in v3:
- Rebase on v7.4-rc1.
- Improve documentation.
- Move the note about not requiring exclusive access above the example.
- Name the user of the API below the cut.
- Link to v2: https://msgid.link/20260605-hrtimer-active-v2-1-77d755c81fd7@kernel.org

Changes in v2:
- Mark `active()` `#[inline]` (Gary).
- Use the `[`true`]` intra-doc link in the rustdoc (Miguel).
- Document that `active()` does not require exclusive access to the timer,
  and reflect this in the SAFETY comment (Gary).
- Add a doctest example that initializes a timer and asserts it is not
  active (Miguel).
- Link to v1: https://msgid.link/20260215-hrtimer-active-v1-1-a754d10492c2@kernel.org
---
The bandwidth throttling timer in the Rust null block driver will call this
function. It is used to arm the timer on request submission if it is not
already armed.
---
 rust/kernel/time/hrtimer.rs | 64 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index a53f7f1341be..e960821ace3b 100644
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
@@ -593,6 +595,68 @@ pub fn expires(&self) -> HrTimerInstant<T>
             )
         }
     }
+
+    /// Query the state of the timer.
+    ///
+    /// Returns [`true`] if the timer is in the started or running states.
+    ///
+    /// This method synchronizes internally and does not require exclusive access to the timer.
+    ///
+    /// The returned value is a snapshot. A concurrent event can change the state of the timer
+    /// right after this method returns, so callers that need the state to be stable must serialize
+    /// against such events by other means.
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
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260215-hrtimer-active-f183411fe56b

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


