Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2089.outbound.protection.outlook.com [40.107.104.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771C65224
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 05:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705902158; cv=fail; b=kyoHTU64u9qkr78fCk2DUoxKtAZso/6bXa+wCaCsPUD3VqJjMTra4wthsYHezgJznN9jO71dmixgGZIaSWAhEuxCk1zmHoYj172PwiOayCMIfoPSE7LACpf7MZ5mBa2W/E0NXOSylMf4xaKEFmcBPQQQ/Yn4/YL9h7SNNwYC45E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705902158; c=relaxed/simple;
	bh=4nkg+1qOXtU2J/pEXVtJyTfX7wf252Cw1IcAQaM0T3s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PyTxD97XSPcxvyPUfgMY83DwB6xfayvhg48tlK76QnzcvZudeppvEdnzXxBko21KDoU5uR+9mjo9f/PNd3gUTdkAN2QadM6yeVC01n9ZTfzNE3M3QZUs/McnzAsF76C+opv6CRhAoIWLg9GaIn8DZjNKq3y5nk7PEH0DZMxA7+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=gMDB+UZ1; arc=fail smtp.client-ip=40.107.104.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="gMDB+UZ1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgWA/VMWGHkcV3Kpeww1PVIwgi6njVEwbUorah+sAncUCj7nxjrSMfS3eOJXSPCtIuHjSLYoCVPJZctRTXdi6MKKEjBDRJ/1NCGSoOWCCkFkeC4XKCQiW9A2/66jZI1GLhFVzUCJKqwGHSzsBN+DV4Q+D+PogkbEb5zRdmMbS+9mgygj91rjSCRA0SwPfmQZeoFrNAu+Vj+Gmw1YZcAimhzg57f4uDVBuR1zDZhuLInw2wsDxxogR3xPWyz9kaexjVuvyJKbnVlZZ95j8tKV93ozT+7wsi6CgWvm0rfdw0vdQfpFgLmf/1T7caf0F6q7hT16wpzg01X7jNLQNDItdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zv0xh6hBLNhllntJahR/G6hmm5vKDV5dCuwQErzhDnc=;
 b=k7axoOafuRJr3ojTb1zk9KZLJKSeu+g0H5nP8CVJpRxD2jHDQJsvyxov+BsErgxnnZWUWKEroUD44L9Fx83GMbfXYw9xEk/mHz7iNZNvgv9tHwuqnebc2WZeY2C0sHygmZMHh9r1tc7Rb6+62v4h93XwJLKju7ZNSFe75UzSeXQrVRBPsmNjyiMDrvLTjwzAAlbzVrNxOtinMLB8s3DxFS5JNThO49ZiMhYYtBg5sut9fF/58jXoqwDwlZDesjXb8HDERQOD0LSqfJzWlrTHwl8cDvtIduE1alHh8hd2y5vz+1OZPeuFaLuxrwPeFaEg9ZyjgdVxGcfOVNUuKlWhng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.201) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zv0xh6hBLNhllntJahR/G6hmm5vKDV5dCuwQErzhDnc=;
 b=gMDB+UZ1dWvvaMHGJ5ipUyqsAy57kg0JEXz04hRAFMb+LqDTrWbgCN5mx00VlR5vN/++ovq/nq7IgyA5sdEdupWEdfYUJyk86J2JLO6xscV0MDfPD/7kyG5KoQVgqhSOOKI8/CBOia/BTgQrRHAhcW0miQI+1ya7GZx6Famc/s/BPYCogx5KxezNR2Kv31QIHAwa4bmYEvTC41UE7ib8TyiaYenB5QKqVG112auRDfedOK5sOGj1tLjQ5RTe68QQuD5wym5AO7p8l2KPZqejvCPGyd/xD4T12BgdJH/YKTN2qhYQJFnc2x6LLTmtJ8DG+x5krIZdGt20gUWQwZ9vHQ==
