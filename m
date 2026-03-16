Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1EA39EF09;
	Mon, 16 Mar 2026 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673704; cv=none; b=Doot8Je2yrIanuF7Q7b2iJ8tAAI+rXxbjbDvPuzwPC11st5cm9sInTZr1Phig3WlUhcu/IQqTf+WNzFRMJ3FAVuB+FWrWzKB/JrMFrvTmKIpgZc7kvXr2ExIxPp2kIx8Usg7Uojtw1jAHCUi3MZMxWtuKCbytleYk/+CV2v9WFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673704; c=relaxed/simple;
	bh=LZmn1d3ABpAeGow9rGdXXGlf0PoIpVGtJErQ4500Qrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MseMCVqMmM4yByGL3HNYhNf19SjfixziNC8C2x28ThntvxflkaGjcgtLuwAA/+QH2pFctLuznJnKkcbXTFSadymttVkymw2vlgqDXQM7sXAxSLbPqsNuEWmh+fyB6Yb3H1j/nOobKXDMS/34oMQMhhu6jhr2HMhc4QrUzJWbqhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wu/W7V2d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wu/W7V2d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9157FC19425;
	Mon, 16 Mar 2026 15:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773673703;
	bh=LZmn1d3ABpAeGow9rGdXXGlf0PoIpVGtJErQ4500Qrc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=Wu/W7V2dt/UwYJMZZjXe04LZqxUPWGepomLzHVpKv0ICJJ/j93NXGGpYoyEvawpcK
	 4616HcW6Bby8PH3CkmZNdSqe+7qPBUwuyXxTYBxg5TPupx/vdTfy7D/+1HvZO+eSGF
	 y6KxCkz6xCHsyPV9F/ycz1zMrW+8PFuVY55TyqtixHokqXetAfR2kes+81eAgX+GJc
	 1UF0hiUfpjfyC4C5l11VmgbVRqoNb26FFjZnGSnnTmG8ueD7zXuWKJmi7Bwy3/vYdx
	 xNE9nxkwuTjdZWc1jIOI+3iCX+OKYJ+kefrPvSUaPyfbuQjshfN0Lm4/NSTe/QlKnC
	 vZBAbej/d1ntQ==
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
Cc: Yury Norov <yury.norov@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] rust: rework `build_assert!` documentation
Date: Mon, 16 Mar 2026 15:07:14 +0000
Message-ID: <20260316150720.1646109-4-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260316150720.1646109-1-gary@kernel.org>
References: <20260316150720.1646109-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Add a detailed comparison and recommendation of the three types of
build-time assertion macro as module documentation (and un-hide the module
to render them).

The documentation on the macro themselves are simplified to only cover the
scenarios where they should be used; links to the module documentation is
added instead.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/build_assert.rs | 113 +++++++++++++++++++++++++++---------
 rust/kernel/lib.rs          |   1 -
 2 files changed, 87 insertions(+), 27 deletions(-)

diff --git a/rust/kernel/build_assert.rs b/rust/kernel/build_assert.rs
index 51c0f85a9014..acdfcbeb73f3 100644
--- a/rust/kernel/build_assert.rs
+++ b/rust/kernel/build_assert.rs
@@ -1,6 +1,72 @@
 // SPDX-License-Identifier: GPL-2.0
 
 //! Various assertions that happen during build-time.
+//!
+//! There are three types of build-time assertions that you can use:
+//! - [`static_assert!`]
+//! - [`const_assert!`]
+//! - [`build_assert!`]
+//!
+//! The ones towards the bottom of the list are more expressive, while the ones towards the top of
+//! the list are more robust and trigger earlier in the compilation pipeline. Therefore, you should
+//! prefer the ones towards the top of the list wherever possible.
+//!
+//! # Choosing the correct assertion
+//!
+//! If you're asserting outside any bodies (e.g. initializers or function bodies), you should use
+//! [`static_assert!`] as it is the only assertion that can be used in that context.
+//!
+//! Inside bodies, if your assertion condition does not depend on any variable or generics, you
+//! should use [`static_assert!`]. If the condition depends on generics, but not variables (including
+//! function arguments), you should use [`const_assert!`]. Otherwise, use [`build_assert!`].
+//! The same is true regardless if the function is `const fn`.
+//!
+//! ```
+//! // Outside any bodies
+//! static_assert!(core::mem::size_of::<u8>() == 1);
+//! // `const_assert!` and `build_assert!` cannot be used here, they will fail to compile.
+//!
+//! #[inline(always)]
+//! fn foo<const N: usize>(v: usize) {
+//!     static_assert!(core::mem::size_of::<u8>() == 1); // Preferred
+//!     const_assert!(core::mem::size_of::<u8>() == 1); // Discouraged
+//!     build_assert!(core::mem::size_of::<u8>() == 1); // Discouraged
+//!
+//!     // `static_assert!(N > 1);` is not allowed
+//!     const_assert!(N > 1); // Preferred
+//!     build_assert!(N > 1); // Discouraged
+//!
+//!     // `static_assert!(v > 1);` is not allowed
+//!     // `const_assert!(v > 1);` is not allowed
+//!     build_assert!(v > 1); // Works
+//! }
+//! ```
+//!
+//! # Detailed behavior
+//!
+//! `static_assert!()` is equivalent to `static_assert` in C. It requires `expr` to be a constant
+//! expression. This expression cannot refer to any generics. A `static_assert!(expr)` in a program
+//! is always evaluated, regardless if the function it appears in is used or not. This is also the
+//! only usable assertion outside a body.
+//!
+//! `const_assert!()` has no direct C equivalence. It is a more powerful version of
+//! `static_assert!()`, where it may refer to generics in a function. Note that due to the ability
+//! to refer to generics, the assertion is tied to a specific instance of a function. So if it is
+//! used in a generic function that is not instantiated, the assertion will not be checked. For this
+//! reason, `static_assert!()` is preferred wherever possible.
+//!
+//! `build_assert!()` is equivalent to `BUILD_BUG_ON`. It is even more powerful than
+//! `const_assert!()` because it can be used to check tautologies that depend on runtime value (this
+//! is the same as `BUILD_BUG_ON`). However, the assertion failure mechanism can possibly be undefined
+//! symbols and linker errors, it is not developer friendly to debug, so it is recommended to avoid it
+//! and prefer other two assertions where possible.
+
+pub use crate::{
+    build_assert,
+    build_error,
+    const_assert,
+    static_assert, //
+};
 
 #[doc(hidden)]
 pub use build_error::build_error;
