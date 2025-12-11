Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39C83195FC;
	Thu, 11 Dec 2025 19:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765481369; cv=none; b=LUoPg/bCQ8Z5ffkOoNN0xMfm3vPk4eTRpCrFsyPDe+DCgInUauB+9vMP+3V2vHYvwCfUkEcvY4DYOb24mVxAslNjDQHrxtYeh9yLNxLZU2FQTMDtA/C3VX+kWwP2bJJGRhknwLfDggOa24HBn9N1Ctl94j55Yga3isF0oaJlmIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765481369; c=relaxed/simple;
	bh=6Fr4zL443OClgjD+TsvwmJlLQoqtNEW4GQcPKyNPQME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i4Nj8swh/8aUQGvomlB5K4V0yWMVkiBoNOzXHKIWveJ4hQIYuWEZsr8PQKpNZbgXZ9H+AJ8DbrImkybHNzgCx4pQYxBLcLNYqLPtzgU5ji71BRxTu9sRQ+p0Lra5+g4zGW8AuVoJ8UX1cwlSGIohNVIWWpjFDz4c3gcBb+kM4VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=InGFy/oK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="InGFy/oK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5070C4CEFB;
	Thu, 11 Dec 2025 19:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765481369;
	bh=6Fr4zL443OClgjD+TsvwmJlLQoqtNEW4GQcPKyNPQME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=InGFy/oK1+ZrKnfJRd77lJGD0j0sJN6f03L32KDcIR/ID1Y+4ooyfChDYXqeIQ7Be
	 1ro3sT7+e/BDmEpk511Q0cIMfAkGqhWe+sHvdJHuEwc/r0NFkKROBgFaRYpuNt1q5A
	 LSgyc+rgQ4i32bexWeBZGC+JFINLQYYQ7uNrLP8tZgHa7QmFLlr2DGrem4/ceQGqoC
	 xMu15RJdHV7t8Ups/c6rNDn3b647o7sVENny+C/yn9eZVGXLI485MQ54u5vDpunJMd
	 hcnQ8F6mUihWA7tVqeCxxj/ELyqItX4psTXaQRzIe+UhPHAdqwMDS+Fn5viLIOefhE
	 yNoCAJDVER5Gg==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] rust: macros: convert `#[vtable]` macro to use `syn`
Date: Thu, 11 Dec 2025 18:56:43 +0000
Message-ID: <20251211185805.2835633-4-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251211185805.2835633-1-gary@kernel.org>
References: <20251211185805.2835633-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

`#[vtable]` is converted to use syn. This is more robust than the
previous heuristic-based searching of defined methods and functions.

When doing so, the trait and impl are split into two code paths as the
types are distinct when parsed by `syn`.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/macros/lib.rs    |   9 ++-
 rust/macros/vtable.rs | 155 +++++++++++++++++++++---------------------
 2 files changed, 85 insertions(+), 79 deletions(-)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 8e0f49ac783b2..33935b38d11c0 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -22,6 +22,8 @@
 
 use proc_macro::TokenStream;
 
+use syn::parse_macro_input;
+
 /// Declares a kernel module.
 ///
 /// The `type` argument should be a type which implements the [`Module`]
