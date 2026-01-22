Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010058.outbound.protection.outlook.com [52.101.61.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B49E3C1FDA
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 22:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769120990; cv=fail; b=Z4fm7rsdBt3pHjyJ0dApcJFoyfyF0woQgTNk9DXsDChtELKBujzrZ4Dzxml3J+NxsBI9P1ykp005zFTd0xeUKB0cvZtT8TBs2lSuov2DIMtaHlRselBfrIzzlcV+3uiuq2tqFRWVRzYKooW7CiSJ7DgufZf6E/OjEzo6bhPZli8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769120990; c=relaxed/simple;
	bh=4N75EJDeyJvHuQqR9pk/GVLhqzx0zx8lST2mSrwhU7w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gnBXV0eEep0aXauGVekTvyiU8QyRrpMXwQkxWK+goMHm3h8gRFYWO5lQoEmD3guaGxdPYSLXgSBE8ydgbEss2dAu0NXbNz84H4eByBMRdZA8hThkKYhxzNkxIH2eVFlQLzML+/46dw6R4VauSt3r12KklWAtV2CTFwcMM2GnWyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LM1Vk31L; arc=fail smtp.client-ip=52.101.61.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LM1Vk31L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOGX91zZAMcmPoPcdd1YnFbuZWZEvKBcUQx03p7yGWVg00uZnb/pQ5Cx9JX4Zx9Y3nT3MT1+qZ59XB4XB+i3pFlJw0yMSvuXxV/h33lmVm4j7PRKDvXlOLLGVRD3agE1ahc/5ZGgackV1GuW1aSn6tkLWNtT1TqpAOv+XuFwdJfE7GFNpKkHSOHv78iMoDK+gahN/YlHy5Mb9g5CnYUYYTnkUV1aFva07EfYPTr5vNg+Ii7QHeE5bYRum+P4DunKRzvuRwoRaEUcDg6mSnhXQCXN17jR+PQ+Hky2rIyk2MzlKWUzO2RImEielqKFczwUCPxjL6RNYWMosI3ik7k7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnESJJtgSSZOizXYuESQBhoyZcWzwk7PxqOfAVMaV0o=;
 b=pHzDmi8YiAoZuVATXFgxqhUWPGmjTRyvG3T+85s6Pw26s4EftvG+xUyRk7L1Eh/PJdw/stkj7K6x+R52RYSKCBoo1otRpCf2vwz6n1qLmeza77pM4YhiHoEXABvO+iLb60/P/hgu0y84hDpVoVo7KlYBLRPi62OtgeLaC+OHFCRxh2IYHWYv67x3r5xTj3tUkZM3Grkxnm/JpdtTnQJKkW84fz7yQTO3GeWcJqrXxYnMMdlKqhDq/VK2ozGXtwrO4B1XhW7ArgFNbABlU+3eHcnb8L/M7x3dLK6SFo31Q308o+QXS47FXT5rXIhdJh7A08nwTiGOCSPb8bVIZlU4dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnESJJtgSSZOizXYuESQBhoyZcWzwk7PxqOfAVMaV0o=;
 b=LM1Vk31L1GY4Rjk+7wyWYt59uLAb/QrNyVF4gpCAAm0txmW3B42d467WWa5an3ivXSogJBxyVRy6uteIb7DhhRaf8u8ISD+hgcycA+QEjhDYOjIoQwt05DgI4lblmPshW0B5kM8EQi1t9ZkFbg3o1gWBrUXOaNFm5KAv4LxUZkiAxgVyZO78afvoWYbj7tr3OR4k15zDos0AgfWBNmlkiCE0rXo/dOwHJvzB5rYrrv9suUEJucssrl7Y45qRVziiHvH6KIstwRMAB68iuhLKtes2ViRTdy30eG5Wivt65eMuF5mMBqufzVDdv2yKG552XwLYEe4yZnyQx9yz6lsGEA==
Received: from DM6PR07CA0061.namprd07.prod.outlook.com (2603:10b6:5:74::38) by
 SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Thu, 22 Jan 2026 22:29:33 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::d) by DM6PR07CA0061.outlook.office365.com
 (2603:10b6:5:74::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 22:29:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 22:29:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:10 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:06 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v8 09/13] gpu: nova-core: add Falcon HAL method load_method()
