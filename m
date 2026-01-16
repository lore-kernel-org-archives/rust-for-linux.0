Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208D12D97AB;
	Fri, 16 Jan 2026 10:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768561011; cv=none; b=GAf5JIu2FUcRqttm7dzUGFrXaqcWSRjCxGotrLp7Z8kbWjFUkYFYbJ5zvqVZ0AYzJuYNU9tSAh9Zhi8mqkMtvpImOj5qxzTaXiH8Je4JIYUsoch8+d6Kp+fuSeHQ/QSkTsCw7VecZ5owkWulWAdzLzUZpn9GtuoqJxZtmNygktU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768561011; c=relaxed/simple;
	bh=TrkjD2Z1MxMUvkAPR7dzHDAOCxrY3mCAREqpeXaqNYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCy82b+vjHJBBRJq3tOgMEOB5yqfWW7GnqH8/TG80yg21Q+eu4mwweINfQXvsGNzSS2zjeGvLMwHYM8z9DX+fbZI4oJq5SFytNRNcTGypgUZJOITeUtGt3OsMztu/ETGvj1IOi8cKlgYrMlUrHXOm1sUyoNm8ezbrUmlQwi6ZIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmnLzU7K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmnLzU7K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5C6C116C6;
	Fri, 16 Jan 2026 10:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768561010;
	bh=TrkjD2Z1MxMUvkAPR7dzHDAOCxrY3mCAREqpeXaqNYY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CmnLzU7KYKofkfZpewIhOgXTVTulfisyDOPOxtRIlERCZ5Sw1XGsGoWSfQ4LtoeUN
	 OwHswfzgJe5AHWijH4k06IYKe9MVZYZd8zGUHvda/vKR1PUGTkLgneLKEd2J9M+Db+
	 S1UFZlY40EpegQP9FAQrHaz1FJwVex0t+gqdPRAKaPlVN1xg2TIdMyebVTgA7J7pyt
	 yImZsCkHIVUfI8gikuAQ3OAYgSYWs4jsytqIVd9JhQPPWTzuok6m899uslGEiPMsNH
	 2kEvK2B/pX2M6W5rDN/9as7lIKJzW/dtjksJJNRILOLzDiBuG/GOjEdynkWpXtRSyA
	 cyR3WwAK/37fw==
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
Subject: [PATCH v4 10/15] rust: pin-init: add `#[default_error(<type>)]` attribute to initializer macros
Date: Fri, 16 Jan 2026 11:54:25 +0100
Message-ID: <20260116105514.3794384-11-lossin@kernel.org>
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
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v4:
* box big value instead of later ignoring the clippy warning
Changes in v3: none
Changes in v2:
* improve error handling
* improve parsing and default error evaluation
---
 rust/pin-init/internal/src/init.rs | 44 ++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index b0eb66224341..21cddcd9e9f8 100644
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
+    ty: Box<Type>,
+}
+
 pub(crate) fn expand(
     Initializer {
+        attrs,
         this,
         path,
         brace_token,
@@ -69,14 +79,23 @@ pub(crate) fn expand(
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
                 parse_quote!(::core::convert::Infallible)
             }
         },
-        |(_, err)| err,
+        |(_, err)| Box::new(err),
     );
     let slot = format_ident!("slot");
     let (has_data_trait, data_trait, get_data, init_from_closure) = if pinned {
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

