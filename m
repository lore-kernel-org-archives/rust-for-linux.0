Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010050.outbound.protection.outlook.com [40.93.198.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD911C5486
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 03:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766028635; cv=fail; b=WfWhBkh9/t/HN3C7PxbleF5RrenwPNtHhevW5pYMG/yFhgmzPtxfqzH1iJsr7ZiKb4VbA2/yLhCtRI7IAKztrRuJgPcL2yng+FXdo2T58tWI+6PGmEBGrt2IPbJ9gP4zdRJvnSHEpdoBU1MGN7rZqlzx6O260PEhEV1vCWrZiLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766028635; c=relaxed/simple;
	bh=XXFguUpMYjScZyQWPH7qm6DjrCg579yZwpN5OrknvrQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IyCXFuq+P+gCjPKz7/fZAo6gGvmu+5cCHHemF+T6tLOwdwvRB476igaI6yff5U++5MVHeeuEQiqTvBmWEFBqd0CBD3GVhNaA1OLk2eogNNueB+3SeYVjvDnNk0Ta6l34aDz6C44ACkpktuADV7hjnL4VT2HZM5JcE0UPzzzMpEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i5Ct2K8r; arc=fail smtp.client-ip=40.93.198.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i5Ct2K8r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnn0gj43U37s2Rg8+Xa2M4Z/+aFxTsbgN/Pn1fU8mcB5BurinrIpHKi6f0D38aVC13LtERdH7SzgcyqWVav8PquJ3lM0K7YaRwxBYEu0aZQH7lsG4gsB3pHpxr9SWZXiccVl/r9vVezdRcdDOcipHZrAmqK9fMH3MuvHA8jz6WF8hqr32SW6HaN82c1ALzwomqXR/u8t3zb0EaUr6FRHsJwd0CDWPeYVXs15VzgltTTL95+SxpvyhYkr1Ia/Q8yPxY5SjXCUrp7hR3RWBR6EAsM8Et3hP+TmghT23qE+/m2J/mIb6ScmRz0xPNYfST7id6DBAYCZ34f2aY1eUcSbJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrJwDyt1ZrocoLFIB/dSolyL2xEDFiHlp+HOLiaPsNc=;
 b=ovcB9AtAkn16RgnZFfsYObXnOgwaR3EX3X1uyKu+DzFphW3/ETckL9kvLbbhXRMaPEijtVihB8Ms4TDzqurnWe20Afzcx0uMTffiv6dsA/rVf6CRqSqJAg6uXaUUMAEyCDwwMUuj2AY/EFx0TkNfWihbkveP0AvhaNCrT0e4JS84Todu5ZWCopE0d+ue0lpMCtZw6R54as/Mq+ohKFqE8r0Hxfj5cALkgnmV346W8St+fVX41El4i5aw/VOfSjnYwCq7F9rB7Q7PfoF3jPquEaVN+nTk1pnSX3kdta3z8Hpa+uLPwsj25cv5EivypaV5QZ9N3L/MmOUUVQgrVhHjkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrJwDyt1ZrocoLFIB/dSolyL2xEDFiHlp+HOLiaPsNc=;
 b=i5Ct2K8rjBS254iS9Kar4lPml62X7s188cIsGyvUpF5KTJc3tIcnmAsZFCbkUtLn8bgUz1p1F5loLxt7rMIYA/lVZZdkavc7Qa3tf1eKHpFxnWoh4z2WDxcIdLwSfBJDJ1JVixywanvhv0WiDdo1HB+sS6DrN3+x2he1VYkFEQWdL0AM1ShlXkIzUWOWE1JV45NbGN2ObIa+I1VnSBkTAM+Zykrq7Nhm7u7UXHlf93OcXT0ZB3A6CnuMzL5Lhb3udd1pe4D5hsTpb2xvWkPbte4EGBsDSJQxz3TYErSYZsyimMuGyq9GGoeCJbCzLCbrw+w+nDAHn7M1+QJMcXaN0w==
Received: from DS7PR03CA0236.namprd03.prod.outlook.com (2603:10b6:5:3ba::31)
 by DS5PPFEAC589ED8.namprd12.prod.outlook.com (2603:10b6:f:fc00::667) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 03:30:26 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:5:3ba:cafe::c3) by DS7PR03CA0236.outlook.office365.com
 (2603:10b6:5:3ba::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 03:30:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Thu, 18 Dec 2025 03:30:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:09 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:07 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v4 04/11] gpu: nova-core: add support for Turing/GA100 fwsignature
