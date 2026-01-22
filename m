Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012061.outbound.protection.outlook.com [40.107.209.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9E7223DC6
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 22:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769121796; cv=fail; b=iZKz0H9IcvKhk1DIENR5QDx7fKB6iswznAuSXwXnzyYCFDCvBQEMeq4j89Cx1LnZmzCJt4rPQVTz76kD775joonzuQNzCm2ypNSVVh6yUoe2GGxO9G2JVqME8rPFP66CrzHREk8lbFl9z1GoyAsBO2xQ5TtsO+yQfjYgN6mIu+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769121796; c=relaxed/simple;
	bh=Z0EAZjKl6AIxTHE8M2jdNeIPjqGb+ShQa/zKZgbbQRk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UifFf+cOyTYncNdovVhnGUviSsdVrMbhj8536m9UQ0GI27bR7mbhchFo1h5qeekB5voZ2ysfPEM9DUgJHiyXxt+GzqoFMXChRxvi5kRZIO75Pw0uv5E5BAd++2cU/2n7Rs9u8xd0AbjHahPMsf4cUb6CyWR8ZS/iIqiWqElO4dM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dyXHbp7q; arc=fail smtp.client-ip=40.107.209.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dyXHbp7q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9XO6voMdXO/7AYqh2BXpo0PZW21KEUC1UXu6TwjUriAXhH4Q6gkuVbnzVElria4WyYj9oVsWcM3+oKN9hbbgFx8vfIE7NBDHfnRh+oWprrmCj8/HoMLpzxkZTH4Ks6ghmNJknZpy/CwH1TfWuPWzvuc0oJpyFsWPqNpOQav/dkQ+Wgyx6BNH0D1izK14s1R31GRK0xe28Mr4HlosSAH7MjuNT8lMoyV4MdcUBe8lqRir9U6rDUEXtpj/BQ/rpeWEKkmQ/6K9gpPXKPkP6pLVGguA18z+oVPAzE6NiTUym4hOVtbUWIlr3hCVCMXoecT6DyHFkGj4IWy0RUnGysHvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXdMEzhBWxqyygaXfXLn9KB/YTXM4UOBfEPZZZTaqZw=;
 b=WrgXzwHWTnMEm/6czXPgJsQnCyeVrFY6v6ysZ1yNXZ4o0spNBYopeflG6UdXrHH8nd98OMH65zqtJOR5uAmXC1NrxlAxJ4sB9wUDGbWX/lNZXzJ9g7Nr8GEujEQucj4MlARYEbe6UG0rTqllgArs7kWhusM9bGK85McQgwRnDbbHCexISbbJHCW+AyuYtXCAfZ7a2UNULELCH5PAFOJB/Pbe5S6EZlBmWLz44WeiVsixvq2LCyn6YHJzH4yDiWw+aYm9l9O5+UF8mmatUgT0T8LZeSOkZJhmi+QfXrWrj4mxa5B+SxiAUwacR97Ups0FYUfo2A8mqoQQD6sf4h10JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXdMEzhBWxqyygaXfXLn9KB/YTXM4UOBfEPZZZTaqZw=;
 b=dyXHbp7qVLfvxu0jkPw/ZWI+mzBnPD2+WlHhkZdaEZwN45baB9pURWsrycqRYXlkcDtQaqSM5c83NIZBtamIzQVJSAEoba3JSF+IruqiBeOJnjLOBfkD9tDrrP6Vick8wYjBxtFjZDokHiCAtuWBeZC+3rQMUCTY+qMG4+a2SbM38XsSsc2Zzjn7+RZVtwDoA+V1vgL+bJdJQh2umxUNPhuH/4OBHO8A05DDaQl6wbQyHktdPalMGMFec/QkVPPzJC+y4jtrHV/D7nPUnhxweZKS1iK+9/4mHSrzckaxwS2V7qOnQmfgXDWWXEaDl4oScSU3Ny6XP2lU/215yVJ2Zg==
Received: from DM6PR21CA0004.namprd21.prod.outlook.com (2603:10b6:5:174::14)
 by IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 22:31:33 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:174:cafe::ed) by DM6PR21CA0004.outlook.office365.com
 (2603:10b6:5:174::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Thu,
 22 Jan 2026 22:31:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 22:31:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:13 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:11 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v8 13/13] gpu: nova-core: use the Generic Bootloader to boot FWSEC
