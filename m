Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010030.outbound.protection.outlook.com [52.101.201.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1B93DD524
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 23:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776210683; cv=fail; b=H3roHA4f5JlbGI4Q66R3dDqEvy3mlQBOOt8Dx1HUS/KdiSDMc70vOK+yf5O9NNTyekErOkQZaShc+gTpnHa445VGsxxTTswgMxla79P2bMdxMMwFAchvb7HUGJ+w7Dui3vaAqVS5cIeRLnepST+JfUWK52TLK9lFDED0cwbqa3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776210683; c=relaxed/simple;
	bh=VwqmWYZ2G4RFkt3N7j86gPuw2xxCBc7vPRaNisRAx4g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zuc7C5daLnjycyL6/l+N8WRytToPG7pr+AhD1IkS8MhDWegXfphT+QVABHyBiYxyn1yOAnpy/4ZVursqJcwQQ1PIBrECbHc8FYepEj18VaS84okv/7EIx9X/fFuzo86SurwOl0HsVpU1Vhk/FHurmb3RcW6ePOw2K1NG2C4eulA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QPK1GEPh; arc=fail smtp.client-ip=52.101.201.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QPK1GEPh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VulSbGuqjD4kdo7XLTKWFVAjnUDYtjMXJBG9LmmD2XgA5EmfAlkekRJU0OfNsyV+XhrseiAcak6H0mpbAYNaafYoxltteluCc5yG/pf9xPjq5vBhGwGPczdErBTKYLMG08/vq68Rn9YgTm5jZRM4Qns/NAAURb3qL/nQOKmB+23XtlHdfkDk5x1d24JM3yG2eVLNBUNiEtbwJeZjadKnXNddag5uECPjJBGhl/+OGE7iHCgvghyvo/ibOt7oDDUPtEnAu+g2W7F7ubl5RZbveBe/t2V6ELM1Ay0xFPVE623TIX0RaA3A3oSYgPAOH8qnwOOmO6lUzc29WGv3hnseYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGOY9N83c7tcwyQpjxyD1WMJ9WQxPnMJOxmFpVUGs7k=;
 b=v5/1okGTPiVFJMqqahuJUWtpWI5rJQBZStgzM3yxgaGukYAhzpPG8mvAZThUt4boFqjxO12Zq+lwq9U3xxtlynFBpjxHxC9MH4IAm6zmKk9oYlu/rV8ktPN+T6OcmIkGx2BTXezXJBa+Qr/+A+uVw6jDiMDvl+aiTbyqechaY+qMqlTiUCJRsu1L3SlXiOSqCNAEqM27bzydNqvc1E+zVS6Byo2j5hDn3ygCGcjlfEIrEGiAc8qr25gwTXndqqznJHUGEHXTUaaSKCE3Cxk2ivdgx3D21hIY9JZKZ+6RFHwLYuvFajOJNzGWyKwuBLfF2K7t0KrslVvIN8nStXpbcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGOY9N83c7tcwyQpjxyD1WMJ9WQxPnMJOxmFpVUGs7k=;
 b=QPK1GEPhgLDqHD1IV0KfmYgpE/Oc6Zd6KKCoN84nmYjNj/PpaeJCOFSIzBoWDxayK/wn9w3YiCR4t0cfY9lA0W9ou4e5GIAza7LNNHb4zSGLfJnejB3LtzkRtjgTdDJSP8ZzxJSzsS3lEsPiNTytiGHXrX22L5yFGwkmcuh7SDMAbg4MWcP2oD3NyYndfDs5xOQnV2X+/Vgcjz/+Hk5URNB9vG8TFLvBF2JnTkS3BE6yZBEf/mKzYPrxZ0tPketsrcvBfj+E3tei2m9VXwniMoCGStUHg18wBEfSQais6v7n01JUtTto7fhZUKa1zVVRtESOBfV/fhP9r1v4smx9hA==
Received: from SA1PR04CA0002.namprd04.prod.outlook.com (2603:10b6:806:2ce::10)
 by CH1PPF12253E83C.namprd12.prod.outlook.com (2603:10b6:61f:fc00::606) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 23:51:14 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::49) by SA1PR04CA0002.outlook.office365.com
 (2603:10b6:806:2ce::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Tue,
 14 Apr 2026 23:51:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 23:51:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 16:50:59 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 16:50:58 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 4/6] gpu: nova-core: add FbHal::frts_size() for GA100 support
