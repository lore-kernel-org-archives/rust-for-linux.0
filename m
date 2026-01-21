Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013058.outbound.protection.outlook.com [40.93.201.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AEE426EAD
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 23:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769039629; cv=fail; b=fHKEaBhpWdj2Mt9IOy5xB4e7fnRmdOzFGeZRL5kOPX59s13QSm/ICZlnuQqnw1bYVO00ctAqHwVeiyAggXyJoRNQ4VBiPIaps2uNEiMoB1wHBJJZ/QVd3Aig+gcFWc8k5ojr2THs9x42pgCWze3LRs3WuMO+iB0BWU6JLiM/EdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769039629; c=relaxed/simple;
	bh=F6J3UQxTYC3cbv7QX4rtZNXLvSpTv535LGONoNDRAqA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uc1Kp+Pp24Gv6AUwXfV7szF4SkRqYvTh809/wddKGZaegC2TrduMHrCzWcokLbXACv+h75/kFSwK5G8VMh2KJyzHXml5B5cT9j3YTWzQHhU1CeganKWj8W0rh7NuXr3m4CO3XfeE86XsHuvRAybU4cEtsfhBIzzsPG8eSLQS2zw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S3GBfMty; arc=fail smtp.client-ip=40.93.201.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S3GBfMty"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2EtHfLC/2vP4Q0+gldPlrUKo2Y/TuZyH9vyA7/EEgV/GRdfyBOzyPaC477D1Ymhl6a/voYwcW8xp2YWAKX/vZk8cM/0OI1U3kZAD5vDcxnnwIhvrPjvAChBr0bSHsgovuzpMOQ0yWPnfdYMWK1FzQz38Gn0p8BYDsxdzOXiHN96giOg6V+1j6AG22kJ1Ip1khMF5e05ksybH3wXVKgcx+yp2EUuvEzlDF0drsKpApLJsfXW3AnB+YBO0y7vpCmIOnkSM2gMkMiskSbwaHVy53W25wSSk6/sg8J0RYuCqw/wXVaSA7VTAaY4v12xP0uyKHzGhTo4c0cyLfHBoNwAfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzDrRoCnsZQSV8PxAoHNcpPuhgQMmhIjtAXq2WZMyiI=;
 b=uvYpmST6oHAq1UFEp91QsmVEGHlXrWWMqnZN4HAtUWFdHwkdD6AyUJAMD2pVXqSztJua/JOtJQlm8BowBtb2eaLN5WwbVGg7ZjMIRWUBq2Pz9wGTIvhHH1FU6qFFB+EgP71/HfdkIhXD+hyLuX4PhMe8X8fhAcUJovuoSKMnG4UMfFn+umAae1vXGLd5rGHXcBpKviCjCH2uv/BRrRXTh7sbZXBsiguLW1YLTSx75UP+k4C2JGbJ5LX0bTZVQRp/NXFpIsDTsaYwtFRB/hV79eh7yvLBkxjtQhd/anW+N+UGjkGlCV+UfyiEaaoh9nkCeBowBenq1eXJQ6jszp84/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzDrRoCnsZQSV8PxAoHNcpPuhgQMmhIjtAXq2WZMyiI=;
 b=S3GBfMtyRpF2QQzQjYPXEoiitxTdtLo8oZHO0BjaMPImmq7kIlUG4KE4hA0xN8BzIBDjmSwu+IGweQ5NcTX4AwqhxvSKf1bXb5ttpH6q88MgMimsNXktiGumMk0sbJ0WUFJxyZ2xJilP+vqOhhkMXaDSTulpuo7bA9WP9nx6iRF4DLDBmbH19w8K/82ZwrVyxvaDxr4vWcPhXMKhJTo8Yj02AcgBj7U6KULpX0u3CfkZ/3adQ/1ayDd+FUY6x0yrl4fRl7OWizM0xEnXTcF8huct7J/kArDd6G35n/tL2NHDDgV0qdjkYp0Ndp2Q3736yq9q5zC8rt6UNaytA0Qufw==
Received: from SJ2PR07CA0016.namprd07.prod.outlook.com (2603:10b6:a03:505::16)
 by LV9PR12MB9808.namprd12.prod.outlook.com (2603:10b6:408:2e7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 23:53:40 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::21) by SJ2PR07CA0016.outlook.office365.com
 (2603:10b6:a03:505::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 23:53:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 23:53:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:25 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:23 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v7 12/12] gpu: nova-core: add PIO support for loading firmware images
Date: Wed, 21 Jan 2026 17:53:02 -0600
Message-ID: <20260121235302.1962185-13-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121235302.1962185-1-ttabi@nvidia.com>
References: <20260121235302.1962185-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|LV9PR12MB9808:EE_
X-MS-Office365-Filtering-Correlation-Id: e686723e-8e98-4d82-34cc-08de59484d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m/NSIAgKHtWkS0eoNxgZ82mn/fL6FSmPZ7wFJUuXY/OgVykGHozK5wDprezA?=
 =?us-ascii?Q?S7GjYwBcQnsUdpjAUIfL0INmfvIehzXgGbbCKzNe0zq3aLL7BVXcqondt/5n?=
 =?us-ascii?Q?to1tkx3D9jJSrRuTxHlgY4YztTWBR70c3wBh7/45EL5fxflrSA/kF/u9ezE/?=
 =?us-ascii?Q?VPAFi84rbenxIMMap43gfShwK6TeNIb6RLv48FJj1DZh+wAgLtLjzWzsBtpc?=
 =?us-ascii?Q?YYn1HjyEW3wPdHi9s3CR87icJV3b/WgjkKG0a1V7sA98tGxkv2cWmxrg8YlK?=
 =?us-ascii?Q?vLskhYI3PX+2N4tCGu3z5Ce1kWaIC1ho3Md2V7Ry6+ViAQfTfYuIzdpOMpWL?=
 =?us-ascii?Q?tO/HeOgCAaHHJjSed2wlfSCmBvxFahu/CzfupE3FeUOjDdlFg/9qbHSE7Thh?=
 =?us-ascii?Q?u/Fn5VMJJTG3wq5Pm5pmbMkeqMk1i0VbLN4R70JsbeCGB3dZiWL7DbZHuo7W?=
 =?us-ascii?Q?JNliFtnFRbuRs1L2MD2tchlP10UZIdtS1IFNdL6a8fwfv7wOxzYYdQiLpYFz?=
 =?us-ascii?Q?4okyob+/Kpe4LZ6+LgLVTV0Nobmx5eMfJVSqwNZxp74luCfGH9FwKqDSlY1a?=
 =?us-ascii?Q?OF53N5oYM+p/KJkxdC53sqGfPUNjBgWWxDoS2x2nVMdn2leJvM7NXsjXZPMz?=
 =?us-ascii?Q?/R6/YdOQQFSghXdwOGmO8hdi7lKn/6EKfWZtC1DYy3jlthUsfDSh4qZg/GN6?=
 =?us-ascii?Q?SXl0YT4cckdWzrQVDHMpWW5I+mB7OmApPSBfASaxhbV1yPDov9gQqU3o0tiB?=
 =?us-ascii?Q?UvwAzPn4mSjOc2tUivggUS2UXhaYoseUwB1xqWL/hVJgOvHXu2shy/msQXDI?=
 =?us-ascii?Q?5RG6uznNrxNfDaqceYmtyI/dZunN5Jfke118eWOsD6r25th9bMbYpoqfDvtU?=
 =?us-ascii?Q?cKmY9ikUm3ZcLwsUg93Jzjhqk2TzN3FBITti8fWAOMnFrWxCsfezC7locXQW?=
 =?us-ascii?Q?2t03zIi7oi7wBEND3J5FYHAjbQvYdTxV3TkWIiVMaoj/c2pwlCSocgnBHpFD?=
 =?us-ascii?Q?KtcKL6+Z0uE91z6BZ4bRfNRSbOEdOoCsRGUuFuLQ1imWPO0pDS/H/g7UQ9jd?=
 =?us-ascii?Q?yTbifgj2vKJFlw/fAoF1l1TKPIR1HBMnjswEdgmpOvAimLLQCyR7y6iniDAC?=
 =?us-ascii?Q?a4ewKvMToEp+J+mrrLmyJfnIb9l7eBS7U//o3UF95aWfG2rza/V0h0byaElR?=
 =?us-ascii?Q?pCCWv3vH+LS81BrszvgTMM97YyI8c6DovxHiM7tOjtE8OJ++HeOAshr4PY8R?=
 =?us-ascii?Q?isxs0hFZk6B2kBkOHjDALLhrB8cmx4oqjgzMiHuQq4c94E6hU91tNahMHtSx?=
 =?us-ascii?Q?EU5bT36wXZQeKETgpf7b3YUr6x9sA6/ImyOpR30mQEeYq5qZQI/BpYH9olF8?=
 =?us-ascii?Q?IN2qycsFA7maesnL5JZaw0jjQzefeNi+/F1WXjcB00AK53q60CFfv8hwf5Yf?=
 =?us-ascii?Q?ADXYhNHpiisH4cI5gku9V/ighmevEpsH6Krqfg9Z6FTVpW8ps4eJ4N96QB7A?=
 =?us-ascii?Q?F1WEWTnOU8UWZJ8Mbip07C+pp8YnJpgB2H/jCerHTFisR8OQ/wmUuiYMcncg?=
 =?us-ascii?Q?7tDbf4RV9OhrVemH8vOnVOdu3SojkaTXecjCrdffSqackWncIwqu3gjai1Xf?=
 =?us-ascii?Q?jyUiWk/DZv9S9oZJCZHG8wr9D2s+y1M5PqIR9WHUEKX9wrbeefUpOHWDZ80Z?=
 =?us-ascii?Q?JhatAw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 23:53:40.3894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e686723e-8e98-4d82-34cc-08de59484d76
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9808

Turing and GA100 use programmed I/O (PIO) instead of DMA to upload
firmware images into Falcon memory.

A new firmware called the Generic Bootloader (as opposed to the
GSP Bootloader) is used to upload FWSEC.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs         | 183 ++++++++++++++++++++++++
 drivers/gpu/nova-core/firmware/fwsec.rs | 129 ++++++++++++++++-
 drivers/gpu/nova-core/gsp/boot.rs       |   6 +-
 drivers/gpu/nova-core/regs.rs           |  30 ++++
 4 files changed, 344 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index d779fcda0e2a..ccb5390ae9c2 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -18,11 +18,17 @@
     time::{
         Delta, //
     },
+    transmute::AsBytes, //
 };
 
 use crate::{
     dma::DmaObject,
     driver::Bar0,
+    falcon::hal::LoadMethod,
+    firmware::fwsec::{
+        BootloaderDmemDescV2,
+        GenericBootloader, //
+    },
     gpu::Chipset,
     num::{
         FromSafeCast,
@@ -409,6 +415,170 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
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
+            	    regs::NV_PFALCON_FALCON_IMEMT::default()
+            	        .set_tag(tag)
+            	        .write(bar, &E::ID, PORT);
+                    for word in block.chunks_exact(4) {
+                        let w = [word[0], word[1], word[2], word[3]];
+                        regs::NV_PFALCON_FALCON_IMEMD::default()
+                            .set_data(u32::from_le_bytes(w))
+                            .write(bar, &E::ID, PORT);
+                    }
+            	}
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
+    pub(crate) fn pio_load<F: FalconFirmware<Target = E>>(
+        &self,
+        bar: &Bar0,
+        fw: &F,
+        gbl: Option<&GenericBootloader>,
+    ) -> Result {
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
+        // If the Generic Bootloader was passed, then use it to boot FRTS
+        if let Some(gbl) = gbl {
+            let dst_start = u16::try_from(0x10000 - gbl.desc.code_size)?;
+            let data = &gbl.ucode[..usize::from_safe_cast(gbl.desc.code_size)];
+            let tag = u16::try_from(gbl.desc.start_tag)?;
+
+            self.pio_wr_slice(bar, data, dst_start, FalconMem::ImemNonSecure, tag)?;
+
+            // This structure tells the generic bootloader where to find the FWSEC
+            // image.
+            let dmem_desc = BootloaderDmemDescV2 {
+                reserved: [0; 4],
+                signature: [0; 4],
+                ctx_dma: 4, // FALCON_DMAIDX_PHYS_SYS_NCOH
+                code_dma_base: fw.dma_handle(),
+                non_sec_code_off: imem_ns.dst_start,
+                non_sec_code_size: imem_ns.len,
+                sec_code_off: imem_sec.dst_start,
+                sec_code_size: imem_sec.len,
+                code_entry_point: 0,
+                data_dma_base: fw.dma_handle() + u64::from(dmem.src_start),
+                data_size: dmem.len,
+                argc: 0,
+                argv: 0,
+            };
+
+            regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 4, |v| {
+                v.set_target(FalconFbifTarget::CoherentSysmem)
+                    .set_mem_type(FalconFbifMemType::Physical)
+            });
+
+            self.pio_wr_slice(bar, dmem_desc.as_bytes(), 0, FalconMem::Dmem, 0)?;
+        } else {
+            self.pio_wr(
+                bar,
+                fw,
+                FalconMem::ImemNonSecure,
+                &imem_ns,
+                u16::try_from(imem_ns.dst_start >> 8)?,
+            )?;
+            self.pio_wr(
+                bar,
+                fw,
+                FalconMem::ImemSecure,
+                &imem_sec,
+                u16::try_from(imem_sec.dst_start >> 8)?,
+            )?;
+            self.pio_wr(bar, fw, FalconMem::Dmem, &dmem, 0)?;
+        }
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
@@ -637,6 +807,19 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         self.hal.is_riscv_active(bar)
     }
 
