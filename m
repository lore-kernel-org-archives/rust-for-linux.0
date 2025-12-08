Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010035.outbound.protection.outlook.com [52.101.56.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE8E2ECEB9
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Dec 2025 23:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765235928; cv=fail; b=DSXTtZUPg2JJDSDjZjpSKvnJJfXKdHvI2HRY71f7iZDIORbYcyOYuEWPwO4hEn3eVz5NR+8rLXfk9tXpZMbS5gg6Wb+k3fZlTTGLxbIwAH0/ByUDvCQ25QlzQEVcS83hGsioUM5n4o+4S2J+lCY2g/O4kft3uM23Mv2mN0goKyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765235928; c=relaxed/simple;
	bh=474tcnDbLD/yq5auYo52FqrxqXHHJhbDhacbpCfNR0A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=seNCkjvK1hwYopP3Z2scPccQIOc3TiFxXLldgVBqCuM4na4okUTiG+FtNoRI25bKUhlSd+NF3sKOB/ogJ6bo5+C/heKYcWyCWg8eiUNwMQWBFNTYLV06/XWaNa8ZwknKS0KdPlL/pn7ZxVvnefGhymQuumURGKCf7V9sqyGlAIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JuRyNVJI; arc=fail smtp.client-ip=52.101.56.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JuRyNVJI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftIrkkBq2NuiT70cCG97Ta3oeNMFWPlWcAal5WNqxfXkGFJ8+K+2zx2aL2GtL8XFVwZGQpwokDnFVcDHLnIYv+Zt4HtsL+LtHVxQkU8C4R6OBuKy5r8pjS9vsQuEg+KydpV66HNxTq00Uc2G7K9PGZ7f3qxlMUSIpAQzEotOo2IFLJrVV2370240YPikYjQSH2wgTfSCYzQJwPxEFEf4cgNVOyuhWYx4BrfAESug18uUU0VhJXiVOTVUZMiGY5duPHZ/GKLhuKaGccqnyFACpv59kdfHiyMiLXc+h97Ev4H8DEWd2/mWiMzyqJIYuYmKUCT1xBKhivOfDek7yUciTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ha2J9orRUI0LTavALskIOVNQKq00h1weUHi74oIzVY=;
 b=UmGaXv0udXDRcHWGxpcz++3EzwNtPsHX9Np0MpuBoO0q7S6HM7SW91GcvwRQatqNcF5/pVDtnemYIhJ3khhYgnzcT2w9JCnbag/DnHsnxVwAQVBxKjVr9XpllpJwis6upJhLGGNuLgVXNj6rW6MuI7bnkbODTwLbsOoHcTqb0mQ9pqXqwoBp+kQDIvWfQFq0V87MDWI0uv7vgw8oaYoOSU9fFk0yXbIT0vIZjsnzwFiGjX6FP71wDOvYd5hFSt439gH5Xpurh1+7AFxVX2cS7bMiut2+qNzR5j+N10dFZsigFL95e4ZJpnt29YiEZEmbFH3Qek2WXg7brQlecTOH6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ha2J9orRUI0LTavALskIOVNQKq00h1weUHi74oIzVY=;
 b=JuRyNVJIIxoGyi5mypr7H+F6KAnt+2fJrsenqx2oCP0beyeOwg1kgBU1uNzQDkQnwRgnCysg5KDsrDpN/LLR6UKrqoXCJ3FMB8bi9Bkjho1niI9pV9Un+z6KtYaBz0LCrBhL/XHMMXbWs0c1xKxfKUA5ubq1nVVdpJKKiVABDkT1IQus1URugdbayJOfCp6tlq2hQxsbwfqSLKE4zXCPfzOOdnFbO6nZNIOqn2tc9Q7ympQCr/2GtBk3fo1GyvarOFVevt/V2iM9zj9Yyyy2iQADJ+h69F0lqIMK1DhQdMd1LZRBifBLxJT/DPgW0z5kjixjoJLx0z2WDre8Z8taVQ==
Received: from DS7PR03CA0272.namprd03.prod.outlook.com (2603:10b6:5:3ad::7) by
 SJ5PPF01781787B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::986) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Mon, 8 Dec
 2025 23:18:38 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:5:3ad:cafe::37) by DS7PR03CA0272.outlook.office365.com
 (2603:10b6:5:3ad::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 23:18:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 8 Dec 2025 23:18:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:20 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:19 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich
	<dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	<nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 09/12] gpu: nova-core: add Falcon HAL method supports_dma()
