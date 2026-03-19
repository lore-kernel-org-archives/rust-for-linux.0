Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C2F3B6BEC;
	Thu, 19 Mar 2026 09:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913217; cv=none; b=cZ8UIY3TbioXyuJiJe6dNCZl5pkZr1yr8vpyK1RUG8vUaK+hgtr3kCL6EM2fX8IE/rL1vm4aoIuTtmJqM2Sk08qXlkY1cZXsWbMIyftQBM7zKYtP5zgzGz4e+ZKOGSPnFz2AnCZrESlFJqwX2bisa8ZG7ZK/cLt2uaOaQtfVlvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913217; c=relaxed/simple;
	bh=HI5b4jpvww4hkePAlNaFzp+T5IYdYgCtTajIoN43geo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QWqPV6ySH2HHFeQZpaV4sJ05WfNzrUWwVJWtqw0modIoclr8kOKgyJOSoMJL8KkyYvxW9WPIhXcZIrhSPmOdJWDogbri7XeNkYCunP0D9s62Qg5RfyTPyJt5oGIeLxIjUp7emZLMCGBV6owq7A2d11DYQ6RaKEZw0u/RCub4WxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LY1/1vDX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LY1/1vDX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D69C2BC87;
	Thu, 19 Mar 2026 09:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773913216;
	bh=HI5b4jpvww4hkePAlNaFzp+T5IYdYgCtTajIoN43geo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LY1/1vDXnLm2LkOGy5WW20yjUvKZBZr/Ao0oprPduNDyX6tITkkhVRdrc+AQouNgr
	 hsFHol+57ETq6+N17aCs6mr/3mKmdmP9idljpcFDwFjFDDEnghYNPfkydKn5GJUd/F
	 AAgVWEOoX+Q4AqQTlb5AoQ7jZZ6931PTimSk/6tNQGEF5msPFFRJuElHhxy4DhaKHH
	 2pAYDv5oxF2TeSgelE39ZL4cmM69XYOs7QXPrxH5gtxFLWZS3SyhVvbCCO4Sj8HLnm
	 8rttNGbZVtX+6fz273QTUUP2X2wccbE7zRkEUa6sQs0EXmxL91NIF1rMJRHvBDMDGV
	 oAa5uMm+T4e8w==
From: Benno Lossin <lossin@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Antonio Hickey <contact@antoniohickey.com>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Oleksandr Babak <alexanderbabak@proton.me>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] rust: pin-init: build: simplify use of nightly features
Date: Thu, 19 Mar 2026 10:35:24 +0100
Message-ID: <20260319093542.3756606-2-lossin@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319093542.3756606-1-lossin@kernel.org>
References: <20260319093542.3756606-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

We use some features that are already stable in later versions of Rust,
but only available as unstable features in older Rust versions that the
kernel needs to support.

Instead of checking if a feature is already stable, simply enable them
and allow the warning if the feature is already stable. This avoids the
need of hardcoding whether a feature has been stabilized at a given
version.

`#[feature(...)]` is used when cfg `USE_RUSTC_FEATURES` is enabled. The
build script automatically does this when a nightly compiler is detected
or `RUSTC_BOOTSTRAP` is set.

Signed-off-by: Gary Guo <gary@garyguo.net>
Link: https://github.com/Rust-for-Linux/pin-init/commit/885c5d83d7eb778a796d4a17380a0898b0d0a571
[ Added kernel build system changes to always enable USE_RUSTC_FEATURES.
  Moved this commit earlier (swapped with the next one) to avoid a build
  error. - Benno ]
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/Makefile                           | 4 ++--
 rust/pin-init/examples/linked_list.rs   | 2 +-
 rust/pin-init/examples/mutex.rs         | 2 +-
 rust/pin-init/examples/pthread_mutex.rs | 2 +-
 rust/pin-init/examples/static_init.rs   | 2 +-
 rust/pin-init/internal/src/lib.rs       | 2 +-
 rust/pin-init/src/lib.rs                | 7 ++-----
 7 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 9801af2e1e02..e92daeb3542b 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -118,7 +118,7 @@ syn-flags := \
     $(call cfgs-to-flags,$(syn-cfgs))
 
 pin_init_internal-cfgs := \
-    kernel
+    kernel USE_RUSTC_FEATURES
 
 pin_init_internal-flags := \
     --extern proc_macro2 \
