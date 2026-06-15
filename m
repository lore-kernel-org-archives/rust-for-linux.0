Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0288B3F412C
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 14:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533965; cv=none; b=Fqz5pSpcNqGGU8hzcCG7/jlwXW5+z+b2qT2dU3pWIOr7NzLP+G2gH9xArcihJI7b6s4gD+FzPUYe6xzEuJtpSdkTV20ssyk18Dk5ZMEuDwRqHKjFPCL/LedU03QYfVcCisa/9pv3PBkIbo1ElaKqfUfUHmBMzuIG4KYmrKSPigs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533965; c=relaxed/simple;
	bh=3N9V5iCwHyhQrMzHGGBwEfdk6ZV08HAGaWgDUcZUQx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jMyAYi7dtjKYZHw791W23bFC/78Nwr2g72svsifSF5MuSNzulQYTdY41D+R0INMtTADfXePpSWng1E9gP3pVqliB9hZR0EO/j1yI/SieitCH+85GXfSHkPFrCumYmlP71g9P4PrkHMFEbU1Ga+R/SlfbP9FpJQDuRKJENtzmiUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHZgn8qN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHZgn8qN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1B71F000E9;
	Mon, 15 Jun 2026 14:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781533963;
	bh=tIiqlwdgybpvjjYnY6yDKvVVXQ1Q6tetir27GH3hBxg=;
	h=From:To:Cc:Subject:Date;
	b=BHZgn8qNH5Uy7h95jrZHMDOcs2jSBhGeGsZh4Tp6URgFAMM8p0MF+pGRfZEearsXf
	 O4sdTQP+aky+tsyzCBS6aEmm0yAPoWywww/0/jaVQm65zkN6E5s+v9J8GP8P59hwNh
	 fHTd9WocYbk61xaZKZVVEGbrxogj+KW/uPAsLLS/HLsvginhd3CoQRS76pYynufXaM
	 kVxkKQ3FyV54KKRJF163LDPeNqTwMe9hG9tV9YF+s5Bhyj2uQC2dojKoI/MchMJvjV
	 wECildfN51ljHboOgfhq8DgKxalt59r5iXpYvABQ38arBcgUdGsqeG+VmFj/p8FEFm
	 XQ1lU53Y0oKtw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	Urgau <urgau@numericable.fr>
Subject: [PATCH] rust: allow `suspicious_runtime_symbol_definitions` lint for Rust >= 1.98
Date: Mon, 15 Jun 2026 16:32:25 +0200
Message-ID: <20260615143225.471756-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting with Rust 1.98.0 (expected 2026-08-20), Rust is introducing a
couple new lints, `invalid_runtime_symbol_definitions` (deny-by-default)
and `suspicious_runtime_symbol_definitions` (warn-by-default), which check
the signature of items whose symbol name is a runtime symbol expected by
`core`.

Our build hits the second one, i.e. the warning:

    error: suspicious definition of the runtime `strlen` symbol used by the standard library
         --> rust/bindings/bindings_generated.rs:20018:5
          |
    20018 |     pub fn strlen(s: *const ffi::c_char) -> usize;
          |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
          |
          = note: expected `unsafe extern "C" fn(*const i8) -> usize`
                  found    `unsafe extern "C" fn(*const u8) -> usize`
          = help: either fix the signature or remove any attributes like `#[unsafe(no_mangle)]`, `#[unsafe(export_name = "strlen")]`, or `#[link_name = "strlen"]`
          = help: allow this lint if the signature is compatible
          = note: `-D suspicious-runtime-symbol-definitions` implied by `-D warnings`
          = help: to override `-D warnings` add `#[allow(suspicious_runtime_symbol_definitions)]`

    error: suspicious definition of the runtime `strlen` symbol used by the standard library
         --> rust/uapi/uapi_generated.rs:14236:5
          |
    14236 |     pub fn strlen(s: *const ffi::c_char) -> usize;
          |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
          |
          = note: expected `unsafe extern "C" fn(*const i8) -> usize`
                  found    `unsafe extern "C" fn(*const u8) -> usize`
          = help: either fix the signature or remove any attributes like `#[unsafe(no_mangle)]`, `#[unsafe(export_name = "strlen")]`, or `#[link_name = "strlen"]`
          = help: allow this lint if the signature is compatible
          = note: `-D suspicious-runtime-symbol-definitions` implied by `-D warnings`
          = help: to override `-D warnings` add `#[allow(suspicious_runtime_symbol_definitions)]`

Thus `allow` the lint in `bindings` and `uapi`.

A more targeted alternative to avoid `allow`ing it would be to pass
`--blocklist-function strlen` to `bindgen`, but we would perhaps need
to adjust if other C headers end up adding more (or Rust checking more).
Since it is just the less critical one that we hit, and since eventually
this should be properly fixed by getting upstream Rust to provide a flag
like GCC/Clang's `-funsigned-char` [2][3], just `allow` it for now.

Cc: Urgau <urgau@numericable.fr>
Link: https://github.com/rust-lang/rust/pull/155521 [1]
Link: https://github.com/rust-lang/rust/issues/138446 [2]
Link: https://github.com/Rust-for-Linux/linux/issues/355 [3]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 init/Kconfig         | 3 +++
 rust/bindings/lib.rs | 4 ++++
 rust/uapi/lib.rs     | 4 ++++
 3 files changed, 11 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 2937c4d308ae..c2c6011dfe98 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -190,6 +190,9 @@ config RUSTC_HAS_FILE_WITH_NUL
 config RUSTC_HAS_FILE_AS_C_STR
 	def_bool RUSTC_VERSION >= 109100
 
+config RUSTC_HAS_SUSPICIOUS_RUNTIME_SYMBOL_DEFINITIONS
+	def_bool RUSTC_VERSION >= 109800
+
 config PAHOLE_VERSION
 	int
 	default "$(PAHOLE_VERSION)"
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 854e7c471434..812f8e5a08d5 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -27,6 +27,10 @@
 #[allow(clippy::ref_as_ptr)]
 #[allow(clippy::undocumented_unsafe_blocks)]
 #[cfg_attr(CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES, allow(unnecessary_transmutes))]
+#[cfg_attr(
+    CONFIG_RUSTC_HAS_SUSPICIOUS_RUNTIME_SYMBOL_DEFINITIONS,
+    allow(suspicious_runtime_symbol_definitions)
+)]
 mod bindings_raw {
     use pin_init::{MaybeZeroable, Zeroable};
 
diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
index b8a515de31ca..797ead5b5626 100644
--- a/rust/uapi/lib.rs
+++ b/rust/uapi/lib.rs
@@ -24,6 +24,10 @@
     unsafe_op_in_unsafe_fn
 )]
 #![cfg_attr(CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES, allow(unnecessary_transmutes))]
+#![cfg_attr(
+    CONFIG_RUSTC_HAS_SUSPICIOUS_RUNTIME_SYMBOL_DEFINITIONS,
+    allow(suspicious_runtime_symbol_definitions)
+)]
 #![feature(cfi_encoding)]
 
 // Manual definition of blocklisted types.

base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
-- 
2.54.0

