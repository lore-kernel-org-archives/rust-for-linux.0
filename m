Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FFE339B30;
	Sun, 11 Jan 2026 12:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768134463; cv=none; b=Su1J8ddqnzxt6nWAKgOjRLheZ41aN/YpR+5NBVLNJUpU2dEOwB8Knl6hOGHau6NCkLR7390SnZZYMHNfsEWsSlpqEVMFbLbf8ld6pH7I7s9CtC6IzpcjwhTe+9+rkyfViMDvdq5+WPnI+UVeJnfHistK0VsuB/XKkwgmlH5CXMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768134463; c=relaxed/simple;
	bh=N/5s9AYuE+5kO4yqlD/qp1LnforDUkz9lZhYws95Cfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g5GCq4ZXcjymivFPTRK5du9zqpUUBnllf4jCwe5Vdpw83Hkj35ZMAmFzC/iH7TK7//Rerpu1F8CIrP0/74cVXPJTMP7jFjoPT9a3v/HRIqaj4ItgLo76lDQnqFJxOQn6/q4k8VyBtLH15BtCVH0/KlkSgZd+p+w1Rmrw5igWLFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPYdjtRP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPYdjtRP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019D7C19422;
	Sun, 11 Jan 2026 12:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768134463;
	bh=N/5s9AYuE+5kO4yqlD/qp1LnforDUkz9lZhYws95Cfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NPYdjtRPmkhQEeLaJHcu35EthOGf3ECf773/sCyInSpay2o06Mmkp+8QCmCTVDo9V
	 vmEFKPSm6Tn4WK99U3+b4DRgElsxvzwgbAVY2ATpYcq9qFCcAu1OxRnVF1+Bdi9yGS
	 1jkoXmv91AS9QuAyBefnTyczPc9dM9XxH3rOilPvYmjJNs0+qeBWo1VbBupsjtIMyE
	 ToS4qBhuxykeCEDXTMbmG6EzYT9ls5ZwqKdoN61Jgevt/5+xTWfgZdAqwJPiejxMJz
	 sxWTqJ2qpnDiy1asKqHLp3I+E+joJ2xN3X6Sl5IA3WexZhYjdNRAiBCRCa+sH+0Q6h
	 rFAb3eYBjJk5w==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/15] rust: pin-init: internal: init: add support for attributes on initializer fields
Date: Sun, 11 Jan 2026 13:25:10 +0100
Message-ID: <20260111122554.2662175-13-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111122554.2662175-1-lossin@kernel.org>
References: <20260111122554.2662175-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initializer fields ought to support the same attributes that are allowed
in struct initializers on fields. For example, `cfg` or lint levels such
as `expect`, `allow` etc. Add parsing support for these attributes using
syn to initializer fields and adjust the macro expansion accordingly.

Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v2:
* only attach cfg attributes to non-user controlled code for fields
---
 rust/pin-init/internal/src/init.rs | 69 ++++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 14 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 1e6f7aa1c1aa..c5e24ab1c3e0 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -25,7 +25,12 @@ struct This {
     _in_token: Token![in],
 }
 
