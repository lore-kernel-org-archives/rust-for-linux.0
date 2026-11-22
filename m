Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795385733;
	b=ixbHsYK71wuBgBDFudB4pwrR1vX4BNaBJ1YANB2vGyxzj0HamGBk6ioq6jEPq1ue5oJJ
	 8DnthtwHenOfZjjtkLvhU/p9JPvbO/p8I5v3OjqNOAjpQ3a4bOTuHV3oKEyDJrRygqwWC
	 +KZN6WIGD1PJFYjoO4zhnp5SDSoWoQ002DuohSb0IV+1bt824ujW+LH2lFL4FuJ1VT9PP
	 DUG6QY3aUDFqI/tEQnjAus5ijcuje+IQ2Q5UGVsusudHM6L7+tIEtRXOO7X8rr+RqnC3k
	 93dhUHH0cE+GwFANGmLqubgNPFAf/p1g6dYsQNqZx1eKZnvoUCaruRpQ3+pSac9G/kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795385733;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=em6IWM+LhxPNXSER8DBTTCbI5nQJm2m65Pe2Ze4oIM8=;
	b=mr9sL24Xnmtbylgc6fUg+3YXcWWFuujhkcT59qncaq0Cd1fWmN4scAaO/Odr3r+bky9h
	 rCj7ub3J7LEKbNZNFfwaXxgDzOBWMdPIj00mRtAqN7Gghb9KVUwWJ9QhTQpBHYLzSq7C1
	 /6nxkBHeKvwPrTkuffPbL0tOyNahVAJbi9yZp2DkS7wQEn0WpSN1bT3ALMcK9Fefkyxap
	 vCdJ/jqXmLODKGOVbGd597QWhnE9RCgHW16QXPrB/P0Ind7qJtwxC1EHCRXZxJpLUGpe4
	 6Hyj/3NReuMlqB2O7ybmNfgHrl8Rx70GSYmQn1q8X/rJXrqdErwG9wxgOy8PrXktr7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=e1QFZSzv;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2E7606A31A
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 22:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E2E7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=e1QFZSzv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=em6IWM+LhxPNXSER8DBTTCbI5nQJm2m65Pe2Ze4oIM8=; t=1795385733; x=2110745733; 
	b=e1QFZSzvRXFwnjzXuefXtb6GcDH4Sl6X/wbh102IXWFeHV71K5JjVHm2WiKtxJ7SU0wUPLHfNu+
	mO4LPa9SX4z7RD93+o05ANVO29gx2b6ky8Lg7GIYxH+WPZy95/CF/blYw/H2cvbH2wd1T0KKcmiXy
	V1F//a/LpbrgOmFOlq8sT5QWd3NI0KVGXFUTDtpJWR0jZClzkmk3uXhsDzScP4njUO3MesagW9Jg1
	tzruOra9xoy3AeMF3L7qgrOoQh0TrNGwZ/akMjwijjcZ0HBLPrcHRC9moTTTmZfgo/vC8EI6FFc1q
	uSPtHbjYW3o9pCCMfIvgbJ8ySjQ8Y/RKopCA==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xVFqH-00000002j1Q-2tTO;
	Sun, 22 Nov 2026 23:15:25 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sun, 22 Nov 2026 19:14:52 -0300
Subject: [PATCH v2 4/4] drm/panthor: Refuse to export WB_MMAP BOs
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261122-pan-drop-dma-buf-hooks-v2-4-2ed42dce9db6@igalia.com>
References: <20261122-pan-drop-dma-buf-hooks-v2-0-2ed42dce9db6@igalia.com>
In-Reply-To: <20261122-pan-drop-dma-buf-hooks-v2-0-2ed42dce9db6@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Akash Goel <akash.goel@arm.com>, 
 Karunika Choo <karunika.choo@arm.com>, 
 Lukas Zapolskas <lukas.zapolskas@arm.com>, 
 Chris Diamand <chris.diamand@arm.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2022; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=2T5m7AnEjwVDczwlWuGW9Tmdh5xr5mIrjKjHYPYDvnI=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBrA2le1u6O/XZul9pOsFgBhIdb06j8VZgXZPE4a
 OcPV42PCLWJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCawNpXgAKCRA/8w6Kdoj6
 qvkQCACxWT6NX9rZPVOhcM78V9cYzzGeLGOtnEJS/4Y9yzvrLMzCVhlvAP6RX6XXKIBr6tiBcum
 unNyEhkmbYrlOaAIxCfdSznhEa7+LGO9bH6r8O7PMzC2AP0JDY45nWK0Nxm6BpIj8/S3lZd6NZZ
 n+EfIPZE9o9KSoffv0Gl0n3Um7q4tdjBTI+NljLknuhgagD875whoib0vMKv04Ci5fMjoClNO//
 5Wmn6CTAU2NdNYaUYnCHrXo9jGofKaHSNOQm4WlILDOrWkIXpU5/qyLbWYTkjEyIIlszbWe/zrG
 dlNU1hF5WJOo9+2IvllsvvEQnm1NL5gg+Zpx7+TfrhWZ/H3V
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

When a buffer is shared through dma-buf, clients are expected to bracket
their CPU accesses with DMA_BUF_IOCTL_SYNC, but there's no way to ensure
they do. With WC mappings, there are no CPU cache lines to maintain, so
waiting on fences is enough. With WB mappings, a missed sync can leave
dirty cache lines behind, which may later be written back over data the
GPU produced for another client.

To avoid this, don't allow WB_MMAP BOs to be shared. PanVK already keeps
WB_MMAP BOs private, so this makes the kernel enforce the same policy.

Suggested-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 4 ++++
 include/uapi/drm/panthor_drm.h        | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 22b57ab6f929..730567d97f46 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -577,6 +577,10 @@ panthor_gem_prime_export(struct drm_gem_object *obj, int flags)
 	if (to_panthor_bo(obj)->exclusive_vm_root_gem)
 		return ERR_PTR(-EINVAL);
 
+	/* WB_MMAP BOs can't be shared. */
+	if (to_panthor_bo(obj)->flags & DRM_PANTHOR_BO_WB_MMAP)
+		return ERR_PTR(-EINVAL);
+
 	return drm_gem_dmabuf_export(dev, &exp_info);
 }
 
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index a2ff0f4ec691..8f3a3e680264 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -771,6 +771,8 @@ enum drm_panthor_bo_flags {
 	 * CPU map the buffer object in userspace by forcing the "Write-Back
 	 * Cacheable" cacheability attribute. The mapping otherwise uses the
 	 * "Non-Cacheable" attribute if the GPU is not IO coherent.
+	 *
+	 * Buffer objects created with this flag can't be exported.
 	 */
 	DRM_PANTHOR_BO_WB_MMAP = (1 << 1),
 };

-- 
2.56.0

