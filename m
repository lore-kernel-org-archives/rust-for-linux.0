Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012058.outbound.protection.outlook.com [52.101.48.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3CE361DD9
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 23:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776210676; cv=fail; b=jDK/oYcGu26QruhHpjCYDTjmATkAEcxDKAmFgFBQU086G2eK/mUEOWztEPv06b7FDIXzTg8tTu4S28W0eW686rc1GYTZwfDoEyiGB2673Jcgmdq8LWxH7DQmj3gRIK2erys5YUYelzrew2uwOXpLPmmEvApxmGhJDJqYFY8lMi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776210676; c=relaxed/simple;
	bh=j1dRrByeiGPweS/C4hyU9SslusbAFl9qW76MIC0VtGA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WpYVm/XgvUNzKAyo0+Ry0ppTR7FVmcnf8zjWZFZzGkMdbc9We/ck5aLiv1BbBoqQaYkakPYvQ+4fdCIXR/LkLvk3khBmzENogiR41ScdAMTJx8NbWS3QMzGTSHQFXT/j1i/JIKchASfwBR0ilfgGxfUFZgTOvixoLPBHKz7Sq1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c3vE70yA; arc=fail smtp.client-ip=52.101.48.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c3vE70yA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmVP8LnQVQhqU3YIPgiSkZxhzTa99R1eqyeHLtyVNTJMxR7Ov9kOF3hGrRCzDusPVpW0C6dlsQ3u3jUJ2+oKgN8wvDZwpL8iwY7axYwW2A9pN67oMK6R0SPXia73kEiA15ACzyD9/4eLKQ6FwDpQjmrkLoDrneK3pZ+InuA45cg8qoa/2Wtx81+rqxGmP58yXHfBK+4sfNAquJgzs76IHIHvrzNgCQrRUMGBEHLW31QXlrlybBpUcT0F1T+JwM2tV2XhZ0fLY586l1EdrWce839W3KWFSYV2Oup+OV44hQyL5OQPk32iU3EPz9eJ1iqRyTMpSd2mxO71y9CeNqoE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/goDbyoTludXqAJe2FMMurhdW7osML5ZpFA9nWAU/M=;
 b=OKjjbGMT2NhWHkpZbAojwR8VYF6MmVKhtyWVLw1FKU8TQoqIjLDOc2kxavFpEKW7Jgoco3vvVNTBqdSePBDd+oY8dqN2xqw1SWVXqOH6k0XsTMogpkVjdBnKxMtj72h4lmZsho5Uso3dQeWhXS9yMLX0QkDt+sYGYHbzvCoSp8+i5dvO9zpxFpyKfnObGGrlcFXuHogleNlCxV2APu6Lp2ydXwo9kx39oZkF2Lq5inKGP6nrU9YGSOMWT59IB1NRtmebMnTaMrmGogFi81X3bL7ezb10kgs0G1IraIQV1cMO5Whrs3L2ZeQfgwcA/dicpavWrdFymbPXkLGF9hE7uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/goDbyoTludXqAJe2FMMurhdW7osML5ZpFA9nWAU/M=;
 b=c3vE70yAgNerVuJW9fcLonbKIiw0yxAK42Exj61ASX0rxGE7fobLSptyT5lapnFa8tnOOJ8s65JPlvRU2SAfckaeqa164daLCxyAD9/+lJ6Cw6dwXpx30xxX4jfJoogpA7kSlGUKBCdB/ElrTl2DkCSU80TNRMImqGatYKPbXlYYN85rs62eiFoVdz/4Za69kXWqIDFD5fwCKdXiGLpv0vVc1Hkmr6nY5dXC5DTGET6peVH/M/mSYcqlry9ZRjhr7JPS/RyFpj7vHXtp/eY9gBLj0vIWHC6E46sWIOYnL3fH0NbGNT+8FIvgkKZ2aJC/3RcgdAbgyetWzHW8FJ+QwA==
Received: from SA0PR11CA0153.namprd11.prod.outlook.com (2603:10b6:806:1bb::8)
 by BN7PPFD91879A44.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 23:51:11 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::9) by SA0PR11CA0153.outlook.office365.com
 (2603:10b6:806:1bb::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Tue,
 14 Apr 2026 23:51:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 23:51:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 16:50:56 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 16:50:55 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 1/6] gpu: nova-core: use correct fwsignature for GA100
