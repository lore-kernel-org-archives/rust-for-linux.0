Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BAA3803CA;
	Wed,  7 Jan 2026 16:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803391; cv=none; b=Yrs4HXJoRvm872DUuX9K4FI5O+h5fHY56HJnTXd3OVvDG37uLVRzln2Vogqede96P/jE+q2QJsjJ8vZp4Fs+HZ6KegGJhdVWZzk6uzZuwP/Y7+RxLtZQ6/PnpuUuGqEAI2E44hTpmKfvPv+xZrFTqA3mBlTWr8PmhaaCmZWfDHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803391; c=relaxed/simple;
	bh=NL9F7HRJi+7FXe/wEAA1sOAEGOqjYLGPkqHZQ3rYzJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A8/mFnvXYPux4EpIaSyef71vvtwRRsH46EyYVO1IrIS/qhKbr7ZcVfTCMIVa6S5W8wghbKyaLMBQjGEyRB6bRZfdHbLrtW8GC8QRu6fc4H0YVt2ChPFIYhm3J0y+BjS0X9jeF1bYCPXIMs8rJHlzul8nzcN+iFCoCA/JQdQT3zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AP3bff9E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AP3bff9E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD32CC2BCB7;
	Wed,  7 Jan 2026 16:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767803389;
	bh=NL9F7HRJi+7FXe/wEAA1sOAEGOqjYLGPkqHZQ3rYzJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=AP3bff9EvWhEmDVIJuY/+rJx35kYfixGYXnIVzG9eQYk8GOCjXsNZoIG3hTPAy00d
	 X0WTyQ4+FAHLv0Um9gMcs//0SbYTG7BCwy/dRcGR5WLt+tH9Q6ysMpsDVKZg6FxHaX
	 +S1dFdRAbVUHokp9EoJglWDKs3ICRjZK+ldBe722r07wtxVAiDVWMOqG5FKJxWGsHU
	 AK8UU21whBK/jrwZW9R/e1xTg/Fc9QA/iYJogz+SKowPo03pmIIkbLMY5ACpKgzpsU
	 cwi4mUgvGHlq1DSNbCul64gQjAjB1p2+DYLF7gFJZ21sG9eBzhGs1VoBfAijpFGNdR
	 tZuFbE8hnTK9A==
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
	Fiona Behrens <me@Kloenk.dev>,
	Tamir Duberstein <tamird@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/11] rust: pin-init: internal: remove proc-macro[2] and quote workarounds
Date: Wed,  7 Jan 2026 16:15:40 +0000
Message-ID: <20260107161729.3855851-2-gary@kernel.org>
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

From: Benno Lossin <lossin@kernel.org>

The kernel only had the `proc-macro` library available, whereas the
user-space version also used `proc-macro2` and `quote`. Now both are
available to the kernel, making it possible to remove the workarounds.

Clippy complains about unnecessary `.to_string()` as `proc-macro2`
provides additional `PartialEq` impl, so they are removed.

Signed-off-by: Benno Lossin <lossin@kernel.org>
Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/Makefile                             | 16 ++++++++++------
 rust/pin-init/internal/src/helpers.rs     |  7 ++-----
 rust/pin-init/internal/src/lib.rs         | 16 ----------------
 rust/pin-init/internal/src/pin_data.rs    | 18 ++++++------------
 rust/pin-init/internal/src/pinned_drop.rs | 10 ++++------
 rust/pin-init/internal/src/zeroable.rs    |  6 ++----
 scripts/generate_rust_analyzer.py         |  2 +-
 7 files changed, 25 insertions(+), 50 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704d..96f0ac53ec0e8 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -212,9 +212,10 @@ rustdoc-ffi: $(src)/ffi.rs rustdoc-core FORCE
 
 rustdoc-pin_init_internal: private rustdoc_host = yes
 rustdoc-pin_init_internal: private rustc_target_flags = --cfg kernel \
-    --extern proc_macro --crate-type proc-macro
+    --extern proc_macro --extern proc_macro2 --extern quote --extern syn \
+    --crate-type proc-macro
 rustdoc-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
-    rustdoc-clean FORCE
+    rustdoc-clean rustdoc-proc_macro2 rustdoc-quote rustdoc-syn FORCE
 	+$(call if_changed,rustdoc)
 
 rustdoc-pin_init: private rustdoc_host = yes
