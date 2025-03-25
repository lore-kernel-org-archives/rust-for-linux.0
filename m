Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACF0266B71
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Mar 2025 21:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742937051; cv=none; b=jc8MeBQ+OSDNQFetSUF2zwiWKScXl/F4lhYb8uoPbSt3ZUhmAWSWDi9tWZ3Q8nmTZ7u4fzIQrEX/hI1uHqgSIfNtqOfSCY4fmSksBY0ckQ5ivOjVuaDKueCErqj59ymT/xhsWImR6weF9TkTFhPOhSjC+ed0nQ5D0bFT7evbx6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742937051; c=relaxed/simple;
	bh=juJC2ldUcGTzWh4/wtL22UseRqE2RUdLQ4htrhrJv/c=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QfIxnzqCvZKO5s5L16puMILMAjn2/zuXt9FWDZXaMbOJUW4gD1EBXR3Q5eK1zpkG/B6ng0h+QFDYXjgEX6ZXiDAfK9qcMC7K1wKADDZOHRwtjmIwFAxsw5oICKlCRwdGLxuxUytvhVv/XsxvrYsocbCHJoy9KCUKWotPeLMJ4+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ozlu.eu; spf=pass smtp.mailfrom=ozlu.eu; dkim=pass (2048-bit key) header.d=ozlu.eu header.i=@ozlu.eu header.b=Zudxyay5; arc=none smtp.client-ip=109.224.244.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ozlu.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ozlu.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ozlu.eu header.i=@ozlu.eu header.b="Zudxyay5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlu.eu;
	s=protonmail; t=1742937039; x=1743196239;
	bh=vIGN2bl418EBKyeDnX8uco6KGhKBTGfqXuFc0cW8E1Y=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Zudxyay59VVmbglnR8xcKnHEWWIIgxqYhyN/YBQvMcrgYpfENi9b/QxFzlKH21i/J
	 g5D+AST554xWEjgnSLN97HnwRQ7SLM/SSF5RPmnZRraY2+m75ONMwHVkN+oWcmyBkf
	 QBVK8w9dOaS/BhIgCpIMeJ21ytr2jH36TCOkKjJQskZVAkI7PSKovZZ1UsyVcTJFQ4
	 Nnqr+yN72J7Ok1TBS970Zu/UM0BP4Qb52lYiyn3Y9M+hdvl/a1gERNP0kRop/3eYql
	 51puRmaCbpXOKylzwhXvlQxFP4YcrvcEmTqiLIMhrdXbQ4H6Bfbr+GXK83zeCms/IG
	 G9+QlmZAaf5aw==
Date: Tue, 25 Mar 2025 21:10:35 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
From: Altan Ozlu <altan@ozlu.eu>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, Altan Ozlu <altan@ozlu.eu>
Subject: [PATCH v3] rust: static_assert: add optional message
Message-ID: <20250325211011.1093374-2-altan@ozlu.eu>
Feedback-ID: 127873954:user:proton
X-Pm-Message-ID: 72a7af79bcd78464fd72513b317d9a9c97797ce9
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add an optional panic message for `static_assert!` macro.

It doesn't support argument formatting, because currently `assert!`
doesn't allow formatting in const contextes.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1149
Signed-off-by: Altan Ozlu <altan@ozlu.eu>

---
Link to v2: https://lore.kernel.org/rust-for-linux/20250324210005.990827-2-=
altan@ozlu.eu/
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


