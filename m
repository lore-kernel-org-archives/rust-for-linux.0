Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A331A54667
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jan 2024 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706601098; cv=fail; b=kPArhmUvSJgEyraYLUvq6wKHmcKAkslP5ytgmfn6wF8tVv59ImhZYJo3ZIqP3ZazLDAKyIuGktdM4haQTysU0/ikgI3x9e8bn4f6xlKn6cazB0LY49el/4qurjVRJqgpgFID9JCoyZpSe1C7sY8ik8ws1s4wEuMEZHXDAzmdl4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706601098; c=relaxed/simple;
	bh=latxd/1w3iGtTOIhV76k50aMNHg+OCAkFyZ7CmXHz1Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KVWKiuL6nuFnNnjnhS6CE1Ovq+Qo93H4cMnlafF2bOVriCjrqYC6j/Ubd7pdlC9i1sCvgYRtMzjpbGCeG/05thZhv1/ooCHcfOQwn2misuZRd2HPWJLsc0FAJL9V149HHN9iEMuZnwLj7u+e3VOZXBQAYvo9MDWvHPv0d/z/Z94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=X1gcUbkt; arc=fail smtp.client-ip=40.107.22.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="X1gcUbkt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSQsrFlFpV+Vsa0FA9aBqU0L8o6irNMjRzjiN/5Og3+xO0pJTiGWzPXcF9T8WeidP+kfrT+IrNXj36DHj7XIQTIRlnmjwiQcU3cX4Rc+JxnMSk4lo3USrvjUY0NCuSYtWpdGaDhqp5q8W+66vJCdKEkba8EzpYaiGVDQQfuOkUYgvC7r4RklQ0Cey3WkuSUG1T2VsFOyjVvOL0nAOfk0GeCUN4fhjvr2gskAH7eijzYWRBy0O18w44w4lrGtTX8tvLleRpCGgVTKkiGMDCBGpCKs0jJ9mIiajjxt+edr6KV9DPI+e+wKoDFSOOPNt/jP13BSFbRZMmK891Nu2p7ZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eoBu0gdoCPWQIjpxyuNRsH577K8Ad3ntPw70ivNqMI=;
 b=ldpnmK7PXvkeJMnx2XPdA7eVQ7+/NMAkwtxuNSwbfW5DVuwex/D7O7lRR36MnmHxshtqj1FinJjzr98lWrUWw97RaWcyTrWgQXjJvRuyeaLX3E+tZlXOSZ5LTJfF9n8JqzAkM4pIRKUL5Sb9wOv5twKiwjbkPKF8OxL+mddXIY9mCWK4jbskThzx5AEkoEgCQ0nOuVKvD4naRFUrqgKJ1vXPXPlcDYGobvLphvq/yR6b49+JERuJj8XXo45K80Z9fRyq+T66Uo2nylmGnX8yKNDie4RF9SAgRcLu3ywQCHiUk2RqdAcycZGPhVKTjdFFsMynkcnw6cUf/43sIn8khw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.203) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eoBu0gdoCPWQIjpxyuNRsH577K8Ad3ntPw70ivNqMI=;
 b=X1gcUbktd2QEJabJLfPNMrTFikLlTh6bKLQXG+BWBUnv/VwTtnFfQUpSdhNezLTpV/1gma54+axQ4ydg/qdVThwUpElRlLGzZ8oS/UOGebG3aEoHi/s09SoPzJ3TFiyzYoauwuPb/0/dYUTfVZ/noaJRLdch29nvSpRz3tMq8yvV570s2l1Qse5BobccjxznbP0TYkFzhvV3FW5GGRP8yJAgXzbMQLTAvVuQjA4yBt+nSQY3TILltzBt/mb9QHA8St2z1uqO52uq75mtu9k4P1w7adcYO6EQ/A/dTBzfXpuUlyDZkM+BM5zt8cnb1nXoR7l9BWGWTiyfQACy4hHl+w==
