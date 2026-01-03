Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010041.outbound.protection.outlook.com [52.101.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3D725BEE8
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Jan 2026 05:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767416406; cv=fail; b=p0f7Rlu40iGpA+IsRTLQ6rzXQVf6Dy6gQ3kkSncTpVsbed15OJSdchQ586liCflvYGwI74phUc//I68QPbDshqJKjLxCwqxcm8hgx/7jMUNfWU3kraU8NILTqBpDwNvm/BjTFScMdp143/jBb1ZGnMZfS3M3Dfh81APInJBhzDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767416406; c=relaxed/simple;
	bh=a+xR48m2vOgPcDl99aXuZVH9ZsG1FqtOanHZ0SVup6s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ShZft9RpbjdMd+y3nC+RISXzNoD3T3Cc5aaokdFvlc5kFrO51RRyehBoT3KKrSIomUpxh/xZ4f90GdGMZu7aPwHFdHUA1IUhs/1f8Pa8K9+MBy386bQW/xvtHli3R7EH1FdpuLZIdWJjRliv5h5wfSGZa3kgQiRIvp5zGpYojWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XdJA1wOA; arc=fail smtp.client-ip=52.101.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XdJA1wOA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7eH1FrZpMZhCvIh4ryj3uExkIsLiteSqCWEHK4ND/GxOG/Vwrf46PmkKm6UiX2cwAQbD2pVwFna/xVWvdMw+UjS2Qy4hezszJMy4dGx6dte+BGhVJY00uRvpyEhEO+Ondho5xbwYWWPS/frypXijkF7qyeLm9Tr+GDLKNVy86/4lrJxceYDdsfVxERH9+Wi3oUz+UH0S007ND9eBwxEerbnDKHzUuJqeabl2No3nkrwftGjmpPb9tDO8jjVKgEswTmDT0zc7CLI79mcjZ7jTxQ1hWp84G7pgsIDjmbw03DSksQmf+56c8p3NKZSCm9Km88r+Si+H+f8fmPk/KEGpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPE7VZTRtIlDhLQAGDXJ8+YZh+QwzMKXePNLZiDGZfk=;
 b=oYdVV8XvL4SWlhbvcUx5i+nKI1zm9U9LusI0TxmX+jDOSgZl0X+WNwDUaR+e6Hduk9cyBGNLs6wwltt105ietAZ9PMkSdlX/Pw1qAXFLXARnkkaoYwEnJ2Jd+NjZNA+N+VrMtWPzZLwic+6D4lYQffLwg+Jt1Y3VKKQtkpFs+/08BN1CxbEVuC3Tj5y85r7ws5qdubyF6CBWzUUVh8+DZ+NTOi90S3Wxc39Pt3ioFcfuh+9iVO6Wk2Ey1UNldtz0Xfl6kzjtvU92l8E8o3x0uV4krEUp1JEZU51wZyOs/bF1r+f32AQI5DwE3M2y1I7qBnz/tjzLebasNustxLo2Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPE7VZTRtIlDhLQAGDXJ8+YZh+QwzMKXePNLZiDGZfk=;
 b=XdJA1wOAVVegeWW7O5qWbdRhR3nrLgYJm5hj/azaUYKmEOqWDdEoIoekziKeRfIdH2eTOPAjMtSFnFXOiBm8oKFztA/tCEM7jlOu+RYjabWeaIEdqbl+tW0pU1R3AGqDDJCfn0g4KcNz37KbzXbqawkdkn0PTgQQAc6nMaz5qVEyUl/tJuCKO4myha63VIx/CTqvFQCGwIp5REeuPjexYkoCXiBf02vVLVbXX0UyXc/fTtRjSMQOsOerSfjnPnijzAWGlEdi4fCahUo/opsKPCDdaJY9FqMQQ6Pje1jQii8eTOgYzNy59VMEM7qansxpV/ZJNU/Uo0gGCXuQYA8ZEA==
Received: from SN7PR04CA0178.namprd04.prod.outlook.com (2603:10b6:806:125::33)
 by PH7PR12MB7355.namprd12.prod.outlook.com (2603:10b6:510:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sat, 3 Jan
 2026 04:59:57 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:125:cafe::ed) by SN7PR04CA0178.outlook.office365.com
 (2603:10b6:806:125::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sat, 3
 Jan 2026 04:59:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Sat, 3 Jan 2026 04:59:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:48 -0800
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:47 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 04/11] gpu: nova-core: add support for Turing/GA100 fwsignature
Date: Fri, 2 Jan 2026 22:59:27 -0600
Message-ID: <20260103045934.64521-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260103045934.64521-1-ttabi@nvidia.com>
References: <20260103045934.64521-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|PH7PR12MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ec42834-4295-473c-4509-08de4a84f136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JBh/20sSUbUexlcMb7c6WZAasEY+Y/wKJEy3udwwfaTQv6UIYh+KCXLlOXpF?=
 =?us-ascii?Q?SvEUgjzl1IT+O7MqvgEiY7gF+5EtLGyORqxNKplvsvkMZZkKSc6kaX9w4CtC?=
 =?us-ascii?Q?ggRye1DJsDnFRDUqWyLAZt0FAjsBKEPUASqqRr2brJ5bDHyfZZ/pTwCDhCMW?=
 =?us-ascii?Q?jBQREjczri/a4V7IvNPgZhQV2GkTzvBxvCZIW4ezg2fv7vH62ywtfvXSNsVq?=
 =?us-ascii?Q?9sCi89GUsIECGh/+rZB6HAPNS+S5WjuIk9tPKND/YjHA0BQJPeVCAEujVkZe?=
 =?us-ascii?Q?bv9W90ktuDi30bh+8SBI2+o6YwEmNUX57uqVFw7kmvXsy+nn7pSbhsWS1QPR?=
 =?us-ascii?Q?2/fESpVOOWV6jWCbxOHpcaNOJwLDRwVXvBy+t1qfviG0d1sP/sfDC2rx8yVR?=
 =?us-ascii?Q?3XOtKKInxP2EoS5c/H+bMx/W9hba3sCPUML+Et/fZ1A7VOh+gfO/pBNrSLnL?=
 =?us-ascii?Q?Gdnh/xevKhPnCB97sXv/tIhFbdRTJt5GmqZZHp6/qYiEhwxiL96Kj6cg8idC?=
 =?us-ascii?Q?VS3L1EpcYXH+IGXWkhG+H3ze5JHfYFY3WSxgey86P5tRrYjlo5GzKg3xeee9?=
 =?us-ascii?Q?kDqNtYFcyfVaaLOfttmzailXiXjyE70tyNp3GBwEEzjBcZVipwRPH/JGMbRe?=
 =?us-ascii?Q?EOEdeV59xCefcjQWuRdhYaOju/ODeNl3JZmfc7FnT34iRMh8/KVtsXmsY8f/?=
 =?us-ascii?Q?W/d/tzcU5Wz940dwVUcYi9e0affjlNtWCbd65PWw60piGPwQiy+VFjIeXcbC?=
 =?us-ascii?Q?0Rou3mLZpAwE1oeEisgZc0tpO65QD4ywYjIFb1ZVwVMETQ57qfnVLjc+9F+3?=
 =?us-ascii?Q?KDY7XvIO/Gaot45ADWa+bwZq6mx/l9vKTdqRYDoHEVfSAu3l5Qzr/rCizlAW?=
 =?us-ascii?Q?e5Je9AgWfo7QCFbmy7orQCkZJ9fiK3pXRJTH6pPZp3IuC248z3jAMdIRSsgZ?=
 =?us-ascii?Q?2mlswiON97bAZuTuUmuBvS50Qb91rHjuAFLpqGuvwK8l2dSPpfGodMtoPUtB?=
 =?us-ascii?Q?duD5uKQfyCmPqyPj7m2z3IMivHotM11hhvy6v3fkxz33CbAlyzGkCehxIFtn?=
 =?us-ascii?Q?HaMpBV6Zcf5qaP2M4ZK+w80O92LsKJn78JeiSghmbneB1CAw3dVcBxvQWzNv?=
 =?us-ascii?Q?OSwhtd1hmgfp5wB4clFCJHJpR4TWEzlpnnLgiXrRY149n27+4i1GBL7+PCDG?=
 =?us-ascii?Q?WNZoRIcoLVeTmPVA0mw9olu27uJe+O4oLemiUmxKMGfAqxg4EGjnVsHqgTRN?=
 =?us-ascii?Q?PCgCcXGnDAmNusKubI0W1ouRO3JXKaJjUTR9WoFKtSmGY+2TqymtT1u2MbaE?=
 =?us-ascii?Q?rigB/p42RahvApa1VZwKXAAVv0lSoryilAvi0Oh/6qsbwNrtBNPyuGWmWPjn?=
 =?us-ascii?Q?oSkgu1D3lzS777RZRDrVnBwI26GIYrVSwjf7lKtpo9yoeC55saSFsB4KeQjH?=
 =?us-ascii?Q?0pFnKFvBstjmCJNIsjJBFgr3B9cc8DsWfrg5xZj8XyeeXNS7bZw1d8LPosKI?=
 =?us-ascii?Q?fNLdgbH0bDVw/WmSP3M9ZQjSQ5n8+jV4N7C8JkYiaDRowVAbjZyGaLzhnSoy?=
 =?us-ascii?Q?0Lo7fWg/mOhXGWuRHfM=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2026 04:59:57.4835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec42834-4295-473c-4509-08de4a84f136
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7355

Turing and GA100 share the same GSP-RM firmware binary, but the
signature ELF section is labeled either ".fwsignature_tu10x" or
".fwsignature_tu11x".

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index da97814cf859..c463b60799a4 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -217,9 +217,13 @@ pub(crate) fn new<'a>(
                 size,
                 signatures: {
                     let sigs_section = match chipset.arch() {
+                        Architecture::Turing if chipset == Chipset::TU116 || chipset == Chipset::TU117 =>
+                            ".fwsignature_tu11x",
+                        Architecture::Turing => ".fwsignature_tu10x",
+                        // GA100 uses the same firmware as Turing
+                        Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
                         Architecture::Ampere => ".fwsignature_ga10x",
                         Architecture::Ada => ".fwsignature_ad10x",
-                        _ => return Err(ENOTSUPP),
                     };
 
                     elf::elf64_section(firmware.data(), sigs_section)
-- 
2.51.0

