Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117182;
	b=sHU/7EcuecgNKeybuOJCeZFF57vmYXyPYLW3KG+s+Kf3+zYl/z2BZo7oVmBPaHjPHzES
	 g2NYSqAx2ADa0MqpANUUvjK1MEK1Z5dS+rcO0d8P7GfvSC7q4/rdN9aD+1KcK3Zqojij3
	 C4w7pWUSaYXHwuBxLqCWXnN2/y5I1B0F9aPT2xE6F5w2V60w3kBvluoSNfh+8Tr15dWvA
	 kascdsLJg3kg3+eVjacHjJNCs1Xk+GaZu87LvTVR3bazlsP+8wUph58xlqH+VYwd9xxnA
	 lhGNcdPeAarN4jwipz1NOq3UWQ3eIgnA2aF9rfi67XR92DI/MNYbUcLJFBtIRgrjpfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117182;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ULkJYcH9aKX38zM3HpAXEa6rCmb4BClr4apdW+tJtI4=;
	b=MA7/vpCQsOKJqwSBH4/FzEYOBDKdbSsGeSmH3k3W0MbMxpeEOe3n9tm7jiMGc4GNbwZx
	 2ul93asLHGuhFsSVyax1ZXMgVdo3tC16nx9/nTaiVzb7akMAhXn4FGMSahW7b7qMex6d1
	 fH/Jiga3Fqr6yOiVWa2KD6sjJp6Lwg2y1iER3V9O7mwoBO914Bqxrcwm5NGwpPLAfGgYP
	 tKCUU/kuYKrlUa7tBURtONE0r0oBG/3sHFtqGPF0pw1qFXSCri45kTgnd/8xop1XYo1un
	 1/Tik+Z7JXHqb9wGC7czlYODjIxxAoX9Uz0YBjutU+7Aa2O0rM7WUg324viTuPly2hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=bPqbukYu;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D14606A330
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 19:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5D14606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=bPqbukYu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:From:Reply-To;
	bh=ULkJYcH9aKX38zM3HpAXEa6rCmb4BClr4apdW+tJtI4=; t=1795117180; x=2110477180; 
	b=bPqbukYusC0QXWOKt/PlNb9t2GUSP2QXkbWU5t1cXISs+pmpGC3yzYlG77yhdpy4VYxaH76j8Gq
	s5Dh59C+c7Jh0bopZTa9q7Dnvdg3aNAu7JTwdew/i5Bm/rKE/qdWv9BwDVFoWk0xPW7OJTfnQeHS8
	rCMmvaTn6TMAkk7TkS2zbe01wcEYgm7aVLenb2bz6dRFQMhjSircccElez5FBqGjv4zE3bGCRvAkL
	kkmOR9nvinee1HjX2wFojyoKVSUD0M9ttB7lA1OaW9ZdAovAddVSBmz5V0ZR1TFqKjHjveumYoiVn
	0562JcAfFtkt+W82lwnUJMXQ2QYFnDT6q0hg==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xU7yn-00000001bU7-3OuI;
	Thu, 19 Nov 2026 20:39:34 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH 0/6] drm/panfrost,panthor: Refuse to export WB_MMAP BOs
