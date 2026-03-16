Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013063.outbound.protection.outlook.com [40.93.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF4C34750B
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 05:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773640702; cv=fail; b=fdFxYZ7qv6fogDeu46ZwqqpW3u+phpVMk8V5B0+ok04jRWqzB4FJNV3bqOTaX6ivpCk96W8ROLr7EQmkRjydWF7bWzPA0gCcToZ1PQFbyuq82zjv9nnZY/L3Rwm3hxs2x9G2hFFRQY9+W6VapVnBqelNlt9uZoLw7Avj/QEYbL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773640702; c=relaxed/simple;
	bh=qyE16aIpCdN7hJKJMr2ezHGCc8GciVMBh4a6RCFauOM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cmkQE2qV5o5lhVsB22RRvUivNYCYj9vQVYqv+WOPI2TuxBEXPPU29J8Foe2DprtgxkJhk5bRQ1PNAs1hXBitH5m3Lh6T247IYzm7rB3kVLOn0UQSXaJFjEkSbtv7Mi5vzL0+KH/uPo7rGOHc1opEmvgA+SRsxHHJfhYY3jZx2U4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SDA18yxK; arc=fail smtp.client-ip=40.93.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SDA18yxK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLqb/q9b1uBQb34OV9ic0glXdRZdRrXMmjc2j85W81CS7lydrpgvOfqQtXvwPEKOYKWqR64Eyf2LCdR/3KA8BPPpO9fCL6dl5GuVIfS7r8/4E0gNJPkgsoL21jmX11QsQ6t0Yr9bPNJSTxa3IKJWj3rb6luFHJgaJHr1KNYLEXpNDwwvYIlKdvzdQjvs0jehCU51tmOsJV7zwRg31SrYNflxI2xaiOh92dtoZQzycOF2lgJq/SAxeMubnEIegS0hiXmofUFLsvk74Kz6nw616fB1IOcFlUv6LgUF2OkaMWP/ItW5Xzwg+ASzlDnYi2VNy0D96BkhyhD2OAOfwjJ4fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PLWnTknfUMs6uSJzpwX5x6qTZdJ26xgAhf9W4Jrqvo=;
 b=Po4uj1HffgnVusNjPbo2LJm5gYIx291u0prxRdl0Fg9FU6lH1Aauh3BZbTV5Z8sIPKrB3DLL4jcDwKD9RVTlJjoFUYWzHlr80KzLEqhtxnheLlhLcB1eJYkvNAsfBYAvi3p9+WtgfXQdYF2At9jOCMhaikYWadFjQIPPS875ACSObCDw3HdLK/VBuOuJkn+WOI+tWU9FUzJIR454YGQCGy/XHSNdYr0yj9A7cJeZmf6r2apvuP1g+uIpnwNgFzpx2F8o0nIxgTxP3KIVgll30lBGV5iec6eKh/oZQbkMmrsbRHlWzCceWEyKNamCe2B+M2jC7Nk22JciN+FtfuAb8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PLWnTknfUMs6uSJzpwX5x6qTZdJ26xgAhf9W4Jrqvo=;
 b=SDA18yxKRoY69NHNR3SCX6qbTWfhPAxYI0MAM0Jrveu5v62sNvDILqcx10JkPa81NA0jG+HBKdJNSUnRqaajBDu+qWT6MRZPFHm0MRdNN9Rp0xuuzKpRsosTW8a7kztlsSozAnyZMCeEuNQ4Kpo9kEJQBeCER70oApV1tQpgZ6NZoK1CMQljV8fghlIXAE9CfyuhZ7YYf1SCYFmfyhmLmMwqrDSyJamo/wLLMvomzq5eh/U3czOpgFpZbcGSfi8IIfixyBVLal0muTLKiL4lDntisIHwFhl5zofkV77MbjC3gYT4zQaE83eP9/+PRg9g7rItW8dJMd0mNm0HTc9KnQ==
Received: from PH7PR02CA0002.namprd02.prod.outlook.com (2603:10b6:510:33d::33)
 by SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Mon, 16 Mar
 2026 05:58:15 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::4c) by PH7PR02CA0002.outlook.office365.com
 (2603:10b6:510:33d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 05:58:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 05:58:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Mar
 2026 22:57:58 -0700
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Mar
 2026 22:57:56 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH v9 6/6] gpu: nova-core: create GSP-RM logging buffers debugfs entries
