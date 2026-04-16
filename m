Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010066.outbound.protection.outlook.com [52.101.201.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897AC37107F
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 23:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776382314; cv=fail; b=dqzUJXp2JN0G2lI+Gke3BDOgIar4Okc+D3yWAXMuQcKC/hI0QFTeI1tB6MZZRR6nWxIE0tWuxBUa/Q6HJPTMOpqVLCyGAphKp2iIkaKLG+dmDGRebIusrQ47l+J2yiOGVj/ZEe4KgtbawfosImDERS6Lb88bo6QiQU1t2wiWXSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776382314; c=relaxed/simple;
	bh=ZnOVcn7Rnvz79bBY54VdSj0treT5tIQ9cw7sfJoTp5Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DR6FxezapqWuHZJTdBukntUt9SzLyJjUYlVt12Da8C+JJpwIhiWKd4d8SXrqtOCyfquHqQ6KEYV0bM2dZ8SnTRISZPhEhsW5a4AVXjnVQYYtm7p10hc7AtLNoB60GjEpATTOyhNXNTH/j2YPKPuiwXGDwoj2FwhCQUEMpr+eVvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BQFZjw5d; arc=fail smtp.client-ip=52.101.201.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BQFZjw5d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g65ngEojPaSQD7LGV0BJP1o527WWkzjQ59lvlPwhxEp8/iseiP280hFis70QBZ3ih1p9RZJFSta5gSrCWsj5VVkUOD9iqE2CcKpz97Vn0ktNwe41rrScmJwdCG1R3rpwwJ4kS/CfCAe2sNwJ+IGLcwgimNFvp1w1XXaRYNoY5lR19wS1xLNC4oMCbe0HnjkELXX2J2fi6EZQPpORAj9j1AuncqOLfVv2XnuA/6lORcJLQVZxdaOYRacTkhrtYhcvuTbvvzrGj/8+zvdMmvEVwmtCO4fexzlr+Ut9RwOdtec2A6iuMn5pwsXcgyxUclo5aBv18Qs1EMukhFI65v09Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TErB0Oy8sOnp73GjTRU3v4pzjbosx5C/IE0MRJ4228Q=;
 b=T3q1h06CVflneUAs6Cu1UVczQxEhdMQrBCINmwVJLp56S1vuhnilRvT8IC0kjELm30ygAGYmipIGXXSSktb3eboAv6lKIUZp2yZhj/hC3zTs+21YchgzFaFKcVHCPnYaoGRMlXzMk4sGVjLcOvFLwg0Xo9gGwe5yAR7dBcUZIk1EWs8FmzoLtwLPtGUt0p0jNZFrmr9/mFXO8FHijp0bYyYeLVTG5aBa2ESf4Y0W/bZL+9Gm9BnOr2590ChEer7DERiMCpnn8lIGBilpbfzbCdEQfJ/jJ79ewU9HKMCy3/Qw8xFM79LLa17j4mfyoxjQeLnIgE64W5fcxAS5Dp1EBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TErB0Oy8sOnp73GjTRU3v4pzjbosx5C/IE0MRJ4228Q=;
 b=BQFZjw5dYEvscrziKlO5mP17Qop9ZwtIBwSs7XerJ0tFa4W91An28qR3fnXyrpBl0Hp8zuOjiHMWYy/YRIcv6dDFQWFTGTc9MyJmK3KTKMQFWCqhS7kS8yccNGnE73LQgGfW6XoalPjksux5By1LcZsbAtKfL+k7sPPaM8oQnSSpkOThr5LRga0xGNJmbCUWBPR7ARzMNJ7j8oq0+eqnVlcDM8zCqzjWhPjw/9XgVdYQi8NnHV4W2txDD160o18IPscLHNvmQc787eTEdLvfxsuD+cR6CZP+uGApzUpt3G2f/ADk3xpFVqEAQB2MvD3Ga53a8Q3Wiz51zD88pIOxFQ==
Received: from BY5PR17CA0055.namprd17.prod.outlook.com (2603:10b6:a03:167::32)
 by SJ2PR12MB8739.namprd12.prod.outlook.com (2603:10b6:a03:549::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 23:31:48 +0000
Received: from CO1PEPF00012E7F.namprd03.prod.outlook.com
 (2603:10b6:a03:167:cafe::e5) by BY5PR17CA0055.outlook.office365.com
 (2603:10b6:a03:167::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 23:31:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF00012E7F.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 23:31:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 16:31:29 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 16:31:28 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v4 5/6] gpu: nova-core: skip the IFR header if present
Date: Thu, 16 Apr 2026 18:31:16 -0500
Message-ID: <20260416233117.1057427-6-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416233117.1057427-1-ttabi@nvidia.com>
References: <20260416233117.1057427-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7F:EE_|SJ2PR12MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: 32699446-d5e2-4376-1525-08de9c105490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Lwk5bNI7rGSdhJ5VraEsMMfyMjOnc+22OMvnv/aE1+aUZFEnqfniYNdwV6vQvhDK2kCt+piYJSfyH+zkHBsRV6s7dTu4cRZOa2+iwnMS7M2D7vPFX9dgtiq6ti0f62capbnLpH+oLcd8xX/eIeEMvTw2Anz6PUolawRhXUMvyKV6y7kQBLZ4YW3U4J7MPnn6ZEPTq5CFN3SSsecfsZ2QY17y3GKNi09Mtb6ZOD+5LnEOp7a449543/jJ8R2YPMdU+EmSw8wr+eOVSXMJD0Pc9mPDImA7jx3mauyRs86Q4NrP3OIHUpQFHOeB0vqeF6fE3ODZ6zoG7LOxC+wDnXxqTIzKRjMhnELFH1lTpB0aLTgV7bOcyzc/tqYhYx6tPktlN2fgLXOcuDxJMt6wsS9iQviYnp/3LnJFdfwrENWNR/p0tQ7LwHFkv1ykSV32dINmxd3mpcCGXroK7uswGgBwksoPpdWzHxGyHLz4YpdKaWQs1P6kIpbNXeOkdhxer94kg4CxUZSfoUUs5dp+ofrfbkxMDm0vsGTzsx67fiu19iedSdHKn9huqHxb3M54RMVtIpvzVoqE9RH5vcymMBk5aU+2NJG4sRFSfUBkpvN3q+xg7dPPZofGYcBirQG30An9fSuBEHjUIQgjVjwqyIy7rN/51+WuGlbyQrv/i1tdr/3NUL6C+C5q9JAC5FJjJWDXuY152bclEv5v9LddnDMnZXlkclZdD8hNRxZmS0MsPT0rdKzjQDDfBYugt8rLAo64cHaXkUIaScJ8muVNw/sVVA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1ArW1iofrOv58k/pawAz0POYR4qIn740JMWdfOP1grJuMTO67jtEtp3bltYTV4K3+YbD6C73JV7Y+qfxUhm8ekm7ZvZ+zIgTzi+UhG0Oe8X66fPeX6RF/CQlLpq8Cf3PETTq34YbRw0Dv6S10clW3QdH6MlYApzc02Uu55L0yxt1AZnaJPpjR6pqlUSXMUiPzrzfgk+2uZCp57AnSrpQtux6BQIMVe8moIft2Xj2o2SgfEZeCYP2YlTS0M44Ea3jrkH2x7L3sR8YBGlENAAfWSZ+axv/jQqVOfbw6j7+qz1jfnaFDDgQS3CGzzFj/h0lFdmk5gfeGsBtGZKWeHuTpb3TOODCGZ3XlG7uilea2O7vYs1lRLXHHiwAcD9jzfsy9h5BipM0Ct81TDfKe0srKCE/VY7XVHnYj4fp4SxiBh9BOkQDXi9ZsSm6kSZEqsOF
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 23:31:48.4390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32699446-d5e2-4376-1525-08de9c105490
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8739

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
 drivers/gpu/nova-core/vbios.rs | 60 +++++++++++++++++++++++++++++++++-
 2 files changed, 80 insertions(+), 1 deletion(-)

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
index e726594eb130..7ebe58020533 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -25,6 +25,7 @@
         FalconUCodeDescV3, //
     },
     num::FromSafeCast,
+    regs::ga100, //
 };
 
 /// The offset of the VBIOS ROM in the BAR0 space.
@@ -89,13 +90,70 @@ struct VbiosIterator<'a> {
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