Date: Mon, 8 Dec 2025 17:17:58 -0600
Message-ID: <20251208231801.1786803-10-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251208231801.1786803-1-ttabi@nvidia.com>
References: <20251208231801.1786803-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|SJ5PPF01781787B:EE_
X-MS-Office365-Filtering-Correlation-Id: 59bf987a-0ed2-456e-ef43-08de36b01e37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Kh4YX5kth2TV8M8/bP0jTSCPqXN7QuvWT1hTXbazeKjpx0ILQDTlRi/xyPVE?=
 =?us-ascii?Q?7ATaPVSwOpFXPoeSkpmLao4TvG7hburYOXu3ZTEUtmxHJOYr2wTU0DXY4X3e?=
 =?us-ascii?Q?2B9/qJXtxeDUjy2Q+XF2Wv1dN7Y0SxbEClq2ac6wgNRybUdEZpfF36Ajh/hb?=
 =?us-ascii?Q?E65QN3xDfC7js3edR+o/nv00MHIro1Iep25V5l2W1lrJ6Fg8IMYnAGyRyRv9?=
 =?us-ascii?Q?SZLVm0GFLWsoCeIE32wtWRZ7Ic4yGJdpX4oHkQzM1OK4gSve7cU5D5GUnzFO?=
 =?us-ascii?Q?0oVGfdxGstVjhcLNL5yV+wDSPX2lmYNB77arCHt5vBRHXSPR/usm0HtMXKZo?=
 =?us-ascii?Q?UKdynMxwQtXqxvYshj/0Rf6baNWRi8HmfaZUwV+/ADMEsJgTg1Bbm3cJ4CP6?=
 =?us-ascii?Q?rWeKnm5clWgrG9BFxN5GnOqVyDUinoU1aXPwWTNAYO50PYe1hAedJO+2pfDV?=
 =?us-ascii?Q?h0G9V58otd/2fPwHEStqlt87isVZ4KDXGHX7WR5VNJTo5Wf4VxZDuJBCohV7?=
 =?us-ascii?Q?KvB8rbKeegQCVRsebIAWw1FPijuMjval4PrB4eVmzJJw9H634lbi7AYAPclf?=
 =?us-ascii?Q?lJ9D3WZAGbjM6qKaxDebWFCKBkcB8fO95+CjygBErG8qYqdbO2l/1bcuOv7g?=
 =?us-ascii?Q?1GYGX4Zrk2aCxvzQZ2RfUNF2vxs26oeEsiLw2JeeSTQ1ySMPucFvkp50NBGp?=
 =?us-ascii?Q?DfURpReFbpmQcyPndfXPwTx/AI07oS2JhgYw9F0G1c7QDHgVxoxKa/5b2iwK?=
 =?us-ascii?Q?GUttjI8w6N6PPcYcXJVuaXzekFizTTxkj5VYJdSpQok2rUFDv/OxNNNGV549?=
 =?us-ascii?Q?dezv4a35IVl+HAPkQgFiJr7AQO3mNuMYdmnjstHzOnDjF6HpRtUg58iBYT7h?=
 =?us-ascii?Q?K0GAgCVCSepsWfsslkqYcygYczgnrbYyZGeTPfk/Jfc23BZVFNBY9CkH5kPD?=
 =?us-ascii?Q?wYSGjJLb3ZnCl0dCOGnU01MQajO7KfTDBWCTOiwsnHBpgqzV99Mkwl+1Jfz4?=
 =?us-ascii?Q?BUX1KxLJSKc4yO0PMu/enCOG0xWO91XpYMGimjmncfDmZ7u+TTWN/Q21sEVl?=
 =?us-ascii?Q?ARvvHsVMtOSk0zrUcGjNoSZajin1NcXRHBbuZjy7hj9IhdiWVPXMRDLLoH0e?=
 =?us-ascii?Q?qyDFvSyYHIr8IMs7Yo2514Bs71LLcMn+mbsycuWOfoqFzOYSJm/SxsMyBpBS?=
 =?us-ascii?Q?8JbMA5oQQQY4DFJI9aJoWjNpDsDPVc0BUdKU5GuXHxI8gOkoXDT1ZopVfnmy?=
 =?us-ascii?Q?QMPrgr4g2ycKsCrWbombdaU0Ovj2R3+tk99+Cd9wuoFiqVmHmqX/aHLkQyBP?=
 =?us-ascii?Q?8wdEDwonstgS60Zt92XPoeu/JMZNmDDd4M6IhmgkKnJ3ipYc59isjt2fWUoK?=
 =?us-ascii?Q?jxCkzoVO561rELx+yRqr3vATR+n6ctAiXmheY9eemUuzWoVIlaJRr7cFuDy5?=
 =?us-ascii?Q?70D63uUuQxyZqF4j1IpNeUFWyIO5yGieeamMGWQyyZdDWSWrcREFmEiMjbAD?=
 =?us-ascii?Q?ijoFcvY4+tgAOq9lzS9xj222pnW3s90xhyIss4n93N54ighTIa1kLF3SDbXT?=
 =?us-ascii?Q?LJJlexx8DFqixIDAYhw=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 23:18:38.0907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59bf987a-0ed2-456e-ef43-08de36b01e37
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF01781787B

