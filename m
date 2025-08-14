Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F028130103E
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 13:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179613; cv=none; b=M7QdB9zYHP5ha2hByV2CiFI6M4/ldORxYaLfEia3k/rBNIIPvArYIQcvdy1PpgSH+eh+vDKu3Rh/vAzDvG6H9Jtoe94xMcfvwt6n5JmZoD5Yerq+y52CGVCUOTuEJewx1l38egGLjaU/66Xi56/7Ul3H5Irc1yvVDpTjb7IvWjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179613; c=relaxed/simple;
	bh=Ys8zr7p5E/pxehMYheQ03XdY7hgmdwtMJ8X4xdLEP5w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NvDpNjTYpvfOCtAePKNThqB5jLyuQXSmlefDCYzqiBxq+vEZV8qXKEZVSGRmgu4w2UXixagL+OOC7UFimzvp5hkjsYOyQ6wozVsnlwT6kCF2v0hz+mF54G9+GE2nK47TKRHZ/UaWCaPruKKxZZCvfyMJHVWCc7UBVdJXii1abcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oBMXeISm; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oBMXeISm"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3b9e4146aa2so506846f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 06:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755179610; x=1755784410; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XYenbqOTOpUfkHsfqbO9ECo5eK5dIeNTgWkJCZso5Iw=;
        b=oBMXeISmHDWIaQKkmCde9C3Ga46aY8QkYV3qOiDN7Bv5auS8k/UujcMdlwBCiD9hmL
         a+9MdqPMhh4THyaBLI0iURWu+BIhOzGhkNfh1Y6WocdaS9BzpKFGOZ2G7T+pUlnWGqlH
         QJxvZ88g+F/Kg4RNsiWJrhFfiDNcGtbzvOk1iqpJQ4islMMG+Tddk4rU4/NrNwPIVWFR
         rj2g13QMckGz8Sz3o5htPObYBGOecKmxxFXXS22Uzw2jPlxYxaFhreOTo7XD+zbDsiPw
         hhQ6jUhdzQxJSOstotyMzkxTHsboyshgRdqqVm+8p+NADBCOaG0iN/3Npymh8b1XFFVJ
         +D8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755179610; x=1755784410;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYenbqOTOpUfkHsfqbO9ECo5eK5dIeNTgWkJCZso5Iw=;
        b=ZtxagbEH0uQQynniBtzv7+O2UXOfAxvD8m8BSUEfR5LalYXesYPoQInRTKBg0bV8sT
         QFQ0c6ENmJ7GrMxh5HC7SS+Xfa6YFgr9vYtnNBRffLHQniMEc/k6HKODYX+U28niwJi2
         rGJzgQqpdcAUvmgkrbv+Yav5GPlpVCV87doBQYH10cfam7cRI0ZoNpBGa4ab4waTPK3M
         J5FE1UC3degECkEw6Mo91SxMu5KIPmJFGbr0sunIpMZOpO9lNy2hI0/R3mZVDHsYaTCJ
         PKDGDbbZDw2jWjNVU30YxsrcQU3aQWayht0Db1vN8TgVHArk2MMTpzPDwcQ0l2pfbzl2
         qPew==
X-Forwarded-Encrypted: i=1; AJvYcCUpdcYnst+zMOlI8t5T0LVoKmTu+FqjtAG41eD9gYOyR56dRACkM4MxDSlqfApRBiifbRgAVwOGFjoO4A9OpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySc3ewd3F2ozXRo5odL6ainnOe+mXTvd8uchX0TClyThdYNNyJ
	oqjy6tq1AnVYfOq69ePMBW05Fe4hh99pG1Q631R472E88+nXgzdLYzcyLufm4H62rgrCRa3a+Xf
	JvMt1W983bCNDW5aaeg==
