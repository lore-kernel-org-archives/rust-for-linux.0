Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012043.outbound.protection.outlook.com [40.107.209.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CB721FF38
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 22:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770158931; cv=fail; b=P1Gb/YNYE/jI9+Q0J/yxJZ7MTbAWcggEEDM2x8O82ZN+rDnXShxNOmhgJ1ZzTv6lseV1wDd7hsEqwJQuUsXKlFj4EUYCeTDQPsOv4ew0Va8Y2kmsGfx8gu+Ncw87DwoaFUKrFY4Ef8FIyFUUXQUZfHp2kQWWvvG6FdWHhispXjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770158931; c=relaxed/simple;
	bh=vH7tKo/xmS7A3w5RSwdF6yvpN24Z/VIL3p5yHYac12g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oRKghIjtRCtOgA5RHWOy3vHipFli8HgZeBbf65uKrhbnQ8moTzMJMv05oVP7by/kMZL1DvLmyvOJwnqlC0boL+n+qYonZJsB+u/82jD6b6jpfNo9zMMWQ3EvXj24SbST+CZcbyH46tRAfJcWPyiapbCZiIySGhCcTWViouiV8jI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E6leCKNh; arc=fail smtp.client-ip=40.107.209.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E6leCKNh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzl6dB2UhKoemrsvgpqS4nM46Nie4VoGo3ja5dfjzuSixVFFdokpKDzN9+0YI8h6j8zGP4kjNxr6ZqGeHyiOXbD4s7u0GEF/uSalhWMDtnw7Pjgl5yWpncZfAgRSv292fSLLt5NHConNEBowPc6z6dGBjew0O8XUiCJqtpKLAWuDbsSeSZ8DpO34eZtIVtnm30UX0qitNRmitgEBT0P4RK4Mw5SB4Uz+Xd1JkgBImn4MqH9hdFjdl5jjmrnvKpoqRHzdB40U1tC0JjzfDPMtM+6HEQbqTpKdeiwLS1r8VHfpkW0W8hq/JpqWqT8kVOvUx53Pi+fIfJeMVQOyS+MZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8GgZcvNUiA9oyNNhzuI4mMaQAjD7YjsIMtA349PlcU=;
 b=iWRFZ/8EsraObzhsta1FhtYsZytkg5T7wM06cRVfnKMZEjcMrsPDsmY3Mzjmo8UGgiY9sko4+LaccZg9YzS0wTj1zaeWh+XmCw+pmxxVaVMe1jwfA+xY7y4JRbE+oa1fZrIRUqyJD0wY5K5ntYnACnWT1UfvbhCy4ylIo5r8N9YDADa5O/t0ZF2IMY2/JOQk71Dw5H3TkB73NEhSW78Zysg6KyM3iHDHYBnQkBr0GLdxr7alNZ4Ly+JYLbGCBynwiTUIyM6hnBN/eElC7BE5STy6nEH+zYOaKldofv5QU77EHQbb13Pd8/DmH2a+MM2RkRaddt6OLRxovgIE4Eydqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8GgZcvNUiA9oyNNhzuI4mMaQAjD7YjsIMtA349PlcU=;
 b=E6leCKNhMUecxRxpIWJi4o/T05E2Oyrfod/Q9q583KpQWizs2ImYtGbo+ryyVYDJJXzauVAJaB+PESY45aef0PVRAgtfuL4M3WiNP+m7YX7zC003DeMbEyKq0BZU/I5iNX7Ne7N3dxt+wG2w/KG3/OfC+UH7nVbCCRO9iDS/Az8IzvwE+0Mdfcx+MpwIRBA0v5Ryjmhqht5iZjtsLuRFgqW0OERi56yhGVZHg1W7L+J0jl3rcdH3YKYKlOiAy5vvGOT1ilhzTRPeN5DFz7DtOxU7Pr47DK/6x7NAR6SNu2VvMpquOlUs79UsEuY6N1lM4VoZqsrGsGYgMa/tOVoDxg==
Received: from BN8PR04CA0055.namprd04.prod.outlook.com (2603:10b6:408:d4::29)
 by DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 22:48:38 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:d4:cafe::26) by BN8PR04CA0055.outlook.office365.com
 (2603:10b6:408:d4::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 22:48:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 22:48:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:48:13 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:48:12 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v7 5/7] gpu: nova-core: use pin projection in method boot()
