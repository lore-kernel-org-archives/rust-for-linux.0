Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011014.outbound.protection.outlook.com [52.101.57.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506663C8702
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 22:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180046; cv=fail; b=vGqw4tj0Rno1TOxDrJUMC3zC3feNEJs4/lIoaZql140gD1RxSmgNWW8h5TpE+aWGwD0S6sVRsaHaP8V8JlW4A8wAeJohdm6Z3j8W0DdhgttctnT1RsNYw01K42YgefYG33kJHhDTU7HjoiBJla93U+0j8LBK4BqtR5tqPwehyME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180046; c=relaxed/simple;
	bh=X6tuP/9YJ0an65o1Ssa8f08WJPRaWKKrpt0nXMETCBM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kUwC6jjrP4hjzv99jsxa/T8bT7zCj3sGkX7E1X9BXQ4tDFkuE7OJJJPTTSBZWqHyQPPqj+8osIUvPV+RHenClDyCdBCRqjknpSxoj3OoTnUi3z3kZB3jp2gyniDjagjF2Ux8i6jolOHzX7wfHG//+uyadjYPbJUBC95rmyPW3HI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n01674bc; arc=fail smtp.client-ip=52.101.57.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n01674bc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c968GQEPWx+yJYHPUqsPM3Mjf9PxB4plVJMiI6XtKlz/Gpmd3LbolGcw8kTNxcUMauUvdQ/QmsfhIr5L6k6KXDRwkvLOz2hkq+yHbj0+qR2zZ1ahOGC1j+Hweaw3K2Thmw4KuDbU4sJlwRHa2i9uIKywy/MEaBSq+1SOP0a1I6ga/6tSaxPQn/lN8LyLHvr1DNLnnA3OXfk/laY+pxM8IzkSMLzkdcsD2SWK3okQH7rkwIfrp9mZpVm1XXg6H6v1Nh6Whw265OkGZrCz8TiIn7eBXFS1LK0EdaOFghIBBJWJJQtycw1QBAB3r/2vOZvKkxWIGnL7YCZWviZeUvdYyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3htRNtiyfHJ++3QS4gKULJ5BXvQ/jQvxjR5Amz7uUJ8=;
 b=h4q5tR036u00Qy1g0bBcwaYCYUCyn8F9xAr/1BduVgc4Etiiu07qjswHgsWroub7btS6CY3xUmLx7qpYcAoHNQDKRnKj+9SYd9uv7MC4PFFqaD1pBBPeboIX8GBx+ptXXY2DSNo0sRRb4c+0FENvJ4w4A5mbI7VZzcRmiA0j76AwJnllTElxbN4f9c2pzIbmlSdlcHcu1W6baUf+Ia8Pgmy97ngoCVYlvewbfzLAvUwy452kpGqZlb2fzCIsmF5j6ySl6qTXtHvjNqdnvIF0ZBOnkaQ5Ydm2h+6i6Q6HTOHxMO++BVlOrTsSyybmsxVp7GzN/Y/GLKEMfLpqYGa+ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3htRNtiyfHJ++3QS4gKULJ5BXvQ/jQvxjR5Amz7uUJ8=;
 b=n01674bcTwE1NeWzVF8eK0u+KXo2eg9Jm5e2o6ZK2xEFWKmJXMc2wtf/wAcDk5Ez1KQmhIr4ZpFB57a3ibtJgeHFvvyP+PO6EYZn7wBNqEP6j3GKO3hkP7i57WS8D+azvr6n+AJSd0h8Gqcfsp9J8ZUeshI7Nb0QlljsnZ+YEcqAfcKRYL4oQtaQQKV+CATXBNlYvDQO2FJmtRRRfo4bhgsnsjVLkzCOoVthUe7W+Ja81PWrY1kFd0wLsxDXLuvCKHmmmqc+i93EqKZ/ZELaKLh3ZAT5LfueU3j7O5/lUZaCJ2QNzwVK3hLiqs17iPif4jQfkx0Y8w+mYA0drvAvxA==
Received: from SN7P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::24)
 by DM6PR12MB4092.namprd12.prod.outlook.com (2603:10b6:5:214::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 22:00:39 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:124:cafe::11) by SN7P222CA0026.outlook.office365.com
 (2603:10b6:806:124::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 22:00:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 22:00:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 15:00:16 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 15:00:14 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH v8 1/7] rust: device: add device name method
