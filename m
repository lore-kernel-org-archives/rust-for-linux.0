Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011030.outbound.protection.outlook.com [40.107.208.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0711F399368
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 23:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776210681; cv=fail; b=FikPMaSw9EvHvAE8mSJu0I+g8ukoi1SOAw/3YOBf9VpgZUUuHVY9I/0MJ1Dz2esut0Q8YL4wc8xUM1PSbtUk6FwUFRzEWhtYzmD5UOswvidRYtQIbjrVXfCBNGH0IHme8m+P0N6jmu39ZQaFGPFOQEq9J45+YDZVWFiTxBjncsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776210681; c=relaxed/simple;
	bh=k/rUagfYaAmMfTxffJW34ApSjhTt34YGcRLtVG648rU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JdQGuWjXYx0rNItHge40XDmgWAyK4fLdUF7aciNHhpRXa8eFBnYHHVfxhc/2RKf8Spsy7jU+MVH5iokD3SjXYHdQMgLk2HNYPagQvg7lgm+tcQjCjl0waeUe1HfxGIn5qCSSf89p/O0UAzjgizmyv/EPVo7ozmT+4WcHDeLZOYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l5786Xra; arc=fail smtp.client-ip=40.107.208.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l5786Xra"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gE9o6ZPJ0fZgc/LprCc7BcgQdZ1e5kJjFJPdX2N1atyyyOJr3jiqVfMtE4Js/ukTDZ/vogbFq+PaKClsXcSLPuu0vHzBprqjfVnoXG0ftrzDIopjsmAZXqDJw6IlXSPoqWanG4Z79jUWe5OpRwchMNJx/gveqPDg8oI+kkA9nZVUApAe+U8yQM3BEb47mI8rjWDiimAcv35VsYy7DyC2r7LGh67mhYsc1nFd/xBb0GbjOzcfRW1/xET3q1JWtIxupAdcyh2jE1CdQS5Yb6bOQckU8CEWWHvUHR+AzMapusTxEpJtSuvJRBIEf40+WI5sLTTEQQp/rL1L6xwd9nIX/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRuZ5oM3Hp/ayqwRX9GjIkelUmWf9NZOJ/uEi3a55Cw=;
 b=Hr8ewc5id9EjluMJRI03q8A+NXm93ia738442xqnjaA0NyN+RYdxV3TdvtKh6V32yDIctzutKOb4h8OjWGoEmuwTE2PVD9JnrVuwnIYoTCEonIfqPfuRSgjfrVJeAY3K7NcTU5682ze1M9W6jv8QQzAUoXJIZM1XEEr6FSDBmpnto0KnbA4oGFxHXorGwdgHB+gh1VrNtGYUhlwr4XEGL+DkUtgnXT4vZlXWhqzTPd+8xVjm0nA9DzN8qQQQL6DHetQ+gYc6l+JcWkQg1N4JWpLqRIQzXhtxoazsrGLxVb1s9KEyUA0pgCdLQqalunxpe8USv7aiIvKQVkA+rWzjjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRuZ5oM3Hp/ayqwRX9GjIkelUmWf9NZOJ/uEi3a55Cw=;
 b=l5786XrawkmxLpYevlLr688QoBCRVQctljLENLVgCYAlw0f0cIJ0G0+ZP3AW7I7W4/Z8DEcBmZ33v+q6Tm9bMov55FDgBE2IpoOuakj5ML5yFx4OboVNKCdfKLD2a0Ll44yQeJL/Ao+TInscP5gWHquJOd9ZJRa9vlh6wD1fW3i/I60a2gQF+RKPXUPJ1LtbRphkKum9Fv17/3RKH1PXTordjL1Dt2YsMxWmJXHuP6xBNfLCAWzcR6chSXD520ydoabDYZXmLsVS2ZX+tpqayAbBvjNXnpxQy/pXrgeDMxqSvTyZYPUatZ2ANsvZxThYjWQLvQoxP/RuDiXwY7ZIwg==
Received: from BN0PR04CA0042.namprd04.prod.outlook.com (2603:10b6:408:e8::17)
 by PH8PR12MB7374.namprd12.prod.outlook.com (2603:10b6:510:216::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 23:51:14 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:e8:cafe::4d) by BN0PR04CA0042.outlook.office365.com
 (2603:10b6:408:e8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 23:51:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 23:51:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 16:50:57 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 16:50:56 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 2/6] gpu: nova-core: do not consider 0xBB77 as a valid PCI ROM header signature
Date: Tue, 14 Apr 2026 18:50:43 -0500
Message-ID: <20260414235047.439322-3-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|PH8PR12MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: 46559787-5324-4edb-228e-08de9a80b66b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3dpxHFFCC6iER/X86ieFxID4ArJYuqHEsvN/e6hdji7bYR2+hQxiraRdd1LbudfGKzHRw9Zb8g6PSXrUKFZSdosUe8+JHcyJkHbuDOM7v80GKkT0Z2tRhKB6P0gZ+dwLYzHzuGbtvGxvHN/lq8sZjtmd3CdOAjIVD1JV2+Rd4HmAdd+gG8vDepV1epDucE2Hqs3gFTtG6ZTDCx7Fi1CJffRepdOjve/na2+4dSIeXufrbMJPx966aLHjPba8rT6KSqzo+my4EjSY3az51sJ2HYhAfrq4ekEqLOxLc0cchV+gJd96SIBcoihbRmQIO9xQMCwKlyEwDZdoolWDv0G/jfc5DYXMfaLVesKQZUvyB2XhcUWGrDqxOj/gJ/EPT00iBnA1B1HeFVyQo0/3TpGXN5wac6oKBemf6FKyRdNayCNGgGjCRjcmGxS7rlVIUkHKwVDKBil5lAXd2Yq0GD4V084mx/cdaqYYQ1dCl3EHqQsscf4VX9ENyU9XVVp5nswnmxZgo4KGPwgTOSX3J1c9YSg9CyPtpnxMf1/UzQhJGkwJJu9/NibvUGnN/0zpVJJBY+BCqDhhVypqEkKw66h+nlrqIW7Sxpgiel/fqKQmiiSDRbND1gHEgjEGi24uxM5EXeHdPjJyPFTWvhGfUO0iHzCxJbrHvK2630QCj03SAzGjQE0sxSxph97ksyWQREgm5EdrNrTowypJ79JYR2eyvV1tMfaaq+Qxw5Tjxb+y795FgV0f7HTLyc+LwZp9qhV9VZ/zUqFX7NBhv4UIaerhxQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rdqumWiIVzUrSKVl6EFgksOaiJFd4jMRypFMiCfrx0aCDBqyKzS60qhnYNNkQH9AyXJ1H9taRirYkFiRcYbOKMAn+Kbxp9nijvQ+x6qTu/FC9EVtxG4hFtMjWPEidfwByaBmaP+TuDZDNBcJfQ4sQ6fYZKIZcGzU8bteadoaUEUsPzUnBiWBbgO/eQ/awbVCTqBsxahsuyP8HRVfMzVx5PV35U3zDmxUFrq2r0BgbvC5jucp6HIGVoMp6/Mf8pfIjaOs1Ea8RdE4f18ijfw71rchvVExyqXdAcuUSf5bsxouIP+vQPZtX6yM/0HGNa5PO0RJgzw5XEqQEvy0oq8lSC8FIS36RcXgictjQH9SyZ6IrMuQMBsnVN0fpFplGOklCuPUwrqXTYf2x/bwMcctcW/PY1QXI3VJimBg+/WTGeXUPSh0cLOaFbRoE9SHa9qU
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 23:51:13.8331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46559787-5324-4edb-228e-08de9a80b66b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7374

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

