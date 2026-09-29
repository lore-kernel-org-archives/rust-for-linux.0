Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E1852F262;
	Tue, 29 Sep 2026 13:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690392; cv=none; b=ucR2Y9Gpylp1eTS4rYHl6cULHzvS/7FBc1YI/EtrbxB1LaeDtyNR0z2hVOGarv7nqJyHZruJTVbsy++h6zxpPWtOlcrl0O2TVLwfrQYwxsm6wXBV0PxOHI9/rSBhcbV1hyu4gzfpvcEKrFWEoR+zWOHfJh71guA1vet9xznHRsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690392; c=relaxed/simple;
	bh=u/d4qeQk+cYX8jEedsTROYtAgb6icjHHqzbGjBSRxkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z0ht+DVz7L8cqdB7Baj7LUI00AeP6fg3l32uKHgjY/2e9FKgha4X6v2a2CWf4ISXtdIf4YOguG9/iQ90ob3KHuc8aHYgIAqpfGvdtegREPu0/3ruNd5POlFU6wXTwqLOMPukdej4p6w7Hy9D34tLipz7TturJQRqXoEEd5Rw3Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CUzbax/0; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CUzbax/0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=i2
	3GQWHrqKEw4UmMHeQgbuB73EzYhp17zDEfnnMKIZE=; b=CUzbax/0e+akv0dON8
	inVvkAw1NOnMzQA5Lejes9ulxrQ97YyD0X/MiVTT4EB1x6mhT1qNOUxB/U3xGVIN
	dJPBYO13hl+wVMuO0kns8RC4wHVqSNgMYXyOM43B8h8rIocmr5FKEEtjw6fVtHLy
	/E//B7LS2wB/jTnIMmnE+YZ+k=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDX8L8hxLtqbwr+Bg--.43938S6;
	Tue, 29 Sep 2026 21:59:17 +0800 (CST)
From: Kaiqi Guo <chaoji_xinren@163.com>
To: rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Jesung Yang <y.j3ms.n@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Kaiqi Guo <chaoji_xinren@163.com>
Subject: [PATCH v6 04/10] rust: macros: add private doctests for `Into` derive macro
Date: Tue, 29 Sep 2026 21:58:49 +0800
Message-ID: <20260929135855.36775-5-chaoji_xinren@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260929135855.36775-1-chaoji_xinren@163.com>
References: <20260929135855.36775-1-chaoji_xinren@163.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgDX8L8hxLtqbwr+Bg--.43938S6
X-Coremail-Antispam: 1Uf129KBjvJXoW3uw4UGFW5JF17uFWfGF18uFg_yoWDWw17pr
	4j93y0q348JrZ3Aa4UG39rWw12gFs3Xas8ZFZrJw1IyFy2qFZruw4UWry7JFyFyr1UZry2
	qFWjyryDW340y37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEGNt-UUUUU=
X-CM-SenderInfo: pfkd0yplb0x0xuhqqiywtou0bp/xtbC-RbHQ2q7xDaqTQAA3r

From: Jesung Yang <y.j3ms.n@gmail.com>

Add internal doctests to verify the `Into` derive macro's logic. This
ensures comprehensive testing while keeping the public-facing
documentation compact and readable.

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Kaiqi Guo <chaoji_xinren@163.com>
---
 rust/macros/convert.rs | 436 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 436 insertions(+)

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
index 21d79bca16a0..31cdf84082e7 100644
--- a/rust/macros/convert.rs
+++ b/rust/macros/convert.rs
@@ -588,3 +588,439 @@ fn is_valid_primitive(ident: &Ident) -> bool {
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

