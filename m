Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010039.outbound.protection.outlook.com [52.101.193.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70E53559E3
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 02:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769653758; cv=fail; b=hHZCzSoqm/yauV80952fUvkwioYZWQJiZgHSuw5olWGs/53mqs5bYomZlcvSKf05Fkxsk9p3UvO/rH3tA4dJwDSehnsLUODGpyhvhqX3uagB1LuXcYHo/NqSl5TC/X9WE8qXSWJAugG/D2ahom+ysv9A/lPGLtqD8j7D7RBy6AE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769653758; c=relaxed/simple;
	bh=tPVD3Tqr99ewPxDBnrmXK4ljIQbp12GDvD8uuDXlBWc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D9qQ1DJ37Pfl0DdvKFYIT83u8m0cDqoXQuHBUmlK6qY/FU9D7FHufOSPgjrCciVSdcldE7OCM27t79ytN0gWFNIj4Ma92/mOYgpVkCb3OV9ZnZoA2FBaxbrcaidEoM/7M0kAwVruCPChMAAqom0Ro5MhmmlZJ018D4kpJcTalZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l89XxOBq; arc=fail smtp.client-ip=52.101.193.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l89XxOBq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ljTyriwe03gjDQw4PovXxsoOBgdppc4SGK5h0bE/AUvgqokYEG7XwzS3L84MXqtAWSEKl2q4MLC6vf2X52+xKLF/G6QeeZgEulR2dBPybTfLj9JWuHz+MEoQ3RqfzeysNwU6A9+eFZVMZ28s8+Tz02AXbABvj5Jrl+JeWLbgRdnNTNURSg7k0dyY7LXW6l9ucdwsceh/9OOdcr/lfKJ4Rd89zPDe0QmaHfr4yICdycZYTcudJ0WeJcTsEg2hqVgWwENl8VLqczvlQPX3NyU4npYrykzy4L2Q40kfhsZAM3AvkFwrGEKlqA2TXJbYaWc0Nas+j0wf9aOBFVcy433wGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t33e60TNvyIZmIzKapP6s58b5li0ZEE2tegi1Rj0wBU=;
 b=QEGWd+9UM/FHG3L2h2gIOpUokrPbV1oNZoH7wXFXDbWeN90dsmpOvdRlxd+tYBNmNoz0k3GXY+xovyYxhlRmFSRs5CBjRiu8j9sD+ls9EkWkgVi9Ba9T/NCQBRh9MnaVbCkE2r1XiwA8PJMGHd5jakRxPGfJb6W79rOFzspwaCh1FFfaX3EE2qZDrmfHWBZpWg/iyUmL/NzM4erkvW2gNm+pr3DQlHegN3fa5+BY4DGT00O9/XU90+GCcID9NuRXlEiixcTddsOpqmK05Gnu5f5NDlhSHr/195fpj8/tXAu4nEHL1Jj4oeUES+G48blPj8urOxdwlVwBwxOxNZ4Tyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t33e60TNvyIZmIzKapP6s58b5li0ZEE2tegi1Rj0wBU=;
 b=l89XxOBq/uREMPsBkdStA7AHneV4ULwveV35xbPDHxqywmZQvx7dMXBYJJud6yn6wrwCMtTBBqml7zHHIeFtwmYtFPrbRqEmRnWonqTVN5uljx3ZRk0S9UBNUwwm0wCm2NZJ7k+xsbgPYDbbd9vL5OIledPBnqB8dd4Owz+4yo59GTLM7gx5meFDFDL1hoYocVWazrd+ker0Sh9KZ/F7WiRJUxOQyV6hxGer0QJ8eOd8bTrcvTUaw2LsgrS7f24vRCf5Nts5L9XjJ5aV6+47Px4mTNtiCOJLpUtQVdUf50C420yfCG1Ab2156CYZI6U9lJh8IcXvGnwacgcBdEsJ4Q==
Received: from BLAPR03CA0085.namprd03.prod.outlook.com (2603:10b6:208:329::30)
 by CH0PR12MB8529.namprd12.prod.outlook.com (2603:10b6:610:18d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 02:29:09 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::54) by BLAPR03CA0085.outlook.office365.com
 (2603:10b6:208:329::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Thu,
 29 Jan 2026 02:28:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 02:29:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 18:28:54 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 18:28:53 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 7/7] gpu: nova-core: create GSP-RM logging buffers debugfs entries
Date: Wed, 28 Jan 2026 20:28:37 -0600
Message-ID: <20260129022837.4133832-8-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129022837.4133832-1-ttabi@nvidia.com>
References: <20260129022837.4133832-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|CH0PR12MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c437a4-a32e-4720-6a7c-08de5ede2ef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+TLXt2Wvi+C7jfRnB42uBTqTWvPa5IX8hcFFyGs/79dnjZKsc6uT8kOnrcf9?=
 =?us-ascii?Q?ngR9zQ7DuK6zzNOaOp86MFZJrZtQL1Z+qH1l80JZBTUBcCm5o7Q0NcQ1zDxX?=
 =?us-ascii?Q?HgvYGgq1Mrh2+G+dUW25Kxlz3wnalVmpk7TS5lHuXf5Q8u9ctofVIiYqWSEz?=
 =?us-ascii?Q?no7jDqlv+75Ff+XhOPJsI/tXDTYNOwBjrEOl4wHBNv5mLuG6QoE98vQ+wPIC?=
 =?us-ascii?Q?i3rOfOUheDkeNQpp0OrUdg20OcyW0DtQ7kmtu8mXy3EYeGWvR9afyySwGmGM?=
 =?us-ascii?Q?xsFrljsGx9qxxTlvPsap/XSgsNgIzHNz7X+ZuViRCZxpOY41yOyRR8VFx20E?=
 =?us-ascii?Q?MRbF+QnMLWUB+To9wxSAP4I4LVCr8dkOhiKOz21Hwxp+7QC2bLod8BtiidHy?=
 =?us-ascii?Q?TnjMQCaHpEPz7wPBD2EEtDc34L1N3djUqleBl2z0uEk7v/mIMdfbdx1mP3Jh?=
 =?us-ascii?Q?Gs8tYGkm5sj+kqxNOZZnym0LKN4yzDd0heb21Copw/97rXWP63uIR2zONWLs?=
 =?us-ascii?Q?rik/FqpFP+Mr/0eBQhWDacdYrP5JipaNkLwxwf+TovrRfkd+tocyqKScASkF?=
 =?us-ascii?Q?AmUcE8wNgbpLw7+OYY80CCGkypS7ttkyNUxO1i8ZPPRVUe7ilO9U2QHDSbP4?=
 =?us-ascii?Q?4Qq4S+d/oLmShTvcKcQQzZShkiMG9apfx6EXEOPCaDXuXMVwt62cdIYUKm7C?=
 =?us-ascii?Q?dzXN1myBW9ZsqrFvGzgNX0vONGZ+UZtXfGHRjH2bGiAfwoAZY+jv4IihseO8?=
 =?us-ascii?Q?jwo3fOKub6HedNz3VnufqiA/0XyASGnkl7xX8vFgLMl3i59Oo1GHMGLMH81T?=
 =?us-ascii?Q?B7HAqj3PpsuPmSIpHQfXk5/3BkF49GBjEpYubPDscT9VWJIxCOWCcG20+LRk?=
 =?us-ascii?Q?dfdPnHyi6N6tUpCkEJ4aNhBqNYIUlXc1tF6bTHRhW4LNu/4eIK8E5U24+49W?=
 =?us-ascii?Q?xIdcQWDt6aPRVE+prgfUJqqNf1AziXO83JSyDCjfMHVP2BG6uAVT5ZsNveF3?=
 =?us-ascii?Q?zIagJ5iQIukhXiTJ+KHzOBZshgSPKWu7HCNC6Fg0hDujATykTFOw6tcgik13?=
 =?us-ascii?Q?8N16sYRVF4V+av0IdLec8J0Rl0t2iqkXv1SyHqQKb0t0SoZl8WZvUKl165jF?=
 =?us-ascii?Q?yk288cDK91W7UBkIDEZqOfk6QAZJc86jiRJlodpniFyEWf6fUfjh8vCcPMtu?=
 =?us-ascii?Q?ZWDcRE2nQcdRt5aD5aBIOLgd0YqQw8QQ2LxUwpue0oihdme6oHKpKsDlafgi?=
 =?us-ascii?Q?KLPQRKOOVdPNtsPEDGPPyV+wSFiVhfrBxGtF54OxRZSp5SkUItdoowxuY4HT?=
 =?us-ascii?Q?oIpu5JvqPBkR2nOPNE4YiEAv2n6SwthKDghFLLwlACnzlftYt+JBGxftsB7L?=
 =?us-ascii?Q?JsTsEwyh3wf2eBxYkq5GUN3JEjjfCbSaQrYNGJWdfuphir3KXYY1V3LrNQ0X?=
 =?us-ascii?Q?8DUfw79sc1pWGcWK4iNTpSpHGpS15j8fTv9QObCgFBuu90CwlqN9wZ1zMkt8?=
 =?us-ascii?Q?RqzK3zeO2fZ9oN4nC6kvpAhQWnu6fvl8hSWWeV9niRd6KJqsFPXMbZYfEAM2?=
 =?us-ascii?Q?lCaB3BIMGTjocTvq8Jjm3YWVf6pRGdUpKPGsAQB0u2hFbO4kZsNfovlumJkl?=
 =?us-ascii?Q?vzWpSsmc7wwIoaAJwx/hcEMWRsxd9STJxBySHrWbiCuP6X1+kHQGa1WuCprF?=
 =?us-ascii?Q?wAGsNw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 02:29:09.4766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c437a4-a32e-4720-6a7c-08de5ede2ef0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8529

Create read-only debugfs entries for LOGINIT, LOGRM, and LOGINTR, which
are the three primary printf logging buffers from GSP-RM.  LOGPMU will
be added at a later date, as it requires it support for its RPC message
first.

This patch uses the `pin_init_scope` feature to create the entries.
`pin_init_scope` solves the lifetime issue over the `DEBUGFS_ROOT`
reference by delaying its acquisition until the time the entry is
actually initialized.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs | 45 +++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index f7134c75b1f2..33f9cfd13849 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -3,6 +3,7 @@
 mod boot;
 
 use kernel::{
+    c_str,
     debugfs,
     device,
     dma::{
@@ -101,17 +102,24 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
     }
 }
 
-/// GSP runtime data.
-#[pin_data]
-pub(crate) struct Gsp {
-    /// Libos arguments.
-    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+/// Log buffers used by GSP-RM for debug logging.
+struct LogBuffers {
     /// Init log buffer.
     loginit: LogBuffer,
     /// Interrupts log buffer.
     logintr: LogBuffer,
     /// RM log buffer.
     logrm: LogBuffer,
+}
+
+/// GSP runtime data.
+#[pin_data]
+pub(crate) struct Gsp {
+    /// Libos arguments.
+    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+    /// Log buffers, optionally exposed via debugfs.
+    #[pin]
+    logs: debugfs::Scope<LogBuffers>,
     /// Command queue.
     pub(crate) cmdq: Cmdq,
     /// RM arguments.
@@ -124,15 +132,17 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
 
+            // Create log buffers before try_pin_init! so they're accessible throughout
+            let loginit = LogBuffer::new(dev)?;
+            let logintr = LogBuffer::new(dev)?;
+            let logrm = LogBuffer::new(dev)?;
+
             Ok(try_pin_init!(Self {
                 libos: CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
                     dev,
                     GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
                     GFP_KERNEL | __GFP_ZERO,
                 )?,
-                loginit: LogBuffer::new(dev)?,
-                logintr: LogBuffer::new(dev)?,
-                logrm: LogBuffer::new(dev)?,
                 cmdq: Cmdq::new(dev)?,
                 rmargs: CoherentAllocation::<GspArgumentsPadded>::alloc_coherent(
                     dev,
@@ -153,6 +163,25 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                     dma_write!(rmargs[0].inner = fw::GspArgumentsCached::new(cmdq))?;
                     dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
                 },
+                logs <- {
+                    let log_buffers = LogBuffers {
+                        loginit,
+                        logintr,
+                        logrm,
+                    };
+
+                    #[allow(static_mut_refs)]
+                    // SAFETY: `DEBUGFS_ROOT` is created before driver registration and cleared
+                    // after driver unregistration, so no probe() can race with its modification.
+                    let log_parent = unsafe { crate::DEBUGFS_ROOT.as_ref() }
+                        .expect("DEBUGFS_ROOT not initialized");
+
+                    log_parent.scope(log_buffers, dev.name(), |logs, dir| {
+                        dir.read_binary_file(c_str!("loginit"), &logs.loginit.0);
+                        dir.read_binary_file(c_str!("logintr"), &logs.logintr.0);
+                        dir.read_binary_file(c_str!("logrm"), &logs.logrm.0);
+                    })
+                },
             }))
         })
     }
-- 
2.52.0

