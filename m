Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011048.outbound.protection.outlook.com [52.101.62.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B69D352F9A
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 02:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769653755; cv=fail; b=pPvwOqXT1QdyFJiWfkCV+9p4JUdzeYRq5/vKd3foLCn9xsXMfO/aZQF5InKxMBAZdJTXoLvBIagcTWiyykv4sImcv235NOfOmuELgV7DMz1ypyLy7zsnJPfTKF5bDYMyrAjKMZ1RpQ8GUFIZGYdl/90oLt/VWVGQH4DjrupkDfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769653755; c=relaxed/simple;
	bh=vH7tKo/xmS7A3w5RSwdF6yvpN24Z/VIL3p5yHYac12g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dBYfBhwu4Ur8V76pmsj2PVjPXqofV5Rckdvv8+lk6i04q839hRMBpbicKiVFU/euiifeKfxhILzE36VdmqxVLSUI6kKX7UFbiOGtbM9zjrBs6pewd1WNynicsSU5gHftxkyD0IExPy8Obi7l+ZrkV9hdOjpvW3RoRnGsSCbSlkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=me+V5JX+; arc=fail smtp.client-ip=52.101.62.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="me+V5JX+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fo4RUxQw9RXePv4hs0Q3kxNOIsiAtLPAXqlhrubDLLbvse6wn5Pnyq45uGORH9CnC3beg6ghxbd3S49/DmRDfcwT9hIbGNww0GRcm0o/206D24al4uRRNEotmiSVaaevySzejgpqTaf411hIbiF88TbaHVWZ7AqHxhXwMjoUfX7M6Op7k4H9n5MpAcVs0z8oi0CIRtZiRU0sfHynD4HAPIWXVCq2i9eWxfL15FetbrRFnI5VuJj5+1i2yMw58dl7y55FF1b6ZolVGKRveNVvHANIq2XkRB4JtR98x/SqS1+aN/QE9yhTEYHo3Zx9JVT0TIvQwLTSebsF6BJtZE6jGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8GgZcvNUiA9oyNNhzuI4mMaQAjD7YjsIMtA349PlcU=;
 b=dpPFPlgd5qGGuAxJLX68naQ+QTIcaLDEzaRp4f5BZyraVcLg46XbzN+5fjQn89U609x5IZZSOdQk+IpqPDeoLh5de438EqLQSFL3FD1q2cmO6/CH/5NB11CEX4pXZLdDgyxRLp6kRjgIUqkJtP//n/xMKBsJDGoQpXhOpDAYMktgO177MV2bBcXjoRV+/W0qlYtaowSq4zEIYgm9WTQPhENBt7NjrE2ytb4zeJOgoO8DUcN69+F/CT1zmo4IeL54KMpki3qYb6q+vfT7D+RuGWKE0qctb9DBFKzOyNdZgVGDlWa126tjs3Oo3OhYdil6vLPsWpXRugf4R485hglwLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8GgZcvNUiA9oyNNhzuI4mMaQAjD7YjsIMtA349PlcU=;
 b=me+V5JX+MFYFFNUfSkCQxvpRPP21n5QBUagA+ia8jX6WZ4TrLCsYjuGQsmOMjNb8qkECgIm24h9gVQgBGYxs0erH5Pto5pWHDmZn4cG1e1No5zLpWdW+Oa9Q7E8cRH9cUezTLj1HP+syUKcbqtsKagTD1xqLQHJDbnfbni5xFCgxS0dM8pj3XoaTxlt3zo6GFdGZn0qwFmbvA5+Xm4kmg5BQvnlQgNbQcluQa2xHWk71RYAV617XN1hdzAXkghA8wxyNkAUGGOV+jINrxfKeBuIm4Gm5Z2eTZ904mJBl8ASB6d7Fp1j2ImS7XmimC+f6K/sV4VXhvqbdSUFhfKbKzQ==
Received: from BL1PR13CA0177.namprd13.prod.outlook.com (2603:10b6:208:2bd::32)
 by DM4PR12MB7766.namprd12.prod.outlook.com (2603:10b6:8:101::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 02:29:07 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:2bd:cafe::a9) by BL1PR13CA0177.outlook.office365.com
 (2603:10b6:208:2bd::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.2 via Frontend Transport; Thu,
 29 Jan 2026 02:29:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 02:29:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 18:28:52 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 18:28:51 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 5/7] gpu: nova-core: use pin projection in method boot()
Date: Wed, 28 Jan 2026 20:28:35 -0600
Message-ID: <20260129022837.4133832-6-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129022837.4133832-1-ttabi@nvidia.com>
References: <20260129022837.4133832-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|DM4PR12MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: 69279b66-6477-4501-b613-08de5ede2d85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2pw1demXmkfdzi+RuYoost/Jv0i0CUxvLN+IsmpsKYLP0tZl0ICaPKgdPU+o?=
 =?us-ascii?Q?90YOs0RpqT+z2is+Ljmp4mWqryLILVUZkOqo+dRgHmFeGRF9rKpS9PZnrxN/?=
 =?us-ascii?Q?ARRztzQfTCdt2KWDaD0t83bURxPGv1pocqNsBU9v9l5CT71R5kNksd4hlwoD?=
 =?us-ascii?Q?jkxJQjasjhJdAynHkxmbwz/+AT0HsgPbKp0j4C0ieE3Y5/d5ZGTiXHEKlq1f?=
 =?us-ascii?Q?mk+XInqXQ3twA+8UyVO6dnRf9mZ1wDboBGunCxt5tX+Q57hzgTZU75taFyk3?=
 =?us-ascii?Q?upfIU5rdbigkgCAfvvGZO4OURIcBhyQ0ABr/SVzZPkdvk5uTE/lkPDBoi4fj?=
 =?us-ascii?Q?oVSdG+YpnRrbwGQkEw6FNi3BpEr35RooJsG7hjcb+7T/QlE4OTbMCnaP0PQ8?=
 =?us-ascii?Q?ShDfKRrZNSQ0ENcjZ2ZQ87JCPpPa27esQPW3RQAr+g2Axgc18TMpWerlXER+?=
 =?us-ascii?Q?66svH1fx3k0uYLl2pLnBFGf8Y/PRf7E0vGFj4ot5ffBonjTJAd1iCyKYYVnP?=
 =?us-ascii?Q?fdV3IJEw9sVKSBlS/BkzApcJCeIDlw5eeNnUF3DGGGOSbjUB9XBZ9IWtfofO?=
 =?us-ascii?Q?litnvkAscsyzJ+TBJitYR53aBKaj/HinIoEeM/XPgiwvb2hCJ3ogtSxpMqRj?=
 =?us-ascii?Q?eNMEOi9kVRd8huU2rxI+oKLgusnLsjPmduZKemNzrMAxKhd1/4Xlsfesdtgy?=
 =?us-ascii?Q?rmoLhQp3x6ytpJlCpx+3hVknY82TYx6vbqKLdxosqzsqq9NIQLvyWL3NFOiB?=
 =?us-ascii?Q?IvSTrJ2J6jC5e5OM2c+RrXtUejgM7zoSVUnK3cOWF2teBCNt/4Hd0r+kKoUm?=
 =?us-ascii?Q?vHoC2jnIKehAyVz8cWYn48ZEnkJTI2FUdh8+bGFLkBDkuHLVIRvZmyEK6my5?=
 =?us-ascii?Q?S7TER/lrZvTfHeItxAfL5DW8vRCOfkKVBUq9tn/aO5wm+yPN7gCCQ6IqCoGr?=
 =?us-ascii?Q?A5vK6L/6HXDYi+z8vKg0J1RcZJ/FHAJvyCthj0SY3jSczS3jGM5Wbvrs0fZt?=
 =?us-ascii?Q?28t2GD20Q8qSYC9uOprW3Y9DD5SeoTE5BSG7GOD8EUUj78dX4AT0NPgFA3ki?=
 =?us-ascii?Q?+z6hKyiC5yeCVrmkg+v8QEEwIZOWg+++Samx7xogsnv0bS8vkGqmRtt//4QY?=
 =?us-ascii?Q?STG1hq1Gb1qr/cUm1L6KMaJoenOtY6Z8C464yrcW8DsJVSCdhUR75qkjMvOn?=
 =?us-ascii?Q?lEgo/2Z4ztAgSOHvEHHFJn7wDpspOg/aIgjbz2204GVrbf1I+DMWjCP9v8rY?=
 =?us-ascii?Q?Qn7oXXyJEHvrBmN658NwnZE47wTt0sPJLPCEJAjzzUcpXrdeNFSMQRjSTG9u?=
 =?us-ascii?Q?FJMyaA/qGrZPImMCmo/3E6ldjffoB4w5ERw6hpUI7CVExzxUaAlFfdxlEniR?=
 =?us-ascii?Q?NHmhCRPcuG+Nj1slCKrYLzo+nbkmFqyjtLKwQDOKY3m9UGm9d8yQ3yXSYwbG?=
 =?us-ascii?Q?QQWT9K05P5PKiObxrFF0VRP5bCRwm6r3uezp8jpg6/h19/mUJ0PUa9aLOTpH?=
 =?us-ascii?Q?Cc5gAFNXlJR9JOYgjQUHQ6Stay3DgSTxQJJD18cSRexcCGksHPhip+Valdg3?=
 =?us-ascii?Q?JA1bXnUCQHZSruOrIcnYy8HIZ42InEttYQB1LV7KUKN5fSX5X0gTLxqpag5p?=
 =?us-ascii?Q?4Gqodr9j0glx/3FzBP0c4ns7Xlh9KR+F//2kCp6CmXeLfIAz+mmir3Vony7v?=
 =?us-ascii?Q?5eMfjg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 02:29:07.0640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69279b66-6477-4501-b613-08de5ede2d85
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7766

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
index be427fe26a58..527c75feb461 100644
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

