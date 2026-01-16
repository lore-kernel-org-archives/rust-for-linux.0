Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010057.outbound.protection.outlook.com [52.101.56.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC2F3081D2
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 21:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768600244; cv=fail; b=GygGkMQVSxUZmEMy4hHEqGO9YO5MZSLAbGfxANpBvpGWmDoRt57W7+W/dm0NBOrI76n85v6ytN48A4182JZzxsojCso8CvZKaaSltcsMPJG3pNX7uuSc/Z0/vH0k6mMYIsEY777/XeSUxjfNeXPcNDF1jKmw/5Eno5wsR67vIp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768600244; c=relaxed/simple;
	bh=XKh1bSpvFhOBQwL/yN6ZeP01DtwPeg+qIsgf/3gmIeA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EFZTkma45bm5rq5KJp0UQYu60V6UT3w94M9QAs3yGSE2EuSKbeDMQ5zq6r4yqnYSpPSUbbKiGALX8sQp3u1qQ+g50kxhHL+ChCjs1QgYpkzgd6Y5j2ltEgVF64MFkfv782JhEjeH5RFBvy348CzMC3fdTMxZaGsYfaOS15Yrr5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rBF2GE0P; arc=fail smtp.client-ip=52.101.56.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rBF2GE0P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GP5qLODj0hWmP2EtEIr3W+OvwALTLESUHOcdyEbsjnAV2TUqunUkv+xhGqojm+8OTSbBBECWeVpLWdCZ4VdSgZapS7dFxFXn9VjUt6O02hrEXM8bB4P2w1vEzoXuSw1t8c8BiTzIaia/UD9jt+Fk7nmJc8/X3klPNuXa/6w2BE1ZoDJtaZc/gXcfxTIF2sqXmNbuPk6Qa+pG1Ar+RqMwj00K4pgmP+MAETh1uOSvlv6vtXzWtnLsQz8IXTMGHCAwv1seVLpJBvm41tsLWhx+76EWKbbUaYvb3EPiIKlTP3aHtFlVo8O0AItrNsFkOsG1nXNyRtVkeHwh70nrNMwkww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z28sxhj9cQlleh+jJdlD63JzXubeJ1xcye1uPA3k7YM=;
 b=bxnB8zlZ4STpg3+MLJWBA78zq2DOw2YaRFo/B1khRvnJH+9/GyVJmIXp/XdBdTVN0ZCWjDIqGOKn4MbuhpIC1xkZMIieff0sKb3X1sT1nvoMNhgbEDAAwTGR2gG6iR27NMwEutcELeqHOQVnXuLoPETO4QKY96GhDKDrigfLM/xx4NNK4wqbeY3c+8bB/PJ96zeLj9ZTQwkW3B17mplD0G39fZXn76tm6hw3MkD8yWzIpC5CZQMauCl7WbEwPb/v8kTayrJlfy3XhFWAMJhV5yfgdatT3iZ9kchRBTFUYhFMlJfF5etuxdq3uaiynCWEmK1v1+ivBw5CEn9nsmCRRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z28sxhj9cQlleh+jJdlD63JzXubeJ1xcye1uPA3k7YM=;
 b=rBF2GE0Pr9sdc9lwlJqXWnvqRz31m78cBFo54IUz0/+o6Bv3XMu4qh8XbQYtgel43Jog2b0i4E9Dmf5UYrqg4SXC59/rrtwfXXJHgDtWXiKl3/f3Tf2sLt3de5pb6yZjLaqmafMZmDBuXL0/M1TuO3BDS1QWkfJ3lf85uorzX8MDuIwoUGfYj7Bqdi9v22Pgw8Jk5Re3EmI5Ysw/piadZ/7n4BNPvUHgAgrrLSgDm6DrJl+Li/k31kc/jpHYqYXbfSAXb1qbWQDOTcSlcAdnHUELcVWoSLXGO0rswC/3/fidoptdkaLT9prmeS35OYYoTvAn50uHNUilcBSYOcFuVw==
Received: from DS7PR05CA0069.namprd05.prod.outlook.com (2603:10b6:8:57::21) by
 DM3PR12MB9414.namprd12.prod.outlook.com (2603:10b6:0:47::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.6; Fri, 16 Jan 2026 21:50:36 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:8:57:cafe::4e) by DS7PR05CA0069.outlook.office365.com
 (2603:10b6:8:57::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.5 via Frontend Transport; Fri,
 16 Jan 2026 21:50:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 21:50:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:17 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:16 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 5/8] gpu: nova-core: Replace module_pci_driver! with explicit module init
Date: Fri, 16 Jan 2026 15:49:56 -0600
Message-ID: <20260116214959.641032-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|DM3PR12MB9414:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b21b45e-36f6-431c-b53b-08de55494822
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tGRv4UiL3FHCdAhhhxOWc1r3qM/Upn4W07hkMJBIAVUzEoZ0GHagDkB1dOdQ?=
 =?us-ascii?Q?wLcKHSv/wRHg3TitY7ANJNQBUoZzE3cBhFcuGHiUiKyXn1UpTwMN6XpYmb6l?=
 =?us-ascii?Q?xFed7kQ6S2hTQLTPutOODppM9gsECfynF4D6C03VqpyK99DotE5BIQ+5aay5?=
 =?us-ascii?Q?kVh/DfSGAfEd2NotxXj+hTAthzevd/xEH5DrEusB544qETG8Aivr1wIcirzG?=
 =?us-ascii?Q?+HFieaBcVCU+H/zXwRJg3YBQCzUvy6ZdgiXpnY8o8hIndlNuJROdeLZOEAQ7?=
 =?us-ascii?Q?9BdYr1AHPinwC9AvUUIB/tWphnwBvmfJ4V3SDQfDE+hhpqo0mA5sL6wIcC8K?=
 =?us-ascii?Q?XtywZSdNur7jfY3gjlJncnXgzMffXecN51Qo0p8DEHErBiXM03IGkztF1NZf?=
 =?us-ascii?Q?4qRaSXZZmoGjwYB/mwTAQNMZaALHQkGfWRiLbojUv0yQ4W9cj5ybQrvyuht1?=
 =?us-ascii?Q?Xh7Kf7YKFdIuDAab6VMh4UDtWrCOvgpu67y1s+eY0yALyf0fDs9dCW16Qcx9?=
 =?us-ascii?Q?hEPElY1KdkptqxxJ5B4NxAA4AJvzArWWGBE2M55diwfy2f8fn2WQlTWitRLB?=
 =?us-ascii?Q?uuIlT+3C72N74Irwko+uixreVaZfM+1Ttd4UPpjqYCXV2RMu6it2Ta7Ui+Fh?=
 =?us-ascii?Q?89OY/Hj5HLZiXZuS+ODGHqBhTZN/V3rCZl/hYcajbT9I7+GJMEK9ctJjNRFy?=
 =?us-ascii?Q?SDBoGxq6CxEzIexJHQtY8V5rfnVRkaQajRgNzHdtKZsSA5FXiJOwGx8Ze5uu?=
 =?us-ascii?Q?cnxEvODdHGg8htwASw8KcoUlvNgkm9zi4uOkBWqASLkJhpf217o4s4wUK54M?=
 =?us-ascii?Q?YeCGMm48Cw7qAC+fd8yOS3/Fpkzc3QE6K2GrTMlYgRt33iHfavXwgJ14B+ql?=
 =?us-ascii?Q?OpcDkiVvNjKHBSeKabnqhDTaM4G6g19vPQJd/KoRlNfIXvkO16AWU/kSXzkQ?=
 =?us-ascii?Q?5TFGotqy55AKGvjkza66f46vcIBBkXOMBruQDoYT+S2U6lEZOkvjmnrK3aYK?=
 =?us-ascii?Q?yj/UVUXlZuzIVErJYoQKuZhEuCqpzLoU2SmGPeq8T+oOSSnjtX9G6wP5NLM2?=
 =?us-ascii?Q?lHOIZwdevHbznXhsMu+JMGJsVDIVz/a1W6jQs/nBHeRaTvfhz+J6h4j53bdV?=
 =?us-ascii?Q?hu2BsZOQzFahYbORkNoF564nBmxodvq57fRXnWFP962tSWoqrHme4kP2rW4j?=
 =?us-ascii?Q?phZonxss/W9mHgIdhld3cbsju4Cg6vdj3mLLZ8OZCfUz77uhOMSYOxWlCjsm?=
 =?us-ascii?Q?VLeHEp41o8gnbCXbN/IMLcicWc0ZpNtHeYEaq0I0cXkUZayamlIaLo+eZYZn?=
 =?us-ascii?Q?2xOrURAxtZ6kcEeBlImxvz2qzXGMY7qjWYTvgBW5B33qgP6rJ64IsuiV3ypc?=
 =?us-ascii?Q?1Sjjh0GMOSZ+YhVq6wxE4N2WkTy+TccxlwIHxpDkTEklpOUo0qwiTMqDAMNi?=
 =?us-ascii?Q?+dKzoLavUdro/pYXK0s5tUlAYRpYkHfkhJW37mrHDBF0FIQppM5U13cBM6MO?=
 =?us-ascii?Q?W9tguQh9ValwDH1x1PHpcD9U1e9w4JZ5gJ7gmj/11+Xmyxg0Kfpt6OF4cB4r?=
 =?us-ascii?Q?2OZtZAQsM0A9GvjpvhhENkiBLlEA2PdbmWZq5wH6NHhbj9rQPvWI0ycNhXD2?=
 =?us-ascii?Q?DpUiu3shrCVoq6qbi4q+TUWAMvGC8sSuuZ60eI/pFoQteYaxMdozwhPFiNCp?=
 =?us-ascii?Q?zaRNGQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 21:50:36.3099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b21b45e-36f6-431c-b53b-08de55494822
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9414

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

