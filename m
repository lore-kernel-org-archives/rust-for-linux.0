Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833846;
	b=oz88RB+3v/MreYCjIF9YpqxMTasLFCNcQmKKTs4FC0tZLQmxwXdgNqx76ixg0sOirlfp
	 QyQeuZk9EVDk06YBXO2Q4xTgiFn0vvxqdAhWWMspdu+YWRhu5CU5b/30OxLmRmkV4tmuP
	 WqR6zFgXfzpFtUtlWnt/z9e2z/ij6s5no9g9mFLH2QlK2sbXUuZE2fdkWBLnUg260Gn8o
	 MYyvdYkPTdt1lpe2W4HHMK92oupL+pKprj4pWSjVegDGoWdQbf7KIyvm1qgduAnuqUoiF
	 7f/aQMLRg1vUa7WvLU9P8fd69fOCA+e0JyWhJJsB+ovencv8hdXSUc15tbRIMFR6rqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833846;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fpnhJCiU1sdsmFO7PW5FOFGZE7WdVRl/wv8CzGaZG4Y=;
	b=vyuio0zh023vc1FKOoEHIcsqvq5C1R7Pa5CLMfinJ11CzKJBzaZnTe/E1lFjiZiIQs+i
	 ZC+BsYzrVOJEpZ2Qf7eoiL24jlQFrktpU6RP2SqK9Xitaeq9imfqXJI1F08oIp6pXPIQS
	 2sg9yCtlhG8M5nOIDDLnxKwQr9mjgmZ5xkNzybvPgtvLJQBcIg+CD/zr93MlFxAT7tyaU
	 qwwtJuXAkYTkvW2GZaORSrRDVwnQZXytgfbrMGGn95u9ebiyOin/cym/NE0vKo9FeWSj4
	 Mkfm63DfMG6A6xicOueUS7PYuhhBKLZOYhbOhY9KO9YVx0tQZrCs6nXu6Z2JLJjKyfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=T0HfhEIW;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=iommtikA;
	arc=none smtp.remote-ip=202.12.124.157
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76550606A326
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 23:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76550606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=T0HfhEIW;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=iommtikA
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D45307A0053
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 18:10:44 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 04 Nov 2026 18:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1793833842; x=1793920242; bh=fpnhJCiU1sdsmFO7PW5FO
	FGZE7WdVRl/wv8CzGaZG4Y=; b=T0HfhEIWu9KPhW1H5EDeyzwJ0nGIpA2Rh5QIS
	EGwHoZqit6Lj/l3JCRSDaGDl8Zy7Aeu0wPUSz6v4tqwnNDEwdFQm4zZeSmQPiT4L
	dSnJhyeXGSm+oBIbtmWam6eMJ7ifGOT0t9529uUunp0B8wYioCMEzbgjEhrZ+8+V
	Q6/nxmrFAIoxjDLB9j1DtlTtYH5/sqyxtJKxpOr4Q2u1S+kv+t1SLxXLPuxYeDt5
	4uxCmnwJIJ8CiYeEMdoPTVf2MIr4aDijtLD/QNiWW3TdNViGqlM3/QEfiK6aXbSh
	lhjjbxg57QT2Ohni7wAlVA2DtwVAEfinylY3bhDi1ZRQP2JZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1793833842; x=1793920242; bh=fpnhJCiU1sdsmFO7PW5FOFGZE7WdVRl/wv8
	CzGaZG4Y=; b=iommtikAxZXBeYESkLxAJDnECkl0WWOXFqVbOA31u14z7xSmUMc
	exKNpix5H7UZ1XDzbIjsLFctTHlUh+tAHFTZpvM0DkgtaoB1VgjNpf1AcmL9t3fE
	0qKcjrHihiGBb4il/sKKAIOvusIEqwlXkybO/KOMqWgt4NeOPE8u8gue/98Sgshf
	gvQemp1zKBueQnzjXwDpMC37fFU2hsBUFG67U+KJjgMW8Ny6IhKW8guvVmgEqvoM
	37QpzgDswDYtQjEVXQyt4XCFhtuK0Z3dzKejh9gkGQlcsbYC0bQfJ+2SbkE+U1xJ
	tWF7+s12yTF5sAXR5JwdaioJevimxMHLwrA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793833842; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:NzUiqENNr8lX2sduoe3UMh56wwosuLJCVLZ1Cz0pG+wKOfb
	5SGErzlBEL5sKqYS+QU+CpDItj4OCKI24TLvKW7ATCfaoRP1AIUhH39hiwAAMil6
	W0p0CzouFYBb+DAhy2GhI9/kTV/H2N3csEWloy1toBTmcOVswhBuc0WJsnszU4gV
	iG36zB0bl7LxMeR/97h5zo7ou1FKzoJ2oIjEdCtbRJjmWxvdHkZ5zPmXNwDC7hEv
	yHZR6gkX5mHLRGjKshHhwSvNZwgSxY77HVHxEE2BrY4rTpE1U0JtFGlNNMkRjDg9
	RYaHoUfwPj7klBe2uUqHqiuqkD/fDGFmGR3dTvg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:/TLpRtnhwSHrAGabWccnlghMOI/nYpfgkXWqNhJTCwM=:5/v9NjnE43fTF3mUnpGsF4jY5Rjh1FL5EZMwa/WOVPQ=;