@@ -273,9 +274,10 @@ rusttestlib-macros: $(src)/macros/lib.rs \
 	+$(call if_changed,rustc_test_library)
 
 rusttestlib-pin_init_internal: private rustc_target_flags = --cfg kernel \
-    --extern proc_macro
+    --extern proc_macro --extern proc_macro2 --extern quote --extern syn
 rusttestlib-pin_init_internal: private rustc_test_library_proc = yes
-rusttestlib-pin_init_internal: $(src)/pin-init/internal/src/lib.rs FORCE
+rusttestlib-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
+    rusttestlib-proc_macro2 rusttestlib-quote rusttestlib-syn FORCE
 	+$(call if_changed,rustc_test_library)
 
 rusttestlib-pin_init: private rustc_target_flags = --extern pin_init_internal \
@@ -547,8 +549,10 @@ $(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib \
     $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
-$(obj)/$(libpin_init_internal_name): private rustc_target_flags = --cfg kernel
-$(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs FORCE
+$(obj)/$(libpin_init_internal_name): private rustc_target_flags = --cfg kernel \
+    --extern proc_macro2 --extern quote --extern syn
+$(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs \
+	$(obj)/libproc_macro2.rlib $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L $@
diff --git a/rust/pin-init/internal/src/helpers.rs b/rust/pin-init/internal/src/helpers.rs
index 236f989a50f2f..90f85eaa41231 100644
--- a/rust/pin-init/internal/src/helpers.rs
+++ b/rust/pin-init/internal/src/helpers.rs
@@ -1,9 +1,6 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
-#[cfg(not(kernel))]
-use proc_macro2 as proc_macro;
-
-use proc_macro::{TokenStream, TokenTree};
+use proc_macro2::{TokenStream, TokenTree};
 
 /// Parsed generics.
 ///
@@ -101,7 +98,7 @@ pub(crate) fn parse_generics(input: TokenStream) -> (Generics, Vec<TokenTree>) {
                     1 => {
                         // Here depending on the token, it might be a generic variable name.
                         match tt.clone() {
-                            TokenTree::Ident(i) if at_start && i.to_string() == "const" => {
+                            TokenTree::Ident(i) if at_start && i == "const" => {
                                 let Some(name) = toks.next() else {
                                     // Parsing error.
                                     break;
diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src/lib.rs
index 297b0129a5bfd..4c4dc639ce823 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -7,27 +7,11 @@
 //! `pin-init` proc macros.
 
 #![cfg_attr(not(RUSTC_LINT_REASONS_IS_STABLE), feature(lint_reasons))]
-// Allow `.into()` to convert
-// - `proc_macro2::TokenStream` into `proc_macro::TokenStream` in the user-space version.
-// - `proc_macro::TokenStream` into `proc_macro::TokenStream` in the kernel version.
-//   Clippy warns on this conversion, but it's required by the user-space version.
-//
-// Remove once we have `proc_macro2` in the kernel.
-#![allow(clippy::useless_conversion)]
 // Documentation is done in the pin-init crate instead.
 #![allow(missing_docs)]
 
 use proc_macro::TokenStream;
 
-#[cfg(kernel)]
-#[path = "../../../macros/quote.rs"]
-#[macro_use]
-#[cfg_attr(not(kernel), rustfmt::skip)]
-mod quote;
-#[cfg(not(kernel))]
-#[macro_use]
-extern crate quote;
-
 mod helpers;
 mod pin_data;
 mod pinned_drop;
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 87d4a7eb1d35e..86a53b37cc660 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -1,10 +1,8 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
-#[cfg(not(kernel))]
-use proc_macro2 as proc_macro;
-
 use crate::helpers::{parse_generics, Generics};
-use proc_macro::{Group, Punct, Spacing, TokenStream, TokenTree};
+use proc_macro2::{Group, Punct, Spacing, TokenStream, TokenTree};
+use quote::quote;
 
 pub(crate) fn pin_data(args: TokenStream, input: TokenStream) -> TokenStream {
     // This proc-macro only does some pre-parsing and then delegates the actual parsing to
@@ -28,7 +26,7 @@ pub(crate) fn pin_data(args: TokenStream, input: TokenStream) -> TokenStream {
     // The name of the struct with ty_generics.
     let struct_name = rest
         .iter()
-        .skip_while(|tt| !matches!(tt, TokenTree::Ident(i) if i.to_string() == "struct"))
+        .skip_while(|tt| !matches!(tt, TokenTree::Ident(i) if i == "struct"))
         .nth(1)
         .and_then(|tt| match tt {
             TokenTree::Ident(_) => {
@@ -65,7 +63,7 @@ pub(crate) fn pin_data(args: TokenStream, input: TokenStream) -> TokenStream {
         .into_iter()
         .flat_map(|tt| {
             // We ignore top level `struct` tokens, since they would emit a compile error.
-            if matches!(&tt, TokenTree::Ident(i) if i.to_string() == "struct") {
+            if matches!(&tt, TokenTree::Ident(i) if i == "struct") {
                 vec![tt]
             } else {
                 replace_self_and_deny_type_defs(&struct_name, tt, &mut errs)
@@ -98,11 +96,7 @@ fn replace_self_and_deny_type_defs(
 ) -> Vec<TokenTree> {
     match tt {
         TokenTree::Ident(ref i)
-            if i.to_string() == "enum"
-                || i.to_string() == "trait"
-                || i.to_string() == "struct"
-                || i.to_string() == "union"
-                || i.to_string() == "impl" =>
+            if i == "enum" || i == "trait" || i == "struct" || i == "union" || i == "impl" =>
         {
             errs.extend(
                 format!(
@@ -119,7 +113,7 @@ fn replace_self_and_deny_type_defs(
             );
             vec![tt]
         }
-        TokenTree::Ident(i) if i.to_string() == "Self" => struct_name.clone(),
+        TokenTree::Ident(i) if i == "Self" => struct_name.clone(),
         TokenTree::Literal(_) | TokenTree::Punct(_) | TokenTree::Ident(_) => vec![tt],
         TokenTree::Group(g) => vec![TokenTree::Group(Group::new(
             g.delimiter(),
diff --git a/rust/pin-init/internal/src/pinned_drop.rs b/rust/pin-init/internal/src/pinned_drop.rs
index c4ca7a70b726a..cf8cd1c429849 100644
--- a/rust/pin-init/internal/src/pinned_drop.rs
+++ b/rust/pin-init/internal/src/pinned_drop.rs
@@ -1,15 +1,13 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
-#[cfg(not(kernel))]
-use proc_macro2 as proc_macro;
-
-use proc_macro::{TokenStream, TokenTree};
+use proc_macro2::{TokenStream, TokenTree};
+use quote::quote;
 
 pub(crate) fn pinned_drop(_args: TokenStream, input: TokenStream) -> TokenStream {
     let mut toks = input.into_iter().collect::<Vec<_>>();
     assert!(!toks.is_empty());
     // Ensure that we have an `impl` item.
-    assert!(matches!(&toks[0], TokenTree::Ident(i) if i.to_string() == "impl"));
+    assert!(matches!(&toks[0], TokenTree::Ident(i) if i == "impl"));
     // Ensure that we are implementing `PinnedDrop`.
     let mut nesting: usize = 0;
     let mut pinned_drop_idx = None;
@@ -27,7 +25,7 @@ pub(crate) fn pinned_drop(_args: TokenStream, input: TokenStream) -> TokenStream
         if i >= 1 && nesting == 0 {
             // Found the end of the generics, this should be `PinnedDrop`.
             assert!(
-                matches!(tt, TokenTree::Ident(i) if i.to_string() == "PinnedDrop"),
+                matches!(tt, TokenTree::Ident(i) if i == "PinnedDrop"),
                 "expected 'PinnedDrop', found: '{tt:?}'"
             );
             pinned_drop_idx = Some(i);
diff --git a/rust/pin-init/internal/src/zeroable.rs b/rust/pin-init/internal/src/zeroable.rs
index e0ed3998445cf..d8a5ef3883f4b 100644
--- a/rust/pin-init/internal/src/zeroable.rs
+++ b/rust/pin-init/internal/src/zeroable.rs
@@ -1,10 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#[cfg(not(kernel))]
-use proc_macro2 as proc_macro;
-
 use crate::helpers::{parse_generics, Generics};
-use proc_macro::{TokenStream, TokenTree};
+use proc_macro2::{TokenStream, TokenTree};
+use quote::quote;
 
 pub(crate) fn parse_zeroable_derive_input(
     input: TokenStream,
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 147d0cc940681..d31d938886589 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -123,7 +123,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     append_crate(
         "pin_init_internal",
         srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
-        [],
+        ["std", "proc_macro", "proc_macro2", "quote", "syn"],
         cfg=["kernel"],
         is_proc_macro=True,
     )

base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
-- 
2.51.2

