Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013007.outbound.protection.outlook.com [40.107.162.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2F78BE7
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 06:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736922383; cv=fail; b=P0dqSgxogiXw8kEGZZ4Q+rY+hP5jp5tXsco09F5/sFjI4hQ/H11/ZSJpg6bOcx+fBxnHI7g4AFQ+iKoIDCbAzoY5BI08X+ZVWcl/Pp72Imq/83RmHxFNevmOzHXiYwhxjyAHPy1NOu+XjaNRfLYOYe7meSBJN37iyc8fmJweeFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736922383; c=relaxed/simple;
	bh=RXdqveWbGH20ZPhkFJXyHoG/qMGuBxRfzR/8ukbHWvg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C6CuHOb0+14U4JlPCtDVSlDBKqweB1HpzC37nTBVV+AHnce72PI26pt/ws8M8MGfQmwHMsAylrXrlyW8U1l/N37CLqLYN/WkTDWlXcNKi0BP/2SHaxaEhh9Ri3RFGVrTO0au0RV9pLJ9+IMU3sUsf4mjd97KCphic8qNF/0VAys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=snhMcNdH; arc=fail smtp.client-ip=40.107.162.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="snhMcNdH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0zzER9N4nsodT+CRXn5wF0xZyOTFlWIaowxsp52kFtQ8RgaRKRrRJddTw218DekGwN7BOToYMeHSbvEoINA1gwOztJ+P9x+hEzubpf2Ye7h2cfPR+wue4PmQxxmma15bGo10scGH66YTYw4lfKdCN/fyYu+gpzgJg2R9H1nSEg7MIUgpJQOXZk/xUYDGQRv/ORR+/Je6SPNI+FVbUeVVUe1NacsJeLNqbUVyrtrurB0Z5GABhmqg/aGf86u+6FjhsIFE+L9NEBf5v9sU6vzfVj/58jVSLBpHH6io+5yC9W/F+cMKUlko3RgRKNm2PT39jh/ra8mx+k9ut7kjJSi+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbniFiOiB68uP0QnPUCg47Ok7qunJYCBjv1CPphQw04=;
 b=e3PB8oyGHwGUAx+jD4VlB3Sr5bF6lCQc9EDw+144LyvyxCkO9zdE4Pgk5HFWavupzseO1luP8r3/RWbgqb5tTFq9yFP5VvOPHZoskRjwmYp+DL4M5ivZBrxU/74doGXhoC1pRzuTJgc8IMkz6zDDA59q2ZF++skBZRQMpnWHjcatyU2N7iDxv9A65arAX56TtZCEhY0IfIjF/OJK+FOiu8LIOit9RkhJKUc77c2EF1HkfOdieGzj9Ws1ozVTHx6sOvvE4SwDFOM8xtmgA0FvY4IVD+27ZSEMOWPDh/+ZQ68uY09d7Rab0pMDvOFr1EZD3s8H6Z32O4o/qE99oSkHpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbniFiOiB68uP0QnPUCg47Ok7qunJYCBjv1CPphQw04=;
 b=snhMcNdHrk2vQ+a6Rh6SK7IZvadxgh4UEfI2MTcdAbDve2ad9ViyapBBjDVZVgFD+ltQ4oA22+HPlvHi0hbFcQpLcOsBdqT+/31mGkOzgnKYj23neWPla7uvUHrNVhcXiOKhGaSubfA7/AobKewaBHPQYMWcgxmj0CCeclHT9+PZQFqwlndTiF7z+/yVDXEhbCVp0keO0TrQmNx32leOaq0LkM5e8T0zUXLqDDcTASQ0fHzoaGfYIL9l67MObWcH9UYOvbolQ/jYbNYIplXpVmVGH+mEmrOr78D29shQLsT6AnLar5SXxFTr/2cJjXobfVmXRrqWBDMkb+rkS6+aDw==
Received: from DU7PR01CA0042.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::26) by DB8PR10MB3749.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:167::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 06:26:16 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::7) by DU7PR01CA0042.outlook.office365.com
 (2603:10a6:10:50e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Wed,
 15 Jan 2025 06:26:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 06:26:16 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Wed, 15 Jan
 2025 07:26:05 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 FE-EXCAS2000.de.bosch.com (10.139.217.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.43; Wed, 15 Jan 2025 07:26:05 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, <ojeda@kernel.org>
Subject: [PATCH v2] docs: rust: Add error handling sections
Date: Wed, 15 Jan 2025 07:25:52 +0100
Message-ID: <20250115062552.1970768-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.48.0
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B98:EE_|DB8PR10MB3749:EE_
X-MS-Office365-Filtering-Correlation-Id: 100cbfa6-a5db-4e87-66ca-08dd352d846f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?71IPPViPeJ8rqy8lMZO4o6OV86QV3+VG05fXOmkz6rU8TFbPmY7ru232scPS?=
 =?us-ascii?Q?1bshJROPAqC3LO63oo4pBi+0CYB69FNY7Pq18O8J5FzlpGOpuzuA/BsBVaJs?=
 =?us-ascii?Q?C5i5haBCTy0xOrELlcmBLJElmsiuM3J1FpFg00xICX97b5OpQqrhYM1QmJbI?=
 =?us-ascii?Q?30O6/UO2pkxN6k0wYW00LAAjB1Ll8UCFylwtQF0svk+ZYLSCJvd54HaPzHsz?=
 =?us-ascii?Q?XaisitUORFpt5xHeg0c8woqU4/FAWJXHsAmvd6aSRxqL6MVRJ6OJYQpQrC0g?=
 =?us-ascii?Q?5yLKocy7yS0gfRdrY49ARF5xZW8bwf5LZONXLfn9R6+gNyCcOR+wVSbBNrMh?=
 =?us-ascii?Q?wm7vYiplapaQA1dw4B41GwVtQCN/sjLeWM4BXNz+hPqgspNfBwReh2iTths0?=
 =?us-ascii?Q?i865CCD2Kzn6+97Eiqnh3rfsP9lP+qjaPCYiyX1/9FN5zXpWNsfpnNqmWut7?=
 =?us-ascii?Q?emc9NSnxkNX3IEkFO/oEC/7J5SIsBvqmR4jzRy4qyTTDKvf76vwDTgkfPxmh?=
 =?us-ascii?Q?w1S+WfJceI1cvxvfvdf7PHBqEKwzoLI0FgMCAqEpl18X9fhmKO6rbVeiJ3m/?=
 =?us-ascii?Q?SKo6aOeCJYQ/J3P8GcuTPQtKWFbznRaGKaV+BOtidDP2eqgTrc97wybCCUeC?=
 =?us-ascii?Q?nlg5ORKQt5KfObYhukMBeDKx7TjcuRuKlCHoKWsflu46FEsaRSRD69tegA5J?=
 =?us-ascii?Q?9JwH/ac7rwuIsGGTvGDQUhkkS+GMGD06Vviq9Fat5ZoRy+lViIcniV826SYw?=
 =?us-ascii?Q?6ZCqbonz50qRpvzC9MKZPkwZCZp7K+pbHsfGRZGKzHjMRQ/LcS4NT160mcUd?=
 =?us-ascii?Q?05um9XMs7cpdrRCn3IAPFskVU22ATkkvypAqZ4hHu9Bz4fiA8sH7A9N9qy9g?=
 =?us-ascii?Q?+qLgX2ixPGmcblr4ad4Xl8i37JXKyNIpAPUmzq1m/EGsajqY+Pv4Gm3ynrzA?=
 =?us-ascii?Q?BmrpyZ0hKxNxw7xAeWY1f5+2RTjUHZiCLuZj7bkv5qPy7egw9diMrC5n2bMo?=
 =?us-ascii?Q?EFnmGh37OcvP14Ax2W32uXlEbq6PP1MZGzFRai8BZxCppt1Vlt8s0XuiwENU?=
 =?us-ascii?Q?RugDtG2lYylNjSW1gpRF2YVKs4I+Wtykq6/LFuqCpncYhd2zKuTb6sjj8DFK?=
 =?us-ascii?Q?5mmBjfxRwBnYV8O17onrTeQ18k9cfKDHdBA5cTPCFlR4lYfup4eiTlzd7hzb?=
 =?us-ascii?Q?6ohMnEGc0HQAAPeLU2IY2krroQbC7XvPsbQoG0lkZimgXrTwkdgp/WEqJpTY?=
 =?us-ascii?Q?oUbwhZzhK5jTArkbIYKTSG0tfNJJnmp67nt18OZoIOGWQX/5Iint9nm2dH05?=
 =?us-ascii?Q?C6BrUaSw7PeBFVxM98bsqA4x1oo1TbFIEdTbavGg3dfqyt7bGdZiEXbhBNr6?=
 =?us-ascii?Q?ZhcfQRYMRmY+hdsVemGCvihunhHd3ZmppIxrGE+8Jq/ju8NP6tG0vRtv56M3?=
 =?us-ascii?Q?Bzk0JD2wNlE=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 06:26:16.7234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 100cbfa6-a5db-4e87-66ca-08dd352d846f
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3749

Add error handling sections to the documentation and use it
to link to the existing code documentation. This will allow
to extend that documentation, use intra-doc links and test
the examples.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/CANiq72keOdXy0LFKk9SzYWwSjiD710v=hQO4xi+5E4xNALa6cA@mail.gmail.com/
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---

Changes in v2: Rephrase the sentence about "real code" (Miguel)

 Documentation/rust/coding-guidelines.rst | 8 ++++++++
 Documentation/rust/testing.rst           | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/Documentation/rust/coding-guidelines.rst b/Documentation/rust/coding-guidelines.rst
index a2e326b42410f..27f2a7bb5a4a2 100644
--- a/Documentation/rust/coding-guidelines.rst
+++ b/Documentation/rust/coding-guidelines.rst
@@ -373,3 +373,11 @@ triggered due to non-local changes (such as ``dead_code``).
 For more information about diagnostics in Rust, please see:
 
 	https://doc.rust-lang.org/stable/reference/attributes/diagnostics.html
+
+Error handling
+--------------
+
+For some background and guidelines about Rust for Linux specific error handling,
+please see:
+
+	https://rust.docs.kernel.org/kernel/error/type.Result.html#error-codes-in-c-and-rust
diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
index 568b71b415a45..78b66b67b03fe 100644
--- a/Documentation/rust/testing.rst
+++ b/Documentation/rust/testing.rst
@@ -123,6 +123,14 @@ A current limitation is that KUnit does not support assertions in other tasks.
 Thus, we presently simply print an error to the kernel log if an assertion
 actually failed. Additionally, doctests are not run for nonpublic functions.
 
+Since these tests are examples, i.e. they are part of the documentation, they
+should generally be written like "real code". Thus, for example, instead of
+using ``unwrap()``/``expect()`` use the ``?``-operator. See:
+
+	https://rust.docs.kernel.org/kernel/error/type.Result.html#error-codes-in-c-and-rust
+
+for some background.
+
 The ``#[test]`` tests
 ---------------------
 
-- 
2.48.0

