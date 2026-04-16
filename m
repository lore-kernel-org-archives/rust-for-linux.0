Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012028.outbound.protection.outlook.com [52.101.53.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF60839A07B
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 23:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776382319; cv=fail; b=nEJJzAOs+lSnG5jA5RmOpjjPOgAxmyE2VrPBcBVPwHHtoxbAqwNU8u0JEj+UKNjFMWwV0PWJIgHbdUIBCIY+JSWnAFbvExQqKGFbri/8tN617W1GE90eKPPiwFuRKKDSCAZFXAfVUfOkfvRq+NThEPP3ZqMTotj3sC72Wx/06hI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776382319; c=relaxed/simple;
	bh=XMRKPzvNeQKMfQu5K5kSM9u76pK0FJT1YsBwtLiwNH0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U2hlF2iIxSbqNKQz5jSDwmp5aviffxq+amPRek7nxRVAh1gJONJlUldtXzvE+07gT3ofTSgu96g4OZDdyDWKuLGtgaL1Yh+AW5GxfY7Dtan+PyuIvIbiOfSOyXgd54NT3izyqob5ojEZdhmrRIWE0mLJkyuCKFXodlg3CqCJyMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aMIbetDK; arc=fail smtp.client-ip=52.101.53.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aMIbetDK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7qXopMrAldrWRjBVzkG8cDWI6yQOd8gLRJTSKaecgLh8cYUTpXNySc42RbUy/uqfYKNDi26cUslSIAz+EJrtgQtDgtxMHG/l7JJ7oC2tNoJYTJyNRBen42rZTv6CLmGUIR/3MmzheJeolP/Z4h5rDmgnU51eUMS0JAMiJSO91e5A755syE/Yr93N5rEwxRvpmWDeutU+LUus+rbeCZ9flL5tvZH4uF73fkdentu/ncKaMBZilq6anEo/uckxs1Oi9t8lkeUVOFjw7bqDBAZvsdW+odELDiM/IedNEOWU0mzGD6c8cGptmV0nXSLzep9FfBuTeWBfFPNEXUA0+5NkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4euHdJdN3EZD/uNq/IOLgBqJXPMF4W8OiHn1uW2mvLw=;
 b=EIuoltnziPAi/tMLAO2onK8T/PxAgwlFk1y13MsuEAg/eqmtq9/fv4b0tsc+HP9f3RWUb/C4dMy7Iiv0bT9T5zCOg5O+kSwnrFThm1PbpC1B85dZt20g5KmyDu9qNVdOBFiAsPoijIyaaV8/wTm1NkQO7wgj9J6BK2+pckvED9IPYPS+/4ScS75wiKGXI1WYKDNFEs0Jqh9TDf10WyYOkORwCw0ojPV3aTZLXka/aw9j70bDRcA3xmjxtGCF30Jb1fbaiN138PkqY2KqLNl/bVWEu7+GWNqcxk0f0YJLPmDF+rkqquGbdFdxsdTNU9HSTc6ClyvTyK+ABQGfgND7MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4euHdJdN3EZD/uNq/IOLgBqJXPMF4W8OiHn1uW2mvLw=;
 b=aMIbetDK3nn3W+iDeGi/eLUGi7KWIZ0kCSUz4GhpZJwPbiJxOAWP/d+7GfgazehlzmCuyqoVKRq/gEyQSBmNYfa5WOVAVDeQJjEPPIN23SAD4d4PkKm5UYruyk7PSbKg4KIwi0jOBz7qJ53ygUHNLN6PxZO6JF54GSgH2E0vh9U9/ACjcOTeWnnZd13QjeLJzOCeEwmbzNSTqNVSYYgguM+2t0zJaFQMBrlqk5HyraFlSHTTPtHVTPCSjmo4nxyg/9e/57hmKPxWZ+UdRe2+raugddzuKcNnOm9EBgbXp365BlVe0mC0QOv05nla3A/nL/qsib7BCvbgoaZQ/fgsGQ==
Received: from BY1P220CA0041.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::13)
 by SJ2PR12MB8832.namprd12.prod.outlook.com (2603:10b6:a03:4d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 23:31:49 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:a03:59e:cafe::1a) by BY1P220CA0041.outlook.office365.com
 (2603:10b6:a03:59e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 23:31:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 23:31:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 16:31:30 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 16:31:29 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v4 6/6] gpu: nova-core: enable GA100
