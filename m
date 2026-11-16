Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828429;
	b=QyTQn9DjTd5tAH+bJDZ6J0TXvX1cy5U4jLdQXTzLBnFcFbuns3/fXRc/Y6iwmBgJxrUE
	 oudbXmolm7scvkHOgyQJj8wmQ4r77EENX1ZxwjeaxqVTFSN+ZAPV/kPzfvNKRTPFWjFKJ
	 aV7sCCqONU7qAh9Q0o+xM4pkafLkMFjHIbsWGAK3XhxoXRp8O6Rd87PX5ig5ESy6Mp/WB
	 Cr8kntcdiOj/IjakW7D3WoRNms5FtCXtuMebheGouMclVfkgmOZZ4T25JPIe7YellJz7R
	 TkZjq5x+9FqLtVAiEwwCI+qXziDXtku4TPWEGTwTLpEtj9ismzpQFgDJQZQOcyHxwsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828429;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YnNVmgu1mfec1zWYe/sonX0EgomUMo31HZX5ar0xsrs=;
	b=CJCqLBrJ6K5atForF5HlCruzOKAErwAtBmJqMa91rungDoX95niI7i5LsrINo6Vee1lI
	 Ol8HyRIwsCsv7FG9dMdw5UDBiH9v1K0unI5FOeA/chlJIuF0ul/JhJxE2+ZdqGRxaFlZY
	 gVKuMns7PNW4LsmX3/mKx+oQD2JFXlnYh6U42z9iqwXaXoyMKGgEP1hVOKcFYTdsTY7Wy
	 Fm1FpKREcCBY1FYdGWyKCpPzu0MJFQg/dj/lcbZDgQEolRHjhTrXQZfz1Ho0xlIFMbaZN
	 h3hoJH0PBc4jHQzzALmlCvV/oUDXYVeiv1Tq1RRcAsnLXZKugEDuFEjMbGj3+4YRBXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=q76+CFfc;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2B6606AB60;
	Mon, 16 Nov 2026 11:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A2B6606AB60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=q76+CFfc
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD00C1A25;
	Mon, 16 Nov 2026 03:27:04 -0800 (PST)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E1863F632;
	Mon, 16 Nov 2026 03:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794828427; bh=MdKCXYsgJ3Qtx0sNdDusj0AcCwYWMsPWaTok24GlYPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q76+CFfcittRdxlqQcWP3cGfA5/JTDyBRUATJL7kPhm82+kDH8ueZO4uvYDLeL18O
	 Er3gTaIg0ORGp0GlLGXqspSxuqRGowVk3Tne0oUJotqishBsdySQDdGlq2RnwhShGy
	 P6fLVYDsQYurcHGox51Kdr60uNatzBWVChpNLGWo=
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
Subject: [PATCH v5 12/13] drm/panthor: Protm support for groups
Date: Mon, 16 Nov 2026 12:26:00 +0100
Message-ID: <20261116112601.3483649-13-ketil.johnsen@arm.com>
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

From: Boris Brezillon <boris.brezillon@collabora.com>

Extends struct drm_panthor_group_create to allow user provided protm
suspend buffer. This is needed for protm execution with this group.

Make use of the user supplied suspend buffer (import).

Allow PROT_REGION instruction for groups which provided protm
suspend buffer.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

---

v5:
- Removed unused #define
- Minor formating changes
- Moved caching of suspend buf sizes to a separate patch

v4:
- First version of this change as a separate commit
---
 drivers/gpu/drm/panthor/panthor_sched.c | 50 +++++++++++++++++++++----
 include/uapi/drm/panthor_drm.h          | 10 ++++-
 2 files changed, 51 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 9c78f04d4f30a..02726cbcce3ca 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1456,10 +1456,15 @@ cs_slot_process_protm_pending_event_locked(struct panthor_device *ptdev,
 	if (!group)
 		return;
 
-	/* Do not allow user space work to switch into protected mode, as we
-	 * do not fully support this quite yet.
+	/* Do not allow user space work to switch into protected mode if we
+	 * do not support protected mode on this device.
+	 * User space should query (and init) this support before attempting
+	 * to use such GPU instructions.
 	 */
-	atomic_or(BIT(cs_id), &group->fatal_queues);
+	if (group->protm_suspend_buf)
+		atomic_or(BIT(cs_id), &group->protm_pending_queues);
+	else
+		atomic_or(BIT(cs_id), &group->fatal_queues);
 
 	sched_queue_delayed_work(sched, tick, 0);
 }
@@ -4056,14 +4061,10 @@ int panthor_group_create(struct drm_file *file,
 	struct panthor_device *ptdev = pfile->ptdev;
 	struct panthor_group_pool *gpool = pfile->groups;
 	struct panthor_scheduler *sched = ptdev->scheduler;
-	struct panthor_fw_csg_iface *csg_iface = panthor_fw_get_csg_iface(ptdev, 0);
 	struct panthor_group *group = NULL;
 	u32 gid, i;
 	int ret;
 
-	if (group_args->pad)
-		return -EINVAL;
-
 	if (group_args->priority >= PANTHOR_CSG_PRIORITY_COUNT)
 		return -EINVAL;
 
@@ -4117,6 +4118,41 @@ int panthor_group_create(struct drm_file *file,
 		goto err_put_group;
 	}
 
+	if (group_args->protected_suspend_bo_handle) {
+		struct drm_gem_object *obj;
+
+		/* Read a correct snapshot of the state */
+		if (!panthor_fw_protm_is_inited(ptdev)) {
+			ret = -EINVAL;
+			goto err_put_group;
+		}
+
+		obj = drm_gem_object_lookup(file, group_args->protected_suspend_bo_handle);
+		if (!obj) {
+			ret = -ENOENT;
+			goto err_put_group;
+		}
+
+		if (obj->size < panthor_fw_protm_suspend_size(ptdev)) {
+			drm_gem_object_put(obj);
+			ret = -EINVAL;
+			goto err_put_group;
+		}
+
+		group->protm_suspend_buf =
+			panthor_kernel_bo_create_from_gem(ptdev, panthor_fw_vm(ptdev),
+							  to_panthor_bo(obj),
+							  DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
+							  PANTHOR_VM_KERNEL_AUTO_VA,
+							  panthor_fw_protm_suspend_size(ptdev));
+		drm_gem_object_put(obj);
+		if (IS_ERR(group->protm_suspend_buf)) {
+			ret = PTR_ERR(group->protm_suspend_buf);
+			group->protm_suspend_buf = NULL;
+			goto err_put_group;
+		}
+	}
+
 	group->syncobjs = panthor_kernel_bo_create(ptdev, group->vm,
 						   group_args->queues.count *
 						   sizeof(struct panthor_syncobj_64b),
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index d2d21e3e6bb39..a0ed16041e178 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -956,8 +956,14 @@ struct drm_panthor_group_create {
 	/** @priority: Group priority (see enum drm_panthor_group_priority). */
 	__u8 priority;
 
-	/** @pad: Padding field, MBZ. */
-	__u32 pad;
+	/**
+	 * @protected_suspend_bo_handle: BO to use as a protected suspend buffer.
+	 *
+	 * This BO must have been allocated from a protected DMA-BUF heap and
+	 * imported in panthor. It's size must be at least
+	 * drm_panthor_protm_info::group_protected_suspend_buf_size.
+	 */
+	__u32 protected_suspend_bo_handle;
 
 	/**
 	 * @compute_core_mask: Mask encoding cores that can be used for compute jobs.
-- 
2.43.0

