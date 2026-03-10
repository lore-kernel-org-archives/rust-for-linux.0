Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010047.outbound.protection.outlook.com [52.101.85.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5D936B05F
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 22:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180052; cv=fail; b=IZeXVLDOUCqU/oeC9LaUIqifbQnEaX4D3JEwaWhnuuBn7fZxFOaB/JkVrNNZg8qO5x4k4r55o2MXrLvmIjivBh4+3xp2lXW3qPHzgs4G3WmMpQvTGTqKJ/FQ3NThu50uOOOR+EQw6rT9qGO3Ty6OVd0BYOOWiDgiR96lSRWO5vA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180052; c=relaxed/simple;
	bh=QTvSoqwziQ33U1sf6ma1zwH3Hm+i3YmPx/7MDCDcg4I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CzYeN9ralH5JlRZeV01/KPt1pElIwsZ9V4vfN64IMtCSeSM3hIZZi88K7C86oRA9GS/H1WZBSGWiiR6Fg4rGQW4kngLHp/Ru0TT/wyG0AR8GGoAHxX1zpcTEgRlenVmWM/G9BOIuUdvCHqQ/OYbbisrsmfjG/FECpTqu3SFonwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JOBzHm64; arc=fail smtp.client-ip=52.101.85.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JOBzHm64"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywugupv7aCqhw1J7aMmejTv9X9siVD70E/0Sb9+GmbXaTvBKfzUPw8xwpYnHEopzDwj0oLmCGByxGlEXAFNaQFaItqDf1DNEhZgWj9KJLJQpzSI1IB68aRSc95svAMp4v6ZXYupcS/Ha3EZ/muSXQ8pd18c6riTtZ7fKFhBtRP9OI9S4HyBrSmd45WnJGflnukhkURdJaxOenOTIjlndXFmqebaczgGu7Be4U+/h6easWUkpWMrpR9QimHBRXDesAgHckPG5xzhaE6AvSYUDKWJtWQbzvv99oJs3aSSapO4GTulDQ1Ky+tGA1y4mu7LTzDgFP+8CQ8v2Mqx6K/4ZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrK8bD29AgVRcgKaKksPvQA5F4lpDKpplo7ndOpERPI=;
 b=rqiuZ5Zq8DbisqVKHjJeU4NRkRWHl1iUkRv+7KqL+5rgTaYHJL7pPo6XdpszlQ8wYRRDvc45j3Y8C5wIzF0e97P01gmwvhznLeXDvVnB2+9ZOWGuNNNbu+eVrbJihjbOpQn1hpzZfv5hwIdEOyRUVJ4KjXEKQCABYcl+cnPv1NaFxvg8OAb+JumYKpsJ5TavG+gAcQs4RUfTDJvyCsZgi8iCCfH/PvP0SeN+Mj4hxgYHGv6cO026bPuQEQXed+hRjaqaHtlVjiI2s/O7H4xqFXHVx10hR4sbERVEutFfcTrDGPz0SqLm2UcY4vvO9oQh7nJcvQgziv/eYcAwGvKCHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrK8bD29AgVRcgKaKksPvQA5F4lpDKpplo7ndOpERPI=;
 b=JOBzHm64L7DDx87UTAeiZtQ7LINeec6vn12jYalSuMPkcNt/ClB91bRsDySm8lFq81t/+Pwa+ALN/sT/BzwFtHwHCO9JN0EqKo0YNJkEuWLCHQ1o1kY/gdKsIwUpGkMyQ5cM2buV0AZyMDbi9Dw3aqET8/9qsrS5+GbQ7+wZxVKV384Aq0NJG6Vyd2v+w65iUyJ3e4Y9tMchiAWalwIkRmcN4+OoLxzfvTIxcCv5dETKcpHZKuc7ER8L7lI4kaMM+z/vydgNp+w2iYYGzHo2LE4G1oFAHNiOzCOzUkCrvgBFlgMfV0LZJcTLatXlafuTezPVIhf720UkI0Dg1vcR0w==
Received: from BLAPR03CA0011.namprd03.prod.outlook.com (2603:10b6:208:32b::16)
 by CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Tue, 10 Mar
 2026 22:00:45 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::16) by BLAPR03CA0011.outlook.office365.com
 (2603:10b6:208:32b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Tue,
 10 Mar 2026 22:00:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 22:00:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 15:00:21 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 15:00:20 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH v8 5/7] gpu: nova-core: use pin projection in method boot()