Date: Tue, 3 Feb 2026 16:47:55 -0600
Message-ID: <20260203224757.871729-6-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203224757.871729-1-ttabi@nvidia.com>
References: <20260203224757.871729-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|DS7PR12MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b183c00-7eaa-4f8b-327e-08de63765e66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vGraFK6bJHYrteQLNTA+qrFIw5AUNcBecuRIofuCdhBUT6R7AM56rVrQKh5q?=
 =?us-ascii?Q?WXSS3iy6vu7V/8MIWDEB+gr7V/2S4KWTka8NvgBjfgQdkFZlarlLPl3B4Fwj?=
 =?us-ascii?Q?WYzt4zYosCXsH3/psntNNiK6FZqUecCPXrWEFQxbBFU1guFvnRn6vvX8dSFZ?=
 =?us-ascii?Q?vQUVZzgV7bxmPHFIcJ0CQERih+drkpj5N8pPb6OOSVuVbmeQnbkJkKMm2jXQ?=
 =?us-ascii?Q?9MUWGNN/zOx1SRMiEnH9/mkYKLREOvxLCRHeX56BTrkOgvtfYAnw05mHw3tc?=
 =?us-ascii?Q?ObqA3QpKNLzDF3gfkUWwD+Ily9Ck4qQBy0NqOcB151K0kOGTdbNkjG75OZ0X?=
 =?us-ascii?Q?u7Of1kfZNwc1Fo2CFI0FvBP8/WYjLFm0JeGbSzakwKnKRcGNieW49V+1xg70?=
 =?us-ascii?Q?w0eBocbos5NMRFcMzfaRJ9ls0WDmw3DVoJFmyiy9iRXzgKNCvmaxC7TYo7Kf?=
 =?us-ascii?Q?1Mkdy+Sn2MLd0X50tdrBVdlwg1zv+gRiDWGcej8U2aSSWrMYVDbmYtnUKYHn?=
 =?us-ascii?Q?trToNyzLeWaWCe450VU3SpD+E9lqE6TlXKsQOf0RDuhXiVDTLDbV3Zxecv+f?=
 =?us-ascii?Q?kiGqeY8OKT0O0Wc8m+y/R2qqoNAJWHt7vkJhwZtKZ3/pG3/3yY4crXaQ9YUo?=
 =?us-ascii?Q?YX/sxzm7oMCGFsEm2oKioD/OVrXkYx01TYHiXBvndVB1l5C2YqMZN+KiO3Ko?=
 =?us-ascii?Q?7n9oJzcbappzMLxSgpR1ntsd/O6qWtp+DckHTPYBPNvc5WhvoR2lmVMYkZqO?=
 =?us-ascii?Q?V+zyusddZr6uKJONqWza7nmeXr8dZZbvV5CiGfZYVdbQI7RdIKF2rhxLjPKF?=
 =?us-ascii?Q?yEtFF/c4g7tAIN+0NIVe33CM7au5DAX430qVHJej6h/mDWwdvonz92NVLTQk?=
 =?us-ascii?Q?y6Ihb05jQywlc/6XEE2Y6Cox6PEkwGuzf8xwFpWRWzxvLSssucLgz025lG0L?=
 =?us-ascii?Q?LzxYiJWHWBsdy6BWfRSAXNXtZ69A3icIOZjB2Tx6DMTNSeD9AvQdrVOkUtht?=
 =?us-ascii?Q?TPG8LwBdv1B0cBttqZFsSMMHdmoIyxCFqD5j3Kn3IdxY8mZtpPSphgaa9MGE?=
 =?us-ascii?Q?i7P9A58H1htWOX8+Gj8dE3ybXm0FiDwr6bGya+HMhx7owvYhNTVBlfp5gcjJ?=
 =?us-ascii?Q?OI+oWrswO14jMPF/EddLQ5C2JDEQ/ZJzk3lze3v3mU3oXR5eM8lYjX+F5hUE?=
 =?us-ascii?Q?D/WDY5lr8WXRmtj4IZpQ3Ti9GkZ8bdRqGKJTfDnp/S6EtSaJskRQEIy3zbgZ?=
 =?us-ascii?Q?2TSQaPZWKCBze/afhPsf3eX8vtvcFXdAYdEZtdUIr50guWVCuWtONmhnyaLE?=
 =?us-ascii?Q?aY9CzHdxKxbWu0JI/KfHt7ddAPp+oNznbxz30SeSkp5p0SEdnu2oC9LDxckf?=
 =?us-ascii?Q?vadffl5aSWRqWEDlj5lWmC2W33VAtNif61/03iEvtwMY4BFl7ISQ70GlT+FW?=
 =?us-ascii?Q?fXPlWqV/Jr4RYwVNsxF0qmiZyiJYN8i0LYdd1Bz0+qT50+5psKeK/neFAe2b?=
 =?us-ascii?Q?7A8WXGgJ2ecdqEvlts53pVcFBUs+EvDnFuyCAP3+SF43H2JCSDIrhk09PWSq?=
 =?us-ascii?Q?4Lw0Ru0Iar3bTsdDDJzh+0Mv3hrzbU9bZH0iArGQpgOGslWphtPonqEPckIf?=
 =?us-ascii?Q?57c1AjijKRqvTIC3U+TKwe1lLMzotims2OSjzQztZuuDSYPgrAzV1emiTetU?=
 =?us-ascii?Q?CCN7QA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y1pguGwlknUYuUa9JIv9MrEm31VAbYSSYbnOs0ihKAEmRHUCikR9woH5krMoAEnm/9NuaIRMjip5qyyVe/rCdDvPjUYo7oWM/3TLlVq3+I2bFn3jUzq6eedGsbOavhA3ZHPGfXb05Zgx5GS7/srp75pUXs4sQolQoBXea9ckG50+mEdmPPqObqhpRUUisl2V7lOF7aVh09H3V36LAx/es4bBHJ4b5A4tRQjynFWGqXQqVOZptrtKuiIAP9Uy5oL3GD1gLxdCCTnK4veMX2Ryj15iG2aMyzJsWp3Aftv8hN5Cf4ARyzYmpnU5CugCGxOPW47YFJUMkV6keqflUSUiqpwQE+rMFSqBpuzDE8UEjjxEH2UiwVPcjPtJjLVzYgA19GyjG1SzeEwpjM7TeXmTmJakvt3U0F69E7gSbBYSHkMm9Sxcqy4b7RbT0B/tS/lR
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 22:48:37.2349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b183c00-7eaa-4f8b-327e-08de63765e66
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6095

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