Date: Thu, 22 Jan 2026 16:28:48 -0600
Message-ID: <20260122222848.2555890-14-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122222848.2555890-1-ttabi@nvidia.com>
References: <20260122222848.2555890-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|IA1PR12MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e3cc8f-f8a5-4c83-6010-08de5a05fe8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a7eKiQmOKCholMei2moQM72NEafLGuubc1cJ/Wad8QN3noztsubcb9MoLkDc?=
 =?us-ascii?Q?MwE/SiyKO3cuIMCXGhI9HiOSmi6Fy126QOQfxy33ABpEIecmq3igCPjUqPzW?=
 =?us-ascii?Q?V2uvH7W5n/7sbAUECWidvBoWpuTqp0ScbLeLcj4vTcRzgKi91x25UR4DkNTJ?=
 =?us-ascii?Q?BdaiHWhvXUbnmKB3/Ne18D179t85tflxbFYSVe/6CWcayoC+nIDfj3Jv1AkA?=
 =?us-ascii?Q?nu8QlIoj9Ny8b4IgMsQbYBs97lTjk6l6SWUECDkbPJvNz4WmuOZX6jA+LXiR?=
 =?us-ascii?Q?JI/9SvE+7gDG3wkjbsoaOhw6A1sTWK+zC6ltkUGR3W8pFROJn6baKx64YtSR?=
 =?us-ascii?Q?2LEkjmfE9aebIDl6pzwe3RE4dd78BLucsMxeJH7GuiO+7J9iSYUmdJHMxJ1s?=
 =?us-ascii?Q?rHJFir+C9N/wSn4yMD/AXCjYWmhG/otylJz+tm5Km7E2Fi3LBXTte6VyiL17?=
 =?us-ascii?Q?+gJQEMOKGSsBBDc4bamxuEv1zwC3OsurrhFEBkFz6OxveJD9OAsCbLt/jbIF?=
 =?us-ascii?Q?oqBN7IsF93DA08SkGTDCA15flUfj4IJGLeYs8SGetPUvPEFS7P6yi9aPersq?=
 =?us-ascii?Q?u380c7SpdLruwseYPXGXdcRO+i6suev7BbyDYUjCWlk92euYYmp2dk8SRurF?=
 =?us-ascii?Q?OiVgm0invzY11tVMmIQTHL0lb9Oz2yTyX+29WiTPzeX/z4Mtq4rU2sOmrLTB?=
 =?us-ascii?Q?TMws7Wi3JczMQNUhLH63W8Vx01nQAcDuTnYpxYXbMyt9F2F6gylkm4+1PwhX?=
 =?us-ascii?Q?LgRncseDqt6Iu9Z2szu8XKU/CCAZN2rbaZSv2enPzU05CMM1pRNPpbjYUfIk?=
 =?us-ascii?Q?Vs8ZpFeESVpdVt8PohHdxzTBCASIhRHsocrf8N4j2zTVIDneqZyjDS0EAdft?=
 =?us-ascii?Q?mV83F0sINPdhmlMrQfegL9olvwWyAZetDWeLBPbuB1Rqsd2gvDPYjCerdqOj?=
 =?us-ascii?Q?d03nzOAFP+mL2n/7vAt4LpuVN0g88n4gw5sq+XFP/ECSGgmtIxhyKXIrQ10f?=
 =?us-ascii?Q?NO+wVfKTNCXNU6OuZ/kRrM+TYIfqQWrAcIgHc+3tE/mKYKzueYEBJEI5nLcD?=
 =?us-ascii?Q?OTumyHI8lWCnNJAp7IqKmoiTF7BXYA6rEoVa7gqqmTq5+HUASQM+BUnVeSt+?=
 =?us-ascii?Q?gcWc0LvQOAuPO3G6akVwWuuQVPOGqzGIpYxeQiHn6UKo0OYqps4PNCu41DNN?=
 =?us-ascii?Q?qI1cEk66Pwmq5xhHHchGYy6e25hQ6eTEIZQfsyfhs269Xu8Op43xG8evQFrY?=
 =?us-ascii?Q?Yr/yyncratS1CHqdWo9kER21eFIPLLtIIjf1ytZdO4yHnm+Auz/FF7cZrxLs?=
 =?us-ascii?Q?JmN4KRjuUpFAKIzJg6uo05NQgcLq5Uzs1ryry0kMibBYol+M0WVgfsjuFP7l?=
 =?us-ascii?Q?9AQr8Bq47IthMdM0Yde/OQts5YfFiHOBg9gnVag2Ag45tyg4Sp9gUA3RIhkR?=
 =?us-ascii?Q?A13eYYcL7uAElT3XLlvfUJ5vVcCCqXCEszzK4drEf9oZH2IHoLkl7e52Vw1M?=
 =?us-ascii?Q?tq2L7GW/IicKdrxk6FyboAWnbk+vfzQLuBbFo1mX9iEAixCe197F1bA7LLtT?=
 =?us-ascii?Q?TtORpYb4c5VFr8EQUsMuFPP1GmwbNg+iR1u/8DpjifWB8C5OohsjBK0Z0bd2?=
 =?us-ascii?Q?aJKKbPMUEFXAm198DulZR+O87yFjqeqktso7vFZSoMuGCyMaVhR6A+oRRJep?=
 =?us-ascii?Q?7w7l6w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 22:31:32.3735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e3cc8f-f8a5-4c83-6010-08de5a05fe8e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8190

