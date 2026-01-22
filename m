Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011028.outbound.protection.outlook.com [40.107.208.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D40E2DAFA1
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 22:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769121103; cv=fail; b=LsYnKtH0k9hBkAoZhJ0VNJvhWxCO9l+20dyhyvuYYiF0oqlMV8uFnWoP9LutZS+VuYh/LwzA/Y2+H+/GXDWtU3Uu3noCJDM6GWnxazNvSv+hJMAs4+KOwF0Vox1WpWKn4AvCHb1meKve5KaYlM8D6DHtIUTUudqG/B6GtcawJOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769121103; c=relaxed/simple;
	bh=8r7ON1j3hD91qwIrCuWAVESg9ao2RrurJQugSTCTbXg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BObo9P0U1rnHbmqSPjxVJApVRciHezqRjI4Yj+5plK7yXNpj/zYBMGlJS4huJuXskYUFYJDGaIMs+GgaZ1sG4O8GCyHQdDgtjZ+cBKbWrfXU03O6x1iupqTqZcfXvsOMU4JRWjM+ndDNuF/+QCxUv4VyQyeeVuerLhwYF21JSq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jA3DbHqV; arc=fail smtp.client-ip=40.107.208.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jA3DbHqV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzsY/nVrfiLUz+B8u7W1nFjZTeJ7QA3h2VU2xj4GqbhnNbFxbn1+ec6VR/KhUPSAON8yDLsq7pISLFRpVCzwm4wmQIVQKk/8x3HMHBLhP//AE2yC0za0UbdSkCafy4cXQogPzvxivx0nJ5fOo9MPlS5nTdkXGfIhFvtqAEgnVl8lsQ3C8RwvWHvp7b+u518T7lpZ84NVRKqksqeoPqd8GBFJeDapusICvrtNRsS1WfDAXez41aRR2Q6uy6mH9rxiL75owOAOI4RhdyE6S4AaAE1Jo44a0dz5dgwGxBJM+oaL7wqjTEZWdBp7CKcOp3w2ECNKz+k4HM6Yz2axE3JfxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TArkuPQ7hzD1LUXdSSmCsYTQ6ZGA23nJhJTtZsX1Hak=;
 b=zIgcRLNTVK/MYpOZyd2eaJjHaMJYOX33e4XVHJx7z6BB56Xag38VDB1Q1ztSsXgAN1ydZ09AwSDWLraxcO88ZxQe0zz3H1Z7+ZLMGFHM1rV+vyC46CJOOtjWxq43p9d7V7rhv5tXdMjgTx8WtCYRSICdoqRUNmPPbu+ByzN8jgvYoGyx/BlobHgSlMr07dEc5hRwV0GWWz49lAbXEWTTiyv4WhZwvUS5c7GAnnI2NqTStOA8yZ24rt+1KFAqYAC+96L1dBw7VeXblyJbFFD/WW9QAHqqv8Qtpp6vcGTX5/U3dVmXWswNsrwCAN9JrYTHwK3a7/xZQ3XWMMmGBIPazw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TArkuPQ7hzD1LUXdSSmCsYTQ6ZGA23nJhJTtZsX1Hak=;
 b=jA3DbHqV4z10uHcHHmSFv0+MkkdNK7kXVTX7govmkUOTBe20WbnSoDLDGoPMgljpsGt6xD5fHJqZUKjvs7BU0TehSDeb57LNuPCX+dSWC/bJIHXV/jHAeVYxlVCwWXb4gH3MopGgJOkiPjmMJV/hIn99MeaYC6APLeO5djVi9Lwq0ze7DcmVjCNpF4EXPIEVPWoQ3IpZeUNCkWAEDfvx+dfDShPfEwlD/hO3OF6KeVrIzUO+kbEp7A3+iIbAGvwfsqHl6CaUX3B2Q4qNQKZ84I+cHc2hOADs1Tr2WtdFAWFnH+Y5dE8UK8z2kRsoCUURollC2qKnVx8M7nnCClZqkA==
Received: from DM6PR21CA0020.namprd21.prod.outlook.com (2603:10b6:5:174::30)
 by BL4PR12MB9482.namprd12.prod.outlook.com (2603:10b6:208:58d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 22:31:33 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:174:cafe::c5) by DM6PR21CA0020.outlook.office365.com
 (2603:10b6:5:174::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Thu,
 22 Jan 2026 22:31:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 22:31:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:12 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:10 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v8 12/13] gpu: nova-core: add PIO support for loading firmware images
Date: Thu, 22 Jan 2026 16:28:47 -0600
Message-ID: <20260122222848.2555890-13-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122222848.2555890-1-ttabi@nvidia.com>
References: <20260122222848.2555890-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|BL4PR12MB9482:EE_
X-MS-Office365-Filtering-Correlation-Id: 9da63d7e-f166-490f-f20f-08de5a05fe79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sR2HwSO/cC401EqiJOdoLDX5zTeRvfNqSlLdjDFGzxwa13+jOa+pOiobCuQQ?=
 =?us-ascii?Q?9FApR63JDyk4pkQRxpLTH6Kq9UTPk5F37CqU1xr8wZGBQhzrkBL5T6pnWTZK?=
 =?us-ascii?Q?ki0fN0dZixyPrPPE7KOGbTuIkMFp4i4PJC1QgsE+8Jryp2xlLdtF0iyKtnqm?=
 =?us-ascii?Q?mbFaRSL3dWGOu1dvHmf0ZbuBUd/RqDZ4cuftcOarOdibIIJ+lStXsHf0Ap++?=
 =?us-ascii?Q?VJvmEIFPE/eh5KDpxSd3tpamQZNvuzoyLIRBn6LWICnLW9NC/NPKVe/+vfdu?=
 =?us-ascii?Q?qFLrbsylTdR+PfArmcaTFRaSByTwD94iTeC2lnC/dlhadJdogwFOes1fxmeL?=
 =?us-ascii?Q?6k03QITJcWBHjvuev9modXr9u+6z7RyripFfI0bE709zPWPst3LsGtrOzIIu?=
 =?us-ascii?Q?xzCSavoSgZnRQ/asmciETGbYfFeGvTKMjwBqGptnZc2aIY05JlkDUNb0EzMa?=
 =?us-ascii?Q?su/xMmNMQcE3+ZSNe/z5/UC8Knl6pNZ54P0eLi9TrQ3HILsu/gDojlf9tY+t?=
 =?us-ascii?Q?iMbm/nKGjOuWZctLo1fJhWjjteii0fWIbuRJHRj0vk6rAEKt8HBkmQg6CSts?=
 =?us-ascii?Q?CqMd1RA5T/EO1IWXila6eZZS1rNfph8GI+vFoHe/33FsnmWXbSd7XBZKrpwd?=
 =?us-ascii?Q?+RbbB2WtflbAlhxoxffmMzuY/V2KR+7+cOQTYPgj1Kpe0fmb1XKKSnqVLW1l?=
 =?us-ascii?Q?Qs+sBPayb5n6iupgV2C1D+GBb+QHJA3U2beQKT3HsAfP9jYbs9L++5zK+N+I?=
 =?us-ascii?Q?7jK6rCS878aJycleYTKxxSyWLnY4C0r8eLR57zTNBwY6vr/d0uxozWijUvgI?=
 =?us-ascii?Q?0UDtZIXqsh6eo2HErkJgBTVWQ8hqF77BWFS/Vij/UYRHixoj4horRizHKRPz?=
 =?us-ascii?Q?X4QFWPz6+ED9hM7RspFogCuAGC0FS9coy42Pj7cXeNs2+Ehb75m/zy34eZaJ?=
 =?us-ascii?Q?wJEUQvCTsvhjUuIKbLzmI4DzlDxSKQFr3/kUyNwFWz2p094eM24JBR4ufAjk?=
 =?us-ascii?Q?Rub2OeI3XzTS8nlImcKS8ACBrFeV1WxVBWKIvlgg+uVFMqs9UuFiKojiwzQS?=
 =?us-ascii?Q?X8EC/t2P2W7TGV5s8GgNWD6UT5mF7TJOMvAdEjSEXoICH7RZFm+2/jJIbEL9?=
 =?us-ascii?Q?YIY457tE7VC9km9g35pjDizt8vepjVVJYD3jAiFpZ5dLiCsCRBvTr6tszoQo?=
 =?us-ascii?Q?QYhTfaB3eFBj91pugctvuIF5t+54Lzei+SN+F0Mv6Cv7ECC6gGEaU90JyW0r?=
 =?us-ascii?Q?yTZuUxXOiwtgiYQZkBjBmVHzeoPyLa89WhW9CRyjh7bDhzdZkIN1DSoEGY5t?=
 =?us-ascii?Q?QX8Tlfozm31YdRJaoC5ykhd3KGDlCeXdQ1VYReVOoQwpteLc1sKlFhVcx1Ng?=
 =?us-ascii?Q?Tp60iF9tPsly8MDxUrEsfTMCUYgZgehQjvWC8NWHgSEz9lUCXFVuhgN7obpp?=
 =?us-ascii?Q?AWIcB5l1/5MEnFN0MFgZ3KaxPwoHgnfSSKN/FpVi/lCOEWq+Hrd6pYDKAno/?=
 =?us-ascii?Q?ahPuFZO+1QJH7no9ohPj2fr+UTw6ONkHQDmrdRutFZnHLupFUZeTBZ+qKcRW?=
 =?us-ascii?Q?pTWhPeqHHlL8y1feTn13Txwwum45+DPG3DVqH+CW7Hl57BY38bxxeOr+ZzXm?=
 =?us-ascii?Q?WvqryzJ/i7bAE5YF/Ni6SFwkC0OcBnmU4/ljRfndUTIuL36TYS1x7d7pgT7r?=
 =?us-ascii?Q?7aF9Lg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 22:31:32.2333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da63d7e-f166-490f-f20f-08de5a05fe79
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9482

Turing and GA100 use programmed I/O (PIO) instead of DMA to upload
firmware images into Falcon memory.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs         | 135 +++++++++++++++++++++++-
 drivers/gpu/nova-core/falcon/hal.rs     |   2 -
 drivers/gpu/nova-core/firmware/fwsec.rs |   2 +-
 drivers/gpu/nova-core/gsp/boot.rs       |   2 +-
 drivers/gpu/nova-core/regs.rs           |  30 ++++++
 5 files changed, 166 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 344354ed50b8..4f3a3b002725 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -23,6 +23,7 @@
 use crate::{
     dma::DmaObject,
     driver::Bar0,
+    falcon::hal::LoadMethod,
     gpu::Chipset,
     num::{
         FromSafeCast,
@@ -242,7 +243,6 @@ pub(crate) enum FalconMem {
     /// Secure Instruction Memory.
     ImemSecure,
     /// Non-Secure Instruction Memory.
-    #[expect(unused)]
     ImemNonSecure,
     /// Data Memory.
     Dmem,
@@ -410,6 +410,131 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
         Ok(())
     }
 
+    /// Write a slice to Falcon memory using programmed I/O (PIO).
+    ///
+    /// Writes `img` to the specified `target_mem` (IMEM or DMEM) starting at `mem_base`.
+    /// For IMEM writes, tags are set for each 256-byte block starting from `start_tag`.
+    /// For DMEM, start_tag is ignored.
+    ///
+    /// Returns `EINVAL` if `img.len()` is not a multiple of 4.
+    fn pio_wr_slice(
+        &self,
+        bar: &Bar0,
+        img: &[u8],
+        mem_base: u16,
+        target_mem: FalconMem,
+        start_tag: u16,
+    ) -> Result {
+        // Rejecting misaligned images here allows us to avoid checking
+        // inside the loops.
+        if img.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        // NV_PFALCON_FALCON_IMEMC supports up to four ports,
+        // but we only ever use one, so just hard-code it.
+        const PORT: usize = 0;
+
+        match target_mem {
+            FalconMem::ImemSecure | FalconMem::ImemNonSecure => {
+                regs::NV_PFALCON_FALCON_IMEMC::default()
+                    .set_secure(target_mem == FalconMem::ImemSecure)
+                    .set_aincw(true)
+                    .set_offs(mem_base)
+                    .write(bar, &E::ID, PORT);
+
+                for (n, block) in img.chunks(256).enumerate() {
+                    let n = u16::try_from(n)?;
+                    let tag: u16 = start_tag.checked_add(n).ok_or(ERANGE)?;
+                    regs::NV_PFALCON_FALCON_IMEMT::default()
+                        .set_tag(tag)
+                        .write(bar, &E::ID, PORT);
+                    for word in block.chunks_exact(4) {
+                        let w = [word[0], word[1], word[2], word[3]];
+                        regs::NV_PFALCON_FALCON_IMEMD::default()
+                            .set_data(u32::from_le_bytes(w))
+                            .write(bar, &E::ID, PORT);
+                    }
+                }
+            }
+            FalconMem::Dmem => {
+                regs::NV_PFALCON_FALCON_DMEMC::default()
+                    .set_aincw(true)
+                    .set_offs(mem_base)
+                    .write(bar, &E::ID, PORT);
+
+                for word in img.chunks_exact(4) {
+                    let w = [word[0], word[1], word[2], word[3]];
+                    regs::NV_PFALCON_FALCON_DMEMD::default()
+                        .set_data(u32::from_le_bytes(w))
+                        .write(bar, &E::ID, PORT);
+                }
+            }
+        }
+
+        Ok(())
+    }
+
+    /// Perform a PIO write of a firmware section to falcon memory.
+    ///
+    /// Extracts the data slice specified by `load_offsets` from `fw` and writes it to
+    /// `target_mem` using the given port and tag.
+    fn pio_wr<F: FalconFirmware<Target = E>>(
+        &self,
+        bar: &Bar0,
+        fw: &F,
+        target_mem: FalconMem,
+        load_offsets: &FalconLoadTarget,
+        start_tag: u16,
+    ) -> Result {
+        let start = usize::from_safe_cast(load_offsets.src_start);
+        let len = usize::from_safe_cast(load_offsets.len);
+        let mem_base = u16::try_from(load_offsets.dst_start)?;
+
+        // SAFETY: we are the only user of the firmware image at this stage
+        let data = unsafe { fw.as_slice(start, len).map_err(|_| EINVAL)? };
+
+        self.pio_wr_slice(bar, data, mem_base, target_mem, start_tag)
+    }
+
+    /// Perform a PIO copy into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
+    pub(crate) fn pio_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
+        let imem_sec = fw.imem_sec_load_params();
+        let imem_ns = fw.imem_ns_load_params().ok_or(EINVAL)?;
+        let dmem = fw.dmem_load_params();
+
+        regs::NV_PFALCON_FBIF_CTL::read(bar, &E::ID)
+            .set_allow_phys_no_ctx(true)
+            .write(bar, &E::ID);
+
+        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
+
+        self.pio_wr(
+            bar,
+            fw,
+            FalconMem::ImemNonSecure,
+            &imem_ns,
+            u16::try_from(imem_ns.dst_start >> 8)?,
+        )?;
+        self.pio_wr(
+            bar,
+            fw,
+            FalconMem::ImemSecure,
+            &imem_sec,
+            u16::try_from(imem_sec.dst_start >> 8)?,
+        )?;
+        self.pio_wr(bar, fw, FalconMem::Dmem, &dmem, 0)?;
+
+        self.hal.program_brom(self, bar, &fw.brom_params())?;
+
+        // Set `BootVec` to start of non-secure code.
+        regs::NV_PFALCON_FALCON_BOOTVEC::default()
+            .set_value(fw.boot_addr())
+            .write(bar, &E::ID);
+
+        Ok(())
+    }
+
     /// Perform a DMA write according to `load_offsets` from `dma_handle` into the falcon's
     /// `target_mem`.
     ///
@@ -638,6 +763,14 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         self.hal.is_riscv_active(bar)
     }
 
+    // Load a firmware image into Falcon memory
+    pub(crate) fn load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
+        match self.hal.load_method() {
+            LoadMethod::Pio => self.pio_load(bar, fw),
+            LoadMethod::Dma => self.dma_load(bar, fw),
+        }
+    }
+
     /// Write the application version to the OS register.
     pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) {
         regs::NV_PFALCON_FALCON_OS::default()
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index fe6de900e8b0..89babd5f9325 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -17,7 +17,6 @@
 
 /// Method used to load data into falcon memory. Some GPU architectures need
 /// PIO and others can use DMA.
-#[expect(unused)]
 pub(crate) enum LoadMethod {
     /// Programmed I/O
     Pio,
@@ -60,7 +59,6 @@ fn signature_reg_fuse_version(
     fn reset_eng(&self, bar: &Bar0) -> Result;
 
     /// returns the method needed to load data into Falcon memory
-    #[expect(unused)]
     fn load_method(&self) -> LoadMethod;
 }
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 89dc4526041b..a8ec08a500ac 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -420,7 +420,7 @@ pub(crate) fn run(
             .reset(bar)
             .inspect_err(|e| dev_err!(dev, "Failed to reset GSP falcon: {:?}\n", e))?;
         falcon
-            .dma_load(bar, self)
+            .load(bar, self)
             .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
         let (mbox0, _) = falcon
             .boot(bar, Some(0), None)
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 581b412554dc..be427fe26a58 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -183,7 +183,7 @@ pub(crate) fn boot(
         );
 
         sec2_falcon.reset(bar)?;
-        sec2_falcon.dma_load(bar, &booter_loader)?;
+        sec2_falcon.load(bar, &booter_loader)?;
         let wpr_handle = wpr_meta.dma_handle();
         let (mbox0, mbox1) = sec2_falcon.boot(
             bar,
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index ea0d32f5396c..53f412f0ca32 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -364,6 +364,36 @@ pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
     1:1     startcpu as bool;
 });
 
+// IMEM access control register. Up to 4 ports are available for IMEM access.
+register!(NV_PFALCON_FALCON_IMEMC @ PFalconBase[0x00000180[4; 16]] {
+    15:0      offs as u16, "IMEM block and word offset";
+    24:24     aincw as bool, "Auto-increment on write";
+    28:28     secure as bool, "Access secure IMEM";
+});
+
+// IMEM data register. Reading/writing this register accesses IMEM at the address
+// specified by the corresponding IMEMC register.
+register!(NV_PFALCON_FALCON_IMEMD @ PFalconBase[0x00000184[4; 16]] {
+    31:0      data as u32;
+});
+
+// IMEM tag register. Used to set the tag for the current IMEM block.
+register!(NV_PFALCON_FALCON_IMEMT @ PFalconBase[0x00000188[4; 16]] {
+    15:0      tag as u16;
+});
+
+// DMEM access control register. Up to 8 ports are available for DMEM access.
+register!(NV_PFALCON_FALCON_DMEMC @ PFalconBase[0x000001c0[8; 8]] {
+    15:0      offs as u16, "DMEM block and word offset";
+    24:24     aincw as bool, "Auto-increment on write";
+});
+
+// DMEM data register. Reading/writing this register accesses DMEM at the address
+// specified by the corresponding DMEMC register.
+register!(NV_PFALCON_FALCON_DMEMD @ PFalconBase[0x000001c4[8; 8]] {
+    31:0      data as u32;
+});
+
 // Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the falcon
 // instance.
 register!(NV_PFALCON_FALCON_ENGINE @ PFalconBase[0x000003c0] {
-- 
2.52.0

