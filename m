Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010032.outbound.protection.outlook.com [52.101.85.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0362F0C67
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Dec 2025 23:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765235924; cv=fail; b=EJTr0J7EdUIYat3JNJtoZZtHQqgWKyVJgaLR0eV8LWNzMy3T5Mg9rR7UyQkg3ilarTfwrDDpCFl9d64TYUT5CDpt5kF4Sx0dXaylU4Bnk/comAAm6hMmMSZl5FdY4s0i5eFI+FDjYg82UqZ0D1s/X7+zDd6F1IzdW6sjz5uRFTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765235924; c=relaxed/simple;
	bh=oInuv0qs+ZfKUUYLEdXc/PGISDUI0kwZh+mvTKiW7PM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pXV5NeuD7dMKXNvaMXgTvMJXwZZzzmy6bPaKw7kBcdpHUokxsLkMwJ7jto6qc0qKdctNlTlpNbExyRedxgzMf4Hx/somS1Ps+9l1TKTmbhU8Y5dRz1Umx3MkRwlHHbbr0F+PYiEsjHfpL6/MoACc4LyzTpiSnO6nuGZA2IcmMUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cGR+Hfnn; arc=fail smtp.client-ip=52.101.85.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cGR+Hfnn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kW6lhgNEGMOQ2GTCX2H/zk/ktosATh80apjiTFA8ri7QmvFQ2CZjqWEXv1KOnUyfDd/LuuQiSyJilh/gPSiJbbFHR4xDPnGlspWnMh5k4jxveQwNbi87H2Mw7itBMoLmsaGP45PP2PwJMPDY9v61Es6/O8+gbpHi2aoW5dBjgSmvnwTukvMz3J5KTa1+vRXdFu3eF2YA74Pf1wemDJIrqUJqkrXuvKJk40DlxRXZSmlm4OQJU7ulOPy3GXYXUHYlKpoz60ZK8E0QMAp2bvSVHHLpZlYMVia45p2SPGuAitusD8yspQ0hW2Y9uYeHED22Eo27oXSQd75yRdi0yJ2d4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlX2H+RiKfogV+Nc2Dwt0Supo+QHPFtV9XZjIop0ueE=;
 b=nU1DTloWHhgGZvf+maWk7Il/1bCURXhDh/mZ+5jy4Rp5eZlusL25Sm/+rA3JcJD2gh0O+kWjHZ5S7L9QFTcLVFAVnTsF98jWAQ6Axrpd0fzyYwOTP2Dr37aNiQNTHwDr71Hp3Jcaq6uhKROUgqBvZO9UqwPG3hBaZqBWp3Y0762cNGdJf/lp2nUqcBTHi6i7zxpLPrG/+6V95s3NleBHZN0X8fslt/Xkh2PzVwin2+PUvqnVA6+cs+kdSvQek32QXzuMOYoECnr0z4cXIAS75Hh9v7gn5LjfZw0SrsVdZqhBsMKLScbBxUneQ03KnFAwlunBXQd4CFMel5oz4mn5gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlX2H+RiKfogV+Nc2Dwt0Supo+QHPFtV9XZjIop0ueE=;
 b=cGR+HfnniqWOQenfgcQ1vQFoAaZxVLFmN7m4Dj2+Z1+SxqlZQ3Ct3ftInhrh4N7IRQuWCWkvIWYVeKYfYyIUAhNVI79r3//NGNxe/oyT4dKEedCycXk3qc1J2dfDE27wneJiMnXot70Mu6+gdpu4+tZP32klpYdvOSpunaJdnvjWCTx3uJAku54sjj7FlBCmV8tSvksbBHdU1VcCkfUkwpYLJnfT6KbfR0MZvJG5wQvNLAOEKkROoYE1SJEsD04DdkiKPR86WKe6T2i9MpgyV+v4rdE729+DRDy6aqTv1tmF87vA772iIIDxHb+vK2hkdhopnZ1vk8XcWdqOVzp8Bw==
Received: from DM6PR08CA0009.namprd08.prod.outlook.com (2603:10b6:5:80::22) by
 MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.14; Mon, 8 Dec 2025 23:18:36 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:5:80:cafe::df) by DM6PR08CA0009.outlook.office365.com
 (2603:10b6:5:80::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 23:18:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 8 Dec 2025 23:18:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:17 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:15 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich
	<dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	<nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 06/12] gpu: nova-core: add Turing boot registers
