Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B37E1DF25F;
	Sat, 10 Jan 2026 20:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768077654; cv=none; b=UNgzOB3QoG1TqLWVE2UT0UTUahWHRLfmolU7X4OTAGlxCL2HnsIkVgL8s6fdF+pQXbv63tnKP1g6ilSVQq8pbj1zoNNFwjpvtfmdKdvt37a1t5tuIucB/45SBImq12dN9rVLR05+CRYy954RkXdWg2SgE3yIo+Tk2GqYM2xubJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768077654; c=relaxed/simple;
	bh=5qReUI3E15TYcwKKQ641ibNwsLMlmr10m3Nd8fiAPS0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc; b=hPOV+GV3Iu2Hl5PC12KL6wf9odXgh8CSszY+uKzQNRjlQvtFzaiZ8q3UM7+hQ3v06AfRDBiE7wZneCiKWSLehZ5O3ukv3IkFfp1Tq0K1sR0dKQPIyLK69zoVVFbqDZX4loMtRL87u6IXtq1H59keGNBP0pdGwrP50WkFkrtrfIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8aq4N5D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8aq4N5D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C8FC4CEF1;
	Sat, 10 Jan 2026 20:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768077653;
	bh=5qReUI3E15TYcwKKQ641ibNwsLMlmr10m3Nd8fiAPS0=;
	h=Date:To:From:Subject:Cc:From;
	b=n8aq4N5DTuLuRApmwS5XYO9D2zQvfykm8w9YOc2A7OU22y/zLlZ1ctfZDQogBdXxk
	 G2GOlNPHX6m4U8n24bhOjFEUZKBEQJNBSD2C2QEt140qvnYjmBrQQo8YldmT53rdhN
	 i4RX4vRRdMAUMbKeGghbQmpHr94wYxDM4FP0njuEFkpBtpGz6NawWZVr5NuF4LPR8U
	 JmS2ub1kGaJcMgxqLpu1DImjdM73lz1ocx1TiUgbxTc/I1Z309J9fSuWLTj+JwvX8G
	 IsNf24uYPdxNXT+XYins9EzMS3Tpb+vexT6uI7vCc/pJWRZTreVBhCkTYF0CIpkK6i
	 qGCP9i5OvAPVA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 Jan 2026 21:40:50 +0100
Message-Id: <DFL77VCNNY40.3GCIR8ZYI14RU@kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: [GIT PULL] Driver core fixes for 6.19-rc5
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0

Hi Linus,

Please pull these driver-core fixes.

All commits have been in linux-next for a couple rounds; no conflicts expec=
ted.

- Danilo

The following changes since commit f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da=
:

  Linux 6.19-rc3 (2025-12-28 13:24:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-6.19-rc5

for you to fetch changes up to 8510ef5e3cfbd7d59a16845f85cd0194a8689761:

  rust: device: Remove explicit import of CStrExt (2026-01-06 21:18:31 +010=
0)

----------------------------------------------------------------
Driver core fixes for 6.19-rc5

- Fix swapped example values for the `family` and `machine` attributes
  in the sysfs SoC bus ABI documentation.

- Fix Rust build and intra-doc issues when optional subsystems
  (CONFIG_PCI, CONFIG_AUXILIARY_BUS, CONFIG_PRINTK) are disabled.

- Fix typos and incorrect safety comments in Rust PCI, DMA, and device
  ID documentation.

----------------------------------------------------------------
Alice Ryhl (1):
      rust: driver: fix broken intra-doc links to example driver types

FUJITA Tomonori (3):
      rust: dma: fix broken intra-doc links
      rust: device: fix broken intra-doc links
      rust: device: Remove explicit import of CStrExt

Marko Turk (1):
      rust: pci: fix typos in Bar struct's comments

Matthew Maurer (1):
      docs: ABI: sysfs-devices-soc: Fix swapped sample values

Yilin Chen (2):
      rust: dma: remove incorrect safety documentation
      rust: device_id: replace incorrect word in safety documentation

 Documentation/ABI/testing/sysfs-devices-soc |  4 ++--
 rust/kernel/device.rs                       |  7 +++----
 rust/kernel/device_id.rs                    |  2 +-
 rust/kernel/dma.rs                          |  7 +++----
 rust/kernel/driver.rs                       | 12 ++++++++----
 rust/kernel/pci/io.rs                       |  4 ++--
 6 files changed, 19 insertions(+), 17 deletions(-)
