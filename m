Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012005.outbound.protection.outlook.com [40.107.200.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08953644D4
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 20:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775853474; cv=fail; b=BvrCn/OtRlCCFn1X0WXva11VjLhqDNE7DTH0yCzsCboLTxFHmM2rvgKQLjLeMDWCBP1EoE7wSgi5jOXc8h4goLbsVdPL/K6cC3dufVXBh26BDtZUWu1itoX6OdCosT91zKaqa+hFCfSaCPROFGnJzS1wOYa78i89mmjABMc81YE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775853474; c=relaxed/simple;
	bh=+z0Q5i2VM4n6NOd3QT/31ta9hO6GRLidFob1QDXlox4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bi7iSTC5/qeTcBj/yrhTS+a0HMcD2SUzKQYeAkY1wgpo8PZ4smAwb87cATpEK+aASYHwCNczj7ZXzPwsEgdN+aH9g90xs76lvYBuHVNABm60FEupjIiXIsvlW/zg5ym71rMAmEpCT5QoS9TKYXjE7LdYQ4EQuUwhrSjlRkW+pVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=B2uMgMg1; arc=fail smtp.client-ip=40.107.200.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="B2uMgMg1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IL07rmmXVe2L6IiwbaK3Mw/eKIsBkrmK+Re7BJEZZ4UjmcD6LzXzSYO5cKy+dUrkvpNZgJb+1ZIIoqG4idrQ/zreadv6/wXoBxmbWbFeCJHT5O4nb4Sw1iEgdHf7WwDc9D8eu8U3qkM1YuYhGtOZ/Nh9fbqiVTx5UoNJ+F+bWaH2Jj8UT6fzGwL09Dzju/PvuTnwlNAyrDkSfuXS5Xj81XOBBC+UQPhpbDWiOl8dw0/xshLRU8hzUYqpDXe1omxl4QtI9FoeYvZSg+gq2Fe1EO2mPH8OZ20WALdtpA0imb3UNTGN8j8MCqWhn0/BQeuhsFL6eg0Kg3lPmw5K98b81Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKOt3i1Nc3R/1q1stwOZ452IpmqBkOsnoMhpTM9QKm8=;
 b=buPpdiZE1MXwb50K+BLDExXOk4xkbfkEeeFs2JoWmj6ZV34jZ+gLOUWYNafWsWNiLH75DbijGkw3nbCNdil2042APbXr/rxJ7ppMFqEn2R6lODSTEq/Kaf9OXEWCFCJgIue9Mj/3Jz0IV8ubC1dpjLzn5IK0wVkga4kqkHrawdXumxryB/DPjqwAGoEv/neT8kSYUrfHICkjk1A+pO2CTu+SK/IMz9r5U/PH3IzQxCw3DntSjuq25gQv/ZMYnPUspF3ruvZHSacKRoOM/T54iCsXRRh+IsHn0mS1RyTIjZhXH+5odZzCnUmzZcBbFH7uT1EizhPZadiL7bUo03xuLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKOt3i1Nc3R/1q1stwOZ452IpmqBkOsnoMhpTM9QKm8=;
 b=B2uMgMg1MTz3ws8MsXQEckyQ/gOV3eXdbxY+qRXf4RTj8G8GvUNxkcKN8lNnTdAmvMWCbho5aB0xzn50olVp+tWnmnJpghJCFUxOq4mzOjhz/zM9RGzMpWu99+O2Z9az7/eNTe+VVIORC0lCLArN9jDG8dCyz+mza31DDVTU5K0GDuFhoR8xJeysEYovjrvzamqOI7/rrN0A9QpF+avQvJ+XVAKsdneOwR3Fy0ovCZnVvwqg7hMzVHwO4bgt182mehCu/z+5CcczEdP72gOwX6evRKORzRKeuGqKq2r5qpjNOBBbOPAJknh07g0mp5Sge4+uQbmIyscyw7hodQAwuw==
Received: from SJ0PR05CA0187.namprd05.prod.outlook.com (2603:10b6:a03:330::12)
 by BY5PR12MB4180.namprd12.prod.outlook.com (2603:10b6:a03:213::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.32; Fri, 10 Apr
 2026 20:37:49 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::c5) by SJ0PR05CA0187.outlook.office365.com
 (2603:10b6:a03:330::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 20:37:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 20:37:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 13:37:34 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 13:37:33 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH 3/6] gpu: nova-core: only boot FRTS if it actually exists
Date: Fri, 10 Apr 2026 15:37:19 -0500
Message-ID: <20260410203722.1586938-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410203722.1586938-1-ttabi@nvidia.com>
References: <20260410203722.1586938-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|BY5PR12MB4180:EE_
X-MS-Office365-Filtering-Correlation-Id: e7ad9615-b82f-41a8-0ed9-08de9741082d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Qv5Hx/RSfhJI8o/V1vDLgMxC+ZvTh6PgPgh3d1sJtFo/FI7SxpmeAsenkP/FM/W/1NAnjkZJA8PQ/D2E4QiVq81vnQq9a2g0n+iTvV99ZEozATnUlV2uf2GPlds98EyfLv1ZD0G4J0dCXCYmES7Rb77LKjiQWLgoMFapDPL8YrCk4OmoUoGiuV/fh1/CN9PrbycNHjicOmJ3cfG91OcPjqIbevvaS58bALa0gmynxiFEsL/4FpN4lGPEzGxYpOYHsGP022vo8OCktuq8DzbNxhbPPrbNOujKjB3qunzltLX7am0YfSTE+aErIFVosn/X494pJ9P7AbJGcr+friKAeArgKkfGdXaj/n8ElenwX9fzUVNyxvk+Ls2nQEN3LSPb7xnSFhOZ7tjrf5eb195A4UNC3o1vEiZxZM0Llq31mAuTk40EhcBS43b6irVjYTTjX6wgHIMJArNpIDOqyDv0WJkm9g6Tc5pduWiPNuqbdpT6Nw5maEubj5HZnzh8/rx5ADvy+acbPb5Rth3Y6HwVErugVJwx1YSjIpbJ4vCtrW8/xACMtBU8EEo3R8xxKTS65OI4ZlSE9OUY/yQR2RUUsFEMTzu7OBN7TQZ4EHCHXftJPex34DzBTxXG9fs8mj1ZWi5b7mxCWl1vhnTAzVUwYsB1V8mdLcOmVQSwIS6NAD+o18s04e3wq2XNXOti5v8iyjRkdX9TDNz8G14yS/CgHOGzvT8x/L8lauSfR67SylUWZjlD3dJg05/fBj6kLT88CDX0Ibf2+VtcppDMZ+iwNQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nHXgLoNsqmltWDBTaCOHNm4HsC3doJKqYXIBQm1CjJ66OXD6MKKmbXRCBmivtuD83W/uCWm+ltkuv80giVIW13enaM6l3lkD916Z3N86/Zcn0et8oOjPjrGA0OyUuXWGmAyEDPN9KpU6Vc4EOqH6P7iY7m0qQbL8Ii3YNEhgwUWTMOFYmmjPcOpbxWpKE1h9q1HZ77Znx2oBvbO0pPJlc8JN2/GhD5fah6Lz4RRF9M+XrW4lqUtIucrtr1aAzi7jp7i052gRPgTccL35KeVdKjU2ckHksaw56ADHJSocEGyF1URuE8Ik4urDwxeXkA/+KHM5XARG3veJtd+SqTX+EMz3ygj8dNYJvxjslCY6yyKNWsFY7Nzgp1tLf7hnbrWaoKTNTOq0AIx55BN8EnTtdu+d6UU6ePCYsmDJkHbwKqguGsox6gGqWqCvcjHX1XTv
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 20:37:49.7873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ad9615-b82f-41a8-0ed9-08de9741082d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4180

On some Nvidia GPUs (i.e. GA100), the FRTS region is not allocated
because there is no display hardware.  If the region does not exist,
then FWSEC-FRTS should not be run.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 18f356c9178e..d50dc9f41831 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -155,7 +155,10 @@ pub(crate) fn boot(
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
+        // Only boot FRTS if it actually exists.
+        if !fb_layout.frts.is_empty() {
+            Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
+        }
 
         let booter_loader = BooterFirmware::new(
             dev,
-- 
2.53.0