-enum InitializerField {
+struct InitializerField {
+    attrs: Vec<Attribute>,
+    kind: InitializerKind,
+}
+
+enum InitializerKind {
     Value {
         ident: Ident,
         value: Option<(Token![:], Expr)>,
@@ -42,7 +47,7 @@ enum InitializerField {
     },
 }
 
-impl InitializerField {
+impl InitializerKind {
     fn ident(&self) -> Option<&Ident> {
         match self {
             Self::Value { ident, .. } | Self::Init { ident, .. } => Some(ident),
@@ -227,10 +232,16 @@ fn init_fields(
     slot: &Ident,
 ) -> TokenStream {
     let mut guards = vec![];
+    let mut guard_attrs = vec![];
     let mut res = TokenStream::new();
-    for field in fields {
-        let init = match field {
-            InitializerField::Value { ident, value } => {
+    for InitializerField { attrs, kind } in fields {
+        let cfgs = {
+            let mut cfgs = attrs.clone();
+            cfgs.retain(|attr| attr.path().is_ident("cfg") || attr.path().is_ident("cfg_attr"));
+            cfgs
+        };
+        let init = match kind {
+            InitializerKind::Value { ident, value } => {
                 let mut value_ident = ident.clone();
                 let value_prep = value.as_ref().map(|value| &value.1).map(|value| {
                     // Setting the span of `value_ident` to `value`'s span improves error messages
@@ -253,21 +264,24 @@ fn init_fields(
                     }
                 };
                 quote! {
+                    #(#attrs)*
                     {
                         #value_prep
                         // SAFETY: TODO
                         unsafe { #write(::core::ptr::addr_of_mut!((*#slot).#ident), #value_ident) };
                     }
+                    #(#cfgs)*
                     #[allow(unused_variables)]
                     let #ident = #accessor;
                 }
             }
-            InitializerField::Init { ident, value, .. } => {
+            InitializerKind::Init { ident, value, .. } => {
                 // Again span for better diagnostics
                 let init = format_ident!("init", span = value.span());
                 if pinned {
                     let project_ident = format_ident!("__project_{ident}");
                     quote! {
+                        #(#attrs)*
                         {
                             let #init = #value;
                             // SAFETY:
@@ -277,12 +291,14 @@ fn init_fields(
                             //   for `#ident`.
                             unsafe { #data.#ident(::core::ptr::addr_of_mut!((*#slot).#ident), #init)? };
                         }
+                        #(#cfgs)*
                         // SAFETY: TODO
                         #[allow(unused_variables)]
                         let #ident = unsafe { #data.#project_ident(&mut (*#slot).#ident) };
                     }
                 } else {
                     quote! {
+                        #(#attrs)*
                         {
                             let #init = #value;
                             // SAFETY: `slot` is valid, because we are inside of an initializer
@@ -294,20 +310,25 @@ fn init_fields(
                                 )?
                             };
                         }
+                        #(#cfgs)*
                         // SAFETY: TODO
                         #[allow(unused_variables)]
                         let #ident = unsafe { &mut (*#slot).#ident };
                     }
                 }
             }
-            InitializerField::Code { block: value, .. } => quote!(#[allow(unused_braces)] #value),
+            InitializerKind::Code { block: value, .. } => quote! {
+                #(#attrs)*
+                #[allow(unused_braces)]
+                #value
+            },
         };
         res.extend(init);
-        if let Some(ident) = field.ident() {
+        if let Some(ident) = kind.ident() {
             // `mixed_site` ensures that the guard is not accessible to the user-controlled code.
             let guard = format_ident!("__{ident}_guard", span = Span::mixed_site());
-            guards.push(guard.clone());
             res.extend(quote! {
+                #(#cfgs)*
                 // Create the drop guard:
                 //
                 // We rely on macro hygiene to make it impossible for users to access this local
@@ -319,13 +340,18 @@ fn init_fields(
                     )
                 };
             });
+            guards.push(guard);
+            guard_attrs.push(cfgs);
         }
     }
     quote! {
         #res
         // If execution reaches this point, all fields have been initialized. Therefore we can now
         // dismiss the guards by forgetting them.
-        #(::core::mem::forget(#guards);)*
+        #(
+            #(#guard_attrs)*
+            ::core::mem::forget(#guards);
+        )*
     }
 }
 
@@ -335,7 +361,10 @@ fn make_field_check(
     init_kind: InitKind,
     path: &Path,
 ) -> TokenStream {
-    let fields = fields.iter().filter_map(|f| f.ident());
+    let field_attrs = fields
+        .iter()
+        .filter_map(|f| f.kind.ident().map(|_| &f.attrs));
+    let field_name = fields.iter().filter_map(|f| f.kind.ident());
     match init_kind {
         InitKind::Normal => quote! {
             // We use unreachable code to ensure that all fields have been mentioned exactly once,
@@ -346,7 +375,8 @@ fn make_field_check(
             let _ = || unsafe {
                 ::core::ptr::write(slot, #path {
                     #(
-                        #fields: ::core::panic!(),
+                        #(#field_attrs)*
+                        #field_name: ::core::panic!(),
                     )*
                 })
             };
@@ -366,7 +396,8 @@ fn make_field_check(
                 zeroed = ::core::mem::zeroed();
                 ::core::ptr::write(slot, #path {
                     #(
-                        #fields: ::core::panic!(),
+                        #(#field_attrs)*
+                        #field_name: ::core::panic!(),
                     )*
                     ..zeroed
                 })
@@ -387,7 +418,7 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
             let lh = content.lookahead1();
             if lh.peek(End) || lh.peek(Token![..]) {
                 break;
-            } else if lh.peek(Ident) || lh.peek(Token![_]) {
+            } else if lh.peek(Ident) || lh.peek(Token![_]) || lh.peek(Token![#]) {
                 fields.push_value(content.parse()?);
                 let lh = content.lookahead1();
                 if lh.peek(End) {
@@ -449,6 +480,16 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
 }
 
 impl Parse for InitializerField {
+    fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
+        let attrs = input.call(Attribute::parse_outer)?;
+        Ok(Self {
+            attrs,
+            kind: input.parse()?,
+        })
+    }
+}
+
+impl Parse for InitializerKind {
     fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
         let lh = input.lookahead1();
         if lh.peek(Token![_]) {
-- 
2.52.0

