Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDB230FF3C
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 23:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765582959; cv=none; b=QGjTnC5hO4TcdzHRQ9K/0fXuXsNgvl2xux43OLAdE2TCZ0+1RPEa3BzH9xND7orCrtT26NGzk1CVFsFIQs2xn7yc1VcAEZVU0OPnaEX9yL/q80ON85somPRlIXKfQg+mViLA4hEDa2vaIcUzpgslY4Oi/fMy00ZKHFOhHMLXXkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765582959; c=relaxed/simple;
	bh=a4fBIhT9OP8XBv90Ul5+2iSakBnB35GLRJBkUmDan0Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OlRj6lAB8D+MkRtSvRVQrFVYRJrwt03PMluG5PaZQzTdCA6HteSFsw4i7eToRDB15vHZrXPKqKfWYKuXXAYcLHWJUPTCdLaFvjXJwtkAKYDQyXSrYyoiQ3AvYxJ+b0pCRx1WV8uDE4Wri/AUws0iS7YO3HHAliyj2qvfeGfqDLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nc6wc1Ki; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nc6wc1Ki"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b9b9e8b0812so2547922a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 15:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765582957; x=1766187757; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W5rKFlQEdv6mp3b6khBfhqQ83uqWy1wmdv/8dcXGXm0=;
        b=nc6wc1KijsK5fAi3izxF8Tlu6pn0RnoxVUHeTPoaPdl4wZx+IJi1tVcKRJiyKE8fU9
         qN5hzOinEDTn2gTnUksWQVWbBjx6yrkeGA2a309YmqTWMadSKCU0stKfvcm8W7DQCNmG
         tFKNJU9wgQW3yZX3rPfuGtouLt8ZDT3Pl18h9I4bgxE8BS8b0NVDgKwkYFuFwyQhQKh9
         Nebvk5nVL9v/HmT7trGDzDPATBR/x7EpY73WXel1utlqPFY+tWt9qNXUOyLPYFnOOD5n
         t013tACGopWNU0rZMv9q3jieH4Uw3rwUh1SsN0Xk1tShF8jWVTF51djzOLqP/8oJWKYw
         sC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765582957; x=1766187757;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5rKFlQEdv6mp3b6khBfhqQ83uqWy1wmdv/8dcXGXm0=;
        b=rZU2eQAdCjrpM0ge+Eee+rD6oZfX4gmacWpksVFjlFxvUvrjhFr+FQZwaAPjxa04oN
         7xaVO2ceNuk+DdHR3RODl1rzxbbcCn591sGjZrSJH0VIc1WwC6aGKF1ky7cI2ARBdvZE
         E+LjvvenJcvXewHtZkS+N9XCNpSB7BqHixb9fLLM/ixzwTkUZls6mJMrgx7EuVifn7ne
         GV4VEWU5BlYH1RfD39NoGJGXKEgcXQ5j63xHTSDVnnAXJOeaA4BRZPgSUvb5B/rSekMa
         8813n8URMwXgYgk/KVzCCysEweNQ13hOAYymX6+FcBoZ42RZHCUiaY2DPIgn44o/iE/c
         kG3A==
X-Gm-Message-State: AOJu0YxIR/dsPewxCLPllJynyoGPS0G2snAivqZloDvUXikw5eHlIFex
	eC8eA1emBADRlNDDyFdA547FJW7DcXblqBeZh2j0yeehEEuqMOSqyoV+92cevFVX0CU/Jj5O9Vn
	vj5XLeJoCqg==
X-Google-Smtp-Source: AGHT+IG/OBFVGzp+B1Pwr4c/sK8EobUryFxZ1KPilfpcUcukaoOJ8RaVG9RFQoYdwPP1hPN/HvRZipgnWceZ
X-Received: from dycrr5.prod.google.com ([2002:a05:693c:2c85:b0:2a4:6f9d:b3cb])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:df44:b0:2a4:7fb3:7a96
 with SMTP id 5a478bee46e88-2ac3014694emr2149620eec.36.1765582957189; Fri, 12
 Dec 2025 15:42:37 -0800 (PST)
