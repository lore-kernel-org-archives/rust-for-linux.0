Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F04C27C76
	for <rust-for-linux@archiver.kernel.org>; Wed, 25 Jan 2023 16:38:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234845AbjAYQiO (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 25 Jan 2023 11:38:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234999AbjAYQiM (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 25 Jan 2023 11:38:12 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 96F1EE395
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Jan 2023 08:38:11 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34F7AC14;
        Wed, 25 Jan 2023 08:38:53 -0800 (PST)
Received: from capper-ampere.manchester.arm.com (capper-ampere.manchester.arm.com [10.32.100.23])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77CC73F5A1;
        Wed, 25 Jan 2023 08:38:10 -0800 (PST)
From:   Jamie Cunliffe <Jamie.Cunliffe@arm.com>
To:     linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com
Subject: [PATCH 2/3] arm64: rust: Enable PAC support for Rust.
Date:   Wed, 25 Jan 2023 16:37:38 +0000
Message-Id: <20230125163739.3798252-3-Jamie.Cunliffe@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
References: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
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
index d62bd221828f..b53ab6aa2dfe 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -85,8 +85,10 @@ PACRET-$(CONFIG_UNWIND_PATCH_PAC_INTO_SCS) := pac-ret
 
 ifeq ($(CONFIG_ARM64_BTI_KERNEL),y)
 branch-prot-flags-$(CONFIG_CC_HAS_BRANCH_PROT_PAC_RET_BTI) := -mbranch-protection=$(PACRET-y)+bti
+KBUILD_RUSTFLAGS += -Z branch-protection=bti,pac-ret,leaf
 else
 branch-prot-flags-$(CONFIG_CC_HAS_BRANCH_PROT_PAC_RET) := -mbranch-protection=$(PACRET-y)
+KBUILD_RUSTFLAGS += -Z branch-protection=pac-ret,leaf
 endif
 # -march=armv8.3-a enables the non-nops instructions for PAC, to avoid the
 # compiler to generate them and consequently to break the single image contract
-- 
2.30.2

