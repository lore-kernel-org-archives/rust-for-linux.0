Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498D438F645
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Apr 2026 23:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775172978; cv=pass; b=QXudBVUyi/EOOkMXg3REF0kHgKHBePVPIj8hcJl82kpQx9r67DrBxX8t2O5K4afxa0lKNh3D1NICuVnxMHRENCaiZui2dkkP2T1wvPE16q05o4aQdZurW7T0b26bdcjOyfHTJIhocrMfAOaEvn5gn+b7GKaptJOwajWMxTthnqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775172978; c=relaxed/simple;
	bh=wKSSWOYFXz7a1yn6yDk1jyRaXZphsAUllmGuXEris4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KkIuvZP6xYaoATdT2vlR/A99Dtzazq/ymwhs+q1tl7TdqlgHPbaaIKSJud6W5BeJoi7mKG+AwbR7523Xg/YN4Tpq8rziQhDuhPEBOHcOBWsOxloxw3jZTS57qMleOd1BcYleUf6HwO+xx58AgTTm4LQ/v68ElWfKe4yHL0zOvuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=KFnRvegb; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="KFnRvegb"
ARC-Seal: i=1; a=rsa-sha256; t=1775172953; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DPV1FIAN4Vb/5pAvuFla/cA1HfarqiFumMKYQasy0zTUhQ4mWzGgFr3ja134gZ1dbfTn+PV09KrvhB9sEPaxrg8JHrl0YjtAZ2rS/qoq40QuuxaC0UrgDvyJvMrGUb0JGfWaq8mkbKe1YU+NottvdgNmMOSyWgse10add7Uf9Io=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775172953; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iHRhr4pce3A8kO8K+VxssVrXsMBILGLzLMxL6/Bf+w4=; 
	b=ixWE8I9Bf8qxAfHmFzJq+aI6dFEG01Bee/Zm1qCO8ctxumIEivLXOWxlWKulwtX4pnj7mVXwpPSRZvd+tj7bAnl9pMfLmwxuwv62+HJHXstiPIZiXvhQNQlQTxM8jMtdZbdXe3Lxovh/8bbSWl3J7kyF1zvc7T0UB8xnBJxqJgI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775172953;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=iHRhr4pce3A8kO8K+VxssVrXsMBILGLzLMxL6/Bf+w4=;
	b=KFnRvegb/cDDrvAidhz6BWDay29DnFN0YyHkMtiwZPtpc6BcErGKpJcz2hpxhzIi
	XUpXK/9TeOwi6/qw//R4rHeHTEZx4KkCyaJMviD/nYpR23AO/s0/ULV5VKQrV4kV1yf
	Bhv2P9Wric94tWN2zb7ZHifsCXfqEdfEzDVIcDVk=
Received: by mx.zohomail.com with SMTPS id 1775172952628448.9453784559046;
	Thu, 2 Apr 2026 16:35:52 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Thu, 02 Apr 2026 16:35:32 -0700
Subject: [PATCH v4 2/6] drm/tyr: Print GPU_ID without filtering
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-tyr-use-register-macro-v4-v4-2-96a8d42f8bd1@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1463;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=wKSSWOYFXz7a1yn6yDk1jyRaXZphsAUllmGuXEris4U=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJnn/ob2MTZoy7zcz88i+JTL1yYt1bK3Oafixt4Lv7pag
 jyOnp3XUcrCIMbFICumyHLW3qhHvOq9ke78/80wc1iZQIYwcHEKwEQ2lDMyfFi62ufR09dvpSU9
 zt2S284nF/HJJLb+SVWa3dxI9tIodUaGg5xvqnpEnKe/+zSxdWOo+Wajl9uWntO4G5D/ePq6tCw
 NLgA=
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

Currently, Tyr prints just the upper 16 bits of the GPU_ID in the hex id
field, namely ARCH_MAJOR, ARCH_MINOR, ARCH_REV, and PRODUCT_MAJOR. The
VERSION_* fields are already printed separately as "major", "minor", and
"status".

Print the full 32-bit GPU_ID register instead of shifting it, so the hex
id reflects the complete register contents.

Before this change:
  mali-g610 id 0xa867 major 0x0 minor 0x0 status 0x5

After this change:
  mali-g610 GPU_ID 0xa8670005 major 0x0 minor 0x0 status 0x5

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/gpu.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index 8ae39137a1d190ef026351d47a6cdd89063ed0fb..1cfa24d2e58c9eddecc0adf2d95a56417f729343 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -136,9 +136,9 @@ pub(crate) fn gpu_info_log(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result
 
     dev_info!(
         dev,
-        "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
+        "mali-{} GPU_ID 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
         model_name,
-        gpu_id.into_raw() >> 16,
+        gpu_id.into_raw(),
         gpu_id.ver_major().get(),
         gpu_id.ver_minor().get(),
         gpu_id.ver_status().get()

-- 
2.53.0

