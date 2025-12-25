Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CAC2E8E09;
	Thu, 25 Dec 2025 08:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766651875; cv=none; b=Ai1L4irx2zrrNiW8DOWtchP2jrX9CzbV0l065/+GOpnbkFnL/3gUfYUDRWyMOXqfEXDrhsRSDVsrzRupIYMk7uMdIGpJBA5xvWE7sflc57FOCcQr2pSIl6LzNyNtVBmTv3r12xBbrIgf+0c9SDXsvDLvYkXnSYb46Szz5bEoERE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766651875; c=relaxed/simple;
	bh=0P/a/kON4YrMNmaGk0jVyjatgS2RgSiZ+spVmicQNEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YC+4W4ralfSy4Et05UZ88nHdctOaGOCHHPnuuC98EOU0osG9W2LSysUOe9Kax1+3D9UkK6aJoyKl8+KynEMLC1gXE5r/EVbky9eiht7sgvYJN/GAyiAbKI47JreRKlMR4p2bdkO4m3MpRSEvTL/GVocrbZ3O3GbZsc1YV0J9r6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I9ZjDrET; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I9ZjDrET"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51A22C19421;
	Thu, 25 Dec 2025 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766651875;
	bh=0P/a/kON4YrMNmaGk0jVyjatgS2RgSiZ+spVmicQNEY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I9ZjDrETLHPgoV6Ho0eLw2hSJAoDJrzFA6nV7itGcSWHx8y32zMbkqb8X2axMuqJV
	 53kYJX6Ayo6reuF3rAp67plUCyz8s1TDQngFn/y2vus/WS4Hz3YDVSdV52PgKYxreA
	 7XaX7RyVNFeJxBiSZsJApDSODNkbAbSOj9lFpnSl9hI6Zc9N2fI8zmzLOJOE1fn0Cb
	 5fbta+gpb/PJEnocRrSDn26buaqbIjtSFNJOvjWrdEOZEM4Uc9ThvkQWTU8gc+oB2r
	 0r1T9GoY5cqUljoLz/XeMTSXIT2T7En2fCWOvBZwwbKqV3T/CgR/EAkCpWs3r5MyYC
	 0V9TVMVKxVVVA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C520E7AD42;
	Thu, 25 Dec 2025 08:37:55 +0000 (UTC)
From: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>
Date: Thu, 25 Dec 2025 08:37:50 +0000
Subject: [PATCH v4 4/4] rust: macros: add private doctests for `TryFrom`
 derive macro
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251225-try-from-into-macro-v4-4-4a563d597836@gmail.com>
References: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
In-Reply-To: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766651873; l=19161;
 i=y.j3ms.n@gmail.com; s=20251225; h=from:subject:message-id;
 bh=UjKHJTRkCJvJ39+EQxak94ej+XBOzZ1tzrGLObX4UHY=;
 b=KxzLP9ZgeNRB0iLvA3Ww+OpdQcfsfvWVCXcY8SuhLe9G1fXCaos39ucvQKNtpbQaulS/lXeQi
 j92KABdo9PPCUP/FBga3TAZe5v9MRi6Z8kJ59yfCSR9FRW/NXTgmeKk
X-Developer-Key: i=y.j3ms.n@gmail.com; a=ed25519;
 pk=2yVgO1I+y7kkFSF2Dc/Dckj4L2FgRnvmERHFt4bspbI=
X-Endpoint-Received: by B4 Relay for y.j3ms.n@gmail.com/20251225 with
 auth_id=586
X-Original-From: Jesung Yang <y.j3ms.n@gmail.com>
Reply-To: y.j3ms.n@gmail.com

From: Jesung Yang <y.j3ms.n@gmail.com>

Add internal doctests to verify the `TryFrom` derive macro's logic. This
ensures comprehensive testing while keeping the public-facing
documentation compact and readable.

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 rust/macros/convert.rs | 579 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 579 insertions(+)

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
index 63b391a47867fde3ed3d4873daccfc50b0872314..87c11a98836fe982932b0c62a4ee3b5401db2126 100644
--- a/rust/macros/convert.rs
+++ b/rust/macros/convert.rs
@@ -965,3 +965,582 @@ mod overflow_assert_works_on_unsigned_int {}
     /// ```
     mod any_into_target_overflow_is_rejected {}
 }
