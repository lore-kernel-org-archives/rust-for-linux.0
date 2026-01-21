Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011043.outbound.protection.outlook.com [52.101.62.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F118E428849
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 23:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769039616; cv=fail; b=hIVPU1Kdg3Ye3mU7Cay2uO1/ppAOKWGyxSgQSqb3BpBW2mVx1gIlRStqwiMlNWSrv4A0cgS6qhaBB/ZBH1eLPkRl8eASrR5u7ULRPuq1M2jAUwutnJ8qAJKyCATvzrHJLBlxQ2TicMir5ybrQ3D0x9kJPqRasv2ky/0gfhF2Gg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769039616; c=relaxed/simple;
	bh=YmAkP2VvTI9ZGTDp4Btq/fmsrAtJF7NszaBn4560Eb8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M8XsdXfuXCFh/3QeXOpiHjIgdVNleWoGhmU4wUdfdDQcO5IAZhxC+wUA17EQypIrmS1Nuw2sXRkf0rAnnpyPuCIjT7Egk7630e28/US6r5fUmim0jn5kIdMicXjsZ/A3h+Xmk+F08DxdN/9qGjpQiPz75c8eW++r3pQWlK3OFVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FjCXaDpG; arc=fail smtp.client-ip=52.101.62.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FjCXaDpG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bx2o2SLJe0DFH50uG9vMzccOo88Zw+znNDpWwfMHrMVWw+1wuhnGrY5dPEvIp+uMRWwbjLRFM30mzW/voEWEp8hmbGmQEW15UDLRo6sdS/LSanLDfpWvvF6p97xQoa+5AaM55Oghz/WQxmU0uZNq6gMyOxrvnDUMG0fkue4WUPsMJ1pl+fF6Y4eS+3oNoorDpqYUf4vDlmQ/+U9iJkixQCYj1iVKwUKR+utOZVOFEWkK+0HmANRH+hfc7zS15PXmTgtDSHpo0NRc+DDPv8bwJBgz5LZ5x6JQk9LpaMIlpqU+qS8qP6PnZux0x5nk5X7Yzq8P+hEF4B5iSuthMZcGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3oI2dyV8uwy3F82Ohv2K2ycQzyNLPa1RTWNxH3tt2U=;
 b=bxcOX4k5c3jrfjwz7vINfZ/lMgcbrdLnuroOQLAhJcABlm9fbBcyHXA+VoueNW2y6LMsmpyGFNarRaEHe3MKmBnkDJXNh2ue3mSV6A8gEdp2E2Z0fVlhkR5/S80MJEP7MnDBcj+cqRi2tsuFPKLLq5Gbx8mQrwb4gG+ATSckthsASYwhqSgQ5JMuhJrLXH2RJSjcPB22kAX93UVt7ko3blizoTTzR0cG2ctENe5MvI6/H7uhNhXCtJqrXjZpy3AQnLJKBcl2RLozhNDE7RygGUwxgPw9bWETDCQUzq31081KwoPXj9Rqw+vJDqqjNrYwC55RGV7tJoaM+7eCupUpRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3oI2dyV8uwy3F82Ohv2K2ycQzyNLPa1RTWNxH3tt2U=;
 b=FjCXaDpG7hSi+00l8YfErUec4MKZRV8Ef2Q3JQuE2j+APUTMuLuLrZ44kQSxcVmLjdBIM8TKZU2zkYyOBhXYkWN2JDHIp1pDdCNifwzdOOPwPjjIsqRHx1hlafmOx7QONf8GILUaLiAFTcfucj3xbBffiZ/YKwLTwQJnTn4z1TwfUGBgRiadnCwGyT1eiUwSxS7JUmRrFCK2Gjx+U+B2xejV3gRlZRAV0YFwhPnennHG4aTlW7ajrW8blEfu/884D4XZHRMLgqB1I6MY6nyyzseqA+VTIB/17ztxIVvobMuZ0Ns4vMaEY42ZgYCPTs+uIXgwkH0enwvDeoQNlOUUzQ==
Received: from DM5PR08CA0059.namprd08.prod.outlook.com (2603:10b6:4:60::48) by
 SA1PR12MB8144.namprd12.prod.outlook.com (2603:10b6:806:337::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 23:53:27 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:4:60:cafe::ce) by DM5PR08CA0059.outlook.office365.com
 (2603:10b6:4:60::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 23:53:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 23:53:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:13 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:12 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v7 02/12] gpu: nova-core: add ImemNonSecure section infrastructure
Date: Wed, 21 Jan 2026 17:52:52 -0600
Message-ID: <20260121235302.1962185-3-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|SA1PR12MB8144:EE_
X-MS-Office365-Filtering-Correlation-Id: adef764b-e926-4d19-41e8-08de5948458c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UOhl4ZKzbFTs2rK39Ux4bfuL5s0ja4/y+SvQtw8Ucv25AgwCtiMusSEz11xo?=
 =?us-ascii?Q?ZDPJIAzyiMZ3ru0lYPDjTId75N5UdX8ZaiT9hh3ZJBKHP/GSW7FZtOWdYPCl?=
 =?us-ascii?Q?6KQ775xzMugoQkUPvCGUUBOUwyc5UwSxtDbd8nevjlQQ9zv5JNlMe/ORi66F?=
 =?us-ascii?Q?y4zSHh4o9DKaztfT8GkZ3+ETtNhIJp0cMEz3JgOHg0DL+8dr/XiO3sW7PYOp?=
 =?us-ascii?Q?kh3EOPbEMaiK2vH6uODX7iyuXA7JummiYnz9WDkcYg0cnTHnzgo9YXTg/9dx?=
 =?us-ascii?Q?YQM4Be+NLtZ9/GzCzlLZcpT/bgDDRcm42R6d3aWXB/HrzmnK+UnfoXp5TUTH?=
 =?us-ascii?Q?20rTZ/BYhqmcNWLzUtwiqLW0tMTjswCcvFRLHwTi5/R10NOxrIm1Fs5pYH9p?=
 =?us-ascii?Q?womRK3zSQcyZLtpMk6/rMnmEAK4OLyzGrBIzAMBxJWANPh8rkSTIueqHk1zs?=
 =?us-ascii?Q?Nc3YkJP+T3WDYVPgKIOc4mtFCnnndsyvGZfmINeq8BXEsYZcxpuWpCBAYqDN?=
 =?us-ascii?Q?GxIwcXZKH8AeoyPfxsgBo9VkxAxWDfh1jnwBpr6pO6zL8w7MC1f5KuaLjBtG?=
 =?us-ascii?Q?2gObs9qoCbNxmWQasn079mJR3vQpIcEnU5L4y936HWMpncIjGpWsPysolBNN?=
 =?us-ascii?Q?zV9o+xMwo3CdPGiGGJqrrgVO2PgMFCE84AxxptrM1JnJDnxMbibH9MLhsRY1?=
 =?us-ascii?Q?cAftjRhsXIe5ExjYbkrk/6iUYqKwqwf9sW0umJ52YuouCdZhD3ZrC+YI8H4o?=
 =?us-ascii?Q?f5qX5TIoqFnrpb/QO9hedDg81v5AKJ0Os9JtRrfvIlggoqvy0rZeCHtlO0IU?=
 =?us-ascii?Q?TSt8t3qeBbQ+bVuOtCIT9nRWfXyt6bWMKJ4bcgWIgu78D50v69HrIMCIu44h?=
 =?us-ascii?Q?j7KdxIq87EzfG92j2VKGug7odPTeGuTNN1SniIyR1gvzc0uWtek6rVzCudAm?=
 =?us-ascii?Q?z6t9FDvW2qCpFttGf5r7hWbs1pfs51YPn4kAd8p8+8zyLBBjUff8HZMK9ftQ?=
 =?us-ascii?Q?J400+ap2odd9X0pb24A5AJGpd2AYIwbbBU505rgUvxuNwvXDEqZESmNVhF2S?=
 =?us-ascii?Q?Iig6sj4U9bFQZ05OPVNj7X6fRAEicsormkyDxgzvXPUYA4AcAehJo7UdxQuF?=
 =?us-ascii?Q?m09vRGWi3l/tTUG2p/zgTdn9slofFiz/QSc+BsqQmpNWv7Y/8d13oeDL5w8x?=
 =?us-ascii?Q?QnK0H4Jn77qtfy1dzcHtUPM6qXR3qqoNI0nEQ16BsK/Oa/iGB4i9+dvBX2B6?=
 =?us-ascii?Q?NswvCMzGV1gNBv3E1NLzfCkC/whQ9DOBLxGS/l56PjsrDVrxOFB9/HQTg+l6?=
 =?us-ascii?Q?fMXHBLGnH/GifWT2VyBJ+TWlt7KOQEorYru3itpna2SrNPYHbAw9qa2iAa61?=
 =?us-ascii?Q?Li97c637dmfl/yXxlJY+of3re8KDkoqslmuwi6FylRZ9XMAcebT1c1iUZ05Q?=
 =?us-ascii?Q?lK6Sb9F1G+SOaxCroZnhtVyYITXtKJKKhY37EuHGtOhtOmlToQoC72DuApYK?=
 =?us-ascii?Q?+gEvj8RqYa7U3Y0dT5DxBaR0jYtKJ7RmuSLJlVNoF9IrfQYUdVpd8qtU5zfP?=
 =?us-ascii?Q?yyJOY0zhZuCnWL9bKtFHsQuiSQfGoM22c1uxEnX8vfbHPrYOBIPLJWQjW5ci?=
 =?us-ascii?Q?4iFe8TfoDUy6BWuutE3HrX6PYdb2wyXn0jcnZBSwux4R10oPAxvgmANrYiE6?=
 =?us-ascii?Q?HwGqQg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 23:53:27.1040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adef764b-e926-4d19-41e8-08de5948458c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8144

The GSP booter firmware in Turing and GA100 includes a third memory
section called ImemNonSecure, which is non-secure IMEM.  This section
must be loaded separately from DMEM and secure IMEM, but only if it
actually exists.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          | 18 ++++++++++++++++--
 drivers/gpu/nova-core/firmware/booter.rs |  9 +++++++++
 drivers/gpu/nova-core/firmware/fwsec.rs  |  5 +++++
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 310d4e75bad3..60713fecffc9 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -242,6 +242,8 @@ fn from(value: PeregrineCoreSelect) -> Self {
 pub(crate) enum FalconMem {
     /// Secure Instruction Memory.
     ImemSecure,
+    /// Non-Secure Instruction Memory.
+    ImemNonSecure,
     /// Data Memory.
     Dmem,
 }
@@ -351,6 +353,10 @@ pub(crate) trait FalconLoadParams {
     /// Returns the load parameters for Secure `IMEM`.
     fn imem_sec_load_params(&self) -> FalconLoadTarget;
 
+    /// Returns the load parameters for Non-Secure `IMEM`,
+    /// used only on Turing and GA100.
+    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget>;
+
     /// Returns the load parameters for `DMEM`.
     fn dmem_load_params(&self) -> FalconLoadTarget;
 
@@ -460,7 +466,9 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
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
@@ -517,7 +525,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem == FalconMem::ImemSecure)
+            .set_imem(target_mem != FalconMem::Dmem)
             .set_sec(if sec { 1 } else { 0 });
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
@@ -546,6 +554,12 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
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

