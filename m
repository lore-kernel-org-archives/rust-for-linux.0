Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF65E262AA
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Oct 2023 13:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id A670FA2
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Oct 2023 06:15:52 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7E9F1FB;
	Mon, 16 Oct 2023 06:16:32 -0700 (PDT)
Received: from capper-ampere.manchester.arm.com (capper-ampere.manchester.arm.com [10.32.100.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B17A3F5A1;
	Mon, 16 Oct 2023 06:15:50 -0700 (PDT)
From: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	steve.capper@arm.com,
	Asahi Lina <lina@asahilina.net>,
	boqun.feng@gmail.com
Subject: [PATCH v3 0/1] Rust enablement for AArch64
Date: Mon, 16 Oct 2023 14:15:22 +0100
Message-Id: <20231016131523.1521965-1-Jamie.Cunliffe@arm.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Enable Rust support for the AArch64 architecture.

The only change here since the v2 patch is the removal of the
fp-armv8 feature. rustc ties fp and Neon together. However due to a
bug in versions before 1.71 fp wasn't correctly being disabled. Now
the compiler version used is 1.71 we can drop this option which now
allows this to build without warnings.

Jamie Cunliffe (1):
  arm64: rust: Enable Rust support for AArch64

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

