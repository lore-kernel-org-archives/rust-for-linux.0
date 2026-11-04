Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799843;
	b=cYRkL7rDgF80Vt/3WaeYvG1umXTwJ37n5gSij2QfKn0Iw/UtQmDvbyIn0TIRfuQwCbOs
	 Aoms6nIIHcc3CNVRRUk14176eZhdhimhi7g2FRvvOhyvOYP4I6Y4wPTTfCjHCm2DWnzEZ
	 6NXOm4xGCCyz2WFyYL2/LXEPL58wAmYG2k0omWxkP4aNd0RKQVG8YpYROrxID7a8MQ1Lz
	 A7ixMCi4D0AbNZosfnxWxZiuwqn8EOdvT88mpuDcNMBgDTdMSBa/sQvvHZJm0g5hhZz8/
	 e1CktEcrwuZU+YvwgfyDV+krSOK5mL+4pVubagQC7wU7rOoswBUiZQtdOPPAMg3k3Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799843;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=cUUslosnGpCPPQgi+adGQwIsKcX5he24sFJpO5UMCtw=;
	b=R7z7joFQJjkTAJuKN68KVZnznt1Fn4f7Z6mAPSDMsa+nZ+xZBuhdXVLCvT4DiD1yrp5V
	 NIAjmbvRkTULnBODPn/zk5LY2p0Cym/VCbZLyTzE0GW7IFw1AAAW5kz/U0icQoit1Ubre
	 KHug/ALB+cM67E98IEGDP8YbsGTQtg9ldX3Cr3RarjzmK4VIOg87VjBIDdbCMOpgpVOHG
	 z0ZmyZh655V2RCUygKgJlg4/DbzAsEdBE4Sh/tHebQtqixt+PrFnFEJTxQoXMogt1aOzC
	 Yfy9S3M91CXX106r1ikQG/Zw6yMtzsKqN6m0NIrFu53vf5wSuk5FmB8sjckic9HDumA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YaAxrkXm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AC2606A328;
	Wed,  4 Nov 2026 13:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YaAxrkXm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E321F0093A;
	Wed,  4 Nov 2026 13:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799842;
	bh=cUUslosnGpCPPQgi+adGQwIsKcX5he24sFJpO5UMCtw=;
	h=From:Date:Subject:To:Cc;
	b=YaAxrkXmIKYHexFCTw02jEA/dqZDC5GNoV4ikYpgyYbtbGyAFiGJ+XUsN8qjZPNbR
	 odoG4Xg7dkVoMMYxtgMKn1Ujyx9MhFec+JkOlAw0ho+1sTFPjWOiPmmw0r4xyhx0ME
	 /0ZtHeIuVCKYlg/IaVssyiNM/M4RSTyb99XF24IcANTz4nWR5fcCWAry1quhzYkyHC
	 xJFrsgDD0wR5nUTQDP7iVvtAukskIgjEm8XB/OP6z5OIa6vzNbpGnQjnJnpLX8EZYF
	 dL2r9QFnsq5nPJcc85fkBCyCllB6XKkdVLEiTnE2vWA6KPKScRWiLtMhi5/+36BjUm
	 928CMHItTPI2Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 04 Nov 2026 14:43:19 +0100
Subject: [PATCH v3] rust: impl_flags: add method to return underlying
 integer
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
Message-Id: <20261104-impl-flags-inner-v3-1-2968b1303d8b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHY262oC/33NwQrCMAyA4VcZPVtps9k6T76HeOjWdAvObrRSl
 LF3t9tFBJGc/kC+zCxiIIzsVMwsYKJIo89R7grW9sZ3yMnmZiBACZDA6T4N3A2mi5y8x8BbJWt
 dNaAbeWT5bAro6LmRl2vunuJjDK/tQ5Lr9g+WJM+DgLatFVZanG8YPA77MXRs1RJ8BCUOPwTIg
 rHSudJpY6H5EpZleQN2vZbT8wAAAA==
