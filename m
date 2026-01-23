Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334888834;
	Fri, 23 Jan 2026 13:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769173999; cv=none; b=DjSMER/vCIoqE2kWcDPjPAxOKJKzHkTojFN8a+MRcNJWM5u/lrhD7QHMJ7dXXXHuFZytPlhqrve+U+xzNL62NxNhpJObYzmlK3dRFQxfZcf/VJDYhLfU0xbTXHwhQZekPWUUGYCjeED7vqpbBeH2M02OOQlAlqxO4kXsyfpDHTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769173999; c=relaxed/simple;
	bh=DidmXa8uDcEOaEM4jQZEMzNJH1JTLnc18BoDB0JxLyY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EwIT9fBGvdL9jLvwLPvKmsxm/5rLafBTgEVL1KFpIZMdGLdXHH9thoatK46QpiBtx2N/w8/6PDmv4Na9INYjhbrX883ZyZD4rRKihfP4IslVbTChGs0CzY+waGckfqcgX4Gru8l/iILCicO7Trf0KvzZA7xmqaOAMqnUUmri0XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 177C2339;
	Fri, 23 Jan 2026 05:13:05 -0800 (PST)
Received: from e129154.arm.com (unknown [10.57.15.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F41833F632;
	Fri, 23 Jan 2026 05:13:07 -0800 (PST)
From: Beata Michalska <beata.michalska@arm.com>
To: dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Cc: abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	aliceryhl@google.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	tmgross@umich.edu,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rust: dma: allow drivers to tune max segment size
Date: Fri, 23 Jan 2026 14:13:08 +0100
Message-Id: <20260123131308.3218421-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make dma_set_max_seg_size() available to Rust so drivers can perform
standard DMA setup steps.

Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---

v2:
- Aligned safety requirements

 rust/helpers/dma.c |  5 +++++
 rust/kernel/dma.rs | 17 +++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/rust/helpers/dma.c b/rust/helpers/dma.c
index 2afa32c21c94..220b9308830f 100644
--- a/rust/helpers/dma.c
+++ b/rust/helpers/dma.c
@@ -40,3 +40,8 @@ size_t rust_helper_dma_max_mapping_size(struct device *dev)
 {
 	return dma_max_mapping_size(dev);
 }
+
+void rust_helper_dma_set_max_seg_size(struct device *dev, unsigned int size)
+{
+	dma_set_max_seg_size(dev, size);
+}
diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index acc65b1e0f24..909d56fd5118 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -85,6 +85,23 @@ unsafe fn dma_set_mask_and_coherent(&self, mask: DmaMask) -> Result {
             bindings::dma_set_mask_and_coherent(self.as_ref().as_raw(), mask.value())
         })
     }
+
+    /// Set the maximum size of a single DMA segment the device may request.
+    ///
+    /// This method is usually called once from `probe()` as soon as the device capabilities are
+    /// known.
+    ///
+    /// # Safety
+    ///
+    /// This method must not be called concurrently with any DMA allocation or mapping primitives,
+    /// such as [`CoherentAllocation::alloc_attrs`].
+    unsafe fn dma_set_max_seg_size(&self, size: u32) {
+        // SAFETY:
+        // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
+        // - The safety requirement of this function guarantees that there are no concurrent calls
+        //   to DMA allocation and mapping primitives using this parameter.
+        unsafe { bindings::dma_set_max_seg_size(self.as_ref().as_raw(), size) }
+    }
 }
 
 /// A DMA mask that holds a bitmask with the lowest `n` bits set.
-- 
2.25.1

