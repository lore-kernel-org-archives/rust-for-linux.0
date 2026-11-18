Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012296;
	b=wGe/DHVrsdioIcs378ORR1IUxn5XZjxZnpTcsJOP/GICpoNWUcAJqc/kpv1aeU24oqWd
	 WudCME0YzeZ8I7fXiKNMQfPwCYmf/wBMVw2RsBLteyq9Tz28/9lwvFfWmD/SzqELtbz/T
	 MmddlVaxOtmg6kjMMNv9V/riy7iild7DfxfJrzuqYrn9AP2ybahPgZRr21aT6T3jtEW6i
	 1RvqDdhoIJ/AfD2h7R1n2hOYwqWzSqEwid5bdPqDB0Luj01n+h9EGLQIKhsUckF5pi/yl
	 Zr1rnTFDSXpNZW0gNrNLrri5+7HjdCtGDzsBS/o3OMgYLH0fDuu4YJuSkTxP/Kz4PhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012296;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=huGJLWAwfQ6EtRzN4SVhbQGjwNRjZ5XDdWUSljaBTMw=;
	b=gbBvZIXtMqoEDUBubYR3xv54s/nyiS7m5V+oCo4J5a8DnX4hC5fUL8V67k+hrJmmXCib
	 t4rzZOSNAIOzRddEPUl2JXiBgqX69j+I8qTskuvddpRr8JKr1XctFjxEnfHweVcxHqe5n
	 fj8k36/oxmyTKd1eZhaUxdEhUNGbOPUp3IRIN5r3Dx4fIG6goUZ5k7ZEPrVvxXVPgkbFH
	 Yylt/LO2BKgt9iNCZhuSikkKpNhlffrkKxkxZoKVkCfsN6E1nNYQwj9eynNwwAN89Jha0
	 zGcajngvi4mdFbtRBNq6Lz5ClWYpQ41NNN9AEPKEbtUWcZHr6Ffm3m44eUcMwe/G4Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SB5AgKE4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78039606A32A;
	Wed, 18 Nov 2026 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SB5AgKE4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B673D1F000C7;
	Wed, 18 Nov 2026 14:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012296;
	bh=huGJLWAwfQ6EtRzN4SVhbQGjwNRjZ5XDdWUSljaBTMw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SB5AgKE4FQWA4FoHUbDaNXq8fYmAMnGYGEuMgzcjVen/vFC2tqyT9Nmxemr4BMt5g
	 Opm6pA2bm4h5Dy0OSfPv7ZaaKVMhS5GcPT2FcFaiQVqHcuA9gfyGfYhjhwV8NGDPQL
	 0iCUzM5hzWjeTnjmrZQzhrPiH67WYT7rfc3b+olCl11p5Yj6uluSyD9d+ftf0ikPB2
	 G4WZBzpZTTe+hlJZDfH2GzLIu8hkrXth/KvQHtd+qUbYI9Ts38YV4uO/MA5O2I/3tL
	 9J7SYyM5R+EK4rACAHZfATPM5KlwmtuR3eL2R43JOKYvG33406jj7w0beRtkuIxCsY
	 ltcDhjy88TXWQ==
From: Gary Guo <gary@kernel.org>
Date: Wed, 18 Nov 2026 14:31:21 +0000
Subject: [PATCH 2/3] rust: pin-init: internal: use visibility of the most
 visible field for projection
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-dev-project-vis-v1-2-2a5f433bb516@garyguo.net>
References: <20261118-dev-project-vis-v1-0-2a5f433bb516@garyguo.net>
In-Reply-To: <20261118-dev-project-vis-v1-0-2a5f433bb516@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795012287; l=9222;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=XP2F24Z2h9dpYvLKhxv7b1zxazaPK/cl+OdjEW/7kOA=;
 b=9BNqRhFFDotT5g6z/0pVTsxWRlztfxNNyXBT5D+9y6YvSs+erk1NUVnBLbq1oQ8W0BrBDeANT
 jj34R6YaW/jBNNl5aHE+E77BUJzZKTCdnBod9ptEs0ZzFEzpN++Neu4
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=

From: Gary Guo <gary@garyguo.net>

