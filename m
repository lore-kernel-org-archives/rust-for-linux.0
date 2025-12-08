Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012057.outbound.protection.outlook.com [52.101.48.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B320217F31
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Dec 2025 23:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765235914; cv=fail; b=rctlIOe8aRk4q+oegdZ0MkhuLclibzIHfHJI/lLRoaQtODSk2ieG32Hbt2tIjxqHduKn7kwfao28LJOmas5I4lc6z5UKK/POxiXRoxE5bINn1iicMVyG1CaFAQQdN+jl7pQW9g32JfddvLsVueohqwF7q6Tk4VD66SnT/2ylgCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765235914; c=relaxed/simple;
	bh=mAbWsRvVsLea6HaonkIQx/YEzUgwZlU+hBiUfbU2bpE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qluZlPwXAFkBpRm4x8sQ2rsAmM0j8qcavLvCGROUmY/CUl5R+PtHPdRgoo1bClBKPHmz5Ds/beTiaU7TxGRSRy6XJcshDwKblthcGC8EHkIsMEG++xREZfY+wqBW1LfqgGEGerCihpLxUsNWjHeKO35kRI0Ou30/iIn1WGLPamw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qRjx7wqm; arc=fail smtp.client-ip=52.101.48.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qRjx7wqm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U3yFiiNFIgFbHaDuElGxik4WU1bFO7bC8oQh1YYGix4lJuOhBw6QKXP6pEr5Lxs2F8ZgmT1SNQjk+PlSkcqiFur1czxoE/vO/F9La53KAwS8vt49xZd09l0c2Ik3YvSBixFiFyJ0QR980xXMiCh1NUogFr9QztHzazVZDlAy6CLFQoof77MQI18nPybQqxDO9rqfA0LBaAp2WRTcLExAmwGt99aG6eWsI3yACsyhxkS5hfU2HxHKxn9Vzm7WUE7pKknzbVD/XSVfP+OCqpDIw7d7tfoeUYtZ6Mk8tdkSXVScyrvDd/Wv8KDRZgKr/x/Itwu8abeAsem9p1GrJIYZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VylLdfotgM+SodWNfVWDsuSE/WuyEQ3swuUgquPYrw=;
 b=AAqL8BuPQgtSMvV0vNVBwP1qVLFB1Cq1IEtTfil6krvDKeKgw0hNql/qEpXeNyPyGqjrNMHbWlCf6ROR3uPjH9GX8GAypq+S6hzdxaQCEWM+EQI9dMRGZMD1pAeS+9Nx0dt7ubQwxvPx8fITBXxsXODRcHhVV8lds7arCxv5ABypPtwI24yjYrhIQB6ad/8hFN5FBQ7L6Nzcxb8SWVQd+Qw6IgvSwE8HQbhZBa+/eILdGYEweDC88JzR56D97XO1ZK9jFDOxNyPlUbT0LToad9XvUYfTFUp7x/ezPdrdXhzWedvB6M4UrjabiiZR/ppNLRsw3Y2BNEohpTKo/Rse6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VylLdfotgM+SodWNfVWDsuSE/WuyEQ3swuUgquPYrw=;
 b=qRjx7wqmRghxAjBZwIR19qfPU/50defw+heGqopRCmjF8wp35hHJMK/ek2IM6TokglcJt7fLVJKnWF55gzCD7XnlSb0qGjcReBpOU8jqHTNpEkpeCTfZC3iotHy583XoPgwkb7yoDv2sd942xSGCiUd7iCRQ359dj/r3Ll63o9CP/Sh2EhNf4s4Co42/d7oHl8f+Q+QUP/CfB3fOFcQ9naM20uNSQDH8iYPHGh52qh6il99et/Y2b6xPWXXsZ2RcgVj/PIDj89o4OQ6xwAM+hK8erpWf18i4PEuViaf0zJD4MYAzOmO3/sJ1DEXOaupZn75HJEo0313qgS306vd6ZQ==
Received: from DM6PR13CA0032.namprd13.prod.outlook.com (2603:10b6:5:bc::45) by
 DS7PR12MB9528.namprd12.prod.outlook.com (2603:10b6:8:252::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.14; Mon, 8 Dec 2025 23:18:29 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:5:bc:cafe::24) by DM6PR13CA0032.outlook.office365.com
 (2603:10b6:5:bc::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Mon, 8
 Dec 2025 23:18:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 23:18:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:14 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:13 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich
	<dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	<nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 04/12] gpu: nova-core: add support for Turing/GA100 fwsignature
Date: Mon, 8 Dec 2025 17:17:53 -0600
Message-ID: <20251208231801.1786803-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251208231801.1786803-1-ttabi@nvidia.com>
References: <20251208231801.1786803-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|DS7PR12MB9528:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fbb2343-c5be-41ce-8a61-08de36b018c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f3q75c/ikA4ElcM2x7M5yRPtWnwcFHBF3mtifY8fmz162rBGRL0W8kU02Zc/?=
 =?us-ascii?Q?1XcvVve4kvvLHtFeagkGZoMOqUNn9fLXAloKo/Xv831bcIKR2KUBdm6pa6tH?=
 =?us-ascii?Q?xglMw/D535lP3n59SyQGylwCsOs8Mu3AI2ijcrXWJjRe4ewV14e1oyWA9X54?=
 =?us-ascii?Q?++7WxdLZVE6ysSPwTmTirHNCAxUYSQXWXkontDJ2d3WpO1pRx9VdUS/fiVAE?=
 =?us-ascii?Q?6SeXRp5yeT2UNpVO+Lk87AocIOEhioc/Q+9YylEzLkCPh6ypt9VuvwWz5rpN?=
 =?us-ascii?Q?7vyftFfLVhIupk5oF8V12XqFpHJyk8rdByEd0quXHWQJLPNO/xq4dg1o9OOg?=
 =?us-ascii?Q?EvAfiTStEqNSeBt//bgGb6jdEyylQ48AYTtwnNA7z7DNUKU4yncCSJ8id4Ao?=
 =?us-ascii?Q?xMCAO3fwwWSmPjvR+KditjED28+e3vfA+DCjHFlyN062AYc1VC5M0Ou4alrc?=
 =?us-ascii?Q?jhVNT8tERXZriKqYObUFktwwG1Dp5ZOYkrVYpuOoTFVyOWVt5YdeGcuT9rEe?=
 =?us-ascii?Q?nWzCQRPqBNG5DUV/G4fmGyk6G2jHbok7GwS6FaFFxWuwsFfME8i84z49dftH?=
 =?us-ascii?Q?ViQJYMHf60Hplz/gUfa9/ra+QJ1aHogWiAjR8L5nrcdtlI1Y08OasCZllId6?=
 =?us-ascii?Q?vNhYfkTOKaVN5jbN2Uys8h1aOUab7izZ9ieMkuvMmRNmYEt+gYBv/gF4b6EL?=
 =?us-ascii?Q?/DaO9TyysbKdCKJBuJvFzflUZaSpBA8J4wyY3kPN1pwbSWrnipIxN4wtFCYo?=
 =?us-ascii?Q?xUAcgYgMRmOuGshI/7AoJBFM5gTYaVCkIWFBsxY/uM1m+LlX6LtdDrIdOPkJ?=
 =?us-ascii?Q?xwWTKD7MLDUfj6e0e5zveNFtLH+mSLQ6BobrvtdUafY8NK/6UwbZltZkIf15?=
 =?us-ascii?Q?0Ob7RpfRk9/rxg3lmDovV0/5yr87YxkVqnV0s06lRvDuAi3Z1s2yzU/NkPV7?=
 =?us-ascii?Q?1XGmmAfOw73C/QA1wPww0CK/YrIxTBxfy5FMdX4oz/SfVSZVYwNbK3XPJ3l7?=
 =?us-ascii?Q?kLcmOP78Id7wXxW9t0amAXhqGoG7JB0zcRs5iYPTfzyzOT2UbIqy6jpXBTrl?=
 =?us-ascii?Q?8JQGESEMsnGTK7lSOWRaaYbelz2L2r1SZNPi+IifYFSa5x3DyqfKSiB8xoD4?=
 =?us-ascii?Q?A/nigSv5fUGF+Kse69bsIljXmufXR2a69u7xi6/+86W53YWk6UF/6OEECCpS?=
 =?us-ascii?Q?PtWn2ZUvKc2vW3GHYJC2WOnwlZvC6QLIW1Y1gw28Ye5gLfScQi9tOi8DSIgz?=
 =?us-ascii?Q?utrD2TNfnn0g9BhP9KXWb8DBlblJYWewj7yJaVYO/wKiecGMd9ysf4HkeJvC?=
 =?us-ascii?Q?X3ChX0GP28zs5WgqWJM3HWVldR8MUj4JSTIB7ZR4rhZQFgmVSYFG9Ji4TmQr?=
 =?us-ascii?Q?LfjgxmZsz8/9jEKDfzjKcRKYjDWRl947k38OyTMR+7Memo094y3Y2LezYq1o?=
 =?us-ascii?Q?BL81G31GZd818v9C2FZ2BXpL7V942tYMIXFZxkeOtDz52ibNGQOGj1mC5oUD?=
 =?us-ascii?Q?NTxxjhQOrZKIxjuP/KkKU71840kbCSzPR4FMHHT8ey0JNFP/Ss8GqATJYvmH?=
 =?us-ascii?Q?P/FaehaRmclfKwK5HdM=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 23:18:28.9593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fbb2343-c5be-41ce-8a61-08de36b018c1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9528

Turing and GA100 share the same GSP-RM firmware binary, and the
signature ELF section is labeled ".fwsignature_tu10x".

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 0549805282ab..aa5a6433c377 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -163,9 +163,14 @@ pub(crate) fn new<'a, 'b>(
         let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
 
         let sigs_section = match chipset.arch() {
-            Architecture::Ampere => ".fwsignature_ga10x",
+            Architecture::Turing | Architecture::Ampere =>
+                if chipset > Chipset::GA100 {
+                    ".fwsignature_ga10x"
+                } else {
+                    // GA100 uses the same firmware as Turing
+                    ".fwsignature_tu10x"
+                },
             Architecture::Ada => ".fwsignature_ad10x",
-            _ => return Err(ENOTSUPP),
         };
         let signatures = elf::elf64_section(fw.data(), sigs_section)
             .ok_or(EINVAL)
-- 
2.52.0

