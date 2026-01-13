Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012027.outbound.protection.outlook.com [40.107.209.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EB026E710
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 22:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768344882; cv=fail; b=Eyyv6LaSAYaxSGtQ1bP9dhHRqLHLPWxOx+25bmdI3okIbjRpZz+OsABwC/1HzT2pWhZD8NybjKLibEKJpvoGfObFCDKgc+ffnWEt5aCQJapns3J/pWY+RUDoEg+jWetNgnxKsDJcHfrqF9i8iAzetLOg2hJtvmL1u3kKKgxvvyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768344882; c=relaxed/simple;
	bh=nqEKh3dWf7aaSXGDFEm0AEWUMDCXKli0vFUTVQdgT48=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hrKMBjNhdS3U2jZCTcckO1Gequn5HrvvKCdTXWlShRZZOI0bYVyp/KbCTsMJAAeOsPlOxd99aEm/QzgXXaZChqnTtirnp1+E/qbizpxtnVLQUCdPT5SY+rIOAxUbBt2D03EuP8yMOYzqCnipYfIRMkHbrcL/DHPIX8qDkOVGiAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tpQFwSl3; arc=fail smtp.client-ip=40.107.209.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tpQFwSl3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6P78JcEwZOylEvrGBXYbnvuc67zWREFBg7kePGe+wHpVOoyZfaFIkSvij57LVPe6ugGonk743EYRBl2Qcb/gU/YfBBmOq8KRXlMlrTiJ69dCEC5KB35e10Xy0y9BUwoduadqXkaOhudVGtKk13O9eNaST+mcqa40Z0D/3NbKsEHR+35vfUXaPEKtyqHLF8tX72fxjFLzuaTMxHhFjTNb8Vvm/3ZsI7ixNvIUwF38AG12hYchmVskgVLCkxixV+mwZA58xth2nZYrdcYguppqdeiMfxvXfvDjZIbkRy+okFY/p/DxsKzyVPDzH7w4uu8JDAZwr4zpQl9a0EetVTsWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsdJjAszzNmQrNWGonSKHtIrOeUTa0xb+b9DGsMG5D8=;
 b=qAItNF4DcXLINHi2FAulE14wtJyFa7+ijtVCMvQYJI6IXQuMg/I1FFtYPZBNKrnJXXY12Jp+D6fb7rj6UXJqCQhAuYVhertFz8sgLeZ1FdK9n07cKKobNbcfLpDjd7HzL3bpbkjCTBiApCHNXsw/TBw6OmDdpMF9tZe+M2k/L+1Gf9waQNwivMZyiFJpEHmYdBckFaOImkg38f6juX8bkcm5t9eW4jSbcdU3/MI1tmxaWFnsavix6j3GJbAUtxETpC8nv7jiG8Sdjzswswdie0wgOx2u3smBVGGxSVqspVnz71y1uR25jOInpjEGZAlCH0MRWCR3MXWIlU725VTU1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsdJjAszzNmQrNWGonSKHtIrOeUTa0xb+b9DGsMG5D8=;
 b=tpQFwSl3Qh+SaTNKibPrky4Dgn7+F/t01xzmEIbnrsSztf2VeOqLgSqSuTydG1is8Q9c4bkGB2i6rkmbcDp2dzXQjJGOq7YH2wmZPWPL/e77Jl4nlq+6oopJdJ8ieuQsSdOnP9cQCiWa8/oekcTdpBhkzEUYwyL+dPpTINdVHZj4iDKSDF47lFaKGEy4aMvT6CFwhVwq9tcnJYzIM8p9pRN/16ln1pWaFBd4AiookT1mwAsDz+nVnAKwMG9Te6DZVXGfPmhifqVdvxV/bbKp74QXk3UQmoRQ5qcqSFaJKlQdOJKue/DYqil2BrqiV0++FBBRpBmnQmMu98W0q0j2sA==
Received: from BL1P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::35)
 by MN2PR12MB4487.namprd12.prod.outlook.com (2603:10b6:208:264::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 13 Jan
 2026 22:54:37 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::7a) by BL1P221CA0017.outlook.office365.com
 (2603:10b6:208:2c5::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 22:54:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 22:54:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:21 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:20 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 4/9] gpu: nova-core: use pin projection in method boot()
