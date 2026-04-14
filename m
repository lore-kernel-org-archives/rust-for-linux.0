Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010051.outbound.protection.outlook.com [52.101.201.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBFF3DCDAD
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 23:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776210681; cv=fail; b=XCL1OsdTGdllVNp3oBQA5MqnZYeqLuQrUoZ97tsOPi+H0rkUwAX8nZNI++a+dHi8j761sEuUrOpTvHqo7aAcbRsrdZF5VtcTugESRHeBTGaa/XGDvUNeT20GYOiBXtaEXV1Cb8Sv/FgbqZF0l8fsT3fnuv1zfh6HnHlHoell7IU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776210681; c=relaxed/simple;
	bh=rOMM1mLL9krZwf0S6FYsFW48bL/DeRHDEL+NaNxEizE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IGecz5JlVlgbiX4EoKK0ShUbtc3R/mYXzloJ4p79rWIT8jlpnxyc0VgYhforVotdTVYNZQvulXciyzR0NWwRwf/TtrRW3JbH6KPF4vjVuxXxiH0vkuBUCKLSSxsEDhbrgJ+mSbk/pulq7e0873WTarJnWFI24aUzqH0hERXSBTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YcwoLt0c; arc=fail smtp.client-ip=52.101.201.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YcwoLt0c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMvxTzagqkxthc260dcUX4q4GM+iN5g5og0ZUs9p6+gQrymXOfft8SsFMoFNjklC5Bt58o1Y96CbkqcLR4JN17CGdiKgASbZW4lZCKvtrjiTZhGdl5tHu3vpKHMu9rxMnA1QzsRauDKFY9Q/WcxdBdBNtwobvMHFSI/sVBtP4EuH2KALLuXhe4Vw6m47qJIZq4a9eJASGZsV5TXlm2ls0hE3uhtEUk6AyuNr2F/suMvD7z3zBTKx8x6M1+VKQ5ZE2VlI/wG8nz6ehF31NFGugXqQXr9HnompJY1y0ank/WIX7Sa/NqqnDXtdUHE5M6lra9Qks6HomNb2eswC8xlRpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilbXI4jtgcwA8Klfcrdho3Jtgc0YCW/w03c4iMep/u4=;
 b=QqhOBoaUd2FHcl/5aRpuTyKhMXY2Bmwl0xfopaMQN+Jluy5kuiUsCpZp15uyQ9FJbwU5heu28BQPDJyf+vOVgRBmAw8YorNWDE4XmYRCAqZL8NFpn5iKymWpc0Rth2w41r1hUDSj5Fqa6HsGFxcRaeIyHhfq+ljt7AHRAdYKzk6df2/ECZVJ539C2XkKQ/YB1kM5CfUuZLLcJntMnEPamhlwfdj9+Wic47zdFUKYN/28hb1jpc2PmC7bbIQ3zBGj+0LGnI3aJAtZaQ3dtbVZ9DeUBYcihp4vAs1H64HYcrxoTKwAJ3iuO5xSRcXy7Hw8d3FaefBBQHZJ+uCMfGx8MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilbXI4jtgcwA8Klfcrdho3Jtgc0YCW/w03c4iMep/u4=;
 b=YcwoLt0cTX1XIa7LeFrkZggoeHm7Ok6PJZZWz/QyIJqWiQSty2vDgJKPPvbegEjj2s1bBSxks/W6BAnGzG0ZelVM/Z7R6lzubrXfoPqZyQT7fsP34BFP5PrvbfNUQPdwtN+YJl5BI5WDG+0Nko95aHcew7shjzsn3BAPG1L2DCYYpCdjNr6MuHyHnc91Fug9aegAFwX2LVOPqViD/uhz1Wszh0eaVfTlzVioxv04d6PkLQ0DmNf9h+Ii80sfJcv4pRxBOZSG2Ccbd4b7RhE3IBnU4251WK6MjOHC6l63KKlLM48W0Dp/iHwdbqM/5EaNDzBnsYAqd/Ao3W6ev5YD8w==
Received: from SA1PR04CA0004.namprd04.prod.outlook.com (2603:10b6:806:2ce::9)
 by IA1PR12MB8287.namprd12.prod.outlook.com (2603:10b6:208:3f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 23:51:10 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::5) by SA1PR04CA0004.outlook.office365.com
 (2603:10b6:806:2ce::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Tue,
 14 Apr 2026 23:51:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 23:51:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 16:50:55 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 16:50:54 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 0/6] gpu: nova-core: add GA100 support
Date: Tue, 14 Apr 2026 18:50:41 -0500
Message-ID: <20260414235047.439322-1-ttabi@nvidia.com>
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
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|IA1PR12MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ea913cb-ef6d-4d44-c36d-08de9a80b443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1Cde1QOQYfy80/OCNpi8RXtaFEiR3iC/6w1vFhMJ+OTMNRqXRg3i0DbzIybbHXK8ljU/pD0biTG1aF9uKV51XOcmg4rGfGH8qdfCLD6bGnl8FSjBXyqHugw2PBZ9Sv3VYInpAonQXJ2HK/P3Ia2EB83hPMBbfwQueZuohk2U9ggCRDaDtW4D5R2+y3oWIfmYE4YvaGOL1fu6o/Mxg1XfrBOmQQpGFXR6D7BPnWVcupwxnt2hx1Hkz3qME0qVOs5P2ANXfCgIn21ov025b0ED3+SpMvr8bcr0sGT0o5uIcGuXNS2rP7qiJp5rTmslNRWiLfZE+qTWTbtuP19ormK8EGQ7ExLUFFiV0G6Z/bPywhy/oa+JRIhxjw2zMr2ZQ59367fixJHz3gQr3lefKTt0XWqS0mrjkFgmQk/AmFXB4XONnYKsr6LLNLFQfvlpY0aNFWlqqXx/8ZZYuQ957XCT+cUzbmbS4jCGZ/CTO3ikys7VKooHeotm8wAotWnwCwkPCoM8yPeOYdlNK6lEYyqaZf4ul+pJSl2LoEWT5+7jg9dGIDPgbPLqxgblUDPUncgLFyxTJVn7Rk7SECBw4lisag1IWI7U0IUIW5looYjsfAAtM7T3jIEnbO9ituwGZC8PF4XyfUJUS1SXHl7FPF7Nl6tvVGKsqqM0R9fcBctyNUIDExUkxFlrobu5nNdtTBl30MkjK2oE+5AB5b1kj648w1rjBKt4rRPhDaRYcxv4ObXem/JZDr56zjZ8mqoraJGHAAuGxD7ZzDd0qv/RWykNtg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GaRRqTBe5SrUCo2NxFwPXsF5FxTZPlfcPPIRruLTVAIlexiaeU639eSorlAI3VIC7+gBexOigGZ8V/cudBXraIbcZ1QdeDZZ48751PlqZtxqUkQHMn6PchSWeviCgj42sixEZIZc7Ntot6N461UZORvVPQNpxsyrq7pzsRO9vOgsTmD8kiYWA6JYimo0hVTfv5ZnZAsmVC5rvpGNvSuDwIKwPBW1c08Mv7InMHkmvKiZmnLOC6KYdCikmqoKFRPh9lgOnpF8mixnr6JpfFTtfJZRifU5pB0Oq13IIDk9MZS3v3i8uZaPzIHsjDbWsLpAFsYD2jg0yjjWD9zHY3guaQ6cVz71dVIkGPSJE0WxAY4C3vX61CqQ+VxblNBPfTrnUa5BSQZu4i9WCCscjanhf8ZMBE1towafbMx0m78hdF/zXc+l8IQmXqldMFs3KrOv
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 23:51:10.2621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea913cb-ef6d-4d44-c36d-08de9a80b443
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8287

GA100 is an odd GPU.  Architecturally, it's an Ampere.  However, it
uses the same GSP-RM boot process as a Turing.  Its VBIOS, for whatever
reason, has an IFR header that precedes the PCI ROM header and must
be skipped.  In addition, the FRTS window size must be set to 0 just
because it's a GA100.

So add all the missing code that GA100 needs to be supported.  There was
some infrastructure already for GA100 (e.g. the FbHal), but it was
incomplete.

Changes in v2:
1) Created frts_size_tu102()
2) Added bitfields and more macros for IFR header parsing
3) Added code comments for the IFR header
4) Removed language that said that the FRTS region "does not exist",
instead stating that its size is 0.

