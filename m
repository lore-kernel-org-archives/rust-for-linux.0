Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5308A46522C;
	Thu,  8 Jan 2026 13:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880371; cv=none; b=KR+1uXeDUaWkfAcEIK0c0GKyzyKwKUC/mDYBEwJVyLDWrI4wy1N8wVsaTtKH0Hukmuoom+sqe9ngtphGvVBXZV/GjJ2yWX0OWdO7QSChRSOdmYIEIy/DrVUR2lgwekyQhnkT/Y4f7oVyH6dH9qf0F+8lJYSZLYMizkwUdZyaR3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880371; c=relaxed/simple;
	bh=PSM2OHqzki9vRcztkStGIeQj+Gz8/CLEbz6NMItYdoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YSiN5Fq2mxV+0Xsdi9lq2+vgn1bc0hDRGp7neL7kKFzi37W2uqp2MTScxSi1DOf4Nz+XByGM8wGY5Dx1v9KCO1UuYQGaPoT0nvulAowEMZs0qdXn0vzqhTMWNeqQRdvF7XFBWeT1OsvZcHiAEEs43rsHsvjy4rQ5MHBNg2IXlyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cFYcfVcC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cFYcfVcC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FDEC16AAE;
	Thu,  8 Jan 2026 13:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767880370;
	bh=PSM2OHqzki9vRcztkStGIeQj+Gz8/CLEbz6NMItYdoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cFYcfVcCRbg/p/Vsen7627ouHklDodWQs1GFe7X2UG7iG6mbilkMOweIWaA+eo9cc
	 BZ7ySuQltNZlkVSXeKi+HB7Dsxf1lUD5HJ75IROwmPCyqVe9uN7uvGqYRvs1PehqkE
	 HYlbPhd4d9mlIrXtZtb/eRBgVEQrp0hKBkoO/v+DgULFeMXVVXfp2mPotqSiOn/hMA
	 C8Ux4Af8hV542HTEW0fs0JpvussQRJqWjMoXiJgwzRbzoIinEoa2pmcgds2/PeTPQo
	 0dpjC2HDWGTVp+kww6R9VJOa5yXU54QfSNWwmtQ04bpqB8nE72zWebTd8amdszJcBZ
	 uFI5wKgR2O5NQ==
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
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Alban Kurti <kurti@invicto.ai>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/12] rust: pin-init: rewrite `derive(Zeroable)` and `derive(MaybeZeroable)` using `syn`
Date: Thu,  8 Jan 2026 14:50:42 +0100
Message-ID: <20260108135127.3153925-5-lossin@kernel.org>
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

Rewrite the two derive macros for `Zeroable` using `syn`. One positive
side effect of this change is that tuple structs are now supported by
them. Additionally, syntax errors and the error emitted when trying to
use one of the derive macros on an `enum` are improved. Otherwise no
functional changes intended.

For example:

    #[derive(Zeroable)]
    enum Num {
        A(u32),
        B(i32),
    }

