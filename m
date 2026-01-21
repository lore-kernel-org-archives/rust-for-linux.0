Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012056.outbound.protection.outlook.com [52.101.53.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B042280325
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 23:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769039616; cv=fail; b=DAhxk7LpaCH3EM9jx9HMPvbXwdekwSaTU9yo7ASXaNwv4SKi4yzDcc79n5RPaHz00tdW6YE4E0v4sP5IHNSKiuo1K3xkljBTPLSlTB9C4/mFpEjzR1Kqm69yGOAGtcGDjWBE6GMkpP39yMdoyNG5UCaDHtUxcaTKs86keEB4o+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769039616; c=relaxed/simple;
	bh=vFTyBBJ6ZZpO0KL7JUk7Q+qMf7Eb51qL9FokaBKhr6U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GqJ43+ItlwcDvP+UMzefQM+0sf6bsZqmo/AMqdIkyQncGl5ZUpA2PcUbhO0MXJROvKoh7Eiv4o256Gr1Sy+WDnu5LN8TBa4Tfu0sBkWoXbfsNO74GPOcsbg+YWzWZpElHbclkqEmPl8c3CmSgZkAX7RFZqhrrzHOALRxm+XolFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h6TRace4; arc=fail smtp.client-ip=52.101.53.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h6TRace4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyoXqGl4AFQJHpvZY3chRCvmnLLivCwT/7I31oAPKHpl7j/kKs493GfNtkMCZR1/P2NQqYyJYUhP+ux01oPsSkbyucOMsBIxCp7TDVylSnyRVBd+GYop6jgeI3SaEIHPlxkhu15mc2nuDHg9JlrMKZIafiaj31HRsKGLFxxmXWFIKjodzirC8cnsko1C3MjfwyYsd4u5S50LGnvF+yxwos8U6JbcV+v+Etxd9XvhdrUDGCJ/IGrNGEZuqu3qrl/1PeLXGOqjK7RdK8zJdDp29xlnKX42hNIKijiKI80v+MD2IvGFysYeexoKae4Jdw3mp1mldpf8fg1pGCdTs2eivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDTbnicKuY0v8+B0QTZjbgrZZe4UCx9kzokAyHMKv+Q=;
 b=E5++SHa5SUUDQM5RkR9aJIAZpkfh4q+M2ExtWO49xu5I1ZT0bbPDKPYk5LX+Qk+Ao6u+dXcjnTC9+kif4VjSwO9VRFiq2eK9hXH558yB+BdYJi0G9iLN3XP43QdkCrsO0+MmZvCW9w048UKL8uzris0BUm4PQ3/EhRD+Ciz99yeG6sGfBapCQmSJun8kNjQp24eNbebBsbiJjqNf/xJGb1mhg8rjQVScGh6HsRNCq4vvJ6x+juFfDzO7kroFlnTltGeDSkmu1vYdw6AlBJohMyf97PahRprycgEYK2w1e90dUWSAgdZpEQauEEap7ByVuOYHrUI/jziDlkOW6EP+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDTbnicKuY0v8+B0QTZjbgrZZe4UCx9kzokAyHMKv+Q=;
 b=h6TRace4cOlvTRcVAp8WgMgBcnAP42PbqyJIYNlfQz1lUCbV6CFSgddgiC+DpQoe9a8Ev+P+XMCjdCGfiElrr+Ug6PB4p3lImTovmDdG8nNDRtDS5jpJf8jUedgRaRUN7tjW5VrspfwpayCDNJ8R5M6i3qWc5zylBwoIhlB/57HmH2NB2X8ZxYO6F/LFzjpq/uBnRVzUzXv+YI+evW4Ty/ryUj7tUrC66GlmOTXQ3XXEk9bmM/x81PVWR29MCRp0Wpd/taici8xMnXBkJ5TCaKmWYJhl5plViVHaPDH+xqb92xIxbuDCewbx0PvW+e0DetwmENSBStC+ur3seLkdbA==
Received: from CH2PR02CA0002.namprd02.prod.outlook.com (2603:10b6:610:4e::12)
 by IA1PR12MB6387.namprd12.prod.outlook.com (2603:10b6:208:389::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 23:53:28 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::f1) by CH2PR02CA0002.outlook.office365.com
 (2603:10b6:610:4e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 23:53:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 23:53:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:14 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:13 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v7 03/12] gpu: nova-core: support header parsing on Turing/GA100
Date: Wed, 21 Jan 2026 17:52:53 -0600
Message-ID: <20260121235302.1962185-4-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|IA1PR12MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: 3388c292-c931-4b87-f8e8-08de59484638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aJ3KtTx/ezD6NZFKpUsCsx3Nb6KTRs3Mw7WZoU8TTofMws5v2d3pOSHRPbXb?=
 =?us-ascii?Q?+tVbQVRTqqAITmCcYYcivyzWMV/jEx+4jePR8MUWGtabjU3iPruEi+yp4hRl?=
 =?us-ascii?Q?YbiJiIHofGDpoNzQJ2KB8+vXe3Bc2HINd0IlmossqahW3Gh8026rMCQurnCn?=
 =?us-ascii?Q?DwjEy+nn0GRVlREl1QaY1MoU0otocnJt2OOQJLRRmXH0/IlunsBQvTHN04IR?=
 =?us-ascii?Q?xQJNBTLolh3uJnVHTgkEH8lStqZVdEzM6ZHZpABvFudGdRr/1Ij9QoJOjeVf?=
 =?us-ascii?Q?IruJYP43j3gj++joHStjIo60G8cDnfQyElaIylKAGQO4gNB9F/FQSqK44n6D?=
 =?us-ascii?Q?KvR33uX6HvnQlYnsc9zh/yzZjlavnuv65hZar9jPqgf0IyX/VU8fJOzkiaBI?=
 =?us-ascii?Q?KcIevQWhZsTO0AISk8EzNL5dsHPWFiY7Vsm1FETVKZdQB36e3ElbCuBq8MHY?=
 =?us-ascii?Q?vIu73CNSMOieJaUYrX8New5jEq21SdYVUY5iFfwYu4nNEtBCfOdoCDFHCm13?=
 =?us-ascii?Q?tbKPNiet0jp88+wcBgTCiRGsLwlj5RvsqkV1++VzAKtQTQEmM0Kf+6mDqOAd?=
 =?us-ascii?Q?P7oZMIVTUj9S5NyqY8vdiVeqJpiQGs5nTbLZo/HEtSWZqcbXrMReTRzYT1/A?=
 =?us-ascii?Q?iCip6ZNVVPEfnkAMZMdafHP8FhDdCHoi4Vm3BGg2CygRrjtRhSKurONxzQ1V?=
 =?us-ascii?Q?pQ2CdGCLpGNbA8qGgJo8tsRfX3GaU4q0XMH6QGwXfu6FANfzqHZrQA+faaFP?=
 =?us-ascii?Q?lvjCS7kX5hYOWSYDhaeGWvhg/J84YspxyjIBR93lF42vg3uDXjQVpAGk82BO?=
 =?us-ascii?Q?YUgdlC2nwAPY7FKaHptPffMrAsRcUAYKkuVgrudweZUHgoLlSaNB/5vyD0t9?=
 =?us-ascii?Q?wpMcwEQT1C/d+k7n0DCtYTAlYPaBru/l5nX09H45p+s0B5iuEeafGqxlwzkn?=
 =?us-ascii?Q?qrLBSlGUERPjDASvkmiJKr70NnQEWXSebcA0PEGO0ag5poBSqMLrWR2RY/OB?=
 =?us-ascii?Q?BdUzAHDjXakQ8JC5J1x4y7aw/Fg81rRbFlNO/6mcjALaSM/V4IFNfg7l3F1M?=
 =?us-ascii?Q?rBE/u25NXn96dSlb84uS8vZh4FlsOVPcHgaYGC/PQi466gS3EVAiA//Z+Qcc?=
 =?us-ascii?Q?jqt8a2OLY02pO+cSheRNSOHI+5Jydb3T5hXgMiWVva76HIF5UYyD5t0bf9Ef?=
 =?us-ascii?Q?vSLDAEv291cXaCfmQQf8jDYu4D6jId9rKyOcmKSgiDHFMLGGzkZ+h4yFFiGe?=
 =?us-ascii?Q?FAGmA2bXUyl7/1M6iZfrKRB4ZGBcwrX40o6YNa+GFHM1dhZVsI77hvTSlgpj?=
 =?us-ascii?Q?IFKwJwAYwxYmkTZMnyy91jCFvgMG6TZuYjKxOm2ps+Htkqv/QpeuSO+ET/5Z?=
 =?us-ascii?Q?SCYw3z0AbtYRfdNADfae61KrjTDC/lQHEK24DP6sn45ZMuuAFCfg/eaweMqJ?=
 =?us-ascii?Q?ql/yUGIvjaBjy9j59IhrTqQ50OH5K3EGvu4t+gdhEU61uj+yzBJ1kH+HkxD7?=
 =?us-ascii?Q?i5rDfZSI9ekgGeqKlDTcJojecPS9DmJmFFPBpEc/wHurg08U4Uanrnh85Q8e?=
 =?us-ascii?Q?5HAQG9147JDYCsXI79Xl47DILD0L5L8bwNZk2e6Di1P0TrJj1vF5COSV2kXR?=
 =?us-ascii?Q?ZZRB+l70M6dE1+poktGydQQ2ov58rMfcYVD2idaGmflFNxI0y6Wgb/jB34ee?=
 =?us-ascii?Q?9zkYxw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 23:53:28.2358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3388c292-c931-4b87-f8e8-08de59484638
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6387

The Turing/GA100 version of Booter is slightly different from the
GA102+ version.  The headers are the same, but different fields of
the headers are used to identify the IMEM section.  In addition,
there is an NMEM section on Turing/GA100.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/booter.rs | 28 ++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index 1b98bb47424c..86556cee8e67 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -356,14 +356,30 @@ pub(crate) fn new(
             }
         };
 
