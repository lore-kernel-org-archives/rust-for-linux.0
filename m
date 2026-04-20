Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9FE346E59;
	Mon, 20 Apr 2026 16:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776701816; cv=none; b=EVjhDPkGYAFEiiZzTxnHHYMdD6ks8121VAjyXhcN5WTGIxCrbCsaAH/JFA7bYZ2yNOvZgqv5pYe94dPSFH8CZA1bscq02jRoZadqxYd6207jnFVhwpQwlnFV9CwwVOMG+XikBQMx3DE5/12JMf8BKhA3M1MXcMw0MkH5kNS2mPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776701816; c=relaxed/simple;
	bh=f7cOZdBw/fcphFGMP5D2s2AyQQC43+pBBczMk+w8Bx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gRlpiGRaRHrNBiPL/S5aEcF8nqG659EjIpjSPUYcmZCEQpAbWkTiuoEl6eguZ6sgS1u3IHSJFwnxqnoKoAEuUc48OSLxnivW3Eotn1JHk8PiYtO+wHnndx9NAf3D01ywPUWCOCYqcvuiooNNouNmMNUFnY5XqO/Fpg/MY34H2kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4xHcPgS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4xHcPgS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0853DC19425;
	Mon, 20 Apr 2026 16:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776701816;
	bh=f7cOZdBw/fcphFGMP5D2s2AyQQC43+pBBczMk+w8Bx0=;
	h=From:To:Cc:Subject:Date:Reply-To:From;
	b=d4xHcPgSQF6xLdIzXkD5IeYbu5gDksroc+XDWbzKeIza/vdNojjSOm6743y3eksiE
	 tmcel2+0N+eFhaK8FLHBPBVpaMHTAyI44+zMVudcH74gzSce1BpCalRW/Icp1jvJLp
	 EaQkN7ldaiCStOEinef5YDRy7ez4lyztuLM3MtZz3WKR18zN9WloP/4pqNLh4OgpC7
	 IoHgfcctZv6MFbjWtWuqa/c3CQ5AiUZG1Tou0g8OzFAkrjeWaG92ozTlNfrqGTjZ2u
	 +B5YS+Ir7rQwXwTBn9qATIw7dI2h5tSt51HKfvf3td3HyHPxLCPBVksdugJ3X2b15V
	 RJGih1BqScsQg==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: doc: disable doc inlining for all prelude items
Date: Mon, 20 Apr 2026 17:16:36 +0100
Message-ID: <20260420161636.1790502-1-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Somehow the rustdoc heuristics determined that a large chunk of the items
found in prelude should have documentation inlined. This bloats the
generate documentation size.

Also, for crates that optimize documentation with `cfg(doc)`, as the
documentation inlining makes use of the metadata compiled by just rustc, it
will not pick up the `cfg(doc)` attributes from the inlined documentation.
pin-init for example optimizes tuple/fn rendering using the nightly
fake_variadic feature [1], but this is missing from the inlined version
[2].

Thus, mark all prelude items as `#[doc(no_inline)]`.

Link: https://rust.docs.kernel.org/next/pin_init/trait.Zeroable.html#impl-Zeroable-for-(J,) [1]
Link: https://rust.docs.kernel.org/next/kernel/prelude/trait.Zeroable.html#impl-Zeroable-for-(J,) [2]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/prelude.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 44edf72a4a24..bcd4e7f90bc7 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -22,6 +22,7 @@
     pin::Pin, //
 };
 
+#[doc(no_inline)]
 pub use ::ffi::{
     c_char,
     c_int,
@@ -47,6 +48,7 @@
     vtable, //
 };
 
+#[doc(no_inline)]
 pub use pin_init::{
     init,
     pin_data,
@@ -58,6 +60,7 @@
     Zeroable, //
 };
 
+#[doc(no_inline)]
 pub use super::{
     alloc::{
         flags::*,

base-commit: 1c7cc4904160c6fc6377564140062d68a3dc93a0
-- 
2.51.2

