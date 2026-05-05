Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6106309F1C;
	Tue,  5 May 2026 09:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973026; cv=none; b=syTvb0sUMrCUpYuzTQsgoVBM0ZZKfy9pk0PgoiMAPGpTCW3PhTa1CokWNbkA6uk4MSKcX7kKAyfpv2TI0w+P3J6PYzehaxR+R+L/lRq9kJ0arqFH3FjAhIQEonXZUMjvzQ4omLSx2tEu39CzF4aqHwpW2g0FhXy3V12bsB4PXUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973026; c=relaxed/simple;
	bh=6ByzArm6c9srdkzSpiFI1EwobrNc4kEF+ciE/WkIMy8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nb5t107kzSy6/8/Pv+FQdsbJoTxz355AEnP4jvnz2QPhr6rTyjAuJLPJhu4BzT39wvX9hpRbSaOp5hOJTWCq792mVWBPgGVAt2ZJxImoV4zeolhFxc+nhOISg9RjUG+PM1zKESulebnk0YDPC1sFsuC+heErYKMBmDqs1I/q4ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FpaXi/Re; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FpaXi/Re"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777973022;
	bh=6ByzArm6c9srdkzSpiFI1EwobrNc4kEF+ciE/WkIMy8=;
	h=From:To:Cc:Subject:Date:From;
	b=FpaXi/Re+zbxWlAeTNktVEuXjWs0uMKcTPRyK0hzVYseTj/H0I6eI5eYRXkJhseDa
	 QhfVCmTnSxMZVvuTjv1xJsjw6L9Nx1mU1JavtaIgKbPxMEczpQiZam2b+DOGUnh5Q6
	 +m30XnN99Im5hXCSg1mjueRZaS1YfCHLaO55Up0rBeW/nu/HFwUv3Iqf9MDYpylCnc
	 BHSyo/Gor0YE4I+5mrJeak5yvu1HKPy6IiR6gGJvk2W8z+jnbtrpeWfrJy4TkzX9rc
	 B3rTPC2s3GRbqWfX+AsZbimnp+J/WwuunqcCqD/TSbOK3GXO0Cu2bLsTu74u+JkI17
	 AyPv1cL93BMCw==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 16D8117E1301;
	Tue,  5 May 2026 11:23:42 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: dakr@kernel.org,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	boris.brezillon@collabora.com
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH v2 0/1] DRM 'feature' support for DRM drivers
Date: Tue,  5 May 2026 11:23:03 +0200
Message-Id: <20260505092304.108262-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a follow up to [1], which introduces feature support for DRM
drivers, as will soon be needed by Tyr and rvkms.

Based on feedback and discussion on the first iteration, render node
support has been reworked.

Support for render nodes was initially modeled as an unsafe trait, to
require drivers to comply with any safety requirements tied to enabling
a given feature. For DRIVER_RENDER specifically, the intent was to force
implementors to ensure that any ioctl declared with DRM_RENDER_ALLOW
does not call KMS/modesetting APIs or require DRM_MASTER.

However, the C DRM core already enforces render node access control at
the ioctl dispatch level: if a client opens a render node, any ioctl
without the DRM_RENDER_ALLOW flag will fail. So the C DRM framework
already ensures the rules are respected for core ioctls, and the
unsafe trait doesn't add any meaningful protection beyond this.

For these reasons and since enabling DRIVER_RENDER doesn't require any
particular method to be implemented, there's no real need to model this
as a trait, and a boolean flag is sufficient.

This does not prevent other driver features to be modeled differently
based on their requirements. Features that require additional ops (e.g.
FEAT_MODESET) could instead be modeled as a trait, and some other
constant type that can only be constructed when the relevant trait is
implemented.

Introducing the RENDER_CAPABILITY bool flag here leaves room for
implementing other features differently at a later stage.

Changes since v1:
- Replaced DriverFeatures trait and ZSTs with single
  RENDER_CAPABILITY: bool constant
- Squashed changes into a single patch

[1] v1: https://lore.kernel.org/rust-for-linux/20260119-drm-render-v1-0-8326e4d5cb44@collabora.com/

Laura Nao (1):
  rust: drm: add RENDER_CAPABILITY flag for render node support

 drivers/gpu/drm/tyr/driver.rs |  1 +
 rust/kernel/drm/device.rs     | 12 +++++++++++-
 rust/kernel/drm/driver.rs     |  5 +++++
 3 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.39.5

