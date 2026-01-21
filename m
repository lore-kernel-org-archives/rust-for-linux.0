Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011027.outbound.protection.outlook.com [52.101.52.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B437143DA58
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 23:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769039624; cv=fail; b=st1NKV7YiRTB1BGUUvz3l4CKPxhYgxWig7mMkmFhoe8Ggc3V3Xb3yevkP/DF04DisJgjatzMwqBEbqPmJhohri6NscOwer7GYB7cObrV9HpR15ClAbnEhnuvFjFWxI5dRINq0tZI3ZOgq8HiLeEn5VvE8g9ZDOxGAa0wspnvR8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769039624; c=relaxed/simple;
	bh=l0aE3Gg7RDXiCVTuH/ZF9dHKn6n4T5d3wdMQfLpxcrI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NZkh69fzmhZnEs/yZXfuo6RwpcHFOoY5kugVRbKJGPq6GP+N9pCZi/gi046hGVVIJCYMM8UyLri2NvruU+nS5C2AJo85Ff9NMjDuOFsR3kf6i2LjfdeLzYdKNasD5hWsqP9NQs2illfxHz0O9uhI0KDxJL53hPGobmdR+OXJZ7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WkFM4PlB; arc=fail smtp.client-ip=52.101.52.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WkFM4PlB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgtbg1YelWToDqwBqh7xzptsO2gL6Z7mpmqj0kYU6OH739KcUhvJ5lHGeUQ5VOhZnKkrHc9ylpHc38z/sr/QpA0O9VeSj2DY0nYA8XfCsH9+bBqnklhygXxrFQvE1IathDOINs7aXz/IeIOCObtYmQFnnbSI4a2sXIavOKw9bX5FHN9y/cXbxXm1rybMgPK3w9AbISTe7Gts7pkZLNcZS30CTFGdvQxdDFSYzrOu9S1KQLsZM3mQzV6I0ef5hEgaPzo6XabG+LjJlw6h5clGuwUAYF0ryHSWLL3D3S9ineo5cxCw+QjfOkP5EP60C+4Zs8nOj1f5EfRh2h/7IRxy+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cS3JNVv5bics6fp8H3jWv6UrZEhaoD3r1ygQwXm7ZQ4=;
 b=QtRbZPv54DtBNVr+MLAWMq/J+2rptYD9re6GiIgEyek1wXMLU4fxWVfj5So/NmFxyFv45dHBET/idCVw6u0BMJFma8t4Hk93yHZ4u3ehZjyFf1a9JDeYKy/ladmHPjZYwcd/nl3pYiOCXb547QNz9ud+JC46ky1z4++7nw8Lht1KiKAkaCakAxMDCJ16QfTmJU99+Hhl6BVkgbU4yoZm38Xkpiu5g+bdY/fEgksY2O7IUTKd/UCgT2MUkM3BJDNuaQKP1aIKkpe3Q1nAG8t3CsJpZ4r7JVGeiQbZL7BokkgxByZDIwQeS+yvQnj/2GHdXlg4zJlOVXiW8ziHBxHz3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cS3JNVv5bics6fp8H3jWv6UrZEhaoD3r1ygQwXm7ZQ4=;
 b=WkFM4PlBaOYwTH73fwsM/WmyzEtrauW4hNC+/Um/glRErVpMZCBi5s1KKzgtgW0SLLRer8adm7LzlJYDCBwu18KUO9bN3lDRRHHR0aGbqFbBIDVFpLEviMVVRovZKYtQTwg2rp7SzoFdXvXcMonRqJFnA0jfeW0QsxxNxJDigYorLb3cSi9BDZ2/1L2DnOI7nAd55bMPEOlZz6MfgCSueMvjMvyMqMl8P6j1eJkg15iHHRQtfyd/PkAoidXLOcjxfn9K5XXKnc3B+eap6VqG/cofyc/zCp8/SDSTQ0fcePg1QL7t9daF1vsNvUO5FlHszrhYWbhN1ri69vtf3MVhBA==
Received: from CH2PR02CA0015.namprd02.prod.outlook.com (2603:10b6:610:4e::25)
 by SA1PR12MB9001.namprd12.prod.outlook.com (2603:10b6:806:387::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 23:53:34 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::e1) by CH2PR02CA0015.outlook.office365.com
 (2603:10b6:610:4e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 23:53:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 23:53:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:18 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:17 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v7 06/12] gpu: nova-core: move some functions into the HAL
Date: Wed, 21 Jan 2026 17:52:56 -0600
Message-ID: <20260121235302.1962185-7-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121235302.1962185-1-ttabi@nvidia.com>
References: <20260121235302.1962185-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|SA1PR12MB9001:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a33328-ce8f-4ef9-30e3-08de5948495e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ooBk6aviUhdYpLySspm1ww30YzQAUouigrjfZGy+yzXaXIxbJR5cJsArVJqo?=
 =?us-ascii?Q?nK37BJI9fQm1cenFGH0iIi0sKOhPDh4xorbd0Dxa4j+i2qoNi0iftynvxrlM?=
 =?us-ascii?Q?0xFZqrxM64cwLsMgAA472NoxUz9qFu4T13SUrBq8gdvKNhPwrJXHNU40uNSo?=
 =?us-ascii?Q?AhDf1va17Yss7oqtKwf3HbUHd4Psp51JHtH98bpNa2iWBCWK6/Qw88ZdRs7Z?=
 =?us-ascii?Q?U5ke/kQL/QP5rqTn6npsXmpJlFxw+AMxWvf0FKl63b66vKkIHw5TOnlmlsCW?=
 =?us-ascii?Q?e2okeb3IhWOoVa1VObpBSqUjwBby3XVM7NGzWlQmEGFuNGwPeSEq2Ffuq6DI?=
 =?us-ascii?Q?VuiJaUKGqpqiPVperCQm1Ssggf97mqsOBxqQa4eqzCTOJZK6TjlIDWM71vLs?=
 =?us-ascii?Q?DIZqSGWtAmIqX47kTkoDqfBjcbzG9q//NMO6sIRyvrv0LCVpI8B78B4vA/HJ?=
 =?us-ascii?Q?AXNREtXa5Kw1aI/jzHuQvGzm3wCqkKvfQZTwOQsUs3sV45bprZQPi8y89gbu?=
 =?us-ascii?Q?CrhL+d5M7EH7JixIQjAqNdOF80hp8NAcn9hRmBabdgtARieKdRPA7MllN1xT?=
 =?us-ascii?Q?PNv8gVqa9H2NSt0UcGw+hLt2M4TGFYH9X6bJ5PKraolgD54AgQcO4O129GMZ?=
 =?us-ascii?Q?4BQHsx4nDKwz8s6376yGuCtgsx7pHjNyVcMhLeTrmBhVZWDHTK7XW/oLXWQX?=
 =?us-ascii?Q?eaqZkzkVcyZYKwW4C97NUojxXbVZDhYl1wJhNkFWeoNam8XtIunm2SQoq1vj?=
 =?us-ascii?Q?bSCQKWEn0kivkTDPvmr3indHtfgnXc04QtKVjp2kIzqsvQyECStQbewCczCA?=
 =?us-ascii?Q?xtUNDMBXbmAckJzhk9xt0ZgcAvsCE2gCWrhHYs++KMr45XUYxmWwJ35AgSQR?=
 =?us-ascii?Q?/iQiPMqSxbZPKSKLHxskbDQXDUEn9gFbTEeoWgwlWnarIWvqVZZWDP7TfYvF?=
 =?us-ascii?Q?kTHtwTbUjljeSUv6syfu7dUwZhQUIzAlYkFQ3bNNM2ffH0Bria6QlRYOYARv?=
 =?us-ascii?Q?wWnv2tiGJl+O4oaoOhbkdx2TmaYFDb/rKQxa3NYoCe83qQI8YPPfQZew5Dq0?=
 =?us-ascii?Q?2pYpgc4ADlS7ymI2NG8A1YuhT7zAOFhuit7Z2jzt4XFw5fvT1OTzyf2P9+1d?=
 =?us-ascii?Q?IMSCZpIr/Gf6nELkoG/aSscmaxrYy9i9DiLX3k2IUG5jllxuCVC/pevUD5u/?=
 =?us-ascii?Q?2Jq9oRi5SGhBkWoOCUGVy2CnUzXI5YAkOBlievwiElaWLIAIdCxsCE8JiV3j?=
 =?us-ascii?Q?vsjzZEHjJ36JK1/sdFCKmyfQ23lOrK0k+vfMmGCHCw+dUHuiikAcPR5J2rxj?=
 =?us-ascii?Q?qMNaCSbCAEUz/Mhispl4VeFhq0gl8aAn7ZFDSSMXgeBu5VixknYwKcnhP0M8?=
 =?us-ascii?Q?+7EuulJqbfPPZwp6MsHPyhcpFsU9+Co45h4+5e3wFoeZvhPm9efrO2LKfGoa?=
 =?us-ascii?Q?lnnTLWJLA+rY65LJevOfLoxlLKnipyHcwkVZrNwBbQh9zz2MCkgDAocaRR+S?=
 =?us-ascii?Q?fa6nGTBmYK6EnZZ0TpSiYskbN8EDIadYPsJWYBDTOwZRHJ1MttsN16MnFjqr?=
 =?us-ascii?Q?zKqkJ1lM4IDoM9JCWx3aXXf7C/nKOXOshZGRo4tpccQ1CuJBa7LbYhxKTgtm?=
 =?us-ascii?Q?5I9A+2lETSYBsL7/p59YS085pPxgwzv7QUeUp2NUZlVcc+x5BirWuzuhayGv?=
 =?us-ascii?Q?DBuLxA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 23:53:33.5188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a33328-ce8f-4ef9-30e3-08de5948495e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9001

A few Falcon methods are actually GPU-specific, so move them
into the HAL.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 45 ++---------------------
 drivers/gpu/nova-core/falcon/hal.rs       | 10 +++++
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 41 +++++++++++++++++++++
 3 files changed, 54 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 2a8fb7059a44..d779fcda0e2a 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -16,7 +16,6 @@
     prelude::*,
     sync::aref::ARef,
     time::{
-        delay::fsleep,
         Delta, //
     },
 };
