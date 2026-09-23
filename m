Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED8453D0B3;
	Wed, 23 Sep 2026 14:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172436; cv=none; b=LtHNUs3I2vjPSBAzT4Jw2Qh7goPwnlw1y14XkBHihQ3mKMb/iD0ofTbi2pRerVwpXmC5sqRIqh/C6AbzieSbNvVaI73GiXMCcvGqZy3N8AGozz2EHvmNoAWspW1ZHWnfoCAPVi+35uwJYqnDCPfBCNf6TzLTv7QPqc1VO4iBLss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172436; c=relaxed/simple;
	bh=DVmg1Qw+UJvOzq9bmew3Kfr7VsO1+wfWT4VU/mAKc84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCMcDpfFMgFOmUBlhMGB1loioxyV5UtoTAnFUBmhW0tJuH7t9PLgyXBvqshEtw1G2HqB/JU7wQHi31eJQPNjANVkPz1wGqE2t+Bmt0mqLDQK9q8ync8C5LlmY8XWPIBkeSs3NCiYL9y3EWpSXz6/TFeYnUHEx7Rz5VPdsAGbdX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/B+oYmm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/B+oYmm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CCB21F000FF;
	Wed, 23 Sep 2026 14:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790172432;
	bh=PvQPNZtEOwJUljthFnc90/Uq2bva5cJfHgJ0X/p1BpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=R/B+oYmmcbYDaz5llw4lgl5ohLejcCIAyjQvBitxYIozAs2rRaiUUd6N66hkwUycx
	 FM1ZV4/xtIp60tW4OBnNOYfdxKcXpiaIdGxyPlDs4Im0liwxdOcFLawzgiPd8+aFbd
	 VLTWNrs5tlT//6C7Xg0Kej3lKrk/x8k4nA3HvJiavezP/35mmV2pZxuIhs/WDKQNk+
	 JDYH1K8Hto+TaNP6dDyu97qwhCyhV9gYfdan4MsEdAXNRuzuB72w+qOkfsSJResibI
	 yO91VqpBeBTwH4TJDgRlH3f3Wdc8oo6ynG2S0f2mogjAiX9ntlcIk35xjg550NRUTq
	 wMmW/2gYPO48A==
From: Gary Guo <gary@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] rust: pin-init: internal: make `DiagCtxt` available inside parser
Date: Wed, 23 Sep 2026 15:06:14 +0100
Message-ID: <20260923140618.1978181-2-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260923140618.1978181-1-gary@kernel.org>
References: <20260923140618.1978181-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Currently, there is a split between `syn::Error` and pin-init's custom
`DiagCtxt`. Parsing has no access to `DiagCtxt` and therefore cannot report
diagnostics without failing the parse. Bridge the gap by making the
`DiagCtxt` available inside parsers using `thread_local!`.

`parse_macro_input!` returns error as token stream directly, so it is no
longer suitable when the parsing is moved inside `DiagCtxt` closure. Add a
`From<syn::Error> for ErrorGuaranteed` implementation so `?` can be used to
add a `syn::Error` into the current diagnostic context and obtain a
`ErrorGuaranteed`.

Clean up the handler of using `<-` inside tuple expression as a
demonstration of the usefulness of having `DiagCtxt` access inside `Parse`.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/diagnostics.rs | 84 ++++++++++++++++++-----
 rust/pin-init/internal/src/init.rs        | 41 ++++-------
 rust/pin-init/internal/src/lib.rs         | 32 +++++----
 3 files changed, 96 insertions(+), 61 deletions(-)

diff --git a/rust/pin-init/internal/src/diagnostics.rs b/rust/pin-init/internal/src/diagnostics.rs
index c42f1095ab10..efdcf45f40cf 100644
--- a/rust/pin-init/internal/src/diagnostics.rs
+++ b/rust/pin-init/internal/src/diagnostics.rs
@@ -1,32 +1,68 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
+use std::cell::RefCell;
 use std::fmt::Display;
+use std::marker::PhantomData;
 
 use proc_macro2::TokenStream;
 use quote::{quote, quote_spanned};
 use syn::{spanned::Spanned, Error};
 
-pub(crate) struct DiagCtxt(TokenStream);
+pub(crate) struct DiagCtxt(PhantomData<*mut ()>);
 pub(crate) struct ErrorGuaranteed(());
 
