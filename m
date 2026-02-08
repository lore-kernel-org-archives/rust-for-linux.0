Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1302B665
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Feb 2026 22:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770590855; cv=none; b=ss60VG6hkWwyZtQvpUoQx1rTHAQw07b+oCb6fIrxFFwHUb6X0/e8VU4q53/lj8ZnnLkoBTisiUXdfhRWOSSUiQnhZgk8GDQh7bHpQreAnfB521WUqh4r3uxqcJaNHQ6Tbb8WZ2HShDwOnUJoefZiMtOF27t5WmUSVJinHBtnXF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770590855; c=relaxed/simple;
	bh=GpZt9WZ9KRMHsPGGlpQ+b1EE7WWH0fvGk428k8cAP38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRxtkx9bPQVd9tZiq9Ew/prKU77JjtB+Sh9bTEA6fUXB2xL0lDAsp+7QkiLiN0w/A++WssSfEN5rCbK6dYwr785CeRP5k7fYzUSIdaefCCEtfFIbK7urxuyVz9Yivd2c0YMKJAcAoC+AqPFFnr7B/05C4y1qLJvr4rabcqkX8a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNDgnhAM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNDgnhAM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A11C4CEF7;
	Sun,  8 Feb 2026 22:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770590855;
	bh=GpZt9WZ9KRMHsPGGlpQ+b1EE7WWH0fvGk428k8cAP38=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oNDgnhAMzLnbD6pQXQ1x4sVVloTnCPqOu8QrprPsEwik9Jv9+MZc42qRkEd70zedi
	 oUC6QfLR2VZbSwoQzZzxBneEvYVL2wEPhzkpdL85Q2EkEYwMTvwvws3OhrZ+wisP2J
	 tZnIbVMc4xD+IFtrPXAYsPiKDeMet6EVd6P79mOEuUTWjgfVsmca7DCvRKhuef3F4S
	 3E8IFY6oQKKlEHuRUwNoTiJu2gI3QoZmkafHk1LFJE2rju7aWH+LE+2rFrWfY71PDB
	 Gnlsp1B4nz3n4+5yR52c4+BMcWg9Lg0gZ/qEiS1AXicPBXpb2OsgjVGQxBfzISVwnf
	 NfhC8HktAOZhQ==
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
	rust-for-linux@vger.kernel.org
Subject: [PATCH 2/2] rust: std_vendor: add `{likely,unlikely,cold_path}()`
Date: Sun,  8 Feb 2026 23:46:59 +0100
Message-ID: <20260208224659.18406-3-ojeda@kernel.org>
In-Reply-To: <20260208224659.18406-1-ojeda@kernel.org>
References: <20260208224659.18406-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`cold_path` is becoming stable [1] in the upcoming Rust 1.95.0 (expected
2026-04-16).

`cold_path()` can be used directly, but it also allows us to provide
`likely()` and `unlikely()`, based on `cold_path()`, similar to the C
side ones.

For instance, given:

    fn f1(a: i32) -> i32 {
        if a < 0 {
            return 123;
        }

        42
    }

    fn f2(a: i32) -> i32 {
        if likely(a < 0) {
            return 124;
        }

        42
    }

    fn f3(a: i32) -> i32 {
        if unlikely(a < 0) {
            return 125;
        }

        42
    }

LLVM emits the same code it would for similar C functions:

    f1:
            test   %edi,%edi
            mov    $0x7b,%ecx
            mov    $0x2a,%eax
            cmovs  %ecx,%eax
            ret

    f2:
            mov    $0x7c,%eax
            test   %edi,%edi
        /-- jns    <f2+0xa>
        |   ret
        \-> mov    $0x2a,%eax
            ret

    f3:
            test   %edi,%edi
        /-- js     <f3+0xa>
        |   mov    $0x2a,%eax
        |   ret
        \-> mov    $0x7d,%eax
            ret

The feature itself, `feature(cold_path)`, was added in Rust 1.86.0
[2]. For context, Rust 1.85.0 is likely going to be our next minimum
supported version.

Previously, a PR in Rust 1.84.0 [3] fixed a number of issues with the
`likely()` and `unlikely()` intrinsics (by implementing them on top of
the new `cold_path()` intrinsic).