+    // Load a firmware image into Falcon memory
+    pub(crate) fn load<F: FalconFirmware<Target = E>>(
+        &self,
+        bar: &Bar0,
+        fw: &F,
+        gbl: Option<&GenericBootloader>,
+    ) -> Result {
+        match self.hal.load_method() {
+            LoadMethod::Pio => self.pio_load(bar, fw, gbl),
+            LoadMethod::Dma => self.dma_load(bar, fw),
+        }
+    }
+
     /// Write the application version to the OS register.
     pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) {
         regs::NV_PFALCON_FALCON_OS::default()
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 89dc4526041b..762674ca5087 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -40,12 +40,15 @@
         FalconLoadTarget, //
     },
     firmware::{
+        BinHdr,
         FalconUCodeDesc,
         FirmwareDmaObject,
         FirmwareSignature,
         Signed,
         Unsigned, //
+        FIRMWARE_VERSION,
     },
+    gpu::Chipset,
     num::{
         FromSafeCast,
         IntoSafeCast, //
@@ -213,6 +216,68 @@ unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
     T::from_bytes_mut(unsafe { fw.as_slice_mut(offset, size_of::<T>())? }).ok_or(EINVAL)
 }
 
+/// Descriptor used by RM to figure out the requirements of the boot loader.
+#[repr(C)]
+#[derive(Debug, Clone)]
+pub(crate) struct BootloaderDesc {
+    /// Starting tag of bootloader.
+    pub start_tag: u32,
+    /// DMEM offset where [`BootloaderDmemDescV2`] is to be loaded.
+    pub dmem_load_off: u32,
+    /// Offset of code section in the image.
+    pub code_off: u32,
+    /// Size of code section in the image.
+    pub code_size: u32,
+    /// Offset of data section in the image.
+    pub data_off: u32,
+    /// Size of data section in the image.
+    pub data_size: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for BootloaderDesc {}
+
+/// Structure used by the boot-loader to load the rest of the code.
+///
+/// This has to be filled by the GPU driver and copied into DMEM at offset
+/// [`BootloaderDesc.dmem_load_off`].
+#[repr(C, packed)]
+#[derive(Debug, Clone)]
+pub(crate) struct BootloaderDmemDescV2 {
+    /// Reserved, should always be first element.
+    pub reserved: [u32; 4],
+    /// 16B signature for secure code, 0s if no secure code.
+    pub signature: [u32; 4],
+    /// DMA context used by the bootloader while loading code/data.
+    pub ctx_dma: u32,
+    /// 256B-aligned physical FB address where code is located.
+    pub code_dma_base: u64,
+    /// Offset from `code_dma_base` where the non-secure code is located (must be multiple of 256).
+    pub non_sec_code_off: u32,
+    /// Size of the non-secure code part.
+    pub non_sec_code_size: u32,
+    /// Offset from `code_dma_base` where the secure code is located (must be multiple of 256).
+    pub sec_code_off: u32,
+    /// Size of the secure code part.
+    pub sec_code_size: u32,
+    /// Code entry point invoked by the bootloader after code is loaded.
+    pub code_entry_point: u32,
+    /// 256B-aligned physical FB address where data is located.
+    pub data_dma_base: u64,
+    /// Size of data block (should be multiple of 256B).
+    pub data_size: u32,
+    /// Arguments to be passed to the target firmware being loaded.
+    pub argc: u32,
+    /// Number of arguments to be passed to the target firmware being loaded.
+    pub argv: u32,
+}
+// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for BootloaderDmemDescV2 {}
+
+pub(crate) struct GenericBootloader {
+    pub desc: BootloaderDesc,
+    pub ucode: KVec<u8>,
+}
+
 /// The FWSEC microcode, extracted from the BIOS and to be run on the GSP falcon.
 ///
 /// It is responsible for e.g. carving out the WPR2 region as the first step of the GSP bootflow.
@@ -221,6 +286,8 @@ pub(crate) struct FwsecFirmware {
     desc: FalconUCodeDesc,
     /// GPU-accessible DMA object containing the firmware.
     ucode: FirmwareDmaObject<Self, Signed>,
+    /// Generic bootloader
+    gen_bootloader: Option<GenericBootloader>,
 }
 
 impl FalconLoadParams for FwsecFirmware {
@@ -245,7 +312,19 @@ fn brom_params(&self) -> FalconBromParams {
     }
 
     fn boot_addr(&self) -> u32 {
-        0
+        match &self.desc {
+            FalconUCodeDesc::V2(_v2) => {
+                // On V2 platforms, the boot address is extracted from the
+                // generic bootloader, because the gbl is what actually copies
+                // FWSEC into memory, so that is what needs to be booted.
+                if let Some(ref gbl) = self.gen_bootloader {
+                    gbl.desc.start_tag << 8
+                } else {
+                    0
+                }
+            }
+            FalconUCodeDesc::V3(_v3) => 0,
+        }
     }
 }
 
@@ -346,6 +425,7 @@ impl FwsecFirmware {
     /// command.
     pub(crate) fn new(
         dev: &Device<device::Bound>,
+        chipset: Chipset,
         falcon: &Falcon<Gsp>,
         bar: &Bar0,
         bios: &Vbios,
@@ -402,9 +482,54 @@ pub(crate) fn new(
             ucode_dma.no_patch_signature()
         };
 
+        // The Generic Bootloader exists only on Turing and GA100.  To avoid a bogus
+        // console error message on other platforms, only try to load it if it's
+        // supposed to be there.
+        let gbl_fw = if chipset < Chipset::GA102 {
+            Some(super::request_firmware(
+                dev,
+                chipset,
+                "gen_bootloader",
+                FIRMWARE_VERSION,
+            )?)
+        } else {
+            None
+        };
+
+        let gbl = match gbl_fw {
+            Some(fw) => {
+                let hdr = fw
+                    .data()
+                    .get(0..size_of::<BinHdr>())
+                    .and_then(BinHdr::from_bytes_copy)
+                    .ok_or(EINVAL)?;
+
+                let desc_offset = usize::from_safe_cast(hdr.header_offset);
+                let desc = fw
+                    .data()
+                    .get(desc_offset..desc_offset + size_of::<BootloaderDesc>())
+                    .and_then(BootloaderDesc::from_bytes_copy)
+                    .ok_or(EINVAL)?;
+
+                let ucode_start = usize::from_safe_cast(hdr.data_offset);
+                let ucode_size = usize::from_safe_cast(hdr.data_size);
+                let ucode_data = fw
+                    .data()
+                    .get(ucode_start..ucode_start + ucode_size)
+                    .ok_or(EINVAL)?;
+
+                let mut ucode = KVec::new();
+                ucode.extend_from_slice(ucode_data, GFP_KERNEL)?;
+
+                Some(GenericBootloader { desc, ucode })
+            }
+            None => None,
+        };
+
         Ok(FwsecFirmware {
             desc,
             ucode: ucode_signed,
+            gen_bootloader: gbl,
         })
     }
 
@@ -420,7 +545,7 @@ pub(crate) fn run(
             .reset(bar)
             .inspect_err(|e| dev_err!(dev, "Failed to reset GSP falcon: {:?}\n", e))?;
         falcon
-            .dma_load(bar, self)
+            .load(bar, self, self.gen_bootloader.as_ref())
             .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
         let (mbox0, _) = falcon
             .boot(bar, Some(0), None)
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 581b412554dc..f253d5f12252 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -48,6 +48,7 @@ impl super::Gsp {
     /// created the WPR2 region.
     fn run_fwsec_frts(
         dev: &device::Device<device::Bound>,
+        chipset: Chipset,
         falcon: &Falcon<Gsp>,
         bar: &Bar0,
         bios: &Vbios,
@@ -65,6 +66,7 @@ fn run_fwsec_frts(
 
         let fwsec_frts = FwsecFirmware::new(
             dev,
+            chipset,
             falcon,
             bar,
             bios,
@@ -144,7 +146,7 @@ pub(crate) fn boot(
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
 
         let booter_loader = BooterFirmware::new(
             dev,
@@ -183,7 +185,7 @@ pub(crate) fn boot(
         );
 
         sec2_falcon.reset(bar)?;
-        sec2_falcon.dma_load(bar, &booter_loader)?;
+        sec2_falcon.load(bar, &booter_loader, None)?;
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

