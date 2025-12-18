Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2661EE7B7
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 03:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766028639; cv=fail; b=dE1WAZZfs6CvJPdQsU/FOXxzAngHs3xNRlJ/2l9J0FNQyZQRZpRLAqbUyRj26KjMCOKuJzjfNY5WEiXfGngWgi/vVxJwASh37YBvmByjSpI/gQN9a03qvJCSdhldNNi61PPCoqIvgLxuWivXHcRwaBfcICVFStLwZKGP5UJeVKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766028639; c=relaxed/simple;
	bh=1pYacpg97BCU+luVUsp2hisXSLHqUnII4ZzmS4PKlQQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T4YSpNZIX6OigVViAF44sX5QE+gb0T6BrMByUIp7JPeB2aWN4XfvNXgcr7yhDMzyzkQJbjNbNeglpgRIwhWMm4jFEfvclJljOIocivREtw85OicG1pRSnyMfiCSxBhrmKB0vsLalXh4Ngz3c0gncKjBNsr5aXsatcWXjfBw1r20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KmfPSS6V; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KmfPSS6V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwhSZjh5A8+XFukZxzjhE00biLQ4cyhTP3Y3GjDhtufLG1Pf4vQsDmlnqj6aWdVh7zlC3E0HbifJEHX6BcEqF42Ks/paB1O97XT/Om46Au1HWH6k+AmBLHrWT0mzjvJmQx58/NbAQCUbTTn3Lf1ywHv7h45IWl6QnOibqsiGdoR2RVtmPjA0+czxIMCs1yFsNpoKMtlkrrqw3CM2sw/7HD6jcLvugWybwDWbpdVsKCvknYKtktrh+MaFLWbEz5Nco7NcA3yZj24HvQDeKGNiz4Adm3a7RAJOM5z8VBGP+1jLBqTn8fot28an74dgxhTGxQj7MgcM97el0qLj+PUTMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhSEKI3N9HRCPiaXEa0tAZ9imS3IfQG0E2IcgI6/0hE=;
 b=GmptzFZxnGhDGuTM0tE2FAnSHRyHU0E65EY/Ip+195BkjH2JgVpR13XsITjoPGCM/gC53WgCAezNQ1Y8Va8nFzPk+b63oSv+oMMLblUan85JS17onkzj7F4SLeG3Rz03H/oSI4ChRG5MQO3Qm6pWkKK3XRvHVgkbiLrKZvxfTZ8KsYBme1naWidQbkjLXS5vEGGSYy+dgra7f25CwYN4k/Epn+NVt5+ZkcnlEOYXt44ACeAzsVzLdTMXhJ15Mjr1inEBqFmQxd59cMPr5qx1zHEWq7oLq/UPoByzJVUYNtDNkmESESXm1Q/sw/8EmCCyblCjBs3GhS0lq54+otLPiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhSEKI3N9HRCPiaXEa0tAZ9imS3IfQG0E2IcgI6/0hE=;
 b=KmfPSS6VRlCQC9vd3PY7JihsuAqb9CB5nmtvgrH/l5iOUT8V876f0weaQNJ7180PDkz6s/syyX0isV3aGRXAUazmGAW9H8WwyWt7kEs4+JoaFB1gs9Uyi5kdi2eiHrsFPsPZ3tSEM3te3oK3amsUKpdcV+CFJNeD2PE8eXn3G9sNzx2sKvHvIjw9EzXccTxGvO0EqMzLgCsmUcIiz5ssXv/NJhv0/RlihV9jXN3HFShIqDg/ncDJLIh5+ZFxw1Tfy3vhk97EvWAEavtGPmixEZ0m7EU5Ew3vmHneBCCh+hwB7s+8oEG38rEUzFYcIBIBuG3ejxdxfIJ6NF22gG7P3A==
Received: from DS7PR03CA0239.namprd03.prod.outlook.com (2603:10b6:5:3ba::34)
 by DS7PR12MB6168.namprd12.prod.outlook.com (2603:10b6:8:97::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Thu, 18 Dec 2025 03:30:28 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:5:3ba:cafe::8c) by DS7PR03CA0239.outlook.office365.com
 (2603:10b6:5:3ba::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 03:30:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Thu, 18 Dec 2025 03:30:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:10 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:08 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v4 06/11] gpu: nova-core: move some functions into the HAL