Date: Fri, 12 Dec 2025 23:42:21 +0000
In-Reply-To: <20251212-transmute-v1-0-9b28e06c6508@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251212-transmute-v1-0-9b28e06c6508@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765582949; l=10140;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=a4fBIhT9OP8XBv90Ul5+2iSakBnB35GLRJBkUmDan0Y=; b=1Ai9maUqqxpxnEwLMeD1d0XkSSB/GvIl2h0lOXy6cvA6mbwIKWmAV/jdQpctWKFdRSeFtNWav
 Mi7n3QiU4nhAmKL121HCNxeK6P7pdRZphq9de+Z2VGMYufYC3Ijj6v8
X-Mailer: b4 0.14.2
Message-ID: <20251212-transmute-v1-3-9b28e06c6508@google.com>
Subject: [PATCH 3/3] rust: Support deriving `AsBytes`/`FromBytes` on bindgen types
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
re-export. `traits::transmute` is now available for use in `bindings`.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/Makefile                        | 19 +++++++++++++++----
 rust/bindgen_parameters              |  8 ++++++++
 rust/bindings/lib.rs                 |  1 +
 rust/kernel/lib.rs                   |  3 ++-
 rust/macros/lib.rs                   | 24 ++++++++++++++++++++++--
 rust/macros/transmute.rs             | 12 +++++++-----
 rust/traits/lib.rs                   |  6 ++++++
 rust/{kernel => traits}/transmute.rs |  0
 rust/uapi/lib.rs                     |  1 +
 9 files changed, 62 insertions(+), 12 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704d15e43effc528be8f5a4d74d3d8d..bbede4b5b4faa5edeb1d33bdce338a7b76915d07 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -660,26 +660,37 @@ $(obj)/ffi.o: private skip_gendwarfksyms = 1
 $(obj)/ffi.o: $(src)/ffi.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
-$(obj)/bindings.o: private rustc_target_flags = --extern ffi --extern pin_init
+$(obj)/bindings.o: private rustc_target_flags = --extern ffi --extern pin_init \
+	--extern traits --extern macros
 $(obj)/bindings.o: $(src)/bindings/lib.rs \
     $(obj)/ffi.o \
     $(obj)/pin_init.o \
+    $(obj)/traits.o \
+    $(obj)/$(libmacros_name) \
     $(obj)/bindings/bindings_generated.rs \
     $(obj)/bindings/bindings_helpers_generated.rs FORCE
 	+$(call if_changed_rule,rustc_library)
 
-$(obj)/uapi.o: private rustc_target_flags = --extern ffi --extern pin_init
+$(obj)/traits.o: private skip_gendwarfksyms = 1
+$(obj)/traits.o: $(src)/traits/lib.rs FORCE
+	+$(call if_changed_rule,rustc_library)
+
+
+$(obj)/uapi.o: private rustc_target_flags = --extern ffi --extern pin_init \
+	--extern traits --extern macros
 $(obj)/uapi.o: private skip_gendwarfksyms = 1
 $(obj)/uapi.o: $(src)/uapi/lib.rs \
     $(obj)/ffi.o \
     $(obj)/pin_init.o \
+    $(obj)/traits.o \
+    $(obj)/$(libmacros_name) \
     $(obj)/uapi/uapi_generated.rs FORCE
 	+$(call if_changed_rule,rustc_library)
 
 $(obj)/kernel.o: private rustc_target_flags = --extern ffi --extern pin_init \
-    --extern build_error --extern macros --extern bindings --extern uapi
+    --extern build_error --extern macros --extern bindings --extern uapi --extern traits
 $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o $(obj)/pin_init.o \
-    $(obj)/$(libmacros_name) $(obj)/bindings.o $(obj)/uapi.o FORCE
+    $(obj)/$(libmacros_name) $(obj)/bindings.o $(obj)/uapi.o $(obj)/traits.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
 ifdef CONFIG_JUMP_LABEL
diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index fd2fd1c3cb9a51ea46fcd721907783b457aa1378..60910ba8731180516b4980b9e0dc5fb0c297da55 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -64,3 +64,11 @@
 # Structs should implement `Zeroable` when all of their fields do.
 --with-derive-custom-struct .*=MaybeZeroable
 --with-derive-custom-union .*=MaybeZeroable