@@ -15,6 +81,10 @@
 ///
 /// The feature may be added to Rust in the future: see [RFC 2790].
 ///
+/// You cannot refer to generics or variables with [`static_assert!`]. If you need to refer to
+/// generics, use [`const_assert!`]; if you need to refer to variables, use [`build_assert!`]. See
+/// the [module documentation](self).
+///
 /// [`_Static_assert`]: https://en.cppreference.com/w/c/language/_Static_assert
 /// [`static_assert`]: https://en.cppreference.com/w/cpp/language/static_assert
 /// [RFC 2790]: https://github.com/rust-lang/rfcs/issues/2790
@@ -47,6 +117,10 @@ macro_rules! static_assert {
 /// or implementation blocks. However, it also has a limitation where it can only appear in places
 /// where statements can appear; for example, you cannot use it as an item in the module.
 ///
+/// [`static_assert!`] should be preferred if no generics are referred to in the condition. You
+/// cannot refer to variables with [`const_assert!`] (even inside `const fn`); if you need the
+/// capability, use [`build_assert!`]. See the [module documentation](self).
+///
 /// # Examples
 ///
 /// ```
@@ -98,41 +172,28 @@ macro_rules! build_error {
 /// will panic. If the compiler or optimizer cannot guarantee the condition will
 /// be evaluated to `true`, a build error will be triggered.
 ///
-/// [`static_assert!`] should be preferred to `build_assert!` whenever possible.
+/// If the assertion condition does not depend on any variables or generics, you should use
+/// [`static_assert!`]. If the assertion condition does not depend on variables, but does depend on
+/// generics, you should use [`const_assert!`]. See the [module documentation](self).
 ///
 /// # Examples
 ///
-/// These examples show that different types of [`assert!`] will trigger errors
-/// at different stage of compilation. It is preferred to err as early as
-/// possible, so [`static_assert!`] should be used whenever possible.
-/// ```ignore
-/// fn foo() {
-///     static_assert!(1 > 1); // Compile-time error
-///     build_assert!(1 > 1); // Build-time error
-///     assert!(1 > 1); // Run-time error
-/// }
 /// ```
+/// #[inline(always)]
+/// fn bar(n: usize) {
+///     build_assert!(n > 1);
+/// }
 ///
-/// When the condition refers to generic parameters or parameters of an inline function,
-/// [`static_assert!`] cannot be used. Use `build_assert!` in this scenario.
-/// ```
-/// fn foo<const N: usize>() {
-///     // `static_assert!(N > 1);` is not allowed
-///     build_assert!(N > 1); // Build-time check
-///     assert!(N > 1); // Run-time check
+/// fn foo() {
+///     bar(1);
 /// }
-/// ```
 ///
-/// When a condition depends on a function argument, the function must be annotated with
-/// `#[inline(always)]`. Without this attribute, the compiler may choose to not inline the
-/// function, preventing it from optimizing out the error path.
-/// ```
 /// #[inline(always)]
-/// fn bar(n: usize) {
-///     // `static_assert!(n > 1);` is not allowed
-///     build_assert!(n > 1); // Build-time check
-///     assert!(n > 1); // Run-time check
+/// const fn const_bar(n: usize) {
+///     build_assert!(n > 1);
 /// }
+///
+/// const _: () = const_bar(2);
 /// ```
 #[macro_export]
 macro_rules! build_assert {
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index d590f7af54bf..1857e06e51f3 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -77,7 +77,6 @@
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
 pub mod bug;
-#[doc(hidden)]
 pub mod build_assert;
 pub mod clk;
 #[cfg(CONFIG_CONFIGFS_FS)]
-- 
2.51.2

