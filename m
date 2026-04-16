Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010025.outbound.protection.outlook.com [52.101.61.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86B3192D97
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 00:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776299211; cv=fail; b=kwLTOCXVhMh+APWyWCy9QekkgkRAbiMxcEIaZeGsYcsqQ6irKI+++vl01q7p3gWKRLWH7khCtUXh0SYn9HzMmO5pMtkSED1EkGGGxv6f14Bo9Ec/qEyY+UbbvVCgnysVSgwz/PUi5bSQlCk+anWknLZlEfyrLrExXjHyQIRdF/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776299211; c=relaxed/simple;
	bh=DSMnniDp0QA7uc41ZT/SDTUfrcBiaGPQ9/+p1BxY2EI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KSdPuPNnmucJSpYcSLv9jLV015UjaiJejPNZguGAhLs7FfV77bk/+VUzw/SJPhwYdEBxMttAJY0AJJW3cmIcQpm9e73Uo0WVx47SUX98aPrdEo48pAFYLwVsqkDrtWx7HBKaPcE+GfN8Su1CNdwNNnva7U12ycnrbgd3hPrf5F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=B/YsNvpb; arc=fail smtp.client-ip=52.101.61.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="B/YsNvpb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxXvEwsTTrGQwM+pslb4woQBC1gm7VEE+rrS+zMAalf9mgH0utfpfS0wZ2/viGu6wbf9cZEz+73qJvr0bwdJc+/cbUbHewnnAlfXQMFOTUYPYZ4wGiJ4z3bgN0e4LCKHuoiU61sRxEJTtjnJpHbJSZfW8eSlGhpI26+xUHSXprKQJ32IwRE8Q1BmRMYmxmi/KFpBD6pZNZyzx9za9SFr+Bk1gwJjSxXVAulUaxJpEZ3wgd/0y9iatfToPmn1LPYRssX86G1TpNSDe1qplOl23jpMRNLADuQ3fW5ZFG5q3R+SLlDzynMVMQM303L2dj+p/+J6EvZqk7vNbwGUlmjCHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCp7ggyzZ8A3yg/326IvrDVYLjoILDmArmfgw/1IbKo=;
 b=jWKwfw7x9iHKWyMQ3KQyYuga2wPV9hwiw1RnpKrBDmNdv3vQQGvSt72/MdEbrJBGZqqUrcxquvstU879yMVce9JGvDrm3frPDjRRSdeyYsvrRmMXMfKFTpGFIOvNthx9GqCiarwPhn28+SBcePnTqTtbl+kRF4YVrwczK4+/M8JiShLOMBfeGnaLGfzfCfe44XmVU+3GUbOesMG9Zqw9sPV82dFutfxtYUy8jRPAgekbMU9+l/rSGXfW2Jf0E6KzQeedemTbVgjFT8OOzOFvcbpcye7Eu30Ye+3k1UGVIZCpOH2T7QFOBGzIxmvv0c1CGVv9V0QaXyEdOE5UV/7P+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCp7ggyzZ8A3yg/326IvrDVYLjoILDmArmfgw/1IbKo=;
 b=B/YsNvpb2cJv8Z5ngpMGQBNeqc4ARa48IhBQj/TVEcBV9lw9fsK1vlaLd65Qa0cjpSnscz71k6RJmpnuNZUq3cGdccMC9a2oOnpHA/ShiVcB/HvQMh3C86OhchZGdXowldTqHKjSq+B/7TwF3i3/PUTPeYqb8Z05+Frvw3K0tUKy8kOYGI1Zme3AaEmja0Q+NWY8POh0i4QhwuSTpT4g09BlH9E/qkzWFGh2aDgMXbiq44svpR5eXtR06df7pJhJLIIWiENemzuY7oC7Ngk5Q7/WjWG0hpWcjU4Z9rIDU97P2O3Na794nn6/Yi1D4Z55RQMIfsb7jD96F+O+4izTyw==
Received: from BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::10)
 by SJ2PR12MB9139.namprd12.prod.outlook.com (2603:10b6:a03:564::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 00:26:43 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::83) by BY1P220CA0003.outlook.office365.com
 (2603:10b6:a03:59d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.51 via Frontend Transport; Thu,
 16 Apr 2026 00:26:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 00:26:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 17:26:28 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 17:26:27 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 0/6] gpu: nova-core: add GA100 support
