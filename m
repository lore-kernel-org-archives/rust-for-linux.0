Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55953749F4
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Oct 2026 12:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791031730; cv=none; b=QjpLLOx4n1MpYrPjQsNOhMb/+M/SknIah9vWNTCjAGWeiBfO+lljYGtmFBcuZpLw4CJ3teYqRGIZtq1by5Osu1dt++umSn16lOym15edOEHFfXGxRY+7vSipgJFisaixOaUaSnvF6/SH6bmfzfMM76AmGviGd6cP+QMHMJOTwuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791031730; c=relaxed/simple;
	bh=Zl6H9b09eNh7W902kj50u99k0PEUg/Pt7VgUH2FVD0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m4wV/LyghDWLFeHINsFx563xiflHl8nYJqkj67S4UGBRJRNbpa1RuDXDT8XARvDFKKUHNqz7BRfSt6hZfhBwimR5jA49K8xTO0e1FVu7YRjRnSKYQuxmxC5YiI7QmweHIQsypVGF2ROipPGxSHnqPx/Gr1kMkAduBVGtNBXWH4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=QIFgzFR3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c1ysJbs6; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="QIFgzFR3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c1ysJbs6"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AFF1914000D4
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Oct 2026 08:48:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 03 Oct 2026 08:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1791031727; x=1791118127; bh=YNEraK+L+30zEm6RIF9zX
	7azVg1gpj4v3qDfLP6sqxI=; b=QIFgzFR36F6scqmK1VKLPRwO+7yl2rlW+TN47
	9MO4kvEFMJ1MVFfv94ctO9Z8lWzNYaxz8ADUVRm3fOic5Kx8HRJtUGCqD04XhRgl
	92if4ZoAebRo7E+gSdIdaSiEb85WiuX/F2SYDfcUcGQao7TDhK36eJtxZkTL5v+c
	TM0oRyqA6IGtA9LMblwk7HD3ZKv6UeP46hOmT7pWb+krYjrwuBzWUe1K2FAbBhjk
	wikORWoxy4VtqooWZXgykvd47+cYrhrjr8msS95TBmSJO+4HwtZ2NxKBVLMc5bzO
	HBsL/7MEKjEOE6OGue6I0q+2lwkdMLmrLY6ini625VumJIh9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791031727; x=1791118127; bh=YNEraK+L+30zEm6RIF9zX7azVg1gpj4v3qD
	fLP6sqxI=; b=c1ysJbs6TC3cazQO0cU6NFazgW5iHmmnNEEwJ5SYnCJ/gXPpp4N
	NXH4pfFzOLcE4Q3+1/QgHDUKQ/EZtrSoaWhnnN6RPh6qdKRYBTVmkLIxIdUrZaXe
	fmySXn3VRYJo2qPI1RVKNJUQePZ6oBbgVNcL43/dtJ+EH9+TkHFBOBV90U2SXFDW
	bSX3pIDgQ1h+fum5wrmdoCHomYNsquGcKt+IssXkdSE8bYYFQPgiW9K3qSImTk5u
	Czw1Nw9xyJ9LKir+osLda1GsKv+P1TkxKuaiElnFLkWoL9O/OKijcAenZAHB2uzh
	ypM0rvUoQ6kfyGrbaXDsUXvT7+Jf8Xi08pg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791031727; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:T7c8WU41CcC1D1Aj0KNjcM7BB2wf+AcqZ4QfYRporMdb/Dr
	2GXRKefqtVp6foXB8tTD6tn0TSx5v/EiOpEugs+tKpvbFmVIh1QzE6V7XiBQLLJy
	PvUoVVx27fToJb91Z+kXsOdZW1rg5fB2wJZ+BKj3o6VGhyLbTmOL8NTS7zopiJT7
	RFbU2VWGo2ZF5xtxCNW0k6JDbhg/mEyzBuhKx+0MKsFs4Xh9iQoyciDd1EzPi49U
	gUWTdTbsHepmC9OeH7q1iLIf9JIC7HLJh7uRetXZFwR9mG74GSik0Y0y9QBqGF0r
	0/bJ9Bgvx1hnRP1yv2BL21nlspI4CJi9Q1Fi+GA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:ocbVsXs+dQQEdoSh3uFVognPBvWZPNCU+wzWfG1EGXY=:Zl6H9b09eNh7W902kj50u99k0PEUg/Pt7VgUH2FVD0o=;
X-ME-Sender: <xms:r_nAalCjuoLAAPlMVcHga4_apmtVYzZB_I1b_I7mVNlOy5aDT0M67g>
    <xme:r_nAajr6rIj9Icm3FlWvFo2u6i_ZEYfbICG4b9vofC7z_q8VoSWON1YK--D73_0FQ
    nfhJAIfLgknqane-QezT46Y6Tpu2v5LXTz2q22oZlgOVfcwN_6wjh-P>
