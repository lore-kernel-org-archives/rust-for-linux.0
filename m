Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F99947798E;
	Thu,  8 Jan 2026 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880377; cv=none; b=NPejzwd1WQ9yuwvgTBc6GidyxHUbKhgjcp0M6zc7+azSYohK+GL4WhoV9Ur+TYqoTkJyeEoWcXAZgpS2/UytcHC/xiX2WCDtdwxBRc00Zkx8Y0HXgzqcvnD9bBMX6B28uuqjtbK+29ww9FZ71e5AVzyPUDmdcj7WLC/mLNGrKA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880377; c=relaxed/simple;
	bh=C4wmA+o78ngIWU6MAnEP1QTsUr781e8j9Hqr/t5dETU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NuK3ngyPrv8NBWGBJIxCfFaztQqnpaBV3v8skAnuUSkX6Yv1zk+R2cIlHPhlniPCqXxviWF+hB11elXa2253og1Hp4lx3dmbhX9/mumiB46/xz6ojDsNxsgG7Mbq2wMW4F/Vzl9nmBMcAiweyhDM5nCebWZCALv85OhSnOLkJM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUdBcHWi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUdBcHWi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B54C116C6;
	Thu,  8 Jan 2026 13:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767880376;
	bh=C4wmA+o78ngIWU6MAnEP1QTsUr781e8j9Hqr/t5dETU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oUdBcHWiBsI2bIwF7kAsnpiIbdC9XJSLZW4F7nqVdGTJ9RUzHHnGY6J7So6HfGkcc
	 XEyw2mh8woAea2eiIRh5BcJaHL9FjeC6vu9JseY0KXtTYmVEx6ebPNdfSJn9p7IxKb
	 q9BZgesaUIoJobjBCE7H7lrd5NoQXKwtAFevh90xNmilQIKAB5KVecNQuQhy9OhRug
	 sNfDT6N+aPJR0Lob0Kciyr8nXA4hyf9JE3KEfSXaa8qQh1KkStrXkWZiECsxcU3/lH
	 GSBRT/tmRx5fpwyWnqyxCpQPu7Gmbvx/eTX5RUppgJjSC4vdx0V9T+q42i1rPXFDCZ
	 Rnkrxmr/6Rkkw==
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
Subject: [PATCH 05/12] rust: pin-init: rewrite the `#[pinned_drop]` attribute macro using `syn`
Date: Thu,  8 Jan 2026 14:50:43 +0100
Message-ID: <20260108135127.3153925-6-lossin@kernel.org>
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

Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/internal/src/lib.rs         |  6 +-
 rust/pin-init/internal/src/pinned_drop.rs | 87 ++++++++++++-----------
 rust/pin-init/src/macros.rs               | 28 --------
 3 files changed, 52 insertions(+), 69 deletions(-)

diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src/lib.rs
index ec593362c5ac..d0156b82b5d3 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -25,7 +25,11 @@ pub fn pin_data(inner: TokenStream, item: TokenStream) -> TokenStream {
 
 #[proc_macro_attribute]
 pub fn pinned_drop(args: TokenStream, input: TokenStream) -> TokenStream {
-    pinned_drop::pinned_drop(args.into(), input.into()).into()
+    pinned_drop::pinned_drop(
+        parse_macro_input!(args as _),
+        parse_macro_input!(input as _),
+    )
+    .into()
 }
 
 #[proc_macro_derive(Zeroable)]
diff --git a/rust/pin-init/internal/src/pinned_drop.rs b/rust/pin-init/internal/src/pinned_drop.rs
index cf8cd1c42984..4df2cb9959fb 100644
--- a/rust/pin-init/internal/src/pinned_drop.rs
+++ b/rust/pin-init/internal/src/pinned_drop.rs
@@ -1,49 +1,56 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
-use proc_macro2::{TokenStream, TokenTree};
-use quote::quote;
+use proc_macro2::TokenStream;
+use quote::{quote, quote_spanned};
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
+pub(crate) fn pinned_drop(_args: Nothing, mut input: ItemImpl) -> TokenStream {
+    let mut errors = vec![];
+    if let Some(unsafety) = input.unsafety {
+        errors.push(quote_spanned! {unsafety.span=>
+            ::core::compile_error!("implementing `PinnedDrop` is safe");
+        });
+    }
+    input.unsafety = Some(Token![unsafe](input.impl_token.span));
+    match &mut input.trait_ {
+        Some((not, path, _for)) => {
+            if let Some(not) = not {
+                errors.push(quote_spanned! {not.span=>
+                    ::core::compile_error!("cannot implement `!PinnedDrop`");
+                });
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
+                    errors.push(quote_spanned! {seg.span()=>
+                        ::core::compile_error!("bad import path for `PinnedDrop`");
+                    });
+                }
+                if !seg.arguments.is_none() {
+                    errors.push(quote_spanned! {seg.arguments.span()=>
+                        ::core::compile_error!("unexpected arguments for `PinnedDrop` path");
+                    });
+                }
             }
-            _ => {}
-        }
-        if i >= 1 && nesting == 0 {
-            // Found the end of the generics, this should be `PinnedDrop`.
-            assert!(
-                matches!(tt, TokenTree::Ident(i) if i == "PinnedDrop"),
-                "expected 'PinnedDrop', found: '{tt:?}'"
-            );
-            pinned_drop_idx = Some(i);
-            break;
+            *path = parse_quote!(::pin_init::PinnedDrop);
         }
+        None => errors.push(quote_spanned! {input.impl_token.span=>
+            ::core::compile_error!("expected `impl ... PinnedDrop for ...`, got inherent impl");
+        }),
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
+    quote!(#(#errors)* #input)
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
2.51.2