+struct DiagCtxtData {
+    diag: TokenStream,
+}
+
+thread_local! {
+    static DIAGNOSTICS: RefCell<Option<DiagCtxtData>> = const { RefCell::new(None) };
+}
+
+// Allows `syn::Error` to be emitted into the current diagnostic context with just `?`.
+impl From<syn::Error> for ErrorGuaranteed {
+    fn from(error: syn::Error) -> Self {
+        DIAGNOSTICS.with_borrow_mut(|data| {
+            data.as_mut()
+                .unwrap()
+                .diag
+                .extend(error.into_compile_error());
+        });
+        Self(())
+    }
+}
+
 impl DiagCtxt {
-    pub(crate) fn error(&mut self, span: impl Spanned, msg: impl Display) -> ErrorGuaranteed {
-        let error = Error::new(span.span(), msg);
-        self.0.extend(error.into_compile_error());
-        ErrorGuaranteed(())
+    pub(crate) fn error(&self, span: impl Spanned, msg: impl Display) -> ErrorGuaranteed {
+        Error::new(span.span(), msg).into()
     }
 
-    pub(crate) fn warn(&mut self, span: impl Spanned, msg: impl Display) {
+    pub(crate) fn warn(&self, span: impl Spanned, msg: impl Display) {
         // Have the message start on a new line for visual clarity.
         let msg = format!("\n{}", msg);
-        self.0.extend(quote_spanned!(span.span() =>
-            // Approximate using deprecated warning while `proc_macro_diagnostic` is unstable.
-            const _: () = {
-                #[deprecated = #msg]
-                const fn warn() {}
-                warn();
-            };
-        ));
+        DIAGNOSTICS.with_borrow_mut(|data| {
+            data.as_mut()
+                .unwrap()
+                .diag
+                .extend(quote_spanned!(span.span() =>
+                    // Approximate using deprecated warning while `proc_macro_diagnostic` is
+                    // unstable.
+                    const _: () = {
+                        #[deprecated = #msg]
+                        const fn warn() {}
+                        warn();
+                    };
+                ))
+        });
+    }
+
+    /// Execute the provided function with the current diagnostic context.
+    pub(crate) fn current<R>(f: impl FnOnce(&DiagCtxt) -> R) -> R {
+        DIAGNOSTICS.with_borrow(|data| {
+            assert!(data.is_some(), "No active `DiagCtxt`");
+        });
+
+        f(&DiagCtxt(PhantomData))
     }
 
     fn with(
@@ -34,16 +70,26 @@ fn with(
         merge_diag: impl FnOnce(TokenStream, TokenStream) -> TokenStream,
         convert_diag: impl FnOnce(TokenStream) -> TokenStream,
     ) -> TokenStream {
-        let mut dcx = Self(TokenStream::new());
-        match f(&mut dcx) {
+        DIAGNOSTICS.with_borrow_mut(|data| {
+            assert!(data.is_none(), "`DiagCtxt` cannot be nested");
+            *data = Some(DiagCtxtData {
+                diag: TokenStream::new(),
+            });
+        });
+
+        let result = f(&mut DiagCtxt(PhantomData));
+
+        let data = DIAGNOSTICS.with_borrow_mut(|data| data.take().unwrap());
+
+        match result {
             Ok(stream) => {
-                if dcx.0.is_empty() {
+                if data.diag.is_empty() {
                     stream
                 } else {
-                    merge_diag(stream, dcx.0)
+                    merge_diag(stream, data.diag)
                 }
             }
-            Err(ErrorGuaranteed(())) => convert_diag(dcx.0),
+            Err(ErrorGuaranteed(())) => convert_diag(data.diag),
         }
     }
 
diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 1d2db93dd33d..b60feb68b65f 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -44,9 +44,6 @@ pub(crate) enum InitExprKind {
 
 struct InitTupleField {
     attrs: Vec<Attribute>,
-    /// `<-` is not valid in constructor syntax; it is parsed anyway so that it can be rejected
-    /// with a proper diagnostic instead of a parse error.
-    left_arrow_token: Option<Token![<-]>,
     value: Expr,
 }
 
@@ -84,20 +81,6 @@ fn normalize(self) -> InitExprStruct {
             rest: None,
         }
     }
-
-    fn validate(&self, dcx: &mut DiagCtxt) -> Result<(), ErrorGuaranteed> {
-        let mut result = Ok(());
-        for field in &self.fields {
-            if let Some(left_arrow_token) = &field.left_arrow_token {
-                result = Err(dcx.error(
-                    left_arrow_token,
-                    "`<-` is not supported in tuple constructor syntax; name the fields by index \
-                     instead, e.g. `Type { 0 <- initializer, 1: value }`",
-                ));
-            }
-        }
-        result
-    }
 }
 
 struct This {
@@ -153,8 +136,6 @@ pub(crate) fn expand_with_cfg(
 ) -> Result<TokenStream, ErrorGuaranteed> {
     let initializer = match initializer.kind {
         InitExprKind::Tuple(expr) => {
-            expr.validate(dcx)?;
-
             let mut initializer = Initializer {
                 attrs: initializer.attrs,
                 this: initializer.this,
@@ -578,9 +559,20 @@ fn parse_with_path(path: Path, input: syn::parse::ParseStream<'_>) -> syn::Resul
         let paren_token = parenthesized!(content in input);
         let mut fields = Punctuated::new();
         while !content.is_empty() {
+            let attrs = content.call(Attribute::parse_outer)?;
+
+            if let Some(left_arrow_token) = content.parse::<Option<Token![<-]>>()? {
+                DiagCtxt::current(|dcx| {
+                    dcx.error(
+                    left_arrow_token,
+                    "`<-` is not supported in tuple constructor syntax; name the fields by index \
+                     instead, e.g. `Type { 0 <- initializer, 1: value }`",
+                )
+                });
+            }
+
             fields.push_value(InitTupleField {
-                attrs: content.call(Attribute::parse_outer)?,
-                left_arrow_token: content.parse()?,
+                attrs,
                 value: content.parse()?,
             });
             if content.is_empty() {
@@ -757,13 +749,8 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
 
 impl ToTokens for InitTupleField {
     fn to_tokens(&self, tokens: &mut TokenStream) {
-        let Self {
-            attrs,
-            left_arrow_token,
-            value,
-        } = self;
+        let Self { attrs, value } = self;
         tokens.append_all(attrs);
-        left_arrow_token.to_tokens(tokens);
         value.to_tokens(tokens);
     }
 }
diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src/lib.rs
index 0410024ba1e6..07b3d33d2282 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -10,7 +10,6 @@
 #![allow(missing_docs)]
 
 use proc_macro::TokenStream;
-use syn::parse_macro_input;
 
 use crate::diagnostics::DiagCtxt;
 
@@ -23,43 +22,46 @@
 
 #[proc_macro_attribute]
 pub fn pin_data(args: TokenStream, input: TokenStream) -> TokenStream {
-    let args = parse_macro_input!(args);
-    let input = parse_macro_input!(input);
-    DiagCtxt::for_item(|dcx| pin_data::pin_data(args, input, dcx)).into()
+    DiagCtxt::for_item(|dcx| pin_data::pin_data(syn::parse(args)?, syn::parse(input)?, dcx)).into()
 }
 
 #[proc_macro_attribute]
 pub fn pinned_drop(args: TokenStream, input: TokenStream) -> TokenStream {
-    let args = parse_macro_input!(args);
-    let input = parse_macro_input!(input);
-    DiagCtxt::for_item(|dcx| pinned_drop::pinned_drop(args, input, dcx)).into()
+    DiagCtxt::for_item(|dcx| pinned_drop::pinned_drop(syn::parse(args)?, syn::parse(input)?, dcx))
+        .into()
 }
 
 #[proc_macro_derive(Zeroable)]
 pub fn derive_zeroable(input: TokenStream) -> TokenStream {
-    let input = parse_macro_input!(input);
-    DiagCtxt::for_item(|dcx| zeroable::derive(input, dcx)).into()
+    DiagCtxt::for_item(|dcx| zeroable::derive(syn::parse(input)?, dcx)).into()
 }
 
 #[proc_macro_derive(MaybeZeroable)]
 pub fn maybe_derive_zeroable(input: TokenStream) -> TokenStream {
-    let input = parse_macro_input!(input);
-    DiagCtxt::for_item(|dcx| zeroable::maybe_derive(input, dcx)).into()
+    DiagCtxt::for_item(|dcx| zeroable::maybe_derive(syn::parse(input)?, dcx)).into()
 }
 #[proc_macro]
 pub fn init(input: TokenStream) -> TokenStream {
-    let input = parse_macro_input!(input);
     DiagCtxt::for_expr(|dcx| {
-        init::expand_with_cfg(input, Some("::core::convert::Infallible"), false, dcx)
+        init::expand_with_cfg(
+            syn::parse(input)?,
+            Some("::core::convert::Infallible"),
+            false,
+            dcx,
+        )
     })
     .into()
 }
 
 #[proc_macro]
 pub fn pin_init(input: TokenStream) -> TokenStream {
-    let input = parse_macro_input!(input);
     DiagCtxt::for_expr(|dcx| {
-        init::expand_with_cfg(input, Some("::core::convert::Infallible"), true, dcx)
+        init::expand_with_cfg(
+            syn::parse(input)?,
+            Some("::core::convert::Infallible"),
+            true,
+            dcx,
+        )
     })
     .into()
 }
-- 
2.54.0

