Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828421;
	b=VVf0cjGc0MhFGzcsqacuc1YjzrmGX2sfP5ySaD5bVKgaYWtc4m2wMru4Oc2qhkE0m1NN
	 J4j5B/c5QDCUV8Rf1W/uXjIYWrQTSJwK76njgRpEc3hWzOMrPCvv67M8q8Z+JLWmD2xkb
	 53xG9vWjerxSZBXtedkCW4tfdWT38RE+4yiuHh2BBERZBnaUHyICN11OUs8czqF0K6ShE
	 SylgZCTFI/reSYwpZiK2HsGueqCcy0Mrp3jjaucpjIQ/ZUQ26yCzHfKloqIzJwhxWfsT7
	 tyTuWOAWSvkc0p8aL2cDLC/tTI8pQf7iMGSttDfkenhjrj8nNR3ZwAD1ZjLxjTh+jfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828421;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1kBZoLG3Sfo8BY8Oj+c5Vqp1hwUYZ8T9lsxb/I4FOYs=;
	b=uwQ8Tbsars6pYXevIhBe5WuAxIOdh17aUGzFHEChBWpq9JhKV5z3cmQlQa/1VeKcTOra
	 Ti6sEyjrRQH37hcWRPdfzUK0Ekf0e5dnbIpMOJz4/KudP3+6RbazhYOuSG5oqCYIvWwS2
	 bz9+lB35FBRR6YJm4B9TWgKoWLBfEK+5fGEyCO0yPk8B1dXeeARe9Kuhz8gcASOMtWmKK
	 rxIaEi8w2sbe/ML1YGH7NZMpmxW+ynSYIb6Vnfyw4o8BNF7xfO8cPTOIfVYHIG3zgnPca
	 cSeE+S/cjvsrCR1uknVCOX+xThZUmpUi+0D5SUcbI28MNFxPP7QZ7/Mj1Vsjf8Q820g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VWY+oIno;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B43606AB48;
	Mon, 16 Nov 2026 11:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1B43606AB48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VWY+oIno
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35E151AED;
	Mon, 16 Nov 2026 03:26:57 -0800 (PST)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBFE73F632;
	Mon, 16 Nov 2026 03:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794828420; bh=aoiP/aQskpclp57GNpI2kNLdgoNT6EZfghKRIK1IXGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VWY+oInotMT+SduliAf70jnuDub6YK5HNjP3oDvMATtf7avtktedUh5OyHsplOPJd
	 MbrQqGd/iUinO97DnhNRT2P4tfnS6fjzI83GLBLmk0opX7pJHz1yESFcJ7G7OOXRhP
	 VwAQHFjseteZRDpfF4uLh+DDtINzkm/BRWICKFmk=
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
Subject: [PATCH v5 10/13] drm/panthor: Use a copy of suspend buffer sizes
Date: Mon, 16 Nov 2026 12:25:58 +0100
Message-ID: <20261116112601.3483649-11-ketil.johnsen@arm.com>
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

Store the suspend buffer sizes (normal and protected) provided by FW
after FW start. Unsafe to read directly from FW as these will return
zero between FW load and FW start.

Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

---

v5:
- First version of this patch in this patch set.
- This change was previously in a different patch in the set.
---
 drivers/gpu/drm/panthor/panthor_fw.c    | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_fw.h    |  3 +++
 drivers/gpu/drm/panthor/panthor_sched.c |  6 +++---
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index fc07796fc9ef7..b565b362f401f 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -255,6 +255,12 @@ struct panthor_fw {
 	/** @iface: FW interfaces. */
 	struct panthor_fw_iface iface;
 
+	/** @suspend_size: Size of regular suspend buffer */
+	u32 suspend_size;
+
+	/** @protm_suspend_size: Size of protected suspend buffer size */
+	u32 protm_suspend_size;
+
 	/** @watchdog: Collection of fields relating to the FW watchdog. */
 	struct {
 		/** @ping_work: Delayed work used to ping the FW. */
@@ -549,6 +555,16 @@ panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size)
 					"FW suspend buffer");
 }
 
+u32 panthor_fw_suspend_size(struct panthor_device *ptdev)
+{
+	return ptdev->fw->suspend_size;
+}
+
+u32 panthor_fw_protm_suspend_size(struct panthor_device *ptdev)
+{
+	return ptdev->fw->protm_suspend_size;
+}
+
 static u32 section_vm_map_flags(const struct panthor_fw_section *section)
 {
 	u32 cache_mode = section->flags &
@@ -985,6 +1001,15 @@ static int panthor_init_csg_iface(struct panthor_device *ptdev,
 		return -EINVAL;
 	}
 
+	if (!csg_idx) {
+		/* We make a copy of these sizes, as csg_iface can read these
+		 * as zero during full GPU reset, between FW sections being
+		 * reloaded and FW fully booted.
+		 */
+		ptdev->fw->suspend_size = csg_iface->control->suspend_size;
+		ptdev->fw->protm_suspend_size = csg_iface->control->protm_suspend_size;
+	}
+
 	if (csg_idx > 0) {
 		struct panthor_fw_csg_iface *first_csg_iface =
 			panthor_fw_get_csg_iface(ptdev, 0);
diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index 4eda8f8e714c1..b3bf00191a96b 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -511,6 +511,9 @@ panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
 struct panthor_kernel_bo *
 panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size);
 
+u32 panthor_fw_suspend_size(struct panthor_device *ptdev);
+u32 panthor_fw_protm_suspend_size(struct panthor_device *ptdev);
+
 struct panthor_vm *panthor_fw_vm(struct panthor_device *ptdev);
 
 void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang);
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index ca6aa6a55661a..9c78f04d4f30a 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -4058,7 +4058,7 @@ int panthor_group_create(struct drm_file *file,
 	struct panthor_scheduler *sched = ptdev->scheduler;
 	struct panthor_fw_csg_iface *csg_iface = panthor_fw_get_csg_iface(ptdev, 0);
 	struct panthor_group *group = NULL;
-	u32 gid, i, suspend_size;
+	u32 gid, i;
 	int ret;
 
 	if (group_args->pad)
@@ -4109,8 +4109,8 @@ int panthor_group_create(struct drm_file *file,
 		goto err_put_group;
 	}
 
-	suspend_size = csg_iface->control->suspend_size;
-	group->suspend_buf = panthor_fw_alloc_suspend_buf_mem(ptdev, suspend_size);
+	group->suspend_buf =
+		panthor_fw_alloc_suspend_buf_mem(ptdev, panthor_fw_suspend_size(ptdev));
 	if (IS_ERR(group->suspend_buf)) {
 		ret = PTR_ERR(group->suspend_buf);
 		group->suspend_buf = NULL;
-- 
2.43.0

