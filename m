Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011029.outbound.protection.outlook.com [40.107.208.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF9A358D1F
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 22:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769121095; cv=fail; b=NfFvWG9TBYuNEGpW2GAf9alHI+aVyDwWLYzndz0BT4awYaBzX8aY/n8x+yPulKe13ZINp26jFpuJFCojnF7osRuHlRxs4B0Un2335VQ7bS1Bjkd6eGyJJ/C8Sz30WM0HM/ltPj+dBaHOfNOCbv7m8Ya1V55O/7wzzovcZjkwCBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769121095; c=relaxed/simple;
	bh=a58u69okNN9wLMQ0SMtnVqAZ3ETTjTzwVFx6wGlTKWg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D17I22JM+QmEkSXuNg1D+hIciQ5CHQY5iR64BO8i5+ZGYwh8UDV8JTahl+8AW0e16/XQBlsOIKSlmRPBtgkvPMQjGtZZ7Mznos7EAUprwvM6e3NZDYrtqxgUgra+acEXTM0rUyokpq62R5T+JNp8r7GMijXArmpuztXppB7dEbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UeUtlCtz; arc=fail smtp.client-ip=40.107.208.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UeUtlCtz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpV4jGb3pfnO2WU3iuXv6Uee34qGiiwh/hAdM/r4+1/r4orKo6UdeOUOlVJhK6KhNXvqFMNL8MnVZbR1YdqZrf7TGrF6IJ4wd+WUOqWJtNBeYGtlmNWygjdUXToH1FyLxZRfz28lWqX8dMogDz1Lq5s2XQjayEKU9V1ko/MM7PUfVl3KzCBm6mJr96TS283OPhltXU/EZBUM/N2pO9B2A5QRWyg4BFXCM+HGe2xMjGTFQvSn1iSRGuWX8i9lJWes6WKIpwui+hqv5ZhGxYWxcw2Stgu2C2Kr0mm5AsZCVUnVKrggTWNfBywDNtmRwQUSrkDry5yb5gCot7JgQXHl4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9La6RMHmijQ5g8mlO4HsD3qGWe07gyRJ8Er1/W8uKms=;
 b=iyTP08+ZNUp/ovv6mWF9lEWU3qrs3mabKIHtkZBEbxc0gxA6ih0HfvCwVflYb0wotd55K01IE+biAQfSa/KLRv9o9AaCTwOgFD0ETWxLVTeGG2QuSTj1SO2dVY2Rj6JpqT/FGouP/U88FyEgmJCf/LcNroCAyTSF4BeAqqcgNPefRjrkcwKcOazV1saKr0NcdRTB83rD5DE61MNd67lnO9cVq0fAqeQwcLTG+edhJ65+nWcS/MzH+SIWCQNV6LPiZ/Q020HxGshE1467IjlMAKGB396wpNml0XqocqcA++sn8PKLqYeTnEAEXDduMVcg6S6OMVKvgAs4EqhDbar9MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9La6RMHmijQ5g8mlO4HsD3qGWe07gyRJ8Er1/W8uKms=;
 b=UeUtlCtzKQ5S867Ear+T4lpIhrUxRZeJtKkM0sMjyh61d94nLprx/tXzqxCys9DSFPOSxpxxaNBXlIcvWPyhovPayVo56314xSQYH/Lv9+AwcqSKwM6EYeuiVhlh/wwbYlx8i3Bhno7RSsiuvQ4uZ/KYULFJp49BhZX5yXQ/uOLU2EsU3Oux/LqZDf6n7f5W6gyjnSIEXhlbDVpYi/VPeXuBx98+3fX+KoLtIsX+/7KKJ+HJBC6Ko3ohlONkApY1AmVFAB+K6SmcNWh+M0eReBr8TrN03FgpYFxtEhP9+HToktqFpBTR0gBoJoDESTJsTLTxcug29a5YrPxUM9bgkA==
Received: from DM6PR08CA0006.namprd08.prod.outlook.com (2603:10b6:5:80::19) by
 LV2PR12MB5727.namprd12.prod.outlook.com (2603:10b6:408:17d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.10; Thu, 22 Jan 2026 22:31:21 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:80:cafe::ae) by DM6PR08CA0006.outlook.office365.com
 (2603:10b6:5:80::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 22:31:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 22:31:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:28:59 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:28:58 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v8 02/13] gpu: nova-core: add ImemNonSecure section infrastructure
Date: Thu, 22 Jan 2026 16:28:37 -0600
Message-ID: <20260122222848.2555890-3-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|LV2PR12MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d14a0e-b801-4d1d-34cd-08de5a05f76e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8mZvcqDlqprGyyPN9GmWLUNAQZoxCZ4Ok7EiBY1yQaLfI7EkmXgiL59Vsd9t?=
 =?us-ascii?Q?B/PVav10feELUuVOTn/dPqsn2E9M10WRU5rNh4kO+ZM1CmLMf5DdYHJtsJQ2?=
 =?us-ascii?Q?wGcbYR0Z6Q4LP0/tnoQjZnIPYYWTF4lIcTqIucuspXb7SlZ+7LOPv8T6CTD7?=
 =?us-ascii?Q?KCos/jM6Yde8G8tY5e3Yg3Z1Ly9++zAb5OFgwTfdA75PF3R2bkDrTIRpOlP1?=
 =?us-ascii?Q?I+KMGTGSbTQXqrMGNuWXyAStGBzQNBcQBAQ9BZCi4Ox0K/NS2+Olmk83eAYJ?=
 =?us-ascii?Q?9zEIYErqnXRn7Yn673cvHvJgGXX9G206754cQm7FyB7uThGiHA6XUfvtmStW?=
 =?us-ascii?Q?drkTm7oQ8NOD96dKwiryaGjXG57aD3Kn/ZtFfNCAzjakvZiLZAYzLhcl/3y7?=
 =?us-ascii?Q?L/5oVl27PBEFIjafZS03FnT6Irz5qNfaK+rnLF4JKsPHmXhasgqUqaeYQHPc?=
 =?us-ascii?Q?lPJnCBwiBIkEBdExdHQEcAgIGTfp7Obzt9Pva9N5q+gO6yAzK5hGhgsEC5tN?=
 =?us-ascii?Q?uythuzHfAOvYrN6a13vxPV34C1zzcmq226TegTmbzrGYhj+BsLB91a6/Tpf1?=
 =?us-ascii?Q?3MWd3mlZTb/54Sfp3yc6/YJjnb2SBRtZyPllf1x6yqXzSZerHCIoQ5OiEMk0?=
 =?us-ascii?Q?2CpjjaEvV+34BX8ehlSGmUhBDRHGrmi3XFbnmE/OfJyUvrkpA4mGoPmNBpzi?=
 =?us-ascii?Q?ENEAyY9A6nD3APo93WPEDf9Lsrx5h2vKg7+tHOswMEG6yMIGjQbga3SYTWnU?=
 =?us-ascii?Q?UGf7CT/gUXhMUEltYHt+4kK10geeGUFXvsCdJx50yA7jXP4jnvU5D0N/CVi5?=
 =?us-ascii?Q?7hMtUytkuz5BklsMRl3ey0XGYiWwAugncqDkDUkS60kT04kWwXTaf/GkfMLs?=
 =?us-ascii?Q?tkMW/ilzBktaewiIIDyMnGSDkDu8X5w1CIAL04JsVpTUvVjo94gB3NVaHuZM?=
 =?us-ascii?Q?Cm7q4cr7JiT/Cmw0HmFdSuiqDWED1NKae/eLl7MPPuR39ok8R6G+CdqDPPO1?=
 =?us-ascii?Q?9ml9qqGP35mpL1g4D81C9QQC9kQLE3DVOmsyazmKHv8oOJAtnl7nf0izlatB?=
 =?us-ascii?Q?7UteJUlnkfnVw29Qfr7h4uVTGP2rwWSHeFWsyuxZadDvuq2Upk1nBoq19fv4?=
 =?us-ascii?Q?5p1vLaaqFEfyFV41WacC9QKYIQhF4c7YHkJSPDi53QSAKtg83doUjSoRUhKp?=
 =?us-ascii?Q?Xpcw4DeyDeaMSHgwqu2T9G+IyoGNgKPhvdA17S3cA/BAYmjrC5u65c0w8C0W?=
 =?us-ascii?Q?EXeaLEhbhezpl23nT3cZMzCTHI7s98VKV5t7zw+94xF26cch8peoL2KXFVdu?=
 =?us-ascii?Q?mK7ohjfVx6JzGaNVolX/HsT0KvMXcS7SRgiVJuQTVybJvxOdZgf1yozmDBmE?=
 =?us-ascii?Q?AYPV+z2N9B2/aJ2a1x2HTvYSBrblpAeGVXKWbY9c+zKO1o0CTqMg5MRF3kN3?=
 =?us-ascii?Q?88NOqEb1YJYOzTq3hlQPWG1MRWitz4pqelo/DN6XkvJzK3ltr+ld/9M5zjYW?=
 =?us-ascii?Q?yIKOT1J2htDjNwv1XgN1v5NfXIUs3qbtwRH4NkORVec7Fd2eHc/+CR5lYngw?=
 =?us-ascii?Q?nTDyVwTXDp8Ela7FDYkEXmnbc4mSA73K78ifN0OZU2AAK0dwcJb16ihJWb7r?=
 =?us-ascii?Q?OYQUypSxlSduE2vv200+HnvQlINoBO3WIp5my2uaqJHiWV8BELEQqUfwHqi2?=
 =?us-ascii?Q?Io3eDg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 22:31:20.4154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d14a0e-b801-4d1d-34cd-08de5a05f76e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5727

The GSP booter firmware in Turing and GA100 includes a third memory
section called ImemNonSecure, which is non-secure IMEM.  This section
must be loaded separately from DMEM and secure IMEM, but only if it
actually exists.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          | 19 +++++++++++++++++--
 drivers/gpu/nova-core/firmware/booter.rs |  9 +++++++++
 drivers/gpu/nova-core/firmware/fwsec.rs  |  5 +++++
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 310d4e75bad3..0d1a0f86d83c 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -242,6 +242,9 @@ fn from(value: PeregrineCoreSelect) -> Self {
 pub(crate) enum FalconMem {
     /// Secure Instruction Memory.
     ImemSecure,
+    /// Non-Secure Instruction Memory.
+    #[expect(unused)]
+    ImemNonSecure,
     /// Data Memory.
     Dmem,
 }
@@ -351,6 +354,10 @@ pub(crate) trait FalconLoadParams {
     /// Returns the load parameters for Secure `IMEM`.
     fn imem_sec_load_params(&self) -> FalconLoadTarget;
 
+    /// Returns the load parameters for Non-Secure `IMEM`,
+    /// used only on Turing and GA100.
+    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget>;
+
     /// Returns the load parameters for `DMEM`.
     fn dmem_load_params(&self) -> FalconLoadTarget;
 
@@ -460,7 +467,9 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         //
         // For DMEM we can fold the start offset into the DMA handle.
         let (src_start, dma_start) = match target_mem {
-            FalconMem::ImemSecure => (load_offsets.src_start, fw.dma_handle()),
+            FalconMem::ImemSecure | FalconMem::ImemNonSecure => {
+                (load_offsets.src_start, fw.dma_handle())
+            }
             FalconMem::Dmem => (
                 0,
                 fw.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
@@ -517,7 +526,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem == FalconMem::ImemSecure)
+            .set_imem(target_mem != FalconMem::Dmem)
             .set_sec(if sec { 1 } else { 0 });
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
@@ -546,6 +555,12 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
     /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
     pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
+        // The Non-Secure section only exists on firmware used by Turing and GA100, and
+        // those platforms do not use DMA.
+        if fw.imem_ns_load_params().is_some() {
+            return Err(EINVAL);
+        }
+
         self.dma_reset(bar);
         regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 0, |v| {
             v.set_target(FalconFbifTarget::CoherentSysmem)
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index 096cd01dbc9d..1b98bb47424c 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -253,6 +253,9 @@ impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}
 pub(crate) struct BooterFirmware {
     // Load parameters for Secure `IMEM` falcon memory.
     imem_sec_load_target: FalconLoadTarget,
+    // Load parameters for Non-Secure `IMEM` falcon memory,
+    // used only on Turing and GA100
+    imem_ns_load_target: Option<FalconLoadTarget>,
     // Load parameters for `DMEM` falcon memory.
     dmem_load_target: FalconLoadTarget,
     // BROM falcon parameters.
@@ -359,6 +362,8 @@ pub(crate) fn new(
                 dst_start: 0,
                 len: app0.len,
             },
+            // Exists only in the booter image for Turing and GA100
+            imem_ns_load_target: None,
             dmem_load_target: FalconLoadTarget {
                 src_start: load_hdr.os_data_offset,
                 dst_start: 0,
@@ -375,6 +380,10 @@ fn imem_sec_load_params(&self) -> FalconLoadTarget {
         self.imem_sec_load_target.clone()
     }
 
+    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+        self.imem_ns_load_target.clone()
+    }
+
     fn dmem_load_params(&self) -> FalconLoadTarget {
         self.dmem_load_target.clone()
     }
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 6a2f5a0d4b15..e4009faba6c5 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -232,6 +232,11 @@ fn imem_sec_load_params(&self) -> FalconLoadTarget {
         }
     }
 
+    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+        // Only used on Turing and GA100, so return None for now
+        None
+    }
+
     fn dmem_load_params(&self) -> FalconLoadTarget {
         FalconLoadTarget {
             src_start: self.desc.imem_load_size,
-- 
2.52.0