@@ -173,8 +175,11 @@ pub fn module(ts: TokenStream) -> TokenStream {
 ///
 /// [`kernel::error::VTABLE_DEFAULT_ERROR`]: ../kernel/error/constant.VTABLE_DEFAULT_ERROR.html
 #[proc_macro_attribute]
-pub fn vtable(attr: TokenStream, ts: TokenStream) -> TokenStream {
-    vtable::vtable(attr.into(), ts.into()).into()
+pub fn vtable(attr: TokenStream, input: TokenStream) -> TokenStream {
+    parse_macro_input!(attr as syn::parse::Nothing);
+    vtable::vtable(parse_macro_input!(input))
+        .unwrap_or_else(|e| e.into_compile_error())
+        .into()
 }
 
 /// Export a function so that C code can call it via a header file.
diff --git a/rust/macros/vtable.rs b/rust/macros/vtable.rs
index f209216785745..51a7990fd51f3 100644
--- a/rust/macros/vtable.rs
+++ b/rust/macros/vtable.rs
@@ -1,97 +1,98 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use std::collections::HashSet;
-use std::fmt::Write;
 
-use proc_macro2::{Delimiter, Group, TokenStream, TokenTree};
+use proc_macro2::{Ident, TokenStream};
+use quote::ToTokens;
+use syn::{parse_quote, Error, ImplItem, Item, ItemImpl, ItemTrait, Result, TraitItem};
 
-pub(crate) fn vtable(_attr: TokenStream, ts: TokenStream) -> TokenStream {
-    let mut tokens: Vec<_> = ts.into_iter().collect();
-
-    // Scan for the `trait` or `impl` keyword.
-    let is_trait = tokens
-        .iter()
-        .find_map(|token| match token {
-            TokenTree::Ident(ident) => match ident.to_string().as_str() {
-                "trait" => Some(true),
-                "impl" => Some(false),
-                _ => None,
-            },
-            _ => None,
-        })
-        .expect("#[vtable] attribute should only be applied to trait or impl block");
-
-    // Retrieve the main body. The main body should be the last token tree.
-    let body = match tokens.pop() {
-        Some(TokenTree::Group(group)) if group.delimiter() == Delimiter::Brace => group,
-        _ => panic!("cannot locate main body of trait or impl block"),
-    };
-
-    let mut body_it = body.stream().into_iter();
+fn handle_trait(mut item: ItemTrait) -> Result<ItemTrait> {
     let mut functions = Vec::new();
     let mut consts = HashSet::new();
-    while let Some(token) = body_it.next() {
-        match token {
-            TokenTree::Ident(ident) if ident.to_string() == "fn" => {
-                let fn_name = match body_it.next() {
-                    Some(TokenTree::Ident(ident)) => ident.to_string(),
-                    // Possibly we've encountered a fn pointer type instead.
-                    _ => continue,
-                };
-                functions.push(fn_name);
+    for item in &item.items {
+        match item {
+            TraitItem::Fn(fn_item) => {
+                functions.push(fn_item.sig.ident.clone());
             }
-            TokenTree::Ident(ident) if ident.to_string() == "const" => {
-                let const_name = match body_it.next() {
-                    Some(TokenTree::Ident(ident)) => ident.to_string(),
-                    // Possibly we've encountered an inline const block instead.
-                    _ => continue,
-                };
-                consts.insert(const_name);
+            TraitItem::Const(const_item) => {
+                consts.insert(const_item.ident.clone());
             }
-            _ => (),
+            _ => {}
         }
     }
 
-    let mut const_items;
-    if is_trait {
-        const_items = "
-                /// A marker to prevent implementors from forgetting to use [`#[vtable]`](vtable)
-                /// attribute when implementing this trait.
-                const USE_VTABLE_ATTR: ();
-        "
-        .to_owned();
+    item.items.push(parse_quote! {
+         /// A marker to prevent implementors from forgetting to use [`#[vtable]`](vtable)
+         /// attribute when implementing this trait.
+         const USE_VTABLE_ATTR: ();
+    });
 
-        for f in functions {
-            let gen_const_name = format!("HAS_{}", f.to_uppercase());
-            // Skip if it's declared already -- this allows user override.
-            if consts.contains(&gen_const_name) {
-                continue;
-            }
-            // We don't know on the implementation-site whether a method is required or provided
-            // so we have to generate a const for all methods.
-            write!(
-                const_items,
-                "/// Indicates if the `{f}` method is overridden by the implementor.
-                const {gen_const_name}: bool = false;",
-            )
-            .unwrap();
-            consts.insert(gen_const_name);
+    for name in functions {
+        let gen_const_name = Ident::new(
+            &format!("HAS_{}", name.to_string().to_uppercase()),
+            name.span(),
+        );
+        // Skip if it's declared already -- this allows user override.
+        if consts.contains(&gen_const_name) {
+            continue;
         }
-    } else {
-        const_items = "const USE_VTABLE_ATTR: () = ();".to_owned();
+        // We don't know on the implementation-site whether a method is required or provided
+        // so we have to generate a const for all methods.
+        let comment = format!("Indicates if the `{name}` method is overridden by the implementor.");
+        item.items.push(parse_quote! {
+            #[doc = #comment]
+            const #gen_const_name: bool = false;
+        });
+        consts.insert(gen_const_name);
+    }
 
-        for f in functions {
-            let gen_const_name = format!("HAS_{}", f.to_uppercase());
-            if consts.contains(&gen_const_name) {
-                continue;
+    Ok(item)
+}
+
+fn handle_impl(mut item: ItemImpl) -> Result<ItemImpl> {
+    let mut functions = Vec::new();
+    let mut consts = HashSet::new();
+    for item in &item.items {
+        match item {
+            ImplItem::Fn(fn_item) => {
+                functions.push(fn_item.sig.ident.clone());
             }
-            write!(const_items, "const {gen_const_name}: bool = true;").unwrap();
+            ImplItem::Const(const_item) => {
+                consts.insert(const_item.ident.clone());
+            }
+            _ => {}
+        }
+    }
+
+    item.items.push(parse_quote! {
+         const USE_VTABLE_ATTR: () = ();
+    });
+
+    for name in functions {
+        let gen_const_name = Ident::new(
+            &format!("HAS_{}", name.to_string().to_uppercase()),
+            name.span(),
+        );
+        // Skip if it's declared already -- this allows user override.
+        if consts.contains(&gen_const_name) {
+            continue;
         }
+        item.items.push(parse_quote! {
+            const #gen_const_name: bool = true;
+        });
+        consts.insert(gen_const_name);
     }
 
-    let new_body = vec![const_items.parse().unwrap(), body.stream()]
-        .into_iter()
-        .collect();
-    tokens.push(TokenTree::Group(Group::new(Delimiter::Brace, new_body)));
-    tokens.into_iter().collect()
+    Ok(item)
+}
+
+pub(crate) fn vtable(input: Item) -> Result<TokenStream> {
+    match input {
+        Item::Trait(item) => Ok(handle_trait(item)?.into_token_stream()),
+        Item::Impl(item) => Ok(handle_impl(item)?.into_token_stream()),
+        _ => Err(Error::new_spanned(
+            input,
+            "`#[vtable]` attribute should only be applied to trait or impl block",
+        ))?,
+    }
 }
-- 
2.51.2

