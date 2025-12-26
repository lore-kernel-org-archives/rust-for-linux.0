Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E0C2FC02F
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 21:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766783321; cv=none; b=l0K0jpy74EnSUnQNMgVu6IHkMChSQApFPf8B7usyCRSftgj7VvzmU/4fp0wkFRZladm19nMaAVdn+m6cAdOgG1dXONn3ampoc/xKRxCRnruhS9SiILiI8jtbT/lpuKEqjSmeoDkAhy250VE1gHbsMAB6Xqi1zHtEuytOEeaNB5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766783321; c=relaxed/simple;
	bh=G6nHU3/yePo+JOOiZrq3c4OKAHWoFHwwlQQ1jamejvw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cPMCc5uCMCw0S+ASy+KTfJ2yoi4Dy+PbQ1tJzFzoqePd96Qp3TK5ovx/q/izidpiXHSXwNAyfRK6Jhn0MQ1mKjAGc8VGPUQv9EJKflhf+vh1T05b74JWVO715Wl4EqHoQcHsUhiNlMeiQ3pgxLeHDRjK1C/1Q0a/zcv9BmnFKh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BDCdsmdr; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BDCdsmdr"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso12952892a12.2
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 13:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766783319; x=1767388119; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8OgOKhaobVd3bgzcF9yvMkUb5KrzfgIkJG6R5fDGIIs=;
        b=BDCdsmdreFrCcgpjAPAQ+nQVFBv1ZgAfzPyxa3X3Z8cahSi3Qnn5ReDjEvAs+BUxpm
         n8lMrA63h5t9fcKVDpy+t9zpmP+GJFHH9L2OI+An8pgyf1CIg2c+u4HcL8IaBLt+lKg5
         5H6lh8quwWaIBvPUxVeE2lH/QdMVV6O9iUoPt2ZuOmqwFMW9HI/Eki/l3GU9XPgEKx4T
         xgaN1aU688/ZLHWeqaS78QBVb/2+ERoJkeJMOctKoPKlc9nEVpdffAjYwhW4CFWf93rk
         uZq17zMOsfrF9bF7t11jnhaAUz6mlXIeUX500sl5PD1P7eWIeVG7Grj63Hm1tz1HFa+p
         0NXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766783319; x=1767388119;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8OgOKhaobVd3bgzcF9yvMkUb5KrzfgIkJG6R5fDGIIs=;
        b=pRVxUOAdpKQY2nTPmX7Ck16I2+zHZA8P4OZC9c9yjaEtgg+YH5FgObzEaUWupbLhJS
         mlt5N9SEjN2cT43LPrAW6YQzT8Prl+fo16PSg7iWV4FHWg04TRo5OZkb6SFc1SotMS+E
         69LXMZQAn/w8do1dVJW6jC/EXumKrGPnvibouoes67ln++9LevqSuMmScX0MM32FOSoQ
         /9gsEe4s5weVhY4FFq95DkmE5JayD30e8tmmg1yQDeEAcbfZHbY7RTy0AImkFwLbh6g8
         URR+m5AVfS/xrk6P6SxR7Qwe+prd7lnrIKqOJQTVctLLoKtu4w+X4V1sD2LPWiMiU4Iv
         bj1Q==
X-Gm-Message-State: AOJu0YzC72HipQgWOe3v2WlYfH2Zahwaw+nh+o+qIEwzzev2o/R4gk4Y
	HEhaIxvvPq3aEEBjuuaQUHg20ekCIAhhlwyCbigA5TRsh1/468acE/2YGqgDDQVn+K/j2J+9HZe
	lOX/moa3skA==
X-Google-Smtp-Source: AGHT+IGkew6YLqhUIX2VJ9nQTbGmNt7bppNeO6lq11BM/7vT6IJSURxdGgymnf7pm+YOktaRIxwYGWCExitQ
X-Received: from dyboo7.prod.google.com ([2002:a05:7301:1e87:b0:2ac:36d5:fc65])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:ec89:b0:2ab:ca55:89c6
 with SMTP id 5a478bee46e88-2b05ec6f3e8mr18308186eec.41.1766783318777; Fri, 26
 Dec 2025 13:08:38 -0800 (PST)
Date: Fri, 26 Dec 2025 21:08:21 +0000
In-Reply-To: <20251226-transmute-v3-0-c69a81bf8621@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251226-transmute-v3-0-c69a81bf8621@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766783314; l=6182;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=G6nHU3/yePo+JOOiZrq3c4OKAHWoFHwwlQQ1jamejvw=; b=HUyuTV7HlHiaYzr7nimpLqLAeO73ucVTZFW4agihqOukLqNCofoMDXTHBJISTkiQQgd3JmjyX
 7PfM2eVowdlBPQZq8w1ZRfsgQ+f+c47+s7sLJ5PbFTc/fQB9ZbuuTp5
X-Mailer: b4 0.14.2
Message-ID: <20251226-transmute-v3-2-c69a81bf8621@google.com>
Subject: [PATCH v3 2/4] rust: transmute: Add support for deriving `AsBytes`
 and `FromBytes`
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

This provides a derive macro for `AsBytes` and `FromBytes` for structs
only. For both, it checks the respective trait on every underlying
field. For `AsBytes`, it emits a const-time padding check that will fail
the compilation if derived on a type with padding.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/macros/lib.rs       | 63 ++++++++++++++++++++++++++++++++++++++++++++++
 rust/macros/transmute.rs | 65 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 128 insertions(+)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index b38002151871a33f6b4efea70be2deb6ddad38e2..d66397942529f67697f74a908e257cacc4201d84 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -20,9 +20,14 @@
 mod kunit;
 mod module;
 mod paste;
