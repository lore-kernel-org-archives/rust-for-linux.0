Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013060.outbound.protection.outlook.com [40.93.196.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D519318121
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 20:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775853474; cv=fail; b=LvuZgFujRsAvoEHSxYi6f72KbLbR1dNuIQBVJ9fUCq2FlPW2XJiVcxIwQoyfPIdFPJW2jbjojQrfFQYmGb1q1lrXIyiFwMwAR3mWlYBxW+Gao+wk+bxSaxp/MmUCSzISEV0L0XGTDE1EOv4sKadfH7Ayc3wZYDwBoufuLACmMQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775853474; c=relaxed/simple;
	bh=FK9RUVVfQ8hzqX8oUN29jngbO7NZT3McxLYLCPqrTC8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VB0KUhDyy3DqFaR9l+/wU5xea7PaWz5ZB6UpucP00ay0iCcyPXlEbZtHVQ6Zw6drgp7OyfQrpEwbX6QRnWmarVh1RPuE1fdLSfCeP2tcLuVxu7bobo+53L1aWLPwlS93H871sWblEVXgOMunzVGUn/Y1YWt/CjmU9dWzzYA+q4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BB8Kuebi; arc=fail smtp.client-ip=40.93.196.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BB8Kuebi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVK10mkozo4/SZcxaHtgEcxG0AXiSl17voi0+VctlFJM55O1WSvK8K6XnyoJhlCBnoLoDA08znS3QCGtZU2fwa45zu3RZ0Xogz2cV1xgUvEAaEtrqO2g3+WC8Mb+EEcNWUFG63nWkJ6A4HHUUyftHsWUgCZsZzNcKcQ2o/VMq1ieo8wipYP2ifPly/NVYjZbkBy3gOpDkNsUmhA6OLjEQhSWdf9KG/j7qPLA6p0bjxtKNAYkhTqEtsSI4fC4RT/ouORu0JbX3EpFH/d8gTcXWQMs7abS97KrJ+ygWyN5selA6ReNt0bYBZLpCi66lY7QcEdNt49dtnD5X7kNY3UgNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWUiOhf05YzaHEZ++9GkBkUludTPeFeXCyy3lL8j81I=;
 b=m84mWiDHO56TOHQEwkMSeMkNhDFSXXumC/v/VSakHnHsaTdGqS7Jr17Q0oFZznHtOCnWiZ6rqK7EpgxB3nV3NS8letV7WWlesQpObdgKw9/fS43aHAtWGL2AxN/4BjFc/f0d7Y+i4NnrR+6niUj1OVSKdEfprhto9I03nDvvAk6FjUmW2s/ASL9GXjUNkINabYXUXpS6uq7gj8wUX/SeWLTg1qULAK7XOz1ZjbXYrUuyPGtkj7CzpXohkjBuoinVCdPdwG0rBKgofKFL8qTey1rYWRUv8M1imtU3f0nTQ2mOiAcUjd7yyYcUsVZxjLSyaj2wk3407euYlQX17JQsoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWUiOhf05YzaHEZ++9GkBkUludTPeFeXCyy3lL8j81I=;
 b=BB8KuebioBq+xWUrzQZzDwuL95AwYpONnAQmpbWAcJbDZzA2j6PxPqenRXA/nY0SMJOjKIjfmQpkbtcP7xpMdd+ttvmDDX3XwA2ixv7Gn2XdIbAcDZ/fKghB6wzNqQ561HAUPt7+XVC9sdhHVzrR6q0qUPsCxiDR9DSf98gFoKI0hdi53abecYU12FVnfDOnKPzgP1uzhVLXzJQImkpxfpcEvRFAkIKxU/AHWPIKuy0NYXs7965oGGFhZJjHFE+vlV0Duy62K1HlRCMwbkaycEm8jmhmVaA0GD+z2LtpxeW98q00P3Hbz9re32vX5wq/m3c75P1wt5SsdRZM8QlgBg==
Received: from BY5PR17CA0027.namprd17.prod.outlook.com (2603:10b6:a03:1b8::40)
 by PH0PR12MB8152.namprd12.prod.outlook.com (2603:10b6:510:292::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Fri, 10 Apr
 2026 20:37:49 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::20) by BY5PR17CA0027.outlook.office365.com
 (2603:10b6:a03:1b8::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.43 via Frontend Transport; Fri,
 10 Apr 2026 20:37:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 20:37:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 13:37:33 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 13:37:32 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH 2/6] gpu: nova-core: do not consider 0xBB77 as a valid PCI ROM header signature
Date: Fri, 10 Apr 2026 15:37:18 -0500
Message-ID: <20260410203722.1586938-3-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|PH0PR12MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e719c1-96a9-4f04-81ae-08de974107a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xM8ilmxH5cIM10TiQHVjk9oSfTzGeot2e8f7GSJL1yQOdCuGFAtXkwdl+nT7D85tI0yBVijd4jFxOcWUGKQLAANHb7cWf/bry3y7PJNlCk0ZNVRue0kXLxPEgbkpX8TtW3aibjQfXCHZE705biy/AkG1QwQGW5haJJwS6svfe8JDH9v2fgQsjH3h5gX4NticjxpsB7LcT2X4fbQ6CDcNtDD6BcCP6Qbsvwnq3erconGv1J8AqdCBGeTvA+9Y0V5H/gHj6PBdPU+VLAJ8v23MO5SYKmtbe4tM36sVsuDo9nA7LPa0+9x+jW2bHuMs9mJR8dtQdVDcR5X2WmbGYXxNp0b5eRSEL5TDAz6vTHnD//hjAsv5uCKIZXIQssV6kFY31ZzRzuPPb7c2uP34Z/CMYQdqbtjDLD8sDOeCLYKoaLC8ghEp/zhJeZ9C5Hkmy8IcktrEn23i/0bt7uQ/Ar2wXbjkxF1qLA+v+UxYs0WdGb+M3Ev/2GE5RgIFaaRKBANo/iEkm6vXpIUVY1nI0Xlyaw9BXKzeJfHJDvq9uPOHDu7y6x02D6CZKarlF7hL5W06kx/HkRRW1OTX2QaZcsGqSstQbSsTNfs3O6IcROJfhfD5JUsoA+/N/zyyGm+bmCJCKidr5zGHwd70dZO4gR8SMAEtWJuu1Prxs5x8CeKtKrfMpDOXru7CgLtzsUB2PKJawdNWRFUuKvL06+V/RvJ95mQULm6J6NnlQbgP9ejZ9+bm3U3J0cR9RywmBWmtbfSZ5yj9i+nPNIt3f05WR+fRmA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NsBojZyhtUJ1a1OkkW/cN28or+DOEXc4h9qvLyGKAJctD47PfPnnJQJ7pdJ0V6GHKg+HHrJBg+6wgVJK68k//pqv6t6Ab2JY4RqYG6H28ieMtQDjm314e7v2ErrpZx2gpYi9YYXN5CN42QGNq8NHha3lEwKLjPXgNc1CdapnAvtE/5Zw2Cnuh5WtNOteZMQjfnhMF4J6kJeJ330zumTGDNeaxBsBJXjEiZ2hDnFj0stEq5WWfZLPX3SX1z+ExHBxYZpBlfxYiPxf97xFFY48Aw/jjtU+dT0jrYOmsVZHu/IdiO1osHAZHmy07SJu50ZFPYuEv3hePY10/pHLs+zgrCZU9m3UFRMGZlPRyGKC0dlV+9GwQ+5+S2LGBVf2yfF8d0NZs1j4m9ywAE63jMs+FiWs8JdQZAlNG7B1EX1nnEBM0+GQy3Vm+cGPqFbsVpMx
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 20:37:48.8642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e719c1-96a9-4f04-81ae-08de974107a4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8152

Nvidia GPUs have some PCI expansion ROM sections that have an Nvidia-
specific signature instead of 0xAA55.  Signature 0xBB77 is actually an
internal-only value that has been deprecated for over a decade.
Nova-core will never encounter a GPU with that signature, so don't look
for it.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
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

