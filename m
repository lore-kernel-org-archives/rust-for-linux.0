Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC5E22157B
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Oct 2026 22:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791586003; cv=none; b=Yly41/g2iRwjt7lae3NiLaQNbqQrSPLCp/t8dR49JbhPwhQdz7QW/kQj9jf763z4/oRiuSDIMIf8GCRuwi49Ih1Vc30Vdl9uKcc0Jgj9zlC9JKQ+/6WxlCSCjWVoURv83XomzXJxqc765mrTZoi5QGrqlH1mSf0ejRfNBRmd4+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791586003; c=relaxed/simple;
	bh=bKtGtaIhQCInA14eqbTuf4/QjoVboCz61Bz4uoSDKr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f7zxjS+xSXvWn1xLLffzy2j1Fq+pyQp8JBZFyIzDhKhsUPEf9Juapfk+6tnJeH7gTwKp4iU1Ka4dEf/n5NzJ2fltwERbLHyBY+xUlxVJurtgeIzMqtAFIHjo8PJjUP93r25VafINn9FGCC4tL2kRwz8KBmtHmNShkVoYeSfvTCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=X7fsPPco; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hJqVCTiI; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="X7fsPPco";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hJqVCTiI"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 1D1F5EC0B24
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Oct 2026 18:46:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 09 Oct 2026 18:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1791585999; x=1791672399; bh=mkIP42VHgwkmIE+UPnGp1
	Vt0ihKOvnDp1H3eWjrWOEg=; b=X7fsPPcoSjPVaQGCv+0UhPruuOUjareYoKliH
	Fqf8NTJTxUa8F2cYoUEOaygbse4sywTO6hY8OZ266DrFzd87EmLTuhS/Jooo2lae
	BkL8dVMXhvV6+tlCJOiGLiNxAEeuGUmLtJEBA8/OVluXJFbWaAzRUPajwul0VKVy
	7R67t92wlvU75YGUZeMJRDVfmIVznHdcaGmz2LDGjZ7YynD5QfCnJW0vVfU22eM0
	ZSigZ/vfHkpryNdn0vH3I17rw2NA9llLRxEHxAd6wWk196/JMoLosdCapLjs28tJ
	ePlc7+y/GJ0dOU52+cwgi2N7YMVbK9wrpRUZQfKNNrNKcnW+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791585999; x=1791672399; bh=mkIP42VHgwkmIE+UPnGp1Vt0ihKOvnDp1H3
	eWjrWOEg=; b=hJqVCTiIjLZ25BsLcubJWuopXJpPXr9XYXyD8ZYA8ZxXOIPEWQz
	BvT9pUpTyzp83RJbhLba3+LrgZQXagsSKxgFA0h1fVKbdxEnLam70XbAzpUyoFrS
	yz1mqR2ARweAoA+me2Mds6Sxilf1tAR5EaI4yOPxUfBxjw1K1PuHTVpPORMll8yj
	3NvViV9BaRukuk/qwdrCWDFpWov8pPfiJ1rx1WBW6+gPTcQNToEnoN2mEeyRIAFS
	rucjIiINwGMY54LNBXWwNC/H11yZCIUdomVOgU+kca8LbBSDaeHboiAYfJr4On3c
	yAtPj90mtYOmuqV2p4PcFbE3StuxEAga/og==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791585999; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:WA5Z2v7q5hUxJcTO9Us2L1AplDLzxOihmfwttwU+JaGGTuq
	ZEPKP5GdBtCbQAUr2lx6i1VDx4m3a1wOz9mTl1Zf2U6O47X8sgRtQRK4rMDzq+z3
	wgOUFzXbaiWoDCPFOWLib+krAup1zN57GIPK1GiU5DI2NHDmenxdGVpao4sDS7SM
	Q6CnhRcVuTWHgT3Ibmc95ZHBGt6HuO6183fiv15CSlt6BZX/J/tNqyno7n8WTmhn
	lDZAV5/0Wpn4kCQOAblUgdyGG1pdPp+CIgkzYn3jdL5b74YPbuNLbcOAF+RWWuCL
	pcSY0W9SEpUGUDk883YMGIkgpsstF0FCcvQ3+YA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:FuoV4HKgnjhPBmGA16/VoatgFClQyk1RpaZfG3T8ob8=:bKtGtaIhQCInA14eqbTuf4/QjoVboCz61Bz4uoSDKr4=;
