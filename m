Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ECD32D452
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 23:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772493928; cv=pass; b=ufiCXyJGHmSA8ECVvVwLYXuid6tzo0BmeahwyJfPqRIjkxeROlLEUUaFMJJJxcBBquwCF8cc3HmlTzXuu3Zu+v5Qh6CMyqN/XTFNjhXJhUQQ3y8F/qV0tSvX2+WhbfV5UA8Od0z9Gwit/kEWl/RwRGtJhmEbw4queARpinhLNoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772493928; c=relaxed/simple;
	bh=Hx2R70bPpyhpr+cUkD8zWsI/zhFNAGkDgh4PhbRJdms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WcGYWQuuzQXRi9+p7W1CuiA2ppXKFfyioWje2UnvFJBI6i7pDcGSGgLzF8v+OWvRaojsJO04+FMOz6qC/TyA2YKco2MJmk136na/vOE+KLp2Dddyg/5c8t62QS8Nb6lzxLffjcJIK8ZQMSbCf9n8LmsfQJfK655feN/DjQ2Eyok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=QL2vUVf6; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="QL2vUVf6"
ARC-Seal: i=1; a=rsa-sha256; t=1772493915; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O5u9Coe86yj9YikzsPPAOyOIKz+w0MHgdxq25Mexw8OF+iAgwW2UaKC9jRNPQtD0CvbNxjwpAPCs+APdxpuMHB+fdWJfk9+jWSLsIUGXChoU4ltB5UQGhrTAOLBkTDFsL4wEslxJogKeNvky+4Vhq3Xh7CnYtaBnkJ9ZztNxsp8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772493915; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bu4D4snX8cyZjUYzqHIFG8QvoqBi3uhpfEBSBPPOl4U=; 
	b=fnlQsidDK0AQ6HvEN5iuhQoFpQhQp2wgalh0WoRZt/OqiAX0wedcUl05W0fUYENFEwS31wz/9GjpaYBwMyq4SLf9MQhBL3NdgBjpo32AADiDA2dS3PhG0Q4QXkAESASIuK82Y+uEJU+/95OkfBSQ/wisQQwjoGFcg9+o6pEDoAU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772493915;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=bu4D4snX8cyZjUYzqHIFG8QvoqBi3uhpfEBSBPPOl4U=;
	b=QL2vUVf6Rr/1fTYzUzotn/KaT82bYij+gdkhYbYg6sPrNHzFfA0t3s1mEeRpBkxr
	JfNhY8eAmZTzKc5JwvTsASuOysfXpUzb9ersSsMd5Jyawy4xd4Y+YzLjMYfUQSi8GGu
	XSn4XNwZ/v2hKJ1lagbSEOZM4EGkSfULecKj2/KA=
Received: by mx.zohomail.com with SMTPS id 177249391385843.936446635855305;
	Mon, 2 Mar 2026 15:25:13 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	beata.michalska@arm.com,
	lyude@redhat.com,
	work@onurozkan.dev,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 05/12] drm/tyr: add MMU address space registers
Date: Mon,  2 Mar 2026 15:24:53 -0800
Message-ID: <20260302232500.244489-6-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260302232500.244489-1-deborah.brouwer@collabora.com>
References: <20260302232500.244489-1-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Almeida <daniel.almeida@collabora.com>

Add register definitions and constants for managing MMU address space,
including:
  - Address space translation configuration (page table format, attributes)
  - Memory attributes (cacheability, shareability)
  - Address space commands (update, lock, flush)
  - AsRegister helper for per-AS register access

