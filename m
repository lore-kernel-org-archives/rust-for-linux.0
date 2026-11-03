Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719514;
	b=O+1OeCvba8HIyBF0MkMbtUGEXpsGhYQ/UnX9oOILCHWcpRL1SH3PpP9Tanqy9IEwyzNT
	 KDQIWbklB5zSAAPzIxYuKMBVXyveskT6w6ppy3P9AGjkXpKxY1jx1j+ohxj4j18Wqn+k+
	 UEY22NO9itR7Erzbo/D+Ed+80JqzuseMXpN15QzyNkYfAPTYM54dOqOqB0LydpRNtjjOV
	 NGVMbB4YKV4fOKv2XjpYB5I+XZflvt4Yi4ojNOH2QFAVAOlEtSLDnaJTcUpS724hJydpk
	 4Gd+bPlODqnsSKWHrK90GkrPEXbnSIS8L2Rkai6i0Y3pA97z2EupUS3WP/MgVmp1vOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719514;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=i/Ej15tfeSmYdgpSmH5cUz5DZDqMYWq5E19FEzZp+1A=;
	b=L4PAwhCEW0UcM+bten3h65Q/FGOQym9fiR+VPEE81CDxuE++aZk81nG2/JB+wmIEJFzN
	 Ke+A/KXlorJ8KwvXTZAp9j8NzNXOJSr06jOHOITDYhYBcyBXIskdUVLQyb+lL8wyiHmah
	 ewFM9DLMnDjhiiF4Y+Rh5wRBj8m9T3OaIqB0uLrDOWRBnNFynAyKqFzBaq7VSw39u0zgu
	 8J+T9/kkUkHI1nYF9wJdcukiHyeH/3yX8ZhvTaBl3pJn0h2wpfBJ2F+o7HAIpSxbHGHE/
	 wrYfIrAvqkNpCtqp53FYyNChCK4PukI76PBV0JM1bJAWm+/E5k65rPeeZWQsCkkX0dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ou41TXyg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB34606A328;
	Tue,  3 Nov 2026 15:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ou41TXyg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06891F000C1;
	Tue,  3 Nov 2026 15:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719513;
	bh=i/Ej15tfeSmYdgpSmH5cUz5DZDqMYWq5E19FEzZp+1A=;
	h=From:Date:Subject:To:Cc;
	b=ou41TXygeIWmYPtE4tUr3U8wObLJTkY+k6BBfQGBC5tKpv+5tJIHHnijT8LS2U6bP
	 FWim6P3zwDljPF9TbKrpkIvoBi/y6OavBbCd+d9wyLmqbI/5IKCRkMOLNj/06oW7V4
	 PK+Ye2nw7S1WLpdBH9Pgt3lKoM48tdG/em12JRRIdcxtKlusNoFfO5uXm01V0RJHxA
	 PadwTlI8+bu8wWS6RkxmVnIjmJtUqp3s52xbPkwz1FKIcBqzu1SJ8+EuClFOi8JVC+
	 1QDq2I32wppbyU1qRKMmevOjHHId+viQDDTUgMUHUSHbIXpdIbLsW7rgXVRc0yUF5I
	 3m0gUK8TJW1oA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 03 Nov 2026 16:23:40 +0100
Subject: [PATCH v2] rust: time: implement `Display` for `Delta`
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
Message-Id: <20261103-time-delta-display-v2-1-b01b1fe9ff9f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHv86WoC/32NQQ6CMBBFr0Jm7Zi2iVBdeQ/DApwBJmJL2oZIS
 O9u5QAu30v++ztEDsIRbtUOgVeJ4l0Bc6rgOXVuZBQqDEaZWhl9wSRvRuI5dUgSl7nbkBpluGm
 sJUNQhkvgQT5H9NEWniQmH7bjY9U/+ze3atTYU4nVfLXcD/cXB8fz2YcR2pzzF2aa6UW1AAAA
