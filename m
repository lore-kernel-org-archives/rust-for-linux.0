Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D35415F07;
	Thu, 30 Jul 2026 11:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411342; cv=none; b=obDUozHZYR7vic7eBycBR8Cb8b43renhsjD0LtYKJjpYc2NSRzem8x+uOUBEQ7B1eesptACmFIKazAlw7KfQFD7y+lmz7zgyfVge5KQKOohGEUM3Fk0x5juM7Jo+eSEbBrog66oeSNqBeSnQ0jEKeeDVnadCfKxn6YlLHuSmTSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411342; c=relaxed/simple;
	bh=WSqOUgvU8gpRbWyhf/wWmbBXkNbZhWcF9MNgmowCqnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oM3qFTmmNlEBPo9i4zxl3JnxMBd+DRjC5H2xybf5q6F9Y36RybG1tuVrxJgUNSBQgPiv9eDTw3kE3jLbpgZUA3PptClhfmMn5NlBDZ4IglwIDtI+Mu+6U49T/BUdboGbzk5yBcM2lbQkfd18h6/yMncmTAxjNGKWeyMcTmD+/o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLbqA6SC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLbqA6SC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777F01F000E9;
	Thu, 30 Jul 2026 11:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785411341;
	bh=lgjDly24ydOvbSo0iRB/K94L/CE7fFQH8KrMYgCRPpM=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=dLbqA6SCRJIShEVC85T1jNfU8dL07bDb5sEY+DCRswJlKSbA+H1SOsvYPpW/zs5eB
	 hK9r7vWJUi1nGb+2gIygJwsjUpi3/LDkA57Bq4+DmcJAQ7wWTsX5Vh1PbUquQeKPjf
	 CpV1xFHVlbNOQE80iZ/dxfVtzMrnHof3kI4YfO6VcsDwyqoM1xqPMjo/+83cKjkPnQ
	 X4HORrGrbZ7pka3jVQBXmgC1NLR2ZQkzyCZ48WgOz5WYwy+DxS3AMYly57cKiLq1Cv
	 JPd+YwBO2PoY0XYFhQ3+a3Cut71J58NhAX6iZCf+9NxGHTKs69AsG2NW/Y0K9k3IZ/
	 PZh1pAqKcUKPQ==
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
Subject: [PATCH] rust: pin-init: rework how `[pin_]init!` handles cfg
Date: Thu, 30 Jul 2026 12:35:21 +0100
Message-ID: <20260730113522.3907644-1-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Non-derive proc macros are invoked without cfg being resolved. This adds
complexity to the macros because they need to be to attach necessary cfgs.
This becomes especially tricky for tuple structs as indices can change
depending on presence of fields. Thus, it is convenient if cfgs are all
resolved before expansion.

The most optimal way to handle this is via `TokenStream::expand_expr`, but
that is still unstable. Implement an approach where we generate two
cfg-gated macro invocations with cfg resolved within the invocation.

