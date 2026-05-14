Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC74477991;
	Thu, 14 May 2026 15:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771436; cv=none; b=h879jUMcjys+2r79YlwORxu10PvFRkyS+iyfe3cW4glO2O15zjyPxuzhRVjludqH839pepP0laU4od0Wk2bSDyOy+lLLECp2kL0B7BwyJu3YbeR4zLCLzVzaXP5H1gJL21aFToik1DbyEseiooeDOy+eAgtnC0hELLvdnCYjfQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771436; c=relaxed/simple;
	bh=xpBT7aXHe75ybILIwkbdinajgsebopFwpMeA3byrss8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NcyP2xyExG7eaT1ytfpWAJmqDk6kvZQC3Qe5juMlCK1KkdX5KArXkSdY782DSSHh4bz2ioAXFnde3hPzE3FnsKphYQORLSCsF8J9Kwu47Y2PENOyOgiWA/84nCGMtbqniTZ6uoarSygtUSVkyhtihY9xFK5WgYSAkQlUgJLeuQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=blr50gVE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="blr50gVE"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E0631477;
	Thu, 14 May 2026 08:10:25 -0700 (PDT)
Received: from e143943.arm.com (unknown [10.57.23.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 95D373F836;
	Thu, 14 May 2026 08:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778771430; bh=xpBT7aXHe75ybILIwkbdinajgsebopFwpMeA3byrss8=;
	h=From:To:Cc:Subject:Date:From;
	b=blr50gVELrnzVDR9OZgFnAw2CqERmAJ87O07XS/T/eTUHh/3nSyTDRp2MpMXUENv3
	 vMXy0q/SPABIqJtq6fDo6zCw+8GGUHDVoNi7NRb/DIJtbiLNyIvcMyf6fDkr48r5rY
	 Z0A7FFCPhJYdPgtpOL7rwSgk141da163m8H0eVhg=
From: Beata Michalska <beata.michalska@arm.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] Rust: add runtime PM support
Date: Thu, 14 May 2026 17:09:02 +0200
Message-ID: <20260514150957.3501924-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial runtime PM support for Rust drivers.

The concept for Rust abstraction gets introduced in the first patch
in this series. It provides generated dev_pm_ops callbacks for runtime
suspend/resume, tracking runtime PM state, and allowing drivers to carry
custom state across transitions. It also introduces helper types for
common usage patterns and basic PM configuration.

Second one integrates dev_pm_ops into the Rust platform driver abstraction,
enabling drivers to register PM callbacks with the core.

The last in the series is provided for demonstrative purposes
(not intended to be an actual merge material).

This has been lightly tested with the Tyr driver.


Beata Michalska (3):
  rust: Add runtime PM support
  rust/platform: Add support for runtime PM
  drm/tyr: wire runtime PM hooks

 drivers/gpu/drm/tyr/driver.rs   | 123 ++++-
 drivers/gpu/drm/tyr/file.rs     |   3 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/helpers.c          |   1 +
 rust/helpers/pm_runtime.c       |  38 ++
 rust/kernel/lib.rs              |   1 +
 rust/kernel/platform.rs         |  18 +
 rust/kernel/pm.rs               | 924 ++++++++++++++++++++++++++++++++
 8 files changed, 1086 insertions(+), 23 deletions(-)
 create mode 100644 rust/helpers/pm_runtime.c
 create mode 100644 rust/kernel/pm.rs

-- 
2.43.0

