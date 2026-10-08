Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD2E483BD8
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Oct 2026 11:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460099; cv=none; b=ZSL+EAK/kt4xVMSdpY14OJLS/tn2BrR03v2gKQAhvXDC8t8AcTKpNjCPzbkfsCa5UwbYOzuD8f336hQRk31ii1pWr7hLiOewLJLLvZOxvb75a9lbznA5bT2c3dOEtpKHpj58MXr+TZJQwTD+WSOPwSbMufzdbEmstlPAXtgV3u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460099; c=relaxed/simple;
	bh=BCQOWLZ218qx8/5w5/9Fla7F1gBnB+2ZxFrDEiEWsII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gyDkMEzx+XOy3yn2m5uRkb5DOq9E8OH0StIjyNActWxFnDOUwZrStfvNrdplas5VuBrrm7qpp1rbNBkJ9FGMMuB7Lgn/6nKiA0NympGcxH/LAgqkUmxwe5qVoaFz+2XHHuqSYWvHetiBXQEfMVgTgP4SktU9TzqlDsJ3Pbx9f6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=GXbriTRT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xPxe5Fvt; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="GXbriTRT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xPxe5Fvt"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 69EBEEC0294
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Oct 2026 07:48:16 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 08 Oct 2026 07:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1791460096; x=1791546496; bh=9q+nP+Y11nDh4ABB6lC+6
	jgyxF4hu4cR2s5LXG47gA4=; b=GXbriTRT8ee6HN7L1rIaAybzbRXWUoVK/sxtr
	bQYNNsUtyAU/B2wpffMxijTfYU0IVlIQnwsPIluteXIjrSQgz0bVlIAoHRunoA82
	s4Iu8qMp2G8FZaF7xO2a/S9mEFECIQz0OkrJZBZ7xm+iL5G0dVz6El0Ky9VNnTMd
	jOq4FSx7XUgwnFMFvDu5PutPHdq9Y3dL3Zf5tL1mXPRhmv29hwmL6Vim0UcNBqHq
	cLYKZyO0FJp4qg4jLVT7TIJDcDqfxIqY4+TCHVz65FriyaO9z5h3C4rEZUwwjnD2
	va2ExZjQ8Q1eohKUzbL3QkV+vOHbp3NQeVhnlQNXdNhlxAyow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791460096; x=1791546496; bh=9q+nP+Y11nDh4ABB6lC+6jgyxF4hu4cR2s5
	LXG47gA4=; b=xPxe5FvtHsim/ZSfNSdQXTWCez4+uimJFerJSpc+l+6p7tRELnl
	pOqM895bPLpqf0KkEduhE0NBknVzzv5u6D7+viorJ7slmZNUm9HsxPD5RQMBQidh
	MqL0YjvcTiumlgaOZ7law2YAY4mleu73ajWyotQuRh42YzycSQwIzBIjH8ptiDfq
	zrRf2eMeTCedKMXOTH49hBy7QS5aRjz49ETuLgLeNq+aspp6KUsVuW0NQDdBhywS
	UcUN4xuFSKXX6+1ozGsyFR/DCBx689wWiZXsT4zwcKuEBJ31eYc7BcAt3auRnOWN
	ag0EGdERVQaLps6cwU8RZmGsFlQrzMuTpmg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791460096; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:h3/Hxsm5y2tFQ9PXTl05iRwjAATfseP5bHC/aCD5N03Buhy
	TV/6MjLzOmGsok8vXtHIWdJ2l7iA7wfx1EqX6OI27SQBASI0zskmBWNA4fSrjxZP
	dRhktXp4RbmtmDmUjFQjZE+Bm5IIrWqt+RIyyip0Xfn741E1vROcfOspnXHEIaFp
	SJtEAsejJwGuc56GByekzZMabWNBt+MGpf+gFJG77QMQviv31iM4iMHFN6ad5Ozy
	BRlQfyyggPDtSH4qGChpOuj7lRVil/nkZd4LAuPQebyrG/8YHIL38qIq3pa5rA85
	TJxgDBvZWXvJqHs6D37DKniPL3qWMWbBJvjJ/Eg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:eyykGbnCys/M/EpJ1uB8LQROFJ+hlpvYWCMOGfAS22s=:BCQOWLZ218qx8/5w5/9Fla7F1gBnB+2ZxFrDEiEWsII=;
