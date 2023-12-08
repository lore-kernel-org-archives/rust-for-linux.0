Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="HCFxuN+P"
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2058.outbound.protection.outlook.com [40.107.13.58])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20658173B
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Dec 2023 23:15:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X67xGD6+jUZ2gqQc6ts/MnZI37JwIjGrJ7opKGL3ifeoe6rYzFGofz7vap/YKA1g5Q0nsw+L/H7H/ki/SlwPLwwryJlkkmUBgfQlF+d4lreO0ar3TnJ8VQsA7UkxDNwf0zjvTY0w6jVRa0in7cFkNv97BYEwJGjnsuiyxcWrvGBg579gNqMmMsP8wM63nJ7z4r/EldMpM/hiVWn9gb5Z1iKALTksyLSYoLnx9lEuzCrUmlqNZU05wUnielhEX4fVKS3tAVQZJKnxwz5pkSae+kMcCBR1PW9ZHpbOmk9GllFWHdELAVDIhCTWk02ifwFoRB/vSyyeIHAqviUukebegA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkK40TI1ZWi8cwT98wuz0+WNsnx/Ru75IFdilJH7Vws=;
 b=BNh7hgq3CyqnFnVOSqaYOFKmN7WlGVPJ1vruXou20UDQYSJweVRh+Nyq2WhG/BLnDixHR4KTbUKEXysDmq4VAc9dnGfS69dcgthPKQfSpxzscggry/McFlwCpTBKM4cFYl4NVC6zjTNTBZzW5BU+kQswreSYHLDs3rq4mdA383qDU3pNoUFblSd2tKLo0lLzvTFCmSvSBKJg7Dg+TnJTV1VQyTnClB5p1XGyVzFeAggkkyDAdyQRGFDmKUYR9yUvz6QqcwCZrTfQjjePR4T8W+VRmGBGNq5DXLgnYshhzX2dohfzMWhUdda50hwGmaFx8SdUPcbJFtwE4QJQonlu9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.201) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=bestguesspass action=none header.from=de.bosch.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkK40TI1ZWi8cwT98wuz0+WNsnx/Ru75IFdilJH7Vws=;
 b=HCFxuN+PPS3nwhfna9jk23NC4VZGl7/W1TBKIFWP/A5kExfyorlkTtwu8tirumv2N1XMR/mJEPGH1J7IBewkP93Hu1I5W11k+DwbpZxiKjGIe9uiKjmg7TfbLshZIHeH5Jc+/UqsWL3mAyIQ78fAPUMlCqj8nPFxKirwfmd8F1pXphMLtPS7fvzuwwzYCzDzBcnx5tW3Rm7crI6JF4qdjarr3SBj3/YsXnDx06Tx4uqhVmPGWlUeEVv5UU/74sX7TxJ7F7Gv2bsfcBB5WddfNmOr6RLRUlCC+WNw+I5I2Yqkr3gGwV3XIyYHU8CjgZl2nvK+RrUqyPKcG3nUKkNPig==
Received: from DUZPR01CA0244.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::13) by DB8PR10MB3912.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:169::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 07:15:16 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::b3) by DUZPR01CA0244.outlook.office365.com
 (2603:10a6:10:4b5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28 via Frontend
 Transport; Fri, 8 Dec 2023 07:15:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.201)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.201 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.201; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.201) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 07:15:16 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 8 Dec
 2023 08:15:16 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 08:15:08 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>
Subject: [PATCH v2] docs: rust: Add rusttest info
Date: Fri, 8 Dec 2023 08:14:55 +0100
Message-ID: <20231208071455.2584037-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61F:EE_|DB8PR10MB3912:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b48f818-db13-4069-6eab-08dbf7bd6de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KiavTESh9W9vfJihQ/i6yiY1kMNIToM29PTbghh/bR7atOZv+F71c4xHMXZbOmMXNYyvokzuX+Kvf4x57Wl0sme4yiYH9PwVVuh4CnpHdExKOhos4C3lLpEaeqWBVQpOK6tVM0LPYMDPeqtUgs8Az5C/VGR3vA8kYGQibvjl5qxqdttHDlaEGBLqUnHjznv9lP5V8uwiACm7iVj2QLIPMi1aimgyGGhsu+zYODNkWfaV9GQCJcR2XSiPD3Sva7szPDTLP0OzwBJlJ7/XAO7dMqLc+n/lYMJSEYFcZYru6Kxut6wJKkO8x9accmLyFE4UnptfsVh8Uv2VAvPlm868EEMMNno37+yrY1b89LalRN5QvqUafTBJXW7ntw8cOoRRTH13lm2XHf/rEINrG/xzCNapJpHB3B/49clnORMHnOKMdAqQ9MwxVqLYEGW1NT6Yghd4/tYr+9B27pRwFrNnbRIWwfbURJXXKHa17QctoUx2K7XTTyKb1T7e2PQRf0qmRLl4nXNh1AQspgzAr9BOIJQGS/fMdrjNsVyRtFQ8jbtsEVRYDPc1LDPXNbtrdAaMrJb1GIYd04mfNcDkl669T6V5O47Pnh57swrlY4+LdP9VtmBBcbzhNqeupLe032uvLaCWy61BuHH3vcdSJJtMPaaQw61iaNt/uou4ytFhiWsCYX387vyh+jrFXng1gSWRjYY9fp4FCaRuQdjEAenJghPCusOJZV6LnQcIrye1QbSHQZgZyPQ0XyHw8S46YI6GQ7A3x11dcQyzIvHnfx+eb3jutsFDHDZi3vYdTCy3DCXMu2NojgBYTCpFf/+PtPrK
X-Forefront-Antispam-Report:
	CIP:139.15.153.201;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230273577357003)(230173577357003)(230922051799003)(1800799012)(82310400011)(451199024)(64100799003)(186009)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(36860700001)(81166007)(356005)(82960400001)(47076005)(82740400003)(2906002)(5660300002)(83380400001)(426003)(16526019)(2616005)(7696005)(336012)(107886003)(6666004)(1076003)(26005)(70206006)(70586007)(478600001)(41300700001)(316002)(8936002)(6916009)(8676002)(86362001)(4326008)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 07:15:16.6555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b48f818-db13-4069-6eab-08dbf7bd6de2
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.201];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3912

Searching the Rust kernel documentation all existing Rust Make
targets (rustavailable, rustfmt, rustfmtcheck, rustdoc and
rust-analyzer) are explicitly documented with their Make syntax.
While the Make target rusttest is mentioned two times in the
existing documentation, it's Make syntax is not explicitly
documented, yet. Add a test section to document this.

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
v2: Added the comments from Benno and Trevor. Thanks!

 Documentation/rust/general-information.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
index 081397827a7ea..0972ef12690e6 100644
--- a/Documentation/rust/general-information.rst
+++ b/Documentation/rust/general-information.rst
@@ -77,3 +77,17 @@ configuration:
 	#[cfg(CONFIG_X="y")]   // Enabled as a built-in (`y`)
 	#[cfg(CONFIG_X="m")]   // Enabled as a module   (`m`)
 	#[cfg(not(CONFIG_X))]  // Disabled
+
+Testing
+-------
+
+To run the Rust tests, you can use the following make target::
+
+	make LLVM=1 rusttest
+
+This requires the kernel .config and downloads external repos.
+
+The tests can be run via kunit, too::
+
+	./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y
+
-- 
2.28.0

