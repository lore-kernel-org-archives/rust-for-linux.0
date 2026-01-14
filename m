Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC102F39D7;
	Wed, 14 Jan 2026 18:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768414811; cv=none; b=o1KtGme5eT9Nd9cfuif3bFhn/zqM1TgkN3tQLnLuptRujf2yBOdDgo4zWkhFXCDxN1xs9JdEmGW2oH1HU0it7Y5aDKPGuP2X6CTc2dyum3gLC99o/i2Z1j76PGvLgmNNpN5/aWTS/N5gP6IrMlQLJ0GWY9FhC90DdtyNmHgqrfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768414811; c=relaxed/simple;
	bh=2iVUn8+IuAf7md1We7K0oOBBsZzyg7u7joFR/x1D8aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HBZSrDFUohCLv2MRjSSASJ4Fjm+kYdv1pmoomnNmWz4dCiAr4XAgnqdROGnaE8yAAum8E+//06mjaZGjzvLWTgkh7awoNynXgnP1ZWgxn1n7ZYPAPOW8B8FI6Nzw8g5H+MwJyUTm06Na3ru4kmc3N3JN9qOHnwC/l3kE/3SN76U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZZ3NpQ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZZ3NpQ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD4CC4CEF7;
	Wed, 14 Jan 2026 18:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768414810;
	bh=2iVUn8+IuAf7md1We7K0oOBBsZzyg7u7joFR/x1D8aQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bZZ3NpQ4+OP07hbmlp4PPKlCha8udfcDLJHmPPtW4T9BqHLLO2JEv6SXRf1Z7OuHF
	 tDZGh3/MOlNV9LCO3Mxn+rLGnddX0NLIUxP/YmURb4QT/XLrSvnbMr6iP2/UkEKa16
	 Ozaw7KRgCZB7zBGY4r89k4W2ByWFpLsW22DcozRmJMtk2OhlI+4dzb0Y6s4k6WnAmR
	 +09A1LASLZXZyzYZlLQfUavjR8XoZbV3gBVCIt1BRndE6TAADiacP2L8miG35QTpev
	 GKsPEJdz/0xztT7VlcBBxDEgd7lEl9v+3JRExe7kUvNBm++BueTriU0ZA6r6AbKgQr
	 ffK4RLeaKHNHw==
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
	Fiona Behrens <me@kloenk.dev>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 04/15] rust: pin-init: internal: add utility API for syn error handling
Date: Wed, 14 Jan 2026 19:18:39 +0100
Message-ID: <20260114181934.1782470-5-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114181934.1782470-1-lossin@kernel.org>
References: <20260114181934.1782470-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The API is similar to diagnostics handling in rustc and uses a
`ErrorGuaranteed` value to signify that an error has been emitted. It
supports both fatal errors (which abort the macro expansion immediately
by returning `Err(ErrorGuaranteed)`) and non-fatal ones at at generation
time. These errors are appended to the token stream after generation has
finished normally. This allows giving good errors while still expanding
most of the code as expected to avoid the user encountering additional
errors (for example missing definitions).

Suggested-by: Gary Guo <gary@garyguo.net>
Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v3: switch to Gary's suggestion
Changes in v2: added this patch
---
 rust/pin-init/internal/src/diagnostics.rs | 32 +++++++++++++++++++++++
 rust/pin-init/internal/src/lib.rs         |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 rust/pin-init/internal/src/diagnostics.rs

diff --git a/rust/pin-init/internal/src/diagnostics.rs b/rust/pin-init/internal/src/diagnostics.rs
new file mode 100644
index 000000000000..555876c01bab
--- /dev/null
+++ b/rust/pin-init/internal/src/diagnostics.rs
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
+use std::fmt::Display;
+
+use proc_macro2::TokenStream;
+use syn::{spanned::Spanned, Error};
+
+pub(crate) struct DiagCtxt(TokenStream);
+pub(crate) struct ErrorGuaranteed(());
+
+impl DiagCtxt {
+    #[expect(dead_code)]
+    pub(crate) fn error(&mut self, span: impl Spanned, msg: impl Display) -> ErrorGuaranteed {
+        let error = Error::new(span.span(), msg);
+        self.0.extend(error.into_compile_error());
+        ErrorGuaranteed(())
+    }
+
+    #[expect(dead_code)]
+    pub(crate) fn with(
+        fun: impl FnOnce(&mut DiagCtxt) -> Result<TokenStream, ErrorGuaranteed>,
+    ) -> TokenStream {
+        let mut dcx = Self(TokenStream::new());
+        match fun(&mut dcx) {
+            Ok(mut stream) => {
+                stream.extend(dcx.0);
+                stream
+            }
+            Err(ErrorGuaranteed(())) => dcx.0,
+        }
+    }
+}
diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src/lib.rs
index 4c4dc639ce82..0e1a4724549d 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -12,6 +12,7 @@
 
 use proc_macro::TokenStream;
 
+mod diagnostics;
 mod helpers;
 mod pin_data;
 mod pinned_drop;
-- 
2.52.0