X-ME-Sender: <xms:z27JahMiyPvINyWxu0R6oCPCJp4wl_jbV-Xw3t63HgQYmwQu1L1glA>
    <xme:z27JagUUOCdmCkp6Fd54q4Wh_naK3XvfYo1u2gwd0OB5mQYk0E93STh1Mzs_Crqef
    baZytj9glWO8i00OfFOlXGJmJbyOFadGabFD-Z5cIvYujldz3W-q0E>
X-ME-Received: <xmr:z27JakuVNCLwhiQ3RCBRBOhvGM19wh6r954_OygjQ7FP_jfmq3KkeZb-RbVpHZ-3eVhqbVU5ZPoKgAeskb0>
X-ME-Proxy-Cause: dmFkZTFWd/oDNjY0V4fT1DDe+102nGtXLgTQmKRWsYdL6Kl5HDEEkYTR0XwqqW/jy9FP4f
    HA6oGkdXzkxr79WPfC4cL3B9DolTvh+QU8H7LkvB/3DFcNfVMqcXxO7cJ0ifJprmAl9g1o
    cXgKy4/Uw3moogJpC1o1T+H18ytJzTX7huj4SUQK7obHEFGbeYkxPPXJoeG6OeZrQepJ98
    mnkGV59Ohe6h3vDGWtv+NjOXd5ytkh2ZA2IZnI8Hu03bwF/Qhg3gD2J58csZFCL4SlaBW6
    JN1GatCKmT875h30gcqqRiHGrS0vJvdfVFNBur+rqWmd89448xDYkfIBajQlmOYNOYG7Fb
    w+sllDh+DDMUvqtbaIo97rAGXupuwv6SmaN7iwONW+0ItAz4OwC4z2L1UDB0MU/CMoZmKF
    APPM8RcF5zXW85u2vGen96NXQvAqXtU8fe4sL+5pyssWyORJXaYfVfxk8CYZyLiyROxmyy
    DnuHxnqL+fqmRQLsXBjvS2Kgpg4P6+w+lYqB1pR3hVnMOKZJhBftcLgAGkGQJMXexfLpVY
    5aV+MwkMr2u+QRkq181lBw5PovAiV7GNhcdgzdmi06YM3IPWi/78bgoAI5oSg14sHYeMZE
    BFGC7KQnBfxNVPPdNEN5jtm6LYR8S7QDjZmZ0uEXe3NxfCDhzlT8ts2fEATA
X-ME-Proxy: <xmx:z27Jar0H3gBGuS8tXHq80zIAyP6L5z_kyz0r6MVhLDw7moIIYaF2ew>
    <xmx:z27Jal65f46wvffjr1N3QphQ5zy_Vi9bNRcP81LEtWL-rzNi_OOELw>
    <xmx:z27JaiWF--412KgaTOTJJwXVkoGiuhKk1q7bueEww2DYL6QPMRoGvQ>
    <xmx:z27Jatjz_SKVt1pdIAnEjrYU6HmREY-TF3QdVaGgmr9L2l2k_wugbQ>
    <xmx:z27JatHfivmCHIQG1VSku7FhChG4Tb6CqYsp0KDGhPhxeeiQEzV3xL7m>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Oct 2026 18:46:35 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	lossin@kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v4] rust: compiler_builtins: Fix silent trap in prohibited intrinsics
Date: Sat, 10 Oct 2026 07:46:26 +0900
Message-ID: <20261009224626.1331914-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

