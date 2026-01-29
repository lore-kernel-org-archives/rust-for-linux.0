Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010018.outbound.protection.outlook.com [52.101.85.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D6B3563EF
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 02:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769653753; cv=fail; b=O3H2bJ+Z+iPrvJTIYINuedPfT2+pQaywC66tl6yQx/rRsCIFS77hcAT5StPdxTi0CD7diqqQWVezhomJC7lTRlRLlhTASe3sT3Fd43EeDaJNxvKZ6myzSPqsGkIQjZRXWVQ7mVmOBCg7Z4XrXulrahyBei1otPF0A9RfwTjV62Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769653753; c=relaxed/simple;
	bh=QEwOlxvLRyo3WADpfPsBhniDIPHr0H6+MoIYhMABGYs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aaq8zBodCWmGdPhDJkWDdbqCzTYuC+DCiIWlRp8cVhr2hxULOTRtEYUDDfywUDj6Sz8k61DTfjbOoKvObUDeP97je6x70r2SBdgmJ2kpryBgNlsEYWG1fV07p9/uL8dIHC1lHCJahDcKG53d/nsmUXjFMM3lf0E1jEfw5hlPFhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dJ/va5Rz; arc=fail smtp.client-ip=52.101.85.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dJ/va5Rz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtWywrrsa8+8kEJ4jETboE8DTh5i0kncEt/1D3jF5zo6U5waEyqLO0uiPfTVP+mH4WARyyj32PsGLACaJ2VMMwN2vUIjbNjAUZv4/pAQHoWxrhUoMbDMnpiOni0stkeBzkhlzBnmjj1s6mxEMdfnfR7Mqo+FIZYDz70Bm91CdPBR641Tp3CetTFAcV1sx0i+ONkmrjWsEz0pr9k/5GqUAuYckMw/ZN5GWdeQzCOA3vpFX251yHi21bH5FameaYXxmociTYMixIqSssi/ng1SDYxsMKUWTLglmK7RY8++s+0ZkrPRXdPdBgEBab0YG0yL3Zr3V/WVYYfLYuwypuwK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OrhbcCB+GU37wUdLhUWSseieN9c9iOwjjifrYx203w=;
 b=AXqXBzoSxV7SeYx2lHiuYlLTKTM53ofRwFwbr8mK2wQrsIIzSnL6UKtsM+1fStptANuYt4Gk1s6jJ00wH6bVffp7pqRkJq2wBHbRlZ3HxZnl1SAZ7y/+J5729WAG6iD1nF5M+Afd+IwPQJSeHRo+Fq2mM+4aQtjp+8g418faY34ICTPNCsLLW9OUyY1Gyq0cuMChaTgOZ9jR5R7wvhVG8qgwgpxNNNnmgsiB+e0b7AdoaoBRUueAkn0WBRABjqLCVh/PvVwxKtWKHjnlX5Sl9C3NaizzhhedQgQMOXR3IFEal6/TrYSwZsBgBcb4j0gSCyd8XQCtIy7ffhqFQysk2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OrhbcCB+GU37wUdLhUWSseieN9c9iOwjjifrYx203w=;
 b=dJ/va5Rz43KJgbIxHE0LF9vn4SN+C6r6oPXFX/wV3tGzOMS6emdPJD/doFApHO/giacFV0Deyo+GG2eZtPxIW16f00Qb40BV8THnqCsTMO5CGgrjdOzv/84I88Lt0//srt6LJbNdXAXcxSO/XeJT5MuhQjI84SBvC9vDjFHJnsVs5BljxXK0sJ/+23W91mweqgS2gdPxwTV2L4FhAJzxWs2GXNYLHDYs7dZz9a8IEzh+dULspc7vi1H2wrtZDZBfYYZUnKrCkTADL32MBCnVqWTc15GDzTSssOZ9fJGmIUqhJtBpdAhxKU8NCAxeZUuVw/g5nWV0gTsLC8L4L2ugBA==
Received: from BLAPR03CA0086.namprd03.prod.outlook.com (2603:10b6:208:329::31)
 by BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 02:29:08 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::23) by BLAPR03CA0086.outlook.office365.com
 (2603:10b6:208:329::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.9 via Frontend Transport; Thu,
 29 Jan 2026 02:29:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 02:29:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 18:28:53 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 18:28:52 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 6/7] gpu: nova-core: create debugfs root in module init
