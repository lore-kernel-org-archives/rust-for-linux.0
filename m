Received: from mail-07.mail-europe.com (mail-07.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7F81FF7C7
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 02:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782958723; cv=none; b=Ncn51tdWWUy+/dlarfHMTo6b2gTltr6Nec6F+MmKLN3YZ3QlOJPqEUDC2vw8wTW36vpVOcSANEjmFKr5QsCB/3yockD1NkxN/bL/o/LgDC+YR2m103kP9ftgTJ8Pd5Ayh7p6F9XARZrF65hlKgaDe+ic86eHiea24YUBE0RZH10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782958723; c=relaxed/simple;
	bh=lYiR7rQkRVJN1VUz3Knaa5NcP8pvAG3IeSXd0OaQJKk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=E5vqE25PFIhE1OQVc8XjwjJa7n+U/X1vPPPRjAGQMAlSNO7t8ErLK92heHp4g0rAKtZb+AaMs/gp7CZeYqnsmLAjWmnr2tE5BKxM6sbwifgASFQVY+h3fJhXnQiTaxS93uVkwADHgXWxDHDIdg3osgMLWjEEwdyofq8eXUjst48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=antoniohickey.com; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antoniohickey.com
Date: Thu, 02 Jul 2026 02:18:23 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
From: Antonio Hickey <contact@antoniohickey.com>
Cc: Antonio Hickey <contact@antoniohickey.com>, Daniel Cote <danielstonecote@gmail.com>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
Subject: [PATCH v6 0/2] rust: `overflow_assert!` macro
Message-ID: <20260702021811.758731-1-contact@antoniohickey.com>
Feedback-ID: 144211621:user:proton
X-Pm-Message-ID: c6b56666b42d95e4be34cf9f32185949eb6977db
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

Changes in v6:
- Fixed the order of tags.
- Improved the documentation of the `overflow_assert!` macro.
- Added missing review tags.
- Link to v5: https://lore.kernel.org/all/20250819003824.23019-1-contact@an=
toniohickey.com/

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
 rust/kernel/overflow_assert.rs | 43 ++++++++++++++++++++++++++++++++++
 rust/kernel/uaccess.rs         |  4 ++--
 3 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 rust/kernel/overflow_assert.rs

--=20
2.54.0


