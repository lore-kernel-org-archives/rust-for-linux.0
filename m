Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012067.outbound.protection.outlook.com [40.107.209.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB8E19539F
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 00:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776299214; cv=fail; b=GGzWWjFFR1AsRx85CIFWAbHXKLvpJD1RpgtanGRF8GfWU+BbmCjgdbGjWVZLAFJSYTOhFSdiF8Bp6Tj8uUSr8L08GCNvAgPS2GzPR1SA8eWSQp/4hkOLOHxt1WOjZSIuzBgp4nXJn7oLjTCfClu66eXeoIHmkvuF0j00/A301tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776299214; c=relaxed/simple;
	bh=ZmDqQmUGsfhY9QvL96oUYQVpQ6OX3wBuyoJP8gGhdQo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PoDgy5tz0CyNsYcBiL9v80QsFQw03FXBwT4lkVJlGCitQ423HKV+i0AxtIVzqn3oT+FxrxaGMcH6vpMVht0UPdTfmyVb32eSICUluV3ZL7LssirNz9JyMQEBfMaR//acvQhtaO+E4EhLNiKE142QsPd2skptzBSt/QpAxb8MccA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WWbssMOV; arc=fail smtp.client-ip=40.107.209.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WWbssMOV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0S26YLAhbC5GwqlwVjJdfJMgfz+jf/eqMu7NmaSOgP1eSEFInDl4mdLoaJjGBRMnjAu+i2MMBSRFhQmmezGQMHXy7A1pwyN7OyNWkxAEPWERxXEI09J9pVNUyRLS/e0KhPP9NeshaZneutDCPfFJn9ATJMyaOZXFvbmuR2udivY52yHVdzMEW2//aIvWJF3SQEs5wmzWVViQqkQ4K4ncxM0DdI+FyMnhyx26zmW3329D0LsuBPq4L/C1g8W4IJZ5/eh2cIgnmm5+1tTfJeA7Eo9o4eFuPBipE3ZSk80Ihqeh+zZo6azYxCjlWHjVnZlUO/AHB8ocklD54H0/byjXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sElyev/ZGuC+CVaOA8PQGZ8YnpZaRa1MPEXNxU+I7JI=;
 b=NcA3VS2/CfPfymWHHQ3YldmUBeLdyKivFeJtuIsb6HHXcOFSlwKLgiXK7l67MPzFlhcu3zzbZTIhsO3uf9qsyAroz/Ivd5oumvxd5vtAOlKU1mHpcwaJxd0osMBcBXyb1/klB4CFBLbxpKqeyst+XaAWpgquK9DO1sQhKDsiqnVUxAjxyC1LcNFrwIflGK5tSdpYYTgWoAqhyOBBkzNc2h2HMp2u7u62mv489wEZ8fimwY6tXlM7lAT4cAVyppfpRcgRihfTgsZKRPqILLeYX8Mm3GBhEWvnle4z2C71tD+l/bsGYYH066KhbUpOlFtwUr1blsohIrnbRGmOt/fpgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sElyev/ZGuC+CVaOA8PQGZ8YnpZaRa1MPEXNxU+I7JI=;
 b=WWbssMOV3Cf3PIAJXfKxAhkoo3xjoIMlO4V5LvOw/9220VSFfv1mj9vtwALoA+eU7/PCeEmE5//OcytHb1hJLXRQS70rrPsqVlDPGRZpW3IMz+UKIhiTTyEsiV8pdp0ywhkQ+8UPcNGRvcSUsToRWN8ylFBiED77dQ1bCLaWLdC45ywiqNdShgiv9t/IE3MwMhTmjCYBDwbDqIuAtmP/UHVaChOwMh7Qgpfo/Tw4BBzy1nfs86SEIu4QH+SccYov5IQxa9JnyrhneVTSogS98Qn1u/aD6SbaO1cgaMfT/kC0VauS9D+ng4vGcRxOU6jcbcRwztE6aZRjIR7OL659/w==
Received: from SJ0P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::24)
 by MN0PR12MB6366.namprd12.prod.outlook.com (2603:10b6:208:3c1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 00:26:48 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::be) by SJ0P220CA0012.outlook.office365.com
 (2603:10b6:a03:41b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Thu,
 16 Apr 2026 00:26:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 00:26:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 17:26:32 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 17:26:31 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 5/6] gpu: nova-core: skip the IFR header if present