X-Change-ID: 20260212-impl-flags-inner-c61974b27b18
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2658; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=K9QW0maz21yD9tB+JIt8DPORgeABVcgWs/zw+G7IAuE=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq6zZ452g3oLyBhxjvrkGXG+H+RLmPW9XIwvxhG
 JFpMKQtH3aJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaus2eAAKCRD6UCkIqsW9
 0KM0EACfjAb9ceSqa+p2P85dipfEiNn3pPiSOWab4VDczDh8e2NXKyEvfcff1HSZ4O09OFbyEU+
 3WAADbv6vXKQ9n0lGJwLNbjV0ZVen4LD1ZsNyr24rLPgta81d2NsLJGy39OkGoFwCZZSekDgEcn
 gmQ6YDO0YP+Gdap6cUg2lExH5RhLKXj0HBk/snHNIr8GREQyzwAky2tgZkPeqjR7ygRAuze61yk
 t0LnhrutM4EzaJIyb5ZkUL1Qvl3ial5LB7v/0Dlzt8EOaQ5OA5sYV9FYw/LrkCeg7O0PycNVDFy
 MBiYpuyaTUKzv5gp7ih08/0hRLFp2876NF9g0qVFKQ78i3PaXkEsfHIWWWryqIfTfdJzP1d29tj
 UuxhCvbLYr2fhQB4onH66WZLv26KPpTMqfUzC98mPfuXTh3+IqWzu7e9VWOQ2WXle61Jp6JCIlA
 Uhy6YSTcIa0p42eosqYMfv9z4iZupN6ALYtx6iHlIyhlfOR76FVfdpWKlnU7MqlDZB6A551mccr
 /uWx25xWiD9NLFrLJGKygdzixtrVFJXaN8haLCm2VCFcR1qe9nyT8bv7X1Y0wIAAbnRPbzjIjPb
 3mfpjB5P9nl7ti5QesUdf6x7hWseuyeUV1cYFEPPAm2zOyUzhL2nqkEHx+OD4ECKjGFI55YNfMu
 eHAt1TCk9qFuGfg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a `bits` method to return a copy of the underlying integer used to
represent the flags. This is useful when passing flag values to C APIs.

The macro already generates a public `From<$flags> for $ty` conversion, so
this does not expose anything that was not already reachable by users of
the generated types.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v3:
- Make `bits()` unconditionally public and drop the inner-field visibility
  specifier from v2. The bit pattern is already reachable through the
  generated `From` implementation, so gating the accessor hid
  nothing (Gary, Miguel).
- Leave the bitmask struct declaration in the doctest unchanged and only
  add a line exercising `bits()` (Miguel).
- Rebase on v7.4-rc1.
- Link to v2: https://msgid.link/20260605-impl-flags-inner-v2-1-ad1ff3f7ad2b@kernel.org

Changes in v2:
- Rename the accessor from `into_inner` to `bits`, matching the
  name used by the `bitflags` crate (Gary).
- Tie the visibility of `bits` to the visibility of the inner
  field of the bitmask struct, so callers must explicitly write
  `pub` to expose the bit pattern outside the defining module (Gary).
- Extend the macro's doctest to declare the inner field `pub`
  and exercise the `bits` accessor.
- Link to v1: https://msgid.link/20260212-impl-flags-inner-v1-1-1e2edc96e470@kernel.org
---
 rust/kernel/impl_flags.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
index fdf44d5eea9c..6051487f6e28 100644
--- a/rust/kernel/impl_flags.rs
+++ b/rust/kernel/impl_flags.rs
@@ -68,6 +68,11 @@
 /// let negated = !read_only;
 /// assert!(negated.contains(Permission::Write));
 /// assert!(!negated.contains(Permission::Read));
+///
+/// // Obtain the raw integer representation with `bits()`, which is
+/// // useful for passing the value to a C API.
+/// let raw: u32 = read_only.bits();
+/// assert_eq!(raw, Permission::Read as u32);
 /// ```
 #[macro_export]
 macro_rules! impl_flags {
@@ -270,6 +275,12 @@ pub fn contains_any(self, flags: $flags) -> bool {
             pub fn contains_all(self, flags: $flags) -> bool {
                 (self.0 & flags.0) == flags.0
             }
+
+            /// Return a copy of the inner representation of the flags.
+            #[inline]
+            pub fn bits(self) -> $ty {
+                self.0
+            }
         }
     };
 }

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260212-impl-flags-inner-c61974b27b18

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


