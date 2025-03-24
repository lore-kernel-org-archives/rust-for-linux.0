Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE131E3DE0
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Mar 2025 21:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742850109; cv=none; b=fnitdpUVFo/3kTeDSKGACoV/zSBz4wxCsY2JUjLDfZGY6RpzFbro2BmgFJX6xcYDePiJTy0CY9IGGDh/po8WGD1JG8wMfFBC0hmOaREA3l7u3IULMU+MeZgkUlY2A8oI3Znw0PIsXDVldFGCEjSFd4J3gHRNdb9+HlNNc3U329g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742850109; c=relaxed/simple;
	bh=IuZaHTzu9UBcmm4eUbLU7i0K+28T43waqoKj8h1oT5w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LfK504UV1JKL4cLG2thfAS0e1uPdrdd65LdiA52jXk3n7YGz9wzl4x5SBKFfyNsNhpNv8neb5+RoLGvrL2lT6Z3jxzXIvcqHeO47IKe+df7JHtUVC8QP0At24aBfwFld46izh+uQ2BLGeKwGA4CwjR6qnAyL1BLJ2J4MryZixik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ozlu.eu; spf=pass smtp.mailfrom=ozlu.eu; dkim=pass (2048-bit key) header.d=ozlu.eu header.i=@ozlu.eu header.b=RZqrWsOi; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ozlu.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ozlu.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ozlu.eu header.i=@ozlu.eu header.b="RZqrWsOi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlu.eu;
	s=protonmail; t=1742850091; x=1743109291;
	bh=FKlFDQqFC2nZLyVyf4freRM/9AP2n0Vzy+mvPLfraN4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=RZqrWsOilSXf05bata7U0EWSKs1Wd0eWNQbEm1pNsWc6EBwfFPRvelMu9sehREUGq
	 CJPRvMBF4ApXHTCDViiXfS1KbiPvf4fwv4vT+bZREJbF2M0N9dfXy4rcr5aKv+IptK
	 38PnEp4rvOVrz9YLCu2V94Ssznt4Egf7EkrdCPH0Mjg8HmDyGNWDzeyweHkattWG2P
	 Cg4SkXJ+h7LCjMyUFg9Y0JAynJI25Tvwe9+tXgaOy5wXpJ396jfV1YzUhHDdXkMcBZ
	 dbdLORdkfnV/5odFpLYFn4cWdy7ukt3Aka6gZIvfpG5MoDOahzOqw8tNvuSG3p1R2l
	 BNFAI6H1BserA==
Date: Mon, 24 Mar 2025 21:01:25 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
From: Altan Ozlu <altan@ozlu.eu>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, Altan Ozlu <altan@ozlu.eu>
Subject: [PATCH v2] rust: static_assert: add optional message
Message-ID: <20250324210005.990827-2-altan@ozlu.eu>
In-Reply-To: <20250324184403.868691-2-altan@ozlu.eu>
References: <20250324184403.868691-2-altan@ozlu.eu>
Feedback-ID: 127873954:user:proton
X-Pm-Message-ID: ca3a6b49093bdf654052f92c84ebdb39ffcaac36
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add optional panic message for `static_assert!` macro.

It doesn't support argument formatting, due to `const_format_args`
being experimental. It will fail to compile if a message with argument
is given.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1149
Signed-off-by: Altan Ozlu <altan@ozlu.eu>
---
 rust/kernel/static_assert.rs | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/static_assert.rs b/rust/kernel/static_assert.rs
index 3115ee0ba8e9..b0569dccfb76 100644
--- a/rust/kernel/static_assert.rs
+++ b/rust/kernel/static_assert.rs
@@ -6,6 +6,9 @@
 ///
 /// Similar to C11 [`_Static_assert`] and C++11 [`static_assert`].
 ///
+/// It supports an optional argument for custom panic messages.
+/// The panic message doesn't support formatting.
+///
 /// The feature may be added to Rust in the future: see [RFC 2790].
 ///
 /// [`_Static_assert`]: https://en.cppreference.com/w/c/language/_Static_a=
ssert
@@ -25,10 +28,11 @@
 ///     x + 2
 /// }
 /// static_assert!(f(40) =3D=3D 42);
+/// static_assert!(f(40) =3D=3D 42, "f(x) must add 2 to the given input.")=
;
 /// ```
 #[macro_export]
 macro_rules! static_assert {
-    ($condition:expr) =3D> {
-        const _: () =3D core::assert!($condition);
+    ($condition:expr $(,$arg:literal)?) =3D> {
+        const _: () =3D core::assert!($condition $(,$arg)?);
     };
 }

base-commit: a0b539ad369fe434fe488faf92d4ae770a27a90f
--=20
2.48.1


