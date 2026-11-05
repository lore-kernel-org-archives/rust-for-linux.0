Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873863;
	b=AtqLCJ56hckpVvcgu2PuK4KAqkQewGMMUtMi+lCMumGXNVVfbKf9bwgM3dA84lZK2ssN
	 jqme2xPzEG38xGvuBAqKW9+HIUFimSlSlNr08+9CstANvYmpYMA5XxhEDi5Sih6cY4mlN
	 gfzTiCC20GuyFcF4K8L6P7m/EKzwm03Cy6XUjifs5xl/3KUjUXHLO/uosmqMQ0gJnMyid
	 8hmDKI47x4Jo3l4MTALeSXosppfKw8DvFbEnNcsQPXIAIJ/WnvqZoqTg5nIAaA1d8V8lH
	 +HbpJAHjvxGLtmu/9jWf4VnKuWIiJQf0QuXa1jP/mkaD2tTzPwC6bXwJbAg2spAUxLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873863;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=qT+iA0IP0AUfTRAETm5fn1PIqIMYsa9Gwl7ouRFxHmM=;
	b=5RLBFzgvp3yyNwjxi8pvgTkCmzKDI+kGMERz5RYUhP1YY1+uTgJmD4ShnbLDucX/H0ph
	 ZZi9ZkmtEjuQPM3GXbtuf9ZeKOI2UoaoChcz2DqjbMwD6whKgsp6a+2aRTZMHyRit59Nt
	 sSUHbEDli3w4A7s4ix8reorTTJt/jGJy4Ja/7ELAv9LQCHqF/iEsCwJ54B237vFMrlGbL
	 J3hArFckpDYquXsOe6A9Fu3mIFeW+1wtSK3WGMcvTIJPBb1WofdQoWIpG37umL2mud5qt
	 pF1KS8iaG59Mfd3b48cpD/2ikOQy0vI1K8GtP3mzMbEeFzXetALxaQxzEP/iOB8SniA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AXnsSH5J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6E3606A31B;
	Thu,  5 Nov 2026 10:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AXnsSH5J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841161F000C1;
	Thu,  5 Nov 2026 10:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793873862;
	bh=qT+iA0IP0AUfTRAETm5fn1PIqIMYsa9Gwl7ouRFxHmM=;
	h=From:Date:Subject:To:Cc;
	b=AXnsSH5J8LTmP2YNIMTbN4p/XZP86YnX5TRhfPpAYFwdeleZIsBbdBuqH8/O5agth
	 3g1nK5RCzkxyC/139FaqSBovZkAtxKZRhX/xhvtw8G894RmYy/ZO9pgJA79DQnc/XE
	 55rVDOmU2x7PbeQEBPiBUTxh+kEIxGPJ/HbTQfc7gruRMgJThqy/o1mLUyr9BQwOYc
	 QudTHwYGshYwXTs0D/bVkDhcZgcqZ7Fk2jWZ5x0ML39kq2iyAuxnOkWf2ZOcXrvz6t
	 sRqAOBNwEMxCUzq+pRmTGoLJ/gmmE9CSHSFJKAS15d2mmHhNg3GxwdwC6SwfBRXAEb
	 VjQby6IUQhr/g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 05 Nov 2026 11:17:24 +0100
Subject: [PATCH v3] rust: hrtimer: add active() method to query timer state
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
Message-Id: <20261105-hrtimer-active-v3-1-52636808ccda@kernel.org>
X-B4-Tracking: v=1; b=H4sIALNX7GoC/3XMQQrCMBCF4atI1kYyadNUV95DXNRk0g5qK5MSl
 NK7m3YjIi7fg++fREQmjOKwmQRjokhDn0ex3QjXNX2LknzeQitdKQ1GdjzSHVk2bqSEMkBdlAA
 BTXURGT0YAz3X4Omcd0dxHPi19hMs799UAgmysab0oMq9dvp4Re7xthu4FUsr6Y+v1K/X2Vvrr
 TGuhuDtl5/n+Q1qrMYW7QAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5253; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=bxB46qnf7umeeRQ+C/sszos5ZUVByr6zfEV4QDjqcQE=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq7Fe1ZB+/sS+D+I5ZnUpBngxp6Mya08SOal7tO
 uIMIOa6JRqJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCauxXtQAKCRD6UCkIqsW9
 0LZwD/90tWDQ9CzUTC4NFMHnzFk0q7O/k98zNNSxt3qCBFVYPEWyY87zCF7bnUM3jl8kM5ClDkh
 e+4qb4UEHs5LxDc+RRS7lof+ZivWNYT7MOAQDq/nj4K1mDQxtoshczPKB02QavvGcFIO43Pk0HR
 gxVgmsm2wZbFjHQ293r4gD6jh+gF5I3FGSQ9JHPUqBptElmaAOaqTTh6m7sg1f8nsS+AVuo7Lk9
 iD6LhgededqsfWMBaNJp/CNaCZc24NDb/D1+oeHKlkqhKxZIVPfLWRhEyhcvR8DZLJNKTmAUtem
 AdM6BaYGHvGJEvD0hgdt39oINEGSBT5S+U8EiDs3q6fctSJ9kFw4D6KuLOdTl0hkzf3ihNuhccb
 HhsCOtmKPZWQ1HzdUNbhM0845BM/NNim89SvGGP/yz3K7E5oa4c+0XKaF9TnVEFcULZjZuLHYvp
 EfybRFm1cKe07aqKZtrC53punhcSoWe0SPvPM+b77232lf/0eX4M0SE/epP8dxECnOpnTbEzpHT
 lzupznrAt5WEdKAzoH5mG/cU0ccOJf9Loz2kbfWIUVrqSlfAgWQTlvHeIFUvKScZMMqK3AjxLFX
 8apClycsQQ+3bqmtGttSDoLjuOmQ+UkJvq7WBbPsAy3tAYXhUK7jugLISjL3/8hBK1dZWJi2pJU
 x2FwGuY+0j/y+KA==
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

The returned value is still only a snapshot: a concurrent start or an
expiry can change the state right after the call. Callers that need a
stable answer have to serialize against those operations themselves,
exactly as C callers of hrtimer_active() do. This is documented on the
method.

Also add documentation clarifying the definition of an active timer.

Introduce the term `active` as a set of timer states composed of `started`
and `running`.

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
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
index a53f7f1341be..45bbe3530f8c 100644
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
+    /// The returned value is a snapshot. A concurrent start or expiry can change the state of the
+    /// timer right after this method returns, so callers that need the state to be stable must
+    /// serialize against those operations by other means.
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