X-ME-Sender: <xms:_4LHaqYywFl9nuBK7iZuria1juDRSHPgLcZlicsXwR3oN81xftoqTw>
    <xme:_4LHapw0P8ryp723Jih75sKZcPsY8tjmxG_TuWl3B9wBF8OBq9jL7kCF1rZao3kqH
    374oNXzbT_f_eNjo5Q57VyUuYtK7AlRlSs_gsh3vseRKU_7rjrawYAE>
X-ME-Received: <xmr:_4LHapYfufA3PV_K4yj8kOcc4H7SWnoPrC33sQ3CgfdKsbwddIglC3T4IhrA_GCI6Nt-zoL86JKKTtDn4mk>
X-ME-Proxy-Cause: dmFkZTFT33974HUsTd2KoweDixSBpwTjRdv4nrqYHSQ4XxrdY/f+QldXqoe0rPPVAB6zm8
    IhP3ePgDQSOqqT10D9S0gfdMzCe2J7EHk2efGna/EOplJ4r8XnEqbDgr95PHy65syaJEzP
    v9fPuEsv65zvlf2KgNAjUmDu6jEorjYY++MrY7sAHdxp3AAOiyoKzDJXajsqCEJpGdXPMh
    aQDnPcU6hUIPDYTG3H+PSfb722J2arQlq27qtztzvhIatObC+OO5yxPNdMsERhzOTlXqOx
    hzM3kfuU8SSUssnUN8/ZZFRLYHejqcPb+DWAFDUd3Kdu34SZw7iz+xmQzWQH63KwcmmPjH
    f0UamqmF1mkCJcb5hLzpcnHcNnFc/kTYFz9py4YYyDcg/8nrXHWSTmz5I1tWhM1aLmIys/
    LbP9cKU29DrPV/yEFrxjmQ66lPtcqBXcc+FN7UK06GugShlrUOctoMmn/AVpmcCJ06+rtk
    E+ToK0FZJ9LDX5BChMqi2MgXIwAhrOJwUG1QZUui703bVs5Wx1/+J2NYWGFGVp+VekXEvc
    q8Px+mGTr4hvIkR9OVBNyEgqlrnKwt90tfeIMnffr1j2JIG33uemRLO+TZfaPqcc9YoSdf
    3dXjwEoJksA/OwcxT5MW47V9ZpIK9fAMSJj0dAosLhA5Car76576Hh/wttKQ
X-ME-Proxy: <xmx:_4LHaqxLsIrY9jVmP5YDPlhqTSt84Azp_Jb3gyLrsUkKAgb9GdbE3A>
    <xmx:_4LHaiFgYwgYkSubt_DANAnxFkCU6HlymU7c7FiJY0w5hiklhC8Zhw>
    <xmx:_4LHaiy4gDIrsLGapZLULlJvqfxo-Zke96Zr5JCyA48h-Gh03zbqMg>
    <xmx:_4LHatP3AKts48ui3G4J6vL5jqHXKJnbzhDaxE9LNWGZlyK4RUR4Gw>
    <xmx:AIPHalTuzWe29qt9mMD42CvVoM0QMVR2MkwQKF-exme0X05-691VABtQ>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Oct 2026 07:48:12 -0400 (EDT)
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
Subject: [PATCH v3] rust: compiler_builtins: Fix silent trap in prohibited intrinsics
Date: Thu,  8 Oct 2026 20:47:17 +0900
Message-ID: <20261008114717.992497-1-tomo@flapping.org>
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

compiler_builtins.rs is now empty, but the crate is still needed because
rustc requires a `#![compiler_builtins]` crate.

Link: https://github.com/rust-lang/rust/pull/122580 [1]
Assisted-by: LLM
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
v3:
- Rename rust/kernel/intrinsics.rs to rust/kernel/core_builtins.rs (Gary)
- Reword the doc of compiler_builtins.rs (Gary)
v2: https://lore.kernel.org/rust-for-linux/20261003124828.119912-1-tomo@flapping.org/
- Move the stubs to the kernel crate and use panic!() there (Gary)
v1: https://lore.kernel.org/rust-for-linux/20261002014739.2566289-1-tomo@flapping.org/
---
 rust/compiler_builtins.rs                     | 97 +------------------
 .../core_builtins.rs}                         | 26 ++---
 rust/kernel/lib.rs                            |  2 +
 3 files changed, 13 insertions(+), 112 deletions(-)
 copy rust/{compiler_builtins.rs => kernel/core_builtins.rs} (74%)

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

