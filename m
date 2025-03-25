Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6738A19ABD8
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Mar 2025 23:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742944977; cv=none; b=cfMnJm7JRLnKhOXTgXAC6YWp0rz+HcnK8B/HE13QXVfbi+fRt3EY9caS9TbIOzTj5VR0onUhcL6OGgMwXgMDryZZHJ19XY5/nS3vxaU45FtfYH+pWfcHOYclSA5zozzkePr6lDWqpC54CIkAf9C3cH3mIsNxEOrFm9NIMwNkmmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742944977; c=relaxed/simple;
	bh=yMKjqA8+nvwGclcEzRzPOItFlMyNrbXdEhrynmZPv24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FHGwf8nUK0jwtCTsjZiCotVX3hi7I0f0CZee9qCAiAiFUZY5zjJtY3Z5FM/6HF0BNFwNPU53xqzjZ79p4cjlipaQjlSKG6hzmsRHyP5lNMmbI7gTXZ0H6RCPYjkRHLUPVOpOH91Dg1OyXdxmJyor6uKEKr2IRK2C17uCqr27wcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifYujVim; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifYujVim"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463AEC4CEE9;
	Tue, 25 Mar 2025 23:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742944977;
	bh=yMKjqA8+nvwGclcEzRzPOItFlMyNrbXdEhrynmZPv24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ifYujVimCKe1BZVrKrSJ9a74YPfb1RAiND2hccz9thEj+06K88NkZC1rzXSm1+G5B
	 qdLy3AwnwRQFW9hLerTM9Mcd8U396AP3ITHKy9vE8gkAV5SFLb5m8SAQ8vmMQHv4wz
	 CYDfkf7hbUdkMHVq+vZGscYaZwmAFncRvQy5d6N3FbeE21lz7dBnUfzVDoZGr5wqtV
	 xFM+EdimsRsnxR2rM9uYBh7h2YifVd741b4s+2Hvmu5UtfsMDm12p9fCF+FFUaC/Rg
	 W3XFfpsHZvrXVlCZ7+fPJped1z7g0xmVgvB9FMG6arxozszWbEu+dokkXoW4AUwXdW
	 ITXPe84E/+vsA==
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
Subject: [PATCH 1/2] gpu: nova-core: register auxiliary device for nova-drm
Date: Wed, 26 Mar 2025 00:21:48 +0100
Message-ID: <20250325232222.5326-2-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325232222.5326-1-dakr@kernel.org>
References: <20250325232222.5326-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register an auxiliary device for nova-drm.

For now always use zero for the auxiliary device' ID; we don't use it yet
anyways. However, once it lands, we should switch to XArray.

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
index a08fb6599267..9ed39637d43f 100644
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
+                    0, // TODO: Once it lands, use XArray, for now we don't use the ID.
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