+        // There are two versions of Booter, one for Turing/GA100, and another for
+        // GA102+.  The extraction of the IMEM sections differs between the two
+        // versions.  Unfortunately, the file names are the same, and the headers
+        // don't indicate the versions.  The only way to differentiate is by the Chipset.
+        let (imem_sec_dst_start, imem_ns_load_target) = if chipset <= Chipset::GA100 {
+            (
+                app0.offset,
+                Some(FalconLoadTarget {
+                    src_start: 0,
+                    dst_start: load_hdr.os_code_offset,
+                    len: load_hdr.os_code_size,
+                }),
+            )
+        } else {
+            (0, None)
+        };
+
         Ok(Self {
             imem_sec_load_target: FalconLoadTarget {
                 src_start: app0.offset,
-                dst_start: 0,
+                dst_start: imem_sec_dst_start,
                 len: app0.len,
             },
-            // Exists only in the booter image for Turing and GA100
-            imem_ns_load_target: None,
+            imem_ns_load_target,
             dmem_load_target: FalconLoadTarget {
                 src_start: load_hdr.os_data_offset,
                 dst_start: 0,
@@ -393,7 +409,11 @@ fn brom_params(&self) -> FalconBromParams {
     }
 
     fn boot_addr(&self) -> u32 {
-        self.imem_sec_load_target.src_start
+        if let Some(ns_target) = &self.imem_ns_load_target {
+            ns_target.dst_start
+        } else {
+            self.imem_sec_load_target.src_start
+        }
     }
 }
 
-- 
2.52.0