Date: Thu, 22 Jan 2026 16:28:44 -0600
Message-ID: <20260122222848.2555890-10-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|SN7PR12MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 50376ffc-9674-4785-0e05-08de5a05b717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pQ+1/rIzJ+qphJhpn4uO0mCZxWs2IlVk2Y4NS0nLDSWmxCarZQYhX4Mn8kE+?=
 =?us-ascii?Q?n8cNxAu2tO2/0u/4/vnhxgt+/WqyCyAi01wWqAEn26V+TY1jPO9PwyrDmD0M?=
 =?us-ascii?Q?W+zgncpCa/XPw0akIz7k2rXguUgGyA5I+lp8gZMAgLZZUSkqHp6+/0xO7Ihq?=
 =?us-ascii?Q?+kziupNLnCwiAA+6zIRu8165cBPA0EWZIytYJUxdLHeNjji5lottJWpnUJ93?=
 =?us-ascii?Q?RmHrMvMQwT/aQg8jlh+b77N2AFXDlDAPebL8HvaZivfplnm8dVWrhfT6yz9w?=
 =?us-ascii?Q?wEBzoVB7z5ALp07wtc0CliI69JFgifJjdNCRh1oyQPI2dygnJps7TNHIH/ns?=
 =?us-ascii?Q?q+N4bU+THMs64Xzfg/fMcu0c7yPwnzOKhD1z0QHII1u26Am9T3e3ypRtEzn8?=
 =?us-ascii?Q?s/2ARbOX7VMSpGgZ4JEXM5qGLtRJ6V7Nl0xOrJ6i6tDJdiAN+FdbXrCsaHUD?=
 =?us-ascii?Q?jWne23PeDNpie+vL7lZ+Q6DsBDOgy3xorZe0BeUm2bgf3SIT1RSSbGk4nGRI?=
 =?us-ascii?Q?n9PlYSmgYSZCqONupgQswRCYTBFxKkw7EX7ctr+uNU/UW0//2UtFO5i25iFH?=
 =?us-ascii?Q?DBcILiscr7xE7K870GgSZW8cexfKAFVxws4+5+DLLN+NhbaxH9Nl3hXvPJPV?=
 =?us-ascii?Q?itx9eDXLRhPILd1pxjXgDtIMDJE44VICbjcZjbFKq8GQ/gbwntbYnLiyVFUv?=
 =?us-ascii?Q?cUOgQIEtE/GYIPU9vtixmRxT0yP/RKCONbvJqD7KzElZcV5plt28JhmTwg6l?=
 =?us-ascii?Q?bnqSI2kdCtVvVvVeliUolOg6zDnlN5upirQWptcCcsLjajd3ITMJMEoJx7+Z?=
 =?us-ascii?Q?D4erz6Ar/pI6t2Pu8pgM5dqX2xnOc5ZLhI54oR9sfzxISeKifxWKDB8fhVXD?=
 =?us-ascii?Q?swHcTQA3uTHPS7FMlc0BZZordXZkU3GLmfZQJOCGDVt+PJEhBDuKNrpMcJWl?=
 =?us-ascii?Q?1tJqMvCQJ9IQ+utjaH1KS+S5ulL+L0TeOEao3XK3EjjVyY1OLvzaOTS2LpUE?=
 =?us-ascii?Q?xghXv+HQ+i2HVCmI5ac7JpkkbOuy3Qty+PJkxkCoJv/pL/Aq5Q+Ac92BezLs?=
 =?us-ascii?Q?eev/rA+Uy3oPnZdv5i2R+42gm6MkrSdRk7C9T90IhnxIMteKZ9rzAGUhLsw9?=
 =?us-ascii?Q?K21tBPODiBMe5WQwaG/NbzDS0Y6L/5B2xOBxO0dB8c4mFFWNbLkViQgdD6VK?=
 =?us-ascii?Q?lbPTfdUt2OhEdbWdgJrgNSLduRkcO3ChId5dr5NY4KM22IOVDAoE5HDPtm7F?=
 =?us-ascii?Q?EaM/9bfAuVpWpzmtXj97i9f0zygqCGqbJIODQrmhLs4d9mzLmB3UtbEC+pvz?=
 =?us-ascii?Q?QfrOPBB9mHRKSfjxGKLm1NV+t9NCn+mDkO0HaUlbmnbf8htQMThhOB5lpLc1?=
 =?us-ascii?Q?+V01rGgh5yhDsMEClrwPiTaFi/u9zVH6jTdIDuT+fuuKYm6NDOoy4QQZBR5r?=
 =?us-ascii?Q?e+NcUe/YK5p67NOgY5Jeh/BzJRTxjDybuYmTbgGYmAnjXbor0rJhhVnzmfjR?=
 =?us-ascii?Q?0eUpZdA1SgcKQWzvyf7CgjAq0rE49u6NJPodRk02YruRuqnaTC7lE/DPFwUd?=
 =?us-ascii?Q?TWwzo50NFivw+MlnlgCkwe5YaKqDHZX95sL5NmomWDYXtwETBARKWZ8/1XHc?=
 =?us-ascii?Q?qr2sWOV3ZTOj6a+SAGItiBHLzCKX5qIrtAakote9TRwH8wOf0ZSPZERxAmKO?=
 =?us-ascii?Q?XXDs0g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 22:29:32.4765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50376ffc-9674-4785-0e05-08de5a05b717
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8059

Some GPUs do not support using DMA to transfer code/data from system
memory to Falcon memory, and instead must use programmed I/O (PIO).
Add a function to the Falcon HAL to indicate whether a given GPU's
Falcons support DMA for this purpose.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs       | 14 ++++++++++++++
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  5 +++++
 drivers/gpu/nova-core/falcon/hal/tu102.rs |  5 +++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index c886ba03d1f6..fe6de900e8b0 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -15,6 +15,16 @@
 mod ga102;
 mod tu102;
 
+/// Method used to load data into falcon memory. Some GPU architectures need
+/// PIO and others can use DMA.
+#[expect(unused)]
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
@@ -48,6 +58,10 @@ fn signature_reg_fuse_version(
 
     /// Reset the falcon engine.
     fn reset_eng(&self, bar: &Bar0) -> Result;
+
+    /// returns the method needed to load data into Falcon memory
+    #[expect(unused)]
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

