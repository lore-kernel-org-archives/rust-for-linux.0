Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013052.outbound.protection.outlook.com [40.107.201.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDF33382CB;
	Wed, 18 Feb 2026 16:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771433799; cv=fail; b=Ji0rxR5Ww550/3C62ptlBvqw5ILDdKFqmV7N6beHxF9UUP5YlubbbVXwpNfvoO57uizl9fFiPFlZQ3jPe5oSVugmGqOLW7uQrqtavYwUgktfzkL4pDySTeVczVQyTpkoEza6Y/z4OEZBoYAQL4Cy3PmEe0x1vEDqNaJ7xPAU60k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771433799; c=relaxed/simple;
	bh=koIRxB3kWUaSX0Cpzvh9/a3Bo2In1DvsnfNikM5HVH0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vl6P7IGuW8FydTx2SpWkabxAHefAgTXOl0booCcUbWzC6qXXX726dpTREefCXQao1Ib974clC5sSBRsnNjj1rNhatBtma6F7W9AwtvkFgipxOSDAEsSiNo51Ga46uCP9SxKFjPKDnUkfTVI9B3DPek3ptAUxWjlkq639XbAz/Tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LbxIUjBZ; arc=fail smtp.client-ip=40.107.201.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LbxIUjBZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJbS/7CUAmz0idUypTi7P6GuYo0pdKyDzBLytQ4hS+O4N6BLyFDIVphzm5bAuxV9do+xfDiTwXro/ClHYvQke/czK/l68xOfo5lYSwPD2PFobSuNiYm3pUMnNWKg6lWHIy0HMVG8gOBrh7F5GFNMRRtr1uBSKEsxrYTbvfTHj3CKUL7kzui/5CiVVPn2tp4U6XAJYxNFD0pXBfp4acNwNVjxH1H3SnjLk0NC+nw2hglYYxqa8Gg7ozRATT973/YaNddT0hSbUrixqYznJHLgCkRLSgOU2SgiP0kx8AB+PfJzpHKgJQLfkZeQ8mJRS4K9RLynB+KbbSQmyAdmWQDevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Xvn67H9Z28g1+JFqIhxcxNE6x0RSPMPg9ZQwggewT4=;
 b=vMsH2tMgM4kI8RmJmRW1lZBPj/RJxaBk0swzoHMrF87H45Ai7pxi18RM8fMFcHOdKuyj53iJ5PjWaw/y+1HD9oSv2qaAcf/1739vM8fTyrWqzJHo7U3N4fLIugp09CCZesR5Hxx3FWARZfKI7R7zQFvkmGlomjKJnrOQEU/OVlpbG6ansNEwsCa3Ms4Dmv+Bt4zIZYTXMRSrDlOBo7kw8ayi1J18NmZd3YCbTMJ95vLK+xcRHb7OCJlO+TsHpwQMnTcOEu995w3ETg8n1oXlmS0Ec05DYi+kengMgDtBuc0AwcdFXr7tvXkeDCdlIUGP25n5u2bqmQiFDQvb/eFd5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Xvn67H9Z28g1+JFqIhxcxNE6x0RSPMPg9ZQwggewT4=;
 b=LbxIUjBZttvi/llYZCriiuqbbeA+xJpwezlZ1BPzBAclUfCqlyOJ/7OUMxkhshwjTwOqlkX6d4KPx44MvJs8caURDvBlgt3w6noW+Q66eE7W+rpYgRSEuDCPhSktx81FZVlAWwLJvNxvjG/Y6ZiM0bLV+jMoXUa8q4YuRPb9VtZOBBz+JYfC6CtdRD5nJktts/nmO8P+F16q8hmXW3uTV0Id6sxBcSVOhABciSwlvZ0Th8QERDKSqWYPPRGMXt3Iizrl4h4ie8DEYtHcKicXYCiQxn+VDLPZFL3YSfa96KlkVz28JaN7suzYb73YKa9YSsxdX8vXEuYDvDs4JdvtOA==
Received: from BYAPR02CA0052.namprd02.prod.outlook.com (2603:10b6:a03:54::29)
 by CH3PR12MB7499.namprd12.prod.outlook.com (2603:10b6:610:142::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Wed, 18 Feb
 2026 16:56:21 +0000
Received: from MW1PEPF0001615A.namprd21.prod.outlook.com
 (2603:10b6:a03:54:cafe::82) by BYAPR02CA0052.outlook.office365.com
 (2603:10b6:a03:54::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 16:56:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MW1PEPF0001615A.mail.protection.outlook.com (10.167.249.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Wed, 18 Feb 2026 16:56:21 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 08:55:50 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 18 Feb 2026 08:55:49 -0800
Received: from ipp2-2316.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 08:55:49 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <acourbot@nvidia.com>, <joelagnelf@nvidia.com>, <ttabi@nvidia.com>,
	<apopple@nvidia.com>, <ecourtney@nvidia.com>, <zhiw@nvidia.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <bhelgaas@google.com>,
	<ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
	<gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
	<a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
	<nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
	<aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
	<zhiwang@kernel.org>
Subject: [PATCH] gpu: nova-core: consolidate GSP boot parameters into GspBootContext
Date: Wed, 18 Feb 2026 16:55:48 +0000
Message-ID: <20260218165548.485462-1-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615A:EE_|CH3PR12MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: bc036e7a-d38c-4b1d-5cd9-08de6f0ea478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pafbqf4ipg84tdh+4yqliRXPCdnX9Jw4usLFxetK88WYIecY8IgnB1r8LQsN?=
 =?us-ascii?Q?sbO0TcJPeHuhBBQwoncrqX6RSS0tcdqq6TLHLATgNM2tP7Nx6Td7laI7bYNG?=
 =?us-ascii?Q?FwGdwtWfJbAMtI4MBAqgaPV9JfvEgO5xLOqRrPKTV34BwM7LsN/7hVnzJSxN?=
 =?us-ascii?Q?RkPA8kZMMpI/VdNUygfg+wTzsmZCWfyX8JA97+6v8eqev4MKqfx7OPfOClrw?=
 =?us-ascii?Q?K61G1YLMJGvmPVKxZbXyhb0pNJMS7is83ONRZbFlRQVfzeaNp9zi5hj7lQTy?=
 =?us-ascii?Q?C6sz2vpjcz3XBTrGHAVmEO4Cn+KO2EqE+oGpYcgRl7ZXB66giS1Q5Kgd5ZQ/?=
 =?us-ascii?Q?8h9evqbsUHje06BCD5ibtmqyNzQg2qJhzlsDd6v7heuNuWlZxqYz8V603HYn?=
 =?us-ascii?Q?7eIQVhlil+InMpwAol7i+JNLXtgH/vNNZrXJBB43ALQfHTiu3RKLXlTOCjLi?=
 =?us-ascii?Q?PyzWIerXv2c9QjfYhyrIkxud0yiXjB2vjskTKYYE2W56YcypBt5nOg3yF2YK?=
 =?us-ascii?Q?4qxsL6HrT3tFdgmaFvszIL7v0ZOCTezwyddrO0YAZJh5w6980casPycVNOAP?=
 =?us-ascii?Q?Q9ML0XeDiSVashpiSrt6V3EH8hhRQGCUQltXAIC3VPIsGjZG8kiwAp84sNZp?=
 =?us-ascii?Q?Smrl4+4My7j6SeB51SSJy0wwX36doTqqul0XuKJHnAySejmjTLKT5MP4iPzU?=
 =?us-ascii?Q?AVI7p6Mz0zg7d2Ghhg0YLWLF2PHd2PD/BGWgh333xMMLD3gQXPdmUQ0gsFe0?=
 =?us-ascii?Q?hnUlkJpp9Fzwao+oc1A0JJqL79PPJl8bZnUSVV+53MxpiR/S3eSuGUJpzDFX?=
 =?us-ascii?Q?YLSfd+gWwbKsRxilXqwbYFABsQ7K06knO6JIYVc/v9X78yViIwRTJ+7f5rpw?=
 =?us-ascii?Q?Ki28V/ah04wH4uCN7iS/lxcjwrrix4bWIyNR9AmSe3G+Tao/imiMQez0X06x?=
 =?us-ascii?Q?YQzOzGh38EyI4ar4SrYiTB3PW+hxzoKUc6ME2V0Ac8eh1voF65Y3q5yMgB+5?=
 =?us-ascii?Q?PwQ1R6y8M93yN02Y4e9rsZdStWd/fiRTy9GTrHyPGCoXTN8wq2tnKb30hK2v?=
 =?us-ascii?Q?2/YeLEhpmwcp0xAwJljwpCijKgKmD6TiLNTfTq6i1RH3xbP3noc1GGOjEf9E?=
 =?us-ascii?Q?l9xkUJdrwU8G42M8YLPREB+3Frf95txEo0ZcTmSeXQaQXPbN3H1e9Js19vCy?=
 =?us-ascii?Q?aa9kOWAEV+w7hAj8cx24qhrgNo/ju+vTLxR8mcIwOHAmzVlwg3xVOVher7Mh?=
 =?us-ascii?Q?5++xK/FnLq6pmHl7vS82Q8YnxnFz9nCEsc+dEymf/rJEUYGEboUBFz0dC5q7?=
 =?us-ascii?Q?ZwGNyIhL/qcDnUGMkMtmbUj4F0NY8NzEmLw8tn/VVI/QH0Pb3dUjNUo82m+g?=
 =?us-ascii?Q?obhS1JxwNOpd1h8opetWOsc5h30RU4+xRuttHwh7eq6TXq9WemNt3Z7M4m+y?=
 =?us-ascii?Q?b4MwkAcWmvqvuBJNJ80M+lr4UyF8/tJREkitXzbF86ntbCSZD7/69NcJkgnX?=
 =?us-ascii?Q?zkpJCxOLbtBPsoXCZ7GSabuUStNLb9UXNfgkpQuqPoBHbJpP/rs6kZnlFwff?=
 =?us-ascii?Q?fcg55pnmvSVyT+Dga2+EJGLjxB/M4ZbJXa/sxK8TZXsWSfe9bbz4UoFhqYQn?=
 =?us-ascii?Q?xmtetJmWndCKoSGMH2jJvRFdV6uLy1QM6/y4ESODOY7r?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b4GWbG8Vl1fmfnqHibrWCVWw0JYlC85Pw0KJavdRWkYVPMmNY4jTM4NLXpG1mE6el8N34BP/cG7RyBIx6q0jLGV7ftgabogj/nnRY/4EJGMYyTavx7Pm00sCKnDtKv3h0JCCGaA5EDsu33zK5TwLLgGOSQBbrdsVnRy3+SMmX4IF3mPK9NeBMBjSyD3lv7enEiZnz1KPc5ILV1meGN/7mT61wwKK6F2/fBdBtUQHFWQGMlAEjOy7kfnJZv91KnpuyERWLS65iiXv8x+j78Ho+TgRAmjR+XMyXO8U/Eh1y3w/D4gPy/6nlD09mXnSMb/Br9wurQdsWAgNzOY0ya94jAAJgTxmtsDTA6rzqK81e7FxjDlwEMANUlLtie1sIkhRWebEPPDPYl2C4s14oH+dqapa4oPOZsY6DOIegFg9lg+MI6MbrpTp4JtRi3nP0i0r
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 16:56:21.1803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc036e7a-d38c-4b1d-5cd9-08de6f0ea478
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7499

The GSP boot path threads pdev, bar, chipset, gsp_falcon and sec2_falcon
individually through boot() -> run_fwsec_frts() -> sequencer.

Bundle them into a GspBootContext struct to cut down on parameter
passing and the associated import boilerplate. It is for easily
introducing other boot params like vGPU enable, WRP size in future.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs           | 16 ++++-
 drivers/gpu/nova-core/gsp.rs           | 22 ++++++
 drivers/gpu/nova-core/gsp/boot.rs      | 97 ++++++++++----------------
 drivers/gpu/nova-core/gsp/sequencer.rs | 71 ++++++++-----------
 4 files changed, 99 insertions(+), 107 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9b042ef1a308..61a90ebad7f8 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -18,7 +18,10 @@
     },
     fb::SysmemFlush,
     gfw,
-    gsp::Gsp,
+    gsp::{
+        Gsp,
+        GspBootContext, //
+    },
     regs,
 };
 
@@ -283,7 +286,16 @@ pub(crate) fn new<'a>(
 
             gsp <- Gsp::new(pdev),
 
-            _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
+            _: {
+                let ctx = GspBootContext {
+                    pdev,
+                    bar,
+                    chipset: spec.chipset,
+                    gsp_falcon,
+                    sec2_falcon,
+                };
+                gsp.boot(&ctx)?
+            },
 
             bar: devres_bar,
         })
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 174feaca0a6b..afb8304286d3 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -25,6 +25,13 @@
 };
 
 use crate::{
+    driver::Bar0,
+    falcon::{
+        gsp::Gsp as GspFalcon,
+        sec2::Sec2 as Sec2Falcon,
+        Falcon, //
+    },
+    gpu::Chipset,
     gsp::cmdq::Cmdq,
     gsp::fw::{
         GspArgumentsPadded,
@@ -39,6 +46,21 @@
 /// Number of GSP pages to use in a RM log buffer.
 const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
 
+/// Common context for the GSP boot process.
+pub(crate) struct GspBootContext<'a> {
+    pub(crate) pdev: &'a pci::Device<device::Bound>,
+    pub(crate) bar: &'a Bar0,
+    pub(crate) chipset: Chipset,
+    pub(crate) gsp_falcon: &'a Falcon<GspFalcon>,
+    pub(crate) sec2_falcon: &'a Falcon<Sec2Falcon>,
+}
+
+impl GspBootContext<'_> {
+    pub(crate) fn dev(&self) -> &device::Device<device::Bound> {
+        self.pdev.as_ref()
+    }
+}
+
 /// Array of page table entries, as understood by the GSP bootloader.
 #[repr(C)]
 struct PteArray<const NUM_ENTRIES: usize>([u64; NUM_ENTRIES]);
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index be427fe26a58..a294d89fab0e 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -1,22 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use kernel::{
-    device,
     dma::CoherentAllocation,
     dma_write,
     io::poll::read_poll_timeout,
-    pci,
     prelude::*,
     time::Delta, //
 };
 
 use crate::{
-    driver::Bar0,
-    falcon::{
-        gsp::Gsp,
-        sec2::Sec2,
-        Falcon, //
-    },
     fb::FbLayout,
     firmware::{
         booter::{
@@ -30,7 +22,6 @@
         gsp::GspFirmware,
         FIRMWARE_VERSION, //
     },
-    gpu::Chipset,
     gsp::{
         commands,
         sequencer::{
@@ -47,12 +38,13 @@ impl super::Gsp {
     /// Helper function to load and run the FWSEC-FRTS firmware and confirm that it has properly
     /// created the WPR2 region.
     fn run_fwsec_frts(
-        dev: &device::Device<device::Bound>,
-        falcon: &Falcon<Gsp>,
-        bar: &Bar0,
+        ctx: &super::GspBootContext<'_>,
         bios: &Vbios,
         fb_layout: &FbLayout,
     ) -> Result<()> {
+        let dev = ctx.dev();
+        let bar = ctx.bar;
+
         // Check that the WPR2 region does not already exists - if it does, we cannot run
         // FWSEC-FRTS until the GPU is reset.
         if regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).higher_bound() != 0 {
@@ -65,7 +57,7 @@ fn run_fwsec_frts(
 
         let fwsec_frts = FwsecFirmware::new(
             dev,
-            falcon,
+            ctx.gsp_falcon,
             bar,
             bios,
             FwsecCommand::Frts {
@@ -75,7 +67,7 @@ fn run_fwsec_frts(
         )?;
 
         // Run FWSEC-FRTS to create the WPR2 region.
-        fwsec_frts.run(dev, falcon, bar)?;
+        fwsec_frts.run(dev, ctx.gsp_falcon, bar)?;
 
         // SCRATCH_E contains the error code for FWSEC-FRTS.
         let frts_status = regs::NV_PBUS_SW_SCRATCH_0E_FRTS_ERR::read(bar).frts_err_code();
@@ -127,31 +119,28 @@ fn run_fwsec_frts(
     /// structures that the GSP will use at runtime.
     ///
     /// Upon return, the GSP is up and running, and its runtime object given as return value.
-    pub(crate) fn boot(
-        mut self: Pin<&mut Self>,
-        pdev: &pci::Device<device::Bound>,
-        bar: &Bar0,
-        chipset: Chipset,
-        gsp_falcon: &Falcon<Gsp>,
-        sec2_falcon: &Falcon<Sec2>,
-    ) -> Result {
-        let dev = pdev.as_ref();
+    pub(crate) fn boot(mut self: Pin<&mut Self>, ctx: &super::GspBootContext<'_>) -> Result {
+        let dev = ctx.dev();
+        let bar = ctx.bar;
 
         let bios = Vbios::new(dev, bar)?;
 
-        let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
+        let gsp_fw = KBox::pin_init(
+            GspFirmware::new(dev, ctx.chipset, FIRMWARE_VERSION),
+            GFP_KERNEL,
+        )?;
 
-        let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
+        let fb_layout = FbLayout::new(ctx.chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+        Self::run_fwsec_frts(ctx, &bios, &fb_layout)?;
 
         let booter_loader = BooterFirmware::new(
             dev,
             BooterKind::Loader,
-            chipset,
+            ctx.chipset,
             FIRMWARE_VERSION,
-            sec2_falcon,
+            ctx.sec2_falcon,
             bar,
         )?;
 
@@ -160,76 +149,60 @@ pub(crate) fn boot(
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
         self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
+            .send_command(bar, commands::SetSystemInfo::new(ctx.pdev))?;
         self.cmdq.send_command(bar, commands::SetRegistry::new())?;
 
-        gsp_falcon.reset(bar)?;
+        ctx.gsp_falcon.reset(bar)?;
         let libos_handle = self.libos.dma_handle();
-        let (mbox0, mbox1) = gsp_falcon.boot(
+        let (mbox0, mbox1) = ctx.gsp_falcon.boot(
             bar,
             Some(libos_handle as u32),
             Some((libos_handle >> 32) as u32),
         )?;
-        dev_dbg!(
-            pdev.as_ref(),
-            "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
-            mbox0,
-            mbox1
-        );
+        dev_dbg!(dev, "GSP MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
 
         dev_dbg!(
-            pdev.as_ref(),
+            dev,
             "Using SEC2 to load and run the booter_load firmware...\n"
         );
 
-        sec2_falcon.reset(bar)?;
-        sec2_falcon.load(bar, &booter_loader)?;
+        ctx.sec2_falcon.reset(bar)?;
+        ctx.sec2_falcon.load(bar, &booter_loader)?;
         let wpr_handle = wpr_meta.dma_handle();
-        let (mbox0, mbox1) = sec2_falcon.boot(
+        let (mbox0, mbox1) = ctx.sec2_falcon.boot(
             bar,
             Some(wpr_handle as u32),
             Some((wpr_handle >> 32) as u32),
         )?;
-        dev_dbg!(
-            pdev.as_ref(),
-            "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
-            mbox0,
-            mbox1
-        );
+        dev_dbg!(dev, "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n", mbox0, mbox1);
 
         if mbox0 != 0 {
-            dev_err!(
-                pdev.as_ref(),
-                "Booter-load failed with error {:#x}\n",
-                mbox0
-            );
+            dev_err!(dev, "Booter-load failed with error {:#x}\n", mbox0);
             return Err(ENODEV);
         }
 
-        gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
+        ctx.gsp_falcon
+            .write_os_version(bar, gsp_fw.bootloader.app_version);
 
         // Poll for RISC-V to become active before running sequencer
         read_poll_timeout(
-            || Ok(gsp_falcon.is_riscv_active(bar)),
+            || Ok(ctx.gsp_falcon.is_riscv_active(bar)),
             |val: &bool| *val,
             Delta::from_millis(10),
             Delta::from_secs(5),
         )?;
 
         dev_dbg!(
-            pdev.as_ref(),
+            dev,
             "RISC-V active? {}\n",
-            gsp_falcon.is_riscv_active(bar),
+            ctx.gsp_falcon.is_riscv_active(bar),
         );
 
         // Create and run the GSP sequencer.
         let seq_params = GspSequencerParams {
+            ctx,
             bootloader_app_version: gsp_fw.bootloader.app_version,
             libos_dma_handle: libos_handle,
-            gsp_falcon,
-            sec2_falcon,
-            dev: pdev.as_ref().into(),
-            bar,
         };
         GspSequencer::run(&mut self.cmdq, seq_params)?;
 
@@ -239,8 +212,8 @@ pub(crate) fn boot(
         // Obtain and display basic GPU information.
         let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
         match info.gpu_name() {
-            Ok(name) => dev_info!(pdev.as_ref(), "GPU name: {}\n", name),
-            Err(e) => dev_warn!(pdev.as_ref(), "GPU name unavailable: {:?}\n", e),
+            Ok(name) => dev_info!(dev, "GPU name: {}\n", name),
+            Err(e) => dev_warn!(dev, "GPU name unavailable: {:?}\n", e),
         }
 
         Ok(())
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index d6c489c39092..b274ac7b2e05 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -23,12 +23,6 @@
 };
 
 use crate::{
-    driver::Bar0,
-    falcon::{
-        gsp::Gsp,
-        sec2::Sec2,
-        Falcon, //
-    },
     gsp::{
         cmdq::{
             Cmdq,
@@ -133,12 +127,8 @@ pub(crate) fn new(data: &[u8], dev: &device::Device) -> Result<(Self, usize)> {
 pub(crate) struct GspSequencer<'a> {
     /// Sequencer information with command data.
     seq_info: GspSequence,
-    /// `Bar0` for register access.
-    bar: &'a Bar0,
-    /// SEC2 falcon for core operations.
-    sec2_falcon: &'a Falcon<Sec2>,
-    /// GSP falcon for core operations.
-    gsp_falcon: &'a Falcon<Gsp>,
+    /// GSP boot context.
+    ctx: &'a super::GspBootContext<'a>,
     /// LibOS DMA handle address.
     libos_dma_handle: u64,
     /// Bootloader application version.
@@ -156,7 +146,7 @@ impl GspSeqCmdRunner for fw::RegWritePayload {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = usize::from_safe_cast(self.addr());
 
-        sequencer.bar.try_write32(self.val(), addr)
+        sequencer.ctx.bar.try_write32(self.val(), addr)
     }
 }
 
@@ -164,8 +154,9 @@ impl GspSeqCmdRunner for fw::RegModifyPayload {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = usize::from_safe_cast(self.addr());
 
-        sequencer.bar.try_read32(addr).and_then(|val| {
+        sequencer.ctx.bar.try_read32(addr).and_then(|val| {
             sequencer
+                .ctx
                 .bar
                 .try_write32((val & !self.mask()) | self.val(), addr)
         })
@@ -184,11 +175,11 @@ fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         };
 
         // First read.
-        sequencer.bar.try_read32(addr)?;
+        sequencer.ctx.bar.try_read32(addr)?;
 
         // Poll the requested register with requested timeout.
         read_poll_timeout(
-            || sequencer.bar.try_read32(addr),
+            || sequencer.ctx.bar.try_read32(addr),
             |current| (current & self.mask()) == self.val(),
             Delta::ZERO,
             Delta::from_micros(timeout_us),
@@ -208,7 +199,7 @@ impl GspSeqCmdRunner for fw::RegStorePayload {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = usize::from_safe_cast(self.addr());
 
-        sequencer.bar.try_read32(addr).map(|_| ())
+        sequencer.ctx.bar.try_read32(addr).map(|_| ())
     }
 }
 
@@ -221,16 +212,16 @@ fn run(&self, seq: &GspSequencer<'_>) -> Result {
             GspSeqCmd::DelayUs(cmd) => cmd.run(seq),
             GspSeqCmd::RegStore(cmd) => cmd.run(seq),
             GspSeqCmd::CoreReset => {
-                seq.gsp_falcon.reset(seq.bar)?;
-                seq.gsp_falcon.dma_reset(seq.bar);
+                seq.ctx.gsp_falcon.reset(seq.ctx.bar)?;
+                seq.ctx.gsp_falcon.dma_reset(seq.ctx.bar);
                 Ok(())
             }
             GspSeqCmd::CoreStart => {
-                seq.gsp_falcon.start(seq.bar)?;
+                seq.ctx.gsp_falcon.start(seq.ctx.bar)?;
                 Ok(())
             }
             GspSeqCmd::CoreWaitForHalt => {
-                seq.gsp_falcon.wait_till_halted(seq.bar)?;
+                seq.ctx.gsp_falcon.wait_till_halted(seq.ctx.bar)?;
                 Ok(())
             }
             GspSeqCmd::CoreResume => {
@@ -239,35 +230,37 @@ fn run(&self, seq: &GspSequencer<'_>) -> Result {
                 // sequencer will start both.
 
                 // Reset the GSP to prepare it for resuming.
-                seq.gsp_falcon.reset(seq.bar)?;
+                seq.ctx.gsp_falcon.reset(seq.ctx.bar)?;
 
                 // Write the libOS DMA handle to GSP mailboxes.
-                seq.gsp_falcon.write_mailboxes(
-                    seq.bar,
+                seq.ctx.gsp_falcon.write_mailboxes(
+                    seq.ctx.bar,
                     Some(seq.libos_dma_handle as u32),
                     Some((seq.libos_dma_handle >> 32) as u32),
                 );
 
                 // Start the SEC2 falcon which will trigger GSP-RM to resume on the GSP.
-                seq.sec2_falcon.start(seq.bar)?;
+                seq.ctx.sec2_falcon.start(seq.ctx.bar)?;
 
                 // Poll until GSP-RM reload/resume has completed (up to 2 seconds).
-                seq.gsp_falcon
-                    .check_reload_completed(seq.bar, Delta::from_secs(2))?;
+                seq.ctx
+                    .gsp_falcon
+                    .check_reload_completed(seq.ctx.bar, Delta::from_secs(2))?;
 
                 // Verify SEC2 completed successfully by checking its mailbox for errors.
-                let mbox0 = seq.sec2_falcon.read_mailbox0(seq.bar);
+                let mbox0 = seq.ctx.sec2_falcon.read_mailbox0(seq.ctx.bar);
                 if mbox0 != 0 {
                     dev_err!(seq.dev, "Sequencer: sec2 errors: {:?}\n", mbox0);
                     return Err(EIO);
                 }
 
                 // Configure GSP with the bootloader version.
-                seq.gsp_falcon
-                    .write_os_version(seq.bar, seq.bootloader_app_version);
+                seq.ctx
+                    .gsp_falcon
+                    .write_os_version(seq.ctx.bar, seq.bootloader_app_version);
 
                 // Verify the GSP's RISC-V core is active indicating successful GSP boot.
-                if !seq.gsp_falcon.is_riscv_active(seq.bar) {
+                if !seq.ctx.gsp_falcon.is_riscv_active(seq.ctx.bar) {
                     dev_err!(seq.dev, "Sequencer: RISC-V core is not active\n");
                     return Err(EIO);
                 }
@@ -348,18 +341,12 @@ fn iter(&self) -> GspSeqIter<'_> {
 
 /// Parameters for running the GSP sequencer.
 pub(crate) struct GspSequencerParams<'a> {
+    /// Shared boot context.
+    pub(crate) ctx: &'a super::GspBootContext<'a>,
     /// Bootloader application version.
     pub(crate) bootloader_app_version: u32,
     /// LibOS DMA handle address.
     pub(crate) libos_dma_handle: u64,
-    /// GSP falcon for core operations.
-    pub(crate) gsp_falcon: &'a Falcon<Gsp>,
-    /// SEC2 falcon for core operations.
-    pub(crate) sec2_falcon: &'a Falcon<Sec2>,
-    /// Device for logging.
-    pub(crate) dev: ARef<device::Device>,
-    /// BAR0 for register access.
-    pub(crate) bar: &'a Bar0,
 }
 
 impl<'a> GspSequencer<'a> {
@@ -374,12 +361,10 @@ pub(crate) fn run(cmdq: &mut Cmdq, params: GspSequencerParams<'a>) -> Result {
 
         let sequencer = GspSequencer {
             seq_info,
-            bar: params.bar,
-            sec2_falcon: params.sec2_falcon,
-            gsp_falcon: params.gsp_falcon,
+            ctx: params.ctx,
             libos_dma_handle: params.libos_dma_handle,
             bootloader_app_version: params.bootloader_app_version,
-            dev: params.dev,
+            dev: params.ctx.pdev.as_ref().into(),
         };
 
         dev_dbg!(sequencer.dev, "Running CPU Sequencer commands\n");
-- 
2.51.0

