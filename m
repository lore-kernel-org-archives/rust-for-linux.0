Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013000.outbound.protection.outlook.com [40.93.201.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75E93B9D8C
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 19:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776453274; cv=fail; b=dHt2YSTFM6j4nG6LOa4BF8RvgSLV+niXVvRQ8B4SUiNmRxxukHd6fpW1cYO7oDwanpAwh3sFMS588Ht5F9afvJzfMgPdA8/21h7gk/wnuoocguRyKKoIEmGFsjW5w4Mn3wxWQy78P13KpEZhsYd/PjALv1y57E5/vHtj+lerCQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776453274; c=relaxed/simple;
	bh=44NieS4IXQjhAdmxASa2f2wVZOs5FS7D5l5Nqwtmjw0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CK1rNbvghfufhtmk5igr9vQD3Rp4EvOjbKEszbwKc/Y+BJfD4gN7JD7Iglg9v+4u/sq3Yq0en2kQYuboZjONomMvpzkcx56oU3zYk+Sbf/rJ+1y3LZlwYfZir29Q6DYpLqN23HAC23GrK/yEhpF0GY2M9RwcuEQ1X4EMhU4lTFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nLstV+Ba; arc=fail smtp.client-ip=40.93.201.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nLstV+Ba"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kf3+CRePHsuf8DgSASv6Hec1hBYH9UivN9ZXwgYkw4xW5ACQp+3vbssE6NcwTqbBQcDYy2hX9BAzfG4P0K4IgOnEVI3rVpWyNsqKoDoNv8c6nQh8LrWdbpMz9tbxTK6Xp0qge6h9Y9TuLQ/AcGtr3LWgGIBvOQZsSS35AepChK3oUHtC3eunUsndIunmbrz1dCeTTOOAg+kx5QI1xfjFTy4CqH1RBFQqcZZy9GqLYdsGah0peGKKYLVDCZ5wRR9Fk/Nw59aIs80shpgpuSTtNFlvQjuSJY+4v1DVD42lwZaTuU04uA6CqPbQKqArq8hHWU13xraFFbxZt1Lujh6dOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spwQ7GBC4puhJ5dgV4bKFOBkbAM/weBDrnuhrX4wn7U=;
 b=O+NFG4aUGmHMqKyrYKHGZkpuOuy0kVmnrbMZA2QdJ8JItqeCbhGEpKaYTKEo4H4ISDbBmrqf4BbGgFWcFq3EYRjWnO5IH5m3+3fatnVVCDybAtDo8hnNN5Ds15IRvDZqRF7ylbNBqQuFfr+v0NsOQR9z/drS8CV6f25lp3ksLeThKi+IqxMTBU6mx3xxJlt459x+UM7g6Cd47zUrgHUUn/r4qUptbsrVbjcgc3qif1vXj8UGRBHV50zg+WNU5RoCG29MWN7Sb3YAUnZXl43dPNAgZ36zHzN90WoBqvLqcaeTMi5Qla0pYrMUYoCNtBwoqVop8u973QpyzAav6uZAxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spwQ7GBC4puhJ5dgV4bKFOBkbAM/weBDrnuhrX4wn7U=;
 b=nLstV+BaIlRt8DihX7O2vqv8GoSGJaGQdpDsZZ1xbfaNvQrtxdNcGL1TMXsU2LKHqjXyhIl9NVe4iK7YzCRDYkHTSZV26BN0onqi0Uot2x1aVyJ98GGYAPve9u+nqx22DFImwYTECbWniRBoWzZYoGUJ72J2BnwjxR6jpMg8jiMPeutM6RNZ+xdvtBTVMRkfFeKpddwJhsxIAq93xYwcqDr6xAFP+cNMpeAfbNGD+9K8t5MjT1do/Cx2zl3lSH0y/u7hbhS5+8w4h13DaJ0j9WRPpkRV7ttCq4KVsTWHx+wcU8vTSi7u19zjwXlwUGBmH8UQ9rdx8XdwcM3F8b1xXA==
Received: from IA1P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::8)
 by SA1PR12MB9247.namprd12.prod.outlook.com (2603:10b6:806:3af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 19:14:29 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:464:cafe::60) by IA1P220CA0014.outlook.office365.com
 (2603:10b6:208:464::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 19:14:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 17 Apr 2026 19:14:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 12:14:09 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 12:14:08 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 1/6] gpu: nova-core: use correct fwsignature for GA100