Date: Tue, 14 Apr 2026 18:50:45 -0500
Message-ID: <20260414235047.439322-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414235047.439322-1-ttabi@nvidia.com>
References: <20260414235047.439322-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|CH1PPF12253E83C:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c4a314-654a-432c-0d58-08de9a80b68d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZMwj2rt3IESfe3or82XHGnqo9fR8Djakd3eeBwU08n5fiRsgLj+rgNWq5yO9AS3bVJ21ys8GyCswIR+Ie6abVgenACp8HNWhmeVwq1jxP4XYm7MtoQMmg2Xr6JIOhr9og7EIQT4elVf9Cmudg21V7Gv2k4yAckti9WbKdgrq7NibpP14MLJvB8Jc3hMYjHG2AB3sheeC06vQsxvIAP1hepCFS1wDLJeMq3DfcYP16QHOGG4I8dL9+zeTJIYlmzH8ptlGqWAKn9IOI+zC+KRdjBewioUlGtS70Cj+1myj2ft5FS1cEoeY+5cni6oS6bOshryO/Hr7SwIjsxyDyHVOQyqrYMIlTrPL8qbTR6e/aJnbN95NYy0Qq/c3NqCUFC1DZbwhv6oho9iuA+Mb6MEfVQXENv28VisNN6IkW7HvvSKKI6S0WitmiQO05IhbvmsIXrDYsfdXU8ahwMn06X+uWhNOFhUis3Q+qXHRjhGG7NO5rMeYQtAWCjSaGJNhzmUboK0nY6Zu73A68bgxBfXXN5ncRErpLl+URC+t40deEM6IO6oqquQmoH+h+PioqedNthGKgw6xl+dSlyiB/kLMV76DPVTtAAbxkZmJRn6bhHNL4SUAaWCsSnPPX7JSIsAO0mN2ZcgetshZ+DMkV5kb1dIzUFjFJrelcQTH2tOIkkL85eUYalzYUJUteHA8FZNrFz5svxJ+DM2fIzQczCH0TMkU1CHwMKYERnfpQXlzhCT3Wmb6X/DHxcKU6YAylsS5tBcTR5+ym5/nURPchlE9jw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OO8eEuVrVv7Lm1lYeZcTjFNCsqofqgiI4fIoZYHZe7WKzkUJLESBRGQhO+sydAGKqrgvnBf3Jxp9pxownV5zrXVdQ3E07eEowgr8bPjlT/DhUZLMYIN4tLJNsB03m75Bv+GwV4WVbxxggTYmCwVOfwGgGKCYXr5+xXG2OSUtnfhX8d5RF8/zRnJ3hcn1je6NFCf442W9ebKT9sIijtcN++oewOItGMZ6w3iYlp6z16wrYmN+eiR6sq6chx/gDObNuRd+NGHnXyIr1ZJ4H2iD6Uzkw1S2QEOLJvzCQUJJe6lHYo3PXoBLjTCVdZusw8+/QdXXFrLTuNvwuZxlKnj0ziVrRp1ZBrzb+xlREdm3KgQYqq/Q0XiAN6BQETms3tJaxB+OxwxzYw5BGzgO/NHKmS5/CbXI0u4BQmGT9hgiW5zEKkx9T0uw4CHA2RZACX+b
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 23:51:14.1002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c4a314-654a-432c-0d58-08de9a80b68d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF12253E83C

Introduce FbHal method frts_size() to return the size of the FRTS
window.  GA100 is a special case in that there is no FRTS, and so
the size must be set to 0.

Note that we cannot use supports_display() to determine the FRTS
size because there are other GPUs (e.g. GA102GL) that have display
disabled (and so supports_display() returns False), but the FRTS
window size still needs to be 1MB.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           |  6 +++---
 drivers/gpu/nova-core/fb/hal.rs       |  3 +++
 drivers/gpu/nova-core/fb/hal/ga100.rs |  5 +++++
 drivers/gpu/nova-core/fb/hal/ga102.rs |  4 ++++
 drivers/gpu/nova-core/fb/hal/tu102.rs | 12 +++++++++++-
 5 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index f357fb28b22c..a305a6dac758 100644
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
index 4b9f0f74d0e7..3bb66f64bef7 100644
--- a/drivers/gpu/nova-core/fb/hal/ga102.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -35,6 +35,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
     fn vidmem_size(&self, bar: &Bar0) -> u64 {
         vidmem_size_ga102(bar)
     }
+
+    fn frts_size(&self) -> u64 {
+        super::tu102::frts_size_tu102()
+    }
 }
 
 const GA102: Ga102 = Ga102;
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index 281bb796e198..3c85bf1b627b 100644
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
 
@@ -38,6 +40,10 @@ pub(super) fn vidmem_size_gp102(bar: &Bar0) -> u64 {
         .usable_fb_size()
 }
 
+pub(super) const fn frts_size_tu102() -> u64 {
+    usize_as_u64(SZ_1M)
+}
+
 struct Tu102;
 
 impl FbHal for Tu102 {
@@ -56,6 +62,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
     fn vidmem_size(&self, bar: &Bar0) -> u64 {
         vidmem_size_gp102(bar)
     }
+
+    fn frts_size(&self) -> u64 {
+        frts_size_tu102()
+    }
 }
 
 const TU102: Tu102 = Tu102;
-- 
2.53.0

