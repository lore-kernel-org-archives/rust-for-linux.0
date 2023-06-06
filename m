Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D1EC77B7A
	for <rust-for-linux@archiver.kernel.org>; Tue,  6 Jun 2023 14:57:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238510AbjFFO5L (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 6 Jun 2023 10:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238531AbjFFO44 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 6 Jun 2023 10:56:56 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D47901725
        for <rust-for-linux@vger.kernel.org>; Tue,  6 Jun 2023 07:56:38 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EAB32F4;
        Tue,  6 Jun 2023 07:57:24 -0700 (PDT)
Received: from capper-ampere.manchester.arm.com (capper-ampere.manchester.arm.com [10.32.100.23])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 966523F6C4;
        Tue,  6 Jun 2023 07:56:37 -0700 (PDT)
From:   Jamie Cunliffe <Jamie.Cunliffe@arm.com>
To:     linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com,
        Asahi Lina <lina@asahilina.net>
Subject: [PATCH v2 0/3] Rust enablement for AArch64
Date:   Tue,  6 Jun 2023 15:56:03 +0100
Message-Id: <20230606145606.1153715-1-Jamie.Cunliffe@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Enable Rust support for the AArch64 architecture.

The first patch enables the basic building of Rust for AArch64. Since
v1 this has been rewritten to avoid the use of a target.json file for
AArch64 and use the upstream rustc target definition. x86-64 still
uses the target.json approach though.

The second patch enables the PAC ret and BTI options in the Rust build
flags to match the options that are used when building C.

The third patch disables Rust support when building for big
endian. Currently there is no `aarch64_be-unknown-none` target which
would allow this. Support for this can come at a later time either by
using the target.json approach, or upstreaming a new target definition
to rustc (preferred). We also might be able to use the
`aarch64_be-unknown-linux-gnu` target, however, this can be done at a
later time.  It's worth noting that in Makefile.clang, it's
recommended for arch/{arch}/Makefile to set the endianness based on
arguments rather than the target triple. It's currently not possible
to do this with rustc, a different target triple has to be used.


Jamie Cunliffe (3):
  arm64: rust: Enable Rust support for AArch64
  arm64: rust: Enable PAC support for Rust.
  arm64: Restrict Rust support to little endian only.

 Documentation/rust/arch-support.rst | 1 +
 Makefile                            | 1 -
 arch/arm64/Kconfig                  | 1 +
 arch/arm64/Makefile                 | 4 ++++
 arch/x86/Makefile                   | 1 +
 rust/Makefile                       | 6 +++++-
 scripts/Makefile                    | 5 +++--
 scripts/generate_rust_target.rs     | 4 +++-
 8 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.30.2

