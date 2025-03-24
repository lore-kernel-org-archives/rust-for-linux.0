Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A5725F986
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Mar 2025 18:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742841929; cv=none; b=gYORwj+RSB7ZCAKRyY7frVZ41QUYGEGsEsBDMcsfI7GN/9wJ8yfFYEwplpGmyXy04/WiDUZil2rooRg+6AE4f9E4YtSGb310SF7SIem9aBdPEoyl/IzFxL7Y/4qNG+iXRTvpIqD+8Fp72oSXscmxuVi9DvqTOlTR244BmBeWOjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742841929; c=relaxed/simple;
	bh=NToJm6VpcJU5waw1fyi2HhnHQgHci0gUkxcU33Ou7LA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LlIMTLK7IqtkPGiJkTLmmf8v7t3wnqZ42s0xaDVnJ17cjclnI32q0i+j1n2F0rcePFCTdmDTfd8wjH4t056yeq5M1JYeEwizyQGKcEuYp0y6clJ8QMySf9qu9Oosj2AhKmgHL764FnGEwo04qXOMyvxJWgfT9RsVypIfpWah27U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ozlu.eu; spf=pass smtp.mailfrom=ozlu.eu; dkim=pass (2048-bit key) header.d=ozlu.eu header.i=@ozlu.eu header.b=B3KCXGqj; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ozlu.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ozlu.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ozlu.eu header.i=@ozlu.eu header.b="B3KCXGqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlu.eu;
	s=protonmail; t=1742841910; x=1743101110;
	bh=+QmIQIkeLzelhbr7jSpVwrcXYaORYbvwfRFIVAof/kg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=B3KCXGqjKWaLAk5aRnqz0MUGkkmjqqjm1k5MPNX87qoCge1r3g+0PJ5E70b0ak44P
	 ZPVXm5VWvZ8BRYSFfu1T8H/t+znDHjwwRirOnNhukakDePQgpaxgKfxq51DyMoL12U
	 ZTHBuFbIyvvq92EtSuDaoOGMfgbMjKaemDkUFcVMz4M9eJJr7ueWgON9JPAj+Wr67+
	 JzCxumZa4wxAJDOMw1IzJ8XyH1hK6JxpmmrB1wUNvfnJ69HQ+JFgcrpXAZtL20FyFd
	 pGaY7ZboRwu7Du8ubwvaHnZbWXu1l386HDpPXM4iCOVlwW2HqtJx/OqfctJtv93NU+
	 4z02p0x2DYPGA==
Date: Mon, 24 Mar 2025 18:45:05 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
From: Altan Ozlu <altan@ozlu.eu>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, Altan Ozlu <altan@ozlu.eu>
Subject: [PATCH] rust: static_assert: add optional message
Message-ID: <20250324184403.868691-2-altan@ozlu.eu>
Feedback-ID: 127873954:user:proton
X-Pm-Message-ID: 816eea0a00a6a11d81683be904dd1cf18c7d6f13
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
 rust/kernel/static_assert.rs | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/static_assert.rs b/rust/kernel/static_assert.rs
index 3115ee0ba8e9..27771dc2988a 100644
--- a/rust/kernel/static_assert.rs
+++ b/rust/kernel/static_assert.rs
@@ -6,6 +6,9 @@
 ///
 /// Similar to C11 [`_Static_assert`] and C++11 [`static_assert`].
 ///
+/// It has optional argument for custom panic messages.
+/// Panic message doesn't support formatting.
+///
 /// The feature may be added to Rust in the future: see [RFC 2790].
 ///
 /// [`_Static_assert`]: https://en.cppreference.com/w/c/language/_Static_a=
ssert
@@ -24,11 +27,11 @@
 /// const fn f(x: i32) -> i32 {
 ///     x + 2
 /// }
-/// static_assert!(f(40) =3D=3D 42);
+/// static_assert!(f(40) =3D=3D 42, "f(x) must add 2 to the given input.")=
;
 /// ```
 #[macro_export]
 macro_rules! static_assert {
-    ($condition:expr) =3D> {
-        const _: () =3D core::assert!($condition);
+    ($condition:expr $(,$arg:tt)?) =3D> {
+        const _: () =3D core::assert!($condition $(,$arg)?);
     };
 }

base-commit: a0b539ad369fe434fe488faf92d4ae770a27a90f
--=20
2.48.1


