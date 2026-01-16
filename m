Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8CF36165D;
	Fri, 16 Jan 2026 10:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560983; cv=none; b=gruTCcM8GCX9JQRxJCBx68IVNN52g81nPU0hsz+F+xEOOoP9nD95SK3mrTEPNDX9n1ZvUj15yO2knOCESJ8oMGWxdBVPMUpwm4hej4jqLCpUxpSRjSGq58T9DrzhtPhwWtxicFRPDs6YD5meS2zXph+VAabbZv0BAEXP3Ofi3Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560983; c=relaxed/simple;
	bh=RMgFvoTUsA+/qhPbx192DvHCWGVexyrysiUSMdjVqxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ng5G8zs/+XR96iVqVZSqRpLpc7O5AzB9gY8ztZ+RghoPGjjZomPDhqAk9M1wVdb4ejQTSQf4PAk9xZWfy61NgBQz/JYS5mj81tj3ZK/zPO8RiDnVkT/y6X0b7o9x87R9A1Qtp4H8EWJkeiWfGz6/UBw03OuNwfwjumnzUpdV1uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rA4cNi+N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rA4cNi+N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21F7C116C6;
	Fri, 16 Jan 2026 10:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768560982;
	bh=RMgFvoTUsA+/qhPbx192DvHCWGVexyrysiUSMdjVqxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rA4cNi+Ne0k6QX0Jd1NqJBbNN76koPBDj82hwtzJDewYiBQIb80iuRO/GH9BXQ9QB
	 R9aAxz8fsCQVHmrPGoSlGVg286g6tGf6BxDbKkK2MdwEE6L3tiS1iIF08csYnlCXPz
	 rd1xRtEkG9/Zoeqp7ux4ZRuWMQAQkCyNOgqul1+k3W/q6VFOy1fDTGf1QH28bmvIZX
	 4YFEUb4D2hgYnwa5P687n8lWQFIRsWIaxwa6Tn+/aO2cBjJagLEpPNbec8NuJgYHTE
	 uSUGJkB++tRTejijk0gLKpmTAIbpqfP7/Ezx/eVbNXTBmfNBct9Bsolt9s+/YawanN
	 mesi+RS/jp4gg==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Fiona Behrens <me@kloenk.dev>,
	Tamir Duberstein <tamird@gmail.com>,
	Alban Kurti <kurti@invicto.ai>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/15] rust: pin-init: rewrite the `#[pinned_drop]` attribute macro using `syn`
Date: Fri, 16 Jan 2026 11:54:21 +0100
Message-ID: <20260116105514.3794384-7-lossin@kernel.org>
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

Rewrite the attribute macro for implementing `PinnedDrop` using `syn`.
Otherwise no functional changes intended aside from improved error
messages on syntactic and semantical errors. For example:

