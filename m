Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A875519AD8B
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Jun 2025 23:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750546993; cv=none; b=vBan7kZjheb5XRuySjIwkumBkEWMUKGlKb9nFn4Sp6rkrYMvPY83Q08vJgiMNylZ6bJlFicPizgZsFe0jSLv/31mW8VBQuVQwrmGu/4rvenUABUJMwaY/LSFYKvvr48A1SnXjbZ5Brsv9eyLdBw/nNrPp7i+IZky9GxHEqSzxsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750546993; c=relaxed/simple;
	bh=IIxCG+SjI43xvm1MbSF+iDC9spNFwOV9DKQYHUjskdM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CeOK34RdDg4KQD45XcYfrmH8iDNRYIlm1y8s/E1OotUBp15b+DI2hmr8DOsI1KWrm36vWYkla8XGWpNVFwEWm5FiCE2DSO1DqPT3MgyA1D1wZVhI+D5EoORSoeM1YAufaqcu/X1jx5bLfIVuSXqOBPrQ+7RC+yRg5y2jO3ZfJEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=antoniohickey.com; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antoniohickey.com
Date: Sat, 21 Jun 2025 23:02:55 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Antonio Hickey <contact@antoniohickey.com>
Cc: Antonio Hickey <contact@antoniohickey.com>, Daniel Cote <danielstonecote@gmail.com>, rust-for-linux@vger.kernel.org
Subject: [PATCH v3 0/2] rust: `overflow_assert!` macro
Message-ID: <20250621230231.100181-1-contact@antoniohickey.com>
Feedback-ID: 144211621:user:proton
X-Pm-Message-ID: 40b380c59c4021caa1c32beaaf7436ca31f2dcb2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch set introduces a macro for overflow assertions, the use of
this macro will avoid local `#ifdef`s by encapsulating the conditional
behavior to the macro. In addition this macro also allows us to document
the intent of the assertion more clearly.

This patch set requires Alice's `strncpy_from_user` patch[1] linked below,=
=20
because I use it as an example usecase for the `overflow_assert!` macro.

Dependent Patch [1]: https://lore.kernel.org/rust-for-linux/20250616-strncp=
y-from-user-v5-0-2d3fb0e1f5af@google.com/

Changes in v3:
- Made the `overflow_assert!` macro take in expressions instead of
  values.
- Fixed path in macro to fully qualify.
- Refactor macro to make the conditional compilation as local as
  possible.
- Refactor macro to utilize the `cfg!` macro like the standard library
  does to reduce boilerplate.
- Added an example use case of the `overflow_assert!` macro
- Link to v2: https://lore.kernel.org/rust-for-linux/20250504165612.86459-1=
-contact@antoniohickey.com/

Changes in v2:
- Fixed example doc comment so it doesn't panic.
- Link to v1: https://lore.kernel.org/rust-for-linux/20250504164349.84149-1=
-contact@antoniohickey.com/

Co-developed-by: Daniel Cote <danielstonecote@gmail.com>
Signed-off-by: Daniel Cote <danielstonecote@gmail.com>
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1159
Suggested-by: Miguel Ojeda <ojeda@kernel.org>

Antonio Hickey (2):
  rust: kernel: create `overflow_assert!` macro
  rust: uaccess: refactor to use `overflow_assert!`

 rust/kernel/lib.rs             |  1 +
 rust/kernel/overflow_assert.rs | 33 +++++++++++++++++++++++++++++++++
 rust/kernel/uaccess.rs         |  4 ++--
 3 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 rust/kernel/overflow_assert.rs

--=20
2.50.0


