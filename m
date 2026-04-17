Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010003.outbound.protection.outlook.com [52.101.85.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A292C21D0
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 19:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776453304; cv=fail; b=l0vRbPM5u+N84/Me7M/5taHIR9SlkmDNZbUwmXT8r/Z4CBMTX4OtbklwyJ/LKPzhBIB6wwnydTjYeSiwr60wd/uEXeuvM55dKg5iiUwV+lHRvEg43hJIv0mheCPyDm74pxCN/Np78/F2xxwtsE5qpgnYikvafi6MLDuIVLxSeNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776453304; c=relaxed/simple;
	bh=XMRKPzvNeQKMfQu5K5kSM9u76pK0FJT1YsBwtLiwNH0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UI3Efnwu0YS5PYNUXXcBZcsniKDmredFknCGkwBZUUy8E8YuHKe4t0OLuLPNtXk5BJOPfx1owcTdKte1uzn+jWVbdcKRtRRjQOn4J7bF/toO32CrSE+MZyW9NScDJgVrAYz8wPwAwi/FFC0GXBUlSMUF1PAffo02XJLTb15vvNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZPwXgs38; arc=fail smtp.client-ip=52.101.85.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZPwXgs38"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AabxmnnYX8dj231K5kKuzTwSO6R4KUIMQDgAsFW/8RoqaW3AZliHOGyXlxJg5iry9TEcu9LY5d9WfOmjmodTSk2G5GCqWs3nCC7CbReeibzJYd0tK9JSmOdoGlKBLjf3XFHay8YMEeV0M5UPq2TeQROa8Tou+5f/eNpPPX7tZh96pSilkU6o9olGxSOHpt1I9q/syQB+zn97lPqLlXtcXcwPsPLR+RFwNTBYDxkvJ9VLh2ZrKl3k1YEwv982Yhd35sou93AQ1d+mW9i8SjIDlH7H2zA1MpAYKTb9BIbZwtg44HRDPHnRIv6osgGf9TAULcPnpUqelFSk0Ucpje9g1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4euHdJdN3EZD/uNq/IOLgBqJXPMF4W8OiHn1uW2mvLw=;
 b=DwYOCoddpQAlpTU+vxc75VKw8/AZpWik5LfOoiJfT5ejKCA8myICbKBc2usIVjfnUQIYAJe41s6+KmiLX7ocVWcYMby3KM6AiNMaPPGLDp/J02UK2HyJioHaTNKwwEFGk5R7pNdzoBssPSLNrDy98hvMSFlccmNDTM1MW3hOBCrcb9CAOduPcbyoBAcDZYAvuj7fWLfTiUogjyoD+4xzteGmnzqT/LuvhIbc8L/lLFW48NgyRQ86qwGu5xNFGm88hlQ0K3U9wUC+Fiufbw4yfhXpcnlzogBiL696tRduy62879RBE1MJaB8W5Ly+zJ2LoPzmq2kiAoOq2bPxG3Kdcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4euHdJdN3EZD/uNq/IOLgBqJXPMF4W8OiHn1uW2mvLw=;
 b=ZPwXgs38bOjRtyFynlffgtc1uuqdmLAzONPVj9Ojgu/xEOQuGhSPTmCGKL2XcIGlUavZp/8t8OIBffH2KCgNtk2O4HqCpPKokFR09/eYKecX/84GdOKwKOqD0hjvAuqHQWIL9V9NwfWNx5s/Zdf9EuSmiYxcI43/1Bb9pdGVhJJJBozlkp3mYJL81Up6GTsq94i2YLaSx5OIBgNZjiXBvBDKSHwJ9U36JqevrQint3hV14HAk9MpUiKXc3LoYDLjatwePa0gxtQAjKIV4bD2lFGWK5yzJwCcwSUNCSPrejQa0sUrLSAXOfqxwyLZ44Smet5p0LZd9FAgSIyk0ozTHg==
Received: from BN9PR03CA0226.namprd03.prod.outlook.com (2603:10b6:408:f8::21)
 by DS7PR12MB5886.namprd12.prod.outlook.com (2603:10b6:8:79::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.21; Fri, 17 Apr 2026 19:14:34 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:408:f8:cafe::de) by BN9PR03CA0226.outlook.office365.com
 (2603:10b6:408:f8::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 19:14:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 17 Apr 2026 19:14:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 12:14:13 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 12:14:12 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 6/6] gpu: nova-core: enable GA100
Date: Fri, 17 Apr 2026 14:13:59 -0500
Message-ID: <20260417191359.1307434-7-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260417191359.1307434-1-ttabi@nvidia.com>
References: <20260417191359.1307434-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|DS7PR12MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: 043b0b1b-d152-42a9-a1d4-08de9cb58f47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	f55rLEFhvRsahafq9oMKvk2zzUDjnAVQegPXVu5IwhjnynYoB6g5IAgMNcRZvgPenRJNZ3OLQvnpXOIqchiFv9xrjd6ZDxUj3nD8LWS1Z7Og5LQ4lIW3DcWfCEX7HbyLEMUkwPvx/pLY3h4aOewEjqgwzWyMLpkZEW5cPdOQ4WZgopJ07vU85il4WCsAGWs1kc/AeEZvoSkMHUwPVNbaFCFimgbwj0KRlYI5bl+Gh1GdAhGITBp+qQDgDzeXOi23PJVS+iQwKoJFLgsQA8ssERAwOOVf/ajMlHTpd6DZzsVv1g9xhAase3zIOXIbJNBTDLf2LQ8+M0wp/pJB2Fz/RJe417O1lYtom+2gWQBHukvETcRfgUZiEig7d+x01nJTFYA2c2GWrciUQiy1LgRWsPcw+gqEO4deEA2w7HSN6md8vb4m2hFMKXm0SRWeOGvhLg7n2vhDHPvIq6Ou5F4ZI6JOYqE8n4vp+XkEimBkRe084D6VaJdbHQaCK4x9vNVE/E4+0DNRSpPTorYmf/1TStoibkgUP67zHf307wZstIh0bUIJaUtYNy3Jd5BKT2n9oWSSamw8ZxXyqujnEe3GlJo2uY0uXnCZ0Jrqm5dv8pkuTYODBKdaSsyRl6WnzAXfJfXZXxQlmETQtJslZqXZjKNMk2oBWjY2GwDcUx84RystFojHGfGqELc9NvclLG46P/+CLBFcxIqXLL1RKLJ+tIVegVuoDiA7PklzyGtU/y3hrCTp9SFaiK9GsxucNcoNifRbMbBZsoKgfTeHb8JWcQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4eq+K+h00MT/WWkhRnmBWuLn0as1LW6m4IyQt8eYfzK62Yb3ZoZO+8TnhoC+oC05NUYc5qc/2Qnhqq+0NhQJTWfeKWy/PKjxSJdAsE9ro1yyqZVj88W3EdBYwXQXH/Xt5FWSiphwTUi3e14oL/g5FNst6bpfPUN17s7VwAh3oIBDQVYSZ7+NAPvPLobo/SAG9Zb+FpMqNngeSd6grYGYgnhgXlySYDBfd0PXBNBz07rsyOjbSrxMnp9KqkGQsbDDStlQdzh9KAS1YrFxd26O1cGQnplSpF9m+GSPi4iMfp0fw8kIyQ1FY6yYRKgohB4KGvDrAG91x8hxKalMiGwvOViJheQnvS+UyFECzSnykLAZyEukHrRKPpbqgWs68v3TKK92Mov6dmTk0Mb+b0WbYEZk9lQsu92DugceFnjYYrNu53qqNwPjGPApdOE6dcmK
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 19:14:33.8214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 043b0b1b-d152-42a9-a1d4-08de9cb58f47
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5886

GA100 is a compute-only variant of GA102 that boots GSP-RM like a
Turing, although it also has its own unique requirements.

Now that all the pieces are in place, we can enable GA100 support.
Although architecturally like an Ampere, GA100 uses the same GSP-RM
firmware files as Turing, and therefore must boot it like Turing does.
However, as a compute-only part, GA100 has no display engine.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 71df33c79884..f82087df4936 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -77,13 +77,13 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     use Chipset::*;
 
     let hal = match chipset {
+        GA100 | // GA100 boots like Turing so use Turing HAL
         TU102 | TU104 | TU106 | TU116 | TU117 => {
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

