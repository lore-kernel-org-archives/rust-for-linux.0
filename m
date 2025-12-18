Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E8135B149;
	Thu, 18 Dec 2025 15:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766073183; cv=none; b=ZVvvHT6vbmYE4FHiUYL/y+P1fN5GR4w+OIlBu+WfuhG/PkWPIVhI7s5WARNimRCCxvXhwL9VgZuIPG9HQJOSJIcuIAFYXtDjmXdPIYa52fG80nGgLTC6rNfdWo69mgtAdXFYzrIpo0P3egZ+sZQWxXENi/ZWxvcmKU3izYeVWu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766073183; c=relaxed/simple;
	bh=Acvk5iLutO8NmjLHTbkDla+2OX0ZkKvT1OUyrVQAsys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AiNzmxBirjv0eM/Yr5gaz2XrQ4st/vaN/H2LoCXM1E7Z8u7kw8Id0UHEb7L5RhFdEge+rkPSIHELaZt/j32Tbj57rF0Nm5wHSWumUbpWyeL0al5zLhslTd5mzdzNaIKOtS+TbcEVIAbyCUJlR93vMM7rVZXZ/Iy8u3bCb9ZR3xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJLvBfZN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJLvBfZN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B29C116B1;
	Thu, 18 Dec 2025 15:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766073182;
	bh=Acvk5iLutO8NmjLHTbkDla+2OX0ZkKvT1OUyrVQAsys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gJLvBfZNu53/I7LNeZPxDrRp/kr1nt6hLbP9EbfgjFWgpEAfRw611pH5sUiY5q/rk
	 C3lh2fx8IIR/2e3zmzdwY+bsS3D2VTH+UYkvfs8vrJ3O31hcYIJJBYUFoPmTt6WEam
	 CRu0dg3Q2YLh0vCQ6g0hsO5qhj+HZAYokXwQfLvF0Fg5AfqJlI395jpGhE6dYG/A0M
	 q6jt8p49hareHf1YkOLa9wBJYtIIogdxUGm7WAZqG+kNaxZK72UwdvtppykKYRFNGe
	 LqNLghldCNLLTKrJ0cdMZiyRCtOAxK+aNsXCl8rOEFA5qeD+Ik9RduPDeLb0z8WXNE
	 uu9B+f0O5IL6A==
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
Subject: [PATCH 4/4] gpu: nova-core: gsp: move appropriate code into pin initializer
Date: Thu, 18 Dec 2025 16:50:51 +0100
Message-ID: <20251218155239.25243-5-dakr@kernel.org>
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

Relocate the code that technically fits in the pin initializer into the
initializer itself.

While, thanks to pin_init_scope(), it is also possible to keep it as is,
moving appropriate code into the initializer has the advantage that it
structures the dependencies of fields naturally.

For instance, intermediate data that is only needed for a single field
goes into the initializer block of this field, making it obvious that it
is not needed by anything else.

On the other hand, intermediate data that is needed for multiple fields
to initialize remains above the initializer, naturally indicating that
it is needed my multiple fields.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/gsp.rs | 61 +++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 8bc86e1bcac5..766fd9905358 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -122,41 +122,36 @@ impl Gsp {
     pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error> + '_ {
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
-            let libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
-                dev,
-                GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
-                GFP_KERNEL | __GFP_ZERO,
-            )?;
-
-            // Initialise the logging structures. The OpenRM equivalents are in:
-            // _kgspInitLibosLoggingStructures (allocates memory for buffers)
-            // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
-            let loginit = LogBuffer::new(dev)?;
-            dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
-
-            let logintr = LogBuffer::new(dev)?;
-            dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
-
-            let logrm = LogBuffer::new(dev)?;
-            dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
-
-            let cmdq = Cmdq::new(dev)?;
-
-            let rmargs = CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
-                dev,
-                1,
-                GFP_KERNEL | __GFP_ZERO,
-            )?;
-            dma_write!(rmargs[0] = fw::GspArgumentsCached::new(&cmdq))?;
-            dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs))?;
 
             Ok(try_pin_init!(Self {
-                libos,
-                loginit,
-                logintr,
-                logrm,
-                rmargs,
-                cmdq,
+                libos: CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
+                    dev,
+                    GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
+                    GFP_KERNEL | __GFP_ZERO,
+                )?,
+                loginit: LogBuffer::new(dev)?,
+                logintr: LogBuffer::new(dev)?,
+                logrm: LogBuffer::new(dev)?,
+                cmdq: Cmdq::new(dev)?,
+                rmargs: CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
+                    dev,
+                    1,
+                    GFP_KERNEL | __GFP_ZERO,
+                )?,
+                _: {
+                    // Initialise the logging structures. The OpenRM equivalents are in:
+                    // _kgspInitLibosLoggingStructures (allocates memory for buffers)
+                    // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
+                    dma_write!(
+                        libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0)
+                    )?;
+                    dma_write!(
+                        libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)
+                    )?;
+                    dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
+                    dma_write!(rmargs[0] = fw::GspArgumentsCached::new(cmdq))?;
+                    dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
+                },
             }))
         })
     }
-- 
2.52.0