Date: Mon, 8 Dec 2025 17:17:55 -0600
Message-ID: <20251208231801.1786803-7-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cdda225-e185-4cf7-113c-08de36b01cd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mtJUmcNh9Va9BYbhL9enC7PglSrcNvHBin4580unJ1R5MfeN5EJuJCbzZtpO?=
 =?us-ascii?Q?w6uaTcF6RZmOtfhViMF2j4FYmTjZluyqgEzkYmdI67A411wfMMpeQwRTPCpq?=
 =?us-ascii?Q?n/qiAg+71D20ObrbH+MSBYckuARLxqm8t+WAZTHToYoTJJCqXbSiW/ViHF85?=
 =?us-ascii?Q?P8a9U9H49Hqu53ynjJeNFd3j+lFhqKNp2Ta9g9v581tuUe936zcK+x/ihTmU?=
 =?us-ascii?Q?zkc2aq4N8mvLtSHjy9JZh6Th5S1zCK7Y3/wsXJxj5EIktyKmkYOV/Q380A6z?=
 =?us-ascii?Q?qX2bW5Os1JtdbwN8P6cUljF6T6RloITxdNGI+Aw+oSUdeEtwI0Tnts1MaIF8?=
 =?us-ascii?Q?MvuApidRtgrNChoCBY2utGV9NmLzH6BI18QBCddSaSYpwJoBxj4egGKJXI/v?=
 =?us-ascii?Q?lWfMkflEhq2XzYHB9HRCHJdSIatOUseVOH9Sc0j9rCzkkoLZ1psXmevr+zYq?=
 =?us-ascii?Q?SZ7Zu8mQ9GeOXKxkyIV3lArxxCMeYVE4SGkxgdJfAZr3q/+QePkCT9WtMlWz?=
 =?us-ascii?Q?dTKgJoW4zb97k6CKGLIHycFBdzoseH4H7etutCiw/pLTg+e+4A8G8mwE7F9P?=
 =?us-ascii?Q?PfrrieuW7viK9xIKVZqt9cdY/R5+uQVLYIoiWv6oQtAK80wo9nJnGFoS1BaR?=
 =?us-ascii?Q?t3HQ1R1bdd041TrNlmA7r3w3dBqpKZF5tJbxKs7o+s+zCcmdAPlDtz33xosi?=
 =?us-ascii?Q?4SdGVgGJCkOY50LXXZenAO7VNvcnDnL8yKiD6JJzeZnYUrmZaVet80jo+okt?=
 =?us-ascii?Q?2A2gMzHoRCE25gqunIucIuwm9rLQRpgqroKkO8YjsVbGTa5MUB/K+BWNV5IA?=
 =?us-ascii?Q?HJ/XAFlLHJuHl1nf1iVw+wN77lcUnvdOe8Jb3FgHTLNYhQlWV9VDalKjoCD0?=
 =?us-ascii?Q?EJCcpsDY0nvq+GrJFny056C9gzVDQGcljyv2fvSDSzsIKlwSWJA7KRT+DF+L?=
 =?us-ascii?Q?4dY9x7Bs9n3e+yBoIrWraxvLrnGOX2mutyr5g9RqNs+9/tP/DLzfBi9dgOl3?=
 =?us-ascii?Q?tT1KbalfGy2tSxdmD0EnnoyrrtJnDSyhc9RCmInth/DPJvZP4V6oUnGvpAz6?=
 =?us-ascii?Q?hPXn5k8J+Ajc7t5vmoEDPAz9gVClYq7FowD1O/1/X8W/E1kZ9nwRrnJmuJ7e?=
 =?us-ascii?Q?BXtwWEZvWPVAAoFvPCkh/BZZY/6ObU3ShMGygApmXW7Jc1abjL0jFDUu4MMX?=
 =?us-ascii?Q?bUeXedXEvwa4hllFIq7I3EQHQ//BV4dUMlZtdE2WgU9JAI4GJMOt4IzjToiN?=
 =?us-ascii?Q?b3Uy8cUPteHgFP2c9I+ZUcHHWgKWIxW86521y/ZoJkj3rJ2mMFmU0ZOfRwM+?=
 =?us-ascii?Q?UePBg/qWcTEVWe7HJ0jm8ykmerW7iinvsXBoJn0TTlNwcBjlDzlHtv/9mw9o?=
 =?us-ascii?Q?1AyLcKA/4lwjsU12Gvt17yYLcC+9W26XY1XlJvqwYcyuu97TYPTGM8QvC5/c?=
 =?us-ascii?Q?i3hpG5hVvZP4J1Nk7Oy1CbGY/167XposYNwRTBG7swwVqcSDu2QYFO1V5SKx?=
 =?us-ascii?Q?NJ1osRw/UpcxCtpC+6HegI3MufWF+b/0Bt/5C+v05p1sqtBxQLm9/mp28BCy?=
 =?us-ascii?Q?TV30WEH5947Uq7h/29E=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 23:18:35.7713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdda225-e185-4cf7-113c-08de36b01cd7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6342