Date: Wed, 15 Apr 2026 19:26:18 -0500
Message-ID: <20260416002619.900779-6-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416002619.900779-1-ttabi@nvidia.com>
References: <20260416002619.900779-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|MN0PR12MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: 765a9324-ec03-4562-3a2e-08de9b4ed8d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ub/C9lNKJS44CgazpzmqXaS1jtQ5unQYTYYUA+rpx2vlnEo4lMJAs8FoREqFjhbAN8K8kS/Yaa1+YwdsGpqnX5hHYqUWwSKC1zION5A90C21keA1h1mHsjqC1mOFSsymh6cSmUuXW/w3HYQ7WD9HwZZ3YhwPZn2Cyb22ZXFlav55ERyE6BVqE8rF00QQcENp6vt+djhzEkpxBsKJ1Kp6MjKgHu/yT8O4I+NQcN9fZ2C8H9RsmK/w2g+1QqK1MjVpIYj9pPXE/2nw8YzVm1s35KBNfuI8WptsK/PEQDjvK7BKbAtxEtQmWvYP0XIc0+UEm4jZ1OcaLVzgSDYJHrEsiPAYUMPyE/Gm+U3uV/2u+QPHnDcWS09ezFEVUCcMn7QWAO0OWrpR7yn8iwu6UzpccfewxruodpZT1/cdngvyXN1JxrCzEeMGf72aYmWMxLRnTkr8EdDWFYdj6dCKJZ5XKzFbKcK67Vn6y1GnEU/ubrIVfo1w41CnJae9tu5M2iZggbQLRttS+eI14Has6naexKvyobPTPP+A/vOT2csURmO4C/TrRPdtOQXFkakbR5+S00cBRQm2rpXkaRzP5Jd4leGLPtx/VRu0Qm9Do4bgvT/50Qu5Wykr4G/O3Diooam0rN7itbS09PexaQtQHopxSBulFc9cB7Pgd6nBA0utaANDaJNig8GXYGVXH6abg/VrlmDVcc4b67Qvu20WUU4POrzq/y/OLqjOdwWigrAWO+6nqDz+P1pi0Gzl8XAWGxbh07JZILmSRf0OEa3LjlysEQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JIZAo2qNwPMP+mT8Vmn6qaXxP+twhqowfQ1M3CxgEWUyp7EsUvs82ucGld+eOoyK1MLBqeAm1qC+wFeQj3OW4dCK3y17RAemSIbbQEd740XyAG3dD/UiXsvWxT1myXHwuETI6hV5bdrel/3FS1EtWhkEmkR8vETQ1b7Jx60U3TBSxhYvNiSHYPeU1n4NAy9b9TddLhvoJqsgpkOWSI7+2tw2Nlvqq0qnoExHXn9HulHV2hUV1Rdy+hv7X8FQ5P+5MEO44ZlcTYkqF9ckK+k3yRiwSjKOXz3aUqEN2bZaQXP/qC8kVQUXoMh6en8Sq1Uhabho/H+wpxTf1yJm2Dp77vahLe2/ZzHnXQ+ncXNSNsEH3Y5whuXkM6Sioq/c/AfsGssf0e4EgUjH9ZS6laSmR7AKsYqpKnYwzRVMMWKL4CnFJ6DyVQ+4X6pOne8mIuH8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 00:26:47.9838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 765a9324-ec03-4562-3a2e-08de9b4ed8d6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6366

The GPU's ROM may begin with an Init-from-ROM (IFR) header that precedes
the PCI Expansion ROM images (VBIOS).  When present, the PROM shadow
method must parse this header to determine the offset where the PCI ROM
images actually begin, and adjust all subsequent reads accordingly.

On most GPUs this is not needed because the IFR microcode has already
applied the ROM offset so that PROM reads transparently skip the header.
On GA100, for whatever reason, the IFR offset is not applied to PROM
reads.  Therefore, the search for the PCI expansion must skip the IFR
header, if found.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/regs.rs  | 21 ++++++++++++
 drivers/gpu/nova-core/vbios.rs | 61 +++++++++++++++++++++++++++++++++-
 2 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 2f171a4ff9ba..0880d52e4527 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -537,4 +537,25 @@ pub(crate) mod ga100 {
             0:0     display_disabled => bool;
         }
     }
