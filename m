Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch [109.224.244.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAB74A06
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 00:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755563836; cv=none; b=j+he2bQhC6eJN+B3grmovZx0xWqz8Wr+mUhlwdsmUn0CuZcDojHLD4CgTVwKDiNkbXvAlEFecBAGC2wHV6D+jnLU6LwiKY1mr05EKe8ztfAMMVgXk1IrU4vvSBTYiEjO22XE48+JhUn09kWDVb9O7nfCLvq6jWpXfFasWxCXZu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755563836; c=relaxed/simple;
	bh=YFzXcKV/w1yhU4pUEc9voqHHxolgp/fNB+Mx1i03H+4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Z4k4T6hb90XtkN4MqnF7ae3PCUJvVr9uDUbKpzuIFO0qLia/fCNOI7bss2hbFHjqWAklOqSflo6XeaaHEQSdFQ6VHhpyOLiNqCkP0W73HqXauq3d71p2Gt2CLVwsAw52U6+1TXGIl65RVc+xXFT8pinnBmCfV1LmJiP+8Ny4z4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=antoniohickey.com; arc=none smtp.client-ip=109.224.244.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antoniohickey.com
Date: Tue, 19 Aug 2025 00:36:59 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Antonio Hickey <contact@antoniohickey.com>
Cc: Antonio Hickey <contact@antoniohickey.com>, Daniel Cote <danielstonecote@gmail.com>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
Subject: [PATCH v4 0/2] rust: `overflow_assert!` macro
Message-ID: <20250819003653.22701-1-contact@antoniohickey.com>
Feedback-ID: 144211621:user:proton
X-Pm-Message-ID: 3d561044359b84de35818b3a348faf0c11ec4e26
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

Changes in v5:
- Refactored the `overflow_assert!` macro  to forward all tokens
  to the `assert!`, allowing full message formatting and parity
  with `debug_assert!`.
- Improved the documentation of the `overflow_assert!` macro.
- Updated example use patch to also use a custom message.
- Link to v4: https://lore.kernel.org/all/20250629024310.97937-1-contact@an=
toniohickey.com/

Changes in v4:
- Added the ability for callers to supply a custom message to the
  overflow assertion.
- Small change to verbage in documentation.=20
- Link to v3: https://lore.kernel.org/all/20250621230231.100181-1-contact@a=
ntoniohickey.com/

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

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1159
Co-developed-by: Daniel Cote <danielstonecote@gmail.com>
Signed-off-by: Daniel Cote <danielstonecote@gmail.com>
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
Cc: Tamir Duberstein <tamird@gmail.com>

Antonio Hickey (2):
  rust: kernel: create `overflow_assert!` macro
  rust: uaccess: refactor to use `overflow_assert!`

 rust/kernel/lib.rs             |  1 +
 rust/kernel/overflow_assert.rs | 44 ++++++++++++++++++++++++++++++++++
 rust/kernel/uaccess.rs         |  4 ++--
 3 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 rust/kernel/overflow_assert.rs

--=20
2.50.1