X-ME-Sender: <xms:crvrauBE55mfonla5axagavibLPeGY7i1ZHmIlSZz3EhyfZFZ0_VSg>
    <xme:crvrao8GhEGfq744lG-tr9rgw6w0PFi3hmm0PlK9ABZ4QyK1c0j0C9Vk64UH-Y_wv
    BXnj_7yIb06QkQ_BFROAjuDoJskJNT-AU46mp18vaip2Cz33yEzE-0>
X-ME-Received: <xmr:crvrahW10vGC3c5mDfmq8PyW2Ttrn171TshbGKcNCxwPAwh_h6cMODll8kETiF4Ioeb7SrY4BbT5ZRX6M9M>
X-ME-Proxy-Cause: dmFkZTEbfQFywZX6hiVMnCnzGsivDJyC6rNIpxMuDZnF2aHcT2K8mBwvA+heHnKnSE4GPq
    z4rWKOsS+SqRfMLOvW9sfQgkhcNi5FHaD5HNwMpp3MF3rPsc6b63zpViB42wD4epbl9gjA
    KBmuDolNBXielKs/7RUcl1l01J6BM+DJEjvKRRYhX+LiOpEbkwqosT/+0JWhqw9FF45xAH
    YSerk3eHm5CS5uQhTcIG1ahUkJnIR/K7NnCXm0T+OCDviFGL/6/Vv0dR6AMIlmXxMq98Jb
    z205skKuewo2erk7X3Kk4FCwYCmm0TvbVWbAAIiSQSvN6G5Vli4ktrMwpRyVs9WNKZAAhp
    IFPWjSl4gc0RCpiOVnCGVW8rBa9o8ToSuZLvn/0aMfZTrA42x71lBQqZ5IfTQLxLgmMZGd
    HabLpaS+f7KcqYdgrdwUjdQskkpzzoNw7JA81qFScJXQ7j0M4lDNpW5eCE4gAdGGYypi4k
    3mI8X+XIm9JyrgFmQndsESH/HquQnkDHgK5Gr6Ii6+ixpHJRHAug48KyY+5S3qPoCuk6eQ
    s+JV6wY+MlPV8wkwKgsOqfF1LLrIr5Hzqht2vfN+kOL45FVcdjuJqzyril9tNcEbujyjyZ
    qf3wCH8OK5ntR1xtijNJQDZMMfwXMl0I1JOfIjb8Lw65G/aU+lQRGcOjDibA
X-ME-Proxy: <xmx:crvrapLHVcFHWoTjtCQXFxcRBNqLjTE06Zf1exGjWlLvaREdH4CrwQ>
    <xmx:crvratAvFhSSbCwAPILppj21V4Y5qLraB_QHwKwVZpQFWfrih0OtWA>
    <xmx:crvrahGb2qPZFta9q1TunDpbJ9zdSonO_UbzuvLPd1hbzBTmKHU9Gg>
    <xmx:crvraiLUYvH6cTwqQG-yCqwwAf4I9tZItsr0JzZe2SjjaXJnSq5tpQ>
    <xmx:crvrajXgWP2zbadNhe9UMnX5EqEuYL4uEA1qqQp3-EBhbYQEOIPYT8Fo>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 18:10:38 -0500 (EST)
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
	jpoimboe@kernel.org,
	lossin@kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v5] rust: compiler_builtins: Fix silent trap in prohibited intrinsics
Date: Thu,  5 Nov 2026 08:10:07 +0900
Message-ID: <20261104231007.1240323-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

