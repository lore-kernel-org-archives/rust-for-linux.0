Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010037.outbound.protection.outlook.com [40.93.198.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D293090CB
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 21:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768600247; cv=fail; b=Pwu7aOWP0RQW9blD4gS/zGIfILjIRNP8V/TNfLCpZ9dBpGsRg3EvwGZlwcVjvffG38CI75TNNK2gyV05+A64BivrhrsbqEW3T6HckYqP7DNj0HboU3/+DUr0qCnmpVGRTuhmgFimfNq5NjUdi83fXcmA7EikSDhoxLWQbGRC5GE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768600247; c=relaxed/simple;
	bh=gVPKKOtX2dJZy/+cHvcHjCZWM74AFhjG2Gwub5HHpdI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p7G+2ML7LfSMqVRi/dxxsagE5InnSQdNn6cTQ9Jcq8jxO8DFKJjQlAIKc1LXnlHpBBFq9UXe82ixC4YVsqZAxjSzDLSt+LAC+6kxL2l0bFEM/7mg+9zTGmok796oXqKDVm7TkfUz7RhHiBTxM4+I6Y6CfLa2L6yOwYS9F/FzVJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fH/MIc1M; arc=fail smtp.client-ip=40.93.198.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fH/MIc1M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sbmut/dLsrl79lIvlwB8+WuCvzfgFzUBrWzTA/g587Zc57SBEt6QBNPihXT9bjis1sBgLHMXQyhgWOC0V89okPYxowTur+kiY5gVs/0xDIgqmtMpIA+zAqhK7TsGt31UOnxn3vaxEkRPOqCcMCmMPKJEPCmpEouZxW+fPWEmWRGl6027KVVj0iBOTN+19pbnEMYs0bcmIOgZUAFDKx1ZkNAEr1GquE1PEm+9bkcno1HkNCr1EOv9DmFp4WvzmcWkf9X/hDIu5zoV15tQ8Ipj8kkWuzUqGUu8V1mGfxkhGz6RynZFeYpEe23Xg1z4shQoTS2C53s33g6OrCGmTqZ7ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYFEgFEGF9ZM5gfQryZ2UH2fuoFtyaFIClmJfSlwaCA=;
 b=nqTk0EcHx7RIRZxOtYN7qwAff/gzqnp3qDtfGPIT0Y5d7k9VGDfhU51O3fvpjOQh6BkePJYSUkvI7/nCYzZMgJ6JPjuVO8zk9PL+0PopeL2G50P+kht0iNgT0OlvBZ5sdEsX+DybkuKO5xKl8SDNslbjEci78iO/7DmkPaovP88S3lT9h2Qq7wIsQU5ZnAPHtKSLK8Fc6Ep6BIdytdo8GcwF8ZWk9zeBvOixTZeYFH9sikUpytCcwbcdY/xWtnlzcVBMisHjNzdx926Fy6Uwpp9JzWsYupgH9fHtURv/zCUpsD7fWCq6E9lj1iOEfuFSnpHZ6CGwsvMNGhTWAKYAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYFEgFEGF9ZM5gfQryZ2UH2fuoFtyaFIClmJfSlwaCA=;
 b=fH/MIc1MpXzw1hr5PzaKC9nBHCE6s+MDwXYEfc9su3O2VNApmKBil+GZs/K4y1eJes65OCHkVoA000oJKLbZfRnYvTb8WCcvBV24RIXzYoKwXPW/HIPb3+oUKAJuB8MlkQwGGQq379Dk6FnH+WMVZNdqyzj9IW477O9P4L6/bS4+P/f3pMLKONX+1+afzMmhd3yRkdW2VPet27ZHZZZVoxwXvFduPzmcCBv81V2gvlRFd+c9lwTOnetdAeuuW+EII/7QDTSkgR4qxIMJ1rjgaEmePsOv/zZctMlc7banq+Vfl7CCI8Sru0sr7ba3o+g5p22DkkAh4Hymlj97bVtwig==
Received: from SA9PR13CA0125.namprd13.prod.outlook.com (2603:10b6:806:27::10)
 by LV2PR12MB999096.namprd12.prod.outlook.com (2603:10b6:408:353::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 21:50:41 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:27:cafe::71) by SA9PR13CA0125.outlook.office365.com
 (2603:10b6:806:27::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Fri,
 16 Jan 2026 21:50:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 21:50:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:20 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:19 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 8/8] gpu: nova-core: create GSP-RM logging buffers debugfs entries
Date: Fri, 16 Jan 2026 15:49:59 -0600
Message-ID: <20260116214959.641032-9-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116214959.641032-1-ttabi@nvidia.com>
References: <20260116214959.641032-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|LV2PR12MB999096:EE_
X-MS-Office365-Filtering-Correlation-Id: 134cb0ae-c60e-4ed8-afd3-08de55494b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xQYTrHbThAZP8Fv2jSzQvl2Bcyg7D5cEB+uX/4Rr/ApfBaomAeKd5Qj+LiFY?=
 =?us-ascii?Q?rG0fDc9crsMbeKljqY707V4TqqcLrDmuDmft96+bgdAOHGLBasfG5Fk46RUE?=
 =?us-ascii?Q?0bQ+OVXK++Ueg+DocB3XPnOpEiYHYqJcWEqt61Z30iZtP0iqyalCb2yTHcDU?=
 =?us-ascii?Q?SmFWRwx+J0Cc8JWhS8O3Hs6oBJwso3+vTa//hn0NEo/DSZyD7YLl7BAZHfKd?=
 =?us-ascii?Q?SBM+6xeAnoge4YRNQV7RjcS03wABLjDIo8pLe3OuKg4gnzFLMBDM/j7SwLso?=
 =?us-ascii?Q?c2xTTO0aKO0koj1tNKnhVB4tkjE1nTc0x5Kuctjlj3btABsWrLN9RtmqlQb1?=
 =?us-ascii?Q?HQ+82+c4SZi92yBSx/v8kDPjbLk0c1tvuiCmUVykg1kwB5YlMSpLfOMfvEEz?=
 =?us-ascii?Q?tXd3kIHse9boAyq58+DLVgxgWsx0ACMRqWnUDhksArLCzWhcjVDfhv/trgE/?=
 =?us-ascii?Q?9PyvvmoYFeFQHMutE/RVPdDSdXaV7/8GdOEKG8PnvpMaxIoh7MzLsMrzePLm?=
 =?us-ascii?Q?qOzaF7AqWJLer9hqLA+/E0XkbzQ8IaK4LqID0ml6c7/zlQQkJtvFPgUpc7uI?=
 =?us-ascii?Q?eL9C5pLgCZNiD5W+oBMhFJZ8Jyf4uKDt9kuH0xwGiPyvIuDVyaMRBCz/98Z3?=
 =?us-ascii?Q?dbmuRrnm+z2ZhrcKPLZa2lO6hcS9nGSuyzwHAYc68Tl2g8HTdwToKPU3cGCJ?=
 =?us-ascii?Q?4JUHQ1mEtF53j4le06tl0tAJuKFsv/ZNsVhqW6BSTj4P9G7d7Luc3+6ZfIOn?=
 =?us-ascii?Q?8Zucq1HoiqS5CG4jYIl05rVNl43JXhCEZEXASas7poXe1/kWp+vNrevz78RK?=
 =?us-ascii?Q?REVCZm2XrjxYt7v2+RPK/P/DIoEDSuxH9/7gZ0muETQ6GI5u76lLJ4LqPUsa?=
 =?us-ascii?Q?GNWeZGhKeFntVsvV13o8NOTMMP99Lb50Uxk/usVhNMWYholIik/u4RhIJZ2s?=
 =?us-ascii?Q?GgeVYFfMaQFW139i4+77z72fw41SPk97Yn8asGbuIu/qogeifG0N/i/LS89h?=
 =?us-ascii?Q?ZK+v/Jr0bUszxQw/krbSn+kZSeoHiFIePdq0JT9hE518VMZycZz+dGiQ4rbq?=
 =?us-ascii?Q?ngS+oStsr7VWO6s6wBQnNdCTkggIRWuAlHSzybcPGMoIZwPukbeOJOh9eGh6?=
 =?us-ascii?Q?FL8dxK957/rzvd2BXuuUoIHK4++/Jspr479Dl3IgAt8/RGxZ/l8EZv4BPcfi?=
 =?us-ascii?Q?bKcZ5S640BzQsFpHWTBzng+bkL+qEFriHMECAToSU0klZhfN2B8kRBFB7hxf?=
 =?us-ascii?Q?HX1dkkgE+MzmI4TQHOMS91/UCkO9DSV3gkQe14WURVqemH3exUUG04py4a+m?=
 =?us-ascii?Q?JevqTyRFo9y1EmEhmqwGCBtkR9Z6/05Y06Q1qfWG6L9VoK1Z/qX2bzfeD7yb?=
 =?us-ascii?Q?w/UjR2g64bzbjRF5IngiY0ME6bpuqvXaAriVSaVtf6e6QUv+oqSnUrZPTnsR?=
 =?us-ascii?Q?E6udzYjLUDQL3M6LjafyFkR3dmP6IOPoMzDxusDe90wIN7eRyVodEqWp4bqp?=
 =?us-ascii?Q?n7sCRyWBykHMXAEGoHWp4X7C+Uceqp3MdkpTJ+FCFBGKrRof0GL5Tqgp8+eF?=
 =?us-ascii?Q?4CZPGBOKrmjCGiet7cWCGS2nT9sVm5pT2umk9ShWtmBAt7XEMFPIR1LAqSSL?=
 =?us-ascii?Q?LXDtthqXKEU7IAZvQlFVtbhYemFGTJEoc7+JyGMA/NMAjK+0yZWZRxwONL9y?=
 =?us-ascii?Q?QDHgvQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 21:50:41.1507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 134cb0ae-c60e-4ed8-afd3-08de55494b07
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999096

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
index 273327c33aa7..4b194bb805b4 100644
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
@@ -163,15 +171,17 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
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
                 rmargs: CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
                     dev,
@@ -192,6 +202,25 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                     dma_write!(rmargs[0] = fw::GspArgumentsCached::new(cmdq))?;
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
+                    // SAFETY: `DEBUGFS_ROOT` is never modified after initialization, so it is
+                    // safe to create a shared reference to it.
+                    let debugfs_root = unsafe { crate::DEBUGFS_ROOT.as_ref() }
+                        .unwrap_or_else(|| debugfs::Dir::empty());
+
+                    debugfs_root.scope(log_buffers, dev.name(), |logs, dir| {
+                        dir.read_binary_file(c_str!("loginit"), &logs.loginit);
+                        dir.read_binary_file(c_str!("logintr"), &logs.logintr);
+                        dir.read_binary_file(c_str!("logrm"), &logs.logrm);
+                    })
+                },
             }))
         })
     }
-- 
2.52.0

