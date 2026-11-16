Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828409;
	b=Ua5KxZPvcOVzRt9rh834UkPoxxV6vWQLcBQCczMetJhf0RwNxZO5pDj2DmreZGNxP1d3
	 iJLDbhBTw1d/N2j0Jz2iK5RTM3XkzhnujP89RobepqSP1iuLdyB1FnXT3dB4hJutI7SYb
	 Mptb1yvIujTogUwxjbX61UbtswkWqGsiOJKTzXZUQrVPFNdhIUvrsAwEKTYbENeyADM56
	 TMVomyHcR4L+tOBBCd7BSmB2EaJmkTMXVIslb8hIve575cRwjiirpnf2JbcpWOq3nmlEL
	 KQFdbmFRBt6nHtht1yHF7iUGQn2rlg9Fxoa5+AfIQF6RjFJ1wENISwgPAgzYqExZo6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828409;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=npiHnDXqoyLTRxnB9WuYogrbgkU5oZTnvt1b66Qv7Y0=;
	b=dlh7oQVQKIOX0/NSFj8+DDAJnTqSs8HzzzrCCKIBzOvJsuppHOTU7ovkv5rnPg785asc
	 ePM0anQPazs6LG2wFNyi6zw0qrq47Rhl7t6J47nBhc/ezMKPm2H4szYjr8/F3YnzANRaJ
	 jKbWyc+X1NdqMid9n3AwprFuzVpFRcBdKPo1JyWvbHwUUm4gVZfWkCtyAJFgmapq81p/c
	 xpdGYJhIpF3FQ0prCQiwPioU90u1dZMzra6BaX+hyvjhVKG+ZXUH2rzcsa1yz9K2M784Q
	 bxEHRDCV89DPHjoMycEzPDjBbqv1jgzy+xdGsTo078GI3AnaiT1KHauMz8OC5nwFD1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oYR3Q17V;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B50A606A88B;
	Mon, 16 Nov 2026 11:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B50A606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oYR3Q17V
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF8A21713;
	Mon, 16 Nov 2026 03:26:45 -0800 (PST)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F14F3F9A2;
	Mon, 16 Nov 2026 03:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794828408; bh=BMIS0FP095oGN0RpoWacZRu0RNuTHjIHrs+5UcM7wG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oYR3Q17V14rrhzf3ig0YHnB9UJGFD67vMrogJ9zu9Y7HTKGaDPc19Cqf78EpNhXNt
	 p4+OmgNk1FTsp7it8kfzQ9gxSbkjbbXku200c4tZhbqbkUQ835x+ee+C802wmFPilt
	 84iKfIXQsFLmIs7x7FBSUBHuPdD0ub3JnqNGlTOI=
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
Subject: [PATCH v5 07/13] drm/panthor: Keep size and VA in FW section obj
Date: Mon, 16 Nov 2026 12:25:55 +0100
Message-ID: <20261116112601.3483649-8-ketil.johnsen@arm.com>
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

Keep a copy of the FW section size and VA in the
panthor_fw_section object. We need this in the future when handling
late init of protected memory for FW sections of type
CSF_FW_BINARY_IFACE_ENTRY_PROT.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

---

v4:
- First version of this change as a separate commit
---
 drivers/gpu/drm/panthor/panthor_fw.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 7b8c90b19f4fe..fc07796fc9ef7 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -198,6 +198,12 @@ struct panthor_fw_section {
 		/** @size: Size of @buf in bytes. */
 		size_t size;
 	} data;
+
+	/** @size: Section size. */
+	size_t size;
+
+	/** @va: Section VA. */
+	u32 va;
 };
 
 #define CSF_MCU_SHARED_REGION_START		0x04000000ULL
@@ -669,18 +675,21 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 		section->name = name;
 	}
 
+	section->size = section_size;
+	section->va = hdr.va.start;
+
 	if (section_size) {
 		u32 vm_map_flags = section_vm_map_flags(section);
-		u64 va = hdr.va.start;
 
-		section->mem = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
-							section_size,
-							DRM_PANTHOR_BO_NO_MMAP,
-							vm_map_flags, va, "FW section");
+		section->mem = panthor_kernel_bo_create(
+			ptdev, panthor_fw_vm(ptdev), section->size,
+			DRM_PANTHOR_BO_NO_MMAP, vm_map_flags, section->va,
+			"FW section");
 		if (IS_ERR(section->mem))
 			return PTR_ERR(section->mem);
 
-		if (drm_WARN_ON(&ptdev->base, section->mem->va_node.start != hdr.va.start))
+		if (drm_WARN_ON(&ptdev->base,
+				section->mem->va_node.start != section->va))
 			return -EINVAL;
 
 		if (section->flags & CSF_FW_BINARY_IFACE_ENTRY_SHARED) {
-- 
2.43.0

