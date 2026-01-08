Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCF9466B6B;
	Thu,  8 Jan 2026 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880385; cv=none; b=Ls7lN2nhzXnrRxqBgq2QhY6ocjq2U7G0+tU1rgp8RvMsUiBh6m8RegBgjDj+wzbtM50suZCgLD8TgxGEufE7nNfSvrqKgoU1Y6fiVf79JrmtT5z/gcXtEM9HR+aTpT2USqe2wWucStRiXnMmrrjOJFRBpFC5l2MRSVQDPNRrNlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880385; c=relaxed/simple;
	bh=IR8dDkfMwr4GGRSsKFX342L4Wo4nqFSKNJoFEfLz4xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OH7K8cHYhBRjFxMsbGlXPfibUk0Y7Rr2hqI8JSbTG3Z+ez6HZcjN5814GNIXOtVEO9ZrmpcsPtjfj4mAEs4LsfzJkzysIWy6L0IvSp2yBAVYiC/dyQ6r2YK7ZrR/OcnDDacutkatJhg2wjWKGPRJTxnTyAc06ZuCP2GyrEhNbzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZR01hG8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZR01hG8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA55C16AAE;
	Thu,  8 Jan 2026 13:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767880385;
	bh=IR8dDkfMwr4GGRSsKFX342L4Wo4nqFSKNJoFEfLz4xw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mZR01hG8tpUH6Hauk6ILTLNe8aF3YqNL1ePVFKyo1FPd/Tw0rslyyWp7Zqr6p5W0V
	 qIZ56phCGuYODEiUKGZ69pLLWrZKfkuJkGG7WgWY+QAX54u2/gdviyRl8vdNy2aAlB
	 39jeCZ8fCfbw7EEwup24xVNTEXxlrF9iVPqaCod25FAORBdtj/4WpFOAbaktBnrxft
	 M98V74YZlZ6FSDl66JIVV9j8lC+P1rQmKP/GQvTt9UWQc3FOJoHFnaL3rkvf4Q9O9t
	 vBwZIZTyBrQ0SN/FNEUsE1wDSaJf2gH5G86q6Oo1vd6RIZ/3OAUpNocEhdUPXIntTT
	 lPokeRdxsS7ww==
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
	Fiona Behrens <me@Kloenk.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alban Kurti <kurti@invicto.ai>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 06/12] rust: pin-init: rewrite `#[pin_data]` using `syn`
Date: Thu,  8 Jan 2026 14:50:44 +0100
Message-ID: <20260108135127.3153925-7-lossin@kernel.org>
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

Rewrite the attribute macro `#[pin_data]` using `syn`. No functional
changes intended aside from improved error messages on syntactic and
semantical errors. For example if one forgets a comma at the end of a
field:

    #[pin_data]
    struct Foo {
        a: Box<Foo>
        b: Box<Foo>
    }

The declarative macro reports the following errors:

    error: expected `,`, or `}`, found `b`
     --> tests/ui/compile-fail/pin_data/missing_comma.rs:5:16
      |
    5 |     a: Box<Foo>
      |                ^ help: try adding a comma: `,`

    error: recursion limit reached while expanding `$crate::__pin_data!`
     --> tests/ui/compile-fail/pin_data/missing_comma.rs:3:1
      |
    3 | #[pin_data]
      | ^^^^^^^^^^^
      |
      = help: consider increasing the recursion limit by adding a `#![recursion_limit = "256"]` attribute to your crate (`$CRATE`)
      = note: this error originates in the macro `$crate::__pin_data` which comes from the expansion of the attribute macro `pin_data` (in Nightly builds, run with -Z macro-backtrace for more info)

The new `syn` version reports:

    error: expected `,`, or `}`, found `b`
     --> tests/ui/compile-fail/pin_data/missing_comma.rs:5:16
      |
    5 |     a: Box<Foo>
      |                ^ help: try adding a comma: `,`

    error: expected `,`
     --> tests/ui/compile-fail/pin_data/missing_comma.rs:6:5
      |
    6 |     b: Box<Foo>
      |     ^

Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/internal/src/helpers.rs  | 149 ------
 rust/pin-init/internal/src/lib.rs      |  12 +-
 rust/pin-init/internal/src/pin_data.rs | 645 ++++++++++++++++++++-----
 rust/pin-init/src/macros.rs            | 574 ----------------------
 4 files changed, 543 insertions(+), 837 deletions(-)
 delete mode 100644 rust/pin-init/internal/src/helpers.rs

diff --git a/rust/pin-init/internal/src/helpers.rs b/rust/pin-init/internal/src/helpers.rs
deleted file mode 100644
index 90f85eaa4123..000000000000
--- a/rust/pin-init/internal/src/helpers.rs
+++ /dev/null
@@ -1,149 +0,0 @@
-// SPDX-License-Identifier: Apache-2.0 OR MIT
-
-use proc_macro2::{TokenStream, TokenTree};
-
-/// Parsed generics.
-///
-/// See the field documentation for an explanation what each of the fields represents.
-///
-/// # Examples
-///
-/// ```rust,ignore
-/// # let input = todo!();
-/// let (Generics { decl_generics, impl_generics, ty_generics }, rest) = parse_generics(input);
-/// quote! {
-///     struct Foo<$($decl_generics)*> {
-///         // ...
-///     }
-///
-///     impl<$impl_generics> Foo<$ty_generics> {
-///         fn foo() {
-///             // ...
-///         }
-///     }
-/// }
-/// ```
-pub(crate) struct Generics {
-    /// The generics with bounds and default values (e.g. `T: Clone, const N: usize = 0`).
-    ///
-    /// Use this on type definitions e.g. `struct Foo<$decl_generics> ...` (or `union`/`enum`).
-    pub(crate) decl_generics: Vec<TokenTree>,
-    /// The generics with bounds (e.g. `T: Clone, const N: usize`).
-    ///
-    /// Use this on `impl` blocks e.g. `impl<$impl_generics> Trait for ...`.
-    pub(crate) impl_generics: Vec<TokenTree>,
-    /// The generics without bounds and without default values (e.g. `T, N`).
-    ///
-    /// Use this when you use the type that is declared with these generics e.g.
-    /// `Foo<$ty_generics>`.
-    pub(crate) ty_generics: Vec<TokenTree>,
-}
-
-/// Parses the given `TokenStream` into `Generics` and the rest.
-///
-/// The generics are not present in the rest, but a where clause might remain.
-pub(crate) fn parse_generics(input: TokenStream) -> (Generics, Vec<TokenTree>) {
-    // The generics with bounds and default values.
-    let mut decl_generics = vec![];
-    // `impl_generics`, the declared generics with their bounds.
-    let mut impl_generics = vec![];
-    // Only the names of the generics, without any bounds.
-    let mut ty_generics = vec![];
-    // Tokens not related to the generics e.g. the `where` token and definition.
-    let mut rest = vec![];
-    // The current level of `<`.
-    let mut nesting = 0;
-    let mut toks = input.into_iter();
-    // If we are at the beginning of a generic parameter.
-    let mut at_start = true;
-    let mut skip_until_comma = false;
-    while let Some(tt) = toks.next() {
-        if nesting == 1 && matches!(&tt, TokenTree::Punct(p) if p.as_char() == '>') {
-            // Found the end of the generics.
-            break;
-        } else if nesting >= 1 {
-            decl_generics.push(tt.clone());
-        }
-        match tt.clone() {
-            TokenTree::Punct(p) if p.as_char() == '<' => {
-                if nesting >= 1 && !skip_until_comma {
-                    // This is inside of the generics and part of some bound.
-                    impl_generics.push(tt);
-                }
-                nesting += 1;
-            }
-            TokenTree::Punct(p) if p.as_char() == '>' => {
-                // This is a parsing error, so we just end it here.
-                if nesting == 0 {
-                    break;
-                } else {
-                    nesting -= 1;
-                    if nesting >= 1 && !skip_until_comma {
-                        // We are still inside of the generics and part of some bound.
-                        impl_generics.push(tt);
-                    }
-                }
-            }
-            TokenTree::Punct(p) if skip_until_comma && p.as_char() == ',' => {
-                if nesting == 1 {
-                    impl_generics.push(tt.clone());
-                    impl_generics.push(tt);
-                    skip_until_comma = false;
-                }
-            }
-            _ if !skip_until_comma => {
-                match nesting {
-                    // If we haven't entered the generics yet, we still want to keep these tokens.
-                    0 => rest.push(tt),
-                    1 => {
-                        // Here depending on the token, it might be a generic variable name.
-                        match tt.clone() {
-                            TokenTree::Ident(i) if at_start && i == "const" => {
-                                let Some(name) = toks.next() else {
-                                    // Parsing error.
-                                    break;
-                                };
-                                impl_generics.push(tt);
-                                impl_generics.push(name.clone());
-                                ty_generics.push(name.clone());
-                                decl_generics.push(name);
-                                at_start = false;
-                            }
-                            TokenTree::Ident(_) if at_start => {
-                                impl_generics.push(tt.clone());
-                                ty_generics.push(tt);
-                                at_start = false;
-                            }
-                            TokenTree::Punct(p) if p.as_char() == ',' => {
-                                impl_generics.push(tt.clone());
-                                ty_generics.push(tt);
-                                at_start = true;
-                            }
-                            // Lifetimes begin with `'`.
-                            TokenTree::Punct(p) if p.as_char() == '\'' && at_start => {
-                                impl_generics.push(tt.clone());
-                                ty_generics.push(tt);
-                            }
-                            // Generics can have default values, we skip these.
-                            TokenTree::Punct(p) if p.as_char() == '=' => {
-                                skip_until_comma = true;
-                            }
-                            _ => impl_generics.push(tt),
-                        }
-                    }
-                    _ => impl_generics.push(tt),
-                }
-            }
-            _ => {}
-        }
-    }
-    rest.extend(toks);
-    (
-        Generics {
-            impl_generics,
-            decl_generics,
-            ty_generics,
-        },
-        rest,
-    )
-}
diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src/lib.rs
index d0156b82b5d3..243684a1eedc 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -13,14 +13,20 @@
 use proc_macro::TokenStream;
 use syn::parse_macro_input;
 
