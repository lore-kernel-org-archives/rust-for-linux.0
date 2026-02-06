Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF023A0B29;
	Fri,  6 Feb 2026 17:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770397999; cv=none; b=G/wHg8hvnexsx4rGLrRDQ+BpPfoH9sSa+NI2M9BRZDAvxutxr13pWAjHwnIdHTMsjDvKDWx0PPBQ51pn6mo3nwdozTslW6xoWwtrTpQlyeUI/WXvmaNtesDV8Re/xomWuffYu7nGna+La4EyN5TeiqoI01LRfbsKOGb3IXEw7lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770397999; c=relaxed/simple;
	bh=CuTe2C8S6JkqooxOTqVYg0ki1aSAAK5MKIyeq24Arug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yzc7C7upoz0/3HShQzmjfnUrdjhp0D7rQ/g1IuHs/z1zyDh62MR6AzPR4bO63zrFaO1xvmtiG84FEV91aKPgJCA/nUauOdvUke5XAny7LqhYl+K/Pz6mqyWfxIdDS5S3Coh2AKSr0YrEMr2IW5DwQjf4alvKRJV20xkaCG7vWGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2kJCUeE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2kJCUeE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC69FC19422;
	Fri,  6 Feb 2026 17:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770397998;
	bh=CuTe2C8S6JkqooxOTqVYg0ki1aSAAK5MKIyeq24Arug=;
	h=From:To:Cc:Subject:Date:Reply-To:From;
	b=W2kJCUeE3oIVLhzfF8OGMsL1JZ/Zlb0aO4omeYzLjfa9p+LMtaWXTePuc+ZZbN/C7
	 +f7hIsxplIc9GCRqYd60DB5p81oiDXdhj+J2pOm2kMcBhY6bz49xwJ4KA/DMrHk/eV
	 D8Ukui8ScRxanzFGyYxYJK21n5h2kvyPYBKHcaRUVwZ3eM4ZR69Kb6JAmldXaBbTu5
	 JK5rh05DwcyhU2cljBv0NOwt60hcz742d7nvkCapjcIgkwvCY3jP/R1Dj+OMEp2ZBa
	 573YwLHDAgRGAacN4iSbsWLZecPniwYBt0R8J5hT/IVYj44hASfuoiG1u6sDfa4qjS
	 Nxv9ReQ78iXxg==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 1/2] rust: move `static_assert` into `build_assert`
Date: Fri,  6 Feb 2026 17:12:49 +0000
Message-ID: <20260206171253.2704684-1-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Conceptually, `static_assert` is also a build-time assertion that occurs
earlier in the pipeline. Conslidate the implementation so that we can use
this as the canonical place to add more useful build-time assertions.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/build_assert.rs  | 40 +++++++++++++++++++++++++++++++++---
 rust/kernel/lib.rs           |  1 -
 rust/kernel/prelude.rs       |  4 +---
 rust/kernel/static_assert.rs | 39 -----------------------------------
 4 files changed, 38 insertions(+), 46 deletions(-)
 delete mode 100644 rust/kernel/static_assert.rs

diff --git a/rust/kernel/build_assert.rs b/rust/kernel/build_assert.rs
index f8124dbc663f..d464494d430a 100644
--- a/rust/kernel/build_assert.rs
+++ b/rust/kernel/build_assert.rs
@@ -1,10 +1,46 @@
 // SPDX-License-Identifier: GPL-2.0
 
-//! Build-time assert.
+//! Various assertions that happen during build-time.
 
 #[doc(hidden)]
 pub use build_error::build_error;
 
