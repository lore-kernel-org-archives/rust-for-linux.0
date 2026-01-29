Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486E3288CA3;
	Thu, 29 Jan 2026 14:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769697168; cv=none; b=njWzowoWbdx7lYeQKIN50yV6OnTkVAWfglIn9ESs/32EvMJLldfkm6+uS4ASNz08h5w/Wprbb8Pzh+/BYmzySVJinBNbpq6mifdXE1hNMg2WAyJ5egYiyTtlAfB+rmuZoq11pSJublMCRXApUqcMnry6FF0oC2v8ICJEEMOhZhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769697168; c=relaxed/simple;
	bh=h2db5JHcfX358xoYjzNWg69N/TJi6crM+c2XE9YuwFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q2PVr+JeaVKI0tag8SyP/KDW7N+4iQWwUlfgWPIdYmYaLhVW6mnVPHJfkjQbOno2VqHHPkHlPkKr5QktLt8ZHwZqU8MCbbGL0qMN2DYUJwdaS5zoVqRUBM9GIn0I09N/pIFFNd6dlSz6fxUKZOhzXrIJiB6L5V7VyaMwgoHqz3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z89Dnhc3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z89Dnhc3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CCE8C2BC87;
	Thu, 29 Jan 2026 14:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769697168;
	bh=h2db5JHcfX358xoYjzNWg69N/TJi6crM+c2XE9YuwFA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Z89Dnhc3WkiXIxaMu+lpUw+nOS3B6WcdcON5PLk4rLfptRVme7pJZp2037SibNYJW
	 of7FmWGo71CuBhFpmaDWcuKvPMRCcNlFp/weRPw58svW1LAqfppWZzpnB5jw6x1ga3
	 pUs2qTYEUPema9XZ3AkjJhCCwj6Z8lkRCMlkn5Q+gqtzlFk0Gcqn499WNdkAoBXgNq
	 Ij2oHl78FVPXLROelg1ur4FZEtGoaYo3srksI+A9GcZq5seiwfW8lT/PbcFZg5IlDQ
	 gr+Lg9vzrzR170x9RgOPYYMWRaS/7yzFIvX1D2nUfqiZRDkofkiXoLBmDeUrtJREkX
	 3vd9B+gEGHZjw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C6AD6101C;
	Thu, 29 Jan 2026 14:32:48 +0000 (UTC)
From: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>
Date: Thu, 29 Jan 2026 23:32:47 +0900
Subject: [PATCH v5 3/4] rust: macros: add private doctests for `Into`
 derive macro
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-try-from-into-macro-v5-3-dd011008118c@gmail.com>
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
In-Reply-To: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12271;
 i=y.j3ms.n@gmail.com; h=from:subject:message-id;
 bh=c1q9CgkXNiNNpfbtgu2COPiP5pBsQJknnBTq9ePsn4g=;
 b=owJ4nAFtApL9kA0DAAoBhnBYoOPQ2LoByyZiAGl7b45XM/k3hZ+u/lh5G4jGp1ZkwgQR5FMYK
 T7No+6EXVYP0okCMwQAAQoAHRYhBNJuBqTTLsbEgOaQ0IZwWKDj0Ni6BQJpe2+OAAoJEIZwWKDj
 0Ni6SyIP/1JbkqVr20g1d1JYWzXHPRY2PHXALyMzrRflJmxjM4wlIo8SPKdimlBJiirQp7igodp
 3zvrRhqeuUN7UFsfS2tktKrnPJlpUFGrg3FSUnINdkDOdHBi5n5cmHq0vZ37LFgyd8K81Vil9Rg
 VXk7nGAz6UCZ1io4x28aSsU5temMphoTD4urkNl7Vmx6sNWRQAQTY3QsJJjyRueF8VCENQ0Xn5z
 GLwuXKjq0s5Ch+eGmGwUWd8e7KZYR7lA8OzPuZDIjZCTwAFnZGFT5U65YMasK0eBIChOYrGY8bE
 OaP0a/zwRqZ/8EHocqIuoWLDVTfzJZAbY/JJgqMv7G864/cpQlB74rf4oJVXxnulUL+qen0uSa9
 1yigjc91geN1kszcIIcNDJ9Znt5YP2uQpP6s7TnntxgkY0fZIvcPRbT1mDAxBcUuGTK8KgQC4Rp
 J0R0+DYhcEVgWzUHdfjnEWpq3vF2mBl6FXvHraRRBdC/vg3RCQgZzE/SUk2INaUatp4c+y8gK+p
 rAkz0hSTbVJqNbrw/YLQe4FX+OT3a36MyQFY7psdN97txu/lojyS8WMKkpWqXACx7lQYP/OtXem
 ZYtG7VAi+HnWKs7bEhVH/DJgY2F8exqnY5o+3ByT3mb/cNRsXYA/0BXYOzW42KkZwE7cYagxYWY
 uC1ZUw/deWjuGekgggY4i9g==
