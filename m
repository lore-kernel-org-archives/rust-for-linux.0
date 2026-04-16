Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010042.outbound.protection.outlook.com [40.93.198.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374421A6827
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 00:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776299224; cv=fail; b=GckQUAFK8wlEX5Wlvf1tlK9+YQJJt1iB0K8ZAKRMKpOV4Vr8wk8Fal4vMdrqJoaTsWeRdZbUrWQtY703fE1QA28XQQShWIBYCvqVrZUt2J8jj6QovV7l/Y64tfAFTQ+P5SdVMkFs+y0XLPNRzuCJRmK+P3D6IRT/Fy4jCW2qFW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776299224; c=relaxed/simple;
	bh=r+KDEvqZq/g38HO4PuhhppD3gT2o/w0dIi3ucKMtRwE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E1Kp9xSt+Y8brH5zPPhRJtj3lJj/chqccTeVClrDYTN/s9VcUy+LvWlwfMoBMcXdXDyjPi8O+3WzMsWIEtRvZzUYzCUGQZKOO3HKGTIrj66fcQsy5xG59xY7xe9WEPXT2+m2FJzCgmupWbdvhwsqu14B6HTXr7kzuPKvZcSLPDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hsB7MRcP; arc=fail smtp.client-ip=40.93.198.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hsB7MRcP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJ7/jg1erxy8ygzfMAiDox6aGwnvDBrivHA0ztbecmekTZPDRletTmu8BgnAMqu+LBpQRX0GRYmU1c7+FdaNAHPq+8pAUDAGzOYQfdABudiE6mp//K9HZJh0xxjLPWD5GjUIeWQcxh9fs1rOIlcDzTTM2QpGh366KAsqhevMB1RjmzoPhsZwFg0NtTw7v7QJoo5ezD/EQ31kjcQolA9n2wNCJwhCkSFIZim8/K8FwuxZH1l4Vo333dBcMMn99NiWwZA1+X+powcpVk5s624SRv03mq8eL/yxxGNrHa4vwAim48Ay2Qw3C09SA+U4IHVHYOVX4r9egnKmBr8AX1fsjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCHiuCRF5RiWHjzK7Ll10d+KHDlRRKZbWAAW8xiv1TI=;
 b=MSBXJVPfp0cfWXfrUpOJyYSriXwvr/QCEXIM+ptE5+xTBpZHK+Lw1MXb5DAXU8D5pFVNbKc4pjAzF8Fnjiq+LDQcJ4/Wr0bT0ep+i1pBxWZmqaNrfv5k6P38VyQqY3NJTq8JQKWAMUAGP+KAkrt8scsdHgMgyRlJ+ZTgrksWZcAvbdm0jsi/AGrTDdcG2QD9nk/xwOFPo8T8A0JOIWuHR9rI28hYja6SJEk+DnFRooBEM+TGePxq0qfiUyggxuCHhq0IUSvdlnxPv70WxGGYFRjTOYfv7PpTvDMy8O9vOEB8rZ3yZc1Kb5eqzlxFAz0hXK2sznljesMHduQeIH477A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCHiuCRF5RiWHjzK7Ll10d+KHDlRRKZbWAAW8xiv1TI=;
 b=hsB7MRcPDVa6BsECcmDkgIj+tC9irCDHy9+7c09h/bkUFaHR0o1C0tVR/QPraWiQ5GqbREmHBFG9n8MxTZw9OJRoRda4Truy0ug7MWAef8pr9imvh2cjYwtEjDTGDw0UKb/8ncKPhTgpLoIcQxrqY5d4d1v9Hi2asPZuWMnAT+91VUEbJ26iydrbmamN1NB09maTWX1Y1mCgGHdxtsLEyiKliysBjPbHjhUL4WWFyybA4ahDCrCp1yYY7IqstHbXjCc/DE6IB5Q82Hjw4aVw/c7rTQbENacyn/rKNIuaxZobRpyBCu4ygzaYbfzqGgxDs5SS6pWjdOqNiEyd0yTz+A==
Received: from SJ2PR07CA0016.namprd07.prod.outlook.com (2603:10b6:a03:505::16)
 by CH1PPF9C964DBFE.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 00:26:54 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::c5) by SJ2PR07CA0016.outlook.office365.com
 (2603:10b6:a03:505::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Thu,
 16 Apr 2026 00:26:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 00:26:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 17:26:32 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 17:26:31 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 4/6] gpu: nova-core: add FbHal::frts_size() for GA100 support
