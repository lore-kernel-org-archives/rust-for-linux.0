Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828397;
	b=0GprgOUmozRRAd2OBwjOOMPWeVn2sZs7BW5GiUdNt4RxsgH4+ESP7N62VVT2IcZ77TJy
	 o7BUBEKpfSy/iVwrIQ1ZmQ7ribkqZiQzAr0A92tlc30W/qFrOy3px72BWuJdHiy6D3LyD
	 L2aF53LAT7JDQeJCLkiv+piU+HCQ6VXb1H7Vq5iKU/UptSUE/0SkICWLAG/mXb5F1LMHR
	 znNDO7SB9a5esKOZ59vsffp4dVEA0gaCqsliv65WWvY718aL1ZEHf64GnIFE9laKNklS8
	 vmCNMo2OtxG4ix0ROaFytwzdu5aP10H46lTAvXiKHQi4/Zbgd3/8dpSl1JWuH51MN7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828397;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qIaTfuARVhu5+16LAYFU2L8idYNifkeYuXFycavDtQU=;
	b=hU4S7OEmq1LXD14S5LhagAoEipOb8PRo7sodYrns6THY+UkVgRgmIcD/FQWJf1rBQQpc
	 bDuAS6UtVZEqVHAq2TbgxFHNIk7n6NhoNDZs3isncXL5dr0OIW5hP2iNKjFtO+6E9Od8D
	 iSmdv1bixf4P0adtPKNhRQ+MaLIfR55i3eFYPMCEHT/KoCjhoN72svZpfBfuvFK0SWETR
	 NpRR+/gG4HpWTUboiKS2+0ty2rSYYktHmgpl3RBEMChLXVkZstx24k1UEZK8XBZjneQrx
	 o351bA/PYBBPEgvEDS5Lf9d/WxQ0p1HO35lCF+yeQSHU3ZrnV1WHU5ZjJ+fXeE28tHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="msp/g4el";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C337606E4B1;
	Mon, 16 Nov 2026 11:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C337606E4B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=msp/g4el
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD5A01A25;
	Mon, 16 Nov 2026 03:26:33 -0800 (PST)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D30D3F632;
	Mon, 16 Nov 2026 03:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794828396; bh=djCV46gFXSUjJDLnpEYs3SS+/BUK3Xz8k+mzlUb3qnI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=msp/g4elUBPDMpMIQurlyEfGRyu7yDUHESwjbVZPZy6BK6UAJ8aFjKU+94aGIpaQX
	 RJ0bgxPMu8MxFxt2aw4QuTm95hgMfXrjWcRcQVNY10MHQ1iMmVhLRso4ZjDApAwWTP
	 iZeGZlYC435DNG0ZYUbvVbQyk8GmtCqqyY0UPqW0=
From: Ketil Johnsen <ketil.johnsen@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Akash Goel <akash.goel@arm.com>,
	Karunika Choo <karunika.choo@arm.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>,
	Chris Diamand <chris.diamand@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Ketil Johnsen <ketil.johnsen@arm.com>
Subject: [PATCH v5 04/13] drm/panthor: Don't allocate protm_suspend_buf
Date: Mon, 16 Nov 2026 12:25:52 +0100
Message-ID: <20261116112601.3483649-5-ketil.johnsen@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116112601.3483649-1-ketil.johnsen@arm.com>
References: <20261116112601.3483649-1-ketil.johnsen@arm.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PROTM suspend buffer is only needed if the group is going to
use PROTM in the first place, so let's not assume we need one until
we're being asked to.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index c75be18d24274..e67fd0fe20144 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3641,9 +3641,11 @@ static void add_group_kbo_sizes(struct panthor_device *ptdev,
 	if (drm_WARN_ON(&ptdev->base, ptdev != group->ptdev))
 		return;
 
-	group->fdinfo.kbo_sizes += group->suspend_buf->obj->size;
-	group->fdinfo.kbo_sizes += group->protm_suspend_buf->obj->size;
 	group->fdinfo.kbo_sizes += group->syncobjs->obj->size;
+	group->fdinfo.kbo_sizes += group->suspend_buf->obj->size;
+
+	if (group->protm_suspend_buf)
+		group->fdinfo.kbo_sizes += group->protm_suspend_buf->obj->size;
 
 	for (i = 0; i < group->queue_count; i++) {
 		queue =	group->queues[i];
@@ -3724,14 +3726,6 @@ int panthor_group_create(struct drm_file *file,
 		goto err_put_group;
 	}
 
-	suspend_size = csg_iface->control->protm_suspend_size;
-	group->protm_suspend_buf = panthor_fw_alloc_suspend_buf_mem(ptdev, suspend_size);
-	if (IS_ERR(group->protm_suspend_buf)) {
-		ret = PTR_ERR(group->protm_suspend_buf);
-		group->protm_suspend_buf = NULL;
-		goto err_put_group;
-	}
-
 	group->syncobjs = panthor_kernel_bo_create(ptdev, group->vm,
 						   group_args->queues.count *
 						   sizeof(struct panthor_syncobj_64b),
-- 
2.43.0

