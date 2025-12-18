Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012030.outbound.protection.outlook.com [52.101.48.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388CF21C9FD
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 01:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766021991; cv=fail; b=dAKCQBPBA+QtuVtFGiUUXePvXiLQLstu6CWDEXXUA9+sJMizRy8WMiaGtda3oog5si+cItgk4IvujRZfvt370iahhcM5eflCvWubb1/91jA7ZHNiLDHmZ5+3EnQLP3DbuXvrwEpCh9pp2+m346iaWsqVdN1bTNaQyXJDneVt4Ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766021991; c=relaxed/simple;
	bh=QO9n6Y3N3BWxtf9dukSPLbnNORvGecpUSXGTEptZHTY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HWPvKefXzm+t1v84rslfQZC/1wLsrOnm+E0lrHEOqwlVHCDyuDjkTtorr8VbezhpZrNAssAaGGfrHIr2mNjgWUs76XwBIax26QB4hDEMr1tlGVN5bRqEdpzDjUoQyBUBFd2zG1fZn+pgYxWrugMzK4j7Ucpf6NfHQ3H/21NujMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t0S2ds8q; arc=fail smtp.client-ip=52.101.48.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t0S2ds8q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYm1LjUA5UpDmunSrmFeGtWKvOyopyPJ9Aehb0tq9d6nhUsRfYBHkxid3rZnsbKbZ1w5wUmCjJmjz8GAxwNBPvYuWcWnaVmhdYUJDUS+R7vv6mRfVAwziANWkR6vL8/LeVZ5hYPHFGM6cQMcMwjyj1nPyaaS3q+JZUCBLjvNO5eSiybMtECScXBgvHZ0Ct/PvaMFni+DPlizChBPLv3EyhMoj6Rgevk6ZkqLuR2CkNzaSMAseIWlvy0hn34rg8x/UxkBziqNAEe7/3EX7ivF/CiXMBClHJOVue5aXgvtgvKMf6FxYU79U42KMJUFjlQOmqKOSylNCm2bnaueGqzsMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U146Rjq77OFWJZgba65Ka7wC9nkK7EmBRvQsz0IUIBE=;
 b=RNdj0SPyXhwYjw/WdKcp/AANlbgVdCHdmGD1XGqDOuL8OPgK9AdSQ67KC9tz9bQj3clG5Mx95/XnhxKjwQN6DxgMw58pS/znkwC6yEqSHRWyk1IEkk0oaP4Xke/sxnoKnlYiCdaJFAQFRGlSike4XyMwnd/qnf+WWgeqt7EaLHe2ke1L63jGBPjLVfzri0FsDHUJkDuYXtpqnSjJCA+lXObZTCnO5IsxdGKTprC2439uUtUSQXuY+fOjIuUYFjDY/pW7l0TpLGF1bHhNqBsvQ6pGd3NikhzGTbC1iHjqTfUgwpKj6L6akqpHK5m1xb36GCSyLb+nUH85VE+nIXM5kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U146Rjq77OFWJZgba65Ka7wC9nkK7EmBRvQsz0IUIBE=;
 b=t0S2ds8qcYdTtSqu6ohXXrTTMBVeVl04K5dt8MhHlcdFlzHrRNtRjzfgLmb2XxxG5u5vN5fqJSRCxnGrns9+bs3ko7qaozwF7J/uuvxo4Mn3yaJ+NFPvcWTze34jtIo8QsBKULfwGmDTN2NY0uckGLVAMkIeYYgNz/+MkA2eYGXx34ak/h2aQp8joDD39wagCbLaAlY+TReJrOzAyUZMBaaBuSPgyOConS1QFCjxc5lk562cS2wOY8zytvipbwpr6hvGhf6nVj/oJTIGqbFsRyuDAY9GEKfIr7fcNMv9oT0k4ku8OetrS3LtCkCTiqbkS9fHE+gFd7T+9kuPB3ACgw==
Received: from CH0P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::35)
 by BL1PR12MB5802.namprd12.prod.outlook.com (2603:10b6:208:392::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 18 Dec
 2025 01:39:44 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::32) by CH0P223CA0009.outlook.office365.com
 (2603:10b6:610:116::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 01:39:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 01:39:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:27 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:25 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	<rust-for-linux@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	Lyude Paul <lyude@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 8/9] gpu: nova-core: use pin projection in method boot()