+
+# Every C struct can try to derive FromBytes. If they have unmet requirements,
+# the impl will just be a no-op due to the where clause.
+--with-derive-custom-struct .*=FromBytesTrait
+
+# We can't auto-derive AsBytes, as we need a const-time check to see if there
+# is padding involved. Add it explicitly when you expect no padding.
+--with-derive-custom-struct cpumask=AsBytesTrait
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 0c57cf9b4004f176997c59ecc58a9a9ac76163d9..07932ab130c0a8e56e35d49ace77ae1becc09ae6 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -31,6 +31,7 @@
 #[allow(clippy::undocumented_unsafe_blocks)]
 #[cfg_attr(CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES, allow(unnecessary_transmutes))]
 mod bindings_raw {
+    use macros::{AsBytesTrait, FromBytesTrait};
     use pin_init::{MaybeZeroable, Zeroable};
 
     // Manual definition for blocklisted types.
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf12004286962985a068665443dc22c389a2..8c605f4905223077f5d824f27220c4c24e71d5f4 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -146,7 +146,6 @@
 pub mod task;
 pub mod time;
 pub mod tracepoint;
-pub mod transmute;
 pub mod types;
 pub mod uaccess;
 #[cfg(CONFIG_USB = "y")]
@@ -159,6 +158,8 @@
 pub use macros;
 pub use uapi;
 
+pub use traits::*;
+
 /// Prefix to appear before log messages printed from within the `kernel` crate.
 const __LOG_PREFIX: &[u8] = b"rust_kernel\0";
 
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index cec8bd3a742b3f6b3680c4286f73c8fa550a58a0..862de56339bbb18cd30a260444dc19f24b13a0d0 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -503,7 +503,7 @@ pub fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
 #[proc_macro_derive(FromBytes)]
 pub fn derive_from_bytes(tokens: TokenStream) -> TokenStream {
     let input = parse_macro_input!(tokens as DeriveInput);
-    transmute::from_bytes(input).into()
+    transmute::from_bytes("kernel", input).into()
 }
 
 /// Implements `AsBytes` for a struct.
@@ -533,5 +533,25 @@ pub fn derive_from_bytes(tokens: TokenStream) -> TokenStream {
 #[proc_macro_derive(AsBytes)]
 pub fn derive_as_bytes(tokens: TokenStream) -> TokenStream {
     let input = parse_macro_input!(tokens as DeriveInput);
-    transmute::as_bytes(input).into()
+    transmute::as_bytes("kernel", input).into()
+}
+
+#[doc(hidden)]
+#[proc_macro_derive(FromBytesTrait)]
+/// This is equivalent to `FromBytes`, but uses the `trait` crate as the trait definition site
+/// instead of `kernel`. This is intended for use inside `bindings`. Everyone else can refer to the
+/// trait through `kernel`.
+pub fn derive_from_bytes_trait(tokens: TokenStream) -> TokenStream {
+    let input = parse_macro_input!(tokens as DeriveInput);
+    transmute::from_bytes("traits", input).into()
+}
+
+#[doc(hidden)]
+#[proc_macro_derive(AsBytesTrait)]
+/// This is equivalent to `AsBytes`, but uses the `trait` crate as the trait definition site
+/// instead of `kernel`. This is intended for use inside `bindings`. Everyone else can refer to the
+/// trait through `kernel`.
+pub fn derive_as_bytes_trait(tokens: TokenStream) -> TokenStream {
+    let input = parse_macro_input!(tokens as DeriveInput);
+    transmute::as_bytes("traits", input).into()
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
diff --git a/rust/traits/lib.rs b/rust/traits/lib.rs
new file mode 100644
index 0000000000000000000000000000000000000000..33020a17333521b3bee71bd3d003a759ac97fedd
--- /dev/null
+++ b/rust/traits/lib.rs
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support crate containing traits and other definitions that need to be available without the
+//! kernel crate. The usual case for this is code that needs to be available in the bindings crate.
+#![no_std]
+pub mod transmute;
diff --git a/rust/kernel/transmute.rs b/rust/traits/transmute.rs
similarity index 100%
rename from rust/kernel/transmute.rs
rename to rust/traits/transmute.rs
diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
index 1d5fd9efb93e9db97fec84fca2bae37b500c20c5..928b4b2eb035250399e3150f20b638edbf04dac1 100644
--- a/rust/uapi/lib.rs
+++ b/rust/uapi/lib.rs
@@ -34,6 +34,7 @@
 type __kernel_ssize_t = isize;
 type __kernel_ptrdiff_t = isize;
 
+use macros::{AsBytesTrait, FromBytesTrait};
 use pin_init::MaybeZeroable;
 
 include!(concat!(env!("OBJTREE"), "/rust/uapi/uapi_generated.rs"));

-- 
2.52.0.305.g3fc767764a-goog

