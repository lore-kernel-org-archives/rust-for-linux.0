Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDBD330B20;
	Sun, 11 Jan 2026 12:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768134455; cv=none; b=lz2Fb76GNldaqU5iO2Gfn73vLPs908c7Uq8X/yUr+3J1rFox52rjOSUfkjPh6WLUxSvhhFxjWnEBERZcSsO9XaKhhUEnUHCWFQojCucBwHQusjg7CPz9E4sXlNqX200/a8UZR5eKgbSGVUFaokAyE2toEfims47H5VUGGYbGM60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768134455; c=relaxed/simple;
	bh=hYHdTHcXdPDIjKpvF81LYQ5IH3yHhKfcQbOieI+uCjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9Nxg/9talEROsgvtNGHVevVialOrZbZv/IO1uKxXiw9456H/5KXU+COii6i/kQ0PcmiStB4So6kbIvk+hCVe7pr9A5ndLnhjs+shG4bs8PzjEDrRhvHIsWxvx6335eGlMIjplIFrLlUj4cZIgsHP2etCp5j0oIsdIJHnUwV4tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djKwemdC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djKwemdC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5769C19422;
	Sun, 11 Jan 2026 12:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768134454;
	bh=hYHdTHcXdPDIjKpvF81LYQ5IH3yHhKfcQbOieI+uCjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=djKwemdC5qFoWh+pJVpF+XLSkzlwKb0tnL2zFm+ejjAcWg4L5sy+wUvobX0Y5kabC
	 MrpnhXf9FwCmBMrP8h82+OUx2ApgKySaMEeNIMapwOTGrIrZ32Gc0PTWYlDDRxFref
	 47KPqLR+PuCSF8Q7jGp1C4vLYNmmkYKL0PG+D/gbMqiW0L93Kg5CSGeR0Huyi7Q5x+
	 rH0MIVwztP0+XPR9mdz4aYA9VNXzaSqadlwTLX+tT1eydki4K3eKTkvUGDuXcHNzrp
	 UAR53a/YnRbQoIiH1nT9s7oxlR2TOY+g6pTboJP9iqDBKyYjP69KFtp4+VSs3hYAl8
	 x/BtEnxzCrKhQ==
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
Subject: [PATCH v2 10/15] rust: pin-init: add `#[default_error(<type>)]` attribute to initializer macros
Date: Sun, 11 Jan 2026 13:25:08 +0100
Message-ID: <20260111122554.2662175-11-lossin@kernel.org>
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

Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v2:
* improve error handling
* improve parsing and default error evaluation
---
 rust/pin-init/internal/src/init.rs | 42 ++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index cd8351152cf1..1e6f7aa1c1aa 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -6,10 +6,11 @@
     parse_quote,
     punctuated::Punctuated,
     spanned::Spanned,
-    token, Block, Error, Expr, ExprCall, ExprPath, Ident, Path, Token, Type,
+    token, Attribute, Block, Error, Expr, ExprCall, ExprPath, Ident, Path, Token, Type,
 };
 
 pub(crate) struct Initializer {
+    attrs: Vec<InitializerAttribute>,
     this: Option<This>,
     path: Path,
     brace_token: token::Brace,
@@ -50,8 +51,17 @@ fn ident(&self) -> Option<&Ident> {
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
@@ -65,7 +75,16 @@ pub(crate) fn expand(
     let mut macro_error = crate::Error::none();
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
                 macro_error.combine(Error::new(
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

