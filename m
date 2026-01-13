Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012027.outbound.protection.outlook.com [52.101.43.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7273C31DDA4
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 22:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768344880; cv=fail; b=ssOlhZtcWA88NhCnoySltZPh+Jw7iqJ83FOXxJeSk+r9RSjchYP6JxvVHdArhqJqlUZ9wwcqGmXUpFWS9HwbbqO7BFAu8mjEAnEqrKB2yZSuWcHWWHPB9kbwSRHy48doxzjL0DeTJ8WvQJuQQDLYhY5vxOWrcbmPxlGAT64Jx2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768344880; c=relaxed/simple;
	bh=XKh1bSpvFhOBQwL/yN6ZeP01DtwPeg+qIsgf/3gmIeA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cYIMgxut/8PGZ2tczYdbMnltMY1H2WjKc2lvo2lDsv/ZXe63ws7qHitd3AgBgrV7gPJ2zrHOcTt2cz58iB39w14JU2sBl0o/QyZb2qO6pHfgwMWbscTLbrXA3YqzVTDFMd97JiALwaEZKashrF8k8dTJ5ziVv4wyeC1hpDuX900=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O650RMUo; arc=fail smtp.client-ip=52.101.43.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O650RMUo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQMcwxXozBkzCJ5fdCD9ajKoug7DOoRyD74WmK5wKDfCYhQ5A9T1eP+RVXKjm3nFXbErQPHduTq584fj7cptnd9h3cCt+9BnS9J2axLX/7v1LFkGHhfRJSyvKCprwGWP1hajvC00SjpRypUdYjIFyAc0ip1zxOr4xNQRj6qZjPr4cCdIHMWCw5ovE7qvIkvmfFf8CgQsYzVfaLr5Kiw+maEkS118qkSOnrJQ38Tf/8Gu2l4t2EHvVrPnQNu59hUYIgB8VZ78PtUO0XCj1KDs7WtBYZwKf6IKnRRS5wmh4z8vFaqBc3DsyEs6X3k0CoZQz/9eXB6J8apG40OouRj28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z28sxhj9cQlleh+jJdlD63JzXubeJ1xcye1uPA3k7YM=;
 b=AegPPryM3SWb2PKHhxtIFX4PEJ8q8ZGPFiIQ8aD6kjDfXYH7t/EfgjcQwID9XRY5KnwCT0H53mYDSWpW26MdPntHyHjR7v5aRWP/G/t+3KqrUK0knPcXtaZc+kD9l5BOXkT6bOfrA8gu1N4FXbSIFS08IxHx5Yv7vNke9mUAZE0ynf9SYImZdCbNtcX8BpWfCsheoGWtuYIYOwdZILemcvIqWem0PCGZICGAvbw9Pu3pmvK7yOyVOC07PMwCSmI9j3/3jjHqPjx15dOXYztD6Nehao4q02g/MC/NipaN7+9VSWekNl8f7plzp1UJKgEtO5U9cd2ySKDAMfBSV0RadQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z28sxhj9cQlleh+jJdlD63JzXubeJ1xcye1uPA3k7YM=;
 b=O650RMUouBJemIvUDkm2S/c5NU99TYyTVY1DQeYcVBhdxy2xRT4QcUdQMljdELXMCyTzjcLIIzS2qaOra8IHYtfXNBJtFItkWyMXpSe5tWEGFe+PPbAKRztBNgpAZr4g2PzaYhQnlCkCzE8SJlIGvm+zAvMfYKIXFB0Qm9fX3/2+Okl8uX+vCeI2k77YbiGnwDmzjdFWALzNmOCppLF96RP0KXmYAlJRdEql/NBu8BN9++pdoBLwPNXWDYEJK3nbroBd7mx0PAOhpJM6Fh02rFGkBC21Aljoy0I8Tb2KC1ssbb0Q7bjJyUfaJszrSouf3zSa8XpFixcJMP+4Q3gi2g==
Received: from IA1P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::10)
 by DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 22:54:35 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:464:cafe::94) by IA1P220CA0016.outlook.office365.com
 (2603:10b6:208:464::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 22:54:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 22:54:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:20 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:19 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 3/9] gpu: nova-core: Replace module_pci_driver! with explicit module init
