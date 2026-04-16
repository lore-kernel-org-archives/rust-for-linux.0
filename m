Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010059.outbound.protection.outlook.com [52.101.46.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64B115853B
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 00:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776299214; cv=fail; b=Pb4fIFc+mG9Q9iBD13togUXxhjmCOvDDCfnJ6WzOXe1m+pYh81bodP2Y6PKf7X+TR8icbdJZ2JQvggKY6f8bDD08ZQwRLdwXJs1ptItuO7j98/q5PDD4pImnHmgVodvjyeR/9R2gvVw7O5+J0x81Falp823NTs/yJxx6aAROSh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776299214; c=relaxed/simple;
	bh=44NieS4IXQjhAdmxASa2f2wVZOs5FS7D5l5Nqwtmjw0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nVEKFmgbdQJBo+vlBej5MRl3J3FFPCj/V0fGOuUfxtbgleoIkyH8E02M0pwvHpB/EbgewgUpSLQ5TBK7N8R2kmn7AdxzMwWY8y8WrQaCD1t1mPzI2ygw6k61X9KpMg5JLIzX+XBp6a8hV9llhejMXwvL31X87tMruN2UuBD0vMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y8wq4ejQ; arc=fail smtp.client-ip=52.101.46.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y8wq4ejQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWar+yyZNmwRYKD8FyCy6kj2GOXGphT/NBUqi4Dh+UMomwI+zH2bijA7oK6w9O21cKOeyw6kMLJ5dWltPV+WoJI8zIyIr318Ts2F34Kx8S59MR+YW/63imPj2RaH7NBNvd3Z9J1QIRwrpbM3Jj2H6dtEeOIptUpu7QFAePBhOrlZQBTPnnKmpoLKMYDmV1eIu8KouhWtnv0yw5JKx3feuOWZHU8uUSo+Vg4wMwkEwzp6FMDddIA5SuUqlKNm650HMrk3obYGtAp4xukuXwQ4WdW2xqPt6OlKRs9o9dWAnR+Ejsmlg4lT471zmdQglxGL9AlEoO7kjyuVkUrmpJ4jKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spwQ7GBC4puhJ5dgV4bKFOBkbAM/weBDrnuhrX4wn7U=;
 b=u+wxNi2Wv/UOaTArxXoZXePMfhzl1ws2XOVSFCQ/NQs3fQjKhMnG1D2xPFs6LNt6nVX6gOETfKGYSLoEoI3ctuvo4K+XdN70ggiBL2Yk4TCLWJiaDHEB6rrdyv3LKmw5AB+XPcQM3nmHh47vugu72HUM/DhKrPDfVJ4dFzWDm6V//yLF8P77HFc4GUHQbORJ4KxdXzl+lAlEIvpkUvJSG/SB5YIcWlUMccQSCO5ibwI/8qXRCWiiQtJxAaXtjySNtyHGgxCLv1QQCCiRzVCqkxp1izHC0FcHTmBsMl7Ky6D9E2a66PEB7wT3l6DXttrGSKMNbUC9S/6lbBuUWulssw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spwQ7GBC4puhJ5dgV4bKFOBkbAM/weBDrnuhrX4wn7U=;
 b=Y8wq4ejQfGVX6rkqnmxcernPjSyrqmS2gyrXqRAsUoUnqA3hbutb9IiGdA3+2GkzpuoYu6yhM415nNpSdvjKHZgzTnQLvt8l5Nm/XPF3r14sIO9iU+aBZX2fx+plVLGM8ZObRRtiNrDxkSY9W/PUwZB6mWN4tSYyhYkgwD8Jf98DmCN3utVSkcg9YV2wD/AvxDRaATuhWVcmgec4W3GGhLPTl/JXbG6valtaZ4zYDg88UHYsfOy7uix/a6gZW6D3uumW2UztuuJoaumkhA5aKg16xF4xymNVtOI0M3UguNiWN9m1xXAcFqXqlboWRTx0agjA8baMSC7zt/v5xW0IWg==
Received: from BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::14)
 by MW4PR12MB7000.namprd12.prod.outlook.com (2603:10b6:303:208::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 00:26:45 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::32) by BY1P220CA0001.outlook.office365.com
 (2603:10b6:a03:59d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.51 via Frontend Transport; Thu,
 16 Apr 2026 00:26:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 00:26:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 17:26:29 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 17:26:28 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 1/6] gpu: nova-core: use correct fwsignature for GA100
