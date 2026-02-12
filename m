Received: from sender4-pp-e107.zoho.com (sender4-pp-e107.zoho.com [136.143.188.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61EA199FAB
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 01:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770860268; cv=pass; b=vBDnqQTbSl/pYEkpL6kkzZhvN2DJh1cOE1ePfhM3fZFH+oOgsE6O0RNyoJfUirPX4/VISKrw4X+kY+8ULwV8aKK8tvHNHvBWgddL5LNqEh+uPF+b3W9dfvbWZBcQOQUM/W/Gr7Qccm3Rryol4FpTyE3rf/sDb+JaM6BFLCEgylY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770860268; c=relaxed/simple;
	bh=PRufU1BlPNDPodZeJ0S/FvVxE1OOayn4SGRmU90au1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H0rtf3NTi+vP5Z9YhR2AHE7ZilYQd9YOkC4X13QzQnQstnZitfVUJThxOLbxVZW7CSH8P8y6tZoOSNQezK1ty9Hd+EY26f4HVfdAO1jHJgZxZARGM/9xYHSjDSaUhtjmLLBhmBXb0nvY3EyqoPpfa2uEuLuHjBluZ6kwZk7k6iY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=dJ9kVzmm; arc=pass smtp.client-ip=136.143.188.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="dJ9kVzmm"
ARC-Seal: i=1; a=rsa-sha256; t=1770860261; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HtHQQBFj4v/gtl7jFPfGlDHIfyxlhqUD8CUF/7KTSkWbzRCgZoFUpYFOjNNUyLZQJNKe15wcOd5LVr5gDKEyitKizN9qDN2aLx1DvtrhZqwdicr9M4ycz5xSx3tRD/6WFwRdOyUN0xD+o98Jxy1/8lY5i25wd6jA+eoSBdSqoiI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770860261; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sd4W0Fn2cptJlKlY/PFWydX2PrJHbOdkjDyiBkPyNfA=; 
	b=DX3SyXshl4D9/+y2R1pXB2hpESot9LvjQZ/mNFX57BdN/NTuHAOdav8IxEVVW0vwQYVtxdeIFSiNe29g3hGaTq1KQ9JhXrpMdLOrgcZjH3IUsjJe1DTCRZ4mruvMiEjAg/Y9xoynS69blQ4oTd4STrR+bX+mTAEWa4QqxCMpGg4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770860261;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=sd4W0Fn2cptJlKlY/PFWydX2PrJHbOdkjDyiBkPyNfA=;
	b=dJ9kVzmmKgN0u7Mj5xCgvm4Q618txUqe+e9EdFlCwOT7pzb9qZ7F+mc//BHU2Ia9
	TpyxTrYoPV111zyH/nMKT4FnC9mWxbTGHB6OeZ+iw/wFN/IBkgQTg7S785hTFQXQ/1Y
	26imV9BV8OVlvOySzlPSEiKzjF6pjytkyX84Vsso=
Received: by mx.zohomail.com with SMTPS id 1770860260155626.6374404480487;
	Wed, 11 Feb 2026 17:37:40 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	beata.michalska@arm.com,
	lyude@redhat.com,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 05/12] drm/tyr: add MMU address space registers
Date: Wed, 11 Feb 2026 17:37:06 -0800
Message-ID: <20260212013713.304343-6-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212013713.304343-1-deborah.brouwer@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Boris Brezillon <boris.brezillon@collabora.com>

Add register definitions and constants for managing MMU address space,
including:
  - Address space translation configuration (page table format, attributes)
  - Memory attributes (cacheability, shareability)
  - Address space commands (update, lock, flush)
  - AsRegister helper for per-AS register access

These will be used by the MMU/VM manager to configure page tables and
control address space operations.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/regs.rs | 101 +++++++++++++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index 611870c2e6af..9cb7ab0c806a 100644
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
+/// The actual number of slots available is usually much lower.
+pub(crate) const MAX_AS_REGISTERS: usize = 32;
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

