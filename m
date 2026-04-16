Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010029.outbound.protection.outlook.com [52.101.46.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C85115853B
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 00:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776299223; cv=fail; b=pCkmv+ChPfcJTYgMrBCvtV0ka1xhRUB8Y0kQ8NcPD/9uRF/O06Wnjso2L0Wl8MEq6HlrBOkgQX6wl9FU5r0lxK12yWF01M4PGmStnpcSFLy8V5TS8+yTxblSV9L3YeFXso+ADDRtk+ebr+zD+TjzvHNvcX0ll9LLW4OB8aqhvME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776299223; c=relaxed/simple;
	bh=XMRKPzvNeQKMfQu5K5kSM9u76pK0FJT1YsBwtLiwNH0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T7wN4DGFQ+Gxv2Pe01P0/buuUsjobPIcbgOkyn+Ns2lV2cf9ABYvS35+sapl8aT4OHCbOdyidRJNXrtffDKgN7mm8lefMZXuoFYrsdq6q/lcvA+OI9ryHj0nnrPXWbvgq1c3txRRdxsPdZwzvNom2KOhBGh+0dAgOilZ3g21dlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s7z4Mqib; arc=fail smtp.client-ip=52.101.46.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s7z4Mqib"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4Woje6YQNeiV8jqaLSfCe4B6jrqQeYMufb/QXZiIMCdaJaLc5cSw/V7e37J8RkX0mXHv/njDxNCYLK8jFHwuD9waDZ6ln37SVZbu6yKoS4wuY1/1QZV9/rP3CvNLmRaj9W2Ww/mAZf8pE96Wie2VbxCTRrvAJRpvbkkAqL2xbhUahclgSV1d/6hzCqI++FLMdeoknFfAlSi8+Oxu+7eRTj8AttmFsyvWSl4UCnlQjbm5CrOqc+ba+RvPmmLSAbynQr9cFWzCnrOzcCYngD/4vNHCpqmhzpx5Yu4ycfdfTU5yRdMbTU3agD/r0M4mX4T753vfxRjgWSJyMMbzNWghA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4euHdJdN3EZD/uNq/IOLgBqJXPMF4W8OiHn1uW2mvLw=;
 b=n3ACr/AbGT5w2Yao3Jc2liOPEFdHojObno90HcVkCnuni9tCco2x16r5Qxea6ip6kV9nnQgrk1eC78mrnG3fugQsRBfwILvjB+vOKyM1J9C+k6iuYX6CItaizCInD7WhHoxAtddu4g+Sp6IENJxpYrNh3T3pDLx/ReF0XRyjgH5zJpyLGiHhxCJb1Zg+qLO9IJdWWixuxWPRylJRkRGr6sG1uFO4HnmzIvPcszXAsNX9Yx9BHajiCgmgOGt9EW5iBL2XrrA+LFX7KVksWv5/oHVx3AnRrIwsU1Bh3K2QFy6cXvx3sjZCTaKSyInvfXoPSyoAYFMZaWswm+PczFpBnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4euHdJdN3EZD/uNq/IOLgBqJXPMF4W8OiHn1uW2mvLw=;
 b=s7z4MqibNrIAgLU/Ou3koEycrHQPlMX8Imq7nWBPpL2FNFl3WzWT7eMqwdnn6I3wkWjLlCsHQFxAmJ+DC0Dgf7wryaV+cC0MmpJ7Es2YM6eyZtyypNLYSb7Pz7vYoGg/hEaXY5PK2ZxOmdE43Nim/5U9uEWdu4QUgtyYbInfK8bGb3zfFKvM7sBSCWL1wTAmWibvfTpIgTZRNrl3brtu+HfPlAKHuDvMl4EI87DYZhVRQVHOInvA8y2rVnXCtYKnZlCC4YJ3E6VgdCVItO8kCuXnuNPSK3LXjifDbNTv9rc9iRSggBht5vJATVe20I3ZSSnmt49QMMzPipP8NM2aYQ==
Received: from BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::10)
 by BY5PR12MB4179.namprd12.prod.outlook.com (2603:10b6:a03:211::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 00:26:50 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::6f) by BY1P220CA0003.outlook.office365.com
 (2603:10b6:a03:59d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.51 via Frontend Transport; Thu,
 16 Apr 2026 00:26:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 00:26:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 17:26:33 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 17:26:32 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 6/6] gpu: nova-core: enable GA100
