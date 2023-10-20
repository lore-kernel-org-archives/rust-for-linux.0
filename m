Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD54A1DA4C
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Oct 2023 15:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id B3426E8
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Oct 2023 08:52:37 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55B7C143D;
	Fri, 20 Oct 2023 08:53:18 -0700 (PDT)
Received: from capper-ampere.manchester.arm.com (capper-ampere.manchester.arm.com [10.32.100.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A6843F5A1;
	Fri, 20 Oct 2023 08:52:36 -0700 (PDT)
From: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	steve.capper@arm.com,
	Asahi Lina <lina@asahilina.net>,
	boqun.feng@gmail.com,
	andrew@lunn.ch
Subject: [PATCH v4 0/2] Rust enablement for AArch64
Date: Fri, 20 Oct 2023 16:50:54 +0100
Message-Id: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Rust support for the AArch64 architecture.

Since the v3 this has been refactored to split up the x86 Makefile
changes. Updated the x86-64 conditionals as suggested by Boqun and
addressed the formatting issues Miguel raised.


Jamie Cunliffe (2):
  rust: Refactor the build target to allow the use of builtin targets
  arm64: rust: Enable Rust support for AArch64

 Documentation/rust/arch-support.rst | 1 +
 Makefile                            | 1 -
 arch/arm64/Kconfig                  | 1 +
 arch/arm64/Makefile                 | 4 ++++
 arch/x86/Makefile                   | 1 +
 rust/Makefile                       | 6 +++++-
 scripts/Makefile                    | 4 +++-
 scripts/generate_rust_target.rs     | 4 +++-
 8 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.30.2