@@ -397,48 +396,11 @@ pub(crate) fn dma_reset(&self, bar: &Bar0) {
         regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
     }
 
-    /// Wait for memory scrubbing to complete.
-    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
-        // TIMEOUT: memory scrubbing should complete in less than 20ms.
-        read_poll_timeout(
-            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
-            |r| r.mem_scrubbing_done(),
-            Delta::ZERO,
-            Delta::from_millis(20),
-        )
-        .map(|_| ())
-    }
-
-    /// Reset the falcon engine.
-    fn reset_eng(&self, bar: &Bar0) -> Result {
-        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
-
-        // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
-        // RESET_READY so a non-failing timeout is used.
-        let _ = read_poll_timeout(
-            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
-            |r| r.reset_ready(),
-            Delta::ZERO,
-            Delta::from_micros(150),
-        );
-
-        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
-
-        // TIMEOUT: falcon engine should not take more than 10us to reset.
-        fsleep(Delta::from_micros(10));
-
-        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
-
-        self.reset_wait_mem_scrubbing(bar)?;
-
-        Ok(())
-    }
-
     /// Reset the controller, select the falcon core, and wait for memory scrubbing to complete.
     pub(crate) fn reset(&self, bar: &Bar0) -> Result {
-        self.reset_eng(bar)?;
+        self.hal.reset_eng(bar)?;
         self.hal.select_core(self, bar)?;
-        self.reset_wait_mem_scrubbing(bar)?;
+        self.hal.reset_wait_mem_scrubbing(bar)?;
 
         regs::NV_PFALCON_FALCON_RM::default()
             .set_value(regs::NV_PMC_BOOT_0::read(bar).into())
@@ -672,8 +634,7 @@ pub(crate) fn signature_reg_fuse_version(
     ///
     /// Returns `true` if the RISC-V core is active, `false` otherwise.
     pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
-        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
-        cpuctl.active_stat()
+        self.hal.is_riscv_active(bar)
     }
 
     /// Write the application version to the OS register.
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 8dc56a28ad65..c77a1568ea96 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -37,6 +37,16 @@ fn signature_reg_fuse_version(
 
     /// Program the boot ROM registers prior to starting a secure firmware.
     fn program_brom(&self, falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams) -> Result;
+
+    /// Check if the RISC-V core is active.
+    /// Returns `true` if the RISC-V core is active, `false` otherwise.
+    fn is_riscv_active(&self, bar: &Bar0) -> bool;
+
+    /// Wait for memory scrubbing to complete.
+    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result;
+
+    /// Reset the falcon engine.
+    fn reset_eng(&self, bar: &Bar0) -> Result;
 }
 
 /// Returns a boxed falcon HAL adequate for `chipset`.
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 0bdfe45a2d03..61cc3d261196 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -6,6 +6,7 @@
     device,
     io::poll::read_poll_timeout,
     prelude::*,
+    time::delay::fsleep,
     time::Delta, //
 };
 
@@ -117,4 +118,44 @@ fn signature_reg_fuse_version(
     fn program_brom(&self, _falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams) -> Result {
         program_brom_ga102::<E>(bar, params)
     }
+
+    fn is_riscv_active(&self, bar: &Bar0) -> bool {
+        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
+        cpuctl.active_stat()
+    }
+
+    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
+        // TIMEOUT: memory scrubbing should complete in less than 20ms.
+        read_poll_timeout(
+            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
+            |r| r.mem_scrubbing_done(),
+            Delta::ZERO,
+            Delta::from_millis(20),
+        )
+        .map(|_| ())
+    }
+
+    fn reset_eng(&self, bar: &Bar0) -> Result {
+        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
+
+        // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
+        // RESET_READY so a non-failing timeout is used.
+        let _ = read_poll_timeout(
+            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
+            |r| r.reset_ready(),
+            Delta::ZERO,
+            Delta::from_micros(150),
+        );
+
+        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
+
+        // TIMEOUT: falcon engine should not take more than 10us to reset.
+        fsleep(Delta::from_micros(10));
+
+        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
+
+        self.reset_wait_mem_scrubbing(bar)?;
+
+        Ok(())
+    }
 }
-- 
2.52.0

