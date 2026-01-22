Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013006.outbound.protection.outlook.com [40.93.196.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0053A9D82
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 22:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769121304; cv=fail; b=rFyeziifRanEkvUOVp4PUfOSvWQLjnaLESmLU3dpX/wTgqEDzWD4QYIWvpXOWyaV8wfhFRx1Yo31jIR/k65ID/m8DTT9V9vl4hCppHqg1/2chnzb5FYwyrVNkH9QhTnqUSiEWlAl5OJqIbg9RVI94xTEBhhcpyFDkAWbo2ImSgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769121304; c=relaxed/simple;
	bh=bUEP1h5b3tIToadFWqrs6rswu4uqI6hzU/p5EVFEk94=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g1NHIdB+FwVQRpBD2WGqUCEMuPz/2jwNkdSIMvm9lKGnobpARmjdEJpBk4qihqQiy8gHYbBnhN2LZCmjtokWEELN7SWU3plfGBjq3ugFRzqiTt9hwzY4tyzIePho+d78YH0RIX0JfMJH9SKOhd6TYjSyR/QP7D1B1CPttlfWK5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rM36yBdq; arc=fail smtp.client-ip=40.93.196.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rM36yBdq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0xE8MGfvUasLvLj9fe3N6bmg/XOqeHnHvNBToRVOPGfa2aw7tprcI/bmGjecu+r5t4mClqPjn9k2PeaeShrO3zjxi1cOgkDEyuz6txZm0Nc2fPROP5+0bi4QY2cFEXMnbCkjTCuTAnepvc8JP1WtI+QmsRIbYaoR2OKqCkSMPgFzokcKFBSXeZSnUFuKSjJGkxzXPyirzwP67/9JYax7dRoYTWDLgWEZilVpncnidDkdEhG4OY1imPICOXa+gtgngocPMPLdjLdZcCtJOLXcUKt0unCUIRwYRAPOAKMraHbBN5hhpkZG3QhyZGXnZbUuMssCLnSrTbELJOJWZrdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3o7d1AV2bUgJ1U3EYZbGhhrfWKjUQeLjtczVDRxTsV4=;
 b=GxiuQzlhNcWnyW54UJrfTGYFy4Qa4GUaFdpFYUjVUThtyhCbWkANTXoFgixnUUJgW+zquUxakxwoow2KPkh6fqwaUU+W43Zk+avc+uEecODtD7me7SXW4D24sJDF8kp9SDoJZlHg4/LA/B8IeO1qDbx8o+aWIhw9bp7HHiKBXW8rBQgZgUGFU8bWSCduE+rk3SkLUT1RWI8kzl6r6pgXw4dRxfd44KcRE4W4CAMVSThaPKRZl4zulOsVHnMg8NSiXya5xX8HCMWPvqhxhkcd3sFJidwJD88XXb93dgtJuhEGJZWQigCq1ich692lTTEA7E/6rofLbgUzmEk/peyx9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3o7d1AV2bUgJ1U3EYZbGhhrfWKjUQeLjtczVDRxTsV4=;
 b=rM36yBdq7nJJ+gheVQyK5emSjIj0DrOogGI1fBLEfYmoI535uFpt6SXrfWyrdN3kqYWAXsp08GP8MbGEThwEhCAuKjC2v6oYAzdSIMwtD4jVxL70NPB1QW0Mnkc9/eHBBzvfjn301Dd5V63ZLdqdOGwYwffL9PLsRmgWAU0Iroh/dR4dNzZ2+hnUXnNyOcpaHIpHKPUqcHtPKoAMK1dicDH0yWZCVWCVTD9+O4kifSkjqtD1j64UdMH022nAXevw2f/9bgBF56g8Z95NbFysnB2O3rS9CaDIheFqBzZSUGr/7ioXdxdXl6YLqzEt5TkC2yzH6xTH8Ctttd24+QkrWQ==
Received: from SJ0PR03CA0037.namprd03.prod.outlook.com (2603:10b6:a03:33e::12)
 by SA1PR12MB7411.namprd12.prod.outlook.com (2603:10b6:806:2b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 22:34:43 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::35) by SJ0PR03CA0037.outlook.office365.com
 (2603:10b6:a03:33e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 22:34:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 22:34:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:09 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:02 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v8 06/13] gpu: nova-core: move some functions into the HAL
Date: Thu, 22 Jan 2026 16:28:41 -0600
Message-ID: <20260122222848.2555890-7-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122222848.2555890-1-ttabi@nvidia.com>
References: <20260122222848.2555890-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|SA1PR12MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: ee989062-fb7c-4819-c8b0-08de5a066f43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jWe70u2b3sz6R5aK9L4bKr9rNE8xN100xxtodD3+umXK3wzILaWQ5Zai9erh?=
 =?us-ascii?Q?MiXs9c5926gzpCl03u+P3xVdh3Phwy0kRBzyIx9DGVf4ggFqllCWC3e1xm3e?=
 =?us-ascii?Q?4u1ACsn2bOdoJ+v0B+eus2K6Y8bYlAbLuwOoiiVzx5m8SO5sEt8bpLC9Z9uc?=
 =?us-ascii?Q?x2F+Ha04oqeqhGqzbRXlJhSi0ffL2lXwdKZEjn3F29JN/NHOMyIrWKMuxwBq?=
 =?us-ascii?Q?hb+/o0sS04QR/F+iEQnR/fdjSm91QsUtl5Xo14tO+OHxPn16epAPsaC2yw2G?=
 =?us-ascii?Q?VrOVr2jAp9E2+mVHBdv+b1idrktFDw+Vv4i6em5ILygzDjFFsV+e0HLpcicG?=
 =?us-ascii?Q?maXRcrSkKAYfHfTQWez0iOObIyZGx2a4UShTbrHIZeuZISd5U8/ZdC/7Vg+7?=
 =?us-ascii?Q?3sOYGEIH/BU4Sry9HObS1yj/oXVN9lvn5ryvH8MnrewB5Td2h5tR4NHAaOmx?=
 =?us-ascii?Q?FoMO4pnX+rglF2gs8Y9zJPePYv6fpL1FLwIijdWaB7nc8VTtjaOnlN45AQ+d?=
 =?us-ascii?Q?FfOQg1SrRk9HgsIgAfhjCqGc7LZl5+WdEe5l10xgmIUAdT5VCUbfrUJe8pxZ?=
 =?us-ascii?Q?/7A8W882YJaIPtoW48ERx4tJXUYjZgvLWP0PlJU40ZudCDyMFq/588zCQyKJ?=
 =?us-ascii?Q?7YrABUNRcvWV/5qyZbk1ZQCLnTb5YzO0ameuaBfgmdyXYSgDblZQG1te47l3?=
 =?us-ascii?Q?Gwf/MSBVSwxaGzFljCIwBUKwLpPpjetTF1sQuZ0lmgWNc0LLPtkUIaY3vhj4?=
 =?us-ascii?Q?hY82irzHvvUn0Uzr/mbjhBNo+ejiLkxUfwau8CLlAiuK36FO9X+lHSHSj/tk?=
 =?us-ascii?Q?9WdDrtTPynnIIwWPyo2+irBr3tQqJGCMlUAJZBYjpMnKBKPXObZ0kOXL54zZ?=
 =?us-ascii?Q?NVt84hD60qrfsZ4moXe/aKKbsI8uVw27C93QmUvuCq5UiPsowisJHpwYSRo8?=
 =?us-ascii?Q?KSdFWLYRireRAd8ERCJ/9a/OZ0XiQm0auBFWIRG3SCfJQ6EVgbwsCoAIXZ3s?=
 =?us-ascii?Q?YErxEDiNOC2g47a++u/NdTASBEABAnp/gtqGJ7ize22LEdarRdN3o+bEYQDZ?=
 =?us-ascii?Q?wHb5j119HD90/Qx4415JQITxAFZ6Mk7dSiOJtaG0Gsny+Ucq9BfiCYM3jDla?=
 =?us-ascii?Q?wtSL//rsnh4SN3E8qvDcRXQsEANOJKaYSFTdpK9jrvlf06wBnCQ8Z88PZYEU?=
 =?us-ascii?Q?Y9M5ci9PLQ8p0loK/UotDyhi8WFEDIeKQ+pYd/55OfrCRSPqJjOJJ/zfEjWQ?=
 =?us-ascii?Q?wVgXNi2exjWN1LPds9L+opxR/Szrz/Dus2oLt0DibzIW1ciCD12ahAAUPIh+?=
 =?us-ascii?Q?8qTWvFKc8KPtD2B5/4oTKkmgbvzUiN78fa/1y+X8TxTK9lxzBe5EZOZ/Fbmi?=
 =?us-ascii?Q?mp8hVyX068CguYbavy8VAMJO30N8r7ihZRD+PqlzizUeFtxtZmV4Afz8+OCm?=
 =?us-ascii?Q?ieXJb4PuBjdyKHrkSP4oGBDnyOzdC8KVI1Zv9NveVAlUXteb8R1EkjxICDPC?=
 =?us-ascii?Q?VOATiixJosbM1egVPlClTzNLVfjmaHnESq+Grh0rlnQo6pd/ZfHZ1EzjKSMn?=
 =?us-ascii?Q?E9C0asGXUIe2Tm9ljiSGc8N8gzZD0vwHIqzeG3Ot7Xf0qWv/ewTqzB8Hn9c7?=
 =?us-ascii?Q?TR1GpiiIM+yR8aVhDghVIkCrRvL7AFwJ29+sUcUWUeAa9ZEfDPyZoy5KjiIU?=
 =?us-ascii?Q?PkEiSw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 22:34:41.4786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee989062-fb7c-4819-c8b0-08de5a066f43
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7411

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
index 3629422e7a52..344354ed50b8 100644
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
@@ -398,48 +397,11 @@ pub(crate) fn dma_reset(&self, bar: &Bar0) {
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
@@ -673,8 +635,7 @@ pub(crate) fn signature_reg_fuse_version(
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

