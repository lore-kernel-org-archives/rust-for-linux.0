Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D31352F97;
	Mon, 12 Jan 2026 17:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768237874; cv=none; b=iL/qTVYky5azZfDeMP6hb8MPJfOn5idu9P59V6+Cif2Ki+mcioBPEa9BeKHmkCBttjj7RfjczZ3L+gESQWmnQQ8SRBBTopBgh2pugPz25hDTZQGCbRrpK47cC10YiJqxJkGXKey2LDm+K2JqDEe+J7RhhtDZcIVOOxD3FA+1Dj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768237874; c=relaxed/simple;
	bh=P/Pv4yF229DHekzlsNrpfZoIEIo6I1ml0CKVA3f3cKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=imcaGW8ON1Eo00lzxPXpZ/zzQ/KQjY0y7SVduX1S2BqTEbNFGWwTW2V32nSPlEmGEynapCu4d70YwN28+NWkCRp5Wkv3Onqdf4mLgAVJmaXhXmxs/1ECGYaplTsMp14FCbYq72RlYc6S8m7/4foMMIUYLxW+3MSH/SweO4FMTNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uvYRoINe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uvYRoINe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB46C16AAE;
	Mon, 12 Jan 2026 17:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768237873;
	bh=P/Pv4yF229DHekzlsNrpfZoIEIo6I1ml0CKVA3f3cKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=uvYRoINeTD3En4ammtnOLUJBZ9KsepsJAL/yDzvAjp1S9n1C1plIUhfsKQYbg9+sO
	 azZU8QmHydMK0irL7x72P6zAhGXxNE4Hz6fulcU10L32Na8pKJLGl3xr/i5ipMsOv2
	 LItBxxtHSSaqIYrc/HTpRlRAgQ/PS+aGkezcuHWQWWUKPGU6CiLzKNT6mhke6wdWiC
	 7N7Ya8ZVsDetwezDtn+mJ5YaZGCxjbpIqiV1tGjiEC7TE2HvZu3noEOovPTZaHuiim
	 UOseoexNiX+efTbtT05nbRHvXjHuh0h72A6YZON4OjalTj/SucVAfycNOsTa2zGsDb
	 6/mvw7YQGEGnQ==
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
	Tamir Duberstein <tamird@gmail.com>,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/12] rust: macros: convert `#[vtable]` macro to use `syn`
Date: Mon, 12 Jan 2026 17:07:14 +0000
Message-ID: <20260112170919.1888584-4-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260112170919.1888584-1-gary@kernel.org>
References: <20260112170919.1888584-1-gary@kernel.org>
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

Reviewed-by: Tamir Duberstein <tamird@gmail.com>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/macros/lib.rs    |   9 ++-
 rust/macros/vtable.rs | 169 +++++++++++++++++++++++-------------------
 2 files changed, 98 insertions(+), 80 deletions(-)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 945982c21f703..9955c04dbaae3 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -22,6 +22,8 @@
 
 use proc_macro::TokenStream;
 
+use syn::parse_macro_input;
+
 /// Declares a kernel module.
 ///
 /// The `type` argument should be a type which implements the [`Module`]
