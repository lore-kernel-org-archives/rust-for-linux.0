Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012001.outbound.protection.outlook.com [40.107.209.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62381393416
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 22:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769121105; cv=fail; b=SVGPBAxd3Mpx/pX86g5EhEWLq4xIaIl8/zAyOx/XqJkVr6K9ATDf67a5vP3GpsuPVSLQhA/e3dPpIp4Z6+V/VBEeU2SKzN/SgcJ2uCokirk7ukxT+PcRfrkC7eqrTyIYaT7DgUjiz+pU02BTKlmdlRImNpgQsyO8/ze5HyXZfZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769121105; c=relaxed/simple;
	bh=vI9KfxnGR1QwZWeQBaONUK/xLtYnyESADIYk7e6KzEs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OPe9u4lf6ylgP4T4lIH0VPDPXdHReZSoKBRich0TMjW3juinEzq0LAWgm+c/7TT0MS7nYbxI3WksJkyg4NDwwOgdDRw+FV1/X7UR5LMIxd9q+eEec2HE3lt+j1MzX6uNAX98jppp8qOk0LFXYOw/zmW7ewPKOFNbxvL2RLCfE9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eNcN1bWT; arc=fail smtp.client-ip=40.107.209.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eNcN1bWT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUtCVKiAg6pRZSvxVlYT+d6wL3Eb4ekhrCBuB2s2cDj9sHRyfwjTn3cRe2F6dy0MT++yjsNWmWq0NATUv//2DS2JGDona+Av3XrqMUKs0oTMgwI/XG4cHFyUMpuOWHa91b9Wy39RaY+/tSQbD5nJxl/4kBDkBgK9lbXBrLLpIsVWQHrCF7AxQYmy1Sm5NR0jubfLjFVuS8d9vAAwQLc5NjPyfwoBlFUN3p3JjVuptvLXyADV8HeMewScIW3CdDczs8zU2fv46WSM/7p1pm+a77crE+8uOfBEG5x6Nxe55V/D4ZlefUYU7Y/9vb2mOULD88vEi9T5iDChJTHsCzhKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OodM8uE1Zmmu0I+o0kinAlUFEdZVdKq4N7ctf19hfxo=;
 b=nvu1X+6rT8QS9Tn9bFfb1Y7zCHfZurvEZ1wt9VSzWhdiyOJfqRn/nwP5itBvpm2fPZkVccR5neu2qaL0Gh5Q2gCbY76wqSYxZCVGv2pc1mQQlc0Vf/mC7u9P3hJD5r8I3xPBlU59tjLpzf8uT0lrjkgfC8hfpT26qhNwZHXJnROZ9AwP+4CQdLlz5j7gAz2KXksq+dCm9cPt/9drZpgwlAT3VItWN7RECevOpXy11kBMo9SMdUByFcn5lVKxdfLkZ31V4k0juZFK763pgRhDyDPCoPdVyb+Peam35Fd0t0PPTSheKMSwLysyzIRn9pvrwfrnv+4hcXigyxZHk0Yh2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OodM8uE1Zmmu0I+o0kinAlUFEdZVdKq4N7ctf19hfxo=;
 b=eNcN1bWTWC/dmeQAtAREvXIUAUG5EgETVfQDdXJjTQQ1PMNVDvJqEqB5ngyLYcyNgY9v/omXgFN0A2tZg/5qMF6qw7SVogbovu1ge1vHq5lRGs1qk5OtvSLYC5r1kczHsDKJ8DwACgzvg3m9YDzOmlxmg3EjMsjYc9swHm5eJX1IHuUtj54+xj/nDslojMgxIeuA+ry+WzumculVAzsxoYu1Jl8MyiNoLbSJNKcr9q5riSU/iubT/SwAn/udcnSZvYQiX48Gj+sx2FhqBeUzJ2e0eXIrRDLNfNATgj+rHjOXnw3/Ibh8w2ArqMbUsva7OlsThFoj9gPPpA7ZMKvWqg==
Received: from DM6PR08CA0013.namprd08.prod.outlook.com (2603:10b6:5:80::26) by
 MN0PR12MB5787.namprd12.prod.outlook.com (2603:10b6:208:376::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.10; Thu, 22 Jan 2026 22:31:32 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:80:cafe::85) by DM6PR08CA0013.outlook.office365.com
 (2603:10b6:5:80::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 22:31:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 22:31:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:11 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:08 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v8 11/13] gpu: nova-core: align LibosMemoryRegionInitArgument size to page size
Date: Thu, 22 Jan 2026 16:28:46 -0600
Message-ID: <20260122222848.2555890-12-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122222848.2555890-1-ttabi@nvidia.com>
References: <20260122222848.2555890-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|MN0PR12MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b211007-4f05-4fe7-35a8-08de5a05fdaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H0I8ty+qbobPrq/gvvPolt6/06T5YGqnZS0/6dDdmy5jl1ge5UWxITKdfZNE?=
 =?us-ascii?Q?JhpF0/TD0qboGW4UwGCcvJhqkksHeTqFugeFM/YZM5q9kC1ExBenO8MdKFW7?=
 =?us-ascii?Q?haOdzO+3qOgPhqo3PUl0rANE9+ncSYHKcvcMozz9rfe+zyxVah+3e7inzBBE?=
 =?us-ascii?Q?IlRdtzjEWsvG2o7L8tWsxHyX7yFCAuaFpTR1ruXwxFNOtIVXO+CTl+4NV4x/?=
 =?us-ascii?Q?eSjxgE3DGZ9ndFLCxk9nPxqqANSl7OJXnSFNXdJ32rOWM0uEYvA1EK/UFt0E?=
 =?us-ascii?Q?1DMboAfuCgN6hDLSZksbV1eODmrKd4pcqFBWIoqgJLu/xRP2tzLKxqCn8rT8?=
 =?us-ascii?Q?LClFJvJ7SuimQfv8UwyhezWjrMI4j1v541yt7XdpDjmJ3UfRSlZbdBGDyikQ?=
 =?us-ascii?Q?M6gK8dtJDYozgpYg3LEMHUB0au11dC+1jS+hzkHnRY86kzroaoz45huxz3zO?=
 =?us-ascii?Q?O3r9nEN7ToL4GJ7/ctD4YIFGBpkv6VpQINGSr0JAHyMgoOqG7b2FF+FXJRKM?=
 =?us-ascii?Q?h4UyWqJp26lsf2Eqsg9koONNTbvkgorSvagueW1h2vrWvig14vG6WUqEeSed?=
 =?us-ascii?Q?2zY/K3k1meR9lYblqWjvA5NP8dQnKr1napYpwfdZMbZeHwdSNjnchjVq/UL4?=
 =?us-ascii?Q?zygON17zFZvmysyxLESIs9rnoadejZs1zmWxrCE+EbKH1GK40aN8VH3InRMb?=
 =?us-ascii?Q?Q1eLPTM2GQftzRUTasL9IAK5V3+LRKLlDd2b9nZu3wFuo81Vm+ywve2fFBkd?=
 =?us-ascii?Q?4RVr+I6JvRYXXGXd/Bj3Q9kaEm3EjWK2vC4fcOxK+01ajvJ4yEpPGPsT1W3U?=
 =?us-ascii?Q?9m4M6FOscdtWfjpL7zO/o9g094Wi7DBMlHdw+OfJJz2MN7/fJukO9A3uO0x3?=
 =?us-ascii?Q?3fFwkOWrb0K2cSWiiTL1nh41AyuvHFXXYI1Dt5/vKznF3Sy34NAH0fErcu5T?=
 =?us-ascii?Q?8eOuLYBvXv9vxe6Wjzq1/nosf4UCoGZNltkOlewX03Wg2XN7PMA7c0TEK6WS?=
 =?us-ascii?Q?P2poMLaTmuD6ZIeVZhOSmie/f6CCZGU1nzPwdM46z9X6+lnf7/bX0nRQ0CkC?=
 =?us-ascii?Q?Mt3kHqf+340eV55oabOPuG5K2xu0HejU+U+4bIvxTTdhQ47uACFeOAapTE2K?=
 =?us-ascii?Q?S8cxMiI5gkTSw9Pj0r6cyJh3fUHhJ1bL0Mn/zcL0XrQBAQWZXO7ugvbFH8L2?=
 =?us-ascii?Q?/f74bRz3lsWfbrR0rcDU0nfxL204f0tlBQgQd3k5oz2LyVP82cYl62atjDUx?=
 =?us-ascii?Q?5pV86fnsBRny2zhz9DGdQmafd2iMcoAguazGDq3c6u1DT5uPLI0V/jiUb7a2?=
 =?us-ascii?Q?Wy0TSO8UOk+Q7mUetpAOep09m4IX0GidxaxbpEBJTeSHMOQDfYLz2qdVl1Jk?=
 =?us-ascii?Q?nUeHrc1Fn4zmYnYGE6p+2W/4yTXya4GrfLuhlCDGvBaf2F1nuXyAM6YKvtro?=
 =?us-ascii?Q?H4HdRUhwO1bkNQ4mh0hk42WXrE/VfoGRuB23eYbi72E68nOf/VPFFQK7PHag?=
 =?us-ascii?Q?Skque2D543zKXLyRy3xadMUou5p1ztooHIU0Edk+tEzd4gDckgg9BPyARWne?=
 =?us-ascii?Q?QbWXmNXpbd8F40uef5Cx9xnj4ftLvzUsUMhgIJlbrSF8FVHjOK69V0aymz4p?=
 =?us-ascii?Q?ufV0hweKSp0OVXvgvzwUxZWPrnRDbNOBfn7csVVPeCYiBqFOeaXlywwhIAB4?=
 =?us-ascii?Q?GMiSFQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 22:31:30.9182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b211007-4f05-4fe7-35a8-08de5a05fdaf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5787

From: Alexandre Courbot <acourbot@nvidia.com>

On Turing and GA100 (i.e. the versions that use Libos v2), GSP-RM insists
that the 'size' parameter of the LibosMemoryRegionInitArgument struct be
aligned to 4KB.  The logging buffers are already aligned to that size, so
only the GSP_ARGUMENTS_CACHED struct needs to be adjusted.  Make that
adjustment by adding padding to the end of the struct.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs    |  8 ++++----
 drivers/gpu/nova-core/gsp/fw.rs | 14 +++++++++++++-
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 766fd9905358..bcf6ce18a4a1 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -27,7 +27,7 @@
 use crate::{
     gsp::cmdq::Cmdq,
     gsp::fw::{
-        GspArgumentsCached,
+        GspArgumentsAligned,
         LibosMemoryRegionInitArgument, //
     },
     num,
@@ -114,7 +114,7 @@ pub(crate) struct Gsp {
     /// Command queue.
     pub(crate) cmdq: Cmdq,
     /// RM arguments.
-    rmargs: CoherentAllocation<GspArgumentsCached>,
+    rmargs: CoherentAllocation<GspArgumentsAligned>,
 }
 
 impl Gsp {
@@ -133,7 +133,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                 logintr: LogBuffer::new(dev)?,
                 logrm: LogBuffer::new(dev)?,
                 cmdq: Cmdq::new(dev)?,
-                rmargs: CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
+                rmargs: CoherentAllocation::<GspArgumentsAligned>::alloc_coherent(
                     dev,
                     1,
                     GFP_KERNEL | __GFP_ZERO,
@@ -149,7 +149,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                         libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)
                     )?;
                     dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
-                    dma_write!(rmargs[0] = fw::GspArgumentsCached::new(cmdq))?;
+                    dma_write!(rmargs[0].inner = fw::GspArgumentsCached::new(cmdq))?;
                     dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
                 },
             }))
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index caeb0d251fe5..89be26b597d1 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -904,9 +904,21 @@ pub(crate) fn new(cmdq: &Cmdq) -> Self {
 // SAFETY: Padding is explicit and will not contain uninitialized data.
 unsafe impl AsBytes for GspArgumentsCached {}
 
+/// On Turing and GA100, the entries in the `LibosMemoryRegionInitArgument`
+/// must all be a multiple of GSP_PAGE_SIZE in size, so add padding to force it
+/// to that size.
+#[repr(C)]
+pub(crate) struct GspArgumentsAligned {
+    pub(crate) inner: GspArgumentsCached,
+    _padding: [u8; GSP_PAGE_SIZE - core::mem::size_of::<bindings::GSP_ARGUMENTS_CACHED>()],
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspArgumentsAligned {}
+
 // SAFETY: This struct only contains integer types for which all bit patterns
 // are valid.
-unsafe impl FromBytes for GspArgumentsCached {}
+unsafe impl FromBytes for GspArgumentsAligned {}
 
 /// Init arguments for the message queue.
 #[repr(transparent)]
-- 
2.52.0