Date: Wed, 15 Apr 2026 19:26:13 -0500
Message-ID: <20260416002619.900779-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|SJ2PR12MB9139:EE_
X-MS-Office365-Filtering-Correlation-Id: 56421a3f-22cd-4d13-c650-08de9b4ed617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rn3VrGNAFQlKm+ODLVC6F1r+C4G8CabRrFnTqlKQoaMaodANeSeWpbrWUdUnfkOVJWCoyoF9Nw1ZiYcsnxA9kMz22dWvrAmRzUhiMzz6ikXFYZUfXeDJoFnTOiw6u8bE9xf66Xn06sGp3M4qxi0wJoWr1124SlsYPQ9lLSnf0CQQLX1wbh5Yguul1j9grde/2Jmr8m09XtM6d59oHQYxVOUTsjDILgT1Cej+fJfOwfKR430VOGuR8T5oqj0OVwOWrSasE+hyY1VRClHsA4UtaKV1UeJEmQC0PF23lfrHJlgmtDr81PSUHRMjpF2tDp1WBMBq49jOHA5QaxSF8M2f9bFNjF1kcIHH7+Rl0ARjxTPlXRxmsZvbUcvmkot2yaShJVyGkJU1qv8OW3ZYCmqyHJKahb8zKsN6hpiNhDokOdHgValu6yWWLlrVHjPnDppN36aDeSB4Bd6I+MD6/GL+/JLBKBSb5yzagIqhxLFdfOl5XmznSmlCKEiMZmiG0Gp3Q5+6E4j2eLThdsQZJjjT9uRhtDZcTNMl63WesTa9tXam8pqbnUt5J8PbFNDiwqexwLoY3G3N8YREVgBtG7MjkbF1ws+Myhobih6WTRJavx8d1hZfjDPcksPDJnpebxML4bc7oOdcZn5nYZiUUgC9oFaowHz3YrJaIXch/MlbX8MY4z2pMlV3GUkGGvvlSKhWqieLjMFLwjYMQMVgjA9MDTq0hvX61/+Dg6usYtdw9CySBeRzNbdCmEcNPPlVLCwYfqs2YDpxiSoaVkstx8RBQw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ulvo4Hx44e3+h7Ch9F4J1ipEkvNwtrHJ+av6R+RVUM9TwzYzH17xv+hxstfevBBm+kLhG2bYgCZHs2i1+7gbdAsF8ExzjTN1EXRL3ZnpZizx4K0L2zKB8QM/OpxkpkBGgjOxQWTwbUBRJlH0abSiGBBVHoS4enX6s6Ezimodc8gv6yYd9BmV0nCpnKQW1rm4bvVCerzHft4192bur5ewGUWnOnggh6HHy3xx9tLTFUUFmTpJI6Cyho1ZeWkY+JV8qsSun+bouejdnr8t+4dr1ntn2A99ebXMiVmi0yOau07nMUOS7ViyMRAMkUjz/fLM/D4I3wrUDcOWHOoqYGOlYuN2zUR0bHdymnMdMTpuVNZfNxO1wQqKk6Zp5EzCeHA3vZR8ZdbaOeKTt7ZXPGqpKDVyf1iPPDKwiLc+NdIeanjgtoIRKVlNRBRgiUscnPMW
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 00:26:43.3891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56421a3f-22cd-4d13-c650-08de9b4ed617
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9139

GA100 is an odd GPU.  Architecturally, it's an Ampere.  However, it
uses the same GSP-RM boot process as a Turing.  Its VBIOS, for whatever
reason, has an IFR header that precedes the PCI ROM header and must
be skipped.  In addition, the FRTS window size must be set to 0 just
because it's a GA100.

So add all the missing code that GA100 needs to be supported.  There was
some infrastructure already for GA100 (e.g. the FbHal), but it was
incomplete.

Changes in v3:
1) Cleaned up some comments
2) Move IFR header parser into its own function
3) Added register! entries for FIXED0, FIXED1, and FIXED2.
4) Replaced usize_as_u64() with u64::

Timur Tabi (6):
  gpu: nova-core: use correct fwsignature for GA100
  gpu: nova-core: do not consider 0xBB77 as a valid PCI ROM header
    signature
  gpu: nova-core: only boot FRTS if its region is allocated
  gpu: nova-core: add FbHal::frts_size() for GA100 support
  gpu: nova-core: skip the IFR header if present
  gpu: nova-core: enable GA100

 drivers/gpu/nova-core/falcon/hal.rs   |  2 +-
 drivers/gpu/nova-core/fb.rs           |  6 +--
 drivers/gpu/nova-core/fb/hal.rs       |  3 ++
 drivers/gpu/nova-core/fb/hal/ga100.rs |  6 +++
 drivers/gpu/nova-core/fb/hal/ga102.rs |  4 ++
 drivers/gpu/nova-core/fb/hal/tu102.rs | 11 ++++-
 drivers/gpu/nova-core/firmware/gsp.rs |  3 +-
 drivers/gpu/nova-core/gsp/boot.rs     |  5 ++-
 drivers/gpu/nova-core/regs.rs         | 21 +++++++++
 drivers/gpu/nova-core/vbios.rs        | 63 ++++++++++++++++++++++++++-
 10 files changed, 114 insertions(+), 10 deletions(-)


base-commit: 8884dbc1fd174315b406027375bb7a4b211a8fae
-- 
2.53.0