-mod helpers;
 mod pin_data;
 mod pinned_drop;
 mod zeroable;
 
 #[proc_macro_attribute]
-pub fn pin_data(inner: TokenStream, item: TokenStream) -> TokenStream {
-    pin_data::pin_data(inner.into(), item.into()).into()
+pub fn pin_data(args: TokenStream, input: TokenStream) -> TokenStream {
+    match pin_data::pin_data(
+        parse_macro_input!(args as _),
+        parse_macro_input!(input as _),
+    ) {
+        Ok(stream) => stream,
+        Err(err) => err.into_compile_error(),
+    }
+    .into()
 }
 
 #[proc_macro_attribute]
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 86a53b37cc66..d1e7ed121860 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -1,126 +1,549 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
-use crate::helpers::{parse_generics, Generics};
-use proc_macro2::{Group, Punct, Spacing, TokenStream, TokenTree};
-use quote::quote;
+use proc_macro2::TokenStream;
+use quote::{format_ident, quote};
+use syn::{
+    parse::{End, Nothing, Parse},
+    parse_quote, parse_quote_spanned,
+    spanned::Spanned,
+    visit_mut::VisitMut,
+    Error, Field, Ident, Item, ItemStruct, PathSegment, Result, Type, TypePath, WhereClause,
+};
 
-pub(crate) fn pin_data(args: TokenStream, input: TokenStream) -> TokenStream {
-    // This proc-macro only does some pre-parsing and then delegates the actual parsing to
-    // `pin_init::__pin_data!`.
+pub(crate) mod kw {
+    syn::custom_keyword!(PinnedDrop);
+}
+
+pub(crate) enum Args {
+    Nothing(Nothing),
+    #[allow(dead_code)]
+    PinnedDrop(kw::PinnedDrop),
+}
+
+impl Parse for Args {
+    fn parse(input: syn::parse::ParseStream) -> Result<Self> {
+        let lh = input.lookahead1();
+        if lh.peek(End) {
+            input.parse().map(Self::Nothing)
+        } else if lh.peek(kw::PinnedDrop) {
+            let res = input.parse().map(Self::PinnedDrop)?;
+            let lh = input.lookahead1();
+            if lh.peek(End) {
+                Ok(res)
+            } else {
+                Err(lh.error())
+            }
+        } else {
+            Err(lh.error())
+        }
+    }
+}
+
+pub(crate) fn pin_data(args: Args, input: Item) -> Result<TokenStream> {
+    let mut struct_ = match input {
+        Item::Struct(struct_) => struct_,
+        Item::Enum(enum_) => {
+            return Err(Error::new_spanned(
+                enum_.enum_token,
+                "`#[pin_data]` only supports structs for now",
+            ));
+        }
+        Item::Union(union) => {
+            return Err(Error::new_spanned(
+                union.union_token,
+                "`#[pin_data]` only supports structs for now",
+            ));
+        }
+        rest => {
+            return Err(Error::new_spanned(
+                rest,
+                "`#[pin_data]` can only be applied to struct, enum and union defintions",
+            ));
+        }
+    };
+
+    // The generics might contain the `Self` type. Since this macro will define a new type with the
+    // same generics and bounds, this poses a problem: `Self` will refer to the new type as opposed
+    // to this struct definition. Therefore we have to replace `Self` with the concrete name.
+    let mut replacer = {
+        let name = &struct_.ident;
+        let (_, ty_generics, _) = struct_.generics.split_for_impl();
+        SelfReplacer(parse_quote!(#name #ty_generics))
+    };
+    replacer.visit_generics_mut(&mut struct_.generics);
+    replacer.visit_fields_mut(&mut struct_.fields);
+
+    let mut error: Option<Error> = None;
+    for field in &struct_.fields {
+        if !is_field_structurally_pinned(field) && is_phantom_pinned(&field.ty) {
+            let mut err = Error::new_spanned(
+                field,
+                format!(
+                    "The field `{}` of type `PhantomData` only has an effect \
+                if it has the `#[pin]` attribute",
+                    field.ident.as_ref().expect(""),
+                ),
+            );
+            if let Some(mut error) = error.take() {
+                error.combine(err);
+                err = error;
+            }
+            error = Some(err);
+        }
+    }
+
+    let unpin_impl = generate_unpin_impl(&struct_);
+    let drop_impl = generate_drop_impl(&struct_, args);
+    let projections = generate_projections(&struct_);
+    let the_pin_data = generate_the_pin_data(&struct_);
+
+    strip_pin_annotations(&mut struct_);
+
+    let error = error.map(|e| e.into_compile_error());
+
+    Ok(quote! {
+        #struct_
+        #projections
+        // We put the rest into this const item, because it then will not be accessible to anything
+        // outside.
+        const _: () = {
+            #the_pin_data
+            #unpin_impl
+            #drop_impl
+        };
+        #error
+    })
+}
+
+fn is_phantom_pinned(ty: &Type) -> bool {
+    match ty {
+        Type::Path(TypePath { qself: None, path }) => {
+            // Cannot possibly refer to `PhantomPinned` (except alias, but that's on the user).
+            if path.segments.len() > 3 {
+                return false;
+            }
+            // If there is a `::`, then the path needs to be `::core::marker::PhantomPinned` or
+            // `::std::marker::PhantomPinned`.
+            if path.leading_colon.is_some() && path.segments.len() != 3 {
+                return false;
+            }
+            let expected: Vec<&[&str]> = vec![&["PhantomPinned"], &["marker"], &["core", "std"]];
+            for (actual, expected) in path.segments.iter().rev().zip(expected) {
+                if !actual.arguments.is_empty() || expected.iter().all(|e| actual.ident != e) {
+                    return false;
+                }
+            }
+            true
+        }
+        _ => false,
+    }
+}
+
+fn is_field_structurally_pinned(field: &Field) -> bool {
+    field.attrs.iter().any(|a| a.path().is_ident("pin"))
+}
 
+fn generate_unpin_impl(
+    ItemStruct {
+        ident,
+        generics,
+        fields,
+        ..
+    }: &ItemStruct,
+) -> TokenStream {
+    let generics_with_pinlt = {
+        let mut g = generics.clone();
+        g.params.insert(0, parse_quote!('__pin));
+        let _ = g.make_where_clause();
+        g
+    };
     let (
-        Generics {
-            impl_generics,
-            decl_generics,
-            ty_generics,
-        },
-        rest,
-    ) = parse_generics(input);
-    // The struct definition might contain the `Self` type. Since `__pin_data!` will define a new
-    // type with the same generics and bounds, this poses a problem, since `Self` will refer to the
-    // new type as opposed to this struct definition. Therefore we have to replace `Self` with the
-    // concrete name.
-
-    // Errors that occur when replacing `Self` with `struct_name`.
-    let mut errs = TokenStream::new();
-    // The name of the struct with ty_generics.
-    let struct_name = rest
+        impl_generics_with_pinlt,
+        ty_generics_with_pinlt,
+        Some(WhereClause {
+            where_token,
+            predicates,
+        }),
+    ) = generics_with_pinlt.split_for_impl()
+    else {
+        unreachable!()
+    };
+    let (_, ty_generics, _) = generics.split_for_impl();
+    let mut pinned_fields = fields
         .iter()
-        .skip_while(|tt| !matches!(tt, TokenTree::Ident(i) if i == "struct"))
-        .nth(1)
-        .and_then(|tt| match tt {
-            TokenTree::Ident(_) => {
-                let tt = tt.clone();
-                let mut res = vec![tt];
-                if !ty_generics.is_empty() {
-                    // We add this, so it is maximally compatible with e.g. `Self::CONST` which
-                    // will be replaced by `StructName::<$generics>::CONST`.
-                    res.push(TokenTree::Punct(Punct::new(':', Spacing::Joint)));
-                    res.push(TokenTree::Punct(Punct::new(':', Spacing::Alone)));
-                    res.push(TokenTree::Punct(Punct::new('<', Spacing::Alone)));
-                    res.extend(ty_generics.iter().cloned());
-                    res.push(TokenTree::Punct(Punct::new('>', Spacing::Alone)));
+        .filter(|f| is_field_structurally_pinned(f))
+        .cloned()
+        .collect::<Vec<_>>();
+    for field in &mut pinned_fields {
+        field.attrs.retain(|a| !a.path().is_ident("pin"));
+    }
+    quote! {
+        // This struct will be used for the unpin analysis. It is needed, because only structurally
+        // pinned fields are relevant whether the struct should implement `Unpin`.
+        #[allow(dead_code)] // The fields below are never used.
+        struct __Unpin #generics_with_pinlt
+        #where_token
+            #predicates
+        {
+            __phantom_pin: ::core::marker::PhantomData<fn(&'__pin ()) -> &'__pin ()>,
+            __phantom: ::core::marker::PhantomData<
+                fn(#ident #ty_generics) -> #ident #ty_generics
+            >,
+            #(#pinned_fields),*
+        }
+
+        #[doc(hidden)]
+        impl #impl_generics_with_pinlt ::core::marker::Unpin for #ident #ty_generics
+        #where_token
+            __Unpin #ty_generics_with_pinlt: ::core::marker::Unpin,
+            #predicates
+        {}
+    }
+}
+
+fn generate_drop_impl(
+    ItemStruct {
+        ident, generics, ..
+    }: &syn::ItemStruct,
+    args: Args,
+) -> TokenStream {
+    let (impl_generics, ty_generics, whr) = generics.split_for_impl();
+    let has_pinned_drop = matches!(args, Args::PinnedDrop(_));
+    // We need to disallow normal `Drop` implementation, the exact behavior depends on whether
+    // `PinnedDrop` was specified in `args`.
+    if has_pinned_drop {
+        // When `PinnedDrop` was specified we just implement `Drop` and delegate.
+        quote! {
+            impl #impl_generics ::core::ops::Drop for #ident #ty_generics
+                #whr
+            {
+                fn drop(&mut self) {
+                    // SAFETY: Since this is a destructor, `self` will not move after this function
+                    // terminates, since it is inaccessible.
+                    let pinned = unsafe { ::core::pin::Pin::new_unchecked(self) };
+                    // SAFETY: Since this is a drop function, we can create this token to call the
+                    // pinned destructor of this type.
+                    let token = unsafe { ::pin_init::__internal::OnlyCallFromDrop::new() };
+                    ::pin_init::PinnedDrop::drop(pinned, token);
                 }
-                Some(res)
             }
-            _ => None,
-        })
-        .unwrap_or_else(|| {
-            // If we did not find the name of the struct then we will use `Self` as the replacement
-            // and add a compile error to ensure it does not compile.
-            errs.extend(
-                "::core::compile_error!(\"Could not locate type name.\");"
-                    .parse::<TokenStream>()
-                    .unwrap(),
-            );
-            "Self".parse::<TokenStream>().unwrap().into_iter().collect()
-        });
-    let impl_generics = impl_generics
-        .into_iter()
-        .flat_map(|tt| replace_self_and_deny_type_defs(&struct_name, tt, &mut errs))
-        .collect::<Vec<_>>();
-    let mut rest = rest
-        .into_iter()
-        .flat_map(|tt| {
-            // We ignore top level `struct` tokens, since they would emit a compile error.
-            if matches!(&tt, TokenTree::Ident(i) if i == "struct") {
-                vec![tt]
+        }
+    } else {
+        // When no `PinnedDrop` was specified, then we have to prevent implementing drop.
+        quote! {
+            // We prevent this by creating a trait that will be implemented for all types implementing
+            // `Drop`. Additionally we will implement this trait for the struct leading to a conflict,
+            // if it also implements `Drop`
+            trait MustNotImplDrop {}
+            #[expect(drop_bounds)]
+            impl<T: ::core::ops::Drop> MustNotImplDrop for T {}
+            impl #impl_generics MustNotImplDrop for #ident #ty_generics
+                #whr
+            {}
+            // We also take care to prevent users from writing a useless `PinnedDrop` implementation.
+            // They might implement `PinnedDrop` correctly for the struct, but forget to give
+            // `PinnedDrop` as the parameter to `#[pin_data]`.
+            #[expect(non_camel_case_types)]
+            trait UselessPinnedDropImpl_you_need_to_specify_PinnedDrop {}
+            impl<T: ::pin_init::PinnedDrop>
+                UselessPinnedDropImpl_you_need_to_specify_PinnedDrop for T {}
+            impl #impl_generics
+                UselessPinnedDropImpl_you_need_to_specify_PinnedDrop for #ident #ty_generics
+                #whr
+            {}
+        }
+    }
+}
+
+fn generate_projections(
+    ItemStruct {
+        vis,
+        ident,
+        generics,
+        fields,
+        ..
+    }: &ItemStruct,
+) -> TokenStream {
+    let (og_impl_gen, og_ty_gen, _) = generics.split_for_impl();
+    let mut generics = generics.clone();
+    generics.params.insert(0, parse_quote!('__pin));
+    let (_, ty_gen, whr) = generics.split_for_impl();
+    let projection = format_ident!("{ident}Projection");
+    let this = format_ident!("this");
+
+    let (fields_decl, fields_proj) = collect_tuple(fields.iter().map(
+        |f @ Field {
+             vis,
+             ident,
+             ty,
+             attrs,
+             ..
+         }| {
+            let mut attrs = attrs.clone();
+            attrs.retain(|a| !a.path().is_ident("pin"));
+            let mut no_doc_attrs = attrs.clone();
+            no_doc_attrs.retain(|a| !a.path().is_ident("doc"));
+            let ident = ident
+                .as_ref()
+                .expect("only structs with named fields are supported");
+            if is_field_structurally_pinned(f) {
+                (
+                    quote!(
+                        #(#attrs)*
+                        #vis #ident: ::core::pin::Pin<&'__pin mut #ty>,
+                    ),
+                    quote!(
+                        #(#no_doc_attrs)*
+                        // SAFETY: this field is structurally pinned.
+                        #ident: unsafe { ::core::pin::Pin::new_unchecked(&mut #this.#ident) },
+                    ),
+                )
             } else {
-                replace_self_and_deny_type_defs(&struct_name, tt, &mut errs)
+                (
+                    quote!(
+                        #(#attrs)*
+                        #vis #ident: &'__pin mut #ty,
+                    ),
+                    quote!(
+                        #(#no_doc_attrs)*
+                        #ident: &mut #this.#ident,
+                    ),
+                )
             }
-        })
-        .collect::<Vec<_>>();
-    // This should be the body of the struct `{...}`.
-    let last = rest.pop();
-    let mut quoted = quote!(::pin_init::__pin_data! {
-        parse_input:
-        @args(#args),
-        @sig(#(#rest)*),
-        @impl_generics(#(#impl_generics)*),
-        @ty_generics(#(#ty_generics)*),
-        @decl_generics(#(#decl_generics)*),
-        @body(#last),
-    });
-    quoted.extend(errs);
-    quoted
+        },
+    ));
+    let structurally_pinned_fields_docs = fields
+        .iter()
+        .filter(|f| is_field_structurally_pinned(f))
+        .map(|Field { ident, .. }| {
+            let doc = format!(" - `{}`", ident.as_ref().expect(""));
+            quote!(#[doc = #doc])
+        });
+    let not_structurally_pinned_fields_docs = fields
+        .iter()
+        .filter(|f| !is_field_structurally_pinned(f))
+        .map(|Field { ident, .. }| {
+            let doc = format!(" - `{}`", ident.as_ref().expect(""));
+            quote!(#[doc = #doc])
+        });
+    let docs = format!(" Pin-projections of [`{ident}`]");
+    quote! {
+        #[doc = #docs]
+        #[allow(dead_code)]
+        #[doc(hidden)]
+        #vis struct #projection #generics {
+            #(#fields_decl)*
+            ___pin_phantom_data: ::core::marker::PhantomData<&'__pin mut ()>,
+        }
+
+        impl #og_impl_gen #ident #og_ty_gen
+            #whr
+        {
+            /// Pin-projects all fields of `Self`.
+            ///
+            /// These fields are structurally pinned:
+            #(#structurally_pinned_fields_docs)*
+            ///
+            /// These fields are **not** structurally pinned:
+            #(#not_structurally_pinned_fields_docs)*
+            #[inline]
+            #vis fn project<'__pin>(
+                self: ::core::pin::Pin<&'__pin mut Self>,
+            ) -> #projection #ty_gen {
+                // SAFETY: we only give access to `&mut` for fields not structurally pinned.
+                let #this = unsafe { ::core::pin::Pin::get_unchecked_mut(self) };
+                #projection {
+                    #(#fields_proj)*
+                    ___pin_phantom_data: ::core::marker::PhantomData,
+                }
+            }
+        }
+    }
 }
 
-/// Replaces `Self` with `struct_name` and errors on `enum`, `trait`, `struct` `union` and `impl`
-/// keywords.
-///
-/// The error is appended to `errs` to allow normal parsing to continue.
-fn replace_self_and_deny_type_defs(
-    struct_name: &Vec<TokenTree>,
-    tt: TokenTree,
-    errs: &mut TokenStream,
-) -> Vec<TokenTree> {
-    match tt {
-        TokenTree::Ident(ref i)
-            if i == "enum" || i == "trait" || i == "struct" || i == "union" || i == "impl" =>
+fn generate_the_pin_data(
+    ItemStruct {
+        generics,
+        fields,
+        ident,
+        vis,
+        ..
+    }: &syn::ItemStruct,
+) -> TokenStream {
+    let (impl_generics, ty_generics, whr) = generics.split_for_impl();
+
+    // For every field, we create an initializing projection function according to its projection
+    // type. If a field is structurally pinned, then it must be initialized via `PinInit`, if it is
+    // not structurally pinned, then it can be initialized via `Init`.
+    //
+    // The functions are `unsafe` to prevent accidentally calling them.
+    fn handle_field(
+        Field {
+            vis,
+            ident,
+            ty,
+            attrs,
+            ..
+        }: &Field,
+        struct_ident: &Ident,
+        pinned: bool,
+    ) -> TokenStream {
+        let mut attrs = attrs.clone();
+        attrs.retain(|a| !a.path().is_ident("pin"));
+        let ident = ident
+            .as_ref()
+            .expect("only structs with named fields are supported");
+        let project_ident = format_ident!("__project_{ident}");
+        let (init_ty, init_fn, project_ty, project_body, pin_safety) = if pinned {
+            (
+                quote!(PinInit),
+                quote!(__pinned_init),
+                quote!(::core::pin::Pin<&'__slot mut #ty>),
+                // SAFETY: this field is structurally pinned.
+                quote!(unsafe { ::core::pin::Pin::new_unchecked(slot) }),
+                quote!(
+                    #[doc = " - `slot` will not move until it is dropped, i.e. it will be pinned."]
+                ),
+            )
+        } else {
+            (
+                quote!(Init),
+                quote!(__init),
+                quote!(&'__slot mut #ty),
+                quote!(slot),
+                quote!(),
+            )
+        };
+        let slot_safety = format!(
+            " `slot` points at the field `{ident}` inside of `{struct_ident}`, which is pinned.",
+        );
+        quote! {
+            /// # Safety
+            ///
+            /// - `slot` is a valid pointer to uninitialized memory.
+            /// - the caller does not touch `slot` when `Err` is returned, they are only permitted
+            ///   to deallocate.
+            #pin_safety
+            #(#attrs)*
+            #vis unsafe fn #ident<E>(
+                self,
+                slot: *mut #ty,
+                init: impl ::pin_init::#init_ty<#ty, E>,
+            ) -> ::core::result::Result<(), E> {
+                // SAFETY: this function has the same safety requirements as the __init function
+                // called below.
+                unsafe { ::pin_init::#init_ty::#init_fn(init, slot) }
+            }
+
+            /// # Safety
+            ///
+            #[doc = #slot_safety]
+            #(#attrs)*
+            #vis unsafe fn #project_ident<'__slot>(
+                self,
+                slot: &'__slot mut #ty,
+            ) -> #project_ty {
+                #project_body
+            }
+        }
+    }
+
+    let field_accessors = fields
+        .iter()
+        .map(|f| handle_field(f, ident, is_field_structurally_pinned(f)))
+        .collect::<TokenStream>();
+    quote! {
+        // We declare this struct which will host all of the projection function for our type. It
+        // will be invariant over all generic parameters which are inherited from the struct.
+        #[doc(hidden)]
+        #vis struct __ThePinData #generics
+            #whr
         {
-            errs.extend(
-                format!(
-                    "::core::compile_error!(\"Cannot use `{i}` inside of struct definition with \
-                        `#[pin_data]`.\");"
-                )
-                .parse::<TokenStream>()
-                .unwrap()
-                .into_iter()
-                .map(|mut tok| {
-                    tok.set_span(tt.span());
-                    tok
-                }),
-            );
-            vec![tt]
-        }
-        TokenTree::Ident(i) if i == "Self" => struct_name.clone(),
-        TokenTree::Literal(_) | TokenTree::Punct(_) | TokenTree::Ident(_) => vec![tt],
-        TokenTree::Group(g) => vec![TokenTree::Group(Group::new(
-            g.delimiter(),
-            g.stream()
-                .into_iter()
-                .flat_map(|tt| replace_self_and_deny_type_defs(struct_name, tt, errs))
-                .collect(),
-        ))],
+            __phantom: ::core::marker::PhantomData<
+                fn(#ident #ty_generics) -> #ident #ty_generics
+            >,
+        }
+
+        impl #impl_generics ::core::clone::Clone for __ThePinData #ty_generics
+            #whr
+        {
+            fn clone(&self) -> Self { *self }
+        }
+
+        impl #impl_generics ::core::marker::Copy for __ThePinData #ty_generics
+            #whr
+        {}
+
+        #[allow(dead_code)] // Some functions might never be used and private.
+        #[expect(clippy::missing_safety_doc)]
+        impl #impl_generics __ThePinData #ty_generics
+            #whr
+        {
+            #field_accessors
+        }
+
+        // SAFETY: We have added the correct projection functions above to `__ThePinData` and
+        // we also use the least restrictive generics possible.
+        unsafe impl #impl_generics ::pin_init::__internal::HasPinData for #ident #ty_generics
+            #whr
+        {
+            type PinData = __ThePinData #ty_generics;
+
+            unsafe fn __pin_data() -> Self::PinData {
+                __ThePinData { __phantom: ::core::marker::PhantomData }
+            }
+        }
+
+        // SAFETY: TODO
+        unsafe impl #impl_generics ::pin_init::__internal::PinData for __ThePinData #ty_generics
+            #whr
+        {
+            type Datee = #ident #ty_generics;
+        }
+    }
+}
+
+fn strip_pin_annotations(struct_: &mut syn::ItemStruct) {
+    for field in &mut struct_.fields {
+        field.attrs.retain(|a| !a.path().is_ident("pin"));
+    }
+}
+
+struct SelfReplacer(PathSegment);
+
+impl VisitMut for SelfReplacer {
+    fn visit_path_mut(&mut self, i: &mut syn::Path) {
+        if i.is_ident("Self") {
+            let span = i.span();
+            let seg = &self.0;
+            *i = parse_quote_spanned!(span=> #seg);
+        } else {
+            syn::visit_mut::visit_path_mut(self, i);
+        }
+    }
+
+    fn visit_path_segment_mut(&mut self, seg: &mut PathSegment) {
+        if seg.ident == "Self" {
+            let span = seg.span();
+            let this = &self.0;
+            *seg = parse_quote_spanned!(span=> #this);
+        } else {
+            syn::visit_mut::visit_path_segment_mut(self, seg);
+        }
+    }
+
+    fn visit_item_mut(&mut self, _: &mut Item) {
+        // Do not descend into items, since items reset/change what `Self` refers to.
+    }
+}
+
+// replace with `.collect()` once MSRV is above 1.79
+fn collect_tuple<A, B>(iter: impl Iterator<Item = (A, B)>) -> (Vec<A>, Vec<B>) {
+    let mut res_a = vec![];
+    let mut res_b = vec![];
+    for (a, b) in iter {
+        res_a.push(a);
+        res_b.push(b);
     }
+    (res_a, res_b)
 }
diff --git a/rust/pin-init/src/macros.rs b/rust/pin-init/src/macros.rs
index b80c95612fd6..eea8adc5c7ad 100644
--- a/rust/pin-init/src/macros.rs
+++ b/rust/pin-init/src/macros.rs
@@ -503,580 +503,6 @@
 #[cfg(not(kernel))]
 pub use ::paste::paste;
 
-/// This macro first parses the struct definition such that it separates pinned and not pinned
-/// fields. Afterwards it declares the struct and implement the `PinData` trait safely.
-#[doc(hidden)]
-#[macro_export]
-macro_rules! __pin_data {
-    // Proc-macro entry point, this is supplied by the proc-macro pre-parsing.
-    (parse_input:
-        @args($($pinned_drop:ident)?),
-        @sig(
-            $(#[$($struct_attr:tt)*])*
-            $vis:vis struct $name:ident
-            $(where $($whr:tt)*)?
-        ),
-        @impl_generics($($impl_generics:tt)*),
-        @ty_generics($($ty_generics:tt)*),
-        @decl_generics($($decl_generics:tt)*),
-        @body({ $($fields:tt)* }),
-    ) => {
-        // We now use token munching to iterate through all of the fields. While doing this we
-        // identify fields marked with `#[pin]`, these fields are the 'pinned fields'. The user
-        // wants these to be structurally pinned. The rest of the fields are the
-        // 'not pinned fields'. Additionally we collect all fields, since we need them in the right
-        // order to declare the struct.
-        //
-        // In this call we also put some explaining comments for the parameters.
-        $crate::__pin_data!(find_pinned_fields:
-            // Attributes on the struct itself, these will just be propagated to be put onto the
-            // struct definition.
-            @struct_attrs($(#[$($struct_attr)*])*),
-            // The visibility of the struct.
-            @vis($vis),
-            // The name of the struct.
-            @name($name),
-            // The 'impl generics', the generics that will need to be specified on the struct inside
-            // of an `impl<$ty_generics>` block.
-            @impl_generics($($impl_generics)*),
-            // The 'ty generics', the generics that will need to be specified on the impl blocks.
-            @ty_generics($($ty_generics)*),
-            // The 'decl generics', the generics that need to be specified on the struct
-            // definition.
-            @decl_generics($($decl_generics)*),
-            // The where clause of any impl block and the declaration.
-            @where($($($whr)*)?),
-            // The remaining fields tokens that need to be processed.
-            // We add a `,` at the end to ensure correct parsing.
-            @fields_munch($($fields)* ,),
-            // The pinned fields.
-            @pinned(),
-            // The not pinned fields.
-            @not_pinned(),
-            // All fields.
-            @fields(),
-            // The accumulator containing all attributes already parsed.
-            @accum(),
-            // Contains `yes` or `` to indicate if `#[pin]` was found on the current field.
-            @is_pinned(),
-            // The proc-macro argument, this should be `PinnedDrop` or ``.
-            @pinned_drop($($pinned_drop)?),
-        );
-    };
-    (find_pinned_fields:
-        @struct_attrs($($struct_attrs:tt)*),
-        @vis($vis:vis),
-        @name($name:ident),
-        @impl_generics($($impl_generics:tt)*),
-        @ty_generics($($ty_generics:tt)*),
-        @decl_generics($($decl_generics:tt)*),
-        @where($($whr:tt)*),
-        // We found a PhantomPinned field, this should generally be pinned!
-        @fields_munch($field:ident : $($($(::)?core::)?marker::)?PhantomPinned, $($rest:tt)*),
-        @pinned($($pinned:tt)*),
-        @not_pinned($($not_pinned:tt)*),
-        @fields($($fields:tt)*),
-        @accum($($accum:tt)*),
-        // This field is not pinned.
-        @is_pinned(),
-        @pinned_drop($($pinned_drop:ident)?),
-    ) => {
-        ::core::compile_error!(concat!(
-            "The field `",
-            stringify!($field),
-            "` of type `PhantomPinned` only has an effect, if it has the `#[pin]` attribute.",
-        ));
-        $crate::__pin_data!(find_pinned_fields:
-            @struct_attrs($($struct_attrs)*),
-            @vis($vis),
-            @name($name),
-            @impl_generics($($impl_generics)*),
-            @ty_generics($($ty_generics)*),
-            @decl_generics($($decl_generics)*),
-            @where($($whr)*),
-            @fields_munch($($rest)*),
-            @pinned($($pinned)* $($accum)* $field: ::core::marker::PhantomPinned,),
-            @not_pinned($($not_pinned)*),
-            @fields($($fields)* $($accum)* $field: ::core::marker::PhantomPinned,),
-            @accum(),
-            @is_pinned(),
-            @pinned_drop($($pinned_drop)?),
-        );
-    };
-    (find_pinned_fields:
-        @struct_attrs($($struct_attrs:tt)*),
-        @vis($vis:vis),
-        @name($name:ident),
-        @impl_generics($($impl_generics:tt)*),
-        @ty_generics($($ty_generics:tt)*),
-        @decl_generics($($decl_generics:tt)*),
-        @where($($whr:tt)*),
-        // We reached the field declaration.
-        @fields_munch($field:ident : $type:ty, $($rest:tt)*),
-        @pinned($($pinned:tt)*),
-        @not_pinned($($not_pinned:tt)*),
-        @fields($($fields:tt)*),
-        @accum($($accum:tt)*),
-        // This field is pinned.
-        @is_pinned(yes),
-        @pinned_drop($($pinned_drop:ident)?),
-    ) => {
-        $crate::__pin_data!(find_pinned_fields:
-            @struct_attrs($($struct_attrs)*),
-            @vis($vis),
-            @name($name),
-            @impl_generics($($impl_generics)*),
-            @ty_generics($($ty_generics)*),
-            @decl_generics($($decl_generics)*),
-            @where($($whr)*),
-            @fields_munch($($rest)*),
-            @pinned($($pinned)* $($accum)* $field: $type,),
-            @not_pinned($($not_pinned)*),
-            @fields($($fields)* $($accum)* $field: $type,),
-            @accum(),
-            @is_pinned(),
-            @pinned_drop($($pinned_drop)?),
-        );
-    };
-    (find_pinned_fields:
-        @struct_attrs($($struct_attrs:tt)*),
-        @vis($vis:vis),
-        @name($name:ident),
-        @impl_generics($($impl_generics:tt)*),
-        @ty_generics($($ty_generics:tt)*),
-        @decl_generics($($decl_generics:tt)*),
-        @where($($whr:tt)*),
-        // We reached the field declaration.
-        @fields_munch($field:ident : $type:ty, $($rest:tt)*),
-        @pinned($($pinned:tt)*),
-        @not_pinned($($not_pinned:tt)*),
-        @fields($($fields:tt)*),
-        @accum($($accum:tt)*),
-        // This field is not pinned.
-        @is_pinned(),
-        @pinned_drop($($pinned_drop:ident)?),
-    ) => {
-        $crate::__pin_data!(find_pinned_fields:
-            @struct_attrs($($struct_attrs)*),
-            @vis($vis),
-            @name($name),
-            @impl_generics($($impl_generics)*),
-            @ty_generics($($ty_generics)*),
-            @decl_generics($($decl_generics)*),
-            @where($($whr)*),
-            @fields_munch($($rest)*),
-            @pinned($($pinned)*),
-            @not_pinned($($not_pinned)* $($accum)* $field: $type,),
-            @fields($($fields)* $($accum)* $field: $type,),
-            @accum(),
-            @is_pinned(),
-            @pinned_drop($($pinned_drop)?),
-        );
-    };
-    (find_pinned_fields:
-        @struct_attrs($($struct_attrs:tt)*),
-        @vis($vis:vis),
-        @name($name:ident),
-        @impl_generics($($impl_generics:tt)*),
-        @ty_generics($($ty_generics:tt)*),
-        @decl_generics($($decl_generics:tt)*),
-        @where($($whr:tt)*),
-        // We found the `#[pin]` attr.
-        @fields_munch(#[pin] $($rest:tt)*),
-        @pinned($($pinned:tt)*),
-        @not_pinned($($not_pinned:tt)*),
-        @fields($($fields:tt)*),
-        @accum($($accum:tt)*),
-        @is_pinned($($is_pinned:ident)?),
-        @pinned_drop($($pinned_drop:ident)?),
-    ) => {
-        $crate::__pin_data!(find_pinned_fields:
-            @struct_attrs($($struct_attrs)*),
-            @vis($vis),
-            @name($name),
-            @impl_generics($($impl_generics)*),
-            @ty_generics($($ty_generics)*),
-            @decl_generics($($decl_generics)*),
-            @where($($whr)*),
-            @fields_munch($($rest)*),
-            // We do not include `#[pin]` in the list of attributes, since it is not actually an
-            // attribute that is defined somewhere.
-            @pinned($($pinned)*),
-            @not_pinned($($not_pinned)*),
-            @fields($($fields)*),
-            @accum($($accum)*),
-            // Set this to `yes`.
-            @is_pinned(yes),
-            @pinned_drop($($pinned_drop)?),
-        );
-    };
-    (find_pinned_fields:
-        @struct_attrs($($struct_attrs:tt)*),
-        @vis($vis:vis),
-        @name($name:ident),
-        @impl_generics($($impl_generics:tt)*),
-        @ty_generics($($ty_generics:tt)*),
-        @decl_generics($($decl_generics:tt)*),
-        @where($($whr:tt)*),
-        // We reached the field declaration with visibility, for simplicity we only munch the
-        // visibility and put it into `$accum`.
-        @fields_munch($fvis:vis $field:ident $($rest:tt)*),
-        @pinned($($pinned:tt)*),
-        @not_pinned($($not_pinned:tt)*),
-        @fields($($fields:tt)*),
-        @accum($($accum:tt)*),
-        @is_pinned($($is_pinned:ident)?),
-        @pinned_drop($($pinned_drop:ident)?),
-    ) => {
-        $crate::__pin_data!(find_pinned_fields:
-            @struct_attrs($($struct_attrs)*),
-            @vis($vis),
-            @name($name),
-            @impl_generics($($impl_generics)*),
-            @ty_generics($($ty_generics)*),
-            @decl_generics($($decl_generics)*),
-            @where($($whr)*),
-            @fields_munch($field $($rest)*),
-            @pinned($($pinned)*),
-            @not_pinned($($not_pinned)*),
-            @fields($($fields)*),
-            @accum($($accum)* $fvis),
-            @is_pinned($($is_pinned)?),
-            @pinned_drop($($pinned_drop)?),
-        );
-    };
-    (find_pinned_fields:
-        @struct_attrs($($struct_attrs:tt)*),
-        @vis($vis:vis),
-        @name($name:ident),
-        @impl_generics($($impl_generics:tt)*),
-        @ty_generics($($ty_generics:tt)*),
-        @decl_generics($($decl_generics:tt)*),
-        @where($($whr:tt)*),
-        // Some other attribute, just put it into `$accum`.
-        @fields_munch(#[$($attr:tt)*] $($rest:tt)*),
-        @pinned($($pinned:tt)*),
-        @not_pinned($($not_pinned:tt)*),
-        @fields($($fields:tt)*),
-        @accum($($accum:tt)*),
-        @is_pinned($($is_pinned:ident)?),
-        @pinned_drop($($pinned_drop:ident)?),
-    ) => {
-        $crate::__pin_data!(find_pinned_fields:
-            @struct_attrs($($struct_attrs)*),
-            @vis($vis),
-            @name($name),
-            @impl_generics($($impl_generics)*),
-            @ty_generics($($ty_generics)*),
-            @decl_generics($($decl_generics)*),
-            @where($($whr)*),
-            @fields_munch($($rest)*),
-            @pinned($($pinned)*),
-            @not_pinned($($not_pinned)*),
-            @fields($($fields)*),
-            @accum($($accum)* #[$($attr)*]),
-            @is_pinned($($is_pinned)?),
-            @pinned_drop($($pinned_drop)?),
-        );
-    };
-    (find_pinned_fields:
-        @struct_attrs($($struct_attrs:tt)*),
-        @vis($vis:vis),
-        @name($name:ident),
-        @impl_generics($($impl_generics:tt)*),
-        @ty_generics($($ty_generics:tt)*),
-        @decl_generics($($decl_generics:tt)*),
-        @where($($whr:tt)*),
-        // We reached the end of the fields, plus an optional additional comma, since we added one
-        // before and the user is also allowed to put a trailing comma.
-        @fields_munch($(,)?),
-        @pinned($($pinned:tt)*),
-        @not_pinned($($not_pinned:tt)*),
-        @fields($($fields:tt)*),
-        @accum(),
-        @is_pinned(),
-        @pinned_drop($($pinned_drop:ident)?),
-    ) => {
-        // Declare the struct with all fields in the correct order.
-        $($struct_attrs)*
-        $vis struct $name <$($decl_generics)*>
-        where $($whr)*
-        {
-            $($fields)*
-        }
-
-        $crate::__pin_data!(make_pin_projections:
-            @vis($vis),
-            @name($name),
-            @impl_generics($($impl_generics)*),
-            @ty_generics($($ty_generics)*),
-            @decl_generics($($decl_generics)*),
-            @where($($whr)*),
-            @pinned($($pinned)*),
-            @not_pinned($($not_pinned)*),
-        );
-
-        // We put the rest into this const item, because it then will not be accessible to anything
-        // outside.
-        const _: () = {
-            // We declare this struct which will host all of the projection function for our type.
-            // it will be invariant over all generic parameters which are inherited from the
-            // struct.
-            $vis struct __ThePinData<$($impl_generics)*>
-            where $($whr)*
-            {
-                __phantom: ::core::marker::PhantomData<
-                    fn($name<$($ty_generics)*>) -> $name<$($ty_generics)*>
-                >,
-            }
-
-            impl<$($impl_generics)*> ::core::clone::Clone for __ThePinData<$($ty_generics)*>
-            where $($whr)*
-            {
-                fn clone(&self) -> Self { *self }
-            }
-
-            impl<$($impl_generics)*> ::core::marker::Copy for __ThePinData<$($ty_generics)*>
-            where $($whr)*
-            {}
-
-            // Make all projection functions.
-            $crate::__pin_data!(make_pin_data:
-                @pin_data(__ThePinData),
-                @impl_generics($($impl_generics)*),
-                @ty_generics($($ty_generics)*),
-                @where($($whr)*),
-                @pinned($($pinned)*),
-                @not_pinned($($not_pinned)*),
-            );
-
-            // SAFETY: We have added the correct projection functions above to `__ThePinData` and
-            // we also use the least restrictive generics possible.
-            unsafe impl<$($impl_generics)*>
-                $crate::__internal::HasPinData for $name<$($ty_generics)*>
-            where $($whr)*
-            {
-                type PinData = __ThePinData<$($ty_generics)*>;
-
-                unsafe fn __pin_data() -> Self::PinData {
-                    __ThePinData { __phantom: ::core::marker::PhantomData }
-                }
-            }
-
-            // SAFETY: TODO.
-            unsafe impl<$($impl_generics)*>
-                $crate::__internal::PinData for __ThePinData<$($ty_generics)*>
-            where $($whr)*
-            {
-                type Datee = $name<$($ty_generics)*>;
-            }
-
-            // This struct will be used for the unpin analysis. Since only structurally pinned
-            // fields are relevant whether the struct should implement `Unpin`.
-            #[allow(dead_code)]
-            struct __Unpin <'__pin, $($impl_generics)*>
-            where $($whr)*
-            {
-                __phantom_pin: ::core::marker::PhantomData<fn(&'__pin ()) -> &'__pin ()>,
-                __phantom: ::core::marker::PhantomData<
-                    fn($name<$($ty_generics)*>) -> $name<$($ty_generics)*>
-                >,
-                // Only the pinned fields.
-                $($pinned)*
-            }
-
-            #[doc(hidden)]
-            impl<'__pin, $($impl_generics)*> ::core::marker::Unpin for $name<$($ty_generics)*>
-            where
-                __Unpin<'__pin, $($ty_generics)*>: ::core::marker::Unpin,
-                $($whr)*
-            {}
-
-            // We need to disallow normal `Drop` implementation, the exact behavior depends on
-            // whether `PinnedDrop` was specified as the parameter.
-            $crate::__pin_data!(drop_prevention:
-                @name($name),
-                @impl_generics($($impl_generics)*),
-                @ty_generics($($ty_generics)*),
-                @where($($whr)*),
-                @pinned_drop($($pinned_drop)?),
-            );
-        };
-    };
-    // When no `PinnedDrop` was specified, then we have to prevent implementing drop.
-    (drop_prevention:
-        @name($name:ident),
-        @impl_generics($($impl_generics:tt)*),
-        @ty_generics($($ty_generics:tt)*),
-        @where($($whr:tt)*),
-        @pinned_drop(),
-    ) => {
-        // We prevent this by creating a trait that will be implemented for all types implementing
-        // `Drop`. Additionally we will implement this trait for the struct leading to a conflict,
-        // if it also implements `Drop`
-        trait MustNotImplDrop {}
-        #[expect(drop_bounds)]
-        impl<T: ::core::ops::Drop> MustNotImplDrop for T {}
-        impl<$($impl_generics)*> MustNotImplDrop for $name<$($ty_generics)*>
-        where $($whr)* {}
-        // We also take care to prevent users from writing a useless `PinnedDrop` implementation.
-        // They might implement `PinnedDrop` correctly for the struct, but forget to give
-        // `PinnedDrop` as the parameter to `#[pin_data]`.
-        #[expect(non_camel_case_types)]
-        trait UselessPinnedDropImpl_you_need_to_specify_PinnedDrop {}
-        impl<T: $crate::PinnedDrop>
-            UselessPinnedDropImpl_you_need_to_specify_PinnedDrop for T {}
-        impl<$($impl_generics)*>
-            UselessPinnedDropImpl_you_need_to_specify_PinnedDrop for $name<$($ty_generics)*>
-        where $($whr)* {}
-    };
-    // When `PinnedDrop` was specified we just implement `Drop` and delegate.
-    (drop_prevention:
-        @name($name:ident),
-        @impl_generics($($impl_generics:tt)*),
-        @ty_generics($($ty_generics:tt)*),
-        @where($($whr:tt)*),
-        @pinned_drop(PinnedDrop),
-    ) => {
-        impl<$($impl_generics)*> ::core::ops::Drop for $name<$($ty_generics)*>
-        where $($whr)*
-        {
-            fn drop(&mut self) {
-                // SAFETY: Since this is a destructor, `self` will not move after this function
-                // terminates, since it is inaccessible.
-                let pinned = unsafe { ::core::pin::Pin::new_unchecked(self) };
-                // SAFETY: Since this is a drop function, we can create this token to call the
-                // pinned destructor of this type.
-                let token = unsafe { $crate::__internal::OnlyCallFromDrop::new() };
-                $crate::PinnedDrop::drop(pinned, token);
-            }
-        }
-    };
-    // If some other parameter was specified, we emit a readable error.
-    (drop_prevention:
-        @name($name:ident),
-        @impl_generics($($impl_generics:tt)*),
-        @ty_generics($($ty_generics:tt)*),
-        @where($($whr:tt)*),
-        @pinned_drop($($rest:tt)*),
-    ) => {
-        compile_error!(
-            "Wrong parameters to `#[pin_data]`, expected nothing or `PinnedDrop`, got '{}'.",
-            stringify!($($rest)*),
-        );
-    };
-    (make_pin_projections:
-        @vis($vis:vis),
-        @name($name:ident),
-        @impl_generics($($impl_generics:tt)*),
-        @ty_generics($($ty_generics:tt)*),
-        @decl_generics($($decl_generics:tt)*),
-        @where($($whr:tt)*),
-        @pinned($($(#[$($p_attr:tt)*])* $pvis:vis $p_field:ident : $p_type:ty),* $(,)?),
-        @not_pinned($($(#[$($attr:tt)*])* $fvis:vis $field:ident : $type:ty),* $(,)?),
-    ) => {
-        $crate::macros::paste! {
-            #[doc(hidden)]
-            $vis struct [< $name Projection >] <'__pin, $($decl_generics)*> {
-                $($(#[$($p_attr)*])* $pvis $p_field : ::core::pin::Pin<&'__pin mut $p_type>,)*
-                $($(#[$($attr)*])* $fvis $field : &'__pin mut $type,)*
-                ___pin_phantom_data: ::core::marker::PhantomData<&'__pin mut ()>,
-            }
-
-            impl<$($impl_generics)*> $name<$($ty_generics)*>
-            where $($whr)*
-            {
-                /// Pin-projects all fields of `Self`.
-                ///
-                /// These fields are structurally pinned:
-                $(#[doc = ::core::concat!(" - `", ::core::stringify!($p_field), "`")])*
-                ///
-                /// These fields are **not** structurally pinned:
-                $(#[doc = ::core::concat!(" - `", ::core::stringify!($field), "`")])*
-                #[inline]
-                $vis fn project<'__pin>(
-                    self: ::core::pin::Pin<&'__pin mut Self>,
-                ) -> [< $name Projection >] <'__pin, $($ty_generics)*> {
-                    // SAFETY: we only give access to `&mut` for fields not structurally pinned.
-                    let this = unsafe { ::core::pin::Pin::get_unchecked_mut(self) };
-                    [< $name Projection >] {
-                        $(
-                            // SAFETY: `$p_field` is structurally pinned.
-                            $(#[$($p_attr)*])*
-                            $p_field : unsafe { ::core::pin::Pin::new_unchecked(&mut this.$p_field) },
-                        )*
-                        $(
-                            $(#[$($attr)*])*
-                            $field : &mut this.$field,
-                        )*
-                        ___pin_phantom_data: ::core::marker::PhantomData,
-                    }
-                }
-            }
-        }
-    };
-    (make_pin_data:
-        @pin_data($pin_data:ident),
-        @impl_generics($($impl_generics:tt)*),
-        @ty_generics($($ty_generics:tt)*),
-        @where($($whr:tt)*),
-        @pinned($($(#[$($p_attr:tt)*])* $pvis:vis $p_field:ident : $p_type:ty),* $(,)?),
-        @not_pinned($($(#[$($attr:tt)*])* $fvis:vis $field:ident : $type:ty),* $(,)?),
-    ) => {
-        $crate::macros::paste! {
-            // For every field, we create a projection function according to its projection type. If a
-            // field is structurally pinned, then it must be initialized via `PinInit`, if it is not
-            // structurally pinned, then it can be initialized via `Init`.
-            //
-            // The functions are `unsafe` to prevent accidentally calling them.
-            #[allow(dead_code)]
-            #[expect(clippy::missing_safety_doc)]
-            impl<$($impl_generics)*> $pin_data<$($ty_generics)*>
-            where $($whr)*
-            {
-                $(
-                    $(#[$($p_attr)*])*
-                    $pvis unsafe fn $p_field<E>(
-                        self,
-                        slot: *mut $p_type,
-                        init: impl $crate::PinInit<$p_type, E>,
-                    ) -> ::core::result::Result<(), E> {
-                        // SAFETY: TODO.
-                        unsafe { $crate::PinInit::__pinned_init(init, slot) }
-                    }
-
-                    $(#[$($p_attr)*])*
-                    $pvis unsafe fn [<__project_ $p_field>]<'__slot>(
-                        self,
-                        slot: &'__slot mut $p_type,
-                    ) -> ::core::pin::Pin<&'__slot mut $p_type> {
-                        ::core::pin::Pin::new_unchecked(slot)
-                    }
-                )*
-                $(
-                    $(#[$($attr)*])*
-                    $fvis unsafe fn $field<E>(
-                        self,
-                        slot: *mut $type,
-                        init: impl $crate::Init<$type, E>,
-                    ) -> ::core::result::Result<(), E> {
-                        // SAFETY: TODO.
-                        unsafe { $crate::Init::__init(init, slot) }
-                    }
-
-                    $(#[$($attr)*])*
-                    $fvis unsafe fn [<__project_ $field>]<'__slot>(
-                        self,
-                        slot: &'__slot mut $type,
-                    ) -> &'__slot mut $type {
-                        slot
-                    }
-                )*
-            }
-        }
-    };
-}
-
 /// The internal init macro. Do not call manually!
 ///
 /// This is called by the `{try_}{pin_}init!` macros with various inputs.
-- 
2.51.2

