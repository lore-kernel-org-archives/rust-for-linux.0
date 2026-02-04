Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AC426B741
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 01:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770168837; cv=pass; b=pcORENSkqhbRYQLUO9fzIxJTnqjgn697vWu97M7HnOjNtb9fpGhffZu0FfyiiilyY/RWbKNNcnsXvKX99zPLZGfGr6Ig/d8wEFP14r5BcF5KXhy9BAvKrpK54FnJlQ4FtgHybvuOWoIakopAXo3SM6L4Ggh8h0VprrZJHpKmS5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770168837; c=relaxed/simple;
	bh=j3dO+6RCdgO1Lsmu1NzrRrU0Jf0varf5ajFTfMXYsVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MY73uXoMsOGXa67lC+PEEeK0e0S3fv7sZPpZejcUhX183fAUpagenQoimHFhKOZxOSWAutOiJ0Jt7+1/UfNBYjq1PxBsCHKdFSs3lIK0pyDOXf5frhFOZGwdmcFJ0QkO0+qXdJmjeW8bNpdwmEITp3+AB26TqG5/6DCNjOB+E5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=Q6l7BUyI; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="Q6l7BUyI"
ARC-Seal: i=1; a=rsa-sha256; t=1770168831; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cOMZBIjAul4IicJzjAoYSMzS6G7R9P+pJCFg2Qcuq7UdjTjiotep3ps5JAaIJBPC+VX7Ur5B+cM64Z7wu9SpD63+NAnGw+kCFKIq8nS8FTRkOwZCC2FDEi9qZ3OYzC7S0KGCZKq8EiVIvVkRoJ8pABqlLnl9EixIrPbmLeDwm5w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770168831; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NDoSooHbOWHoq6B3Jez/qE8a+VrhFjKPk4qtNUSiX+k=; 
	b=Zg6dG8R15tRNJGN/gagjlbbM0rfiAWYLP9CjTdyb9GIp7V25Emjv61QUf9LyzorwdCwchO3/o65NAQig+Z6mi6JIsC5D+/NxiFINijZqMQFrHBB5lI5tnLgk/kTJHfPMZwmUdx6pRIhIG7qz3gDqEECscFiO7x0X7JG0tgpUzow=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770168831;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=NDoSooHbOWHoq6B3Jez/qE8a+VrhFjKPk4qtNUSiX+k=;
	b=Q6l7BUyIRkgpZii66fr70eNAfubf+jYXwESaZHenBzmfB4o7Ds2XuWMPLuQlIl0n
	cB+eJDpZsGVOZxYbezvM4WtyX9lwLTMrZJMA+lNg++UiFjCop4q2r80gfrFk77vg5PN
	RoZSjd4yr3vy/EQ+yoAudC95npaKVA+wYdZ/+WJE=
Received: by mx.zohomail.com with SMTPS id 1770168829632966.9758230964605;
	Tue, 3 Feb 2026 17:33:49 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] drm/tyr: Use vertical style for imports
Date: Tue,  3 Feb 2026 17:33:31 -0800
Message-ID: <20260204013331.427210-1-deborah.brouwer@collabora.com>
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

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs | 62 ++++++++++++++++++++---------------
 drivers/gpu/drm/tyr/file.rs   | 18 ++++++----
 drivers/gpu/drm/tyr/gem.rs    | 13 +++++---
 drivers/gpu/drm/tyr/gpu.rs    | 38 ++++++++++++---------
 drivers/gpu/drm/tyr/regs.rs   | 14 +++++---
 5 files changed, 88 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 568cb89aaed8..46b65e004a15 100644
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
index bfbf2a1d80e6..affca5b0dc6c 100644
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
index f46933aaa221..a7672fffbba5 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -7,11 +7,15 @@
 // does.
 #![allow(dead_code)]
 
-use kernel::bits::bit_u32;
-use kernel::device::Bound;
-use kernel::device::Device;
-use kernel::devres::Devres;
-use kernel::prelude::*;
+use kernel::{
+    bits::bit_u32,
+    device::{
+        Bound,
+        Device, //
+    },
+    devres::Devres,
+    prelude::*, //
+};
 
 use crate::driver::IoMem;
 
-- 
2.52.0