Produced this error before this commit:

    error: no rules expected keyword `enum`
     --> tests/ui/compile-fail/zeroable/enum.rs:5:1
      |
    5 | enum Num {
      | ^^^^ no rules expected this token in macro call
      |
    note: while trying to match keyword `struct`
     --> src/macros.rs
      |
      |             $vis:vis struct $name:ident
      |                      ^^^^^^

Now the error is:

    error: cannot derive `Zeroable` for an enum
     --> tests/ui/compile-fail/zeroable/enum.rs:5:1
      |
    5 | enum Num {
      | ^^^^

    error: cannot derive `Zeroable` for an enum

Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/internal/src/lib.rs      |   5 +-
 rust/pin-init/internal/src/zeroable.rs | 149 ++++++++++---------------
 rust/pin-init/src/macros.rs            | 124 --------------------
 3 files changed, 65 insertions(+), 213 deletions(-)

diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src/lib.rs
index 4c4dc639ce82..ec593362c5ac 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -11,6 +11,7 @@
 #![allow(missing_docs)]
 
 use proc_macro::TokenStream;
+use syn::parse_macro_input;
 
 mod helpers;
 mod pin_data;
@@ -29,10 +30,10 @@ pub fn pinned_drop(args: TokenStream, input: TokenStream) -> TokenStream {
 
 #[proc_macro_derive(Zeroable)]
 pub fn derive_zeroable(input: TokenStream) -> TokenStream {
-    zeroable::derive(input.into()).into()
+    zeroable::derive(parse_macro_input!(input as _)).into()
 }
 
 #[proc_macro_derive(MaybeZeroable)]
 pub fn maybe_derive_zeroable(input: TokenStream) -> TokenStream {
-    zeroable::maybe_derive(input.into()).into()
+    zeroable::maybe_derive(parse_macro_input!(input as _)).into()
 }
diff --git a/rust/pin-init/internal/src/zeroable.rs b/rust/pin-init/internal/src/zeroable.rs
index d8a5ef3883f4..0328c3bdfceb 100644
--- a/rust/pin-init/internal/src/zeroable.rs
+++ b/rust/pin-init/internal/src/zeroable.rs
@@ -1,99 +1,74 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use crate::helpers::{parse_generics, Generics};
-use proc_macro2::{TokenStream, TokenTree};
-use quote::quote;
+use proc_macro2::TokenStream;
+use quote::{quote, quote_spanned};
+use syn::{parse_quote, Data, DeriveInput, Field, Fields};
 
-pub(crate) fn parse_zeroable_derive_input(
-    input: TokenStream,
-) -> (
-    Vec<TokenTree>,
-    Vec<TokenTree>,
-    Vec<TokenTree>,
-    Option<TokenTree>,
-) {
-    let (
-        Generics {
-            impl_generics,
-            decl_generics: _,
-            ty_generics,
-        },
-        mut rest,
-    ) = parse_generics(input);
-    // This should be the body of the struct `{...}`.
-    let last = rest.pop();
-    // Now we insert `Zeroable` as a bound for every generic parameter in `impl_generics`.
-    let mut new_impl_generics = Vec::with_capacity(impl_generics.len());
-    // Are we inside of a generic where we want to add `Zeroable`?
-    let mut in_generic = !impl_generics.is_empty();
-    // Have we already inserted `Zeroable`?
-    let mut inserted = false;
-    // Level of `<>` nestings.
-    let mut nested = 0;
-    for tt in impl_generics {
-        match &tt {
-            // If we find a `,`, then we have finished a generic/constant/lifetime parameter.
-            TokenTree::Punct(p) if nested == 0 && p.as_char() == ',' => {
-                if in_generic && !inserted {
-                    new_impl_generics.extend(quote! { : ::pin_init::Zeroable });
-                }
-                in_generic = true;
-                inserted = false;
-                new_impl_generics.push(tt);
-            }
-            // If we find `'`, then we are entering a lifetime.
-            TokenTree::Punct(p) if nested == 0 && p.as_char() == '\'' => {
-                in_generic = false;
-                new_impl_generics.push(tt);
-            }
-            TokenTree::Punct(p) if nested == 0 && p.as_char() == ':' => {
-                new_impl_generics.push(tt);
-                if in_generic {
-                    new_impl_generics.extend(quote! { ::pin_init::Zeroable + });
-                    inserted = true;
-                }
-            }
-            TokenTree::Punct(p) if p.as_char() == '<' => {
-                nested += 1;
-                new_impl_generics.push(tt);
-            }
-            TokenTree::Punct(p) if p.as_char() == '>' => {
-                assert!(nested > 0);
-                nested -= 1;
-                new_impl_generics.push(tt);
-            }
-            _ => new_impl_generics.push(tt),
+pub(crate) fn derive(input: DeriveInput) -> TokenStream {
+    let fields = match input.data {
+        Data::Struct(data_struct) => data_struct.fields,
+        Data::Union(data_union) => Fields::Named(data_union.fields),
+        Data::Enum(data_enum) => {
+            return quote_spanned! {data_enum.enum_token.span=>
+                ::core::compile_error!("cannot derive `Zeroable` for an enum");
+            };
         }
+    };
+    let name = input.ident;
+    let mut generics = input.generics;
+    for param in generics.type_params_mut() {
+        param.bounds.insert(0, parse_quote!(::pin_init::Zeroable));
     }
-    assert_eq!(nested, 0);
-    if in_generic && !inserted {
-        new_impl_generics.extend(quote! { : ::pin_init::Zeroable });
-    }
-    (rest, new_impl_generics, ty_generics, last)
-}
-
-pub(crate) fn derive(input: TokenStream) -> TokenStream {
-    let (rest, new_impl_generics, ty_generics, last) = parse_zeroable_derive_input(input);
+    let (impl_gen, ty_gen, whr) = generics.split_for_impl();
+    let field_type = fields.iter().map(|field| &field.ty);
     quote! {
-        ::pin_init::__derive_zeroable!(
-            parse_input:
-                @sig(#(#rest)*),
-                @impl_generics(#(#new_impl_generics)*),
-                @ty_generics(#(#ty_generics)*),
-                @body(#last),
-        );
+        // SAFETY: Every field type implements `Zeroable` and padding bytes may be zero.
+        #[automatically_derived]
+        unsafe impl #impl_gen ::pin_init::Zeroable for #name #ty_gen
+            #whr
+        {}
+        const _: () = {
+            fn assert_zeroable<T: ?::core::marker::Sized + ::pin_init::Zeroable>() {}
+            fn ensure_zeroable #impl_gen ()
+                #whr
+            {
+                #(
+                    assert_zeroable::<#field_type>();
+                )*
+            }
+        };
     }
 }
 
-pub(crate) fn maybe_derive(input: TokenStream) -> TokenStream {
-    let (rest, new_impl_generics, ty_generics, last) = parse_zeroable_derive_input(input);
+pub(crate) fn maybe_derive(input: DeriveInput) -> TokenStream {
+    let fields = match input.data {
+        Data::Struct(data_struct) => data_struct.fields,
+        Data::Union(data_union) => Fields::Named(data_union.fields),
+        Data::Enum(data_enum) => {
+            return quote_spanned! {data_enum.enum_token.span=>
+                compile_error!("cannot derive `Zeroable` for an enum");
+            };
+        }
+    };
+    let name = input.ident;
+    let mut generics = input.generics;
+    for param in generics.type_params_mut() {
+        param.bounds.insert(0, parse_quote!(::pin_init::Zeroable));
+    }
+    for Field { ty, .. } in fields {
+        generics
+            .make_where_clause()
+            .predicates
+            // the `for<'__dummy>` HRTB makes this not error without the `trivial_bounds`
+            // feature <https://github.com/rust-lang/rust/issues/48214#issuecomment-2557829956>.
+            .push(parse_quote!(#ty: for<'__dummy> ::pin_init::Zeroable));
+    }
+    let (impl_gen, ty_gen, whr) = generics.split_for_impl();
     quote! {
-        ::pin_init::__maybe_derive_zeroable!(
-            parse_input:
-                @sig(#(#rest)*),
-                @impl_generics(#(#new_impl_generics)*),
-                @ty_generics(#(#ty_generics)*),
-                @body(#last),
-        );
+        // SAFETY: Every field type implements `Zeroable` and padding bytes may be zero.
+        #[automatically_derived]
+        unsafe impl #impl_gen ::pin_init::Zeroable for #name #ty_gen
+            #whr
+        {}
     }
 }
diff --git a/rust/pin-init/src/macros.rs b/rust/pin-init/src/macros.rs
index 682c61a587a0..53ed5ce860fc 100644
--- a/rust/pin-init/src/macros.rs
+++ b/rust/pin-init/src/macros.rs
@@ -1551,127 +1551,3 @@ fn assert_zeroable<T: $crate::Zeroable>(_: *mut T) {}
         );
     };
 }
-
-#[doc(hidden)]
-#[macro_export]
-macro_rules! __derive_zeroable {
-    (parse_input:
-        @sig(
-            $(#[$($struct_attr:tt)*])*
-            $vis:vis struct $name:ident
-            $(where $($whr:tt)*)?
-        ),
-        @impl_generics($($impl_generics:tt)*),
-        @ty_generics($($ty_generics:tt)*),
-        @body({
-            $(
-                $(#[$($field_attr:tt)*])*
-                $field_vis:vis $field:ident : $field_ty:ty
-            ),* $(,)?
-        }),
-    ) => {
-        // SAFETY: Every field type implements `Zeroable` and padding bytes may be zero.
-        #[automatically_derived]
-        unsafe impl<$($impl_generics)*> $crate::Zeroable for $name<$($ty_generics)*>
-        where
-            $($($whr)*)?
-        {}
-        const _: () = {
-            fn assert_zeroable<T: ?::core::marker::Sized + $crate::Zeroable>() {}
-            fn ensure_zeroable<$($impl_generics)*>()
-                where $($($whr)*)?
-            {
-                $(assert_zeroable::<$field_ty>();)*
-            }
-        };
-    };
-    (parse_input:
-        @sig(
-            $(#[$($struct_attr:tt)*])*
-            $vis:vis union $name:ident
-            $(where $($whr:tt)*)?
-        ),
-        @impl_generics($($impl_generics:tt)*),
-        @ty_generics($($ty_generics:tt)*),
-        @body({
-            $(
-                $(#[$($field_attr:tt)*])*
-                $field_vis:vis $field:ident : $field_ty:ty
-            ),* $(,)?
-        }),
-    ) => {
-        // SAFETY: Every field type implements `Zeroable` and padding bytes may be zero.
-        #[automatically_derived]
-        unsafe impl<$($impl_generics)*> $crate::Zeroable for $name<$($ty_generics)*>
-        where
-            $($($whr)*)?
-        {}
-        const _: () = {
-            fn assert_zeroable<T: ?::core::marker::Sized + $crate::Zeroable>() {}
-            fn ensure_zeroable<$($impl_generics)*>()
-                where $($($whr)*)?
-            {
-                $(assert_zeroable::<$field_ty>();)*
-            }
-        };
-    };
-}
-
-#[doc(hidden)]
-#[macro_export]
-macro_rules! __maybe_derive_zeroable {
-    (parse_input:
-        @sig(
-            $(#[$($struct_attr:tt)*])*
-            $vis:vis struct $name:ident
-            $(where $($whr:tt)*)?
-        ),
-        @impl_generics($($impl_generics:tt)*),
-        @ty_generics($($ty_generics:tt)*),
-        @body({
-            $(
-                $(#[$($field_attr:tt)*])*
-                $field_vis:vis $field:ident : $field_ty:ty
-            ),* $(,)?
-        }),
-    ) => {
-        // SAFETY: Every field type implements `Zeroable` and padding bytes may be zero.
-        #[automatically_derived]
-        unsafe impl<$($impl_generics)*> $crate::Zeroable for $name<$($ty_generics)*>
-        where
-            $(
-                // the `for<'__dummy>` HRTB makes this not error without the `trivial_bounds`
-                // feature <https://github.com/rust-lang/rust/issues/48214#issuecomment-2557829956>.
-                $field_ty: for<'__dummy> $crate::Zeroable,
-            )*
-            $($($whr)*)?
-        {}
-    };
-    (parse_input:
-        @sig(
-            $(#[$($struct_attr:tt)*])*
-            $vis:vis union $name:ident
-            $(where $($whr:tt)*)?
-        ),
-        @impl_generics($($impl_generics:tt)*),
-        @ty_generics($($ty_generics:tt)*),
-        @body({
-            $(
-                $(#[$($field_attr:tt)*])*
-                $field_vis:vis $field:ident : $field_ty:ty
-            ),* $(,)?
-        }),
-    ) => {
-        // SAFETY: Every field type implements `Zeroable` and padding bytes may be zero.
-        #[automatically_derived]
-        unsafe impl<$($impl_generics)*> $crate::Zeroable for $name<$($ty_generics)*>
-        where
-            $(
-                // the `for<'__dummy>` HRTB makes this not error without the `trivial_bounds`
-                // feature <https://github.com/rust-lang/rust/issues/48214#issuecomment-2557829956>.
-                $field_ty: for<'__dummy> $crate::Zeroable,
-            )*
-            $($($whr)*)?
-        {}
-    };
-}
-- 
2.51.2

