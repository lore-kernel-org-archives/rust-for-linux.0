Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2076.outbound.protection.outlook.com [40.107.104.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6DA10A29
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jan 2024 06:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706165781; cv=fail; b=GQC9w4Hs6INIkcOrrkG4a5UguGWS5Hf2A8NlMS0zxFPJ1poruePD1y4o6inqPAg9Bcdf2E30aimn60CptTjgPonrZpTP/Boj2rMYS4bE0HzpXeLJEG9PgOrVECcsd9Kqiw5A40xJRRAcK9ESDnIJ+VfxzGKQQjnQbKbGVUEocpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706165781; c=relaxed/simple;
	bh=AwSnqczu6/TPdgfxy8z3cE5SjC7YfdbXeNVn22v4VQc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bHLDJgnA7CPFXsW2GbTvMEPD/ahNMkdrvfv03b+35uayNqfqdScDkpjJDuXd5YZVLXJkG2mKXdQGOwXEvQbQ2GTL13bDCQSAhyleKExeAooQ3EM8QkHXLqOLNY2oehnXVezY3mh0Ik8IJitKIysglujlL15lox2SbDE59WF5Poo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=cs4ef7sr; arc=fail smtp.client-ip=40.107.104.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="cs4ef7sr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxhpsBoEcxXSZiN+dX5WiPfvzn2qicaPhxRkIveCJgQUvIpRDIJK6+IcOVNrGHixANWhukQ4dU18EBU1nZfXEe2NVVsbHAKfzebpr+6SF9Z00ouxj3wQEELoUskRv1uKWk7IYhp9m0fwJ3ONTwhNSA4uVyIF5a1+Fym1WKjzI2JD194Yl3Wvx0UEYxSWrG9r3Py4hsxV4WhSy0qExa7RsMj8FMBndq3NEUxTFtDiA4ldoSyZnjbZnlbGtW8mMf5ovZ7EVApxkXoGKy4Z/oWV4sIwivqXGFemfb4YqNeruldsScRifVy65VJNbLtI0AUFmPC7GOwZZ24uUOe4FA+rhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZtwkV9DhMUsqYlD+Q/X4rVGw+bUJko+yrw8mmqS8FU=;
 b=TzWtBpc9VgoGzd3idjUVeKYhKqNFeNeRGdCjan3SlVsVPE1FAEwX/oxtyCkTlRjaFBScWqrm+AfWp+brD7qXRL/82YV4ccMFGtj9vr5t+b5fsHWVNx9bxfk079Db6aGfPG0tJP1AJPFUYiTtwzDuEyu6TN5f06VebRb25N49GU4XzqBIa5ujzSatx2CiZdsfGa8GgKGvExHeG25pMfGr10nwDhklmwh6qVhhifmtxTeLd4SSDTpBx4klDak2QEOw3oa40cdQfvtgwbIGpnwcs867bK2civlD5mjEIqwSy/lMQ/VP+w9P+k4jcBTpzZ68pn+WD/9QtYp8p8vrwgeIFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.203) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZtwkV9DhMUsqYlD+Q/X4rVGw+bUJko+yrw8mmqS8FU=;
 b=cs4ef7srnHsTNyUrvo54RjxtQqHKVBri+260frnJig8ncAL7Vk+eChpDBlBt83I5wYUVnU2ORrsb2gp0qitMDdlXyWrtGYKbX0x9WLr1hOpGJSVCdS7IiZcyd+W4lczd11FDi3p4+Zl05MXAy3i/0SSot1ci1F91h6SjRBrXy/H8O7oprSWeg5aAqnoIvTYc63s5SDrLsLDJBpAc+s/UhFVldvxlhQhvDWvZhRLUgP/jUuwmlxesJO10LYZdruHtG3eEstO2TOXrXy/HH6JAyT6U00fRBAJ0RUxZebyWCQDE5BF6zuuFIthPIGeRZa0wja5vPiRZMuhIPdtClacfLA==
