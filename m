Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011010.outbound.protection.outlook.com [52.101.62.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5701E9915
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 04:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766030583; cv=fail; b=VfXX5YRgVspVg5vjqKOMTKl9rgCnW+p0FyZ7cKaAQbvXi6p+HaK2hVFNojxR0E/H/Da7RPye3NSCooUHmFAvWMe6mAVASiXStmBaTVHz2YlQEDHxbOOwnqyHjjjwHJtZclsBeMDuYF2hNHzpx+ZZ17MksR/HlEnnAMnXErHiMJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766030583; c=relaxed/simple;
	bh=2fnu8fc1qFZBNm76DSzzwpktKdp7dm8DYm6RcGBb7UM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EShenu1Jvyw1Z367S8A+EUDdOZe/8Lhci+yhx7pO9OOMdeWQAwdIKR8B9gZmmU/9rKkHGUPWpHgkc8ySNvzi8BlYWvFT0MBJB9NEHZasdG82g4W6gTmQ2iMPdKA0pclT7vpk9g7U5mjv9HNu7ELXPvmtpy1BJQcNx7Xe0efd+jE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=USBigK7t; arc=fail smtp.client-ip=52.101.62.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="USBigK7t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uzknl9FbRLRH8Lieyk8cljv7PkCbvFwPguJ37SMhdJmzRuCBlrr7i7LCxkIIsEZC2C7rGwDCS1ZAOlzO8Ye961ljgiQHMpOD+p7ZhpO+2xQnLLarvhABLdLg/NrCW7hQXloyLg4hdgJrp9N9ZamsO5O6QsmFCZGMc+wFcj+qFis4mR873S0FYkELh3s3e8wkJqDTFh8jmH/XmRUzWLiXwdMrrjyC59ngG/8JVkM0wM4XwFZ0rfx8VTHPkmjkz8I7cPP+DewRjrpRWYrucREz8lCRu6Fjm4m3BtQvfB5NbXqpRLJ6Jcoqtrk5gx0cOBzABBHk2p3o2SuKKsiKHSspdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raH+s7pTclMDT1PpP++A8netEBbXRh7XWrqxFT8NTFI=;
 b=gX0E4E22wEbfGCkVT1WFtWn1LQddIFa6Ap58cVK1eow1YxZX0ji4p/NkGJHwLDX867UAd4R24C42JdR4RzAXXu0J1yio4Wi1cDKso8/LC8pXTdcyhNVqT/jJ+32ExkqhywXLt3P7Yds1mEjaA4t9G+8MSHnvWJcAs17uUOuOpMICyoqGBFdQ6Wy3s2A0v+WcRit8S5vjLXFMX3vFVgz6tpvu9z8Bx6T+Pl0JGtF6SpbzWEoDTIsWTlAnD5XL2UB0SwgKbESL/PgzhRRp8KRh0OvF98p26dV/h9/gsiZK5mi1bRaV1jUBqd6D5q4UMklglMIBm/Y5yi6IRPG/jdEaNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raH+s7pTclMDT1PpP++A8netEBbXRh7XWrqxFT8NTFI=;
 b=USBigK7tcus2k/H7CK6V5wi8YBwEHfRgkRH8QMZAR3/oWEFGCvADQnaVuLZ9O3hkYFGLR5bsu6/GnBLXTnl+eNSsPhlWmVGY0a5fy0ujCqERWc6EX2+A11V5rj8cxekoraeAno/k77qJ8qlXHVTU1w4IDndgROfcrV3S0rjnA23LSMLLVUlnnb4HUV8D4UyqxYWW/yxGqX+RySgmmuytW5HqZrgOnqEz+igSg/4XuzRwkMrSe+7Y1jh6X6ZvVynDVjkRoIV+gswC8XuTnic0E/DY+7KEqunEP074QJi9kv7jkqoVWtI3duws5h5uC9vzVRAyc6slWQokQKsgsT2O9Q==
Received: from CH2PR10CA0029.namprd10.prod.outlook.com (2603:10b6:610:4c::39)
 by BY5PR12MB4083.namprd12.prod.outlook.com (2603:10b6:a03:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 03:30:24 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:4c:cafe::4c) by CH2PR10CA0029.outlook.office365.com
 (2603:10b6:610:4c::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 03:30:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Thu, 18 Dec 2025 03:30:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:08 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:06 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v4 03/11] gpu: nova-core: support header parsing on Turing/GA100
Date: Wed, 17 Dec 2025 21:29:47 -0600
Message-ID: <20251218032955.979623-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218032955.979623-1-ttabi@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|BY5PR12MB4083:EE_
X-MS-Office365-Filtering-Correlation-Id: f2daef49-d1a0-455e-4dcf-08de3de5c7a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CTLykylM4iMC0sf1oToR4dnYlJyWwjj6g5xAF0brLB8LnfK2xCyaKa00WATM?=
 =?us-ascii?Q?8L4nFjHf0mLf7fjjqBOL3gaOGI5T+YiG2RhjmZj7E3CFSEleTKWbSIouPmSR?=
 =?us-ascii?Q?7YEEoZx870VS6Uz8CMtNSyAku9FcSRbQW9z3dYTkBu2wntmvMVXdsKIUuyHG?=
 =?us-ascii?Q?XtORoMweFH3t/auv7V9QBCZX/kT0tY5k5oLUVdc8qhziGVBFGOliYU0qmkG7?=
 =?us-ascii?Q?lkkdK/yfVoANaXOxXzq1QWvJk09qcv+cRLS9QEAzdz+EjaFfnZ/eHbkVXt+h?=
 =?us-ascii?Q?zNO1q/vEp1RmbJX6FoxJW36aoe6V7jp7auRDXZqBe2iMLPM7QyUgwMyrypbv?=
 =?us-ascii?Q?OAU6fUMqeGZclhR+NKQ5zXlg3tyjsLhFNTF8boNjit7A31p09M/aFQTkedeB?=
 =?us-ascii?Q?zdLY7S/4Try7UVhmuLe4rAxvSTt2f/XysJQAO8A7B+krPpDCUzfMoZCz3Ozi?=
 =?us-ascii?Q?LqwI/KZYsD10cgcdJ8bhdt1Nf+636whci4HP4YIvoQ4kcH7YZvdon/lkY9FA?=
 =?us-ascii?Q?gkc6z9EPkSGOwrw9xrSI8eGR71Y5PQaMC5PaavHrVvItwcdvq5kWDy6Y78OB?=
 =?us-ascii?Q?LhUUGj8exzZPsvIaijodv+fdLCo+WAtQwyom6ypTRDV0Y/+ReHPJ16NY3N04?=
 =?us-ascii?Q?aqTGwHqbNeP9PuEqcIeQiDUokTp/k2gGwfk1hUm2lG3WfYZNwqnMWNClsjqs?=
 =?us-ascii?Q?Lwy2KpiE515IyA/ByVwq+XGCZi8UgNLAf41mOc3YnRu1opoAaTRPq6s2e80W?=
 =?us-ascii?Q?fdS0QAUOgCZUhLeEwgIiYnhN88y12Pceu9YHyx2yRSElA6b6NbTftwYA0UGq?=
 =?us-ascii?Q?1KdB9EpWDSL5cQ1xDPieAQa1xYkgFg8Xd/tkzvinXStBK6/Y7aiqrcy6sFl3?=
 =?us-ascii?Q?Yk/OR8wM/Oh0asg+1w0SFg7sOyXZrZmMZP6PyfPVyPVFL5UI/oBOw8DWqXBr?=
 =?us-ascii?Q?fL3uh50mFuPFdKMLymHaIlgKkUogWyQJeSKBK3TwgKM85Oy/EdsWs6rmaswO?=
 =?us-ascii?Q?lyY4rhDiq0MslZBfCsJvzquIyhRF+vA87pFNzDGrkdhTd1+acEKSFRgBHxAW?=
 =?us-ascii?Q?rp6Yw6s5S6X1+BWAB2VcvGHsCzjg2aZjF9Y+bK4iiGY+ZMQ42JUMjgaacF6l?=
 =?us-ascii?Q?KgKpKLMxwtaJZzl26kQE8xhtki5ut41s3Gd7fFQmGGwIOsRmY9+Cutd3cuL+?=
 =?us-ascii?Q?RLf0+KwSapKerq8hBbkFMtX4Lcuq3BdTwla8rUApLYxwbTPDJxx4Oh+tzqjq?=
 =?us-ascii?Q?0RU5BgXUlFF7Ek4WkRdu1qls9h9PpmIinIQ+BCl+WjWIjBBk3VqbBjsKX/G7?=
 =?us-ascii?Q?u2Wj52RAeU4eX3NKkdoWhNw4/gDliAsU/i9oM2qyTtmkVVbp5IXf0ymlNPPL?=
 =?us-ascii?Q?2qoz9zZUaanW5z76+StzYX4NUkHx2WoQ/uo8OfroBOfxoNv11WeX/uL96KDT?=
 =?us-ascii?Q?w3rYSTm6h0hn4Bv24+oL8+vCRx9cfZluZQp1AiO1dDxBUTHB18eD4x3x03w1?=
 =?us-ascii?Q?LE0WF7AQ+gVzzW1uLqECe9Uy0a13bzy2I/Le97mMjoqzJsvABAlI6Ub89V0a?=
 =?us-ascii?Q?3sjpme09RcrfTAnygRs=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 03:30:23.7947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2daef49-d1a0-455e-4dcf-08de3de5c7a5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4083

The Turing/GA100 version of Booter is slightly different from the
GA102+ version.  The headers are the same, but different fields of
the headers are used to identify the IMEM section.  In addition,
there is an NMEM section on Turing/GA100.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware/booter.rs | 28 ++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index 1b98bb47424c..86556cee8e67 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -356,14 +356,30 @@ pub(crate) fn new(
             }
         };
 