Date: Wed, 28 Jan 2026 20:28:36 -0600
Message-ID: <20260129022837.4133832-7-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|BL3PR12MB6473:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed23fba-474e-4f5d-f6bb-08de5ede2e29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VJTtiRrlUe+u0BPH61xmKToeK/bM/jco+0uKXXGKqlXGFknI9o/hrUKekhcE?=
 =?us-ascii?Q?awjfWXCOySt6qAhHSZ1e6HjVPNVDtUhUBGHMUZCxmHEA/zJCbD506isk+G34?=
 =?us-ascii?Q?nR/u3bICiTihpofWdIz1uOQZ0l+PGluDLYsapD80P6NETg9PNlFFhhp6IfZX?=
 =?us-ascii?Q?7BSbFnBXiJHcvp8jQY6RWZPh8I8CL5V/4C06UI1Ym7tv69tqDYoESgLoBsr9?=
 =?us-ascii?Q?s070QbGBisxo2m4gUT+p217DtHH2AgcjIKyUb+WPN5JVFnxDtmoyeCGzYPFk?=
 =?us-ascii?Q?FRYmA4tPvBqrSGWnV6AzJcFuypGSvFOj+6v0bo0yhzmuEfvH/7VZzew4rM2H?=
 =?us-ascii?Q?x+pe5SrmRdbD7WentCfw7oWziDoz3vuRIBezqsFw3Mtf0STNfdsDegx7pp6A?=
 =?us-ascii?Q?kRn5hVqNq3SF8CdmBpV6DiDDMWKf/l4i3xRpNXH+OdY/5JwhrGVi3PtFeCJk?=
 =?us-ascii?Q?w5Go4GxHajAnTD55NCPaNjeDojyC8w7dvz4Tv3ZsLwcTUmB5YYMH3vl5ECSQ?=
 =?us-ascii?Q?eHT63tqUrfvaHCZsztYL6cbk/rfNCNE4m3pCSAzhE4JtkHzD+7aWIwZqGYy2?=
 =?us-ascii?Q?0BfBKwA/7dX+zbHSjfFpKbZQs6A0IYGRdebenwf+thPgIROlqiZqJgg5MVRQ?=
 =?us-ascii?Q?sOk8hUUputxeBFRr4D33U1iRCrqXprewoBRrDb76hg4ETvIoVFpP8Pizry4H?=
 =?us-ascii?Q?Xs+/w+ZMxuReTldNBUcHkcJL82oZLiBR2id9XT861Nr7aSsSOS8fqLVZ9Q1Z?=
 =?us-ascii?Q?UxGTyUlrAA7xddWT+eZS99kgyerQ1cu/6EXYowsXataYxu63pQoFZFx4Ccrz?=
 =?us-ascii?Q?tGtutrmvpKP4Zw2ydazDpG0jh6XVfGPuVXIkmbDS8FfdKGERWH7RNLBNrHo/?=
 =?us-ascii?Q?Hp+wuH02kGZmIEw8Eq/EIeWAajzRVj7HugblXN5RSY4/FWUygn9TQ8eUhxLU?=
 =?us-ascii?Q?wKXJERhZd/ZNlqFuBSbK9bDaUqDl5f2YK8tH8LfzG7UZ0mKwYKcJrOXi7Hxy?=
 =?us-ascii?Q?T1DZ+CHFRCrmfSFLyE0xJHSlJndNbdDuLl9UCrCAjDlhn6NUn9uWBHQqN+hZ?=
 =?us-ascii?Q?GogitO9UmKP0P+SPHFJYXJhYbWYz4SaqLERSqKMI51b0084zdoIsqARu0tAA?=
 =?us-ascii?Q?GzsDgyaMjYoqVbf06PF3zUlpuigQvLUvt+kzoFxQLZrsOFOO34SeEshgXfiG?=
 =?us-ascii?Q?BgPvObHc/hWhxxQTXxA3r0DOacaIQIZz3UsIHdHiVYTokWAKSgA8nRrWQ9iP?=
 =?us-ascii?Q?qKpYI5umQoedoy7pjOY23HykMM4H1VgT3Z30nxUvdjgmctOAceqb+Pss6qTj?=
 =?us-ascii?Q?PxTO0rUIC1oW1HZXT/C/QJ4eOVJbY0uwzyfRZvAemkKGjB6NAtfJ+Nd9WKxI?=
 =?us-ascii?Q?tUPGWDx9BTk3nDmhoocsvKNwDDXJZJME5lS9lE4haVEiOgjAUgpFdcjfVdq7?=
 =?us-ascii?Q?gW0FnejlAE1nCqJRLZtaxkPrjybAj6tsY0/cFMttg4JdPvELJRghGYrVfbmm?=
 =?us-ascii?Q?zlZmyT6Ud1TUEdD1/S9B94UN8SgjdFXMEEqNec0N8Gy9WuVVi/Gp2Mj+o1BX?=
 =?us-ascii?Q?xhTQFvEXMMlRm4oKb1pbziTsNU2A0/rKqmzimKMwAPLGI4Mz2P1ukIu+6YQm?=
 =?us-ascii?Q?Nonttu/rRFJYCfVNY03yDPnDDGyvdbio+l7aH9VrIKyM73O4Gu1wnqLNfGrj?=
 =?us-ascii?Q?EJpl8g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 02:29:08.1616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed23fba-474e-4f5d-f6bb-08de5ede2e29
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6473

