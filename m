Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC2A5218AE;
	Thu,  1 Oct 2026 15:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866837; cv=fail; b=iqpC8AwecZtFnv1BuncOzrZueidpv0W2VeThinuBhZTKSSE075ZXKDrb5y11WSvSijui6V/etjzcGCkUOEW7qT8G4uU9eYYFOKNm1HscIP9vWQ46MO71RQyM5ZTMMgYs7Tqf5HP+ceEGjnA9Gr+YsnXWa3JkODRDmM8zysl4JaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866837; c=relaxed/simple;
	bh=XGisXOD8K8OrPo0c4eilWgSn4b6YXCbEn0W0639G1/Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ByhqSTnjqs+eO5NiWktksts+j3NFTFHtW+EI9Qf14OdWPWUzeNNUFv/PzVfDPkqbajayJ2MUO+t/uTJPKLmIaSpNb1W65Ps7DYcLfeZYxYgSX3TbULrLiVPbCXo7V6rw71BhbhQ4zsZnnwEC8EHFVwYdmC0r7c1blZ+VLRnAF+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TMc9FD1I; arc=fail smtp.client-ip=52.101.85.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TMc9FD1I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRPUo2nNGvw65qK8ExIFW50oweJUQKhHSIBDywrgT6RXdPTcGfexjuLNQl1stHi7oNLqIfupaD9Mi5hLKP5lWC8Vc25C7It00Jh0CDeuiULJBnl5Gcg/93Xl8iqqB3x4QUqTGlKP4KkiFiu6snZ1GCwmmE5aj+L3NnKSmTwIdrAbLKT3P4RL0WongQrsPNzKWKC3E2U05N9J0hJEBMQzdlZeDMk195rC/Iy0+dSOz8dObp/QlXdJUQiSBqvz5UfgzNNlT8Pz8I9P8Lq00/E2XY666V8RK/Vqt6ei3edhmzTdm0RYobeFuRT14Dxk/mcqxSh2fqJFKKJmzDR3kHpceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLKPwFohao/90mnZO/qcLfXoHdtnaWh6JxpUY2yVg6A=;
 b=jRjpU9Iw18rE4YcVu4ADYf450tVb0Df90ZC6oJo9o0CzT++lZXCZClE0/nbOE0VNrcIBHgLo6m+kaoCgBGTZxTT07x+RwqzMRgbSI5FfKj16XCQSqWv0QIQu8WxshKY9T6Kncri6vLYfwr9bxOR2O4Mnx8Ksl1WA7wdlvWThaoPjRQM+PXaYx9l8gqnbzPLOS4NawwW4bjKcmsUR1MPdms9OVPwUvlgyxYO3F3R6t3YijltQB8P/Pqa4WtBSUSFMckijldcIwScmj2CFhSLX6/84JFfcVte9G8A7RjUIYI5yFHCdiPSEgIbwHpXgzZUPWq88liNPS6GzCmI26CV+Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLKPwFohao/90mnZO/qcLfXoHdtnaWh6JxpUY2yVg6A=;
 b=TMc9FD1IzMr0q30HZFqIy9FtXfMv9WxLt9enjPrvlGpFkMzKT3C61rdsGKjEu/ZKldSeVrkHYswIhQFOSylmQlkjSluxErjZFKQpsV+RNYo4SU7Fhvb+huBKw6PDprTK2e8bQGolQ++wZ9aVMIVY8euBOV3uBhqJeldOWiYPgTGqTvPayrsFO46/qTsNu+1ak5Eg7QIRJ61d8uUiTXVzri4QGuxox/YQaAgbL58s5y6f979s4MJKqtmEupbggNwF+7YdZ/14ayDvwkwakMe3f+L8/e6e6SZon4piWOnG1F7RbPhi9Y0Y46DMH4XKy4woM2Nufevdq0WxlF3mvqyglg==
