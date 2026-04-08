Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010052.outbound.protection.outlook.com [52.101.56.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2C230171C
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 14:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775658123; cv=fail; b=YsevNQJ0NF5DkBWvV1//en2oSqa5wiV3oqc2GyvHI+NOyNR6HLpp/6ZJheJECtBKwa7+z2cV/w6vg0LGIZzlB42LprbfkvRRbAY5Rpq3FlejAw1cmq5k7E+D7vCVpJUpZZDV+lCmoxero/wCHQxgMQIMXxPmuOoW1Tr2Cjm961c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775658123; c=relaxed/simple;
	bh=JCGHxkWkxN8h9V+wNBqwqpOCn77+CSYUXfSZIvKQlBE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WZv5QUJkVDh78/gGkYtOKZs0kw9+JZZV5fHVPO7vpF/aMvlOjVjRAOa2i57Miq7FOVqIZBp/a+9y1JgHPZAE7FvGOUaZCvcbCR85FnOyLvPqvxekGan6bdORuclMPJzHpstWi5Pojug6MphD76GHTeg/0Q3HnDhX6bXY9fzSpdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C5svZ9wT; arc=fail smtp.client-ip=52.101.56.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C5svZ9wT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ssJ3z7yDtFqPM82m5Zz5z5vlci/HgAfJShReJrQ4TicELHCHJ0KRpirrkIK25uO7sFUmwMhhKQchPxXikShQS8tbg3VfTcP1dbVGSv3+trokGb7SOSgds2epLVABuzeNCjpgcqGNDWxE7OXG1gxnNLgSw+ikI/k163DesrtxgdTAyLH1PsvWNH4EC6bcHJmBN+Jw5Ta2211uXASSzkr519JloLfaZTJqviWFBklhdLYYU8T3dGfC3nS5xdymKkTrCUmaGKmQvfQulqV+b9aumuA5qkJqrSnGiV4XZsbkm0Yd1NDeNPpdnjRMzva5tTMe4/t3XVwpmthVQKg1oeoGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLEMBirTW2lkQ8q+ZVVWRUffdjURbMOVLQyVnnYEQ0Q=;
 b=bwW80nS0TuGwr3j+aPzR9oNM+HdjPRYcWC1c457czAqFEFyQ4/Cnd7hu9hmveksri2WF9S2wy/kgH4nI7d1fKq8pUZwJolK0qKZF8SxBX0wyxWLwQJ0IBx3rhkyrt094N9MUOrNZrgOnXTb4O8JZltxL4W8jWM+q6iypUVcziZpTvWoE4Pz/SaXASQp2syyxZnAnj/q8OaAGtEVBLxEibZQ1W0T14aZtK+PCBiMzXHBLUb9tSzFvMd6v6Z/VKbEEuZq7SlVutw/p+0DrIVIRNeiYJqDJnLJ/z7ZjwZlIOctWCRNQqcr7d6If9NnaLz75CdKTy0kUFBJNp89vIY4bWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLEMBirTW2lkQ8q+ZVVWRUffdjURbMOVLQyVnnYEQ0Q=;
 b=C5svZ9wTuMEq3sIw+W8hQ1hUiEa99JSYc8sW2KegLHAJDldkQEFBphD+kr4cAAQi0nbRlt8Gijx29g/JUNGkfQs+xZtwbl7Um+GltLSdVbT/vjWPE/ePJMuuDIPb19ej26EjEx6rIsalZNuoPEm9k695ZHD0Whgz9HeRJxdU5r6pCyRITSqFk2sS2JAMjLwC5g108rcyXrd3ZLEP/Ys5fDc5EkqbNnCW3m5J3aOm8GezM9JaGb0eq1koJZyQm9gfpsV84BjBkau9mNYS7Gxrv2e1oK5wZLHG/00glvN8qLH1Zt/Mt9W1Bvz0/swGahSipQ8pYXu+jrxXxHfDXPm6jQ==
Received: from CH5PR05CA0003.namprd05.prod.outlook.com (2603:10b6:610:1f0::16)
 by LV8PR12MB9154.namprd12.prod.outlook.com (2603:10b6:408:190::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 8 Apr
 2026 14:21:54 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::de) by CH5PR05CA0003.outlook.office365.com
 (2603:10b6:610:1f0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.38 via Frontend Transport; Wed,
 8 Apr 2026 14:21:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 14:21:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 07:21:44 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 07:21:43 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
	<airlied@redhat.com>, <jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH] Documentation: gpu: nova-core: document the IFR header layout
Date: Wed, 8 Apr 2026 09:21:32 -0500
Message-ID: <20260408142132.3911466-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|LV8PR12MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: 5814ef36-a855-45c1-dee1-08de957a2edc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gTlCMQp6qpClz7iufgquyqVmNWUuqQT+6nYW0yIa4FYFrL6zwd/TySCHMu9sKSFXN4DGC5Cnxd3b18GMZKHLq/r619zDPKmhyGY6flX0SfUHgLS7y1Oopwo3nkq7pJhxMtBL1VLbWY7RGgcvrVW2fpEUGRDTkyC39eA1E92kHUVKPLsLqgcqI/rgjR8dI4hj+EdnFFfEpFAnqJSXKtRrblYBB4fJYtargxuVNcd/R11qsJeFSdc8E3aU755LfGToqKu4AI9k0zb5r2koocyM+B440g1E3cQ1iQlNnAtOvbv39gO4qodBCEfFBjJMl+9HPFqbX/xVxOUiNneuu9heAyrYvBeNTmvsx/IqPWZZM1CUE4XDxOtk89cNtL729aejyeuL/xoIumeZb6aH7yJ1EgGsYkJJhFDjuAM6uzENgfJN7pUSQOdCweXgdok/qegdHtfDeTQOp17AZQfOda/vY18Et7X+XeCHwoppfsu4izIo7xIg7jingGgZWymesLXjKd/FjQkZNGnkVsnWYChgiCPh0PlS0p8rQENp//IMNB2hHyK0mVlyeiPzeFw18kFQZyLk1j66mDIuYN7kPhJ8/OVVDkBSKlTwZtitvRN/RuZXNyS06vhuq1NO2bxHombEUW9iGP1pdXxF5Scu7uxWeSXrPk/oa+g1CY+F9YXkGxBMHeA7O33bMjRmO6+D0ZGRG9mcmSlTSRSMvOoSfq9YJaD6Pjjtn3iB1i1FzMUdOEviYXJBXTT+1xpvCkiUouvMFqcglEFEsRQMCR1vmxqhNg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OZu9EpBHWYl6bnHPgOdvKtz5mDn14nylczkD7pcEemVaCX4dSOFxf6bVOxTY3iN1F7un5ts8WNAkyMQmI3J4h6xKnwhsDe+hSuE7sGtd7w34iZv08P/YMhT52P8ObROfNZg7Q/K3NIoOzeHvSk/Yiyiy510gUlJHdjqWqMNV1h4bPyI5SZXKVmB0zN07Z3IkoebRVgLOKMCCFqSLwhOY0J87p8BJVy5qYCGg+80XX4U9zn8f+6+1mch/OojXm3Q29+mBntf16Il4r9OVa3XtDt5De6jCed7uYeCAZ1S/95T9Z+k/k0ceyCSjwCD3Fhyd9hfABU3Prl9Xckhk+7s6lixZDuf5ipIQI1jXElJQAVBRXP5wsgyecATPqweoJIgAbD5JsOI8oTWB+4x85XtB2GmyfQdNoGCfbiF+soW8Ds4V3XwXGDE44raa4wX1Uwox
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:21:53.6476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5814ef36-a855-45c1-dee1-08de957a2edc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9154

Init-from-ROM (IFR) is a special GPU feature used for power management
on some Nvidia GPUs.  It references data in the VBIOS for its operation,
but for drivers the important piece is the header that precedes the
VBIOS PCI Expansion ROM.  Parsing VBIOS is necessary to boot GSP-RM on
Turing, Ampere, and Ada GPUs.

Most such GPUs do not need to parse the IFR header in order to find the
VBIOS, but the Nvidia GA100 is the exception.  GA100 lacks a display
engine, so the PRAMIN method (which reads the VBIOS from VRAM via
display hardware) is unavailable, forcing the driver to read the ROM
directly via PROM.  On other similar GPUs, either PRAMIN succeeds before
PROM is tried, or the IFR hardware has already applied the ROM offset
so that PROM reads transparently skip the IFR header.

Note that GH100 also does not have a display engine, but it uses a
completely different method to boot GSP-RM.

This information is derived from NVIDIA's open-source GPU kernel module
driver (aka OpenRM), specifically the NV_PBUS_IFR_FMT_FIXEDx definitions
in dev_bus.h and the parsing logic in s_romImgFindPciHeader_TU102().

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 Documentation/gpu/nova/core/vbios.rst | 63 ++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/nova/core/vbios.rst b/Documentation/gpu/nova/core/vbios.rst
index efd40087480c..c9c25264f45d 100644
--- a/Documentation/gpu/nova/core/vbios.rst
+++ b/Documentation/gpu/nova/core/vbios.rst
@@ -46,12 +46,71 @@ region is only accessible to heavy-secure ucode.
    are of type 0xE0 and can be identified as such. This could be subject to change
    in future generations.
 
+IFR Header
+----------
+On Kepler and later GPUs, the ROM begins with an Init-from-ROM (IFR) header
+rather than a standard PCI ROM signature (0xAA55). The driver must parse the
+IFR header to find where the PCI ROM images actually start.
+
+Init-from-ROM (IFR) is a special GPU feature used for power management
+on some Nvidia GPUs.  It references data in the VBIOS for its operation,
+but for drivers the important piece is a header that precedes the
+VBIOS PCI Expansion ROM.
+
+Most such GPUs do not need to parse the IFR header in order to find the
+VBIOS, but the Nvidia GA100 is the exception.  GA100 lacks a display engine,
+so the PRAMIN method (which reads the VBIOS from VRAM via display hardware)
+is unavailable, forcing the driver to read the ROM directly via PROM.
+On other similar GPUs, either PRAMIN succeeds before PROM is tried, or the
+IFR hardware has already applied the ROM offset so that PROM reads
+transparently skip the IFR header.
+
+The driver should first check for the standard 0xAA55 signature at offset 0.
+If found, there is no IFR header and the PCI ROM images start at
+offset 0. If not found, check for the IFR signature and parse the header to
+determine the PCI ROM image offset.
+
+Fixed Header Format
+~~~~~~~~~~~~~~~~~~~
+
+The IFR header begins with four 32-bit words at fixed offsets::
+
+    Offset  Name     Fields
+    ------  -------  ------
+    0x00    FIXED0   bits 31:0  - Signature (must be 0x4947564E, ASCII "NVGI")
+    0x04    FIXED1   bit  31    - Reserved
+                     bits 30:16 - FIXED_DATA_SIZE Fixed data size (offset to extended section)
+                     bits 15:8  - VERSIONSW Software version
+                     bits 7:0   - Reserved
+    0x08    FIXED2   bit  31    - Reserved
+                     bits 30:20 - Reserved (zero)
+                     bits 19:0  - Total data size
+
+Finding the PCI ROM Image Offset
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The method to find this offset depends on `VERSIONSW`.
+
+- **Version 1 and 2**: Read `FIXED_DATA_SIZE` from `FIXED1` to get the extended
+  section offset. The PCI ROM image is the 32-bit value at `FIXED_DATA_SIZE + 4`.
+
+- **Version 3**: Read `TOTAL_DATA_SIZE` from `FIXED2`. The 32-bit value at that
+  offset is a flash status offset. Add 4096 to get the ROM directory offset,
+  `ROM_DIRECTORY_OFFSET`.  The ROM directory must have signature 0x44524652
+  (ASCII "RFRD"). The PCI ROM image offset is the 32-bit value at
+  `ROM_DIRECTORY_OFFSET + 8`.
+
+The PCI ROM image offset must be 4-byte aligned. All offsets are relative to the
+start of ROM (BAR0 + 0x300000).
+
 VBIOS ROM Layout
 ----------------
-The VBIOS layout is roughly a series of concatenated images laid out as follows::
+The VBIOS (PCI Expansion ROM) is a series of concatenated images laid out as
+follows. On GPUs with an IFR header, this layout begins at the image offset
+determined by parsing the IFR header. On older GPUs, it begins at offset 0::
 
     +----------------------------------------------------------------------------+
-    | VBIOS (Starting at ROM_OFFSET: 0x300000)                                   |
+    | VBIOS (Starting at ROM_OFFSET: 0x300000 + IFR image offset)                |
     +----------------------------------------------------------------------------+
     | +-----------------------------------------------+                          |
     | | PciAt Image (Type 0x00)                       |                          |

base-commit: b20a9b5f9c4baeae0b2e143046b195b910c59714
-- 
2.53.0