Thus add support for `cold_path()` by applying several approaches:

  - For Rust >= 1.86.0, `use` directly `core`'s `cold_path()`.

  - For Rust >= 1.84.0, we could choose to provide a no-op, but given Rust
    1.85.0 will likely be our next minimum, do some effort to support the
    feature by vendoring `core`'s implementation based on the intrinsic.

  - For older versions, provide a no-op implementation since it is simpler
    (there was no `cold_path()` intrinsic), since the other intrinsics
    (`{,un}likely()`) were fixed later and since we will bump the minimum
    soon anyway.

And, for all versions, simply provide `likely()` and `unlikely()` based
on `cold_path()`, by vendoring `core`'s version (saving a layer using
the intrinsics implementation).

In the future, if `likely()` and `unlikely()` become stable, we may want
to use them directly as well.

Now, in the C side, the `likely()` and `unlikely()` macros come
from `compiler.h`, which means it is pretty much available everywhere
directly. Thus just add these to the prelude (instead of e.g. re-exporting
them in the root or in a new `hint` module).

This will also mean less churn when we can remove the `cold_path()`
version from `std_vendor` (and potentially the other two too).

I tested that Rust 1.84.1 and 1.93.0 both generate the code above,
and that Rust 1.83.0 and 1.78.0 do not, as expected.

Link: https://github.com/rust-lang/rust/pull/151576 [1]
Link: https://github.com/rust-lang/rust/pull/133695 [2]
Link: https://github.com/rust-lang/rust/pull/120370 [3]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 init/Kconfig              |   6 ++
 rust/kernel/lib.rs        |   9 +++
 rust/kernel/prelude.rs    |   5 ++
 rust/kernel/std_vendor.rs | 144 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 164 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index fa79feb8fe57..410dd055db0f 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -169,6 +169,12 @@ config RUSTC_HAS_FILE_WITH_NUL
 config RUSTC_HAS_FILE_AS_C_STR
 	def_bool RUSTC_VERSION >= 109100
 
+config RUSTC_HAS_COLD_PATH_INTRINSIC
+	def_bool RUSTC_VERSION >= 108400
+
+config RUSTC_HAS_COLD_PATH
+	def_bool RUSTC_VERSION >= 108600
+
 config PAHOLE_VERSION
 	int
 	default $(shell,$(srctree)/scripts/pahole-version.sh $(PAHOLE))
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 696f62f85eb5..b07dff1b98db 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -37,6 +37,15 @@
 #![feature(const_ptr_write)]
 #![feature(const_refs_to_cell)]
 //
+// `feature(cold_path)` is stable since Rust 1.95.0 and available since Rust 1.86.0. For Rust 1.84
+// and 1.85, use the intrinsic. For older versions, use a no-op.
+#![cfg_attr(CONFIG_RUSTC_HAS_COLD_PATH, feature(cold_path))]
+#![cfg_attr(
+    all(not(CONFIG_RUSTC_HAS_COLD_PATH), CONFIG_RUSTC_HAS_COLD_PATH_INTRINSIC),
+    allow(internal_features),
+    feature(core_intrinsics)
+)]
+//
 // Expected to become stable.
 #![feature(arbitrary_self_types)]
 //
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 81a8cba66879..8297baa1a06f 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -98,6 +98,11 @@
     pr_notice,
     pr_warn,
     static_assert,
+    std_vendor::{
+        cold_path,
+        likely,
+        unlikely, //
+    },
     str::{
         CStrExt as _, //
     },
diff --git a/rust/kernel/std_vendor.rs b/rust/kernel/std_vendor.rs
index abbab5050cc5..7cd6f513e280 100644
--- a/rust/kernel/std_vendor.rs
+++ b/rust/kernel/std_vendor.rs
@@ -162,3 +162,147 @@ macro_rules! dbg {
         ($($crate::dbg!($val)),+,)
     };
 }