This is the same approach as commit 02c9b3a32c59 ("rust: pin-init: rework
how `[pin_]init!` handles cfg").

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs | 160 +++++++++++++++++++++++++++--
 rust/pin-init/internal/src/lib.rs  |  11 +-
 2 files changed, 158 insertions(+), 13 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index fd0b5ea4a0a3..adee321ec1e6 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
 use proc_macro2::{Span, TokenStream};
-use quote::{format_ident, quote};
+use quote::{format_ident, quote, ToTokens};
 use syn::{
     braced,
     parse::{End, Parse},
@@ -13,6 +13,7 @@
 
 use crate::diagnostics::{DiagCtxt, ErrorGuaranteed};
 
+#[derive(Clone)]
 pub(crate) struct Initializer {
     attrs: Vec<InitializerAttribute>,
     this: Option<This>,
@@ -23,17 +24,20 @@ pub(crate) struct Initializer {
     error: Option<(Token![?], Type)>,
 }
 
+#[derive(Clone)]
 struct This {
     _and_token: Token![&],
     ident: Ident,
     _in_token: Token![in],
 }
 
+#[derive(Clone)]
 struct InitializerField {
     attrs: Vec<Attribute>,
     kind: InitializerKind,
 }
 
+#[derive(Clone)]
 enum InitializerKind {
     Value {
         ident: Ident,
@@ -60,14 +64,73 @@ fn ident(&self) -> Option<&Ident> {
     }
 }
 
+#[derive(Clone)]
 enum InitializerAttribute {
     DefaultError(DefaultErrorAttribute),
 }
 
+#[derive(Clone)]
 struct DefaultErrorAttribute {
     ty: Box<Type>,
 }
 
+pub(crate) fn expand_with_cfg(
+    mut initializer: Initializer,
+    default_error: Option<&'static str>,
+    pinned: bool,
+    dcx: &mut DiagCtxt,
+) -> Result<TokenStream, ErrorGuaranteed> {
+    // Handling cfg can get complicated especially when tuple structs are involved.
+    // Therefore, resolve all field cfgs first before continuing.
+    for (field_idx, field) in initializer.fields.iter_mut().enumerate() {
+        let cfg: Vec<_> = field
+            .attrs
+            .iter()
+            .filter(|a| a.path().is_ident("cfg"))
+            .map(|a| {
+                a.parse_args::<TokenStream>()
+                    .expect("parse as token stream cannot fail")
+            })
+            .collect();
+
+        if cfg.is_empty() {
+            continue;
+        }
+
+        field.attrs.retain(|a| !a.path().is_ident("cfg"));
+        let true_initializer = &initializer;
+
+        let mut false_initializer = initializer.clone();
+        false_initializer.fields = false_initializer
+            .fields
+            .into_pairs()
+            .enumerate()
+            .filter(|&(i, _)| i != field_idx)
+            .map(|(_, p)| p)
+            .collect();
+
+        let macro_name = if pinned {
+            quote!(::pin_init::pin_init)
+        } else {
+            quote!(::pin_init::init)
+        };
+
+        return Ok(quote! {
+            {
+                // Use `{}` delimiter here so semicolon is not required (which becomes unit type).
+                #[cfg(all(#(#cfg,)*))]
+                #macro_name! { #true_initializer }
+
+                #[cfg(not(all(#(#cfg,)*)))]
+                #macro_name! { #false_initializer }
+            }
+        });
+    }
+
+    // No cfgs are left.
+    expand(initializer, default_error, pinned, dcx)
+}
+
 pub(crate) fn expand(
     Initializer {
         attrs,
@@ -220,14 +283,12 @@ fn init_fields(
     slot: &Ident,
 ) -> TokenStream {
     let mut guards = vec![];
-    let mut guard_attrs = vec![];
     let mut res = TokenStream::new();
     for InitializerField { attrs, kind } in fields {
-        let cfgs = {
-            let mut cfgs = attrs.clone();
-            cfgs.retain(|attr| attr.path().is_ident("cfg"));
-            cfgs
-        };
+        assert!(
+            !attrs.iter().any(|a| a.path().is_ident("cfg")),
+            "cfgs should be all resolved at this point"
+        );
 
         let ident = match kind {
             InitializerKind::Value { ident, .. } => ident,
@@ -297,7 +358,6 @@ fn init_fields(
         res.extend(quote! {
             #init
 
-            #(#cfgs)*
             // Allow `non_snake_case` since the same warning is going to be reported for the struct
             // field.
             #[allow(unused_variables, non_snake_case)]
@@ -305,14 +365,12 @@ fn init_fields(
         });
 
         guards.push(guard);
-        guard_attrs.push(cfgs);
     }
     quote! {
         #res
         // If execution reaches this point, all fields have been initialized. Therefore we can now
         // dismiss the guards by forgetting them.
         #(
-            #(#guard_attrs)*
             ::core::mem::forget(#guards);
         )*
     }
@@ -480,3 +538,85 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
         }
     }
 }
+
+impl ToTokens for Initializer {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        for attr in &self.attrs {
+            attr.to_tokens(tokens);
+        }
+        if let Some(this) = &self.this {
+            this.to_tokens(tokens);
+        }
+        self.path.to_tokens(tokens);
+        self.brace_token.surround(tokens, |tokens| {
+            self.fields.to_tokens(tokens);
+            if let Some((dotdot, expr)) = &self.rest {
+                dotdot.to_tokens(tokens);
+                expr.to_tokens(tokens);
+            }
+        });
+        if let Some((question, ty)) = &self.error {
+            question.to_tokens(tokens);
+            ty.to_tokens(tokens);
+        }
+    }
+}
+
+impl ToTokens for InitializerAttribute {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        match self {
+            Self::DefaultError(DefaultErrorAttribute { ty }) => {
+                quote!(#[default_error(#ty)]).to_tokens(tokens);
+            }
+        }
+    }
+}
+
+impl ToTokens for This {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        self._and_token.to_tokens(tokens);
+        self.ident.to_tokens(tokens);
+        self._in_token.to_tokens(tokens);
+    }
+}
+
+impl ToTokens for InitializerField {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        for attr in &self.attrs {
+            attr.to_tokens(tokens);
+        }
+        self.kind.to_tokens(tokens);
+    }
+}
+
+impl ToTokens for InitializerKind {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        match self {
+            Self::Value { ident, value } => {
+                ident.to_tokens(tokens);
+                if let Some((colon, expr)) = value {
+                    colon.to_tokens(tokens);
+                    expr.to_tokens(tokens);
+                }
+            }
+            Self::Init {
+                ident,
+                _left_arrow_token,
+                value,
+            } => {
+                ident.to_tokens(tokens);
+                _left_arrow_token.to_tokens(tokens);
+                value.to_tokens(tokens);
+            }
+            Self::Code {
+                _underscore_token,
+                _colon_token,
+                block,
+            } => {
+                _underscore_token.to_tokens(tokens);
+                _colon_token.to_tokens(tokens);
+                block.to_tokens(tokens);
+            }
+        }
+    }
+}
diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src/lib.rs
index 60d5093f3128..53e754a93afc 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -48,12 +48,17 @@ pub fn maybe_derive_zeroable(input: TokenStream) -> TokenStream {
 #[proc_macro]
 pub fn init(input: TokenStream) -> TokenStream {
     let input = parse_macro_input!(input);
-    DiagCtxt::with(|dcx| init::expand(input, Some("::core::convert::Infallible"), false, dcx))
-        .into()
+    DiagCtxt::with(|dcx| {
+        init::expand_with_cfg(input, Some("::core::convert::Infallible"), false, dcx)
+    })
+    .into()
 }
 
 #[proc_macro]
 pub fn pin_init(input: TokenStream) -> TokenStream {
     let input = parse_macro_input!(input);
-    DiagCtxt::with(|dcx| init::expand(input, Some("::core::convert::Infallible"), true, dcx)).into()
+    DiagCtxt::with(|dcx| {
+        init::expand_with_cfg(input, Some("::core::convert::Infallible"), true, dcx)
+    })
+    .into()
 }

base-commit: 6d0795b507fb1db2e6aefe533d949db3a4abf4c6
-- 
2.54.0