When core calls one of the stubs for builtins that should not be used,
the stub runs a trap instruction that prints no message, and the Oops
shows a wrong name. For example, when __rust__udivti3() is called on
x86_64, the Oops shows:

  Oops: invalid opcode: 0000 [#1] SMP
  RIP: 0010:__rust__adddf3+0x0/0x10

The stubs call panic!(), but since Rust 1.79, rustc does not allow code
in a `#![compiler_builtins]` crate to link to functions in other crates,
and it silently turns such calls that do not return into a trap [1]. In
addition, all the stubs have the same code, so LLVM merges them into one
function.

Move the stubs to the kernel crate, where panic!() works as usual. Add
the name of each stub to the panic message, so the stubs are no longer
merged:

  rust_kernel: panicked at rust/kernel/core_builtins.rs:56:1:
  __udivti3 called: `u128` should not be used
  kernel BUG at rust/helpers/bug.c:7!

Weaken the stubs in kernel.o, as was done in compiler_builtins.o.
Otherwise objtool treats them as noreturn functions and warns.

compiler_builtins.rs is now empty, but the crate is still needed because
rustc requires a `#![compiler_builtins]` crate.

Link: https://github.com/rust-lang/rust/pull/122580 [1]
Assisted-by: LLM
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
v4:
- Weaken the stubs in kernel.o to fix an objtool warning
  https://lore.kernel.org/oe-kbuild-all/202610100054.UyoZyPQ5-lkp@intel.com/
v3: https://lore.kernel.org/rust-for-linux/20261008114717.992497-1-tomo@flapping.org/
- Rename rust/kernel/intrinsics.rs to rust/kernel/core_builtins.rs (Gary)
- Reword the doc of compiler_builtins.rs (Gary)
v2: https://lore.kernel.org/rust-for-linux/20261003124828.119912-1-tomo@flapping.org/
- Move the stubs to the kernel crate and use panic!() there (Gary)
v1: https://lore.kernel.org/rust-for-linux/20261002014739.2566289-1-tomo@flapping.org/
---
 rust/Makefile                                 |  1 +
 rust/compiler_builtins.rs                     | 97 +------------------
 .../core_builtins.rs}                         | 26 ++---
 rust/kernel/lib.rs                            |  2 +
 4 files changed, 14 insertions(+), 112 deletions(-)
 copy rust/{compiler_builtins.rs => kernel/core_builtins.rs} (74%)

diff --git a/rust/Makefile b/rust/Makefile
index 320ab6bb36c4..80bf698353a0 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -789,6 +789,7 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
     $(obj)/uapi/uapi_generated.rs FORCE
 	+$(call if_changed_rule,rustc_library)
 
+$(obj)/kernel.o: private rustc_objcopy = -w -W '__rust__*'
 $(obj)/kernel.o: private rustc_target_flags = --extern ffi --extern pin_init \
     --extern build_error --extern macros --extern bindings --extern uapi \
     --extern zerocopy --extern zerocopy_derive
diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
index fc6b54636dd5..65476a7c87ae 100644
--- a/rust/compiler_builtins.rs
+++ b/rust/compiler_builtins.rs
@@ -3,18 +3,10 @@
 //! Our own `compiler_builtins`.
 //!
 //! Rust provides [`compiler_builtins`] as a port of LLVM's [`compiler-rt`].
-//! Since we do not need the vast majority of them, we avoid the dependency
-//! by providing this file.
-//!
-//! At the moment, some builtins are required that should not be. For instance,
-//! [`core`] has 128-bit integers functionality which we should not be compiling
-//! in. We will work with upstream [`core`] to provide feature flags to disable
-//! the parts we do not need. For the moment, we define them to [`panic!`] at
-//! runtime for simplicity to catch mistakes, instead of performing surgery
-//! on `core.o`.
-//!
-//! In any case, all these symbols are weakened to ensure we do not override
-//! those that may be provided by the rest of the kernel.
+//! Since we do not need the vast majority of them, we avoid the dependency.
+//! But `rustc` still needs a `#![compiler_builtins]` crate for every crate it
+//! builds, so this crate is provided and left empty. The few builtins that
+//! `core` needs are in the `kernel` crate (`rust/kernel/core_builtins.rs`).
 //!
 //! [`compiler_builtins`]: https://github.com/rust-lang/compiler-builtins
 //! [`compiler-rt`]: https://compiler-rt.llvm.org/
@@ -24,84 +16,3 @@
 #![compiler_builtins]
 #![no_builtins]
 #![no_std]
