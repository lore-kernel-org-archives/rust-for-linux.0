Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2053.outbound.protection.outlook.com [40.107.249.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5338C6A009
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jan 2025 06:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736230915; cv=fail; b=IN2AxY+zQeEfWdiPKaNJVZZbE9IuCPB5zTkX05tfIkhLqU9UrIWpFQrbwBz8dtTNT98xcbvBfbwKE2FRrlDqlPSmU0In1TkkQbQh1WEJqqiM+5VWrfeFiwRhp2wn9+zHKsu+i0VN3TacbR8u0KfcRUm3RYpwAp7h5z0LssbWpQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736230915; c=relaxed/simple;
	bh=QepbX6lpHmNFhPhhpgAtdLVfAtu8r3tBO/s+WUWbGQE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XXpxs0vmDVlLJ8Ryte/YVs9i3cYC01QJiy4bPiup40Gts0oGkXUbv2oLQ8QVCaHakqMQZaH4chG5TM4kFDTaetL0BQUJ9hCbAufs1Us0zCiCDbrHIgD/yFJxD2WOkHubmFAz7FJNxetW8b2am23utHci2016gUe3B+A46YwDoK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=Rc7mKGxO; arc=fail smtp.client-ip=40.107.249.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="Rc7mKGxO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ua8j8sXgQHAb/93KMjxl6BTBjXf66Y2FBk+8CHMxOLcjy8Pv0jMhZ5FW2Q7gp+ZV4W0H0goY0EefeEEVmKzZv96vVIbWEgAiPDW8eUoRM5Yssw4ISujld20J2+l/tzAQsu/FMjw9jiE36sr+ExB0DKy+cfQfpIuEPWp6N/kGlPIwR6OxK8WqoiiavdJj6OWF0/vwEr9wVtxKHiqAXeel9kZcajUylqutfS5Yw84Nlu5g+2yMyw8FZowdGsWAtIM2uHrBMSRa89cpxitQywOv6z7w/+yxYtvD7ZnM1UhTUPpVmGa00+RDLnYL8eY6iDV70rYNBwC6cCBZKje7qdxKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/8PU8VXmoK8rPntnXN8391QOZET20tlzpf6iQU4XUk=;
 b=y7zWB1UNNg+6k2xKEEL2BlFlhGU4wUzzEMwmTbw9zNo9lagSJzlgltekegmhKj/DegXxF0BY+o4EceL0JtwwhY/MMdeXG5TUmrqaFJPiJxRZccurLA7YxvJi0YAav3FX9K9PEL8soRnhbK+VFZ9nWqpCEABFh7Vf+GClXVISJrnXf0Pj+2li0+nMyiinWVpK1rNzA/b3esGhdDS4Rdb8Qef+MCCcPR6s6Mi+ru55zCEFNySUcejRYJ0iwNcgP8i4/Hegy6YWuNmSGnjmJXOGIk1dCt9pKfeL/YRWC94EM1VwysJCuIw4Oid+LYuikyaZtUa7/ap+5aDX8e6sWtqB1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/8PU8VXmoK8rPntnXN8391QOZET20tlzpf6iQU4XUk=;
 b=Rc7mKGxOTuSWtQht7SAACSqkyriVDfAAFuQ7LeSR9FHCRIZjkDFRXHiUENUC1CGxu3xWldOCb+X2bhv8tziLq6Ts5Q80P7p7qCaGUPyp/nq6AoOiGAqUjEczRJbsaWLhcCG2Q74v4tfjEVvDidBhx7ksXMK+PRZU3btuA48+Hx1QET4AVueX2HHg7oFDGkf5ayZDXcHkl9PzYjg31G3VKCx5iuzMbH1Om05MeA5/pMSQEcOUWhrC5wryF5hYWHBcSH9Kjhxu/7He/iFpIiKYlPPK8W8mxHG3kllwYsa8WANs9OAvsBcrrOLtFmuznftxmwJfwZrcMNbHYzb9pC2l6Q==
Received: from DU2PR04CA0228.eurprd04.prod.outlook.com (2603:10a6:10:2b1::23)
 by DUZPR10MB8150.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.9; Tue, 7 Jan
 2025 06:21:45 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:2b1:cafe::5b) by DU2PR04CA0228.outlook.office365.com
 (2603:10a6:10:2b1::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.18 via Frontend Transport; Tue,
 7 Jan 2025 06:21:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 06:21:45 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Tue, 7 Jan
 2025 07:21:42 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 FE-EXCAS2000.de.bosch.com (10.139.217.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.43; Tue, 7 Jan 2025 07:21:42 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, <ojeda@kernel.org>
Subject: [PATCH] docs: rust: Add error handling sections
Date: Tue, 7 Jan 2025 07:21:33 +0100
Message-ID: <20250107062134.2981602-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.46.2
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|DUZPR10MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fc0dfa8-6b96-4229-3377-08dd2ee38f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q+twTBoEGEzMGbq4usDe2obOCIZKCm8jp/a6sOO+DSBKeXyt2uPV6tuhqLQX?=
 =?us-ascii?Q?DipBpqGmmbDjga6GkvAgx5IjHt/7Pbkw9TBb0Izjx+hKaxDRbRGWWhh4eB6k?=
 =?us-ascii?Q?Ts3pVuRWpjMtOV0ck/QPidI26sPhIOIlnVwns0/eeG9WH9lEaUZlSnlbZ4td?=
 =?us-ascii?Q?O7jXG/dZ3eJdWlcGjm9bxv+6jKvEfppvjKXioXCoh2lFRvmYU9/ni7+BpjQa?=
 =?us-ascii?Q?pK8+/5kZcvsWmzr4eSV0M6T30OJNQR4oanRTJ9gp7idDuxzIejQhKFdy1j2T?=
 =?us-ascii?Q?MzciZHBvVTIDs0NyEVJOWcHmk5QT5dnYm0lsd9XQNl8sx9Sg5aVVecimSSLb?=
 =?us-ascii?Q?dcNdtAhX+hdA+hAoEFCwVKdyA4bTo1mm+R2C0enJyCrrMUBa9TIkZn7jD8IN?=
 =?us-ascii?Q?m686mDo1eZXpJt/xIyeL+C+O6qjUIgsZdF1Vk/H98CPLszUGTMGCnsJGbkmg?=
 =?us-ascii?Q?Ux8uyy9rES1T6wiNqflI7/0oV1tkHh/wAdStETRmQolVDrItduf0ouByvWhz?=
 =?us-ascii?Q?KALNYj97BMSzeEkylWOuqrpBbo1pClIYfddKpgIm+eyNx0X9BV9IgonCePOb?=
 =?us-ascii?Q?ll5K7JwZFoWLI1XRVXgX7oTRktIaDKNo2+2JdmTCcdEEPKWom0trV7//NMj0?=
 =?us-ascii?Q?Gbn8MpquaqMsBW+LM/ovew5NKsMcsavtAF7Ajnm1xfdcdiL76n9Iy10bxe0S?=
 =?us-ascii?Q?iAbhUwjqz8E5J55uA6DZE83mXV4M/5LzWhF2l7RrpK8Wg/CZeoxGJ4EuRPjx?=
 =?us-ascii?Q?ZhGwGtpT0ZMgy1GUeyY6moiRmuGZV9u1ARgieRkfJB4uEi1V1i5jjoeUHYKb?=
 =?us-ascii?Q?2UcWt4EwXssG0uGpIKWFcrxBTmAkVuiMmmYF0x1ww3mMpR8pV31J27fVea45?=
 =?us-ascii?Q?9BjEIoHj+IC+5mWk1JKBd2nPLr1baIqn02H4Vlx3pYkFUAVGX0kwJUmXm+fK?=
 =?us-ascii?Q?PaqDWCVNmHzSBYWQ4yRpOYvUvI6ie3heAhmPj+3QbexvfmLOfZuHxhgzMCDy?=
 =?us-ascii?Q?U30By535jU58Y0J5yysHm6Xu200gZ9PNGQoqj1THQzJ/sYtcyrymy8nU0r1d?=
 =?us-ascii?Q?pJqO2eijk46ipNu+VyrG/VY8AaT+LvDuc0h7IuSvvVEO4HcAVNBwPJc2W4K8?=
 =?us-ascii?Q?YKKynacGv9x2z8SJcnBeoFzLmhwk9WdWA36hx1aqU61lT6BTc5z5t6sknPmf?=
 =?us-ascii?Q?Wn25MNZB6OW5p/cGrMuZw7RAvAoT5DqDJhQ0WYvb7NEMOtq4xcsdqueF617y?=
 =?us-ascii?Q?3gVpOF94PF/vcjX3r5i4QuzzeWT7pVs1SGj4+V6URWoD77Hymz4FGS2C5mCB?=
 =?us-ascii?Q?v9bAz1QGaWPGdkZDkDKp2gVrusgpt0/GiTJ8i2wRg6JTAGU+9II7Y1rwbvRg?=
 =?us-ascii?Q?EPboFgfU2sYbulcBVBwiR1VetSEgxxBbPTE0whuAmqOK+hLC1ncFREzQRSkQ?=
 =?us-ascii?Q?U9N3bNIyr6w=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 06:21:45.0164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc0dfa8-6b96-4229-3377-08dd2ee38f2e
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8150

Add error handling sections to the documentation and use it
to link to the existing code documentation. This will allow
to extend that documentation, use intra-doc links and test
the examples.

Link: https://lore.kernel.org/rust-for-linux/CANiq72keOdXy0LFKk9SzYWwSjiD710v=hQO4xi+5E4xNALa6cA@mail.gmail.com/
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
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
index 568b71b415a45..4e2bc3b971e99 100644
--- a/Documentation/rust/testing.rst
+++ b/Documentation/rust/testing.rst
@@ -123,6 +123,14 @@ A current limitation is that KUnit does not support assertions in other tasks.
 Thus, we presently simply print an error to the kernel log if an assertion
 actually failed. Additionally, doctests are not run for nonpublic functions.
 
+As these example tests might be used as examples for "real code" they should
+be written like "real code". For example, instead of using ``unwrap()``/``expect()``
+use the ``?``-operator. See:
+
+	https://rust.docs.kernel.org/kernel/error/type.Result.html#error-codes-in-c-and-rust
+
+for some background.
+
 The ``#[test]`` tests
 ---------------------
 
-- 
2.46.2

