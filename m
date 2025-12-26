Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085CC30EF9A
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 21:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766783326; cv=none; b=d1sCtlutwrrycW/xOCWYTnavFYPGc1RHV+yHkgpNFx5fVVt3u18aDUjfJggRdhTK6yn9BMtxeSwaXJC0PFlGK7wtZDdbmRFDYJ2l4XkFNcyylPL3ECo+hqncppUj7O0Frssp02h4ycN1TkzP6JhrZaFGwHQk7Y05AzMih5rCIkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766783326; c=relaxed/simple;
	bh=qHhaP61mOajwYz1JwneBoVLmywYgSBLmUzjXBnzFvV8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=P8MxE5PZpeZ1Nmv5DlTa7LFkuOqq26unSDlOWPrncYOjm1AYnt1dI5Fj8YWMawpeFpomMvPreRaCkz2BDmVypmX2IAGYFGUUP3ohpnvvg6VMU+rJITM1GAM60mWGjsZm/sEG1SEJ7o4stkJbU/ZpOTGS2A7sTGtuRv1NCKmdKDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QZMCrx9h; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QZMCrx9h"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-29f177f4d02so174533645ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 13:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766783322; x=1767388122; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=d7mTBTyMaS+wDpWH5NUbweun10KVW7XKOhqDwPXW//Q=;
        b=QZMCrx9h+KxCWk/tCdd/zJzoi2kIqgmS0lXse65pTaLMdDAeuBgXYD7qhn9/hE9C9m
         RdYKESAY6BXV3hb5iYkqgPH0LkKRtzN2SSD1aCvrEKFFoCqn12d0Sg/xcR7fxy6Uc7xC
         USgh2OGcuSrkypZ6Tw6ftZI+u3teo6FQF72CUkZcYhAI/BKd2OVKIa4SonY8xW0eCV7z
         MfAky2miWF5V/3aWLnBDrM9gfv0985LdCgEgnrAEh83gjU0yfcaikrg/+34BAJeKX7Ek
         0N3NAIASSTskfo/5c/KZINy6QQg9+kNTJ1wJ2FJk+Io8D37oXrTYSTsJ5+39UE194son
         DeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766783322; x=1767388122;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d7mTBTyMaS+wDpWH5NUbweun10KVW7XKOhqDwPXW//Q=;
        b=pjMyPshJQ5O8L6OOQXMWAZDIEsW8tROBDHE3iaWJbPc42Jj0x5RJDZM5fU4WcnmRqE
         g1/+w2ha508RsxQFpWFiuot+zrrIICHAOqDxbzp84PCg8d6FTwrtD9hpWEZ90xbolMfI
         JS12tIeE8zPTCxewOQlkc9eABL1G1lhqIYrVCQU1uzjyEPVgPPrvFF1c9Yq+sUDIQdFr
         RoIkPTEpZobXozbgUDkFuCIKEvz4TRjHZJh4drCY+owPCVTT+wJq3FEFNZLweM/cvN79
         V1e9gPIPD61lJnaDDcxyIQq3z3w6XmsWQvY8o85SYtrStWHwP7AXISqX6kKIOFN3Ks+p
         9AhA==
X-Gm-Message-State: AOJu0Yzx8zs7BEoSR5KG859sxMS/NgjSUdgL96aYkL2BPJ95NXul2HJI
	TyBtykNW76Ayagg3dHlOiL0sOComWaEIJDIMGIHKZAElPWO+qyVV2tERueWlLGltX4MTIpo2Is1
	U7+ecIR1tqg==
X-Google-Smtp-Source: AGHT+IGvGXpfjBwZ/r6mO5fSFGZHXr9hj2BRGllitYl1BOk6ELJoP+vvvf04ARqEjIkV1Vb4FuiYpGjACIe0
X-Received: from dlbdx18.prod.google.com ([2002:a05:7022:e12:b0:11a:44f1:daa3])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:220f:b0:11a:3a1c:6c5c
 with SMTP id a92af1059eb24-121721ad442mr22259846c88.3.1766783322103; Fri, 26
 Dec 2025 13:08:42 -0800 (PST)
Date: Fri, 26 Dec 2025 21:08:23 +0000
In-Reply-To: <20251226-transmute-v3-0-c69a81bf8621@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251226-transmute-v3-0-c69a81bf8621@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766783314; l=8180;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=qHhaP61mOajwYz1JwneBoVLmywYgSBLmUzjXBnzFvV8=; b=NRmsJpRDFsVW4ZJALmYPzoGckv/9UAZVtWT9VyjGNFdHigQnABZfSYQjOAKrKPv664fJYhJ6e
 nauyPoDA387CAY2pWPbD8AOw6RYDi5TsJwbsvGqo2I5GLMd5blGsA6x
