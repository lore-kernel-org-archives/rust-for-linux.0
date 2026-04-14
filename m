Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010055.outbound.protection.outlook.com [52.101.193.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6DF3CFF48
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 23:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776210685; cv=fail; b=p0LCa6yAmNTtMNjn1rTbRN/U7XCfXnnVUydxVWKvuu6B4y9pCA2WOtVefITsTI7vRDI3A4G5FOSgNYk2PtbaletxAObKEGtqrzJbWHu32T1wHYgIPjtb8nYA1uVAazlWk5b6+/ZCEfNTWoKod2aXheQSalwdcLL2+CLm/v+r+kU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776210685; c=relaxed/simple;
	bh=zMvlRgvf+jT5AZ8q/a4FD9UoBkHAxNvcqULpRs3Miug=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fztRTR7/uUPIboVg4UFvSbcI8H39RVJxkIOx0ngaXJ2grVWRDCEFNX9k4/rcfZxzN89gpi+Ox9xkgdnch9Y86RmRTYUWujgj+aOLo/AjumLe4aY/0YleB+IAfNu8yC06Q5s8uKQPCjuXFo/n6A5Vtk8cf9Hg8wXeZzm+DNWut44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PdNRhRwG; arc=fail smtp.client-ip=52.101.193.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PdNRhRwG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rg63LREUPYCY3R0Wj+sZdT4jKZeX4TpRtLHL8eglIUo81tJ5HZ7qd4RwOhqnYnC14LYzNm4MHNy2eXJ7tRl2ZIIR4n1A1MT5fkp2xfGl2/PxRA9acRUO+5CYilmOA1kzGw8Tz4IH6HuHZ8h+H4JfMFxwyp4R9NUBqCwgP4Xdi2JzBK6ROPy8UQg87uOoujaK4BWmKw1wuN5RpexCwlovcNhC+eapbWJMbDHhci7m6INK6uAK8MhQhnrt+xj05apm6zV5CiU7r3WkUsuJwXTZvh6R0jnWVyVSzPPku3lAnNOszXBviXAFc7bzDulHzRcwt3n2nv+rPWoq1KTJ23j++Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOjO+nRl3lNkP9B/XvfDOoFIBiQOOJWR0DhKfmEMWr4=;
 b=HCXIeLzmE2/hYJWqXkY0G6q8ZJXiRxyhTDsPjzIYv2pey1kQ7M5ncsAn7a7abYQCxP+TjNzQMSIWBLy1wRZaqRYD+ULwpYna+gobRSpEJ4NXzRBFYfLpFpd5uQkuFnkpab1F4WmRQ2nXLzxDISnXJEY/GkSaqAuCCgTdoVQ6QDQeGq3KRrvdRZ/2O9ePVG9eoZmXQ5e36fYazu/NQEpzQ6e8BY0yaBtFnToqobTGZgCb8+G/z/K+Tj+ZFKu1bcooftB69ZKJyS7czSbe61kO5fj2EAP7nqCztKLLseJ/qD1kGzAdDuvyvZxLaBZTJ2Sq/rkbE/iCWg+/QDL1vgsjlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOjO+nRl3lNkP9B/XvfDOoFIBiQOOJWR0DhKfmEMWr4=;
 b=PdNRhRwGvlNPXe7yOpIbH7ExR4qEmmEi1dRKsn6Kcc2xYx69p6TR7CYeiK8+mOKHDAYBl2DzGA7aXld3LcMwb222R1iQu/zSyOIesUkK6QLhjnGz5y9eYST9X95Kcq2Ele75luIQupULVnqlYMFMC8/rH7nILIBLo5T8JjIuMQkx0kMyOH9bTiOZERo/HgGW7LYnht7ug/UqObeohy6pnnv/khvnC2/vamCFTN4Qaq9zggKbR3Jz3DTcR119s5ds/MO+qmYUX1hj9JcFVZxy+qlTLh0zlBYJ07UAXQNXQz/TcorY1mLVhfs+mPLBzCXrxYmfYZfaWYamX1ILNlBt2A==
Received: from SA0PR11CA0176.namprd11.prod.outlook.com (2603:10b6:806:1bb::31)
 by CY8PR12MB7265.namprd12.prod.outlook.com (2603:10b6:930:57::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 23:51:16 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::46) by SA0PR11CA0176.outlook.office365.com
 (2603:10b6:806:1bb::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Tue,
 14 Apr 2026 23:51:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 23:51:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 16:51:01 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 16:51:00 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 6/6] gpu: nova-core: enable GA100
Date: Tue, 14 Apr 2026 18:50:47 -0500
Message-ID: <20260414235047.439322-7-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|CY8PR12MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f6c08b6-e3b3-4f64-d1d0-08de9a80b7f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mBenP6d83tcYpz3kUaU7I6b7khGcNrW3HKcMmpvlgChLH/CADmezPsKywOtVOEhnx5K48nz+M8Iigcy532nJRpH3vGoV2B4gSt2Tk0fV3E2HOMt1Q9jXJqNVw6V1QaE0uqNwg1JYRDf3d0FN/ZTTvjEIhAHpQpt2nRlrOPAVcBmVxNY0PeeULArIFqDSzxq4xXAdZyWe0QMacsvrKciRqRhSRmbOqWtBTDpYQxXiQ9bhkixKd8sjysPBhcHZauJp5KIhL5q5jPI8i1rbl7XU6P1YQdc+I6T6H8MEicH6E8B/TOO1e8V1q1qwBKVZorNT9kdAahgehetPnu1Z8Wk++WxeUrrSToCn8LmBSjv7+ptdcRvf8IaVlxKH3qqO7Ul5nQToMcdesk4/QVHMLG8h0tVZB4zTzG1n0cAiJKWPetHVfnGX6k8mq8dbaeVp+Vv8ALV7wcj9Py90Ts2p4hBx4abCjaaW2JKnoxaFMdcjjDr9clRqpzJ2amEZ03ms2p9lq+8m3G3t+8y9gJSA1+X78LFLtMhHzBqNihS1OOywVgnpttj0uE6nkHnl3PmEBrBAvMGVQuxIGdX5zM4gf3SYY0wqOs0sz5OfX1RuMnZETa/G91H7JiIyY5+BR4Y3dE5tQFZo6aOspqKe8dDW11w63e25QAm3d72E9YaITpvW2JI7f8ovqQ5Gv6mNbQUcUjWryxj/+Zu+PVIga9Cl/m/KKzA7g+bPlH+t+kK/t7ppZULKlnHTh8IsdZL0zfkqKd51UWtqIgNxVJ/1zNEREWH9Eg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	34QX1HYlYKgStodI4JqGmlgLsF3XrMLUg0oo6OT5xcmhZdog7bKt7GjigUx34JDclexHZ4cxAI8DsH18o4FFl6iBOCS4qVTRD2J68tx0AZQ0GOLYzFT7PMr5Mtsyg0Zf2o63t2MoFMUMmrzkhaz9nHaJ3sABp4WTx4n9UlFOc6mMuHfhNADqcuqibrVhQ/lqcW1kjWDT/y3bzb7LQT7avRNwJiaJ06OTnL1pMssdRkj0FIHjbvtEJA+tqgkju3lBh3kifD8zGO6wSrySH1ajs9ICLx5AGY2U/QFNLvakILWSfb7XeREtSzP/pvRsLp/norjzwEdfrdGal78c2gj151AWR1FBZadjHojbav7REoUZoph67IKmEsXLBsOwTXvxQA1TyXbP/ZNcd+8KT0DP18XhvsPQzmw1Wx2Qy5E1JGx/m01uwDlt2LhuxBducBBZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 23:51:16.4440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6c08b6-e3b3-4f64-d1d0-08de9a80b7f4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7265

GA100 is a compute-only variant of GA102 that boots GSP-RM like a
Turing, although it also has its own unique requirements.

Now that all the pieces are in place, we can enable GA100 support.
Although architecturally like an Ampere, GA100 uses the same GSP-RM
firmware files as Turing, and therefore must boot it like Turing does.
However, as a compute-only part, GA100 has no display engine.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 71df33c79884..510046d4a577 100644
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