Timur Tabi (6):
  gpu: nova-core: use correct fwsignature for GA100
  gpu: nova-core: do not consider 0xBB77 as a valid PCI ROM header
    signature
  gpu: nova-core: only boot FRTS if its region is allocated
  gpu: nova-core: add FbHal::frts_size() for GA100 support
  gpu: nova-core: skip the IFR header if present
  gpu: nova-core: enable GA100

 drivers/gpu/nova-core/falcon/hal.rs   |  3 +-
 drivers/gpu/nova-core/fb.rs           |  6 +--
 drivers/gpu/nova-core/fb/hal.rs       |  3 ++
 drivers/gpu/nova-core/fb/hal/ga100.rs |  5 ++
 drivers/gpu/nova-core/fb/hal/ga102.rs |  4 ++
 drivers/gpu/nova-core/fb/hal/tu102.rs | 12 ++++-
 drivers/gpu/nova-core/firmware/gsp.rs |  2 +-
 drivers/gpu/nova-core/gsp/boot.rs     |  5 +-
 drivers/gpu/nova-core/vbios.rs        | 69 ++++++++++++++++++++++++++-
 9 files changed, 99 insertions(+), 10 deletions(-)


base-commit: 8884dbc1fd174315b406027375bb7a4b211a8fae
-- 
2.53.0