Received: from AM6P195CA0042.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::19)
 by PA4PR10MB5779.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:268::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 06:56:15 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:209:87:cafe::d4) by AM6P195CA0042.outlook.office365.com
 (2603:10a6:209:87::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22 via Frontend
 Transport; Thu, 25 Jan 2024 06:56:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.203)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.203 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.203; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.203) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Thu, 25 Jan 2024 06:56:15 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Jan
 2024 07:56:09 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 FE-EXCAS2001.de.bosch.com (10.139.217.200) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Jan 2024 07:56:09 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, Trevor Gross <tmgross@umich.edu>, Miguel Ojeda
	<ojeda@kernel.org>
Subject: [PATCH v3 2/2] docs: rust: Add description of Rust documentation test as KUnit ones
Date: Thu, 25 Jan 2024 07:55:51 +0100
Message-ID: <20240125065551.2436403-2-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20240125065551.2436403-1-dirk.behme@de.bosch.com>
References: <20240125065551.2436403-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A5:EE_|PA4PR10MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: bf0e6f97-25c4-4101-990c-08dc1d72b99e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ugcxjqQ5fq7SCoN5UIxQze165egRfzQzHQgFgUVjsmjiJa0ISD/TyJoqhAmYMI32V/aSc2IpTxdr6Az5Odw0OUlVe9F89/mKahITcwyKdddz+V59gUVwWIUWD251C4qmN8bmo4Dox64KMF0fQmX7ZwWHybHCXBoGJyta5vbYct3JVkcnPfKhTofkwXiJQT6ed1HDrCkqpyCRF9yIxmbsMi07cyOrANeLXz5A6ANlpQVc6x2nUW5fPkjPaO0lT9wLkIZeCPTyqsvPkysaqr+MvR8cIL874Hu4V9c2VK2QfGhkuPRCKsS2CfsKGA8XF2re793KqiLLNUlRLIZ6hIdAYyyeaaPpB+RNXC3tEWyvEVwSqM2XsyJDkvwAaTn3b3emIb4xghJFm734ePZWfRN6PofQMt+7eStfPkP2NTqDcoNMYYYVp2W4f1yhf0QQh3yAqh/3F+7SMdWxl7AQCaoQVHSjk9mNlb3tO3GIYxB/yQIAbtZDem2EylGWalcJzbOdWIe0qDMblwQWm4tJ6j1WX7s33Et7/P56RSocgY3NPkseNhqYXFHqZTGP0cIqzq9HqFjslf9+T/dkV0ScIC1aeMdS4XMopxqRsk/ZbENV1EB5nLp7QNN9QGYLoSvxBfJYY9f09pIqLJZDFYA4Wl5JVPB9NKrrQjEPblizFWlb3jBhurR4ZO28gWKO+9Af7z1YFPX0Em3R18j3pO+EgEAuAMahtAJDk7TkGrs6v4J21Di80LKeWAXRMcrY3XxdujsOHrBMHyrJvIysntOKofa5iw==
X-Forefront-Antispam-Report:
	CIP:139.15.153.203;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(1800799012)(82310400011)(451199024)(64100799003)(186009)(46966006)(36840700001)(40470700004)(82740400003)(2906002)(36860700001)(86362001)(81166007)(82960400001)(356005)(7696005)(1076003)(70586007)(2616005)(478600001)(316002)(54906003)(6916009)(70206006)(41300700001)(6666004)(47076005)(44832011)(4326008)(5660300002)(8936002)(426003)(8676002)(40460700003)(40480700001)(26005)(16526019)(336012)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 06:56:15.6486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0e6f97-25c4-4101-990c-08dc1d72b99e
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.203];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5779

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
Changes in v3:
 * Got the '?' operator link to work :)
 * Rebased against v6.8-rc1

 Documentation/rust/testing.rst | 120 +++++++++++++++++++++++++++++++--
 1 file changed, 116 insertions(+), 4 deletions(-)

diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
index ba8a01015abad..4926db9d19592 100644
--- a/Documentation/rust/testing.rst
+++ b/Documentation/rust/testing.rst
@@ -1,11 +1,25 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 Testing
-=======
++++++++
 
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
+===============
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
+Tests using the `? <https://doc.rust-lang.org/reference/expressions/operator-expr.html#the-question-mark-operator>`_ operator are also supported as usual, e.g.:
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
+=====================
+
 Additionally, there are the ``#[test]`` tests. These can be run using
 the ``rusttest`` Make target::
 
-- 
2.28.0

