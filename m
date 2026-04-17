Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011038.outbound.protection.outlook.com [40.93.194.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9746B373BF4
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 19:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776453286; cv=fail; b=SHqJG9OQs3AX4V5JV3pu59yRXwVTW6A/565D10ZE20g0D9UgFV64lW25K3ybXrj/xMWAsHT8BfEv8dYbJUdNpfXSnvxiVAoWHVemR7UjAjg/K7n3hnc6ix5EuWZfNpLfsnTF36/qD/ShrAOiyEGsG1vV/vmC+cnUCsHr9oGO2Ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776453286; c=relaxed/simple;
	bh=iM790YBnOgWTtl2dnPK6B81iGmvpzLYG0qim1niIxfc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EZmjWnhR69U2U7ig2h5jEbWprIU5WI+QQALzy6ngWGtWbQ+AikfRQHKMChqwq/674t3DQkuoYP3RqeoDXdMMuekIol5UuxZcOJ2lKk8/ARS5zdyQlp27swsYMo9VKAKcts8c+xQiLIIgl/JQl6vcJyxoAEfvak0Ps8m+KXXRRuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R8OMgQ7L; arc=fail smtp.client-ip=40.93.194.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R8OMgQ7L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMznxj04b8Js+KkXlXKh+PMMvp+fqZU2O4DKjznruU28pThWTDTvc0r6x2O7KavAyYNsJ2IgpetV/1mKvrChLQ+TaqR6b6lVevCAfdfiEX8n/Z6BYknpdkwJ2xA2e8YsE93xFMwI+1dAIrLl1QfdVYPSBxhFBfO/I1wHPFz1mzUw3EITfe6qfKHa5q+6kL+Z69GxB/MPrUrdAXih6Kqynw670RAR/MeefXOvYJNesDpqV+HhWixqBaMVsFZYjERySKlhyATbBPLNa3fYnZmroA9eIaM9K2luwknEW6dNyICQ+VbVyXYXBPPzNemga7uvvV8qyePOQuG/ougDCHsMag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utSVcFsbNDv8FHVAm7j9syo2qsnJlOVnLNOQJ+tlL+g=;
 b=HcbLvBtkicA6h6BkIQyFURrabmwSO7UgBa3quBSHbBmjtXn4Uf0KgCpEwqvoQAnvkwlV3M2xFKFHpwb+LdLQDPARCHijdWeZrIhHZB7BiGwyRNfrQrv/OYa9Z9g1v1YKeWMI7wyPyLIXym+tbjEkKWdegCECVBCD50Bt/Ttp7mp9QxBG2yZpLQnGBzkXn/s6hF4jdJSu310rD7Zc0BYijBclps051gx5JfOoFJkr1vLRF9LZfHhtQxisqKhQ2JfSqZAQmKtySkJrniuFaii1rX3+n8YYs7fu+YbjXtIXm9FJo14oHxdnGmqYZ+jm55AncbuSNuAlN32TQGEYee1Udw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utSVcFsbNDv8FHVAm7j9syo2qsnJlOVnLNOQJ+tlL+g=;
 b=R8OMgQ7L6T0OfYjrVP+XJmlj+6zCyCiBogz4FzbKkXY3ZzHSWHd9ghcPHv7OuVNcDmkOw4YnYk3FbA47AzDxD8qWdt+gaw6PD0VYoFsXT7k/mQw777P/S7f9hiXOD9WuvhPtefxMK6X/N0pvns8Qdx/ATTHHk8NeUzDfeyEsoF6jwFTnQWY2lBbzU3BdYS4i+ahN1nM17D+QhjEw5bF3LdC6G/sL1g7MbXs/EDsduAM14Cdt+yHerwTXp1c8x+YPgJ+7t9YuBxO6jhN2yajHKsY2rqNyOA4rmlI2QL5lRaTmn/yHl0dt4dPanm4wgoGZUsxQL8gYeV8nR67Iod47jA==
Received: from BLAPR05CA0011.namprd05.prod.outlook.com (2603:10b6:208:36e::26)
 by BN3PR12MB9593.namprd12.prod.outlook.com (2603:10b6:408:2cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.32; Fri, 17 Apr
 2026 19:14:32 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::cd) by BLAPR05CA0011.outlook.office365.com
 (2603:10b6:208:36e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 19:14:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 17 Apr 2026 19:14:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 12:14:11 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 12:14:11 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 4/6] gpu: nova-core: add FbHal::frts_size() for GA100 support
Date: Fri, 17 Apr 2026 14:13:57 -0500
Message-ID: <20260417191359.1307434-5-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|BN3PR12MB9593:EE_
X-MS-Office365-Filtering-Correlation-Id: bb60b935-e58d-4eed-aa84-08de9cb58dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9MBMEUVZ7D7bm88xnljvTVgpy+gO9Fh5LeMQ0/MojSXs4+qtYtfEY234GLtL/BMoa0r4s6RCsLHAHFjTVE3Omee45Z3dvlbXsqUKAmkQR29UqhV1DvVXzPX3TyVY82UntE8oKe/pGQhyBCjQziuMw38Gq8WSCPeS9VUryCBoYmNo5rMyDLnuaOe2VuL4KaxyS94eFQgVWXHxLoeTTmB+58RsNiqM8hPijJZ0jN01yCb6KCV5TVQNJEvCpL+4QTi345ZsDd9G1nHfDFBo9hCMzXn5lnyRzY1WTzLYiLbgNIhtRJbqnBpuOF2svV8JIHMjcgj8+IWyVFCTbVjGR4UnkGA/NU2WHd/GtUngAUocDHuiyHmQEn/KJ8zFzWCcQ4v4B2zhZOsrAoNfC1OGpunPwclRSNZ7aFoN0UHR4N00L4oivHPfLMHcKFVljOy032mydpF1U/NathTNGKImmyN54HGPb6wmBSDovr3iwgx8W//r2/0NZBN469Q5p0e9sTM4UIDK8osDm4IvI0ysthtvHNpIl9q+JmtXU8JFW3Lab/dLlJNy3/G3o7bcVvWY0tIHbMQHKtZXmznfpTeCvY+DmapTbj2c/As97WHFh9w9KF0EHFAP9loVwIW4x/CPQ3ZHoFugBoOWd1MhUu7Cf6/A84JCwqvivjWZwKYAAt8z82yAmg5AlIuM9Zy+bw2W+yYWpiudKXK7Rx4C1t65ieghGIQXJRv+gWoKbnUN0pMkylyOrR5zAdCdnhEkmhW7FGhwejBBRKoaP1MijkUf7JLezA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qHuPOY0ejsbV0/75y+3+W8zE108Z0hSwshlxs6siPcWRC6qHLHyh6XAN6hg9HuqiHGI+imabBbIVJCgJvgFR0ZO8oxoQu8R2nQ/9ydTDXbYzPZrI88N2lvJ8dRtqtOSpfvY2nTtJbfeoZ6DZsHXCJEF6kJdwCr09le/RKwaN9achwFW+jeyQUJAHf9xTzJ3jPRor34O93GuHlY9iTibHIMSVcivXlvDUrLMees/2Wbq/BispqQBsV5Ct6qJYZC8XHYcz/+Z2XzIk/7tSTIBqi+HUdNGsQNaUCqNPuuBL6khIkSdy3tOEhdth1ATrhjwczPFlQyL041QOqRJtSsff9mwPqMKeFqgrGD0KTr9SPjylihxgtdnVVu0a8PrvIEVs+LbSIpyRaleG5C64XDv9DsNTgjy26OERnmZiiikufcjZBrJvWIoxgIid6tbQ9/Pz
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 19:14:31.6595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb60b935-e58d-4eed-aa84-08de9cb58dfd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9593

Introduce FbHal method frts_size() to return the size of the FRTS
window.  GA100 is a special case in that there is no FRTS, and so
the size must be set to 0.

Note that we cannot use supports_display() to determine the FRTS
size because there are other GPUs (e.g. GA102GL) that have display
disabled (and so supports_display() returns False), but the FRTS
window size still needs to be 1MB.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
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