Currently, we use the struct visibility for projection methods. This means
that if a public struct uses `#[pin_data]`, the projection methods will be
defined on them with public visibility despite the projection struct having
no publicly accessible field. This both exposes the implementation detail
of such structs, and add noise to the generated documentation.

Use the combined field visibility for this instead, where that of the most
visible field is used instead.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 35 +++++++++++++++----------
 rust/pin-init/internal/src/util.rs     | 47 +++++++++++++++++++++++++++++++++-
 2 files changed, 67 insertions(+), 15 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 08e11128d353..bcbdf33f65ae 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -13,7 +13,7 @@
     visit_mut::VisitMut,
     Attribute, Field, Fields, GenericArgument, GenericParam, Generics, Ident, Index, Item,
     ItemStruct, Lifetime, LifetimeParam, Member, Meta, PathArguments, PathSegment, Token, Type,
-    TypeParamBound, TypePath, WhereClause, WherePredicate,
+    TypeParamBound, TypePath, Visibility, WhereClause, WherePredicate,
 };
 
 use crate::{
@@ -1332,14 +1332,21 @@ fn #check_name #combined_impl_generics (long: #long_ty) -> #short_ty #whr {
 
 fn generate_projections(info: &StructInfo) -> TokenStream {
     let ItemStruct {
-        vis,
-        ident,
-        generics,
-        ..
+        ident, generics, ..
     } = &info.struct_;
     let this_lt = Lifetime::new("'__this", Span::mixed_site());
     let this_lt_generics: Generics = parse_quote!(<#this_lt>);
 
+    // Compute the least upper bound of field visibility.
+    //
+    // This will be used for generated projection methods instead of the visibility of the struct;
+    // if the struct visibility is used, the projection method will exist on public structs that
+    // use `#[pin_data]` but the caller can do nothing with it (as all fields of the projection
+    // struct will be invisible).
+    let field_vis_lub = info.fields.iter().fold(Visibility::Inherited, |accum, f| {
+        accum.semilattice_join(&f.field.vis)
+    });
+
     // Wrap in `CombinedGenerics` because it's ty generics will always output `<>`, so it can be
     // used with `for`.
     let field_lts = CombinedGenerics(vec![
@@ -1541,7 +1548,7 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
     let (projection_def, projection_init) = if info.is_tuple_struct {
         (
             quote! {
-                #vis struct __Projection #generics_with_this_lt (
+                #field_vis_lub struct __Projection #generics_with_this_lt (
                     #(#fields_decl)*
                     ::core::marker::PhantomData<&'__this mut #ident #ty_generics>,
                 ) #whr;
@@ -1556,7 +1563,7 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
     } else {
         (
             quote! {
-                #vis struct __Projection #generics_with_this_lt
+                #field_vis_lub struct __Projection #generics_with_this_lt
                     #whr
                 {
                     #(#fields_decl)*
@@ -1576,7 +1583,7 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
     let (projection_lt_def, projection_lt_init) = if info.is_tuple_struct {
         (
             quote! {
-                #vis struct #projection_lt #generics_with_this_field_lt (
+                #field_vis_lub struct #projection_lt #generics_with_this_field_lt (
                     #(#fields_decl_lt)*
                     ::core::marker::PhantomData<&'__this mut #ident #ty_generics>,
                 ) #whr;
@@ -1591,7 +1598,7 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
     } else {
         (
             quote! {
-                #vis struct #projection_lt #generics_with_this_field_lt
+                #field_vis_lub struct #projection_lt #generics_with_this_field_lt
                     #whr
                 {
                     #(#fields_decl_lt)*
@@ -1750,7 +1757,7 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
     let (projection_ref_lt_def, projection_ref_lt_init) = if info.is_tuple_struct {
         (
             quote!(
-                #vis struct #projection_ref_lt #generics_with_this_field_ref_lt(
+                #field_vis_lub struct #projection_ref_lt #generics_with_this_field_ref_lt(
                     #(#fields_ref_decl_lt)*
                     ::core::marker::PhantomData<&'__this #ident #ty_generics>,
                 ) #whr;
@@ -1765,7 +1772,7 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
     } else {
         (
             quote! {
-                #vis struct #projection_ref_lt #generics_with_this_field_ref_lt
+                #field_vis_lub struct #projection_ref_lt #generics_with_this_field_ref_lt
                     #whr
                 {
                     #(#fields_ref_decl_lt)*
@@ -1813,7 +1820,7 @@ impl #impl_generics #ident #ty_generics
             /// These fields are **not** structurally pinned:
             #(#[doc = #not_structurally_pinned_fields_docs])*
             #[inline]
-            #vis fn project<'__this>(
+            #field_vis_lub fn project<'__this>(
                 self: ::core::pin::Pin<&'__this mut Self>,
             ) -> __Projection #ty_generics_with_this_lt {
                 // SAFETY: we only give access to `&mut` for fields not structurally pinned.
@@ -1829,7 +1836,7 @@ impl #impl_generics #ident #ty_generics
             /// These fields are **not** structurally pinned:
             #(#[doc = #not_structurally_pinned_fields_docs])*
             #[inline]
-            #vis fn with_project<'__this, R>(
+            #field_vis_lub fn with_project<'__this, R>(
                 self: ::core::pin::Pin<&'__this mut Self>,
                 f: impl for #field_lt_ty_generics ::core::ops::FnOnce(
                     #projection_lt #ty_generics_with_this_field_lt
@@ -1848,7 +1855,7 @@ impl #impl_generics #ident #ty_generics
             /// These fields are **not** structurally pinned:
             #(#[doc = #not_structurally_pinned_fields_docs])*
             #[inline]
-            #vis fn with_project_ref<'__this, R>(
+            #field_vis_lub fn with_project_ref<'__this, R>(
                 self: ::core::pin::Pin<&'__this Self>,
                 f: impl for #field_lt_ty_generics ::core::ops::FnOnce(
                     #projection_ref_lt #ty_generics_with_this_field_ref_lt
diff --git a/rust/pin-init/internal/src/util.rs b/rust/pin-init/internal/src/util.rs
index 4d3331b852b4..55ac0586cc56 100644
--- a/rust/pin-init/internal/src/util.rs
+++ b/rust/pin-init/internal/src/util.rs
@@ -6,7 +6,7 @@
 use quote::{format_ident, ToTokens};
 use syn::{
     parse_quote, visit::Visit, visit_mut::VisitMut, Attribute, BoundLifetimes, GenericParam,
-    Generics, Index, Lifetime, Member, Token, Type, TypePath,
+    Generics, Index, Lifetime, Member, Token, Type, TypePath, VisRestricted, Visibility,
 };
 
 use crate::DiagCtxt;
@@ -498,3 +498,48 @@ fn visit_type_bare_fn_mut(&mut self, bare_fn: &mut syn::TypeBareFn) {
         ret
     }
 }
+
+pub(crate) trait VisibilityExt {
+    /// Returns the least upper bound of `self` and `other`.
+    ///
+    /// If the exact upper bound cannot be determined, this may return a greater visibility (more
+    /// visible).
+    fn semilattice_join(self, other: &Self) -> Visibility;
+}
+
+impl VisibilityExt for Visibility {
+    fn semilattice_join(self, other: &Self) -> Visibility {
+        match (&self, other) {
+            (Visibility::Public(_), _) | (_, Visibility::Inherited) => self,
+            (_, Visibility::Public(_)) | (Visibility::Inherited, _) => other.clone(),
+            // `pub(in some::module)` is too complex, so if we get this case just bail out and
+            // return `pub(crate)`.
+            (Visibility::Restricted(a), Visibility::Restricted(b))
+                if a.in_token.is_some() || b.in_token.is_some() =>
+            {
+                Visibility::Restricted(VisRestricted {
+                    pub_token: a.pub_token,
+                    paren_token: a.paren_token,
+                    in_token: None,
+                    path: parse_quote!(crate),
+                })
+            }
+            (Visibility::Restricted(a), Visibility::Restricted(b)) => {
+                let a = a.path.get_ident().unwrap();
+                let b = b.path.get_ident().unwrap();
+
+                if a == "crate" {
+                    self
+                } else if b == "crate" {
+                    other.clone()
+                } else if a == "super" {
+                    self
+                } else if b == "super" {
+                    other.clone()
+                } else {
+                    self
+                }
+            }
+        }
+    }
+}

-- 
2.54.0