When missing the `drop` function in the implementation, the old error
was:

    error: no rules expected `)`
     --> tests/ui/compile-fail/pinned_drop/no_fn.rs:6:1
      |
    6 | #[pinned_drop]
      | ^^^^^^^^^^^^^^ no rules expected this token in macro call
      |
    note: while trying to match keyword `fn`
     --> src/macros.rs
      |
      |             fn drop($($sig:tt)*) {
      |             ^^
      = note: this error originates in the attribute macro `pinned_drop` (in Nightly builds, run with -Z macro-backtrace for more info)

And the new one is:

    error[E0046]: not all trait items implemented, missing: `drop`
     --> tests/ui/compile-fail/pinned_drop/no_fn.rs:7:1
      |
    7 | impl PinnedDrop for Foo {}
      | ^^^^^^^^^^^^^^^^^^^^^^^ missing `drop` in implementation
      |
      = help: implement the missing item: `fn drop(self: Pin<&mut Self>, _: OnlyCallFromDrop) { todo!() }`

Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v4: none
Changes in v3:
* use DiagCtxt error handling
Changes in v2:
* improved error handling
* improved error span
---
 rust/pin-init/internal/src/lib.rs         |  4 +-
 rust/pin-init/internal/src/pinned_drop.rs | 86 +++++++++++++----------
 rust/pin-init/src/macros.rs               | 28 --------
 3 files changed, 52 insertions(+), 66 deletions(-)

diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src/lib.rs
index 4cc9b7b0cda1..a75b99b58189 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -28,7 +28,9 @@ pub fn pin_data(inner: TokenStream, item: TokenStream) -> TokenStream {
 
 #[proc_macro_attribute]
 pub fn pinned_drop(args: TokenStream, input: TokenStream) -> TokenStream {
-    pinned_drop::pinned_drop(args.into(), input.into()).into()
+    let args = parse_macro_input!(args);
+    let input = parse_macro_input!(input);
+    DiagCtxt::with(|dcx| pinned_drop::pinned_drop(args, input, dcx)).into()
 }
 
 #[proc_macro_derive(Zeroable)]
diff --git a/rust/pin-init/internal/src/pinned_drop.rs b/rust/pin-init/internal/src/pinned_drop.rs
index cf8cd1c42984..a20ac314ca82 100644
--- a/rust/pin-init/internal/src/pinned_drop.rs
+++ b/rust/pin-init/internal/src/pinned_drop.rs
@@ -1,49 +1,61 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
-use proc_macro2::{TokenStream, TokenTree};
+use proc_macro2::TokenStream;
 use quote::quote;
+use syn::{parse::Nothing, parse_quote, spanned::Spanned, ImplItem, ItemImpl, Token};
 
-pub(crate) fn pinned_drop(_args: TokenStream, input: TokenStream) -> TokenStream {
-    let mut toks = input.into_iter().collect::<Vec<_>>();
-    assert!(!toks.is_empty());
-    // Ensure that we have an `impl` item.
-    assert!(matches!(&toks[0], TokenTree::Ident(i) if i == "impl"));
-    // Ensure that we are implementing `PinnedDrop`.
-    let mut nesting: usize = 0;
-    let mut pinned_drop_idx = None;
-    for (i, tt) in toks.iter().enumerate() {
-        match tt {
-            TokenTree::Punct(p) if p.as_char() == '<' => {
-                nesting += 1;
+use crate::diagnostics::{DiagCtxt, ErrorGuaranteed};
+
+pub(crate) fn pinned_drop(
+    _args: Nothing,
+    mut input: ItemImpl,
+    dcx: &mut DiagCtxt,
+) -> Result<TokenStream, ErrorGuaranteed> {
+    if let Some(unsafety) = input.unsafety {
+        dcx.error(unsafety, "implementing `PinnedDrop` is safe");
+    }
+    input.unsafety = Some(Token![unsafe](input.impl_token.span));
+    match &mut input.trait_ {
+        Some((not, path, _for)) => {
+            if let Some(not) = not {
+                dcx.error(not, "cannot implement `!PinnedDrop`");
             }
-            TokenTree::Punct(p) if p.as_char() == '>' => {
-                nesting = nesting.checked_sub(1).unwrap();
-                continue;
+            for (seg, expected) in path
+                .segments
+                .iter()
+                .rev()
+                .zip(["PinnedDrop", "pin_init", ""])
+            {
+                if expected.is_empty() || seg.ident != expected {
+                    dcx.error(seg, "bad import path for `PinnedDrop`");
+                }
+                if !seg.arguments.is_none() {
+                    dcx.error(&seg.arguments, "unexpected arguments for `PinnedDrop` path");
+                }
             }
-            _ => {}
+            *path = parse_quote!(::pin_init::PinnedDrop);
         }
-        if i >= 1 && nesting == 0 {
-            // Found the end of the generics, this should be `PinnedDrop`.
-            assert!(
-                matches!(tt, TokenTree::Ident(i) if i == "PinnedDrop"),
-                "expected 'PinnedDrop', found: '{tt:?}'"
+        None => {
+            let span = input
+                .impl_token
+                .span
+                .join(input.self_ty.span())
+                .unwrap_or(input.impl_token.span);
+            dcx.error(
+                span,
+                "expected `impl ... PinnedDrop for ...`, got inherent impl",
             );
-            pinned_drop_idx = Some(i);
-            break;
         }
     }
-    let idx = pinned_drop_idx
-        .unwrap_or_else(|| panic!("Expected an `impl` block implementing `PinnedDrop`."));
-    // Fully qualify the `PinnedDrop`, as to avoid any tampering.
-    toks.splice(idx..idx, quote!(::pin_init::));
-    // Take the `{}` body and call the declarative macro.
-    if let Some(TokenTree::Group(last)) = toks.pop() {
-        let last = last.stream();
-        quote!(::pin_init::__pinned_drop! {
-            @impl_sig(#(#toks)*),
-            @impl_body(#last),
-        })
-    } else {
-        TokenStream::from_iter(toks)
+    for item in &mut input.items {
+        if let ImplItem::Fn(fn_item) = item {
+            if fn_item.sig.ident == "drop" {
+                fn_item
+                    .sig
+                    .inputs
+                    .push(parse_quote!(_: ::pin_init::__internal::OnlyCallFromDrop));
+            }
+        }
     }
+    Ok(quote!(#input))
 }
diff --git a/rust/pin-init/src/macros.rs b/rust/pin-init/src/macros.rs
index 53ed5ce860fc..b80c95612fd6 100644
--- a/rust/pin-init/src/macros.rs
+++ b/rust/pin-init/src/macros.rs
@@ -503,34 +503,6 @@
 #[cfg(not(kernel))]
 pub use ::paste::paste;
 
-/// Creates a `unsafe impl<...> PinnedDrop for $type` block.
-///
-/// See [`PinnedDrop`] for more information.
-///
-/// [`PinnedDrop`]: crate::PinnedDrop
-#[doc(hidden)]
-#[macro_export]
-macro_rules! __pinned_drop {
-    (
-        @impl_sig($($impl_sig:tt)*),
-        @impl_body(
-            $(#[$($attr:tt)*])*
-            fn drop($($sig:tt)*) {
-                $($inner:tt)*
-            }
-        ),
-    ) => {
-        // SAFETY: TODO.
-        unsafe $($impl_sig)* {
-            // Inherit all attributes and the type/ident tokens for the signature.
-            $(#[$($attr)*])*
-            fn drop($($sig)*, _: $crate::__internal::OnlyCallFromDrop) {
-                $($inner)*
-            }
-        }
-    }
-}
-
 /// This macro first parses the struct definition such that it separates pinned and not pinned
 /// fields. Afterwards it declares the struct and implement the `PinData` trait safely.
 #[doc(hidden)]
-- 
2.52.0

