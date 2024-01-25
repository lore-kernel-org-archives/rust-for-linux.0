Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAB310A1C
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jan 2024 06:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706165777; cv=fail; b=smbUOCEMrn+LuKoWQW1qlDK73OxpmZHXrCNqP4PLi5l+0iULlhaXx1zYModQvM6MYjXOeVSAswUWJ4W74mcuZVfsshSzgt0nAMBhtpaNYmSRVldjeMe8IveCQ1qM+jEFqYDmcradb7gvhCruyzvmTPP1RkuKQp7FJok/5Fkapzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706165777; c=relaxed/simple;
	bh=uwEkBu93Umqsgu2z2Ef7sn+rJjEB15yj6yY47AfYP1E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cyut0mHggvr1EP/DBM+bOm6PcsBDjTadDJ3Gq+xDLGTuUiIm/psSpq5dJRQO4fLPXqcniDoWlruObPGnTDbHVHHUUFRwKAYTe6UyjP8d0TP36fDpQ0QyfwqvZONDSQObnvclRmtftIoebT0ebQiaXjiyyIQ7XKSs/aK5+n9Wh2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=jzExAdat; arc=fail smtp.client-ip=40.107.20.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="jzExAdat"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOCQF3ILUGinknwEycdSkO2nvOljBNrkaDd/MaQ0EPDkHGHGfHMqQ6mKgyi3Y67duTNZEHH3hYNOQ4nJ1XD67Ul0pdfaSh5i9MOThuvratc1iHkL2DMpLSJ+AQ0OccjLmCpnz3KZV7uFHBUY/KjKhMOjPwnw3nqRNsIAFLT3xqVCKZlZigVW6exUF3324cxFm3r2ad8M3kMQ5ey0DUJlxyWL2VtdYDi78i3QRi5CfoM6nFrT2llcxBYPJ/aYzwAB+hM7+OuHNx4qh/rNH0H2aLQeDCz1uqJ+aTJnhVTMOX3aqUZLgmnCE/YRGwocTFezVTd81rT/BwatCUMairANTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddr9Yp9zU3XM970/NmmlZPArnbUjH1XqiU448mYXLhw=;
 b=I22u4vuND5ny21DxBbhzna0pFCEFJi2PIBKyxuT1pbWj6zp8ZRVguLTCO8/2++po770iOiVs0GFBfKLwYZ1YtPO3B2vkT5A3wmHw0EGXOnY901Tu2REi8aU5f9oOX6R3NjyZpJxylqBftwpgwOpL/h0CXLQPwfegqvTx3n8gBkipDLOGRicRxo68Q6cNoGGvVxPemyCibDFciqC//OMT9m3kvDw+YO44icIaHyAOPEVeU3YAGlgMY+YxbGqtBSeO6XlojOOdz6/N3o57GPAiRrOJunVjgliwo+O6mzkQS/ymNEjXNU1zBw0mbRasSoCHLUGk9yKQ6/TQx632qW+hvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.201) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddr9Yp9zU3XM970/NmmlZPArnbUjH1XqiU448mYXLhw=;
 b=jzExAdat9w0ZGWO+6eGZCX+Q8LY4N408UWG789+iGU7TvPbQAw+1lgW3+6/yZhDyiRp9rbE1N8CYjq/tEM9gbth4WsvAFY3Zfb3+brLVuLgYUCZCf6UiqPas5UTmNmlvtN/tzJymqwrdzy4eZOHNuP0D0J4NSqjcHylP0I+mC9tCTUEQw19ZzF6tj/FwxqBLrG44YapDk8VV6HbwOgKVVgqsmmMm6nwA/WWXhr8r6MULBkJ7ytmBUaanNkFwphDOLQU+UO9TURTL/2Q0iBNukbt0C/ZSYTW1ijoqp2bm4pl/020A1UAYLj1yknTjS4xu8vr1dsKZmWzcpV+9SEskjA==
Received: from AM0PR10CA0034.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::14)
 by DB9PR10MB5503.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:306::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 06:56:11 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::29) by AM0PR10CA0034.outlook.office365.com
 (2603:10a6:20b:150::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22 via Frontend
 Transport; Thu, 25 Jan 2024 06:56:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.201)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.201 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.201; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.201) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Thu, 25 Jan 2024 06:56:10 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Jan
 2024 07:56:07 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 FE-EXCAS2001.de.bosch.com (10.139.217.200) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Jan 2024 07:56:07 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, Trevor Gross <tmgross@umich.edu>, Miguel Ojeda
	<ojeda@kernel.org>
