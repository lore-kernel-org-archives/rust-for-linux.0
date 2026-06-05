Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5EE4C77CA;
	Fri,  5 Jun 2026 10:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780656958; cv=none; b=eiRIQP1E8SabSt584qHlvTlnoqXkFA9QV8WCwquvZogDwltHetQGV2YOON6KxPAWNv1aWZl1pcrZo88JUOI5fPdqVOQawZuGb/CZ3IPP3yLzTwPv619UW2yHW52L8XuFXzYE6FfyV844aeVChKF2S53mwioQEC60AOqXxBsxJt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780656958; c=relaxed/simple;
	bh=a3yLVTknvneNJeLH6SzdXbfx2THUJOYdvEaPqYt9Uok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Um72dOZwpoaQfzovhwv4UkIopenFtMZP55d0ZxDwALeI1DogcUmge1Gk+JgXt/QF7ba1Uy3hCtFHOX1fJtNZKqk3bqoYGHnv8jmGPLVM38yTAtcOjenZ9FhvWT6Tn4gyoq90SzjAxCVyGRBKBU5VCDw3GDD/nQZlmxNZAeyBjao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PdnhoH3G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PdnhoH3G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AADA1F00893;
	Fri,  5 Jun 2026 10:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780656956;
	bh=PZRJH9S6vf61w4cftbXIiLro5vQhj1hQSWzsnvSKLoY=;
	h=From:Date:Subject:To:Cc;
	b=PdnhoH3GCrl677ydXIeE1vvyJrkDXlBYfziy3RlQRMNag9gOE2BoC8jvgYCZy4dfR
	 M1r53c6N5J0NeKrDefh29l6We9EXW8f7ka2ossSVhgT+HOB+/kIRJDM1zpiulo8mk4
	 sDMHyKsUDJwWs9kBehRGfP9C6OVssgrCdE2GpWsK0jqoSWk0+N+j21PImI2e+vkihX
	 df33yQGTGUQnrw+Dxh1djKwF58/ZRXocYoz4ImBcl0krlG4o+ifpSr5aLQtQ3lk8mQ
	 Qtqiiu7cG3IV3fx3F064QSTRrZ9JSGdSj4igZ+2d42wtkbXX+Ub9zDqHyqCw7HUyyj
	 XSH10/bqqvwkg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 05 Jun 2026 12:55:47 +0200
Subject: [PATCH v2] rust: impl_flags: add method to return underlying
 integer
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260605-impl-flags-inner-v2-1-ad1ff3f7ad2b@kernel.org>
X-B4-Tracking: v=1; b=H4sIADKrImoC/32NQQqDMBBFryKz7pRkEFO76j2KC41jHGqjTIq0i
 Hdv6gHKX70P//0NEqtwgmuxgfIqSeaYgU4F+LGNgVH6zECGKkOWUJ7LhMPUhoQSIyv6ytau7Mh
 19gJ5tigP8j6U9ybzKOk16+d4WO2v/SNbLeYwce/riktnbg/WyNN51gDNvu9f92pZA7EAAAA=
X-Change-ID: 20260212-impl-flags-inner-c61974b27b18
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4327; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=a3yLVTknvneNJeLH6SzdXbfx2THUJOYdvEaPqYt9Uok=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIqszGVAR99VD9aM0xNIGoCAxArrBJzY2Ofork
 951j1Q31oCJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiKrMwAKCRD6UCkIqsW9
 0K4tD/91r/wHwVs3FBW0Su5rbpZ3EFEsxIO9R3KwIMQnxtPgC1EymkjBpJZqlXF5qNQADoCg7dO
 6XlSLWxlyqCAFaw8vTdKEmojmL9BZ0CrWLhHYmJgGWkTEGAHxrkwShSmSWBUoZ32PkhUpGWKO1I
 cf1j5Zy7mbYobgwYgxHI+f4J6a5cLfbgbMj7PNYnHhBWMKnTO5oPyPuIe/ZGxQWcZrEtEUPV1Ul
 WrPBcUl58f4zMV1VGKLkelZfLJ0WVPjvkP1HUacbRB5LZldesux0bnujJ88EBJolJ60sYtHOtQE
 eldT6z3AH8DnxSx749hmVHy3mfWOCtcfr8i8Rl0s3UJn4EiHvepg/S9Lx48Ht2EEsPqdxAWkbhk
 FY9IFpp+UlbdHuWPobB/G0aEAbBY6WsknULacSFANYVtJikC+RCsjgH1KL7Lw8OpxzHW0tUx9hs
 nw3soi2LeYmMfoI8wg1YLREdLrmaeC5OVukcyK3UjVp/yUi8G4Cq1IXqo1Y1GsIn0RjAwc6qwPQ
 zZa4gmEHsqVWhvccnwj6+iysPs5FvCNsHAY6FTE+I/Mcxa6HV6EwgWqHoWnTuwpiUVvNthsz14m
 yhx00AK/xU2sx67kLv5UYfKKAE4BUicWGgXVduSTN8pcKilBSgNDk7MxazNjMpOwGypPl/rcEHy
 Lrg+5HpPbMEW+fA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a `bits` method to return a copy of the underlying integer used
