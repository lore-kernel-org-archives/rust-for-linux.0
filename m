Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828406;
	b=deQrVa8EoDMdbVa/6zVTWPsEzh36N9zylT08kGwXR7M7eOZevs79FKg2kSlriDFUEOBz
	 mhgtBAAzHPB0qJIjpKdBfaylcU/FQWO1Ai5pMXk5SgqvtgVJzY8g8sUvrU/Dq9yldCzcr
	 kQmHUy52zPC50btRzALiKTGU30pdKCZZYLPv0Ton9L7cpXVGhUTlTw8m2f677fVZXnwcQ
	 601/1NSVHcPXS8mOWo6O60/sfMCb+8GZjQV2HT7deYY0tHjbwdOGN3Y+/ojjhm0FAcSyU
	 EP6jKy6XNXw4djPuI5WVjiKgtWSfDhMeMKWCDafEty6xENNFNcNafcFjUfCKjpUw2/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828406;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RiLRVkbxN5DJBzhFssqaNFqr+36k6Y9wDIhQeknjSfw=;
	b=4Eist3+9zH85LsPViY/6p5omkekkO0d6n8oxH8FXpRz/tiqWeKa9J3aQQh2Mur8vjYed
	 GcKiIaR3DZsRZ2enaVHRhqJCQVdiLOhoGvlAhwiBHfOkimi08WwDo5GwMiqBy9CdfXWt3
	 /T16RbLN37TvgHMXRknllQNL6Gnb+5abIG0bX0S+QkF0sN9wvZgmG7Pssr6xeQwzBLFgn
	 s2vmcwvw9LmKqeVEgbnZ04w9Q4onlEe6l7kbHupFPBqBHPSHLS45iDC79A7T2AITkewjJ
	 5VS/RjSm64VFcvf7P34/t+HypCXplo4tp0BFv02KgDYeyOm3OJHuRYF9Lw8gyvPCUkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=o5wjWgm0;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7FA607183E;
	Mon, 16 Nov 2026 11:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E7FA607183E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=o5wjWgm0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 238731A25;
	Mon, 16 Nov 2026 03:26:42 -0800 (PST)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B78B63F632;
	Mon, 16 Nov 2026 03:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794828405; bh=4hjyLdYHsFbuQQjoim7LNjBF3zXbFAzH1oulIvFyJSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o5wjWgm0rvO61HfPA2uZ3ZMW7wHTmp3nyODb5BewfKlQAvPkXFAtjWXHLWXLOH2ti
	 nmUoyp9CMKY7s5kAhz14KyIkkhWpWXaI2aRk9fIs4fnrNcIiofg2jf+Z3EupOpWsmP
	 IlXjtb4X/SDoeMQNHq2V/PIQG0abdY93CvHfFx4E=
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
Subject: [PATCH v5 06/13] drm/panthor: New function for FW section map flags
Date: Mon, 16 Nov 2026 12:25:54 +0100
Message-ID: <20261116112601.3483649-7-ketil.johnsen@arm.com>
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

This refactors the VM map flags for FW sections into a new function
called section_vm_map_flags().
This comes in handly for future handling of protected FW sections
(type CSF_FW_BINARY_IFACE_ENTRY_PROT).

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

---

v4:
- First version of this change as a separate commit
---
 drivers/gpu/drm/panthor/panthor_fw.c | 44 ++++++++++++++++------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index e639ffeac7a32..7b8c90b19f4fe 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -543,6 +543,31 @@ panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size)
 					"FW suspend buffer");
 }
 
+static u32 section_vm_map_flags(const struct panthor_fw_section *section)
+{
+	u32 cache_mode = section->flags &
+			 CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_MASK;
+	u32 vm_map_flags = 0;
+
+	if (!(section->flags & CSF_FW_BINARY_IFACE_ENTRY_WR))
+		vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_READONLY;
+
+	if (!(section->flags & CSF_FW_BINARY_IFACE_ENTRY_EX))
+		vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC;
+
+	/* TODO: CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_*_COHERENT are mapped to
+	 * non-cacheable for now. We might want to introduce a new
+	 * IOMMU_xxx flag (or abuse IOMMU_MMIO, which maps to device
+	 * memory and is currently not used by our driver) for
+	 * AS_MEMATTR_AARCH64_SHARED memory, so we can take benefit
+	 * of IO-coherent systems.
+	 */
+	if (cache_mode != CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_CACHED)
+		vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED;
+
+	return vm_map_flags;
+}
+
 static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 					 const struct firmware *fw,
 					 struct panthor_fw_binary_iter *iter,
@@ -645,26 +670,9 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 	}
 
 	if (section_size) {
-		u32 cache_mode = hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_MASK;
-		u32 vm_map_flags = 0;
+		u32 vm_map_flags = section_vm_map_flags(section);
 		u64 va = hdr.va.start;
 
-		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_WR))
-			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_READONLY;
-
-		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_EX))
-			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC;
-
-		/* TODO: CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_*_COHERENT are mapped to
-		 * non-cacheable for now. We might want to introduce a new
-		 * IOMMU_xxx flag (or abuse IOMMU_MMIO, which maps to device
-		 * memory and is currently not used by our driver) for
-		 * AS_MEMATTR_AARCH64_SHARED memory, so we can take benefit
-		 * of IO-coherent systems.
-		 */
-		if (cache_mode != CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_CACHED)
-			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED;
-
 		section->mem = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
 							section_size,
 							DRM_PANTHOR_BO_NO_MMAP,
-- 
2.43.0

