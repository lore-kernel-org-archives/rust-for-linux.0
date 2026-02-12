Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B1642049
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 01:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770860260; cv=pass; b=JPH3LgVVMMVAHu+xAN2WG6kJdD0IVpGQeT7SV+ygF566X3Y8VdVY2TkzsGYgzkQQ2Enq/0Uy9+SXRnlMPrJ3S6CP2Amvlrgd/z231z1lL3znaFnJB7FW/IQb0GByGx2rvSJmvRE7/vmLVkmQbaYfbyjeWMvfzkSYu9do6kq0+iI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770860260; c=relaxed/simple;
	bh=r9Eci6uBxSNbF6TsJh715esk5+FtGs2Y0UBzLgDXB0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dHNBDh/Z8H1anIUHvp/pE+GDboISz4j36OnmJWxgWd1OhAVgo0QsT7nCFAiVXWdxGiMFCEdY1DLDUvsKkasAA5vUOJANEv8TNMoZgdE6BpGHPx2Do2k1G2a2kUJZVYk3BGhYZDdTTV+U0deB2IabeepyZIe4zg31k7idSIiD40c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=lSAxoZxu; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="lSAxoZxu"
ARC-Seal: i=1; a=rsa-sha256; t=1770860251; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H0WlVURYpy2/mC0SPJqxHKAw/rnKQ+FK2pF93K54dbcncVpDuD/9awYbHM6GN8Lhe5p1CTN9yz4WyoH/c8Sb1JEY3H40HozJTJE0lr5nvsnDsEy4jWe7eoM22dNdmo5AGataCdOAeZqLEAVFZau4bi+C9m1UG3Ej4cpJB9kXV8M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770860251; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uiiQ+IyRtEcFu3hMOuMAl/TVVEreyjJcOibwZTp3arQ=; 
	b=RxET7OwSHXDgHZLcysmF+ASP8kvW0quIgyXS3LisrwmRmJl0/2+4+9UhayQfywd6trAOO75Chh/QOgtQ2GrUYiPrVxndUplYxv5/E6o035zpk6605VUTHOrn3lWJbWgJeZmHyWIR8+qImTpvRIYvOCC03AFYI0f7/vslMtv22Eg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770860251;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=uiiQ+IyRtEcFu3hMOuMAl/TVVEreyjJcOibwZTp3arQ=;
	b=lSAxoZxulvN/ma9a1Mb1EcD5OxYgzj4GQ8uSW6djfZWUHwHDOBY/mfn8hdf4nI2h
	LHpeDnVDNvnFQ7qZRvKQFN3oFw6SKWGItwqQuYM9ApRN2KgV2tGqs+99y22fgX2KAUE
	QVGPO6us58+/a7vL50xbNFf1Gr7W2l9JWeQBMQQ0=
Received: by mx.zohomail.com with SMTPS id 1770860250640823.5812933409642;
	Wed, 11 Feb 2026 17:37:30 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	beata.michalska@arm.com,
	lyude@redhat.com,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 0/12] drm/tyr: firmware loading and MCU boot support
Date: Wed, 11 Feb 2026 17:37:01 -0800
Message-ID: <20260212013713.304343-1-deborah.brouwer@collabora.com>
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

Base:
  drm-rust-next-2026-01-26
  commit cea7b66a8041 ("Documentation: nova: update pending tasks")

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


Beata Michalska (1):
  drm/tyr: set DMA mask using GPU physical address

Boris Brezillon (6):
  drm/tyr: select DRM abstractions in Kconfig
  drm/tyr: rename TyrObject to BoData
  drm/tyr: add MMU address space registers
  drm/tyr: Add generic slot manager
  drm/tyr: add MMU module
  drm/tyr: add GPU virtual memory module

Daniel Almeida (1):
  drm/tyr: add parser for firmware binary

Deborah Brouwer (4):
  drm/tyr: move clock cleanup into Clocks Drop impl
  drm/tyr: add shmem backing for GEM objects
  drm/tyr: add a kernel buffer object
  drm/tyr: add firmware loading and MCU boot support

 drivers/gpu/drm/tyr/Kconfig              |  14 +-
 drivers/gpu/drm/tyr/driver.rs            |  55 +-
 drivers/gpu/drm/tyr/fw.rs                | 263 ++++++++
 drivers/gpu/drm/tyr/fw/parser.rs         | 469 ++++++++++++++
 drivers/gpu/drm/tyr/gem.rs               | 117 +++-
 drivers/gpu/drm/tyr/gpu.rs               |   2 -
 drivers/gpu/drm/tyr/mmu.rs               |  90 +++
 drivers/gpu/drm/tyr/mmu/address_space.rs | 322 ++++++++++
 drivers/gpu/drm/tyr/regs.rs              | 101 ++-
 drivers/gpu/drm/tyr/slot.rs              | 358 +++++++++++
 drivers/gpu/drm/tyr/tyr.rs               |   4 +
 drivers/gpu/drm/tyr/vm.rs                | 782 +++++++++++++++++++++++
 12 files changed, 2548 insertions(+), 29 deletions(-)
 create mode 100644 drivers/gpu/drm/tyr/fw.rs
 create mode 100644 drivers/gpu/drm/tyr/fw/parser.rs
 create mode 100644 drivers/gpu/drm/tyr/mmu.rs
 create mode 100644 drivers/gpu/drm/tyr/mmu/address_space.rs
 create mode 100644 drivers/gpu/drm/tyr/slot.rs
 create mode 100644 drivers/gpu/drm/tyr/vm.rs

-- 
2.52.0

