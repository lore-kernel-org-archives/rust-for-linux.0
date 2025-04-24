Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D0827FD54
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 16:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745510702; cv=none; b=pF7H73fRNzBOO4glP7xgNDN2FE72sXmqoPE3EneEnt6gLsLldGQgUI4M9BcFT+B1NLPcyHRurqDiSI3RlpOZTTlLWclQGqii2ZGRB5H5lG+ulxf6sSIgOaIJhYmzmCPjOGP3HsRFQZib1XWCTTQ5WNTqFtagLotEgsMGiwfptTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745510702; c=relaxed/simple;
	bh=4frO21QcxsLI0trc+FOr8X9D+IvqGW3BO/OVZ5Uoot0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ntxU4XfNwFcs9XQUpVbUKUf+MsrTUXbIE+iKy3Et2bQeV0u2CST4SFMyrNCY+p/cuKZHafUxfhITGgETzLUP7s1E48/fjduRDBlsTG+hL17zncPk9irq2utq7wcvcEr55drGO8hPb5UZdBAD0ncjeT25gAwKyhG8lDS5q2wg0Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChxVGb5H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChxVGb5H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D69C4CEEC;
	Thu, 24 Apr 2025 16:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745510701;
	bh=4frO21QcxsLI0trc+FOr8X9D+IvqGW3BO/OVZ5Uoot0=;
	h=From:To:Cc:Subject:Date:From;
	b=ChxVGb5HqsdlHr1HbgNFZIcgsvMFGiNz3hr9aJPkbet73apBb7iKmlLpxFVuKZ7ZJ
	 RQXWGFUuUNlwFYSDvK9yl5yPQdO05a8RM34yi/csJu351gLLePsa1os+yRDnr2mvAR
	 7er1T3HkVIh9vi+/iAyZgisY3bPq15/byNCcYPxWzJk+ITeykNIcGtmUcerbCYKSYj
	 Ubs/FK8qHGGV+1PdugTmrEYyJLXHTBkoylAtzT6tl0WAkUygB+ZkJP2FR1OxyEWidz
	 8ktOyWWY272TEbaY2cVCXbpf5++1GcR3e9P+GBkf3XVEMf9zVZ6L/S0MoEtSVqwS+5
	 9oIxMkrsHTsew==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	ajanulgu@redhat.com,
	lyude@redhat.com,
	pstanner@redhat.com,
	zhiw@nvidia.com,
	cjia@nvidia.com,
	jhubbard@nvidia.com,
	bskeggs@nvidia.com,
	acurrid@nvidia.com,
	joelagnelf@nvidia.com,
	ttabi@nvidia.com,
	acourbot@nvidia.com
Cc: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 0/2] Nova DRM skeleton driver
Date: Thu, 24 Apr 2025 18:02:48 +0200
Message-ID: <20250424160452.8070-1-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds the nova-drm skeleton driver.

nova-drm is connected to nova-core through the auxiliary bus and implements the
DRM parts of the nova driver stack.

For now, it implements the fundamental DRM abstractions, i.e. creates a DRM
device and registers it, exposing a three sample IOCTLs.

  DRM_IOCTL_NOVA_GETPARAM
    - provides the PCI bar size from the bar that maps the GPUs VRAM from
      nova-core

  DRM_IOCTL_NOVA_GEM_CREATE
    - creates a new dummy DRM GEM object and returns a handle

  DRM_IOCTL_NOVA_GEM_INFO
    - provides metadata for the DRM GEM object behinda given handle

I implemented a small userspace test suite [1] that utilizes this
interface.

The patches from this series are also available in [2].

[1] https://gitlab.freedesktop.org/dakr/drm-test
[2] https://gitlab.freedesktop.org/drm/nova/-/tree/staging/nova-drm

Changes in v2:
  - Implement abstractions for the corresponding ::kernel::uapi:: types.

Danilo Krummrich (2):
  gpu: nova-core: register auxiliary device for nova-drm
  drm: nova-drm: add initial driver skeleton

 MAINTAINERS                        |  12 ++++
 drivers/gpu/drm/Kconfig            |   2 +
 drivers/gpu/drm/Makefile           |   1 +
 drivers/gpu/drm/nova/Kconfig       |  14 ++++
 drivers/gpu/drm/nova/Makefile      |   3 +
 drivers/gpu/drm/nova/driver.rs     |  69 ++++++++++++++++++++
 drivers/gpu/drm/nova/file.rs       |  74 +++++++++++++++++++++
 drivers/gpu/drm/nova/gem.rs        |  49 ++++++++++++++
 drivers/gpu/drm/nova/nova.rs       |  18 +++++
 drivers/gpu/drm/nova/uapi.rs       |  61 +++++++++++++++++
 drivers/gpu/nova-core/Kconfig      |   1 +
 drivers/gpu/nova-core/driver.rs    |   9 ++-
 drivers/gpu/nova-core/nova_core.rs |   2 +
 include/uapi/drm/nova_drm.h        | 101 +++++++++++++++++++++++++++++
 rust/uapi/uapi_helper.h            |   1 +
 15 files changed, 416 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/nova/Kconfig
 create mode 100644 drivers/gpu/drm/nova/Makefile
 create mode 100644 drivers/gpu/drm/nova/driver.rs
 create mode 100644 drivers/gpu/drm/nova/file.rs
 create mode 100644 drivers/gpu/drm/nova/gem.rs
 create mode 100644 drivers/gpu/drm/nova/nova.rs
 create mode 100644 drivers/gpu/drm/nova/uapi.rs
 create mode 100644 include/uapi/drm/nova_drm.h


base-commit: b5cb47f81a2857d270cabbbb3a9feec0e483caed
-- 
2.49.0