+/// Static assert (i.e. compile-time assert).
+///
+/// Similar to C11 [`_Static_assert`] and C++11 [`static_assert`].
+///
+/// An optional panic message can be supplied after the expression.
+/// Currently only a string literal without formatting is supported
+/// due to constness limitations of the [`assert!`] macro.
+///
+/// The feature may be added to Rust in the future: see [RFC 2790].
+///
+/// [`_Static_assert`]: https://en.cppreference.com/w/c/language/_Static_assert
+/// [`static_assert`]: https://en.cppreference.com/w/cpp/language/static_assert
+/// [RFC 2790]: https://github.com/rust-lang/rfcs/issues/2790
+///
+/// # Examples
+///
+/// ```
+/// static_assert!(42 > 24);
+/// static_assert!(core::mem::size_of::<u8>() == 1);
+///
+/// const X: &[u8] = b"bar";
+/// static_assert!(X[1] == b'a');
+///
+/// const fn f(x: i32) -> i32 {
+///     x + 2
+/// }
+/// static_assert!(f(40) == 42);
+/// static_assert!(f(40) == 42, "f(x) must add 2 to the given input.");
+/// ```
+#[macro_export]
+macro_rules! static_assert {
+    ($condition:expr $(,$arg:literal)?) => {
+        const _: () = ::core::assert!($condition $(,$arg)?);
+    };
+}
+
 /// Fails the build if the code path calling `build_error!` can possibly be executed.
 ///
 /// If the macro is executed in const context, `build_error!` will panic.
@@ -74,8 +110,6 @@ macro_rules! build_error {
 ///     assert!(n > 1); // Run-time check
 /// }
 /// ```
-///
-/// [`static_assert!`]: crate::static_assert!
 #[macro_export]
 macro_rules! build_assert {
     ($cond:expr $(,)?) => {{
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 42120b0b45da..0cbc91695f57 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -141,7 +141,6 @@
 pub mod slice;
 #[cfg(CONFIG_SOC_BUS)]
 pub mod soc;
-mod static_assert;
 #[doc(hidden)]
 pub mod std_vendor;
 pub mod str;
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 2877e3f7b6d3..c7e91b80d301 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -29,7 +29,7 @@
 
 pub use pin_init::{init, pin_data, pin_init, pinned_drop, InPlaceWrite, Init, PinInit, Zeroable};
 
-pub use super::{build_assert, build_error};
+pub use super::{build_assert, build_error, static_assert};
 
 // `super::std_vendor` is hidden, which makes the macro inline for some reason.
 #[doc(no_inline)]
@@ -39,8 +39,6 @@
 
 pub use super::{try_init, try_pin_init};
 
-pub use super::static_assert;
-
 pub use super::error::{code::*, Error, Result};
 
 pub use super::{str::CStrExt as _, ThisModule};
diff --git a/rust/kernel/static_assert.rs b/rust/kernel/static_assert.rs
deleted file mode 100644
index a57ba14315a0..000000000000
--- a/rust/kernel/static_assert.rs
+++ /dev/null
@@ -1,39 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-//! Static assert.
-
-/// Static assert (i.e. compile-time assert).
-///
-/// Similar to C11 [`_Static_assert`] and C++11 [`static_assert`].
-///
-/// An optional panic message can be supplied after the expression.
-/// Currently only a string literal without formatting is supported
-/// due to constness limitations of the [`assert!`] macro.
-///
-/// The feature may be added to Rust in the future: see [RFC 2790].
-///
-/// [`_Static_assert`]: https://en.cppreference.com/w/c/language/_Static_assert
-/// [`static_assert`]: https://en.cppreference.com/w/cpp/language/static_assert
-/// [RFC 2790]: https://github.com/rust-lang/rfcs/issues/2790
-///
-/// # Examples
-///
-/// ```
-/// static_assert!(42 > 24);
-/// static_assert!(core::mem::size_of::<u8>() == 1);
-///
-/// const X: &[u8] = b"bar";
-/// static_assert!(X[1] == b'a');
-///
-/// const fn f(x: i32) -> i32 {
-///     x + 2
-/// }
-/// static_assert!(f(40) == 42);
-/// static_assert!(f(40) == 42, "f(x) must add 2 to the given input.");
-/// ```
-#[macro_export]
-macro_rules! static_assert {
-    ($condition:expr $(,$arg:literal)?) => {
-        const _: () = ::core::assert!($condition $(,$arg)?);
-    };
-}

base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
-- 
2.51.2

