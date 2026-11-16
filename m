Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828413;
	b=FpjPC+EOFWxK8yLMTa9Qfmxz1Is0Uhu6+YSCuZnsaEw11hQV+zYTFQ7x7nnTtbjhJSFW
	 ZYtRAZQs6gm4CFg/o54KiRdusqc539G1wXI51sNzQCmJjB5YJCNireZT0TZUxP+V6gZjF
	 9rvpeWjVLW9rGlArUk61eRMs3bH+bXqf0IumVg3BwfS72yplNMBi9an1b+XyVlyvCJwTy
	 qvpEDyEt/xprwxQS0sUHiH7EmhvrKPpd+kwbDPiZ3ANth3x9RJ84aAuxjJrR2enoDx6pu
	 VipKiBWDQNKW5XwzziFnzdz622bqic2w7kyTNIucJMel7XrxEDUae0ZLU4KOvIHQ56Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828413;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6rp7sXgyXwg0Gm/WTPrA3o7flFsjdEWizp/YNFYGWig=;
	b=GhalU5AyT42XtOpRmp7Lj/TlKMud5lDwECLD+wkgfZIFJrDvqgd5B9zpDxynN/CO71Dd
	 W/HLjJC10pP2JE48eFzNRkRQ7ROaJ3CyAbiXBAlMMi+373uGQNKkFPfDwVZmUaQtLB7XR
	 awNvgTCZ+EG9UCw59eyrxBA7xm7qElJ3dU7JVtu9hIbwst1IE7pg2rjELg6n1Y68i2aAD
	 MRiupkIP4IIxTe/qvDKCgb388bKpUFPRW8xffXCoqFcbGR6wLJlyMrYXbJB38e6DjvJ7n
	 ydCtfi0lIq8cabzzQNq/gcuKrqqgRkEBQUQx72BfsByuO7eWdyIhF2ERiTKguapDi5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kkYN3x3s;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F41960A2612;
	Mon, 16 Nov 2026 11:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F41960A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kkYN3x3s
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6D251A25;
	Mon, 16 Nov 2026 03:26:49 -0800 (PST)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 474393F632;
	Mon, 16 Nov 2026 03:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794828412; bh=M61mPJfzDj7AKWDhpO/ALFj0TxdAcS7D354FdC4/4SE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kkYN3x3sDEtDoLH0emOX5YaK9vM/JhFhM9GVoBmnXrfvcg5sXgnNT/ruiJPoThPk7
	 hMXhBkEeeHYtJSoXn/fSWypxcM72ZH8A5Ld0nABTh4mjYA7lBzeofmMo/gY5RXh7wH
	 JJCOKcmW/nExuXg0TIbEjzq/gFjN0yIsU14csYz4=
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
Subject: [PATCH v5 08/13] drm/panthor: Refactor GEM usage flags assignment
Date: Mon, 16 Nov 2026 12:25:56 +0100
Message-ID: <20261116112601.3483649-9-ketil.johnsen@arm.com>
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

Changes panthor_gem_debugfs_set_usage_flags() to
panthor_gem_debugfs_add_usage_flags(). This will come in handy in a
later change when we split panthor_kernel_bo_create() to also handle
protected memory.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

---

v5:
- Minor formating fixes.

v4:
- First version of this change as a separate commit
---
 drivers/gpu/drm/panthor/panthor_gem.c | 13 +++++++------
 drivers/gpu/drm/panthor/panthor_gem.h |  2 +-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 22b57ab6f9291..5d0eb31746164 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -74,14 +74,14 @@ static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
 	mutex_unlock(&ptdev->gems.lock);
 }
 
-static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
+static void panthor_gem_debugfs_add_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
 {
-	bo->debugfs.flags = usage_flags;
-	panthor_gem_debugfs_bo_add(bo);
+	atomic_or(usage_flags, &bo->debugfs.flags);
 }
 #else
+static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo) {}
 static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
-static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {}
+static void panthor_gem_debugfs_add_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {}
 static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) {}
 #endif
 
@@ -1034,7 +1034,8 @@ panthor_gem_create(struct drm_device *dev, size_t size, uint32_t flags,
 		bo->base.resv = bo->exclusive_vm_root_gem->resv;
 	}
 
-	panthor_gem_debugfs_set_usage_flags(bo, usage_flags);
+	panthor_gem_debugfs_add_usage_flags(bo, usage_flags);
+	panthor_gem_debugfs_bo_add(bo);
 	return bo;
 
 err_put:
@@ -1647,9 +1648,9 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
 	enum panthor_gem_reclaim_state reclaim_state = bo->reclaim_state;
 	unsigned int refcount = kref_read(&bo->base.refcount);
 	int reclaimed_count = atomic_read(&bo->reclaimed_count);
+	u32 gem_usage_flags = atomic_read(&bo->debugfs.flags);
 	char creator_info[32] = {};
 	size_t resident_size;
-	u32 gem_usage_flags = bo->debugfs.flags;
 	u32 gem_state_flags = 0;
 
 	/* Skip BOs being destroyed. */
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 5ae37d0d3646f..4da3f59693ce4 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -62,7 +62,7 @@ struct panthor_gem_debugfs {
 	} creator;
 
 	/** @flags: Combination of panthor_debugfs_gem_usage_flags flags */
-	u32 flags;
+	atomic_t flags;
 };
 
 /**
-- 
2.43.0