+
+mod derive_try_from_tests {
+    /// ```
+    /// use kernel::{
+    ///     macros::{
+    ///         Into,
+    ///         TryFrom, //
+    ///     },
+    ///     num::Bounded,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, Into, PartialEq, TryFrom)]
+    /// #[into(bool, Bounded<i8, 7>, Bounded<u8, 7>, i8, i16, i32, i64, i128, isize, u8, u16, u32, u64, u128, usize)]
+    /// #[try_from(bool, Bounded<i8, 7>, Bounded<u8, 7>, i8, i16, i32, i64, i128, isize, u8, u16, u32, u64, u128, usize)]
+    /// enum Foo {
+    ///     A,
+    ///     B,
+    /// }
+    ///
+    /// assert_eq!(false, Foo::A.into());
+    /// assert_eq!(true, Foo::B.into());
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(false));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(true));
+    ///
+    /// let foo_a: Bounded<i8, 7> = Foo::A.into();
+    /// let foo_b: Bounded<i8, 7> = Foo::B.into();
+    /// assert_eq!(Bounded::<i8, 7>::new::<0>(), foo_a);
+    /// assert_eq!(Bounded::<i8, 7>::new::<1>(), foo_b);
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(Bounded::<i8, 7>::new::<0>()));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(Bounded::<i8, 7>::new::<1>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<i8, 7>::new::<-1>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<i8, 7>::new::<2>()));
+    ///
+    /// let foo_a: Bounded<u8, 7> = Foo::A.into();
+    /// let foo_b: Bounded<u8, 7> = Foo::B.into();
+    /// assert_eq!(Bounded::<u8, 7>::new::<0>(), foo_a);
+    /// assert_eq!(Bounded::<u8, 7>::new::<1>(), foo_b);
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(Bounded::<u8, 7>::new::<0>()));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(Bounded::<u8, 7>::new::<1>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<u8, 7>::new::<2>()));
+    ///
+    /// macro_rules! gen_signed_tests {
+    ///     ($($type:ty),*) => {
+    ///         $(
+    ///             assert_eq!(0 as $type, Foo::A.into());
+    ///             assert_eq!(1 as $type, Foo::B.into());
+    ///             assert_eq!(Ok(Foo::A), Foo::try_from(0 as $type));
+    ///             assert_eq!(Ok(Foo::B), Foo::try_from(1 as $type));
+    ///             assert_eq!(Err(EINVAL), Foo::try_from((0 as $type) - 1));
+    ///             assert_eq!(Err(EINVAL), Foo::try_from((1 as $type) + 1));
+    ///         )*
+    ///     };
+    /// }
+    /// macro_rules! gen_unsigned_tests {
+    ///     ($($type:ty),*) => {
+    ///         $(
+    ///             assert_eq!(0 as $type, Foo::A.into());
+    ///             assert_eq!(1 as $type, Foo::B.into());
+    ///             assert_eq!(Ok(Foo::A), Foo::try_from(0 as $type));
+    ///             assert_eq!(Ok(Foo::B), Foo::try_from(1 as $type));
+    ///             assert_eq!(Err(EINVAL), Foo::try_from((1 as $type) + 1));
+    ///         )*
+    ///     };
+    /// }
+    /// gen_signed_tests!(i8, i16, i32, i64, i128, isize);
+    /// gen_unsigned_tests!(u8, u16, u32, u64, u128, usize);
+    /// ```
+    mod works_with_derive_into {}
+
+    /// ```
+    /// use kernel::{
+    ///     macros::TryFrom,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(u8)]
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
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(0_u8));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(1_u8));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(2_u8));
+    /// ```
+    mod works_with_const_expr {}
+
+    /// ```
+    /// use kernel::{
+    ///     macros::TryFrom,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(bool)]
+    /// enum Foo {
+    ///     A,
+    ///     B,
+    /// }
+    ///
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(false));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(true));
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(bool)]
+    /// enum Bar {
+    ///     A,
+    /// }
+    ///
+    /// assert_eq!(Ok(Bar::A), Bar::try_from(false));
+    /// assert_eq!(Err(EINVAL), Bar::try_from(true));
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(bool)]
+    /// enum Baz {
+    ///     A = 1,
+    /// }
+    ///
+    /// assert_eq!(Err(EINVAL), Baz::try_from(false));
+    /// assert_eq!(Ok(Baz::A), Baz::try_from(true));
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(bool)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `bool`.
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(bool)]
+    /// enum Foo {
+    ///     // `2` cannot be represented with `bool`.
+    ///     A = 2,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_bool {}
+
+    /// ```
+    /// use kernel::{
+    ///     macros::TryFrom,
+    ///     num::Bounded,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<i8, 7>)]
+    /// enum Foo {
+    ///     A = -1 << 6,      // The minimum value of `Bounded<i8, 7>`.
+    ///     B = (1 << 6) - 1, // The maximum value of `Bounded<i8, 7>`.
+    /// }
+    ///
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(Bounded::<i8, 7>::new::<{ -1_i8 << 6 }>()));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(Bounded::<i8, 7>::new::<{ (1_i8 << 6) - 1 }>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<i8, 7>::new::<{ (-1_i8 << 6) + 1 }>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<i8, 7>::new::<{ (1_i8 << 6) - 2 }>()));
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<i8, 7>)]
+    /// enum Foo {
+    ///     // `1 << 6` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = 1 << 6,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<i8, 7>)]
+    /// enum Foo {
+    ///     // `(-1 << 6) - 1` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = (-1 << 6) - 1,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::TryFrom,
+    ///     num::Bounded,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<i8, 1>)]
+    /// enum Foo {
+    ///     A = -1, // The minimum value of `Bounded<i8, 1>`.
+    ///     B,      // The maximum value of `Bounded<i8, 1>`.
+    /// }
+    ///
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(Bounded::<i8, 1>::new::<{ -1_i8 }>()));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(Bounded::<i8, 1>::new::<{ 0_i8 } >()));
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<i8, 1>)]
+    /// enum Bar {
+    ///     A = -1, // The minimum value of `Bounded<i8, 1>`.
+    /// }
+    ///
+    /// assert_eq!(Ok(Bar::A), Bar::try_from(Bounded::<i8, 1>::new::<{ -1_i8 }>()));
+    /// assert_eq!(Err(EINVAL), Bar::try_from(Bounded::<i8, 1>::new::<{ 0_i8 } >()));
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<i8, 1>)]
+    /// enum Baz {
+    ///     A, // The maximum value of `Bounded<i8, 1>`.
+    /// }
+    ///
+    /// assert_eq!(Err(EINVAL), Baz::try_from(Bounded::<i8, 1>::new::<{ -1_i8 }>()));
+    /// assert_eq!(Ok(Baz::A), Baz::try_from(Bounded::<i8, 1>::new::<{ 0_i8 } >()));
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<i8, 1>)]
+    /// enum Foo {
+    ///     // `1` cannot be represented with `Bounded<i8, 1>`.
+    ///     A = 1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<i8, 1>)]
+    /// enum Foo {
+    ///     // `-2` cannot be represented with `Bounded<i8, 1>`.
+    ///     A = -2,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::TryFrom,
+    ///     num::Bounded,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<i32, 32>)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = i32::MIN as i64,
+    ///     B = i32::MAX as i64,
+    /// }
+    ///
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(Bounded::<i32, 32>::new::<{ i32::MIN }>()));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(Bounded::<i32, 32>::new::<{ i32::MAX }>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<i32, 32>::new::<{ i32::MIN + 1 }>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<i32, 32>::new::<{ i32::MAX - 1 }>()));
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<i32, 32>)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     // `1 << 31` cannot be represented with `Bounded<i32, 32>`.
+    ///     A = 1 << 31,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<i32, 32>)]
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
+    ///     macros::TryFrom,
+    ///     num::Bounded,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<u8, 7>)]
+    /// enum Foo {
+    ///     A,                // The minimum value of `Bounded<u8, 7>`.
+    ///     B = (1 << 7) - 1, // The maximum value of `Bounded<u8, 7>`.
+    /// }
+    ///
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(Bounded::<u8, 7>::new::<{ 0 }>()));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(Bounded::<u8, 7>::new::<{ (1_u8 << 7) - 1 }>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<u8, 7>::new::<{ 1 }>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<u8, 7>::new::<{ (1_u8 << 7) - 2 }>()));
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<u8, 7>)]
+    /// enum Foo {
+    ///     // `1 << 7` cannot be represented with `Bounded<u8, 7>`.
+    ///     A = 1 << 7,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<u8, 7>)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `Bounded<u8, 7>`.
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::TryFrom,
+    ///     num::Bounded,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<u8, 1>)]
+    /// enum Foo {
+    ///     A, // The minimum value of `Bounded<u8, 1>`.
+    ///     B, // The maximum value of `Bounded<u8, 1>`.
+    /// }
+    ///
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(Bounded::<u8, 1>::new::<{ 0 }>()));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(Bounded::<u8, 1>::new::<{ 1 }>()));
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<u8, 1>)]
+    /// enum Bar {
+    ///     A, // The minimum value of `Bounded<u8, 1>`.
+    /// }
+    ///
+    /// assert_eq!(Ok(Bar::A), Bar::try_from(Bounded::<u8, 1>::new::<{ 0 }>()));
+    /// assert_eq!(Err(EINVAL), Bar::try_from(Bounded::<u8, 1>::new::<{ 1 }>()));
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<u8, 1>)]
+    /// enum Baz {
+    ///     A = 1, // The maximum value of `Bounded<u8, 1>`.
+    /// }
+    ///
+    /// assert_eq!(Err(EINVAL), Baz::try_from(Bounded::<u8, 1>::new::<{ 0 }>()));
+    /// assert_eq!(Ok(Baz::A), Baz::try_from(Bounded::<u8, 1>::new::<{ 1 }>()));
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<u8, 1>)]
+    /// enum Foo {
+    ///     // `2` cannot be represented with `Bounded<u8, 1>`.
+    ///     A = 2,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<u8, 1>)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `Bounded<u8, 1>`.
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::TryFrom,
+    ///     num::Bounded,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<u32, 32>)]
+    /// #[repr(u64)]
+    /// enum Foo {
+    ///     A = u32::MIN as u64,
+    ///     B = u32::MAX as u64,
+    /// }
+    ///
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(Bounded::<u32, 32>::new::<{ u32::MIN }>()));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(Bounded::<u32, 32>::new::<{ u32::MAX }>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<u32, 32>::new::<{ u32::MIN + 1 }>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<u32, 32>::new::<{ u32::MAX - 1 }>()));
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<u32, 32>)]
+    /// #[repr(u64)]
+    /// enum Foo {
+    ///     // `1 << 32` cannot be represented with `Bounded<u32, 32>`.
+    ///     A = 1 << 32,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<u32, 32>)]
+    /// #[repr(u64)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `Bounded<u32, 32>`.
+    ///     A = -1,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_unsigned_bounded {}
+
+    /// ```
+    /// use kernel::{
+    ///     macros::TryFrom,
+    ///     num::Bounded,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(isize)]
+    /// #[repr(isize)]
+    /// enum Foo {
+    ///     A = isize::MIN,
+    ///     B = isize::MAX,
+    /// }
+    ///
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(isize::MIN));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(isize::MAX));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(isize::MIN + 1));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(isize::MAX - 1));
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(isize)]
+    /// #[repr(usize)]
+    /// enum Foo {
+    ///     A = (isize::MAX as usize) + 1
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(i32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (i32::MIN as i64) - 1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(i32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (i32::MAX as i64) + 1,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_signed_int {}
+
+    /// ```
+    /// use kernel::{
+    ///     macros::TryFrom,
+    ///     num::Bounded,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(usize)]
+    /// #[repr(usize)]
+    /// enum Foo {
+    ///     A = usize::MIN,
+    ///     B = usize::MAX,
+    /// }
+    ///
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(usize::MIN));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(usize::MAX));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(usize::MIN + 1));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(usize::MAX - 1));
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(usize)]
+    /// #[repr(isize)]
+    /// enum Foo {
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(u32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (u32::MIN as i64) - 1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(u32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (u32::MAX as i64) + 1,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_unsigned_int {}
+
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<i8, 7>, i8, i16, i32, i64)]
+    /// #[repr(i8)]
+    /// enum Foo {
+    ///     // `i8::MAX` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = i8::MAX,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(i8, i16, i32, i64, Bounded<i8, 7>)]
+    /// #[repr(i8)]
+    /// enum Foo {
+    ///     // `i8::MAX` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = i8::MAX,
+    /// }
+    /// ```
+    mod any_try_from_target_overflow_is_rejected {}
+}

-- 
2.47.3