-
-macro_rules! define_panicking_intrinsics(
-    ($reason: tt, { $($ident: ident, )* }) => {
-        $(
-            #[doc(hidden)]
-            #[export_name = concat!("__rust", stringify!($ident))]
-            pub extern "C" fn $ident() {
-                panic!($reason);
-            }
-        )*
-    }
-);
-
-define_panicking_intrinsics!("`f32` should not be used", {
-    __addsf3,
-    __eqsf2,
-    __extendsfdf2,
-    __gesf2,
-    __lesf2,
-    __ltsf2,
-    __mulsf3,
-    __nesf2,
-    __truncdfsf2,
-    __unordsf2,
-});
-
-define_panicking_intrinsics!("`f64` should not be used", {
-    __adddf3,
-    __eqdf2,
-    __ledf2,
-    __ltdf2,
-    __muldf3,
-    __unorddf2,
-});
-
-define_panicking_intrinsics!("`i128` should not be used", {
-    __ashrti3,
-    __muloti4,
-    __multi3,
-});
-
-define_panicking_intrinsics!("`u128` should not be used", {
-    __ashlti3,
-    __lshrti3,
-    __udivmodti4,
-    __udivti3,
-    __umodti3,
-});
-
-#[cfg(target_arch = "arm")]
-define_panicking_intrinsics!("`f32` should not be used", {
-    __aeabi_fadd,
-    __aeabi_fmul,
-    __aeabi_fcmpeq,
-    __aeabi_fcmple,
-    __aeabi_fcmplt,
-    __aeabi_fcmpun,
-});
-
-#[cfg(target_arch = "arm")]
-define_panicking_intrinsics!("`f64` should not be used", {
-    __aeabi_dadd,
-    __aeabi_dmul,
-    __aeabi_dcmple,
-    __aeabi_dcmplt,
-    __aeabi_dcmpun,
-});
-
-#[cfg(target_arch = "arm")]
-define_panicking_intrinsics!("`u64` division/modulo should not be used", {
-    __aeabi_uldivmod,
-});
-
-#[cfg(target_arch = "powerpc")]
-define_panicking_intrinsics!("`u64` division/modulo should not be used", {
-    __udivdi3,
-    __umoddi3,
-});
-
-// NOTE: if you are adding a new intrinsic here, you should also add it to
-// `redirect-intrinsics` in `rust/Makefile`.
diff --git a/rust/compiler_builtins.rs b/rust/kernel/core_builtins.rs
similarity index 74%
copy from rust/compiler_builtins.rs
copy to rust/kernel/core_builtins.rs
index fc6b54636dd5..b147475156b4 100644
--- a/rust/compiler_builtins.rs
+++ b/rust/kernel/core_builtins.rs
@@ -1,10 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-//! Our own `compiler_builtins`.
-//!
-//! Rust provides [`compiler_builtins`] as a port of LLVM's [`compiler-rt`].
-//! Since we do not need the vast majority of them, we avoid the dependency
-//! by providing this file.
+//! Builtins that `core` needs.
 //!
 //! At the moment, some builtins are required that should not be. For instance,
 //! [`core`] has 128-bit integers functionality which we should not be compiling
@@ -13,25 +9,17 @@
 //! runtime for simplicity to catch mistakes, instead of performing surgery
 //! on `core.o`.
 //!
-//! In any case, all these symbols are weakened to ensure we do not override
-//! those that may be provided by the rest of the kernel.
-//!
-//! [`compiler_builtins`]: https://github.com/rust-lang/compiler-builtins
-//! [`compiler-rt`]: https://compiler-rt.llvm.org/
-
-#![allow(internal_features)]
-#![feature(compiler_builtins)]
-#![compiler_builtins]
-#![no_builtins]
-#![no_std]
+//! The stubs are here and not in `compiler_builtins`, because code in a
+//! `#![compiler_builtins]` crate cannot link to functions in other crates.
+//! There, `rustc` turns a call to [`panic!`] into a trap that prints no
+//! message.
 
 macro_rules! define_panicking_intrinsics(
     ($reason: tt, { $($ident: ident, )* }) => {
         $(
-            #[doc(hidden)]
             #[export_name = concat!("__rust", stringify!($ident))]
-            pub extern "C" fn $ident() {
-                panic!($reason);
+            extern "C" fn $ident() {
+                panic!(concat!(stringify!($ident), " called: ", $reason));
             }
         )*
     }
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 7225abc64084..b4fdba2a3eb0 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -57,6 +57,8 @@
 pub mod clk;
 #[cfg(CONFIG_CONFIGFS_FS)]
 pub mod configfs;
+#[cfg(not(testlib))]
+mod core_builtins;
 pub mod cpu;
 #[cfg(CONFIG_CPU_FREQ)]
 pub mod cpufreq;

base-commit: 2dee3d3adcadcc57d62ba6608cd02f50b0c10264
-- 
2.43.0

