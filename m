Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1462F39D7;
	Wed, 14 Jan 2026 18:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768414867; cv=none; b=dXVkD+JLOJ3w/ojNFEENYlq3U7w8PAVlH/nJCyd4pMtxJwB0A4k9MCxfkqmkPV2eVOv1eXsY0FU2dItsPc63mMLpbeI/k/GA33F4lQe3/BYHUUbq4PAAPBjpWPL9ma0Co0L8NW8jaGzBnNCf19csTWr1gLU83FEeZabig3fozxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768414867; c=relaxed/simple;
	bh=zg49DIsZb4lDUqOOALIeYuMxvDONFIdQWYQlm198Ajk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sEbIOh0kDoICo2mKTkhf2TMegvZ/w67iS9Egn2zLeTjDDqsjj+k1GvO2B2Nbq2lmztJBrCc9ZExpsuklqN3d8mBLuxInjPkGAKrQEnfW8BhvytV4zrNMVCmpR0OsHs4Cg2YMq08CDQyPByNz9jREtULZ9/h1R/TiZr5NY/y3qKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jphK5+lV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jphK5+lV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4547C19422;
	Wed, 14 Jan 2026 18:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768414867;
	bh=zg49DIsZb4lDUqOOALIeYuMxvDONFIdQWYQlm198Ajk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jphK5+lVwVHYc3TpeJzdYDqaSCO48Qv0zrQ+FQD0qtGQQsbFWY16YKbTlS1XEv55w
	 33dVZE+dI/NmJfgaNp65xbux18OiBpyibb7rOmLPW5Lo0ZYW5NIr3ldnhaiY+K05Jx
	 o4v9UiczAyDi6OvTEymPZf8fxMOxF1Vih80fLk7VSF3vp1cgudrUQoJypEDQc3Jbtt
	 f4Ih3aVYazdwmDakkXCLJm4DIGAoHQL5fsxYY9mnl4vZFPlUFwVeyGu1q48ojJCF7C
	 C5WqP0uOviuqjuIiMb+oBUwfPayvvuhae9emBeigSC3KdKWnoLBkAbmQX4HnL7TTBX
	 tk1t/fi/Kc7Jw==
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
Cc: Janne Grunau <j@jannau.net>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/15] rust: pin-init: internal: init: add escape hatch for referencing initialized fields
Date: Wed, 14 Jan 2026 19:18:48 +0100
Message-ID: <20260114181934.1782470-14-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114181934.1782470-1-lossin@kernel.org>
References: <20260114181934.1782470-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initializer macro emits mutable references for already initialized
fields, which allows modifying or accessing them later in code blocks or
when initializing other fields. This behavior results in compiler errors
when combining with packed structs, since those do not permit creating
references to misaligned fields. For example:

    #[repr(C, packed)]
    struct Foo {
        a: i8,
        b: i32,
    }

    fn main() {
        let _ = init!(Foo { a: -42, b: 42 });
    }

This will lead to an error like this:

    error[E0793]: reference to field of packed struct is unaligned
      --> tests/ui/compile-fail/init/packed_struct.rs:10:13
       |
    10 |     let _ = init!(Foo { a: -42, b: 42 });
       |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
       |
       = note: this struct is 1-byte aligned, but the type of this field may require higher alignment
       = note: creating a misaligned reference is undefined behavior (even if that reference is never dereferenced)
       = help: copy the field contents to a local variable, or replace the reference with a raw pointer and use `read_unaligned`/`write_unaligned` (loads and stores via `*p` must be properly aligned even when using raw pointers)
       = note: this error originates in the macro `init` (in Nightly builds, run with -Z macro-backtrace for more info)

This was requested by Janne Grunau [1] and will most certainly be used
by the kernel when we eventually end up with trying to initialize packed
structs.

Thus add an initializer attribute `#[disable_initialized_field_access]`
that does what the name suggests: do not generate references to already
initialized fields.

There is space for future work: add yet another attribute which can be
applied on fields of initializers that ask for said field to be made
accessible. We can add that when the need arises.

Requested-by: Janne Grunau <j@jannau.net>
Link: https://lore.kernel.org/all/20251206170214.GE1097212@robin.jannau.net [1]
Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v3: none
Changes in v2:
* silence clippy warning
---
 rust/pin-init/internal/src/init.rs | 76 +++++++++++++++++++++---------
 1 file changed, 53 insertions(+), 23 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 0eb21ed9c8bc..523741e62bd7 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -60,8 +60,10 @@ fn ident(&self) -> Option<&Ident> {
     }
 }
 
