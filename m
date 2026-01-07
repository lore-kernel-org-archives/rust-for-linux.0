Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D1539E6D7;
	Wed,  7 Jan 2026 16:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803429; cv=none; b=QQYXkm2jZAjYOsmeKW2WTh3AN1pM4fEsBCqH5hKxhWlDlN44H3qnsbCuffa0YbIkJqXSDUOhxaJekMBC+qN3aA/v5/YjVduUqRgIuiaZ7fEQTIMsx4pv6bDH4JT1GBvPM7RMI5HRc/BCWbLaVPUWs4dlc3SwENJ5LbAabNKHCjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803429; c=relaxed/simple;
	bh=GJQW39AWzT/FswwlXf5MTJ3/vN1Hnb8VR5/qMpp6wIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBrk1kMsbjS1/ZhycvGd6HSFy6xCx9huL1YXMhJEQQzcMf3nI3sJE2NwfphPLyjcdrIuGcgkVRs41lBL4E8E+K6klG1Wpx6uQ6WpFEvK84ynSWjVV0EGhrO9kNuhn0g3LJ3YpWF/IKH5v/+Hg8lpgK3F95VRbv6AjbqTZTq1N00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kn4Ggj/K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kn4Ggj/K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F127AC4CEF1;
	Wed,  7 Jan 2026 16:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767803426;
	bh=GJQW39AWzT/FswwlXf5MTJ3/vN1Hnb8VR5/qMpp6wIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=Kn4Ggj/KmRX4UtKbXTotiWjO0xLQu6WwJMpzap30YaSjudiVQTFo2CSl+klsE5UQr
	 lyuloTDqaohiP1nez2SlQrJOd+BNJUyNKbWi6lTalzzYU+ZB0jhHEvK5ixMOui+hsi
	 r42Knpcpfv2mNvbqZ+qXgSd7hrI8gbUVTKS++YpV2HWMrgQBEMdxyC+hFsQOgHPa1p
	 BOiVatVs5dpQa2gR1SpnL7NKksyLGZDDnh/+5ajiHRmn5zCnKYqbez/g8wnc/6pvan
	 rG5eA9VyLhzzSUVIjstbjk04PwZD3rJSti97etWV5nnVjp7MNN4bqXM9bpzsKDbTjr
	 JlPNj+moDcAzg==
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
	Igor Korotin <igor.korotin.linux@gmail.com>,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/11] rust: macros: convert `#[vtable]` macro to use `syn`
Date: Wed,  7 Jan 2026 16:15:42 +0000
Message-ID: <20260107161729.3855851-4-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260107161729.3855851-1-gary@kernel.org>
References: <20260107161729.3855851-1-gary@kernel.org>
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
 rust/macros/vtable.rs | 163 ++++++++++++++++++++++--------------------
 2 files changed, 93 insertions(+), 79 deletions(-)

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
index a67d1cc81a2d3..a39bedb703973 100644
--- a/rust/macros/vtable.rs
+++ b/rust/macros/vtable.rs
@@ -1,97 +1,106 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use std::collections::HashSet;
-use std::fmt::Write;
 
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
+    let mut functions = Vec::new();
+    for item in &item.items {
+        if let TraitItem::Fn(fn_item) = item {
+            functions.push(fn_item.sig.ident.clone());
+        }
+    }
+
+    item.items.push(parse_quote! {
+         /// A marker to prevent implementors from forgetting to use [`#[vtable]`](vtable)
+         /// attribute when implementing this trait.
+         const USE_VTABLE_ATTR: ();
+    });
 
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
+    let mut consts = HashSet::new();
+    for name in functions {
+        let gen_const_name = Ident::new(
+            &format!("HAS_{}", name.to_string().to_uppercase()),
+            name.span(),
+        );
+        // Skip if it's declared already -- this can happen if `#[cfg]` is used to selectively
+        // define functions.
+        // FIXME: `#[cfg]` should be copied and propagated to the generated consts.
+        if consts.contains(&gen_const_name) {
+            continue;
+        }
+        // We don't know on the implementation-site whether a method is required or provided
+        // so we have to generate a const for all methods.
+        let comment = format!("Indicates if the `{name}` method is overridden by the implementor.");
+        item.items.push(parse_quote! {
+            #[doc = #comment]
+            const #gen_const_name: bool = false;
+        });
+        consts.insert(gen_const_name);
+    }
 
-    // Retrieve the main body. The main body should be the last token tree.
-    let body = match tokens.pop() {
-        Some(TokenTree::Group(group)) if group.delimiter() == Delimiter::Brace => group,
-        _ => panic!("cannot locate main body of trait or impl block"),
-    };
+    Ok(item)
+}
 
-    let mut body_it = body.stream().into_iter();
+fn handle_impl(mut item: ItemImpl) -> Result<ItemImpl> {
     let mut functions = Vec::new();
     let mut consts = HashSet::new();
-    while let Some(token) = body_it.next() {
-        match token {
-            TokenTree::Ident(ident) if ident == "fn" => {
-                let fn_name = match body_it.next() {
-                    Some(TokenTree::Ident(ident)) => ident.to_string(),
-                    // Possibly we've encountered a fn pointer type instead.
-                    _ => continue,
-                };
-                functions.push(fn_name);
+    for item in &item.items {
+        match item {
+            ImplItem::Fn(fn_item) => {
+                functions.push(fn_item.sig.ident.clone());
             }
-            TokenTree::Ident(ident) if ident == "const" => {
-                let const_name = match body_it.next() {
-                    Some(TokenTree::Ident(ident)) => ident.to_string(),
-                    // Possibly we've encountered an inline const block instead.
-                    _ => continue,
-                };
-                consts.insert(const_name);
+            ImplItem::Const(const_item) => {
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
+         const USE_VTABLE_ATTR: () = ();
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
-        }
-    } else {
-        const_items = "const USE_VTABLE_ATTR: () = ();".to_owned();
-
-        for f in functions {
-            let gen_const_name = format!("HAS_{}", f.to_uppercase());
-            if consts.contains(&gen_const_name) {
-                continue;
-            }
-            write!(const_items, "const {gen_const_name}: bool = true;").unwrap();
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

