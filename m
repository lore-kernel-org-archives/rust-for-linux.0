Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2070.outbound.protection.outlook.com [40.107.249.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4A756742
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jan 2024 07:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705996424; cv=fail; b=tdtkDuWFdFaVplD72NkhvcsHDC+kDy4dsC2R5ZP2y81p1FIp3rWamlb7n1wkroMZvDSDb0tOQ6B327ghO+oxYJfXQQQ6syiemEYZxHntRlYyKaOfTBfqkglHmpnVewSnFECq/UaKmhUAyo77I4K62j5PaZAZVe81hY1UND4s2B0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705996424; c=relaxed/simple;
	bh=SMyvZlaR64bCPpo0HmoOLesn90euvWQRTmOdOHLhuV4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WWflPy6tCGdAoaXXTKUt9+Tol1EF4kEcfK1+IdCCSroogSEo7jCysC2AA3Qumdwhlm1ZAJKm/tHfSYYulYFhtff0ylHDWhoxPsrMAHKf4cmZM/oJr7wSARjpiFsYNjV6fLM+NW8aSt+TQTcoNTdI4zfCDdE6WSAtdEp47NfbzE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=OSfhoqDF; arc=fail smtp.client-ip=40.107.249.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="OSfhoqDF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWm5YDP7r5K1WIX7Z+FHrEbXD0EmpidP/BQe4cCBQfj0oub2sUOF+blGDx8k4qoQBd/EOF3zR5sy7Jkifw4sSnVwRM+j2lNY8ANQWhmz60Xz00qvvRnIZs65NyjNpffnizicqsXz6FF/DTVcZDr1mYO5Z/lwm2Fm3Ch7akxNJVvIEqTZASwiZm2o0hY/kvUcHFohdYjPXF97/r0LhEVFZ7HCpkesgoTwGbki4hDCnAq1BV236zSD1NoaNRHzETA4m9cViqy4q99sMu0g/hQaELZFGdZSpXdnvI79SeIfTFCzUCqRUujD8QQD1+tXlgrWB2PPzMpdsj7bj8Hd7NYuuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMiyA6cFhKwt7PpNZuopRbbX8+czPdfi41oFY5xFWAc=;
 b=QdnAU50ZyViWWa76kzKsIr32h9w9gW7hxXsKqfwgabOTcUCTvZGS2tG/wVO1ga6+imzh/DSr+yUbX1UmT4ZnuE//gmmrk+jmY8GPGp56XTV99JiAVty6zSCeuXnYJci+XKs5bbTPFQsqD2WuNIrOAhGTx7dcN81syQloBehl4idRmlojz+Ftuk8bVS15EV3Nnvwp+3WzerCzsBD/vxH9lSUBbaCQJmQTF7KRWBzHxd/QnVPQlQiQzWLNwrqIwlDQ0zOkIHejw0qAnR8rEoNgSwCWNvxPnbVbcw1dBKYV4jFYswn27T30vIMTwQ3AZpn3DSZom0tVWUEoK3+VoopcYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.201) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMiyA6cFhKwt7PpNZuopRbbX8+czPdfi41oFY5xFWAc=;
 b=OSfhoqDFMOhS9AHQeimjyawFuYoUy8HKuZc/gJBYP5HzzLzSs5eULA2EmbPvbtXL/jirzRwojxTzHzoYF59zVuJm9QGoeT0a/f/eTNSoQK8+MpHHzfUafApe+XHoP4EeL1xh+6Er1hlmPXkUGj0F0ekUJjw5+4yEDELLVQicoV2Ia/n3rFCn4wopIQBAnNaZh486n4xhyk1fnJjeMH3uB2zhoKaXRNQQ6LeIF2FxuM/A6m7EdrsuOv7K9bD4aExoxJWU3AhWS/0FTZiekTA5/vTWiDlpcH8xY+FbHAkdQGs+ZEGGqVSWe6O6n3mgYU241gDJG+SUWx+MYRfv4gfQ+A==
Received: from DUZPR01CA0079.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::16) by AM8PR10MB3986.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1e5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.33; Tue, 23 Jan
 2024 07:53:39 +0000
