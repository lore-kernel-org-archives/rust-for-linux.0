Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828417;
	b=dBiXLatyw00SwlffOfDAf33d2MZSjjTYz+VdyBTHLZNVFkjMUcMZysnyC3YwLyfSsBT7
	 c2Mb4Z4mn02/oysPBcOwX0tmYcbvZL00o40aToE2basGWOJ+/qED3JPabOkFzlMQW4B6s
	 ek/T3fKvEG8/IH5le7nZ++c8yDyfG5qaMElhlASG5KitaXYW/HNx/7TzeiaD2kAlrYHXd
	 okFR/Xh7WXnDG+j2E9qfp/VlbhInaRKX2OHHYtnQimHS9oma+D0rpgb6iC2Wm3fxNncK6
	 qoyb8Xe/aX2pkMkBaQnmG9t7XG63joZuvjvnMiLTM5SzNhhiSv4+UBi5sw2iQIa7UPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828417;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h7C1MZ5HJNS3SQGQrEp3HKyYNz+8658R1AWxY1ie9I8=;
	b=URbmIvyU9rvctHSZqw6y657kZJkD4JPYEMooQ+d6oKd6bKHcbCO3v8FaKuGJ4bbsrmVP
	 lyP+Uj/1SDmQc388stU5ahqFh2KhnZru7M5M0TFh8iY8iKC/cbq0g+ZzCBerKznrmpaNL
	 eopMKqHEbJavCXYbFqDtla/ykqX5amBXyxRiTvs1QBD6Dnx4XVCJr/TtcvgAyH98GUVPj
	 F3dpsyJ/j/4zTi2oyyEAwsxybWk5pLzqfGZh5TdAbsT5zFuWSEVOAEsrKW3DWoGg78Jnw
	 wwrmnbVxXHfUBuKtFeLZGU4wQ9lJ+Czai5kRyWQPKfCNUZJqzbqJtRIM5YLwJnTvJgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vjOPInLn;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F341D606A8B5;
	Mon, 16 Nov 2026 11:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F341D606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vjOPInLn
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70CE21713;
	Mon, 16 Nov 2026 03:26:53 -0800 (PST)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FA853F632;
	Mon, 16 Nov 2026 03:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794828416; bh=YA85D4fWXhO7gmbhXUZYNlM+v52cGbBZVZYuWHKd1Gg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vjOPInLnsmxhiPE451/tPGkEZ5p8Sxzv7tFEde1EAPxyJXQS72LgeqBkVV/qa63ie
	 e6sX/IRjcMVP2owk9Cx0YrPH6k4ET9oLHjghj2Ls/D/7dcVs1Mb7Ye2zrwh2jH+uG0
	 xHnfhUHTOTN5+XJyihKlfYhHWz1aWtTDPq2pLOEs=
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
Subject: [PATCH v5 09/13] drm/panthor: Create kernel BO from existing GEM
Date: Mon, 16 Nov 2026 12:25:57 +0100
Message-ID: <20261116112601.3483649-10-ketil.johnsen@arm.com>
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

Refactors/splits existing panthor_kernel_bo_create().
Adds panthor_kernel_bo_create_from_gem() so we can create kernel BOs
from imported protected memory in future change.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

---

v5:
- Fixed size type for panthor_kernel_bo_create_from_gem()
- Removed unused param from panthor_gem_create()
- Minor formating tweaks