On Turing and GA100, a new firmware image called the Generic Bootloader
(gen_bootloader, or gbl for short) must be used to load FWSEC into Falcon
memory.  The driver loads gbl into Falcon IMEM, passes a descriptor that
points to FWSEC, and then boots the gbl.  The gbl will then load FWSEC
into IMEM and boot it.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs         |  85 +++++++++++----
 drivers/gpu/nova-core/firmware/fwsec.rs | 131 +++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/boot.rs       |   6 +-
 3 files changed, 199 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 4f3a3b002725..d18483df2d5e 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -18,12 +18,17 @@
     time::{
         Delta, //
     },
+    transmute::AsBytes, //
 };
 
 use crate::{
     dma::DmaObject,
     driver::Bar0,
     falcon::hal::LoadMethod,
+    firmware::fwsec::{
+        BootloaderDmemDescV2,
+        GenericBootloader, //
+    },
     gpu::Chipset,
     num::{
         FromSafeCast,
@@ -498,7 +503,12 @@ fn pio_wr<F: FalconFirmware<Target = E>>(
     }
 
     /// Perform a PIO copy into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
-    pub(crate) fn pio_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
+    pub(crate) fn pio_load<F: FalconFirmware<Target = E>>(
+        &self,
+        bar: &Bar0,
+        fw: &F,
+        gbl: Option<&GenericBootloader>,
+    ) -> Result {
         let imem_sec = fw.imem_sec_load_params();
         let imem_ns = fw.imem_ns_load_params().ok_or(EINVAL)?;
         let dmem = fw.dmem_load_params();
@@ -509,21 +519,55 @@ pub(crate) fn pio_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
 
         regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
 
-        self.pio_wr(
-            bar,
-            fw,
-            FalconMem::ImemNonSecure,
-            &imem_ns,
-            u16::try_from(imem_ns.dst_start >> 8)?,
-        )?;
-        self.pio_wr(
-            bar,
-            fw,
-            FalconMem::ImemSecure,
-            &imem_sec,
-            u16::try_from(imem_sec.dst_start >> 8)?,
-        )?;
-        self.pio_wr(bar, fw, FalconMem::Dmem, &dmem, 0)?;
+        // If the Generic Bootloader was passed, then use it to boot FRTS
+        if let Some(gbl) = gbl {
+            let dst_start = u16::try_from(0x10000 - gbl.desc.code_size)?;
+            let data = &gbl.ucode[..usize::from_safe_cast(gbl.desc.code_size)];
+            let tag = u16::try_from(gbl.desc.start_tag)?;
+
+            self.pio_wr_slice(bar, data, dst_start, FalconMem::ImemNonSecure, tag)?;
+
+            // This structure tells the generic bootloader where to find the FWSEC
+            // image.
+            let dmem_desc = BootloaderDmemDescV2 {
+                reserved: [0; 4],
+                signature: [0; 4],
+                ctx_dma: 4, // FALCON_DMAIDX_PHYS_SYS_NCOH
+                code_dma_base: fw.dma_handle(),
+                non_sec_code_off: imem_ns.dst_start,
+                non_sec_code_size: imem_ns.len,
+                sec_code_off: imem_sec.dst_start,
+                sec_code_size: imem_sec.len,
+                code_entry_point: 0,
+                data_dma_base: fw.dma_handle() + u64::from(dmem.src_start),
+                data_size: dmem.len,
+                argc: 0,
+                argv: 0,
+            };
+
+            regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 4, |v| {
+                v.set_target(FalconFbifTarget::CoherentSysmem)
+                    .set_mem_type(FalconFbifMemType::Physical)
+            });
+
+            self.pio_wr_slice(bar, dmem_desc.as_bytes(), 0, FalconMem::Dmem, 0)?;
+        } else {
+            self.pio_wr(
+                bar,
+                fw,
+                FalconMem::ImemNonSecure,
+                &imem_ns,
+                u16::try_from(imem_ns.dst_start >> 8)?,
+            )?;
+            self.pio_wr(
+                bar,
+                fw,
+                FalconMem::ImemSecure,
+                &imem_sec,
+                u16::try_from(imem_sec.dst_start >> 8)?,
+            )?;
+            self.pio_wr(bar, fw, FalconMem::Dmem, &dmem, 0)?;
+        }
 
         self.hal.program_brom(self, bar, &fw.brom_params())?;
 
@@ -764,9 +808,14 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
     }
 
     // Load a firmware image into Falcon memory
-    pub(crate) fn load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
+    pub(crate) fn load<F: FalconFirmware<Target = E>>(
+        &self,
+        bar: &Bar0,
+        fw: &F,
+        gbl: Option<&GenericBootloader>,
+    ) -> Result {
         match self.hal.load_method() {
-            LoadMethod::Pio => self.pio_load(bar, fw),
+            LoadMethod::Pio => self.pio_load(bar, fw, gbl),
             LoadMethod::Dma => self.dma_load(bar, fw),
         }
     }
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index a8ec08a500ac..2237c5584114 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -40,12 +40,15 @@
         FalconLoadTarget, //
     },
     firmware::{
+        BinHdr,
         FalconUCodeDesc,
         FirmwareDmaObject,
         FirmwareSignature,
         Signed,
-        Unsigned, //
+        Unsigned,
+        FIRMWARE_VERSION, //
     },
