Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012059.outbound.protection.outlook.com [52.101.53.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F16402B92
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 21:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773955656; cv=fail; b=ByVYT78n2+Ai96Ou0KHkuCjrsYMlVLlzIlnXUETK/UhEYvmZ2ZWp5IQjDIPM3Ic/YN3cgeMdE1lmWj4SkKalvF8e/ixnAYr1ZxSjiOUE1vqIWQx1FAXfIN+aBo5Uv7zuQDdXjDm6z6+FzkYZCwrP7AJ8MsjbhP6Abk7d7YjENng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773955656; c=relaxed/simple;
	bh=FjAPQe93DdNtNsx/ry4nA9dD0YWbsoIl3TqWxOYzyr0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GM4Fkpd/CPDhug4s6yGEXSgz7eti9mFX5HyYQDsUSjvrwiCvQMjfRh3u0afg7D/PdsYk0AIshzr7ToW7z+oK0ZcBmLuKphEEWv6OVMLmU2fFzuQVgtewIfcqEMf7aoI8/5MnpOmTS/6BIwMez+MOVJ25FDvA/jY8l7Mhpz7rc30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GvZFPnkS; arc=fail smtp.client-ip=52.101.53.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GvZFPnkS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UD9Bdw6m9LgBeZX2msdlR+L4xXjWNXpSIAo1NrUdk3BvUypG8rPf+uAKPO0jMGYGv6A91i+SH6VJGiWPH+AnqRI0AxKhD8+HGd3uyyiOOltitVVaZMBTxE3CvaLVhQRqvtyL1M8WVGINr+idhdIA4tB6uNIZV0L3srYs7hcBDegj6REXtAV3ka9LYqMHOPZCXq8n4V8q+AVqbElHXxU+FFRE8CJt0mzY7XpZ7pB0PS77SRdugYncBEWvr6qz8qqdbc5XqJba2PUGG2FO2IJM4ECOPf7X8qy+cYzyVSPZF4ttNw5rWROFac3xX6ArwsyKmBMx8zKIXOOtaHviLPk1Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBLG4FeipaK3q66lc61a70SfqSLvtxxmweQsi3vnXaw=;
 b=Y9JOMtYnrAI1nm3K+V/C4xDNXrEYu52BnlYMmUVBFixa2iyBd/Y1Ksnzq54qD3se4IpZDZDZzactze3bPiMSShaZNcQvZGRP8JL2PgqM+I2Zu3/KLnSFxEyDioKD9srjzUsSpuUvOoZ0zDppkjPFAY8BzV5M454YihlGWBN1tlJGTc4pLAleQ6Cfoon/hg8vIqAgJD/1ZTfiMwt4+0LNULQHnX+re81g3fo5Wu+X9jDrqXz+CZEgI5zb7P8tXmSHNvyZRQGmz0QXLYLTXHOZwmeb0+HmVeC4KGZse/gdxdWfVBaQ/itwdkDObY+RzEbIGSy8jpUjpyC60IBUxxGUyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBLG4FeipaK3q66lc61a70SfqSLvtxxmweQsi3vnXaw=;
 b=GvZFPnkSvh8OCj6TAwsjdUEEFHIzv/0u/cky+i7GcQCMj4q/dGKHRf8LWgSzshVkBnGfh4J2cMxLYndFn0yts1bwe1nKaTeFP3nF6YIRKPgtbENbslX7FN06GXfRn7gW6u2agInEZjEdky0zIWIDcAPhn/njUs/Rt87QTGiyd+QXDEg7yy4TBE4YLexu5l0Rod4eciQlU+zP83uJl34sBuLym2ato3uuAPgKBRtuXferX1y8WPi1m/WCIxW+Vf1qOJgyumyFNGHi503s5fTTKQMRn3AfLFBE+Nq5bhk06iZD8OJgCB+p2Ley1TG3lwdfuOcyzR4zX1YI0Cu2hXGX5A==
Received: from DS7PR03CA0335.namprd03.prod.outlook.com (2603:10b6:8:55::34) by
 BN7PPF39B20C1D8.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6cc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 21:27:30 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:8:55:cafe::7b) by DS7PR03CA0335.outlook.office365.com
 (2603:10b6:8:55::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Thu,
 19 Mar 2026 21:27:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 21:27:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 14:27:15 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 14:27:13 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v11 5/6] gpu: nova-core: create debugfs root in module init