Date: Wed, 15 Apr 2026 19:26:19 -0500
Message-ID: <20260416002619.900779-7-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416002619.900779-1-ttabi@nvidia.com>
References: <20260416002619.900779-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|BY5PR12MB4179:EE_
X-MS-Office365-Filtering-Correlation-Id: c3fa538d-a4b8-4078-ba0c-08de9b4eda31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FM0WJRTtWoUN2NjfGtgP7KQpTygow+39h/TNMCwtQZX4ucTZZRRvV8/JVUrEoVVy+eg1kIUEvr79mZkZDOJBgvXU0LpiWA93GfUVIETCUGpO3U5fYcxxV9VbE/OvfsEWMfEdMpzqthe5l9LgIL+SkTzuty357Zi0d24y12rc9f7iuCWIDdT/oVoQ9Mw/qclF+3KgvxYTSQjVfoRbpL5a1aCTGfCTwJj3x/5rz/8wxkOpwZF8m76RTqsWhFj759fkx7fbIfeY9nO2X+OBBU6qutuLmbW/2FzUtYoxlNFoFDyGVXWsOkyubOPkeOoWfsxz3gLBmEA7mwyyCr8/S35H1ffgr81u5ihWu/nQnNO17BgBducZSKuSPunM5ogBUxQoi3l58gaYfqZmbnffNRSX3OvQU7x3fvirJlV8RASk8bCQo0PCDG4ncXfRoLwgoqqtgZJxRwTYXJgywjAKX3E0ACkwbfZMwx6+5kPTemXXb5N88aMEyjiG6js66XOku7GsRldqfmRKTZ4lWYnDBR4hyI1lmJT+8x7NW9jJ9Q9qx+KtR15WHVx7nlbCWyg0kuCWmSebKbWfNx2MajQEs9r7Fhu2payA0mvDE0xPGi0nkfFxDiIjxtZN8TOkQjDMMY/zq+BmExQrl5vr2Akxxu9QfWldj1TzA8Oi2bGzCuec7jYsQjjaZFBltlGX7dbXu4PtqJzDrD6+jgzHiXkqS6gekYckttSuzq0NC3lCwKbuD4vrPmspJanNY14GS49aRVPmpfSRfi1jUdqtyzfEuA1/rQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	buzx0mZfP5WDMIc7BsLerROt+57VnHU6NOKQ7GgxoTI6AC/6f3betmghEkoiUZhkW/yfZjnz7KEmtvRZDZ+UwZRkXK0grUNwsXuZ42kDrNxv8xvE3y0p17OqnXgSP/RtBE4mNwi86P5Z3m3DTzEsVNex+Dmqc6KMf+gdE3Irxpv92urkKt7SiscALl+nL+f3acHANMkKGF8bI0KNcjeYUaXVbp2rU1F+yMJS/lIXkBbVZe7dfprywhjC3S2DV1djPdvO1zb5nj+uOdjAdX1BNlLHLoQglSXcNOt2501WtWVPxKRhrronfKMk6vR7v7VdyNv0oS7P512ssK4BvZ8LUU91Lqz5YRJq9U7hI4AqB0Zr+xN2FvBLMTEeGwSh+iz4veC4JUk7rNApGizzpPLOIKCfnEzZMrAxW9ZfA/5c3YACr9Za9Akd+M4GfoKhGTm2
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 00:26:50.2625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fa538d-a4b8-4078-ba0c-08de9b4eda31
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4179

GA100 is a compute-only variant of GA102 that boots GSP-RM like a
Turing, although it also has its own unique requirements.

Now that all the pieces are in place, we can enable GA100 support.
Although architecturally like an Ampere, GA100 uses the same GSP-RM
firmware files as Turing, and therefore must boot it like Turing does.
However, as a compute-only part, GA100 has no display engine.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 71df33c79884..f82087df4936 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -77,13 +77,13 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     use Chipset::*;
 
     let hal = match chipset {
+        GA100 | // GA100 boots like Turing so use Turing HAL
         TU102 | TU104 | TU106 | TU116 | TU117 => {
             KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
         GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        _ => return Err(ENOTSUPP),
     };
 
     Ok(hal)
-- 
2.53.0