Date: Wed, 17 Dec 2025 19:39:09 -0600
Message-ID: <20251218013910.459045-9-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218013910.459045-1-ttabi@nvidia.com>
References: <20251218013910.459045-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|BL1PR12MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad7aa6d-af1d-4c50-5479-08de3dd651b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iYQWSFZEmrAmuy7Ysg+9OdU22FKg7v5/6xMxd7rGo6rojZWC/E5pazH+ketF?=
 =?us-ascii?Q?jqt8848/vwN5ZsYD5SMCre7lnKq9kHBbw6QnoF3J48Odku6S+ZfqV0jxXN3c?=
 =?us-ascii?Q?zFWZNDxg1W5AVd1AxbLO+TByhNFSXfbRF8lRQIRe2gXkYiFJsr63FyB/nKwW?=
 =?us-ascii?Q?FQehbdfcEFw01x1mU1cDyAtOKkxdqCwIazok7WxIlF3GiYzNCIXFqVzdFcRX?=
 =?us-ascii?Q?OAfY397Tc4YeId2Zmj2zzQyp5G3biFs6OZK9o3KiY3woN/qJeTFqHdbLZ0yI?=
 =?us-ascii?Q?YP2vj7toj5Iy1c2Mr1E8Myhx7yCfWVqrpwslgTorkpEemif+7PshldXFn6vy?=
 =?us-ascii?Q?RD4t+NbcVtMG7b2OJd8PAt2SMXqX0ZxHf/5k9lOvzEpmVrmGQuRQ0LWJHA1M?=
 =?us-ascii?Q?vFPN34zP7q9l+doxm+lZ0wUwIK3elSMpcFFiu5xSJPIdEB9XP4C86pcXcYFO?=
 =?us-ascii?Q?0s7T2PingYoCwxt8smd6dexg7ASxgbmy+Ec/FSfSbbj6TbiktQpuEdSSZAc4?=
 =?us-ascii?Q?hwVqRMyp6Q1CfCPsD0dVmvcsStxmni5UbtYJ9kmtQV58jcawMJURSqR8kgim?=
 =?us-ascii?Q?F+vJvd0N5Uf6lUQnCzqWdNbKRvxvQZfHpuYzG9t8m2fvBmvo64Lvkqou0ycg?=
 =?us-ascii?Q?5/CxqYtwS5U4N2LfRwCHvAkeCR1O//YUg1VEsgFIdWGhwzXuLmqY5hUE176U?=
 =?us-ascii?Q?qunEbwcyWe6iB4JZRNxVOo+ZDBDnXRkXMcI6yIFUFTrRtaohxvNTa4AYchqM?=
 =?us-ascii?Q?7SvS4y1ugyBln3lBZSmJipEAos96jyW/c9taimkmB2nyk61HD3NDDgEF+ICJ?=
 =?us-ascii?Q?Vu6sjN5V7dZz1DqfEvpW6V/Pc5q4giROjtxbpwBCMCmf96ALA3aQPuJvhiKc?=
 =?us-ascii?Q?oDmYmSL8BWhEIpdff+aLkDwlR+etJRKMF00StJu+EFvN4XJ7OjbNmKx8FkMH?=
 =?us-ascii?Q?6MBSb7du3fnwsSNNMlcuaCpE1EDGDtqUsaclTvBQqj107gTbVMZyjmNYd0z/?=
 =?us-ascii?Q?8qFgnqPIUiUc06Zo9pMnjuTcjSf2+hkH2o6my/nKpLrJdUKURanEVjPH4FjL?=
 =?us-ascii?Q?aS+Ru+FyQa0Ojc1IjYWSJHryDuMORlX1aFQpUWSsRkSoEhKIRah2cL+TtIvR?=
 =?us-ascii?Q?EGJHNMGA0ajxah1PLLQliUL79gJ+uALGWvjceWdl1r+vJ9zdiI3ERephKPyV?=
 =?us-ascii?Q?/jzz6cao+IvEUut+Vd2lmeuvomQBH8XML9H/miHq1cGfpbkLrxK4QV3+/OTF?=
 =?us-ascii?Q?tWC5A+Wma5tF18HiSiZVUlaHKJp8+rEoIxDF04SWBj6obbjz8SOagqUooZZF?=
 =?us-ascii?Q?hynpopCb1bMxYlgz+IOD7Yt3ASzD4IoIHmyNtyeIryb/IS1HRkxwhJ7lySbk?=
 =?us-ascii?Q?BN3eMAKEozFJqG4Gmy0ywMS2oxjfOS/FYXpewvJwAfo1K66UqXeIAh7iO4i1?=
 =?us-ascii?Q?BtaS6doCi2Kjj+JpfSGHwC9GQvrUP4RVR979MUAZRHV6tYKE3GRY20LdhocS?=
 =?us-ascii?Q?M1P4L4Ebd0LhXLFj+vR+ZdhAqNskdGldfxPgpeR40xfb/qGAVuwYUvMiB/QJ?=
 =?us-ascii?Q?nlhT1t5LYvYfATMWH/I=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 01:39:43.4769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad7aa6d-af1d-4c50-5479-08de3dd651b5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5802

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
 drivers/gpu/nova-core/gsp/boot.rs | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 54937606b5b0..1db1099bd344 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -162,12 +162,13 @@ pub(crate) fn boot(
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
-        self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
-        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+        let this = self.as_mut().project();
+
+        this.cmdq.send_command(bar, commands::SetSystemInfo::new(pdev))?;
+        this.cmdq.send_command(bar, commands::SetRegistry::new())?;
 
         gsp_falcon.reset(bar)?;
-        let libos_handle = self.libos.dma_handle();
+        let libos_handle = this.libos.dma_handle();
         let (mbox0, mbox1) = gsp_falcon.boot(
             bar,
             Some(libos_handle as u32),
@@ -234,13 +235,13 @@ pub(crate) fn boot(
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
         dev_info!(
             pdev.as_ref(),
             "GPU name: {}\n",
-- 
2.52.0