X-Change-ID: 20260215-time-delta-display-d702e7788d2d
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Boqun Feng <boqun@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1926; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=iEj9ez/vAS3FjjGj+7/Nlb2TJHGgpURbp2hLXENzRyM=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq6fx8hvd/cw96LCqCTRvSbnx1UppgETI2kXOox
 YxGHi+PkiCJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaun8fAAKCRD6UCkIqsW9
 0EUSEACYIQXlvw1HvQmKQ0fP3arQvFwVYoohAEl1SbFqKX94nDHJDUdi5/9L9S4OuTJraATXBL8
 KZTRx9LgyAG2DkouUg5UBL2pcw6oE+5lvIvgKokLAEdK2JG7pJSVM3Qm5J/tGJCi/ePi0hOgJyN
 4X05BjIH2a9ibZBpQEDH8LxwzpwercNp7pDKEzGdRHQQq2ZnF0+6mCpsKdRD8nAoBf1szADnoBb
 cGzPyml+NbCavbMNhkr2zumUvfpBRywNnnKPks/I95ql+mC3V8W1K23TX6xrxsJQqI0JKk3U3Ic
 8E3WlLgTMMsh4eA6zo5GlX4mnMV6vHQ8mRwHKWO1CGjrZGAd1ihqWDOCMATcPT1THRPR8ba0VUx
 ovJfsg/l/gp45mE2sWgK9fpFmGr+3oFI7dSRToQeG73YNoKmDt5pbYU1S40pUXvcwuy2b6IVFgp
 1gWx8voVZSSL9ow1jtzUA2PJz9hMkJerHzRs7CoMXRaF5qSQeZCz6VDj6NtXGBr8VtRG70wsQDH
 sS8pzPsthr5VQPq1OHWC3dB6uxt51eqL/kxjoAsv0cDvhmW8xIcL0xJokPbz4t1LqH+CUHJ1mA6
 6tq1RgcOGELKZbABlC5Ok0aE+BECB51ILJmyecTCh65x0bYDbRk9BDx5+5vXm8sk4BPUG8d7elb
 jmOkE3I5UvJzUDw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Implement the `Display` trait for `Delta` so that it can be displayed by a
formatter.

Assisted-by: LLM
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v2:
- Rebased on v7.4-rc1.
- Suffix the formatted value with `ns` (Alice, Gary, Miguel).
- Write the value directly rather than via `write_fmt` and `fmt!` (Alice).
- Document the format with a rustdoc example.
- Drop the `rnull` user, which will call `Delta::as_nanos` instead (Gary).
- Link to v1: https://msgid.link/20260215-time-delta-display-v1-1-bdd2d6e98ebf@kernel.org
---
 rust/kernel/time.rs | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index b6a2aab12a50..eac581e845a6 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -669,6 +669,25 @@ pub fn rem_nanos(self, dividend: i32) -> Self {
     }
 }
 
+impl kernel::fmt::Display for Delta {
+    /// Formats the span as a number of nanoseconds, suffixed with `ns`.
+    ///
+    /// ```
+    /// # use kernel::{prelude::fmt, str::CString, time::Delta};
+    /// let delta = Delta::from_micros(5);
+    /// let formatted = CString::try_from_fmt(fmt!("{delta}"))?;
+    /// assert_eq!(formatted.to_bytes(), b"5000ns");
+    ///
+    /// let negative = Delta::from_millis(-2);
+    /// let formatted = CString::try_from_fmt(fmt!("{negative}"))?;
+    /// assert_eq!(formatted.to_bytes(), b"-2000000ns");
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
+        write!(f, "{}ns", self.as_nanos())
+    }
+}
+
 #[cfg(CONFIG_RUST_TIME_KUNIT_TEST)]
 #[macros::kunit_tests(rust_kernel_time)]
 mod tests {

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260215-time-delta-display-d702e7788d2d

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


