Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013029.outbound.protection.outlook.com [40.107.201.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88B53A3822
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 23:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776382315; cv=fail; b=amXhawzSPoaS2QpTBMScfcgeMfC3Ki/q/HV0zDD6QQg2C0Swpm/f4Im6TyZxDFtAo5rEuUuLvMglPWLZ4+x1oSNziv2EZ/NLaB38aqN4GAjR3eAIJtkrjMCyPnaiZaWyyzh4KtVwLsX7Dxhuc3iEzOPHe904fYaW5bkZiJpMdgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776382315; c=relaxed/simple;
	bh=k/rUagfYaAmMfTxffJW34ApSjhTt34YGcRLtVG648rU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bOkjuh3dJkx1qG3ATPvxhSrLpQbCaGWEsc1EhANHSgdXDs90O9seoI/riyDtbWTSIkFdrOSz5M9z42zg9/zuPE0pRICjA4EQqr7MtK+fYSLwHjnPC+vXqDfOyKm4DcDGcr7qSvvSMcsd1Rc+U44DVTzYAQyShEBkRf9VFnYqkUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LAg7O03V; arc=fail smtp.client-ip=40.107.201.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LAg7O03V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9wUafDs2zrL8fR0KlXXclLSNmIUyOhu6iY1la0MumaizLyN93oOwx0if+C4wsq9Qx3k9sz6AHKgtA6/xPfpTN8Evsnx1R/Lgxb5Gz8gXuQjiMCnwKVPRpiQclF67927czdSEb/lHpzcwHre2Gbs07cF/wC2EIpASU4GaFAxVppx9rMee9YjvSi7MwlQtDbg7qXKU9wF443USnedvHblzsQY3l1zIUxgBqDd27Wf8BW9RLh69kZtrLB6UlBKhnMYpfwRwLTsl7U+kjV/RLHGMPIk57ktehMMBehqKNOYOrcs/hfTfa23QuDeUvhG0RHn9CXO3gawCQz8OpzndLWn/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRuZ5oM3Hp/ayqwRX9GjIkelUmWf9NZOJ/uEi3a55Cw=;
 b=ridx/yzuKx0bCA6gUG2WcwWF1raFieX0a1sNQkLi6Jv6Zn/4B3toaDBCWmdR2RS7HCxC5yQ/fstdpeL3cOCv/bqrQSgCDc0kUwVmuyq9FPx0b5Cv6A+vkO4P2AgckvlIobXXJN6er5f5hmifF0FTeNwQHKNWnhd4TO8SXkSNMXnVKjIPyhGU5GTl99rHgU1U5RHvInL2L/6RMHecJ2UtW8uCQ8g4AKXvPJrpkTIkP+gRiF5TyRx7W75W36krVrwbyswwTM52cpw5HeV4dwTc1e3tbSr8EiyBnVRDyZ68zKqHIJPZHB2XT3YVJWkW+ej+gR76pJre0tpWP5+zQTZmWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRuZ5oM3Hp/ayqwRX9GjIkelUmWf9NZOJ/uEi3a55Cw=;
 b=LAg7O03V17+wNracK/5IIzg7YK6+mSJd5QDQS98lsueYcDiR1DMNoA3JnV503gIYbqtlfKfham7Swp2vGyj3+u2nOH0l/6frzUSlJtoBGZBYabLEB+PkimG2eJ+wymi0ImZQ8h13zzmbFtlrKQYgzg4dgzzsvv0vYlPsBKIv+rduAWvDePww7KnQugRjQfnW2j4D+kaCuHNXJC6J4UBB1i7p3jGl6z5xpHv20luA/4M+Nm8qbw7bCtPAHWywRxyEarq0Iuupg+jGXZuvDdeHD3pKVK/ddfw1NMrhG/Wy42IDIWFLAvSPtzStfYRbFv2+WcRQUZkm1JvA/vJuXWvnTQ==
Received: from SJ0PR03CA0121.namprd03.prod.outlook.com (2603:10b6:a03:33c::6)
 by MN0PR12MB6003.namprd12.prod.outlook.com (2603:10b6:208:37f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 23:31:49 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::2b) by SJ0PR03CA0121.outlook.office365.com
 (2603:10b6:a03:33c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 23:31:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 23:31:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 16:31:27 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 16:31:26 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v4 2/6] gpu: nova-core: do not consider 0xBB77 as a valid PCI ROM header signature
Date: Thu, 16 Apr 2026 18:31:13 -0500
Message-ID: <20260416233117.1057427-3-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416233117.1057427-1-ttabi@nvidia.com>
References: <20260416233117.1057427-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|MN0PR12MB6003:EE_
X-MS-Office365-Filtering-Correlation-Id: 805c1d3e-8e54-40b9-72b4-08de9c105508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dil43OM8wfjwxfV0EEBQ6aQYURJ/SAwSJikw713rh7RQQYmvW6E8DQgI0M6ddYJqEzUm7LMcmg8lB3ozt7UM3898o5XSejv7J3cpJ+ogfJagJDEXgU45hJikBVrml6uA01IpkvF0QCi5IdA0wGW0x/xIv8eMysFIFJBXN97wC8UR9ft8Ddz5Nx0riUhUrMYccpMNvXHOWBXH/+2y8fH7kw94W9r/OiD8lMkSqMHo+/OJHyez8C7Kt6MKgbh3eA7kGAP3zGlC+DeuAA5wBJMW9e1ev7zJUz7s1302W/aZrRTqhYhxTOdl1AxiT+2bDHgZ6Az9ytMTFNbAbgB4susGZPZbx1XbSgZQqonoFYNqFAg/voF6P+26ZWufA3SKfs2wGr/vm48+CxZ7CrNbIQxfRDN9xYUnFQIVMgEbVb8OH0WjXSnK1e/lk2So6ryoq435dvTaUj0NXYJfwwFTvjVFyvDfZKsIHsSsoJQUgaWF0cmUBNS3Qtjrj0QkDRAgWCqJthuxwchrBqRutZvUGTeX8kl2ILXraJ5xMVOc6KSXUdIGZUmcjnU+vIEEN/a/vnDBX4YIvVb82pFlVC4VUYBZGgbnv3QuG0rFw9ttEjUWRbORP8yywYvwZXWLIfG/4crwcv1Fq4KrFW6+TYLJnEmicddHuGgMrCekJi05tPRVKXgpgReRyvkLfIaDzVYZom+38VHVBaBM8VjcR7L1Nes876VwxURqp1yVr/AftZ4m06nbhVKQewbtpO9WoQQmqzu316I/yl/M5rV+ArJSBWpchQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/8VdM0o/ky7YyS6hn/72RwuIcZjYO/ABrtS56WoVVmmao0n7L9xU94JfgTCUdNj7ittE7zljoidsH4A1bcoR0KWgDxytxKPUAwneYvEvUSmUcq52lnVfDvjq2E7iZQjXEOpbMW5dq+ab8l/jDy9nlm4pWWSn3duUcsPKekk9bqAs3oBj8ZTh0HKO/4NLZkgg9KT3DNkBFFI5McV6/MomEjyO0o1iTnnMwRgOhV6KKzU0OrxKiCyAN5xNhO+9G3BuMxFT/znaIbR3D7v2T+B6dFGqbUkpb73pTTs3gOndYk0DVQY/xJ6hVAaYSgnMwkIarprJoM1jtRGGMUk30LkFa5NNkZCSw8dhTZwZIJup+o5iZ5i/yQgiwCg4OOIGGBTQVULctt1bve4NFSFTebF/l/z6/2OHPr7k0l5+uokjgWl7+jQxA2kuB3a5ud5F6FFI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 23:31:49.1820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 805c1d3e-8e54-40b9-72b4-08de9c105508
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6003

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

