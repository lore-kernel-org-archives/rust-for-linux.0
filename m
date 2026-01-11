Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627BE338591;
	Sun, 11 Jan 2026 12:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768134413; cv=none; b=kP0mqWAmQO9NAUccD3i/zK66sk008L4UdF6yJ1gAn4OaQL+Rv/N59qkcp+soPPklpneDCBgbawC2431ziesgh/OWeZuiU3er1t9L7Ccm5fJJr4+N2UNVgx/WR9zDJO9NxN2UofNn/EJRBVOA1UVQsFpRIN0dqlzKCPev8Pkoo7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768134413; c=relaxed/simple;
	bh=RSLDitMRb2ZBPBFFJh1CScF99sfWiJlmT//HtDe+4GY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G1U5/F+523e2B4pP3Ix7bo/lmPdsAygyp9qogQQ5zQzfi6K30h/8aiIkHgQmTuvtzRqCFHNk/oaGkTwoGg8gv3Gl9VLACiLRzmwYdTNcefs37NIiyMYrq9ZJH8O3Ab1ROE04u3l1H0M5wBi0qSthFbgpIArAmUvA0jvAQS6c38o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWK41EtR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWK41EtR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93300C19422;
	Sun, 11 Jan 2026 12:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768134413;
	bh=RSLDitMRb2ZBPBFFJh1CScF99sfWiJlmT//HtDe+4GY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BWK41EtRzIOTz+fUAN2gwMH5ckmbeQvbswJa6+yAF1BKLXRSngLjZkzCfw7bMLQRd
	 ifbKtsTld1JawzKyXUvVGDEIeOGLT1DBSaHQyNzc88I0K/pRXT394/LIPUfKxOJSyB
	 1HSrfCPFQSnQKrllrLiyFghC3z/TMpZ/WBcwROaeNRPh7UChjXdILRVjecPmFcvu0f
	 wwByvvhJRWnYuIUKSfbhhGy8wIk3oeehiXjOKDwfk5xbhENLxZI6LIwecHBPs+xyEk
	 kF6uJ7v9Gcwdpr3tx04b+mGh6/26KkaeuLbx37nd+MfAno1aIiRfztlbVbpBXCdD44
	 2QRC8d97JIDQQ==
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
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/15] rust: pin-init: internal: add utility API for syn error handling
Date: Sun, 11 Jan 2026 13:25:02 +0100
Message-ID: <20260111122554.2662175-5-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111122554.2662175-1-lossin@kernel.org>
References: <20260111122554.2662175-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a function to turn a `syn::Result<TokenStream>` into a
`TokenStream`, either containing the error or the normal stream.

Add a nullable custom error type wrapping `syn::Error`.

Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v2: added this patch
---
 rust/pin-init/internal/src/lib.rs | 44 +++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src/lib.rs
index 4c4dc639ce82..21f5e33486ce 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -36,3 +36,47 @@ pub fn derive_zeroable(input: TokenStream) -> TokenStream {
 pub fn maybe_derive_zeroable(input: TokenStream) -> TokenStream {
     zeroable::maybe_derive(input.into()).into()
 }
+
+#[expect(dead_code)]
+fn ok_or_compile_error(res: syn::Result<proc_macro2::TokenStream>) -> TokenStream {
+    match res {
+        Ok(stream) => stream,
+        Err(error) => error.into_compile_error(),
+    }
+    .into()
+}
+
+pub(crate) struct Error(Option<syn::Error>);
+
+impl From<syn::Error> for Error {
+    fn from(value: syn::Error) -> Self {
+        Self(Some(value))
+    }
+}
+
+impl Error {
+    #[expect(dead_code)]
+    pub(crate) fn none() -> Self {
+        Self(None)
+    }
+
+    #[expect(dead_code)]
+    pub(crate) fn combine(&mut self, error: impl Into<Self>) {
+        let error = error.into();
+        if let Some(this) = self.0.as_mut() {
+            if let Some(error) = error.0 {
+                this.combine(error);
+            }
+        } else {
+            self.0 = error.0;
+        }
+    }
+}
+
+impl quote::ToTokens for Error {
+    fn to_tokens(&self, tokens: &mut proc_macro2::TokenStream) {
+        if let Some(error) = self.0.as_ref() {
+            quote::ToTokens::to_tokens(&error.to_compile_error(), tokens);
+        }
+    }
+}
-- 
2.52.0

