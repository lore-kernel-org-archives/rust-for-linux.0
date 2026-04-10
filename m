Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012043.outbound.protection.outlook.com [52.101.43.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E4637FF58
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 20:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775853483; cv=fail; b=XTRzD+ZUzMqy6p3fK+Eff007jOw7a7qp61bbW5zF1QjiD5Eu3caIKMS0pSU3byG/fQIK7TUPCwzik1AolV9JRXd/KqgwPJow1stftAg37tedtchsM7PYVRXGrdH5mV+gYrxwmbGYt1pB7aXTpulQpB3ird7KH+0iMRFL46xlJ44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775853483; c=relaxed/simple;
	bh=oNVsaRwcoT4M/wK4PIgOcSfm7D0qVccd1hjpGbqlcfs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l8WoTH7MQAQEGgqxL4MERzcxk0nPxmB+fysUBc2PSf3gOy+YTfZxojMGMEa9NYNFFF7fcfNX3fTVc4zed7XLjGER0C+r00gQat/piBnIyp+4JzlByHKiqCnFNGYfi7ztkrsrNtA/fenoO6/+Wcqav6fX4opobUkWAL+g6RMcLqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PZWm+wH7; arc=fail smtp.client-ip=52.101.43.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PZWm+wH7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YnuJ25gAbEm1RnuKm3rnPuHH767PT6K2pAxzK2BQ+JvI/VQ3DtQRu83DXL5mhFhIIg7Axf4fSw1yxuRzMxwZjIxExY0yZKm09+XxNCG9gqp8gTxw4p7PQszGAvTjzWnXfrvNml8C/U4tjiWBQALEBO4jeH3kbfSyey2zyZ4/vNWSFCpRlGNVbB18bqXSZfqbFe+MZuCIyxlYMd/6vT/JiknY0TGeMG8WFDnlszfceMieWeDWeomHYNDjeUAfVEY03JGqbBDoUua6BDKw4ASbcgeSjLGDgmXpOU2Vz6yhmN4JAfFsm75go6mPVeEHOX1iqF/QErqOAc6Mt42NjOqSjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAzlrT4xt3iyhh3+RU2hJQ78UyO++OhwWOMn8QkJBdo=;
 b=qN+MwXkY3o7XMRE2vyyWhVWUI6UQNHbBaese43ozKfqrw9fjmLKhMkSnsKC9AiRBLWu0tf6wod8fPYzlLpgYYq52dtiN7AiMj6FCb6mS3MzdXIQKfK0BjcrgdYbUhgHHwogvNCMO+S1hBraBEWmRhZcOzc9pvSaCUZxE3c3D4dAxohfu61CiMzAa2/VzYSYzFS6/oP9MUqGKhpzF3xTEcTxQqT2v18Yi46cdInK5KaKd2kgAvUrc/wPQngtq+oMXpitINtkJsmJeB2DgL4H9GB+UzQCVrwTCSZExfTidCCvx8dtNFfvv/kpqARXyIAwWlR9QV8XrQKyQ1zo9f3aEjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAzlrT4xt3iyhh3+RU2hJQ78UyO++OhwWOMn8QkJBdo=;
 b=PZWm+wH79XRl3Lc5R6HNx8R84nqRiF1xFvQdzyttBYXW17h/6yGqIj1ZnBNgZRgzs4RhYVBl27uTY4iIEQmnYbaCVbxmJy/0JTzR5FdtHuXEaIqXukjCVorPau4pQxX8AZAOp2Psq0h0oNI4UU5jtPikh9srLzOwhjuwd0yIS48rS0MG84v3XHdkFEQTC6rD+QO9QOTaCLETGvOnRzTub712ajZfxCujxz1ODgCNtbgpHLPsX9CIFyUAy9eX5uQmN2A+m6orOdsdunvasxCZECUtrSvqqXkYSfTCJVJ1r6PXj5lpfrTOn1+wLti0UliiPngtyKKPJBHeyREECieVnw==
Received: from SJ0PR03CA0031.namprd03.prod.outlook.com (2603:10b6:a03:33e::6)
 by BL3PR12MB6545.namprd12.prod.outlook.com (2603:10b6:208:38c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.34; Fri, 10 Apr
 2026 20:37:51 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::a9) by SJ0PR03CA0031.outlook.office365.com
 (2603:10b6:a03:33e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.45 via Frontend Transport; Fri,
 10 Apr 2026 20:37:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 20:37:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 13:37:35 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 13:37:34 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH 4/6] gpu: nova-core: add FbHal::frts_size() for GA100 support
Date: Fri, 10 Apr 2026 15:37:20 -0500
Message-ID: <20260410203722.1586938-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410203722.1586938-1-ttabi@nvidia.com>
References: <20260410203722.1586938-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|BL3PR12MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: c79c6f2c-d44d-4990-2756-08de974108ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5WTRRHrVip9cdND96Wo1UvqfzWQ7qzIvDbjOJfXhwOx8wnsfYD3bbfuDbOzLYzsZD2+4CKdM+ysgNPTRu/6YYxtjsX/dB74D9dkumoSw+dWUL0SWd8uX613lbSMk62eoFWL3ufNQ7i2TNf+NnQ7QoZ3UH0SLKjluuTrlaF7cke0IwvyHN49oaTiqigBnn1lUpBo4y025qY9c8nNMkFHm2oPtCR3yOfp6G/vURvEg63bTnWskjI813XNqbhf/8lpMBwfkKPOjbuEe8D4eVDkxH7kGXrrFrPB2JEMDL7fcsZCGUvGyc4MtiBC7zhyLAtXkApulDCYK8NT8InGcrW07HrZk5MGF99bSp/Ggi8ScGDZSSlp6qaKQWHqvIEfgsWqJULx0xqNfsw6+X7g9S4d0Mlh3BIC2dQ4+VFtU9DXLlGztZKBKb1NYML/LNQ6EAdFPEBLh2lqb0U0PrVwTxcJwVAKzX4+R3LR/dGlDlsQasaAXFBVt5pIOsp7aVeo98O34bnxgKZobo3n4WvqJI+qvmvFG5gUeBJnl2WsHQZB5G2mCSqQudvXJWPlLKGYVuewGmWX9ho4Vf+Tc/yCL6KRPahP1FhqYS5WDgS7qRra3cVgHM44Qcncr2/7ohjkEBLGCdXhWs4jO9AqbQMDcZCq0eBtyppH2Fq6pXpodUBRwlxBH7YqsnLvRI66m1nFbMp3URXJs1V82e5g3uAeFeGRyY+jLG5SztPfUxD0Dy54CtoNU6mwlrGmiDdNMDqUvo6Z5R5+MrSnJThyRX0ByB+Y6aA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+UkUq1sDwtQd29EhQOlip/yfPReWH4x5WlD+c9MZ7Q60r61TbwbDdsleRCUNe/0yNVXgSql3jqDVxk70puzlylv7gDWnoQcXMdik5G+Guu2P54rl4y18jlVI4tRaycxB1IaXRORgoU7vGjdEwUdFJX6l6g4jmJTjTAYbtTnu+4uKqualaQmX5IrQ9m/pr5P7BQpkkrsbRyHS/nFS/2XMWAs9ToGWFaOTU45FVHFwzLclffYDw0Z7fbZsVqTkMCSBiuNJFNqogSoOLxFLw1xAz06PH1wtMF7ZZmy2mxRozI54QGP+L9Xv4RQIkV1qH9G6WoNQD6uq9hElsQoBiABMAw/k0DNG9eJDPgd7/pJJc4qV/AOTcobFQrhvwoFL7d8/qAxieSiTNqzecCaJ8ZPvxWaRibaibZ0jeaAFjNWKysAQkf+O2YOsDYkWZTen6UoH
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 20:37:51.0338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c79c6f2c-d44d-4990-2756-08de974108ed
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6545

Introduce FbHal method frts_size() to return the size of the FRTS
window.  GA100 is a special case in that there is no FRTS, and so
the size must be set to 0.

Note that we cannot use supports_display() to determine the FRTS
size because there are other GPUs (e.g. GA102GL) that have display
disabled (and so supports_display() returns False), but the FRTS
window size still needs to be 1MB.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           | 6 +++---
 drivers/gpu/nova-core/fb/hal.rs       | 3 +++
 drivers/gpu/nova-core/fb/hal/ga100.rs | 5 +++++
 drivers/gpu/nova-core/fb/hal/ga102.rs | 8 +++++++-
 drivers/gpu/nova-core/fb/hal/tu102.rs | 8 +++++++-
 5 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index bdd5eed760e1..abffc21427a1 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -216,10 +216,10 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
 
         let frts = {
             const FRTS_DOWN_ALIGN: Alignment = Alignment::new::<SZ_128K>();
-            const FRTS_SIZE: u64 = usize_as_u64(SZ_1M);
-            let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
+            let frts_size: u64 = hal.frts_size();
+            let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - frts_size;
 
-            FbRange(frts_base..frts_base + FRTS_SIZE)
+            FbRange(frts_base..frts_base + frts_size)
         };
 
         let boot = {
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index aba0abd8ee00..1c01a6cbed65 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -25,6 +25,9 @@ pub(crate) trait FbHal {
 
     /// Returns the VRAM size, in bytes.
     fn vidmem_size(&self, bar: &Bar0) -> u64;
+
+    /// Returns the FRTS size, in bytes.
+    fn frts_size(&self) -> u64;
 }
 
 /// Returns the HAL corresponding to `chipset`.
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index 1c03783cddef..0e7d91fbd130 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -66,6 +66,11 @@ fn supports_display(&self, bar: &Bar0) -> bool {
     fn vidmem_size(&self, bar: &Bar0) -> u64 {
         super::tu102::vidmem_size_gp102(bar)
     }
+
+    // GA100 is a special case where it has no FRTS.
+    fn frts_size(&self) -> u64 {
+        0
+    }
 }
 
 const GA100: Ga100 = Ga100;
diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-core/fb/hal/ga102.rs
index 4b9f0f74d0e7..167d38e34370 100644
--- a/drivers/gpu/nova-core/fb/hal/ga102.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -2,12 +2,14 @@
 
 use kernel::{
     io::Io,
-    prelude::*, //
+    prelude::*,
+    sizes::*, //
 };
 
 use crate::{
     driver::Bar0,
     fb::hal::FbHal,
+    num::*,
     regs, //
 };
 
@@ -35,6 +37,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
     fn vidmem_size(&self, bar: &Bar0) -> u64 {
         vidmem_size_ga102(bar)
     }
+
+    fn frts_size(&self) -> u64 {
+        usize_as_u64(SZ_1M)
+    }
 }
 
 const GA102: Ga102 = Ga102;
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index 281bb796e198..3482469f9cf1 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -2,12 +2,14 @@
 
 use kernel::{
     io::Io,
-    prelude::*, //
+    prelude::*,
+    sizes::*, //
 };
 
 use crate::{
     driver::Bar0,
     fb::hal::FbHal,
+    num::*,
     regs, //
 };
 
@@ -56,6 +58,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
     fn vidmem_size(&self, bar: &Bar0) -> u64 {
         vidmem_size_gp102(bar)
     }
+
+    fn frts_size(&self) -> u64 {
+        usize_as_u64(SZ_1M)
+    }
 }
 
 const TU102: Tu102 = Tu102;
-- 
2.53.0

