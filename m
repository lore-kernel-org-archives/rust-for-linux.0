Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9007635968
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Jun 2025 02:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751165011; cv=none; b=UOCIr1mmEw6dTRNMG6iG/lgaktlgxQOIGX7fEbNpMX8jSj8bxguY6Andi+i9OUHre1xWymnHzadSlSqH91bEZFkX5qouVhYjNxYZbxmigh8u9+94Q+VCL7a5HK6/zs/rRsgRtUgaXN5SRkUU3Neh2lsRQE+nEbcGXKTTL3HK39A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751165011; c=relaxed/simple;
	bh=SAJ3ca2odbLNNSK08F7bEdyc0nkVBOAjUuBurPMjhlQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=a/C5+WRmL6raGQJiTWiQRhFCiUg4FY9v0qNhL/5ZzwVNMf/RRrrH6X6KHPykn/DhWtzUN62w9kNBZ4o8ZOjjhX73N6dmvLVFFNVlI7DGc6F7jD4Gi6d6BSzOlgPHFM+791ehjXRPJGMtZtxFYpVSpJ6g7OzUKgkaevbP2EhBBv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=antoniohickey.com; arc=none smtp.client-ip=109.224.244.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antoniohickey.com
Date: Sun, 29 Jun 2025 02:43:20 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Antonio Hickey <contact@antoniohickey.com>
Cc: Antonio Hickey <contact@antoniohickey.com>, Daniel Cote <danielstonecote@gmail.com>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
Subject: [PATCH v4 0/2] rust: `overflow_assert!` macro
Message-ID: <20250629024310.97937-1-contact@antoniohickey.com>
Feedback-ID: 144211621:user:proton
X-Pm-Message-ID: a9428b94fbb620313a3b632d19b5fafdbe570e84
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

Co-developed-by: Daniel Cote <danielstonecote@gmail.com>
Signed-off-by: Daniel Cote <danielstonecote@gmail.com>
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1159
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>

Antonio Hickey (2):
  rust: kernel: create `overflow_assert!` macro
  rust: uaccess: refactor to use `overflow_assert!`

 rust/kernel/lib.rs             |  1 +
 rust/kernel/overflow_assert.rs | 32 ++++++++++++++++++++++++++++++++
 rust/kernel/uaccess.rs         |  4 ++--
 3 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 rust/kernel/overflow_assert.rs

--=20
2.50.0


