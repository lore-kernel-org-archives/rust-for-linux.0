Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ECC29D291
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Apr 2026 17:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775757148; cv=pass; b=tujpezfgMoQZ+O5fMBq/kWEz3W68VLOGb9C2R3+Fq7w3bIy5phM+bIsUAqAgc6tETjXSv1tBQ0A/rq97VDaLUbh5/PFWd3mpD00WFVMt2PX1hSlyvyvzUGTQgwwdPGND9P8ewZT4bfJ7ytfjyI0KVtwDSOCV7XTwYN8/pDGzY5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775757148; c=relaxed/simple;
	bh=d4l/3Epx6pE4G9o3/eNDfGrP63emiH8EtfgqnWxN2H0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E6ovvu4t5ohjzxBCn6Sj8kuR3rwrCJaHrERG6T1zChce5OLl15gnwUSmXLNhKQEuW3tXjd1UmjT0VJjFKJnvbW6fyp8CpdgmGqkh7pM4MMZW6yRZJNRfpfGP1td+1lUypt4RpEK6zusEQMeZlkrXq0Q+Lml0jfEqvBRTnKNfOVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=KylzBs1d; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="KylzBs1d"
ARC-Seal: i=1; a=rsa-sha256; t=1775757125; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W0LuAOgWbNRjlJc6UTnLm1dwkvQHFvLOiILhX3nl55VLLNHvyzqXFzo5zjbR78713DOBrLhuQQbF2nNBOQNIu6tDnQDfyWXHmLVhS+zPhIaLtt9Yu+Nvr5MStlYps2v/ceAjnkFzLHfmf2+rHKAhl7NPjvcvCrxmQ9O6E24petw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775757125; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KHBWJchfvWdlkmSPosEsyPvMn8LKqWxnk8XviCbpp6g=; 
	b=hUvPodtmRJB0uMu7ypjHKfaHCs1ZTWEj5SiQYooNfvdD7cpvFQDadtx02nXPCMLiufldKiF7r/JM60JraYUi8vXDdUQptBvJOIi8RYqh/+/w3MCy6ipJ/UBglH0wCnUbIPp/Ve5ga6Kwp7HbGhbDuBVqz6NXabmPLyf2Z7yVFPc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775757125;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=KHBWJchfvWdlkmSPosEsyPvMn8LKqWxnk8XviCbpp6g=;
	b=KylzBs1d9zQPkXRBH7ZJAnq7lW4ZzqZqWF8Z4WjxMzHvEChnpZMqZ0qeVUm1xQBG
	x4om3MfHHRdGG+tZBb/s2/SdS63rRA8MY67SsmZ72LHOwubcv5PZJvMc5Xj6w5i/LLF
	N224LNqZITc6x284cusA0G4fjDB3xi/nmtqFFtvE=
Received: by mx.zohomail.com with SMTPS id 1775757123546637.5513776054247;
	Thu, 9 Apr 2026 10:52:03 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Thu, 09 Apr 2026 10:51:25 -0700
Subject: [PATCH v5 2/6] drm/tyr: Print GPU_ID without filtering
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-b4-tyr-use-register-macro-v5-v5-2-8abfff8a0204@collabora.com>
References: <20260409-b4-tyr-use-register-macro-v5-v5-0-8abfff8a0204@collabora.com>
In-Reply-To: <20260409-b4-tyr-use-register-macro-v5-v5-0-8abfff8a0204@collabora.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1412;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=d4l/3Epx6pE4G9o3/eNDfGrP63emiH8EtfgqnWxN2H0=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJnXnzvcMqt+wne7IbVAu2f/mq8nNVXykpdHeE6bzp6dd
 mHuDLmcjlIWBjEuBlkxRZaz9kY94lXvjXTn/2+GmcPKBDKEgYtTACbyWIuRoWX9XqZXZ6d/WpLH
 3WHu/pbf/8uUBNuZLmJ3mm1sF+hG/2JkuF8X3xChGlX4+uPan1x7jhyQ9A+etWDBee6/1X/6N8+
 9zQgA
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
index 1e1e4103c575..652556026f50 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -97,9 +97,9 @@ pub(crate) fn log(&self, dev: &Device<Bound>) {
 
         dev_info!(
             dev,
-            "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
+            "mali-{} GPU_ID 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
             model_name,
-            gpu_id.into_raw() >> 16,
+            gpu_id.into_raw(),
             gpu_id.ver_major().get(),
             gpu_id.ver_minor().get(),
             gpu_id.ver_status().get()

-- 
2.53.0

