Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012015.outbound.protection.outlook.com [40.107.200.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19773C9440
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 19:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776453275; cv=fail; b=QqJEOou96gWacFRpIIYDwHbBNU4oRM3IM+/tcTy+VrM0cJdjwSwkJ+z5pHIH4UuEy2vGH6z6nLEPNniPVt4Ag8XvtnOKnwd0cz184j3NNQuTrJTO7yirXsDWMZCpxgYTRUVO2Jp8+wzzy+wB8TrbY0vV85CuyNgf7WPBWTnr1JY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776453275; c=relaxed/simple;
	bh=k/rUagfYaAmMfTxffJW34ApSjhTt34YGcRLtVG648rU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lf7icentsbVzpaxehrpfpMPigR9RwTN1t8WUBJ+Ckgog4D8vjjODvCRqi8YeklYWzDGmVkg937IzuGcgxZJWZ1mtXqkl8zo6ZHym78UDCXzoUQLj0e/49CG48QKEXY5iTfSC2NdKJblrcB2PQ2A4Izzqioj5EXmGeNMcHTg/XqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=A3ukBTgd; arc=fail smtp.client-ip=40.107.200.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="A3ukBTgd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktYXtX44hI+eO2q76nCyIRj6O2GBzZvXaRBhgQlTIQUWquHh5jv5v9PLa2HzVp87pPA4d5ZZ7kius150kOvRxA+0Wh+TG3hlzPxY03czAOB92dvRBtx2DQM5WVKq+PGlh/fCTKGNoFJK5gSFfCuIeB5tHu3rpOmrX6tyx24dmrk4z9F4urwdGycYHsLufvUzxOlJrEZo8Z7MmuW4M/lIti6vFTDtuoZpUZRijLIBYXDtjhSItVyfqkvVooRBtifZoiWt+F1eSBrRRKwuCYYrrqw6AfKcSOyypVyx4EyXUdEyNCiDB9v+g+TvAjeYnUvg/aTMoIlIOvFMqH38kVK8/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRuZ5oM3Hp/ayqwRX9GjIkelUmWf9NZOJ/uEi3a55Cw=;
 b=ZnPxmqOzONuaNmmHHa3KRxeeRCfkFxFEZOiWoOsEsZcYGtCihQKnUK/wbOd48zbIA/+HAcrnIs+dZfNbGx8/80EAIEaHxvQIyUfYJ7ByNAWs40h2Md33zNjb32bGMWFQVmKfHnzhMTN1WikwuLUkn+WnobQX/9TViRRi6uoiy1ry3Q8P2HfNnLU4WzzIcudG/eBFQkx1QEMATcLlgbPCBW4xKo8V0mT8/WpsNoq0MDyLc8MTZVYX71ZrCStjsmXgSt/sJLtc7MCI/GV+EpvBRZLAJQQ7Vhpj51q689BSghbnbj4z9YrgjPlS41EJDWM8QVLIgSYl2fnrvVT95JVbvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRuZ5oM3Hp/ayqwRX9GjIkelUmWf9NZOJ/uEi3a55Cw=;
 b=A3ukBTgd294m0h8QmBuE1MPw+3UhWEGu1QRIisataRvKfwOlMnZlFv7KGCsNrokL7kIN1YXYvq4nluopVg85Y3ADZaGC6t7NJiEiYsyS9Ct7ERIiQTeMX+Ng0LAxhKBDHhVfgovCeufoOvT+iJog8yfDtKuGdWjYlWD/CPKgR3zkDFrodwkF0ndOg9hD3hQSWCGXKwzg1jrpvpiAw1TdFBw/FP4uy0/8b7CHsOSZ678vXB3pPZkbUfX+KK7Rm/wm5ESGs+U8730L5f5y/YvjjTb3vSsYjWkBfWxxXRaD0BmMadfFj5/b7ckCHzYyyhSC9x0w6q8oHtbLqPXx9aokVw==
Received: from BL1P223CA0044.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::17)
 by DM6PR12MB4449.namprd12.prod.outlook.com (2603:10b6:5:2a5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 19:14:30 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:5b6:cafe::88) by BL1P223CA0044.outlook.office365.com
 (2603:10b6:208:5b6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 19:14:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 17 Apr 2026 19:14:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 12:14:10 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 12:14:09 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 2/6] gpu: nova-core: do not consider 0xBB77 as a valid PCI ROM header signature