Some GPUs do not support using DMA to transfer code/data from system
memory to Falcon memory, and instead must use programmed I/O (PIO).
Add a function to the Falcon HAL to indicate whether a given GPU's
Falcons support DMA for this purpose.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 7 +++++++
 drivers/gpu/nova-core/falcon/hal.rs       | 3 +++
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 4 ++++
 drivers/gpu/nova-core/falcon/hal/tu102.rs | 4 ++++
 4 files changed, 18 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index f2da6a4a9d36..2770d608a2cf 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -631,6 +631,13 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         self.hal.is_riscv_active(bar)
     }
 
+    /// Check if this Falcon supports DMA for loading firmware.
+    ///
+    /// Returns `true` if DMA is supported, `false` if PIO must be used instead.
+    pub(crate) fn supports_dma(&self) -> bool {
+        self.hal.supports_dma()
+    }
+
     /// Write the application version to the OS register.
     pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) {
         regs::NV_PFALCON_FALCON_OS::default()
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 7a6610e9d0a8..a760620221c3 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -48,6 +48,9 @@ fn signature_reg_fuse_version(
 
     /// Reset the falcon engine.
     fn reset_eng(&self, bar: &Bar0) -> Result;
+
+    /// Returns true of this Falcon supports DMA transfer from system memory to Falcon memory
+    fn supports_dma(&self) -> bool;
 }
 
 /// Returns a boxed falcon HAL adequate for `chipset`.
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 232d51a4921f..684ca72b7cfe 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -160,4 +160,8 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
 
         Ok(())
     }
+
+    fn supports_dma(&self) -> bool {
+        true
+    }
 }
diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
index 19a8b49ca2cd..d8ec914bd3f8 100644
--- a/drivers/gpu/nova-core/falcon/hal/tu102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
@@ -71,4 +71,8 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
 
         Ok(())
     }
+
+    fn supports_dma(&self) -> bool {
+        false
+    }
 }
-- 
2.52.0

