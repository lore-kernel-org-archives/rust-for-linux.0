Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795385712;
	b=k9p3+DgaL/1L7kdO0ldXNveF6PomptmJjctDzATQpdUG9qOCtvvXU9wmwOeiS4x/x/hU
	 oxyNCrfFCDwQ55j7iaKy/vO2BRJ0jbJ2oMA/0RJJtZWuIKoKG3GAQrjuVbd1XKhyPUO4Q
	 392ilUvrhfVCJmwLxXoCCYNueNsCTLJWj+YlYaa1bDegSdS6CVdTF+jIyCXnH3dH6cCzx
	 udET+LZBkFhF4A5I8zJ8mJYldSF+r/ClAvZ8WHlLVaCYpqUqNQoUMYS8VMFw6b6nueLAc
	 fczww+4uYcvkP35DNAWEmGEniIMmz6D4fgLJyhrQw6coaO7jHC3gl4u7GTUJ3QAaQQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795385712;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=jgxZ5udoHe2NUzwiDrLdSwF/Zqy5q5silmN63zU/Dts=;
	b=fU5UBE+0kl1Ys5iKK+E+GTh/4i0IxiV+jIFHLnpjD2RRC9NHjSkmHxBn1X2ZbcZOc2u4
	 qwSsEJ1Dsi+q9IYnGho/Mxtjhggf9b4w9KdvRbotk81XThG9/inWr5Y1LL129uqpxixk0
	 oX0cXoSJrT4uB0DI7E83AxDcKVAGU3+HuYie8dIlTqyYc4djFUngWcoDevFFeg1ur4dcD
	 bcBPGvm9ogXOb5MuHvf57qzO6pTkxzuOocWTUncPK4P4rMnFQ+l5Av3xTi30XAYF0eR9n
	 dY/A2Vfrn0xfNHzWrQBxLwMUmQ59XnP6qbvCwXKoZEuc7lvzYZ2wCQC0Jcemi9lHQnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=iNsMvS0m;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B7A606A31A
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 22:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05B7A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=iNsMvS0m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:From:Reply-To;
	bh=jgxZ5udoHe2NUzwiDrLdSwF/Zqy5q5silmN63zU/Dts=; t=1795385710; x=2110745710; 
	b=iNsMvS0mZJ04e1mvYpCEr+hvf3iRqZxodIXOoe3kMhlwABpVRI/gCOZNRonN9KeseDPxc2/gNha
	ZufeN+lADzPdQJr8dyEn6KHv+jlSVr///feKxHOq0O1M7R2hf5Iii5dEpCkQufm/fG6kplIycgQX2
	n/2REG55PptZRlRaUDnKsCPI/DlpSyKF90kwUyHYUH0Peijdlo2LXkJ9dX+FCG2LWlZGlvXvplrof
	r68jrgddAyLpBrajzrq85+vdm0z1HLzW3hif4a6Ss+MVoj6BuAXUwIReLHbwjnNfzMC+l6rMiHOwY
	vRXqRqzHd/T/zcc5GYvspTROZTcoJWuGhdIQ==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xVFps-00000002j1Q-0Y1Z;
	Sun, 22 Nov 2026 23:15:00 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH v2 0/4] drm/panfrost,panthor: Refuse to export WB_MMAP BOs
Date: Sun, 22 Nov 2026 19:14:48 -0300
Message-Id: <20261122-pan-drop-dma-buf-hooks-v2-0-2ed42dce9db6@igalia.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7RimxmJdcQ/DokAHJgptWiUaw
 t2tXMDle8l/f4XkorgE12KF6BZJ4ucM6lBAN9p5cCh9ZlCl0kRkMNgZ++gD9pPF9sU4en9PaC5
 cMRk+tWeCPA7Rsbz38K3JPEp6+vjZfxb62b/JhbBE3WkmrYyr2NQy2IfYY+cnaLZt+wJWNjcQv
 QAAAA==