Date: Thu, 16 Apr 2026 18:31:17 -0500
Message-ID: <20260416233117.1057427-7-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416233117.1057427-1-ttabi@nvidia.com>
References: <20260416233117.1057427-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|SJ2PR12MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: 437cabd7-3849-4b3d-ee8d-08de9c10553c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C48vUlNVW/DZFj4y4h7Nbv7wJJLrTYzY3rH9E+LnhSR+cYoApsR4iVwz4NBztFRM74NtWdKjjejpdy3hmzn4fOq2e6sSXLC2325+h+X6hqnEJaHUxDKOvEPogJ9DoKwQyNDnxsxruO7rvagn3YJDut7AeVhC9mBndoQa6w9gVMSgwlHG1PiXchbGhRkz5X8xF3/2NQFyz6GinHiD9qU/31uimsp2ApTt6GrXD/tc2E5LAeC5UNuD6bAbSV0YzMsHgLxQ/Kf1HWFxYuoEXd1jQY0bnlINGJo+RDC3br94GtphLAArSZfG44XFsmKj1xDmAEQ4m2hbcN2ADIwdM6kCdWliF39NdVJFwQye2WM1XjOHCsiihHvAIyxhdkykX3QEOYfXBri2JDuVU6Y2uF5rnMnvhNlARXfgtVBQYPZkRt48/Ucbb4uD4Dx67CeT2mlyNj3hodfj4ZooJkSH5WFKLKJiWxAzrdh0mMyCL1jTfq9Ia4EQLQg+qDkBflW2EtAStTGk4R3im3P6yv5TRh6PR0aA8Ao/ffZ1Vw/ErdnNfKk0jKVzjy7jQ0795ziR8zdkv81dZoEiEvlWte306NeRQRdd2F3SMmP/Br/xEQPIzA8HCeknPsZSkWJt2dSG2QUrnCQVmDoONwdZMexiS25l1kGl8aCpsHJJDfzAkR/Kx1Q4xoGD/7jTXAwIWd8DZgBr4nieV1S2eypjroGiEpnM2cVJHq8+NZRxjiu6SYs9Mz5LWgTIe2pKkc4UseljKKJWJCY80CmjLf3Q+T6dX8p3+A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CH84FsNMtkiX5UO2uF1phyNr+cExCxH5+j/wiqhuH8VQ3+c4HnSRjgkbkBn8ZHXS+eGfdDfzGh/picBUFsQcbcG1ZVRPwlDtO22p89y0H5U7F2kYW49v0IrkwgT/PJrhXcDPd5VVnRlRaPzxtnW98jJyPyYz9xanduPGDdhMR9e2JBtBhcKleA6wzF/7v0X2LKiAgo2zOqB7ZEktJIJxr0ufyDD7uVHE94ilBN0YlZEq1pTlkL5g/HnlIUNcVrg18M4ky1gjwqOXW57AHQRduBOhwg39bj8zcTLClJ7zuWKLi7at2CFs81mCIOe0OvDfg+0fqU6EmUfVhah3GqPcUNUzHkRU76mBXEGwhZvAq3bINPxDBGnwxOqL+AtmWbuyKc9Z60IssMbGwsTf4JQdzUlVEMQcH581JZANTcu1L1Wzcq9TZiu4j/sLd34eIp5l
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 23:31:49.5739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 437cabd7-3849-4b3d-ee8d-08de9c10553c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8832

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

