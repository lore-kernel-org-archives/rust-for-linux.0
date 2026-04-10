Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010001.outbound.protection.outlook.com [52.101.193.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FEB34575F
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 20:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775853597; cv=fail; b=CluzmJlIW7ALU3iB/gNSigiJneUynGynvVkcr6JezwE1lbxBcc5l4BKYsu6ISL19gbfjaraEd5hMNMWh0XKN4/b1pNnOXBwqgWb0aPCjll7jC5F7WI8N/3yQf8oycGup7hORyVIY5Fo7fRIcrroh2uJ1fZjX5S1Da5qub4WsVNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775853597; c=relaxed/simple;
	bh=kWUn+GVrNpQphlaXEaz866PxIvk8Wf/l4yXyjcgB68c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CuvEarToKwakYD/72FUzjelzy8scH+fU7BGsekZremlcrgbOnJKxbckbXN25j4R21nT9EXxUGTrMzkj025kuzdENSVdJrC5Io1aBXUeFZMc0IXYsvbmbJNODr7TV1PGcUCbQaIgCUkG3OEk7rLNc8pkLYOIUQmAN3ctyPJct3iQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iriYLIa2; arc=fail smtp.client-ip=52.101.193.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iriYLIa2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vm4C6IU8yGs/jFCPD7dfs1ZDqZFLeI0nJl1u8JKEpi4xatOYVYQmWyLWwGzsqrif0+yrR9AOBAJHRY5FHnAswjXKN3E1krlQcxPVEJAyE0Nj4q8TGYcJssk4J28ARGHIncwv9VC2fW7ZDGt/Bykff3X9BtGRSY+OaGKZoKdx5UBhv17PZSPlTsFXUVoD2y3JSVwKwUFc5+gincdx6wxAvGNwjntN2RA8LN0dkXYnfF6bMf4hPWjADwX0PHVf0mkbB6/fjTtFWShw4hj/R7wwcq3Vj2mugi6nlmSKAyVvVO3MKj8TUR6icXMAPjhy7q9VrMgTzMBlkzv81kcSTltL3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rl6xES+e1dAQzVlNIfCw+IFR1KVTcg9Q9W3yyDS1SgQ=;
 b=J9KvEJFWuUP7B/uyXytxD4hlZ0g0ce22xr2K1SrGKxTeOGrl1twnWmCWhByZR+oej83q96gTqSLFGHHIGJQ7ZPcARFlhAC6MSRGvaQanUK1rEsWFWc1A109Uq2mAikiUNcmzOisn5ZsPDN9XpAOWpLr1pk7AHItealy77UJMkEC63llz8St3MLY6URTU4/OQb1ZNrILzCZpN6YxD4EJgdWIkVHgi3SJ3K+jXCWodBNi6MgP3lrifQZtyXDKdd7DeZ8mlArOj/j6510MpvpeifPoDpgye6SKxrzb+kxIoNzx7ImVczHL64WKSJCuLbRKOV+jtuOHN9HK0CKxk9vH3Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rl6xES+e1dAQzVlNIfCw+IFR1KVTcg9Q9W3yyDS1SgQ=;
 b=iriYLIa2/gC61sLM8rsyvnmGPkieKGjIE3qEpEx3i9faUpsIZQPDHlL5RmZZJAe7InpJnLmt2ikMWNi+yFQl6BQtKEDy2n4esgs1JBFKamOPQ11m9CEMWypQyJ938/8qOOEeyn0vOOxct617vOMD0URTuElQI+VwVsmoUKKwOwf6HeoagpDnsUFvOHABWtQhdMLr47Zmkf4xyZHVIn37jrI1KC2jmfAnB19rMUfxz7OK8puR3RuwZX4ToKmA5H+7XJxFnUerIjFUGopD8watf4jZWi5JMlUzxmWuiwvEqZuLx6Ku//QSz4qAYKl8iru0oiRVsLgLHXnZ6f9gv5hkrg==
Received: from SA1P222CA0029.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::24)
 by DS0PR12MB7680.namprd12.prod.outlook.com (2603:10b6:8:11c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 20:37:48 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:806:22c:cafe::68) by SA1P222CA0029.outlook.office365.com
 (2603:10b6:806:22c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.43 via Frontend Transport; Fri,
 10 Apr 2026 20:37:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 20:37:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 13:37:31 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 13:37:30 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH 0/6] gpu: nova-core: add GA100 support