Date: Fri, 17 Apr 2026 14:13:54 -0500
Message-ID: <20260417191359.1307434-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260417191359.1307434-1-ttabi@nvidia.com>
References: <20260417191359.1307434-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|SA1PR12MB9247:EE_
X-MS-Office365-Filtering-Correlation-Id: f63bba40-c07b-4c3b-43e7-08de9cb58c98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	x2I/5Q5NzftQGk3hBJl6VRHZTn5MVuQQooBQw2LGOJUdShzlM0E2TQagz5tAQfcyEy/SZoslE1RCvjwcMupjKd4NN7cL89H6KziCbjXmuxoJhthQOVNHx0IvSMPeoGsOjdDJ3tJdmoqtLZPTHZ5/NrMWC4DF9/jaVwSMQv3DkoKGmtOxLh3yCt88iFiG4LN0XzUwS8XJhINhIBq+wzUkn6OnYOFGeDoiVNTNkWCZ/XTNNM67XX347W+FJXYu9sTSDVgJBm/ZwmfQ6VMh8V5df7/c2PjUUtUFtNYfzZIaazDKTyWaRcclqZHkHx7tZHqeVyUpNGK8PbKujbqxLO6/SSNF4PoAMQkxmqf30y5+1i9P7MNhYK++9wQmK7ymztyNAvgnIYerdGbgAT3EAa7fiS8PLuT3c6J54EwoV7mIk56W5MghxJewcNM3bAebyyYFsd64hZ3GfB65VeU0MiT5VhabtapEWX2tzfeWhGU7SHw3wCfHXy8uZJ0ZxuH7dKnqyOWolPF9YlFWpMAUhq0Q0lfE5hIc0Kp7VSg7xfvwyRZ7j/mfuLhxZuqB912DpaBMh4gwlmOk9tHJCokPQKsnI8zq6RPxk5+W8DZUVNDMzDVBLhtOwS8NqaZLW/Ln9EyORP7/T3INiX8BcmJ5a5XU46PxYEAs4IV3T048J0PPBGsCs847W7vZQJcAKolRCDbZ1Xo7Q1uHE+7Cd1oLmDFaJuoyjwJcFcgvTHzxQx+3llTyD2Ad0oTsZ1PFT5smB2xGYU0DMNxYk4XS2BMw8LKFvg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cbri9kHD1sW8kFGL6GiG506FcQcVNKubnrNSwwOFkk63CNsbUTwdQHaiidjFyToEGT3uWJJyco/QITb1n7AtqKurWcsfzwHbuYYmWbfwR/2YS2KCq+BPzDpS4PxnyCMrZeLxgz73oUhDVcm4cyeJ3RW6AHx28Q9v+B60pyffPqIBQcI6dpLWoU7tCdbT6WoUGy0JFLmgi0Qty/s2oyz+QseSD2ZzuOiWCcdPUhmD3LBgreOSAyB3KedFTjdDQSJFyyz3fVRLxqFFQjFU9/0nWPPv2ykB+P/B5/NoQlZHfdDZ/g7E+OQFtryxc49QI1UepIZFf+SjyJWnCFYo5weYF54a05FSNjqvLm0xKAUvcIDs8p7KYb4WEeISpjWf5ltn/o+UpPaw6HaiU+1Oz2424O5YFB68ZikVIbI+WS2k9zJTzihSfBSeUdLbd4JY3CcF
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 19:14:29.3174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f63bba40-c07b-4c3b-43e7-08de9cb58c98
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9247

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

