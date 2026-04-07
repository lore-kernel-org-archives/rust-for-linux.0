Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F5619CCF7;
	Tue,  7 Apr 2026 18:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775588135; cv=none; b=qS0fVQTRxQNlFWwuqW0i1vd09kBi/BonOj2Uqp4eQzEVqyfk46zMTbhQ7MkYKUprpculsqfUTjEPZnT7MgobQz8U2JgA/bCRUe89wU7f1f8+gdaG4Q/9boiniPJ40VNO6EkIJx523nxhTt141Y92qyTg/i9+y0eyDFugR64EYkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775588135; c=relaxed/simple;
	bh=AbcygA1hOmjThs+kbyOAawPX0KVgGRAxsXzWkqu+CkY=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:Mime-Version; b=fXcCI8E1FeeuagHrzQ4oA7uupLAS6xVG8VTNwaDhXhqCZRpx7IbI/ls1i5yul5Q4yTEmfvk4w4ATBKArfjP+VC8Wvhl5uGzYQB0fEU5EMFLaxFdlW8X4C6V5Z4G/NXTX+XtGjCiITXl/UyFdxjjqSs2UeP3YgEwAMEuA8rTgR9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FP8MtPvd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FP8MtPvd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE8DC116C6;
	Tue,  7 Apr 2026 18:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775588135;
	bh=AbcygA1hOmjThs+kbyOAawPX0KVgGRAxsXzWkqu+CkY=;
	h=Date:Subject:Cc:To:From:From;
	b=FP8MtPvdSqCBr1ogWi6BQ+YA+Df1Ie2Y3Q0+hkYEJysJV9CoUfrZPCogvwNEPL2xo
	 8mzRD2nqy6ffVpZcIlYLK4+YvwaHV5AzxpXW47Q8hBxVzUbwPJxonshwwyABOOiodl
	 8x9GAf6t0aRGd4GcAa3/EKACYwtrU2al7PvzmERzKCPqVPMv5ZFgxDtFbuN5KMQZC1
	 kinuLl2Fj7epL16gQsVoWfs2yLkbAfNBn/8KTZ016Q3NQSZBwLwYuVZdOre7QYUist
	 JV7CAuzm5CP9xmGUNeQSGmF2iNguvsbZqkj671XvO7pqYYDzdC1TVx6fLrQiMsRDLi
	 GIOzfvs4v5cyg==
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 20:55:31 +0200
Message-Id: <DHN5GMSIBKO2.2AYOLXDU4X19S@kernel.org>
Subject: [GIT PULL] DRM Rust changes for v7.1-rc1 (2nd)
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Dave Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>
From: "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: aerc 0.21.0-0-g5549850facc2

Hi Dave and Sima,

Please pull these DRM Rust fixes.

All changes have been in linux-next for two rounds -- no conflicts expected=
.

- Danilo

The following changes since commit 7c50d748b4a635bc39802ea3f6b120e66b1b9067=
:

  gpu: nova-core: firmware: factor out an elf_str() function (2026-03-30 14=
:01:53 +0900)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/rust/kernel.git tags/drm-rust-next-202=
6-04-06

for you to fetch changes up to a7a080bb4236ebe577b6776d940d1717912ff6dd:

  gpu: nova-core: fix missing colon in SEC2 boot debug message (2026-04-06 =
10:06:39 +0900)

----------------------------------------------------------------
DRM Rust changes for v7.1-rc1 (2nd)

Nova (Core):
  - Don't create intermediate (mutable) references to the whole command
    queue buffer, which is potential undefined behavior.

  - Add missing padding to the falcon firmware DMA buffer to prevent DMA
    transfers going out of range of the DMA buffer.

  - Actually set the default values in the bitfield Default
    implementation.

  - Use u32::from_le_bytes() instead of manual bit shifts to parse the
    PCI ROM header.

  - Fix a missing colon in the SEC2 boot debug message.

----------------------------------------------------------------
Alexandre Courbot (2):
      gpu: nova-core: gsp: fix undefined behavior in command queue code
      gpu: nova-core: falcon: pad firmware DMA object size to required bloc=
k alignment

David Carlier (1):
      gpu: nova-core: fix missing colon in SEC2 boot debug message

Eliot Courtney (1):
      gpu: nova-core: bitfield: fix broken Default implementation

John Hubbard (1):
      gpu: nova-core: vbios: use from_le_bytes() for PCI ROM header parsing

 drivers/gpu/nova-core/bitfield.rs |   5 ++---
 drivers/gpu/nova-core/falcon.rs   |  21 +++++++++++++++++++--
 drivers/gpu/nova-core/gsp/boot.rs |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs | 114 ++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++-----------------------------------------=
-----
 drivers/gpu/nova-core/vbios.rs    |   7 +------
 5 files changed, 91 insertions(+), 58 deletions(-)
