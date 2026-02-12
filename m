Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABEE18FC80
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 01:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770860275; cv=pass; b=YULHZA7Zj+xMduotEIpnyvyBDagVukgcx2h8OwCzr6Wv23jbXN7N4v2H612eLz/I9ydrsvOkbAEKx+jkxWRcg9WHpg8+fL9E6dtH5JM5RN8mmVQ+gEaEOGuTQc1dbcivqIiglPInnKPXlxKx0Qf/Eftb9s4QN0ow2tXj9apg/5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770860275; c=relaxed/simple;
	bh=e2pKVHLulcInCu/8yOAD7A6eTQ2bsk3vS1v5GIznOIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TXj/FgC2bTi4GLEL8/SVv8bWFb9/+y2VCrsgLhJMN31v0GKVV6Kr0Qq0BsR1RiEPmZrZ8KlNAXdx75v+6tQc2DdiwDlimzxY3Uug0ZaCHbjt+EkPjOEnP3JiOm4QDTmqr1iVKxWPlkbJfbJWs/Z4Ipeqn32rz1QyXGHM+B5r/XU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=Rc1wOu/Y; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="Rc1wOu/Y"
ARC-Seal: i=1; a=rsa-sha256; t=1770860267; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZEmnQdou0gyHT4mOqey5l3P0+IRIKCwuLqdJ28xXxiwghhfG6ULWbea5Vokar2WykIqD+YDmUUQu7rR6WHGC9iGeFyMWRBcjPXTxJ3dapcOXuAJBFhO0w7OwhXxCkV0zf/YGP9CUkOZFWP6sUK5VlcY3j0sUEWjUhcyV0rPzRtY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770860267; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IvH4x9/Iyadu1F8gOagQw1249jxBwYcCWXaExDogPN8=; 
	b=Lszw8nMOHAgqPkQiewjm/zjLg4dvBoK3P/BG5cfqZdZ05Tn8fCr+H+gnlvJ4MPvxp8lkbBmTtJbgVKhTjCyvljw42JRGNMPrSLIfbo5zY+H0lf/G8/IUEyu3bOwD1R5d+PIpWsp68T9CxV5UFBEt08H6BWqp276cnqD07U5qifQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770860267;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=IvH4x9/Iyadu1F8gOagQw1249jxBwYcCWXaExDogPN8=;
	b=Rc1wOu/YxZAn0/KkF/U5/l8nxcjc0DuvMCpEbQtPxZLJG2M89kWWy15NdI9nLNun
	3BC/sH2OK4a9YcjEXhfG1fjpc4ognA6Zlj4V8f6WHZnSR6dGId/hSeheIqw8D3ZLlbS
	A6hW0RqVb4WyIcKr/SGNnn3tx0//VRlWVy2PKPaw=
Received: by mx.zohomail.com with SMTPS id 1770860265316717.0429461113662;
	Wed, 11 Feb 2026 17:37:45 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	beata.michalska@arm.com,
	lyude@redhat.com,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 10/12] drm/tyr: add a kernel buffer object
Date: Wed, 11 Feb 2026 17:37:11 -0800
Message-ID: <20260212013713.304343-11-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212013713.304343-1-deborah.brouwer@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a buffer object type (KernelBo) for internal driver allocations
that are managed by the kernel rather than userspace.

KernelBo wraps a GEM shmem object and automatically handles GPU virtual
address space mapping during creation and unmapping on drop. This provides
a safe and convenient way for the driver to both allocate and clean up
internal buffers for kernel-managed resources.

Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/gem.rs | 74 +++++++++++++++++++++++++++++++++++---
 1 file changed, 70 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index 111acf33993f..3807810be7ea 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -4,6 +4,8 @@
 //! This module provides buffer object (BO) management functionality using
 //! DRM's GEM subsystem with shmem backing.
 
+use core::ops::Range;
+
 use kernel::{
     drm::{
         gem,
@@ -11,12 +13,22 @@
         DeviceContext, //
     },
     prelude::*,
-    sync::aref::ARef, //
+    sync::{
+        aref::ARef,
+        Arc,
+        ArcBorrow, //
+    },
 };
 
-use crate::driver::{
-    TyrDrmDevice,
-    TyrDrmDriver, //
+use crate::{
+    driver::{
+        TyrDrmDevice,
+        TyrDrmDriver, //
+    },
+    vm::{
+        Vm,
+        VmMapFlags, //
+    },
 };
 
 /// Tyr's DriverObject type for GEM objects.
@@ -61,3 +73,57 @@ pub(crate) fn new_dummy_object<Ctx: DeviceContext>(ddev: &TyrDrmDevice<Ctx>) ->
 
     Ok(bo)
 }
+
+/// A buffer object that is owned and managed by Tyr rather than userspace.
+pub(crate) struct KernelBo {
+    #[expect(dead_code)]
+    pub(crate) bo: ARef<Bo>,
+    vm: Arc<Vm>,
+    va_range: Range<u64>,
+}
+
+impl KernelBo {
+    /// Creates a new kernel-owned buffer object and maps it into GPU VA space.
+    #[expect(dead_code)]
+    pub(crate) fn new<Ctx: DeviceContext>(
+        ddev: &TyrDrmDevice<Ctx>,
+        vm: ArcBorrow<'_, Vm>,
+        size: u64,
+        va: u64,
+        flags: VmMapFlags,
+    ) -> Result<Self> {
+        let bo = gem::shmem::Object::<BoData>::new(
+            ddev,
+            size as usize,
+            shmem::ObjectConfig {
+                map_wc: true,
+                parent_resv_obj: None,
+            },
+            BoCreateArgs { flags: 0 },
+        )?;
+
+        vm.map_bo_range(&bo, 0, size, va, flags)?;
+
+        Ok(KernelBo {
+            bo,
+            vm: vm.into(),
+            va_range: va..(va + size),
+        })
+    }
+}
+
+impl Drop for KernelBo {
+    fn drop(&mut self) {
+        let va = self.va_range.start;
+        let size = self.va_range.end - self.va_range.start;
+
+        if let Err(e) = self.vm.unmap_range(va, size) {
+            pr_err!(
+                "Failed to unmap KernelBo range {:#x}..{:#x}: {:?}\n",
+                self.va_range.start,
+                self.va_range.end,
+                e
+            );
+        }
+    }
+}
-- 
2.52.0

