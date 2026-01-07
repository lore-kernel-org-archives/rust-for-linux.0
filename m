Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16679328B7C
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 20:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767817216; cv=fail; b=YI+YngOgBM+48fy5wuxECQI4y/RcG0jN0NaVCPmQzYnynRJmBsXonCFk20JohwpzI9U6kpJQMmjMDlIFLZ1rExRs059otPX3Sdgdhj91pHQPcpco12ex6uMLeWZBt5sXgZ+ea/c7zqE1hsbWXXqVmpT1IJdsiMPk5Xo/MvlZp5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767817216; c=relaxed/simple;
	bh=Qhm+sZ4U7wnESQW4e0TjPMyML+j7suuEiV5NjNruN1c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h4iObb0yTsvUNpgE2TLQ6Toi4YvY95+oUFkBhVV9VJCu37GR/DQYkDpAsGVQHPVu7OPkw6euR+IVNsfcm0KMFIpWh/kOm5xxjmBg2EAD+JTNme0FIDRjRPP1W9D0VkU54qcfOkzcpv/5p0rv+h5sPNhqHqMWegos7nY50c9VYno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P6F96FMp; arc=fail smtp.client-ip=52.101.43.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P6F96FMp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fl7xhEgxUvgiHmjpbEYzV4HaZ2yCG94VOApLpUA4YN52qjmt0pm/trfQ3IZ2yvh1GKIi/n8PURyt/kGH8LYbPB1qKy2W5SSNeICsq6EFyiGsl8u6fax7eSmk5IvDMZdOtf8PIRFuIwlBxq297QD801Xu8rkU8OzfgpCcAYQhHazzg0MUrr9inj7VM0By1CZuvcVF7c3sWADv5AkbpcUigmW7tdGwiSbqQe22P++2ZMVRwROcx5rdtVaXqnEDWbvvn+4ApU4n6ix6qUFeq1/pxpusuSj1uc4gk29+0LptuQbELHNISaZ4u59Gvkw/uSC7OU+KjDP8PrqCn01lqjxksQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fr9bs62BU3r+PlOJ2vj/wG74XwU5Lj7x1XomWRpSuwo=;
 b=yVfxrbjUttl3yz6tFMeKif4/HE6WZG58zayhANsD3Qo6iFTONMrJ/z1QOOPEgrv1RzZLmtTszauiCk36WBCsQWv00B6R/ZMNgDagu9KQ8nAhdmf5IFI2vsT1At/sM7x3NtoPVkTA8NZH0wnHWMk9reuNIMYDK1eLsYzD3pSdr0W4GCy0Wo+BiRP7FIvpB87pK2aHrtpCUyxVD54gsM4NdR7nQpBeTXhGRQFZf0F0pMV+i/I3V8TE40zfMDrNh0W6woznBQwBeUJue4ds7mGgKW/gojuRxyzochrg6eKWIetMo5ig7hYSQB6z3m14M9rY3pHx6JAI7xcqCCqyFAak0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fr9bs62BU3r+PlOJ2vj/wG74XwU5Lj7x1XomWRpSuwo=;
 b=P6F96FMpnLze6Vu2dNeW5BWmDExORugfejThoykfBsBPN7Wnd6zfjxedj+eFtV7SUF6/58I8TbcACHXUYWwsFbqRXogF35Lq1si7OHTTALUQicW0A93irPrT1Bv9pXzngjFQxoac3ZrZr3j5cRWj65bH2OiMo+v8d+WzhfAi+bjvf7Wc4K9IsJSOLuuzCTeOJQinQYAPqzwISZlWi1TOzrKYPJLh+k2nl4k+FaNIy9JwYYoW9pKlw+d9Xj3zzPnCmCB//LwOYZjt13DCvnXWLsYqe5cYflxN6TiovxaRPd9mKY/k+tPPKNr/ajz3ccSy401Wn+7P6J/2Qaz+9NjFvw==
Received: from PH8PR07CA0037.namprd07.prod.outlook.com (2603:10b6:510:2cf::17)
 by PH0PR12MB7079.namprd12.prod.outlook.com (2603:10b6:510:21d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 20:20:12 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::6) by PH8PR07CA0037.outlook.office365.com
 (2603:10b6:510:2cf::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 20:20:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 20:20:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 12:19:53 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 12:19:51 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
	<nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 1/2] gpu: nova-core: check for overflow to DMATRFBASE1
