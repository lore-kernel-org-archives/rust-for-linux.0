Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117191;
	b=mVlBYG8i1qyYPapDd3SMVOTrcGu+ygcGp1ok4f0WR6ye/VaDNnwXUhc6vJyJrPhV4R6r
	 Mne6qTREQV5lylvGAx6oQrpNU1zw1ihME4TCqJunEdFjJlCx8GrGKxTjkvZG01Ejs2dhG
	 UfBWVIi+uKVrtYM96r98niIU13MgxI98qznfWAW765JT7Okwujdcv8/XDH7CD5vcXlowT
	 aoTc80oRusHIT5YaO5NNdQouIQUTdDbl8ijC0nbMBiEkNQRcwqm4ozgKFDr5roFHmuh7D
	 IwWWu8uYUxm/vGwYpjgf1p1p6ybxqxkZu+0Xm0Az0xey7JZG94+9aqfCTZOcSBrExig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117191;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5j7UK+9n1OMxCIhXE+8rDBZi1XD1YIhndjXYoqIzT4I=;
	b=YaUOPBP47YQh6/VHDhbZfRGgx28wgcAL+9lE7jSQDGJ/X9ONQyUzxXnddo25Rg3+3Q2E
	 /L+dzM4nHgUVO97bNYlFaAJgWSWTprQ6zPufiR/Hi0pXs8UnE1rTAfV/c0NHnBftnz1Tb
	 +BuAo81p3i7FLcANru8/u0w0dp3saE1WOiASHx6iEkcqbmGa9UbedMixk9XkoA6OMAsrL
	 OCGR7/CO3s62yrm1GmtQxGlCmWnBhXDOlv8WJkswvWWxJDQ9HoNPP6fMpNV8RniOCJnJV
	 F8H15+7ekDvpr6eq9ZOMqDTDr4dvmHYfQlRSwuRZ58NprWq8H5EYVI+sqpTO92xySmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=mhZmpfKO;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCB7606A325
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 19:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BCB7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=mhZmpfKO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=5j7UK+9n1OMxCIhXE+8rDBZi1XD1YIhndjXYoqIzT4I=; t=1795117191; x=2110477191; 
	b=mhZmpfKObe0ejVpMhOQifVgHW1JZ4UGTeRA+2Fy9IdJMX+9VAQaQxRx1zo8WTJP23Rw2xrRQaGi
	G6gt8CEP3e7gA5W/FFIgKLbEi5MbiSeZnVryePVYdhxPZkgbRnz1Q0C0U+5WXceugMf97JrDTloIZ
	h/OYH1lvrW2HgdAUhsYYT0b9oFRtlmPVo0FNa+K2EmmAolJyTtWWsDxHQn/DixpZ9W71wjJlouh3J
	4O/HD8M7osCwmQWQSEsLmuKhSRKC/lq4DtSXfhGA3xN0OfPxrXt6g8+Dliqzm05Rz/1QsW7Cr2ISw
	vzbzSksOYn1Ese8Awkrt23tFeQp32r4d/HLQ==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xU7z1-00000001bU7-0FUH;
	Thu, 19 Nov 2026 20:39:47 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 19 Nov 2026 16:38:17 -0300
Subject: [PATCH 2/6] drm/panfrost: Refuse to export WB_MMAP BOs
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
Message-Id: <20261119-pan-drop-dma-buf-hooks-v1-2-6c6f1629e7f9@igalia.com>
References: <20261119-pan-drop-dma-buf-hooks-v1-0-6c6f1629e7f9@igalia.com>
In-Reply-To: <20261119-pan-drop-dma-buf-hooks-v1-0-6c6f1629e7f9@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=kHsCu07vLYzJBS9hhIvAPFACqFoR5A30TlP5GeUsWb0=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBq/1BvVDYsTX+xABd9QtrYqul92NU0shGKhVSvA
 asEf8U+WqSJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCav9QbwAKCRA/8w6Kdoj6
 qlnkCACRRVrN6ceiQIeqLVw+M6hD/XrKRcjFYlJCSFylxu7outx5oqhN7vafO9+yEK6e7cIleKc
 a9dogPW33pdi8uMlCPWBNjTsAF75DSkdF4NKXWUI9EjA8wcOI89Wtcu/y4KEYG3zQqphWrs6fDy
 pXv6wkDv9Yg1nK+QYXFcukTiz1L8TB7p0lQtyC8nfpVLQPxwxSjXWH+r83tco8xqgI9zr9X6nDp
 +SaAeyGnFHYtnruwUi8sWPbE76RgxOOAFqcx8pACzd6Dgx9uy4VUQWlmIDuWvhZjhbMCHPYvUzX
 dA+0RxVybWFJNU/kaHBOiI5SBcdMnWxBW4IhEkKCtDDgld73
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

When a buffer is shared through dma-buf, clients are expected to bracket
their CPU accesses with DMA_BUF_IOCTL_SYNC, but there's no way to ensure
they do. With WC mappings, there are no CPU cache lines to maintain, so
waiting on fences is enough. With WB mappings, a missed sync can leave
dirty cache lines behind, which may later be written back over data the
GPU produced for another client.

To avoid this, don't allow WB_MMAP BOs to be shared. PanVK already keeps
WB_MMAP BOs private, so this makes the kernel follow the same policy.

Suggested-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/panfrost/panfrost_gem.c | 4 ++++
 include/uapi/drm/panfrost_drm.h         | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 518f24549b9d..c7160223ea17 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -391,6 +391,10 @@ panfrost_gem_prime_export(struct drm_gem_object *obj, int flags)
 		.resv = obj->resv,
 	};
 
+	/* WB_MMAP BOs can't be shared. */
+	if (to_panfrost_bo(obj)->wb_mmap)
+		return ERR_PTR(-EINVAL);
+
 	return drm_gem_dmabuf_export(dev, &exp_info);
 }
 
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index 7831c48c59c0..2cc44591e82b 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -126,6 +126,7 @@ struct drm_panfrost_wait_bo {
 
 /* Valid flags to pass to drm_panfrost_create_bo.
  * PANFROST_BO_WB_MMAP can't be set if PANFROST_BO_HEAP is.
+ * Also, PANFROST_BO_WB_MMAP BOs can't be exported.
  */
 #define PANFROST_BO_NOEXEC	1
 #define PANFROST_BO_HEAP	2

-- 
2.56.0

