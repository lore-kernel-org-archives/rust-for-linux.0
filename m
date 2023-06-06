Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2804C7EE24
	for <rust-for-linux@archiver.kernel.org>; Tue,  6 Jun 2023 15:08:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237628AbjFFPIW (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 6 Jun 2023 11:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233077AbjFFPIV (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 6 Jun 2023 11:08:21 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AD1FA1B5
        for <rust-for-linux@vger.kernel.org>; Tue,  6 Jun 2023 08:08:20 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51CE82F4;
        Tue,  6 Jun 2023 07:58:56 -0700 (PDT)
Received: from capper-ampere.manchester.arm.com (capper-ampere.manchester.arm.com [10.32.100.23])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA71E3F6C4;
        Tue,  6 Jun 2023 07:58:09 -0700 (PDT)
From:   Jamie Cunliffe <Jamie.Cunliffe@arm.com>
To:     linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com,
        Asahi Lina <lina@asahilina.net>
Subject: [PATCH v2 2/3] arm64: rust: Enable PAC support for Rust.
Date:   Tue,  6 Jun 2023 15:56:05 +0100
Message-Id: <20230606145606.1153715-3-Jamie.Cunliffe@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230606145606.1153715-1-Jamie.Cunliffe@arm.com>
References: <20230606145606.1153715-1-Jamie.Cunliffe@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Enable the PAC ret and BTI options in the Rust build flags to match
the options that are used when building C.

Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
---
 arch/arm64/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 2ce1555e9fc5..4a2c807d65db 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -67,7 +67,9 @@ endif
 
 ifeq ($(CONFIG_ARM64_BTI_KERNEL),y)
   KBUILD_CFLAGS += -mbranch-protection=pac-ret+bti
+  KBUILD_RUSTFLAGS += -Z branch-protection=bti,pac-ret
 else ifeq ($(CONFIG_ARM64_PTR_AUTH_KERNEL),y)
+  KBUILD_RUSTFLAGS += -Z branch-protection=pac-ret
   ifeq ($(CONFIG_CC_HAS_BRANCH_PROT_PAC_RET),y)
     KBUILD_CFLAGS += -mbranch-protection=pac-ret
   else
-- 
2.30.2