Date: Wed, 15 Apr 2026 19:26:17 -0500
Message-ID: <20260416002619.900779-5-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|CH1PPF9C964DBFE:EE_
X-MS-Office365-Filtering-Correlation-Id: fa9b91a9-686f-4e9c-2430-08de9b4edc39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5pRx4XMrKEoK0PFQgsFYGEHihFhf96nFQqUuBJEvgfj1b1IKkFtf+o76kk6EbRrE6i03GTdL6xSArfgmLkidWTdUBebVzfNdg6XBYx+sn2AHcuBZ67TK37HY6ILkvMB9rKP7N+7u9oxaOdVC6RqrydCmY+HtooS43LhAsG1ne5eR4yu33VMS4vQiVJXxdMNBcSX5kUOecch1ki3iqor2INFkqBAH9ZatJItTJg0bYUOZwTEZuH18Dh2TxNos4ZuNAWfezgGX7XbUwNzblUJXdnOHceigacK3+o6GGzrnneQaAbdW5gbCiUuP9pP+cwjipkpVJ5GDnaT+EXpdKJV3lA384gUlGXRmfZtbNfvjHbE1lm5IJBugETq4XWpRAinJ2I3cfp/qYZsm4L+1Wuw3CT8c8e3PVKLX1rHB8hv616fRehhvBkINqXgpbRLkt2dDw91OPttRMDxArVYyeYxKGe85Zgk65+AmmXO4BGgoyeJUvKAadx1K03mCGVpxA6Kp71BQaH6onpMVnZ2v9LwvKa421AClCZ8QPYuaBjBDoQEi60AayV9Qc2AjpfaYwTPEP2w4DgDSL2yOJEXISjZEdfnLemmOAm/vVkTfEJuh31WNi3p1+wW1nbw2pgTmN5YWTk+59WsL1tDCfFL9G9aQU0Tnc378hr4axYOZe6gTETbdw5TzvMXSKyj9MYOhSBHg6X6BX+GJOCAc0OjM9eUHrNVqvZDzy2zIuUlDn/Pjpy/0uq9PJVbzzmrjfiwUWALeQRsXCfSRhGOMwi1unqKjiA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Eq1ZRzasnxbuiqwoTIYLFrqrK1HV3WlFIp0xj4tdrBWT1Wc6vxLPBhbWbjFbI/zjGAWpOWS5RU5hIQO5Tk5LUPEvSZhh7Y58lODw5ea3MXOeQfbz6ZPsG+VoqeK2+XWaAtCCeBDKrPilEfpJsL3tFAJQo2bl2KpDlxK9Sj5eZN6gSU+fgb4po9etLbFZGghJ7hX6nLd2IFGtWo51ihOX0WgzJJWjkvpSytvFQQX8wuCnUYgKwwp9ilcwItje9bWdKu8qLdYUTIZXyQX5wNuFJOjtCday15j2ffucX01FskmdS9zeaaAWV7UafhvJHByJeSbJgBRQdVmRgE63AEY49PBJFVwrKsqaT0HeF/wHLD5jUnnTnsYHTUzeIgnol81ol/D2B54PwrCdtO688gWy+U0MxK+s1Pq54rYIHUuY6Nk9LiniOZN3NIQtyWxsnUu5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 00:26:53.7273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9b91a9-686f-4e9c-2430-08de9b4edc39
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF9C964DBFE

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
 drivers/gpu/nova-core/fb/hal/ga100.rs |  6 ++++++
 drivers/gpu/nova-core/fb/hal/ga102.rs |  4 ++++
 drivers/gpu/nova-core/fb/hal/tu102.rs | 11 ++++++++++-
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
index 1c03783cddef..2f5871d915c3 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -66,6 +66,12 @@ fn supports_display(&self, bar: &Bar0) -> bool {
     fn vidmem_size(&self, bar: &Bar0) -> u64 {
         super::tu102::vidmem_size_gp102(bar)
     }
+
+    // GA100 is a special case where its FRTS region exists, but is empty.  We
+    // return a size of 0 because we still need to record where the region starts.
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
index 281bb796e198..22c174bf1472 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -2,7 +2,8 @@
 
 use kernel::{
     io::Io,
-    prelude::*, //
+    prelude::*,
+    sizes::*, //
 };
 
 use crate::{
@@ -38,6 +39,10 @@ pub(super) fn vidmem_size_gp102(bar: &Bar0) -> u64 {
         .usable_fb_size()
 }
 
+pub(super) const fn frts_size_tu102() -> u64 {
+    u64::SZ_1M
+}
+
 struct Tu102;
 
 impl FbHal for Tu102 {
@@ -56,6 +61,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
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