X-Mailer: b4 0.14.2
Message-ID: <20251226-transmute-v3-4-c69a81bf8621@google.com>
Subject: [PATCH v3 4/4] rust: transmute: Support deriving AsBytes/FromBytes on
 bindgen types
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Provide an internal macro pair, hidden from documentation,
`FromBytesFfi` and `AsBytesFfi` which target the `ffi` crate as the
definition site of the trait rather than the `kernel` crate.

Use `FromBytesFfi` automatically on everything that might support it in
bindings/uapi output.

Use `AsBytesFfi` on one sample struct that supports it in bindings/uapi
output. While it is safe to add this to any type, adding it to a type
with padding will result in a compilation failure, so for now only add
it to a single sample type.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/Makefile            |  8 ++++++--
 rust/bindgen_parameters  |  8 ++++++++
 rust/bindings/lib.rs     |  4 ++++
 rust/macros/lib.rs       | 24 ++++++++++++++++++++++--
 rust/macros/transmute.rs | 12 +++++++-----
 rust/uapi/lib.rs         |  4 ++++
 6 files changed, 51 insertions(+), 9 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5c2cb78f7c258aa87d8128593159be1f5945252f..178aa3036c4acba1c4c266196912da2d60fe0d5f 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -660,19 +660,23 @@ $(obj)/ffi.o: private skip_gendwarfksyms = 1
 $(obj)/ffi.o: $(src)/ffi/lib.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
-$(obj)/bindings.o: private rustc_target_flags = --extern ffi --extern pin_init
+$(obj)/bindings.o: private rustc_target_flags = --extern ffi --extern pin_init \
+	--extern macros
 $(obj)/bindings.o: $(src)/bindings/lib.rs \
     $(obj)/ffi.o \
     $(obj)/pin_init.o \
+    $(obj)/$(libmacros_name) \
     $(obj)/bindings/bindings_generated.rs \
     $(obj)/bindings/bindings_helpers_generated.rs FORCE
 	+$(call if_changed_rule,rustc_library)
 
-$(obj)/uapi.o: private rustc_target_flags = --extern ffi --extern pin_init
+$(obj)/uapi.o: private rustc_target_flags = --extern ffi --extern pin_init \
+	--extern macros
 $(obj)/uapi.o: private skip_gendwarfksyms = 1
 $(obj)/uapi.o: $(src)/uapi/lib.rs \
     $(obj)/ffi.o \
     $(obj)/pin_init.o \
+    $(obj)/$(libmacros_name) \
     $(obj)/uapi/uapi_generated.rs FORCE
 	+$(call if_changed_rule,rustc_library)
 
diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index fd2fd1c3cb9a51ea46fcd721907783b457aa1378..d56343ca03979e345f8adb7eb8fd7f2b9d4be6ee 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -64,3 +64,11 @@
 # Structs should implement `Zeroable` when all of their fields do.
 --with-derive-custom-struct .*=MaybeZeroable
 --with-derive-custom-union .*=MaybeZeroable
