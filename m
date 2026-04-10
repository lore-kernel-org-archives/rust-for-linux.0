Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010045.outbound.protection.outlook.com [52.101.46.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EDD39A7FA
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 20:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775853475; cv=fail; b=CNPxLccNRIwucNycpAoc8yZAqEURNKVQeSKEvzGPKYQldNXWNfA12h3L9C7+vbjXIga+GuwaflElpsaGXhii++5d/BtEwIZ12cNVhSwObUPYKzat/50ukaB54NzmBLvoOlA/XBxso8b1D7OJ6TUmhgFLhup1Fz8eLudaJyng3Ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775853475; c=relaxed/simple;
	bh=gCrNm1HC7OF2r6+T+7PPcLSJCd0roXQUH3W85VQ2Ye4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cj8U/dw/XtYIuyS3mxsmkB+B486U8Ao7tuxx6GygQr/Mgg2TlDZ0ENkamk4UwBi5wN91FPqy5wWa/Dl1hyrI2076MMNtfuAGoKhD3mt+vDmbKEa3NYsZoy12vBRzgdKHFa+TVTLiGh06M7L9bgC5UUGlELvBTYzrScsdZ0u+eM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RE7K4But; arc=fail smtp.client-ip=52.101.46.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RE7K4But"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnUKVSe7xE70YXz2LHYpf+/DKIVlBUk2zzFOwJDOvGxTa1iy/nol7KwRvqqMvUj2wIpdDvA8JWoSnn573hty8FLUXNzJGqVxM8GkkCzao6KuZYvH1h/pwq2v9QLUK79qLxfetV/Ct6k/zGFHs9BivWjCiT3wQWzh8+vxTvKgEshRTgCsueLjmm7L8uKEdTOQmles5q/7jWyngnolZYMVlzJoHB+lDkpkHA/uKtKokGU0BQo6HopNJsvje3ET2zIikbdPQDRUqtkgu8CdgNAMOvXvyO2BlcXw6aW1aoOlMmW5aXzkFWK00AHrzpTz3ISUtZp3Ts4cUw328afT6c7PPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFlrSDBKo210RC0Ngy7PsQIUqn6nx6WjX5xC5pwW9SY=;
 b=uuJk640vkVJYjSxL95UaocI/TY1ghzxF309jLlMb7UGsAG7B6fgLVXDsLzh1ocab/ememCTDU/cx70hFQXJuYTODomKGekp+Fbe3bJLUc04dZ48RVfqcs8/kFWVx7YraQTjFhkLGuQ6+ybWJwENd8UlHPid9HoiEPMwk93i0AIqhuzjo5g/ZdwvXFJpIRY6pMzYYIefGA1RieAVxYqiJjYnQ3q64sh8Kokbg7BziU4bQDTkcmYFQHx8HVi8a3sToUvYuZuchNhvT4HkVaXxvb9V3Rxqr2mA4tqPdmSyBnogemR5noMHlltrK8Yk5kpWC2D2rZrEBF+SSRVg+TdJ6qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFlrSDBKo210RC0Ngy7PsQIUqn6nx6WjX5xC5pwW9SY=;
 b=RE7K4ButNKnbRLZAQ0Npxtlt/W7H6Q/tiUJEH95B9342iY6k5HfWayE+Y4hEZykIYHYR0DlFVJmi1LQuAOK7JtOndi75bUB6QZb/XnWLAfTq4GTXK8iGC0VCam8Om9eJeb8wSwpntnv4j8+msUZHxFP+QCIC7F6gUsw9OVJZyXj4FpqMZXwADq5/DXSE2XrH0aVE/rfcL107kQc8zx9A7QTd0cgj1C2sxnqwdJ0wE3ibGtWRjqp1N8KFKqb2f/NIdrThB5iV8nhoXedom939EJlGzBx9hqceZzXGgpgsDHHIHz/vyo0S7krSF/NFtbnzwCNvBMPLl4DUBKY6IPD+jw==
Received: from BY5PR17CA0036.namprd17.prod.outlook.com (2603:10b6:a03:1b8::49)
 by SA1PR12MB999253.namprd12.prod.outlook.com (2603:10b6:806:4dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 10 Apr
 2026 20:37:52 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::73) by BY5PR17CA0036.outlook.office365.com
 (2603:10b6:a03:1b8::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.43 via Frontend Transport; Fri,
 10 Apr 2026 20:37:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 20:37:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 13:37:35 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 13:37:34 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH 5/6] gpu: nova-core: skip the IFR header if present
Date: Fri, 10 Apr 2026 15:37:21 -0500
Message-ID: <20260410203722.1586938-6-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410203722.1586938-1-ttabi@nvidia.com>
References: <20260410203722.1586938-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|SA1PR12MB999253:EE_
X-MS-Office365-Filtering-Correlation-Id: ce713911-77b1-45f1-69a3-08de97410964
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xS16v/uxYXC3JFlyUUx7jbFK6f5btEBo52tjkTJLTUNAX0C4Tz0iI2NultryPSLZl7hue3LmymWSgIujq3YMwQbdN7HINstdjnBGvbPXvqG45aGHgLdzumRXglZb7HmPNwG/0NDeOHVwRQsT7tdBo7KhGv/cUFlRpnP4/QE0Ycoy/505kbGhUZp4apMXOfJWz41A9yEKewbzqndCaiCH9VI8H/wAIFjFw12Avz/yyhCOWc7lN5rNcOMXziPvcBmgOyv8yLAcOeb1zxYo4AC6hwKp/ppB9QwgEgmQc35LKqsbTYowitlHN0z+I30AAjAoSqDUG5HkUyfaSTSWwCEF/A4N/XcLtmXLjgQsmZiJsZqAT6SZ0R+fkFGlDk/SH1e651jM98hkByuvcgzq/Uwg6NBc7VIemhVt0STk97WFGIdmgLcYQluNnn8LmG9uSxxTwQdy5zAam54/fGkY+zeOdKg7hwopThAHFhGPJmhpjBLdsQ6KhacjWSUMRYUbwWeU7rKIqZFXxzuCivxJOPcND0DBO5FILS5oZvDLHUxYDrIoz11ENHchbNCkf3ymPU+TYJOrwDnSYswr6nsDGHg8F2bmXzNnCEOKGKo0oqKVCRYsiaP/lShodZOXWHNDfh2G2nxYsjhsJNWaR9O9o6K//3Ub/BxRKnARNfISX0C+h7Wgxo+wJwXVOrfzvIUI9+inuWW0s3z5amo+Weij5WctEsRu+LIfzO05PGrOzy5+rrnc1hykstCJRz11ImLTzfRuTLEtkPmfWyz++Aky0G9JiA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y5uVQW2LyGBFMeGpLiOKMJIVWPuclrQ/3O5tU4DnCtpQI96rX5UhMPnfRo5J2AoExcPtgKhQBgSjOFopbpi1DhCVTLytFAHEPXYIYoPVxtB6FGkKGJUbXVdKFg+JMvv83VlD1RC1ffiTrN5FpQ3EOpzX0caVKsi7tU0oVn9SkHXG1UPFPJnyS1stmF/4naHyV1/we145uD10KmkMZbxxYQdw97b3Cdd05QA81RRdwg+6jjXYhrvvRWLmdaDUdwSEQPBAUGTFBEf1Cxj4/rYjV0eL74XLWdjxWbvMdvOvFmPkr/jfLHxSPrdPisZl6xDQSMUMZqoc7YwjuMX0GKGrmDyYBQ5tQLz7gbtt6gKznM+m73hKA8rrNC5XL5yEjCnKbQAzCTZtcJE4kk8vp9fmcTmf8jAdOth3HOin0vuH3R/r7p7EQ4wZWmHLmX+pjV45
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 20:37:51.8049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce713911-77b1-45f1-69a3-08de97410964
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999253

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
 drivers/gpu/nova-core/vbios.rs | 39 +++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index e726594eb130..a7ec68448a4a 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -89,13 +89,50 @@ struct VbiosIterator<'a> {
     last_found: bool,
 }
 
