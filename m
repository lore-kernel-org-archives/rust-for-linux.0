Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E040A35F8C7;
	Wed, 28 Jan 2026 13:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769608398; cv=none; b=WbFm36Ks3MbjJDl5COBPU21UdrEN54iChiK2SqnBCg4dezjhdeB/x2iLU3uPRqqK3fGYiYJoZleAHU3atx5AqJG3vV3aanSb9AjjlZPXBzHQlpcGH3D7P8EapFnVDdDNfj7F2czsGOkx3nWVYpZFE0sOsBAB3TzIl1pVOIfQdLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769608398; c=relaxed/simple;
	bh=UFMFxafXbb+wMFzAaedZVqVkavn2RDSNTJOq7voRACE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NRSXRkiFZEnZUOiM03Bxbce0zx/XFnjVJW3ABi1ZT3cFRsTdxaf9UFKKO7OrvYZ3XOTkILViZWO2z3BReuUxPFC4YL5cvgrRFu/DsHAZC10vcOItk8dy85CsFpo8mvRJi0zS+UUL+XvH0LLw/+dEgGjK8Iv2zKklIplNpO4iSu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8102E1515;
	Wed, 28 Jan 2026 05:53:09 -0800 (PST)
Received: from e129154.arm.com (unknown [10.57.16.176])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F6D33F5CA;
	Wed, 28 Jan 2026 05:53:11 -0800 (PST)
From: Beata Michalska <beata.michalska@arm.com>
To: dakr@kernel.org,
	ojeda@kernel.org,
	gary@garyguo.net,
	rust-for-linux@vger.kernel.org,
	dirk.behme@gmail.com
Cc: abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	aliceryhl@google.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	boqun.feng@gmail.com,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	tmgross@umich.edu,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] rust: dma: allow drivers to tune max segment size
Date: Wed, 28 Jan 2026 14:53:20 +0100
Message-Id: <20260128135320.689046-1-beata.michalska@arm.com>
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
Apologies for delay.

v3:
- Added __rust_helper

v2:
- Aligned safety requirements

 rust/helpers/dma.c |  6 ++++++
 rust/kernel/dma.rs | 17 +++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/rust/helpers/dma.c b/rust/helpers/dma.c
index e7defeecda71..20232ac64850 100644
--- a/rust/helpers/dma.c
+++ b/rust/helpers/dma.c
@@ -43,3 +43,9 @@ size_t rust_helper_dma_max_mapping_size(struct device *dev)
 {
 	return dma_max_mapping_size(dev);
 }
+
+__rust_helper void rust_helper_dma_set_max_seg_size(struct device *dev,
+						    unsigned int size)
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

