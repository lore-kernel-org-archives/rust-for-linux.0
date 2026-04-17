Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012063.outbound.protection.outlook.com [52.101.53.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91363345CC0
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 19:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776453401; cv=fail; b=rS89Ictq2gKywUqPVnnl6r2jh0GI2nrMzWw+WmeVwGwyOpqeYkvVYyfelwD3Kr//K04FwFLf0UH9Iixywilgylegt59+/SDQ8jxzHj3YOE+QxBtAH8OMxb3Q9SO4OSRo4z2OTVo4B9nBkNiZG7Sg6DvMyg2XXeb/kLmVXplUR94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776453401; c=relaxed/simple;
	bh=QdeEDerc9IL0ZUXLJ5iFirWxZ4Mzu4dZsfRo1mM9mzg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p9orWYYgrQFOT7crn4NRsrtT166YMwiXindseMXAXoxSaSutEi9pQlOwNsgkEav0QVLKAuRm81+KR0neCggT96I/YXspBJ/RrpCD6Cbo6YbJo2oBchETkLVM3mcPH3rEBwSTZv9l8CJtAvziBdGoPwWxmaeT23frPCcSnW36yUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pIVjgDZG; arc=fail smtp.client-ip=52.101.53.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pIVjgDZG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+CEcE1XD31pkQNPGOhxSYwKSeyAHlDgpyphcuRnNPE7FpcUK3iq6wDqFExs9YSKsJM4lWlTqnZgPcfd5/bfNO6SiPE/dhdGOTnbXZ0tL8YpFcTSUjUzYQV6riQINKWgyXACj3jekxQl0SwpG87InrDVskH1PByDL+qjmElOqI+wKKLozaP02i6jIFFAoSrPVHX5jOvl5QYii82gCuOwwBEc/0O76NoEZUfEQdc8x96L7FG7v2qT6AI6V5dKc9MZpLGIPQyk3LDJa+OHT0VX/JrsxAS7LLHFa4++taN2VGcNGz6xhFjLjSyfwcSn56YzxqprBy1V1EBuBYFlCOcseA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNCft1jr5AAYNPiyAZ4F/tr88gh+7M6h9CB3pknRvH0=;
 b=FT5nh5xdverkjoPwpsyN0FUxDO64osep0YaHU5+QLcu1Fp/y7SXoqIf34M4UhMD5EK7tgfcdtJXFbVW7vuQHjAChHGwmUequE/SxDhysLDFSTJHO+V2kBuHtBxDYITxaGBpivjlxHWZqU9xaHkHXdllxjuo3fPwzwYE9cJiPSm+Uea2SzkkYAPc9XryiAMOS5BzNMk+EK/7yzM3tOgjQ2erjhr9IIaEU7a/OCitdEmIu+GbvWisMCdxRO5XC6Z87WOoSK9XxJIxPbXf9JxzNAma9O1K93qKL12Z6TrDh/olynHcDgLdgBbgtb6mZqQDrMKKWIJKEjllUPqTQf9KhBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNCft1jr5AAYNPiyAZ4F/tr88gh+7M6h9CB3pknRvH0=;
 b=pIVjgDZGNoCNrSBka7ohKphJVPNHK1YJh4PJgrQ9uEOSaQO3qU9Bqi5bapf6tk2hpcNAoZoijbesGrHMmIyaN9x+5HFMvOWwwuk2J/in4zEG+ElD79mgn36tiUryrfrfWskzyO3zE/2ssjSwBSm+SsfztoFRkTZjXxUyxtmCivf5krg42br6se4YyZsCog7WD+9CYpOxLOpI0aowrCcJHJeIwiCGJJV+/HMIGfGnCbT0lA1DPzcZzN3QwHR/2joMmHy++5XmuxjS5fmsaBk2RKzL8oEouUcq5wz5ibQletcDYfLn9XtfD9ltf73aUqfxUmXfhZEJmSwQ1007/k6B4A==
Received: from BN1PR10CA0004.namprd10.prod.outlook.com (2603:10b6:408:e0::9)
 by PH8PR12MB7254.namprd12.prod.outlook.com (2603:10b6:510:225::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 19:14:28 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:e0:cafe::73) by BN1PR10CA0004.outlook.office365.com
 (2603:10b6:408:e0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 19:14:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 17 Apr 2026 19:14:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 12:14:08 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 12:14:07 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 0/6] gpu: nova-core: add GA100 support
Date: Fri, 17 Apr 2026 14:13:53 -0500
Message-ID: <20260417191359.1307434-1-ttabi@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|PH8PR12MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: af18d548-7ea5-4ee1-e103-08de9cb58bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	uUDK8hpAvBMxgSf0rJgLepda+w7xYFI41iW9c4rCBWgloI+GHdrqjlazV4Ink9rOMjLK7EFogtHXbG16zyBEJW0XPzoQgcmRzc0XcpShHn8vjj3r4ujaNaNrRp0RPSnDtuVzACJtMdDV5J6i0UuPuy4buMtBgLjyiurLAT2LIcf13yJPCYkIu5YsqAZLdpUGMdYbd1JdQ/X3U3mRP2HjpQtYl8CawohYQhNbGYj4TrniMn/uXn0rjucBzYBKDyfz+R+8ZdHQ1F2HhMRmLrwfQXum/it0n4VTyJHPQQwQXknPEvzeNeizKFBonMkJC/lRPQYw7+HHeX5dYKE6maQTZqB7IrwT7g50KNxwslEOJ+HMVZgrqqde3S0AKNqQkn8i9aEShUgd+rz+IfR2aQcPown8yZFpbiMMX3AuaMZgtsU64LBJ1Pueq/Rh4SxDoComLUU+vtdLCUW0ZP3hLpSUw+FjNWrP02ANbNNSULLvvkB0e4hqEhDZcASxEQXe3P7I/gf5CfQZC3lToGBTaPklRUlOriSFb4B5/TTVUc5OYHJLjsUTBhS5P/JW9+ndfDxLX8+hwcXgDIB4A12wDRKaVmtFExvp47HZSUzr61AUYEb1RLWAZFXFqvy6UM8aa6k5axogJOuo61YxMVOcyBPNBCsDLxX8BipYaIMXuZGJ5k6u1l+m21rHXhzkSUOdgA42U/0tDAXTuAHhtu+B3yooDmAovTaPjWQ7QE6veN285lt51CU5c2XMmR/sr8aOYLLtp27YVvhmLXn0AiTB5VduXA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FI32bCqLvht/eKNMo2jY7Taflj4c1FYNJkgIMGMDuImkShEHv/sMvRvCzcvzEKO9DrbsdSZuAbRlKSuj6uiWeRwLuyTTlbQGNcPkYTUCD1mClo7QEqs9EUKi/SDmtamgsQe1Z43Btj20XCYl8Of5C+AYsvfSiH1WCyUCAgcdqFh8AsRcwmzOzN+2t7yBhRHD7Okr2VXcxa/hrQy2+DmdyL5/2z7slfbnCyYxN0fMLRR/Ytficep6jQKJkCqjySc6QaRdIR+Sqqa406nUlGhc1JPDfnVdHXSJ4S/ix4TyHIlT/3gUgIZvcOj0p6EfMoWx98JjsrPdLtkwLsB5TDi10RRh3eA7uwYTn5smTaCOy7ZMQo24mkNaXiL9/qx3Tsro78ggezsFEXINOHwD2Ajt11YBio85Q3SmGpxuyJ+9bUEyAiHOAgJNWN3wyJMVyz+I
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 19:14:28.0295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af18d548-7ea5-4ee1-e103-08de9cb58bd3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7254

GA100 is an odd GPU.  Architecturally, it's an Ampere.  However, it
uses the same GSP-RM boot process as a Turing.  Its VBIOS, for whatever
reason, has an IFR header that precedes the PCI ROM header and must
be skipped.  In addition, the FRTS window size must be set to 0 just
because it's a GA100.

So add all the missing code that GA100 needs to be supported.  There was
some infrastructure already for GA100 (e.g. the FbHal), but it was
incomplete.

Changes in v5:
1) Moved IFR registers into vbios.rs
2) Renamed current_offset to vbios_rom_offset
3) Moved IFR constants into vbios_rom_offset
4) Misc other improvements