to represent the flags. This is useful when passing flag values to
C APIs.

The visibility of the generated `bits` method is controlled by an optional
visibility specifier in the inner-field position of the bitmask struct
declaration. Write `pub` there (e.g., `pub struct Foo(pub u32)`) to make
`bits` callable from outside the defining module; omit it to keep the bit
pattern hidden.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
@Daniel, I dropped your tag since the patch changed a bit.

Changes in v2:
- Rename the accessor from `into_inner` to `bits`, matching the
  name used by the `bitflags` crate (Gary).
- Tie the visibility of `bits` to the visibility of the inner
  field of the bitmask struct, so callers must explicitly write
  `pub` to expose the bit pattern outside the defining module (Gary).
- Extend the macro's doctest to declare the inner field `pub`
  and exercise the `bits` accessor.
- Link to v1: https://msgid.link/20260212-impl-flags-inner-v1-1-1e2edc96e470@kernel.org

To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 rust/kernel/impl_flags.rs | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
index e2bd7639da12..1d39d54540dc 100644
--- a/rust/kernel/impl_flags.rs
+++ b/rust/kernel/impl_flags.rs
@@ -16,6 +16,12 @@
 ///   ([`::core::ops::BitOr`], [`::core::ops::BitAnd`], etc.).
 /// - Utility methods such as `.contains()` to check flags.
 ///
+/// An optional visibility specifier in the inner-field position of the
+/// bitmask struct controls the visibility of the generated `bits`
+/// accessor. Declare it `pub` (e.g., `pub struct Permissions(pub u32)`)
+/// to expose the raw integer outside the defining module — useful when
+/// passing the value to C APIs. Omit it to keep `bits` private.
+///
 /// # Examples
 ///
 /// ```
@@ -24,7 +30,7 @@
 /// impl_flags!(
 ///     /// Represents multiple permissions.
 ///     #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
-///     pub struct Permissions(u32);
+///     pub struct Permissions(pub u32);
 ///
 ///     /// Represents a single permission.
 ///     #[derive(Debug, Clone, Copy, PartialEq, Eq)]
@@ -65,12 +71,18 @@
 /// let negated = !read_only;
 /// assert!(negated.contains(Permission::Write));
 /// assert!(!negated.contains(Permission::Read));
+///
+/// // The `pub` in `pub struct Permissions(pub u32)` makes `bits` callable
+/// // from outside the defining module, returning the raw integer
+/// // representation — useful for passing the value to a C API.
+/// let raw: u32 = read_only.bits();
+/// assert_eq!(raw, Permission::Read as u32);
 /// ```
 #[macro_export]
 macro_rules! impl_flags {
     (
         $(#[$outer_flags:meta])*
-        $vis_flags:vis struct $flags:ident($ty:ty);
+        $vis_flags:vis struct $flags:ident($inner_vis:vis $ty:ty);
 
         $(#[$outer_flag:meta])*
         $vis_flag:vis enum $flag:ident {
@@ -267,6 +279,17 @@ pub fn contains_any(self, flags: $flags) -> bool {
             pub fn contains_all(self, flags: $flags) -> bool {
                 (self.0 & flags.0) == flags.0
             }
+
+            /// Return a copy of the inner representation of the flags.
+            ///
+            /// The visibility of this method is controlled by the optional
+            /// visibility specifier in the inner-field position of the
+            /// bitmask struct declaration.
+            #[inline]
+            #[allow(dead_code)]
+            $inner_vis fn bits(self) -> $ty {
+                self.0
+            }
         }
     };
 }

---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260212-impl-flags-inner-c61974b27b18

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


