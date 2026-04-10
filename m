Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013046.outbound.protection.outlook.com [40.93.201.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C538037FF58
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 20:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775853475; cv=fail; b=DyYUJQaIpUuIIwI8cwLeG2U3cMLuj7K7ZhJiGMZZsOnzQHEwKVoYqLlmCiWfH+7HRrS0b1bpeQdEAk4KukVP6vGkc08XZZtG4MrI96jJljhzloU7d77fiwOLb6jtv2eJBdiWysKQWjPgSz6Zh9D0LXOCotDo30jFI4m41liqLwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775853475; c=relaxed/simple;
	bh=iAa9tEVJyeoTNbFZPspPFprvxJNrdzVDMfwXrL7jkOo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HpaHVZ8mGuuzi64yVEb6bydr8r+LVV+35ux3Zgmv+cd7QDa6fdFNaWcMA6zOKpc3hePzqhR+OU4Bvre/1Bb25MlvOn43T4aSRCVlQmkI6Bntj/QGrxLGvIwOO8RiFn3X1a+vKXDduJxGrcgnk0zCLpjPU9ieF+tOQyFkSjrMh4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gUHikxyd; arc=fail smtp.client-ip=40.93.201.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gUHikxyd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LEs0oMClmx5SHPdFRual03bXrGRYDoCMmkQfKIoYjuDvmPemqX4p+fJzfT8wg61uRdw5qyDYDpNF9va3ACoiNr/0vUiyqJ+ttxVVwrnmmQZ+WrO5WZJC5EBwgd8ry4rFOujtN5WPcuQpZK+ek5dfPYdp3ZTBFvB4rr1PptrmjHiML9bSeEqo/lXq1m3f30aRP5zQK+8acPDsw1rRhiu4m20LTAuspvhMdhxzIdADBWBRK3daImVb91O6ECAQ69EP94E2/PI3E8XVs9ZOKSuChOcSvzkYWdKA3zKTID8XY9uJ6vd7IPIEsheNg042P3uPkcNi57EY+JdspHPOqRKgdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NB4TJJiqAxRxUFA+LsYx299v9RkHOxU3q14n9yJcOvM=;
 b=tNTLN98c0ZClFpCcrtN8g2n28RSdytl0fjQ9Of6rorDrcKDvyBZxDirxE7wzwJNoHPVns17zeSTzpTgId6gu7JtuBAzUJQRNpONwrtl7jC9SyLNOqXGEpdZfDNiBqIrJKKnKOelXHfB+JaSPB+ug+PNbMeYUJIPqmQ3MbP9O7n+/WtXH3n5Re5XYKRQPAHWUrrR6FmcOg70MPM0Md7hBlCkvgPc6ix7FOwWDaR8fB2D5X5T9e0nVfeq333FXaeEbyKeEP1oBbcCDbFnexLCuVSeHu5HKCyZ7IBFxeNL0/hFh+E9DKEYfLbh9uUxZXZclnWaF9wITxlw5jqGShYOHMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NB4TJJiqAxRxUFA+LsYx299v9RkHOxU3q14n9yJcOvM=;
 b=gUHikxydL7qTkCs0HNn5er5CQOhVjCfbTvGFx1HH/yu4JBHayamyri/3Sm5GUbn1Wb/1bySlQ3XmxtMIOsvWO2rXN8oyr+R9AgkJvR1OFv5ubC8dqD5LbsKkfk1RJRHzwhHax7DSkRsEpE70xSLgrqTJNiaJZwE2/nicGJSmzixFrohmyFin46KTUj3sSFTQdisSHM89hSobi+NQMLWeKAThJyVZG/irChHgq2WgPTNZBOxQPLXjKDq6O5Of4y9TXY2Gj3Bzae6PJwNbMym5FE9/o2DwEawPSvIcg74oM+pbHOKEySMmQxyoIFFuMexqiAzNJi0AEbI80qJxaxPUvA==
Received: from SN7PR18CA0003.namprd18.prod.outlook.com (2603:10b6:806:f3::23)
 by PH0PR12MB8030.namprd12.prod.outlook.com (2603:10b6:510:28d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 10 Apr
 2026 20:37:49 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:806:f3:cafe::df) by SN7PR18CA0003.outlook.office365.com
 (2603:10b6:806:f3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.43 via Frontend Transport; Fri,
 10 Apr 2026 20:37:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 20:37:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 13:37:32 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 13:37:31 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH 1/6] gpu: nova-core: use correct fwsignature for GA100
Date: Fri, 10 Apr 2026 15:37:17 -0500
Message-ID: <20260410203722.1586938-2-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|PH0PR12MB8030:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ebe3bc2-d7c3-46b6-71cb-08de974107f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nbYHH0ZE2or44cAgdQzerLfF048KnXTFxPatJEezlXqKfP/3USG6iOJrZ1a0JPceWjQ4FqQ0zOENUeLAjgCDqwUgnt7o9LHwZDRwZ4VtN3DWNaXex49aZ5FCOfmWo896r5N5j5SyKMyrcyI/RXZk3oYfAIe1H4dzkGcsk1nn8DMnX/ktzRyPMKab1miHJgj59B/mXwP6L2aLVdao/svpDWRm48B8Rn6Cuz/1MCTXsj5i0Of75CduJq4nYRuXsuH62j43Y2qPkjgwEIMnHnkNZiNmNi7yy3HIJF0FveQ9G2KpnfkTjWUZBLyGu1DMJAFRdUE4eE1j3KPgnnlZ3C6s6Nylb0XikUGEFoxjscUzO47Ew4YUCO/siPj54a6Ws95TuWMKN9HGGrTnG07BC4g9J6z6baEfmVIhPqrKwh6NwvGbHt4/J0HdToBK1L86dKe/bUa9etQfZ9nuzivB6tCRXeaJCVjJyBBEt9w0OToKOrCKX5rvjZ0AJ33nodU3GDtUFhauln6jXNnp4iYovvxiXQxepF1br6VE2Ouqb2EbHfMpKLTdTwwV+El+/5lPSmPF5Ly7oThkGljiJ72G5LJSg6ViUGZc1pNPLG6p4BLldr39Z0Q019DhPBZD16rum0qA0XFoDfoiPLZ2JH4MQxrNkuO1PrPjA9KdWRFRDJl0dT/0XJOfOpAK6Wrx2c9tHfks4uQlkuRguk6ngMAIfncYmKDhlAox4GCUc6dd8oTHxf1SJ3NgG8SNvGMELsvI3UPcFEle04JYohktGTlABkwQ1w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GULyTe1Pym/vnwh/Rl7wFWVIwpOccLkBF3WZigaDYNgVastir4d9J7DfP2ubTIc70Mt+Rp5HG9FbE8KHK2GDexWdXyraAYjeKT7V0++n+7n/u4m9jOMBoekv/38xnaxZv3COLoZjZ8qvx9xjPLGLJhsW5xeW1/dhjJ4TomSG5Ay8MuU9gtmsnroWRRBZ5A4Y//mCFR9eI73a7b8G0Tadd9Q85LOs6DlEowi7kELtAhjKdVogIebcJM6vcT7au8UfqoUF5y+D0EboP44rLTKbqI0u7c4VsDN8/k+4hF9zyLTNU20BFzhsn0ISeAcCf8HU86aYciaoZTYgYsCXtsDu0BybO0NSxvg/CRFQ+B5YOxQY+5Zqgn9znsVu7g/wQqwR0UVNK0LAeANfTVFZlf49RcQyEohe3apX2sPh8rMpbEn41MKEPTZjx0VPcYdNYMtV
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 20:37:49.4026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebe3bc2-d7c3-46b6-71cb-08de974107f7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8030

Although GA100 uses the same GSP-RM firmware as Turing, it has a different
signature specifically for it.

Fixes: 121ea04cd9f2 ("gpu: nova-core: add support for Turing/GA100 fwsignature")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 2fcc255c3bc8..63e464788c0b 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -139,7 +139,7 @@ pub(crate) fn new<'a>(
                         }
                         Architecture::Turing => ".fwsignature_tu10x",
                         // GA100 uses the same firmware as Turing
-                        Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
+                        Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_ga100",
                         Architecture::Ampere => ".fwsignature_ga10x",
                         Architecture::Ada => ".fwsignature_ad10x",
                     };
-- 
2.53.0