Date: Tue, 13 Jan 2026 16:54:02 -0600
Message-ID: <20260113225408.671252-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113225408.671252-1-ttabi@nvidia.com>
References: <20260113225408.671252-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|DS7PR12MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eff0e90-0eb1-428e-6868-08de52f6b953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HrkwPv9j959dDvQ3jzEirxic/gLc58lGEbvJoMQTuYWVyW8aJ7RrHbxOF/JN?=
 =?us-ascii?Q?9NXYLsh3zvytc5wN4RwrUBCLhL4pG2fz6S6s62kROjwHhpKhPrHfu4u+37yB?=
 =?us-ascii?Q?hDRTY7SRZud1qxT3rt3QfqAxmqPkF0xshngbioq6JcGskB0hPMNtZtwYZEBU?=
 =?us-ascii?Q?65QIfTANPr+9uQ9t5BbHoycoPOS0Cjcn2Iv0+AswFOOmWM+NPmSZGOjTpt+d?=
 =?us-ascii?Q?jc/7BxZKCx+OsglzG39lul9eGjzMAvoqisyXNID9eWGxIGz+kXScylTizzwE?=
 =?us-ascii?Q?QaUTw/NJAHivkP4LhrGhj5gIPru+l8WIXfNESCq9nu7zzFcTAbDA10dFWibf?=
 =?us-ascii?Q?B5VQLW7ai75DymLssYMt9CVYkufHS6C7qu6UQtxjjwhoeLa/R4S4gXevDJYz?=
 =?us-ascii?Q?yofdskmnpUyYx99AQS8gpQUcUnKAG+epfjc6o9VDCv5Z+hiAy6AW5wPYLj2v?=
 =?us-ascii?Q?o3jNHj+4VdxNdvM0L0ipIIzyfQc9kkZf+WbqGaCT9NMlF1X6kAYb9uLzm7YG?=
 =?us-ascii?Q?sqmbIdTbzp8UvUja4VGSlqSMrpT1bKJ+qDnZJQSNAtTvPMwAzhi9oDsV27R/?=
 =?us-ascii?Q?zEC9yeSAb0hS9vDd1JID4v9CcofU/Ubo09o0Adyzmxf7Ea3b++Lyj6xdwW+a?=
 =?us-ascii?Q?SDVLTktSBzYA1nkDrc9cdTck9nUuNGXjZwQG0Vj5uaOdiUVONJEGTGubBexE?=
 =?us-ascii?Q?9Zd7Pae7RbQJoA/+PNIHb8pccNb7IcLT/8wnUlYQ6P0r6w9BFf2ikhYbdmia?=
 =?us-ascii?Q?EaoCBEOMTn6fFdKPmNNxci6ICfbi/ZH1CwM+vRIP8WtXghdo6KFOQpi4NFCe?=
 =?us-ascii?Q?1s4VwuBxK10usIvJ4A9kUnjsNTJZn8NcZKrTgiVOw242Hfl1pTm/b0vH2nxB?=
 =?us-ascii?Q?Ee9m43J0qK/jBoA4s9pjLHN8nECJPrPKsXHITCbE6jVk0ET9CQs01VMX0ayH?=
 =?us-ascii?Q?UiYcnfy6BJTMnIkEj8/xD2yMy60JfJXLmp0IHp1Vgq9UJ62+8KTvYKGXgGru?=
 =?us-ascii?Q?MRYPYmqkqy24w0VKkslPPL1biW+AgZM98ZQCyC/NLjBEd9HwkIczsFeNOXhW?=
 =?us-ascii?Q?MlBiNRQUNYXR6a6DfprIPGF6VBe9fJ2Chpx3XNmrPETx1MRMKQHa83sBvpZx?=
 =?us-ascii?Q?ZQ7aAMkgH4HFHX1ToiI1WMxIs0mJJrSpkgxlwp+36kKCOWVr+1PaASf6FBbQ?=
 =?us-ascii?Q?JmphyxHeen9Mn6GwXu/XUcXP+x9BsTJE7w72/0eTgeMbzgXcagp2bkkoEoZc?=
 =?us-ascii?Q?Bn3r50SmjNkyk+cFkBsSa0d3SZXjpTlGC/OVFT9vCVeEX4LfgIykl4MxlRkM?=
 =?us-ascii?Q?NvlZWIcTtmRvzsnzWuxMqiroTErMbG0UBfQPuBApLR7JphY0fofvhZbPQnbN?=
 =?us-ascii?Q?q0hkRvNooo986KuWuqJQTXD2FBG1c16oT07SN+iDs4hizrb7/kdmsA/tqZ1S?=
 =?us-ascii?Q?i5EGt+LxJGDsFOJs6CuBLdJNygHy9EwX3HqFqyRvWUxj5EHlZhHyEhFubIw+?=
 =?us-ascii?Q?vUhfKqyxrMzG8OrGKUXekKs9OCrsYr6kygOzch9aO0CeviUHKL8c7MagF3Vk?=
 =?us-ascii?Q?yv+nv6nb+DNov6KE1Fg=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 22:54:35.6164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eff0e90-0eb1-428e-6868-08de52f6b953
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6095

Replace the module_pci_driver! macro with an explicit module
initialization using the standard module! macro and InPlaceModule
trait implementation.  No functional change intended, with the
exception that the driver now prints a message when loaded.

This change is necessary so that we can create a top-level "nova_core"
debugfs entry when the driver is loaded.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c1121e7c64c5..d0df8db3693d 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,6 +2,13 @@
 
 //! Nova Core GPU Driver
 
+use kernel::{
+    error::Error,
+    pci,
+    prelude::*,
+    InPlaceModule, //
+};
+
 #[macro_use]
 mod bitfield;
 
@@ -20,13 +27,26 @@
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
-kernel::module_pci_driver! {
-    type: driver::NovaCore,
+#[pin_data]
+struct NovaCoreModule {
+    #[pin]
+    _driver: kernel::driver::Registration<pci::Adapter<driver::NovaCore>>,
+}
+
+impl InPlaceModule for NovaCoreModule {
+    fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            _driver <- kernel::driver::Registration::new(MODULE_NAME, module),
+        })
+    }
+}
+
+module! {
+    type: NovaCoreModule,
     name: "NovaCore",
     authors: ["Danilo Krummrich"],
     description: "Nova Core GPU driver",
     license: "GPL v2",
-    firmware: [],
 }
 
 kernel::module_firmware!(firmware::ModInfoBuilder);
-- 
2.52.0

