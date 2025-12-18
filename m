Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010018.outbound.protection.outlook.com [52.101.193.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC97237180
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 01:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766021986; cv=fail; b=fDHCGeZxv9ppGV3QXhGbhUzPaHh2m7GtYyChJTd4r+l8UyeYgpJwRXsoVWCsHPnohnG37DPDzmHE1U0V8zBqLAPr9kukzY00KIl0guetAgYzzDrWOSaXsvnBQJ5HaJqcuyhk11ubLf6vqf1p10FRXT189rQx8SlrOlL2b2ErCPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766021986; c=relaxed/simple;
	bh=4okUogecsrI4ppwPfL+CKB48fgvBGdlzuWpOsMioXkE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mU39YUhaMzGFIGN/g6Hmggxm/Qkl4/93jcUBnCPeHTwMsfHtQ0EifExLIYJwHKy17xWKa4f78X7GpczW48coDrBUzDSXLmxeB3+kl+91WWaK+SVMsP4b0ReCwMgfUWi4f/s330+n+aPFxTRbWIXwZ/hAmvMj1wIirRoDe3wgTtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QGfbULS3; arc=fail smtp.client-ip=52.101.193.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QGfbULS3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzciWEblGy+Eh9SEZ0Betb/EAHxUHtT5v8N1uYOILBwlJq0EY/r4Ui1LDlBRCOrv1mjFlY4HrRlD/xkRZW/dGYR3N37RkJiVbBY5AdlnKUVZ+qMyJbx5b+J+kXeHe4AwogNkyiBrzc7HaNrcwvNecmn6NzJ6UuA+dmuyNvS/lvuFTJvTI4JMRi9fpZQP+vQ9SUvT1kRmsLEv4ke4KG52GESsJ9Pl6G3pVC7x8S+fPPE8r8T5E5kfXkIpRrSx5XXhvn7QzxxoFKNO1QcQ0d+w9b/g7JbuPxsf5/q1fT9itUmO/O1Vbvxocnv0s28FTUOdKct4eLJu4txG3q67uMvhTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywxppEJ4PN8d/2eyRygOARcNmgWb6rEM8PYHV+sX778=;
 b=GFNyl8eugtTmaHn71zac1watajX78jxIvjjbBqREwEeeaMjZCeW1DyfRcTqVoGBWf2Zp8lEFAzkRIZkNcQCys05NjEqdiVphFt7J120i41hSTgUuggwgHmee6/HtRFzlDwLadzrlLvvNR6EZowBZoydM3dquwdQC5l6nZeleWLixsDWhXepmG2/x4V08gIdLO91qQn6XsEo6crmcZ2qEZx0A5egYlwqlzMg26AzRr2Ylgh4GhUfXY7X/O3c6qKVzM4wcqRgDKr7xl0372SrCS9kx7GM/20T3yQyIwltPy6FEUP0a5zy+fdJ01W11S9t9YShN5xLcm9PFDAp13Djq4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywxppEJ4PN8d/2eyRygOARcNmgWb6rEM8PYHV+sX778=;
 b=QGfbULS3U5kns9icLd3NOK/uv7qzVWSeCXFOhGpLFhMMxZiFRmbiEU+a9EH/lFac23axZlCjeA7k7cdJHUF7RJpcDU+rInW+PnT2YeKxAZOqq7UUant00GgBIq6vaFq94vaMNw92iBUnGEH6C2Xy+E5Esl+C5S1132dSfTBfyoMQHXwDqjedW7EoyWihCnnLTWU0dSdazXtiYF+eBRLLf8ZTz6igcol5ziPrXAyl0LxxZ5GjnCvJlYbehCwAcJ0aEvWgXbZAulJ2sE0YYzBrIKXRnzVqp/8QgrswshiVb02l19xsiTSKmERcO5p/6+4pwiLDvYTkNHbULw1CwHa+Qw==
Received: from BN9PR03CA0420.namprd03.prod.outlook.com (2603:10b6:408:111::35)
 by MN2PR12MB4189.namprd12.prod.outlook.com (2603:10b6:208:1d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 01:39:41 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:111:cafe::4a) by BN9PR03CA0420.outlook.office365.com
 (2603:10b6:408:111::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 01:39:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 01:39:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:24 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:22 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	<rust-for-linux@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	Lyude Paul <lyude@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 5/9] gpu: nova-core: Replace module_pci_driver! with explicit module init
Date: Wed, 17 Dec 2025 19:39:06 -0600
Message-ID: <20251218013910.459045-6-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218013910.459045-1-ttabi@nvidia.com>
References: <20251218013910.459045-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|MN2PR12MB4189:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a4bd96-af21-401d-6779-08de3dd65084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jZhSKuBc5hkUcd3kqTl1Mk3OnYFvqgOssTQecbMRjvlGrPaX7JBInXK07QDc?=
 =?us-ascii?Q?JlK7YjJGYKvRKSruF0ufrIoNowWu1WqCYQg9uZOCPEYnZEPD30WRQY8yinsS?=
 =?us-ascii?Q?zM21nr88G7q4Ba9v0Sz9zJqdm5vP7Ym8Bv4c3lek6aEXXNmjKVZZbMxvnhC+?=
 =?us-ascii?Q?5t0SdBrYznL0DE9Ss84PQ1D07uQnIHIXPg2NdMN0rAwmlolx4qVRfhL1m3px?=
 =?us-ascii?Q?u7NQLzYZwt6+Vhax2tJkO9TsqnP4NsFRNuiod4F4YvByYjU+YQ2qXEjnloqx?=
 =?us-ascii?Q?rCxJAsx74CW752/ARpkn2HvuFXnlAvIfXftzL+XpQsM+jBShP73pW61OpT4G?=
 =?us-ascii?Q?8tW4f7qmHYt3BRNp/HBvuYghSB7bN9jpGp1i1Xjy1HqjsZYKVoaKpeN8dOuW?=
 =?us-ascii?Q?F1ZCP8wPj3CQgcz149Y5qhnT+WRFIi6KwLLyYHHOFF/mDK2PqLJBsIU9PEfq?=
 =?us-ascii?Q?GqQsyFbJ+ab5uAc7p7kQnp495vI09sGT+DfxGIzKEqtcfAX9M7ZSXnB4GvVF?=
 =?us-ascii?Q?UvQbpJ5OYunna9Y0hllvnGIMTeWuo3AF4QvYs3zWGyHPd/e0hM1yDCbQGSXG?=
 =?us-ascii?Q?uzz0KQegvPCccd+vur0RaSlST3/GClKAHZwoGGlp5pWUpxov0PaYeVXBPUsZ?=
 =?us-ascii?Q?Zvw+U73NLl8LZlw6JN0Rh8hAPGdReBbeUe7JgyNxfj+qtYWywSk4VpTAAWIP?=
 =?us-ascii?Q?mtem5TFSvogqdE13sxsY3cZiAWsYW27VAMND32fSSL7XRc6CW1cPtjGSyrL3?=
 =?us-ascii?Q?1VxBLd9QEc84SiCdzMkfxCZubCrTxPj/1S9kaqYwJdoZo51L4RJ7Cz03iYhk?=
 =?us-ascii?Q?a4nyrc98wu0Np+3N/MFOwJoHwKK2N8CWpFN3x6E9rier8JW3xFRR21IsUZnk?=
 =?us-ascii?Q?rJHWmur6Z/VjMIT/4ftanBkLXbaAMhQCp/bnu8efegWiBLXgzlyj2DzgZifR?=
 =?us-ascii?Q?xsKnrA406tk4U8E2ruJprrcB7jAx4sfcjPLg9L1YGmzFa0q12e+0us6ugD9U?=
 =?us-ascii?Q?lAxjyhhgS/vQfQTQ9zfyR2G9B/2h7QECCQCD9D6fpd3+tHyzVKR35EsbzvTB?=
 =?us-ascii?Q?l/nAa0NQQH+4e7sYpNqyh0uAkTqkm3EfsnEcif1xv/ZKuMeJzRPIhs4INZGG?=
 =?us-ascii?Q?dPtBVh5bRBhEFLRs9hL6X+TwKMZ5Kd3pB48A8G497dKBqYNncQ+eP4VpPgFt?=
 =?us-ascii?Q?BCh2JxvoZTCC5ItrFKZZ8kbDfsq+SPvAX+5yX2suZw7jYSLwhOn5rZgYArh6?=
 =?us-ascii?Q?oDBl5lgOz0X//EeiAvi5SXauWnUpTem1Vm8au4y/Pu0KNBmooCYWpSYBlg51?=
 =?us-ascii?Q?QtlOhwCtM8U14zaLoywHtOU+ahE+wPfQbD+W5BqywtyEUqheNDGsLqfrGCuC?=
 =?us-ascii?Q?ZfSXQ8/gWWBLcq2BDRN0Qu4l1zpYMpu+F8Qcy0PIDnUrpM/sm+3hPBvpsFeA?=
 =?us-ascii?Q?Zf2Uydn77BlP1tc4JJNXPJr9hnTQEuyfvOxVkoiEnjXy+BDyRas+s2EezNxE?=
 =?us-ascii?Q?PPhHCgpRCbv+PYu/KHGBhVSZAl0oN871xhCLJ34Y7NKQFWWrcqsryHT/aa/W?=
 =?us-ascii?Q?pPsI0feG6CL8EzAPGqw=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 01:39:41.4569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a4bd96-af21-401d-6779-08de3dd65084
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189

Replace the module_pci_driver! macro with an explicit module
initialization using the standard module! macro and InPlaceModule
trait implementation.  No functional change intended, with the
exception that the driver now prints a message when loaded.

This change is necessary so that we can create a top-level "nova_core"
debugfs entry when the driver is loaded.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index b98a1c03f13d..01353be103ca 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,6 +2,9 @@
 
 //! Nova Core GPU Driver
 
+use kernel::{error::Error, pci, prelude::*, InPlaceModule};
+use pin_init::{PinInit, pinned_drop};
+
 #[macro_use]
 mod bitfield;
 
@@ -21,13 +24,27 @@
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
-kernel::module_pci_driver! {
-    type: driver::NovaCore,
+#[pin_data(PinnedDrop)]
+struct NovaCoreModule {
+    #[pin]
+    _driver: kernel::driver::Registration<pci::Adapter<driver::NovaCore>>,
+}
+
+impl InPlaceModule for NovaCoreModule {
+    fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
+        pr_info!("NovaCore GPU driver loaded\n");
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