Date: Wed, 15 Apr 2026 19:26:14 -0500
Message-ID: <20260416002619.900779-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416002619.900779-1-ttabi@nvidia.com>
References: <20260416002619.900779-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|MW4PR12MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb836b0-13ea-4efc-0df8-08de9b4ed6e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LZ37IDdmmEvpv25rJByFls8HjDkqccg0ewy6yRwe9pDsqFMsWmO06cYNoYXGYYwTjbA4LvAa4X6ZWvG421SFOS9htZIi+D9JgKNlAxAqKvfvs9wZj973Gqn4iGdHkqbyYl0xOnJQwSkyRfra/svzUjkzaM+QwehUDmnXx1/364OxQbFbNhRmA5eeWN6Xph6s7htUF+sxVVfuVGvrqei6GV8U4lqbvOMpCj5kLJWKl1cWhuadm6OrqO6pj5IDRnENvdyjUDesbYcPNWapRZLtuYwU6rHdaCjimvw23dujKkTnqVGjJh4fJ1HJwrBsgFRCbrk+W+iJRSqzumPuYJHiYDXnHw8u/swxtHHyBJYzRtbmYK3EpcVbZgQYltcaFOwL0oaTPjgeHGv98Y7HPfDJTEZ6jy6nEHWteR/jhIjq43+fD8NoJRIcS65e2ftpvwewxVWh9pRtMUlwSheAsTRk7rW+nYUXQdcnziPicUwCLOiW4v19VhgPdsRbaAJP1rKCagY6dN/BE4tqkYqkI9E13gJbFaaOtnGgCz2LqIBQleZS/47xSGXXa590bTvlJLhzgwpvgRBml9RfFn3kkcuyyz6wrZrnolTFHH4np/khZPy2jK4uY6AeOtdNwqLK1YpOU00Q9xCJ8kl8XdVUpIa59ginVurnESjvCxLMo5wNPQn9NsDpnG/j7ZMyM4mVYEjFpPrspP4q1fr/CSp3yPIvchPQ4hygdVZryrTDr7dfc0J2GxruMYihBYx2ZbHP58Mh1p02JVvEKrWXsoarEbgc+A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qDaCeJQjwY5BG2GH15fKy+5uZhrBa6HkIe4NGrdryNFfgRhapgcLj4CZdcdB7wq52eXT72Tu25i8qiTmsMTxgI3ZOVUYrQlPdsGPhZEEpAsXXi/zYGMsFHbqiYZd9vjhZZRzzAk+erWNU7/SiSWIzUsmLl7/+jAXflq9439crgMp4StBo3QWO+Y/tnrjh+MGzuuBomKfxVWueBVZVqL/iOaxVIX0WLtpnzhHPzUFn4HQEq3jcmvg5I/Pqsno9g1rHZOreCj0Xh9TuZdenx4RzRn1GyG9CLUA4sMYB5zXv+2RDa/mYeaZ0j9gImV7ZarDNDDJjNLNIPEI/pAa8aEnQTRe9DP41m2Fp2uJROHB+2P3PZDSqI9tHvAybyb227Cqd6uhx4m16p60jUqlwYbCvO3LbZeQJkcm7tlVOa8gb5B6KAqiSbjCiXLxq/Ro80HD
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 00:26:44.7249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb836b0-13ea-4efc-0df8-08de9b4ed6e4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7000

Although GA100 uses the same GSP-RM firmware as Turing, it has a different
signature specifically for it.

Fixes: 121ea04cd9f2 ("gpu: nova-core: add support for Turing/GA100 fwsignature")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 2fcc255c3bc8..c423191b21f0 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -138,8 +138,7 @@ pub(crate) fn new<'a>(
                             ".fwsignature_tu11x"
                         }
                         Architecture::Turing => ".fwsignature_tu10x",
-                        // GA100 uses the same firmware as Turing
-                        Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
+                        Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_ga100",
                         Architecture::Ampere => ".fwsignature_ga10x",
                         Architecture::Ada => ".fwsignature_ad10x",
                     };
-- 
2.53.0