Received: from DB1PEPF00039232.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::97) by DUZPR01CA0079.outlook.office365.com
 (2603:10a6:10:46a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32 via Frontend
 Transport; Tue, 23 Jan 2024 07:53:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.201)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.201 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.201; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.201) by
 DB1PEPF00039232.mail.protection.outlook.com (10.167.8.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Tue, 23 Jan 2024 07:53:38 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Jan
 2024 08:53:35 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 08:53:35 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, Trevor Gross <tmgross@umich.edu>, Miguel Ojeda
	<ojeda@kernel.org>
Subject: [PATCH v2 2/2] docs: rust: Add description of Rust documentation test as KUnit ones
Date: Tue, 23 Jan 2024 08:53:25 +0100
Message-ID: <20240123075325.1270967-2-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20240123075325.1270967-1-dirk.behme@de.bosch.com>
References: <20240123075325.1270967-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF00039232:EE_|AM8PR10MB3986:EE_
X-MS-Office365-Filtering-Correlation-Id: afa23a15-9759-4e81-671c-08dc1be8692d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kLvSBKnyUPUWmoQmg9+Td1hPrdaCl1BlksSL2wkr7oLeOln5ftJJrwhbVljf0FmcA8tM07J3yuqLsZeygaOZWoEQfXb9AAv2pKfptMIxpF74RBzlCstCE2TqadsemAjA+QFZd2hSShYIVhez+UOC7ncvr+UMUQDBDnH/nZ4NFxajAsyY6/kM5HOJbbUjX5fdB+eq7GqO4y6OVRzR3mQ8g6E+LI+xfKGcaRBjmC1OdlNw1hp1ucD53GmGMBd72njgi2NtRf40FzXxX1wYnSao9wO0N1lIv+iFE4w83h2xHMqYvrFe5u+dFSIP5/10AGH9LhLmzyIx+X6hEntSdnPcyer+jPRD4eMZENPvQpsZc7nHJhhdB9LNQNmdZdERENlBddB0gDn4qJ6I4cx2vQKVlevTIC+klT9aewapUA/LSmuWgWCw/UDo5VXGAMAEousX6RNkLH4rx9Vvfn39SwzKoty0/9/cTMLhVuf6FVZ/iZ33KqU+bTfcNI/wnXgPLNU1lRoTACWfV0SYaUQ1BJjbowno7Z+pyZk+Oi++06QyowvIvuhixXSm9FfxMzhnFRW+PQMjOhOztosSKfD/gQsBIkK24fluAcqnKoS93gwBDoeqT7B/KnValLM+/zIf4LL47TAGcVae+ct4lQ0+6SgKdYG4RJ1ZxGkTL9lBDpq6Xmj5VBxv+lEkIfu8A8ho02pcytw8NkTWD41JQSvOIleZ1BzU4G16ukaYo47aR+gskzBKUvL/ytwZh8OMoP2DMsnGsTrgA5B88tm4xdfG4pbR+JiOlI8lQ4D8QcT4v1i0ruQ=
X-Forefront-Antispam-Report:
	CIP:139.15.153.201;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(230173577357003)(230273577357003)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799012)(36840700001)(40470700004)(46966006)(4326008)(2906002)(5660300002)(6666004)(478600001)(7696005)(54906003)(70206006)(316002)(6916009)(8676002)(70586007)(41300700001)(44832011)(36860700001)(47076005)(356005)(82960400001)(81166007)(40480700001)(40460700003)(82740400003)(83380400001)(8936002)(426003)(1076003)(26005)(336012)(2616005)(16526019)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 07:53:38.9619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afa23a15-9759-4e81-671c-08dc1be8692d
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.201];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB3986

Rust documentation tests are automatically converted into KUnit
tests. The commit adding this feature

commit a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")

from Miguel has a very nice commit message with a lot details
for this. To not 'hide' that just in a commit message, pick the main
parts of it and add it to the documentation. And add a short info
how to enable this. While adding this, improve the structure of
the sections.

Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 * Sorry for the typo Miguel! :)
 * Miguel: As you wrote most of the text, can I add you Signed-off-by instead
   of the Co-developed-by?
 * I tried to add an external link for the ``?`` operator using

   `?<https://doc.rust-lang.org/reference/expressions/operator-expr.html#the-question-mark-operator>`_

   but somehow this didn't work :( Additionally, I tried to add an automatically
   generated table of contents for the "The KUnit tests" and "The ``#[test]`` tests"
   captions but failed too.

Changes in v2: Moved the Testing to a separate document and tried to incorporate
               hopefully most of Trevor's and Miguel's comments.

 Documentation/rust/testing.rst | 118 ++++++++++++++++++++++++++++++++-
 1 file changed, 115 insertions(+), 3 deletions(-)

diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
index 5440d56ff40dd..02a60b380e5ce 100644
--- a/Documentation/rust/testing.rst
+++ b/Documentation/rust/testing.rst
@@ -3,9 +3,23 @@
 Testing
 =======
 
