Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011006.outbound.protection.outlook.com [52.101.52.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527103644D4
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 20:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775853484; cv=fail; b=Zr/FfKAc0oDhy5fkqY5P/54Pkn63JgDKCn2c4kQ2rdAePT05WZ1cdcYZh3BBoU2vMVnMNZnJVM8HWpM18/79EXK0v5hKS1hQnIS1SFUEyIYj9ESLSAcUkIonGy2+xraPvPvrALA9QjiLtG4FUt6UheYnP1hdTQRu1iBgInJPCOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775853484; c=relaxed/simple;
	bh=FNmkiSfaaYgidEY0LMDXX0Zt9oBOFVTdxYhgfjoXrj4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FE6kcosROsJ3NztAB90mQOHrELQNE02h4jg0ts7CDacopnI0XDzACVVJIyWL4o6F2jze8fOnzsgYUHq5Stht2lZZCsTZ71LibHzERhG6X+8gPRAskXSMPO+OzcLHqe97Kb65IThaOuCcHMhBj2nQtLW2yIiyIVGQKsVjiVivJPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kWNufl5C; arc=fail smtp.client-ip=52.101.52.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kWNufl5C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lRjYsSjjQWjF8S/07Q4ZZ6JljLD1uZTk+MNYUlE/BVBrGnrQ5mwQ9T2Aalcm6zKXFH4DgOvVNQWQ3ZVDS4h6fZVtLFbqNp7m/M0W/HxAePXiJTrmbaaA0efDwlEIwCDUIBwAPO3krCz4yru90EX1UCRz5vr/6JVaTiufJghQ/IVHTLx4EsLhdggIU09ulMZQBztTLjFPaB6dw/ULWM8120kUEiU6YUy14KUqx8IP62hmLy1qQvwMjia+wFzHGIMIMGkipZFgsbTuuk3jnrIBUPwu8ULivKxEFyIQUm8tkvk08QwnHz019jqFDHQNJyR7MtxOW5XvuBUsOjhAyuUP+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zICA3I8+2MAFkOhR58dYqhvdE3SG+420uKg2sYxzAgg=;
 b=AfonFvPCRexHsSdOy+7yPu7f317mnvF+M1Ct2ymO/uQYb+WKJiTbdWFvzI32pxCLgmwBBp/E7HNui8lUekXK877ZSolPEbVL69FiDuoiNO2/nX0Og6URWNT+izWD9VVWgU9DvJlragQQBEkisPajdZLKDh1mAyOaq6iLXfxG1eFKQsglaQlpKhf1QrfyIc2q1cePrhWTqIa8ATSYk3ZIq349zw7VuInmIE8V0GnL5sMOS60JqgPUGiPOcMdJYOOwCLf8NnGBjaoh0SeRV/mGvHBweY7pj76f2lGUwvNBJGWLHoQJDScIPjgeHV7gSl1aKFqvvpd73nj2bOuJDjtZHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zICA3I8+2MAFkOhR58dYqhvdE3SG+420uKg2sYxzAgg=;
 b=kWNufl5CTry91tsA17i6Wki+n1NGBFY16lF10XUyPbVLwBcBBe/eZIkmSttPChA61/iQ8wV4xEqd/Vj5dl6vSyD8TgWgKdQexDmfA9sACd8dOczozR24EINo4a8SHG65noZnfh/28fJb/a1VSZ2uZA5Cpikdx1LunsP2fuAIYlKBSNSiKbSdFW8tkO15Kx0A75JcIfAdsseW4gYdhHD+u/glQ2ikrPfK5uJSBarDWOQ/wq5ZIXfYxJ58BIpgwLT3xfcXp88WoPV8ADmSngRkrr1aPGncpRJ6109QquozRV6HDkKo6VK3nPHWdfa2h+kDCxYKdtv3l89d0PLX+CFwEw==
Received: from SJ0P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::28)
 by DS0PR12MB8573.namprd12.prod.outlook.com (2603:10b6:8:162::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 20:37:53 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::f7) by SJ0P220CA0018.outlook.office365.com
 (2603:10b6:a03:41b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 20:37:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 20:37:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 13:37:36 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 13:37:35 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH 6/6] gpu: nova-core: enable GA100