These will be used by the MMU/VM manager to configure page tables and
control address space operations.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v2:
- Change the author from Boris Brezillon to Daniel Almeida.
- Reduce MAX_AS_REGISTERS from 32 to 16 as stated in specs.

 drivers/gpu/drm/tyr/regs.rs | 101 +++++++++++++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index 611870c2e6af..489895d47c42 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -8,7 +8,10 @@
 #![allow(dead_code)]
 
 use kernel::{
-    bits::bit_u32,
+    bits::{
+        bit_u32,
+        bit_u64, //
+    },
     device::{
         Bound,
         Device, //
@@ -111,3 +114,99 @@ pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u3
 pub(crate) const MMU_IRQ_CLEAR: Register<0x2004> = Register;
 pub(crate) const MMU_IRQ_MASK: Register<0x2008> = Register;
 pub(crate) const MMU_IRQ_STAT: Register<0x200c> = Register;
+
+pub(crate) const AS_TRANSCFG_ADRMODE_UNMAPPED: u64 = bit_u64(0);
+pub(crate) const AS_TRANSCFG_ADRMODE_AARCH64_4K: u64 = bit_u64(2) | bit_u64(1);
+pub(crate) const AS_TRANSCFG_PTW_MEMATTR_WB: u64 = bit_u64(25);
+pub(crate) const AS_TRANSCFG_PTW_RA: u64 = bit_u64(30);
+
+pub(crate) const fn as_transcfg_ina_bits(x: u64) -> u64 {
+    x << 6
+}
+
+pub(crate) const AS_MEMATTR_AARCH64_SH_MIDGARD_INNER: u32 = 0 << 4;
+pub(crate) const AS_MEMATTR_AARCH64_INNER_OUTER_NC: u32 = 1 << 6;
+pub(crate) const AS_MEMATTR_AARCH64_INNER_OUTER_WB: u32 = 2 << 6;
+
+pub(crate) fn as_memattr_aarch64_inner_alloc_expl(w: bool, r: bool) -> u32 {
+    (3 << 2) | (u32::from(w)) | ((u32::from(r)) << 1)
+}
+
+pub(crate) const AS_COMMAND_UPDATE: u32 = 1;
+pub(crate) const AS_COMMAND_LOCK: u32 = 2;
+pub(crate) const AS_COMMAND_FLUSH_PT: u32 = 4;
+pub(crate) const AS_COMMAND_FLUSH_MEM: u32 = 5;
+
+pub(crate) const AS_STATUS_ACTIVE: u32 = bit_u32(0);
+
+pub(crate) const AS_LOCK_REGION_MIN_SIZE: u32 = bit_u32(15);
+
+/// Maximum number of hardware address space slots.
+/// The actual number of slots available is usually lower.
+pub(crate) const MAX_AS_REGISTERS: usize = 16;
+
+const MMU_BASE: usize = 0x2400;
+const MMU_AS_SHIFT: usize = 6;
+
+const fn mmu_as(as_nr: usize) -> usize {
+    MMU_BASE + (as_nr << MMU_AS_SHIFT)
+}
+
+pub(crate) struct AsRegister(usize);
+
+impl AsRegister {
+    fn new(as_nr: usize, offset: usize) -> Result<Self> {
+        Ok(AsRegister(mmu_as(as_nr) + offset))
+    }
+
+    #[inline]
+    pub(crate) fn read(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<u32> {
+        let value = (*iomem).access(dev)?.try_read32(self.0)?;
+        Ok(value)
+    }
+
+    #[inline]
+    pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u32) -> Result {
+        (*iomem).access(dev)?.try_write32(value, self.0)?;
+        Ok(())
+    }
+}
+
+pub(crate) fn as_transtab_lo(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x0)
+}
+
+pub(crate) fn as_transtab_hi(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x4)
+}
+
+pub(crate) fn as_memattr_lo(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x8)
+}
+
+pub(crate) fn as_memattr_hi(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0xc)
+}
+
+pub(crate) fn as_lockaddr_lo(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x10)
+}
+
+pub(crate) fn as_lockaddr_hi(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x14)
+}
+
+pub(crate) fn as_command(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x18)
+}
+
+pub(crate) fn as_status(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x28)
+}
+
+pub(crate) fn as_transcfg_lo(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x30)
+}
+pub(crate) fn as_transcfg_hi(as_nr: usize) -> Result<AsRegister> {
+    AsRegister::new(as_nr, 0x34)
+}
-- 
2.52.0