+mod transmute;
 mod vtable;
 
 use proc_macro::TokenStream;
+use syn::{
+    parse_macro_input,
+    DeriveInput, //
+};
 
 /// Declares a kernel module.
 ///
@@ -475,3 +480,61 @@ pub fn paste(input: TokenStream) -> TokenStream {
 pub fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
     kunit::kunit_tests(attr, ts)
 }
+
+/// Implements `FromBytes` for a struct.
+///
+/// It will fail compilation if the struct you are deriving on cannot be determined to implement
+/// `FromBytes` safely. It may still fail for some types which would be safe to implement
+/// `FromBytes` for, in which case you will need to write the implementation and justification
+/// yourself.
+///
+/// Main reasons your type may be rejected:
+/// * Not a `struct`
+/// * One of the fields is not `FromBytes`
+///
+/// # Examples
+///
+/// ```
+/// #[derive(FromBytes)]
+/// #[repr(C)]
+/// struct Foo {
+///   x: u32,
+///   y: u16,
+///   z: u16,
+/// }
+/// ```
+#[proc_macro_derive(FromBytes)]
+pub fn derive_from_bytes(tokens: TokenStream) -> TokenStream {
+    let input = parse_macro_input!(tokens as DeriveInput);
+    transmute::from_bytes(input).into()
+}
+
+/// Implements `AsBytes` for a struct.
+///
+/// It will fail compilation if the struct you are deriving on cannot be determined to implement
+/// `AsBytes` safely. It may still fail for some structures which would be safe to implement
+/// `AsBytes`, in which case you will need to write the implementation and justification
+/// yourself.
+///
+/// Main reasons your type may be rejected:
+/// * Not a `struct`
+/// * One of the fields is not `AsBytes`
+/// * Your struct has generic parameters
+/// * There is padding somewhere in your struct
+///
+/// # Examples
+///
+/// ```
+/// #[derive(AsBytes)]
+/// #[repr(C)]
+/// struct Foo {
+///   x: u32,
+///   y: u16,
+///   z: u16,
+/// }
+/// ```
+#[proc_macro_derive(AsBytes)]
+pub fn derive_as_bytes(tokens: TokenStream) -> TokenStream {
+    let input = parse_macro_input!(tokens as DeriveInput);
+    transmute::as_bytes(input).into()
+}
diff --git a/rust/macros/transmute.rs b/rust/macros/transmute.rs
new file mode 100644
index 0000000000000000000000000000000000000000..56818880f8b5e3c1933a4e3361790d3c8be3238c
--- /dev/null
+++ b/rust/macros/transmute.rs
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use proc_macro2::TokenStream;
+use syn::{parse_quote, DeriveInput, Fields, Ident, ItemConst, Path, WhereClause};
+
+fn all_fields_impl(fields: &Fields, trait_: &Path) -> WhereClause {
+    let tys = fields.iter().map(|field| &field.ty);
+    // The `for<'a>` is a workaround for lacking `#![feature(trivial_bounds)]`
+    // It allows us to add conditions which are trivially false to the where clause, which means
+    // that we can write `impl`s that the compiler will determine to be irrelevant for us. For
+    // example, it allows us to put a `*const c_void: FromBytes` restriction on an automatically
+    // generated `FromBytes` implementation for a struct that has `*const c_void` as a member. The
+    // implementation will not actually provide `FromBytes` (since its requirements are not met),
+    // but it will not fail to compile.
+    parse_quote! {
+        where #(for<'a> #tys: #trait_),*
+    }
+}
+
+fn struct_padding_check(fields: &Fields, name: &Ident) -> ItemConst {
+    let tys = fields.iter().map(|field| &field.ty);
+    parse_quote! {
+        const _: () = {
+            assert!(#(core::mem::size_of::<#tys>())+* == core::mem::size_of::<#name>());
+        };
+    }
+}
+
+pub(crate) fn as_bytes(input: DeriveInput) -> TokenStream {
+    if !input.generics.params.is_empty() {
+        return quote::quote! { compile_error!("#[derive(AsBytes)] does not support generics") };
+    }
+    let syn::Data::Struct(ref ds) = &input.data else {
+        return quote::quote! { compile_error!("#[derive(AsBytes)] only supports structs") };
+    };
+    let name = input.ident;
+    let trait_ = parse_quote! { ::kernel::transmute::AsBytes };
+    let where_clause = all_fields_impl(&ds.fields, &trait_);
+    let padding_check = struct_padding_check(&ds.fields, &name);
+    quote::quote! {
+        #padding_check
+        // SAFETY: #name has no padding and all of its fields implement `AsBytes`
+        unsafe impl #trait_ for #name #where_clause {}
+    }
+}
+
+pub(crate) fn from_bytes(input: DeriveInput) -> TokenStream {
+    let syn::Data::Struct(ref ds) = &input.data else {
+        return quote::quote! { compile_error!("#[derive(FromBytes)] only supports structs") };
+    };
+    let (impl_generics, ty_generics, base_where_clause) = input.generics.split_for_impl();
+    let name = input.ident;
+    let trait_ = parse_quote! { ::kernel::transmute::FromBytes };
+    let mut where_clause = all_fields_impl(&ds.fields, &trait_);
+    if let Some(base_clause) = base_where_clause {
+        where_clause
+            .predicates
+            .extend(base_clause.predicates.clone())
+    };
+    quote::quote! {
+        // SAFETY: All fields of #name implement `FromBytes` and it is a struct, so there is no
+        // implicit discriminator.
+        unsafe impl #impl_generics #trait_ for #name #ty_generics #where_clause {}
+    }
+}

-- 
2.52.0.351.gbe84eed79e-goog

