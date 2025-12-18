Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D9435B120;
	Thu, 18 Dec 2025 15:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766073179; cv=none; b=BAmnLO4rUEW7wcludUhnN60HrPLfW6pom3WYeRtjzdvksm084ZFkWuDlOtBSZ080lYTGEpsIR6dHlergjH+tIA2iCZPULywoJyklzv5o1keZbRJCIJk7d0HrnVmZnQ0ppuKnq7TejLbPr/1wtiQ+lllozd35qLLru/BBq1N+pBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766073179; c=relaxed/simple;
	bh=mAqob5mbv6FapcPS/iSYQO3lcLOl40s89j9fmY+JxAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QKgUQfApd8QX5FMz+t3TroPfe9O84IEHFbuUygWEnOwOmiznpkv9sHmNLRdDm8jpH+N4m9Op/JuohxGIsPPgZJNAPLd5mdVlBnsakbMe7STSVOCOCSKv5Ek5Ir7vISxoXRs2Gnrn6je13e/PyOI4TJqOV+y4+LHhS3eUY8Tga3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzH6VXSa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzH6VXSa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA34FC19421;
	Thu, 18 Dec 2025 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766073179;
	bh=mAqob5mbv6FapcPS/iSYQO3lcLOl40s89j9fmY+JxAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lzH6VXSaSYuzW+LM5rHFjXy9bUhqsaHVxwYEUqlZwBYk6+ZIauHjc4tYlHr9Yzf3u
	 UfxCd230qworoQfHVYyjcU1dxlgT5x8evbKGdbuIpKO0mMFHWzyIpEjHzriS2K3RTx
	 6g6DG21lveBY/IrymygKwRMyIcX1svj5Enh3XLqNEdpnQZIIP9KS7FBru+7qEoqVnQ
	 9s3SpEvxRofLo27TiLo2pB1bPjwNK/SjSsMWDUMg+vudQmJFT/1cHUB47vH1qIeZXK
	 H3/dR48VYxI1bl+QBXRJWaHpp2hKwu7roF/lxc7NxLJ4lXkI9UJ/c1veerQpBtHFaq
	 4m6nRKTSNUemA==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com,
	jhubbard@nvidia.com,
	apopple@nvidia.com,
	joelagnelf@nvidia.com,
	aliceryhl@google.com,
	lossin@kernel.org
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 3/4] gpu: nova-core: gsp: get rid of redundant Result in Gsp::new()
Date: Thu, 18 Dec 2025 16:50:50 +0100
Message-ID: <20251218155239.25243-4-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218155239.25243-1-dakr@kernel.org>
References: <20251218155239.25243-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In Gsp::new(), utilize pin_init_scope() to get rid of the Result in the
returned

	Result<impl PinInit<T, Error>>

which is unnecessarily redundant.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/gpu.rs |  2 +-
 drivers/gpu/nova-core/gsp.rs | 78 ++++++++++++++++++------------------
 2 files changed, 41 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 629c9d2dc994..50d76092fbdd 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -281,7 +281,7 @@ pub(crate) fn new<'a>(
 
             sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
 
-            gsp <- Gsp::new(pdev)?,
+            gsp <- Gsp::new(pdev),
 
             _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index fb6f74797178..8bc86e1bcac5 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -119,43 +119,45 @@ pub(crate) struct Gsp {
 
 impl Gsp {
     // Creates an in-place initializer for a `Gsp` manager for `pdev`.
-    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self, Error>> {
-        let dev = pdev.as_ref();
-        let libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
-            dev,
-            GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
-            GFP_KERNEL | __GFP_ZERO,
-        )?;
-
-        // Initialise the logging structures. The OpenRM equivalents are in:
-        // _kgspInitLibosLoggingStructures (allocates memory for buffers)
-        // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
-        let loginit = LogBuffer::new(dev)?;
-        dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
-
-        let logintr = LogBuffer::new(dev)?;
-        dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
-
-        let logrm = LogBuffer::new(dev)?;
-        dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
-
-        let cmdq = Cmdq::new(dev)?;
-
-        let rmargs = CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
-            dev,
-            1,
-            GFP_KERNEL | __GFP_ZERO,
-        )?;
-        dma_write!(rmargs[0] = fw::GspArgumentsCached::new(&cmdq))?;
-        dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs))?;
-
-        Ok(try_pin_init!(Self {
-            libos,
-            loginit,
-            logintr,
-            logrm,
-            rmargs,
-            cmdq,
-        }))
+    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error> + '_ {
+        pin_init::pin_init_scope(move || {
+            let dev = pdev.as_ref();
+            let libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
+                dev,
+                GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
+                GFP_KERNEL | __GFP_ZERO,
+            )?;
+
+            // Initialise the logging structures. The OpenRM equivalents are in:
+            // _kgspInitLibosLoggingStructures (allocates memory for buffers)
+            // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
+            let loginit = LogBuffer::new(dev)?;
+            dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
+
+            let logintr = LogBuffer::new(dev)?;
+            dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
+
+            let logrm = LogBuffer::new(dev)?;
+            dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
+
+            let cmdq = Cmdq::new(dev)?;
+
+            let rmargs = CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
+                dev,
+                1,
+                GFP_KERNEL | __GFP_ZERO,
+            )?;
+            dma_write!(rmargs[0] = fw::GspArgumentsCached::new(&cmdq))?;
+            dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs))?;
+
+            Ok(try_pin_init!(Self {
+                libos,
+                loginit,
+                logintr,
+                logrm,
+                rmargs,
+                cmdq,
+            }))
+        })
     }
 }
-- 
2.52.0

