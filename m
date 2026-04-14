Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010005.outbound.protection.outlook.com [40.93.198.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E80D3DEAC5
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 23:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776210678; cv=fail; b=sH3ZT0uH9CkZFFjybkW9Ju3D7vGBKY9CdvMMFIW2X1Oh6DD+zpiefG3PQa6bxln7iGistvJyWmO9fcEOIPKPQAWEsLj2z7T0g6wnwDhXOAN+JvpvFNmdOqQAxUsg8c3Q+PbNzAyDWzMXqCFvqZSDXJ5fRFv5m5hL9ArypoAEbkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776210678; c=relaxed/simple;
	bh=e/6rME3NEEpVvTX3WR9XmHb5EYTinIFhd2EnsiHfhSE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CxPvCaGCTsOttP3n3CMcyRNhh4vnYQr83g7+q1hpj0AFuuYGQwOhsHHGmtWvnu/aAZyZHHQ2PJjjRkv8smKTcIrTAJ2kzexWjAr3LvOB9J0+IEpqjAg/7OIyl8QvXDffWjvmqtCXexfga/Gbm2/UIgphpVFL5qE1Q+Lb/tx1JvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WXcNUFYq; arc=fail smtp.client-ip=40.93.198.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WXcNUFYq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dr5pP4eI03v4/RqiqXtYU/fGnInMtfXzbrpCV4xe3iWEx31Qxz4qlcjeFYs1kMJh7OygHSw5XnOUeyGIXrld6kouFADDYkTi5twpxDEZjWRhWxVnHbMX6ybKiJqx+2h+htMH7zkJ8oDzVI08MXl3zAsiGfZqxR6Bw5PL+JnTshXtq0u4tZs4/U+BNBBPvei+FpJLza70pM7KWBuEi5ziUXPvOmFnIbcE1dnlWVKJwy5Z7ogU7Nrh3SeZnRG1Kuxuu4bxMMzG9jeRSB5oK9LTX5PWxZFhmN8rvkavebHtjuRvgIRyUuTuVosWY7v4/y+ggDFpMk1xZWxqfxoJeFDIzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Z/Tx9bM3QAkMvqPx3O/nCcDKkV8WXwDIKDraE+WIgM=;
 b=n27P7kw/p18few6tSylf1rkVnQVWEAC1go5b0175caFrNgRyvdhhmMWVHtY5EpTt9GSN+jJK8oqt7lXcsYI0dxolEX5fX45M3wOGiBRLo1F3p7ydNTv7AhlktuU5efYms2QHAqlYKewCF0GfeGJfDpbLVeY+hbQwAwMqXC73FWmWFLf7QsDsoyshdY8KFsH+fgyKm69e31vdiTypuFfk2Ggd+8n+HhgGoe2OwHKKA7pCYX7OJEl/9iw7M5IWeWc+lv5GzlN7o/16jm134WUHe+Bxiiar9rcbczbCdUxiHaS0nL7LnIHh3FdCcBa61S9hLCf7wd8+1s3VrpLqTW2FvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Z/Tx9bM3QAkMvqPx3O/nCcDKkV8WXwDIKDraE+WIgM=;
 b=WXcNUFYqJF2gS7w6NeTNXNgPqEBnvG40tbQYzydsji3D6E162OpWdxxC3jPiGrV9EvaBDHG5WQjK8sRxwprDpSlX41GdE8gbDT+K1s0BvA63xN7Lpt1WWmf5tkM1NYOkwy80W76ZsTJWiK79geSgdLTEyboE2Q10aOaoq0nQo82TFpUIFZhDATe3u+ysJ6SJPiIima7EfOXhHsgAh+hB15nAfqNRywwoJ1WhXdzTUx3XdS8KJc/eUILAyFOPADn68dwqmUbsPZLb/Zz7dvBIIg9IbOo+10I2sWBc+TIa+IcidMvaCeldleweJIaPx8UBF0TtH8oRV2VX9I++FofFDQ==
Received: from SA1PR04CA0006.namprd04.prod.outlook.com (2603:10b6:806:2ce::6)
 by CH3PR12MB7521.namprd12.prod.outlook.com (2603:10b6:610:143::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 23:51:13 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::e) by SA1PR04CA0006.outlook.office365.com
 (2603:10b6:806:2ce::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Tue,
 14 Apr 2026 23:51:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 23:51:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 16:50:58 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 16:50:57 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 3/6] gpu: nova-core: only boot FRTS if its region is allocated
Date: Tue, 14 Apr 2026 18:50:44 -0500
Message-ID: <20260414235047.439322-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414235047.439322-1-ttabi@nvidia.com>
References: <20260414235047.439322-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|CH3PR12MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: 35600e18-4750-4de3-1b2a-08de9a80b611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2CWW7ldh91J9JCBxorRIfzlSQXN6G6hFEr5PXSK0hE6C7aoa0L3kIOGphf8CB7fuEWChHKVKK8oi+3QfEKe05fXzCCE9r42eYUVBT2niuC3FLOlT7/elbI+pEpcz9O3cGPs0BN12eOAb4MuBlBXXeh9CX6TBZKSFJWheUYrKM458YWEzHLOhVn4p/A8QlfwCR+zaSehHP40iLJNtdYriaoJftKhI0F5TMDg+vvpHbO9P1/OJxyaeSmk7kW8LqukLRltzUURqmPmROa+HTH4P9v7TSiwi3lPEyIb8yxkYH3fAflbh66f8DrYynlqbteIXcSWz+cnEyZ8l1kxSc/CLxe/o2KkpeQGvZoNcGiI3SC0FBbKuhyd3c/lNdqUvdgsEIh+m73a5rLMY78QB6rxWA93MeQgy/g24N+aJan8FPkj5gKahb0fSULFMVWsCHftkAaFZuLBRY+pye425Q/MK3ebgVF1i+z4QvlXuqZV5+VWFXlBYt4zywvJm03TajB0fCvKajFXsBoP5FD4leydE8wB55V1HOL0OCrQAdTUDS5tV4WOjGdaIzlboSKpJd6Mq8xRGLvY7dliPG6xUOm4OAW7xgxLx1wxvWgBiGzzz9+hHEeSPKXYZqOlwwdrZ03UdCrMpG3oufmmgOgJTvszlCJFPezz8Oz6u30XKtIWH+d7UBVjdzKzyOWgF9Pa7Aldxwh/9VeIRW6ggyBrk2zK6iehLnA3kMYeS2IMr44dCUdxCfDAFgpUbjUO736YJTPDCaAArWcWlgg/f5e8/Sk8wGQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3cWXu9A/0QDbAWvAED+1dnzDS9o1CqXrZzUfBpg+y7MVZL5jHVukqcmS1eI9orWnE4TpxzUaj6UbMPNZG+Cl6jJAsyyucufsP20PTslkYxZFEFAvvy5mGqqdTaUiGwQsca3nEz7NUltjtQn/wwuHtDa56z4MlJGQA9qm/R1KbT0OpMr11CbX2QT8WpZsq5eNNEeg9Wx5jSMacnjmlVqsPsISrdYzQYo+FYONO45sjjJiUJXk0enT+3J4kLH/QOQIzgUZYECyD4jdYTGULGU3T3PHJkYDqzMDBiYhjAOwTUgHZf2J27YvBEyjavYiR9p7NLd9S40mLJvaUFjDT5fsCSxM2YwZplESIbmFEjB9gx5sLHL1jFLpu9fyiQ+AjPsxODLQByVivdzfI1cM8A9LYMI10+sKXBIBpITWlq3u9YpH1oIstYx3ynnaKs6Lw+c+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 23:51:13.2892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35600e18-4750-4de3-1b2a-08de9a80b611
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7521

On some Nvidia GPUs (i.e. GA100), the FRTS region is not allocated
(its size is set to 0).  In such cases, FWSEC-FRTS should not be run.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 18f356c9178e..5c56f0539dd7 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -155,7 +155,10 @@ pub(crate) fn boot(
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
+        // FWSEC-FRTS is not executed on chips where the FRTS region size is 0 (e.g. GA100).
+        if !fb_layout.frts.is_empty() {
+            Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
+        }
 
         let booter_loader = BooterFirmware::new(
             dev,
-- 
2.53.0