Define some more GPU registers used to boot GSP-RM on Turing and GA100.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/regs.rs | 63 +++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 88bec1d4830b..2143869d27ba 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -258,6 +258,11 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     6:6     swgen0 as bool;
 });
 
+// Interrupt mask clear register. Writing 1 to a bit clears the corresponding interrupt mask.
+register!(NV_PFALCON_FALCON_IRQMCLR @ PFalconBase[0x00000014] {
+    31:0    value as u32;
+});
+
 register!(NV_PFALCON_FALCON_MAILBOX0 @ PFalconBase[0x00000040] {
     31:0    value as u32;
 });
@@ -266,6 +271,14 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     31:0    value as u32;
 });
 
+// Interface enable register.
+register!(NV_PFALCON_FALCON_ITFEN @ PFalconBase[0x00000048] {
+    0:0     ctxen as bool, "Context interface enable";
+    1:1     mthden as bool, "Method interface enable";
+    2:2     postwr as bool;
+    4:4     secwl_cpuctl_alias as bool;
+});
+
 // Used to store version information about the firmware running
 // on the Falcon processor.
 register!(NV_PFALCON_FALCON_OS @ PFalconBase[0x00000080] {
@@ -307,6 +320,13 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     7:7     secure_stat as bool;
 });
 
+impl NV_PFALCON_FALCON_DMACTL {
+    /// Returns `true` if memory scrubbing is completed.
+    pub(crate) fn mem_scrubbing_done(self) -> bool {
+        !self.dmem_scrubbing() && !self.imem_scrubbing()
+    }
+}
+
 register!(NV_PFALCON_FALCON_DMATRFBASE @ PFalconBase[0x00000110] {
     31:0    base as u32;
 });
@@ -353,6 +373,42 @@ pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
     1:1     startcpu as bool;
 });
 
+// Config memory base address. Specifies the upper address bits that must be matched
+// to access the config aperture. The base may not be zero as that would conflict with DMEM.
+register!(NV_PFALCON2_FALCON_CMEMBASE @ PFalcon2Base[0x00000160] {
+    31:18     value as u16;
+});
+
+// IMEM access control register. Up to 4 ports are available for IMEM access.
+register!(NV_PFALCON_FALCON_IMEMC @ PFalconBase[0x00000180[4; 16]] {
+    15:0      offs as u16, "IMEM block and word offset";
+    24:24     aincw as bool, "Auto-increment on write";
+    28:28     secure as bool, "Access secure IMEM";
+});
+
+// IMEM data register. Reading/writing this register accesses IMEM at the address
+// specified by the corresponding IMEMC register.
+register!(NV_PFALCON_FALCON_IMEMD @ PFalconBase[0x00000184[4; 16]] {
+    31:0      data as u32;
+});
+
+// IMEM tag register. Used to set the tag for the current IMEM block.
+register!(NV_PFALCON_FALCON_IMEMT @ PFalconBase[0x00000188[4; 16]] {
+    15:0      tag as u16;
+});
+
+// DMEM access control register. Up to 8 ports are available for DMEM access.
+register!(NV_PFALCON_FALCON_DMEMC @ PFalconBase[0x000001c0[8; 8]] {
+    15:0      offs as u16, "DMEM block and word offset";
+    24:24     aincw as bool, "Auto-increment on write";
+});
+
+// DMEM data register. Reading/writing this register accesses DMEM at the address
+// specified by the corresponding DMEMC register.
+register!(NV_PFALCON_FALCON_DMEMD @ PFalconBase[0x000001c4[8; 8]] {
+    31:0      data as u32;
+});
+
 // Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the falcon
 // instance.
 register!(NV_PFALCON_FALCON_ENGINE @ PFalconBase[0x000003c0] {
@@ -390,6 +446,13 @@ pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
 
 // PRISCV
 
+// RISC-V status register for debug (Turing and GA100 only).
+// Reflects current RISC-V core status.
+register!(NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS @ PFalcon2Base[0x00000240] {
+    0:0     active_stat as bool, "RISC-V core active/inactive status";
+});
+
+// GA102 and later
 register!(NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base[0x00000388] {
     0:0     halted as bool;
     7:7     active_stat as bool;
-- 
2.52.0

