Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2081.outbound.protection.outlook.com [40.107.7.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F006856741
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jan 2024 07:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705996421; cv=fail; b=S92r7+s3shJha2uXBbfjQgbmTMeVEcku+2kxFxSbd5ejXuJwCo6bXKW6XFzE2so/bGiLR3F0KPOid2k1i0IUV3o76IPoFiNflNLMh2cDUUSz/1FKFbEvqCdRhdWLA6a2KgkP/0Z8f2/+wTP2u3QBom/npkRW2JWd75IxPpLSEGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705996421; c=relaxed/simple;
	bh=SD0OfO0YCaTmtGkmT1QHe+RS+6pRETLr63OqPv/S/+8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bN7VVKXQ9Po2nyVqk+qL4rGQ867FNZTJ2J8coGHgO70zP+7F6prLgMx/qQ8dGetNt/ovrxEZi2IVHCHJMNcVLqg3+ulqaggISTfYCj7fq+AARyX9nQgt/zDtyrfGiZ1Lce39yTiUIk0XjJ69x9v4p8SlbfpBbEAy27XWZ/LwgYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=g9opbyad; arc=fail smtp.client-ip=40.107.7.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="g9opbyad"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHhkRtH0jA0wBmflO8XWlI0HsGl+5XmtPOiFOS0YmWK+7KyJcg8lE11kQ+2Mx1hY+NCmuFX3cpxHapzOVQ7DIIjoUnyFE8Iqj1J4s+wh5vFJATKlrpov3MVASIb7V/imICFw0A2X5iv+lk0mOWQveGR9N+SxehkY/XHhVLGBOX59ZY2LP4XHR0C3CkWqmYKjq9yXdThMKXZjrpgtrYxvdgkNuwW/U0+sVMUjvVO8fBqGhm1sCjjJ6un7C+VfQJ9OQnt/ZUv0dUozuEb2+udAz9r8anGFTMHfkMpC2VLknhOvCUX0S0NWufqzHl8nlypc7r5BURT4MgnHLZxxcnn4WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WunALsjYRjQGkQSM7sF5hGNpKWQwo75LK+2YkHIUtY=;
 b=I7rMmpLd8t/Bfx1LRF+2tCd5ngEOXu/tmYJlERt+UD9pUOM9HCzJnvZ2W2Rerf8dB+GT0IX5Na5aq2JgMNacxiOKxgh1FErzDT2GoL7gVmGtXRRDaRR7dKWbDJkwRCbCtURYFN1hxOs7K92Tca0fxSM9ThlqET6VslPamAaLa+ALp4VAJr5sUdYH95Ox+IC7C47xpF4274G99owgq+AHBNxr58iUcN1QKpfVYY+kDBqqU2P3k0jrjqSb+tb+5MhCG5o6N9O/e6GBTluiydIapmOEBrNjMjXIblGCZipR8xCHorkx2xAFO+47ZrkMiIiOyv5eaQiGRkEQNVzSmc6foQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.203) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WunALsjYRjQGkQSM7sF5hGNpKWQwo75LK+2YkHIUtY=;
 b=g9opbyadmMDu5JVB3JvsCfGDv9Nt5yyhU+4SHe/aBktbI6mOVCi2rhAht88goj+KOYWE4slJ8UIbhkweLauiumN5FLxl6v/eW6DJnvZ7YNQa4Hxb6W86S3ERmAEDVomiGI6PrzMNADapaVhB+KFGLVtXkvb6UojgSa5WSig3cZ9itaQ0y1qsOnIhhZ9uW0ZAlvluKmlhoYvovF8M3VFPVm79MOSXgrAdg/tSZxmWCkOh4IeiAFiDhV611qKhu+MOyV32gUmwmGHQzn8peMdBngazcLRYHcZM/BOvq4sLR5qj+w/FZzrhKQTrHR7waPUd03kZS6C/YtCtKR7lnKus8w==
Received: from AM6P195CA0015.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::28)
 by DB9PR10MB5738.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:2ed::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 07:53:35 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:209:81:cafe::4) by AM6P195CA0015.outlook.office365.com
 (2603:10a6:209:81::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32 via Frontend
 Transport; Tue, 23 Jan 2024 07:53:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.203)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.203 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.203; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.203) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Tue, 23 Jan 2024 07:53:34 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Jan
 2024 08:53:33 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 08:53:33 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, Trevor Gross <tmgross@umich.edu>, Miguel Ojeda
	<ojeda@kernel.org>
