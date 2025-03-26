Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch [185.70.40.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026B4255254
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Mar 2025 20:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743020750; cv=none; b=nmZjUP2eFbOKm1EptYxrV1QW1XzezglEa6IZ3t9iDFTKbJy+c/SKCbWzX7zot8q/CqawZwuZne/S27aGYgl+KSwm3kcBTBkXl/l/wd7QhqDxGHwfPwQXHvxXtExjSTBVoe2RYKUGnqGtQbKJd2UECrTZRiecf6S2K6o5sAfML90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743020750; c=relaxed/simple;
	bh=ko4vcFwf5QpQffbtCXs2TYZ/DU//v/cau+yy/ARyixk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NMuMEsRbwcKG4IugVbMVuNeYPQcbeZoL/S5KHN7gIO5bBqrfNWjC8UOvgeo87OluAShJ3wKh9azXK/evr7S4/vRm+98UmaLrJo6hrDmD17Lj2gWbmcbc0ejas4X9OS2rja0G7Z+ciq+7d817qGK8cw8zTq+3ebG8uHHROs6Nygg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ozlu.eu; spf=pass smtp.mailfrom=ozlu.eu; dkim=pass (2048-bit key) header.d=ozlu.eu header.i=@ozlu.eu header.b=Hnlxq1aR; arc=none smtp.client-ip=185.70.40.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ozlu.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ozlu.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ozlu.eu header.i=@ozlu.eu header.b="Hnlxq1aR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlu.eu;
	s=protonmail; t=1743020742; x=1743279942;
	bh=wKWASX6ea3WPXTePKKVJiFwa6IBUoNFaTpnYwQ/knfA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Hnlxq1aRUp5fDEG2wy/oSlhkTXoGoagFycMPBLvzgsNuBm2MxTDb8gToOJtGI2TGX
	 Tss1D3GEdw/9wKldJMGHzUxYMp1fqdQr5sjziMguUaMfPbtFk9+CanPjZZK6JqgQN0
	 vUTM4h073c/PBzvvykrQEt4gdQtNntH2RMC3PgHicfy+yV9gpp30mwpTZBPdIlrroP
	 DoSwikgz1bSQGkEdG5rJT+2yUNkRbVCFTyP/0MU6JKL0ozQsKMO/9No8NLR6OH1UK+
	 d/JUqbffQeSw/+6XuDsjEOSHnI4ErX1wHFji/RkHrvQDf5kuOotfQph9t7NGKSf9fF
	 iXXOeskH5Otgw==
Date: Wed, 26 Mar 2025 20:25:36 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
From: Altan Ozlu <altan@ozlu.eu>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, Altan Ozlu <altan@ozlu.eu>
Subject: [PATCH v4] rust: static_assert: add optional message
Message-ID: <20250326202520.1176162-2-altan@ozlu.eu>
Feedback-ID: 127873954:user:proton
X-Pm-Message-ID: 668bf3de901479a0366793ebef9dc28d0b6ef152
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add an optional panic message to the `static_assert!` macro.

The panic message doesn't support argument formatting, because the
`assert!` macro only supports formatting in non-const contexts.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1149
Signed-off-by: Altan Ozlu <altan@ozlu.eu>

---
Link to v3: https://lore.kernel.org/rust-for-linux/20250325211011.1093374-2=
-altan@ozlu.eu/
---
 rust/kernel/static_assert.rs | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/static_assert.rs b/rust/kernel/static_assert.rs
index 3115ee0ba8e9..d8120f838260 100644
--- a/rust/kernel/static_assert.rs
+++ b/rust/kernel/static_assert.rs
@@ -6,6 +6,10 @@
 ///
 /// Similar to C11 [`_Static_assert`] and C++11 [`static_assert`].
 ///
+/// An optional panic message can be supplied after the expression.
+/// Currently only a string literal without formatting is supported
+/// due to constness limitations of the [`assert!`] macro.
+///
 /// The feature may be added to Rust in the future: see [RFC 2790].
 ///
 /// [`_Static_assert`]: https://en.cppreference.com/w/c/language/_Static_a=
ssert
@@ -25,10 +29,11 @@
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


