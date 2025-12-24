Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DFF1DA61B
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 04:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766548837; cv=none; b=DzdGRQPia6jnojSbUvrOICyxL3ouimAf7+HDo8fUv+68F3DTWdIGuYV/tE1x6hKw05KmjthUjV/PHwq+tDuL29SjDWsJ/nVnCUzxGNqh+b/aZ99DiUueGzwQlmEz1/tBxLIJLcDW34l0TDRrz5K3pKokdCLuuLAQ88V+Wsuyyq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766548837; c=relaxed/simple;
	bh=5dWflN3K5OTrsH0DdR1AIq8dxz4Dc+Sb5n+FhBK4TbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ojyn2wdYAgJlEqSYhmXKoX+BBdCKt+qTwFG+r0d/IEDEa4+4CEyt9GZncrm7Fy+Ci+AYZ/155NyEudADlWywDGlJ9FiNKfZ2FB2V6dgzLBUcaoCdD7E/M0Jsg2PfgNGjCxRJleL2YaUNb0SbDwYLbzZtCwVyek3CxY4Hi9nefyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moKgfJdL; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moKgfJdL"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34ccbf37205so4172364a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 20:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766548834; x=1767153634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82PHCBDnjWpHOS8UJkgNAZqGmK4UTjC/WbN+vRHAyTU=;
        b=moKgfJdL0PKflwM5Tk7vtoseJrwcPo6x1SU6XSbkXfaShPakwupyaniNCtCaMxjngD
         ny6KbTcWHB3JhiN9L+a/HQVSxmUc1aIKQYjk41uzEZYXZsUQY9gOugJ+1NXdWuIKwYrY
         2Af1GoMQ68f8gsD4NN/YxizTINa8fQJ5m8lr7bCVnRQ5TIiX9lv8jCNGmd6Q9ffgZrWB
         GzxT3Z3zgvLkAme+s6I712Drkv8z1QSUZZAY2G3oJdpUle1Rg8e9fOiODpQCjFbb8Y7l
         faR++FtbvhHU3Geposdp48kSSX6UzjM2F5ZOkrwwB3V3ZHXnCX1kiMxV5of68d1VcrcW
         s9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766548834; x=1767153634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=82PHCBDnjWpHOS8UJkgNAZqGmK4UTjC/WbN+vRHAyTU=;
        b=A43pnvyj9kEeH7aGgizLMHEXfk6FxoyMV+qljbMZ55H8YFj6T+wQZA+3nXU4lUtSTg
         KK9cW4+OHAhTTaEG3s1e0fwvTaOpFqNLVqkmjFGphmwFSOhjRYcaFU4Ae2h8PL70aE6G
         vqCs3OzJ0lNRUzdIJPGXe1a2DnOTfqbJmljFqk8stECPeqHtIlaH1V3fTN2WpjUys7Tg
         FiiNoIV3ep0HlnGGxYlTEMevn37bE+2iDbX/0y6BqrmTSuSxiFUMxsNHSYIG04ymOxkE
         UFgD1B9+n0/Bdr4uHX3omTUqae4SaVIIpeSm+9ZhT/fGQW+aHvQ30cg7G9MN/VZkNg6S
         t64w==
X-Gm-Message-State: AOJu0YxPtdnX6OnDpHrQn8PbUmrWxcpJfjslXln8qcDddsFNBYqbZjyQ
	pgFTH3OpeI8KNOr87xCEnRxT0H5jVq8s7K5h3gANFP1v7qQczhVp0Xbf
X-Gm-Gg: AY/fxX4NailkiaI+zwU1xSOHyaPlWtocMgFu2llFTS3oyXPbXPK8IxMLpn3hB2ULfnN
	+zdyj9S/eXxmwzgK/L7QhWzDDWKDvO6uq4hg/gUHfzty2Qwfe12CtlZFVsSAB2wHrRJ2Qe3an95
	JJGF8ZBX0H2VJCVx+9hKOlx2GXSHPAxvZFySgjeZ8pVnNlfZG7oJr79jJtVB2i0yI5m7b8ny7d3
	8I++ng0JPVaDOwCVmpfk4KXRhlTvB+H5cJrgjTDGTtqGtFkRZNL0dqeqqOoKGsGL5xkt0PuKvZp
	bizR2YThJt6O3piCTjcDumTmf5RSrHjCxXXmXNvYP12vxHMatCqHKZMAthrwX2ySt2cVu8hPVTN
	vEOKNwZhXE/xHTnQC63JJmTAMX2dQhD9w9BOEGwcm/CWqgGYF3X12GIpkU7XBaWS1x8SW5V/GuF
	FaHDWUoq9K09nT5/ABZL+XMw==
X-Google-Smtp-Source: AGHT+IEZc4P1j9t0ispVk5oXDUtPhHU67+CVystGtMT5XVU5WyvLofPU8JKlz1H1qwQkNieKhl7NYg==
X-Received: by 2002:a17:90b:4b43:b0:340:e8e9:cc76 with SMTP id 98e67ed59e1d1-34e92144873mr14361360a91.11.1766548834347;
        Tue, 23 Dec 2025 20:00:34 -0800 (PST)
Received: from localhost.localdomain ([104.28.249.217])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c5307c7sm13255131a12.28.2025.12.23.20.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 20:00:34 -0800 (PST)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH v3 4/4] rust: macros: add private doctests for `TryFrom` derive macro
Date: Wed, 24 Dec 2025 03:59:57 +0000
Message-ID: <1b3de883a1ec17acffb818648512329298c400d3.1766544407.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1766544407.git.y.j3ms.n@gmail.com>
References: <cover.1766544407.git.y.j3ms.n@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add internal doctests to verify the `TryFrom` derive macro's logic. This
ensures comprehensive testing while keeping the public-facing
documentation compact and readable.

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 rust/macros/convert.rs | 579 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 579 insertions(+)

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
index 7159fb4dd187..88a0f0b0df2d 100644
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

