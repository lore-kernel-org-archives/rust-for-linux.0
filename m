Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C96135A53;
	Fri, 26 Dec 2025 19:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766777080; cv=none; b=fj/06v67sFMLvxTerQVclVja6XZjZ8bICAjuUCaCky/0NrJc+3omKdvRIeYWCtnrBtGmTecBXnRVhWxLnKhfOzELz6v+w3asKCLWpGIKVQACBQWLu3LuAxbwNxFlcMsc6W049Yj4u1wH6PvhKWMunirTrP9Mg8irymX1D7L+5Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766777080; c=relaxed/simple;
	bh=M572ndRnmSqpDTHjVRJtnOBJtDiqpBc3mfxw4TyafRw=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:Mime-Version; b=PdGS6CyLUsiEzg7GEu6SQ7Kq/5tFuKf/xhaDlxoM/+DxoG8ofMhCfHdQR6U9qXLO6mNSAj/dOQrNTDnhKRH1LDcRiuQM8VItOc2BJikGFy8GvKtAJAs0zSsY5ewizUGpiSTQyIUc6r6uWovgjdAF4ciPH+mUdGiCNeC11ikxMEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMsr8aNF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMsr8aNF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D1BC4CEF7;
	Fri, 26 Dec 2025 19:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766777080;
	bh=M572ndRnmSqpDTHjVRJtnOBJtDiqpBc3mfxw4TyafRw=;
	h=Date:Subject:Cc:To:From:From;
	b=XMsr8aNFLmo8z3CBVjKDU5t/llFGHjeJLjmigRluoWli2WBGGmvRRP+h42PdB6Mhb
	 XlaMFhwkv5wsuXoiao4r9/T4cCwd3bL00BpMIizlge61TGF2Jv6ajG6yVFJwQtYhBX
	 E4Wtjk7P9V0m7DNK47jEpZpFmNYhY+AjTLGByl025TUvpBnCK76YCCXsQ9wA6Dl5yK
	 k5ztdPsIGx0iGOdfPOXAEN+/LcyCZdR3gKpC5p8sHdr0exGP3p42iMYHUfeihFztkC
	 BpZ3umu2BhRK32S1SAyc1CT2NawYhTF4Pr/bGbcNLEPbexMArrDmry+9yx3PjvbpAp
	 RjX5UFx411r3w==
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Dec 2025 20:24:36 +0100
Message-Id: <DF8E7C3FALHK.3F0F9RW1IFX7V@kernel.org>
Subject: [GIT PULL] Driver core fixes for 6.19-rc3
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@google.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: aerc 0.21.0

Hi Linus,

Please pull these driver-core fixes.

Due to the linux-next break until January 4, not all of them have been in
linux-next; no conflicts expected.

- Danilo

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8=
:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-6.19-rc3

for you to fetch changes up to 2b742094582db365fe07021b0a9c5405f85049f9:

  fs/kernfs: null-ptr deref in simple_xattrs_free() (2025-12-23 16:14:43 +0=
100)

----------------------------------------------------------------
Driver core fixes for 6.19-rc3

- Introduce DMA Rust helpers to avoid build errors when !CONFIG_HAS_DMA.

- Remove unnecessary (and hence incorrect) endian conversion in the Rust
  PCI driver sample code.

- Fix memory leak in the unwind path of debugfs_change_name().

- Support non-const struct software_node pointers in
  SOFTWARE_NODE_REFERENCE(), after introducing _Generic().

- Avoid NULL pointer dereference in the unwind path of
  simple_xattrs_free().

----------------------------------------------------------------
FUJITA Tomonori (1):
      rust: dma: add helpers for architectures without CONFIG_HAS_DMA

Kuniyuki Iwashima (1):
      debugfs: Fix memleak in debugfs_change_name().

Marko Turk (1):
      samples: rust: fix endianness issue in rust_driver_pci

Sakari Ailus (1):
      software node: Also support referencing non-constant software nodes

Will Rosenberg (1):
      fs/kernfs: null-ptr deref in simple_xattrs_free()

 fs/debugfs/inode.c              |  7 +++++--
 fs/kernfs/dir.c                 |  6 ++++--
 include/linux/property.h        |  1 +
 rust/helpers/dma.c              | 21 +++++++++++++++++++++
 samples/rust/rust_driver_pci.rs |  2 +-
 5 files changed, 32 insertions(+), 5 deletions(-)
