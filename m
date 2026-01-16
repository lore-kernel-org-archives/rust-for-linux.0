Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3949E3624A4;
	Fri, 16 Jan 2026 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768561025; cv=none; b=j2rnDysbUEFgDxgee21jY8m3NLm2Tm1ThgMztSTirFXLvnL4x/N2pTh/kOj5IrzSY81N6pO8GzatFQM0S7uDtdtqQ34kP9kvT2JMsw90FMH4W+hmJXEaeJkwuDm1+FuOaNc1aD7mRKI+tNMIfJMsl14d8w50Dk7tc4/7UvhNrDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768561025; c=relaxed/simple;
	bh=+ZNGZcw7QXQ4Plr6NH4Dvb5BPCU1y1cgTuX6+tv6c/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TPZzdepEV602hzaznRUF6mmn1x5sNIIPj1vKTr9EdYiF6LnT4QfDtaWisTey3xlZMNjmIx2K7b/WuRJhJtYZEoe4XR4dtU4q3jLZfkiZS/Rm2CS00zArH31TeqTJqBJChpxZjHlIAwe0lIHO/2HINCI11x1onhD14e0TwJsX4ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjXLDx+u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjXLDx+u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9068EC19422;
	Fri, 16 Jan 2026 10:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768561025;
	bh=+ZNGZcw7QXQ4Plr6NH4Dvb5BPCU1y1cgTuX6+tv6c/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hjXLDx+uOEeg1RO3zvH6267IxWurU9Ry1/ScNAeHbkI588NMegRaLXgShs/+BTX3Y
	 UVjnfVenrfslTLvA7Cnp4JDjPCTgEd/B6rKxhTJId1SRif6SFZtLklDBy1sTEMX9Oi
	 YBoVLC0dGZTGI90unQFPukligoPQAmiy7/fdAzOEejFRwXA9K9OiopvGP84nRBEtd/
	 f5Z1wboeWVbv99dVbEpgWp81ERKln02ZQn2c8Eai0vkGeCo9GB3b8ZsxhGvhSrdkkn
	 yEcpjsPBKno0clt9/ElWeREPX1GLZQD+fuM7jHyxtD+Fl60BEGvPoV9i7of3CapqAB
	 znwCxMAYDnXNQ==
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
Subject: [PATCH v4 13/15] rust: pin-init: internal: init: add escape hatch for referencing initialized fields
Date: Fri, 16 Jan 2026 11:54:28 +0100
Message-ID: <20260116105514.3794384-14-lossin@kernel.org>
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
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v4: none
Changes in v3: none
Changes in v2:
* silence clippy warning
---
 rust/pin-init/internal/src/init.rs | 75 +++++++++++++++++++++---------
 1 file changed, 52 insertions(+), 23 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index e8b93b444f7e..ed2e1462e176 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -62,6 +62,7 @@ fn ident(&self) -> Option<&Ident> {
 
 enum InitializerAttribute {
     DefaultError(DefaultErrorAttribute),
+    DisableInitializedFieldAccess,
 }
 
 struct DefaultErrorAttribute {
@@ -85,7 +86,6 @@ pub(crate) fn expand(
     let error = error.map_or_else(
         || {
             if let Some(default_error) = attrs.iter().fold(None, |acc, attr| {
-                #[expect(irrefutable_let_patterns)]
                 if let InitializerAttribute::DefaultError(DefaultErrorAttribute { ty }) = attr {
                     Some(ty.clone())
                 } else {
@@ -145,7 +145,15 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
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
@@ -228,6 +236,7 @@ fn get_init_kind(rest: Option<(Token![..], Expr)>, dcx: &mut DiagCtxt) -> InitKi
 fn init_fields(
     fields: &Punctuated<InitializerField, Token![,]>,
     pinned: bool,
+    generate_initialized_accessors: bool,
     data: &Ident,
     slot: &Ident,
 ) -> TokenStream {
@@ -263,6 +272,13 @@ fn init_fields(
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
@@ -270,37 +286,31 @@ fn init_fields(
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
@@ -309,12 +319,27 @@ fn init_fields(
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
@@ -446,6 +471,10 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
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