Date: Thu, 19 Mar 2026 16:26:57 -0500
Message-ID: <20260319212658.2541610-6-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319212658.2541610-1-ttabi@nvidia.com>
References: <20260319212658.2541610-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|BN7PPF39B20C1D8:EE_
X-MS-Office365-Filtering-Correlation-Id: 330e391e-8808-4e10-bb1b-08de85fe5376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nVyW+5SdH+MZRa7LT6NIxbKUc1+yMCnIPmYF3aRZFsYV9VfWaeeZFspQh879xTOZmnEws7XzVI9ZIxW0niaIFdFStdEZBW8K0QsDCjlzsGo3SrzJWg5p2S+MPG0LOrJXYQK3g4GyRVsLMVlWGG/xT3/6nm9tLrEVqOAlHQeBi2JxregCjg/EBRSZ8nulIFm6VPKtGaxYgMG/n6SpuJHHgQHfEEmT0PZebGZWm+Af3GmD7ZCWLSwQHLsK9pWnUrirQ73QhPmEZvGZiIJhM4XX4ARq4aJaBj47mDa9BoXwcGr8VB7uGizf71YL2SZa4S/u6K9GtSFczzvvpAxYsk7VtxV39m3QkoLYlxXoU57N7XBLLrCzFSev108D5xcD2r5QDcstAHQGJtfnhiXF7dJYOegXYOYlCClU109i+0mwzu92bvVefBFNmEwGPSN0MxyTD2KIXeEX+M8qlj6gh1jsr6m4RFj4XmhvdhzT95vpUgFbdOHSy4D+Lwj6rzi/Z2aZbE/DMJZUjgG88D4o5PW6rt0oIrJqnvJ4ogjE8/THEe0Os8uDjCqtvmut4u+EA1meYf8D4Q+RdvXlI12MqC+PjqOqg2MMy29B0S6WxTomniEYgoR4pzY1cJp2ELNJIl1l3XBqgIeNeNNpCZ40N7dc0szhVN1/WCMHcHO8kuL8W1FIMf/Kdh4wOQbVErKm+uk2oLB4jJXGnTdXC3nTrIvB6WnTannr87rEd3+VhzMTP0ru9W5Vwji7NbJu/oaZ6b64Uxm61ArDLsfkQzJFdZF/ZAOU0gdkxgvly1Fw22z9ca8XqPPLOMqRVXSWfH9IC2BD
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OJ/Jpe7hkG/YNKfJk/QynU2LQqqKJ0NeYoK9MVwTwe+eicmEski5CKld0UPFKLtS2nxT3IWcRjbIb0nW4zSwzLb9C5C4kgUk5TBcvIjXcnbEGzi0+IrHgfJZCuejrChCmN4UyKIxW54KEQQbKFHlUwDBM79nj0VfKk0HpXoM3N65JLAscuH0J4xfciI5D1P29JmoZLIvRybmW5MrR4/LDKFGdMFhqsX1Yxlch4OC/yFLdHR1BTJlZ7K5uQmhr8zaBc9pbcEywyLMV0020aiEQwv05goWlxhsHTZ0tZtkfARWm6jyv/qhrzJY17h4P3GqiyPib+y6YOzZb6lFUq3CA/Hgv24hiJozSgoMtMo7iiowOQGQeSB4EKbjo06/HEqFCT6qR3iFN54Rn98hSrQSk4hYYufwASZgN0iM65sp+zr0DOlxedjBbq+nr0uGq/Bf
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 21:27:30.0089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 330e391e-8808-4e10-bb1b-08de85fe5376
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF39B20C1D8

Create the 'nova_core' root debugfs entry when the driver loads.

Normally, non-const global variables need to be protected by a
mutex.  Instead, we use unsafe code, as we know the entry is never
modified after the driver is loaded.  This solves the lifetime
issue of the mutex guard, which would otherwise have required the
use of `pin_init_scope`.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Tested-by: John Hubbard <jhubbard@nvidia.com>
Tested-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 0114a59825aa..d50e5fbce0f2 100644
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
 
+// TODO: Move this into per-module data once that exists
+static mut DEBUGFS_ROOT: Option<debugfs::Dir> = None;
+
+/// Guard that clears `DEBUGFS_ROOT` when dropped.
+struct DebugfsRootGuard;
+
+impl Drop for DebugfsRootGuard {
+    fn drop(&mut self) {
+        // SAFETY: This guard is dropped after `_driver` (due to field order),
+        // so the driver is unregistered and no probe() can be running.
+        unsafe { DEBUGFS_ROOT = None };
+    }
+}
+
 #[pin_data]
 struct NovaCoreModule {
+    // Fields are dropped in declaration order, so `_driver` is dropped first,
+    // then `_debugfs_guard` clears `DEBUGFS_ROOT`.
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