Date: Thu, 19 Nov 2026 16:38:15 -0300
Message-Id: <20261119-pan-drop-dma-buf-hooks-v1-0-6c6f1629e7f9@igalia.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMAxA0atI1hMwyqj1KoOLOk00iG1pUQTx7
 lNm+Rb/35A5KWcYqxsSn5o1+AJ6VfBdrV8Y1RVDUzcdERmM1qNLIaLbLc6H4BrCltEM0gsZaec
 3QYljYtHrP/5Mz/MDF6an9mgAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3189; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=Yan1nsrMqmbjshJ/S9xZKYqQsyvHOFJvhtMSHFfwIc4=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBq/1BuykThLrJSkVzBudGsmGQLAGH/H/zqu0828
 SCU3m9xITuJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCav9QbgAKCRA/8w6Kdoj6
 qtbJCADOY2NOpCkpYyH5j6uRDYrwDy6dE8kZTIk1ipIDOec+WitxSyOD30ruHwg6INwqCCnjoG4
 Jhu9dp6AMa+MrWrIIBdD8ZYhzVZGkfcbpLJBL0OFDP0WCRoN86JojNyd3YObbvJ14J1lHJamCKc
 J+bOcgQzl7H0wsqpkgmW6YAh6i0gc0B0FopwSls9MxCPB9oiMXFiGdJUFe4SC3cjfrfzDlq2V1s
 DfSJE5mla//JR4fmNs+BZohGjXeVDIOAYaxv+S2uQ3J4rYtzPi0DINb8jEtQ9uiJ4Hi34Qb/Hba
 sMYcXnC32c4vyv/5zTH/UXfBN0Xuw2h27g9hi+ZFtSFngNEt
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
kernel enforce the same policy on Panfrost and Panthor. As WB_MMAP BOs can
no longer be exported, the custom dma_buf_ops providing begin/end_cpu_access()
are no longer needed for them and are replaced by the default PRIME ops.

- Patch 1 adds the drm_gem_shmem_sync() helper, taken from [2].
- Patches 2 and 5 refuse to export WB_MMAP BOs in Panfrost and Panthor.
- Patches 3 and 6 drop the custom dma_buf_ops from Panfrost and Panthor.
- Patch 4 converts Panfrost to drm_gem_shmem_sync(). V3D will also use it
  to implement its cached maps, which I'll send in a separate series.

Patches 3 and 6 need some extra attention as they aren't a no-op on
IO-coherent GPUs. In this case, all BOs are CPU-mapped WB, and the custom
begin/end_cpu_access() could be used to sync the mappings of non-coherent
importers.

However, I decided to send these patches either way because they only
restore the behavior prior to commits 3ae6637378e6 and 925ad0c26dd8, which
is what we discussed in [1] (IIUC). Also, Mesa writes through the GEM mmap
without DMA_BUF_IOCTL_SYNC, so it never relied on these hooks anyway.

Still, if you think this would be problematic, I can drop patches 3 and 6.

The Panthor changes were tested on hardware, but Panfrost changes were
only compile-tested.

[1] https://lore.kernel.org/dri-devel/20261030-v3d-cached-maps-v1-0-0a6a6b363382@igalia.com/T/
[2] https://lore.kernel.org/dri-devel/20251126124455.3656651-1-boris.brezillon@collabora.com/

Best regards,
- Maíra

---
Faith Ekstrand (1):
      drm/shmem: Add a drm_gem_shmem_sync() helper

Maíra Canal (5):
      drm/panfrost: Refuse to export WB_MMAP BOs
      drm/panfrost: Drop custom dma_buf_ops
      drm/panfrost: Use drm_gem_shmem_sync()
      drm/panthor: Refuse to export WB_MMAP BOs
      drm/panthor: Drop custom dma_buf_ops

 drivers/gpu/drm/drm_gem_shmem_helper.c  |  93 +++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c |   1 -
 drivers/gpu/drm/panfrost/panfrost_gem.c | 194 ++------------------------------
 drivers/gpu/drm/panfrost/panfrost_gem.h |   3 -
 drivers/gpu/drm/panthor/panthor_drv.c   |   1 -
 drivers/gpu/drm/panthor/panthor_gem.c   | 120 +-------------------
 drivers/gpu/drm/panthor/panthor_gem.h   |   4 -
 include/drm/drm_gem_shmem_helper.h      |  17 +++
 include/uapi/drm/panfrost_drm.h         |   1 +
 include/uapi/drm/panthor_drm.h          |   2 +
 10 files changed, 126 insertions(+), 310 deletions(-)
---
base-commit: 8e2afcd2b57990465f132367fd8fdc2e55c1adad
change-id: 20261119-pan-drop-dma-buf-hooks-98f7f19f3b51

