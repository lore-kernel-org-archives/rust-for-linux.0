Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9043F3CF695;
	Thu,  9 Jul 2026 21:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783633043; cv=pass; b=VfgH/8wYHyvxE2tOoDTaV7r3ROL3MIZQKwpF8l2oOQB0+JnW0x9bP25/QrPjXQyIeYp45UbnAF+VHhiqrLV7k9rKymqiiqcNZxEaD0C0Xc5UdbHWVDXGIuxP5RRJHbhgYugLohS2j6iUoyZo21FKflNZfQAOXk30lGOoh/L3a2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783633043; c=relaxed/simple;
	bh=/lTl3P86QqfKk1OWhpH8vkka1+Hljs1sOLic8azDb5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ct1GgHfezg/6Chza8G7vm1w5d/GsvAhN6cLE9/qvXL62mv4arxfr5FEdScLtsdnN+crOErujcihPJ29avaxJ5FjKjPubTukR8Jw2/3JJWUZuyOKujQ727sUBc7XA+b+F8u7zSGf6pc9heklh+o0605nXGT5KEweO9lnmqdyOVHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=Ur26b1+g; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="Ur26b1+g"
ARC-Seal: i=1; a=rsa-sha256; t=1783633020; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fs63gd6r3RCRmrQghISUtqOByklzHh42svH0yLNlzYFy4mhGvI/9g01J3TB5k17GUe+PtC7rUQjCOPtYOLDY95o3SFCAeNhnoy+48nDJAA5mX0HJhks0YQklRqeq3BFD6kiwe450H1QyQPLBjQ2Jk5M7Sd+Vw8WhsuwRz+EA44I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783633020; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qpo1GpV6sk1WVtPptJhiq2FiJGO1cXEHyZJCt5K62l4=; 
	b=YiRqPGjABCDUXthiA3xY6jLPuHZfZmR+hOwsBNKxulK3vc9c8NoM1RXfX4ALJ1LExA7gGcCX5X0jZkk23j8TkamjSThq96PJxrW2W9q5T5tAMELMQPegcE56FPhNL1AanWIPfDQteo93YOgAbtG5OCZyz7AQa1HzWi6U22hCxXs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783633020;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=qpo1GpV6sk1WVtPptJhiq2FiJGO1cXEHyZJCt5K62l4=;
	b=Ur26b1+gIFn6wruMoy7BYbN3r8+hqTUeU4lJ9EvkXt5qPHSf3u3/tSkLBj17QqWL
	NxOUvFuzGJT0Qdw+NV3USAQNzvZZUYvYUe2q83z4H4Zy+AXbN7ZOESWqt3yftaFrKcN
	iL9GEuLoxj0MvMxaoRNseJcBjP7bP0eekAQUXoFc=
Received: by mx.zohomail.com with SMTPS id 17836330182538.339039471961883;
	Thu, 9 Jul 2026 14:36:58 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Thu, 09 Jul 2026 14:36:45 -0700
Subject: [PATCH v6 5/7] drm/tyr: add a kernel buffer object
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-fw-boot-b4-v6-5-ca391e1a4108@collabora.com>
References: <20260709-fw-boot-b4-v6-0-ca391e1a4108@collabora.com>
In-Reply-To: <20260709-fw-boot-b4-v6-0-ca391e1a4108@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 Deborah Brouwer <deborah.brouwer@collabora.com>, 
 boris.brezillon@collabora.com, samitolvanen@google.com, acourbot@nvidia.com, 
 alvin.sun@linux.dev, laura.nao@collabora.com, work@onurozkan.dev, 
 beata.michalska@arm.com, steven.price@arm.com, lyude@redhat.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4385;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=/lTl3P86QqfKk1OWhpH8vkka1+Hljs1sOLic8azDb5M=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFkBIiXuC/bevcCdHvqJLX+yu62f8LLStC7FB3F1Tc1Rz
 qHrlvN2lLIwiHExyIopspy1N+oRr3pvpDv/fzPMHFYmkCEMXJwCMBHrbYwMZxekJV+9tlP+n/SH
 IIMpXCqLn+ncmSL+L+RTK3vK7+5KeUaGJdsOTmB5zd4am//3/0Qe0yvrfy6Y1vwo992OBqETFzV
 OswMA
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

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
 drivers/gpu/drm/tyr/gem.rs | 101 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 97 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index c28be61a01bb..47a05a33388e 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -4,18 +4,29 @@
 //! This module provides buffer object (BO) management functionality using
 //! DRM's GEM subsystem with shmem backing.
 
+use core::ops::Range;
+
 use kernel::{
     drm::gem::{
         self,
         shmem, //
     },
     prelude::*,
-    sync::aref::ARef, //
+    sync::{
+        aref::ARef,
+        Arc, //
+    }, //
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
@@ -56,3 +67,85 @@ pub(crate) fn new_dummy_object(ddev: &TyrDrmDevice) -> Result<ARef<Bo>> {
 
     Ok(bo)
 }
+
+/// Specifies how to choose a GPU virtual address for a [`KernelBo`].
+/// An automatic VA allocation strategy will be added in the future.
+pub(crate) enum KernelBoVaAlloc {
+    /// Explicit VA address specified by the caller.
+    #[expect(dead_code)]
+    Explicit(u64),
+}
+
+/// A kernel-owned buffer object with automatic GPU virtual address mapping.
+///
+/// This structure represents a buffer object that is created and managed entirely
+/// by the kernel driver, as opposed to userspace-created GEM objects. It combines
+/// a GEM object with automatic GPU virtual address (VA) space mapping and cleanup.
+///
+/// When dropped, the buffer is automatically unmapped from the GPU VA space.
+pub(crate) struct KernelBo<'bound> {
+    /// The underlying GEM buffer object.
+    #[expect(dead_code)]
+    pub(crate) bo: ARef<Bo>,
+    /// The GPU VM this buffer is mapped into.
+    vm: Arc<Vm<'bound>>,
+    /// The GPU VA range occupied by this buffer.
+    va_range: Range<u64>,
+}
+
+impl<'bound> KernelBo<'bound> {
+    /// Creates a new kernel-owned buffer object and maps it into GPU VA space.
+    ///
+    /// This function allocates a new shmem-backed GEM object and immediately maps
+    /// it into the specified GPU virtual memory space. The mapping is automatically
+    /// cleaned up when the [`KernelBo`] is dropped.
+    #[expect(dead_code)]
+    pub(crate) fn new(
+        ddev: &TyrDrmDevice,
+        vm: Arc<Vm<'bound>>,
+        size: u64,
+        va_alloc: KernelBoVaAlloc,
+        flags: VmMapFlags,
+    ) -> Result<Self> {
+        if size == 0 {
+            pr_err!("Cannot create KernelBo with size 0\n");
+            return Err(EINVAL);
+        }
+
+        let KernelBoVaAlloc::Explicit(va) = va_alloc;
+
+        let bo = Bo::new(
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
+            vm,
+            va_range: va..(va + size),
+        })
+    }
+}
+
+impl Drop for KernelBo<'_> {
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
2.54.0

