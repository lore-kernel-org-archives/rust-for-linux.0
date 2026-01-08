Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AC149C208;
	Thu,  8 Jan 2026 13:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880413; cv=none; b=BEmNl5frOs9S1KPlqdJOQCzjHRV0S3cp5NeNQfHw9HOXNnYRVpULksIhE97OJWi8yCNF8U8XzlnJxvi8+u0tPHZbpo/iOVnamFYeof1MVj1y8ds7/Xr/l1MHMC/6rvrgdE7FrlVtHJnGxYsgF0UgckCXxbrFWC982HVzSlexp9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880413; c=relaxed/simple;
	bh=IjOb0Bj4zYXMgsGYZv0TAuaJufPLvBMAMz0pWhAiqII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DLj7uPuAArpMHWYPlYOjBFUViv07GnNM8cTzr5f4YDCGfjre4KAyO2m/NgNIhG7P/RZfr093D+8g5AZKG4t8+cuZfCO3+jVvujtrLnRzBKnou8FJ/S6re+HHIh3F2Wwepk+wT8YZYDOAWoqiU3w4X68r2mBGcwWV2wiOXZqxYF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJNyZ4Sz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJNyZ4Sz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800BBC116C6;
	Thu,  8 Jan 2026 13:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767880412;
	bh=IjOb0Bj4zYXMgsGYZv0TAuaJufPLvBMAMz0pWhAiqII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EJNyZ4SzZSWYeTU/xVi4uCKFaI5aPYfL13v9/qsKSLK/tic+eLW9rYqPNtugHsVoV
	 1ts6XgzxTiUzqj/T5gmzg3bDS/2Wzwcv2OjaY0C/3dqyvVBc+S6IvuxQIxpTFpbw4p
	 1e3LKDboPZpEyG58dkrWnTQaY97A2bTbLXNGY6BnxORssWV/NKXkw8v/6COY+kTlyv
	 5bSNirqbLox8hbjDf4Y9PzuGSalktZyA7YESvo69/jBsoXrqPPoi2TVMM2zy7m7vcw
	 NwdK7WVY8wQaEgIibSniF+PjAzLlhWQLWDH0O+9k/jCFcUHF/2iRvrqp/RZl7/pIeB
	 TV4BqUM25QVGA==
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
Subject: [PATCH 11/12] rust: pin-init: internal: init: add support for attributes on initializer fields
Date: Thu,  8 Jan 2026 14:50:49 +0100
Message-ID: <20260108135127.3153925-12-lossin@kernel.org>
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

Initializer fields ought to support the same attributes that are allowed
in struct initializers on fields. For example, `cfg` or lint levels such
as `expect`, `allow` etc. Add parsing support for these attributes using
syn to initializer fields and adjust the macro expansion accordingly.

Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/internal/src/init.rs | 64 +++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 14 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index e14bacc88f41..c20be37e7fef 100644
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
@@ -224,10 +229,11 @@ fn init_fields(
     slot: &Ident,
 ) -> TokenStream {
     let mut guards = vec![];
+    let mut guard_attrs = vec![];
     let mut res = TokenStream::new();
-    for field in fields {
-        let init = match field {
-            InitializerField::Value { ident, value } => {
+    for InitializerField { attrs, kind } in fields {
+        let init = match kind {
+            InitializerKind::Value { ident, value } => {
                 let mut value_ident = ident.clone();
                 let value_prep = value.as_ref().map(|value| &value.1).map(|value| {
                     // Setting the span of `value_ident` to `value`'s span improves error messages
@@ -250,21 +256,24 @@ fn init_fields(
                     }
                 };
                 quote! {
+                    #(#attrs)*
                     {
                         #value_prep
                         // SAFETY: TODO
                         unsafe { #write(::core::ptr::addr_of_mut!((*#slot).#ident), #value_ident) };
                     }
+                    #(#attrs)*
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
@@ -274,12 +283,14 @@ fn init_fields(
                             //   for `#ident`.
                             unsafe { #data.#ident(::core::ptr::addr_of_mut!((*#slot).#ident), #init)? };
                         }
+                        #(#attrs)*
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
@@ -291,20 +302,25 @@ fn init_fields(
                                 )?
                             };
                         }
+                        #(#attrs)*
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
+                #(#attrs)*
                 // Create the drop guard:
                 //
                 // We rely on macro hygiene to make it impossible for users to access this local
@@ -316,13 +332,18 @@ fn init_fields(
                     )
                 };
             });
+            guards.push(guard);
+            guard_attrs.push(attrs);
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
 
@@ -332,7 +353,10 @@ fn make_field_check(
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
@@ -343,7 +367,8 @@ fn make_field_check(
             let _ = || unsafe {
                 ::core::ptr::write(slot, #path {
                     #(
-                        #fields: ::core::panic!(),
+                        #(#field_attrs)*
+                        #field_name: ::core::panic!(),
                     )*
                 })
             };
@@ -361,7 +386,8 @@ fn make_field_check(
                 zeroed = ::core::mem::zeroed();
                 ::core::ptr::write(slot, #path {
                     #(
-                        #fields: ::core::panic!(),
+                        #(#field_attrs)*
+                        #field_name: ::core::panic!(),
                     )*
                     ..zeroed
                 })
@@ -382,7 +408,7 @@ fn parse(input: syn::parse::ParseStream) -> syn::Result<Self> {
             let lh = content.lookahead1();
             if lh.peek(End) || lh.peek(Token![..]) {
                 break;
-            } else if lh.peek(Ident) || lh.peek(Token![_]) {
+            } else if lh.peek(Ident) || lh.peek(Token![_]) || lh.peek(Token![#]) {
                 fields.push_value(content.parse()?);
                 let lh = content.lookahead1();
                 if lh.peek(End) {
@@ -448,6 +474,16 @@ fn parse(input: syn::parse::ParseStream) -> syn::Result<Self> {
 }
 
 impl Parse for InitializerField {
+    fn parse(input: syn::parse::ParseStream) -> syn::Result<Self> {
+        let attrs = input.call(Attribute::parse_outer)?;
+        Ok(Self {
+            attrs,
+            kind: input.parse()?,
+        })
+    }
+}
+
+impl Parse for InitializerKind {
     fn parse(input: syn::parse::ParseStream) -> syn::Result<Self> {
         let lh = input.lookahead1();
         if lh.peek(Token![_]) {
-- 
2.51.2