+/// IFR signature: ASCII "NVGI" as a little-endian u32.
+const IFR_SIGNATURE: u32 = 0x4947564E;
+/// ROM directory signature: ASCII "RFRD" as a little-endian u32.
+const ROM_DIRECTORY_SIGNATURE: u32 = 0x44524652;
+
 impl<'a> VbiosIterator<'a> {
     fn new(dev: &'a device::Device, bar0: &'a Bar0) -> Result<Self> {
+        let sig = bar0.try_read32(ROM_OFFSET)?;
+
+        let current_offset = if sig == IFR_SIGNATURE {
+            let fixed1 = bar0.try_read32(ROM_OFFSET + 4)?;
+            let version = ((fixed1 >> 8) & 0xff) as u8;
+
+            match version {
+                // Note: We do not actually expect to see v1 or v2 on these GPUs
+                1 | 2 => {
+                    let fixed_data_size = ((fixed1 >> 16) & 0x7fff) as usize;
+                    bar0.try_read32(ROM_OFFSET + fixed_data_size + 4)? as usize
+                }
+                3 => {
+                    let fixed2 = bar0.try_read32(ROM_OFFSET + 8)?;
+                    let total_data_size = (fixed2 & 0x000f_ffff) as usize;
+                    let dir_offset = bar0.try_read32(ROM_OFFSET + total_data_size)? as usize + 4096;
+                    let dir_sig = bar0.try_read32(ROM_OFFSET + dir_offset)?;
+                    if dir_sig != ROM_DIRECTORY_SIGNATURE {
+                        dev_err!(dev, "could not find IFR ROM directory\n");
+                        return Err(EINVAL);
+                    }
+                    bar0.try_read32(ROM_OFFSET + dir_offset + 8)? as usize
+                }
+                _ => {
+                    dev_err!(dev, "unsupported IFR header version {}\n", version);
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

