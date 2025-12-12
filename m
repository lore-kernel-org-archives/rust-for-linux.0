Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010004.outbound.protection.outlook.com [52.101.193.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358B12F6577
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 20:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765572625; cv=fail; b=RIAtbfpZQn3DK/nIEAMFEPrguuq82TWoX82AxqbARfrvTIrSPxoQXQurcB7lavS6gGcNcLQtzCcYXHJS1K7FMc/NTMNkChRgFhTTw6hhjpKXEDEEfSehv/2dcD63T9zIG14n2domaMYTAwpF/BYDE/zVRPQHylvGd/QpDcLmEjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765572625; c=relaxed/simple;
	bh=i6fQYSji+G9WyCwgEkcOnzQv6rSetIJVCvXt//sbQ44=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S5P60NAxaJQxB0WGjTNeeWyDiOoPS61pNNQfvITQk7pWaj4eridGPtlHM/YBrMUSPUNcUNqKli/AmiPHp6bLnqLFk4812eWcBjKR+T0X2LHyDXKema6TJO8o/6sg2cM7eDPMnA+gmaZcFxBhpgXhdzPZhe5vlWjFU6WmzGTMD70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ngHLZwOP; arc=fail smtp.client-ip=52.101.193.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ngHLZwOP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wm7NIOWCkVOt58GT3SZNwP6Tca9HSU4pFq7rgbJzxcJPC/9Nmfg26GCmq/cF9N9zsBpH38dudAQMiRLQ5sVUGuEtzUkQAnxxE08l/4clULvO9Glf02FP6gwHmxN2j6fXMbBDW8fEilunF9QQSvixC1Qqj4QWZdSO9hF90/3XqUy5Eu0jZcX3tjVoJMDRWNINfQdcnn6UKaQRHu3J0/KgxYDHueA6HU2IAcloS5GCCBEI+OGFhFX9CBUcSCsVvC4E/rvLN46l4Yg0qbN4GAqc4Ayam1QjpPqyemyWCK7yOTdkeu1zkjd4fKrTZBSYaHzkHJMVFTIBM68vLjTUeVat1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBWOfmCwATzoIy//IoisdrGnvh8UyON1pJ3n174UKV8=;
 b=yEx/Ylv+qTfKfvP3BVU6EbnQL1tOpJaHYAtXbrsYoOBUITLzbYI3DShWan4aMD4QOxBdTx3SmI7N2IxZqBen4Ev4JrTC/AwBgO8fzJcGwMczXoccpxCqGWWQb9v3mQBPrCQfmoz/PlVZ/M6NYE2XC/a+JphbU/4nWvvcfa+4XY7nDjHYA3YqEog76JHJu+kp15fV+BDaq/ehR433KJjfxay9RenXznQ/CtB8W0LAvBn15p30F+kuW73JO4tspRO4Zvrq9Pb3Tha6HmDYeHJxRgNZIdV3hVtTer8+AbVKWdY5R40+f3GsvW/60uU+6VKWnQsRvJGMCKyUCU77ek+69w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBWOfmCwATzoIy//IoisdrGnvh8UyON1pJ3n174UKV8=;
 b=ngHLZwOPKH/3mrmE7G/5+Co0Ue0xQtsfjtlCPgY+bytmbY8DbOmf18dl0zNgvt7LuXHhzn//mT+y65B0n8KqLoTs+/FCSSeGU7kHJ2puRF+AoaokRtx62K/iR1xTQrJq2IJhbfFGcSAlp7bFmqPbpEIOPJMWsCWu+ukMV1m4hGOssEosGszhbMTrmQT1rmNhF1CUtcPzbfRlACzr2PR6aSmpIYvQXZXTLABTOnZTSj7VkeyuXSLqdv7KTNCXLRTkO+DfhxQeKSHcZURuJzwdnVI5ZdEqIvNuiW7Bd04QGQifMETSHK1QpaqTv538FApDwtHjQNG0Uyk2z4FCOGJV8w==
Received: from BY5PR16CA0010.namprd16.prod.outlook.com (2603:10b6:a03:1a0::23)
 by DS5PPFF2923D4C1.namprd12.prod.outlook.com (2603:10b6:f:fc00::669) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.12; Fri, 12 Dec
 2025 20:50:18 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::e2) by BY5PR16CA0010.outlook.office365.com
 (2603:10b6:a03:1a0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Fri,
 12 Dec 2025 20:50:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 20:50:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 12 Dec
 2025 12:50:02 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 12 Dec
 2025 12:50:01 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<joelagnelf@nvidia.com>, <lyude@redhat.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH 0/7] gpu: nova-core: expose the logging buffers via debugfs
