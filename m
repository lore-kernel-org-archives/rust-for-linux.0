Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759633FB072;
	Mon,  2 Mar 2026 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772460273; cv=none; b=tfo/IwHf0Oo4EVkDibPEDy3/vRi/d8OD1kWGWM8oUW2hEcoNYxFyAQ6irCt0FAjl7cfvzCchx0AsqcjkJrqJ+Hyp5HIW4frY/MaP9LW2gRtB+jhtci4jggfXwCKTM5x0/feffFno+Vig5SQg3e4emNtmoyPopElLDL2QGBkOfjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772460273; c=relaxed/simple;
	bh=FWvmTwbXMGmMmOMHmif6zgJqnJQlH6L3lPMOIbNWxd8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BisDyVV79CJvHYMSRYp2n/Mjmn4BqCQT3A1GrfJ+bkPt7+pjOcI/SU+QDCkxw1hOTRcHzewb+/zOJGroAJSGntL9+o/q9ESwmOWpGdbPNQKTAApKPOMmWaN/pc5IiBm3r1K0jpTJKx2Hwd0cDZF42fttMQ5850lwC843Uu3GnuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDypVqAC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDypVqAC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BE4C2BCB1;
	Mon,  2 Mar 2026 14:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772460273;
	bh=FWvmTwbXMGmMmOMHmif6zgJqnJQlH6L3lPMOIbNWxd8=;
	h=From:To:Cc:Subject:Date:From;
	b=RDypVqAC5+oWIEnPibY3eCblxU4BilDH9Ic8tsu9YHWI5tH1CohmBbFOyG6qthECy
	 u7hIZ/6OpmIBUVFjh8QHFUovlY16/NnCSRjHekezmWXXuwoBNynAAdMy5sma9oBzEn
	 EoHi1uoZiafpKrDXLiXYxKu6SWTemFg65sPOYpjP4yIXrF3cottcT52qGoyfdvPz6R
	 veNXTvTK5+y35rMzigj9LK9jM2zF6Vsf8D2COnD/LHceF/s/bAcOlgNWHxM7/OzuLB
	 sQdnhd5b4yC3xCrFkf7kUdurJWlsE2WWkMl5Xu4MjIri+3npmrZ3kQRcfZ8sYBS4rk
	 10ml5mlbg7nsQ==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: "Janne Grunau" <j@jannau.net>,
	asahi@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] rust: pin-init: internal: init: remove `#[disable_initialized_field_access]`
Date: Mon,  2 Mar 2026 15:04:14 +0100
Message-ID: <20260302140424.4097655-1-lossin@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gary noticed [1] that the initializer macros as well as the `[Pin]Init`
traits cannot support unaligned fields, since they use operations that
require aligned pointers. This means that any code using structs with
unaligned fields in pin-init is unsound.

