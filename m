Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860A8C27C76
	for <rust-for-linux@archiver.kernel.org>; Wed, 25 Jan 2023 16:38:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235248AbjAYQh6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 25 Jan 2023 11:37:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234845AbjAYQh5 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 25 Jan 2023 11:37:57 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7EA3B1025B
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Jan 2023 08:37:56 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CAE54B3;
        Wed, 25 Jan 2023 08:38:38 -0800 (PST)
Received: from capper-ampere.manchester.arm.com (capper-ampere.manchester.arm.com [10.32.100.23])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EC7A3F5A1;
        Wed, 25 Jan 2023 08:37:55 -0800 (PST)
From:   Jamie Cunliffe <Jamie.Cunliffe@arm.com>
To:     linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com
Subject: [PATCH 0/3] Rust enablement for AArch64
Date:   Wed, 25 Jan 2023 16:37:36 +0000
Message-Id: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

The first patch is from Miguel's tree to enable Rust support for
AArch64. This has been tested with the Rust samples, and the generated
code has also been manually inspected.

The second patch enables the PAC ret and BTI options in the Rust build
flags to match the options that are used when building C.

The third patch disables the neon and fp target features to avoid fp &
simd registers. The use of fp-armv8 will cause a warning from rustc
about an unknown feature that is specified. The target feature is
still passed through to LLVM, this behaviour is documented as part of
the warning. This will be fixed in a future version of the rustc
toolchain. This pull request should address it,
https://github.com/rust-lang/rust/pull/107294


Jamie Cunliffe (2):
  arm64: rust: Enable PAC support for Rust.
  arm64: rust: Disable neon and fp target features.

Miguel Ojeda (1):
  arm64: rust: Enable Rust support for AArch64

 Documentation/rust/arch-support.rst |  1 +
 arch/arm64/Kconfig                  |  1 +
 arch/arm64/Makefile                 |  4 ++++
 scripts/generate_rust_target.rs     | 13 ++++++++++++-
 4 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.30.2