X-ME-Received: <xmr:r_nAaoC7IxtggjxOaCzN_InaEX2i9nYvB1JxRr3PD93z2i1dETW4KsjbuPXk0DkO-t2jsPT3ZhNcqb9VGlY>
X-ME-Proxy-Cause: dmFkZTFN5ttaT6E3igAxmt23tps3GKfBKbu98Gj3hLAOHsEJnGq4t7SYnJ9h8j/bHrBRR/
    Jt84KLlqau9YKr//Dvv1p9BWuXWPbrYSD5RNR/CBVorpGmHAd+O7R4Fosxuu3n02GOx34Z
    itqSK491nTSlzVgo8wTJDMBm32QQB/iLsMZUT5ie/hF3NME9P+mqJB3cLeErIbQGBXS2pj
    yCk9TdEnEXqo1X6Hn9CkBeO6Zr/yFc9Vkq0UwuXaEvPbDlUa9zQRZZRnBvdhXnaf8BrSJ7
    5F2PN3Sitr7U29JvEDlQTLdhIw24rWSbLwX4A749z2w0vRpEJ9OKRaxNDD6gLmU5S4BXKl
    qFBrH70cagcxeu+EUA470Y4JjKSqMLft11SH6og1N/x96yA+lXoQ3i/Yf8I65o+rpW7nqQ
    /t1pEI9B+KER/4aegsFPipfbZINu7doKpojeVy652foKYAFnsKE296DQadHb3Mbr6nQ2jm
    fkz+O6nZdBt8acyP8UuamVvWZwB5xt/14HWLP0TnqbsGUMgBlRir8pPkinuQ1PDi8yuviI
    3uuaWGCXvIN0XlvfjFxcd5siVFHcLWcuuJAmFPDTS9CrVu7Df14cQLUThFdKm1NuxLPpjr
    FE1v/nscuTjx03rCxhhD5FMGRbDKJd2VYVYElIGHJBOUpe/f1KDoyZNcSEjQ
X-ME-Proxy: <xmx:r_nAamV1ci9dWIKZe9HDxtChhivPLGJ1_k0112IDuhg0kxq4E76lDg>
    <xmx:r_nAaiDet_OFAK4xfU0nplpS3YbzxqkowJVBMV1JGgoY1DVzXAq6bw>
    <xmx:r_nAardYhRBNUDCo0kRKmVDArDM_ldin7RBcz4Ed-oUSCMPFYQ_ZbA>
    <xmx:r_nAahqj2YQNm2vS76t_SR1Cr4SBaGVeLf1OmU0rfqKb-kbkkFV8zg>
    <xmx:r_nAalja3LvVFFOrXFn_SPXTSsIOPIHrXG13AwkAcnW6c5Se7_LqBLoj>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 Oct 2026 08:48:43 -0400 (EDT)
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
Subject: [PATCH v2] rust: compiler_builtins: Fix silent trap in prohibited intrinsics
Date: Sat,  3 Oct 2026 21:48:28 +0900
Message-ID: <20261003124828.119912-1-tomo@flapping.org>
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

  rust_kernel: panicked at rust/kernel/intrinsics.rs:56:1:
  __udivti3 called: `u128` should not be used
  kernel BUG at rust/helpers/bug.c:7!

compiler_builtins.rs is now empty, but the crate is still needed because
rustc requires a `#![compiler_builtins]` crate.

Link: https://github.com/rust-lang/rust/pull/122580 [1]
Assisted-by: LLM
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
v2:
- Move the stubs to the kernel crate and use panic!() there, as Gary
  suggested.
- v1: https://lore.kernel.org/rust-for-linux/20261002014739.2566289-1-tomo@flapping.org/
---
 rust/compiler_builtins.rs                     | 93 +------------------
 .../intrinsics.rs}                            | 26 ++----
 rust/kernel/lib.rs                            |  2 +
 3 files changed, 12 insertions(+), 109 deletions(-)
 copy rust/{compiler_builtins.rs => kernel/intrinsics.rs} (74%)

diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
index fc6b54636dd5..87c19c22b107 100644
--- a/rust/compiler_builtins.rs
+++ b/rust/compiler_builtins.rs
@@ -6,15 +6,9 @@
 //! Since we do not need the vast majority of them, we avoid the dependency
 //! by providing this file.
 //!
-//! At the moment, some builtins are required that should not be. For instance,
-//! [`core`] has 128-bit integers functionality which we should not be compiling
-//! in. We will work with upstream [`core`] to provide feature flags to disable
-//! the parts we do not need. For the moment, we define them to [`panic!`] at
-//! runtime for simplicity to catch mistakes, instead of performing surgery
-//! on `core.o`.
-//!
-//! In any case, all these symbols are weakened to ensure we do not override
-//! those that may be provided by the rest of the kernel.
+//! This crate is empty, but `rustc` still needs a `#![compiler_builtins]`
+//! crate for every crate it builds. The stubs for the builtins that should
+//! not be used are in the `kernel` crate (`rust/kernel/intrinsics.rs`).
 //!
 //! [`compiler_builtins`]: https://github.com/rust-lang/compiler-builtins
 //! [`compiler-rt`]: https://compiler-rt.llvm.org/
@@ -24,84 +18,3 @@
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
diff --git a/rust/compiler_builtins.rs b/rust/kernel/intrinsics.rs
similarity index 74%
copy from rust/compiler_builtins.rs
copy to rust/kernel/intrinsics.rs
index fc6b54636dd5..2df9841ea781 100644
--- a/rust/compiler_builtins.rs
+++ b/rust/kernel/intrinsics.rs
@@ -1,10 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-//! Our own `compiler_builtins`.
-//!
-//! Rust provides [`compiler_builtins`] as a port of LLVM's [`compiler-rt`].
-//! Since we do not need the vast majority of them, we avoid the dependency
-//! by providing this file.
+//! Stubs for builtins that should not be used.
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
index 7225abc64084..b19d07f0c6f7 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -88,6 +88,8 @@
 pub mod init;
 pub mod interop;
 pub mod interrupt;
+#[cfg(not(testlib))]
+mod intrinsics;
 pub mod io;
 pub mod ioctl;
 pub mod iommu;

base-commit: 2dee3d3adcadcc57d62ba6608cd02f50b0c10264
-- 
2.43.0

