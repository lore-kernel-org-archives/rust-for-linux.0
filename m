Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011058.outbound.protection.outlook.com [40.107.208.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CF8394469
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 23:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776382314; cv=fail; b=fUqfletix4qmoKdr24Sx6A9lYElaOh8tM/c9YapsDE0suMUNOqUNlcF6yPaPODPd50BhYFHPgJ7OLVsBMv5pdOMK9zWg22cEu8FNdbTMeCooOmi/b8ZQNoZc5YeKEGwzdDZU9rGesm2OqZFbWwX5hcHLSqo5Thuq5cMfqwG7AXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776382314; c=relaxed/simple;
	bh=44NieS4IXQjhAdmxASa2f2wVZOs5FS7D5l5Nqwtmjw0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PSJtm/AtXMMQitTs3JABOAa9dFppk0BamqQJJ24odrKUMcgEMTNTcOisRcdqQONiO90PdWATCFBw6krJI6gNiGq5Pe4QEZlX4FRnfnhRVV9bd9wxoOZ3kvkov8SvPJ3MxDf8hKKCB1A3JXEX1BKLuuLedpkEKNHi7du548sWhKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=owIkoI14; arc=fail smtp.client-ip=40.107.208.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="owIkoI14"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCvlYYs0StPr3ElcfAOK6C6UxVMYv02BNXR0ph1gEk1mNd1Olw3J04FEXqdEqIZssucJFEYBxmQFM2+KlW3Qg1YSBgVkk/sMJHo0uJdryJxRPYUvWcoXrxAstMagdQ/qM2bcIYfC11axNA9EWISQAG9PW4ebtuURnHIGmXD+i8CuHeu8H7VW/PQvakbd85HgV5hfkE1nQy3F+2o88GiHnnA7rZgXLjUcyWRI/EnBdahoJ8LLarlHOiBl4yD77ezYIA9jtTxeGCTrj8HWrrCNRfzA8alAeaezjV0NoCda6xYhKjikfSYur3hibr7+PWAC8Oac7Q85R9F9dha2qDZP/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spwQ7GBC4puhJ5dgV4bKFOBkbAM/weBDrnuhrX4wn7U=;
 b=ZUL1OoHckfEzlXaKg81FhzIdlMf5hLaaQgX9zVZ+l1HJkuNTY1DEXWA1i6B+Lgnwsk/olETBv/WxCWnUhI6BzGGONQII6j0lGYIv7bIuA66Hb/D08jv51boTWKA8OXgEmSSZSomIogR3b21Ny+OGsjOJBPH3mvrQHlZhH10vHZRGsaSNnfJsHwuCSt9Sa+BnDCYCSII1KtXSDsWU+z2kZ3DyN2QEN4rFWPQ03YBSP1gb7aOm9TAzIhadJdu8TIvZ7Hwo8xWhVvZ9zNy4TW9sxBxCPCRvMvWEArpzw9mlzA4PpFAC6MjgTiu4wHaRYS5tX6O9RD5KSkxCb0N7rxVcaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spwQ7GBC4puhJ5dgV4bKFOBkbAM/weBDrnuhrX4wn7U=;
 b=owIkoI14GPlSQO6cPurRHYS3HDhTvkR+FL9TlN2iNPzMh301Key00IV3rG7GGgJHkNjd23Uv9m21tGoCOOqZTRSnmDrr48hJWwTafIVHyx0pkF/8nrtCT7d4na6Mo5IIlEzAmPHISLjK3OiSsPkZp6q4OJj5FJ22TW7FIrSuLT8LnUWNtaYs+9+5JkJseIJ4PKlmqT28g+ZHqOI+UDi5vQB5nEpL2cVfWPuhfARtHSsSiBtajJh6MGrskF/I9myiFucbdCv7ctBDO6lHuD8+GRYwemCJLQRbXnoC+NEdXX88W/ai0eTSOwXlBP7DsLunMX6VQagCbRmTOTfelS7w2g==
Received: from SJ2PR07CA0022.namprd07.prod.outlook.com (2603:10b6:a03:505::24)
 by CY8PR12MB7731.namprd12.prod.outlook.com (2603:10b6:930:86::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 23:31:47 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::54) by SJ2PR07CA0022.outlook.office365.com
 (2603:10b6:a03:505::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 23:31:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 23:31:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 16:31:26 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 16:31:25 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v4 1/6] gpu: nova-core: use correct fwsignature for GA100
Date: Thu, 16 Apr 2026 18:31:12 -0500
Message-ID: <20260416233117.1057427-2-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|CY8PR12MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: aacead6a-261f-48ef-f277-08de9c1053a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9syIDz3lv4hflRoc3JY4RtE+QxRPj0P8byh13wh05nBXGMtJfnvbdfPBx/0R3rkOcdlxOoz7k9iZkte6r94tpc7ghAekm9X3GlxBJPL4Fj/E/9zSnaHhxJhmEWqiWW+e7mJ01yeFyKnLsbODb6P+zDyvMQ/ivGmMSlcc+gAkC8AeV6L3SBIUdzEKB27kQAREvIUzFHSNxEs5BWLuixpAKf6FfglFkKdyyOfGPU7hqm/jRn65eg9CXtjM8yI1iQUS6ZZHEEPMjQi6gYb0XD9TyDBjfpBbIR5Hsb2JvunqQzeQJ5OULO0Bzn24FIV2sNWj93qbvLJMVDx1G+Qr56nEL8uqX29vJgCnVF4BCgIvbU62q1SAEDfwB49jLR2FuGuc1IaVBKY+BWbtenHok2d7bMFVja4tP6yBf051JqmyAEcfyPcQPuxh0PK09+00o9MDG3U19rGqEePubvpGbmDhRMwQRAT8BO+UJ8oJ//zEiIscGSAKZTNBFgPcfsuAwj6QfnLMwILji5zmqYv5/Nwrr5wVJ9FyC/N1TN6eOn0dNXmh0XlqZcy4rL3ATx/x+tURBtYZgoaSsXhVOREWURzT0l3QyaHjTdKSpZ1tut15zUAJgQkCenC7QjElPijqaw2VDG7uD1g9Y6Mj2p1XrSHluOLk+arAJ6cRZYOFfRakhx0QFMuQa4fmnSc9x6x+LMoNcpfkT3UK+ifwl+0NFK9STLg5k8pAy3b8rwPGUkjI9onGdmWeQBN9jCyNMBofSKoT3NstoOLf8thQgefcXsBWFA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ynNlff+sOcrOSCuNp8YcCVfb/BMsEddhHoN/y3IKDmH6JTrSpu4RPBob9RHgeqPQNYbRact6B7hHXNi8zFR4H+EMyOOGSzSObrzkiwQvH+DB2Qp5uFUPIHjCovtLntqKDspjkcBsXRrh8UtMzT8CZ9uvy9F4uQdJLa8tQvZFHtPuLhDHY/wzZgtnwAFU5mmMVw613WI9QVDrJO4abHIkLFEzZKYHdD30PwP1axzI99v6fZpFJGM24bbp2yCtz6UZilR7KVl5uo0U7mCAhHEppRs1/pMjzMk8tWeEDwavWMVtqLDCgFaimFPnzmEJVeiapLDD11wcWfVNzlCP3nQiudSpodassfUB4exaIvCNHyZHPc8XUZjV21jK8QnTtX4QDDmVJvKLADq5guFTrSh5M6akrFhMgLrzkSW899XF8rv73M3uJMUVfpdcP7PXDFNZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 23:31:46.8410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aacead6a-261f-48ef-f277-08de9c1053a0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7731

Although GA100 uses the same GSP-RM firmware as Turing, it has a different
signature specifically for it.

Fixes: 121ea04cd9f2 ("gpu: nova-core: add support for Turing/GA100 fwsignature")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 2fcc255c3bc8..c423191b21f0 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -138,8 +138,7 @@ pub(crate) fn new<'a>(
                             ".fwsignature_tu11x"
                         }
                         Architecture::Turing => ".fwsignature_tu10x",
-                        // GA100 uses the same firmware as Turing
-                        Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
+                        Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_ga100",
                         Architecture::Ampere => ".fwsignature_ga10x",
                         Architecture::Ada => ".fwsignature_ad10x",
                     };
-- 
2.53.0

