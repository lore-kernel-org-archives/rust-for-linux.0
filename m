Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE323372B41
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771879145; cv=pass; b=SvNlDGKTRLaJ5S7iiG2O3tf8j/uV4OyQL5oWPjzoBJ2u8vLRbSdo5QIViI9eop2fXO/PvyaCnNVE4oj7eq1W2dSzgZNvIn832Ony8kD0ProCM7Ro1G6FfUb0sw8eLcBE5Yl7DGVfug2rkXQr19cyfR+3PRzfa6Z07SkwHubnOJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771879145; c=relaxed/simple;
	bh=2FRT4C6e9zhU++MrwZ9FoQpiG7SDv5/zknT9VOc35Pk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ofkECG5TJg4AoufL84S5oHSBbDm5l8X/6cl5ebLjYLs3gSBgjRMGR+A65cGvFAgX+MukgMcxKoKpGIVB65jYEIOX0YnRpA4iURo3BqxuDSXcDayrQrHtuOB1CVzB8xWGMAO93GxAgCh9W5YYJZmfMTvFVJ/5LHdpwT2zSdv0fBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=UsMuN/oq; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="UsMuN/oq"
ARC-Seal: i=1; a=rsa-sha256; t=1771879138; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GMnowRh0krmvdpE3oRruRSwLl1B9fWJNiwEYZcgtdKRLTCnGWxo9lwHnB7ZLw606fWIyPOp4HQNV1jCjOH41QxaWI52JUY8Fykcy9spHoS6IUjaSDzGTj4to8db/9erDaYIW97d0wzkY70c78jvYCflYOYlMCY9T42CErmDgKmM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771879138; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YBEMS5r/nnD0iEh12Fd7f7OZuFjomMPbKhT20bRYBFQ=; 
	b=bp/0/zg2RRzZlJxPb1NKiZXwerhPf05L0OZuvtIasOUcOTqNdY5eDSqO5J+WtmPSZqOHIAoIrewD2aw49z85JsKv6cMB572fd1Hg5+uf6FKSQwjJrkOBmNgYzc9z0wf1Z6OGVWqpXq1REiMpbra+E+jWxXQpxtf8+C9cEIqGDEE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771879138;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YBEMS5r/nnD0iEh12Fd7f7OZuFjomMPbKhT20bRYBFQ=;
	b=UsMuN/oq1F+9IHMIIo33VVadFKygj6bpm3ieBRIQ4RIqG30WtLWHYy9hHu8RCXnc
	jWRd+PYVnEZ6xRWZRz7V5G1EyrGK3bqZzzCBJ/xcGTLS/Jxf3n2zpbz2LWetXZbZJek
	rYUngmlAEajv+TV/oY0bqp6hsWheDufPE5l765IQ=
Received: by mx.zohomail.com with SMTPS id 17718791373186.443931383479821;
	Mon, 23 Feb 2026 12:38:57 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	deborah.brouwer@collabora.com
Subject: [PATCH v2] drm/tyr: Use vertical style for imports
Date: Mon, 23 Feb 2026 12:38:33 -0800
Message-ID: <20260223203833.207955-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently Tyr uses rustfmt style for imports, but the kernel uses a
vertical layout that makes it easier to resolve conflicts and rebase.

Import guidelines are documented here:
	https://docs.kernel.org/rust/coding-guidelines.html#imports

Change all of Tyr's imports to use the vertical layout. This will
ease the introduction of additional Tyr patches upstream.

There should be no functional changes in this patch.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v2:
- Add import io::Io import in regs.rs to resolve conflict with v6.19.
- Pick up Reviewed-by tag

Link to v1: https://lore.kernel.org/rust-for-linux/20260204013331.427210-1-deborah.brouwer@collabora.com/

 drivers/gpu/drm/tyr/driver.rs | 62 ++++++++++++++++++++---------------
 drivers/gpu/drm/tyr/file.rs   | 18 ++++++----
 drivers/gpu/drm/tyr/gem.rs    | 13 +++++---
 drivers/gpu/drm/tyr/gpu.rs    | 38 ++++++++++++---------
 drivers/gpu/drm/tyr/regs.rs   | 16 +++++----
 5 files changed, 89 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index beeffe36b6cb..259a5157eb47 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -1,31 +1,41 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 
