Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B56917A31C
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 09:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750757572; cv=none; b=W8emIpds8Yu5RJcqXmB+xnlZd5M/IHCMMMBcxeaTNol+BSeyEjtvt2dZwrIUrQbtU6jiGHtScJlnSU5MM/t+jOKUWJ2GEKV7rI61KAarDteRnVlNE7TjCoGTBTXDuqsrHWi47bxYXKr7KRvMLkmJKBxBU7xgFiBuRgHgE60GoAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750757572; c=relaxed/simple;
	bh=0nf1HpMQ7jdgeSitwkw8RAuYrRMhgjEDTbHvg2laKMo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GSdk9bpHtq+9uLIUbIU7yh6FjbdV4JP+k904Ih68J3yx2Dg0ULYARyDma673Lp1DRBF644f0pjL1RsoH9TG9TJZQrjAmnZMyuVHcnyqi8dvZIovO/fglmRR4Fm+CNTKTNENt+TGVPGSIed1aX49Lw5s/eXL/iB12nR774HuRaXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF641113E;
	Tue, 24 Jun 2025 02:32:32 -0700 (PDT)
Received: from e129154.arm.com (unknown [10.57.66.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C5BEC3F66E;
	Tue, 24 Jun 2025 02:32:45 -0700 (PDT)
From: Beata Michalska <beata.michalska@arm.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com
Cc: boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	alyssa@rosenzweig.io,
	lyude@redhat.com,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm: nova-drm: Update ioctl handlers to drop Opaque usage
Date: Tue, 24 Jun 2025 11:32:00 +0200
Message-Id: <20250624093200.812812-3-beata.michalska@arm.com>
In-Reply-To: <20250624093200.812812-1-beata.michalska@arm.com>
References: <20250624093200.812812-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Danilo Krummrich <dakr@kernel.org>

Following the removal of `Opaque<T>` for ioctl arguments in the DRM
framework, this patch updates the affected driver code to use typed
references directly.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 drivers/gpu/drm/nova/file.rs | 23 ++++++--------
 drivers/gpu/drm/nova/nova.rs |  1 -
 drivers/gpu/drm/nova/uapi.rs | 61 ------------------------------------
 3 files changed, 9 insertions(+), 76 deletions(-)
 delete mode 100644 drivers/gpu/drm/nova/uapi.rs

diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
index 7e59a34b830d..7e7d4e2de2fb 100644
--- a/drivers/gpu/drm/nova/file.rs
+++ b/drivers/gpu/drm/nova/file.rs
@@ -2,13 +2,11 @@
 
 use crate::driver::{NovaDevice, NovaDriver};
 use crate::gem::NovaObject;
-use crate::uapi::{GemCreate, GemInfo, Getparam};
 use kernel::{
     alloc::flags::*,
     drm::{self, gem::BaseObject},
     pci,
     prelude::*,
-    types::Opaque,
     uapi,
 };
 
@@ -26,20 +24,19 @@ impl File {
     /// IOCTL: get_param: Query GPU / driver metadata.
     pub(crate) fn get_param(
         dev: &NovaDevice,
-        getparam: &Opaque<uapi::drm_nova_getparam>,
+        getparam: &mut uapi::drm_nova_getparam,
         _file: &drm::File<File>,
     ) -> Result<u32> {
         let adev = &dev.adev;
         let parent = adev.parent().ok_or(ENOENT)?;
         let pdev: &pci::Device = parent.try_into()?;
-        let getparam: &Getparam = getparam.into();
 
-        let value = match getparam.param() as u32 {
+        let value = match getparam.param as u32 {
             uapi::NOVA_GETPARAM_VRAM_BAR_SIZE => pdev.resource_len(1)?,
             _ => return Err(EINVAL),
         };
 
-        getparam.set_value(value);
+        getparam.value = value;
 
         Ok(0)
     }
@@ -47,13 +44,12 @@ pub(crate) fn get_param(
     /// IOCTL: gem_create: Create a new DRM GEM object.
     pub(crate) fn gem_create(
         dev: &NovaDevice,
-        req: &Opaque<uapi::drm_nova_gem_create>,
+        req: &mut uapi::drm_nova_gem_create,
         file: &drm::File<File>,
     ) -> Result<u32> {
-        let req: &GemCreate = req.into();
-        let obj = NovaObject::new(dev, req.size().try_into()?)?;
+        let obj = NovaObject::new(dev, req.size.try_into()?)?;
 
-        req.set_handle(obj.create_handle(file)?);
+        req.handle = obj.create_handle(file)?;
 
         Ok(0)
     }
@@ -61,13 +57,12 @@ pub(crate) fn gem_create(
     /// IOCTL: gem_info: Query GEM metadata.
     pub(crate) fn gem_info(
         _dev: &NovaDevice,
-        req: &Opaque<uapi::drm_nova_gem_info>,
+        req: &mut uapi::drm_nova_gem_info,
         file: &drm::File<File>,
     ) -> Result<u32> {
-        let req: &GemInfo = req.into();
-        let bo = NovaObject::lookup_handle(file, req.handle())?;
+        let bo = NovaObject::lookup_handle(file, req.handle)?;
 
-        req.set_size(bo.size().try_into()?);
+        req.size = bo.size().try_into()?;
 
         Ok(0)
     }
diff --git a/drivers/gpu/drm/nova/nova.rs b/drivers/gpu/drm/nova/nova.rs
index 902876aa14d1..730598defe04 100644
--- a/drivers/gpu/drm/nova/nova.rs
+++ b/drivers/gpu/drm/nova/nova.rs
@@ -5,7 +5,6 @@
 mod driver;
 mod file;
 mod gem;
-mod uapi;
 
 use crate::driver::NovaDriver;
 
diff --git a/drivers/gpu/drm/nova/uapi.rs b/drivers/gpu/drm/nova/uapi.rs
deleted file mode 100644
index eb228a58d423..000000000000
--- a/drivers/gpu/drm/nova/uapi.rs
+++ /dev/null
@@ -1,61 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-use kernel::uapi;
-
-// TODO Work out some common infrastructure to avoid boilerplate code for uAPI abstractions.
-
-macro_rules! define_uapi_abstraction {
-    ($name:ident <= $inner:ty) => {
-        #[repr(transparent)]
-        pub struct $name(::kernel::types::Opaque<$inner>);
-
-        impl ::core::convert::From<&::kernel::types::Opaque<$inner>> for &$name {
-            fn from(value: &::kernel::types::Opaque<$inner>) -> Self {
-                // SAFETY: `Self` is a transparent wrapper of `$inner`.
-                unsafe { ::core::mem::transmute(value) }
-            }
-        }
-    };
-}
-
-define_uapi_abstraction!(Getparam <= uapi::drm_nova_getparam);
-
-impl Getparam {
-    pub fn param(&self) -> u64 {
-        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_getparam`.
-        unsafe { (*self.0.get()).param }
-    }
-
-    pub fn set_value(&self, v: u64) {
-        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_getparam`.
-        unsafe { (*self.0.get()).value = v };
-    }
-}
-
-define_uapi_abstraction!(GemCreate <= uapi::drm_nova_gem_create);
-
-impl GemCreate {
-    pub fn size(&self) -> u64 {
-        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_create`.
-        unsafe { (*self.0.get()).size }
-    }
-
-    pub fn set_handle(&self, handle: u32) {
-        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_create`.
-        unsafe { (*self.0.get()).handle = handle };
-    }
-}
-
-define_uapi_abstraction!(GemInfo <= uapi::drm_nova_gem_info);
-
-impl GemInfo {
-    pub fn handle(&self) -> u32 {
-        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_info`.
-        unsafe { (*self.0.get()).handle }
-    }
-
-    pub fn set_size(&self, size: u64) {
-        // SAFETY: `self.get()` is a valid pointer to a `struct drm_nova_gem_info`.
-        unsafe { (*self.0.get()).size = size };
-    }
-}
-- 
2.25.1

