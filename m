Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010049.outbound.protection.outlook.com [52.101.201.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F673921F9
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 22:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769121099; cv=fail; b=mAAVA9SkEtJE2IT2WMorWg7+a+EkxRpYrWTj/kexPdfogYKJ69sIuGCl7npB/llB9hmUYtwD7SshSr60F1k6MUFRPrDUsgSe5XM7GA/eg2JKmc7Ox0Aj+QgRcPtIk3M5HAnGc7e3MmDp2P8WV/duJEFKDpEkTTXaeicmsntqKIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769121099; c=relaxed/simple;
	bh=xRFt6hTHejrzsDzMTJGMpu9xLmLEdvGs0xErMnn9WS8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iu6HV1v8ZL9onlVgNRqsolxs4P/ojCtUbhegg5NG2Q3J9letwRr8v7hTbHN7qNJioRXUFYsJAsuO7SbfQbM+JJLjmddUXfEjo1DnwVCCCkKWnY5ub2mnp7Aq95pSEk7hUkwIzZc/kMs9kJp6TBlB+wb6tJLrtZzur+syE58wzIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gmZ1O0lz; arc=fail smtp.client-ip=52.101.201.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gmZ1O0lz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Clvufo4Rz1+C2Dx8n+V7GWefp8wTVId/nzzT5Kv9Oqymln7mERozm8h70KS6kOWF34sVOfmxWkURnA8JxzLbGGvQNqAlhK4vUMJyEx+FSzCLyej/pgLtQaf6Ql4AAHOULJ7y9b++3DWt5LViXqNcvAV2as3GFE6d6khu1BflH2iGiSB+/y9dWn/otC3eIRSgWEKSC3Jy7oD6T1iSyIz2ZGELz50NqZom0vBk6YQsbcvmAyXvJOfX7u7enyLfyca+BzKfHaAn7wwkW7FvxZpoE69PwVH5BOB29uJRR+pYb+mICO3WDZxZ690aiDJirCrPBmt45gpKrzvyBnM3a/iMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NWuJuEyA8t6GXfVfy5OugPJgmOt9C7v/vgjLMSjIAk=;
 b=dKHaLHSxrnPLKWlYUErC8PhXNdDIhtBS0Y9eMcKF1Gl9kue1CJC41vQhikG0x8RcWH1Xx93OwLalpSkwOTuYGQUa8M5JP/pIpkPjhgOoEaTOypVC/xMgAL0GrN+1jmWKrZmr1hTaZo0mKLom7Wh0YmIZeSkrUMlwAF0Eg3e4/okOyfEUg05K4GfPUOdXiLuEcylOorTjZxubMB3Wze0l74yMWZZTuUMGhQpg+zSMr8N3evuxUhzvBdrKhramzA20a01anYGprblaA472W7N27XE4J8uC+aXlg/5rYSweQXCEIHdFTOukHdK0NdM17Yila2CDyIjVKCJtHhqkjbvW7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NWuJuEyA8t6GXfVfy5OugPJgmOt9C7v/vgjLMSjIAk=;
 b=gmZ1O0lzm3c+MHSKf/WMqNGgSm3oQfi/J17Rn4eSs4Tc+8gTtl0B3UDU+163HCGnOBmYZ/P87cUhE/0AYGOkoUj4GYlKIlEVUOYEmXZ8wHy0TMqX927GAwPwZxwAiFrfNVibbsu+wVdYD/4T4n3GNm7GAQ7/NZ9y+6+OqczdOSpXGsJE/FFqMynWPz1Wu3hCXZpqGkdRhtjT8TAPzVJCA8sKnWXhFKV/s+31XM4+tnKb/fM7XrUaobhC1V85qzhCXhb6YZL8wz4iYF0Ay16gK8HcYMzJUzwyl7uKeFHKen9m52DsLctHVuCQwysBDp8AuAMR+Kcrsd8pyBKyfgMFHQ==
Received: from DM6PR07CA0047.namprd07.prod.outlook.com (2603:10b6:5:74::24) by
 LV8PR12MB9207.namprd12.prod.outlook.com (2603:10b6:408:187::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 22:31:26 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::44) by DM6PR07CA0047.outlook.office365.com
 (2603:10b6:5:74::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 22:31:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 22:31:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:04 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:00 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v8 04/13] gpu: nova-core: add support for Turing/GA100 fwsignature
Date: Thu, 22 Jan 2026 16:28:39 -0600
Message-ID: <20260122222848.2555890-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122222848.2555890-1-ttabi@nvidia.com>
References: <20260122222848.2555890-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|LV8PR12MB9207:EE_
X-MS-Office365-Filtering-Correlation-Id: aca4d387-bc51-4dab-317b-08de5a05f9c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S6PKOY+wtLkjiHPBzP3CqBvP5F/n83XJbN7bThATgMxNDa8TzOCgLERgO89a?=
 =?us-ascii?Q?WRqTDYS1Nc7UYK1g/e3kL3IBqLeDxU1E4vDmOR2WnThr/wYJqkIrQm6XK0V5?=
 =?us-ascii?Q?DNyS4noKPQly++UC0aDLpHDC72YLPy4kvrkK+YMMLHJ43Xp/GZomh0CDWUVz?=
 =?us-ascii?Q?+AhH9b8B1z/RTq4IzizzFM/btnt+6+FlY4mstHnZQ/qZA3/cNzyO9wJixBll?=
 =?us-ascii?Q?nGif6fo/1EdHfjP2f44h+ZTdFGQBhmoZdqmwrqa188fiEy9GlOmByHZe10T6?=
 =?us-ascii?Q?YeK2gTF0jQ+7p+jYaHlnhhLfb1gSP+iEeiCImqTOyEuXx9vBtqEguhtXDfqK?=
 =?us-ascii?Q?IlCC1IgDwrJP0qZDza239Giqi6H8PQsjVufue0R4tYvRvi83A094pXsXEjM8?=
 =?us-ascii?Q?HICTSev/jhDYVZU11a20T2Xvd5WRZPFzy6ZavKwtBT6VfnIm6IAtTlDx5Z9K?=
 =?us-ascii?Q?rpRpd4uNZIdv3aC5d3vlhk0S47N3y+wRezWH0l1aeMJ2lyz3yumGZNcZ51L8?=
 =?us-ascii?Q?jL2ACWsUJGRbZIH1DJ3EJEbWf7nCukl8N+czaxAGHVJctC/mjhHf9JInEMLG?=
 =?us-ascii?Q?8xuBujT/rA3lfPFQdYwJMP7WNuSOkn5FhoVm5BNBUlCerEyYxaoZTEh0sxVF?=
 =?us-ascii?Q?E77bxoGIDUQUxMMG2JSR9BLD3cqoPKScO33J+MWCc18MZsIEM03tVMF6U1up?=
 =?us-ascii?Q?uCzAwOyuaSZ/RX2w4efpdV6JjeGIcmU5chZcSmkygKePPM4tWbe2zr4lzNsb?=
 =?us-ascii?Q?Hnz9uZOQFersQ6YQpD8ZmtxJuz8QMJlzTp3NXsZgDUICA6xR11hSPHNPR3AL?=
 =?us-ascii?Q?RxLsiZCsG9KwqTIs+HDAWa2lkTLH3M1VCUYQPp+l1tdL2EvIdgtQkznmQqYW?=
 =?us-ascii?Q?M1yk+PgmAxn9wdNNje/JzprAgzCf0LjU9eXZqUQP+riWdHpPuHIRF5SJTpgK?=
 =?us-ascii?Q?WwBTy3PtVl+k1po5BWstTAAm/Yq4ZKhxM0jJ8BR63fOUeLShr1JAYVWC52aa?=
 =?us-ascii?Q?1vxuWLgysTIVPdijoSQDJnTApLKaAGwUfQkxzFl4y5Tuw5zCprAWw0yYlST2?=
 =?us-ascii?Q?tR8x+q9VgrS4kJHWZGqJvAYJs1cCEtDrsh4dO/hTOn36qyuxfvsqp+YBcbEM?=
 =?us-ascii?Q?87XlYuFlFvkU75PeXhbE4nYdVKquay7dWa+c9g/Mt1849QcGtvD/b6jAyobc?=
 =?us-ascii?Q?LkvOW1z004h9Cy2XiQzof0LmmSXNUIiLsGFsQFLsQIlJHYPC+sEWWN9FwQI9?=
 =?us-ascii?Q?RTUs+HVjiKpISjVPxtzsgWfqlLqQ//JGIFUsjHDfZBAW3j7O325Fi37wwheF?=
 =?us-ascii?Q?7w6TZgOUG8cPA+ZWdBa5fWjA/RGxIWxMzIiq6suZqLTr08NzGKLrKFW2oXm0?=
 =?us-ascii?Q?Mk+0nBourWZvFdGrsDj8ZG5NMXjz+JCzwcMjc1M7WPVL71O17/J99FSG9XGQ?=
 =?us-ascii?Q?VJhBTqqiGYtBOjtLeLBhZZiKXfQg8vw4dUC4NkswNGTKZZTmQtykUKyWoG5+?=
 =?us-ascii?Q?Z6kCvxsoqIIh5bU2jLo8NwOj5IP6tKT/gxN25RQtG6YS4iCCdZjyP/90obhn?=
 =?us-ascii?Q?M8KaG8SxzxJ8CfxkdLcjMuVq+0UEA7N2VdDOJc1LONF+8fQ1NJbDvR+xQwh/?=
 =?us-ascii?Q?+uGQ/vUGY2KxQ0Anrorisi4kDmDxvyWpAFaXMR6sdgNZxuyBR+wLJKEJdXVM?=
 =?us-ascii?Q?mHZzYA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 22:31:24.3945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aca4d387-bc51-4dab-317b-08de5a05f9c7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9207

Turing and GA100 share the same GSP-RM firmware binary, but the
signature ELF section is labeled either ".fwsignature_tu10x" or
".fwsignature_tu11x".

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 1025b7f746eb..beabae9a1189 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -214,9 +214,16 @@ pub(crate) fn new<'a>(
                 size,
                 signatures: {
                     let sigs_section = match chipset.arch() {
+                        Architecture::Turing
+                            if matches!(chipset, Chipset::TU116 | Chipset::TU117) =>
+                        {
+                            ".fwsignature_tu11x"
+                        }
+                        Architecture::Turing => ".fwsignature_tu10x",
+                        // GA100 uses the same firmware as Turing
+                        Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
                         Architecture::Ampere => ".fwsignature_ga10x",
                         Architecture::Ada => ".fwsignature_ad10x",
-                        _ => return Err(ENOTSUPP),
                     };
 
                     elf::elf64_section(firmware.data(), sigs_section)
-- 
2.52.0

