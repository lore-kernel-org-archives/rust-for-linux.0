Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2884335098;
	Wed, 14 Jan 2026 18:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768414852; cv=none; b=piYR4VmaDtHvTHqh70iIP694GZ/ymZ9NKBi5Cy1OmztQ/af+TOxigaCljOU8/bz2wuavPPPsywtzXwip1mIg6FuBz8avhJVW6N1C3pBvE+RloUJGNDSfM/PQNlXwTb2GzUlnZHZBv++uha1aaqZMnFeH/qgNqo7zEHjD15SZrF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768414852; c=relaxed/simple;
	bh=gO/f+n6bxctI9TpFgKPzkstQvLvIbWAHwyepVBKbGrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VWmJGD3f/9W6Tz6zzh1/Oj2W4nuq2d8nQv6MBIkKAQ7ysd38nQJj3u6ctShxcZfWra+K7hX6HiCEaSnheTNGgmla5/vciFfkKKrueB/QmRl9vh34i4YZb9QlfH/QKQtpV4JPVm93PxqbRNkyhO0iutijLnti3M74wErZexbrqHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnt6SXs+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnt6SXs+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2749EC4CEF7;
	Wed, 14 Jan 2026 18:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768414852;
	bh=gO/f+n6bxctI9TpFgKPzkstQvLvIbWAHwyepVBKbGrw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cnt6SXs+ASo3isiv7C6/sC3459tn9OJBXrYXeqOCZQZL6XbYTY5m+v0ptn8eU4Elh
	 aAT67XAEPOcORvprkATtOcH4VS2UDk8MtuMjylpbk83127xBqIBGbQ5OA/5+K852zR
	 8dvDVWRFhIS++5MO1t9uDVMXQm+i+LfXc+MkxFRXV7R3EzxGFpXUIVH04n5yf/fGOV
	 H+edjRwMs1t7KFV4hnSb2R1Vpdv4HGTVw6diWQopEC5UyCivivoGRMcZ2rHFdL6SAQ
	 JHIneVj4zsazpRzfRM6ld7ohkzLebrsf+LXul4OmDsLl8l4laSzRJpx1/iwdFNJP+G
	 H4WG33D9j5JUA==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/15] rust: pin-init: add `#[default_error(<type>)]` attribute to initializer macros
Date: Wed, 14 Jan 2026 19:18:45 +0100
Message-ID: <20260114181934.1782470-11-lossin@kernel.org>
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

The `#[default_error(<type>)]` attribute can be used to supply a default
type as the error used for the `[pin_]init!` macros. This way one can
easily define custom `try_[pin_]init!` variants that default to your
project specific error type. Just write the following declarative macro:

    macro_rules! try_init {
        ($($args:tt)*) => {
            ::pin_init::init!(
                #[default_error(YourCustomErrorType)]
                $($args)*
            )
        }
    }

Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v3: none
Changes in v2:
* improve error handling
* improve parsing and default error evaluation
---
 rust/pin-init/internal/src/init.rs | 42 ++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index b0eb66224341..5a66016bdf33 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -8,12 +8,13 @@
     parse_quote,
     punctuated::Punctuated,
     spanned::Spanned,
-    token, Block, Expr, ExprCall, ExprPath, Ident, Path, Token, Type,
+    token, Attribute, Block, Expr, ExprCall, ExprPath, Ident, Path, Token, Type,
 };
 
 use crate::diagnostics::{DiagCtxt, ErrorGuaranteed};
 
 pub(crate) struct Initializer {
+    attrs: Vec<InitializerAttribute>,
     this: Option<This>,
     path: Path,
     brace_token: token::Brace,
@@ -54,8 +55,17 @@ fn ident(&self) -> Option<&Ident> {
     }
 }
 
+enum InitializerAttribute {
+    DefaultError(DefaultErrorAttribute),
+}
+
+struct DefaultErrorAttribute {
+    ty: Type,
+}
+
 pub(crate) fn expand(
     Initializer {
+        attrs,
         this,
         path,
         brace_token,
@@ -69,7 +79,16 @@ pub(crate) fn expand(
 ) -> Result<TokenStream, ErrorGuaranteed> {
     let error = error.map_or_else(
         || {
-            if let Some(default_error) = default_error {
+            if let Some(default_error) = attrs.iter().fold(None, |acc, attr| {
+                #[expect(irrefutable_let_patterns)]
+                if let InitializerAttribute::DefaultError(DefaultErrorAttribute { ty }) = attr {
+                    Some(ty.clone())
+                } else {
+                    acc
+                }
+            }) {
+                default_error
+            } else if let Some(default_error) = default_error {
                 syn::parse_str(default_error).unwrap()
             } else {
                 dcx.error(brace_token.span.close(), "expected `? <type>` after `}`");
@@ -358,6 +377,7 @@ fn make_field_check(
 
 impl Parse for Initializer {
     fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
+        let attrs = input.call(Attribute::parse_outer)?;
         let this = input.peek(Token![&]).then(|| input.parse()).transpose()?;
         let path = input.parse()?;
         let content;
@@ -389,7 +409,19 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
             .peek(Token![?])
             .then(|| Ok::<_, syn::Error>((input.parse()?, input.parse()?)))
             .transpose()?;
+        let attrs = attrs
+            .into_iter()
+            .map(|a| {
+                if a.path().is_ident("default_error") {
+                    a.parse_args::<DefaultErrorAttribute>()
+                        .map(InitializerAttribute::DefaultError)
+                } else {
+                    Err(syn::Error::new_spanned(a, "unknown initializer attribute"))
+                }
+            })
+            .collect::<Result<Vec<_>, _>>()?;
         Ok(Self {
+            attrs,
             this,
             path,
             brace_token,
@@ -400,6 +432,12 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
     }
 }
 
+impl Parse for DefaultErrorAttribute {
+    fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
+        Ok(Self { ty: input.parse()? })
+    }
+}
+
 impl Parse for This {
     fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
         Ok(Self {
-- 
2.52.0

