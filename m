Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A32B212550;
	Thu, 11 Dec 2025 19:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765481336; cv=none; b=n49Bvsd98wdOEYsdi5MQAVgl+eWD9w/Ib2uDcgURwt4Go9y8c4fmOJrVNqLcfRxPzbejNkmE7EWWjoLpPaOJMkfsidUhwDSt2h4z2RC2AvrJuZR5dSZGVRoqnqh98upInb9omw3ecLSDRjMXETIkE/+oang0AaOIDzl/e/lC9AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765481336; c=relaxed/simple;
	bh=AxZwTAUcglfwElWrbRH9rDYv5hdD1CNHEnvQ4x0efYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=krYAbGWKzHyNAfArJj3cFuckHoyv07oYFaTZOpu4X43LoWiTmci0tFBB/AROTdbgrVriPM9EW/Z1rkMA9rc282tGavC/JfeL9a4yyTZ/ArGFeUg/fA/aG7w0RKxgL17hO7o5qsw3ysh85r3z1MZ/4ZxDGecqTo1UYu7VXabHbPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Up+8NWV0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Up+8NWV0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A10EC4CEF7;
	Thu, 11 Dec 2025 19:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765481335;
	bh=AxZwTAUcglfwElWrbRH9rDYv5hdD1CNHEnvQ4x0efYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=Up+8NWV0ADcQkiOgk+XI1/BJxyuDIcsXtLOxSH3VrLMh/lBobaugxbKAErPokinNk
	 saA+qOBm7hmRd9jGtXU9Axu+u+zCVKzKb3peREiSCFM6dBCQWlpyajU8BzujX3E9QW
	 6gVWDTYrsk4eV4U5f4KBuCEibLofpdloNnpNmy7LDWpIqGa0QDOO/5wlu6fRNMwump
	 XBIWWMCylLpcTHZj6pLLZ4JhxtMTRBwDHgYJQU2zRC3OMisahyFI7E9KUF8t7MKzBS
	 y6DKvmfm6RYbmg9TDg9kV+K6/1cYmKDxWlM+u1jXAV4A4IDkd1r9i1UkcFtEr+IrFj
	 50Bvub5igIC9Q==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Fiona Behrens <me@Kloenk.dev>,
	Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	Tamir Duberstein <tamird@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] rust: pin-init: internal: remove proc-macro[2] and quote workarounds
Date: Thu, 11 Dec 2025 18:56:41 +0000
Message-ID: <20251211185805.2835633-2-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251211185805.2835633-1-gary@kernel.org>
References: <20251211185805.2835633-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Benno Lossin <lossin@kernel.org>

The kernel only had the `proc-macro` library available, whereas the
user-space version also used `proc-macro2` and `quote`. Now both are
available to the kernel, making it possible to remove the workarounds.

Signed-off-by: Benno Lossin <lossin@kernel.org>
Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/Makefile                             |  8 +++++---
 rust/pin-init/internal/src/helpers.rs     |  5 +----
 rust/pin-init/internal/src/lib.rs         | 16 ----------------
 rust/pin-init/internal/src/pin_data.rs    |  6 ++----
 rust/pin-init/internal/src/pinned_drop.rs |  6 ++----
 rust/pin-init/internal/src/zeroable.rs    |  6 ++----
 scripts/generate_rust_analyzer.py         |  2 +-
 7 files changed, 13 insertions(+), 36 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704d..c816ca8663e42 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -212,7 +212,8 @@ rustdoc-ffi: $(src)/ffi.rs rustdoc-core FORCE
 
 rustdoc-pin_init_internal: private rustdoc_host = yes
 rustdoc-pin_init_internal: private rustc_target_flags = --cfg kernel \
-    --extern proc_macro --crate-type proc-macro
+    --extern proc_macro --extern proc_macro2 --extern quote --extern syn \
+    --crate-type proc-macro
 rustdoc-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
     rustdoc-clean FORCE
 	+$(call if_changed,rustdoc)
@@ -273,7 +274,7 @@ rusttestlib-macros: $(src)/macros/lib.rs \
 	+$(call if_changed,rustc_test_library)
 
 rusttestlib-pin_init_internal: private rustc_target_flags = --cfg kernel \
-    --extern proc_macro
+    --extern proc_macro --extern proc_macro2 --extern quote --extern syn
 rusttestlib-pin_init_internal: private rustc_test_library_proc = yes
 rusttestlib-pin_init_internal: $(src)/pin-init/internal/src/lib.rs FORCE
 	+$(call if_changed,rustc_test_library)