Received: from AM6PR01CA0057.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::34) by DB9PR10MB7956.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:305::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 05:42:33 +0000
Received: from AM4PEPF00027A69.eurprd04.prod.outlook.com
 (2603:10a6:20b:e0:cafe::7e) by AM6PR01CA0057.outlook.office365.com
 (2603:10a6:20b:e0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32 via Frontend
 Transport; Mon, 22 Jan 2024 05:42:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.201)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.201 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.201; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.201) by
 AM4PEPF00027A69.mail.protection.outlook.com (10.167.16.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Mon, 22 Jan 2024 05:42:32 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 22 Jan
 2024 06:42:32 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 FE-EXCAS2000.de.bosch.com (10.139.217.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 06:42:31 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH] docs: rust: Add description of Rust documentation test as KUnit ones
Date: Mon, 22 Jan 2024 06:42:19 +0100
Message-ID: <20240122054219.779928-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A69:EE_|DB9PR10MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: fc42006d-0c35-4bb9-e39d-08dc1b0cee2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uRPESN1lrbGdjs/9Syy/vkXc9p97Dnb9mi4dw6OmxiXt33j/9daOmWYovFqovJXPiCiJzKoIIph24ddvuoARWuxr0UeGRlwE/eCYcD2O19UW1rl/2KeiKdE2tfjRl+L6Y0d5wVu68zuSzsLoi3p4+nEpiUYXkjcG1kgDC4OhCMJbPa4YrR7BCHMtXJ91163ZQGug54k2A8MwJw+/wa4o/KIksTgqkUzUL/tYQZ0cE1ioji8mU+er5nzHFdUfkLg1Cjop2mSW2GxVpMIuc20+oEXqqSinneGE800D87/afKnkxcEom5aRs3/ISCjc67ZD1nh2JSQ9j9zWH53RFWn5mHy7+1Uo7TNwbZXfg0aJFv26+jS99G0/fweWSL9ESK5K/QYWAKv/XOvYMT2hW29TPl4DlGKyJnEcFKKkyjnNUoLa0oZigcXA7pRr/IyKyMZC3Mm3p4y6WGVMj7pBr7McpyN3cSi9F4jZ11zfS5DH4EH4djA1N/TH1bMN+8549t//L8qq3I+XNQoXw9VSrOghSh8C2xDwJnLpY63ut+zk3RXhaxFAeFRoSurm0nbjaiJEb4y/QB/dLGd4D9D1XsYC28yLpYD1MtQMub5VsYid4mX7rAfh1y6moR3xg8+D06ZWv/rm/AkYUpNvg8kgEx4iNEHbUnGNLyF1VrS0dZkfAlFuoig2so7QCBsjACEXiRMUxDXzX369G/lUz+MNvGapYMuMbCEE7S6SP6h691abWAeuzlNdPMlNJxL1wiNsNZwrfqPoLqrfxEH6wSqqUPI4LVa+ubfmsRC/O6Sxs78TseBQHt3NkBIrw5rP75YvLGgh
X-Forefront-Antispam-Report:
	CIP:139.15.153.201;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(136003)(376002)(230922051799003)(230273577357003)(230173577357003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(40470700004)(36840700001)(46966006)(40460700003)(40480700001)(82960400001)(86362001)(81166007)(356005)(82740400003)(36860700001)(47076005)(83380400001)(7696005)(2616005)(1076003)(336012)(426003)(16526019)(26005)(6666004)(316002)(478600001)(6916009)(70586007)(70206006)(54906003)(8676002)(8936002)(4326008)(44832011)(5660300002)(2906002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 05:42:32.8594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc42006d-0c35-4bb9-e39d-08dc1b0cee2e
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.201];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7956

Rust documentation tests are automatically converted into KUnit
tests. The mainline commit adding this feature

commit a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")

from Mingual has a very nice commit message with a lot details
for this. To not 'hide' that just in a commit message pick main
parts of it and add it to the documentation. And add a short info
how to enable this.

Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 Documentation/rust/general-information.rst | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
index 58283f4894ea0..d68460a2fea13 100644
--- a/Documentation/rust/general-information.rst
+++ b/Documentation/rust/general-information.rst
@@ -100,3 +100,97 @@ Additionally, there are the ``#[test]`` tests. These can be run using
 This requires the kernel .config and downloads external repos. It
 runs the ``#[test]`` tests on the host (currently) and thus is fairly
 limited in what these tests can test.
+
+KUnit tests == documentation tests
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Rust has documentation tests: these are typically examples of
+usage of any item (e.g. function, struct, module...).
+
+They are very convenient because they are just written
+alongside the documentation. For instance::
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
+In userspace, the tests are collected and run via `rustdoc`.
+Using the tool as-is would be useful already, since it allows
+to compile-test most tests (thus enforcing they are kept
+in sync with the code they document) and run those that do not
+depend on in-kernel APIs.
+
+However, by transforming the tests into a KUnit test suite,
+they can also be run inside the kernel. Moreover, the tests
+get to be compiled as other Rust kernel objects instead of
+targeting userspace.
+
+On top of that, the integration with KUnit means the Rust
+support gets to reuse the existing testing facilities. For
+instance, the kernel log would look like::
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
+Tests using the ``?`` operator are also supported as usual, e.g.::
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
+In order for developers to easily see from which original line
+a failed doctests came from, a KTAP diagnostic line is printed
+to the log, containing the location (file and line) of the
+original test (i.e. instead of the location in the generated
+Rust file)::
+
+	# rust_doctest_kernel_types_rs_2.location: rust/kernel/types.rs:150
+
+A notable difference from KUnit C tests is that the Rust tests
+appear to assert using the usual ``assert!`` and ``assert_eq!``
+macros from the Rust standard library (``core``). We provide
+a custom version that forwards the call to KUnit instead.
+Importantly, these macros do not require passing context,
+unlike the KUnit C ones (i.e. ``struct kunit *``). This makes
+them easier to use, and readers of the documentation do not need
+to care about which testing framework is used. In addition, it
+may allow us to test third-party code more easily in the future.
+
+However, a current limitation is that KUnit does not support
+assertions in other tasks. Thus we presently simply print an
+error to the kernel log if an assertion actually failed.
+
+To use this it is required to enable::
+
+	CONFIG_KUNIT
+	   Kernel hacking -> Kernel Testing and Coverage -> KUnit - Enable support for unit tests
+	CONFIG_RUST_KERNEL_DOCTESTS
+	   Kernel hacking -> Rust hacking -> Doctests for the `kernel` crate
+
+in the kernel config system. Note that these options should
+not be enabled in a production system.
-- 
2.28.0

