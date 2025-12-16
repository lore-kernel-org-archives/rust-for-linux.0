Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A5626B2B0
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 00:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765845899; cv=none; b=cVfk9Js1OCNX3oU4pIGVsqo8kBYYkEtMigF6qir4l/7yZWY+nguFfkIu60CcNfAxVFOGqQiyKzUXSIhKASpIh7+x8Vc0XIQ7w17NB7aQ/0aV1la/UV+pjKlCaPqKK5xxbSyGab54zIonoaBvRWGXw8swDvaQ5bMxgOTaNOA6Q7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765845899; c=relaxed/simple;
	bh=eJzzXyTehyDOrkdA4s2sZqkwAreYcpT1LVD5yuHGCEg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mcEDwERtkUccIvxMrE7dqIzlslpfDHLrGhCkZSSOTw2Pwrx25AnelObNpGXkdXSCXFVQy4gulCqU6mB+5VFGnxO7nxj3lrk3YuvEEt/MXnmsdTL/8pihw4+rS7ZLmeJ9v36HJqWSSwi9n4stlDghqlWBoFabGgCkJUtzP1zmjmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PLx3t8+F; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PLx3t8+F"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c1290abb178so4395001a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 16:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765845897; x=1766450697; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KesyPju459Z9i93tKmGW4+cYM/ROQPbIUqpeFkvB4f4=;
        b=PLx3t8+FbeQpm64MFqzsR9DM+MYXAPSuDO+xXaJrWLgVVrujI87TsGlra48uZqMjEF
         hLh21j+YT1HbiC00bDMRLDrYMRmv7SKxyHPJYH+B5k1uHX4n94FLBkGVHZWLilSxuiPp
         P3I1G6CoBB2/xwSYj2HyUYJCu41Z+70ne8ij5KsQ6q29Tby1qXns6yLYJpUGB4/HsBMF
         Ct791J1L8HGEaSnzq28a3374yiQODYBQLP+oX9Ofr8Mnoecs3PhR5wyNepTzCngJ56eW
         F8ahnjJW9KZMLrvQKVge+ZBDUmF1JElRlVjU/HBVZZcz/ToZjmSiYh1/ccN0v2mS9Nc8
         WrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765845897; x=1766450697;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KesyPju459Z9i93tKmGW4+cYM/ROQPbIUqpeFkvB4f4=;
        b=m4V5AX4oYFokDNjr23m+7CSLdR9zCFQtQVSyYmJd16yrnT1YR+9YTHSQvlxkE+MTC+
         2Vs0FaSvBciIq6iobcHvUbMSu3bHjaSYNCsemNlJv544bcLktqpjjVZbq27se0K3RGxN
         tFR1996WGq7subzclybV0gCT1MzaiewVxHIOSfRKq2+gv9PbpbMnPz7RzU6VuMTYEWtC
         MBY4jFczurc4CMLRTBlF3Ox/hjTpKk0Jps81PKZxXjNRV6M8VWTLAipMsujXSTYSYFP3
         v2m6sFc3bJ7AQnKm2SgwGekPt94+FC+FfK2geuiuEHAvNKdaITYLhoNPy4rmmitewFZ6
         PNsA==
X-Gm-Message-State: AOJu0YwPtXJTmBlMjZRV2Kb4jsdwZ8YFNLwJkHts/OSPQA/yC1EhUHc2
	ffRWcUXkNHVcKll+l+TGt5Ak7Q/UmzUklmLCaeoKbp3fg1F+Gzq0itGx12BCgMmsd/RZSzGntnB
	yca1YM3UAxw==
X-Google-Smtp-Source: AGHT+IEQ5wxKL6gYrutG2VXGN+zazB4TwDak9ykhby/gvEC3VGcHSiTMhK8WLTx5Vhbjtidy0p3BqhJLi54F
X-Received: from dycns7.prod.google.com ([2002:a05:7300:f787:b0:2ac:2c66:7180])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:50e4:b0:2a4:3593:6452
 with SMTP id 5a478bee46e88-2ac2f85e8a0mr8360771eec.2.1765845896521; Mon, 15
 Dec 2025 16:44:56 -0800 (PST)
Date: Tue, 16 Dec 2025 00:44:43 +0000
In-Reply-To: <20251216-transmute-v2-0-b23e5277ad02@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251216-transmute-v2-0-b23e5277ad02@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765845890; l=10908;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=eJzzXyTehyDOrkdA4s2sZqkwAreYcpT1LVD5yuHGCEg=; b=9udXk9G1Dt7+BmcMMAc+ksdY1kYgvCDrvn2/pYGVJNNN24pKAJAmnOVsaftEkpz6lfgfYo9fx
 GhEmAzrI3tGCqrxK1FPXWRJpUApNy7EOA3hKdERdIscJ2MwWvPB8w+i
X-Mailer: b4 0.14.2
Message-ID: <20251216-transmute-v2-3-b23e5277ad02@google.com>
Subject: [PATCH v2 3/3] rust: Support deriving `AsBytes`/`FromBytes` on
 bindgen types
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

