Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AFC32FA2B
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 23:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772493925; cv=pass; b=FYb4n5afTeRpt9RdiNlixCumxpm+uPP4bQCzZTCFwvDwUeUChUuytXFi/ng8i1plZQ7bNlc0EYph1ZwrYoLRmoXdHEWOI+Gd/GRIKXlaywLXpwqsFW2NVv1gZjskqmgElBfGJTTp9uKKzYAbSTwYO+pAhihqxoLx6Hv15lf6540=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772493925; c=relaxed/simple;
	bh=G75IKl4xGwtfNgcWnzkv4BKMCpA6BkjaqRkGYhYUAnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J2rYdW8KyoccoKrorXLQfmlhi5miw5YuCHnIQTUq88NCjwUFNUFPMbGI64Wb2ZmGvt1rMwFgTkni8rvFhO18HQgWl+KaELwz6BKbe0cqjLl/ikQxEfiGCArPcSMcelfV7G/lHbhklnLqSNl6aYXh7lDyPRHJ+QMQv8L5rcqZApE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=c3e5vY+Z; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="c3e5vY+Z"
ARC-Seal: i=1; a=rsa-sha256; t=1772493911; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cLMS5XUlhNgUuG5K3A4x3sOiC0RtDo44ItRuiZ3k7RiEK8ruxEsoA1rrgg2HBotFeouJ7WXAvt//vdmJrRDr3RdSEDf/IhisQaa4K69+Hr5KQg+XEzr53tRQc8PV0wGazITWT2BYbFSf8WD+cnCqIsC/3nVi/zN05D4VFw+QVho=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772493911; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vMn4mleYJCwHO/HEaqYDhujRlmyDNEKG8BQE1W/8jVs=; 
	b=OWDp96r6SnWUIwYASx/U+ad+2ZszJ0kHz6M7XnVBWz8aOsp+LU4IVbNHbxcSKR165P2G8CXprF12Ahzmofq0DKZzgaw0kT26QhMRIVcquBMGjm/mswbZ2sxaA2zmjBjiS/EPutc26FlV7HXqIB/0Kwaz/SlOAR3DHIlKFomUpzo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772493911;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vMn4mleYJCwHO/HEaqYDhujRlmyDNEKG8BQE1W/8jVs=;
	b=c3e5vY+ZNpREo/SPUkDbeMYVVyhQhF3pAsZ9n37t9Hg6P61aaopmJVWf7UFSR3tr
	NPQYRCHtVjcwwWPVoFH/P3OI1XJfQoJElrZByQORg5lSaGI9pFtbIVH4ufFaqOEonTn
	nemM9Buwz7i2ZVUiaDuCdA1lOKLzmnwjBqOF8pqw=
Received: by mx.zohomail.com with SMTPS id 1772493909850979.7698025270312;
	Mon, 2 Mar 2026 15:25:09 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	beata.michalska@arm.com,
	lyude@redhat.com,
	work@onurozkan.dev,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 0/12] drm/tyr: firmware loading and MCU boot support
Date: Mon,  2 Mar 2026 15:24:48 -0800
Message-ID: <20260302232500.244489-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds firmware loading and MCU boot support to the Tyr DRM
driver. It includes:
- A parser for the Mali CSF firmware binary format
- A kernel-managed BO type (KernelBo) for internal driver allocations
- GPU virtual memory (VM) integration using drm_gpuvm
- An MMU module and a generic slot manager
- Shmem-backed GEM support for Tyr
- Loading firmware, VM activation, and MCU boot at probe()

Dependencies:
- [PATCH v7 0/7] Rust bindings for gem shmem + iosys_map
https://lore.kernel.org/rust-for-linux/20260206223431.693765-1-lyude@redhat.com/

- [PATCH v4 0/6] Rust GPUVM immediate mode
https://lore.kernel.org/rust-for-linux/20260130-gpuvm-rust-v4-0-8364d104ff40@google.com/

- [PATCH v5 0/4] Introduce DeviceContext
https://lore.kernel.org/rust-for-linux/20260131001602.2095470-1-lyude@redhat.com/

Other Prerequisites:
This series also depends on additional prerequisite fixes not included in
this posting. The full stack (base + prerequisites + this series) is
available here:
  https://gitlab.freedesktop.org/dbrouwer/linux/-/tree/dbrouwer/fw-boot

Development history / discussion:
  https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/56

---
Changes in v2:
- The whole series is rebased on drm-rust-next including v7.0-rc1.
- Each patch has its own changelog.

Link to v1: https://lore.kernel.org/rust-for-linux/20260212013713.304343-1-deborah.brouwer@collabora.com/
---

Beata Michalska (1):
  drm/tyr: set DMA mask using GPU physical address

Boris Brezillon (5):
  drm/tyr: select DRM abstractions in Kconfig
  drm/tyr: rename TyrObject to BoData
  drm/tyr: Add generic slot manager
  drm/tyr: add MMU module
  drm/tyr: add GPU virtual memory module

Daniel Almeida (2):
  drm/tyr: add MMU address space registers
  drm/tyr: add parser for firmware binary

Deborah Brouwer (4):
  drm/tyr: move clock cleanup into Clocks Drop impl
  drm/tyr: add shmem backing for GEM objects
  drm/tyr: add a kernel buffer object
  drm/tyr: add firmware loading and MCU boot support

 drivers/gpu/drm/tyr/Kconfig              |  15 +-
 drivers/gpu/drm/tyr/driver.rs            |  53 +-
 drivers/gpu/drm/tyr/fw.rs                | 270 ++++++++
 drivers/gpu/drm/tyr/fw/parser.rs         | 519 +++++++++++++++
 drivers/gpu/drm/tyr/gem.rs               | 154 ++++-
 drivers/gpu/drm/tyr/gpu.rs               |   2 -
 drivers/gpu/drm/tyr/mmu.rs               | 122 ++++
 drivers/gpu/drm/tyr/mmu/address_space.rs | 493 ++++++++++++++
 drivers/gpu/drm/tyr/regs.rs              | 101 ++-
 drivers/gpu/drm/tyr/slot.rs              | 436 +++++++++++++
 drivers/gpu/drm/tyr/tyr.rs               |   4 +
 drivers/gpu/drm/tyr/vm.rs                | 794 +++++++++++++++++++++++
 12 files changed, 2933 insertions(+), 30 deletions(-)
 create mode 100644 drivers/gpu/drm/tyr/fw.rs
 create mode 100644 drivers/gpu/drm/tyr/fw/parser.rs
 create mode 100644 drivers/gpu/drm/tyr/mmu.rs
 create mode 100644 drivers/gpu/drm/tyr/mmu/address_space.rs
 create mode 100644 drivers/gpu/drm/tyr/slot.rs
 create mode 100644 drivers/gpu/drm/tyr/vm.rs

-- 
2.52.0