+
+# Every C struct can try to derive FromBytes. If they have unmet requirements,
+# the impl will just be a no-op due to the where clause.
+--with-derive-custom-struct .*=FromBytesFfi
+
+# We can't auto-derive AsBytes, as we need a const-time check to see if there
+# is padding involved. Add it explicitly when you expect no padding.
+--with-derive-custom-struct cpumask=AsBytesFfi
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 0c57cf9b4004f176997c59ecc58a9a9ac76163d9..c29312fca1b01b707bb11b05d446d44480a4b81f 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -31,6 +31,10 @@
 #[allow(clippy::undocumented_unsafe_blocks)]
 #[cfg_attr(CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES, allow(unnecessary_transmutes))]
 mod bindings_raw {
+    use macros::{
+        AsBytesFfi,
+        FromBytesFfi, //
+    };
     use pin_init::{MaybeZeroable, Zeroable};
 
     // Manual definition for blocklisted types.
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index d66397942529f67697f74a908e257cacc4201d84..bde94c2a8ddf708872bcd56a4713784b5ccdf04e 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -506,7 +506,7 @@ pub fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
 #[proc_macro_derive(FromBytes)]
 pub fn derive_from_bytes(tokens: TokenStream) -> TokenStream {
     let input = parse_macro_input!(tokens as DeriveInput);
-    transmute::from_bytes(input).into()
+    transmute::from_bytes("kernel", input).into()
 }
 
 /// Implements `AsBytes` for a struct.
@@ -536,5 +536,25 @@ pub fn derive_from_bytes(tokens: TokenStream) -> TokenStream {
 #[proc_macro_derive(AsBytes)]
 pub fn derive_as_bytes(tokens: TokenStream) -> TokenStream {
     let input = parse_macro_input!(tokens as DeriveInput);
-    transmute::as_bytes(input).into()
+    transmute::as_bytes("kernel", input).into()
+}
+
+#[doc(hidden)]
+#[proc_macro_derive(FromBytesFfi)]
+/// This is equivalent to `FromBytes`, but uses the `ffi` crate as the trait definition site
+/// instead of `kernel`. This is intended for use inside `bindings`. Everyone else can refer to the
+/// trait through `kernel`.
+pub fn derive_from_bytes_trait(tokens: TokenStream) -> TokenStream {
+    let input = parse_macro_input!(tokens as DeriveInput);
+    transmute::from_bytes("ffi", input).into()
+}
+
+#[doc(hidden)]
+#[proc_macro_derive(AsBytesFfi)]
+/// This is equivalent to `AsBytes`, but uses the `ffi` crate as the trait definition site
+/// instead of `kernel`. This is intended for use inside `bindings`. Everyone else can refer to the
+/// trait through `kernel`.
+pub fn derive_as_bytes_trait(tokens: TokenStream) -> TokenStream {
+    let input = parse_macro_input!(tokens as DeriveInput);
+    transmute::as_bytes("ffi", input).into()
 }
diff --git a/rust/macros/transmute.rs b/rust/macros/transmute.rs
index 56818880f8b5e3c1933a4e3361790d3c8be3238c..a62c9cb581e2fc1b4b141fc4bc75550bda0618ba 100644
--- a/rust/macros/transmute.rs
+++ b/rust/macros/transmute.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use proc_macro2::TokenStream;
+use proc_macro2::{Span, TokenStream};
 use syn::{parse_quote, DeriveInput, Fields, Ident, ItemConst, Path, WhereClause};
 
 fn all_fields_impl(fields: &Fields, trait_: &Path) -> WhereClause {
@@ -26,7 +26,8 @@ fn struct_padding_check(fields: &Fields, name: &Ident) -> ItemConst {
     }
 }
 
-pub(crate) fn as_bytes(input: DeriveInput) -> TokenStream {
+pub(crate) fn as_bytes(crate_: &str, input: DeriveInput) -> TokenStream {
+    let crate_ = Ident::new(crate_, Span::call_site());
     if !input.generics.params.is_empty() {
         return quote::quote! { compile_error!("#[derive(AsBytes)] does not support generics") };
     }
@@ -34,7 +35,7 @@ pub(crate) fn as_bytes(input: DeriveInput) -> TokenStream {
         return quote::quote! { compile_error!("#[derive(AsBytes)] only supports structs") };
     };
     let name = input.ident;
-    let trait_ = parse_quote! { ::kernel::transmute::AsBytes };
+    let trait_ = parse_quote! { ::#crate_::transmute::AsBytes };
     let where_clause = all_fields_impl(&ds.fields, &trait_);
     let padding_check = struct_padding_check(&ds.fields, &name);
     quote::quote! {
@@ -44,13 +45,14 @@ unsafe impl #trait_ for #name #where_clause {}
     }
 }
 
-pub(crate) fn from_bytes(input: DeriveInput) -> TokenStream {
+pub(crate) fn from_bytes(crate_: &str, input: DeriveInput) -> TokenStream {
+    let crate_ = Ident::new(crate_, Span::call_site());
     let syn::Data::Struct(ref ds) = &input.data else {
         return quote::quote! { compile_error!("#[derive(FromBytes)] only supports structs") };
     };
     let (impl_generics, ty_generics, base_where_clause) = input.generics.split_for_impl();
     let name = input.ident;
-    let trait_ = parse_quote! { ::kernel::transmute::FromBytes };
+    let trait_ = parse_quote! { ::#crate_::transmute::FromBytes };
     let mut where_clause = all_fields_impl(&ds.fields, &trait_);
     if let Some(base_clause) = base_where_clause {
         where_clause
diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
index 1d5fd9efb93e9db97fec84fca2bae37b500c20c5..2033b7125558d7ccfae67b94777f5ce59593a528 100644
--- a/rust/uapi/lib.rs
+++ b/rust/uapi/lib.rs
@@ -34,6 +34,10 @@
 type __kernel_ssize_t = isize;
 type __kernel_ptrdiff_t = isize;
 
+use macros::{
+    AsBytesFfi,
+    FromBytesFfi, //
+};
 use pin_init::MaybeZeroable;
 
 include!(concat!(env!("OBJTREE"), "/rust/uapi/uapi_generated.rs"));

-- 
2.52.0.351.gbe84eed79e-goog

