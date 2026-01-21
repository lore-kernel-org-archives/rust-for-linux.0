Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012047.outbound.protection.outlook.com [52.101.43.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D30344CF25
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 23:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769039630; cv=fail; b=VMmxOQ0R0Aj8EVdlcfI38KAT2IQ3b/EuQUvJKr4/V9niKlzu6US5S5vFB8E89IR/o57ONWAFjNiq3/c5iK7t7uBCitRqkaCVQDl1EHFuOVecEhxRmsF5qkqM3iIkbTtikjHBAHqBL/h+LpG1vZXdppFCiEHcOjMat69XB9fY89s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769039630; c=relaxed/simple;
	bh=81lZl4zWgmO8Xdp+jaWe2Mdw6ynmZl0855++svkZBBI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F1c9NcjGJplbdSX/lS6NAmSMFPpD7qNQT13hdobq7dcmeS2Q58haJdF6ipw7vrGwnCxJL4Pwr5rbi5RjOBtsq+ez24xOn2ng3kzjBhdU/1cnDphsYfKY+YaG/Pb2NhpI34K4zgbXKdiKz3wiN1luQj9wde9o2eB5riSunN4zwX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V1SyO1Ao; arc=fail smtp.client-ip=52.101.43.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V1SyO1Ao"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nC+BnLstp1vc5PZZsY4waTLYXYrWcfz7s9CXCoM1Cunvnm11OKnqb4F3R0WyCB7vMxQZB+2LqVeTcUFE3dUZtPXJNl8vcn1sl4h9QnBdJYsyNSfs5TA2kmn0V8IaQsH+8H0spbmI0YXKOGyENZGwXCDHqgzEVR5ivAm6vo8vS6AK08Bok/4YkxGPiI6qGYEYxcepJ4r68QK1o69PLdXrA2VDQaO+EI6LyZu8TlxWbJOTsA7AUDkEW4k7zZIGsWTTwzaAX/QsEJi5ChYYQEtC7yYIHuhUxO0yJbSyC6YKu2U3+1Y91m4GfLHvqHYkQ2TxENQiohCXPF2rwY7/irLu/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWfHU4FOdhvCb8lO9GtYrTFoLHY/DF6ssd38vO8foTo=;
 b=hmG+IPAoIywTxgbf76yk63c/eXjBm6D1aK2mZwOV4x6T4BHpkhGMoDcLcunworCMx/XlfY1NFNEsI6VPcj0lkuQYusuQerPxjARFKQa6vydNvkQH/BSy5s1zVlrlLrQqp1eIown6O0/Xf+L7DJrKZqfhgrEyWi7EFEqvxFhiWsarXLf0n5HW0iqp8wYExCmr71KmAXR3LMoYOh3IYLeKOx1zuJ7g2ZGsPeKL1Nzr2kaj5wuzuNtoFPo7yG+H5MAf2oruF6G9fdqhUQDH6Cf5tRSaHnSPcYA0O9G3qTeRDPPDbyS9o2YU/BpheZC3AFZsq5GjUjcc6n1cnA+etQyzZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWfHU4FOdhvCb8lO9GtYrTFoLHY/DF6ssd38vO8foTo=;
 b=V1SyO1Ao58PqIYJ/afwqQfUaC03wNFZtYuHpKWsbFWJc0B50AqW21Ck1cSJ/7g20BsGK5fcxPMdmJgwxt4wAXbMQMEC7Amd0s7OxB7YMD03VP9OoRDz8+sF0KeaDBnlgsvpJW2QULHvwOXr46iwrwsNltSBMGZrlUQNvHB2UiO5wrN1jx0dzooSVxkrmi/Mk5c3ZxRSPu5ll1I7izIVp9N+rBFOhook3+eerreda7SR8UUrC8JgkJZpHmiHhLJcq4KjjTEg+0XRoY/4eTf5yRbkRjnhh9m2P6+N8Lc0qFI/b58neVUYDWig7LkVMHe2Jr21CM/xz+mRO7KIMEWtssg==
Received: from CH0PR03CA0209.namprd03.prod.outlook.com (2603:10b6:610:e4::34)
 by MN2PR12MB4127.namprd12.prod.outlook.com (2603:10b6:208:1d1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 23:53:42 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::58) by CH0PR03CA0209.outlook.office365.com
 (2603:10b6:610:e4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 23:53:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 23:53:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:21 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:20 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v7 09/12] gpu: nova-core: add Falcon HAL method load_method()
Date: Wed, 21 Jan 2026 17:52:59 -0600
Message-ID: <20260121235302.1962185-10-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|MN2PR12MB4127:EE_
X-MS-Office365-Filtering-Correlation-Id: 8498b681-b406-4e5b-bfb9-08de59484e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q9vcDNksO7MHB/7qgMqteLCew1aJyz2ejKhHw0StnW2ZE1BE2DqXR4EHxTLu?=
 =?us-ascii?Q?uAJlJbnI7qUu4Wm3R9jlS1Yo5xAxRpTvkyVfdVMJ5tyXKxc5iJbh5qDOw01H?=
 =?us-ascii?Q?qrMxmJgQ2fOMMmdl3+6rc7bM/I7mreUohhMesbsp/dqk+LRTJhmjIBMzt91Z?=
 =?us-ascii?Q?qIsrkPDjhsrYcd5kER75XTIOBe/eDqR3Vb6iqkXOChfyg5l28yVejpBqyYqg?=
 =?us-ascii?Q?h2Daabs+DyvtQ/rSJxUmK29v7W7xImr9fn98GLSdCjN1DUsksEy+FMRmD9xw?=
 =?us-ascii?Q?R+c4riGLQ/09WTVInJbqae1hkRReHw2ad+wHGi6SDexgdiq6Qo/FygXRGId7?=
 =?us-ascii?Q?RhXMDMqWKJRgS5v6lyREE+secrjPx6hMKPpvnRGHAV7tI1fydPlXP6LYMCzk?=
 =?us-ascii?Q?TF6lnX6IohMb+ulI2M5+9yn53Fiw9OpvF38w2YIWyyt6v3ViNiApMFerMeJ1?=
 =?us-ascii?Q?cy+7aZjw/qC4k3FuDDHERW5HYkiLAGJ/wtv1PBa0PIVJgTGjJpi9BqWFyCjr?=
 =?us-ascii?Q?91Pqmnuja5FcDUwzVlJ2dcYaa9B9k7vR+/r6sOil9obXKdKVj1vj/V9IEqT+?=
 =?us-ascii?Q?3FJnyyekfmSOWlx/5RwA/FmIAITDhza1D7wMCb7TT+rj8Atv+OLA4iPzo5CU?=
 =?us-ascii?Q?6FcahQ2nzqx3x8z6bglifn47bUIFeKieYDyPz1D0b05wfs+fdGiZo6Lrp1mJ?=
 =?us-ascii?Q?wbXIj6/j19zT6AUFnV/PuhbvW8fMJ6wQ1XNekA56QTA0xFULYUY+QzKJaNvL?=
 =?us-ascii?Q?xM9BMbbyfHZvrsCVSwOI3+hIJIv0NExbURyTK5LuXp24bkbqvrsuRGk4cQGS?=
 =?us-ascii?Q?i0z8x0S3RF+okBRNd3vIDohSHqkLRC8KR90C0p67VuyRhwH9OPGbLVqJscD+?=
 =?us-ascii?Q?e6W0fL5XIJlYjBw0Wuul6xMm45qZnauSrIKZGrNObfl5hbvpDAIYuz91d8KX?=
 =?us-ascii?Q?cqsCTgSosxoB053NcbnHL8ky59l9s9eZRgST/rSjnsCzye2oQwNVI97GCXEx?=
 =?us-ascii?Q?LAmFT6062FLNWmI3WEu944AqvePIsdH8j5Ux0XpJ6pupgE16tTWc2UA5S1va?=
 =?us-ascii?Q?8X2pQ636Q/RNkLk6txR3cqCVHjpmAv69PRGw5NEP6pLq0/Q9cO8I4dW/etZM?=
 =?us-ascii?Q?AKPttiHTu40wAAEtMnWlfCqGnwIhWaSiEav7nrB6lMTjEkWlCy3koVm7I7ES?=
 =?us-ascii?Q?TB6b01k9RCPHD3H+guLdZpjXRfeGdG2piQLoeEYjItRIoflJI9/LJMD1CIDd?=
 =?us-ascii?Q?31DxvUHjaDfP8jgFMO8pjNbWU+bZpKaLaRlFKpx2svYE+dFGgDepfWtJ3htf?=
 =?us-ascii?Q?13k2jHTzeIad1Pu9ZgVukqNL5JBz/VYKpoAb+zGUm9lfgZHAUjWP/jB9Cbr4?=
 =?us-ascii?Q?JGLsH5G5QzCBKhrBZuPKrWyksQf6/LLswjUkTZ/mqlRc18+TRNq3KNdaIrf5?=
 =?us-ascii?Q?otSFHdQEw5gDDlxZAmxlcSh+8bAveWWytXeSQhycDCjbfLRsLxjHz7bjWzI9?=
 =?us-ascii?Q?jRu+JX3uqXOoCpKzDPS9/qgd5+kySSyeTzQwlYciODQwW9FPErMMfMGQO+WR?=
 =?us-ascii?Q?GRdxPvzqb70/nry4ZnGd8BJxMrtqEj/IkgMCUWZ98tPwHwJ4zgbn0lW/SVhg?=
 =?us-ascii?Q?TKG1pT1FAXsI9n0YHiC3uqSAayaBbC+/YPt7phfp41DzeXAlDeH2qZnGrgJt?=
 =?us-ascii?Q?oY3suw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 23:53:42.1445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8498b681-b406-4e5b-bfb9-08de59484e83
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4127

Some GPUs do not support using DMA to transfer code/data from system
memory to Falcon memory, and instead must use programmed I/O (PIO).
Add a function to the Falcon HAL to indicate whether a given GPU's
Falcons support DMA for this purpose.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs       | 12 ++++++++++++
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  5 +++++
 drivers/gpu/nova-core/falcon/hal/tu102.rs |  5 +++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index c886ba03d1f6..89babd5f9325 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -15,6 +15,15 @@
 mod ga102;
 mod tu102;
 
+/// Method used to load data into falcon memory. Some GPU architectures need
+/// PIO and others can use DMA.
+pub(crate) enum LoadMethod {
+    /// Programmed I/O
+    Pio,
+    /// Direct Memory Access
+    Dma,
+}
+
 /// Hardware Abstraction Layer for Falcon cores.
 ///
 /// Implements chipset-specific low-level operations. The trait is generic against [`FalconEngine`]
@@ -48,6 +57,9 @@ fn signature_reg_fuse_version(
 
     /// Reset the falcon engine.
     fn reset_eng(&self, bar: &Bar0) -> Result;
+
+    /// returns the method needed to load data into Falcon memory
+    fn load_method(&self) -> LoadMethod;
 }
 
 /// Returns a boxed falcon HAL adequate for `chipset`.
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 39863813a2bf..8f62df10da0a 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -12,6 +12,7 @@
 use crate::{
     driver::Bar0,
     falcon::{
+        hal::LoadMethod,
         Falcon,
         FalconBromParams,
         FalconEngine,
@@ -151,4 +152,8 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
 
         Ok(())
     }
+
+    fn load_method(&self) -> LoadMethod {
+        LoadMethod::Dma
+    }
 }
diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
index 23fbf6110572..7de6f24cc0a0 100644
--- a/drivers/gpu/nova-core/falcon/hal/tu102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
@@ -11,6 +11,7 @@
 use crate::{
     driver::Bar0,
     falcon::{
+        hal::LoadMethod,
         Falcon,
         FalconBromParams,
         FalconEngine, //
@@ -69,4 +70,8 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
 
         Ok(())
     }
+
+    fn load_method(&self) -> LoadMethod {
+        LoadMethod::Pio
+    }
 }
-- 
2.52.0