v4:
- First version of this change as a separate commit
---
 drivers/gpu/drm/panthor/panthor_gem.c | 100 +++++++++++++++++---------
 drivers/gpu/drm/panthor/panthor_gem.h |   7 ++
 2 files changed, 73 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 5d0eb31746164..6a29609580f1f 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -1001,7 +1001,7 @@ panthor_gem_alloc_object(u32 flags)
 
 static struct panthor_gem_object *
 panthor_gem_create(struct drm_device *dev, size_t size, uint32_t flags,
-		   struct panthor_vm *exclusive_vm, u32 usage_flags)
+		   struct panthor_vm *exclusive_vm)
 {
 	struct panthor_gem_object *bo;
 	int ret;
@@ -1034,7 +1034,6 @@ panthor_gem_create(struct drm_device *dev, size_t size, uint32_t flags,
 		bo->base.resv = bo->exclusive_vm_root_gem->resv;
 	}
 
-	panthor_gem_debugfs_add_usage_flags(bo, usage_flags);
 	panthor_gem_debugfs_bo_add(bo);
 	return bo;
 
@@ -1089,7 +1088,7 @@ panthor_gem_create_with_handle(struct drm_file *file,
 	int ret;
 	struct panthor_gem_object *bo;
 
-	bo = panthor_gem_create(ddev, *size, flags, exclusive_vm, 0);
+	bo = panthor_gem_create(ddev, *size, flags, exclusive_vm);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
@@ -1251,17 +1250,18 @@ panthor_gem_sync(struct drm_gem_object *obj, u32 type,
 void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
 {
 	struct panthor_device *ptdev;
+	struct drm_gem_object *root_gem;
 	struct panthor_vm *vm;
 
 	if (IS_ERR_OR_NULL(bo))
 		return;
 
 	ptdev = container_of(bo->obj->dev, struct panthor_device, base);
+	root_gem = to_panthor_bo(bo->obj)->exclusive_vm_root_gem;
 	vm = bo->vm;
 	panthor_kernel_bo_vunmap(bo);
 
-	drm_WARN_ON(bo->obj->dev,
-		    to_panthor_bo(bo->obj)->exclusive_vm_root_gem != panthor_vm_root_gem(vm));
+	drm_WARN_ON(bo->obj->dev, root_gem && (root_gem != panthor_vm_root_gem(vm)));
 	panthor_vm_unmap_range(vm, bo->va_node.start, bo->va_node.size);
 	panthor_vm_free_va(vm, &bo->va_node);
 	if (vm == panthor_fw_vm(ptdev))
@@ -1272,46 +1272,34 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
 }
 
 /**
- * panthor_kernel_bo_create() - Create and map a GEM object to a VM
+ * panthor_kernel_bo_create_from_gem() - Create kernel BO from existing GEM object
  * @ptdev: Device.
  * @vm: VM to map the GEM to.
- * @size: Size of the buffer object.
- * @bo_flags: Combination of drm_panthor_bo_flags flags.
+ * @bo: BO to use for our kernel BO.
  * @vm_map_flags: Combination of drm_panthor_vm_bind_op_flags (only those
  * that are related to map operations).
  * @gpu_va: GPU address assigned when mapping to the VM.
  * If gpu_va == PANTHOR_VM_KERNEL_AUTO_VA, the virtual address will be
  * automatically allocated.
- * @name: Descriptive label of the BO's contents
+ * @vm_map_size: Size of the BO to map to the VM.
  *
  * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
  */
 struct panthor_kernel_bo *
-panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
-			 size_t size, u32 bo_flags, u32 vm_map_flags,
-			 u64 gpu_va, const char *name)
+panthor_kernel_bo_create_from_gem(struct panthor_device *ptdev,
+				  struct panthor_vm *vm,
+				  struct panthor_gem_object *bo,
+				  u32 vm_map_flags, u64 gpu_va,
+				  size_t vm_map_size)
 {
 	struct panthor_kernel_bo *kbo;
-	struct panthor_gem_object *bo;
-	u32 debug_flags = PANTHOR_DEBUGFS_GEM_USAGE_FLAG_KERNEL;
 	int ret;
 
-	if (drm_WARN_ON(&ptdev->base, !vm))
-		return ERR_PTR(-EINVAL);
-
 	kbo = kzalloc_obj(*kbo);
 	if (!kbo)
 		return ERR_PTR(-ENOMEM);
 
-	if (vm == panthor_fw_vm(ptdev))
-		debug_flags |= PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED;
-
-	bo = panthor_gem_create(&ptdev->base, size, bo_flags, vm, debug_flags);
-	if (IS_ERR(bo)) {
-		ret = PTR_ERR(bo);
-		goto err_free_kbo;
-	}
-
+	drm_gem_object_get(&bo->base);
 	kbo->obj = &bo->base;
 
 	if (vm == panthor_fw_vm(ptdev)) {
@@ -1320,24 +1308,26 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 			goto err_put_obj;
 	}
 
-	panthor_gem_kernel_bo_set_label(kbo, name);
-
 	/* The system and GPU MMU page size might differ, which becomes a
 	 * problem for FW sections that need to be mapped at explicit address
 	 * since our PAGE_SIZE alignment might cover a VA range that's
 	 * expected to be used for another section.
 	 * Make sure we never map more than we need.
 	 */
-	size = ALIGN(size, panthor_vm_page_size(vm));
-	ret = panthor_vm_alloc_va(vm, gpu_va, size, &kbo->va_node);
+	vm_map_size = ALIGN(vm_map_size, panthor_vm_page_size(vm));
+	ret = panthor_vm_alloc_va(vm, gpu_va, vm_map_size, &kbo->va_node);
 	if (ret)
 		goto err_unpin;
 
-	ret = panthor_vm_map_bo_range(vm, bo, 0, size, kbo->va_node.start, vm_map_flags);
+	ret = panthor_vm_map_bo_range(vm, bo, 0, vm_map_size,
+				      kbo->va_node.start, vm_map_flags);
 	if (ret)
 		goto err_free_va;
 
 	kbo->vm = panthor_vm_get(vm);
+	if (vm == panthor_fw_vm(ptdev))
+		panthor_gem_debugfs_add_usage_flags(bo, PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED);
+
 	return kbo;
 
 err_free_va:
@@ -1349,12 +1339,54 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 
 err_put_obj:
 	drm_gem_object_put(&bo->base);
-
-err_free_kbo:
 	kfree(kbo);
 	return ERR_PTR(ret);
 }
 
+/**
+ * panthor_kernel_bo_create() - Create and map a GEM object to a VM
+ * @ptdev: Device.
+ * @vm: VM to map the GEM to.
+ * @size: Size of the buffer object.
+ * @bo_flags: Combination of drm_panthor_bo_flags flags.
+ * @vm_map_flags: Combination of drm_panthor_vm_bind_op_flags (only those
+ * that are related to map operations).
+ * @gpu_va: GPU address assigned when mapping to the VM.
+ * If gpu_va == PANTHOR_VM_KERNEL_AUTO_VA, the virtual address will be
+ * automatically allocated.
+ * @name: Descriptive label of the BO's contents
+ *
+ * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
+ */
+struct panthor_kernel_bo *
+panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
+			 size_t size, u32 bo_flags, u32 vm_map_flags,
+			 u64 gpu_va, const char *name)
+{
+	struct panthor_kernel_bo *kbo;
+	struct panthor_gem_object *bo;
+
+	if (drm_WARN_ON(&ptdev->base, !vm))
+		return ERR_PTR(-EINVAL);
+
+	bo = panthor_gem_create(&ptdev->base, size, bo_flags, vm);
+	if (IS_ERR(bo))
+		return ERR_CAST(bo);
+
+	kbo = panthor_kernel_bo_create_from_gem(ptdev, vm, bo, vm_map_flags,
+						gpu_va, size);
+	if (!IS_ERR(kbo)) {
+		panthor_gem_debugfs_add_usage_flags(bo, PANTHOR_DEBUGFS_GEM_USAGE_FLAG_KERNEL);
+		panthor_gem_kernel_bo_set_label(kbo, name);
+	}
+
+	/* panthor_kernel_bo_create_from_gem() acquires a GEM ref if the import
+	 * succeeds, so we can release it unconditionally here.
+	 */
+	drm_gem_object_put(&bo->base);
+	return kbo;
+}
+
 /**
  * panthor_dummy_bo_create() - Create a Panthor BO meant to back sparse bindings.
  * @ptdev: Device.
@@ -1370,7 +1402,7 @@ panthor_dummy_bo_create(struct panthor_device *ptdev)
 	 * make sense to pre-populate this object's page array, nor to fall back on a BO size
 	 * of 4KiB. Sticking to a dummy object size of 2MiB lets us keep things simple for now.
 	 */
-	return panthor_gem_create(&ptdev->base, SZ_2M, DRM_PANTHOR_BO_NO_MMAP, NULL, 0);
+	return panthor_gem_create(&ptdev->base, SZ_2M, DRM_PANTHOR_BO_NO_MMAP, NULL);
 }
 
 static bool can_swap(void)
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 4da3f59693ce4..787a7aaf706d8 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -318,6 +318,13 @@ panthor_kernel_bo_vunmap(struct panthor_kernel_bo *bo)
 	}
 }
 
+struct panthor_kernel_bo *
+panthor_kernel_bo_create_from_gem(struct panthor_device *ptdev,
+				  struct panthor_vm *vm,
+				  struct panthor_gem_object *bo,
+				  u32 vm_map_flags, u64 gpu_va,
+				  size_t vm_map_size);
+
 struct panthor_kernel_bo *
 panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 			 size_t size, u32 bo_flags, u32 vm_map_flags,
-- 
2.43.0