X-Google-Smtp-Source: AGHT+IHjFvugaaT39rs+Few2Au2DyR4dI8P3XYhfyJjMtCWojx1WUn1zy0tKslkpao2uUAls3VBSCjMA5LAW2EI=
X-Received: from wmbez13.prod.google.com ([2002:a05:600c:83cd:b0:456:1194:a7e7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4382:b0:3a4:f70e:abda with SMTP id ffacd0b85a97d-3ba50c8c664mr2477873f8f.10.1755179610295;
 Thu, 14 Aug 2025 06:53:30 -0700 (PDT)
Date: Thu, 14 Aug 2025 13:53:15 +0000
In-Reply-To: <20250814-gpuva-mutex-in-gem-v1-0-e202cbfe6d77@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250814-gpuva-mutex-in-gem-v1-0-e202cbfe6d77@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4609; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Ys8zr7p5E/pxehMYheQ03XdY7hgmdwtMJ8X4xdLEP5w=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBonepUMfvSgfkIDEOYXLox3MvOXoRh14yydHLxA
 wjofl+zw32JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaJ3qVAAKCRAEWL7uWMY5
 RhO0D/wIMga8/2gOGjfBWqD3J9KldnWfbEhUcZdZ4xADV9l6DG/tL6UIizHx5cuq1iI7cAAffeA
 mNPzj6dy8gV5M3SOWI9y1rl1KQNm2alIpwbmiy7KlW2hKD4GksUhiDsxN0NiK8z4XtIDal++j1P
 3Z798SG1xAtbDL7AEHIiZX9STsE6cuv7TzAPUCTHCaYj/Ga7DJgHzNXDxm9YiM4vAh1p7i8B6sb
 EPoDCQb+V9I2R4UwYkwJD+rV68Qgk2xhmhvzOCQu3DxrGw1heQzNU5bd/41FlxhwbcqHEWthgop
 AmlCQhu0c1p9tg4q4tiyptNOTVg+fcApUWeDnbmFgJAM2iOmpxokgPitKFqNdoig85rv/VaCx/G
 InxlcCs4i305CnGVQ7SAyMXXAcsr0CqGYmDRUMq+407wGRNIwVgC+zMQ6VOrvNIIJtFePylIaN0
 RhXZ+eRtY8cQd7b0vE1WxlEylKNEsQh9qNFr6DV5o9D7aKfXLaMEe1j8Xi/07lenbd0EFtSnfkd
 eTT0dnAIN9JLSTIePU4tviyIbNMYNGlpY6aYqrNJtZQzU9tPQKqmWYmExN5EELuzJxDa6qNi1ey
 cRUPSI/3gFuX9iOZ42gEDbB6qHhCWgR3x8eUS99kx9N5gF170kLP+tc52Jc5kwdfP2bV2FKvW7v upQapiheJ/4rk/A==
X-Mailer: b4 0.14.2
Message-ID: <20250814-gpuva-mutex-in-gem-v1-2-e202cbfe6d77@google.com>
Subject: [PATCH 2/2] panthor: use drm_gem_object.gpuva.lock instead of gpuva_list_lock
From: Alice Ryhl <aliceryhl@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Danilo Krummrich <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Now that drm_gem_object has a dedicated mutex for the gpuva list that is
intended to be used in cases that must be fence signalling safe, use it
in Panthor.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c |  4 +---
 drivers/gpu/drm/panthor/panthor_gem.h | 12 ------------
 drivers/gpu/drm/panthor/panthor_mmu.c | 16 ++++++++--------
 3 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index a123bc740ba1460f96882206f598b148b64dc5f6..c654a3377903cf7e067becdb481fb14895a4eaa5 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -74,7 +74,6 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
 	mutex_destroy(&bo->label.lock);
 
 	drm_gem_free_mmap_offset(&bo->base.base);
-	mutex_destroy(&bo->gpuva_list_lock);
 	drm_gem_shmem_free(&bo->base);
 	drm_gem_object_put(vm_root_gem);
 }
@@ -246,8 +245,7 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
 
 	obj->base.base.funcs = &panthor_gem_funcs;
 	obj->base.map_wc = !ptdev->coherent;
-	mutex_init(&obj->gpuva_list_lock);
-	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
+	drm_gem_gpuva_set_lock(&obj->base.base, &obj->base.base.gpuva.lock);
 	mutex_init(&obj->label.lock);
 
 	panthor_gem_debugfs_bo_init(obj);
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 8fc7215e9b900ed162e03aebeae999fda00eeb7a..80c6e24112d0bd0f1561ae4d2224842afb735a59 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -79,18 +79,6 @@ struct panthor_gem_object {
 	 */
 	struct drm_gem_object *exclusive_vm_root_gem;
 
-	/**
-	 * @gpuva_list_lock: Custom GPUVA lock.
-	 *
-	 * Used to protect insertion of drm_gpuva elements to the
-	 * drm_gem_object.gpuva.list list.
-	 *
-	 * We can't use the GEM resv for that, because drm_gpuva_link() is
-	 * called in a dma-signaling path, where we're not allowed to take
-	 * resv locks.
-	 */
-	struct mutex gpuva_list_lock;
-
 	/** @flags: Combination of drm_panthor_bo_flags flags. */
 	u32 flags;
 
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 4140f697ba5af5769492d3bbb378e18aec8ade98..49ca416c7c2c5a01ab0513029697ba9c7a35832d 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1074,9 +1074,9 @@ static void panthor_vm_bo_put(struct drm_gpuvm_bo *vm_bo)
 	 * GEM vm_bo list.
 	 */
 	dma_resv_lock(drm_gpuvm_resv(vm), NULL);
-	mutex_lock(&bo->gpuva_list_lock);
+	mutex_lock(&bo->base.base.gpuva.lock);
 	unpin = drm_gpuvm_bo_put(vm_bo);
-	mutex_unlock(&bo->gpuva_list_lock);
+	mutex_unlock(&bo->base.base.gpuva.lock);
 	dma_resv_unlock(drm_gpuvm_resv(vm));
 
 	/* If the vm_bo object was destroyed, release the pin reference that
@@ -1249,9 +1249,9 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	 * calling this function.
 	 */
 	dma_resv_lock(panthor_vm_resv(vm), NULL);
-	mutex_lock(&bo->gpuva_list_lock);
+	mutex_lock(&bo->base.base.gpuva.lock);
 	op_ctx->map.vm_bo = drm_gpuvm_bo_obtain_prealloc(preallocated_vm_bo);
-	mutex_unlock(&bo->gpuva_list_lock);
+	mutex_unlock(&bo->base.base.gpuva.lock);
 	dma_resv_unlock(panthor_vm_resv(vm));
 
 	/* If the a vm_bo for this <VM,BO> combination exists, it already
@@ -2003,10 +2003,10 @@ static void panthor_vma_link(struct panthor_vm *vm,
 {
 	struct panthor_gem_object *bo = to_panthor_bo(vma->base.gem.obj);
 
-	mutex_lock(&bo->gpuva_list_lock);
+	mutex_lock(&bo->base.base.gpuva.lock);
 	drm_gpuva_link(&vma->base, vm_bo);
 	drm_WARN_ON(&vm->ptdev->base, drm_gpuvm_bo_put(vm_bo));
-	mutex_unlock(&bo->gpuva_list_lock);
+	mutex_unlock(&bo->base.base.gpuva.lock);
 }
 
 static void panthor_vma_unlink(struct panthor_vm *vm,
@@ -2015,9 +2015,9 @@ static void panthor_vma_unlink(struct panthor_vm *vm,
 	struct panthor_gem_object *bo = to_panthor_bo(vma->base.gem.obj);
 	struct drm_gpuvm_bo *vm_bo = drm_gpuvm_bo_get(vma->base.vm_bo);
 
-	mutex_lock(&bo->gpuva_list_lock);
+	mutex_lock(&bo->base.base.gpuva.lock);
 	drm_gpuva_unlink(&vma->base);
-	mutex_unlock(&bo->gpuva_list_lock);
+	mutex_unlock(&bo->base.base.gpuva.lock);
 
 	/* drm_gpuva_unlink() release the vm_bo, but we manually retained it
 	 * when entering this function, so we can implement deferred VMA

-- 
2.51.0.rc0.215.g125493bb4a-goog