Date: Tue, 10 Mar 2026 16:59:58 -0500
Message-ID: <20260310220000.1897166-6-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310220000.1897166-1-ttabi@nvidia.com>
References: <20260310220000.1897166-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|CH2PR12MB4181:EE_
X-MS-Office365-Filtering-Correlation-Id: d3df3382-3be7-49af-a607-08de7ef07ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	3mwIdE7P16kfbq0FrpCZ9+GzQzbbeiYDMjrRVwn9hkixyNm30QV6DtR+D2eW+Qeatn/20N3QXivc6QRKJQQikve8X9D6+0K0UHH1FoXWx5ArDym8DAKarURpUELG3Tdp/xBBo+8mA9RLXGnfZEdqiQuyVoKdREcImC91mjKv/7LIKwEKzwoZWEBFo7R0TXSQi0ccHTaEhUSlQ4NglpJkaJrRclVr1+mHBKRQBfm7YjeiyoRgXcS5DaDM4kAkC0IRqahXx1Y/6e6ankLx50wOt5yqrfhVAoRm4ISETRkV5EUlPnqTY14hyISh4mEXY9kRijJYnEIOy0jwPxLFfPBqwANqm4SWXV9ockB13ls5pGpLsrC9gPcORapMPCzBkUc7IFOKQHKpsD9L9hZlvXWrhY4T98AsPjG9PYlwC6313SLYmLOT086TC3mARh53tiiJ7fhJf7SX7stYRIAP1Dfw76OVnBIMh8EO6o4vz6XSRGRM8ui5U6A69FF6DZvmvEsNDvp/HTLWdctKtMjyEQKpwDoIRH/l3IVBjjXfI1daJ0GNbrSoZM90FD8UBVR5kdjgAR7k18sf4FA2ljh/nfbkEDNx1KTGQiXY5HT1id3lgz3o3Ewd0C4vKi2steGO6pj35l7eJvqBA4Wm497LuYsgi+Ne6TxCpqOqaQt8F3ZhQ3aTwJICb1Rv3Ldw5DX1ojU/abxg0yaV1xFE1BS+Zdraxa/Bfbi8F1uBtzV3CQHOaEd0Y7CYtlrZgHUpwvRDFEI9mNkgY5kDy39SxL+cOZ2kNQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JZCWFR1YMsBnlEn9nEQl4ZC0YZJZsc3CxiJkhKnNdTB3NWV5+4wWylLRvxdfKmlZbZ3pQKhOXBCON619mRl+osN5vUB6SoC+bA5gut4WGYYO7QlHLAJPER38Zll4DBRvU5qc5jzYLgNyW5btA2OHr7Ve3TzR5rJpeRLoAfOHYNPkMNV44e3D6uaSA58fXJCR7y1PtCZhtpWoQPSogkUbyrE6G7wawi+OCysC6g0nX/AcRUVPcNhBbjldkyKy9tTz2mMEQ+mDOj5Qp7BWpMLDgf9448FkhYcEu2qZhDy0IVHXXQXoIph3BlaIAFCHECFM1HbmTsqSHtqBtkhHXXNBbLH5Yfp3FNmzlpg/EFXEJ1osEIwMfC740fKH9DFK/LS39DMou1MbpxS2bLz7PoSqOhnOtLvc3wXa0sGuH+sqtfNttEhmExEuIQ0WFCIwvAdj
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:00:44.9686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3df3382-3be7-49af-a607-08de7ef07ada
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4181

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
index d278ce620c24..425ec8bfd17e 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -168,12 +168,14 @@ pub(crate) fn boot(
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
@@ -222,13 +224,13 @@ pub(crate) fn boot(
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
             Ok(name) => dev_info!(pdev, "GPU name: {}\n", name),
             Err(e) => dev_warn!(pdev, "GPU name unavailable: {:?}\n", e),
-- 
2.53.0