Date: Fri, 10 Apr 2026 15:37:16 -0500
Message-ID: <20260410203722.1586938-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|DS0PR12MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: a9316489-5d45-4fe6-4ec6-08de97410738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Hxnphkd9Cwp2UHsEh2zjpFdWVBfmhSzB7/WdzF3HBGRxNCJggibFu8r5PUL+ZyWVRwOoEKxvnRxyDK8IYWUQkSPBYSoGa1bAN+mSeQ+JN6KWYKzmvEuuVbaiEp8UhDLTMQx5zVSUkBts12DaZI9srxXYqIQPFs2d+bNhOtNXfoGsAAUwQIx4PZovNcRo/3pcVdDKDBSV7rOGYtXsdMcEnufyWy1uaIUxPdwUbkNIET8FTKHH6kEC6LIfiv4ImP0R8YUMBcrLCgxdWotNr7Kd5YQnh1FhRhbZxpbQiudUIqesjuxKQM4raoGK/ne0o7hPkEd7aLs4uJ9z7WxJFNjp0HNvA3AX+ArJVTBbPD99MQcFrbjp41SXZkZ5Oc521DoGyNaIUIprR2cIVtzRkOmZUyAMhgFcjjAVDXtkE9Lfgfz2aDDzuK0ZB2L0Qcnhyz2AyI2XYpasohM1DlI638kxL73p7N/7Dap6Zy3OAcy+qYCFwbxJp8fNhI9pflTNXuFh3/BThmWAQrmx8WLiXKFY3BinyjDsV3lwXhDvUrwBoXz+o9tZIkdSvywSLjQ4qct8Qy1gCJWddmB+geC64J6S6eeCvBFw0mGRo+t+IZHrWQTwZWFFa2tZrjqzEi0TMsJbHnO99/sWmDppPLEvv+av6xj2rdcbVtk6EXSER2DgR6srMAMRzzA4P64gLnckuTPg/QhY4+i0aDUnUD0p/BGDoRoNowe9zqVsw4Jjsqybu2w5HHPiP9/sPwNrQ/UJLhVUukY7i4Zu5PI4eORQqMCLxw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RwyXsZfkSAWc1wio776fvNAD2jB3moJd7cTxIaRgqkNrsIhIgX/UXnv+VZf+XnwGunNVQpjckt4rSodqYHVKfUmqdpHT5CN/GDOcjl+/ENfEO7vRs++T6cV45ttwEqwG4RFRNSTsursx9rKOVyEtZBpjSU7poV/AMU7DNgcukGUmbiVvPCAw0UM8D9ZJCRoq64gqD4kjOfNTWPD/KvLjo+qJTShAs61RguBmOuYO3SedxjclcIIKcXtIjJLa8xbO8BIWXHegnAL/oJn1OxlJBTUFyblWs7z+4kNywDvRj9pjlwyE4sTTXg7pXbwDFfV7NTpMgmRGDQixgOFDoVL8kF7qAkeXagXAvd1DZ+AjpqupBAc91jaT/Jjm44suRBOP7/UJCzIoBIw1WdjdU7OWIakF+Lrz7BzfGD1xgtIPaDqYJwe9NthLgvomz4F92gxs
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 20:37:48.1450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9316489-5d45-4fe6-4ec6-08de97410738
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7680

GA100 is an odd GPU.  Architecturally, it's an Ampere.  However, it
uses the same GSP-RM boot process as a Turing.  It's VBIOS, for whatever
reason, has an IFR header that precedes the PCI ROM header and must
be skipped.  In addition, the FRTS window size must be set to 0 just
because it's a GA100.

So add all the missing code that GA100 needs to be supported.  There was
some infrastructure already for GA100 (e.g. the FbHal), but it was
incomplete.

Timur Tabi (6):
  gpu: nova-core: use correct fwsignature for GA100
  gpu: nova-core: do not consider 0xBB77 as a valid PCI ROM header
    signature
  gpu: nova-core: only boot FRTS if it actually exists
  gpu: nova-core: add FbHal::frts_size() for GA100 support
  gpu: nova-core: skip the IFR header if present
  gpu: nova-core: enable GA100

 drivers/gpu/nova-core/falcon/hal.rs   |  3 +-
 drivers/gpu/nova-core/fb.rs           |  6 ++--
 drivers/gpu/nova-core/fb/hal.rs       |  3 ++
 drivers/gpu/nova-core/fb/hal/ga100.rs |  5 ++++
 drivers/gpu/nova-core/fb/hal/ga102.rs |  8 +++++-
 drivers/gpu/nova-core/fb/hal/tu102.rs |  8 +++++-
 drivers/gpu/nova-core/firmware/gsp.rs |  2 +-
 drivers/gpu/nova-core/gsp/boot.rs     |  5 +++-
 drivers/gpu/nova-core/vbios.rs        | 41 +++++++++++++++++++++++++--
 9 files changed, 70 insertions(+), 11 deletions(-)


base-commit: a7a080bb4236ebe577b6776d940d1717912ff6dd
-- 
2.53.0

