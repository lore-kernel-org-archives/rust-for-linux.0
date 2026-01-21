Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011071.outbound.protection.outlook.com [40.107.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0854418C9
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 23:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769039625; cv=fail; b=OsWrNA/G+ktm+qLGIuA+NNWMb1xO0aRgSqCuUSxiC0hfqZggx5LZGI6sHJfvCQMTaON9hNMDxXzE8Rii8tX2RTvT+m+6MAAaBSP5DO9kUdrBT+Q+DszQGsAJcNPV26eKZw8lT5Hw2jkID8j7ocwf107rFDo0DdgIBSPtkUe+e6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769039625; c=relaxed/simple;
	bh=wOxKvcXiKxkpF8WbWOql2l66w/tv0qew6fMgRP+B0zk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gd7AQ8Ck3lysgNm9/r1U1ZQV9USOXEiCtbUxfTkkJEqUa+14aCU0t1m+j/h9+V5XfwMmYN9NNAy1duyBEh3dJywkP1hi9qM3fE67lOAylx3rLKTVw+G6ejXFmURRmI3GspmnKEreV/we93/GdIGeQV4reGfsMwGxFdTfsAS70ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WmrP2C8B; arc=fail smtp.client-ip=40.107.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WmrP2C8B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJ7yMyxLQ3zfRBYolnBY6yK6lM1KqPWESMD/o/eti9vIZ0T7NeWn6ctVqFoTvW4PTJZu3PZG26fIfvyYQkZqj6MQrc7C71GbehBE9tTlWGNxheLpDF/cUjjI3hqltGYBsZqz8lpkmit/+0VybdDJ9wrtOUjC5LCND0+PASfAHbwp7A8H0FePL06+NaTJFpqx1AgAY2JOzB10X1hev6K/he0IxFFLcLkA/D1Wsiln8Tl1i3tTm4zBvPrJNKOPETKAPLuFpAAmZj6l7XluUYY/R5lq/R6aCOuGQx8nJki4E8oaWgKC6I9pRgAyoJSh7l3z+a4zLvzBtB6taB9yzucZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2VggK6gItZrqQzqVnf+64OZZJouFDQdrS2LDWWSPB4=;
 b=W1AEqS0z3MRwpjz79RmSnjxc6D+g2/zQhvk6t3dy2Ny9e9PeEAX47FwaVxH+uipRKYfmgbz4e1xQOUVSVcfW5dPl5g/9qthTfzjIPANcas83ItKnA6yhFeUDb6HJa0BrZsFxi2VLwb5DYyAGgC7ylJx40s5hhr4zXYV7ZCJ/24tx+XW/uZigRBRZ/3lCqi43vhvCnsbE1FmGDyPdbZK03kwoNpYLpWNKY9C/hkKNsblaMinZKY/J5E1tkJMd/puw+q9vASJQYUijnF9WQO9TjvDWe0VSo/4MCOaCS1DtVQkiMdVVeqJ2oXrXNBXxlzdZF74wCZXKYkRiGez96WtMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2VggK6gItZrqQzqVnf+64OZZJouFDQdrS2LDWWSPB4=;
 b=WmrP2C8BG3dWriLYz0V7FeBR7x3pwi0XvQOg71mJ1FCTHmkMxAHVgGPN3Ygwi2vHX7O2RWipbHRhVJO2fugsJbdzDYnBVvcqFYUvgoU+kMiUeaYBV1qPOuSte5/iM9BaEXbqFmSLofBEaq5pF6xIXm7Y5GH+7/cS0SXU3QZqgWNxOHY46STum0DLtTf/wBDNF5YkLxHRLvzltbC2GjULFs/zjCceuC14M01TOA6Y4qyta6x0WP7Kn+6Vg3fMmdF1OBiEWicNzW1OOEeuso9A0VIkU2WwbaidbOKJOn+yUYK1JMKE31nLiPL2ufYwx7TwyU9l4Vdl7Vk2PX9jribN8A==
Received: from DS7P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::16) by
 BL3PR12MB6475.namprd12.prod.outlook.com (2603:10b6:208:3bb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 23:53:35 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:8:1ca:cafe::45) by DS7P220CA0011.outlook.office365.com
 (2603:10b6:8:1ca::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 23:53:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 23:53:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:19 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:18 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v7 07/12] gpu: nova-core: Add basic Turing HAL