Date: Wed, 17 Dec 2025 21:29:50 -0600
Message-ID: <20251218032955.979623-7-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218032955.979623-1-ttabi@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|DS7PR12MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da3f7e5-c178-4300-43ad-08de3de5ca1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AQuniRArZNncT2AKtlvU+xggcGhHJ+P8BbX+pxP6trCTRiMYf6Opn++3r33O?=
 =?us-ascii?Q?5RILW9lhnMDRCqVHDkzhzRhg7PVSox7uVqtLYba7aSdUVUiT8DDj1zQysA2i?=
 =?us-ascii?Q?Tn1oujs30ilQiZw3Fqpvhicm8TqvOitWIZntDeZka1LtqfOtb76goxi2mSlA?=
 =?us-ascii?Q?nehh+3/dupUZdgl3Gc4tEAoI3m2f4d6zebshdOFCNuvHxk7P1HuAqvu6ssVC?=
 =?us-ascii?Q?Ppms7ak1Yhq6foUnI9jy4Xtid5VaFwFE+EcCQoCD6yTnleqpf6bwMxKLKUbZ?=
 =?us-ascii?Q?UTS+ugteK+E5klebeLlFJ8DeKUMatUAUymg9ogLBKTVbYtjeKzzdyxoLkIgY?=
 =?us-ascii?Q?7sSLIRnXgJJydRtruSQocpEjtdxDHQDiYPrC7uThW2OkG9oxrwpPGBdbBIQe?=
 =?us-ascii?Q?wUts+ht9JRVfZEe2N+58EXChk8XlBqk1xKQkSj5XIOY3b1DOi/qdo/JIGnd5?=
 =?us-ascii?Q?cptMtDPWpc8RNrMZ1QiGq1FgOgHhS5McvyI5kj8SIu5r35tFRVvOqt6qF8ha?=
 =?us-ascii?Q?HI8yWHAai9Opc6hpgvHwcrfk+TV98M0l4/FCjrV68FDuW+rh5WU06+Sp7J8F?=
 =?us-ascii?Q?k3jhmD4lI0lfq4LD9EPy3yeAHB09OQ9ZCdNFb5frfQD+Cq+8C+elzJaK6JWm?=
 =?us-ascii?Q?gLC714ubqQqIS4Aacw08ppJ/VjFQEAJ5eJbQ3gpjZfAqqGA/v4ojPb8D0/6f?=
 =?us-ascii?Q?unkm5OKmNXpRqzLypzn5+nRtfIhvXOc6xHFNhCAbsije2O9NjRTge9ZGNINQ?=
 =?us-ascii?Q?UBXXzQE8Q56twLC9wtA/bPuAaVBJa9RYZD1Vi+moJKBw+4U06WkiQQIwbFiy?=
 =?us-ascii?Q?4uipJouL62b/v+mj4BLtg3AEixqmkrHuN70KHCzXpxKTkfqrNm5RrqXMmmIi?=
 =?us-ascii?Q?DMH14EYs3T61tgV2IoNgYxtmpNEea1kedraKR57XWj1afZF9d0iR7bEA/R44?=
 =?us-ascii?Q?tb3Rt3BVqHPEwfKe9cl6TBIbgiA0sq0f5OVU0eFc+bzCRXuKBHuCZchvP/Ou?=
 =?us-ascii?Q?QMG0emE6U9vc2y7/faWZ8Sf0PXkMmg6AleFJygUZFFbf8R5pSzZn+VXmaz2q?=
 =?us-ascii?Q?hRForJ9TtjmU9mLc2vCp47HTTAYoXTpzouJMBIURNzPM2dxBTxOmJ0wwLPYF?=
 =?us-ascii?Q?lnoYbqhTlvMWy5rXbvZI9Xwt8OwV5VvnWHqGzXNmnxHBgj+SahwBJNejoPtK?=
 =?us-ascii?Q?QHEtSM85N0CuoF+FVvcpedUWJyCPYPUDSq3N+cEcp8J+7ut5cifwFZFj3XXi?=
 =?us-ascii?Q?3NhTGfyOv7MHfNMLCP0vH8F6GlcO6leM8cc3qEAhS2zQ1VwqOC6XXHnaG0yw?=
 =?us-ascii?Q?UiIoYMoPdb4amsxmU5ESUglqiHF30PAtn6XYy8741XlNF3NkP5UZ2mFhKT0H?=
 =?us-ascii?Q?2nmQZYOUyu7JIBo6Ht/fNkCoBt/n2/SmfJ0a3MQSeWCjwWMwbJ+lv0bILHZG?=
 =?us-ascii?Q?PdkT170kae7dgbx86iIi3+iv6nNMdhmkORRMdwMN+6J9h6DomTDtdq2mYzg9?=
 =?us-ascii?Q?qgj24qkz71642KbS/iBkLp5h1wjc2xH0dntJlRgdJ2vQQOdLFRLTWolQMf6y?=
 =?us-ascii?Q?5qMgto7DMzRpb46NSAs=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 03:30:27.9200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da3f7e5-c178-4300-43ad-08de3de5ca1f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6168

A few Falcon methods are actually GPU-specific, so move them
into the HAL.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 45 ++---------------------
 drivers/gpu/nova-core/falcon/hal.rs       | 10 +++++
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 43 ++++++++++++++++++++++
 3 files changed, 56 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 44a1a531a361..6b54c0ca458a 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -13,7 +13,6 @@
     prelude::*,
     sync::aref::ARef,
     time::{
-        delay::fsleep,
         Delta, //
     },
 };
@@ -394,48 +393,11 @@ pub(crate) fn dma_reset(&self, bar: &Bar0) {
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
@@ -665,8 +627,7 @@ pub(crate) fn signature_reg_fuse_version(
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
index 69a7a95cac16..232d51a4921f 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -6,6 +6,7 @@
     device,
     io::poll::read_poll_timeout,
     prelude::*,
+    time::delay::fsleep,
     time::Delta, //
 };
 
@@ -117,4 +118,46 @@ fn signature_reg_fuse_version(
     fn program_brom(&self, _falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams) -> Result {
         program_brom_ga102::<E>(bar, params)
     }
+
+    fn is_riscv_active(&self, bar: &Bar0) -> bool {
+        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
+        cpuctl.active_stat()
+    }
+
+    /// Wait for memory scrubbing to complete.
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
+    /// Reset the falcon engine.
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