Date: Wed, 17 Dec 2025 21:29:48 -0600
Message-ID: <20251218032955.979623-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218032955.979623-1-ttabi@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|DS5PPFEAC589ED8:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ad234e8-347f-4d19-f97a-08de3de5c8d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0J/T1s/HbywV1mFe1BdjnqVNkOh4aScVamb15Dfvaz2dLOKl7gmywShPYofE?=
 =?us-ascii?Q?5pZr/eCbPLPUb+x9SNw68oItWCaNnkPN4GdgxP+7N+e96WSOIygR1JjBTeCZ?=
 =?us-ascii?Q?ivvzDxmFEgtuiV0Tk0MouZF5qdX4EJ7poE+jm+maDsFjTqdIVK4InaX/gIPV?=
 =?us-ascii?Q?931YUbE4jxCEki1FvkhwFr2ZEooOx2BlIMtwXT3Ns6Zpoq/gvyxj0h9/e9GN?=
 =?us-ascii?Q?854W8Oj/vyfxoMBY5q43wPx5ezhQzlGMewB9kD2TVJ+RtMH/tjhpRp+yt0+e?=
 =?us-ascii?Q?VfrufiAxa8DDpMmPnZDvNhj4zhCzYLSwXxBGa5gae+i/eXZGbscl0OVHup0F?=
 =?us-ascii?Q?ZE3wqhYVVYdjUOC/EQ2lFQRoJjdR1e7213CQtmJ172NAKZpg2Lzihu2r8uWQ?=
 =?us-ascii?Q?TjFnRIfUrRMdQdZFTBUDARv3Ihx2Rv9iTSHXSEtye9Co7i9tHfsNRA4u5KXa?=
 =?us-ascii?Q?/ati2jyttj+Ojz78AgbpEBz13G2rtNHs4IJ6Fgpsjz38mteCg+L2DPi5EooV?=
 =?us-ascii?Q?MX1Y62T4Bjek0E3GMABBAe8sCKMXs0bY9WHAwPR/RfgKnObOThDVCM/ejxtB?=
 =?us-ascii?Q?fLrZWhN8PMecVLzvXY51wAbtJRrBrvxWRCuRdExUruYm2OYYwqRhsYb6mlzV?=
 =?us-ascii?Q?7LSpZ+1F8Qi4Vs3ZR0jaAOY9MEKjro7n16M+V9MIPl80Vt/EjDoRYUjh3vw6?=
 =?us-ascii?Q?3a8+Pl00aMV3zNrViY8dttC+sKW3Zmd6uF16s0/ThbfGtHjrsZmjkMK6Wq3H?=
 =?us-ascii?Q?C7zsphFEP3u6CXNHVONqETbfoj+HmXAV27FSJS9GSbXB2lnecMO2GqRROqHO?=
 =?us-ascii?Q?WnAUWYcwTrRSiUlOy0L7o056dXzL2GiFzmqMuAt6mZuRzTKltRnrl6NbtsWB?=
 =?us-ascii?Q?b9iP1am622YOtHM46eo4zFnyj2blz0imM96evGXw1VNjy49g88KSn450MnCz?=
 =?us-ascii?Q?r/uvS/3m3/PO2PvF91FPU0HZPgpLynsi5oTleiX7j2dFPRFrHfd2wGgOChi3?=
 =?us-ascii?Q?+IQMzm1Ep86wtPX7ra5HOLTEMflFQg5x2cShsHctRrcGQuFomlFk/eRRkHku?=
 =?us-ascii?Q?W6/Kc4y18QnromYBA9JU0+D7dQ+iQKh0iH2xBTo7AfxcqqUuKa3XflKBsRLd?=
 =?us-ascii?Q?1OrKpKKDq7QG/wZCQ1G6U8iZYLTJLYnQEvB37wcjgVuaT0PMts0XBBWWrdFf?=
 =?us-ascii?Q?u2zWD6x+ilwBtpWiaEBH0T3ufHqc9H+Jg387bQoyLRD9opLPVDbs5A2imYyf?=
 =?us-ascii?Q?QGhdNKA22Qv8TGmGJzZ1ey2VjoOjvN2TcldIiL6Pkr4GD9drwqSG+QqeG0x/?=
 =?us-ascii?Q?NqzCNzyHUDv9sa7QXi0aqhqwohl+oRriGfP5zsdHQYc0kYSkT/lNrn8G5TRN?=
 =?us-ascii?Q?YVRisnIKGgDGSxc4yiwJjX51zXrRTay2C5R4VwjZQjMSGFnIQX7OUv+O23l/?=
 =?us-ascii?Q?C8bmMy+OpTW9HnBSc5mgeTPUmg72wELUQXEXz3G72uivO21YyBwpMgG60xeh?=
 =?us-ascii?Q?4Ziw03H0QzF2US+sGAjGRFO7o2BB4iLTNJEytxNcRz1DkKPFnXLBxIVixyrO?=
 =?us-ascii?Q?1lqmHP7y/xCvd48xXhw=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 03:30:25.7791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad234e8-347f-4d19-f97a-08de3de5c8d5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFEAC589ED8

Turing and GA100 share the same GSP-RM firmware binary, and the
signature ELF section is labeled ".fwsignature_tu10x".

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 0549805282ab..112488216bff 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -163,9 +163,11 @@ pub(crate) fn new<'a, 'b>(
         let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
 
         let sigs_section = match chipset.arch() {
+            Architecture::Turing => ".fwsignature_tu10x",
+            // GA100 uses the same firmware as Turing
+            Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
             Architecture::Ampere => ".fwsignature_ga10x",
             Architecture::Ada => ".fwsignature_ad10x",
-            _ => return Err(ENOTSUPP),
         };
         let signatures = elf::elf64_section(fw.data(), sigs_section)
             .ok_or(EINVAL)
-- 
2.52.0

