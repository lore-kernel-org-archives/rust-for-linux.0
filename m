Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2071.outbound.protection.outlook.com [40.107.15.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC27D5467E
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jan 2024 07:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.15.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706601104; cv=fail; b=ptR1+gzWL4u0kNcbjfMcQ3JHrbJKYkvnyF7gssPeGJhRSLZ1c1/7RR6a0c7OaU6mWQe1qNLvthS3n9QyTKBYSCSegjG154HmLGEs8zgg1K6XJxEZfnURArxLnWJ+mcueKCLDQvfApXZ1Zc7cCzRKWefID75HE0jeacjKgsVMe+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706601104; c=relaxed/simple;
	bh=Wg5hslGRnsj5ZPJYmsKVafNBlm+ZFEW3t8DvA76NpvY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WDp78hPq2NLH17TUzNVMuqgWE4dEwFdU6I6WpDj/++QKVjPEMrqt4aQ+W9wl8yKLwE/Fc+RpJh9FWySUJL7hYjfzVUujCUK1dr36PlsA9HSZrTj8NPjE/apqTjo8uf6KmH2WwLD4K1Qo3cp1+DnRTvafZ5yphEPpg3X2ap9Hu80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=uiRctkDQ; arc=fail smtp.client-ip=40.107.15.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="uiRctkDQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFtnOWC0Aknfid+xycb7kRcMnb8V9FjcWCoTzYwLNKrh3fTgXMzOkQhjudJWCMWiPWAfiD1O5FWPbkVKKFrTBetXDFvp8GDKkANt6B5MPydvrrv9MkLJhzk1iWApWPbeQg/99P3P+WDYAdnc5lzUWoOV5GGDUf559R2RFIcjf+mPKYynkMKKGmTnukkMOTqjUza3z4zMZ6auLDTWl/OAhJpfEpsvXrFM2mARAho8JabzO4fISmbgAo9ipO+QeIircik3QiAfVWhEm5V0sF0MLsBT454lKqhoKDktJ/eraTO2tOrNonr9SLb7MFs8Ov97H0zFeDvXyLmYuo3hhEs6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bsbLDlSCoKJ7sq9WSlNMvzuoLtnS8iISGImax8QLwg=;
 b=AHw51AMDJpn6ScaHe1hfRqbGzDkMZ9epCEHvng5pDm3+mX1n1u3xiRxZXclVT9JXABlCg0DcL5pDx2o/mq6lxYhSoG8/O4TZFll/wAQCh785qc6rs6kmAu2DHkphe3rHQmdFJ5aWOm0t0eEplNgquQemQsDz9ygcLD07HFThiKsV3OF3vxrHVoGwWp9v8GjrJLJpIdQbhDgu6QH4KqttQSEXCMprd0Xja5T+SPvpfHpzwaL7bis3UnuFE4bjiH2kcwSsKNjMFGYuVN2dbQ4qV01QSGf9uyIfe9pC8Ha+VW98sgiT+NdvVWnSShycJJ9wA6U7axDcQNZGQmz5bXRO6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.201) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bsbLDlSCoKJ7sq9WSlNMvzuoLtnS8iISGImax8QLwg=;
 b=uiRctkDQmWQDw2hMzYFmgYzPTzaN/qQVC9QEOKe/o+PDeR8RBCyMHq648zpRluJiiRtOooRCzYpfxPnnLqC5A59CurGlb7VdhIb0V8+RA5/95O6ZCyhaadTZh+SeaUm28xXpvjdReibP17v+i/ybHl8zQoHvxURSQ1zB+/yuDmsFG9F1nuT4U2kpJFrZFJU0vsPXTguCrcUhbzgiF5ojn6Hwqn8N4fmNcmYRxOlOZ7xpHNffCy/vXhZjIakpAF6cDT+6xhP2bSuczv7hyAHmVxW8YTjkYVEr3DPA3PRwHkqNhBSCYcF4XwDyarisX6Tzz2VmmpHAK+NhaPf75QR2/Q==