+    gpu::Chipset,
     num::{
         FromSafeCast,
         IntoSafeCast, //
@@ -213,6 +216,68 @@ unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
     T::from_bytes_mut(unsafe { fw.as_slice_mut(offset, size_of::<T>())? }).ok_or(EINVAL)
 }
 
+/// Descriptor used by RM to figure out the requirements of the boot loader.
+#[repr(C)]
+#[derive(Debug, Clone)]
+pub(crate) struct BootloaderDesc {
+    /// Starting tag of bootloader.
+    pub start_tag: u32,
+    /// DMEM offset where [`BootloaderDmemDescV2`] is to be loaded.
+    pub dmem_load_off: u32,
+    /// Offset of code section in the image.
+    pub code_off: u32,
+    /// Size of code section in the image.
+    pub code_size: u32,
+    /// Offset of data section in the image.
+    pub data_off: u32,
+    /// Size of data section in the image.
+    pub data_size: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for BootloaderDesc {}
+
+/// Structure used by the boot-loader to load the rest of the code.
+///
+/// This has to be filled by the GPU driver and copied into DMEM at offset
+/// [`BootloaderDesc.dmem_load_off`].
+#[repr(C, packed)]
+#[derive(Debug, Clone)]
+pub(crate) struct BootloaderDmemDescV2 {
+    /// Reserved, should always be first element.
+    pub reserved: [u32; 4],
+    /// 16B signature for secure code, 0s if no secure code.
+    pub signature: [u32; 4],
+    /// DMA context used by the bootloader while loading code/data.
+    pub ctx_dma: u32,
+    /// 256B-aligned physical FB address where code is located.
+    pub code_dma_base: u64,
+    /// Offset from `code_dma_base` where the non-secure code is located (must be multiple of 256).
+    pub non_sec_code_off: u32,
+    /// Size of the non-secure code part.
+    pub non_sec_code_size: u32,
+    /// Offset from `code_dma_base` where the secure code is located (must be multiple of 256).
+    pub sec_code_off: u32,
+    /// Size of the secure code part.
+    pub sec_code_size: u32,
+    /// Code entry point invoked by the bootloader after code is loaded.
+    pub code_entry_point: u32,
+    /// 256B-aligned physical FB address where data is located.
+    pub data_dma_base: u64,
+    /// Size of data block (should be multiple of 256B).
+    pub data_size: u32,
+    /// Arguments to be passed to the target firmware being loaded.
+    pub argc: u32,
+    /// Number of arguments to be passed to the target firmware being loaded.
+    pub argv: u32,
+}
+// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for BootloaderDmemDescV2 {}
+
+pub(crate) struct GenericBootloader {
+    pub desc: BootloaderDesc,
+    pub ucode: KVec<u8>,
+}
+
 /// The FWSEC microcode, extracted from the BIOS and to be run on the GSP falcon.
 ///
 /// It is responsible for e.g. carving out the WPR2 region as the first step of the GSP bootflow.
@@ -221,6 +286,8 @@ pub(crate) struct FwsecFirmware {
     desc: FalconUCodeDesc,
     /// GPU-accessible DMA object containing the firmware.
     ucode: FirmwareDmaObject<Self, Signed>,
+    /// Generic bootloader
+    gen_bootloader: Option<GenericBootloader>,
 }
 
 impl FalconLoadParams for FwsecFirmware {
@@ -245,7 +312,19 @@ fn brom_params(&self) -> FalconBromParams {
     }
 
     fn boot_addr(&self) -> u32 {
-        0
+        match &self.desc {
+            FalconUCodeDesc::V2(_v2) => {
+                // On V2 platforms, the boot address is extracted from the
+                // generic bootloader, because the gbl is what actually copies
+                // FWSEC into memory, so that is what needs to be booted.
+                if let Some(ref gbl) = self.gen_bootloader {
+                    gbl.desc.start_tag << 8
+                } else {
+                    0
+                }
+            }
+            FalconUCodeDesc::V3(_v3) => 0,
+        }
     }
 }
 
@@ -346,6 +425,7 @@ impl FwsecFirmware {
     /// command.
     pub(crate) fn new(
         dev: &Device<device::Bound>,
+        chipset: Chipset,
         falcon: &Falcon<Gsp>,
         bar: &Bar0,
         bios: &Vbios,
@@ -402,9 +482,54 @@ pub(crate) fn new(
             ucode_dma.no_patch_signature()
         };
 
+        // The Generic Bootloader exists only on Turing and GA100.  To avoid a bogus
+        // console error message on other platforms, only try to load it if it's
+        // supposed to be there.
+        let gbl_fw = if chipset < Chipset::GA102 {
+            Some(super::request_firmware(
+                dev,
+                chipset,
+                "gen_bootloader",
+                FIRMWARE_VERSION,
+            )?)
+        } else {
+            None
+        };
+
+        let gbl = match gbl_fw {
+            Some(fw) => {
+                let hdr = fw
+                    .data()
+                    .get(0..size_of::<BinHdr>())
+                    .and_then(BinHdr::from_bytes_copy)
+                    .ok_or(EINVAL)?;
+
+                let desc_offset = usize::from_safe_cast(hdr.header_offset);
+                let desc = fw
+                    .data()
+                    .get(desc_offset..desc_offset + size_of::<BootloaderDesc>())
+                    .and_then(BootloaderDesc::from_bytes_copy)
+                    .ok_or(EINVAL)?;
+
+                let ucode_start = usize::from_safe_cast(hdr.data_offset);
+                let ucode_size = usize::from_safe_cast(hdr.data_size);
+                let ucode_data = fw
+                    .data()
+                    .get(ucode_start..ucode_start + ucode_size)
+                    .ok_or(EINVAL)?;
+
+                let mut ucode = KVec::new();
+                ucode.extend_from_slice(ucode_data, GFP_KERNEL)?;
+
+                Some(GenericBootloader { desc, ucode })
+            }
+            None => None,
+        };
+
         Ok(FwsecFirmware {
             desc,
             ucode: ucode_signed,
+            gen_bootloader: gbl,
         })
     }
 
@@ -420,7 +545,7 @@ pub(crate) fn run(
             .reset(bar)
             .inspect_err(|e| dev_err!(dev, "Failed to reset GSP falcon: {:?}\n", e))?;
         falcon
-            .load(bar, self)
+            .load(bar, self, self.gen_bootloader.as_ref())
             .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
         let (mbox0, _) = falcon
             .boot(bar, Some(0), None)
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index be427fe26a58..f253d5f12252 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -48,6 +48,7 @@ impl super::Gsp {
     /// created the WPR2 region.
     fn run_fwsec_frts(
         dev: &device::Device<device::Bound>,
+        chipset: Chipset,
         falcon: &Falcon<Gsp>,
         bar: &Bar0,
         bios: &Vbios,
@@ -65,6 +66,7 @@ fn run_fwsec_frts(
 
         let fwsec_frts = FwsecFirmware::new(
             dev,
+            chipset,
             falcon,
             bar,
             bios,
@@ -144,7 +146,7 @@ pub(crate) fn boot(
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
 
         let booter_loader = BooterFirmware::new(
             dev,
@@ -183,7 +185,7 @@ pub(crate) fn boot(
         );
 
         sec2_falcon.reset(bar)?;
-        sec2_falcon.load(bar, &booter_loader)?;
+        sec2_falcon.load(bar, &booter_loader, None)?;
         let wpr_handle = wpr_meta.dma_handle();
         let (mbox0, mbox1) = sec2_falcon.boot(
             bar,
-- 
2.52.0

