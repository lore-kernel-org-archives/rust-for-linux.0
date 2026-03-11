Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E593A1687
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 23:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773270293; cv=pass; b=RFsAvxhCseBNv+WLSb0yEkwTYJ3QcGyTKy7JlOaCx9h7YaGFVmIJrkZEyd0wh7UEPEXCtt3Z5g3vZu3VQsyzunVwtieavrsb+0drYcIxmRlEKop6jTtADEpIWH/apLtLBbPopEUG2xbiIG61YiPXg4siVj6/U4AJz+eKBkKlcLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773270293; c=relaxed/simple;
	bh=FbQtA24B8fgUXYreZEfUUIoWSg4EjhWSbVfbone0H1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TnsPWb1s2J1M4QEBHdoivs54MBfTnn71qavHEAMrg7+VOhJwC5rDhTbscw57J93rMHkkR7xoW725DOoVOVsBlXxuWyRlw3et92xsoDiJNE1XHNIDf8HOc3HjLj70dktJyqMC5bjPezeuZEu2Ob453NkW8S9gWS/gJxQVX/L1IOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=bhjmcBn8; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="bhjmcBn8"
ARC-Seal: i=1; a=rsa-sha256; t=1773270264; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fqx2WRKenumEyNm8/2BuAr46iY65xQpN9rKuvILOdydz3D5He7fIySuuUaq7lqBHgHMo8SRd5UElMpQ+ptR9JzGii94LaTr/l/gocYUf41kY07v40YZtn6vSyv45OGOarG3LhTHhLvQsFEtSYEJf40jxVVKy/XBnFFlzokesqlQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773270264; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AS3e7g2OwAymeHaVHV6hIYrSwfdOc6osttMK662kLpc=; 
	b=PUmTXDa4u2OcEa7PZQoGKTneunqqV+JIr7hp4yudr7LqN/dkPLImfFiYnTAr5a+fZ3sqIyz07YdwVXZLbALxKq8hWflu4oFQEoWUq86XxTodE2fSac0TSPkpO3n/khX86iBe4RBsVtjwGUjVksmuKZ4ksYx6E8Ev7qzZ9VZgFQ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773270264;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=AS3e7g2OwAymeHaVHV6hIYrSwfdOc6osttMK662kLpc=;
	b=bhjmcBn8FHhlAami1t7C9Mv7GJ/iIPlkk1Kv9tmK0x+Jub4V3abu0rTCSLdUZAKW
	w6Hhb7So9p6TqVelV7qGvEtA14LXUQkn0NWA4aGopj4M9l1lelmYMAdwN6T2dRJ0RwX
	yQV7XyybACbORcPNEYT4wXOiWPyPWNgYWvK7CYB0=
Received: by mx.zohomail.com with SMTPS id 1773270262984124.63410016951502;
	Wed, 11 Mar 2026 16:04:22 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Wed, 11 Mar 2026 16:03:58 -0700
Subject: [PATCH v2 1/5] drm/tyr: Use register! macro for GPU_CONTROL
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-b4-tyr-use-register-macro-v2-v2-1-b936d9eb8f51@collabora.com>
References: <20260311-b4-tyr-use-register-macro-v2-v2-0-b936d9eb8f51@collabora.com>
In-Reply-To: <20260311-b4-tyr-use-register-macro-v2-v2-0-b936d9eb8f51@collabora.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Steven Price <steven.price@arm.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Dirk Behme <dirk.behme@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, 
 Deborah Brouwer <deborah.brouwer@collabora.com>, 
 Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.14.2

From: Daniel Almeida <daniel.almeida@collabora.com>

Convert the GPU_CONTROL register definitions to use the `register!` macro.

Using the `register!` macro allows us to replace manual bit masks and
shifts with typed register and field accessors, which makes the code
easier to read and avoids errors from bit manipulation.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs |  26 +-
 drivers/gpu/drm/tyr/gpu.rs    | 211 ++++++--------
 drivers/gpu/drm/tyr/regs.rs   | 644 ++++++++++++++++++++++++++++++++++++++----
 3 files changed, 687 insertions(+), 194 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 611434641580574ec6b5afa49a8fe79888bb7ace..10c212a3a01910858f02c6d637edff8a263f017b 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -13,7 +13,10 @@
     devres::Devres,
     drm,
     drm::ioctl,
-    io::poll,
+    io::{
+        poll,
+        Io, //
+    },
     new_mutex,
     of,
     platform,
@@ -33,8 +36,11 @@
     file::TyrDrmFileData,
     gem::TyrObject,
     gpu,
-    gpu::GpuInfo,
-    regs, //
+    gpu::{
+        gpu_info_log, //
+        GpuInfo,
+    },
+    regs::*, //
 };
 
 pub(crate) type IoMem = kernel::io::mem::IoMem<SZ_2M>;
@@ -78,11 +84,17 @@ unsafe impl Send for TyrDrmDeviceData {}
 unsafe impl Sync for TyrDrmDeviceData {}
 
 fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
-    regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
+    let io = (*iomem).access(dev)?;
+    io.write_val(
+        GPU_COMMAND_RESET::zeroed().with_const_reset_mode::<{ GPU_COMMAND_RESET::SOFT_RESET }>(),
+    );
 
     poll::read_poll_timeout(
-        || regs::GPU_IRQ_RAWSTAT.read(dev, iomem),
-        |status| *status & regs::GPU_IRQ_RAWSTAT_RESET_COMPLETED != 0,
+        || {
+            let io = (*iomem).access(dev)?;
+            Ok(io.read(GPU_IRQ_RAWSTAT))
+        },
+        |status| status.reset_completed().get() != 0,
         time::Delta::from_millis(1),
         time::Delta::from_millis(100),
     )
