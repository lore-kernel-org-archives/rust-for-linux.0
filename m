Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940A3542ED7;
	Tue, 22 Sep 2026 21:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111633; cv=none; b=QTN/b0y+d7d02lzJL8vbR0pHGgKTH1eYpmMVWY/x4kkHp2SFS8mPou3vwhLwOeLZwhOCBNC466n5floc0xbfNdWb0pBWXJfJdc1HnchfZ1Qy/32ekxSOWzpkA3nd9jQhIq9IL/wA7H2lIMbHz+91yQS3XEXJFe75F42Ht4yXP7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111633; c=relaxed/simple;
	bh=/KDKnWiDfwCqbXK2RYoR8mDP0TkwM/2rxsem1/hntIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nmow8avU+CjQoJ6kjH5nxYG5x4KL/kzaWPstT21eCyih2pzVkGoPzuWeXmeCGKyR/cqTYm1PQ5NTGUu9UXDtNi8SMZvIeNcJUsgimdvPG9ScaZvgJDzItmw7NFEE+2W1J/JnMjAvNF+SWFZxNT9oltalNzZMsfndmVDKfz846I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jj6hghCp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jj6hghCp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92AF51F000FF;
	Tue, 22 Sep 2026 21:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790111614;
	bh=gavLpKhKfRuNJpe+ULApH+WS36cM4ZQ6hskyDu0N8UE=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=Jj6hghCphdBB6FfClbn9dCVW+haSdLEONjXkoltZjpjQcyWe7jCDkVBnNyj5TGuxr
	 OQBrB4x7nnwcb7jpF8ErJlguN6eTgMqg2DnrLX28WuqjOorkT51PTVtfbXJ+0/wlMq
	 beRV/MvmqktkYbgbgJamxFYljFuTTiuBm++KImTXufmhnRSsNwniMTVhKqjfNArSVq
	 3wUfDSpbNeK6dn6NxS5X6XwVoQl0eIoJmz6oTZcuxWu010GeGxatYFDJ6rkqZUUA8v
	 zVVyn/FyGfd3K7JrAchRasMLOfB3xgVVVC7qaZuPE+6LIP8cV7AmFbfsLS0QYGkfDO
	 FXHqu6gq2DbjQ==
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
Subject: [PATCH] rust: pin-init: internal: pin_data: use HRTB to work around `trivial_bounds` for `Unpin`
Date: Tue, 22 Sep 2026 22:13:19 +0100
Message-ID: <20260922211320.1390159-1-gary@kernel.org>
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

`#[pin_data]` generates a `Unpin` implementation for the user, which
requires reasoning using field types. This is rejected by rustc as "trivial
bounds", which can only be specified using the
`#![feature(trivial_bounds)]`.

Currently we use an extra lifetime in `__Unpin` to work around this; use
HRTB to introduce a dummy lifetime can achieve the same, which the
`Zeroable` implementation already uses.

Unify the `Unpin` impl to also use the same HRTB trick that `Zeroable`
uses. This produces slightly better error message and slightly shorter
expansion.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 35 +++++++++-----------------
 rust/pin-init/src/__internal.rs        | 16 ------------
 2 files changed, 12 insertions(+), 39 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 8cd9bf139567..55c627499b35 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -5,10 +5,10 @@
 use syn::{
     parse::{End, Nothing, Parse},
     parse_quote, parse_quote_spanned,
+    punctuated::Punctuated,
     spanned::Spanned,
     visit_mut::VisitMut,
     Field, Fields, Generics, Ident, Index, Item, Member, PathSegment, Type, TypePath, Visibility,
-    WhereClause,
 };
 
 use crate::{
@@ -231,21 +231,11 @@ fn generate_unpin_impl(
     generics: &Generics,
     fields: &[FieldInfo<'_>],
 ) -> TokenStream {
-    let (_, ty_generics, _) = generics.split_for_impl();
-    let mut generics_with_pin_lt = generics.clone();
-    generics_with_pin_lt.params.insert(0, parse_quote!('__pin));
-    generics_with_pin_lt.make_where_clause();
-    let (
-        impl_generics_with_pin_lt,
-        ty_generics_with_pin_lt,
-        Some(WhereClause {
-            where_token,
-            predicates,
-        }),
-    ) = generics_with_pin_lt.split_for_impl()
-    else {
-        unreachable!()
-    };
+    let (impl_generics, ty_generics, whr) = generics.split_for_impl();
+    let predicates = whr
+        .map(|x| &x.predicates)
+        .unwrap_or(const { &Punctuated::new() });
+
     let pinned_fields = fields.iter().filter(|f| f.pinned).map(|f| {
         let ident = f.member.as_ident();
         let ty = &f.field.ty;
@@ -260,19 +250,18 @@ fn generate_unpin_impl(
             dead_code, // The fields below are never used.
             non_snake_case // The warning will be emitted on the struct definition.
         )]
-        struct __Unpin #generics_with_pin_lt
-        #where_token
-            #predicates
+        struct __Unpin #generics #whr
         {
-            __phantom_pin: ::pin_init::__internal::PhantomInvariantLifetime<'__pin>,
             __phantom: ::pin_init::__internal::PhantomInvariant<#ident #ty_generics>,
             #(#pinned_fields),*
         }
 
         #[doc(hidden)]
-        impl #impl_generics_with_pin_lt ::core::marker::Unpin for #ident #ty_generics
-        #where_token
-            __Unpin #ty_generics_with_pin_lt: ::core::marker::Unpin,
+        impl #impl_generics ::core::marker::Unpin for #ident #ty_generics
+        where
+            // the `for<'__dummy>` HRTB makes this not error without the `trivial_bounds`
+            // feature <https://github.com/rust-lang/rust/issues/48214#issuecomment-2557829956>.
+            for<'__dummy> __Unpin #ty_generics: ::core::marker::Unpin,
             #predicates
         {}
     }
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index 8e9fd18b993f..67a354fa29c4 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -42,22 +42,6 @@ pub const fn new() -> Self {
     }
 }
 
-/// Zero-sized type used to mark a lifetime as invariant.
-///
-/// This is a polyfill for the [unstable type] in the standard library of the same name.
-///
-/// [unstable type]: https://doc.rust-lang.org/nightly/std/marker/struct.PhantomInvariantLifetime.html
-#[repr(transparent)]
-#[derive(Clone, Copy, Default)]
-pub struct PhantomInvariantLifetime<'a>(PhantomInvariant<&'a ()>);
-
-impl PhantomInvariantLifetime<'_> {
-    #[inline(always)]
-    pub const fn new() -> Self {
-        Self(PhantomInvariant::new())
-    }
-}
-
 /// Token type to signify successful initialization.
 ///
 /// Can only be constructed via the unsafe [`Self::new`] function. The initializer macros use this

base-commit: dfb6a037fd586f1ffcba3b143dab58f5c88294d1
-- 
2.54.0