Subject: [PATCH v2 1/2] docs: rust: Move testing to a separate page
Date: Tue, 23 Jan 2024 08:53:24 +0100
Message-ID: <20240123075325.1270967-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004E:EE_|DB9PR10MB5738:EE_
X-MS-Office365-Filtering-Correlation-Id: d815b95c-8990-4f65-fa4a-08dc1be866c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XoSbgVeI/eGWwxD4A+pQdV93iPrKweg9PHtHRMAz2zKniHMXn5ye4aWxVUe8Hne7STogoCICx+CLGwIUDakbZUstvJIGKqAQRgaUaKij01Hj50Ptfbdzl0DnPclpuhWa0IigabEEjUDpzDIkj+UsstTbpSD/X0ki9x2IwoPTpbiMWCrvQ1pzkgBTL9QEF0ze0inCMmrnqnBTk1C/ragxq3DektFi2xhNnYVDHz4xNhZGte19dvcui/vKocg3OTJF+p7StrqGhr3husAHcnIWO+eaUBSiIPRHF+yQZvocd+L3nEES7SG2tEyhc8v0uFEm0k8IOKfDcc/kBN5Wb85pjCBQCCWevLUwKP5oGIqGuzQWdkDwcnJbvfqwocDn2QEmXJeAzB1igMfjhD/0PDz775/n4i+26B4tkqUhckLwpnZWdPWEto71SVUOsFg6xwfZwFvd7RSO0VDouzpmQl9xVMIH7NYViD1gDeYiSTTsiv+dQYVq0uZK4NHMT/AWozMAqZgDwP6qt+bGBwXZhuzfEvYfMXZ8CmPw0Q0LKEsb1n16pRHRr7R3Ih2X1ZVDHyDWBJN/AZc6zq/wgi6uXorgcESfwpsdteNmHvrTTivFRPL36WzlMo90vA2NdkhuSuqvZduVe+i0j0MgpEG8eJ4NcEuz3+/Ah/e9yxiNjpze2ntIZddXt8GynMzdfSlSwKjIluqUoPuxEjIKZK+OELdqdaGF1LSNEvrKzqioP7lC9GB9Cf87FV6/oOnx6q+n33H2x11qczrdzbNn2+L7PX97MKTik9v6m4ebclt2S4V8FrlfnyUhUwn6K3Z19/Me1XMq
X-Forefront-Antispam-Report:
	CIP:139.15.153.203;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(39860400002)(136003)(230273577357003)(230173577357003)(230922051799003)(64100799003)(186009)(82310400011)(451199024)(1800799012)(36840700001)(46966006)(40470700004)(40480700001)(86362001)(40460700003)(70586007)(16526019)(426003)(2616005)(83380400001)(336012)(478600001)(356005)(82960400001)(2906002)(47076005)(1076003)(26005)(81166007)(316002)(5660300002)(54906003)(6666004)(70206006)(7696005)(4326008)(44832011)(82740400003)(41300700001)(36860700001)(6916009)(8676002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 07:53:34.9115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d815b95c-8990-4f65-fa4a-08dc1be866c0
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.203];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5738

To be able to add more testing documentation move the testing
section to it's own page.

No change on the documentation itself.

Suggested-by: Trevor Gross <tmgross@umich.edu>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 Documentation/rust/general-information.rst | 23 ---------------------
 Documentation/rust/index.rst               |  1 +
 Documentation/rust/testing.rst             | 24 ++++++++++++++++++++++
 3 files changed, 25 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/rust/testing.rst

diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
index 58283f4894ea0..081397827a7ea 100644
--- a/Documentation/rust/general-information.rst
+++ b/Documentation/rust/general-information.rst
@@ -77,26 +77,3 @@ configuration:
 	#[cfg(CONFIG_X="y")]   // Enabled as a built-in (`y`)
 	#[cfg(CONFIG_X="m")]   // Enabled as a module   (`m`)
 	#[cfg(not(CONFIG_X))]  // Disabled
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
-``rusttest`` Make target::
-
-	make LLVM=1 rusttest
-
-This requires the kernel .config and downloads external repos. It
-runs the ``#[test]`` tests on the host (currently) and thus is fairly
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
index 0000000000000..5440d56ff40dd
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
+``rusttest`` Make target::
+
+	make LLVM=1 rusttest
+
+This requires the kernel .config and downloads external repos. It
+runs the ``#[test]`` tests on the host (currently) and thus is fairly
+limited in what these tests can test.
-- 
2.28.0