When core calls one of the stubs for builtins that should not be used,
the stub runs a trap instruction that prints no message, and the Oops
shows a wrong name. For example, when __rust__udivti3() is called on
x86_64, the Oops shows:

  Oops: invalid opcode: 0000 [#1] SMP
  RIP: 0010:__rust__adddf3+0x0/0x10

The stubs call panic!(), but since Rust 1.79, rustc converts calls to
panic!() in a `#![compiler_builtins]` crate into
core::intrinsics::abort(), i.e. a trap that prints no message [1][2].
In addition, all the stubs have the same code, so LLVM merges them into
one function.

Move the stubs to a new small crate, core_builtins, where panic!() works
as usual. Add the name of each stub to the panic message, so the stubs
are no longer merged:

  rust_kernel: panicked at rust/core_builtins.rs:64:1:
  __udivti3 called: `u128` should not be used
  kernel BUG at rust/helpers/bug.c:7!

Weaken the stubs in core_builtins.o, as was done in compiler_builtins.o.
Otherwise objtool treats them as noreturn functions and warns.

compiler_builtins.rs is now empty, but the crate is still needed because
rustc requires a `#![compiler_builtins]` crate. Remove the weakening of
compiler_builtins.o, as it has no symbols now.

Link: https://github.com/rust-lang/rust/pull/122580 [1]
Link: https://github.com/rust-lang/rust/issues/165399 [2]
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
v5:
- Move the stubs to a new crate, core_builtins, instead of the kernel
  crate (Miguel)
- Remove the weakening of compiler_builtins.o (Miguel)
- Explain why the stubs are weakened in core_builtins.rs (Miguel)
- Reword why the stubs are not in compiler_builtins and add links (Miguel)
v4: https://lore.kernel.org/rust-for-linux/20261009224626.1331914-1-tomo@flapping.org/
- Weaken the stubs in kernel.o to fix an objtool warning
  https://lore.kernel.org/oe-kbuild-all/202610100054.UyoZyPQ5-lkp@intel.com/
v3: https://lore.kernel.org/rust-for-linux/20261008114717.992497-1-tomo@flapping.org/
- Rename rust/kernel/intrinsics.rs to rust/kernel/core_builtins.rs (Gary)
- Reword the doc of compiler_builtins.rs (Gary)
v2: https://lore.kernel.org/rust-for-linux/20261003124828.119912-1-tomo@flapping.org/
- Move the stubs to the kernel crate and use panic!() there (Gary)
v1: https://lore.kernel.org/rust-for-linux/20261002014739.2566289-1-tomo@flapping.org/
---
 rust/Makefile                                 |  8 +-
 rust/compiler_builtins.rs                     | 98 +------------------
 ...{compiler_builtins.rs => core_builtins.rs} | 28 +++---
 3 files changed, 23 insertions(+), 111 deletions(-)
 copy rust/{compiler_builtins.rs => core_builtins.rs} (73%)

diff --git a/rust/Makefile b/rust/Makefile
index 0ac9ab28cc2b..8eec45636062 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -6,7 +6,7 @@ rustdoc_output := $(objtree)/Documentation/output/rust/rustdoc
 # Clean generated host directory
 clean-files := host/
 
-obj-$(CONFIG_RUST) += core.o compiler_builtins.o ffi.o
+obj-$(CONFIG_RUST) += core.o compiler_builtins.o core_builtins.o ffi.o
 always-$(CONFIG_RUST) += exports_core_generated.h
 
 obj-$(CONFIG_RUST) += zerocopy.o
@@ -745,10 +745,14 @@ endif
 KCOV_INSTRUMENT_core.o := n
 
 $(obj)/compiler_builtins.o: private skip_gendwarfksyms = 1
-$(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
 $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
+$(obj)/core_builtins.o: private skip_gendwarfksyms = 1
+$(obj)/core_builtins.o: private rustc_objcopy = -w -W '__rust__*'
+$(obj)/core_builtins.o: $(src)/core_builtins.rs $(obj)/compiler_builtins.o FORCE
+	+$(call if_changed_rule,rustc_library)
+
 $(obj)/zerocopy.o: private skip_clippy = 1
 $(obj)/zerocopy.o: private skip_gendwarfksyms = 1
 $(obj)/zerocopy.o: private rustc_target_envs := $(zerocopy-envs)
diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
index fc6b54636dd5..467020fac09e 100644
--- a/rust/compiler_builtins.rs
+++ b/rust/compiler_builtins.rs
@@ -3,18 +3,11 @@
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
+//! `core` needs are in the `core_builtins` crate (`rust/core_builtins.rs`).
+//! Please see the details there.
 //!
 //! [`compiler_builtins`]: https://github.com/rust-lang/compiler-builtins
 //! [`compiler-rt`]: https://compiler-rt.llvm.org/
@@ -24,84 +17,3 @@
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
diff --git a/rust/compiler_builtins.rs b/rust/core_builtins.rs
similarity index 73%
copy from rust/compiler_builtins.rs
copy to rust/core_builtins.rs
index fc6b54636dd5..4ca92e69a7f3 100644
--- a/rust/compiler_builtins.rs
+++ b/rust/core_builtins.rs
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
@@ -13,25 +9,25 @@
 //! runtime for simplicity to catch mistakes, instead of performing surgery
 //! on `core.o`.
 //!
-//! In any case, all these symbols are weakened to ensure we do not override
-//! those that may be provided by the rest of the kernel.
+//! The stubs are here and not in `compiler_builtins`, because the compiler
+//! would otherwise decide to convert calls to [`panic!`] into
+//! `core::intrinsics::abort`, i.e. a trap that would print no message -- please
+//! see https://github.com/rust-lang/rust/pull/122580 and
+//! https://github.com/rust-lang/rust/issues/165399.
 //!
-//! [`compiler_builtins`]: https://github.com/rust-lang/compiler-builtins
-//! [`compiler-rt`]: https://compiler-rt.llvm.org/
+//! The stubs are weakened in `rust/Makefile`. Otherwise, when `objtool` checks
+//! `vmlinux.o` (e.g. with `CONFIG_X86_KERNEL_IBT`), it finds that the stubs do
+//! not return and warns that they are not marked as noreturn. `objtool` does
+//! not do this check for weak functions.
 
-#![allow(internal_features)]
-#![feature(compiler_builtins)]
-#![compiler_builtins]
-#![no_builtins]
 #![no_std]
 
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

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

