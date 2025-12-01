Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012017.outbound.protection.outlook.com [52.101.53.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A18F2900A8
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 23:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764632500; cv=fail; b=SQA1GKJPX2vCyvdvmDVVTxwrNn0njUwfbzq6rDhMqwUzGfHmItuQl49V6uFOY+yKx2B+g1zdZVd/WiFyh7s5H9xE42MJig0zsn65Uwq5G3PHYIZHf161ClNWM4UCOfe0xR0iOcUrGfgyLEKuDlVRkUw1bYnYKJxhLA/BO/yXHd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764632500; c=relaxed/simple;
	bh=oqagXEiRb6GQf/OvoHbw4Y9+No9WqXouAiwdEeqVSqg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gs1U+OO6qx+d0bpDrBcI/oP1+p/JQaGFQejFc44Csu8r5jNMVM61eJ/C+/8SDzKYs3rsODaa7/LxZqx6gsniUmkAvTAOqistAEaYMNKka6Bt9fYKM3ghGNAtt7LphBtRDjxLtDu7wW7pp3v4pCdyY+3U3NOvLPw39LVJzMz3tyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jDUtoZCU; arc=fail smtp.client-ip=52.101.53.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jDUtoZCU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UtfBrLestYdQnh7SpByCSGPKQxd79NpiI1D02FpmZXTn+i9d8LlQ2KAb2vzPoHnjqyiOmUU0M9iq747pvUf7kFklZV2EaLuef+zdqEQngBgMRrS0EdHX3mJhSYLThDxW8iEgOKB1KHnNDZQPhFutMrq0aNXFgL3LKeIcMWUeekv1XupU50Mx0ucf7OZo1tF04PVK25jcoATuwSsW0G/ZlvWrc6QPwdPo/qW7ug6jpi4uQGGgYmMkLBzy4ruJzlwNnZd3LNIycBDCBW2jkPE6pe35SICwp9lxc7zEdhL7GpYz1oUBYClrWFyGCUlS/+pAfM4iYvF+WgQ2CJAopB2WiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vo23zIBjPg7LGBiUO6E5egh7Dyh08i32v70h85w/9ow=;
 b=UHOB2MqMu4Ed3Qbo7mCnS+1XfOpTK+B7fSMTA/zix6bs4w42Jg0O5P5CfWCCIFJor6um4fb93nwGaSBtF7274plk94Q6+pMbaM5K4goS/du/VoTAjoUXdLWZqTF17DK14h4d3zYGwmlbJy7fqLsgqsx/IlNDizQvVSWpwg67rZgssz7XjNn0QNuhCRcPNT5ILf2PdKSKbAsaUynbRujf0aPiwbMkkmo1nzh9aFyW3m5ZhkPVtaiNm5+0L4H6dE4lmYanJGf4cyOP7OH+NQ+Fxa9U5clxODp2bKewPVAbfaOYk6nVHVAxaIL/VzjXXOjXK7CCZloSy+JE+SX15OFecQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vo23zIBjPg7LGBiUO6E5egh7Dyh08i32v70h85w/9ow=;
 b=jDUtoZCUXeriagHXsqAetCfR3Yus3zbo5Wms8MpgrkyizXNjMsteg451M5kT6dqqz3ApZtVZSN65TUFC5bptvZEFMCdfCyKeWuElZhaze+N6yMnOww17/eKyFNQNBvitCf3PRUZxJluxGu+H9mwCOiCrWALOG6SYnKKgXy/Mbnqtd1Q7oO5P55RM1S2HOGGH77hYhO/AEeLp6OLQleKSuhoY/ydIHz4jq/e/JUBK5FkLfDSvWZDQ92J5+8eBm5klpL2jUMnG7O2CqSqsJ73mKdwsgHN1g8ZAfFE6x7vWkE7utDABKoiDZ8XlPYAOKZ0BMvCqcw4icwgPy9atRCoy7A==
Received: from SA1PR04CA0010.namprd04.prod.outlook.com (2603:10b6:806:2ce::16)
 by MN0PR12MB5908.namprd12.prod.outlook.com (2603:10b6:208:37c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:41:32 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:2ce:cafe::d0) by SA1PR04CA0010.outlook.office365.com
 (2603:10b6:806:2ce::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 23:41:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 23:41:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:11 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:10 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 11/13] gpu: nova-core: align LibosMemoryRegionInitArgument size to page size
Date: Mon, 1 Dec 2025 17:39:20 -0600
Message-ID: <20251201233922.27218-12-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201233922.27218-1-ttabi@nvidia.com>
References: <20251201233922.27218-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|MN0PR12MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: c5dc85fe-b5d5-49fe-b047-08de3133280c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ik/IezedL5g8Y3tEnsMyMyN17P1AGZsHkCYgixoCU0NHPjCzQSFzO+kDNekk?=
 =?us-ascii?Q?LgLSP71q1eoMGXuIbLzVM0YPUDrlZSKmkMli4gFfjhw4REVcRtbv2vH2MzwR?=
 =?us-ascii?Q?3cfw+YCr6T3WHVIYN380Rb1Fi0pso6p1TZhiyTLDU4fkbgH1gCNEq1RKxdkh?=
 =?us-ascii?Q?sOxhkPDJ/wzochwFfSQivG5msTGl/WLuAPohWrEKfdfJoqZFUxdiJk0yArLF?=
 =?us-ascii?Q?+JlgT5oijbkFZIFPjYCpdG0xIwAAO73RgW5YJCmBo2O5LPcPj8TEprfIvt4N?=
 =?us-ascii?Q?KCoMyymZih4CTMEm8iimYp1ZK1q+b/BI4sl/yr9IlglbLSoxqDCOUtoAhzRK?=
 =?us-ascii?Q?BJnhILU83E/tiEav8KH1/e6SBfAa/K0cWGYcZwbn00o7Y5t1gb2xpWAghTKY?=
 =?us-ascii?Q?yM/21uUlmLmLfENMXuRp4Te4IwDnLMyFcrRyLEsnNla9KyvCw6nC8gUhtdhh?=
 =?us-ascii?Q?7A6rrM15oElj1WF7l63mwzYWrL3NjzmvJglq+RR4CVWTtD7MNtWwj1RhkekS?=
 =?us-ascii?Q?d9VzRVQ1XINimwcAZI0/vqw4IwcuQelWg4t5nxuSGnAfU9ARHo+R6E5Uebdi?=
 =?us-ascii?Q?fKEPWEQLJQUP5dO/Mu9qhzltZjMwu4fdHtBkNl+VfdrpflotW7/j1Pt0uauU?=
 =?us-ascii?Q?c624K5yutsZJyqBaYP324NNDcew0wBh3lyE62swjDZUW0OUi/fcQpnq3lY3Y?=
 =?us-ascii?Q?1vN7Gc+8L45MonEUT7Nv4RfnFiNZwxXFocoKMWQzIhgQinNcph8WJmRqGO7y?=
 =?us-ascii?Q?n+NM2j1bphoJVaYm2DWKCzNIarzOLukpD84Po5yP4odxyYcmd/JFmjryxPks?=
 =?us-ascii?Q?X5s+d+qSZP1s4zidFplP5fXWMMCJ79Apby6pHpphWdkErJy5jn8juWP2MCtu?=
 =?us-ascii?Q?fqG902o4vTj0Frg196OugcJ++1c0NPU+w8XjzVI+wEYmmvSJKpijrvCqZHkG?=
 =?us-ascii?Q?dlkTFGJKXaHICQSE5kOK6LLAwHMPDTzL3D8x1hmZAfGwFMJyVlLTnqrLmw1E?=
 =?us-ascii?Q?yd/25lidYRNfplbdvOdNhvfeWQkgp7wWRlS8eDQH8vp4y2dyB3bA1wLa2EUn?=
 =?us-ascii?Q?A1YHdHJZQMSuek1ReSvMeZdoZugHmbvahQjyZe15FH1NWqdulbiVv4Bvdf3T?=
 =?us-ascii?Q?TpW5TFwUnknP854JQVWeJXTA6GvbJYJlgNJ7/tcCogvTRE/WuNbN5dO0GSR6?=
 =?us-ascii?Q?suzPQve7yT8ewJKP2DAdFNFN3WL4VJFCZyGVuAE6HyFocV1DUBgW+G5YIUNO?=
 =?us-ascii?Q?BBVVBa5jMMcC2zd5zuRpL4bMNhUenM4PcODM2vxhBJUHSPDu+o1QTCJ+vN6r?=
 =?us-ascii?Q?akoYnC20KNVa6ZQhOZ74ox6B4fpfo88v0IuSdEfRxsI4t/YN0BqzyN31MHcp?=
 =?us-ascii?Q?W22EUg/q18po35yvr7lfNUpJdq1kTz4l19bd/O3WFmKR07Pase1NGwXdUQ35?=
 =?us-ascii?Q?zJw5KZoWykC8GYS4YBUsWHxHJKkqrHGkn37qUzNkb5gIW1AsOlZIqEY+9sIG?=
 =?us-ascii?Q?BrwrH3GhgfK3bsrq/b2aYxEK69xGUKNpFWskI/FFBe+ajJsu1mq6lf9xjmy5?=
 =?us-ascii?Q?uVyalkcnoa09q3m+LIs=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:41:31.6668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5dc85fe-b5d5-49fe-b047-08de3133280c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5908

GSP-RM insists that the 'size' parameter of the
LibosMemoryRegionInitArgument struct be aligned to 4KB.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index abffd6beec65..71964ee0dec9 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -670,7 +670,7 @@ fn id8(name: &str) -> u64 {
         Self(bindings::LibosMemoryRegionInitArgument {
             id8: id8(name),
             pa: obj.dma_handle(),
-            size: num::usize_as_u64(obj.size()),
+            size: num::usize_as_u64(obj.size().next_multiple_of(GSP_PAGE_SIZE)),
             kind: num::u32_into_u8::<
                 { bindings::LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS },
             >(),
-- 
2.52.0