Date: Wed, 7 Jan 2026 14:16:46 -0600
Message-ID: <20260107201647.2490140-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|PH0PR12MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc9e33e-3043-43e9-28cb-08de4e2a2929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?033CiYA7IlnzJbHgq5osSaQSA3aipHyXr/kFX9QAo/vzg2A0V5qU4EVxJZIg?=
 =?us-ascii?Q?bTrAv7AtxHm2sRrTo2ZkMJfkLWoGCZm6xVCJfZpAh6+g9YBWe0DAACsuQOjA?=
 =?us-ascii?Q?6kz9PRmoj8TaRiH2g+gldFROgRQw6UNRIJPwgGTiZIg7lAP7TJGB1LgD7Q1M?=
 =?us-ascii?Q?sYvtkCFhi0VcldgI6G6m9h1rtOW0RkltUQjVMu5sZswTCOp7ZQKYaYeIAedA?=
 =?us-ascii?Q?UQLjKW5XRVHJZ8vkYgBKjTWIKQ74XNX4p+JAGemiOj/VMKwpbVoQa1kpLyOc?=
 =?us-ascii?Q?0R89WdObR57jWLScXk7G1S9yG70st8Ao4dA6quFpIcxEL1ztVHCLvq4PC/VB?=
 =?us-ascii?Q?IX/ecJMLn+8Li2/UXgzK029Eb6Isa+K8H2JvrNdpfRq4GlGas5dAxqXKvqM3?=
 =?us-ascii?Q?3nF4TogR1vCK2J5nyvEPiXcdbgeZ512hXz7/93DRrQ8f948jxiXIaibmt57E?=
 =?us-ascii?Q?4KxBYloYLWB1qBwF5aXXR43/zfC7RKwR55HFu2j0OSrkE5ao0JoCkJ0O9DtJ?=
 =?us-ascii?Q?WuSBi1SpM1SrBMmVgyLHBUwT1idJJvVQAQU3Oay4rjhNTIZShsUGIkxv6Hpc?=
 =?us-ascii?Q?+wJdOtL9HByFxZ7OmtvXnUcCdUcyN8ix2d5zxdNa3Q4uDj0i9/2gkyZO95Zr?=
 =?us-ascii?Q?GuKPrF6MrSoXqtqn5PEvYBkbvGxc+Ba7PF36pfdUE7+DFs2ePOgcIsZM77Mb?=
 =?us-ascii?Q?78+BTdd1Z1FY2fhZ3MUQA3oJ8jAvyJJecYyc8nsjD+HPtmZcqW16bFk47ksg?=
 =?us-ascii?Q?QYvNnJF3Mg5JEgMVFirn+WXhIO7SEEuyuV/ze9T4k1bpYCtcRPKjp2+kFxeo?=
 =?us-ascii?Q?PjoExE88QB/t6ti7bLkZhYfYivOXjuph3QbHMHY9gcrQGpgLHsDGIyCC9tLe?=
 =?us-ascii?Q?7uMHTgowdK/jWGHh84A2mAIALI15YH6v1g+CBk7TUgizF7I4Eht4uT9Eq0c4?=
 =?us-ascii?Q?IgppybKa2aTThDyrycuAgx291Q/huzK23tVc9i/XSsmoR1y3AH9t2Uk/Abjv?=
 =?us-ascii?Q?qNwXBtB26QCp1IzOVv6xkaL3WII+RW6TsQCyMXxLpBE66aiRdudxX0aGTfeM?=
 =?us-ascii?Q?f8fd5ad7IT8DpA2NSHDeJRkFBBu6uN77gyUcXvW1Y0QlZwbBYmIQvLzvGdkL?=
 =?us-ascii?Q?WXZNP73LUsRFVM/lUlcIEwnwc+2uKofbDhF6ZnrM1LBEdWG8PiZblwlwpfHu?=
 =?us-ascii?Q?thhwipebzzsSvRJ7lmK39zFia4OuX2MS2YjtbCTI77LEr4rVipi2kodphFTS?=
 =?us-ascii?Q?Agn5oiqjXRgc+JNKV3KiuA/4TYjsDUhMsJYEcy10je9n6hv9E12TQBIag+qn?=
 =?us-ascii?Q?9MnHRHgM4xiODnpuewB/ofrcGqH1aTKyasVisaEaOTtSNeJa7Oo5Q1rJlsNp?=
 =?us-ascii?Q?/ywwD9dSZ/ajt0Apwc8KyXUfUgX1UNm4mHUtEN76NgLjKOgYnwdUIeanIhoc?=
 =?us-ascii?Q?AeQYNGgkdWFthhltSmD0sNb4YO83vEEDny+x0IC4iTJYk8l2ZkJkoaY0eBwt?=
 =?us-ascii?Q?9CdioWKR2hqxgrbYo/6jsnQnmhZCIr//F//v8GInzsBCcUDEA6/XNgIL6QS5?=
 =?us-ascii?Q?a4+MKvojoNVRSX6xI1s=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 20:20:11.7971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc9e33e-3043-43e9-28cb-08de4e2a2929
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7079

The NV_PFALCON_FALCON_DMATRFBASE/1 register pair supports DMA addresses
up to 49 bits only, but the write to DMATRFBASE1 could exceed that.
To mitigate, check first that the DMA address will fit.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Fixes: 69f5cd67ce41 ("gpu: nova-core: add falcon register definitions and base code")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---

v2: Improved comment and moved check earlier in function

 drivers/gpu/nova-core/falcon.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 82c661aef594..6ae0490caffa 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -472,6 +472,12 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             return Err(EINVAL);
         }
 
+        // The DMATRFBASE/1 register pair only supports a 49-bit address.
+        if dma_start > kernel::dma::DmaMask::new::<49>().value() {
+            dev_err!(self.dev, "DMA address {:#x} exceeds 49 bits\n", dma_start);
+            return Err(ERANGE);
+        }
+
         // DMA transfers can only be done in units of 256 bytes. Compute how many such transfers we
         // need to perform.
         let num_transfers = load_offsets.len.div_ceil(DMA_LEN);

base-commit: 2d7b4a44fb768e1887e7e4cdd8b86817ccd9c3bf
-- 
2.52.0

