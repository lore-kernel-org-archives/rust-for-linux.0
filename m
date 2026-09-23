Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDF1244687;
	Wed, 23 Sep 2026 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172394; cv=none; b=MzFjS+vtp+EXRolq1G/PAvyymSHlAHupL1wLXNAqyCn2OruASS8IwCZ8NjidbTKdcg5g8GWPBG8dCveq99EmEo9rzIToKLN+ZZYuW87Of9ctLQQ2peG3GRslSiD/rWpwVz42nSALqyltizYcYANQnN2Yy53X6Z/Uzkn4XU+y8Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172394; c=relaxed/simple;
	bh=q8fCd9Z/XZucUQsh9gLexsvtOqoYnGlIMraaR/z6kCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nJg47P3t2JPersg0CORn7t6ECygznnBs1ldsVzXqtx89u3fNoQU0w02tDy7J7skfYrCRhKwxK/4LQVhV72arlCPgmH3rlojcwag+fuj4G9zwVd2eBDlP5QdT259RFrnGQY67JofG4QhXUBhf0HaMoB79waUb96h34+z4vKPgHJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfbvFQ8t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfbvFQ8t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78961F000FF;
	Wed, 23 Sep 2026 14:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790172392;
	bh=K+DgeqwBXy16mXxOtEILhg0nQc96HCehJ64AnqqPWjA=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=UfbvFQ8t20iJN86zpaMJcK8P7WhNFPoh+Mg6hKG0BwyWTW2Z04o5B0ALSHbS9gecN
	 QjvyO67yHmsPNYMfDXeCNlfgBA9C+PyBoTq3F1UgPUFevHpcu1GfTxMNjlYmGdV8iZ
	 pk1vRrMspzVvCmrEEAV9sOyMUq3WApDBzzSBr845/MBEuB7nErG9/X+w2tXHeZuQuZ
	 IQ7pz80lgfcBBmeLldEIfiES66rOsdMxnZSqDgOOP5oLn0Dq8WlwoYkLikaQ9Ay6NA
	 e/H6/mlWcofoZ1MiAQOYOpAFW3/JaLIOGry6QawwSaBHmk1Skk/2T26kqm4nHguem5
	 aQn5j7ELVDwCg==
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
Subject: [PATCH 1/3] rust: pin-init: internal: handle item and expr diagnostics differently
Date: Wed, 23 Sep 2026 15:06:13 +0100
Message-ID: <20260923140618.1978181-1-gary@kernel.org>
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

Currently `DiagCtxt` is used to allow error recovery in the pin-init
macros, by generating both a `compile_error!()` macro item and continue
expansion, and then merge token streams together. This works very well for
items, however for expressions, this will produce invalid expression and
result in a confusing error message.

    error: macro expansion ignores `::` and any tokens following
      --> tests/ui/compile-fail/zeroable/invalid_spread.rs:15:9
       |
    13 |       let _ = init!(Foo {
       |  _____________-
    14 | |         a: 0,
    15 | |         ..MyZeroable::init_zeroed()
       | |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^
    16 | |     });
       | |______- caused by the macro expansion here
       |
       = note: the usage of `init!` is likely invalid in expression context

Fix this by wrap the concatenated diagnostics in a block, with the
generated expression in its tail position. This results in the desired
error message.

    error: expected nothing or `..Zeroable::init_zeroed()`.
      --> tests/ui/compile-fail/zeroable/invalid_spread.rs:15:9
       |
    15 |         ..MyZeroable::init_zeroed()
       |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/diagnostics.rs | 55 +++++++++++++++++++----
 rust/pin-init/internal/src/lib.rs         | 12 ++---
 2 files changed, 53 insertions(+), 14 deletions(-)

diff --git a/rust/pin-init/internal/src/diagnostics.rs b/rust/pin-init/internal/src/diagnostics.rs
index c7d9b3e624fc..c42f1095ab10 100644
--- a/rust/pin-init/internal/src/diagnostics.rs
+++ b/rust/pin-init/internal/src/diagnostics.rs
@@ -3,7 +3,7 @@
 use std::fmt::Display;
 
 use proc_macro2::TokenStream;
-use quote::quote_spanned;
+use quote::{quote, quote_spanned};
 use syn::{spanned::Spanned, Error};
 
 pub(crate) struct DiagCtxt(TokenStream);
@@ -29,16 +29,55 @@ const fn warn() {}
         ));
     }
 
