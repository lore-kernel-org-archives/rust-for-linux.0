Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB2CC27C76
	for <rust-for-linux@archiver.kernel.org>; Wed, 25 Jan 2023 16:38:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjAYQiX (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 25 Jan 2023 11:38:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235456AbjAYQiU (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 25 Jan 2023 11:38:20 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6E65E3CE0B
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Jan 2023 08:38:18 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B4554B3;
        Wed, 25 Jan 2023 08:39:00 -0800 (PST)
Received: from capper-ampere.manchester.arm.com (capper-ampere.manchester.arm.com [10.32.100.23])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D0993F5A1;
        Wed, 25 Jan 2023 08:38:17 -0800 (PST)
From:   Jamie Cunliffe <Jamie.Cunliffe@arm.com>
To:     linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com
Subject: [PATCH 3/3] arm64: rust: Disable neon and fp target features.
Date:   Wed, 25 Jan 2023 16:37:39 +0000
Message-Id: <20230125163739.3798252-4-Jamie.Cunliffe@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
References: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Disable the neon and fp target features to avoid fp & simd
registers. The use of fp-armv8 will cause a warning from rustc about
an unknown feature that is specified. The target feature is still
passed through to LLVM, this behaviour is documented as part of the
warning. This will be fixed in a future version of the rustc
toolchain.

Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
---
 arch/arm64/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index b53ab6aa2dfe..33ae20fc3f56 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -41,6 +41,8 @@ KBUILD_CFLAGS	+= -mgeneral-regs-only	\
 KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
 KBUILD_AFLAGS	+= $(compat_vdso)
 
+KBUILD_RUSTFLAGS += -C target-feature="-neon,-fp-armv8"
+
 KBUILD_CFLAGS	+= $(call cc-option,-mabi=lp64)
 KBUILD_AFLAGS	+= $(call cc-option,-mabi=lp64)
 
-- 
2.30.2