To support this, we need to move the `transmute` module into a separate
crate to allow the `bindings` crate to depend on it. Most user code is
still expected to address the module as `kernel::transmute`, which is a
re-export. `ffi::transmute` is now available for use in `bindings`.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/Makefile                     | 14 +++++++++-----
 rust/bindgen_parameters           |  8 ++++++++
 rust/bindings/lib.rs              |  4 ++++
 rust/{ffi.rs => ffi/lib.rs}       |  5 +++++
 rust/{kernel => ffi}/transmute.rs |  0
 rust/kernel/lib.rs                |  2 +-
 rust/macros/lib.rs                | 24 ++++++++++++++++++++++--
 rust/macros/transmute.rs          | 12 +++++++-----
 rust/uapi/lib.rs                  |  4 ++++
 scripts/generate_rust_analyzer.py |  2 +-
 10 files changed, 61 insertions(+), 14 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704d15e43effc528be8f5a4d74d3d8d..178aa3036c4acba1c4c266196912da2d60fe0d5f 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -207,7 +207,7 @@ rustdoc-compiler_builtins: $(src)/compiler_builtins.rs rustdoc-core FORCE
 	+$(call if_changed,rustdoc)
 
 rustdoc-ffi: private is-kernel-object := y
-rustdoc-ffi: $(src)/ffi.rs rustdoc-core FORCE
+rustdoc-ffi: $(src)/ffi/lib.rs rustdoc-core FORCE
 	+$(call if_changed,rustdoc)
 
 rustdoc-pin_init_internal: private rustdoc_host = yes
@@ -249,7 +249,7 @@ quiet_cmd_rustc_test_library = $(RUSTC_OR_CLIPPY_QUIET) TL $<
 rusttestlib-build_error: $(src)/build_error.rs FORCE
 	+$(call if_changed,rustc_test_library)
 
-rusttestlib-ffi: $(src)/ffi.rs FORCE
+rusttestlib-ffi: $(src)/ffi/lib.rs FORCE
 	+$(call if_changed,rustc_test_library)
 
 rusttestlib-proc_macro2: private rustc_target_flags = $(proc_macro2-flags)
@@ -657,22 +657,26 @@ $(obj)/build_error.o: $(src)/build_error.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
 $(obj)/ffi.o: private skip_gendwarfksyms = 1
-$(obj)/ffi.o: $(src)/ffi.rs $(obj)/compiler_builtins.o FORCE
+$(obj)/ffi.o: $(src)/ffi/lib.rs $(obj)/compiler_builtins.o FORCE
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
diff --git a/rust/ffi.rs b/rust/ffi/lib.rs
similarity index 87%
rename from rust/ffi.rs
rename to rust/ffi/lib.rs
index f961e9728f590fd2c52d4c03a1f715d654051d04..14052362f091a609bc505fe6eca77fe998fe2321 100644
--- a/rust/ffi.rs
+++ b/rust/ffi/lib.rs
@@ -10,6 +10,11 @@
 
 #![no_std]
 
+#[doc(hidden)]
+// This lives here to make it accessible to `bindings`, similar to the other `ffi` types.
+// User code should access it through `kernel::transmute`.
+pub mod transmute;
+
 macro_rules! alias {
     ($($name:ident = $ty:ty;)*) => {$(
         #[allow(non_camel_case_types, missing_docs)]
diff --git a/rust/kernel/transmute.rs b/rust/ffi/transmute.rs
similarity index 100%
rename from rust/kernel/transmute.rs
rename to rust/ffi/transmute.rs
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf12004286962985a068665443dc22c389a2..4aa54dd83319ef16bd4baa1964114f1e6549942b 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -63,6 +63,7 @@
 extern crate self as kernel;
 
 pub use ffi;
+pub use ffi::transmute;
 
 pub mod acpi;
 pub mod alloc;
@@ -146,7 +147,6 @@
 pub mod task;
 pub mod time;
 pub mod tracepoint;
-pub mod transmute;
 pub mod types;
 pub mod uaccess;
 #[cfg(CONFIG_USB = "y")]
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
index 43cf36a1334f1fed23c0e777026392f987f78d8d..9bd6d279675fb1d58cdceff1f4dde0dcf33fbf99 100644
--- a/rust/macros/transmute.rs
+++ b/rust/macros/transmute.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use proc_macro2::TokenStream;
+use proc_macro2::{Span, TokenStream};
 use syn::{parse_quote, DeriveInput, Fields, Ident, ItemConst, Path, WhereClause};
 
 fn all_fields_impl(fields: &Fields, trait_: &Path) -> WhereClause {
@@ -19,7 +19,8 @@ fn struct_padding_check(fields: &Fields, name: &Ident) -> ItemConst {
     }
 }
 
-pub(crate) fn as_bytes(input: DeriveInput) -> TokenStream {
+pub(crate) fn as_bytes(crate_: &str, input: DeriveInput) -> TokenStream {
+    let crate_ = Ident::new(crate_, Span::call_site());
     if !input.generics.params.is_empty() {
         return quote::quote! { compile_error!("#[derive(AsBytes)] does not support generics") };
     }
@@ -27,7 +28,7 @@ pub(crate) fn as_bytes(input: DeriveInput) -> TokenStream {
         return quote::quote! { compile_error!("#[derive(AsBytes)] only supports structs") };
     };
     let name = input.ident;
-    let trait_ = parse_quote! { ::kernel::transmute::AsBytes };
+    let trait_ = parse_quote! { ::#crate_::transmute::AsBytes };
     let where_clause = all_fields_impl(&ds.fields, &trait_);
     let padding_check = struct_padding_check(&ds.fields, &name);
     quote::quote! {
@@ -37,13 +38,14 @@ unsafe impl #trait_ for #name #where_clause {}
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
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 147d0cc940681426771db865bc2462e7029a6d7d..843d081eacaca8edeeac5978bd8107a498008186 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -137,7 +137,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
 
     append_crate(
         "ffi",
-        srctree / "rust" / "ffi.rs",
+        srctree / "rust" / "ffi" / "lib.rs",
         ["core", "compiler_builtins"],
     )
 

-- 
2.52.0.305.g3fc767764a-goog