@@ -127,7 +139,7 @@ fn probe(
         gpu::l2_power_on(pdev.as_ref(), &iomem)?;
 
         let gpu_info = GpuInfo::new(pdev.as_ref(), &iomem)?;
-        gpu_info.log(pdev);
+        gpu_info_log(pdev.as_ref(), &iomem)?;
 
         let platform: ARef<platform::Device> = pdev.into();
 
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index a88775160f981e899e9c9b58debbda33e1b7244d..51a250570f375e12bb0f7fb32f047bf219ef9b70 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -5,14 +5,15 @@
     DerefMut, //
 };
 use kernel::{
-    bits::genmask_u32,
     device::{
         Bound,
         Device, //
     },
     devres::Devres,
-    io::poll,
-    platform,
+    io::{
+        poll,
+        Io, //
+    },
     prelude::*,
     time::Delta,
     transmute::AsBytes,
@@ -21,7 +22,7 @@
 
 use crate::{
     driver::IoMem,
-    regs, //
+    regs::*, //
 };
 
 /// Struct containing information that can be queried by userspace. This is read from
@@ -29,120 +30,42 @@
 ///
 /// # Invariants
 ///
-/// - The layout of this struct identical to the C `struct drm_panthor_gpu_info`.
+/// - The layout of this struct is identical to the C `struct drm_panthor_gpu_info`.
 #[repr(transparent)]
 #[derive(Clone, Copy)]
 pub(crate) struct GpuInfo(pub(crate) uapi::drm_panthor_gpu_info);
 
 impl GpuInfo {
     pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
-        let gpu_id = regs::GPU_ID.read(dev, iomem)?;
-        let csf_id = regs::GPU_CSF_ID.read(dev, iomem)?;
-        let gpu_rev = regs::GPU_REVID.read(dev, iomem)?;
-        let core_features = regs::GPU_CORE_FEATURES.read(dev, iomem)?;
-        let l2_features = regs::GPU_L2_FEATURES.read(dev, iomem)?;
-        let tiler_features = regs::GPU_TILER_FEATURES.read(dev, iomem)?;
-        let mem_features = regs::GPU_MEM_FEATURES.read(dev, iomem)?;
-        let mmu_features = regs::GPU_MMU_FEATURES.read(dev, iomem)?;
-        let thread_features = regs::GPU_THREAD_FEATURES.read(dev, iomem)?;
-        let max_threads = regs::GPU_THREAD_MAX_THREADS.read(dev, iomem)?;
-        let thread_max_workgroup_size = regs::GPU_THREAD_MAX_WORKGROUP_SIZE.read(dev, iomem)?;
-        let thread_max_barrier_size = regs::GPU_THREAD_MAX_BARRIER_SIZE.read(dev, iomem)?;
-        let coherency_features = regs::GPU_COHERENCY_FEATURES.read(dev, iomem)?;
-
-        let texture_features = regs::GPU_TEXTURE_FEATURES0.read(dev, iomem)?;
-
-        let as_present = regs::GPU_AS_PRESENT.read(dev, iomem)?;
-
-        let shader_present = u64::from(regs::GPU_SHADER_PRESENT_LO.read(dev, iomem)?);
-        let shader_present =
-            shader_present | u64::from(regs::GPU_SHADER_PRESENT_HI.read(dev, iomem)?) << 32;
-
-        let tiler_present = u64::from(regs::GPU_TILER_PRESENT_LO.read(dev, iomem)?);
-        let tiler_present =
-            tiler_present | u64::from(regs::GPU_TILER_PRESENT_HI.read(dev, iomem)?) << 32;
-
-        let l2_present = u64::from(regs::GPU_L2_PRESENT_LO.read(dev, iomem)?);
-        let l2_present = l2_present | u64::from(regs::GPU_L2_PRESENT_HI.read(dev, iomem)?) << 32;
+        let io = (*iomem).access(dev)?;
 
         Ok(Self(uapi::drm_panthor_gpu_info {
-            gpu_id,
-            gpu_rev,
-            csf_id,
-            l2_features,
-            tiler_features,
-            mem_features,
-            mmu_features,
-            thread_features,
-            max_threads,
-            thread_max_workgroup_size,
-            thread_max_barrier_size,
-            coherency_features,
+            gpu_id: io.read(GPU_ID).into_raw(),
+            gpu_rev: io.read(REVIDR).into_raw(),
+            csf_id: io.read(CSF_ID).into_raw(),
+            l2_features: io.read(L2_FEATURES).into_raw(),
+            tiler_features: io.read(TILER_FEATURES).into_raw(),
+            mem_features: io.read(MEM_FEATURES).into_raw(),
+            mmu_features: io.read(MMU_FEATURES).into_raw(),
+            thread_features: io.read(THREAD_FEATURES).into_raw(),
+            max_threads: io.read(THREAD_MAX_THREADS).into_raw(),
+            thread_max_workgroup_size: io.read(THREAD_MAX_WORKGROUP_SIZE).into_raw(),
+            thread_max_barrier_size: io.read(THREAD_MAX_BARRIER_SIZE).into_raw(),
+            coherency_features: io.read(COHERENCY_FEATURES).into_raw(),
             // TODO: Add texture_features_{1,2,3}.
-            texture_features: [texture_features, 0, 0, 0],
-            as_present,
+            texture_features: [io.read(TEXTURE_FEATURES_0).into_raw(), 0, 0, 0],
+            as_present: io.read(AS_PRESENT).into_raw(),
             selected_coherency: uapi::drm_panthor_gpu_coherency_DRM_PANTHOR_GPU_COHERENCY_NONE,
-            shader_present,
-            l2_present,
-            tiler_present,
-            core_features,
+            shader_present: io.read(SHADER_PRESENT).into_raw(),
+            l2_present: io.read(L2_PRESENT).into_raw(),
+            tiler_present: io.read(TILER_PRESENT).into_raw(),
+            core_features: io.read(CORE_FEATURES).into_raw(),
+            // Padding must be zero.
             pad: 0,
+            //GPU_FEATURES register is not available; it was introduced in arch 11.x.
             gpu_features: 0,
         }))
     }
-
-    pub(crate) fn log(&self, pdev: &platform::Device) {
-        let gpu_id = GpuId::from(self.gpu_id);
-
-        let model_name = if let Some(model) = GPU_MODELS
-            .iter()
-            .find(|&f| f.arch_major == gpu_id.arch_major && f.prod_major == gpu_id.prod_major)
-        {
-            model.name
-        } else {
-            "unknown"
-        };
-
-        dev_info!(
-            pdev,
-            "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
-            model_name,
-            self.gpu_id >> 16,
-            gpu_id.ver_major,
-            gpu_id.ver_minor,
-            gpu_id.ver_status
-        );
-
-        dev_info!(
-            pdev,
-            "Features: L2:{:#x} Tiler:{:#x} Mem:{:#x} MMU:{:#x} AS:{:#x}",
-            self.l2_features,
-            self.tiler_features,
-            self.mem_features,
-            self.mmu_features,
-            self.as_present
-        );
-
-        dev_info!(
-            pdev,
-            "shader_present=0x{:016x} l2_present=0x{:016x} tiler_present=0x{:016x}",
-            self.shader_present,
-            self.l2_present,
-            self.tiler_present
-        );
-    }
-
-    /// Returns the number of virtual address bits supported by the GPU.
-    #[expect(dead_code)]
-    pub(crate) fn va_bits(&self) -> u32 {
-        self.mmu_features & genmask_u32(0..=7)
-    }
-
-    /// Returns the number of physical address bits supported by the GPU.
-    #[expect(dead_code)]
-    pub(crate) fn pa_bits(&self) -> u32 {
-        (self.mmu_features >> 8) & genmask_u32(0..=7)
-    }
 }
 
 impl Deref for GpuInfo {
@@ -182,37 +105,67 @@ struct GpuModels {
     prod_major: 7,
 }];
 
