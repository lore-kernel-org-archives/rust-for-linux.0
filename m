Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9B3361DA6;
	Fri, 16 Jan 2026 10:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560970; cv=none; b=quFOcVOfK2F5vbAWxoTe5XggrpwKfykw5/+aJERGlV51K27Sq5hMK2nfJlDMv+mpOjZWYreULr74wHhnUHG4fDnJeFIalr6ZH70TlbZKzTeC5BHKS+U2PRnfceEx6ZxWc2dnrurrQKJ1/78tRK+TNPKx4GgflSaCERJiWkO1VxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560970; c=relaxed/simple;
	bh=2HO2uxQMrUwOkvVnkU1kk3+Ww6OJwdAR1b0X+yVwyUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hEQGa2+q2FUtldQAZH5tr0fm9Gn1Ekv9Vi2+QHKFChR2F4oFy8ew4AgkbPOvInxP7ZJSSppB7qOgHUflpnYngEKsWGV6wP87H7QD0TNIsatkl+vzVaJJLxX+eeznIlH0adlDQAB/M3b2fOV+66wpzYUOKUSEwQzDt9qYHlo4r+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZkHFTIf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZkHFTIf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D33C19422;
	Fri, 16 Jan 2026 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768560969;
	bh=2HO2uxQMrUwOkvVnkU1kk3+Ww6OJwdAR1b0X+yVwyUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LZkHFTIfuZGioTG6Psrn25zWorZcZzIL41i5paERGLfPx6TztaPfyCd98O81qFY4Z
	 zvH5G3iaTiGi/GZVL2l4N8PaIf8ciQ9pg2eedmhHFbkGAapCkttQvrcLuLw9RtWRW0
	 soRAJSC7QK++rzqhgCM9mWIxX7lYU1zu5GrZysGb7mfufLr2a0gGFKlc03CmZ3ZrOc
	 B8PUg9VFploJy9XtrkYYcSlaod5HEFNjYMMvkvk7MqatnuszfiIbll2FY/Q+ivoVl7
	 MMuSSqieWY8G+wIG+ik2ufQM0CDm8uN0hxvVNeMWb7xAem9M/x2Ac05Q/xbeZ941WH
	 nt+Ux56d2M+yw==
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
Subject: [PATCH v4 04/15] rust: pin-init: internal: add utility API for syn error handling
Date: Fri, 16 Jan 2026 11:54:19 +0100
Message-ID: <20260116105514.3794384-5-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116105514.3794384-1-lossin@kernel.org>
References: <20260116105514.3794384-1-lossin@kernel.org>
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
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v4: none
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

