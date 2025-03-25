Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6839E19ABD8
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Mar 2025 23:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742944972; cv=none; b=nE61zxIWwMVHI5ZrWuZB+c/p2p0WNGeXJxR+RPlJsD8xCUvEU/Unn6DCqLzCxwqqg6Usv3RloMBDnCMvQPhDB6irKYVxmjrtXpZd2hsainQ0OA7xocteQ0ntVMI3ck0s3hW54CI/xWK9EsCPXJMtKIxnWOrCtgXM2Qr1XO6sZ8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742944972; c=relaxed/simple;
	bh=VK9ZJNnvMvLR69pPVF7hCnOJMsL6WneMp/VWN/uzFYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GmkT0iiQGtxODsR/ahJV8PiA7oZOY/BPtIlQcfS5HUPoXEvdeb5dRhWAV3cMCsbD4uivJF+mdNzbam4tuZNhumeBakx/cjt2Hk+vWV1+IRx4HsoWd7Hp4tLaWQMbnI08TLUybJKuaxFK87JzGXugWCQ4vV7b5vjmSG3IX7f7CPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qjhZ5SnY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qjhZ5SnY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66FAC4CEE4;
	Tue, 25 Mar 2025 23:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742944971;
	bh=VK9ZJNnvMvLR69pPVF7hCnOJMsL6WneMp/VWN/uzFYE=;
	h=From:To:Cc:Subject:Date:From;
	b=qjhZ5SnYXCiQ/RxLcz15xLHTqtwvMRQ0ZiTHuie4Ypeaf8I2Li1bg1U99cjUFWNP1
	 PAKSde1ro1EfYGGlrjizMEuqhCT6awTgxw91HQTE01wdDy0zBodaBRrxu12dBoVsMx
	 5cu4zMOd2RLCeDY1dv8UPU76AF4Qj9xiBQ8RRq7GLSU0nkNB1Ycc3UysvYEumK6n89
	 geWyP4mQlYD6lNdUH52FDgYfjvNHROCmcV91EtR8esnG6+8QJ0KCiKF3voTF3mI5vS
	 DjWTKQHOQCDuwOcrwFr2FJMW0WhlnZF+DHMQcaprK8H18YbLf7NzMW8vFqfonm0FcQ
	 Z/Tffi49dvndQ==
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
	acurrid@nvidia.com
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
Subject: [PATCH 0/2] Nova DRM skeleton driver
Date: Wed, 26 Mar 2025 00:21:47 +0100
Message-ID: <20250325232222.5326-1-dakr@kernel.org>
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

This patch series depends on the auxiliary bus abstractions [2] and the DRM
abstractions [3]; the patches from this series are also in [4].

[1] https://gitlab.freedesktop.org/dakr/drm-test
[2] https://web.git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=rust/auxiliary
[3] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/topic/rust-drm
[4] https://gitlab.freedesktop.org/drm/nova/-/tree/staging/nova-drm

Danilo Krummrich (2):
  gpu: nova-core: register auxiliary device for nova-drm
  drm: nova-drm: add initial driver skeleton

 MAINTAINERS                        |  12 ++++
 drivers/gpu/drm/Kconfig            |   2 +
 drivers/gpu/drm/Makefile           |   1 +
 drivers/gpu/drm/nova/Kconfig       |  14 ++++
 drivers/gpu/drm/nova/Makefile      |   3 +
 drivers/gpu/drm/nova/driver.rs     |  70 ++++++++++++++++++++
 drivers/gpu/drm/nova/file.rs       |  68 +++++++++++++++++++
 drivers/gpu/drm/nova/gem.rs        |  49 ++++++++++++++
 drivers/gpu/drm/nova/nova.rs       |  17 +++++
 drivers/gpu/nova-core/Kconfig      |   1 +
 drivers/gpu/nova-core/driver.rs    |   9 ++-
 drivers/gpu/nova-core/nova_core.rs |   2 +
 include/uapi/drm/nova_drm.h        | 101 +++++++++++++++++++++++++++++
 rust/uapi/uapi_helper.h            |   1 +
 14 files changed, 349 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/nova/Kconfig
 create mode 100644 drivers/gpu/drm/nova/Makefile
 create mode 100644 drivers/gpu/drm/nova/driver.rs
 create mode 100644 drivers/gpu/drm/nova/file.rs
 create mode 100644 drivers/gpu/drm/nova/gem.rs
 create mode 100644 drivers/gpu/drm/nova/nova.rs
 create mode 100644 include/uapi/drm/nova_drm.h

-- 
2.49.0

