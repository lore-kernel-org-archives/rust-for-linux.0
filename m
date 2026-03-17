Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011049.outbound.protection.outlook.com [52.101.62.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333313A8720
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 23:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773791682; cv=fail; b=guYuAABU2dy7lGqjqjEch7eCb9Fan7VZg04Jkgkt2/lCU5EZh8hczx2wgH6vTHfUulFB2flNT5ylmUgfumXoBXC8TcHuFQHwhyBGu2t9kBpY8ChzWA+iXNttmEfDsQODFJD5T675Dxhs5wNhZeyKbB6dKGAbgxWGoJfnVbKc2T0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773791682; c=relaxed/simple;
	bh=8fp9mxJUwVaUvd887ysseVXL+lR8T+uEsTCaqAGLqYQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DogKTEt5Av5Cld8f+oOvQW800SdNv9A660mvw5M/PUd4psZ3kOOpyapi5GqmWJ8darolunMPFUX63hJJBjoCnGYfpBtCe6FTV0cNi0nXFq72sgtc4sBrRCGDmpLj3q0Po2q30IZp+LQ65puoRiVpV7aIetws9uoOFFcC+8Oltwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sq8lMmpp; arc=fail smtp.client-ip=52.101.62.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sq8lMmpp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lu71wvL/6Ydwxwcij5u8xMvjxZ7EqIxffRL4kcM2dnfQmEQrHkk9K7g/R3gv2EaVdcCEWa8fKCxxzYiUCPWQKnREiYHjPe6Ou48WSKhtODpDB7eivDnKvhPF9+nCrMZC3MUPq5OjeOEUn/Kd8/Z0DZAO0hgDKb2jVeDl0sdQ7yKcxPq+ZRScUWON6XQxi5E7BUTt/2iLIWeqRQc9SsCc/cknWccejRYuBW83WSglnUCHeqe1XLPpTAlz8RCXaHoFU7RxpZe/joO01lfpvZJVTsPLW/BC/KaVVv4qZY+diKvFpPkF/ePQvX2Uqwk8LezRxkn0lWz3cqIR/OVnyDCKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9Oq4zxgM2FQa3HUvRWi4qAZyq64gCaHctJ6Esv3AJ4=;
 b=kZ9hadzBWvWcZkz/7jrTYT641+s8KKN5SCtLug+J+NrB6iZB2LpuGe2YbL5mXYwsOxwzeO+UyFXMIZF8wozRaRN/ETHoMxFuNI9Sxrf0GrQ8j6rbSxMQXo+TnvtvDoGEo3GL0DA4xDiprSaotRI9g2LZVINSRGAWb0RW4ApX3N8T1lmrDlm1Nssrl3axP7lEFAV7vTfyGKJQql5q6RxDuTV14HC7F6o32DD14NlNnmxG16rcAJ8L3lVW++lRVA0OtEmRW0Fb7U6nP4EpV5HbS976TdtTs2vdN/8CCIh+lY8mNcfz0tHck3mDKKsovrqUyQyCVc4KmSAKjw0n3S0Ezg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9Oq4zxgM2FQa3HUvRWi4qAZyq64gCaHctJ6Esv3AJ4=;
 b=sq8lMmppy54hEAz/hw+pUnH/Qh5BaYHnctooWaWilsjp+zF+sEVkUTlZHeWtFqPkhQQZUEnio8dl0n9T62zBaKS/zQW7usckzad+ErwJ0O0IUwOuoelv30yFSwJYlhPuSGoBd2AlZ/ADks4uCHKN3q7Il8iJfwvO1FUn2STYgbOoZkIhE7vRgYfaNK0tMwSQ5YicbAME9KrOZm5VFvHXg7th7hB7Ux9/b/d/tYHIB/5JQv3IQNEJzHng38FVigK+magN4Q0889Dy744ruJEIgNqy3DXTjjm1/NGMXjkQYynYCIrhTcuOhY7Gm1CnToMVdg9I0dN6BIKlPRZH4wezCg==
Received: from BLAPR03CA0097.namprd03.prod.outlook.com (2603:10b6:208:32a::12)
 by MN0PR12MB6053.namprd12.prod.outlook.com (2603:10b6:208:3cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 23:54:36 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:32a:cafe::63) by BLAPR03CA0097.outlook.office365.com
 (2603:10b6:208:32a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 23:54:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 23:54:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:54:17 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:54:16 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v10 5/6] gpu: nova-core: create debugfs root in module init
Date: Tue, 17 Mar 2026 18:54:02 -0500
Message-ID: <20260317235403.1094713-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|MN0PR12MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c8b1842-6903-4418-a6ff-08de84808ae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|22082099003|56012099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	D5uufko0HWoaE01GsZLDX5+BGiRrg4DrqxY/qWhrRmBfHZOvRdxUxszBNcT09/vZB2XRXud8RyluEzoMirEpjXQD6OSR/Rp0HMGwGupN3nfIUJOGUon/8RNr1iEhglW7l5p4nMrpUs7xROmy/yaozGB0KNnB6WB4VbWzFD7rPBhED1YaYrxrkTb3E0Mb7cXke+YEuisetNVz7WIizKhaY1c9DAsKGZHGzp1Cs0xih0teIiyBASTQLQWorh6io5NHnLxXZwu9cDBrIpqaMSG73i8D474Z0CU+BCkAx3VrT9xuWfmsmXPDjDDkucSpf4+ZZtEytWu2UhfzCzv+lWAOJQxWBxtzVLYcFGwx8toMCSpp4R2MMihj1whADhc+AytLCr6bkjLGe4pVSSm2Vpk6qTTvHeqGe0wA+UO4xhncOMmwMJ9s3CmGdQykMuYiRTSTXSbW8ptqk0l9eVjkeElV2h4cJfxrqB6ADE/+491rbWbaqIT+dSIPHlkvWW4dwnSp4UYJht2PJkqEYoohY8fEoNNtR5kXp5q0VTDIC6Pdy4fkcKX3jrF28NQUnSFqZJ/n8Ox4Ifu0RzsA8wV215JCd48Mwcccgr2TGe2um8neS4iX2LDEd8lNM2Tv1Q6nL/Bm0YuCreG7sYvN11HyYVWL9yAUqpS9WSKf878yrOt74GB2keIpAhSYOxFxdk15PFukuxQV/kj5AsvUueraaNP7Q3h8JZL65oEKppG5EeiHAmSktCqr0vMTA1QKIkiOjFeaOycQzRIDKynuVw2VbCZ+HWQGo6EgbN3InzgE4vvb9/Q0qmOVi2nqm4PXGaRXc4Fu
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(22082099003)(56012099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SxcFvNDJh57GxHHJcJVtCLgJLFr2++3Kli+L8ZD0vRdgzXUsUnohVYsvcZXShIxKjDgEwQRyEEgSBKPPSDeZaX1HNwda1Nu0x95GppN5LpHHwWU7pqDZxRiU4Vbhst/dwXQ1PDTTS8ogHKxgDOrbigTwPGER6DxfoD4B1akMesamzEbppxFYb+EG+j5iJBQq/SgEdHe2NitjKkHxjp8JcegztNVP3drMlBgMfXN8GqHPuUKW5La0Rd6pM/W9UDgNkvqvkeZwgfyuMWtlp8CNdGgF/xsNZVgm/lyHaUNOOO9Xc0usOyljDWTxye/FWVBewvmTm61bDQOplOlEcOL+9wdA1WSAxM7aL6o9DpqCiavAgIJnHqnn8dT1mu22nhCQ0BGQ2dXsYbfX8pBDAKHC1yKMnbL6zCFfxMy6nUv6/wee99l5ZzuWJLDHSXGRp0AY
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 23:54:35.2044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8b1842-6903-4418-a6ff-08de84808ae1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6053

Create the 'nova_core' root debugfs entry when the driver loads.

Normally, non-const global variables need to be protected by a
mutex.  Instead, we use unsafe code, as we know the entry is never
modified after the driver is loaded.  This solves the lifetime
issue of the mutex guard, which would otherwise have required the
use of `pin_init_scope`.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: John Hubbard <jhubbard@nvidia.com>
Tested-by: Eliot Courtney <ecourtney@nvidia.com>
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
2.53.0