X-Change-ID: 20261119-pan-drop-dma-buf-hooks-98f7f19f3b51
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2877; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=3lRtVBgzw6syYBRQqdWMkBG3bVDnK4PN2Zf0ux5UNxM=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBrA2ldx/XSGCfRb9QAwtp7Lb6ZPPIVNh1eJ2Ung
 dIJHJE82VWJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCawNpXQAKCRA/8w6Kdoj6
 qqPeB/9SRTOzmC23vEQnhIyQLjn5kRofzayExYFoI9fCkfS2AMULD0F3K7hcGUHXaycJjAr7NK+
 z0nVWw9fbxDbJS+W7O1zV3aQalqbeZcpv9/qDsDW6nycnaENtH5y0HMb4YYAE0bqk5Hn+A22wKw
 oVeDSL0fVLbPhXPmnKqBMV6sU/Ka0aOHAXRetcdNG1KEgg4YrN7UzxBG17Zs3tIIlqjDIlOntaR
 aKCyIBOi6PoWJXeiHfK5J5/i1VdtALrNhc0SEGd2kvFiM525+SlkZnbAkYGQTYXL+HqvQNbZtcR
 Hjt+OV72WhMX66PPvBem+ZoVSmeWhSqWy24xMQU7csf16jP4
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

This series follows up on the discussion in the V3D cached maps series
[1], about how to handle CPU-cached BOs that are shared through dma-buf.

As pointed by Faith and Boris, when a buffer is shared through dma-buf,
there's no way to ensure that a client will properly bracket their CPU
accesses with DMA_BUF_IOCTL_SYNC. With WC mappings, waiting on fences is
enough to guarantee consistency. However, with WB mappings, a missed sync
can leave dirty cache lines behind, which another client can end up
writing over.

PanVK already keeps WB_MMAP BOs private, so this series only makes the
kernel enforce the same policy on Panfrost and Panthor. As discussed in
v1, the custom dma_buf_ops are kept, as they're still needed for
IO-coherent GPUs.

- Patch 1 adds the drm_gem_shmem_sync() helper, taken from [2], with
  locking around the sgt walk and handling of unbacked/purged BOs.
- Patch 2 converts Panfrost to drm_gem_shmem_sync(). V3D will also use it
  to implement its cached maps, which I'll send in a separate series.
- Patches 3 and 4 refuse to export WB_MMAP BOs in Panfrost and Panthor.

The Panthor changes were tested locally on hardware and the series was
also tested in Mesa CI (Panfrost and Panthor) without regressions.

[1] https://lore.kernel.org/dri-devel/20261030-v3d-cached-maps-v1-0-0a6a6b363382@igalia.com/T/
[2] https://lore.kernel.org/dri-devel/20251126124455.3656651-1-boris.brezillon@collabora.com/

Best regards,
- Maíra

---
Changes in v2:

- Dropped the patches "[PATCH 3/6] drm/panfrost: Drop custom dma_buf_ops"
  and "[PATCH 6/6] drm/panthor: Drop custom dma_buf_ops" (Boris Brezillon)
- [1/4] Dropped Steven Price's R-b, as the locking changed.
- [1/4] Added a resv lock across the sgt walk, similarly to what's done in
  panthor_gem_sync() (Sashiko)
- [1/4] Stop populating pages on purged or unbacked BOs (Sashiko)
- [2/4] Move right after the drm_gem_shmem_sync() patch, add Fixes: tag
  and reword the commit message.
- Link to v1: https://lore.kernel.org/r/20261119-pan-drop-dma-buf-hooks-v1-0-6c6f1629e7f9@igalia.com

---
Faith Ekstrand (1):
      drm/shmem: Add a drm_gem_shmem_sync() helper

Maíra Canal (3):
      drm/panfrost: Use drm_gem_shmem_sync()
      drm/panfrost: Refuse to export WB_MMAP BOs
      drm/panthor: Refuse to export WB_MMAP BOs

 drivers/gpu/drm/drm_gem_shmem_helper.c  | 108 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.c |  78 +++--------------------
 drivers/gpu/drm/panthor/panthor_gem.c   |   4 ++
 include/drm/drm_gem_shmem_helper.h      |  17 +++++
 include/uapi/drm/panfrost_drm.h         |   1 +
 include/uapi/drm/panthor_drm.h          |   2 +
 6 files changed, 141 insertions(+), 69 deletions(-)
---
base-commit: ce335050d9a670491139f5e4337934c3e963e7f4
change-id: 20261119-pan-drop-dma-buf-hooks-98f7f19f3b51