+        // There are two versions of Booter, one for Turing/GA100, and another for
+        // GA102+.  The extraction of the IMEM sections differs between the two
+        // versions.  Unfortunately, the file names are the same, and the headers
+        // don't indicate the versions.  The only way to differentiate is by the Chipset.
+        let (imem_sec_dst_start, imem_ns_load_target) = if chipset <= Chipset::GA100 {
+            (
+                app0.offset,
+                Some(FalconLoadTarget {
+                    src_start: 0,
+                    dst_start: load_hdr.os_code_offset,
+                    len: load_hdr.os_code_size,
+                }),
+            )
+        } else {
+            (0, None)
+        };
+
         Ok(Self {
             imem_sec_load_target: FalconLoadTarget {
                 src_start: app0.offset,
-                dst_start: 0,
+                dst_start: imem_sec_dst_start,
                 len: app0.len,
             },
-            // Exists only in the booter image for Turing and GA100
-            imem_ns_load_target: None,
+            imem_ns_load_target,
             dmem_load_target: FalconLoadTarget {
                 src_start: load_hdr.os_data_offset,
                 dst_start: 0,
@@ -393,7 +409,11 @@ fn brom_params(&self) -> FalconBromParams {
     }
 
     fn boot_addr(&self) -> u32 {
-        self.imem_sec_load_target.src_start
+        if let Some(ns_target) = &self.imem_ns_load_target {
+            ns_target.dst_start
+        } else {
+            self.imem_sec_load_target.src_start
+        }
     }
 }
 
-- 
2.52.0