Timur Tabi (6):
  gpu: nova-core: use correct fwsignature for GA100
  gpu: nova-core: do not consider 0xBB77 as a valid PCI ROM header
    signature
  gpu: nova-core: only boot FRTS if its region is allocated
  gpu: nova-core: add FbHal::frts_size() for GA100 support
  gpu: nova-core: skip the IFR header if present
  gpu: nova-core: enable GA100

 drivers/gpu/nova-core/falcon/hal.rs   |  2 +-
 drivers/gpu/nova-core/fb.rs           |  6 +-
 drivers/gpu/nova-core/fb/hal.rs       |  3 +
 drivers/gpu/nova-core/fb/hal/ga100.rs |  6 ++
 drivers/gpu/nova-core/fb/hal/ga102.rs |  4 ++
 drivers/gpu/nova-core/fb/hal/tu102.rs | 11 +++-
 drivers/gpu/nova-core/firmware/gsp.rs |  3 +-
 drivers/gpu/nova-core/gsp/boot.rs     |  5 +-
 drivers/gpu/nova-core/vbios.rs        | 87 ++++++++++++++++++++++++++-
 9 files changed, 117 insertions(+), 10 deletions(-)


base-commit: 8884dbc1fd174315b406027375bb7a4b211a8fae
-- 
2.53.0

