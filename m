Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908EFC54E94
	for <rust-for-linux@archiver.kernel.org>; Wed, 25 Jan 2023 16:38:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234565AbjAYQiH (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 25 Jan 2023 11:38:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234845AbjAYQiG (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 25 Jan 2023 11:38:06 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1EB92E394
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Jan 2023 08:38:05 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B11FB4B3;
        Wed, 25 Jan 2023 08:38:46 -0800 (PST)
Received: from capper-ampere.manchester.arm.com (capper-ampere.manchester.arm.com [10.32.100.23])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 006E73F5A1;
        Wed, 25 Jan 2023 08:38:03 -0800 (PST)
From:   Jamie Cunliffe <Jamie.Cunliffe@arm.com>
To:     linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com
Subject: [PATCH 1/3] arm64: rust: Enable Rust support for AArch64
Date:   Wed, 25 Jan 2023 16:37:37 +0000
Message-Id: <20230125163739.3798252-2-Jamie.Cunliffe@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
References: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: Miguel Ojeda <ojeda@kernel.org>

This commit provides the build flags for Rust for AArch64. The core Rust
support already in the kernel does the rest.

The Rust samples have been tested with this commit.

[jcunliffe: Arm specific parts taken from Miguel's upstream tree]

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Co-developed-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
---
 Documentation/rust/arch-support.rst |  1 +
 arch/arm64/Kconfig                  |  1 +
 scripts/generate_rust_target.rs     | 13 ++++++++++++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 6982b63775da..3776059a385a 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,5 +15,6 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 ============  ================  ==============================================
 Architecture  Level of support  Constraints
 ============  ================  ==============================================
+``arm64``     Maintained        None.
 ``x86``       Maintained        ``x86_64`` only.
 ============  ================  ==============================================
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 03934808b2ed..fc3800e82802 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -209,6 +209,7 @@ config ARM64
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select MMU_GATHER_RCU_TABLE_FREE
 	select HAVE_RSEQ
+	select HAVE_RUST
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_KPROBES
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 3c6cbe2b278d..fe0e4ba54492 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -148,7 +148,18 @@ fn main() {
     let mut ts = TargetSpec::new();
 
     // `llvm-target`s are taken from `scripts/Makefile.clang`.
-    if cfg.has("X86_64") {
+    if cfg.has("ARM64") {
+        ts.push("arch", "aarch64");
+        ts.push(
+            "data-layout",
+            "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128",
+        );
+        ts.push("disable-redzone", true);
+        ts.push("features", "+strict-align,+neon,+fp-armv8");
+        ts.push("llvm-target", "aarch64-linux-gnu");
+        ts.push("max-atomic-width", 128);
+        ts.push("target-pointer-width", "64");
+    } else if cfg.has("X86_64") {
         ts.push("arch", "x86_64");
         ts.push(
             "data-layout",
-- 
2.30.2