Date: Tue, 10 Mar 2026 16:59:54 -0500
Message-ID: <20260310220000.1897166-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310220000.1897166-1-ttabi@nvidia.com>
References: <20260310220000.1897166-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|DM6PR12MB4092:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f2085b-3f0f-41a1-401f-08de7ef0775d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+DE+MHMEwzIvK32pTPsTrmB7pYXpr8wXEIPfMXRjQK6gxKXFw0EPXMW9ZZJr4sDzGhPzV3l/aZgMabMXdJRH7bBxYSE8ijw6AXHQPle20M8vzE37AS1K27ojaeIbSR9nIoMo9Yb1DGSRjy+o6NymGvywXrFzWpG80fDuBtQRZDorldtphCev2bLBZz6gsX5V0HUpNZtwXawbZ4IWJDLnUCU8G0P1e7Aw81j02OdPe1UH8HamupEq3FOOp/CDkI1gqBq2BWrR6gPAHz8UYTuGA4vkXiHORWt9c/PzkxobiDLOgWMPhCEcdvqmk9fQ0NzW+suZZNZEgczPItXJQzoNi1uu5e1dh1X91xuT+eNASnf5zTSYvbe9IS9Zr4xvKlJFAqz4Uy4xUDFUDSOOwOsZ3IbyJrbiM/aZI5J4p4G5rksqBiAWHY8k/OVtgjkDOngXkco8FrUGH5+6NeKzYZGhNRNCtm+yoVTSna1kUj94+kZPlAgphHbpfM9PE238CQEDbHiUKUGqBUnxrbuPqdeNYMPMth6+A2kNzw3/Q8nmvegjZ0LoJb5s2ZWTZ+VDlc10wacKKgM9fNPzXoh78RM6U4XTDBpNYLhPMBxlmDO/9VlaBEC8SMYFormrgX2SgbpcGtMYVz2XO9O08IAQEsmeiF9nxo7YTUiD72s3OxBOvcFUPqM0ybyeaPVUK0XjyggGJ5OeqAJjuzo5VoVij0KO3m7BYXEKJN/ri2zJ0SHrt0a/FjwphfMs3aknZnqtEqQ3N+Gz5sz1Zoxep7XuCdMGzA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xcHj84wTVHWvNgUUBNbnuGwftTWrSpjY0oq7hLt1YMam7xOPTh3Inh7CBNLsuDz6YhE8N4T2phOg4tPCrnfknzBsh0YwCRe8YrO8nHxRQdDVakr1Y7GEnMl1iZ2kOW87bkJevrgeBnR5ViBU1bPxnAVb2+y7bXy155TGlliLtqHBaiS1lEtXSrJCiQ5Ilr3zrge19um2dQ5ovGGBCigHcMETP7C+XN8AD9JkuMfD5GLcYhhBkxpwrpzRN4pV6zOnQw/PfYh4kW9SPfvpk/wuE62eZLXFcd8wkhyKvHHoXXdGG0FWJBpCa68V2ZRcfqSBH8xnzEEdcG1Ud93ai5+FwPXq5toxYt4ELu/jLuNyjxuRM3p2Pzkm18S0vND4iw2Yk/Jx0Jc5T70RwjnczRN4ypsk/EHz6gZhL6yfHhGGDoDLJxQDtc2vrZZq2zDthJL6
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:00:39.1565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f2085b-3f0f-41a1-401f-08de7ef0775d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4092

Add a name() method to the `Device` type, which returns a CStr that
contains the device name.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/helpers/device.c |  5 +++++
 rust/kernel/device.rs | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/rust/helpers/device.c b/rust/helpers/device.c
index a8ab931a9bd1..3be4ee590784 100644
--- a/rust/helpers/device.c
+++ b/rust/helpers/device.c
@@ -25,3 +25,8 @@ __rust_helper void rust_helper_dev_set_drvdata(struct device *dev, void *data)
 {
 	dev_set_drvdata(dev, data);
 }
+
+__rust_helper const char *rust_helper_dev_name(const struct device *dev)
+{
+	return dev_name(dev);
+}
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 94e0548e7687..6be93425fa0b 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -489,6 +489,16 @@ pub fn fwnode(&self) -> Option<&property::FwNode> {
         // defined as a `#[repr(transparent)]` wrapper around `fwnode_handle`.
         Some(unsafe { &*fwnode_handle.cast() })
     }
+
+    /// Returns the name of the device.
+    ///
+    /// This is the kobject name of the device, or its initial name if the kobject is not yet
+    /// available.
+    pub fn name(&self) -> &CStr {
+        // SAFETY: By its type invariant `self.as_raw()` is a valid pointer to a `struct device`.
+        // The returned string is valid for the lifetime of the device.
+        unsafe { CStr::from_char_ptr(bindings::dev_name(self.as_raw())) }
+    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
-- 
2.53.0

