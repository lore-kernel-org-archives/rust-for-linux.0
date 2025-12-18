Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010018.outbound.protection.outlook.com [52.101.61.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEE6330B02
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 06:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766037881; cv=fail; b=LVgNo9g2gkUmp11wqCrnhYZUer7ZF/4orgnsVWOTQeAKJeUR/G5UfYVcjBvGMy9I6YpOpprAdl6SnVdNRCB24is8ChOshgg2c0b4kuOd4gpDRUArTVUM67qBMBDns6Mdh/Wmdmg9I7m9T1YCk7CwkMvfO8TLnHGpjvnGYb9na+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766037881; c=relaxed/simple;
	bh=jBfsX/bvkK7cAMfM19/DccIWqRbmNEjJ8wXS+MOwsio=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JXASnbxfItmFuPxlwUgq7Kv8guQtlVApt+cp1dn8M2Zra2f3Siry2CDxiAX/C1Q7iuqhvX3I4urQ4+197JdVlgci5H8jUjoqmk+SbvLwaKMmsRDYIEqUQ+kYRhZLvnlVqZtXl51nGYdDeepbnv9IiXO8CDzI1Y9VwNmYS6Bd7CU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oPvW0HmW; arc=fail smtp.client-ip=52.101.61.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oPvW0HmW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djUVNf5+FNj3NzGyF7Km45vpQjnFH2pzr0FNlF4wCvgCRiSuQub9tiZyerAHczMEJpeUycLUe45lZXW5bfYg74gpNHPQkCsyw8+nBk05I9uANT4l7x2cyUZpFrkVMIts5vCmSXG99e0VG7IyF0hMjerl8209VnYFCBsv6R1tdZIGTZCQCW2pr1hPWrPvAos9Eh7i2UtFreLmbZ1Yfq/m5LHFS06ruc+Jzz9jSGa8jd0h9H2Eow6bCvxZi2wYA/cLBEdVUVHyXW6khjMC2AmxwuV2aboYx+VU+yrcFAl5fNlzYD/e0XXqNBOZN07uzdNPzxX6PmoUPacHbRusXlwpwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCoFJchHWxQwHd+2asVpdG7a9TMhLRJO5PERqhccQoU=;
 b=fru7rFxoE/11CFr5nLfDSmpHjr5Y0zHkO2tMCBT7CNpJgpbRSGqoAk4rRBeWQ9lUhFYUVaM3srEJoiWeAWEILTiGlM8SMIR2/FGWOns3lquWr+MG1YWL2ijeFQoG0ykk/oWiSO0wfsPRmUmD5Zp4dc9KiFWOTapEO+fWvPZ9g7afOkjfEHMWQ6QGKag3jxcwt155+J+e48GtXLLn5ucjugOfWJwz+U+swSnnIgfaBctV8B/VOwqrLHy9tNrWbv3ZKpnVCZE50IcMmlnpMVQxWZQsq8XRh6/USmadcoGL55PuG8LJJRyv2aWhowP0xS06BSYy+xTj1chJZeUwm2rtGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCoFJchHWxQwHd+2asVpdG7a9TMhLRJO5PERqhccQoU=;
 b=oPvW0HmWucE+BYpB4E6aEQGtmqhNDABuJb+yB+vEbISn263GroQQht/1Z+ad0hTzhPuej885iJDhyQdlb+JwEDTvyo3kaJCxa8XVb/5WXYx+wULb9l08t9mkSUulNL5JwuAhyO1eAC8pLstmOLoNY65EVy/BBLacyFmD7O4ouw+XqTjCOGqaXloPOPs2f8BX0UpWK2x3BPDF3dC5BMCB40G+fN1u4l7NbSag16EvgUYpNo/dxhaL1lK8OhE9UKNmSl4mCgPcbRMdydzFiAcv1EKCgdjAkywuobHyIEyWdIJqtWh77d4P5OYwyMA+0kftC235L2eQgD9CAw+UTyD09Q==
Received: from DS7PR03CA0232.namprd03.prod.outlook.com (2603:10b6:5:3ba::27)
 by DS0PR12MB7769.namprd12.prod.outlook.com (2603:10b6:8:138::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 03:30:30 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:5:3ba:cafe::35) by DS7PR03CA0232.outlook.office365.com
 (2603:10b6:5:3ba::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 03:30:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Thu, 18 Dec 2025 03:30:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:13 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:12 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v4 10/11] gpu: nova-core: align LibosMemoryRegionInitArgument size to page size
Date: Wed, 17 Dec 2025 21:29:54 -0600
Message-ID: <20251218032955.979623-11-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218032955.979623-1-ttabi@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|DS0PR12MB7769:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a251042-e71a-4c3b-abeb-08de3de5cb7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+HGoD/Y6I5mGcyVdOA44mbhr4bCqyUMdhLvAaCCoF2J9GUSKgeODz1fIGU0Q?=
 =?us-ascii?Q?F0510NWIAO3rbgqwBdmyU6DGuBtR9p2n1Fa6rpsd0KtIkG/gvHwm9MwkSriZ?=
 =?us-ascii?Q?lHxwuMquI9xMF1GY+agdOy1v2sbMyjkpL9DU1RpnryVcV/gnNYmtFL9e75At?=
 =?us-ascii?Q?LcCQ6kS9OWK2d/x14nzgogsxDSyqkiqEDtmWknu4+6PT7N750q6LosOFW0/1?=
 =?us-ascii?Q?0HfCSxXD7AuyRM/tiUucSfs0RUtM9qL8HUMWeZi6jKB907BfyKt0UOKCTOpV?=
 =?us-ascii?Q?6M7rSwwAqtkPyrJD9Kb68qe79s4OoN7cXUaVgwQ+bKe61GuseKPmx9sY6hYb?=
 =?us-ascii?Q?BKb2nIi0sg0SBPGz4Qm7T8xYObegHVr6ovxhtq15FMtJOYB2WS2qKq/vrwVf?=
 =?us-ascii?Q?kn6UZgtF4cgS2PXowG/RZzyGXCnuIyF1/7XhufyYbBNHkNvlTFHOTQxaRLe/?=
 =?us-ascii?Q?hjHh4s5yZTySfYxPXSA987unFzlps6tzh6tX9kwTLWSMaOFJ8lc7yS1l2VRv?=
 =?us-ascii?Q?jt9s+VIbMxVFcoNT3QYsRtmYjP1On8yzba85aQSIJvtcA94wbUUA3zOEm4qp?=
 =?us-ascii?Q?SMOC3zlw6vucjPK+i1A7PblPaacyBSIkdW20foYOsAb5GZtPCJYV3ex51SRX?=
 =?us-ascii?Q?CtsTo4OgD7TcMw8Nx5YSBX/BosBi97ch/SFPycZfmeNkekM7MJXoVFBgUr/z?=
 =?us-ascii?Q?eAlK3/pRzevDv12BOCKba5ccvVgKKtqHNQdrTH80U2qVygzmUZ6QiN1GEz0K?=
 =?us-ascii?Q?2g+U9mVg6UYHVKAwyFRUwoQoyPLdizBkyqXvkVgdpGDHzAFOY/D+w86+frLi?=
 =?us-ascii?Q?rDivJPmZOIvHeEnbVfR3RSKX5F6l7X2qYkxSo+26hx9FC1IQznH2K6df1UWA?=
 =?us-ascii?Q?1Sn2L3qT23SIcbP/4Cqsb4uiYcOnF9O52BSnppgHQzp2HmW5MAhVosvJepmg?=
 =?us-ascii?Q?mXzceURrHrm7Ae9af1yCdjKwhH4swRH6zqjfrhwZ7FNOH+1JmsozFxKC2vq9?=
 =?us-ascii?Q?Z+1ZthmkJlsj2dzG9mEP9tYfWD0h0Vc5ERxzxq0JYC2ARDAJWLu/v5rD1yEk?=
 =?us-ascii?Q?szQmWFKB4nqxL0eIjElzOuq/cwx/FHK/Qev/77j0fB0INRsvJs1GdzSVFLSE?=
 =?us-ascii?Q?ohmQUq6jSICNBDGmw/0PKl3YG3UsXBcLvNzE7SRsjcPSw1oX6Q3mPoX5Sv4V?=
 =?us-ascii?Q?VTDhVWQKK+mSG0zxJZHu4hWiBhLtWuxA/KYn4QHJ5q13Ewf7qdx60bCF5MQK?=
 =?us-ascii?Q?PoyAq6Bc7wzrnvDCm5OQ3HnFIBd+jhUguKRIbae5sk6PoqsdarTFTWSlg4h4?=
 =?us-ascii?Q?Tn/c9JpAOYW5ZHREzLOuC5sGUdhygYu6+UDMBVNjS66nHqEA4kZrIszgeR1e?=
 =?us-ascii?Q?4yzF/75zO8GiKwZr3YVqYBwrDsRc5qFoWX/1UgZTYjVr9+iExMqZvLZDgIJf?=
 =?us-ascii?Q?hBSekrWvyssB/HhqkVzKd5Rag22JIGrw9o76qks9KYUYfJyy8zpgiNB9o/ao?=
 =?us-ascii?Q?dF7UfyctbkF6CaXdjPEeSPobGxkR9QslhTKR+TKIcBYm0ytpRxkyPqiCpHFk?=
 =?us-ascii?Q?L5Hto+eVHkT54FU/0JI=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 03:30:30.2062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a251042-e71a-4c3b-abeb-08de3de5cb7a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7769

On Turing and GA100 (i.e. the versions that use Libos v2), GSP-RM insists
that the 'size' parameter of the LibosMemoryRegionInitArgument struct be
aligned to 4KB.  The logging buffers are already aligned to that size, so
only the GSP_ARGUMENTS_CACHED struct needs to be adjusted.  Make that
adjustment by adding padding to the end of the struct.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index abffd6beec65..ab3ad038889c 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -889,17 +889,27 @@ unsafe impl AsBytes for GspMsgElement {}
 unsafe impl FromBytes for GspMsgElement {}
 
 /// Arguments for GSP startup.
-#[repr(transparent)]
-pub(crate) struct GspArgumentsCached(bindings::GSP_ARGUMENTS_CACHED);
+///
+/// On Turing and GA100, the entries in the `LibosMemoryRegionInitArgument`
+/// must all be a multiple of GSP_PAGE_SIZE in size, so add padding to force it
+/// to that size.
+#[repr(C)]
+pub(crate) struct GspArgumentsCached(
+    bindings::GSP_ARGUMENTS_CACHED,
+    [u8; GSP_PAGE_SIZE - core::mem::size_of::<bindings::GSP_ARGUMENTS_CACHED>()],
+);
 
 impl GspArgumentsCached {
     /// Creates the arguments for starting the GSP up using `cmdq` as its command queue.
     pub(crate) fn new(cmdq: &Cmdq) -> Self {
-        Self(bindings::GSP_ARGUMENTS_CACHED {
-            messageQueueInitArguments: MessageQueueInitArguments::new(cmdq).0,
-            bDmemStack: 1,
-            ..Default::default()
-        })
+        Self(
+            bindings::GSP_ARGUMENTS_CACHED {
+                messageQueueInitArguments: MessageQueueInitArguments::new(cmdq).0,
+                bDmemStack: 1,
+                ..Default::default()
+            },
+            Zeroable::zeroed(),
+        )
     }
 }
 
-- 
2.52.0