Date: Tue, 14 Apr 2026 18:50:42 -0500
Message-ID: <20260414235047.439322-2-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|BN7PPFD91879A44:EE_
X-MS-Office365-Filtering-Correlation-Id: 56077f8f-d455-4d6e-71ab-08de9a80b4d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DirindgWlejYQAbJuTMRUZI7rU+cWFI5t/yvt4jre34lIL9ipo90kERbMdoP03DeZowuuoXuYiw8U+ktnsqEaa/Hcqah7/wzfInJau5Lu/W656+wsP8a6R+O5JsndDJ3sR6BVulChW7dBa8PIgtGMEXwxN4xsNx0CKe0K58jAqOojk6F1teAbG9cX65Wzak6Hzn/Cf1E++ljytV82XKdBrrkw+k4Ijr9OLw8ZTKucfdwPoq+0G97nL/Zeeobmgo9CKeY/ygB6VkeA5fnPRcmUpnIdxl7iF8XxGB2GP7lHqUwtCynhQrln0lfZyDNsd/xvFRYb0VtDbQYyOuf39Ttr2XCdBQAjbd5Uq72sIPUpOSWzcsnQ35QxaKb9w8xhv2Gl1FLOWPvkDO/6sG7z0I4a0tQkm59tvxDdeMukH1l62PvsFg1QyXJuiG48vtVu5Ian0IDoRFYy1IWDOxI3qjNMUAgaBS/8rQtW120/ZnuQQ8KivaivRLFKlk/ueWGRJnYref2eQloy9NJywx1UCArb6cRNGlwXvShM7wZOx/1zQTiTfMt2qROhauc5tmv8SiC3kjKaKUDOnY7dbvTEZ3X+0pYqEpgLCW3jjFPt9ZD2IFPG3GYYRRk9LTF4dcYuVcyAlOhcYlvkhPuzIpNxLqUsGzarjJQ/Ro0UucX05UHIUCyf/OP5MCB2+vRbeULJcr/jCcB+dGeiOxLWLTqKwuuv2ZnChqOUOBptaC/Sedse401u7jRdMNS9vMZ+PGZvv/f5lwXFqhCZZF/XDAh3Q6lmA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fsrmOApD6aUcKxKcAsT2duUqWknrSrOgI678TB+vUUH9WigvptIgRXSHkwI3wV+VccyPpw8n+KnN2mwu/WkFxFLUGrb1rnVd4F+ysMW2mrYyJ6n4FH23A4VirInu6LzOIZ2UaLBCuSDE2Pa37+T/GWKgT1IiGbjGKKVdPED4EW0XLeMhFjOaXinTm1ZYvsrH7gDZD0jaAcRQ4EkA1xt4CKXxHQCsk1N4QPlMJ05UqUuEM6GbNXKZm6jXYeQZCIMq7xVzvCV8a886iAFweg3yk7ph9JiJJCgZwYBipoqrPchSFBBCvGynh07ELc/KzXt7T1nJQDwRCQ1VNGsLvJAKJqJlsJ4RTHq2DkbVgBo6ThnN24CeKbel4djdsJiPiweVUPAkM5QKx7AW4vp+Xr+jZU5D0c2w1iA284dRyebLiphCcu+8rKCQATZG35P4rnef
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 23:51:11.1862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56077f8f-d455-4d6e-71ab-08de9a80b4d2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFD91879A44

Although GA100 uses the same GSP-RM firmware as Turing, it has a different
signature specifically for it.

Fixes: 121ea04cd9f2 ("gpu: nova-core: add support for Turing/GA100 fwsignature")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
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