-use kernel::clk::Clk;
-use kernel::clk::OptionalClk;
-use kernel::device::Bound;
-use kernel::device::Core;
-use kernel::device::Device;
-use kernel::devres::Devres;
-use kernel::drm;
-use kernel::drm::ioctl;
-use kernel::io::poll;
-use kernel::new_mutex;
-use kernel::of;
-use kernel::platform;
-use kernel::prelude::*;
-use kernel::regulator;
-use kernel::regulator::Regulator;
-use kernel::sizes::SZ_2M;
-use kernel::sync::aref::ARef;
-use kernel::sync::Arc;
-use kernel::sync::Mutex;
-use kernel::time;
-
-use crate::file::File;
-use crate::gem::TyrObject;
-use crate::gpu;
-use crate::gpu::GpuInfo;
-use crate::regs;
+use kernel::{
+    clk::{
+        Clk,
+        OptionalClk, //
+    },
+    device::{
+        Bound,
+        Core,
+        Device, //
+    },
+    devres::Devres,
+    drm,
+    drm::ioctl,
+    io::poll,
+    new_mutex,
+    of,
+    platform,
+    prelude::*,
+    regulator,
+    regulator::Regulator,
+    sizes::SZ_2M,
+    sync::{
+        aref::ARef,
+        Arc,
+        Mutex, //
+    },
+    time, //
+};
+
+use crate::{
+    file::File,
+    gem::TyrObject,
+    gpu,
+    gpu::GpuInfo,
+    regs, //
+};
 
 pub(crate) type IoMem = kernel::io::mem::IoMem<SZ_2M>;
 
diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
index 0ef432947b73..48bff4476d74 100644
--- a/drivers/gpu/drm/tyr/file.rs
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -1,12 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 
-use kernel::drm;
-use kernel::prelude::*;
-use kernel::uaccess::UserSlice;
-use kernel::uapi;
-
-use crate::driver::TyrDevice;
-use crate::TyrDriver;
+use kernel::{
+    drm,
+    prelude::*,
+    uaccess::UserSlice,
+    uapi, //
+};
+
+use crate::{
+    driver::TyrDevice,
+    TyrDriver, //
+};
 
 #[pin_data]
 pub(crate) struct File {}
diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index 1273bf89dbd5..8f2d23e3c093 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -1,9 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 
-use crate::driver::TyrDevice;
-use crate::driver::TyrDriver;
-use kernel::drm::gem;
-use kernel::prelude::*;
+use kernel::{
+    drm::gem,
+    prelude::*, //
+};
+
+use crate::driver::{
+    TyrDevice,
+    TyrDriver, //
+};
 
 /// GEM Object inner driver data
 #[pin_data]
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index ca2a6309e760..a88775160f98 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -1,20 +1,28 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 
-use core::ops::Deref;
-use core::ops::DerefMut;
-use kernel::bits::genmask_u32;
-use kernel::device::Bound;
-use kernel::device::Device;
-use kernel::devres::Devres;
-use kernel::io::poll;
-use kernel::platform;
-use kernel::prelude::*;
-use kernel::time::Delta;
-use kernel::transmute::AsBytes;
-use kernel::uapi;
-
-use crate::driver::IoMem;
-use crate::regs;
+use core::ops::{
+    Deref,
+    DerefMut, //
+};
+use kernel::{
+    bits::genmask_u32,
+    device::{
+        Bound,
+        Device, //
+    },
+    devres::Devres,
+    io::poll,
+    platform,
+    prelude::*,
+    time::Delta,
+    transmute::AsBytes,
+    uapi, //
+};
+
+use crate::{
+    driver::IoMem,
+    regs, //
+};
 
 /// Struct containing information that can be queried by userspace. This is read from
 /// the GPU's registers.
diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index d3a541cb37c6..611870c2e6af 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -7,12 +7,16 @@
 // does.
 #![allow(dead_code)]
 
-use kernel::bits::bit_u32;
-use kernel::device::Bound;
-use kernel::device::Device;
-use kernel::devres::Devres;
-use kernel::io::Io;
-use kernel::prelude::*;
+use kernel::{
+    bits::bit_u32,
+    device::{
+        Bound,
+        Device, //
+    },
+    devres::Devres,
+    io::Io,
+    prelude::*, //
+};
 
 use crate::driver::IoMem;
 
-- 
2.52.0