By default, the `init!` macro generates references to initialized
fields, which makes the compiler check that those fields are aligned.
However, we added the `#[disable_initialized_field_access]` attribute to
avoid this behavior in ceca298c53f9 ("rust: pin-init: internal: init:
add escape hatch for referencing initialized fields"). Thus remove the
`#[disable_initialized_field_access]` attribute from `init!`, which is
the only safe way to create an initializer handling unaligned fields.

If support for in-place initializing structs with unaligned fields is
required in the future, we could figure out a solution. This is tracked
in [2].

Reported-by: Gary Guo <gary@garyguo.net>
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/561532-pin-init/topic/initialized.20field.20accessor.20detection/with/576210658 [1]
Link: https://github.com/Rust-for-Linux/pin-init/issues/112 [2]
Fixes: ceca298c53f9 ("rust: pin-init: internal: init: add escape hatch for referencing initialized fields")
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changelog:
* changes since v1: https://lore.kernel.org/all/20260228113713.1402110-1-lossin@kernel.org
  - improved note added to the code in patch 2
  - improved commit messages
---
This commit does not need backporting, as ceca298c53f9 is not yet in any
stable tree.

However, the unsoundness still affects two stable trees, because it was
unknowingly fixed in commit 42415d163e5d ("rust: pin-init: add
references to previously initialized fields"). Before then, packed
structs compiled without any issues with pin-init and thus all prior
kernel versions with pin-init that do not contain that commit are
affected.

We introduced pin-init in 90e53c5e70a6 ("rust: add pin-init API core"),
which was included in 6.4. The affected stable trees that are still
maintained are: 6.12 and 6.6. Note that 6.18 and 6.19 already contain
42415d163e5d, so they are unaffected.

I will prepare a separate patch series to backport 42415d163e5d to each
of the affected trees, including the second patch of this series that
documents the fact that field accessors are load-bearing for soundness.

Janne Grunau has worked around [3] this problem in the AOP audio driver
downstream, which was the reason for adding the
`#[disable_initialized_field_access]` attribute in the first place.

[3]: https://lore.kernel.org/all/20260301171222.GA22561@robin.jannau.net
---
 rust/pin-init/internal/src/init.rs | 39 ++++++------------------------
 1 file changed, 8 insertions(+), 31 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 42936f915a07..da53adc44ecf 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -62,7 +62,6 @@ fn ident(&self) -> Option<&Ident> {
 
 enum InitializerAttribute {
     DefaultError(DefaultErrorAttribute),
-    DisableInitializedFieldAccess,
 }
 
 struct DefaultErrorAttribute {
@@ -86,6 +85,7 @@ pub(crate) fn expand(
     let error = error.map_or_else(
         || {
             if let Some(default_error) = attrs.iter().fold(None, |acc, attr| {
+                #[expect(irrefutable_let_patterns)]
                 if let InitializerAttribute::DefaultError(DefaultErrorAttribute { ty }) = attr {
                     Some(ty.clone())
                 } else {
@@ -145,15 +145,7 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
     };
     // `mixed_site` ensures that the data is not accessible to the user-controlled code.
     let data = Ident::new("__data", Span::mixed_site());
-    let init_fields = init_fields(
-        &fields,
-        pinned,
-        !attrs
-            .iter()
-            .any(|attr| matches!(attr, InitializerAttribute::DisableInitializedFieldAccess)),
-        &data,
-        &slot,
-    );
+    let init_fields = init_fields(&fields, pinned, &data, &slot);
     let field_check = make_field_check(&fields, init_kind, &path);
     Ok(quote! {{
         // We do not want to allow arbitrary returns, so we declare this type as the `Ok` return
@@ -236,7 +228,6 @@ fn get_init_kind(rest: Option<(Token![..], Expr)>, dcx: &mut DiagCtxt) -> InitKi
 fn init_fields(
     fields: &Punctuated<InitializerField, Token![,]>,
     pinned: bool,
-    generate_initialized_accessors: bool,
     data: &Ident,
     slot: &Ident,
 ) -> TokenStream {
@@ -272,13 +263,6 @@ fn init_fields(
                         unsafe { &mut (*#slot).#ident }
                     }
                 };
-                let accessor = generate_initialized_accessors.then(|| {
-                    quote! {
-                        #(#cfgs)*
-                        #[allow(unused_variables)]
-                        let #ident = #accessor;
-                    }
-                });
                 quote! {
                     #(#attrs)*
                     {
@@ -286,7 +270,9 @@ fn init_fields(
                         // SAFETY: TODO
                         unsafe { #write(::core::ptr::addr_of_mut!((*#slot).#ident), #value_ident) };
                     }
-                    #accessor
+                    #(#cfgs)*
+                    #[allow(unused_variables)]
+                    let #ident = #accessor;
                 }
             }
             InitializerKind::Init { ident, value, .. } => {
@@ -326,20 +312,15 @@ fn init_fields(
                         },
                     )
                 };
-                let accessor = generate_initialized_accessors.then(|| {
-                    quote! {
-                        #(#cfgs)*
-                        #[allow(unused_variables)]
-                        let #ident = #accessor;
-                    }
-                });
                 quote! {
                     #(#attrs)*
                     {
                         let #init = #value;
                         #value_init
                     }
-                    #accessor
+                    #(#cfgs)*
+                    #[allow(unused_variables)]
+                    let #ident = #accessor;
                 }
             }
             InitializerKind::Code { block: value, .. } => quote! {
@@ -466,10 +447,6 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
                 if a.path().is_ident("default_error") {
                     a.parse_args::<DefaultErrorAttribute>()
                         .map(InitializerAttribute::DefaultError)
-                } else if a.path().is_ident("disable_initialized_field_access") {
-                    a.meta
-                        .require_path_only()
-                        .map(|_| InitializerAttribute::DisableInitializedFieldAccess)
                 } else {
                     Err(syn::Error::new_spanned(a, "unknown initializer attribute"))
                 }

base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.53.0