Date: Fri, 10 Apr 2026 15:37:22 -0500
Message-ID: <20260410203722.1586938-7-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410203722.1586938-1-ttabi@nvidia.com>
References: <20260410203722.1586938-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|DS0PR12MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: 23506700-6a6e-4e42-086c-08de97410a06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	PKO4twxZ1Djnk+GTpM5ujY+DTaEKXa2vJc1Yl2g8+RsOs0feDVR2RNYvwLFJFnulPahfuHf6E9eHFmTnvQTiZuNbm7Dev2CrhlGHiK+K6A9HX8V1DQ6XJxbeS2oN7zGVXQ0VY1vmkthZ/UKQp3uRQ18Tq6g1wupkyRtwFgTp8l4EwQ35RJniSAjWA8nuqcLJ92SKUxXMkg55aipQnhb44edoN00/GfCCiYdPCRU35Glk0KrPT3XTx9pG4PAHlYFMZfysLKLC3u1pzBqosgKdthPz0rVeM5qlpq9t7luyd8L3CCj0rLCC6w10F8qO2/BVJkxqCZj4OERackHIsds1JMGo/3gg+RGMz76BS/ObJqMkcom3slERMxxGFtoyJaOWu9sdN6a/DVIyl985TJCVfalMc//RtMJ93rg7FdD+wFBCvqmi3IeC7ddfvbnpQYMA95GOSzgbk8ovGOAJyHA7si2mWMFLHL97/O9lNtCBLKuNcOerD561UYA/QtficVmhpV1cZ0RZEu6hu/0cSDd0uh5BrlhvZVxiV7io0KfW6DWDr/q76uvj0vXkGeg3HawX2v32sQxYTbgYNofZTXMY9RPLyX7KPgD1jy9d9HiRGOgl7m6/9E9jJZODUHTu9vvEhFxJLMRIe0gf/402X65dL0ThDZNCAORmAfUM6HrujiPDVekn3Bv9guFdmCrJ7eLxAl/PpOyIdsFCuwoaLu+RWHJiPMnPMdLN19Z4nDfoZE/Cg/pq1hVCPZz6uEPTejvOWo87K8RAvYsXlqL0KNgqTQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	unJMd99HlXJvJIP5ySzyvFP8zrIWvQmHt6sbzS/XY2U7y93VQWcqgWH2psLP5IFx8I+PytDJvN1LK8lveM8iostn0rkYbAKYHmH5r1CXETaJxFJvLIGgNibeL9ENG9CyFS6ujbNty2BL3AMFQyAAqONU1CfJYgZBAX9BGc34AJKDCB6k8n9B7KVIc3HGw5GOOSa8fGC4FUF+OvW6ORQ7QP8XUaXJDb3bLOMqwP5yLdJpBbu5dM5SOA4LiG3ohA75WRgIABcaYQuJKG4NmItoT/AqlKS+2AuQO7mFAHvMVDyvLYmHkTZK92Tv0S6fA2IMQGdNd3qD+qM9rbLdMhjhPsT6OZusEdNzGoZRuFqy9zTQE/Mu2PAtVqHJqcQrMlsQJULp+8C8T+RbvSDDzmVCTO7bVN1YRoEzhUfgebcPR5vwkIlUlTnO5p4X7MvVIZhd
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 20:37:52.8756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23506700-6a6e-4e42-086c-08de97410a06
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8573

GA100 is a compute-only variant of GA102 that boots GSP-RM like a
Turing, although it also has its own unique requirements.

Now that all the pieces are in place, we can enable GA100 support.
Although architecturally like an Ampere, GA100 uses the same GSP-RM
firmware files as Turing, and therefore must boot it like Turing does.
However, as a compute-only part, GA100 has no display engine.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index a7e5ea8d0272..5c2f92629eec 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -77,13 +77,12 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     use Chipset::*;
 
     let hal = match chipset {
-        TU102 | TU104 | TU106 | TU116 | TU117 => {
+        TU102 | TU104 | TU106 | TU116 | TU117 | GA100 => {
             KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
         GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        _ => return Err(ENOTSUPP),
     };
 
     Ok(hal)
-- 
2.53.0

