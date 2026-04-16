Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011006.outbound.protection.outlook.com [52.101.57.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFB01A9F97
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 00:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776299213; cv=fail; b=WUxmijqhnGT77wOytN+bKif4Kuc5XefK04IEt2S4hsDUIIkhGieaGBshm2FrpTBws9kmWG8rMxttqG9dTbqiNA9hhiSAj8igsZ4l3MglWb98oAf4m78oOIY655i+hq3gmPiXO+y8fDVm9a6dNE4+EGRmZxF26C1OxVkBXwXTzp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776299213; c=relaxed/simple;
	bh=e/6rME3NEEpVvTX3WR9XmHb5EYTinIFhd2EnsiHfhSE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N+F2YB7re6Q+ooYeLQe0oOagpnB77BIrS5kzAEYa1MGSovgZHM7X1UjHPn/En336/d+AA3n7u3TAeSay/013EBTsemncALBBrm4stokEZn1wRJv34qxSAtgyc3siA8fNr4dQE6MKmD6Q99Vi9RyrOHsjYPbls7T159Tx/mNCKtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rQSfS47W; arc=fail smtp.client-ip=52.101.57.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rQSfS47W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHUeD8mDuzH+yEFHvCCiWw4nbHKsszljWUw5HQq4Dm4EU+aG/UuA3gpSAFOb2TyeSwnsehpJ31xewkBSMGRGOK8pGtc7xf5pFciomHQtKq8e6XhKpFWwTVNbjo7Vc5Z+L0+3dFhHn/KwKQvV0ouwKyGCUO16zjX/ytPB/+zxXyRRTq21jK3e/opc50LhhqLG6xS1MdohRKyEJdH7rKWQZXXu+OMcsWTfMhNattB+6lVrpiTC0hyhIMBNydNuuJ3WJd6d7Y0jG8I6PesV0GC1UFg2KlZvR2xePQDGD6PNkodlfqhlxoh2tjZt/aR+q56tcNThUndND1wDW5gF0gSX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Z/Tx9bM3QAkMvqPx3O/nCcDKkV8WXwDIKDraE+WIgM=;
 b=kEcjDKI7aqQ5KZfVz64Tvf20u6wkQnAOppsey8bvWZHS8NeDgQTLEHq1JwvcwYq2yJszhNHvFz4KeJPCY+GdQrqL8A/Alo1ptTbvanTOjIMp18NQuPL6/fwSYdsgG+TrcGYdH4wHLLbvHcILcQXtfxIntXOxEwWstigVvW7nfyJe7l4ppTC2bE+phhQeqT8E5Dt/p7Qysy4gkrkFw9GuwYwXm7fLzvEeMojvMEVDnTZmm5Jr5SEmEK/rSEiVk5kzdy1IKLsPFHhdZiEKP3nOPeqEJEHjtuXUXKAPtRV0pQHI8joJO8yMM+12kJ6WrnD6UbxiY2eU2bixx/m2GdIOvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Z/Tx9bM3QAkMvqPx3O/nCcDKkV8WXwDIKDraE+WIgM=;
 b=rQSfS47WWUm1q57JOE18KSRrjtGioOgcOxoRglBpP3c8il1uEkWHJOaJEJGqHnG06ALba2TZeGLZPLyCF96nqbW0q9hiEWvUeuaIcCKJqSiQ9w5tlsiGY9l87KVLws8uZIVq5a+IY1cmyxJ2t2d1EmT4yvzmNZ47y10fmgg9xpejxb2Tg6IHVl3tTcPL0KgDZaFK8HVLem/or3AqMUbBKfGly09LLidOmA72iqrhHd4lq0q0XOxuDZ5j0FBnJwVXw503dLQwOHDjHH9iDEJ5uZvAuAn2t9/L1wMiRjbrKtRk7RVWYqtVu66PUXXFNZRvGWWtpLSQqKS5CaKRuob+cA==
Received: from BY5PR13CA0002.namprd13.prod.outlook.com (2603:10b6:a03:180::15)
 by SJ2PR12MB9243.namprd12.prod.outlook.com (2603:10b6:a03:578::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 00:26:47 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::d8) by BY5PR13CA0002.outlook.office365.com
 (2603:10b6:a03:180::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Thu,
 16 Apr 2026 00:26:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 00:26:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 17:26:31 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 17:26:30 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 3/6] gpu: nova-core: only boot FRTS if its region is allocated
Date: Wed, 15 Apr 2026 19:26:16 -0500
Message-ID: <20260416002619.900779-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416002619.900779-1-ttabi@nvidia.com>
References: <20260416002619.900779-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|SJ2PR12MB9243:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db36185-5867-4044-5437-08de9b4ed85a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8aJUm47NchMcHzPby+1Thx4JngEPv18kagAHtFXbI9bGdeNPrCmiNpEh6/OOkJrOlE6zDAzqzbyb8o070jwIzZhrTUlNi4pD3viTDKsHEJWsreC5b81u1lWsscHHQyxbQfflInuIYXQ8NMKU20I7kUHqDC3/eNQvUeemTluitEC8IJK7iyeXLiTlmBFSLZVbrlnrOcan2JS5GtPV90VzXk0Ml11zFNda2gAiF2XOs/EGPcavK+ZogLW/CHmK8AqIcDIBB67XoXNjZIq2UoWVMOPUBMvsVPqsG3F08eEBd2KMUdvtuUSugRUQims9gsaaNxu+7z8CoK0/0rBNUn5KxUKN4RFz3LnmCUDqXFBovXJNG21hti99U2cS9ttSXIdrtY0jRQ9JzoMwwkaAJS0wkFxCbBMLtzM5Oif5L26SYCteLlwu5PnW+DHo4IDxYQbYCIorG+XWq2CreY7f6Vn4gQBPpc5yrJzM/eBRU6LbRsMP4wg2/xE0kF04EgwsAUGdCCGYEuLhKNQzjtHgE6R20gwo5BtmLEr+RdP0PnudUu0rLOpoUhwbOm82VAVXwo/em4K72ZqfXwMZ0FDSpwRu+hmk34vJrnzyX4bK7Z1FOYyIaSozhAK7uAdD2hoY17VtGdiPAsmD9JN2grOJfR4r85YX0738d/Ywr+DB5Ubr7fbpQYdBjaZnlB+uu1WerYDS+kseRct15EtSwM9/tOfW0BK+eXLm+4VEEoImNrF48k2Y8Ghb8IT/1QEgiOd1+eu22jHTNfNUIxE3T8fKHSVawQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AteE7yhILlDnScnP1bUoznr/3OR89MOCbsKB/2wTXivScHLmLTeVB+xzBgyaqz/Zete6jTx6uj8KgmfRvd+N288fYN2NyGgGtU8Gyd64wmqAsogHbhj20Dn4vwja4kWMK1jsC/gqxx7VK/ArEkcvjnIeK/+DWisB9yJb3AnANr01mlc0hkq9RWdJLNhOyMM0tteEgkLQpup4bDTfgIgRvtXIndVBJ/OpiKKL6RRN9VgWnRcrKW0jcBJzQGaRL9feVqgDd9wuA+BJn6++IVKTQ9Misyn5rlJUqp4HMvBrPpi3slyrOpPz3A7TYyar1plj5orBMY9/8HwT+R9u4ahhnykUgvOCR39rn6D/EawnMDvGHMCapdJKlfvhBp4sxauIXf2AurXV6kl2kdkf0N5jtbeM6PqiffVruKZtc+IyHfa2EIhn0X4fVrbqIHeWJp1c
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 00:26:47.1731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db36185-5867-4044-5437-08de9b4ed85a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9243

On some Nvidia GPUs (i.e. GA100), the FRTS region is not allocated
(its size is set to 0).  In such cases, FWSEC-FRTS should not be run.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 18f356c9178e..5c56f0539dd7 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -155,7 +155,10 @@ pub(crate) fn boot(
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
+        // FWSEC-FRTS is not executed on chips where the FRTS region size is 0 (e.g. GA100).
+        if !fb_layout.frts.is_empty() {
+            Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
+        }
 
         let booter_loader = BooterFirmware::new(
             dev,
-- 
2.53.0