Date: Fri, 12 Dec 2025 14:49:45 -0600
Message-ID: <20251212204952.3690244-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|DS5PPFF2923D4C1:EE_
X-MS-Office365-Filtering-Correlation-Id: 5503c31e-2219-485e-b925-08de39c00ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T4qlpsny52sK6k677aafIYUWLn8qFEv6ySm9C7rayInZpSKj+EjebxI8XLDA?=
 =?us-ascii?Q?1aAvV1cOHo98v2l5QGoyHAn0akZrb5o5pc4Nyfro9X5egMES1T6YtBGXD5YP?=
 =?us-ascii?Q?dQ6LeuaoI/4xqeZqFOymrZGWu58dP0xt42WVh8lx2fAWbJfBsULp5FIwm9zB?=
 =?us-ascii?Q?LVs4f9v9B/dJSgV/tNBy89YOJWgpTaFyboIdlwSETWRxGN95KvN07ul3KaoL?=
 =?us-ascii?Q?tA19BpOuJ9k08ML3grQ2LNRa4vJ1Hz4r46jakuH1v5Da0hgSH0n2VREFCDEx?=
 =?us-ascii?Q?0ADp0K/Rzqf+CfftSG7HlujFSsbcOiTG/pwAo23ustNWWiEYlr1Pfyv6jnib?=
 =?us-ascii?Q?MbyJXtoa3Qx3F9J+hPg8xxUyUbfDBvCEsCTff+duonLxf1/J/bzcHpe6ytfB?=
 =?us-ascii?Q?t5NitU7vfgC0XDtNfelWIz7/FGPodaopqDCOqPmr88cE+FrJqBN/PQ/2ts5h?=
 =?us-ascii?Q?gZqZ4aevw5TJGedlB9QbtHhr55BDf3aWG44b/NaNwbeSFHYanQxyy4SqLEkH?=
 =?us-ascii?Q?uJB+dC8FSo4ofwDmcbAwpIur0Ktvne4ZgKuxfjyXCuH5kJkSqcMkXwrAYtDo?=
 =?us-ascii?Q?bHD5Bzkolr8TO8jWRn6h/asbN9uubXQpBB9mEa3aqXAwH17Cw+1grTgzsz/n?=
 =?us-ascii?Q?WMgy8wYEh7dGVxh1QdYAdA/mcGQnHsEyftfp8+mXSIVVIq/fzMSazf7nQC9s?=
 =?us-ascii?Q?NLQF3cwXibl4a3ExyrwUdFy5C0HSSLfJP9RH1PJckBbgh7X+am/isbz87Ahp?=
 =?us-ascii?Q?W/530lKinwr7Ejq5xxqa615kSQmNPsJHh2gIJ212OS9/Wnci8ZU3zLdkGq+P?=
 =?us-ascii?Q?w7T+n/+4jXRPbVMcuJ5Yz9i4Gt30lGWEFFuUkscY5d9byOP5jNnpb6opPY7Q?=
 =?us-ascii?Q?zvJUhTkt8xja+25tVS8HrLdzAbZpUfevGJue9PTK0qGzlEb8hI5RqRdhHvd+?=
 =?us-ascii?Q?M/fsCF99pwgdIdxquRg/qtwCLRVRScvifWW1cPwegvZYWVEh3nl3JgNoCR8T?=
 =?us-ascii?Q?YJE6QzlBCvSDFIAiwO7d2u69W1u94RUvqgM82vfgTcEvN4Q07MOdqD03FcUe?=
 =?us-ascii?Q?ksXU0f4LSMgGNSGjcTBmpJTkCFSK5qlyEfWnZ2wQgmGObKng8rCbsvvmp/7u?=
 =?us-ascii?Q?jyZQAvhi4XEsM0P/CEodYL8O+r3RgAUsmW63BTBIfNGGVALknRjOnuQ5Duvc?=
 =?us-ascii?Q?YDOZQRTMEseElVprmt8II6NOoSRbXziY61KcZjk/2x6rwTpk15TtFePLekUP?=
 =?us-ascii?Q?4/pZZLz6S5ZJBA4rwRl8vaEF0Bj8YvbbEDVT802Bj9nCof0CxKfKPsYVvsNT?=
 =?us-ascii?Q?X2SyaGfSb6OInImfIcskq09O6KrSDyqLqLxyjXMlXAFvmcQH6sVtqkuNbOkP?=
 =?us-ascii?Q?8JyAzugVx5GEI7oV0lQmFkkoUwC3h2viua82HsTXO2OL38va0VkLH57ZF2M/?=
 =?us-ascii?Q?SbhJe8aM459cFc2x4sxKhguiW2047a8BuJeo1eeGFzsmTf8CVHA+5g5D5Awa?=
 =?us-ascii?Q?sJMLvykIn57iA7hkHKX/CJtA2m/aE1eXGTN3l+KORVY5ITFl8Vqqhzoo8vWp?=
 =?us-ascii?Q?Ir4eoO3+rH3jx2Ojo6w=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 20:50:17.8505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5503c31e-2219-485e-b925-08de39c00ee3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFF2923D4C1