Date: Mon, 16 Mar 2026 00:57:36 -0500
Message-ID: <20260316055736.1690546-7-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260316055736.1690546-1-ttabi@nvidia.com>
References: <20260316055736.1690546-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|SJ2PR12MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d05997c-86c9-4aa4-67d9-08de832103b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|18002099003|921020|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	OEWVYUJH4qX//Q94Y7pjps7gdwUIE57z6VBVFTC//GEcMrDIo8c7bCNo/D8uHVG3cuL71oB11J8zptyi/jGxzEiTzRnv/ADFMKbc/4a7rtMqL3yXb3/IDEffT0ggLZkASSFVD0zy8+DAhZN9+zWUwpFPfV3yqC6spv3KbNeWax2BePUgX4Gqp1WZKggON1bC85xRyUBGA8o0w0qTy/CUpU0zlKWLkzJ/6RQvUu30/XRfPaSw08SA8fxOqkUnuJYt+Z+ddqayMUAHSvIvoW8tvb2v2uLQBKi4OUPNEZqID6UEkCQY7Mg1ANBaltiOSJEyHwgkcdRmid13Ymc97qelzRRy0sZxC7gBurUYyCBaY3imFSrl0K9Pe8uB3X7MCb3iDWCpTzZvvvEWerXckxBAtsmH3UV0OQGoJ84qt7XjRcDQs/otbjirUPy8M3wvo6mdJeps9KsdpJ77DYdoYHG98Bbe/oTz643808UBZybG0dh76uisojaHMLcNh1wJBXqiY4LIPcwbVoJpQY2w9UoKOl0LAJ09bFw7xB2cZiQ9kOLHYIr8p08tYkdGtocWZ4Cd57fZzYrLsfaM4kN0wO1/jRHYrPmoy8EqFJ+rgkoVTAzXIdA/p94+OuJu/qRDyF7azXnwmfHWwTsGSX0S0EmT7jePOgr5QOmQ/UdvTnYE58I4A3TrA6zqbis6AJ9e3rCdq9gxltfLO7wqUgJu6kHpldgekw35gF+5uOWsbC8cjU0C99Rz++UkgjcHWMr0hFYZPN7zPbRxBEvSBavhcKxgXhdo0rI2S+DVE45ZZyg65oI9t9P81HiyP4jgjKZ8mxAE
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(921020)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1qYaZtSOCOnw6Zn/yBM6amys1/HENd+pugQnUNSskrz86N5OqPR3e0Hs4nda4+J0LoAf/tqVru5FWiO5jiIaxMiA1rTY0ye7fG1m/KbzGvlIDJL2XOJr+zFdHST7DXyZhkpLDg8VYeGw4H015j9F7BcRy7bQ9NVpzuQpDzoxjA8D3bZeM2Kcjz+LLzw6FFnglmxyU88Ys6biVcgSZlM6WsCSlyRd8LWzWHQvYi2tSHyqJtJsdMm+eanKnfoIDadVh7efkrUtefxcYjX/fmh3xCjiqQe+2/hxGh82Xdy/294Cky+H/U9II8Eauc2Z3XQeWfJb7gZFg57q10HD8QusRAwkeydDsJK6wIjRMWbw3P4CkNTm0tK0CtALerDkDB/mYbg1H+B6PC2ggtOrOXpRXaGLDVyaJ8CmfvlESpqTg0nRSJbuj5J+BzXeYDmZIL0M
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 05:58:15.1000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d05997c-86c9-4aa4-67d9-08de832103b4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8690

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
 drivers/gpu/nova-core/gsp.rs | 49 ++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index a6f3918c20b1..484e6aa48bf3 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -3,6 +3,8 @@
 mod boot;
 
 use kernel::{
+    c_str,
+    debugfs,
     device,
     dma::{
         CoherentAllocation,
@@ -100,17 +102,24 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
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
@@ -124,15 +133,17 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
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
@@ -153,6 +164,28 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                     dma_write!(rmargs[0].inner = fw::GspArgumentsCached::new(&cmdq))?;
                     dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
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
+                        dir.read_binary_file(c_str!("loginit"), &logs.loginit.0);
+                        dir.read_binary_file(c_str!("logintr"), &logs.logintr.0);
+                        dir.read_binary_file(c_str!("logrm"), &logs.logrm.0);
+                    })
+                },
             }))
         })
     }
-- 
2.51.0

