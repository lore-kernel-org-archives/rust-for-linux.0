Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A8E1A4F2F
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 16:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745510707; cv=none; b=cBh77/2rH9bpEHHxvAXRB/R48n+B+uU4kE/q45nT3sHlYL8gaaWD1Zt0r7kz2AYqSqPbDIsFHT0ORN34ShhTvphljsHT0fI+5R5hD1YLuTv5QnAAn2e8VRc4XXs0IPbcdJEkys0uYsR5mTP+akGo2eXWTte3g+Oa/adyoJ714mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745510707; c=relaxed/simple;
	bh=f6ywoHMqfeBPcNkHdnM5Yns8xsYtgfClPhpFJMrqSBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TjmI6wVwNGAPTyVcvjo3WKHLJO1X3/S6AoGGSWlR4Jge+NFdZICZnneyxjhaBsHWD0qfWT9ULYxCoUB1R+mmVV2qIp67rCeClcOw9W1XeWuwwigUeM2XxV94Cb2ZUrF8ty07fgbHCi5pKTqyw8Vt3MdQLjqaseoe7/lziRLPZBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tkEO4vVG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tkEO4vVG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D682FC4CEEB;
	Thu, 24 Apr 2025 16:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745510707;
	bh=f6ywoHMqfeBPcNkHdnM5Yns8xsYtgfClPhpFJMrqSBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tkEO4vVG2ZNhkX//s5dGQ/gjIs8GITqYaSFs3XWqCLUL4x9WAU8a4cYPI/LK0077s
	 zv6piXbuK8gsqlFB1oOaL5S295fGiG+wv7lo9zwSyybKXEVWX39+HQ3lYHUpSxfo7z
	 +AAVM4tXc68Qf+e4Igx6YWmqyuIBdFtpTL7bZ6RIzaAlsiLcnsYL8nITch90NQSnzN
	 4qAQB+lCW/uXgNWETni2teLNnKoG+LiKvodY1CorHbnUdRJmMc0qKzrSArbAf3nbng
	 3He3e64YDjUIZJ+riouQfbk9IHEDdxxC1OeVoTpOwhK2dDMKOYllH3KFRMXC7IjIxa
	 ptQluXjhRg7kQ==
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
Subject: [PATCH v2 1/2] gpu: nova-core: register auxiliary device for nova-drm
Date: Thu, 24 Apr 2025 18:02:49 +0200
Message-ID: <20250424160452.8070-2-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424160452.8070-1-dakr@kernel.org>
References: <20250424160452.8070-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register an auxiliary device for nova-drm.

For now always use zero for the auxiliary device's ID; we don't use it
yet anyways. However, once it lands, we should switch to XArray.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/Kconfig      | 1 +
 drivers/gpu/nova-core/driver.rs    | 9 ++++++++-
 drivers/gpu/nova-core/nova_core.rs | 2 ++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index ad0c06756516..67f99b6a023a 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -1,5 +1,6 @@
 config NOVA_CORE
 	tristate "Nova Core GPU driver"
+	depends on AUXILIARY_BUS
 	depends on PCI
 	depends on RUST
 	depends on RUST_FW_LOADER_ABSTRACTIONS
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index a08fb6599267..8c86101c26cb 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{bindings, c_str, device::Core, pci, prelude::*};
+use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*};
 
 use crate::gpu::Gpu;
 
@@ -8,6 +8,7 @@
 pub(crate) struct NovaCore {
     #[pin]
     pub(crate) gpu: Gpu,
+    _reg: auxiliary::Registration,
 }
 
 const BAR0_SIZE: usize = 8;
@@ -38,6 +39,12 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         let this = KBox::pin_init(
             try_pin_init!(Self {
                 gpu <- Gpu::new(pdev, bar)?,
+                _reg: auxiliary::Registration::new(
+                    pdev.as_ref(),
+                    c_str!("nova-drm"),
+                    0, // TODO: Once it lands, use XArray; for now we don't use the ID.
+                    crate::MODULE_NAME
+                )?,
             }),
             GFP_KERNEL,
         )?;
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index a91cd924054b..618632f0abcc 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -8,6 +8,8 @@
 mod regs;
 mod util;
 
+pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
+
 kernel::module_pci_driver! {
     type: driver::NovaCore,
     name: "NovaCore",
-- 
2.49.0