Received: from AS9PR05CA0131.eurprd05.prod.outlook.com (2603:10a6:20b:497::8)
 by DU0PR10MB5825.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3bf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 07:51:38 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:20b:497:cafe::e6) by AS9PR05CA0131.outlook.office365.com
 (2603:10a6:20b:497::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32 via Frontend
 Transport; Tue, 30 Jan 2024 07:51:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.201)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.201 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.201; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.201) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 30 Jan 2024 07:51:38 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 30 Jan
 2024 08:51:36 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 08:51:36 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, Trevor Gross <tmgross@umich.edu>, David Gow
	<davidgow@google.com>, Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda
	<ojeda@kernel.org>
Subject: [PATCH v4 2/2] docs: rust: Add description of Rust documentation test as KUnit ones
Date: Tue, 30 Jan 2024 08:51:17 +0100
Message-ID: <20240130075117.4137360-2-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20240130075117.4137360-1-dirk.behme@de.bosch.com>
References: <20240130075117.4137360-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000194:EE_|DU0PR10MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: bf0a6f7c-e31f-4cd4-c219-08dc21684a71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AyyB8UCAMq9GFc0Cy3J6tPH1whodG1RLejB7JHR0VR17ie0X+sE6kuPsqjAR4cESwymvn7WBEhM9ke1PSvqSi1yzTo7R729v7eju/8UBCnkn+tKD7QNccdm/Pxa9THR2yQkEak08sUtTovmmLHSit6ZVGfT2PsTsE6KeqLAXtHcgbQ1J0/TzF8NEUnwGdfmzyDkicmE6IdAZPV888jKYhu9lQB8yX4pqGWi2fN+quS9UTExvlItzwitKR6pMDnk+ZM00YbS+UQZxYyWlWBxfV5sNgURlQxqacQdfPuS5280fAGPvvQaLXC0EehlNklsvCs1cj5wuQyiD1VVd3G4B0VTjBWF9vhp7CrmFgYneDsuMVbHvBEoiQkPU9+2FV5ZIi3agQDQg7tGqwm7NsXwnLqyHwXNsOrOfaxAWYm2NZSgG0l+Tzi+j0sPGvDbQUf7yTu+SAGtH2bo9iLQcHXTwhLV331dbV53WHGnNklb/rFopSLiRtQfdZ9WoXU3sZLlX809NZXOp5fiWa+ZDpMaQ44mcQRjteXpJAfu9T0hPwGYjA4ZK/IGVFUS1I694e4eJXqzPh2yY949ke2jnfalbM/PYeoG60QNCWfgWj4VxQjDZvy3PNRY/AiliE0/vid4ZvhTMkZoQtQfxKeqo4qG29gpNz0pIGyncZaGtE+HPBlTpaeixxd/wR6HI3jh8mWIouCeckQ6fNhu3dIxx6MQuB+hBP4oo0eEFqqPJPj3ZqGPJQgXVOcJmCurMr+wlqnXFbBrx4mjujqEXcJDlKbHEJg==
X-Forefront-Antispam-Report:
	CIP:139.15.153.201;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(82310400011)(40470700004)(46966006)(36840700001)(16526019)(41300700001)(336012)(1076003)(2616005)(26005)(40460700003)(40480700001)(426003)(6916009)(316002)(36860700001)(54906003)(6666004)(7696005)(83380400001)(478600001)(47076005)(356005)(82960400001)(82740400003)(81166007)(70586007)(86362001)(2906002)(4326008)(44832011)(8936002)(8676002)(70206006)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 07:51:38.8271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0a6f7c-e31f-4cd4-c219-08dc21684a71
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.201];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5825

Rust documentation tests are automatically converted into KUnit
tests. The commit adding this feature

commit a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")

from Miguel has a very nice commit message with a lot details
for this. To not 'hide' that just in a commit message, pick the main
parts of it and add it to the documentation. And add a short info
how to enable this. While adding this, improve the structure of
the sections.

Reviewed-by: David Gow <davidgow@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
Changes in v4:
 * Add Miguel's Signed-off-by. Thanks! :)
 * Fix a typo and minor rewording as suggested by Miguel.
 * Add some Reviewed-by

 Documentation/rust/testing.rst | 120 +++++++++++++++++++++++++++++++--
 1 file changed, 116 insertions(+), 4 deletions(-)

diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
index ba8a01015abad..a6ae4ae46b5b9 100644
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
+These are the tests that come from the examples in the Rust documentation.
+They get transformed into KUnit tests.
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

