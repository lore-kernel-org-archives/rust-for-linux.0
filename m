Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795385727;
	b=PSzG+bQZbI7hDqoVYHInj04gPED6fMDyJydhFTnAugMUNd21r6TWpERBhZqho98Rnt54
	 LoH4NLwHfCNThMlE2/jJj3oETl5ITmslmHmAJ31lFtpZBPHDU45cpV0FhvDZWdVyWGxVu
	 g7G2iVrXB33bBuLg47oYs/CoFp+T0SBkuV7W5wdR8Cl8G4sPofpQjlinpKkmlt6Fcm5mV
	 uMVPO37YmypUxKjy6uHdgm+4AvSkRmoNRLdiUta3rBaB+9wlt6tETEb+4Z9qYlt1qomwd
	 pJ9RVQXh74rF+Y1mBaVKV4JAD9YMzglZ5FXBksSJ/5HYC5aOZga3THqWYcV5sS7+8tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795385727;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=vZM3377AStS27Y04nXoHhWy6DHWJngeO9CSlBGMr5JI=;
	b=rP81wrmGXjzFWVV8TgK0T2FXkXyWSgsHBoEZkb3g4AwuJD3AUUlcDRBMvNUBvWh+4/Re
	 ZhZ4zBEWTjBEusnUXbiJie4ePyXtXCcaukMjrNGXb2zJn5kquxNHtfKkcrLh6LehXaOab
	 23wiDL10clPAjOt1X2+z+qkJcQx5yvBK2quRTaXuScPZ0Y7SuP+sibrQQvWCE8+VthwgU
	 3haFz+PgSBWJOUbx6fkRX/xE4kpIdwJMfXF2g2BayHX1dfGoWYxHXQWMN19gYhUSSH3Qq
	 v3cNb4py2AvNXKWT/EA8Qjmfdtaly34/CAuT2PsMMLwXXITPsGVd2Dn1BTJMmaUJeQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=pXB7V9G4;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CE0606A31D
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 22:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43CE0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=pXB7V9G4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=vZM3377AStS27Y04nXoHhWy6DHWJngeO9CSlBGMr5JI=; t=1795385726; x=2110745726; 
	b=pXB7V9G4Dc3s36qYw5rAhc4rLu/cB6zPRA5RUSV5UexR5xOTMy0uIs3ybdHKDLrtjAldwx2ovhF
	3v/qs/Hsd2EwjnNr1vja3aQ8fMFU5StHfk0l/qUKy9lxue0M8w4PsGsyaEtwilk/cJrYDngui4bhT
	/5+aAfAKN9ZUfh+FTiwjr2x/cWTid6zbRLAnxr9TYqGVRkDJIyPUsLjsztSnXbvb48D087GOMHl5f
	X564Jkklc1yAGgum/OBmuh7a4LJ00ilL3k3T8rKwSAHM4b2IOL89lndvVPsN2YvA5PIof/yrP44lc
	GjKl4QsGNtu5bzMtJli4nV5LyNIJQp58m8aw==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xVFqB-00000002j1Q-1HuX;
	Sun, 22 Nov 2026 23:15:19 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sun, 22 Nov 2026 19:14:51 -0300
Subject: [PATCH v2 3/4] drm/panfrost: Refuse to export WB_MMAP BOs
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
Message-Id: <20261122-pan-drop-dma-buf-hooks-v2-3-2ed42dce9db6@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=MI7YG9phgHykGHgZ+HyJkwpgtRRUUDCbvOemHbq9huI=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBrA2leK5GngeGJRW6tP2BqG7ZSaOdBO3iWB5AC2
 AeVfesczUyJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCawNpXgAKCRA/8w6Kdoj6
 qvopB/4klJzDRXDOnU5kdtlWGxc8iX1iZHoHN0kxEC0zpd8I97fpHZ0qwUpbgvfZxv3xWQ07qJG
 4Tr5s0ktkWnokTvUYzOOdLG4huis3Adp8enYbUzielC3LwD5FDJ0Va+75tgyksZeapQdOvFm81x
 +BmTqg/im8tBKpVDdLbab0vJyfEjGxjNJAoGzikavBcnOT/RUqNNvSYCfvWDJGhUHFAYTl/YGnE
 ORkitDDRkzDLBWqKqunBCGysSYI0rGTeirkIXpVAvw3vimyvAdr8hrt79XnEaA0v+uTylo3sysd
 jvSpNjO8G/5+IEq1O5fm/BKhS48qNbyOYz+x3rr0PXmZYXOE
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
index 8c0facd498d7..e5546b5755f8 100644
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