Received: from PH7P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::21)
 by SJ0PR12MB5664.namprd12.prod.outlook.com (2603:10b6:a03:42b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 15:00:29 +0000
Received: from BY1PEPF000264B0.namprd02.prod.outlook.com
 (2603:10b6:510:338:cafe::39) by PH7P223CA0023.outlook.office365.com
 (2603:10b6:510:338::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 15:00:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BY1PEPF000264B0.mail.protection.outlook.com (10.167.242.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 15:00:29 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 08:00:06 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 08:00:05 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 1 Oct 2026 08:00:00 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <andrewjballance@gmail.com>, <daniel.almeida@collabora.com>,
	<dakr@kernel.org>, <aliceryhl@google.com>, <ojeda@kernel.org>,
	<boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
	<aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
	<kjaju@nvidia.com>, <alkumar@nvidia.com>, <acourbot@nvidia.com>,
	<jhubbard@nvidia.com>, <zhiwang@kernel.org>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v3 3/5] dynamic_debug: expose printing declarations with the core enabled
Date: Thu, 1 Oct 2026 17:59:38 +0300
Message-ID: <20261001145940.1077801-4-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001145940.1077801-1-zhiw@nvidia.com>
References: <20261001145940.1077801-1-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B0:EE_|SJ0PR12MB5664:EE_
X-MS-Office365-Filtering-Correlation-Id: 2528e5fc-f54c-4095-c110-08df1fccbbf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|7416014|36860700016|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8dALenOr+dln6J8Fjd4jKxcsi/eLfuGn7uHo1flr4zYE63/C+twVofBI1Vcp8WcpXB9IY5SbJs133rF09nKIF3/9g7iJAO5X419KgMxDmGKP1IqwbbO6fka8RwMowdcE+dR1dw0BhwaggVFH0DT6Q7UzUARyOqUpdw3Zz/lae8Yiw+jO0pAdWntUE+ZNpDsjAeT4KY2AyhgtR9p8+Pj/nNit2ynW7LkNzbsWM+RGbifjXBRgk+m2Z8GnxhL3BYL5T8lltvS3yZH3ip9o2giyMs0ZzTU4/MexCrqdOheDwpdBxRkVl7FJJOPO71we3MYAN0bGjVly/melOl82jd0k8LDX9tpBIB+nIE1AzmR2ALOcwdF57X7xmjNp2Pg864GmEJEfrS4nTczBpYCosT7Ns9Vl3yJeAM5Re3HEfCrcGw+iQfl6LDprfXOsc2H9gh0MrDOzhAnS2KwQ6EOoBJOdG732IpxMJZH2ZXFI3guEp7p3mMeyGmhfgdmxqzKqxzWx3Bf/TnNxEK/0yXJS+1t5HPmgUaMPu1UIqWe2NfCgTHGIeWUjaHIBtV0bc9FJ8y2hQ5+mK98kHGHSPqDcoZoTSRad6xq58WgOv3+x+niLzQaRVPehS6vswkHsvq6LmyZCMtW2mJpa4SjAjXZWwwJQEPKRzdn0j3GYaUwGU8C9ApGRTy2eptT78n4dAJDe6eV5Mx5jooN9Xmm1A1iNh5133g==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(7416014)(36860700016)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XaJ6qjcFFx8GA0JmaRyW5+NL6NkhkrwoZm+diirYhEUpDeSR3s17Z7BoH/AB5L9EhO+6ag8ko3ZuiPvyhompmxodGmTdK7KRVCvpd2Bzrc7OmDrSXmFRHLEnlW8Ta6FtYrR9O1yzbCdG2vOb3sJjM/VoOyZqRf7g1IB5WeDdSiOFxLpRJCTi5iqec73RLYi3uoMXAU6EIUpIGcHroUvX8qMCSTKyJriAbQMCKwuMnyw7quEKOItg+3Glc39xK8AuU8ei/WEn1cGuhfg7k+s+aSe7nE5VfgsEjdT4Ju4ifUpo5Td8CyoBe0OdaCQP6A2/CN+F9NKooMZLt18NQ3dUu/Y4NGoNP1aMgons5RPv6dZsn02CYJcZ+kxIx6zyaM+4H3G4scTMTvInwmGBl22DziF1adyfjekTCuE8YY7fykVDB6RCCrBUNVK0ORFtSpmb
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 15:00:29.6402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2528e5fc-f54c-4095-c110-08df1fccbbf1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5664

The dynamic debug printing functions exist whenever DYNAMIC_DEBUG_CORE is
enabled, even if the current translation unit has not opted in to debug
callsites. Expose their declarations under that same condition.

Rust bindings and helpers are compiled independently of the driver crates
that opt in with DYNAMIC_DEBUG_MODULE. They need the declarations in a
CORE-only configuration without enabling callsites globally. Leave the
existing conditions around the callsite macros unchanged.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 include/linux/dynamic_debug.h | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 05743900a116..04df97596a41 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -131,12 +131,7 @@ struct ddebug_class_param {
 	const struct ddebug_class_map *map;
 };
 
-/*
- * pr_debug() and friends are globally enabled or modules have selectively
- * enabled them.
- */
-#if defined(CONFIG_DYNAMIC_DEBUG) || \
-	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
+#ifdef CONFIG_DYNAMIC_DEBUG_CORE
 
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
@@ -161,6 +156,15 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 			 const struct ib_device *ibdev,
 			 const char *fmt, ...);
 
+#endif /* CONFIG_DYNAMIC_DEBUG_CORE */
+
+/*
+ * pr_debug() and friends are globally enabled or modules have selectively
+ * enabled them.
+ */
+#if defined(CONFIG_DYNAMIC_DEBUG) || \
+	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
+
 #define __dynamic_dump_stack(desc)				\
 {								\
 	if (desc.flags & _DPRINTK_FLAGS_INCL_STACK)		\
-- 
2.53.0

