Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011014.outbound.protection.outlook.com [52.101.52.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C9C3F165E
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 22:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180055; cv=fail; b=tJNQM+7dq+/c+MYPzbpfk8oM2wudRgtJ8hDqmsibWiqhWWt0Bv4ffR/RgvEi6T/d6Cm2tnKEePQXDr0hfa9S/3CmBYgcIOu3on5whl2DVZq4fCiIk5G1fooe4BK5MNyW/OXwvDyQC80yLs1/L9UeQ5FE6x+Qwx576yCVqg4eTXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180055; c=relaxed/simple;
	bh=Io9xDb+nayR6uZuPrdjtYJDMyg+r5CJbsIcHiyTaTBM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=msoxsSp0zrXuiwogFiAcT0Ai94RYibu6J2d/Lv2Wm7NW+bStXLqfndWDMgiZrNxIqyq+RB0J0QLF0swtIBb87rKnFReeNmkdbvCl0apsEgbzL+KCMMbdkLLMPCv29GDaT2mEHJlh+64Mjo8BfCP4cWMpAeZXNTPapCOAlyA7U6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k7n+14Dz; arc=fail smtp.client-ip=52.101.52.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k7n+14Dz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixxlxLdMZcTsvXs73C+HlhK+dVCGS2879WCEk7gUqcMVOcZ8NP2VXpfUvlyyTPDzZDSSD8D3KimPInHS3yOuUF/WDdqiv/7I4k8YtfHb+P0J/+8wUeVWpVrx9hulZTeIzKxsx22IU3jS5yc5DMwkgnlTrA+isSJGPJdL3TQJYbjEvqqNt/tMH1BBW/AqquoEF0vZ4iOVjquH9wj3CxFQGqEeAjEPGWKA+06DHRwEViJWN9tVwFAE17tMETMqGyh+ARH6I9Wx4YKw4HsdO+4111njiCG+epYn5F/jp10hs3DwzLR2NLai30yY1AoQ5bw7NktUz3GEB0ViQ+CM9VVQpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfZuDqQmfS00+LWHe08raho5WkvF33z3/O3rq81G4gk=;
 b=dTHbWYni725MZncZX5hJIMqWR/8Yab6PhWFHWKJ9tPpipMGvaqiS2H0coi502+gb70t7LJ4d8oiTgYasJnwpqmD/2OcugPtMj8qDPvfyvs2eqJfcpesZ8HmjZ2ATrLfqsYGL+wCUZe77prW67o8YjQzxupwMlxge5aCr5eOSShB/Pst7PIbA62r8XVJ0O7eJwAO95Hp2OM6Cnv6bE/4cjTzzdshOLINdsbk5IB8UoG7P8T31oGGLBK6Fkso8/BY6BueFhtr4Jl4NpSKTX7F3Jz2rWC3ex0HiCF289zOXlScPIMogrIXoTx8dFyPipoC308ftGI6UVLOoUfol2ENOTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfZuDqQmfS00+LWHe08raho5WkvF33z3/O3rq81G4gk=;
 b=k7n+14DzkRnUFPYGzNkBLHAymotad88AvuQF+KpHdOvCypamNKUc8XeGshwkQRAGxnJPpNfRVIlbZKTEToiAWXbr4ivaboYGur3G2C5NzD4PwG3gvftTf4CnDc0gpwX3BNHSDBoW9VNPB8JHdP9ozaliB7rxa3WWkp3MBWgvP9dgc27+h6ESQDGef0NP/ZUIq42dTwdzp9mnaoqki4VsGk1BvGkaECMq6GIr1ixVG39fpZOiPiHy8XQyV0ELZ05IPB7BjnOw2yZc55x3qrYvh8McHvth6TXaOg21HQxZI6Rp4d2weQ3mLgDkkxZ+2JUzBmy1sGfwVi1HwAayvmEnXw==
Received: from MN2PR07CA0013.namprd07.prod.outlook.com (2603:10b6:208:1a0::23)
 by DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 22:00:47 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:1a0:cafe::c4) by MN2PR07CA0013.outlook.office365.com
 (2603:10b6:208:1a0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 22:00:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 22:00:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 15:00:22 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 15:00:21 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH v8 6/7] gpu: nova-core: create debugfs root in module init
Date: Tue, 10 Mar 2026 16:59:59 -0500
Message-ID: <20260310220000.1897166-7-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310220000.1897166-1-ttabi@nvidia.com>
References: <20260310220000.1897166-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: cb2ae8e0-73ea-4609-a352-08de7ef07bf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4acBdSEO/lnHoY8QyyfE2tkeK/iOBaCVN+cOmZ8cW8poGIN4JHcKqYCkppH2jI39zlL5+xLghhUomaMq9iWXstjXUrqgkJ1e+zgDQtmkcSbJ9ApSsphphJL/o8IIyzSZoJ3pr/vICqVVf0+czPxtoBjO08X/lnOzAievjQy1HVvFZ5e+SJCwqc71gRMAJKAIvx7rHpIyp7pbMqWfdFIHNMC5tpJ3Q4pIbEqNmvvPcZ6dlTAhsiLA+ARsG6IP9REfdEZzzWyXw4Y4FYl6+suS1pMp5Latg4wqRfgUp3QhYaSrN6Rs4kIe5ce2Kq119BHvuYdTkrKp+3XTD+vycaVTo5NCR13U5ycLajpv8Pq9FrqVohgw6H0JpWQrF3YRos6Y8+Am8sfVrKTZ+M4kbw2V+K2UAGkIje3AfvL9lUt7IKtfXzx1k31LHkPPs2wckFropdd82XNanQB1SdPHxGE4+4tjTTiAoqGfZ2QdGLde1D0cGap9xjKfWp09fH+Nhr6fDY/aF3ZWAbF6lB0hQiu+HQzrPj+3V/5aK5K6dRieJGODdGTfH+gZRVyZAX/Kpt53qSASbrXsOueDoD/w7PZO9LrRPr28vuzOP2xa4f69DLt10xdJcLFsFbzDH9VuO5td0keq3zd599bU6pz6HXGCaWGGM49QK3ppWqb4N7GXpgi7VJbPQ4EYIX6VInlqQIWuzEgn3dEh+3BT+72OJ9FqrH2QTiA9xXRcB/LDQ6XjS0gijkeb/4Rk6pFUCIxtRqMd9kGwf78VyT/4302f+9lGGA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bAl/DO8YzCU/00W126ZMUU1PaGet/Aq9W84j0FXNVkSX4K6wUX5wE+I8dbIx8paIio9cuMg+OFM5GoVXHcvpJugp6J5QFqbD8od3d6PJuBhzkbPEygFrddfOulLdCB0RON4zb/5/9BQ5QvRr2jhAjsmjZ63FzzqdinuApHy2zYs3tv9CCRW1i1aENiR3y+EbIVKgBo+CNbu7LAbGwO7h0wwk0zNSCibUAVxFjhsvHF+8mnILqZ3IxDv1+T9dt7EHvUY/BEP8uHJi3SHdCxyrCUHs1lv8l59DPugCee8CByIZlW6LRnCP0GUjDQGJ0Vxuq+FNiaVUun4hMXZ9mf0X0y5nYyahTCDlEWGnGYeSqgw+klzcgrky+QTMTGZ7VHx75qa9inR1mx54k4ajpryKGUsI1unmA4Ncab70zwE5QFFCE565bQa6k8qXA2l355BP
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:00:46.7913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2ae8e0-73ea-4609-a352-08de7ef07bf1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888

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
2.53.0