Received: from AM6PR01CA0064.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::41) by AS2PR10MB6870.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5f6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 07:51:32 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:20b:e0:cafe::36) by AM6PR01CA0064.outlook.office365.com
 (2603:10a6:20b:e0::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.33 via Frontend
 Transport; Tue, 30 Jan 2024 07:51:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.203)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.203 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.203; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.203) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 30 Jan 2024 07:51:31 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 30 Jan
 2024 08:51:30 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 08:51:30 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, Trevor Gross <tmgross@umich.edu>, Miguel Ojeda
	<ojeda@kernel.org>, David Gow <davidgow@google.com>, Alice Ryhl
	<aliceryhl@google.com>
Subject: [PATCH v4 1/2] docs: rust: Move testing to a separate page
Date: Tue, 30 Jan 2024 08:51:16 +0100
Message-ID: <20240130075117.4137360-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DE:EE_|AS2PR10MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: f39ddaed-a4cd-4951-25ea-08dc2168461f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gNRB+oe9nCbMTkfexcAlkRWq90pUvWStQnRvUAXqzKnWscnYUk74DnW6JFQjmHXDYdGj1aYApSe7QuaJFYZ9S7dSdO39/48moWtn838VJZk0VPxtvFNdIfFMHfLsz3QOEy4acu47xpehNgwHODvq+kzty6eiVC5AQvk/SYmYpq7Gd6m3eSFf+fY6A5s+LklOy5GUSQ3k52MiJB++SpkQCs9Cx8Rad/i38EATwrMuU4m2sw8a7aKw+iCaW6OQfjcANOJYgabatB78gnFCQH1546VTvLioGUtiYLsqezx8XOKx5clRcQpvwHTR8m1lNsolmZH57Ial1YxqguSws9eDkdZarZfrCQ49yDmpO+MIydJLDN0leOnzpXc+fpUYqcYMd/ZBJgEvor/yQ4bR09cEMBZwJKV/2Q1CasLpd488pxvwtQ0cMPkliHE2CB2TMhZsuOZ/5jxIb9ZrHgKwHhz3uppkCslDaQoozytKlxTzgtThfB27zU37Kfb/mN+xQ938ppd7gGPztXBOK46+2eSw43AmewcvbgXXDKMid7XBkDCNbtWhq90Gk/SGRdCe0DtFL9LMzMLXOgFmMWj+tdxWDfICnb4YUxaaXkP1Ai9TZcxLedUngF6yRKvETLIIQ9Oi3nnkM6heaqPRmQPEAsZY+Wqr+fym0H+NbZnmRPVtRr8GrNbJsC+bvjR//mr9UOHNywg0X+eHYGiC6mTA51VRX3RcRmu27qlVg1yCPQLOnnareg3n160A+g6XoCQe5j9t7If3k3kFOQdI6Fy85bZyMD2bPgJpHfIRdhhY1bt0Lnxlnlec6GOgHgqDGI0gUFIo
X-Forefront-Antispam-Report:
	CIP:139.15.153.203;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(346002)(39860400002)(230273577357003)(230922051799003)(230173577357003)(451199024)(82310400011)(186009)(64100799003)(1800799012)(46966006)(36840700001)(40470700004)(70586007)(70206006)(6666004)(47076005)(40480700001)(336012)(40460700003)(1076003)(426003)(54906003)(6916009)(316002)(86362001)(81166007)(4326008)(82960400001)(8676002)(8936002)(356005)(36860700001)(44832011)(478600001)(7696005)(2616005)(26005)(16526019)(83380400001)(82740400003)(2906002)(5660300002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 07:51:31.5748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f39ddaed-a4cd-4951-25ea-08dc2168461f
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.203];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6870

To be able to add more testing documentation move the testing
section to it's own page.

No change on the documentation itself.

Suggested-by: Trevor Gross <tmgross@umich.edu>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Reviewed-by: David Gow <davidgow@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
Changes in v4: Add some Reviewed-by

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