Date: Wed, 21 Jan 2026 17:52:57 -0600
Message-ID: <20260121235302.1962185-8-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|BL3PR12MB6475:EE_
X-MS-Office365-Filtering-Correlation-Id: 09eb9929-04ff-4609-08ab-08de59484a73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UQT3cE4UEvjG+U0VVci7x+DzjxWeISUQnnFfFts2bWClRBVhc5BmIw6mX+zC?=
 =?us-ascii?Q?hKFghEFplouMH/rdyKa6tNbQCs911tHjGrSjBwQSneiPvYuuBHVrTM+AJtFX?=
 =?us-ascii?Q?l3myyL5x3ZgT8MQG83vQxY1+dvmamg4ppHeHSggm+JFRUjFsh+mqQ96Tw3Cu?=
 =?us-ascii?Q?ozqSdJXGyEPo/imoLGQkvr4bWIAc9W6JNzqK4ig2WIKSr5nrTeBmHmRUwbUI?=
 =?us-ascii?Q?FTqrSJY+5yOCuKLR005/DaPEi4Nj3+v7L74f+pnTUlbMwHdYYyL8TOuiI7At?=
 =?us-ascii?Q?i4B/wwcF/pF4hlZ4ZOBeip1fCDpi4u8lPHPaGGgQIvuB9ID9s0/YUSQ/4ye1?=
 =?us-ascii?Q?sFU170WG4nSuuwRkbtp3mepCDrSGIk9sut5MA1bc5vr+DaLBqwA65ANabsor?=
 =?us-ascii?Q?JtHGiS42FPnP84MOK5lfDmVuYNpG+uDWjJujuJb2E0gNsqKUjDUrULiKNDHt?=
 =?us-ascii?Q?gTbyft21UeZk03UIXVJFhYfw4vTnPxUtCkiU2BDtBJZ8U+8aaQphVr6T/M5R?=
 =?us-ascii?Q?Xpt0jRxCZGvbiXulaquH4FbTv+ZOZpnBjH1a/wKBtEm1jki4Wvs2j+g1C+TG?=
 =?us-ascii?Q?i9USjtYcyexGs1YbcudmRwtg2gnL31sGc8tpa7FAmttYfyuHQ1RrV+vHefze?=
 =?us-ascii?Q?NcPcTHa+UlBv0CQ3Hlp7y3XowbCDEaMSuxXvd+S/+N+1q5SCUaRygcBp/FVm?=
 =?us-ascii?Q?yUYcKUT1wtygpTX8h78udjThJKpH0D70fYaOY8J0FbQyzB5CUpqe4t5H+atg?=
 =?us-ascii?Q?1f1dakdekaLesOMrihwLkuh8VwIojOIuUQgBF9qVBjxclDxwIIhjy5Yqn3Mv?=
 =?us-ascii?Q?qQJvD5Iny9euAVylkTlQoIsp362F3gQOt23WUyHkL1r8IDmHrTIh1Drzc9ei?=
 =?us-ascii?Q?Lqn3/a72sog7T3+em8/j0ghYr71dbkxgsY03uLx/pLxP6zEMPUA/gu0AW/EA?=
 =?us-ascii?Q?q9B/h+ybPRyHeEJmvuEh1ug73CYOSuH8IYRsWhxyhzNN9UUd8cx41Tmq/bcv?=
 =?us-ascii?Q?fZY0JXQkBCsqibpkbB41TipvJiPpU18eYAi3q48AZF+CDn4rZMt7N8jDlTuO?=
 =?us-ascii?Q?3nvUGa46O7i6O/FBFgXc/ImA3Z7YVh/bJD/NdqR46HXuCJJXhRo084Bb7PYv?=
 =?us-ascii?Q?hLdp9/KF0+KkOTAJOE+q7bxi3pKHuNAT9qKMT378HkPu8XrBKCmwLEOAX2Q8?=
 =?us-ascii?Q?6SOaA1QlDrm3mv+atB1sT9ZpuQu1Rsqfo/zS2Nt6YJXX8C3kj+87+oNCsXNg?=
 =?us-ascii?Q?D4Hr/4TdPzvJlIoN3RTCGwFN+7666a2N5BY1/cY824Fy0gQyzN3GpI9asqFR?=
 =?us-ascii?Q?F4fdDr9NQafDCNJGlmnZrJvcqpC812EQl9rDGGDTKE+iZSqUdEHOcFUr5hPe?=
 =?us-ascii?Q?+Rj/SO5hAhthMQuUbu5BLkoXk5O+qa1+/szG1jymHpFydW4HY98OJxdDapOD?=
 =?us-ascii?Q?Qv6so80jhSI/td+Mhb79XTZp0dGewjck60ZlAU0dGPaNdFWPT7UBuindCCiV?=
 =?us-ascii?Q?tI9bmvbYC/eY4EQpRPVcvAzjn5J7Qo8hx7QaDp8Cs3qTz42fJKlyzmToDVuv?=
 =?us-ascii?Q?h0Dw5CV+Zu45XjSlzyMER/qwsbCO3nnKzLWRNXAr2dDwpWFNNMS+dBRu3wm6?=
 =?us-ascii?Q?WEwyqlIXEG+KnQsPECw/0FvAy+VInJSaDJ85EpJx4P6wzmIdu2OYBfrbnYD6?=
 =?us-ascii?Q?ghRdOQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 23:53:35.3537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09eb9929-04ff-4609-08ab-08de59484a73
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6475

