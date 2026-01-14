Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011005.outbound.protection.outlook.com [40.107.208.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFB734D90D
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 19:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768419043; cv=fail; b=dygDpjTY3labq/P51w6KwXlVBq+fVJLG79wEAsQT3KTactRjZy0+3EHXeaxKRMdXnmuxhjzWGtluD1OpUiEsqMEZasKe5LaE/aEgwV5sVE3ngZKuPJHUsC3nL47KsIsOu4a0vXW9HhbAQ+tMjSsJcArZg3zBAtBoV8cwM1ljbCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768419043; c=relaxed/simple;
	bh=l0aE3Gg7RDXiCVTuH/ZF9dHKn6n4T5d3wdMQfLpxcrI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DETiMcQvuxIg72POdduDmH8hsSEAvMReE0iG/sf58UU5B7yj9EvVOO3pfB8Zzfb5hdRc76dowDajbAyBmD7uz4Sn4broZui/vBr/FAi49x4gSvFLUuesjK1n5hge9JUQGg5kwuzNwCZ+6yowiss8nlNL7YyIz971C92x7iyVESg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uhT8FmMh; arc=fail smtp.client-ip=40.107.208.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uhT8FmMh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mM+qCh8aEfa8gEGhYMNju7jwUAiiulBhtKjQJX6T8iGjpmH46cul9uGEm3ZUUzF5EYPa9ABFf7Z0/lRcnkFv74Zh+FteP+Xf8O2rvTQ2NdUGkxniJji+s5pL+uUxUBHUaIm07mANqlu1JiKBPlfTVwdf/ziL3/T5SLpJEmFRNFeg1d9ioekSCIrsY6yJgUS9cJfnZs+qLU2VjZS2oKbLn/8tD/ldCsYz4ei6oWivD212O4i+I9NJpjX6V/UQsv2VepqZYRzGvIBfrLk0JyVvTJKP3/PVs4j3LlnVYQw2UEKAVxn6vPPODKr/COCi4o67BK6ZNPBOhkwnXj5N/ZPBZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cS3JNVv5bics6fp8H3jWv6UrZEhaoD3r1ygQwXm7ZQ4=;
 b=R3lEmb22rwlzPj/afquw027A87HP9wnptEgm2M2WOiJeH/JfG6XRm3eMG5lz6EDEiIRygJ5SHy01ChEkqFT8hOByi7bJdTjzuiZpVSVle+8I48TeSzpFNjZkUtq4GzNpnB4zgLItIFySH9hkmTsDckMTbkwSBt+sDy6GL6zVZacKnZPF/C10V1WUa2dHYA1Q1QSd0S2O9ax52gNJ+8YWMFGk4k81CsNLKSZuVBvSdyiSCNGDAOKcjKFojyFlGoSUEtGhO3Ap3LR/qCIQgJGEMfsFjmYkm8M3BQ7aXsMQkQ6AQMzHeb/wPkYf2TCYSiquX5ub4ey5m44vS6Uq1JzVbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cS3JNVv5bics6fp8H3jWv6UrZEhaoD3r1ygQwXm7ZQ4=;
 b=uhT8FmMhYy7wP5TqAl7QQ1b/5umaIRPAV99SGP28QcKznsmUHY1k+PXiQfwBkpZT/Tvj5pmkde9urygrhJszcNaDeua9hDUpEOK0kEI96C83BggA938GzHuNALYL4NVHKFGU6gVdu/cnNVeENX5uPMkfyW6unbujsim2ruP0IpF29giw/g7TLT0Dg5ucVWr2quVeJPDw5XbIVUmy2dqIXC4r0bcaUrLxZQSurRCVUD09W+VjwT9e/YHwyIImbREolvsBFjfRaaP9TdLZxIIIviwbolTkIx3HX6Q2BxPnazcoXZZtQtyH8xvyoU/oSzmIF+4icPzd2IvD/tku1NGjpg==
Received: from BY5PR03CA0004.namprd03.prod.outlook.com (2603:10b6:a03:1e0::14)
 by CH2PR12MB4214.namprd12.prod.outlook.com (2603:10b6:610:aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 19:30:32 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::d0) by BY5PR03CA0004.outlook.office365.com
 (2603:10b6:a03:1e0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Wed,
 14 Jan 2026 19:30:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Wed, 14 Jan 2026 19:30:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:30:05 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:30:03 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, "Danilo
 Krummrich" <dakr@kernel.org>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 06/11] gpu: nova-core: move some functions into the HAL
Date: Wed, 14 Jan 2026 13:29:45 -0600
Message-ID: <20260114192950.1143002-7-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114192950.1143002-1-ttabi@nvidia.com>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|CH2PR12MB4214:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a4c8c4a-a01f-42c6-76d2-08de53a361e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p2YOBqxL6oKuMvUng/+XBOAEx1MZCDqZu8VwJ9a4hjQu7AjFdi1r5HmFW5w1?=
 =?us-ascii?Q?YT5xjfw59UVwGTm5To/JW33Nxj+EIKjCfEnJWZHnI2k4HWWXYYFApzKHEyV9?=
 =?us-ascii?Q?OyXGlxs4HwChkTyDsuIH/oHuWZoYkP8Uaj5uZRKWPunfvkNLRSh0H7hFf1Ja?=
 =?us-ascii?Q?NvjrQNxmR/aSH+Nn1+pnb7dp8Z3MHvLmuO/iX+Pa2N50X9b7r/GRv80ckM0T?=
 =?us-ascii?Q?lN/s3nPSrYlAvif3U+MGcPUQKVJYLVasNoeelEVpmutALVdD7aS9npbTn3Pm?=
 =?us-ascii?Q?zYQCH4tpffIBq4BKYaGbfG8PatqogGmARpfPzOyKMFsokIbafj/IMfVSTa2r?=
 =?us-ascii?Q?z29Z+qGkvyO7w+2IYvNQzyTZ1zn2S6n3LqoNN+A5hEHIecsNw10JQ1fxcO3q?=
 =?us-ascii?Q?UY1sWIZZ9wBbzbO2LwDY1Vzb66N6zueKzfIHTWb2+T9mhCpUkkCeZfwDyY3R?=
 =?us-ascii?Q?YurR07+gaYcSOdpkg7lol2yVhnY3mRYslSJh6ueu0LAWhN0GhdsoPInWjSeC?=
 =?us-ascii?Q?hIeYDLTdVdysTQa5iXT9CJIIXiuNYOLHXAIULLBEeltIrZa7zdSHy+UDfj3U?=
 =?us-ascii?Q?fIWjyLd5ptuwH1cNBFtXJH5iFxmScTJZFyQMttfIOQSGBeBWSmfeLrNBwnxo?=
 =?us-ascii?Q?ljvXvw7Vfg6q2ZxrkJzFR6jBKJGnW2UIPVNB0x6hgukDe6BnHfYc7yJ9xDBR?=
 =?us-ascii?Q?AMOrvgT2tc/Iv2BL9x1kr6ihMx+lCGMbTuZUjBGaNUvfaCGqFZPnkw5jnl5o?=
 =?us-ascii?Q?nmwQ1DNGS17hQe3N+Mf8kBKhNfiP2Yd0wYbAbANFv8tbzg/k8OqGoP2jpsd8?=
 =?us-ascii?Q?2URbDiCpyku1IyV0f0JS8VxjvwUfUKaCx+uHdmNlhsNG7EsrUyXmaolsSuu/?=
 =?us-ascii?Q?Ly9A2hxUCMbsq39XUD+wfeY33gHgHpjucYFWYGcJ4jxPVRD9Jfq82q325b3x?=
 =?us-ascii?Q?ui9ZXPsxXF/VHHUwTRiMzwikIDgDrOS4Gm9QPoxyixZ2d2xbMenFb7+fqinw?=
 =?us-ascii?Q?9fJ6YCCFv5EXPPSivjbBRTxAaEgHvVoSY4Jd+AT/21fVp/yrmNkkPRDwp8/a?=
 =?us-ascii?Q?IsN5usXzhAqqhYnnR2EeSC9JVYWlSupD0rzkSiR+WH0kipdPs9qUbB+mBulX?=
 =?us-ascii?Q?kaRtkalb3SxJ4eDJWxgJNr+y+S9se1UrmTxQiD2m07LcHwSQlSvBHAlZmhGf?=
 =?us-ascii?Q?inmDFje4Jv7k4HAFNB87/JXIF34zPNguA4e1EEWIiWXzk8kEhTZfqI3gtSiT?=
 =?us-ascii?Q?9M19d6lROJW+PBDwJx4c1JokJyS0ivE6xyYvxw3YvqGUrxdG9WdQTh1sxBhS?=
 =?us-ascii?Q?zR6qrD7KnPmNAOOC5LJg8dwS4zuYICf9fikfGfORixZ12/ph+VsEhKI8WcUB?=
 =?us-ascii?Q?mYW2SFHUYZpZbWe/5VH3ITJZSRsiYST2G3MWen9eoEKekKEohpS6kssEk+6m?=
 =?us-ascii?Q?ME/bNmsWYOuY79yH38K9IMi9EMXdXvc8kAI7JEQO4RKSaM2UmRN9mylCCKy3?=
 =?us-ascii?Q?IYRB44//VhZo/ZK2K9s1Vah/oPPBrv+AJjFAdWh7MeQeM1BOD5EtBbJdiBSm?=
 =?us-ascii?Q?OuIhwvdmcgxTB/MCCFiaXFh94VdFCv/D/fVLEsfnCAEa5aojtiughmVRtSbe?=
 =?us-ascii?Q?fNWgwfkTKMhLhLenfJK1vgzUneDDkuVb9ywoNPxHhjh6qOrrFkDaW1FSKCey?=
 =?us-ascii?Q?eUDu8g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 19:30:31.9117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a4c8c4a-a01f-42c6-76d2-08de53a361e9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4214

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