-There are the tests that come from the examples in the Rust documentation
-and get transformed into KUnit tests. These can be run via KUnit. For example
-via ``kunit_tool`` (``kunit.py``) on the command line::
+This document contains useful information how to test the Rust code in the kernel.
+
+There are two sorts of tests:
+
+ * The KUnit tests
+ * The ``#[test]`` tests
+
+The KUnit tests
+---------------
+
+This are the tests that come from the examples in the Rust documentation
+and get transformed into KUnit tests.
+
+Usage
+~~~~~
+
+These tests can be run via KUnit. For example via ``kunit_tool`` (``kunit.py``) on the command line::
 
 	./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y
 
@@ -14,6 +28,104 @@ Documentation/dev-tools/kunit/index.rst for the general KUnit documentation
 and Documentation/dev-tools/kunit/architecture.rst for the details of kernel
 built-in vs. command line testing.
 
+To use these KUnit doctests, the following must be enabled::
+
+	CONFIG_KUNIT
+	   Kernel hacking -> Kernel Testing and Coverage -> KUnit - Enable support for unit tests
+	CONFIG_RUST_KERNEL_DOCTESTS
+	   Kernel hacking -> Rust hacking -> Doctests for the `kernel` crate
+
+in the kernel config system.
+
+KUnit tests are documentation tests
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+These documentation tests are typically examples of
+usage of any item (e.g. function, struct, module...).
+
+They are very convenient because they are just written
+alongside the documentation. For instance:
+
+.. code-block:: rust
+
+	/// Sums two numbers.
+	///
+	/// ```
+	/// assert_eq!(mymod::f(10, 20), 30);
+	/// ```
+	pub fn f(a: i32, b: i32) -> i32 {
+	    a + b
+	}
+
+In userspace, the tests are collected and run via ``rustdoc``.
+Using the tool as-is would be useful already, since it allows
+verifying that examples compile (thus enforcing they are kept
+in sync with the code they document) and as well as running
+those that do not depend on in-kernel APIs.
+
+For the kernel, however, these tests get transformed into KUnit
+test suites. This means that doctests get compiled as Rust
+kernel objects, allowing them to run against a built kernel.
+
+A benefit of this KUnit integration is that Rust doctests get
+to reuse existing testing facilities. For instance, the kernel
+log would look like::
+
+	KTAP version 1
+	1..1
+	    KTAP version 1
+	    # Subtest: rust_doctests_kernel
+	    1..59
+	    # rust_doctest_kernel_build_assert_rs_0.location: rust/kernel/build_assert.rs:13
+	    ok 1 rust_doctest_kernel_build_assert_rs_0
+	    # rust_doctest_kernel_build_assert_rs_1.location: rust/kernel/build_assert.rs:56
+	    ok 2 rust_doctest_kernel_build_assert_rs_1
+	    # rust_doctest_kernel_init_rs_0.location: rust/kernel/init.rs:122
+	    ok 3 rust_doctest_kernel_init_rs_0
+	    ...
+	    # rust_doctest_kernel_types_rs_2.location: rust/kernel/types.rs:150
+	    ok 59 rust_doctest_kernel_types_rs_2
+	# rust_doctests_kernel: pass:59 fail:0 skip:0 total:59
+	# Totals: pass:59 fail:0 skip:0 total:59
+	ok 1 rust_doctests_kernel
+
+Tests using the ``?`` operator are also supported as usual, e.g.:
+
+.. code-block:: rust
+
+	/// ```
+	/// # use kernel::{spawn_work_item, workqueue};
+	/// spawn_work_item!(workqueue::system(), || pr_info!("x"))?;
+	/// # Ok::<(), Error>(())
+	/// ```
+
+The tests are also compiled with Clippy under ``CLIPPY=1``, just
+like normal code, thus also benefitting from extra linting.
+
+In order for developers to easily see which line of doctest code
+caused a failure, a KTAP diagnostic line is printed to the log.
+This contains the location (file and line) of the original test
+(i.e. instead of the location in the generated Rust file)::
+
+	# rust_doctest_kernel_types_rs_2.location: rust/kernel/types.rs:150
+
+Rust tests appear to assert using the usual ``assert!`` and
+``assert_eq!`` macros from the Rust standard library (``core``).
+We provide a custom version that forwards the call to KUnit instead.
+Importantly, these macros do not require passing context,
+unlike those for KUnit testing (i.e. ``struct kunit *``). This makes
+them easier to use, and readers of the documentation do not need
+to care about which testing framework is used. In addition, it
+may allow us to test third-party code more easily in the future.
+
+A current limitation is that KUnit does not support assertions
+in other tasks. Thus, we presently simply print an error to the
+kernel log if an assertion actually failed. Additionally,
+doctests are not run for nonpublic functions.
+
+The ``#[test]`` tests
+---------------------
+
 Additionally, there are the ``#[test]`` tests. These can be run using
 ``rusttest`` Make target::
 
-- 
2.28.0

