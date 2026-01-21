Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010049.outbound.protection.outlook.com [52.101.56.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F8222A7F9
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 23:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769039617; cv=fail; b=eOGU6RJYPFnH0fp/rLVVyN9E2GaERbrWoPTmuJafYDcEnsMrs7cpJTDdoO8KZILNq4hTTD5jGLLrpddWTNi6BbGQf8yX0+Of+L6us/TmR/UBwiOPdx8CQ15vBCpg9C2IMs586b+LziwfVIaiYrkhcukJOcBHCKRvEHvIryXcyoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769039617; c=relaxed/simple;
	bh=t4XdIP5mfwk0NCDk2gVjf8q9tlHK6F/OBqyuiUXEO24=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pMGa0yV4JaTt+4gTnTcPVjXqtARxCwE4Qj4Ii2Pv25bjYtrmc4LUsl1vKAHsI/A4KX32lO3u2JcBwVntsnGds9L7iH7HiA9Dwdce6H2fWbtOpp3AcE86+V4cnsvzNIbGVdbHnj+gFjMbAqIUZlL8Q7AtLis/I9ttgpygkMH7bN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dCgNKlBy; arc=fail smtp.client-ip=52.101.56.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dCgNKlBy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vaogAUZacJsuEtEu6OIvlz8cdaE35WtDqc9vXkxuxNvHTezYzc9hWf+ATEGsAPIACGyYNNlf0NtbxyBItRwj9Be5qC6k1aLtfSKcvRwVZ8bY9sfs2Mpt7tDiJqpGNbOuOTg7fSJt5aRBb/TRVoGYLX8S8JAjRXxrvAKya1NFzZJdHw8sNQxxu0IdMILbl/COltqH2JKkaoXeA5ihl1SyqZSOsH9cFjECMoV6GkwgsnBERzxeiZuBDCwaSk/H4wI31QDa24g7/rU2mYdlPOZZpGgVO4bXY2VZ/TROauvigjFX/g2QdplrzuLK6+xLf/7dn+rfEZOh8QAwOsCARYWKfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nL6oemKjE6MJ/aorDMg77+dd7cuvFAuQcYBjS2cpCiI=;
 b=Z44VKJKYD98K6te2huzxfWb6981MeGKghBjZP7myqx0wD9+l1NDTLoZJ0ad3eLol25guvgaWjtLYXKF3QddP6xs4+aF1B8h7J4x4FbcWH2WpAXw3Zl00+TAyAyI63j65JdXgS2wnZalzGHdgKgikSQm94APFkrBD8zZItWlvZIc7KeGsnVzogOADHk4EfgR0GgkDRyWmj5kLmhdGgRqYnI0ZBkfUefRSk2ultJH547KMgEnWC0CCgMpFqkYXb4UNwqSgpL0wZpFQ49YwY2kF5ub28RpbhJcIHaKjC2OVL2CIlfN1VJ/mr5DWQ7UPkWWz3UdiRisVjwZgkrv/1djUpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nL6oemKjE6MJ/aorDMg77+dd7cuvFAuQcYBjS2cpCiI=;
 b=dCgNKlBy3Ai5uBTisJwsNXJrxC+g68nyxmY8x+ZQOrhk9LNw3tCovnbt/AVnlp/bx7t1vGQMld7vJoDdTSNzSPUT7yxhRGcwdwqIZeXQq8a23xZoJLsPNyW2Muc1m+LTV3Z5hCAhLl9wP+H+YZaqhCGotVBdehYTYidQ7tOfAYFWmdhaKmUMR3/ixXniBpLOOvdnA/Zs3A3C04odw4nxmYY46dColYqZDCIE+RiUI3oBX8FwvpCzNeqlIMzsrG3jWsybWP+I9mmzXx4u5n3EVtzlgznfn1sBCLhO0uuIWY+SyQugYSUbCsSEhAWN5dRdSfcdaqmlZXXzib/e1BLQvw==
Received: from CH2PR02CA0014.namprd02.prod.outlook.com (2603:10b6:610:4e::24)
 by CY8PR12MB8411.namprd12.prod.outlook.com (2603:10b6:930:6e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 23:53:31 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::53) by CH2PR02CA0014.outlook.office365.com
 (2603:10b6:610:4e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 23:53:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 23:53:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:17 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:15 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v7 05/12] gpu: nova-core: add NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
Date: Wed, 21 Jan 2026 17:52:55 -0600
Message-ID: <20260121235302.1962185-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|CY8PR12MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: b7a069b8-bbfc-426e-2df8-08de594847d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6XfCKDIt4RRDIQbhrVHWPm2pXvaTbX2hiVk616lLm5Krf6m6d20/FcHidDwK?=
 =?us-ascii?Q?iD/fettH+YMAljp5CtfRuenVWsWTWduVdERHYc/3rqEwtia7pFkPQCGk2H+P?=
 =?us-ascii?Q?7wiTrKeElKamMDT6LdhKKCxLpss9Z1+jTQCXY/HSZJGRtm7aYxp4zBa1jUwN?=
 =?us-ascii?Q?Tc/x5wPdXGNaCIfqbBAbJiiweZGtgYw/1/4Z+plUE9EsuEDZ+cTmrKsHhGk+?=
 =?us-ascii?Q?SFhEYkTs2MuDughdX7aBC+EXLx5X1CPMS6erGCtD0RN4RAPwX9bq+xhhsudt?=
 =?us-ascii?Q?LY7n/Dagc/u6sxGIcEoCq21kKIo2WC+tLoLowNZ8L0ftLYjCzoCFftC+GYo0?=
 =?us-ascii?Q?t8S80KSfCEZg+fgRkgL6oHlmZ6gXCFnxkJowQqlNJZD1K9mJSKm13h4PPr18?=
 =?us-ascii?Q?O7EJuuvhv3BEcFCT8SY/Yow38LjgdYoywcZXZq9s2jovDNCas33PCx778vnS?=
 =?us-ascii?Q?ls/CEdY/Dn1Vhh95EGTJFS4c1wXY+n0Xjq0c0E7eL/ogxCr8s4leDQOROchH?=
 =?us-ascii?Q?psu+hBvrLPm7kHykNT2TIO33p+sVP2YuPWt7RaYjlJkUGvQog0S15OOV5epE?=
 =?us-ascii?Q?nqn2OS9I1jN0Xme7A6OZ07iUGTMB1AMduAMzxNWtmvKCzsjdMBA2NtrJYTT0?=
 =?us-ascii?Q?UmSCUaZvg0RpU2tLpS7urpCN6j9r+IrZS98hIexeDmqs/LTFmL31sTnI5yyD?=
 =?us-ascii?Q?u/vpnO2DORxWENy4eQNud2G5pir4Os+a3lygjKYGCiD1kVlPM2fhAgzTk545?=
 =?us-ascii?Q?aMcplR5itGzB06lB7DYzZdsUN/kDSuTjyVSPYra3OjoTWPAiTtDijQlyfhjp?=
 =?us-ascii?Q?dmnnAtCGyPuQVZk2kIdg9D5hmvtxIr3kukfQLrJjwiu3qPmgPvUIoTfJQKba?=
 =?us-ascii?Q?rYFYghemXSQcshf+1obXUkRlUnKiEWpt9twlLds4taOVxw124KrYyDVDwWVG?=
 =?us-ascii?Q?Fy3KMFggeutYxnIl3E1yR8cI04pjoOkMiE5tgD2JxYSz6cp4icg9KW7/05rv?=
 =?us-ascii?Q?f8/MVH0dNt7kUifLbB2TgJ0V0hqyDawu/9TdfW1VhPbfUte/S5+GW3A7nthX?=
 =?us-ascii?Q?eUJU5Vx0hoDDvJ9NVFbOJmoyR6lE2QVzh4SZJCzfqzhfX6IjngxGAaWqWWwn?=
 =?us-ascii?Q?EK2L8elpAX57DMqf6ST6/0hlqmfQlanEOIKPmhoqEbdmrQdKJQE8badikXOQ?=
 =?us-ascii?Q?qNFInIZkuK9LTdigAHTRB0s3ZnSW2yMCP1QHtsHGf4Pg+so0jEMv9jRZJg+N?=
 =?us-ascii?Q?gMjPpxeIl6G53cnEtAZFtd9YP1PL/zQogKcxtNnDsAmm8HtG1pedsi/bsV2p?=
 =?us-ascii?Q?Rhw/ndqLCle/LQj6SqkAonCxrrf1uhdkRKhia7vNakjBr+htsyU4UaoDv9De?=
 =?us-ascii?Q?v9ZGLYwXJz5Rrz2w4UhlM2NvLuOfYoZNeXlKGD6hBLtZZcEdMYAS086Yr8tn?=
 =?us-ascii?Q?62JJ0oue0rVtM2K4pzlQjQW5MfidYWwObPEhjTc2lLehWUBI4XLr+caEaELH?=
 =?us-ascii?Q?bIDbQY0rd3erVAKufT0cVsuGhLuQsasPBQCDnX/I54RmNh+xYLooW9kxkOd2?=
 =?us-ascii?Q?OLTiCURZRMYzHpMU3+UvThOQvi8pDv93qVFHoCAMTJTQ9D/StcrtGSkXVnsC?=
 =?us-ascii?Q?7UzMCHck2B2wYNw6AT+7r3Ho4LcFaPCvc7aa1p8WV1htG+7ANz0BGVIdrU2G?=
 =?us-ascii?Q?AOfVjQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 23:53:30.9520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a069b8-bbfc-426e-2df8-08de594847d7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8411

The with_falcon_mem() method initializes the 'imem' and 'sec' fields of
the NV_PFALCON_FALCON_DMATRFCMD register based on the value of
the FalconMem type.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 14 +++-----------
 drivers/gpu/nova-core/regs.rs   |  9 +++++++++
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 60713fecffc9..2a8fb7059a44 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -457,7 +457,6 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         fw: &F,
         target_mem: FalconMem,
         load_offsets: FalconLoadTarget,
-        sec: bool,
     ) -> Result {
         const DMA_LEN: u32 = 256;
 
@@ -525,8 +524,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem != FalconMem::Dmem)
-            .set_sec(if sec { 1 } else { 0 });
+            .with_falcon_mem(target_mem);
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
             // Perform a transfer of size `DMA_LEN`.