+#[expect(clippy::large_enum_variant)]
 enum InitializerAttribute {
     DefaultError(DefaultErrorAttribute),
+    DisableInitializedFieldAccess,
 }
 
 struct DefaultErrorAttribute {
@@ -85,7 +87,6 @@ pub(crate) fn expand(
     let error = error.map_or_else(
         || {
             if let Some(default_error) = attrs.iter().fold(None, |acc, attr| {
-                #[expect(irrefutable_let_patterns)]
                 if let InitializerAttribute::DefaultError(DefaultErrorAttribute { ty }) = attr {
                     Some(ty.clone())
                 } else {
@@ -145,7 +146,15 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
     };
     // `mixed_site` ensures that the data is not accessible to the user-controlled code.
     let data = Ident::new("__data", Span::mixed_site());
-    let init_fields = init_fields(&fields, pinned, &data, &slot);
+    let init_fields = init_fields(
+        &fields,
+        pinned,
+        !attrs
+            .iter()
+            .any(|attr| matches!(attr, InitializerAttribute::DisableInitializedFieldAccess)),
+        &data,
+        &slot,
+    );
     let field_check = make_field_check(&fields, init_kind, &path);
     Ok(quote! {{
         // We do not want to allow arbitrary returns, so we declare this type as the `Ok` return
@@ -228,6 +237,7 @@ fn get_init_kind(rest: Option<(Token![..], Expr)>, dcx: &mut DiagCtxt) -> InitKi
 fn init_fields(
     fields: &Punctuated<InitializerField, Token![,]>,
     pinned: bool,
+    generate_initialized_accessors: bool,
     data: &Ident,
     slot: &Ident,
 ) -> TokenStream {
@@ -263,6 +273,13 @@ fn init_fields(
                         unsafe { &mut (*#slot).#ident }
                     }
                 };
+                let accessor = generate_initialized_accessors.then(|| {
+                    quote! {
+                        #(#cfgs)*
+                        #[allow(unused_variables)]
+                        let #ident = #accessor;
+                    }
+                });
                 quote! {
                     #(#attrs)*
                     {
@@ -270,37 +287,31 @@ fn init_fields(
                         // SAFETY: TODO
                         unsafe { #write(::core::ptr::addr_of_mut!((*#slot).#ident), #value_ident) };
                     }
-                    #(#cfgs)*
-                    #[allow(unused_variables)]
-                    let #ident = #accessor;
+                    #accessor
                 }
             }
             InitializerKind::Init { ident, value, .. } => {
                 // Again span for better diagnostics
                 let init = format_ident!("init", span = value.span());
-                if pinned {
+                let (value_init, accessor) = if pinned {
                     let project_ident = format_ident!("__project_{ident}");
-                    quote! {
-                        #(#attrs)*
-                        {
-                            let #init = #value;
+                    (
+                        quote! {
                             // SAFETY:
                             // - `slot` is valid, because we are inside of an initializer closure, we
                             //   return when an error/panic occurs.
                             // - We also use `#data` to require the correct trait (`Init` or `PinInit`)
                             //   for `#ident`.
                             unsafe { #data.#ident(::core::ptr::addr_of_mut!((*#slot).#ident), #init)? };
-                        }
-                        #(#cfgs)*
-                        // SAFETY: TODO
-                        #[allow(unused_variables)]
-                        let #ident = unsafe { #data.#project_ident(&mut (*#slot).#ident) };
-                    }
+                        },
+                        quote! {
+                            // SAFETY: TODO
+                            unsafe { #data.#project_ident(&mut (*#slot).#ident) }
+                        },
+                    )
                 } else {
-                    quote! {
-                        #(#attrs)*
-                        {
-                            let #init = #value;
+                    (
+                        quote! {
                             // SAFETY: `slot` is valid, because we are inside of an initializer
                             // closure, we return when an error/panic occurs.
                             unsafe {
@@ -309,12 +320,27 @@ fn init_fields(
                                     ::core::ptr::addr_of_mut!((*#slot).#ident),
                                 )?
                             };
-                        }
+                        },
+                        quote! {
+                            // SAFETY: TODO
+                            unsafe { &mut (*#slot).#ident }
+                        },
+                    )
+                };
+                let accessor = generate_initialized_accessors.then(|| {
+                    quote! {
                         #(#cfgs)*
-                        // SAFETY: TODO
                         #[allow(unused_variables)]
-                        let #ident = unsafe { &mut (*#slot).#ident };
+                        let #ident = #accessor;
+                    }
+                });
+                quote! {
+                    #(#attrs)*
+                    {
+                        let #init = #value;
+                        #value_init
                     }
+                    #accessor
                 }
             }
             InitializerKind::Code { block: value, .. } => quote! {
@@ -446,6 +472,10 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
                 if a.path().is_ident("default_error") {
                     a.parse_args::<DefaultErrorAttribute>()
                         .map(InitializerAttribute::DefaultError)
+                } else if a.path().is_ident("disable_initialized_field_access") {
+                    a.meta
+                        .require_path_only()
+                        .map(|_| InitializerAttribute::DisableInitializedFieldAccess)
                 } else {
                     Err(syn::Error::new_spanned(a, "unknown initializer attribute"))
                 }
-- 
2.52.0

