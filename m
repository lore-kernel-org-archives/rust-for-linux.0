Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013037.outbound.protection.outlook.com [40.93.201.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8573D170F
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 23:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776210681; cv=fail; b=fNR8giew5W28eGash/On+c5MkK828BYsOIXo8dT6aLvsNJwQwE4sSw56RmDccwVcClShU1Jxq3gac2Ym9HF2oT3ukItMVywMyoXtCouni8zED3DdsM8gZ9/0COX7YJVPD8oGMbQPFLeg1Y5FkMeeoxH+P4q3m/R4I0YF17bC0DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776210681; c=relaxed/simple;
	bh=bvLWX2QyyBtC6XWyjQrovjwvy5uaZm19a9xD9s6aKY0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BHrtuaNY3qN1vI/DJz7Mxk0iMhj02Zz6yD4xErHBeVQZq0lqEOOi2RD60qf7/eA22Jv3bmpAUnQVpVbby/mqWaDq91Bne1kpPOOQ21dgY4KeFdfh4mn7WWpZ6ovMJnsiP5YeQV1/AvFoufuJj8yLsR7072BkfFUt4yT3ZWKPpSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hDSxNdJ7; arc=fail smtp.client-ip=40.93.201.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hDSxNdJ7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYTeuhp87AIcsNe4QfMbHmnMkCrXEZPYNvkPsSTsUzemwMvGzW7hvd8P5O3J7HM7vOgdNFaH9Yd2tCPL6wdlJRj0Hq8Q0IHY4b7LRgFtnIyzgBaAiPLmbFeZ0xOxadyxY0x7ch9CQHLrV5XiGBnARdGD9a7owbKCk8apw5y5wJM1d9EZppIadblFUYMcWCggE841bHRVSfFA5uuuVTBh4gLQvaJEY6ub8jZNu6zd9/opZzr0EW+1JpYaVmOeWmh8eMKobK0BY9EU3n7Cy/lYO3gLQqr31wFvaV/HfhE7Lp+Nug+PmIU2PP2kTKymxcnlGLYB7SBM9PDCJMzy+ZN1KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aK0MnM+VOlQ/+uD4FnQ2UXVZP8jAXIHKfPHuTKwNfDo=;
 b=TLl+81ZuJXr0co0X5YLjfh+NCzv4DkBnxAgNGt6JSgPhPRbIMxXy8XKvS+qTL7RDQRSz53xl7gZ4bT4amuP+PvJBZ1tnyxPaXP6g43ksOmPnlpKC76GjsK0Y5ySeh1z2m3n3FGnF16jMSrie5jbHXEy9HONeZR4NdRbbICp60KIfLuNK+U9xaSYjNYnElfyiCOYK4vXOwLkPTYsMTRsJHXZRcI+DhhMxMwlGQBzq8YgaUpo1E9noXJJQesMDyo9pQfZKWiucD1QobpIUqwdeqwkk8G6B+ahRJaFpK0Kfm27PD7KLLJp9oneyjN3tkTU5gsvGKzcr/X4tkbhtXf2aRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aK0MnM+VOlQ/+uD4FnQ2UXVZP8jAXIHKfPHuTKwNfDo=;
 b=hDSxNdJ7Gc0Z+mJ3P87eZ1OUiJmRu6McGiMiW4kVwWTgwdPZH4lPW9x9p2C5V0sOQjeRdWaIG22PMUFSgdOol2x6QljX2SK5XZ/NPflrDQtjmQ4OzfxXXtjQwA9loMESE7hwx1ePJgsiB+7ChAP/XStO8kLZop1ja7ScYCNDEyBwUwUwSY+ApnU+VqkrNQ72JBpuQbDGUZ1GmMVhDUIXZL3rCi5U+rgrNyH8if5HbL7K6NQ+x2NppAX6BFFMmgvrdb5BDYiCPUihz71HqtPbSCR8z0v56nRUG6C3nLb1r4ZQXJsvZmnGjE2RS994FbH+WhQTHzXF9h2QQki8lGYl+Q==
Received: from SA0PR11CA0154.namprd11.prod.outlook.com (2603:10b6:806:1bb::9)
 by MW4PR12MB7336.namprd12.prod.outlook.com (2603:10b6:303:21a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 23:51:16 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::f9) by SA0PR11CA0154.outlook.office365.com
 (2603:10b6:806:1bb::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 23:51:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 23:51:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 16:51:00 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 16:50:59 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 5/6] gpu: nova-core: skip the IFR header if present
Date: Tue, 14 Apr 2026 18:50:46 -0500
Message-ID: <20260414235047.439322-6-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414235047.439322-1-ttabi@nvidia.com>
References: <20260414235047.439322-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|MW4PR12MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e855e77-9f6f-4332-39b7-08de9a80b75d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GWY3yX7zY7QgHbARzYAPAI0I6L57AOJZ0i1VAMB0B2kCYYonYyVa9rQsDdsVVPNy0M2ffpmGb9X/ZB0HrGeef4WqugoC76y2NTlTOLWjv6G+X3YKWlNeETABF8/oUw8fa7/b+nLHirmZI/K6ZikX1vbumy3eox9371c+cn79z7c0CS0BolzJxYFRwfzVhUhYiKlLip7eJ9BCgveoT9/rSp6Q6UMIigiLoPr9iy8Kf6dRsdw+84Ck8z46PybJFZSlKl0B+C5rlqgPYDbK99/XFRMmUaCRaKcaNKJpycT+4D4R0MOxWt+QGK0Kc+xrJocW3ZCzhcxinPOTbjTp3ynDvRlwpdPABIB+neyuhj5ePhlYPid2OFc9H14icbwhRZzyWWfjTMKs1eWqQaysX0VFrN+uS+bzGTjpmPk3evh3+NPuEuBV+nrxIiu4xa/OnZMOyecKJp/6wwW+goXsfeVgGoLuIGHr6yPime5e9fgaHVy85ndK06r0FCbgS22DtdfihFXQ1al6L713B/rYpgSz4KxCGx2E/A0+JHIT/p6zoude5lEMIwwzipgRA1T2BcXZeIpolNxVTQKug1eINWnYVwmtTy1FoyMiQ4VsN9dj5re5yGge7Gwom0IWLNmn5sljehtLUEwUhM7R+i7FEc/mc7Co8O2vpMKrcuuILb8dza2iSeiRlfAbuZ5gRl2lc8tTikUUcM7eznQHBuO3EHv7SFUbGkfvE2yfpZ953KsRkONn6ixWVIlUh6OS7PhZJ90U0S8pl86Wr/VSKLlDmTp9nQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mMk4y5TXidseQjyOY9E+fWJ/Il2OLUmVM/6CVUS1td2kYagUyVaBZMEXad557i/VdmbgIeO42MzBMavfacR+pBUe64tptLq2Xn/oGfj2U3H5Yk+XTN8LIFGgiaQN+vh5CC1LFd7dwFRLPMpscWNuBa8RmPTJELY0BiTdxEc/OInynF3eyPdRSZswy3paBlSAcZ0m938GXB55GNOKxKiCo/k+8lyMfUmw9Y+yBZ/LW701FJzH6h5V0PkcskEB801XZfkAM7uoH1NwMzus3R2XT2tGaXjMER5DpVmAXYhzvPHgiypaDVTKWAph+cKjVTwrw8eC5i1ijs7H5Vw/GEHkb6LCwBqrqHxEJPyHRB6cxn3h8HJk5YLdWLzLt5vdlpErVqv/6jJMN3Jgcys9LaTjoNgJd8PB8JJQH3Uk3pLePYSnrBCxAM3fbQT8KncxqDIt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 23:51:15.4479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e855e77-9f6f-4332-39b7-08de9a80b75d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7336

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
 drivers/gpu/nova-core/vbios.rs | 67 +++++++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index e726594eb130..000e823b9e47 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -89,13 +89,78 @@ struct VbiosIterator<'a> {
     last_found: bool,
 }
 