@@ -566,14 +564,8 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
                 .set_mem_type(FalconFbifMemType::Physical)
         });
 
-        self.dma_wr(
-            bar,
-            fw,
-            FalconMem::ImemSecure,
-            fw.imem_sec_load_params(),
-            true,
-        )?;
-        self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params(), true)?;
+        self.dma_wr(bar, fw, FalconMem::ImemSecure, fw.imem_sec_load_params())?;
+        self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params())?;
 
         self.hal.program_brom(self, bar, &fw.brom_params())?;
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 82cc6c0790e5..b8ddfe2e5ae7 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -16,6 +16,7 @@
         FalconCoreRevSubversion,
         FalconFbifMemType,
         FalconFbifTarget,
+        FalconMem,
         FalconModSelAlgo,
         FalconSecurityModel,
         PFalcon2Base,
@@ -325,6 +326,14 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     16:16   set_dmtag as u8;
 });
 
+impl NV_PFALCON_FALCON_DMATRFCMD {
+    /// Programs the `imem` and `sec` fields for the given FalconMem
+    pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
+        self.set_imem(mem != FalconMem::Dmem)
+            .set_sec(if mem == FalconMem::ImemSecure { 1 } else { 0 })
+    }
+}
+
 register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ PFalconBase[0x0000011c] {
     31:0    offs as u32;
 });
-- 
2.52.0