Add the basic HAL for recognizing Turing GPUs.  This isn't enough
to support booting GSP-RM on Turing, but it's a start.

Note that GA100, which boots using the same method as Turing, is not
supported yet.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs       |  4 ++
 drivers/gpu/nova-core/falcon/hal/tu102.rs | 79 +++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs             | 14 ++++
 3 files changed, 97 insertions(+)
 create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index c77a1568ea96..c886ba03d1f6 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -13,6 +13,7 @@
 };
 
 mod ga102;
+mod tu102;
 
 /// Hardware Abstraction Layer for Falcon cores.
 ///
@@ -60,6 +61,9 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     use Chipset::*;
 
     let hal = match chipset {
+        TU102 | TU104 | TU106 | TU116 | TU117 => {
+            KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
+        }
         GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
new file mode 100644
index 000000000000..586d5dc6b417
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::marker::PhantomData;
+
+use kernel::{
+    io::poll::read_poll_timeout,
+    prelude::*,
+    time::delay::fsleep,
+    time::Delta, //
+};
+
+use crate::{
+    driver::Bar0,
+    falcon::{
+        Falcon,
+        FalconBromParams,
+        FalconEngine, //
+    },
+    regs, //
+};
+
+use super::FalconHal;
+
+pub(super) struct Tu102<E: FalconEngine>(PhantomData<E>);
+
+impl<E: FalconEngine> Tu102<E> {
+    pub(super) fn new() -> Self {
+        Self(PhantomData)
+    }
+}
+
+impl<E: FalconEngine> FalconHal<E> for Tu102<E> {
+    fn select_core(&self, _falcon: &Falcon<E>, _bar: &Bar0) -> Result {
+        Ok(())
+    }
+
+    fn signature_reg_fuse_version(
+        &self,
+        _falcon: &Falcon<E>,
+        _bar: &Bar0,
+        _engine_id_mask: u16,
+        _ucode_id: u8,
+    ) -> Result<u32> {
+        Ok(0)
+    }
+
+    fn program_brom(&self, _falcon: &Falcon<E>, _bar: &Bar0, _params: &FalconBromParams) -> Result {
+        Ok(())
+    }
+
+    fn is_riscv_active(&self, bar: &Bar0) -> bool {
+        let cpuctl = regs::NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS::read(bar, &E::ID);
+        cpuctl.active_stat()
+    }
+
+    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
+        // TIMEOUT: memory scrubbing should complete in less than 10ms.
+        read_poll_timeout(
+            || Ok(regs::NV_PFALCON_FALCON_DMACTL::read(bar, &E::ID)),
+            |r| r.mem_scrubbing_done(),
+            Delta::ZERO,
+            Delta::from_millis(10),
+        )
+        .map(|_| ())
+    }
+
+    fn reset_eng(&self, bar: &Bar0) -> Result {
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
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index b8ddfe2e5ae7..cd7b7aa6fc2a 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -307,6 +307,13 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     7:7     secure_stat as bool;
 });
 
+impl NV_PFALCON_FALCON_DMACTL {
+    /// Returns `true` if memory scrubbing is completed.
+    pub(crate) fn mem_scrubbing_done(self) -> bool {
+        !self.dmem_scrubbing() && !self.imem_scrubbing()
+    }
+}
+
 register!(NV_PFALCON_FALCON_DMATRFBASE @ PFalconBase[0x00000110] {
     31:0    base as u32;
 });
@@ -389,6 +396,13 @@ pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
 
 // PRISCV
 
+// RISC-V status register for debug (Turing and GA100 only).
+// Reflects current RISC-V core status.
+register!(NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS @ PFalcon2Base[0x00000240] {
+    0:0     active_stat as bool, "RISC-V core active/inactive status";
+});
+
+// GA102 and later
 register!(NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base[0x00000388] {
     0:0     halted as bool;
     7:7     active_stat as bool;
-- 
2.52.0

