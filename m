Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FD7175A78;
	Thu, 19 Mar 2026 12:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773922657; cv=none; b=QpDAhwa+UBxIgV+vkoBd66erqtXQtbus9r7+HEhboXoyjV3b/eg4B7mAqAb7vchGCDMvoc2oBAWE+5st1UUKcNcPAwPxJdrcBj25dOryqPWKAcLjCoEHObi4vcRVQTq/XiylHKS9Ri4t1SwlDsIZfp3DDOg4n/v5wa43WdqBUvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773922657; c=relaxed/simple;
	bh=FTgI/2E15w1MV7z06iiOUAKthGNxsc3m6sOM8v7uICc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/ku8dvNhwIvchxnO1OTdNCQXDS7zrbIb49xJsSzLPWVy+2XzvQh+1i+ynPBq56kzfWzVbk8aZtK3WJ4IdKQ/xGYxNvotSkH2bDaeZ5rNE9SZgKkXHpBSyQnZZPhuSXg5bh8SGSDWbxpMcoQe4EeNY/ByKYEugLB0w/SXEHk+2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaJVO/Rd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaJVO/Rd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2EAC2BC87;
	Thu, 19 Mar 2026 12:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773922657;
	bh=FTgI/2E15w1MV7z06iiOUAKthGNxsc3m6sOM8v7uICc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=oaJVO/RdbnmttPe5DmrdFC3+yWHHuVsXJma7z0ITnJrcZOo5puSOAoWCdsED2BIMc
	 a9rS9sgGeBsnEslfQigqm1oxd62M6Nlb9dsM0dVbswAfW9Y/tKTfDCxY067htpkLRL
	 UBzChvoqTlFI80He4LMXdkh/I5O1rukSxu8QtCYhTzZBYQmhFxYXA3SN5/s0bEc4jf
	 1d+AMLt3ugmEV+/YxHQ5LSdH5pG9AGPILN7pyviAKr0PGdrolrAe4RxpQKVWpUA9au
	 SIprCwIarOcs4cwyM1dqlcLhaQTlbcLKo1EUV9yyhIKy1x8Y8pskkzN5v1zZoCkwxE
	 UeWkavm7ELlXg==
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
Cc: Yury Norov <ynorov@nvidia.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] rust: move `static_assert` into `build_assert`
Date: Thu, 19 Mar 2026 12:16:45 +0000
Message-ID: <20260319121653.2975748-2-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260319121653.2975748-1-gary@kernel.org>
References: <20260319121653.2975748-1-gary@kernel.org>
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
earlier in the pipeline. Consolidate the implementation so that we can use
this as the canonical place to add more useful build-time assertions.

Reviewed-by: Yury Norov <ynorov@nvidia.com>
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
index 34b924819288..f427cd3c8cce 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -151,7 +151,6 @@
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
-- 
2.51.2

