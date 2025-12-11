Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A8D31AAB6;
	Thu, 11 Dec 2025 19:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765481415; cv=none; b=V1PhzpHvBvEnylg3iX8Ptu2kdUCM6EBDBwWDUnwlRfgcBbnfOaofpuSBmI/d+gqGNcIq855AwxjSMDCgn77UUDxmDkwWeHCgOOiTh8EAAU8xHozMN304WmVPHb+uQ/bx48YTIjP9/PtRn5UbQ1cCRrWLnPqhW62Hv5JoEp0oKIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765481415; c=relaxed/simple;
	bh=QTPXqRPRBr/0YRt5e3KmYxbJNX8L/mwGthLoBGKeTMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tsXdQQKQasqn1VjkS9p1yqR33yiD4zatcukr5mVKG9JftPp90aPoZlbFamNPVvZRs0DcfCTr45I8wLJOanKYWUlKJaOPmzPPN2XlZio4gEdeu4hJXDfYe6veqq5dJFP32teIhskJQkMqvIeZ39JYDpbt7kKMmPRvFNQS6rCvT38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eh557q2Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eh557q2Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BC4C4CEF7;
	Thu, 11 Dec 2025 19:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765481415;
	bh=QTPXqRPRBr/0YRt5e3KmYxbJNX8L/mwGthLoBGKeTMg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=eh557q2YSIoHurNFBEXhDkvE33MRbWeQroRYOcSnP8GEL3QlKSKBrNJkEzysHjnUa
	 wiNSnM2mmMVTZHMhi017iMj/0C4axJzHWa7/+8RoS8RkNFkOByxIUE50hswG2dscjE
	 MhjsMF4aFMJuIFuiL4TG83Kly1IoFDMre4raCXmVxvwpYzW962V75cJeorH97aOCWZ
	 vRNnuhEtqrkK9vO1kEmQ+wNC2X8FsUIlt2Ye9Z1DAnXImupPdJDqfyMyFtqRwluHqS
	 9a0hQHF+c8nu3sLemrlqIipuolD62hFB9D+9PHs4+IdUy5XIz5knYp9Bw1xptD1WUf
	 MNjrPrYAYeCmg==
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] rust: macros: allow arbitrary types to be used in `module!` macro
Date: Thu, 11 Dec 2025 18:56:49 +0000
Message-ID: <20251211185805.2835633-10-gary@kernel.org>
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

Previously this only accepts an identifier, but now with `syn` it is
easy to make it accepts any type.

With this change, the span of types are preserved -- as a benefit, Rust
analyzer will be able to use the "navigate to definition" feature on
type name inside `module!` macro invocation.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/macros/module.rs | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 4a02aadef25a7..d6298d04c86f4 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -4,7 +4,6 @@
 
 use proc_macro2::{
     Literal,
-    Span,
     TokenStream, //
 };
 use quote::{
@@ -23,7 +22,8 @@
     Ident,
     LitStr,
     Result,
-    Token, //
+    Token,
+    Type, //
 };
 
 use crate::helpers::*;
@@ -105,7 +105,7 @@ mod kw {
 
 #[allow(dead_code, reason = "some fields are only parsed into")]
 enum ModInfoField {
-    Type(Token![type], Token![:], Ident),
+    Type(Token![type], Token![:], Type),
     Name(kw::name, Token![:], AsciiLitStr),
     Authors(
         kw::authors,
@@ -193,9 +193,9 @@ fn parse(input: ParseStream<'_>) -> Result<Self> {
     }
 }
 
-#[derive(Debug, Default)]
+#[derive(Default)]
 pub(crate) struct ModuleInfo {
-    type_: String,
+    type_: Option<Type>,
     license: String,
     name: String,
     authors: Option<Vec<String>>,
@@ -237,7 +237,7 @@ fn parse(input: ParseStream<'_>) -> Result<Self> {
             seen_keys.push(key);
 
             match field {
-                ModInfoField::Type(_, _, ty) => info.type_ = ty.to_string(),
+                ModInfoField::Type(_, _, ty) => info.type_ = Some(ty),
                 ModInfoField::Name(_, _, name) => info.name = name.value(),
                 ModInfoField::Authors(_, _, _, list) => {
                     info.authors = Some(list.into_iter().map(|x| x.value()).collect())
@@ -286,16 +286,17 @@ fn parse(input: ParseStream<'_>) -> Result<Self> {
 
 pub(crate) fn module(info: ModuleInfo) -> Result<TokenStream> {
     let ModuleInfo {
-        type_,
+        type_: Some(type_),
         license,
         name,
         authors,
         description,
         alias,
         firmware,
-    } = info;
-
-    let type_ = Ident::new(&type_, Span::mixed_site());
+    } = info
+    else {
+        unreachable!();
+    };
 
     // Rust does not allow hyphens in identifiers, use underscore instead.
     let ident = name.replace('-', "_");
@@ -376,7 +377,6 @@ impl ::kernel::ModuleMetadata for #type_ {
         // Double nested modules, since then nobody can access the public items inside.
         mod __module_init {
             mod __module_init {
-                use super::super::#type_;
                 use pin_init::PinInit;
 
                 /// The "Rust loadable module" mark.
@@ -388,7 +388,7 @@ mod __module_init {
                 #[used(compiler)]
                 static __IS_RUST_MODULE: () = ();
 
-                static mut __MOD: ::core::mem::MaybeUninit<#type_> =
+                static mut __MOD: ::core::mem::MaybeUninit<super::super::LocalModule> =
                     ::core::mem::MaybeUninit::uninit();
 
                 // Loadable modules need to export the `{init,cleanup}_module` identifiers.
@@ -475,8 +475,9 @@ pub extern "C" fn #ident_exit() {
                 ///
                 /// This function must only be called once.
                 unsafe fn __init() -> ::kernel::ffi::c_int {
-                    let initer =
-                        <#type_ as ::kernel::InPlaceModule>::init(&super::super::THIS_MODULE);
+                    let initer = <super::super::LocalModule as ::kernel::InPlaceModule>::init(
+                        &super::super::THIS_MODULE
+                    );
                     // SAFETY: No data race, since `__MOD` can only be accessed by this module
                     // and there only `__init` and `__exit` access it. These functions are only
                     // called once and `__exit` cannot be called before or during `__init`.
-- 
2.51.2

