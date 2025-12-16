Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A237126E709
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 00:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765845897; cv=none; b=f9EyjlYyHUjqaOzitYlSStmCQE6/+tu1FYRF7V9zR4CkW8Rj42xveSLDfeY2EZX28vm9BT7SDrbtJqnrvOSpGcRv+e17m1bahe2BeIOx2lDy/Q92eVxG08Dn4Autx9x5BM3L+owBqwgMnIQjWodOAKfwZQ6a1Yss75lEGdt4DhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765845897; c=relaxed/simple;
	bh=6wygOt1D76qaraHZDNszRyQ5DIBdZPIQXleSdYwh9us=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F6LLyPDsO9xkImgfLRl5wxu8J/6tvYp3P/KpuBhWZ6/qcGQ58p6IyaMv84w2ie6GPZH7NmTbMPzSaNXgq0GhhRyx5DkgWzZE/28efjRRGHEIyDb9PU6MXg6zJ6OL5mjFyEyiloYJvfARmW7mZp63dRSi0/ewKioSALPqkfFjNpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r/8spQtu; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r/8spQtu"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b993eb2701bso3945713a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 16:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765845895; x=1766450695; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfIR7uowxPfrBGm0h5/0Sac13z+XC1w8PXgcnbB/c+4=;
        b=r/8spQtu5LkJZaTKq9IiDotDFMPuUvucKRBk4/uHhAgJKknNNP3egqIQtU9ekCE4yo
         aQMiBR0m2y2FjkiCaP5w8lVv6eIC+l50+miNYv32zZmU5ku/Ai2R4UR8qmSCTZftJbxV
         KtxNX6flzbtOINHwfBL4GReHquZJxSQJbwngdGDFoZdWxNln/Z3HfG4OwPq9n/CoC5zv
         9coBS5p2wp20gYNjc6qjZb+MxgPZ18DILNVn9dJAoEYeOS+LOGYHZYHBesDs8HmRa2fM
         5kDLxQu1zgKubqi+xhNg8ajbgQ2B1f3wq/NCX1q7ELERYBiLnAWE4ZSAjDnyb2/QEy0t
         y35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765845895; x=1766450695;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfIR7uowxPfrBGm0h5/0Sac13z+XC1w8PXgcnbB/c+4=;
        b=U8+1bjv7mZDrSNm5HdJ3jT0D492TOxWzUlaoeQzcGj3i8v+PoA3X4ey6fHXfrTyCPM
         r5aN9ucGI3a0U8VP3MVoF190irz3cLyI/3Gg0OSaF0jANqGq6OsG0O2QzvPk1uqQdQNb
         aPRNfga0ueUjLnDA91e9vSrniWjiB3hJbWH6b17Ij4Rs0U2IgRQ8A+Ii0mvIlipqB+us
         69UjFY/2JPyNYw1JlkKsifK1c/PxaWYTiYgH94uOFVWG3AK1VpE57tkRNdRTSBreJ15S
         q3gvtSgvKx5nA0SvlO2RtGkdlQ84sIcvB650dBlgz8oXHhG0PWcdfIScNkYGhMcMSm8r
         gtBw==
X-Gm-Message-State: AOJu0Yz74cBFaUTWap8XsSzoQPOXZSNTgF8Dz0TIihU6BlinPRGDnTUn
	jd3Vh6QU3M93qD2N8yyXEvcFNXHmhE7xZHcOMsCtzugtLwWR8XkDiEyy50OqSKs56d6Vs6m+7F9
	Yye9Fa6oQaQ==
X-Google-Smtp-Source: AGHT+IFqSf3q193P4LBHoVV6viSmK6DVC79Cs1RUnidxl/IY+cL+SDg3bXJP2FIPBC25IfMmPtxP8JpuNH8b
X-Received: from dlkk32.prod.google.com ([2002:a05:7022:60a0:b0:11d:cf7a:5407])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6982:b0:11f:2c69:2d
 with SMTP id a92af1059eb24-11f34c2f2fbmr9887359c88.45.1765845894728; Mon, 15
 Dec 2025 16:44:54 -0800 (PST)
Date: Tue, 16 Dec 2025 00:44:42 +0000
In-Reply-To: <20251216-transmute-v2-0-b23e5277ad02@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251216-transmute-v2-0-b23e5277ad02@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765845890; l=5561;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=6wygOt1D76qaraHZDNszRyQ5DIBdZPIQXleSdYwh9us=; b=pIydZKX38osjwrZhA1nMfCFpTpxKPqd2SJF4SsLsdCdGf3IjsXuXYhZOzPebrFIKjn/FzJmv+
 AlLs3q9lkpVA8is9WxX2c98oCDi8+ct34SbR7c3BDTkBL8cyUk1WoUy
X-Mailer: b4 0.14.2
Message-ID: <20251216-transmute-v2-2-b23e5277ad02@google.com>
Subject: [PATCH v2 2/3] rust: Add support for deriving `AsBytes` and `FromBytes`
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
 rust/macros/lib.rs       | 63 ++++++++++++++++++++++++++++++++++++++++++++++++
 rust/macros/transmute.rs | 58 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+)

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
index 0000000000000000000000000000000000000000..43cf36a1334f1fed23c0e777026392f987f78d8d
--- /dev/null
+++ b/rust/macros/transmute.rs
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use proc_macro2::TokenStream;
+use syn::{parse_quote, DeriveInput, Fields, Ident, ItemConst, Path, WhereClause};
+
+fn all_fields_impl(fields: &Fields, trait_: &Path) -> WhereClause {
+    let tys = fields.iter().map(|field| &field.ty);
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
2.52.0.305.g3fc767764a-goog