Date: Tue, 13 Jan 2026 16:54:03 -0600
Message-ID: <20260113225408.671252-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113225408.671252-1-ttabi@nvidia.com>
References: <20260113225408.671252-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|MN2PR12MB4487:EE_
X-MS-Office365-Filtering-Correlation-Id: ae7bbef6-0cf1-4c83-314b-08de52f6ba08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1FRg3jkpFtU/kVGi8iA2PbKQUBNOgnEWybsal8dy3dFp033bx0xp0OD0C6GV?=
 =?us-ascii?Q?GIAm5BDJ7sKJTVI38uxzUDFEd1WS2gvr86CRl/Bl7UVh9SDsbUBMbuD6O8yR?=
 =?us-ascii?Q?23ty3FwEn8RkfNwb90P3LPm4m21IP/ScNt1AUPyroSKPsnlj6zn5j0++UOTC?=
 =?us-ascii?Q?YJDlbmoILVPUHgbST6p3YdcK/0jJjkSAD11Z5qAn+CrXUpjyyd5lgh7NJOVv?=
 =?us-ascii?Q?8N43tXuVZGgx+B80LcnPEyFTO4tRnu70qWZgw4XX9gY3Gd6aT23wUu+YOEGz?=
 =?us-ascii?Q?Qnm1bUdxa/5gQpjb/mvNyv652xGnXqjUlHBeZA0oLbC+4MSGV8TS0g9euLXE?=
 =?us-ascii?Q?SsuEtx2TxITqEIh0WX1tmUbUEE2xOcDUf03AKzVCJdpexMOEMRBkhA5/6wbY?=
 =?us-ascii?Q?SiqY/H+wdSf6iKxXD3S4J3AG9jeuVvWY6K0Sjv9UpSG+hhzKUWcQKBucBZHV?=
 =?us-ascii?Q?39/3Qf5JS2Zgmr/QfNyg1BNmqPbvNmHkwdaviXi7rIAwFIEj/iWjkTOTEvGe?=
 =?us-ascii?Q?XxE6bPIXh7hCz9gVz1Y9u1TNHuo/6+2dUYH9ZdUofJFcBUDh4sLh9jp12fOt?=
 =?us-ascii?Q?DFvBCjoDFwdxvl0TUodmd1rNY+CW4cdjftiDL6POvULdCT+MPPXBXHMna0FW?=
 =?us-ascii?Q?4EXj5qaDbAEXIp6fqNos/LCBpg35rVOaTvCFyuXIfi+2Hm9MbomK6bVAyMQg?=
 =?us-ascii?Q?kLFZlF0dkgJkGpHqgi3oBqnuyYyK0Gd/itTgeGbr1P2tvW+Bxi0DJ160nhmx?=
 =?us-ascii?Q?zbNV0dqXPgYgvbcppyk7pN164RkExLEDyv1yhSwCtSzujUf76GESHC8Ktx3O?=
 =?us-ascii?Q?QtlmwS2VaQm2ijTLWXHqTEmB++s8+YSmDeS/bVMi0zw+W0HR4bRiEQLpyjpU?=
 =?us-ascii?Q?7RS3UeJCRZZvfnVU6Bi9POKyAmCeu82DluzYkF8Yka1wHVDqL1NQIR3+Nl4j?=
 =?us-ascii?Q?Zen/ZMUUrm2kHJSa0FRNzS+/B4lEREZKdd88GKQO6L2YKAuXSWloX3xIZF6z?=
 =?us-ascii?Q?sa1rcj+gnWlnFbeR9gGYdpm0wJ6d9XdEGRT2bknd5Nuq9yuHHZrHL2m6X6Vh?=
 =?us-ascii?Q?UhLHIer1Z6F5x6At8xzCErk6K/Ic0xDTRm52dpuuiMcjlL8G0MpfWNZwk+2g?=
 =?us-ascii?Q?uATMn6h73TMHbvii6Gyi61Xsp+GkRM1msratB8MdgiXXbuIRoqLzIvOGDBGa?=
 =?us-ascii?Q?3TLOIBKIdSaLcFoEUil6czW6GGbgBb3Ab+QDfSufeURnCesGvWsgPVDwiL1V?=
 =?us-ascii?Q?iCF0AHxP3i6WMVCrJeAAp0n4oVN09QQuFUTs+s9rjr4fBKPY5XDOAKi9vZM0?=
 =?us-ascii?Q?os12isu41qP4yqWrQ/bLliH3qgtXyLddmQTi1BdkVRrNQ0F6clScqM9it95k?=
 =?us-ascii?Q?xHSYiuS1Kwe7BY29DahcsK2ilghMZYa+Ea0mWanNQSvr2ieu5WgiAPtuGh12?=
 =?us-ascii?Q?hmIOT6Vb8D3TKImgkSPQ8k9qSvGrHON9IEWAR2mURnrDVrpZL+HEtfFnPGso?=
 =?us-ascii?Q?pQdjow3JxV7ikk+qLC90JWt9okUJdYYN0uJVTv69rb7o58xypGPY14uzuwbi?=
 =?us-ascii?Q?CWfemkVurGiXGO7SvcI=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 22:54:36.7904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7bbef6-0cf1-4c83-314b-08de52f6ba08
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4487