+
+    // IFR Header in VBIOS
+
+    register! {
+        pub(crate) NV_PBUS_IFR_FMT_FIXED0(u32) @ 0x300000 {
+            31:0    signature;
+        }
+    }
+
+    register! {
+        pub(crate) NV_PBUS_IFR_FMT_FIXED1(u32) @ 0x300004 {
+            30:16   fixed_data_size;
+            15:8    version => u8;
+        }
+    }
+
+    register! {
+        pub(crate) NV_PBUS_IFR_FMT_FIXED2(u32) @ 0x300008 {
+            19:0 total_data_size;
+        }
+    }
 }
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index e726594eb130..f8ddbd9c4b43 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -25,6 +25,7 @@
         FalconUCodeDescV3, //
     },
     num::FromSafeCast,
+    regs::ga100, //
 };
 
 /// The offset of the VBIOS ROM in the BAR0 space.
@@ -89,13 +90,71 @@ struct VbiosIterator<'a> {
     last_found: bool,
 }
 
+/// IFR signature: ASCII "NVGI" as a little-endian u32.
+const NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE: u32 = 0x4947564E;
+/// ROM directory signature: ASCII "RFRD" as a little-endian u32.
+const NV_ROM_DIRECTORY_IDENTIFIER: u32 = 0x44524652;
+/// Offset of the NV_PMGR_ROM_ADDR_OFFSET register in IFR Extended section
+const IFR_SW_EXT_ROM_ADDR_OFFSET: usize = 4;
+/// Size of Redundant Firmware Flash Status section
+const RFW_FLASH_STATUS_SIZE: usize = 4096;
+
+/// Return the byte offset where the PCI Expansion ROM images begin in the GPU's ROM.
+///
+/// The GPU's ROM may begin with an Init-from-ROM (IFR) header that precedes
+/// the PCI Expansion ROM images (VBIOS).  When present, the PROM shadow
+/// method must parse this header to determine the offset where the PCI ROM
+/// images actually begin, and adjust all subsequent reads accordingly.
+///
+/// On most GPUs this is not needed because the IFR microcode has already
+/// applied the ROM offset so that PROM reads transparently skip the header.
+/// On GA100, for whatever reason, the IFR offset is not applied to PROM
+/// reads.  Therefore, the search for the PCI expansion must skip the IFR
+/// header, if found.
+fn current_offset(dev: &device::Device, bar0: &Bar0) -> Result<usize> {
+    let signature = bar0.read(ga100::NV_PBUS_IFR_FMT_FIXED0).signature();
+
+    if signature == NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE {
+        let fixed1 = bar0.read(ga100::NV_PBUS_IFR_FMT_FIXED1);
+
+        match fixed1.version() {
+            // Note: We do not actually expect to see v1 or v2 on these GPUs
+            1 | 2 => {
+                let fixed_data_size = usize::from(fixed1.fixed_data_size());
+                let pmgr_rom_addr_offset = fixed_data_size + IFR_SW_EXT_ROM_ADDR_OFFSET;
+                bar0.try_read32(ROM_OFFSET + pmgr_rom_addr_offset)
+                    .map(|v| v as usize)
+            }
+            3 => {
+                let fixed2 = bar0.read(ga100::NV_PBUS_IFR_FMT_FIXED2);
+                let total_data_size = usize::from(fixed2.total_data_size());
+                let dir_offset =
+                    bar0.try_read32(ROM_OFFSET + total_data_size)? as usize + RFW_FLASH_STATUS_SIZE;
+                let dir_sig = bar0.try_read32(ROM_OFFSET + dir_offset)?;
+                if dir_sig != NV_ROM_DIRECTORY_IDENTIFIER {
+                    dev_err!(dev, "could not find IFR ROM directory\n");
+                    return Err(EINVAL);
+                }
+                bar0.try_read32(ROM_OFFSET + dir_offset + 8)
+                    .map(|v| v as usize)
+            }
+            _ => {
+                dev_err!(dev, "unsupported IFR header version {}\n", fixed1.version());
+                Err(EINVAL)
+            }
+        }
+    } else {
+        Ok(0)
+    }
+}
+
 impl<'a> VbiosIterator<'a> {
     fn new(dev: &'a device::Device, bar0: &'a Bar0) -> Result<Self> {
         Ok(Self {
             dev,
             bar0,
             data: KVec::new(),
-            current_offset: 0,
+            current_offset: current_offset(dev, bar0)?,
             last_found: false,
         })
     }
-- 
2.53.0

