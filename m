Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6350538737A
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Apr 2026 23:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775172982; cv=pass; b=l+VmxFj7qjJfWXFot51TzEJgSbHZl+GN4xCz3IquzTZhiAHDPqW+f4hgoMPjiU+DEaa9/ajFY+T2++LSsdtc05olQyjr402XO8PHt0MNnxeph0CDSS0Xq0ceJmS7MSG0yYMvuBQLEU1YJ0pPF+eoXxvjmlbyE+DghUccy1MVQb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775172982; c=relaxed/simple;
	bh=gBVxShd70lyNQdv1GmW0spHM5NKiEGKwjbmHGIVGoY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uMI+tQIlpQUvSDxPSUymEZ6Ka5xnDOlXnmOlyxF8pF+BSjByEa9z5Rdoo6ofMMKi0hr7q7rum95ma8j3J7KqYN8+MGUoE7dj815JptB49uYwFwKc5wgBgnTi8xRi2pp0ktdu6r7JejazlcFTx8qMQDsoSpGTHwJEAgwln4WNP3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=XPzZyFLT; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="XPzZyFLT"
ARC-Seal: i=1; a=rsa-sha256; t=1775172959; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WkUw/SeQ+kWTL1uMsVWmUAOb8nCA9/caC6qyq809iop0wpQ1xHZzRQTsJTWeYq64hceejFAvWrnd4pF2BfsCoZnqyY306qAo12F9MSHt2vZogxIXCVM2QgI/ajSk7qkT2q9sjcN5nehbf/9oWPQ94BjBgaSwN5Ocz3Qyv2qyTFU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775172959; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qNUqpyAKWILAJzbzEd4vEaR+3iiyrt82a0kVRK/291E=; 
	b=jM9vVqQVXHGDjy9Itvj4si2D2dDttXy0Fo17sDDhi1P8n1G0EObvoeuo8pvSE4nuvabi2Zpnx9M5hHnMpWj62gLIMetpLU+GP+it6rilTehtdasHUxz1pYucSVTBwqvpokTKZ8jCMWpqTYjS/1Zx+ZckMpipLLoTtOBZQW48Krc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775172959;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=qNUqpyAKWILAJzbzEd4vEaR+3iiyrt82a0kVRK/291E=;
	b=XPzZyFLTQNOMac7Iyk5xujytOfu2CHDxwHjxkelqw9m2+CQBditipecCeKLch4iT
	+QYF2EufCoWA4d4YtwFb9Af6poCWcTR3k6qb0iZnQ2Cg4XcWtLrwWezAYYmobWSw45g
	cxIgjIBaMY3czWTygyWt5VumRSZVe4/dU51n2PG4=
Received: by mx.zohomail.com with SMTPS id 1775172957069361.29656099080864;
	Thu, 2 Apr 2026 16:35:57 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Thu, 02 Apr 2026 16:35:36 -0700
Subject: [PATCH v4 6/6] drm/tyr: Add DOORBELL_BLOCK registers
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-tyr-use-register-macro-v4-v4-6-96a8d42f8bd1@collabora.com>
References: <20260402-tyr-use-register-macro-v4-v4-0-96a8d42f8bd1@collabora.com>
In-Reply-To: <20260402-tyr-use-register-macro-v4-v4-0-96a8d42f8bd1@collabora.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Boqun Feng <boqun@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=gBVxShd70lyNQdv1GmW0spHM5NKiEGKwjbmHGIVGoY4=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJnn/ob+edAjmlC/9tOSJi5u/pBl70RebLT/8GUFy5eH+
 gF8v8/EdpSyMIhxMciKKbKctTfqEa96b6Q7/38zzBxWJpAhDFycAjARxVpGhufRynsOuX76viVq
 7fSVYttKOu9UL66bocHS9cDvR/MG01+MDC9uCNzg1Tm1Q71Tm3XVU4HphnZtXtucvSw2XbgSznX
 iGj8A
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

DOORBELL_BLOCK_n[0-63] is an array of GPU control register pages.
Each block is memory-mappable and contains a single DOORBELL register
used to trigger actions in the GPU.

Add definitions for the DOORBELL_BLOCK registers using the register! macro
so they can be used by future Tyr interfaces.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/regs.rs | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index cb8ed551411acd235fb238d3b3f0972f3a204140..274c465d096e9bc3b1faa859fd232ff545c6328e 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -1631,3 +1631,25 @@ fn from(sh: PtwShareability) -> Self {
         }
     }
 }
+
+/// This module corresponds to the DOORBELL_BLOCK_n[0-63] register pages.
+pub(crate) mod doorbell_block {
+    use kernel::register;
+
+    /// Number of doorbells available.
+    pub(crate) const NUM_DOORBELLS: usize = 64;
+
+    /// Doorbell block stride (64KiB).
+    ///
+    /// Each block occupies a full page, allowing it to be mapped
+    /// separately into a virtual address space.
+    const STRIDE: usize = 0x10000;
+
+    register! {
+        /// Doorbell request register. Write-only.
+        pub(crate) DOORBELL(u32)[NUM_DOORBELLS, stride = STRIDE] @ 0x80000 {
+            /// Doorbell set. Writing 1 triggers the doorbell.
+            0:0    ring => bool;
+        }
+    }
+}

-- 
2.53.0

