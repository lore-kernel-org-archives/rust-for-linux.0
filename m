Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EA2155C97
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 00:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311518; cv=pass; b=u8J3njBh4X+K1DY1eR8N5fLPGBVOVzUZo92bSwOWA0o57rGcNqBySdWY3uVqGv4jo2NgWDnuJFwfM5Lp3LHpO5kVGxbop7G0AYhCLm5+1d7Zx5Y5OKSR7D4jvaBeuokPnYbiEvB7mTXnkYKV1TFvAD4/hoV7bMM7+MRWDvzTCrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311518; c=relaxed/simple;
	bh=pU1cFLdqd3Rezx+ppuu3vxlcAG9yjA7Cp44Nvx/qiF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QvCpRoWQcstKgklHEPk9gtWrHtIDDAJRaVs4xB8dFoBw/uAHbe9aHciyeVZbVfoRkfRQAkJ3ut44mg4xtDFCvSAJPTodwSbUz7xnepsspNeXFNExEQ9KtL5236bM21809FFtNhDmYWrVVYxueV4C+WfyV4rcYUeRroqNEYbwc1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=PkqfE+0x; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="PkqfE+0x"
ARC-Seal: i=1; a=rsa-sha256; t=1774311494; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L0nIuqj7oZthfo1IryuxiMZ9puXFn6DBxH5O+B3JEvp0dIqYgf7a1wid3/q21627AQwONF4Z1nNB2BYwSpB9JfKB8W8rY4aoeATcHRPfjs8boNfncuj0Zh0LcYKRJ0XPc+v8swK8wK+UjkrmMWdkg4aXsmRjjYRj+pxQFJZRV3I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774311494; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Pm9EnyUSxzblFOyUOJTzAzh7WpSNW9pHBUoFj1fnCgw=; 
	b=GoH9QfmJDAwU/86weicZtJlawLWpxh8Zc6mChaWr5U1CUMxgDChUiE1lU2gZelkDqMGqZCKMpnY7lGzjxhwlwLE/nZqJJKFaXSuIpPoIrtAly0a4Ql8HO8s3Udbbt0ZUCy51sLbfdwUvhc5qmIe0pt3uY2eA+qKUu+Bpu9ZY/ik=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774311494;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Pm9EnyUSxzblFOyUOJTzAzh7WpSNW9pHBUoFj1fnCgw=;
	b=PkqfE+0xuyZOboAbnhID9bXAfsIQa7JWb3vCy5BQAesFZqvJ+S7r2lhQgj6OqMTH
	DuZhZNVttVH/6fXPE0i8ERN0OM+HwhChPzFUvzHdogUfJSJAaoLgwJv00ZU3KEPHLub
	FkzJM7SO8AIAtpxveFjDqeZo7RfERC8H/7mJeFrQ=
Received: by mx.zohomail.com with SMTPS id 1774311493650494.7177675609938;
	Mon, 23 Mar 2026 17:18:13 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Mon, 23 Mar 2026 17:18:05 -0700
Subject: [PATCH v3 03/12] drm/tyr: Set interconnect coherency during probe
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-b4-tyr-use-register-macro-v3-v3-3-a87daf9e4701@collabora.com>
References: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com>
In-Reply-To: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2276;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=pU1cFLdqd3Rezx+ppuu3vxlcAG9yjA7Cp44Nvx/qiF0=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJkHbzg4v138zGs5m2hzUl7clsP7Fc0XL3Kbwvmv9b7l7
 WPdW1rmdpSyMIhxMciKKbKctTfqEa96b6Q7/38zzBxWJpAhDFycAjCRqCaG/4liCzIrGwJadmnf
 2BG+d/1d07TKtZ94H/9dsyRlndNy6ThGhkvRNVoMyVvmMjn4nWHJurtQZLv6vuzCirxyF0Vvj6e
 +PAA=
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

Currently GpuInfo reports the interconnect coherency protocol as none
without actually reading the `COHERENCY_ENABLE` register.

Although the result is the same, write `NO_COHERENCY` to the register
during probe and then read back the register to populate the GpuInfo
struct.

This ensures that GpuInfo is populated consistently and is always as
accurate as possible by reporting the register values directly.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs | 5 +++++
 drivers/gpu/drm/tyr/gpu.rs    | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 3ebb5e08bfca342f136e8d365b1d9dcb6cc3dbca..7232d9f9547c239689dc424380109a4e5140dd84 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -136,6 +136,11 @@ fn probe(
         issue_soft_reset(pdev.as_ref(), &iomem)?;
         gpu::l2_power_on(pdev.as_ref(), &iomem)?;
 
+        let io = (*iomem).access(pdev.as_ref())?;
+        // FIXME: This needs to be set properly once we get
+        // device_get_dma_attr() properly exposed to the rust drivers.
+        io.write_reg(COHERENCY_ENABLE::zeroed().with_l2_cache_protocol_select(CoherencyMode::None));
+
         let gpu_info = GpuInfo::new(pdev.as_ref(), &iomem)?;
         gpu_info_log(pdev.as_ref(), &iomem)?;
 
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index 4a50055b415c693a89cb99dba241b21351a14149..d5240f4567ca4e763b09e015908bdc5c22276e0d 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -60,7 +60,7 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
                 io.read(TEXTURE_FEATURES::at(3)).supported_formats().get(),
             ],
             as_present: io.read(AS_PRESENT).into_raw(),
-            selected_coherency: uapi::drm_panthor_gpu_coherency_DRM_PANTHOR_GPU_COHERENCY_NONE,
+            selected_coherency: io.read(COHERENCY_ENABLE).into_raw(),
             shader_present: io.read(SHADER_PRESENT).into_raw(),
             l2_present: io.read(L2_PRESENT).into_raw(),
             tiler_present: io.read(TILER_PRESENT).into_raw(),

-- 
2.52.0

