Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010020.outbound.protection.outlook.com [40.93.198.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2390D376469
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 22:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769120986; cv=fail; b=DQwaXP9r+ZzzCjYqvZoFbQWJFwpS0cucckVc+UXrTF7FNIkj6NUbzIX79gjd5R6qxDrSicKDTCIUgKfDIvZvhzcULgQ/y1VVAsfAlEenVIy4jB7WwmJFBU9J0Nk7SAEJ/+8BTrvYpri6O+iaVfIimNLqqCDubnP1ze9nybBBJ9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769120986; c=relaxed/simple;
	bh=wOxKvcXiKxkpF8WbWOql2l66w/tv0qew6fMgRP+B0zk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rkvQ1GrNGMy/cMoOxb4ZacleaqMwtSp4TWq7xCvmIHi7xPgMM0XMgG3NlEP0HetmODoNMKDzu2vylgrT93ST8NOOMdbwIEEH48F33MyCCR0gJdlOIeofMpYmHl7O5YECUbnpndRiJ7mwboGRNqWItqtqy/0SyZghEICxcOva6Ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aVqHZYnM; arc=fail smtp.client-ip=40.93.198.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aVqHZYnM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2PTRbEK+sZZxlX74qsS8QbD7sc4lPC56p6wiRCkLx+WaEM/Q/NoQiOg9U0CpD9Brd7YleUuB9vRXz8a9Ure/nV+l0wiZSEi+9U7B5f9vudvAgA4sMFFRsHjwZyGPlGBHrhzonP2h4NxFaVZ+++Wh3+AzijKyLMT67M74q/iDxzHUo415eliPZPyUUNTuMSkwF6nDuPgjteBidIiTH8nZ8hTuJ0xhWBSSWJOaoH7YAaghwLurLrYUkngt3LHsBbzbkJq5I4RYsqFCK41qZfmaVOr1Lh8v3Q2JM8B6OQ+uLUbDIBIeylNJO2zzgEKJe91WXx4B39z0vRMofvCkxQXAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2VggK6gItZrqQzqVnf+64OZZJouFDQdrS2LDWWSPB4=;
 b=gJyOUOBDS4X9UdfQ+Mv95WR4prDTl1IIe/grOgrgIuBR/eKwDfTDNKi9LtTDsugSRF4pmt25xwB7BQ6baOv79Uwl8uZ+8FdFKisN3SdWo9eSqvGrVQsviwqbgljlCkdoQPcFymkk2J+9O3i8PnghPH0+10K4yh+rjfhEWn9e1tRWPsSiB0zkh7KszbwR5NYidpkZjcSuzKSdHoPKgVCweZyAtvDCrdtfrv6cNJp9MRQk6O+V6kuZoXTOAxWpL3Lmw/jpWiw0CP+G3QeuygHd487eCDvM13H5Yvd1DuNj3rYab8F3m7a+P0lUM0ZZerDma7dqQAvEvcGfhMl0vwCppg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2VggK6gItZrqQzqVnf+64OZZJouFDQdrS2LDWWSPB4=;
 b=aVqHZYnMuBISL6vBCBWXadToqTM/YBcKMESijkaTG5ZU6FQoOQAjbBLr+kgs3Fks5qonHw6Z0mIqLwbC89S/mSNejTX5NK0o0gIAe5HwJ8jPlNFg2PLfYkqi0uFCvkfUF0m9HYxm2dnBAXwNVprPpTK5tnMKkaaFhzV4oHKNve/Xxk9qUinX1d5bWsC2PjAF5PJGN54Qc/D42TkPe8fLw38BsirYkspbPqJjtgsenGutgiWhhV+98bUiGiCgk4+1psPs08b3tUDpYW4TOhRFxalOxwZSJ2Eme5Pu9s4iCqyqDn0FxAwapDk5gfjd0OF6EakmoghhfPBXkw/Q3Q3THQ==
Received: from DM6PR07CA0039.namprd07.prod.outlook.com (2603:10b6:5:74::16) by
 IA0PR12MB8932.namprd12.prod.outlook.com (2603:10b6:208:492::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 22:29:27 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::58) by DM6PR07CA0039.outlook.office365.com
 (2603:10b6:5:74::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 22:29:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 22:29:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:09 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:04 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v8 07/13] gpu: nova-core: Add basic Turing HAL
Date: Thu, 22 Jan 2026 16:28:42 -0600
Message-ID: <20260122222848.2555890-8-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|IA0PR12MB8932:EE_
X-MS-Office365-Filtering-Correlation-Id: a792677a-59f6-4a7b-6a60-08de5a05b338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XeFr5TRLgFDbLOPDzKZ/KKaGo9yak0df38qk5gW+WsKI4EHMDgtuN9gnebPP?=
 =?us-ascii?Q?LNwNVV1r6Pzjz1akWSund0PNoaw7QDTPnI87yhFIEyRMaz+KVxQo90Hw+XQg?=
 =?us-ascii?Q?+2P4dk5MF0nvjIJ40yGr8mxUWKHyBy5pUdng5eVJVAwr+hf7vbHb8sKE0npi?=
 =?us-ascii?Q?6oHvk+cO4rLZYp2u/avrNNNi+KSCtn+Q4hvyLQxVEaMvEgoHnCsFVy0jRy6P?=
 =?us-ascii?Q?6zJWcFrUEPiCQBKPf6qShNeCbnWQhksM9e3/kg0dpHQrK8tVXhFwWIc6p3Kf?=
 =?us-ascii?Q?Ucuc/oSEFde3cmEyESRNsLKhwEoiv22OzhVR7waGm1CvaSr6nIuMcsy/6B1r?=
 =?us-ascii?Q?tEcaawP3/B0sN0c8PZg7LhDF6Eg+Qpr80BZC0w0H03XwBFFNOrCqOoU9dTa5?=
 =?us-ascii?Q?KD9OgoRpDDwcwdMu7VtH3SmnM1yNMGRcvF4XlC9ajbamjUIU0WFGiueVWFNr?=
 =?us-ascii?Q?HT/9iZUISREBMpZFOD8Vg9LK3CSLZ3wyP+TPSrDpYM9n2T3ATjY62dk7WjMH?=
 =?us-ascii?Q?FvCZEfdrz/8OLpfJ9N6WkyyttTbLKq47tE3myHZ96+Kskp4fpVl3WUuloB4c?=
 =?us-ascii?Q?LbwyMsveZjtW41azOc88juWZok6eaO8TIECF2qyUeFdQqmXsRuX7yfTE0kev?=
 =?us-ascii?Q?HllAFKKbewUlXlqNSNlHnOGeHSLsf0MBdBnIdACFovDVD/bPtlrQfdibg5mp?=
 =?us-ascii?Q?XMW6nMoJdQrKemoGHa2sypDwpPTtavpkA3qGvQOWzdHMuU+d4Mu8TcLVnRYN?=
 =?us-ascii?Q?Xfj+20a32/wb06UnNP8RcuoI5Oq+3wfUABOvFaMB/bqQ+9N5yEaehdVuWrPd?=
 =?us-ascii?Q?jVKdgMNdpoduWm7duv4OKhvA7Ims3qJPGuFaFDCUEkfpAmzpQCCqNpc5oI26?=
 =?us-ascii?Q?OZbJtw24AHaqLrQQflvdJLqC1KDhEvpLSqJom5TC+u+qH6VCc6AiR8vQo9ef?=
 =?us-ascii?Q?ZK4UZukWIIsrqId/UNK56J3h5JmSJI+rwq6jxzSFh9TqTuLjsJm8eJNcLic/?=
 =?us-ascii?Q?HMFsVqw5LJKZ3uS/4SWgvptKN0F/Ayv+OEWHwJC0xEXf2ZN9kkMJmcgu0anJ?=
 =?us-ascii?Q?QjFP9I1WUKJePPLNdoutetZyCuVYVd4vmix7De0eSesf146wQZ/vGnw0uqUl?=
 =?us-ascii?Q?4sPV4dOJBWhjJClcWwueSPvhAZtvIsdX9PZzqRty+nH718KfZRk1jAdTmlh2?=
 =?us-ascii?Q?N4ZWwVFFJFd2AEP/n76YzvPodC7P05YN0/g0Vd6l2Ka/1zb7zOLZrSxsGURs?=
 =?us-ascii?Q?plInzLLm2WZ4NZ/rEkC2A3HTmCYknD7ULSO/w90FNtpGMO4TAg2skfiVw2U4?=
 =?us-ascii?Q?0744SYYoYGMgz9Gq1P2J9yM+5aPEYTdM6vAkFVYQFGJJQetv0XEYF/8wEufY?=
 =?us-ascii?Q?d4sqo7gNmC0McGtltlvE3wQ2JXodopx0ZDACC+tncOzgLRVhkwH7rCX2WsIp?=
 =?us-ascii?Q?mlEA5sh4AZqqSfyg1jsnUp4/z1IdWEPBucUMbtZbEfnwSH9JMFoaF+pFo9op?=
 =?us-ascii?Q?9YSRsLlC3uFrmCo2FZTnrzo+Pyqi8tZMtOGO77t1zT0eZyXVNrBDBJexNKCV?=
 =?us-ascii?Q?0DdlbM6Lm1En0OL59QE0aJmdUCazy6X4PI5GYJIPrrM2fwJH/wDqCceKH/fa?=
 =?us-ascii?Q?i/LobO4QXIjhtu64RBwyawaLAUtiHKDqJMflMQ3w/toTTRbuJpJS1xb5dinX?=
 =?us-ascii?Q?AGIo4w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 22:29:25.9844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a792677a-59f6-4a7b-6a60-08de5a05b338
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8932

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

