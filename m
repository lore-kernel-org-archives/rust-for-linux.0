Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A6E466B6B;
	Thu,  8 Jan 2026 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880404; cv=none; b=flzS0+fTS0tfJML26fz0vg33SzaxsT2NAzYxNqcKDF1ZqyXs/V1xcbFjkCWVclXF8FwehEYqItcxUuNGAwEs9xdLck4S8mGadaMwuARaQYmYSefVsrB4NQK/p0m1MbX8sW/OthLIkaAtbyAoDcXwOBDZxT2HyL8NOjUKX5z1p3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880404; c=relaxed/simple;
	bh=Bv5KxUkIfgGHqKdxc6lTLVWWeBXrVJcoaQUm+djAo0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GWiqg0WgTIwsak7jHj83ZRqFCUrYIioM0+m8wwLVk5YTcroV2wMvdbIAxXAkGYSU4T2J7QyEM+/pErAYVS1bSfh6xmSNvZMoukjobtIOEiLbyvQk5hinoYSrjBeXK5JpJGzKT95dOVywd5UlUYVnaIB2GZlPVDpP6zqxYOEj3eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTMv4iwE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTMv4iwE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1BBBC116C6;
	Thu,  8 Jan 2026 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767880404;
	bh=Bv5KxUkIfgGHqKdxc6lTLVWWeBXrVJcoaQUm+djAo0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lTMv4iwE2Tk9UPaq776a7jl89kGGaJ5fD29/C0VLigZjKM2JSAGzxF/x9vqn+Nq2k
	 css+PfQDzPdEGfYlxtn7WKZwqJJKEVIhbqJJZaDM99VBGHb/aDGeBoUSEoRov7KUZC
	 7pOTSYGjVQ1V39/MeFNAVdfPsKUjhEf0ttqTzpjCXnMRFjQY3Ggj444/ZCDDh7p+xR
	 wtrfahvJ0jrkam2pWaGF6J3n1DCEck0215/1viKio2hMjepI6x4XrYfEKT1RfRksG0
	 Ujk3CZ7WgPSL3UKuEx4uCj0CvgpexAHrxPuBOxkrokWR4tvI2acWntT8n4ULWGNOxq
	 BuWDyXBikwnww==
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
Subject: [PATCH 09/12] rust: pin-init: add `#[default_error(<type>)]` attribute to initializer macros
Date: Thu,  8 Jan 2026 14:50:47 +0100
Message-ID: <20260108135127.3153925-10-lossin@kernel.org>
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
 rust/pin-init/internal/src/init.rs | 53 +++++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 4 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index c02a99692980..e14bacc88f41 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -6,10 +6,11 @@
     parse_quote,
     punctuated::Punctuated,
     spanned::Spanned,
-    token, Block, Expr, ExprCall, ExprPath, Ident, Path, Token, Type,
+    token, Attribute, Block, Expr, ExprCall, ExprPath, Ident, Path, Token, Type,
 };
 
 pub struct Initializer {
+    attrs: Vec<InitializerAttribute>,
     this: Option<This>,
     path: Path,
     brace_token: token::Brace,
@@ -50,23 +51,44 @@ fn ident(&self) -> Option<&Ident> {
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
         fields,
         rest,
-        mut error,
+        error,
     }: Initializer,
     default_error: Option<&'static str>,
     pinned: bool,
 ) -> TokenStream {
     let mut errors = TokenStream::new();
+    let mut error = error.map(|(_, err)| err);
+    if let Some(default_error) = attrs.iter().fold(None, |acc, attr| {
+        #[expect(irrefutable_let_patterns)]
+        if let InitializerAttribute::DefaultError(DefaultErrorAttribute { ty }) = attr {
+            Some(ty.clone())
+        } else {
+            acc
+        }
+    }) {
+        error.get_or_insert(default_error);
+    }
     if let Some(default_error) = default_error {
-        error.get_or_insert((Default::default(), syn::parse_str(default_error).unwrap()));
+        error.get_or_insert(syn::parse_str(default_error).unwrap());
     }
-    let error = error.map(|(_, err)| err).unwrap_or_else(|| {
+
+    let error = error.unwrap_or_else(|| {
         errors.extend(quote_spanned!(brace_token.span.close()=>
             ::core::compile_error!("expected `? <type>` after `}`");
         ));
@@ -350,6 +372,7 @@ fn make_field_check(
 
 impl Parse for Initializer {
     fn parse(input: syn::parse::ParseStream) -> syn::Result<Self> {
+        let attrs = input.call(Attribute::parse_outer)?;
         let this = input.peek(Token![&]).then(|| input.parse()).transpose()?;
         let path = input.parse()?;
         let content;
@@ -381,7 +404,19 @@ fn parse(input: syn::parse::ParseStream) -> syn::Result<Self> {
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
@@ -392,6 +427,16 @@ fn parse(input: syn::parse::ParseStream) -> syn::Result<Self> {
     }
 }
 
+impl Parse for DefaultErrorAttribute {
+    fn parse(input: syn::parse::ParseStream) -> syn::Result<Self> {
+        let ty = input.parse()?;
+        if !input.peek(End) {
+            return Err(input.error("expected end of input"));
+        }
+        Ok(Self { ty })
+    }
+}
+
 impl Parse for This {
     fn parse(input: syn::parse::ParseStream) -> syn::Result<Self> {
         Ok(Self {
-- 
2.51.2