Struct Gsp in gsp.rs is tagged with #[pin_data], which allows any of its
fields to be pinned (i.e. with #[pin]).  When #[pin] is added to any
field in a #[pin_data] struct, fields can no longer be directly accessed
via normal field access.  Instead, pin projection must be used to access
those fields.

Currently, no fields are pinned, but that will change.  The boot() method
receives self: Pin<&mut Self>. When struct Gsp contains any pinned
fields, direct field access like self.cmdq is not allowed through
Pin<&mut Self>, as Pin prevents obtaining &mut Self to protect pinned
data from being moved.

Use pin projection via self.as_mut().project() to access struct fields.
The project() method, generated by #[pin_data], returns a projection
struct providing &mut references to non-pinned fields, enabling mutable
access while preserving pin invariants.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 581b412554dc..68a8acaf8c54 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -159,12 +159,14 @@ pub(crate) fn boot(
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
-        self.cmdq
+        let this = self.as_mut().project();
+
+        this.cmdq
             .send_command(bar, commands::SetSystemInfo::new(pdev))?;
-        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+        this.cmdq.send_command(bar, commands::SetRegistry::new())?;
 
         gsp_falcon.reset(bar)?;
-        let libos_handle = self.libos.dma_handle();
+        let libos_handle = this.libos.dma_handle();
         let (mbox0, mbox1) = gsp_falcon.boot(
             bar,
             Some(libos_handle as u32),
@@ -231,13 +233,13 @@ pub(crate) fn boot(
             dev: pdev.as_ref().into(),
             bar,
         };
-        GspSequencer::run(&mut self.cmdq, seq_params)?;
+        GspSequencer::run(this.cmdq, seq_params)?;
 
         // Wait until GSP is fully initialized.
-        commands::wait_gsp_init_done(&mut self.cmdq)?;
+        commands::wait_gsp_init_done(this.cmdq)?;
 
         // Obtain and display basic GPU information.
-        let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
+        let info = commands::get_gsp_info(this.cmdq, bar)?;
         match info.gpu_name() {
             Ok(name) => dev_info!(pdev.as_ref(), "GPU name: {}\n", name),
             Err(e) => dev_warn!(pdev.as_ref(), "GPU name unavailable: {:?}\n", e),
-- 
2.52.0

