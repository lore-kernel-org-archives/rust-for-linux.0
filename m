Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21702461C2A;
	Thu,  8 Jan 2026 13:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880357; cv=none; b=ej/GSTBOM5WCvF+RTTs/ZzruG5l+8ErNkNd9BDjYSl0RwoH/pzWIo17ucjzY3Qyl9ztfmYTxdkq1qSHtNElPHDtR3fCqTSrqzfpzGaWFgTQwBNQPyfHgH9eVO21FI+1B82yQ+i7GQVrbheSaras5g6zblw+E2s+xCWufPPQS6oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880357; c=relaxed/simple;
	bh=6glandZGQjyJKagK8Jmi3vQlLhH+2AeXSF2n99rVZCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwDhf+lGPVOX6hTms/9HpX3wVjQjat66OjgURtxySCprxpxVYjwLXGcEwuazPgDJzqLovEMVQQ4HWfxLEZ2Sqb+9Xp56oOYea4k050H8H96k3YoW3/nxK5b8SM8BI0wM9s96HsJk2qUu2kOw+ejHJYxP4cPMkzDxkYQRlm+rlaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hN8pcJaL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hN8pcJaL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26CFC116C6;
	Thu,  8 Jan 2026 13:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767880356;
	bh=6glandZGQjyJKagK8Jmi3vQlLhH+2AeXSF2n99rVZCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hN8pcJaLCQ69EGmBAQWP1KHWc+KGKz/pgIu1juh36XvOdf3imfnlAqtTVtAgU7cCC
	 LNyDm7E7fR1l7aNWsL70wPqsnukZhYT2z+3QHtz1q0rjaADnbc3PhN/8QAa3xZ1aIR
	 LP35+zHJd79pjKODT5nfjqk87Rzk6DXpjfOphnOXihEZoB/0gfbXTdIMkqcHLtH4dc
	 kR82uHfLgynvoAmRiQXnCvReXAb42kQ5Wt0T3SxOxyfjZIDGUHScQisl2JRFKfeCiw
	 QKDqHo3QzskaHWuvYoFKy9cOG7sdCvINNaOXhPuMhqmJhN56Omc20MxZ2KVrGGvtGI
	 leyqcvL3n+LCw==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Fiona Behrens <me@kloenk.dev>,
	Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/12] rust: pin-init: allow the crate to refer to itself as `pin-init` in doc tests
Date: Thu,  8 Jan 2026 14:50:40 +0100
Message-ID: <20260108135127.3153925-3-lossin@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260108135127.3153925-1-lossin@kernel.org>
References: <20260108135127.3153925-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `syn` approach requires use of `::pin_init::...` instead of the
`$crate::...` construct available to declarative macros. To be able to
use the `pin_init` crate from itself (which includes doc tests), we have
to declare it as such.

Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/src/lib.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 8673008f45d2..0e707f00061f 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -290,6 +290,11 @@
     ptr::{self, NonNull},
 };
 
+// This is used by doc-tests -- the proc-macros expand to `::pin_init::...` and without this the
+// doc-tests wouldn't have an extern crate named `pin_init`.
+#[allow(unused_extern_crates)]
+extern crate self as pin_init;
+
 #[doc(hidden)]
 pub mod __internal;
 #[doc(hidden)]
-- 
2.51.2

