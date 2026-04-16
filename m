Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012066.outbound.protection.outlook.com [52.101.53.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE143A6B7A
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 23:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776382316; cv=fail; b=nnWj7UcbGIhqMKxZnrng6GeiCt13lAI4/WGf8XUVAq5uSJDCZ7XrT6wVEsIZxBYOshD/c8nGypj2X0l2IMafWZLott7DRCd6Rqmk72D7uiNVLXq4I2Ul5Ia6Or5BBHP9IixZ0m5+kv8qPKMB6C6Fc1ysoI+CZFEB7W/Ug0Afouo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776382316; c=relaxed/simple;
	bh=iM790YBnOgWTtl2dnPK6B81iGmvpzLYG0qim1niIxfc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I3ej6R+ZnOGwQVXmivg6VRIovKaI52yY19/lpYhBn8h20X1/BdXU2pFkYGpUT07Lxb41+/s7Zi0xqFFXySavug3AffxFXgp55Hw17xFNr9w/xi/c++FVAmU14UJKQH/qBapTdWmBDaPwloy6YeSmiJA2SdQ36s2jvHy26z4HtWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DaGC0yJF; arc=fail smtp.client-ip=52.101.53.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DaGC0yJF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwjwZJm4dDSxDawnO1n4gkVLz/GBFufhK9ZbT7Y+MfbcN9IeiTymsgP0ACCpxRADRQL4YZaqKTWtUeQ2Pm+rG7po3ppD/NbxQ49LBMpQwN8B9imc0smDmyefHhzssypq+vaiZGo+greeA2vWkuIJeWdGLCmY8u5mMZNQ6UPnvOu57xb1iXpRYlfwFhndwCu6/HrV4IBU7gbFQmBlU9JsRo/rQfjiPoU4rJdehNp/Q0NtsMC3EePf2QxorlRvcPAXWrOXyBZ4hbMynQuLbOpKiD0TRVvtie9DT+ksL6uKcL/kcbnLQsOZm3jksvRqLvhGDA06zw8HLwwZBgT8PxsIjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utSVcFsbNDv8FHVAm7j9syo2qsnJlOVnLNOQJ+tlL+g=;
 b=AR9pYmZ06b/t0tooFij45G5QrOd8V/QbhHEjx/8iY/RKWKmYEwClxqpLYxWFLaI4oYP2gTwacz/8dSu/nNph9FkfoA77qkhenXyEm+wnpACIzlAfGDVDmsf2YDd/TTiP+kyw1+AvF7F6BwhkkKsqO3iQebxCIVg8hPCXeG/iifwsl2hT4K91l9JoaB/qk8X3Ub2/+cqqu3reEhX+RTB2XlSFUuBjJCxL/jzroaT5HbilaNev971CtQ0PhvJNgBn35+egYUt7JFnWiKJZN8l+hUqhX5Xl3PqhoPd+m6oY55h6JbN0XmcQQnRqxpyXSe7FMVah7uRl/Zn2mMKdWKxgyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utSVcFsbNDv8FHVAm7j9syo2qsnJlOVnLNOQJ+tlL+g=;
 b=DaGC0yJFQyTpYJULgIV82Ot1oIpQ30fEnj3PEtpa/eK65QuJQd0F6HncZVs9vsh57wrR9q+mYnKGmKbOJXbnRDPaXU9SQ3DL5IxLDmA9vCdau6zBm+FT6bX3/WIdSIspp8ALNT1O2f7/Y2YJpdagxFObrqDB1MzWEvFT5DT9N1Nut8/JDSKKUTdAzvNcqs7ODziFC8kAkup75s+hBJKaZmUZ3pELPeWoWc0w/paBq4QG2jmYV6yi5V0RxWb5Wr9KrQ93VzyQp+BDjl7Iq1T8duvKKEEWAf2i8/bCAOItyC6A9UfCADa8+R769kzJNi+hWIp+tfpUhC1dZQZrKvYE2Q==
Received: from MW4P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::23)
 by DM4PR12MB5916.namprd12.prod.outlook.com (2603:10b6:8:69::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 23:31:46 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:303:114:cafe::88) by MW4P222CA0018.outlook.office365.com
 (2603:10b6:303:114::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 23:31:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 23:31:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 16:31:28 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 16:31:27 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v4 4/6] gpu: nova-core: add FbHal::frts_size() for GA100 support
Date: Thu, 16 Apr 2026 18:31:15 -0500
Message-ID: <20260416233117.1057427-5-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|DM4PR12MB5916:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f591e7a-50e3-449f-e151-08de9c105343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BD1PnNhhLF0ppqxVN8DJZ16V27SqlHrloCAuOg/rjC4w6h8uzW92zd58spW7DjVDvokYyVvgoscngI98k86uI2k4dZ5PVyPFwDVsdqEy3Gwcqo68rvYUYbSrzTXVvUDKJP5hdxj6X1eqYqwHvQKcNSgrVRflNJNiGPlq7cdi3gyhqoZaLg4kt0LQlvSNXn6DCp5D8UNpUfw2QME4prGrvu0Gy9/nv8OCkqwTqZ8LeaUsxnsyRmk0jlh0rf2Pb9SH/ngckEJS/6sJoGdZ0+regqhW+MnCzJ8THqANdvqNXkJlNE0JVREDTbNF4+iQC/DgVzvTpAACw3vooG9bACHyDkmEu1gzFz5i6rjmLKhSf+7umtduK9dWbnJqtFML+ZNKr4yhmgbDvOjloW5YU5NdQVdSQrwieSEEqxe3Qnn/NOrvRmc1QkZP+isZzas7dkV2pen3SgxTSm5+1JZ5velwgdlPmsOFs+Ul9Udc/Vv2jFsMLjy58iuBt3vDkO3xaSn+Hqd08+n5V+Off945tJFYE8xJjsr9XpO7dlYWEcOQHskNiKHnOO6goLYUl/2eCjzmbmsNYBCfEtzXAup70e6gRLHJPSOQEb8aMPVO8+WWF+xxXI12/DSKl6bmBAeuvPIyLsIS+j+z+pIP1gAb3kiMkpj32aQXMlBS5RirzgKk6PqdZnMzMo50FWudEZ7SfRSrJdmRhTkVN60nh87Yfk845Oi1IcMGvSDf3bXUOMNKykFdcWxOP82i35cz8GaRccgMFDyMhwe2xyAmBsns3UjagQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QghuCILyGMOe9hmPpV/7ALzIsx4jBWaGMdzoYiUgigVccWTzQuW6gDtXz/4xzxya0PKX/FfQ779M4wenBbPOc4PjRGaMBhk9TOC6VnT3wvLezwj0JomlocgSov9iH5bgyDAK1IOjET4axeOw5hjtgu9MAOEpdkjnMiPBmWPfoxgjrBNGzbdK+DRCRgnuZ5/PS2K9BWdg3pw2+1Lep7M05rKCTqAkuRpN53apCUv1fEHo++HzYYJnNc4NTtdqC1AHue/eKcEj5uCe3SoqzgXNONFHyjzAxBYhO3MI9gjbshOPHsuVMbdr10ba9Ublkq+oo1uG5OhKJ1dwKu3tIJIBF3dBzywnyHBGckW4Yhn3fu8nnfrN4/MhhTmYD7KAr+VYH161WFVcKR/IRQ94PKFEUd3PP797rEKiOOeyVRAaFGeK+pvxdHUrN9UDpYtDKcBL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 23:31:46.2542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f591e7a-50e3-449f-e151-08de9c105343
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5916

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

