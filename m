Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012061.outbound.protection.outlook.com [52.101.53.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF603A8722
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 23:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773791680; cv=fail; b=SrRD+UppBFj8SbCVxomHdFykN0DclQhm+RowrVfhI1GHNef6NPz6AasN9zczB2FW2myCPoiqpTil7HRQU+S+qWwwudyUpYcVYvNnRIwoMdihMQNHQt/4H2zsWOXRnXrpKNC77FHV1j8QF5kOItjqoNIDHaVmqzrKQjh/FPwR8Ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773791680; c=relaxed/simple;
	bh=kxB4jvQmS1tiTnmNM6lks0bT+Io+q4NNUUbtzK0KmrI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HBioiUg5Rdj5A5ZtxAFPTCyz4Ev83e/tBf6vyM/T//adtcKk/4/cPzgQCSpklio4cuCwuHm3indJwmXTHeY+6ZtXqQ/msDKjprfXLWojDHzPC2hk9bk6LYO9l40fC8GrJhSwBH30Nfbw7IWGTonISx9ew8ggglFdW0yhITwrqS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZydZT7EW; arc=fail smtp.client-ip=52.101.53.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZydZT7EW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFuo/aRkPVy/V4AuFnO1aXsgbHUHu8XyvvrpXdPxp1yXtkbySKlmZ0j7xQzgWml6yRU20gDdVqhOW7q1HvM881ZFz0kV/jAGYP2Lvu/Z4DzeXS+ha1MpUE0ioCUlIt1fVxjwIKfIUXNPfPqDAEcI1xBEq4abLcWsJ5dN5+CBxVJYemCqKsYhfheRtw/h48u9gi4WKgvSvqMnh+BLe66K/us6ZTbdOlmQMWppQ69eaqQ0DOeUVwme+qJFysY/vGyRy3QS7TNytTndXdgd7qaVm2Ljk6h1A634K82mxU/ng2wzmHJ4gg0TlXM3rY707aTJ1iw3C02t4Uruct12s04dWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lqeYWJThz4fnWii+P1g9YSIjF/I/dgtcB1uzg+hlnQ=;
 b=i4SzIvKHKahQG804xFtXvvM2wrx/AxRyY7gDtPGdjWfsDKiynJ1xAXdukBzad4XCu4zqtSkd5FCrAqDAr8OmxFRk9ZwiN+PjydQr7vyjqvOGW9Pv7sMwCbNSqi4XqsWtP/n0SXTXHGCoyG6VLHlEHfwz95WrbgwVN7L3cFuKAHc1x+4lgfqmdY7hPzagjFgcqB3i98coCUHVPFU/N9mVoeNwpwOPuIfZf5rJEvL3LGAIDjtff1yq3Pu181dbve7za25yTyO/buvf+Teit83dcBTLs0YTQRDX1WUuhwj2nsGJzHUBUq0Z6y6L8fwyQkWxHQjWkLwtBxAZwDvCjyv/jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lqeYWJThz4fnWii+P1g9YSIjF/I/dgtcB1uzg+hlnQ=;
 b=ZydZT7EWr4nj24g4MU8U0HpR/aQxdrS4AKyB2oAYv1C2bzbPbPC+cg21+bB/Y0aw5C8xaHHBeunRxY9Gduha6fmycqMh3aAklPsFivVJ/7sOYQWtiNEtl0pZuBrCMMYBEnaI9WHNl3eIk2dsgK+znTOGbpMYYDlBEibyDkAohFW/MLVb9qCE4+iRPDtVe4Rr0T7j6h6/vDa9EHthDa/fiZ0rVtg8gmFCUHVTbBtOgLgF0+w9WeEEcyeNul48m3EEsfUVxl+dE8ZW116kyqu0Ww7mvVFfrafa5BJxea2ME+yxtS8rHueHzB6Cu0dNYe0aDHlOMApH+hBqz/1u6FGHwg==
Received: from MN0PR05CA0021.namprd05.prod.outlook.com (2603:10b6:208:52c::16)
 by PH0PR12MB5629.namprd12.prod.outlook.com (2603:10b6:510:141::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Tue, 17 Mar
 2026 23:54:34 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::91) by MN0PR05CA0021.outlook.office365.com
 (2603:10b6:208:52c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Tue,
 17 Mar 2026 23:54:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 23:54:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:54:16 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:54:15 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v10 4/6] gpu: nova-core: Replace module_pci_driver! with explicit module init
Date: Tue, 17 Mar 2026 18:54:01 -0500
Message-ID: <20260317235403.1094713-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317235403.1094713-1-ttabi@nvidia.com>
References: <20260317235403.1094713-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|PH0PR12MB5629:EE_
X-MS-Office365-Filtering-Correlation-Id: 542ea16d-a294-41d8-d65f-08de848089ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|56012099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	HtdLACSez/7HyXqPMg8ENkES7pLReRmRUO1weAnLerocSALtomwBPupygVUrzaVvzqcrqDyciarxMb3rE+ZNPNOUgD02DUG4Jd4XnLHwW+kj3yRuhAKyAEr0NpnubiRdbL3T3K+2RlbuI52MBQLWB0WQe3h9HB57dRpXz3T7mbdQrIjLOP/gHeKi+86HxZFBYTGdMzugRiuoxayEHDcp5awXPMGKaMeAj5MDhe9PybIwjJH8i19bOlq7gniYM+/x53gqhV5kDZPQbfG6cFK1eHBOvYtpnjUvhA6wJ1qEYgI7n1DGuhiQThA9/N3W6AJ0eaiFYrhmF8l4DOUq4sSktcsUBxL1JLZYJM1ZfaKd+E+2q3rARnlzKf/3M0vo/mt756LHkgX8Z+OjJWtaGNKsjNv7OOLbLuCvDFEZvSR2QHw+1a+qCGTUzBw0VSo6xNXvZb97WYUo+zheKvhzpeSxp+O4FaMOFM1u7LTtGpDvdR7zG33R6s415UVqJFbSCf6AoZe1Mu1KdkxQ9+7a8d66yf1jizLEf/m/XVF9JqpWT6OJTsKusx02IGUKB/PejRy+2Bep9BiPKDLZ/AWB4dvCvGOfFsLch5JuRXPFmRk+E8WquBodolTDFmOCaXskxYK8g7J70mm76xUd5KXjfyiIR0KWkcYvXPOhdNxoNwTfSJt6QO/1q50t2SM7QliN7Uvh3V0CaB0CIthDAckjcYaFvYQAq5vAR4jMJsSJl87pSZzi8Mq4H2oGZloBFGodmGpINmpjkuFTfRnqtMUudnpuiA0BW7hRU423+Y8d0ivwWqmWrxj5DKFg+HitUCS4R2Qn
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(56012099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	trrYRRSvagcj6eunXbR+179J6rjt3d0Yvd3q1+iSXYlUb/J0J2s5dZLL1gexhWkvTsNAmg7eEEiz1OYWgUmEX3/3YJKI1sJ/y5oQH6vRW0Rl7oaUd4QZG8IhGL/cC+La/v8g8sgfq3VLYOkVmcN9aiCKjy+xJSa0ZP7YjNo343vZZYIPDyzmpIFMPAnQ0Ob3x3dbodPDwq7pAWLT2s6C1lAqvbHJFM/2r5VQs0IOBjoB2byhphLA1XBzTNM56rBOd5A+0AK2Bjyx8Xr4/6lWetig27s9+dQoBgLtTd+ZJadRc4qWnSv1KBJiZpAmIX0TqyPQ9c4ObhSoX4yEyNahgggAMWVuCVqfAI6nYwLaLqs92eKWh3G1qAhATU/m/jRpO72HE8mUcp4dnePhMXlFN/LdChw1+B/b6tE9SbDNZ5sM7JXmQ/bLjIpq7DWBsZcA
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 23:54:33.7275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 542ea16d-a294-41d8-d65f-08de848089ff
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5629

Replace the module_pci_driver! macro with an explicit module
initialization using the standard module! macro and InPlaceModule
trait implementation.  No functional change intended, with the
exception that the driver now prints a message when loaded.

This change is necessary so that we can create a top-level "nova_core"
debugfs entry when the driver is loaded.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: John Hubbard <jhubbard@nvidia.com>
Tested-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index b5caf1044697..0114a59825aa 100644
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
 
 pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
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
2.53.0

