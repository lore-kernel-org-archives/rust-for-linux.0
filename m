Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013061.outbound.protection.outlook.com [40.93.196.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124CC352F9A
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 02:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769653752; cv=fail; b=OhgHtLkh3gOZgoDhfjVq0sVTWmF/qmrp3PBma0hP/RoC9P3G6AIzMLaqn1UaY5MAa0A1XeLduBXpsSOn4O7YC2PiFWRdu7eaqq41qLKW9T4fJvskjeYqQhd1LcLe7n4v35DJUCooIiHMGzh2K2zpduNHpyovGu1FyjopqJpksdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769653752; c=relaxed/simple;
	bh=NwNMzYvb5HQyxjgV1H7FG6V1TZMzXt8qNgWe048yTrk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lrmDnFmic2+W6Pjq8Mj4qlIHjg2TEwbXO8obJCx4mujSfUZ4GXSYSrXLyFY79eM3K2SxQS98L/St1nxRfWk09QFughAKsL06PvMCLPmERoyIMFDNejDSJj2yZoL95l+aEu5KDFqPpdxTOZoZfL12WjMQiSGEY1bHbGcxWjnlcqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Rwnz4R1O; arc=fail smtp.client-ip=40.93.196.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rwnz4R1O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGE5yxWKgIadoV/GqO0wOqwSqDxjowKt+yz6vkxJxe5l/g2geTt2rsVpwdGkj3MfvxOD5ry5pg903Ccu6msCcTtqxgekznEMfBGXdSIEAHzVtQm+c/YiTH7vIG/NTkaFsxXn1nNwOSUh9eeGzglFHfKIuL4HuirN8tfDHV2Uzz4i1i2fcU96P43zUlj9Tl5Jy1Wh876QhHNRlGJ4qPkt0GNmyQ1Ooq4lLAYQfFcuCr82zB1GqFyNbW2+twKGsl2wFEDrobc0EARD7Sm4uhsFLfoibDsUXe81biKZPF2PVnWfKMV2vOXDqAXsxzU4wO8t2IDMn9foerHYMU5o8JJt7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrevmnCW33xWgmI0Q2BhejWdKq5tjyO9EFg7EF5rHNU=;
 b=lEViRSGBYwE2ZoQ3OHJpc5fL/zmLAWxPXLMHa1GUZlQ/YDKXG2/qG63Fd1P0GNq3g/wU2kMPPVeBfb/cRCYDqaob7d8+wjvezolT6c9nEXy3CUenqi5pvG2P9uGSgAPyvNAk4Si+vd/qfP/bA2iorV4M2r+pMXtzgFf/9D2s6ovx9fy3Zbcld31x/UFmynjtXkI5FynquScdLmFr4mSK8NlYV+1FfewODJV2fT7GoA8f3y3QFqaIroxv9CL1Glau39Qmy63QmW3niOZhQ2HyG8i/jH3XEgi6xs47UOcnH3gDVDa0+iwj5JPhwF1x3e/p30TT476N4znmTwjZO+AyhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrevmnCW33xWgmI0Q2BhejWdKq5tjyO9EFg7EF5rHNU=;
 b=Rwnz4R1O7qVfN+zGhp3zV73/lBnfhYhygymfC7pKuCLKkCOXjWFvdZp2S1OkgKJVIC85Mlwohslf1ravJugDCqNMbovVP1uaPnpx+ZLJkZ868+rRiBgAqEZF6HK/6YXMEJTf5JPpJxEYQjuk80YevcnpK46Lgdhu8Zz8uMrhSa0w/x4xS0qBoQqp9zihUWn0qF7QKIl56XHqt8harY6g5C4nSqUSjz1OimOXuikZ9e0Byk9ROoak3ce/XIiU1KYMGboDA2IPEc5s5Gs9HDRyodtm9IM0UY+JcJkqjg/oOKXxPuDSbAJu0hijDg5L+ZcBkAVccRAZNuacPQm0dD1wMA==
Received: from BL1PR13CA0155.namprd13.prod.outlook.com (2603:10b6:208:2bd::10)
 by SA1PR12MB7104.namprd12.prod.outlook.com (2603:10b6:806:29e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 02:29:06 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:2bd:cafe::61) by BL1PR13CA0155.outlook.office365.com
 (2603:10b6:208:2bd::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Thu,
 29 Jan 2026 02:29:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 02:29:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 18:28:51 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 18:28:50 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 4/7] gpu: nova-core: Replace module_pci_driver! with explicit module init
Date: Wed, 28 Jan 2026 20:28:34 -0600
Message-ID: <20260129022837.4133832-5-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|SA1PR12MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: 07acab13-79e1-4a75-e71c-08de5ede2cda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/B1LtVHr3zge1r48jt3Rd4ZDMS7u9Jz8omO44sFATx9JuDTB/XNN/He5tifF?=
 =?us-ascii?Q?rnsGy9Tf5KGkSePFaELBhLQN1c9Innl+6Mrp00FjH5ufI0QWwrif0nsjBTfn?=
 =?us-ascii?Q?oM6S7ZzBhFjcOeQ+nc8VhTIJ/oAjKm5Y8zyxIic+bUcpZtcktVZsSTUW35g+?=
 =?us-ascii?Q?oLm0+kmg4MflnAKVSm2ZLfRsUZA5qD4fYFW828CRdFnapU2KI56k5SqZnID8?=
 =?us-ascii?Q?0fBCI+UiLTwWl2Lg5IXoHVDzg/bZ8/jF/BpiUj4j2JxT9ffaxX8Z95mEPumV?=
 =?us-ascii?Q?ftY2v3Gwg5Xj38kJuOjONpHOhn6pIFl7GIGKfUXWG1hY8wlLl3bBieTyhai3?=
 =?us-ascii?Q?XbRFlU3ihH9lHg6H3vRoEiEyirOzGjM9wUsRYPWrpTdVn704gVsPGAiHyzBD?=
 =?us-ascii?Q?lkXKffZOOADNob5n0YuaX1CTgUJm1m8/mhsV40h/M/9r3RvkavIuiPJ44Ink?=
 =?us-ascii?Q?tNiBCRGPNBADGGXN2Fu3SN2em2CnSXtiBWeTX3LTH7GtK4xwWRRnWn5AjF9C?=
 =?us-ascii?Q?pJrypCYYCYSIjek5RrTSGfHe45AXC8Xjx057HeVhGnk2lP+rB62eitzNuZZ2?=
 =?us-ascii?Q?25vE+/rE0BQvSYWs8xBlNuRVyZ7DSMqx2pMn7phB1UI7ZiktDqbdmDZfRWjU?=
 =?us-ascii?Q?Bw9vMTZACvKPocc1zGKLMVE1jDhjGZrIU6xiY4mG5jMSBmUq+ewEXkw5U4FJ?=
 =?us-ascii?Q?jb/55oI+rChjNyw4/c0trm1A3zWxDlxw3oHTmYZS/W1o26KwIhgeZ2VhQDRB?=
 =?us-ascii?Q?zCnckFJTK9MBJ71Sp89/laeYU2e860MnQ0kO0jU6chCe/vKTMj0CEeZMgSsP?=
 =?us-ascii?Q?NOuac3tlVUGVGxaJpTjdecnLpBlomHfbEIuz837CCSf+E0u8e/17CUdwW2LW?=
 =?us-ascii?Q?0WxT2eIiiAZA3Tdy3jdy1iUagWXXMfbjNMlBs78Azh5JBwc7GMjGz9e9mSwV?=
 =?us-ascii?Q?T2gmghsGvOgQrJEns6+7bLaLmh5c/muQ285CACrLFpTA6OPnXB1gSCyiFnNQ?=
 =?us-ascii?Q?lJgdVcu54Oo8aDfdqT7WbIjjGHX9BIOV8BlWyj72U9XDwrxHJGJ63YLawYNU?=
 =?us-ascii?Q?FblelABlSeHWVMbZUY2YhvEKskf9y9SjZ9faale5zI8RIm2GeKty2b9vqjn5?=
 =?us-ascii?Q?AUYfXAIqPJ+JYAylzz3Xzs2B3vdgXEVh84UklBukmfaEW18qSGyCapPXvpRY?=
 =?us-ascii?Q?IKCcoMWRr+rbpH3Rwf1KqpOywDi/I3SvSmwTRURIvru0q3238/pcToASk4jq?=
 =?us-ascii?Q?gj5XKaN3fAUvJkaMjo5YuVaxb/16dl0diLWBKVQb4qdGf66DG8eBeLdxpAuw?=
 =?us-ascii?Q?l8nN93b/XWhADC0MIqYeVUHsOuyARAzwWaoV4ur8qO0nWnMzm8rlc8uBF3DW?=
 =?us-ascii?Q?v9M98gzJH+lLVF4zXTmTM2tQcDpSkNTGcJJbOYq+FSwoGQAltVK70uH6S610?=
 =?us-ascii?Q?ZVVLDGHafPXBQ4Xa5HVw/JQf8hgyNaxrOfKwxRcEpBf4rsnQGYItpj79iklc?=
 =?us-ascii?Q?dxii+nGVbYpGkfc/Ud9rP7nPOinPgBoIi5NX6rY6pmbkcPOkW4IhwDWLyCix?=
 =?us-ascii?Q?knVf6lCYLZyP1JGneTd/CIPpZBBNtmxdUnEr5u83CQgpTeSAIapXS9RHI0ab?=
 =?us-ascii?Q?8HGxZZef1rKjEC9cOPS0EeKlRudGRF1oXtHgQmPu5MGjuYMVbI+QyEngjy4B?=
 =?us-ascii?Q?96F1HA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 02:29:05.9556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07acab13-79e1-4a75-e71c-08de5ede2cda
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7104

Replace the module_pci_driver! macro with an explicit module
initialization using the standard module! macro and InPlaceModule
trait implementation.  No functional change intended, with the
exception that the driver now prints a message when loaded.

This change is necessary so that we can create a top-level "nova_core"
debugfs entry when the driver is loaded.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c1121e7c64c5..80ecbb50ec82 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,6 +2,13 @@
 
 //! Nova Core GPU Driver
 
+use kernel::{
+    driver::Registration,
+    pci,
+    prelude::*,
+    InPlaceModule, //
+};
+
 #[macro_use]
 mod bitfield;
 
@@ -20,8 +27,22 @@
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
-kernel::module_pci_driver! {
-    type: driver::NovaCore,
+#[pin_data]
+struct NovaCoreModule {
+    #[pin]
+    _driver: Registration<pci::Adapter<driver::NovaCore>>,
+}
+
+impl InPlaceModule for NovaCoreModule {
+    fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            _driver <- Registration::new(MODULE_NAME, module),
+        })
+    }
+}
+
+module! {
+    type: NovaCoreModule,
     name: "NovaCore",
     authors: ["Danilo Krummrich"],
     description: "Nova Core GPU driver",
-- 
2.52.0

