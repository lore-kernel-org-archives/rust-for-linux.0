Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010043.outbound.protection.outlook.com [52.101.193.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F1E52758D;
	Thu,  1 Oct 2026 15:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866825; cv=fail; b=sjL100uwsI0a/i24rAkrxnpfCvuZ9x/4hPtqdsw+nDsJ/qhUMYVO5+xVBeXJwTZbtFas8nBEZR65wvB9Ih9FJfVu8OQXklaOLckh11pei2pq9vAnsSWg4bWACc7eSGSlrpq4TGMYRqnETziwxARd+YmVkirnVnJxlzVDj8Lbq2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866825; c=relaxed/simple;
	bh=BclSz1iUZdfEQD7DEN1/NZ89aoosCCdMz7yeTSwNASg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qDrn6YAo8oaqy16xGSVSizq/I3HK+etvR38NAo1/CJr9vDcUzWCjQoEQGQLFMbOgtBhXHFEbu/kOTLN3kFgMwdwrFmQFD43kCUcjuvL+fyIm5tH+rlzcO6Wjco/4cT8HDv0ntp3MqgmsgUL1gN4q7WgIAng34JunZ7mOBLsUz0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DpI59uiJ; arc=fail smtp.client-ip=52.101.193.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DpI59uiJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShaXsUr4WYmJrutD/G4zBkOlVc2J1Hbx5aJrdvm0MmScpr/e4PFKF1bZ3jt8/MNzNDcJFcsLBre+lol8pWhI2SwoLFBy2p/Sa656VlgNXt2S6Dl50WfW7pFFreqxyVcSK6ZVnYw1TgHN7VMQzGPF14wpZfB0hRRj/DTGCBtm4xvikFSusTRFjgk2dS+xZjYgiQ+FkhXiSA+nAJIq0Em0WTaHQNax0e/j0O0Inmw+NrQSFyaV3d776d7DwUNLVgYopa1YTKD6ehf+IYSM6qWfG1tifSgQaeBBJ2AkA02WgYfao5pTekJ0fN+bLIPPRswYpVOLJVZS8z6nMgnKqNFweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIupPBeVoVYAYWU0mM1ELuvXHmWD+54b1jzPqaDKU0Q=;
 b=MyBJQsRtPc7k6IvMlt010qcSnRSRl2e/ll8chxKH51bAmHJHNDc7Q9bL2KT6brNIvrHiQobSIZVwVlyISiN8PStL3a9TDToxGQX+u3HLp4Ob6yoYX2MVDNwGCTspddjCn8ibMATsHEdj6WxcVdNcDet0OoQ21erCOTZfZcSJO7E5UFumd1prxbhqS6IXas9ww2tma5ihYvzvXdX9IkW9AKcWqm3Q2/Mh7xr7lJd0pWczb4SKN6U3Vij6rdR+zufXQ9JEoy41QMu9wPih/CGSh5AoBSSEb68aZyzouZdl+PEt7o+cghrmW2Iz+wWjQalUDPRfod8HXflFD4gnMwU18w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIupPBeVoVYAYWU0mM1ELuvXHmWD+54b1jzPqaDKU0Q=;
 b=DpI59uiJrV5l7xfvTW3LipZghhvDalurKX4qVLvxq9bQwJ1PAPMsVsdxUagY/xbV3bzR8Wx2jeRzfin2bNV5c5yWOyfLJxWeULLBExdE2GyJ8QejqSTwfwHNk85EVD+AFGK3qZjISaExZPS1W22gpydzQiobrbW2TG3Y6xqaz7gByID1Bea7kK4CmiYjcjk0Y6ntAhP0hkQz+e2Q6jOwZdcNCMVKQrex5MP5r6Ezpg0DmjqgFY+mk54q2ORR0fVI/Do6f5iU90JvFHP0NEbm8n3eGBXODws7CL8xEV726ChPqomtvf/hJnAwGtLMen7zf1XaLNV+eiyU8GHGRgrUtg==
Received: from PH8PR07CA0022.namprd07.prod.outlook.com (2603:10b6:510:2cd::21)
 by LV2PR12MB5798.namprd12.prod.outlook.com (2603:10b6:408:17a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 15:00:16 +0000
Received: from BY1PEPF000264B5.namprd02.prod.outlook.com
 (2603:10b6:510:2cd:cafe::a5) by PH8PR07CA0022.outlook.office365.com
 (2603:10b6:510:2cd::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 15:00:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BY1PEPF000264B5.mail.protection.outlook.com (10.167.242.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 15:00:16 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 07:59:54 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 07:59:53 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 1 Oct 2026 07:59:48 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <andrewjballance@gmail.com>, <daniel.almeida@collabora.com>,
	<dakr@kernel.org>, <aliceryhl@google.com>, <ojeda@kernel.org>,
	<boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
	<aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
	<kjaju@nvidia.com>, <alkumar@nvidia.com>, <acourbot@nvidia.com>,
	<jhubbard@nvidia.com>, <zhiwang@kernel.org>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v3 1/5] gpu: nova-core: validate firmware versions before debug logging
Date: Thu, 1 Oct 2026 17:59:36 +0300
Message-ID: <20261001145940.1077801-2-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001145940.1077801-1-zhiw@nvidia.com>
References: <20261001145940.1077801-1-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B5:EE_|LV2PR12MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: 38badc6f-26a5-4a66-cc22-08df1fccb409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|7416014|6133799003|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	poTlNGa+0dx78qFlcreQ+0unNxDiaU/2PCt5ymiNx2T/pq6pHNSyLSnj0lCLA69ljawMJ+77k3PhLc+S0CQhPQMuse0zUFIMPwlTltUrFWYnXUvbipUODS1tks2FEMFLs5Hb8+PtQrJm6YHXMSDEMkJHf8sqNS55pD8a/89xiGndHgTERsGDV5tHJ6zSkqjk99OAf1MsCRrUBQOMgY/CsxECV5LArMX88mPgh8TvrcRdMWQlCARDi35FoGbEXXhN8T0a82u5Ldvx+lJZbo54vgQaAkn41OqWuKBY7KBjxE/kIUVgNIqlamFldnFgrh28x0tKtUwld8yo7UWwxUY8r3Enn5AEpqPFFnVpRri205Zu9NrcO/m25kVVmX+4GiWXo9j7r7FoNhXkeWPsw5CIAojO+y0QBLPLFiXFLN7bx73pHUaH3QR7Tm8PpTii3mUC0YbahyHhbWBKrITNpngDCXS/C1NtVBNSx6y5m3AceHJuN+n0NM/9OMJLpDPkuB+tWYYz6i72mCvNlBSvrz90iheeYe6kGoP9lZaYFNuNguEJ2OSruZWiDmjm1ozDfSbcKjxUmVkqM1of7KYCu18rPLAZtRJl7gm50q5TvWI7PvHYOi9cTsy3UQ0QqNUDL9Mbfeo3konun/qSf69g2hnLCP3uekMXlKQ41KJO2gsLr/koRWGsM7YynGWtn7+T6eWlGMZ5s+m/urvSdvYbgILGQg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(7416014)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DVkomVhQDpWqAxACVH4lfv2Fc83QxojDPRqhC9HabmmwpKbUQwKsgp6/L8x9sgebA/TFiaZUyg7CBYrEAJg6O2ZZS7cLnSU7hgY9C/pp7dxpH1DtizP8sztFTEqRaDzcSSUFXmDOf93NZQLndiAXEwmVk/FjkNpdlSNbRQVnWM3E05L+WI1oga8CoUtke30MZ+yjxBNTfdfPwM8pwisjmDNI63zCgURSSVF3+QWngAJU1H/SCp2o5uYKM9JP/+cgBZWnTrNFRJbNVzl4evjk4ZxcecUf2+p4dPEn7RPOV8KH57kH7YbsVs3AZP5TmcItZRdcj9lERW35zCme4Kf7VLYIlaJ8nLtP2aoU6qpVZlxKWRejTJGJXWLwS1Qkhy814K4Ne5e+ZtgnTqM77oRecqwgBR7sy/1sN7yjTH8j8lbsUyH/WeLUJwcq5KKxC/iU
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 15:00:16.4004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38badc6f-26a5-4a66-cc22-08df1fccb409
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5798

Firmware loaders currently use tlv.get_string(b"VERS")? inside dev_dbg!
arguments. The string conversion rejects non-printable ASCII, and its
error currently propagates even with debug assertions disabled.

Move those conversions before the logging calls so that making dev_dbg!
arguments conditional does not change firmware validation. Keep the
message text and the order of the remaining initialization unchanged.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/firmware/booter.rs           | 8 ++------
 drivers/gpu/nova-core/firmware/fsp.rs              | 3 ++-
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 7 ++-----
 drivers/gpu/nova-core/firmware/gsp.rs              | 3 ++-
 drivers/gpu/nova-core/firmware/riscv.rs            | 7 ++-----
 5 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index aa4458bb3312..6b5384e75c5c 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -93,12 +93,8 @@ pub(crate) fn new(
         };
         let fw = request_tlv(dev, chipset, fw_name)?;
         let tlv = Tlv::new(fw.data())?;
-        dev_dbg!(
-            dev,
-            "loaded {} firmware v{}\n",
-            fw_name,
-            tlv.get_string(b"VERS")?
-        );
+        let version = tlv.get_string(b"VERS")?;
+        dev_dbg!(dev, "loaded {} firmware v{}\n", fw_name, version);
 
         let os_data_offset = tlv.get_u32(b"DAOF")?;
         let os_data_size = tlv.get_u32(b"DASZ")?;
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index d47b1d2a1030..308ce7889ced 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -50,7 +50,8 @@ impl<'a> FspFirmware<'a> {
     pub(crate) fn new(dev: &'a device::Device<device::Bound>, chipset: Chipset) -> Result<Self> {
         let fw = request_tlv(dev, chipset, "fmc")?;
         let tlv = Tlv::new(fw.data())?;
-        dev_dbg!(dev, "loaded fsp firmware v{}\n", tlv.get_string(b"VERS")?);
+        let version = tlv.get_string(b"VERS")?;
+        dev_dbg!(dev, "loaded fsp firmware v{}\n", version);
 
         let fmc_image_data = tlv.get_bytes(b"BLOB")?;
         let fmc_image = Coherent::from_slice(dev, fmc_image_data, GFP_KERNEL)?;
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index a87878fe2aec..406995a24e7b 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -125,11 +125,8 @@ pub(crate) fn new(
     ) -> Result<Self> {
         let fw = request_tlv(dev, chipset, "gen_bootloader")?;
         let tlv = Tlv::new(fw.data())?;
-        dev_dbg!(
-            dev,
-            "loaded generic bootloader firmware v{}\n",
-            tlv.get_string(b"VERS")?
-        );
+        let version = tlv.get_string(b"VERS")?;
+        dev_dbg!(dev, "loaded generic bootloader firmware v{}\n", version);
 
         let ucode = {
             let blob = tlv.get_bytes(b"BLOB")?;
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 22d1f9329c9f..ac741a97e759 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -74,7 +74,8 @@ pub(crate) fn new(
         pin_init::pin_init_scope(move || {
             let firmware = request_tlv(dev, chipset, "gsp")?;
             let tlv = Tlv::new(firmware.data())?;
-            dev_dbg!(dev, "loaded gsp firmware v{}\n", tlv.get_string(b"VERS")?);
+            let version = tlv.get_string(b"VERS")?;
+            dev_dbg!(dev, "loaded gsp firmware v{}\n", version);
 
             let size = usize::from_safe_cast(tlv.get_u32(b"SIZE")?);
             let mut fw_vvec = VVec::zeroed(size, GFP_KERNEL).map_err(|_| ENOMEM)?;
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index f05cfb1c65da..918908ebcac8 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -30,11 +30,8 @@ impl<'a> RiscvFirmware<'a> {
     /// Parses the RISC-V firmware image contained in `fw`.
     pub(crate) fn new(dev: &'a device::Device<device::Bound>, fw: &Firmware) -> Result<Self> {
         let tlv = Tlv::new(fw.data())?;
-        dev_dbg!(
-            dev,
-            "loaded gsp bootloader firmware v{}\n",
-            tlv.get_string(b"VERS")?
-        );
+        let version = tlv.get_string(b"VERS")?;
+        dev_dbg!(dev, "loaded gsp bootloader firmware v{}\n", version);
 
         let code_offset = tlv.get_u32(b"CDOF")?;
         let data_offset = tlv.get_u32(b"DAOF")?;
-- 
2.53.0