Subject: [PATCH v3 1/2] docs: rust: Move testing to a separate page
Date: Thu, 25 Jan 2024 07:55:50 +0100
Message-ID: <20240125065551.2436403-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9F:EE_|DB9PR10MB5503:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9f2db4-45ab-48ec-0e76-08dc1d72b667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DlWTZOHhuYiB1IPne10KwynHg0q+pNER6cGV3KtMzshgNNcdwXhD+84ll5/mXAqYUC//StFoeikuHQVQ5q8Ha+8pHPmC2WE+oOUVDuo08IdcVtXHmKBGOHSpjbR61Vb1IV3PVd1OFZUgVTO94uu+gp78vhIRE3KYZNhK+tPwOVzIvozNuFXT6wAJbbcJJRkTF5E+691T28DTNbQ56vm8+BcGD27Ld8l4Ben37TWw4bfSPwCpT4e5YW1URr8nscLrPQjrF7/POGQTIjnmU7IOY29jE67V2OuTKIImCKOjWFY1j1+5/VTAw17xETxE87n5MMhePncgPqi8PU62J046Ys6ZOPeMsNOLwsQV/bZPSKGYbiRr0WnMdK9DP57V5+wg33yuUW7zZmS3WU/+tr6qPlBE0zqrJQnNQwmmoJeFlyyOtQm0z/Ox69ugYE33xKJRCC/tLkJfG6soNyaNUo6/cjk5Uqk5KZQcMpOjkfzU/y5Unleq9LOcdx5Ih249ElbzRYhsoAQO4yF9qlBRKYsWB8BB2EREZuOXiyu45ES7uaDP45bcUpjU86+Z2iWXqNLif3aQRbbv3ULwWecVhv21c1YQtx2+LfJByGYDEn9BGFHSYInhBEdNzWiewtrHsuqqLfRu5xB+qkEXDuXj5UvvkLtvGZldYwayDNyHyuerdm4o/crSQKGywIiE1z4WD8yYuqwpvGGlCe4XZg20H1///cXU5aMsS3dBPdpseHaoSc9HvKjhEQH9Q4eyd4/K0pH9xcvn0rFNDkzJf+PYN6HKayFNVYRXaldUq9vYcKetNR6lt43JOISvBmiVFbGNhgp8
X-Forefront-Antispam-Report:
	CIP:139.15.153.201;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39860400002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(82310400011)(36840700001)(40470700004)(46966006)(70586007)(70206006)(86362001)(316002)(6916009)(54906003)(7696005)(426003)(26005)(478600001)(336012)(1076003)(2616005)(47076005)(36860700001)(81166007)(41300700001)(356005)(82740400003)(83380400001)(16526019)(82960400001)(6666004)(4326008)(5660300002)(2906002)(40480700001)(8676002)(8936002)(40460700003)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 06:56:10.2671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9f2db4-45ab-48ec-0e76-08dc1d72b667
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.201];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5503

To be able to add more testing documentation move the testing
section to it's own page.

No change on the documentation itself.

Suggested-by: Trevor Gross <tmgross@umich.edu>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
Changes in v3:
 * Add Trevor's Reviewed-by
 * Rebased against v6.8-rc1

 Documentation/rust/general-information.rst | 24 ----------------------
 Documentation/rust/index.rst               |  1 +
 Documentation/rust/testing.rst             | 24 ++++++++++++++++++++++
 3 files changed, 25 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/rust/testing.rst

diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
index 236c6dd3c647f..081397827a7ea 100644
--- a/Documentation/rust/general-information.rst
+++ b/Documentation/rust/general-information.rst
@@ -77,27 +77,3 @@ configuration:
 	#[cfg(CONFIG_X="y")]   // Enabled as a built-in (`y`)
 	#[cfg(CONFIG_X="m")]   // Enabled as a module   (`m`)
 	#[cfg(not(CONFIG_X))]  // Disabled
-
-
-Testing
--------
-
-There are the tests that come from the examples in the Rust documentation
-and get transformed into KUnit tests. These can be run via KUnit. For example
-via ``kunit_tool`` (``kunit.py``) on the command line::
-
-	./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y
-
-Alternatively, KUnit can run them as kernel built-in at boot. Refer to
-Documentation/dev-tools/kunit/index.rst for the general KUnit documentation
-and Documentation/dev-tools/kunit/architecture.rst for the details of kernel
-built-in vs. command line testing.
-
-Additionally, there are the ``#[test]`` tests. These can be run using
-the ``rusttest`` Make target::
-
-	make LLVM=1 rusttest
-
-This requires the kernel ``.config`` and downloads external repositories.
-It runs the ``#[test]`` tests on the host (currently) and thus is fairly
-limited in what these tests can test.
diff --git a/Documentation/rust/index.rst b/Documentation/rust/index.rst
index 965f2db529e0f..46d35bd395cf5 100644
--- a/Documentation/rust/index.rst
+++ b/Documentation/rust/index.rst
@@ -40,6 +40,7 @@ configurations.
     general-information
     coding-guidelines
     arch-support
+    testing
 
 .. only::  subproject and html
 
diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
new file mode 100644
index 0000000000000..ba8a01015abad
--- /dev/null
+++ b/Documentation/rust/testing.rst
@@ -0,0 +1,24 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Testing
+=======
+
+There are the tests that come from the examples in the Rust documentation
+and get transformed into KUnit tests. These can be run via KUnit. For example
+via ``kunit_tool`` (``kunit.py``) on the command line::
+
+	./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y
+
+Alternatively, KUnit can run them as kernel built-in at boot. Refer to
+Documentation/dev-tools/kunit/index.rst for the general KUnit documentation
+and Documentation/dev-tools/kunit/architecture.rst for the details of kernel
+built-in vs. command line testing.
+
+Additionally, there are the ``#[test]`` tests. These can be run using
+the ``rusttest`` Make target::
+
+	make LLVM=1 rusttest
+
+This requires the kernel ``.config`` and downloads external repositories.
+It runs the ``#[test]`` tests on the host (currently) and thus is fairly
+limited in what these tests can test.
-- 
2.28.0