Date: Fri, 17 Apr 2026 14:13:55 -0500
Message-ID: <20260417191359.1307434-3-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|DM6PR12MB4449:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a08afee-d200-40a4-e7a5-08de9cb58d3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QvBFuaA15o15cteKjjVHvmmkcSHDS09JFm1qoRRnUXExldYpPqjp+DXBqq9vKpmdwPrRD1V0TQMpB/HSPLuYauxfSolh6wLwP6TP/wDPIysodM8hcPjmC8LbTIxg4zIKzEneJxmhODBbVP/WTmXhdY0a7ymWnm4PoRGsrZvPw3fDZjRI2DybeYT0Xm9l4Idkf1OBT2hxBfwa8W2U52R44u/y6dTMnH3xgD2EINGvRj0CKm6ZZdm27ysO39TIQPI3cjIsAtdTdo/zK3QqFhZR4dpasxscXskZZ+lP2qvgvOxTnPs/jZelPCZWrmSCaoX2lNEFNNOr2mWREVB8OXokjstF/nKs/R7K+Z31lbbr2iY/bN9pEdbPNHGBmYrjAvTVlQbeCIvEC/iU4ABg0lVO1D9nYwZ/s9JFcGBYRsSG9DbclMsAYD7T5tQAybaSdbKGbikcAJn/ucTLWVN+mCvbjTLiqmw7aF9Da1mFMqRFhIUIN6cXNT34lxOUBJXYePl8ZpigsDfnlYrfep/zwi1uNAFGbPgJ4MC0ARJUUlCxXWjkvzqOaGpTnhAtwlX0WTYlbV+UsrfZLiv8VtKiBX1asK+6p6nhAn1BGsrtr7IYydsbQ4ZLx2qVr9AkukZ4Jvt17X7LVtkzdaRhjIia3SwVKA33dTNHCqSkWOQuc6ZUYg8iB68SBDWgZvXE2SKR+IhHf5+NmikZdj7bU6fqZjVPikMky0JCBCva5lJQvpmQK/VhA6b2/ovhpIbjN/3m2JqTRQki6G0vWEpsOastqs3JKg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8C7oYg/p5K5/sHpk3tz+2f2As5bUkdGCPE5qH7P0sA+CubIGbjbN2qfLGOJX11Mi4RDvfukKviyAdFJwxnME50foYyypE2bnkJi70i+oniPoEuMJ/0RQxmoKVciD299g6haCqTor9CeBF2IfhQ+ssig5lm14FiEAe4hTmYF6EKzyvhl1rewCa1N1IxjzNnLiXG6fFFpBlHrqFsW3k/CgKnrkpHF7a9zSlOfLm1hDY0UXwM4AkVv/F+CDPZlAN1LAj6Pm7CEjGnykNqwOqmhRjXj2vNkA5hIpQDThkYIgqTUosq3Cs+eumxBtmVyjRsuwd3xMqfSl1MXWE31DUyiiPWxW237VBFI0CZsJbElu33u+EnBbomlJ8yzFLQDQfgkwYh8ReTfanOFA2rs3ba9udNF7aNuGVrmXpeGcLWIkml3PgWHOt7umbDLnJoZ3eTEB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 19:14:30.3879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a08afee-d200-40a4-e7a5-08de9cb58d3b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4449

Nvidia GPUs have some PCI expansion ROM sections that have an Nvidia-
specific signature instead of 0xAA55.  Signature 0xBB77 is actually an
internal-only value that has been deprecated for over a decade.
Nova-core will never encounter a GPU with that signature, so don't look
for it.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index ebda28e596c5..e726594eb130 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -491,7 +491,7 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
 
         // Check for valid ROM signatures.
         match signature {
-            0xAA55 | 0xBB77 | 0x4E56 => {}
+            0xAA55 | 0x4E56 => {}
             _ => {
                 dev_err!(dev, "ROM signature unknown {:#x}\n", signature);
                 return Err(EINVAL);
-- 
2.53.0

