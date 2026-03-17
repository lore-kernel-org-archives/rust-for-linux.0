Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010058.outbound.protection.outlook.com [52.101.201.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7902E3264F3
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 23:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773791686; cv=fail; b=EqegGo5cgGef8YkmJEx2Lno4tULw5mxCj8G7pZvBFMP7ZAkBx9ceYDVYLpsGa9nn+vpq9dWxwH/uzv8Ue8klbBGg/2JhlbtmzA0vG0O6tLEiXDfcCI0QNAqxrteNUOhSqRAgzJAOtsTJBIRHO+e70jnWSkwTqoSK/wfmNLlYB60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773791686; c=relaxed/simple;
	bh=+hzAJMwyBa6hsPerUTQgj9BdJ9RMlydZ3pIwhIEkqnI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u/ndGg0hUOAvBaTMBK5CvGv+HNAuik80NhcRJujzjRmbhuMxgOvzN0hNKGkc/ysmFJDUi5QRzHdjP81Ck7Fe0pdxR2RZkXlX3V4S14wpmC4bBPypfV80K25L3J/N9AlmWHNMbjep5asXDlTAlEkoqo2X/yXMpY9TvJdV1HJUeDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SBLDo3cy; arc=fail smtp.client-ip=52.101.201.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SBLDo3cy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJWbx1Kc1b2xbNMayO7GOPZpJRSPF7rvZY3yTg3nihHvnaZJFi4Ms9rBkFfh/PLzagLOzAT1aQSN63DYmz21vtgTBXn/bwIzvvTfk/eCr0V8eSDFf74eaAeRdZoq/NqijtNVXApBdWea568tEi59tbQlxno2+fuREMGUQx3MjGF+1xd8TTJt9MG6J4fpBA8VQCdHmWhmX0Kfsb2qnIvHIT9tz3FBkfXlB+2/VK/T9FaDnSG01c730qqniF4Mkbg79bcpRbVY+06fZEFx0IrnyMdUUBInicbBUhY6sjPzqUzLrykCh7HEzv3L9Fc3x/hvyCavq2dzQRUeRf32K+hTSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48OUjM2VSaThOij67ejmZNLNSerchoZrpfhjULQsEX4=;
 b=LDxjh+wzT0EKfC93jOmIR5naloTfZYfc+BS9jvatueV4ugsfyQGhoFonW4jSwYmEISFqDJAMc5qTxII3lcGykG6GDGhSyD7Vwjv+KXgG4qvIrPspuCsdrpE2pwrkw9SJvAQu65P5+DOkicH8EkvKPhXgILzY4lO4AZ1N6b/W+/6ORQZvvuv9xHqzSrHNynaRQQrq+EkgnLsSGjh3vHfZOQFf/lUzOznCmMQv/QnoaAQ1yjkALJnUDL+w5VUFoUXuas21jqSLFQRCHqUnmRg/hNcZVA+hJ1af7M1Ky0zDbk3yGlih1B1uYxe/Da8C5b3neuNDV64pJjM3fYEsZsNYQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48OUjM2VSaThOij67ejmZNLNSerchoZrpfhjULQsEX4=;
 b=SBLDo3cy7IxoT6y8qWl2+LwfiV4QovEfjE8kQbEbosyzmF13GfTGHowHtnDflT7wzsPQFlxyOSUIWPU7StmoXBWNASuaXXtO3EAyPZ6n5E8WIW4IR9gpREKkoazt4yWF+byTJsYsQIosTOuqPOZFWBYNm5ywWudaowA9MfspDkS11JZfaILikocc0B16TjDgbv8tjuoXRVcKmFnl0ucoSJtvLX31UUSFg/lIEts/MSzGtvaNGhl/tuSsEP5NRtwpwmvgXN0MbGxGS46ibnTjmdQI+HpwItmktRuDAR8fojWJp5VgglpPnUizPvqeEjjUTqKQIeuROLur2xRurbamnQ==
Received: from BN9PR03CA0869.namprd03.prod.outlook.com (2603:10b6:408:13d::34)
 by MW4PR12MB7437.namprd12.prod.outlook.com (2603:10b6:303:21a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 23:54:37 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:408:13d:cafe::ef) by BN9PR03CA0869.outlook.office365.com
 (2603:10b6:408:13d::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 23:54:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.0 via Frontend Transport; Tue, 17 Mar 2026 23:54:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:54:18 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:54:17 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v10 6/6] gpu: nova-core: create GSP-RM logging buffers debugfs entries
Date: Tue, 17 Mar 2026 18:54:03 -0500
Message-ID: <20260317235403.1094713-7-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|MW4PR12MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: 3669dcfe-7af0-4010-dc4e-08de84808bb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dCcbpxI86+9a/Dz9XMEz9yIalUdscLZIcFjNlKnuhZ/HFmqmdu+YuBmQvbFanjTidPdoNA+nJYapCTjqPb4/bk70ur7WW6AatO0HrEr8R6IwT+Z8ON2dYzCISuDLsEHxQfEhjSm7wna6/X6lL4vPacOX1piCCXwJq/m9ynSPr0fb0K2nvrWKdwDiSTYA0azzonZIv5TgKr+tkjUKbPN3vUJtnx4mGK8gyYtJJJwcNmgo1IkKtL+Kw6SMaP00sf3GtgUoBZg03+dl47itCmqgRxsg/RNP5UIpO4VexSfxZoDxK4gZqjeSSwGwZjQsseNBzKYfB58iHVRWz52aR5DQety+3vULeYCL4aLw87zyD3B/s/XSk+3TVrElcfDV+fV6V71erOEQkOfV36jZgv85/a4fPhaiGv6xr9jiyaBgKoXFfvRWPwzyLsF1hsvwo5qKIzoCX6WMkF2ezxVYuxjo+8Q6O6HjWENn9UueNq9W6kpDeawgVMhuAZC/tY4eJJ8oNBCZ9fAy2TSEOGtNl4v5zvs/k/mn36PcrO5gBo5z50CyDi3CvLFiAGES/u/5X9pFEq9ZOAYDYZU/zoUr/vI+PpNaDezia2axPKwfytpja+u7/bnj9Sctb6tJF1YYFM0CL7s5i5NpBZ1WXcq1YhKuWclDi+AXPuL28abX9r6zxa8XuxF3I2532NWkhQ8sWjR04wiI5sh+ob/GSo+BlxRrFIuPQS+pTc67+hE8MjCjvELeGEJV/t2awcCQxQPMKRoMe7OIHPh6a9to2YKu6O95YQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hsswv15Z74EfHOOMpzKd++9TuCdKa6fcEvogCuUc8HxC7q1/PkO+m1TgIfb/V0pMIa697raDT4Tm/nBWLJ3lYLkTotPpDaJMxuTz279PCCEa3IonOH4iragbewD5QJmlMESJwASvHG0KXKoPLCcOZMV8zk/WJGi1D61XpQFL64p3hBPFBdeL1jnUmkl9Xi5bylEyvzaYtycsBIEVEKfxl9JFmhxs8KVFWaTCnJtQC4CoLVI3JvaS6HvLLktivRKotkbf/IFhuBYLExvvdc7I0KxDNOWJQoB261uFR4JhfDYq24YGXnWbPZVC69Ilsy5b4fyffNvfOYR8CHkhDGXw3yvRyb5rm5qo8vgMuS0SE43ASt8i7E5gHSudMCYxrtiV8OlQAvyn8IXJ+Cd8K297sdykRAVqFJuSnXB2rip/X27UR/iymWOs1WqTt2DbU2Is
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 23:54:36.5965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3669dcfe-7af0-4010-dc4e-08de84808bb7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7437

Create read-only debugfs entries for LOGINIT, LOGRM, and LOGINTR, which
are the three primary printf logging buffers from GSP-RM.  LOGPMU will
be added at a later date, as it requires it support for its RPC message
first.

This patch uses the `pin_init_scope` feature to create the entries.
`pin_init_scope` solves the lifetime issue over the `DEBUGFS_ROOT`
reference by delaying its acquisition until the time the entry is
actually initialized.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs | 48 ++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 72f173726f87..9399783ccb8d 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -3,6 +3,7 @@
 mod boot;
 
 use kernel::{
+    debugfs,
     device,
     dma::{
         CoherentAllocation,
@@ -102,17 +103,24 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
     }
 }
 
-/// GSP runtime data.
-#[pin_data]
-pub(crate) struct Gsp {
-    /// Libos arguments.
-    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+/// Log buffers used by GSP-RM for debug logging.
+struct LogBuffers {
     /// Init log buffer.
     loginit: LogBuffer,
     /// Interrupts log buffer.
     logintr: LogBuffer,
     /// RM log buffer.
     logrm: LogBuffer,
+}
+
+/// GSP runtime data.
+#[pin_data]
+pub(crate) struct Gsp {
+    /// Libos arguments.
+    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+    /// Log buffers, optionally exposed via debugfs.
+    #[pin]
+    logs: debugfs::Scope<LogBuffers>,
     /// Command queue.
     #[pin]
     pub(crate) cmdq: Cmdq,
@@ -126,15 +134,17 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
 
+            // Create log buffers before try_pin_init! so they're accessible throughout
+            let loginit = LogBuffer::new(dev)?;
+            let logintr = LogBuffer::new(dev)?;
+            let logrm = LogBuffer::new(dev)?;
+
             Ok(try_pin_init!(Self {
                 libos: CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
                     dev,
                     GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
                     GFP_KERNEL | __GFP_ZERO,
                 )?,
-                loginit: LogBuffer::new(dev)?,
-                logintr: LogBuffer::new(dev)?,
-                logrm: LogBuffer::new(dev)?,
                 cmdq <- Cmdq::new(dev),
                 rmargs: CoherentAllocation::<GspArgumentsPadded>::alloc_coherent(
                     dev,
@@ -155,6 +165,28 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                     dma_write!(rmargs, [0]?.inner, fw::GspArgumentsCached::new(&cmdq));
                     dma_write!(libos, [3]?, LibosMemoryRegionInitArgument::new("RMARGS", rmargs));
                 },
+                logs <- {
+                    let log_buffers = LogBuffers {
+                        loginit,
+                        logintr,
+                        logrm,
+                    };
+
+                    #[allow(static_mut_refs)]
+                    // SAFETY: `DEBUGFS_ROOT` is created before driver registration and cleared
+                    // after driver unregistration, so no probe() can race with its modification.
+                    // PANIC: `DEBUGFS_ROOT` cannot be `None` here.  It is set before driver
+                    // registration and cleared after driver unregistration, so it is always
+                    // `Some` for the entire lifetime that probe() can be called.
+                    let log_parent: &debugfs::Dir = unsafe { crate::DEBUGFS_ROOT.as_ref() }
+                        .expect("DEBUGFS_ROOT not initialized");
+
+                    log_parent.scope(log_buffers, dev.name(), |logs, dir| {
+                        dir.read_binary_file(c"loginit", &logs.loginit.0);
+                        dir.read_binary_file(c"logintr", &logs.logintr.0);
+                        dir.read_binary_file(c"logrm", &logs.logrm.0);
+                    })
+                },
             }))
         })
     }
-- 
2.53.0