+/// Offset of FIXED0 field in IFR header
+const NV_PBUS_IFR_FMT_FIXED0: usize = 0x00000000;
+/// Offset of FIXED1 field in IFR header
+const NV_PBUS_IFR_FMT_FIXED1: usize = 0x00000004;
+/// Offset of FIXED2 field in IFR header
+const NV_PBUS_IFR_FMT_FIXED2: usize = 0x00000008;
+/// IFR signature: ASCII "NVGI" as a little-endian u32.
+const NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE: u32 = 0x4947564E;
+/// ROM directory signature: ASCII "RFRD" as a little-endian u32.
+const NV_ROM_DIRECTORY_IDENTIFIER: u32 = 0x44524652;
+/// Offset of the NV_PMGR_ROM_ADDR_OFFSET register in IFR Extended section
+const IFR_SW_EXT_ROM_ADDR_OFFSET: usize = 4;
+/// Size of Redundant Firmware Flash Status section
+const RFW_FLASH_STATUS_SIZE: usize = 4096;
+
+bitfield! {
+    struct IfrFixed1(u32) {
+        15:8 version as u8;
+        30:16 fixed_data_size as u16;
+    }
+}
+
+bitfield! {
+    struct IfrFixed2(u32) {
+        19:0 total_data_size as u32;
+    }
+}
+
 impl<'a> VbiosIterator<'a> {
     fn new(dev: &'a device::Device, bar0: &'a Bar0) -> Result<Self> {
+        let signature = bar0.try_read32(ROM_OFFSET + NV_PBUS_IFR_FMT_FIXED0)?;
+
+        // The ROM may start with an Init-from-ROM (IFR) header before the PCI
+        // Expansion ROM images. Most GPUs apply the IFR offset transparently, but
+        // GA100 does not, so we must skip the header manually if present.
+
+        let current_offset = if signature == NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE {
+            let fixed1 = IfrFixed1(bar0.try_read32(ROM_OFFSET + NV_PBUS_IFR_FMT_FIXED1)?);
+
+            match fixed1.version() {
+                // Note: We do not actually expect to see v1 or v2 on these GPUs
+                1 | 2 => {
+                    let fixed_data_size = fixed1.fixed_data_size() as usize;
+                    let pmgr_rom_addr_offset = fixed_data_size + IFR_SW_EXT_ROM_ADDR_OFFSET;
+                    bar0.try_read32(ROM_OFFSET + pmgr_rom_addr_offset)? as usize
+                }
+                3 => {
+                    let fixed2 = IfrFixed2(bar0.try_read32(ROM_OFFSET + NV_PBUS_IFR_FMT_FIXED2)?);
+                    let total_data_size = fixed2.total_data_size() as usize;
+                    let dir_offset = bar0.try_read32(ROM_OFFSET + total_data_size)? as usize
+                        + RFW_FLASH_STATUS_SIZE;
+                    let dir_sig = bar0.try_read32(ROM_OFFSET + dir_offset)?;
+                    if dir_sig != NV_ROM_DIRECTORY_IDENTIFIER {
+                        dev_err!(dev, "could not find IFR ROM directory\n");
+                        return Err(EINVAL);
+                    }
+                    bar0.try_read32(ROM_OFFSET + dir_offset + 8)? as usize
+                }
+                _ => {
+                    dev_err!(dev, "unsupported IFR header version {}\n", fixed1.version());
+                    return Err(EINVAL);
+                }
+            }
+        } else {
+            0
+        };
+
         Ok(Self {
             dev,
             bar0,
             data: KVec::new(),
-            current_offset: 0,
+            current_offset,
             last_found: false,
         })
     }
-- 
2.53.0