@@ -127,7 +127,7 @@ pin_init_internal-flags := \
     $(call cfgs-to-flags,$(pin_init_internal-cfgs))
 
 pin_init-cfgs := \
-    kernel
+    kernel USE_RUSTC_FEATURES
 
 pin_init-flags := \
     --extern pin_init_internal \
diff --git a/rust/pin-init/examples/linked_list.rs b/rust/pin-init/examples/linked_list.rs
index 8445a5890cb7..226e33e4a957 100644
--- a/rust/pin-init/examples/linked_list.rs
+++ b/rust/pin-init/examples/linked_list.rs
@@ -2,7 +2,7 @@
 
 #![allow(clippy::undocumented_unsafe_blocks)]
 #![cfg_attr(feature = "alloc", feature(allocator_api))]
-#![cfg_attr(not(RUSTC_LINT_REASONS_IS_STABLE), feature(lint_reasons))]
+#![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
 
 use core::{
     cell::Cell,
diff --git a/rust/pin-init/examples/mutex.rs b/rust/pin-init/examples/mutex.rs
index 9f295226cd64..e534c367f644 100644
--- a/rust/pin-init/examples/mutex.rs
+++ b/rust/pin-init/examples/mutex.rs
@@ -2,7 +2,7 @@
 
 #![allow(clippy::undocumented_unsafe_blocks)]
 #![cfg_attr(feature = "alloc", feature(allocator_api))]
-#![cfg_attr(not(RUSTC_LINT_REASONS_IS_STABLE), feature(lint_reasons))]
+#![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
 #![allow(clippy::missing_safety_doc)]
 
 use core::{
diff --git a/rust/pin-init/examples/pthread_mutex.rs b/rust/pin-init/examples/pthread_mutex.rs
index 4e082ec7d5de..562ca5d3d08c 100644
--- a/rust/pin-init/examples/pthread_mutex.rs
+++ b/rust/pin-init/examples/pthread_mutex.rs
@@ -3,7 +3,7 @@
 // inspired by <https://github.com/nbdd0121/pin-init/blob/trunk/examples/pthread_mutex.rs>
 #![allow(clippy::undocumented_unsafe_blocks)]
 #![cfg_attr(feature = "alloc", feature(allocator_api))]
-#![cfg_attr(not(RUSTC_LINT_REASONS_IS_STABLE), feature(lint_reasons))]
+#![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
 
 #[cfg(not(windows))]
 mod pthread_mtx {
diff --git a/rust/pin-init/examples/static_init.rs b/rust/pin-init/examples/static_init.rs
index 0e165daa9798..df562134a53c 100644
--- a/rust/pin-init/examples/static_init.rs
+++ b/rust/pin-init/examples/static_init.rs
@@ -2,7 +2,7 @@
 
 #![allow(clippy::undocumented_unsafe_blocks)]
 #![cfg_attr(feature = "alloc", feature(allocator_api))]
-#![cfg_attr(not(RUSTC_LINT_REASONS_IS_STABLE), feature(lint_reasons))]
+#![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
 #![allow(unused_imports)]
 
 use core::{
diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src/lib.rs
index 08372c8f65f0..b08dfe003031 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -6,7 +6,7 @@
 
 //! `pin-init` proc macros.
 
-#![cfg_attr(not(RUSTC_LINT_REASONS_IS_STABLE), feature(lint_reasons))]
+#![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
 // Documentation is done in the pin-init crate instead.
 #![allow(missing_docs)]
 
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index fe4c85ae3f02..b1de166b5626 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -264,12 +264,9 @@
 //! [`impl Init<T, E>`]: crate::Init
 //! [Rust-for-Linux]: https://rust-for-linux.com/
 
-#![cfg_attr(not(RUSTC_LINT_REASONS_IS_STABLE), feature(lint_reasons))]
+#![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
 #![cfg_attr(
-    all(
-        any(feature = "alloc", feature = "std"),
-        not(RUSTC_NEW_UNINIT_IS_STABLE)
-    ),
+    all(any(feature = "alloc", feature = "std"), USE_RUSTC_FEATURES),
     feature(new_uninit)
 )]
 #![forbid(missing_docs, unsafe_op_in_unsafe_fn)]
-- 
2.53.0

