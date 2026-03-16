Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012051.outbound.protection.outlook.com [52.101.43.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918DA33689A
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 05:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773640696; cv=fail; b=djrRnERbyOn8juLwum8oHTZBjnJ04eMkugthq+mSf7IElB/BzHkQ7LfEkQILgD9niHAhFqeWpdfE8nf7jjadRF2ODecWmZZ3JKvIWcaWRkqP4PjsVHaOThv7GV2EHCYGd67PDCmHD98q8YLcQKNTyaY5xrmmzjtmouYBvefYjpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773640696; c=relaxed/simple;
	bh=u8TSc8SVLFWVRvm1Qb/fHUi8xZKK9B8rObrueNNR/g8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LAz14fj53+XRPjRHshV3qZ7GrT0e35/h2+yaflnsq+1XnqAKGuT4M3nmZcOgRTWr03646MyF1cjQ+wicBmdD/9ble5ozqhy2Ao4av/QdkX3WVeUA2F7s5MDrKCsaU3wQYy6XUss3bstWn94INqFYqu3LYbavG6/RsprInkfXWOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EVpt8fdm; arc=fail smtp.client-ip=52.101.43.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EVpt8fdm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vN4AICXz1niRdECxr35kVgIfKHdXP3oG8EHriCabrpHCf3JjewKVKb8N2DGXwQ67ZW+1UEEOXD2bT6yQoTSkwtTG98Sl0stIsv9hEQfKpZQ2rbqrlSF0k/2j28Wz/boCXHXyRigv7GXC+WlwX2g/P6/sFNLYG3OJDN1kyCYgEYQlRw2sx7E9FicPu+8IvHyUmkrmQkEf7S4n7bqW/5+Cvoc4SQWmRWfyxPLZJPYJui/SnysBwxCpt5AmDdSppfL93yZQKkY9wgE63N8cHDovestcwKaxsmnT2xp/Gi2Bp9ZBnU25boyPCAocGfIv5bUuuP1BOi182LevKjtSgV9R+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96nH54gGK0CYjDhGFi/T0+iysnEoTRvsWcsd7CUfttw=;
 b=p56jn2cSPAS6DkPxcF766gfcP9lKput4HndhRoFhcO731SASt8WdlzZCcuIxmVmHMyYWv4c5b1SpcodvFlgNc57h/NqdGypQEM3ee5/ohhwxcHbPg1LIkBcHn+VPHhR5Z9pcBs8bh4zYVH4NgTwv/YRzMecuwWnt8SrZfSUMHmJGO9K1atEmPxV66PkWr+h5FFSd/WwL7CYIBmZa2ah02ArqvRLbn2CJIYoFqTU0BKnF7ir3Da9TVeqoRQkYHI7I/V7A8Mhcht0xbUnh1HTXsyZ5T7pEDE2Nm70qZ3yg8HtzHN9b3wBeeqjqgr8Y15D8wySAy1V2FIZd7vVZ46pKkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96nH54gGK0CYjDhGFi/T0+iysnEoTRvsWcsd7CUfttw=;
 b=EVpt8fdmDdlZM079NeQlYjVb5tg9fQzIr4JQipN4eY8gM6Ndc3J4lLCvQtaOZ3divM7UrdRmL+uAVNVhZS4VbcMWf2exbL4iKkrE0HMOU8dqJM4klXUsTJmsXO0XHkE8I02pQQPxXi7twGimJQ4QBTET+0LJQlHzp1CKnAL/XDUn76OhQyRbeex2oLgZb2wcM0xsGlMFwqn3peG9LZ8D8YXXda38waKCqYdsU5a2Xyf8H3GgdYUGdKw6pPX5N+3rufmPgsDtn9MeXZogl48ZBtOsUyu1UEvqAAbTIJGkqBggZharhc5QtvTiZUxk9cefSItovgEWT1oEdnNkhcabfw==
Received: from BL1PR13CA0435.namprd13.prod.outlook.com (2603:10b6:208:2c3::20)
 by PH7PR12MB5760.namprd12.prod.outlook.com (2603:10b6:510:1d3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 05:58:10 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:2c3:cafe::5a) by BL1PR13CA0435.outlook.office365.com
 (2603:10b6:208:2c3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 05:58:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 05:58:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Mar
 2026 22:57:56 -0700
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Mar
 2026 22:57:54 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH v9 5/6] gpu: nova-core: create debugfs root in module init
Date: Mon, 16 Mar 2026 00:57:35 -0500
Message-ID: <20260316055736.1690546-6-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260316055736.1690546-1-ttabi@nvidia.com>
References: <20260316055736.1690546-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|PH7PR12MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: afcdaca8-80a2-4f41-3a49-08de83210092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ns8zQz3qfqCSGrRUAcPYNOeH0zNjXp6dvDkxN+hG/OdZ5x7aBqydQdSZQl2U2cJKEnrBTALLSNKSkgGHVoqfNqingIqmcRwXw4gAWKCyTF77uzAY7/DO3KFJFDJ9E5LY/FXmB6yX2epOb6UA2yjOAbb3oe6eqp01OSeqMth5n1QEdtNI2/RUDvBA0jNvEUSXbWAYYUGenrlNFASreioKVAPN0+/OToN5y1GrPG62IAoX2SDR0b6IFM23YfC/XJ4fkUhmeL9isPT4gtj+/TFEB6GU8fL9wRn9fOEzkSSVDoHOd/kvvZRzYPOXPhtez5Bdz5K7mc6ZNiR9AXWXaWc9jLXNwCTvy5+pWcUUH9VVyumM9C9AbfGlk6tcAxwICoipPR5tAI2NKbu992pZzVTbBr054ybMWM7V//UobgBlyzaSA4EtxpuaVNScYLy7+ZmnGuETFRGY8WtOsv5ShqlCCnl7MvUKDQa63nDG74t1eYTbsNed7PnoIKMPsCu1EOovhbQ1RR/hAKxeQd1RED3KGrK7oAcGcE3r7TRber7ffDfT1x5dvsqMcn9s92e/e762xuhfeN2qHX8H+dz3LM+1OYCMr2SaaOvgLgG2B+V1xMnamMHFrQ/UVm7ODViDDDoxUuiU+qzjviiDFWfi1dkTGvaQ3KFzlXEfhdol37dqkmEv+41CwKfhZU4uiW5Po3+UNsnddId26ebCmAfoxhc7YADR5RGRuIdtPf2rGaFHTW+eds6vs/V8diQjnI474F3VQHjoFNSgNI6kXDMVEOSDJeEuzv3K35AdAieYm/x8V9p8Lt2mnd7lcBjnfOFpca8b
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eKsihUdf50Tt73s7CoiKcRLvF0KZHRzIzfuCLOHFEVk43LjXaLNrRZ4Y41+9KcMhLA4S7NxzSMPXIfWPNla5IS9yxrOJ8YC9JT0wveSZM/xgnl1EWMdAhVvpwlQiw3IJXleN02QEq16R/gVSXlVU5UZyPbfmoIz2qOhKyDF0mGsGh75vDrkYOZv0h6Ei1AZGwXtMJIsk6D/DlrhHXCZpoW0sXFOK6mOyIqxhMRCqxjKzIcAhfXUuQA5Dcp1PSYl2pHyFU6HuIXjyycfpDNi5ZWRGC7y0Id+CiZegfxlE+wSV08XZGQxJUBJIBuLgwj2fiSgx4utdmZcmYhiG24G2RA8BRHaPWAtjOiQ+iLEbf6ThFcfiOPIV5BritLEHN7mPtwpOHC1mrj5EbpSyfP7Zb8ztvkTf8zTl65imr10IemT8ynVyKY0ANQLbbYTkGiSI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 05:58:09.8042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afcdaca8-80a2-4f41-3a49-08de83210092
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5760

Create the 'nova_core' root debugfs entry when the driver loads.

Normally, non-const global variables need to be protected by a
mutex.  Instead, we use unsafe code, as we know the entry is never
modified after the driver is loaded.  This solves the lifetime
issue of the mutex guard, which would otherwise have required the
use of `pin_init_scope`.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 0114a59825aa..b7e6c6274aa8 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -3,6 +3,7 @@
 //! Nova Core GPU Driver
 
 use kernel::{
+    debugfs,
     driver::Registration,
     pci,
     prelude::*,
@@ -27,16 +28,40 @@
 
 pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
+// FIXME: Move this into per-module data once that exists
+static mut DEBUGFS_ROOT: Option<debugfs::Dir> = None;
+
+/// Guard that clears DEBUGFS_ROOT when dropped.
+struct DebugfsRootGuard;
+
+impl Drop for DebugfsRootGuard {
+    fn drop(&mut self) {
+        // SAFETY: This guard is dropped after _driver (due to field order),
+        // so the driver is unregistered and no probe() can be running.
+        unsafe { DEBUGFS_ROOT = None };
+    }
+}
+
 #[pin_data]
 struct NovaCoreModule {
+    // Fields are dropped in declaration order, so _driver is dropped first,
+    // then _debugfs_guard clears DEBUGFS_ROOT.
     #[pin]
     _driver: Registration<pci::Adapter<driver::NovaCore>>,
+    _debugfs_guard: DebugfsRootGuard,
 }
 
 impl InPlaceModule for NovaCoreModule {
     fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
+        let dir = debugfs::Dir::new(kernel::c_str!("nova_core"));
+
+        // SAFETY: We are the only driver code running during init, so there
+        // cannot be any concurrent access to `DEBUGFS_ROOT`.
+        unsafe { DEBUGFS_ROOT = Some(dir) };
+
         try_pin_init!(Self {
             _driver <- Registration::new(MODULE_NAME, module),
+            _debugfs_guard: DebugfsRootGuard,
         })
     }
 }
-- 
2.51.0