Create the 'nova_core' root debugfs entry when the driver loads.

Normally, non-const global variables need to be protected by a
mutex.  Instead, we use unsafe code, as we know the entry is never
modified after the driver is loaded.  This solves the lifetime
issue of the mutex guard, which would otherwise have required the
use of `pin_init_scope`.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig      | 13 +++++++++++++
 drivers/gpu/nova-core/nova_core.rs | 28 ++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 527920f9c4d3..974c5d08f6de 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -14,3 +14,16 @@ config NOVA_CORE
 	  This driver is work in progress and may not be functional.
 
 	  If M is selected, the module will be called nova_core.
+
+config NOVA_CORE_DEBUGFS
+	bool "Nova Core debugfs support"
+	depends on NOVA_CORE
+	depends on DEBUG_FS
+	default y
+	help
+	  Enable debugfs support for the Nova Core driver. This exposes
+	  debugging information and log buffers via the debugfs filesystem.
+
+	  Each GPU will have an entry under /sys/kernel/debug/nova_core.
+
+	  If unsure, say Y.
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 80ecbb50ec82..582b03013ebc 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -3,6 +3,7 @@
 //! Nova Core GPU Driver
 
 use kernel::{
+    debugfs,
     driver::Registration,
     pci,
     prelude::*,
@@ -27,16 +28,43 @@
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
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
+        #[cfg(CONFIG_NOVA_CORE_DEBUGFS)]
+        {
+            let dir = debugfs::Dir::new(kernel::c_str!("nova_core"));
+
+            // SAFETY: We are the only driver code running during init, so there
+            // cannot be any concurrent access to `DEBUGFS_ROOT`.
+            unsafe { DEBUGFS_ROOT = Some(dir) };
+        }
+
         try_pin_init!(Self {
             _driver <- Registration::new(MODULE_NAME, module),
+            _debugfs_guard: DebugfsRootGuard,
         })
     }
 }
-- 
2.52.0

