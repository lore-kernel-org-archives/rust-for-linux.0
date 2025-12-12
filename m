Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35C63101DF
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 23:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765582956; cv=none; b=QYB3yuQpNDhcJ72sqCeo8SWhqBykpMwMcBTHjn8P0HTqzBWtCx3tptoK854TSjXeSBCFuTvKx/wo/u9bqqOw5/ZDHd9gjtqCO5G0H1VpID/6lGMIsvdpo+kDY0j/YuRLY2leVOeC1hdy44uauc8Xh2/ojpPc3Mj/UhnxU0W6BQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765582956; c=relaxed/simple;
	bh=5KnwVG3yDzu2d+NIcIUYmz9FUTmRn7r0evtR1ztUoak=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VBQI1rFSrzWoSetOQotcFyjGcUpXhY3QCeiSicZWB6OQQr5uiwI028OFqBwdjkWKU+EhOammWLgdmD0SQkRbQe8g+A/yESSjv3UgCouumY5VAQJ39fWpwwZ60w+AL0X6kHmpcXNtPojqo7woCz4nJC/Q4T3m3QfkHauiNyJb6xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dNxlS0Kw; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dNxlS0Kw"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-29f26fc6476so17402335ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 15:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765582954; x=1766187754; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IdhN8tl/FUHqLxDThvV9fKvIGwQC9dcDXu1W6Fov51Y=;
        b=dNxlS0KwApZ0LiBJ0BqbUde4cY52m7Nt7InzFHjFwxAx7XzmNPphVjEN9NWluVU7C+
         Kjiq4TiZd7Hc8g9gl3mPBxfqpbt3lZacYmLkcntrrsPKTcWbyOAab0eC5EU0i8+MapzG
         wbhiJpyXvU6mXUEbLsWF9eVREy1cOyZRpsMa0Gk3NBrGcXULtE54IXx/FpL2s7HqJBoU
         Vpatt/POmYjY3H5IutDIBnAvsRYRbqO65b1ED0ssf58V8kEvxs4bo4ZwoHyiJXKtXgmg
         F7YRRfWn/l6iWehXI+vl89F5ad0/9R+2pZkZjQcjzk+H3AvhEcLAmF8yuB687HFGsqJN
         cMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765582954; x=1766187754;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IdhN8tl/FUHqLxDThvV9fKvIGwQC9dcDXu1W6Fov51Y=;
        b=hnwjQiCnDkVELKrtHN9yy4MdQXb3he5PlR5BzrjrCjeEId7CIgEuoxL1MJyQ5i3yQu
         XXvzZEEVyUrEv6rs+aTloWjBmKj8v7rW7PZ7nwRfzhXa1oZ5P8Lz14rLBj8YBCNN3sbc
         mlZ70V2/8AX4Mr2KGlSsLCZe3Ve0ydL0FZpNKMCt4Hfw2EfuPoE4+8/MaabOsM5KdAF9
         MPB2qkMlxSmrYBYnHqWdioOIZabnIKzLqs4l/HdjrgPuWfiv4PwAxjXcfnXsRH26Icza
         GIo7LHvusJ6SfUq4mahmDcfbcDaKwo8+fm17dfwc9W6e6PR36mv3OYBG2fqQdtYeacWY
         u7/g==
X-Gm-Message-State: AOJu0YzNgVvmjmM1wwHzBIIjRHvZKKQ4bNzP3PlK+bmNoGLJJ2hifyPX
	haLr4eE80/Akv2rj4rVADcWi18RjWSZ5afmw+6dBezI/I9NTAzs+mFeCxhsBsprGRJtAZn7Bure
	/rdiP6ZPW9A==
X-Google-Smtp-Source: AGHT+IGmQdUDYkGnRhcpp7ks0v//jFQLLsh2PFEFgAg5ntuOCNFgOHrmVuMP4ABSFQHvEGG0zZE0dtj5wijX
X-Received: from dlf36.prod.google.com ([2002:a05:7022:424:b0:119:9f33:34ae])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2808:b0:11c:b3ae:c9f1
 with SMTP id a92af1059eb24-11f349a1911mr3039236c88.1.1765582953981; Fri, 12
 Dec 2025 15:42:33 -0800 (PST)
Date: Fri, 12 Dec 2025 23:42:20 +0000
In-Reply-To: <20251212-transmute-v1-0-9b28e06c6508@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251212-transmute-v1-0-9b28e06c6508@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765582949; l=5543;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=5KnwVG3yDzu2d+NIcIUYmz9FUTmRn7r0evtR1ztUoak=; b=zSqHsL8ItXbCK6J8BJfPfwJkDbLsqOLUfuQVpUjl2Wrdoc+74dBO/mvC3dwtdkm3qOzRo0Tyq
 4qdyczQvWzlAksk3URu8bLZ6rKmBZCkZlrHKxkMs/OazzZcuRCSWHWc
X-Mailer: b4 0.14.2
Message-ID: <20251212-transmute-v1-2-9b28e06c6508@google.com>
Subject: [PATCH 2/3] rust: Add support for deriving `AsBytes` and `FromBytes`
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
 rust/macros/lib.rs       | 60 ++++++++++++++++++++++++++++++++++++++++++++++++
 rust/macros/transmute.rs | 58 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index b38002151871a33f6b4efea70be2deb6ddad38e2..cec8bd3a742b3f6b3680c4286f73c8fa550a58a0 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -20,9 +20,11 @@
 mod kunit;
 mod module;
 mod paste;
+mod transmute;
 mod vtable;
 
 use proc_macro::TokenStream;
+use syn::{parse_macro_input, DeriveInput};
 
 /// Declares a kernel module.
 ///
@@ -475,3 +477,61 @@ pub fn paste(input: TokenStream) -> TokenStream {
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

