Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11B035F5E9
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 23:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773270290; cv=pass; b=ZvlVh5LLaSja5ZZ+9zgFwdfre0Sawcv4wDtON97MyECtvaOe35uqV5MsFjanAYNz0TAW/qsn3sd8tpaibXpklTyIEWG13O4Yutn1xJ50q78NNfsgLoO94HPcrLVHLdwz7r8rBGm7C6yJSk9rLeClDS6SAbXFZkDEcOxQoYpXwj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773270290; c=relaxed/simple;
	bh=GG9ZzQ0Fe1W2F4OIl/Vw9ZycSnecLTCdZnBe6sSq+1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bt4uFDgIaFnDOcyIPxqATpMkB5zNMmQnRHToRUyo3dWBp3deQv3S2UYRz4xz3//tklXk5qOxlmnBBDdX/8XmnOhwzMzOCqhDKL3gIpggb7ZTL+j8s+R+RxpH6+U266keQTF9bt5HDeIoUijB4qTTgRtpy/LHIyRzb07cCnbHZAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=SKz7WF4H; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="SKz7WF4H"
ARC-Seal: i=1; a=rsa-sha256; t=1773270266; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=crBFxrgCnX1J1J+I7FIbXrr0mr+YoUjLzLTqipDMhqrjkNRzmSfeexH3UtcWaCZjfMtdyBGbo+5pw7Lg6UuCBr9Ubsvr4Y2ibNNha/yGynpW6KD0GdY12K5xdwS8jlMCjBc8WxBwrS4AXzzBNRou36WiOFFFeGyowpf827q9mDw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773270266; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DULEj4avunopPGsbe5mHvV4voJWq2nHRng0NIvyllBA=; 
	b=divx+LR1DMu5UtVmmTtH6h1cske5scXbMZw2IATR0/yNWOrRZ4fzUOmlegH7jGAX1oaPyaIJysw02xOMscy9vAxWEusrzeFm+7kicRTxxYcCFupq2RD2iJmon3kJr7B5p19HWKU6igeUosjsAlYH1zx/WWIBgieqx+1VA48n00s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773270266;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=DULEj4avunopPGsbe5mHvV4voJWq2nHRng0NIvyllBA=;
	b=SKz7WF4H91OiLZWQUvtoBFJZB/R6W7q4lebuWSyHuUUodB62MGb9qYV3plwLNlqo
	bpWbF+/62P5gRravJ2+a15bStpTo28zjMS804vage1ukxoi4O4T///6QKVRP8Uoi4AQ
	fWr6oHusmdfu2LfUI1YFOsTtRjGQY1RxbwpA39Hc=
Received: by mx.zohomail.com with SMTPS id 1773270264027183.2464845033287;
	Wed, 11 Mar 2026 16:04:24 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Wed, 11 Mar 2026 16:03:59 -0700
Subject: [PATCH v2 2/5] drm/tyr: Set interconnect coherency during probe
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-b4-tyr-use-register-macro-v2-v2-2-b936d9eb8f51@collabora.com>
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

Currently GpuInfo reports the interconnect coherency protocol as none
without actually reading the `COHERENCY_ENABLE` register.

Although the result is the same, write `NO_COHERENCY` to the register
during probe and then read back the register to populate the GpuInfo
struct.

This ensures that GpuInfo is populated consistently and is always as
accurate as possible by reporting the register values directly.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs | 6 ++++++
 drivers/gpu/drm/tyr/gpu.rs    | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 10c212a3a01910858f02c6d637edff8a263f017b..b2147c305bacf081caf028866811b902cf7b9182 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -138,6 +138,12 @@ fn probe(
         issue_soft_reset(pdev.as_ref(), &iomem)?;
         gpu::l2_power_on(pdev.as_ref(), &iomem)?;
 
+        let io = (*iomem).access(pdev.as_ref())?;
+        io.write_val(
+            COHERENCY_ENABLE::zeroed()
+                .with_const_l2_cache_protocol_select::<{ COHERENCY_ENABLE::NO_COHERENCY }>(),
+        );
+
         let gpu_info = GpuInfo::new(pdev.as_ref(), &iomem)?;
         gpu_info_log(pdev.as_ref(), &iomem)?;
 
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index 51a250570f375e12bb0f7fb32f047bf219ef9b70..9f572ccffd11a7ea1872a1e4e1c88f78fd6cad29 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -55,7 +55,7 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
             // TODO: Add texture_features_{1,2,3}.
             texture_features: [io.read(TEXTURE_FEATURES_0).into_raw(), 0, 0, 0],
             as_present: io.read(AS_PRESENT).into_raw(),
-            selected_coherency: uapi::drm_panthor_gpu_coherency_DRM_PANTHOR_GPU_COHERENCY_NONE,
+            selected_coherency: io.read(COHERENCY_ENABLE).into_raw(),
             shader_present: io.read(SHADER_PRESENT).into_raw(),
             l2_present: io.read(L2_PRESENT).into_raw(),
             tiler_present: io.read(TILER_PRESENT).into_raw(),

-- 
2.52.0