GSP-RM writes its printf message to "logging buffers", which are blocks
memory allocated by the driver.  The messages are encoded, so exposing
the buffers as debugfs entries allows the buffers to be extracted and
decoded by a special application.

When the driver loads, a /sys/kernel/debug/nova_core root entry is
created.  To do this, the normal module_pci_driver! macro call is
replaced with an explicit initialization function, as this allows
that debugfs entry to be created once for all GPUs.

Then in each GPU's initialization, a subdirectory based on the PCI
BDF name is created, and the logging buffer entries are created under
that.

Note: the debugfs entry has a file size of 0, because debugfs defaults
a 0 size and the Rust abstractions do not adjust it for the same of
the object.  Nouveau makes this adjustment manually in the driver.

Summary of changes:

1. Replace module_pci_driver! with explicit init function.
2. Creates root, per-gpu, and individual buffer debugfs entries.
3. Adds a pci::name() method to generate a PCI device name string.

Alexandre Courbot (2):
  gpu: nova-core: implement BinaryWriter for LogBuffer
  gpu: nova-core: create loginit debugfs entry

Timur Tabi (5):
  rust: pci: add PCI device name method
  gpu: nova-core: Replace module_pci_driver! with explicit module init
  gpu: nova-core: create debugfs root in PCI init closure
  gpu: nova-core: use pin projection in method boot()
  gpu: nova-core: create GSP-RM logging buffers debugfs entries

 drivers/gpu/nova-core/gsp.rs       | 50 +++++++++++++++++++++++++-----
 drivers/gpu/nova-core/gsp/boot.rs  | 15 ++++-----
 drivers/gpu/nova-core/nova_core.rs | 41 ++++++++++++++++++++++--
 rust/helpers/pci.c                 |  5 +++
 rust/kernel/pci.rs                 | 37 ++++++++++++++++++++++
 5 files changed, 131 insertions(+), 17 deletions(-)


base-commit: 187d0801404f415f22c0b31531982c7ea97fa341
-- 
2.52.0

