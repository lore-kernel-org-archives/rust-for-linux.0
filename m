Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012042.outbound.protection.outlook.com [52.101.53.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7A42ED84C
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 21:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773955658; cv=fail; b=WJRmuk0fbXCl9jGV8G8ss/EtYjcxYcD3XFWQpDjneEGygD7A5VLue/aQrpLVjl6KT1gx6yovMYD0opw+UB8PVlYmOKrPn8CV83nUB3eLHrYm4lsfMoSAJ+sUyeEbKmL/BYIXN+C3SFMiSpNW8iEWizqd4NeQJ4h7xUu0TE8XXWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773955658; c=relaxed/simple;
	bh=HsKUupwvRyNFjzUps/ArWl2kwA5eH4F2FxQZ9aNDVxM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B4YgfT45KbO/cxDPDgYg1VwBZMYvn46/OAx/QoHaanc0o6PBblXeRnw32XKqUjTEoRjym5ze5zwQsLJ8Mr8HeGjcCLK56tYcoMzAGMwgNHs+twvqxm4OI/7XOH+S9En/dBK0IUfpRh8bOIW9xMGyrmU4qGMzzUonsdgEbusx2u4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Aj5p4U5H; arc=fail smtp.client-ip=52.101.53.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Aj5p4U5H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gN/VR81sXj6mz+7hgBckGqLVgr4kFtFx9l8FnzWfJjTHrookh0rym0vPvL0Dr1PF26AKQZrVJDxu1DC6ds/sDOIm9UdqbK9HRirkuXu32qGN0OIHKvTgLyuUYhT0/KinwuEuKXrjHuGCyUhzMg/ew9e/V2xrVJbUoliWTtBtJ/jlojj4fbhgWNZ0CXjmkWN/57MEIZjoJQ+Thfus7H/yjStMIyH0eRSW+C/q2zJmsU5i4P83K6gXAp5As2OHfy8QnlFmPoG7NrGRLrpDKX0iLnPIZWTaGtORFreik6jEi0WNbgL4KgvKuvSkEcqqIj8VhUBsMdVsPIup3izdLXK3mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sm+/zoqU12J5qcgZuh/l55RNWCvkhiovPNZzBzHfdgw=;
 b=xIqN8RehQZcP00e2w3z7X6BeU8Y08AD4uO6WCy0cIzCgtkDIuToUfvKMVqBovdbIJQ6hXmWMw+PZOtmaqEESMBqJRWDuuwIm5rjfI5GIZiRiPIzEbJtjNf1din6Rna7grlWBO5MbcFgtrxAS9oZsNAjFjFr57Nbso55n1w8L3dlf1l6s4lUVDPVEq2rdMwgsKSnDlGauAnBiMTe/eHlRu7VgyCeUK+/NflIoFf/x8AKGBvbnnv81K2b0nMNl2wslEh4FSLlpEp35XeUZVjXW6jf6Bxyp7d/dvdBmrM7pEnRoiXGt8wb6d7d4KbHVgbFvGHaNGGb6VOhLz4B/xu+XbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sm+/zoqU12J5qcgZuh/l55RNWCvkhiovPNZzBzHfdgw=;
 b=Aj5p4U5HG/q5ORZA9zVxqJyr/KLOXuOBR1WVeH7hbwnZ/qyT45nueS0ENuIGFCjRVaEO2mrMgHhKcHSEutEcB/O3BucW3+ebldqbLnHwQhKcELRkrGoREpGUWAPiuKLcipV4jDzMskTxd7a7c8YQd7wFFrYlC3hBlreFWqQMo9Gtx6WoW5LyrU8SFVrCENk4/nFDwaT+XYI7QiimXB+lWgI4hHMAFyuPtKWX2OiO6ryxjnSSK/HCOHb/Lo+8q4S7MuV3FfXx3gGpzZhDTUq7kyWx4e3tAEyJtpvF8y2w61O6SI8gUGD19Yj6pTVZDpzxXzan3BZ3FoCZh4qa7LL9FQ==
Received: from DS7PR03CA0105.namprd03.prod.outlook.com (2603:10b6:5:3b7::20)
 by CH3PR12MB9282.namprd12.prod.outlook.com (2603:10b6:610:1cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 21:27:32 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:3b7:cafe::77) by DS7PR03CA0105.outlook.office365.com
 (2603:10b6:5:3b7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Thu,
 19 Mar 2026 21:27:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 21:27:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 14:27:16 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 14:27:15 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v11 6/6] gpu: nova-core: create GSP-RM logging buffers debugfs entries
Date: Thu, 19 Mar 2026 16:26:58 -0500
Message-ID: <20260319212658.2541610-7-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|CH3PR12MB9282:EE_
X-MS-Office365-Filtering-Correlation-Id: 7880ff80-a3b4-4c29-1007-08de85fe54da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pNVTXXNV881OC8JEZNvBOmHwILjjaeiPhN6Gk9goeFpWauAlZfNbB6l49vtDZwyzUW75wx/LNScoQiYqLnA1EJmcL8GdQfDJ9cUYajVGI4/CHcLbGpYJrjQdegIHgwUqVBrr85ZQQPDKxdK/n7giSzAthf0z5I+sf1rFCL1sw1l1DN2oq4WsiSJYzVXIEiBPiH3RUksSl4iIhKNwpW1c2NOE8dTDEDok+d9JpB0a8KQYGXWlmCKoOnU+XpZKwbsq+Z5Jg6Vj4sxkIhfCkd1kMUcyUoVB69qWwZAM1XIEF4UjMZJiojSGkxNomB8heIySq4Rhq2dp0rMBDByBtpjgByo9m0NaANi5tv1rVrRgC07J4mmQtOs8yV4R1DNw7RolgFRBUwnLhvqI7TaStJd7nridbXU9cZpiMD9mRGAdYYegY93vjKtcH9lA4RAQK6uUxYWIrW+lD69Zn9DBnXKPcnUonzdehAlx7nzLe3d+7QokycRJHauVFq9FfTavWo6mqq+rNvXc9dDqlf4rvelBf8Cjof8W9xFwlO310vPYflTUYC/pWoJjqXEdnMuxOqmW2LyXUq7RRiWg09nBy3DZK1Q8QdE/cdCY6U+gB7Eq17zn4iOhOqOtuvB6wxj/WcbupV/h3WGvZ4tC3WUUI6iR42iQkHt3tz+zrLGPVmzCd4litTLkB/7dlXSkfvAWNsSJ2URkcGF6JT4viIsyOpx8aW1szFsJxnJJ/GzdqWtj0HH/M3qw95OwrXXt8Mc0ye4H6eDXrcV6O2W5GE/rYJzhdDW5Qsh5tQUc1ed8KkDFuxzwplwSXmY+z9y71Bm+8vqp
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aproGxOyvrtBXOx74HFg4KmnA9/u0xEiSx6gpGmAM5nA3LbBUoZZ5YdBuPLkciPZwHSH/ynJ7rY+bNpRb1W/HaFb2wNffB24eN2FzJfyV9YLhF2o4M+REmHThoyY/zUbli+qRfp6Q2w4f1lEpD1NWnLCHg1OMQGtxy0X4OOdB26gmkxX29TC2bCTcJ8DGLFfxJN4KqX4WAclfFtph+8X/RGnMM/IHLPLHdu1CT9CkfcNJfgNUV7jArS3WTb996BNoERELcAQgiysefBM0Ue1uVaWlBh/um7JLPwORaiXBVa7z4Oft0niWNGu7lDnhAEciQQjCkKPCZclieuPnA5J5N+G8w19XXuwlVCSm/jpXuM6T6v2e0nqN+VsQB3QbL+JbzJPSBJ5/ZRhPzHXca083tup7gz7XzFMpCPxfn7s5T9ii3e+FAjTiptQGx5kEnVa
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 21:27:32.3262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7880ff80-a3b4-4c29-1007-08de85fe54da
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9282

Create read-only debugfs entries for LOGINIT, LOGRM, and LOGINTR, which
are the three primary printf logging buffers from GSP-RM.  LOGPMU will
be added at a later date, as it requires support for its RPC message
first.

This patch uses the `pin_init_scope` feature to create the entries.
`pin_init_scope` solves the lifetime issue over the `DEBUGFS_ROOT`
reference by delaying its acquisition until the time the entry is
actually initialized.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: John Hubbard <jhubbard@nvidia.com>
Tested-by: Eliot Courtney <ecourtney@nvidia.com>
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