@@ -204,8 +206,11 @@ pub fn module(ts: TokenStream) -> TokenStream {
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
index a67d1cc81a2d3..72ae0a1816a04 100644
--- a/rust/macros/vtable.rs
+++ b/rust/macros/vtable.rs
@@ -1,97 +1,110 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use std::collections::HashSet;
-use std::fmt::Write;
+use std::{
+    collections::HashSet,
+    iter::Extend, //
+};
 
-use proc_macro2::{Delimiter, Group, TokenStream, TokenTree};
+use proc_macro2::{
+    Ident,
+    TokenStream, //
+};
+use quote::ToTokens;
+use syn::{
+    parse_quote,
+    Error,
+    ImplItem,
+    Item,
+    ItemImpl,
+    ItemTrait,
+    Result,
+    TraitItem, //
+};
 
-pub(crate) fn vtable(_attr: TokenStream, ts: TokenStream) -> TokenStream {
-    let mut tokens: Vec<_> = ts.into_iter().collect();
+fn handle_trait(mut item: ItemTrait) -> Result<ItemTrait> {
+    let mut gen_items = Vec::new();
+    let mut gen_consts = HashSet::new();
 
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
+    gen_items.push(parse_quote! {
+         /// A marker to prevent implementors from forgetting to use [`#[vtable]`](vtable)
+         /// attribute when implementing this trait.
+         const USE_VTABLE_ATTR: ();
+    });
 
-    // Retrieve the main body. The main body should be the last token tree.
-    let body = match tokens.pop() {
-        Some(TokenTree::Group(group)) if group.delimiter() == Delimiter::Brace => group,
-        _ => panic!("cannot locate main body of trait or impl block"),
-    };
-
-    let mut body_it = body.stream().into_iter();
-    let mut functions = Vec::new();
-    let mut consts = HashSet::new();
-    while let Some(token) = body_it.next() {
-        match token {
-            TokenTree::Ident(ident) if ident == "fn" => {
-                let fn_name = match body_it.next() {
-                    Some(TokenTree::Ident(ident)) => ident.to_string(),
-                    // Possibly we've encountered a fn pointer type instead.
-                    _ => continue,
-                };
-                functions.push(fn_name);
-            }
-            TokenTree::Ident(ident) if ident == "const" => {
-                let const_name = match body_it.next() {
-                    Some(TokenTree::Ident(ident)) => ident.to_string(),
-                    // Possibly we've encountered an inline const block instead.
-                    _ => continue,
-                };
-                consts.insert(const_name);
+    for item in &item.items {
+        if let TraitItem::Fn(fn_item) = item {
+            let name = &fn_item.sig.ident;
+            let gen_const_name = Ident::new(
+                &format!("HAS_{}", name.to_string().to_uppercase()),
+                name.span(),
+            );
+            // Skip if it's declared already -- this can happen if `#[cfg]` is used to selectively
+            // define functions.
+            // FIXME: `#[cfg]` should be copied and propagated to the generated consts.
+            if gen_consts.contains(&gen_const_name) {
+                continue;
             }
-            _ => (),
+
+            // We don't know on the implementation-site whether a method is required or provided
+            // so we have to generate a const for all methods.
+            let comment =
+                format!("Indicates if the `{name}` method is overridden by the implementor.");
+            gen_items.push(parse_quote! {
+                #[doc = #comment]
+                const #gen_const_name: bool = false;
+            });
+            gen_consts.insert(gen_const_name);
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
+    item.items.extend(gen_items);
+    Ok(item)
+}
 
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
+fn handle_impl(mut item: ItemImpl) -> Result<ItemImpl> {
+    let mut gen_items = Vec::new();
+    let mut defined_consts = HashSet::new();
+
+    // Iterate over all user-defined constants to gather any possible explicit overrides.
+    for item in &item.items {
+        if let ImplItem::Const(const_item) = item {
+            defined_consts.insert(const_item.ident.clone());
         }
-    } else {
-        const_items = "const USE_VTABLE_ATTR: () = ();".to_owned();
+    }
+
+    gen_items.push(parse_quote! {
+        const USE_VTABLE_ATTR: () = ();
+    });
 
-        for f in functions {
-            let gen_const_name = format!("HAS_{}", f.to_uppercase());
-            if consts.contains(&gen_const_name) {
+    for item in &item.items {
+        if let ImplItem::Fn(fn_item) = item {
+            let name = &fn_item.sig.ident;
+            let gen_const_name = Ident::new(
+                &format!("HAS_{}", name.to_string().to_uppercase()),
+                name.span(),
+            );
+            // Skip if it's declared already -- this allows user override.
+            if defined_consts.contains(&gen_const_name) {
                 continue;
             }
-            write!(const_items, "const {gen_const_name}: bool = true;").unwrap();
+            gen_items.push(parse_quote! {
+                const #gen_const_name: bool = true;
+            });
+            defined_consts.insert(gen_const_name);
         }
     }
 
-    let new_body = vec![const_items.parse().unwrap(), body.stream()]
-        .into_iter()
-        .collect();
-    tokens.push(TokenTree::Group(Group::new(Delimiter::Brace, new_body)));
-    tokens.into_iter().collect()
+    item.items.extend(gen_items);
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