-    pub(crate) fn with(
-        fun: impl FnOnce(&mut DiagCtxt) -> Result<TokenStream, ErrorGuaranteed>,
+    fn with(
+        f: impl FnOnce(&mut DiagCtxt) -> Result<TokenStream, ErrorGuaranteed>,
+        merge_diag: impl FnOnce(TokenStream, TokenStream) -> TokenStream,
+        convert_diag: impl FnOnce(TokenStream) -> TokenStream,
     ) -> TokenStream {
         let mut dcx = Self(TokenStream::new());
-        match fun(&mut dcx) {
-            Ok(mut stream) => {
-                stream.extend(dcx.0);
-                stream
+        match f(&mut dcx) {
+            Ok(stream) => {
+                if dcx.0.is_empty() {
+                    stream
+                } else {
+                    merge_diag(stream, dcx.0)
+                }
             }
-            Err(ErrorGuaranteed(())) => dcx.0,
+            Err(ErrorGuaranteed(())) => convert_diag(dcx.0),
         }
     }
+
+    pub(crate) fn for_item(
+        f: impl FnOnce(&mut DiagCtxt) -> Result<TokenStream, ErrorGuaranteed>,
+    ) -> TokenStream {
+        Self::with(
+            f,
+            |mut out, diag| {
+                out.extend(diag);
+                out
+            },
+            std::convert::identity,
+        )
+    }
+
+    pub(crate) fn for_expr(
+        f: impl FnOnce(&mut DiagCtxt) -> Result<TokenStream, ErrorGuaranteed>,
+    ) -> TokenStream {
+        Self::with(
+            f,
+            |out, diag| {
+                // Diagnostics that we generate are always items.
+                // So for expressions create a block to place diagnostics in item position.
+                quote!({
+                    #diag
+                    #out
+                })
+            },
+            |diag| {
+                quote!({
+                    #diag
+                })
+            },
+        )
+    }
 }
diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src/lib.rs
index c488019d6250..0410024ba1e6 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -25,31 +25,31 @@
 pub fn pin_data(args: TokenStream, input: TokenStream) -> TokenStream {
     let args = parse_macro_input!(args);
     let input = parse_macro_input!(input);
-    DiagCtxt::with(|dcx| pin_data::pin_data(args, input, dcx)).into()
+    DiagCtxt::for_item(|dcx| pin_data::pin_data(args, input, dcx)).into()
 }
 
 #[proc_macro_attribute]
 pub fn pinned_drop(args: TokenStream, input: TokenStream) -> TokenStream {
     let args = parse_macro_input!(args);
     let input = parse_macro_input!(input);
-    DiagCtxt::with(|dcx| pinned_drop::pinned_drop(args, input, dcx)).into()
+    DiagCtxt::for_item(|dcx| pinned_drop::pinned_drop(args, input, dcx)).into()
 }
 
 #[proc_macro_derive(Zeroable)]
 pub fn derive_zeroable(input: TokenStream) -> TokenStream {
     let input = parse_macro_input!(input);
-    DiagCtxt::with(|dcx| zeroable::derive(input, dcx)).into()
+    DiagCtxt::for_item(|dcx| zeroable::derive(input, dcx)).into()
 }
 
 #[proc_macro_derive(MaybeZeroable)]
 pub fn maybe_derive_zeroable(input: TokenStream) -> TokenStream {
     let input = parse_macro_input!(input);
-    DiagCtxt::with(|dcx| zeroable::maybe_derive(input, dcx)).into()
+    DiagCtxt::for_item(|dcx| zeroable::maybe_derive(input, dcx)).into()
 }
 #[proc_macro]
 pub fn init(input: TokenStream) -> TokenStream {
     let input = parse_macro_input!(input);
-    DiagCtxt::with(|dcx| {
+    DiagCtxt::for_expr(|dcx| {
         init::expand_with_cfg(input, Some("::core::convert::Infallible"), false, dcx)
     })
     .into()
@@ -58,7 +58,7 @@ pub fn init(input: TokenStream) -> TokenStream {
 #[proc_macro]
 pub fn pin_init(input: TokenStream) -> TokenStream {
     let input = parse_macro_input!(input);
-    DiagCtxt::with(|dcx| {
+    DiagCtxt::for_expr(|dcx| {
         init::expand_with_cfg(input, Some("::core::convert::Infallible"), true, dcx)
     })
     .into()

base-commit: dfb6a037fd586f1ffcba3b143dab58f5c88294d1
-- 
2.54.0