@@ -547,7 +548,8 @@ $(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib \
     $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
-$(obj)/$(libpin_init_internal_name): private rustc_target_flags = --cfg kernel
+$(obj)/$(libpin_init_internal_name): private rustc_target_flags = --cfg kernel \
+    --extern proc_macro2 --extern quote --extern syn
 $(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
diff --git a/rust/pin-init/internal/src/helpers.rs b/rust/pin-init/internal/src/helpers.rs
index 236f989a50f2f..1d2dd27c888c8 100644
--- a/rust/pin-init/internal/src/helpers.rs
+++ b/rust/pin-init/internal/src/helpers.rs
@@ -1,9 +1,6 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
-#[cfg(not(kernel))]
-use proc_macro2 as proc_macro;
-
-use proc_macro::{TokenStream, TokenTree};
+use proc_macro2::{TokenStream, TokenTree};
 
 /// Parsed generics.
 ///
diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src/lib.rs
index 297b0129a5bfd..4c4dc639ce823 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -7,27 +7,11 @@
 //! `pin-init` proc macros.
 
 #![cfg_attr(not(RUSTC_LINT_REASONS_IS_STABLE), feature(lint_reasons))]
-// Allow `.into()` to convert
-// - `proc_macro2::TokenStream` into `proc_macro::TokenStream` in the user-space version.
-// - `proc_macro::TokenStream` into `proc_macro::TokenStream` in the kernel version.
-//   Clippy warns on this conversion, but it's required by the user-space version.
-//
-// Remove once we have `proc_macro2` in the kernel.
-#![allow(clippy::useless_conversion)]
 // Documentation is done in the pin-init crate instead.
 #![allow(missing_docs)]
 
 use proc_macro::TokenStream;
 
-#[cfg(kernel)]
-#[path = "../../../macros/quote.rs"]
-#[macro_use]
-#[cfg_attr(not(kernel), rustfmt::skip)]
-mod quote;
-#[cfg(not(kernel))]
-#[macro_use]
-extern crate quote;
-
 mod helpers;
 mod pin_data;
 mod pinned_drop;
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 87d4a7eb1d35e..12d9b02c38837 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -1,10 +1,8 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
-#[cfg(not(kernel))]
-use proc_macro2 as proc_macro;
-
 use crate::helpers::{parse_generics, Generics};
-use proc_macro::{Group, Punct, Spacing, TokenStream, TokenTree};
+use proc_macro2::{Group, Punct, Spacing, TokenStream, TokenTree};
+use quote::quote;
 
 pub(crate) fn pin_data(args: TokenStream, input: TokenStream) -> TokenStream {
     // This proc-macro only does some pre-parsing and then delegates the actual parsing to
diff --git a/rust/pin-init/internal/src/pinned_drop.rs b/rust/pin-init/internal/src/pinned_drop.rs
index c4ca7a70b726a..978c2594243ba 100644
--- a/rust/pin-init/internal/src/pinned_drop.rs
+++ b/rust/pin-init/internal/src/pinned_drop.rs
@@ -1,9 +1,7 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
-#[cfg(not(kernel))]
-use proc_macro2 as proc_macro;
-
-use proc_macro::{TokenStream, TokenTree};
+use proc_macro2::{TokenStream, TokenTree};
+use quote::quote;
 
 pub(crate) fn pinned_drop(_args: TokenStream, input: TokenStream) -> TokenStream {
     let mut toks = input.into_iter().collect::<Vec<_>>();
diff --git a/rust/pin-init/internal/src/zeroable.rs b/rust/pin-init/internal/src/zeroable.rs
index e0ed3998445cf..d8a5ef3883f4b 100644
--- a/rust/pin-init/internal/src/zeroable.rs
+++ b/rust/pin-init/internal/src/zeroable.rs
@@ -1,10 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#[cfg(not(kernel))]
-use proc_macro2 as proc_macro;
-
 use crate::helpers::{parse_generics, Generics};
-use proc_macro::{TokenStream, TokenTree};
+use proc_macro2::{TokenStream, TokenTree};
+use quote::quote;
 
 pub(crate) fn parse_zeroable_derive_input(
     input: TokenStream,
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 147d0cc940681..d31d938886589 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -123,7 +123,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     append_crate(
         "pin_init_internal",
         srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
-        [],
+        ["std", "proc_macro", "proc_macro2", "quote", "syn"],
         cfg=["kernel"],
         is_proc_macro=True,
     )
-- 
2.51.2

