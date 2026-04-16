Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011008.outbound.protection.outlook.com [52.101.52.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8B23A6B79
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 23:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776382315; cv=fail; b=Q4jvqeC8sTPevcEgbFgmM2px4qAkgaUnv/8lUQBF0mxsJt/DIwaQO5GKGGz6irEwo98rdzYJnV2D+lqyfgillGdyoed5p06JiVR+WbqJPKidHZXV5nI195OxvUOuPmVQim5iES/kv6QtvtqJtKngCzT6IJpeO3CdhY4kQs9bqag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776382315; c=relaxed/simple;
	bh=isqZo8z1M9VHPVgPxxkBhfNDtoccN5xsRg+QCf0u0pQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RHNMNF9reYCSpVjeM0bJ9EIasBfnfds5aGvovixOUkHE0w+T21th4jVyxRAgDX4JedHZu45mSr/xKiX/B5z25Mzanx0T427giXI3428NIsaWMAN+V//Cc4UJvul1Mb/WWU5ObDi6LUebVwQmFgaTseA3gi9M8gIHuJ/hGoXpmJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nRZq2ja8; arc=fail smtp.client-ip=52.101.52.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nRZq2ja8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJhEJqRJg1/1ZqqG3uDU6sC3sF20zevM7f6gdZNqcZkjul8eIA8SJCZPhveDeSaFw2CCguItn/8hKAkiD5oT4oScVEu3vLvCkJ9YGHqxQomX4o7DSc9cmHTtlSGi4ZxAQsVN4c0pTN8JL+aHizSVCY9mU1jrFdouzSx1Nf287vzRW8hCrUTrXIMxJGYOacWuYAAl7Fctlnk7e7RGUHfZ9Z9wTm9Cv+4AHFYuUyyObBU/zV1Nxr0iQy0aRcyDWjc2TN05dUugfjYGFQZO6Ddl6KN4QGGd1MLGIqW1hSrq1mo9LjmfgIdQWETBxb5ifKKvIHtAAbkY6zJsM4Q14tFD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljQypX3JLO1hYaGZPt/tySVIjKCc1y0lbz3Lgt2DnXg=;
 b=XxpJG9vxHiBpOctHm4mZKCWTX0O4pkodPR1XHvLWEwA1Q7CEWUNyiX/iSxQJQdYEbvOTznWh61L4H5I4rjcn7kVgjW7iTL4H7QciGyjHVkEDzAAyQk4IE5uH+fptwMS0agq/3ogf0MJrPPRJFwlx4PQ4rlvYCksFvwzAfFK7OSdHnCr7z9htj9topW+W25JYnHNAIl0ktyFhdRI0ABz5om4/Rc3xmImpJ5oRfqDxBsRR7J8JySvBwvFxWdrk7+g1vaqSrG2vsvu0D5tJ+bXmqLs1D0utcamfeLDJMzEsCGS9NWQJZkrC+SZPqNT5yKQJa26N7p7cILMuH6r9XKsJwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljQypX3JLO1hYaGZPt/tySVIjKCc1y0lbz3Lgt2DnXg=;
 b=nRZq2ja8wd4i89JUQTdDZeC2DG0SiVqChi5ySMcNvo6WYdwshe66bDGHLBWDpfutmgGY1HN+eU7tG8DlYHXrSTVQqh3Nhla/NExk5TRUUabmyX47jT65hyMk2nzEckj7qMZtrlkfpFmV/JNa5dKwh0fd/uD3m0M7orXi7I1LzL9bHvj2NAi8iI5boSCc972s8oNXFanvrOtlhAC56/DmcsJCeZ1fHhqaGKwBO4vZPJxxs671V+ucFLz9zF2m9wMctsFmkc0Vyl8a53uh/9+EtV18uANxSWdIVan0Rc6UFVw+/HDTuNcwS3almpVWn0p7/8OsIuvlOpq4vhpTHSYagQ==
Received: from SJ2PR07CA0015.namprd07.prod.outlook.com (2603:10b6:a03:505::28)
 by SA0PR12MB4365.namprd12.prod.outlook.com (2603:10b6:806:96::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 23:31:51 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::67) by SJ2PR07CA0015.outlook.office365.com
 (2603:10b6:a03:505::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 23:31:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 23:31:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 16:31:28 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 16:31:26 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v4 3/6] gpu: nova-core: only boot FRTS if its region is allocated
Date: Thu, 16 Apr 2026 18:31:14 -0500
Message-ID: <20260416233117.1057427-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416233117.1057427-1-ttabi@nvidia.com>
References: <20260416233117.1057427-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|SA0PR12MB4365:EE_
X-MS-Office365-Filtering-Correlation-Id: b2517e15-64bd-4b54-8603-08de9c105634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	h8sW1LHankEZoPZZVdNoyttrIKI6bSTlyp4KT9l7tNxOv+RoqUMPbPhM34mgo7b+kFYJ+Cgj0GzXPRAEu/XKWaytrCSF2OC+XySH3UZea/1bl3SUnmaSuoW43EfsGs3QBcCXOw0HSZLiJvPylU3JCqYpO3i5aUE+SqgfDZkKSUcvnaA2ziISCi1oDgKqhjBt/zN8eQ6+4y3jdBNJGfj/9eJuSgiKWS2YD3LsO1PujkU3pzPrbOqESdrvVr5fSX84/wUWTpA48RaCdgmr5u3u28IegvZCnsIX7FC+4WIuN1NAjzn/yh8wMYkK3mcBzYrFJCOwGWF/1uK5JNSQbWD1g7hVmSil+rXh12DJrTD1jOu0gN9LtPWkrOE9JR4b0RSpWpde5teRN9VaRWsnFRJz/IcZI3O+YgC7cufQe9eveW4TXAllFxjqW0kzhW6Pof810F9//0NKupT6dsoEmOQWPH2BHYigSB6bSe9GacvFYK71Jyzf56O5rmvh7sC7MU2FEV3njoN7SmTOZn112IdMMBEm8JgPI1RMqTLGhBxK+fg2su0cGkd12xX+tIp4YNkZ4yaspWRt1Pc+4IpA8/1aHT+/ZRDwQmOxpgg3XrfgNpwyI3pidMmVLil6XM3DseM+w9eNVlShKdJPtjCEMb55+C7Xq+9WSy/F+iHY3sJhDVw12oNCH932nkgV/nk1W33lLj2fRQtzkM2ffBpAMskqTUmKjXSZtzrM5jqrjxTZJ8GaurpN0XWbYr0aSWUMQgtT66zAipXsSeKWLqLylYPT9w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z0sGAXMsY2MusFR3HPljDpVXHB3F2igiwNFrzyUX0gKuTeS4jQHV7rQZZ2r5Jeb7sAIW0B3Q5bRwVWeLxPA4/2PJaKalhhArcmBJyfVVlS5At1Z1FNJSBkvzvevpTYtBu4R3kE/jdidQ4v6M1J5Bi4UlRZbWoj1gXaPiYxRTqz8/vbCQjPGCH9Jedv+ysshGykqAMb77Y4QsjEhx7eESE+eBIDs6cdfLkLIbqpJ5PrzvMHFcVn1w5cIJchcfZlL2S9VBqmYSdbRgcBjnry8kjY2bkbPc3P8tnCQ+xw5LBJsHn97pCJdQciYbxHispQ8caBulBvX7CDPVJ1PQAebL+IiX9axwkLPTqPQS3zz5Af44k0ZjdJT6I/OGBMPiSWuox37KvTvtk7ZUowZ/cCKhiHeMv7IezTimIcl5E24zWUjMg5y4eiOTnn2cIaiAGTon
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 23:31:51.1491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2517e15-64bd-4b54-8603-08de9c105634
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4365

On some Nvidia GPUs (i.e. GA100), the FRTS region is not allocated
(its size is set to 0).  In such cases, FWSEC-FRTS should not be run.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 18f356c9178e..5c56f0539dd7 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -155,7 +155,10 @@ pub(crate) fn boot(
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
+        // FWSEC-FRTS is not executed on chips where the FRTS region size is 0 (e.g. GA100).
+        if !fb_layout.frts.is_empty() {
+            Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
+        }
 
         let booter_loader = BooterFirmware::new(
             dev,
-- 
2.53.0