X-Developer-Key: i=y.j3ms.n@gmail.com; a=openpgp;
 fpr=D26E06A4D32EC6C480E690D0867058A0E3D0D8BA
X-Endpoint-Received: by B4 Relay for y.j3ms.n@gmail.com/default with
 auth_id=602
X-Original-From: Jesung Yang <y.j3ms.n@gmail.com>
Reply-To: y.j3ms.n@gmail.com

From: Jesung Yang <y.j3ms.n@gmail.com>

Add internal doctests to verify the `Into` derive macro's logic. This
ensures comprehensive testing while keeping the public-facing
documentation compact and readable.

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 rust/macros/convert.rs | 436 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 436 insertions(+)

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
index a7a43b1a2caf..41ccbd849348 100644
--- a/rust/macros/convert.rs
+++ b/rust/macros/convert.rs
@@ -582,3 +582,439 @@ fn is_valid_primitive(ident: &Ident) -> bool {
             | "isize"
     )
 }
+
+mod derive_into_tests {
+    /// ```
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(u8)]
+    /// enum Foo {
+    ///     // Works with const expressions.
+    ///     A = add(0, 0),
+    ///     B = 2_isize.pow(1) - 1,
+    /// }
+    ///
+    /// const fn add(a: isize, b: isize) -> isize {
+    ///     a + b
+    /// }
+    ///
+    /// assert_eq!(0_u8, Foo::A.into());
+    /// assert_eq!(1_u8, Foo::B.into());
+    /// ```
+    mod works_with_const_expr {}
+
+    /// ```
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(bool)]
+    /// enum Foo {
+    ///     A,
+    ///     B,
+    /// }
+    ///
+    /// assert_eq!(false, Foo::A.into());
+    /// assert_eq!(true, Foo::B.into());
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(bool)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `bool`.
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(bool)]
+    /// enum Foo {
+    ///     // `2` cannot be represented with `bool`.
+    ///     A = 2,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_bool {}
+
+    /// ```
+    /// use kernel::{
+    ///     macros::Into,
+    ///     num::Bounded, //
+    /// };
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 7>)]
+    /// enum Foo {
+    ///     A = -1 << 6,      // The minimum value of `Bounded<i8, 7>`.
+    ///     B = (1 << 6) - 1, // The maximum value of `Bounded<i8, 7>`.
+    /// }
+    ///
+    /// let foo_a: Bounded<i8, 7> = Foo::A.into();
+    /// let foo_b: Bounded<i8, 7> = Foo::B.into();
+    /// assert_eq!(Bounded::<i8, 7>::new::<{ -1_i8 << 6 }>(), foo_a);
+    /// assert_eq!(Bounded::<i8, 7>::new::<{ (1_i8 << 6) - 1 }>(), foo_b);
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 7>)]
+    /// enum Foo {
+    ///     // `1 << 6` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = 1 << 6,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 7>)]
+    /// enum Foo {
+    ///     // `(-1 << 6) - 1` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = (-1 << 6) - 1,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::Into,
+    ///     num::Bounded, //
+    /// };
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 1>)]
+    /// enum Foo {
+    ///     A = -1, // The minimum value of `Bounded<i8, 1>`.
+    ///     B,      // The maximum value of `Bounded<i8, 1>`.
+    /// }
+    ///
+    /// let foo_a: Bounded<i8, 1> = Foo::A.into();
+    /// let foo_b: Bounded<i8, 1> = Foo::B.into();
+    /// assert_eq!(Bounded::<i8, 1>::new::<{ -1_i8 }>(), foo_a);
+    /// assert_eq!(Bounded::<i8, 1>::new::<{ 0_i8 } >(), foo_b);
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 1>)]
+    /// enum Foo {
+    ///     // `1` cannot be represented with `Bounded<i8, 1>`.
+    ///     A = 1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 1>)]
+    /// enum Foo {
+    ///     // `-2` cannot be represented with `Bounded<i8, 1>`.
+    ///     A = -2,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::Into,
+    ///     num::Bounded, //
+    /// };
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i32, 32>)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = i32::MIN as i64,
+    ///     B = i32::MAX as i64,
+    /// }
+    ///
+    /// let foo_a: Bounded<i32, 32> = Foo::A.into();
+    /// let foo_b: Bounded<i32, 32> = Foo::B.into();
+    /// assert_eq!(Bounded::<i32, 32>::new::<{ i32::MIN }>(), foo_a);
+    /// assert_eq!(Bounded::<i32, 32>::new::<{ i32::MAX }>(), foo_b);
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i32, 32>)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     // `1 << 31` cannot be represented with `Bounded<i32, 32>`.
+    ///     A = 1 << 31,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i32, 32>)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     // `(-1 << 31) - 1` cannot be represented with `Bounded<i32, 32>`.
+    ///     A = (-1 << 31) - 1,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_signed_bounded {}
+
+    /// ```
+    /// use kernel::{
+    ///     macros::Into,
+    ///     num::Bounded, //
+    /// };
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u8, 7>)]
+    /// enum Foo {
+    ///     A,                // The minimum value of `Bounded<u8, 7>`.
+    ///     B = (1 << 7) - 1, // The maximum value of `Bounded<u8, 7>`.
+    /// }
+    ///
+    /// let foo_a: Bounded<u8, 7> = Foo::A.into();
+    /// let foo_b: Bounded<u8, 7> = Foo::B.into();
+    /// assert_eq!(Bounded::<u8, 7>::new::<{ 0 }>(), foo_a);
+    /// assert_eq!(Bounded::<u8, 7>::new::<{ (1_u8 << 7) - 1 }>(), foo_b);
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u8, 7>)]
+    /// enum Foo {
+    ///     // `1 << 7` cannot be represented with `Bounded<u8, 7>`.
+    ///     A = 1 << 7,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u8, 7>)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `Bounded<u8, 7>`.
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::Into,
+    ///     num::Bounded, //
+    /// };
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u8, 1>)]
+    /// enum Foo {
+    ///     A, // The minimum value of `Bounded<u8, 1>`.
+    ///     B, // The maximum value of `Bounded<u8, 1>`.
+    /// }
+    ///
+    /// let foo_a: Bounded<u8, 1> = Foo::A.into();
+    /// let foo_b: Bounded<u8, 1> = Foo::B.into();
+    /// assert_eq!(Bounded::<u8, 1>::new::<{ 0 }>(), foo_a);
+    /// assert_eq!(Bounded::<u8, 1>::new::<{ 1 }>(), foo_b);
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u8, 1>)]
+    /// enum Foo {
+    ///     // `2` cannot be represented with `Bounded<u8, 1>`.
+    ///     A = 2,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u8, 1>)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `Bounded<u8, 1>`.
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::Into,
+    ///     num::Bounded, //
+    /// };
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u32, 32>)]
+    /// #[repr(u64)]
+    /// enum Foo {
+    ///     A = u32::MIN as u64,
+    ///     B = u32::MAX as u64,
+    /// }
+    ///
+    /// let foo_a: Bounded<u32, 32> = Foo::A.into();
+    /// let foo_b: Bounded<u32, 32> = Foo::B.into();
+    /// assert_eq!(Bounded::<u32, 32>::new::<{ u32::MIN }>(), foo_a);
+    /// assert_eq!(Bounded::<u32, 32>::new::<{ u32::MAX }>(), foo_b);
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u32, 32>)]
+    /// #[repr(u64)]
+    /// enum Foo {
+    ///     // `1 << 32` cannot be represented with `Bounded<u32, 32>`.
+    ///     A = 1 << 32,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u32, 32>)]
+    /// #[repr(u64)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `Bounded<u32, 32>`.
+    ///     A = -1,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_unsigned_bounded {}
+
+    /// ```
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(isize)]
+    /// #[repr(isize)]
+    /// enum Foo {
+    ///     A = isize::MIN,
+    ///     B = isize::MAX,
+    /// }
+    ///
+    /// assert_eq!(isize::MIN, Foo::A.into());
+    /// assert_eq!(isize::MAX, Foo::B.into());
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(isize)]
+    /// #[repr(usize)]
+    /// enum Foo {
+    ///     A = (isize::MAX as usize) + 1
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(i32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (i32::MIN as i64) - 1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(i32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (i32::MAX as i64) + 1,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_signed_int {}
+
+    /// ```
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(usize)]
+    /// #[repr(usize)]
+    /// enum Foo {
+    ///     A = usize::MIN,
+    ///     B = usize::MAX,
+    /// }
+    ///
+    /// assert_eq!(usize::MIN, Foo::A.into());
+    /// assert_eq!(usize::MAX, Foo::B.into());
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(usize)]
+    /// #[repr(isize)]
+    /// enum Foo {
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(u32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (u32::MIN as i64) - 1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(u32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (u32::MAX as i64) + 1,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_unsigned_int {}
+
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 7>, i8, i16, i32, i64)]
+    /// #[repr(i8)]
+    /// enum Foo {
+    ///     // `i8::MAX` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = i8::MAX,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(i8, i16, i32, i64, Bounded<i8, 7>)]
+    /// #[repr(i8)]
+    /// enum Foo {
+    ///     // `i8::MAX` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = i8::MAX,
+    /// }
+    /// ```
+    mod any_into_target_overflow_is_rejected {}
+}

-- 
2.52.0


