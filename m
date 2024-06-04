Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2054.outbound.protection.outlook.com [40.107.20.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690672209B
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Jun 2024 07:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717484835; cv=fail; b=jptLUE2xU2u7cJh4jcNJ2aRHj3gOhFk54estGje8Lg9Ih0cwg0GQeMfFE+3LZboM0qUkNyJ322r+5kmNZ5ZcL+7oONiZmGMZdCZy7AIKipdWJMHgvX1fZNtBzFDrdX0nabNDz//kviBc4mfEFUuSGIuCPOk1Tths0CseKSwxlvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717484835; c=relaxed/simple;
	bh=B3rvzISbm5w61DdbderYzI/Lv9ACF4ChklHNMuiGcX4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BpO6Ubf7FJL2sAAt5FvP6yyDYkpb112xr5SkQ5jCOTn02A62Q6xq9fCiabctX+geeIjGTQ3PZXuqzpLWGFfWxsZxET9MoLn/TaW7EWjEqShmbE/ZQi6fUCwEu4EJMZzkNf9VY7jv3JWmtpxcDsb7+V6y4bSsvOLwpSO3ZnQEXjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=Z2KK3OVW; arc=fail smtp.client-ip=40.107.20.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="Z2KK3OVW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaPr0QCPg5i/9BDdt6dNW6JA7eWThaFeEV473fm7cBzto/fNQRdyoFlkLGZ2YY69ETQDKDC8bOH/OGW67Bv/SBF+tQnHi34C+lJ4kBwY0PbG/rferU6zDA37M5/e1okLMprFxxb+tHu/dTmdWfaozEu0PUZOXltV6Xn26O+dWCgNvNVh9Mo7L3UFDiMkH0GMSJyb/t/g7aEcVyyALBfAfcR6iE0TN8I/RzVdJaVFFhBEhyiLN5TL5DwOgGc8m+9etvHlZFQYdxXYckKwSgk7kSJ31C3xqcpwyjMFAHG+xv+fzn8w3QeX7nC4LxWBXtPD+UmcYKpP7jP1w+nMLX0czg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpG5GdsahRk8PZx74heFfcl2Dg0GltV+I7L4fKid2VI=;
 b=TqUmq6Inqi8TUj8TP/RU3oLBvqw1PdMEE7QRS/ZV7J+j7CP9OTmA59gOLkc/QHccPYRspcjOLzideojB4UczbLESV7AmDsHb17UoaLD4wINHvMzCPnoSq++d/UimWtt/mLlMfsPdeAtOubCgqN448wrUU96a3drF8mKWSr3VaRmZlzbaTa9D1up3So8Wijfq9XpLVtjY3ITK2Lb3dc5YtUVU9XXOiAJ5bH6afGO4aK7I2qUbdE2UX3/nqkZnDHJqaSpwU5gfS9Xd13rGyumeBiaW4KsP0GYvHEhc3Kqo9h5gMGFLMPLLvI0twIAk9b2Uine3vi/R4phih593ZA5Kkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpG5GdsahRk8PZx74heFfcl2Dg0GltV+I7L4fKid2VI=;
 b=Z2KK3OVWaOG16KZK3poyGz00zsGtFmw1deu6zkbLkQsspnJ/79eg9yGPGUm2Qq81dN21OZiI0e6gsMFQWUwgZap0Duz1LARr4v8kGKKNEQ2KlJiqHdik+JZpYDI4ybC2NHZJszwt031dJlsBSrIODhZqjfguhBM2cajpr5+Zu7gQZht/3UQMutPbq0QWKtr6D6D8o4vtqfu0BlKSWGyPG8FTZ/WzDmLN2Dkz7iLONWc5dO9lsZUomCgq7eN7HG+bUM7ntJzRhZaKQAulJUvAXtPb8iTNLZuwjd3YeWEUL7WLsaFZWIgaKdkoaL7NMXbqW4rcKkCJk+i1D2EmZGwHGw==
Received: from DUZPR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::17) by DB8PR10MB3781.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:167::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Tue, 4 Jun
 2024 07:07:08 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::7c) by DUZPR01CA0008.outlook.office365.com
 (2603:10a6:10:3c3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30 via Frontend
 Transport; Tue, 4 Jun 2024 07:07:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 07:07:08 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 4 Jun
 2024 09:06:54 +0200
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 09:06:54 +0200
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH] docs: rust: no_std is used
Date: Tue, 4 Jun 2024 09:06:46 +0200
Message-ID: <20240604070646.1819816-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.28.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8F:EE_|DB8PR10MB3781:EE_
X-MS-Office365-Filtering-Correlation-Id: 607ac218-7616-4c4d-cf26-08dc8464f30b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uq+NBWx/lnIRJgmyuzTbzbjsBF8DrKgQMfHPDdz904h8YFYkn1e5BrZ1Slqb?=
 =?us-ascii?Q?yQ5etcbvlEngDQuFiE4+etY9nPqSfVPVAvDokNXTJ8hEjEnJ0hnuQELBZgXB?=
 =?us-ascii?Q?aPUGmWri5BzIYKMmaE6G19+cxlQnVlIJCX7TwcBQ8cqEPeXd3BnmCSuSfT22?=
 =?us-ascii?Q?mP+MuZnR+v7ImbNeZT7X15LExwaoLk3Q17T2N0bDkSK2PfyeFczmT/MB5bej?=
 =?us-ascii?Q?rdtvk/hJVmuID1q7hoOjRt6YjWcjjByy9cVGyeT7gMVkuEjtZqRk1ChRgQWB?=
 =?us-ascii?Q?fUC3wwmoo91p/JimrsPC0ZHYJpWd9v9NZRplbaoR6hkgDRjEgldlD9EfrnEp?=
 =?us-ascii?Q?pYbSE1tH/kUxi5TKxZefVzfFAE3cUMMInufbaRY64apmgfPiSbeGg++RoUhG?=
 =?us-ascii?Q?pW/cfBF8XigOfPA2CuRzBzUqafYwPekV+Ursontxq5i1maWSU8SQouXyQyB2?=
 =?us-ascii?Q?tfXnOaJOZ7ORIQMv6r/LIlRQPSoXYCC61KYTQ5xlHMWAviUdoRkHaiG9fXc7?=
 =?us-ascii?Q?zo8VeR2MSs9vHCwJdChIKahL9Zv/nQ0oyFf39aRghRReGgdqWoHgVSYDdsnC?=
 =?us-ascii?Q?Yu9gDG116dKsr0WSRvdmGEpqAgLgtr8OhNdJK4k9IN4JkwtBBDL0zlTuK1ws?=
 =?us-ascii?Q?sgBHhEuWh00y7Axg/LFrJ7dE+a4rYzoBWJYbD0cO5gNtjSrXzHeRpbAmjj4m?=
 =?us-ascii?Q?Vkhr/EGCrMPTO7GO7wGaZZVh+wJnYE4wiZxjRGeJ3CcUZR89ddawqBvMJDrB?=
 =?us-ascii?Q?luMMNzb1TvidYxniDc7u/wJWH3TX/V/6giu5ihPYnaoHV7Zd5on9qnba38Ll?=
 =?us-ascii?Q?YVNCbwo2wfLwM4J+pdcrMJBZzaTFpmUOEvX8JnoXM9yz+yfEp4DxUrzkXQrU?=
 =?us-ascii?Q?K3R5dqNBnr2tIXYmN7AFilCermu1MZTkZV8JnX5aUZtW/lqQoTro3y5Xe8qQ?=
 =?us-ascii?Q?c+thWf2TnkWZ/5JR2ty8eRbl4Y6oY3MXJQj8p4sq7Pf09EVrxidPg585vO+Y?=
 =?us-ascii?Q?Pzu/4xUfLNh+9cGRD5u/vRVI6BtaqL3L8YtoY1nJkILRwQXlIrFls8RU8f/6?=
 =?us-ascii?Q?NUmn4q3EyXMyvHEt84qDTwSkOGEZVu9k0aX+w7vmSIhQU/vNahMF2P1157Cm?=
 =?us-ascii?Q?H/2kWXfx3sY7MNFEe1R9YTkk3x0jT/9/8jw7mJEcztdsEyj9XEO4Wcpfv2PT?=
 =?us-ascii?Q?Wy/1sdpNnacfYSDeVepApSwouTqgVL2ffskVy3hEsB9RwSmJQTAGK94OmDT3?=
 =?us-ascii?Q?GHAbIu0qIgD4PsSYAp/jBZFGWqvDMI4MBCdzEl4PvAzcImgQY52BNQqBpQy3?=
 =?us-ascii?Q?IvxbFjUd8odsAOgHOqvO1bHv?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 07:07:08.8063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 607ac218-7616-4c4d-cf26-08dc8464f30b
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3781

Using the #![no_std] attribute in the Rust kernel support is different
to the default Rust usage. Mention this in the Documentation.

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 Documentation/rust/general-information.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
index 4bb6ac12d482c..bdbafd916daa5 100644
--- a/Documentation/rust/general-information.rst
+++ b/Documentation/rust/general-information.rst
@@ -7,6 +7,14 @@ This document contains useful information to know when working with
 the Rust support in the kernel.
 
 
+``no_std``
+----------
+
+The Rust support in the kernel links to the `core-crate <https://doc.rust-
+lang.org/core/>`_ instead of the std-crate. This is done by using
+the ``#![no_std]`` attribute.
+
+
 Code documentation
 ------------------
 
-- 
2.28.0