+
+/// Hints to the compiler that a branch condition is likely to be true.
+/// Returns the value passed to it.
+///
+/// It can be used with `if` or boolean `match` expressions.
+///
+/// When used outside of a branch condition, it may still influence a nearby branch, but
+/// probably will not have any effect.
+///
+/// It can also be applied to parts of expressions, such as `likely(a) && unlikely(b)`, or to
+/// compound expressions, such as `likely(a && b)`. When applied to compound expressions, it has
+/// the following effect:
+/// ```text
+///     likely(!a) => !unlikely(a)
+///     likely(a && b) => likely(a) && likely(b)
+///     likely(a || b) => a || likely(b)
+/// ```
+///
+/// See also the function [`cold_path()`] which may be more appropriate for idiomatic Rust code.
+///
+/// # Examples
+///
+/// ```
+/// fn foo(x: i32) {
+///     if likely(x > 0) {
+///         pr_info!("this branch is likely to be taken\n");
+///     } else {
+///         pr_info!("this branch is unlikely to be taken\n");
+///     }
+///
+///     match likely(x > 0) {
+///         true => pr_info!("this branch is likely to be taken\n"),
+///         false => pr_info!("this branch is unlikely to be taken\n"),
+///     }
+///
+///     // Use outside of a branch condition may still influence a nearby branch
+///     let cond = likely(x != 0);
+///     if cond {
+///         pr_info!("this branch is likely to be taken\n");
+///     }
+/// }
+/// ```
+// This implementation is taken from `core::intrinsics::likely()`, not the `hint` wrapper.
+#[inline(always)]
+pub const fn likely(b: bool) -> bool {
+    if b {
+        true
+    } else {
+        cold_path();
+        false
+    }
+}
+
+/// Hints to the compiler that a branch condition is unlikely to be true.
+/// Returns the value passed to it.
+///
+/// It can be used with `if` or boolean `match` expressions.
+///
+/// When used outside of a branch condition, it may still influence a nearby branch, but
+/// probably will not have any effect.
+///
+/// It can also be applied to parts of expressions, such as `likely(a) && unlikely(b)`, or to
+/// compound expressions, such as `unlikely(a && b)`. When applied to compound expressions, it has
+/// the following effect:
+/// ```text
+///     unlikely(!a) => !likely(a)
+///     unlikely(a && b) => a && unlikely(b)
+///     unlikely(a || b) => unlikely(a) || unlikely(b)
+/// ```
+///
+/// See also the function [`cold_path()`] which may be more appropriate for idiomatic Rust code.
+///
+/// # Examples
+///
+/// ```
+/// fn foo(x: i32) {
+///     if unlikely(x > 0) {
+///         pr_info!("this branch is unlikely to be taken\n");
+///     } else {
+///         pr_info!("this branch is likely to be taken\n");
+///     }
+///
+///     match unlikely(x > 0) {
+///         true => pr_info!("this branch is unlikely to be taken\n"),
+///         false => pr_info!("this branch is likely to be taken\n"),
+///     }
+///
+///     // Use outside of a branch condition may still influence a nearby branch
+///     let cond = unlikely(x != 0);
+///     if cond {
+///         pr_info!("this branch is likely to be taken\n");
+///     }
+/// }
+/// ```
+// This implementation is taken from `core::intrinsics::unlikely()`, not the `hint` wrapper.
+#[inline(always)]
+pub const fn unlikely(b: bool) -> bool {
+    if b {
+        cold_path();
+        true
+    } else {
+        false
+    }
+}
+
+/// Hints to the compiler that given path is cold, i.e., unlikely to be taken. The compiler may
+/// choose to optimize paths that are not cold at the expense of paths that are cold.
+///
+/// Note that like all hints, the exact effect to codegen is not guaranteed. Using `cold_path`
+/// can actually *decrease* performance if the branch is called more than expected. It is advisable
+/// to perform benchmarks to tell if this function is useful.
+///
+/// # Examples
+///
+/// ```
+/// fn foo(x: &[i32]) {
+///     if let Some(first) = x.first() {
+///         // this is the fast path
+///     } else {
+///         // this path is unlikely
+///         cold_path();
+///     }
+/// }
+///
+/// fn bar(x: i32) -> i32 {
+///     match x {
+///         1 => 10,
+///         2 => 100,
+///         3 => { cold_path(); 1000 }, // this branch is unlikely
+///         _ => { cold_path(); 10000 }, // this is also unlikely
+///     }
+/// }
+/// ```
+///
+/// See also the [`likely()`] and [`unlikely()`] functions, which are similar to the C side macros.
+#[cfg(not(CONFIG_RUSTC_HAS_COLD_PATH))]
+#[inline(always)]
+pub const fn cold_path() {
+    #[cfg(CONFIG_RUSTC_HAS_COLD_PATH_INTRINSIC)]
+    core::intrinsics::cold_path()
+}
+
+#[cfg(CONFIG_RUSTC_HAS_COLD_PATH)]
+pub use core::hint::cold_path;
-- 
2.53.0