-#[allow(dead_code)]
-pub(crate) struct GpuId {
-    pub(crate) arch_major: u32,
-    pub(crate) arch_minor: u32,
-    pub(crate) arch_rev: u32,
-    pub(crate) prod_major: u32,
-    pub(crate) ver_major: u32,
-    pub(crate) ver_minor: u32,
-    pub(crate) ver_status: u32,
-}
-
-impl From<u32> for GpuId {
-    fn from(value: u32) -> Self {
-        GpuId {
-            arch_major: (value & genmask_u32(28..=31)) >> 28,
-            arch_minor: (value & genmask_u32(24..=27)) >> 24,
-            arch_rev: (value & genmask_u32(20..=23)) >> 20,
-            prod_major: (value & genmask_u32(16..=19)) >> 16,
-            ver_major: (value & genmask_u32(12..=15)) >> 12,
-            ver_minor: (value & genmask_u32(4..=11)) >> 4,
-            ver_status: value & genmask_u32(0..=3),
-        }
-    }
+pub(crate) fn gpu_info_log(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
+    let io = (*iomem).access(dev)?;
+    let gpu_id = io.read(GPU_ID);
+
+    let model_name = if let Some(model) = GPU_MODELS.iter().find(|&f| {
+        f.arch_major == gpu_id.arch_major().get() && f.prod_major == gpu_id.prod_major().get()
+    }) {
+        model.name
+    } else {
+        "unknown"
+    };
+
+    // Create canonical product ID with only arch/product fields, excluding version
+    // fields. This ensures the same product at different revisions has the same ID.
+    let id = GPU_ID::zeroed()
+        .with_arch_major(gpu_id.arch_major())
+        .with_arch_minor(gpu_id.arch_minor())
+        .with_arch_rev(gpu_id.arch_rev())
+        .with_prod_major(gpu_id.prod_major())
+        .into_raw();
+
+    dev_info!(
+        dev,
+        "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
+        model_name,
+        id,
+        gpu_id.ver_major().get(),
+        gpu_id.ver_minor().get(),
+        gpu_id.ver_status().get()
+    );
+
+    dev_info!(
+        dev,
+        "Features: L2:{:#x} Tiler:{:#x} Mem:{:#x} MMU:{:#x} AS:{:#x}",
+        io.read(L2_FEATURES).into_raw(),
+        io.read(TILER_FEATURES).into_raw(),
+        io.read(MEM_FEATURES).into_raw(),
+        io.read(MMU_FEATURES).into_raw(),
+        io.read(AS_PRESENT).into_raw(),
+    );
+
+    dev_info!(
+        dev,
+        "shader_present=0x{:016x} l2_present=0x{:016x} tiler_present=0x{:016x}",
+        io.read(SHADER_PRESENT).into_raw(),
+        io.read(L2_PRESENT).into_raw(),
+        io.read(TILER_PRESENT).into_raw(),
+    );
+    Ok(())
 }
 
 /// Powers on the l2 block.
 pub(crate) fn l2_power_on(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
-    regs::L2_PWRON_LO.write(dev, iomem, 1)?;
+    let io = (*iomem).access(dev)?;
+    io.write_val(L2_PWRON::zeroed().with_const_request::<1>());
 
     poll::read_poll_timeout(
-        || regs::L2_READY_LO.read(dev, iomem),
+        || {
+            let io = (*iomem).access(dev)?;
+            Ok(io.read(L2_READY).into_raw())
+        },
         |status| *status == 1,
         Delta::from_millis(1),
         Delta::from_millis(100),
diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index 611870c2e6af50a35daaef052db2dd33a7e8059c..ba61a3dbe2a3e6fa1169b03d4f62e82769041057 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -1,5 +1,25 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 
+//! # Definitions
+//!
+//! - **CEU**: Command Execution Unit - A hardware component that executes commands (instructions)
+//!   from the command stream.
+//! - **CS**: Command Stream - A sequence of instructions (commands) used to control a particular
+//!   job or sequence of jobs. The instructions exist in one or more command buffers.
+//! - **CSF**: Command Stream Frontend - The interface and implementation for job submission
+//!   exposed to the host CPU driver. This includes the global interface, as well as CSG and CS
+//!   interfaces.
+//! - **CSG**: Command Stream Group - A group of related command streams. The CSF manages multiple
+//!   CSGs, and each CSG contains multiple CSs.
+//! - **CSHW**: Command Stream Hardware - The hardware interpreting command streams, including the
+//!   iterator control aspects. Implements the CSF in conjunction with the MCU.
+//! - **GLB**: Global - Prefix for global interface registers that control operations common to
+//!   all CSs.
+//! - **JASID**: Job Address Space ID - Identifies the address space for a job.
+//! - **MCU**: Microcontroller Unit - Implements the CSF in conjunction with the command stream
+//!   hardware.
+//! - **MMU**: Memory Management Unit - Handles address translation and memory access protection.
+
 // We don't expect that all the registers and fields will be used, even in the
 // future.
 //
@@ -41,64 +61,572 @@ pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u3
     }
 }
 
-pub(crate) const GPU_ID: Register<0x0> = Register;
-pub(crate) const GPU_L2_FEATURES: Register<0x4> = Register;
-pub(crate) const GPU_CORE_FEATURES: Register<0x8> = Register;
-pub(crate) const GPU_CSF_ID: Register<0x1c> = Register;
-pub(crate) const GPU_REVID: Register<0x280> = Register;
-pub(crate) const GPU_TILER_FEATURES: Register<0xc> = Register;
-pub(crate) const GPU_MEM_FEATURES: Register<0x10> = Register;
-pub(crate) const GPU_MMU_FEATURES: Register<0x14> = Register;
-pub(crate) const GPU_AS_PRESENT: Register<0x18> = Register;
-pub(crate) const GPU_IRQ_RAWSTAT: Register<0x20> = Register;
-
-pub(crate) const GPU_IRQ_RAWSTAT_FAULT: u32 = bit_u32(0);
-pub(crate) const GPU_IRQ_RAWSTAT_PROTECTED_FAULT: u32 = bit_u32(1);
-pub(crate) const GPU_IRQ_RAWSTAT_RESET_COMPLETED: u32 = bit_u32(8);
-pub(crate) const GPU_IRQ_RAWSTAT_POWER_CHANGED_SINGLE: u32 = bit_u32(9);
-pub(crate) const GPU_IRQ_RAWSTAT_POWER_CHANGED_ALL: u32 = bit_u32(10);
-pub(crate) const GPU_IRQ_RAWSTAT_CLEAN_CACHES_COMPLETED: u32 = bit_u32(17);
-pub(crate) const GPU_IRQ_RAWSTAT_DOORBELL_STATUS: u32 = bit_u32(18);
-pub(crate) const GPU_IRQ_RAWSTAT_MCU_STATUS: u32 = bit_u32(19);
-
-pub(crate) const GPU_IRQ_CLEAR: Register<0x24> = Register;
-pub(crate) const GPU_IRQ_MASK: Register<0x28> = Register;
-pub(crate) const GPU_IRQ_STAT: Register<0x2c> = Register;
-pub(crate) const GPU_CMD: Register<0x30> = Register;
-pub(crate) const GPU_CMD_SOFT_RESET: u32 = 1 | (1 << 8);
-pub(crate) const GPU_CMD_HARD_RESET: u32 = 1 | (2 << 8);
-pub(crate) const GPU_THREAD_FEATURES: Register<0xac> = Register;
-pub(crate) const GPU_THREAD_MAX_THREADS: Register<0xa0> = Register;
-pub(crate) const GPU_THREAD_MAX_WORKGROUP_SIZE: Register<0xa4> = Register;
-pub(crate) const GPU_THREAD_MAX_BARRIER_SIZE: Register<0xa8> = Register;
-pub(crate) const GPU_TEXTURE_FEATURES0: Register<0xb0> = Register;
-pub(crate) const GPU_SHADER_PRESENT_LO: Register<0x100> = Register;
-pub(crate) const GPU_SHADER_PRESENT_HI: Register<0x104> = Register;
-pub(crate) const GPU_TILER_PRESENT_LO: Register<0x110> = Register;
-pub(crate) const GPU_TILER_PRESENT_HI: Register<0x114> = Register;
-pub(crate) const GPU_L2_PRESENT_LO: Register<0x120> = Register;
-pub(crate) const GPU_L2_PRESENT_HI: Register<0x124> = Register;
-pub(crate) const L2_READY_LO: Register<0x160> = Register;
-pub(crate) const L2_READY_HI: Register<0x164> = Register;
-pub(crate) const L2_PWRON_LO: Register<0x1a0> = Register;
-pub(crate) const L2_PWRON_HI: Register<0x1a4> = Register;
-pub(crate) const L2_PWRTRANS_LO: Register<0x220> = Register;
-pub(crate) const L2_PWRTRANS_HI: Register<0x204> = Register;
-pub(crate) const L2_PWRACTIVE_LO: Register<0x260> = Register;
-pub(crate) const L2_PWRACTIVE_HI: Register<0x264> = Register;
-
-pub(crate) const MCU_CONTROL: Register<0x700> = Register;
-pub(crate) const MCU_CONTROL_ENABLE: u32 = 1;
-pub(crate) const MCU_CONTROL_AUTO: u32 = 2;
-pub(crate) const MCU_CONTROL_DISABLE: u32 = 0;
-
-pub(crate) const MCU_STATUS: Register<0x704> = Register;
-pub(crate) const MCU_STATUS_DISABLED: u32 = 0;
-pub(crate) const MCU_STATUS_ENABLED: u32 = 1;
-pub(crate) const MCU_STATUS_HALT: u32 = 2;
-pub(crate) const MCU_STATUS_FATAL: u32 = 3;
-
-pub(crate) const GPU_COHERENCY_FEATURES: Register<0x300> = Register;
+/// These registers correspond to the GPU_CONTROL register page.
+/// They are involved in GPU configuration and control.
+pub(super) mod gpu_control {
+    use kernel::{
+        register,
+        uapi, //
+    };
+
+    register! {
+        /// GPU identification register.
+        pub(crate) GPU_ID(u32) @ 0x0 {
+            /// Status of the GPU release.
+            3:0     ver_status;
+            /// Minor release version number.
+            11:4    ver_minor;
+            /// Major release version number.
+            15:12   ver_major;
+            /// Product identifier.
+            19:16   prod_major;
+            /// Architecture patch revision.
+            23:20   arch_rev;
+            /// Architecture minor revision.
+            27:24   arch_minor;
+            /// Architecture major revision.
+            31:28   arch_major;
+        }
+
+        /// Level 2 cache features register.
+        pub(crate) L2_FEATURES(u32) @ 0x4 {
+            /// Cache line size.
+            7:0     line_size;
+            /// Cache associativity.
+            15:8    associativity;
+            /// Cache slice size.
+            23:16   cache_size;
+            /// External bus width.
+            31:24   bus_width;
+        }
+
+        /// Shader core features.
+        pub(crate) CORE_FEATURES(u32) @ 0x8 {
+            /// Shader core variant.
+            7:0     core_variant;
+        }
+
+        /// Tiler features.
+        pub(crate) TILER_FEATURES(u32) @ 0xc {
+            /// Log of the tiler's bin size.
+            5:0     bin_size;
+            /// Maximum number of active levels.
+            11:8    max_levels;
+        }
+
+        /// Memory system features.
+        pub(crate) MEM_FEATURES(u32) @ 0x10 {
+            0:0     coherent_core_group;
+            1:1     coherent_super_group;
+            11:8    l2_slices;
+        }
+
+        /// Memory management unit features.
+        pub(crate) MMU_FEATURES(u32) @ 0x14 {
+            /// Number of bits supported in virtual addresses.
+            7:0     va_bits;
+            /// Number of bits supported in physical addresses.
+            15:8    pa_bits;
+        }
+
+        /// Address spaces present.
+        pub(crate) AS_PRESENT(u32) @ 0x18 {
+            31:0    present;
+        }
+
+        /// CSF version information.
+        pub(crate) CSF_ID(u32) @ 0x1c {
+            /// MCU revision ID.
+            3:0     mcu_rev;
+            /// MCU minor revision number.
+            9:4     mcu_minor;
+            /// MCU major revision number.
+            15:10   mcu_major;
+            /// CSHW revision ID.
+            19:16   cshw_rev;
+            /// CSHW minor revision number.
+            25:20   cshw_minor;
+            /// CSHW major revision number.
+            31:26   cshw_major;
+        }
+
+        /// IRQ sources raw status.
+        /// Writing to this register forces bits on, but does not clear them.
+        pub(crate) GPU_IRQ_RAWSTAT(u32) @ 0x20 {
+            /// A GPU fault has occurred.
+            0:0     gpu_fault;
+            /// A GPU fault has occurred.
+            1:1     gpu_protected_fault;
+            /// Reset has completed.
+            8:8     reset_completed;
+            /// Set when a single power domain has powered up or down.
+            9:9     power_changed_single;
+            /// Set when the all pending power domain changes are completed.
+            10:10   power_changed_all;
+            /// Set when cache cleaning has completed.
+            17:17   clean_caches_completed;
+            /// Mirrors the doorbell interrupt line to the CPU.
+            18:18   doorbell_mirror;
+            /// MCU requires attention.
+            19:19   mcu_status;
+        }
+
+        /// IRQ sources to clear. Write only.
+        pub(crate) GPU_IRQ_CLEAR(u32) @ 0x24 {
+            /// Clear the GPU_FAULT interrupt.
+            0:0     gpu_fault;
+            /// Clear the GPU_PROTECTED_FAULT interrupt.
+            1:1     gpu_protected_fault;
+            /// Clear the RESET_COMPLETED interrupt.
+            8:8     reset_completed;
+            /// Clear the POWER_CHANGED_SINGLE interrupt.
+            9:9     power_changed_single;
+            /// Clear the POWER_CHANGED_ALL interrupt.
+            10:10   power_changed_all;
+            /// Clear the CLEAN_CACHES_COMPLETED interrupt.
+            17:17   clean_caches_completed;
+            /// Clear the MCU_STATUS interrupt.
+            19:19   mcu_status;
+        }
+
+        /// IRQ sources enabled.
+        pub(crate) GPU_IRQ_MASK(u32) @ 0x28 {
+            /// Enable the GPU_FAULT interrupt.
+            0:0     gpu_fault;
+            /// Enable the GPU_PROTECTED_FAULT interrupt.
+            1:1     gpu_protected_fault;
+            /// Enable the RESET_COMPLETED interrupt.
+            8:8     reset_completed;
+            /// Enable the POWER_CHANGED_SINGLE interrupt.
+            9:9     power_changed_single;
+            /// Enable the POWER_CHANGED_ALL interrupt.
+            10:10   power_changed_all;
+            /// Enable the CLEAN_CACHES_COMPLETED interrupt.
+            17:17   clean_caches_completed;
+            /// Enable the DOORBELL_MIRROR interrupt.
+            18:18   doorbell_mirror;
+            /// Enable the MCU_STATUS interrupt.
+            19:19   mcu_status;
+        }
+
+        /// IRQ status for enabled sources. Read only.
+        pub(crate) GPU_IRQ_STATUS(u32) @ 0x2c {
+            /// GPU_FAULT interrupt status.
+            0:0     gpu_fault;
+            /// GPU_PROTECTED_FAULT interrupt status.
+            1:1     gpu_protected_fault;
+            /// RESET_COMPLETED interrupt status.
+            8:8     reset_completed;
+            /// POWER_CHANGED_SINGLE interrupt status.
+            9:9     power_changed_single;
+            /// POWER_CHANGED_ALL interrupt status.
+            10:10   power_changed_all;
+            /// CLEAN_CACHES_COMPLETED interrupt status.
+            17:17   clean_caches_completed;
+            /// DOORBELL_MIRROR interrupt status.
+            18:18   doorbell_mirror;
+            /// MCU_STATUS interrupt status.
+            19:19   mcu_status;
+        }
+
+        /// Layout is interpreted differently depending on the command value.
+        /// Default command is [`GPU_COMMAND::NOP`] with no payload.
+        pub(crate) GPU_COMMAND (u32) @ 0x30 {
+            7:0     command;
+        }
+    }
+
+    impl GPU_COMMAND {
+        /// No operation. This is the default value.
+        pub(crate) const NOP: u32 = 0;
+        /// Reset the GPU.
+        pub(crate) const RESET: u32 = 1;
+        /// Flush caches.
+        pub(crate) const FLUSH_CACHES: u32 = 4;
+        /// Clear GPU faults.
+        pub(crate) const CLEAR_FAULT: u32 = 7;
+    }
+
+    register! {
+        /// GPU command register in reset mode.
+        /// Set command to [`GPU_COMMAND::RESET`] to set reset_mode.
+        pub(crate) GPU_COMMAND_RESET (u32) => GPU_COMMAND {
+            7:0     command;
+            11:8    reset_mode;
+        }
+    }
+
+    impl GPU_COMMAND_RESET {
+        /// Stop all external bus interfaces, then reset the entire GPU.
+        pub(crate) const SOFT_RESET: u32 = 1;
+        /// Force a full GPU reset.
+        pub(crate) const HARD_RESET: u32 = 2;
+    }
+
+    register! {
+        /// GPU command register in cache flush mode.
+        /// Set command to [`GPU_COMMAND::FLUSH_CACHES`] to set flush modes.
+        pub(crate) GPU_COMMAND_FLUSH (u32) => GPU_COMMAND {
+            7:0     command;
+            /// L2 cache flush mode.
+            11:8    l2_flush;
+            /// Shader core load/store cache flush mode.
+            15:12   lsc_flush;
+            /// Shader core other caches flush mode.
+            19:16   other_flush;
+        }
+    }
+
+    impl GPU_COMMAND_FLUSH {
+        /// No flush.
+        pub(crate) const NONE: u32 = 0;
+        /// Clean the caches.
+        pub(crate) const CLEAN: u32 = 1;
+        /// Invalidate the caches.
+        pub(crate) const INVALIDATE: u32 = 2;
+        /// Clean and invalidate the caches.
+        pub(crate) const CLEAN_INVALIDATE: u32 = 3;
+    }
+
+    register! {
+        /// GPU status register. Read only.
+        pub(crate) GPU_STATUS(u32) @ 0x34 {
+            /// GPU active.
+            0:0     gpu_active;
+            /// Power manager active.
+            1:1     pwr_active;
+            /// Page fault active.
+            4:4     page_fault;
+            /// Protected mode active.
+            7:7     protected_mode_active;
+            /// Debug mode active.
+            8:8     gpu_dbg_enabled;
+        }
+
+        /// GPU fault status register. Read only.
+        pub(crate) GPU_FAULTSTATUS(u32) @ 0x3c {
+            /// Exception type.
+            7:0     exception_type;
+            /// Access type.
+            9:8     access_type;
+            /// The GPU_FAULTADDRESS is valid.
+            10:10   address_valid;
+            /// The JASID field is valid.
+            11:11   jasid_valid;
+            /// JASID of the fault, if known.
+            15:12   jasid;
+            /// ID of the source that triggered the fault.
+            31:16   source_id;
+        }
+    }
+
+    impl GPU_FAULTSTATUS {
+        /// Exception type: No error.
+        pub(crate) const EXCEPTION_OK: u32 = 0x00;
+        /// Exception type: GPU external bus error.
+        pub(crate) const EXCEPTION_GPU_BUS_FAULT: u32 = 0x80;
+        /// Exception type: GPU shareability error.
+        pub(crate) const EXCEPTION_GPU_SHAREABILITY_FAULT: u32 = 0x88;
+        /// Exception type: System shareability error.
+        pub(crate) const EXCEPTION_SYSTEM_SHAREABILITY_FAULT: u32 = 0x89;
+        /// Exception type: GPU cacheability error.
+        pub(crate) const EXCEPTION_GPU_CACHEABILITY_FAULT: u32 = 0x8A;
+
+        /// Access type: An atomic (read/write) transaction.
+        pub(crate) const ACCESS_ATOMIC: u32 = 0;
+        /// Access type: An execute transaction.
+        pub(crate) const ACCESS_EXECUTE: u32 = 1;
+        /// Access type: A read transaction.
+        pub(crate) const ACCESS_READ: u32 = 2;
+        /// Access type: A write transaction.
+        pub(crate) const ACCESS_WRITE: u32 = 3;
+    }
+
+    register! {
+        /// GPU fault address. Read only.
+        /// Once a fault is reported, it must be manually cleared by issuing a
+        /// [`GPU_COMMAND::CLEAR_FAULT`] command to the [`GPU_COMMAND`] register. No further GPU
+        /// faults will be reported until the previous fault has been cleared.
+        pub(crate) GPU_FAULTADDRESS(u64) @ 0x40 {
+            63:0    pointer;
+        }
+
+        /// Level 2 cache configuration.
+        pub(crate) L2_CONFIG(u32) @ 0x48 {
+            /// Requested cache size.
+            23:16   cache_size;
+            /// Requested hash function index.
+            31:24   hash_function;
+        }
+
+        /// Power state key. Write only.
+        pub(crate) PWR_KEY(u32) @ 0x50 {
+            /// Set to [`PWR_KEY::KEY_UNLOCK`] to unlock writes to other power state registers.
+            31:0    key;
+        }
+    }
+
+    impl PWR_KEY {
+        /// Key value to unlock writes to other power state registers.
+        /// This value was generated at random.
+        pub(crate) const KEY_UNLOCK: u32 = 0x2968A819;
+    }
+
+    register! {
+        /// Power manager override settings.
+        pub(crate) PWR_OVERRIDE0(u32) @ 0x54 {
+            /// Override the PWRUP signal.
+            1:0     pwrup_override;
+            /// Override the ISOLATE signal.
+            3:2     isolate_override;
+            /// Override the RESET signal.
+            5:4     reset_override;
+            /// Override the PWRUP_ACK signal.
+            9:8     pwrup_ack_override;
+            /// Override the ISOLATE_ACK signal.
+            11:10   isolate_ack_override;
+            /// Override the FUNC_ISOLATE signal.
+            13:12   func_iso_override;
+            /// Override the FUNC_ISOLATE_ACK signal.
+            15:14   func_iso_ack_override;
+            /// Maximum number of power transitions.
+            21:16   pwrtrans_limit;
+            /// Core startup throttling enabled.
+            23:23   throttle_enable;
+            /// Maximum number of simultaneous core startups.
+            29:24   throttle_limit;
+        }
+    }
+
+    /// Power override mode constants (`pwr_override_t` in hardware spec).
+    ///
+    /// These constants can be used with any field in [`PWR_OVERRIDE0`] that ends with
+    /// the `_override` suffix.
+    impl PWR_OVERRIDE0 {
+        /// The signal behaves normally.
+        pub(crate) const NONE: u32 = 0;
+        /// The signal is inverted (on when normally off, and off when normally on).
+        pub(crate) const INVERT: u32 = 1;
+        /// The signal is always kept on.
+        pub(crate) const ON: u32 = 2;
+        /// The signal is always kept off.
+        pub(crate) const OFF: u32 = 3;
+    }
+
+    register! {
+        /// Power manager override settings for device manufacturer.
+        pub(crate) PWR_OVERRIDE1(u32) @ 0x58 {
+            31:0    pwrtrans_vendor;
+        }
+
+        /// Global time stamp offset.
+        pub(crate) TIMESTAMP_OFFSET(u64) @ 0x88 {
+            63:0    offset;
+        }
+
+        /// GPU cycle counter. Read only.
+        pub(crate) CYCLE_COUNT(u64) @ 0x90 {
+            63:0    count;
+        }
+
+        /// Global time stamp. Read only.
+        pub(crate) TIMESTAMP(u64) @ 0x98 {
+            63:0    timestamp;
+        }
+
+        /// Maximum number of threads per core. Read only constant.
+        pub(crate) THREAD_MAX_THREADS(u32) @ 0xa0 {
+            31:0    threads;
+        }
+
+        /// Maximum number of threads per workgroup. Read only constant.
+        pub(crate) THREAD_MAX_WORKGROUP_SIZE(u32) @ 0xa4 {
+            31:0    threads;
+        }
+
+        /// Maximum number of threads per barrier. Read only constant.
+        pub(crate) THREAD_MAX_BARRIER_SIZE(u32) @ 0xa8 {
+            31:0    threads;
+        }
+
+        /// Thread features. Read only constant.
+        pub(crate) THREAD_FEATURES(u32) @ 0xac {
+            /// Total number of registers per core.
+            21:0    max_registers;
+            /// Implementation technology type.
+            23:22   implementation_technology;
+            /// Maximum number of compute tasks waiting.
+            31:24   max_task_queue;
+        }
+
+        /// Support flags for compressed texture formats. Read only constant.
+        pub(crate) TEXTURE_FEATURES_0(u32) @ 0xb0 {
+            31:0    format;
+        }
+
+        /// Shader core present bitmap. Read only constant.
+        pub(crate) SHADER_PRESENT(u64) @ 0x100 {
+            63:0    present;
+        }
+
+        /// Tiler present bitmap. Read only constant.
+        pub(crate) TILER_PRESENT(u64) @ 0x110 {
+            63:0    present;
+        }
+
+        /// L2 cache present bitmap. Read only constant.
+        pub(crate) L2_PRESENT(u64) @ 0x120 {
+            63:0    present;
+        }
+
+        /// Shader core ready bitmap. Read only.
+        pub(crate) SHADER_READY(u64) @ 0x140 {
+            63:0    ready;
+        }
+
+        /// Tiler ready bitmap. Read only.
+        pub(crate) TILER_READY(u64) @ 0x150 {
+            63:0    ready;
+        }
+
+        /// L2 ready bitmap. Read only.
+        pub(crate) L2_READY(u64) @ 0x160 {
+            63:0    ready;
+        }
+
+        /// Shader core power up bitmap.
+        pub(crate) SHADER_PWRON(u64) @ 0x180 {
+            63:0    request;
+        }
+
+        /// Tiler power up bitmap.
+        pub(crate) TILER_PWRON(u64) @ 0x190 {
+            63:0    request;
+        }
+
+        /// L2 power up bitmap.
+        pub(crate) L2_PWRON(u64) @ 0x1a0 {
+            63:0 request;
+        }
+
+        /// Shader core power down bitmap.
+        pub(crate) SHADER_PWROFF(u64) @ 0x1c0 {
+            63:0 request;
+        }
+
+        /// Tiler power down bitmap.
+        pub(crate) TILER_PWROFF(u64) @ 0x1d0 {
+            63:0 request;
+        }
+
+        /// L2 power down bitmap.
+        pub(crate) L2_PWROFF(u64) @ 0x1e0 {
+            63:0 request;
+        }
+
+        /// Shader core power transition bitmap. Read-only.
+        pub(crate) SHADER_PWRTRANS(u64) @ 0x200 {
+            63:0 changing;
+        }
+
+        /// Tiler power transition bitmap. Read-only.
+        pub(crate) TILER_PWRTRANS(u64) @ 0x210 {
+            63:0 changing;
+        }
+
+        /// L2 power transition bitmap. Read-only.
+        pub(crate) L2_PWRTRANS(u64) @ 0x220 {
+            63:0 changing;
+        }
+
+        /// Shader core active bitmap. Read-only.
+        pub(crate) SHADER_PWRACTIVE(u64) @ 0x240 {
+            63:0 active;
+        }
+
+        /// Tiler active bitmap. Read-only.
+        pub(crate) TILER_PWRACTIVE(u64) @ 0x250 {
+            63:0 active;
+        }
+
+        /// L2 active bitmap.  Read-only.
+        pub(crate) L2_PWRACTIVE(u64) @ 0x260 {
+            63:0 active;
+        }
+
+        /// Revision ID. Read only constant.
+        pub(crate) REVIDR(u32) @ 0x280 {
+            31:0    revision;
+        }
+
+        /// Coherency features present. Read only constant.
+        /// Supported protocols on the interconnect between the GPU and the
+        /// system into which it is integrated.
+        pub(crate) COHERENCY_FEATURES(u32) @ 0x300 {
+            /// ACE-Lite protocol supported.
+            0:0     ace_lite;
+            /// ACE protocol supported.
+            1:1     ace;
+        }
+
+        /// Coherency enable. An index of which coherency protocols should be used.
+        /// Possible values are in
+        /// This register only selects the protocol for coherency messages on the
+        /// interconnect. This is not to enable or disable coherency controlled by MMU.
+        pub(crate) COHERENCY_ENABLE(u32) @ 0x304 {
+            31:0    l2_cache_protocol_select;
+        }
+    }
+
+    impl COHERENCY_ENABLE {
+        /// ACE-Lite coherency protocol.
+        pub(crate) const ACE_LITE: u32 =
+            uapi::drm_panthor_gpu_coherency_DRM_PANTHOR_GPU_COHERENCY_ACE_LITE;
+        /// ACE coherency protocol.
+        pub(crate) const ACE: u32 = uapi::drm_panthor_gpu_coherency_DRM_PANTHOR_GPU_COHERENCY_ACE;
+        /// No coherency protocol.
+        pub(crate) const NO_COHERENCY: u32 =
+            uapi::drm_panthor_gpu_coherency_DRM_PANTHOR_GPU_COHERENCY_NONE;
+    }
+
+    register! {
+        /// MCU control.
+        pub(crate) MCU_CONTROL(u32) @ 0x700 {
+            /// Request MCU state change.
+            1:0 req;
+        }
+    }
+
+    impl MCU_CONTROL {
+        /// Disable the MCU.
+        pub(crate) const DISABLE: u32 = 0;
+        /// Enable the MCU.
+        pub(crate) const ENABLE: u32 = 1;
+        /// Enable the MCU to execute and automatically reboot after a fast reset.
+        pub(crate) const AUTO: u32 = 2;
+    }
+
+    register! {
+        /// MCU status. Read only.
+        pub(crate) MCU_STATUS(u32) @ 0x704 {
+            /// Read current state of MCU.
+            1:0 value;
+        }
+    }
+
+    impl MCU_STATUS {
+        /// MCU is disabled.
+        pub(crate) const DISABLED: u32 = 0;
+        /// MCU is enabled.
+        pub(crate) const ENABLED: u32 = 1;
+        /// The MCU has halted by itself in an orderly manner to enable the core group to be powered down.
+        pub(crate) const HALT: u32 = 2;
+        /// The MCU has encountered an error that prevents it from continuing.
+        pub(crate) const FATAL: u32 = 3;
+    }
+}
+
+pub(super) use gpu_control::*;
 
 pub(crate) const JOB_IRQ_RAWSTAT: Register<0x1000> = Register;
 pub(crate) const JOB_IRQ_CLEAR: Register<0x1004> = Register;

-- 
2.52.0

