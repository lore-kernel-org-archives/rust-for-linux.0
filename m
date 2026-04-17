Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011049.outbound.protection.outlook.com [40.93.194.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5303C7DE8
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 19:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776453281; cv=fail; b=q9eJmipYCP1S+5M3tbZAk1Fo3hxX3oaHK4H+CJq7z/u1yFQ40idy4LZb9cKO+wrwfi+oY1/6skMnILSOKK5cibmU/MAlsLnFUAp9Kjye/HFURLdulwXJEsx9sTbjw5hvc2VG+DfJ8Bi9Fxrqt8XJHHZrmeIhHnZWk9sXnQxRzM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776453281; c=relaxed/simple;
	bh=PYLZeFVkerQfEaj0KoUsPpMP9z6160DCKUnzBEWvErc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pTRHh9RHu+ZIbrm5xY/O3yD39dxWGPo4m6s//y2cJDp1dYdlhMsLwiR7Ls+hsAvac1kRw3xrAR2n8BIufNTkNgYzmg4u95H9qTUY4/LKyjb/stuV9eukBqP101lAbcih1eUVY0ehC3Z81wr2XL33gN4l8R38BwlZxTLUBE5lo0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nov0X+6A; arc=fail smtp.client-ip=40.93.194.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nov0X+6A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+ZWwdcUnQREAaPXy6vCJ65qk0/lp87EF+BuRVlXAxraPKu2wNbaj3Be/wFHAhU94TVsEyJn3AM2RM/Am5Ux5bZZN0JXQFMbiXcx6c3w59lw+XHqfkNCJcn2zR7Qk1q3JrYtrjaFIb5im4m1AsBQmdtYwdycFy1UqnPnymqcIeESMvP9ZPKFjivnTYcu7jbin8Y6AzEfQVQBKsNljswKJGvjdM9hJ/03NE7z+T4Uqn+7A49E4ndpUf5fTedyIM4aZz33UTwA5MN2ODGe5bd9mAnQRpHYM0zVyuI5x+bZRNhDNZq1qvvATOQINRl5jBT0K9NVb09RoKOkFfNVuR8WBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckTDDNmKDDO/4x+XN3lwzlZecNDbOFfhyCXPlNBrC0E=;
 b=llp6fchxtnisqFxwMljGFeVMPnX0F63poSR0vofX4ZitTeqbQE3h0FUkmiyfRDHWrIW4GbCrt4vNy27U29hElY/y6Aa/ulGc/QZq9kukUR2LITOzf6dMTd4nVs4NtuHBPYitZrrsfoXjujh2MKh+QWebGcs0JtnfbOPFmbsVig/BwXftAUuUqlMUCs/WtsxtGC97/bwgECBMnqeiWqIqJ5zVVnnUvx+O4vgPlkmNDqIEXefA8RsjWz6UcxGuEx592r51YScvLes7n+ccy9VEcfUkk/GM55PmnmJSDpmcVNM/A92o0tIOyMDFXY8OWpFvmEasa/skzKRTO2vLjjS0lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckTDDNmKDDO/4x+XN3lwzlZecNDbOFfhyCXPlNBrC0E=;
 b=nov0X+6Ad/SkDitywUYL0LiqTpN863t37DNGm79UGvmRL95O0X1MimB0BnWXZeZztMIFkaApy7SyXZRtGowYyLWCsPBAGP5BHPlzZ94XlJVZ1MLF5RoF+u/zz5ZZiqxuwfrRsayd+khXNLgIRo5gSWbWlun92jlIX3KFILCgJ35CNU+sK78D1+1GkgAt/6ebZ3X6q4c84wU7z2g+Ff3XbXdwVsl4C7L48KyasBXFf/Pg9r/mmba70g37WjgHCC6m5dY33ajLuvwkpphrXlef1NVt9MxYKEKwIbmZjguqu7niMPwypzsbtNUWmQJQ8mswnUCLnpvajkHBqUpE5QoAuw==
Received: from BN9PR03CA0227.namprd03.prod.outlook.com (2603:10b6:408:f8::22)
 by DS5PPFF8845FFFB.namprd12.prod.outlook.com (2603:10b6:f:fc00::66a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Fri, 17 Apr
 2026 19:14:33 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:408:f8:cafe::42) by BN9PR03CA0227.outlook.office365.com
 (2603:10b6:408:f8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 19:14:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 17 Apr 2026 19:14:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 12:14:12 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 12:14:11 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 5/6] gpu: nova-core: skip the IFR header if present
Date: Fri, 17 Apr 2026 14:13:58 -0500
Message-ID: <20260417191359.1307434-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|DS5PPFF8845FFFB:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf5c932-1382-4d0f-a5ed-08de9cb58eb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4mlU6ObPlL1DV20yZhg7sS2ro9d0u67EUBsBgMXUbQAUHEMp6X4J0T2Nj8uQXRsv6fEo08QRSjmlyzzloIkXfmErVzQ62RlQP1Z9NzlOGv5UfAQWPmeRCTuQyWqbxy2XKMRjLBISzbEjke5ZEvvDY27R50w4dRozlbBKCPHuh4hdQRZ/vadZ6azT6GONF74iRfT22TJg6xHoEpwEdWfxnEJ129fj1VqrG/RBkIhJlF66XdtliwU0MNOBVF5E538F5qMdi+yY29J3rswVjpspGM+21ugzPnb9snkhs2Q3iv3dBK167riMB0Fw262GmM8JJFfBoE1m7Kh81TO4noTeKYhu//aHa0GESKgq0NuqE0nCEzdI6jEvitV1S+1x1Cjk8FLVI1yxrQTTywkt6H4fDiVNPHRZZXhhMBGBThW3hBgXK2cKeQJwkaiGlO30XPHPoOALXOvPCRfuGoFcIWdJFz6mfZyx+dkvWXgEHVaOXESqDKv/2YpYv+2cLQDTuk4/bcdCKmUTf34PemEi3ai1sbOBO6kE8psGWyO7K9u4XEoBHRYOmrQgYCUbCueq9Dn5mtaGEA/69o1eaQCcXMa5lURUA/0HgwpDRUzRS9zSPxcA0IbefvSon0lPURaXK6+hElnw1M+u8BVgQoybDmgrAG21b359/XPbdPCCCPQZrY1FAw4Nk6fD8cNVgRCzkS+274eJiuKGiQG4iHbEGlGOWFiq/SqptKpzOCY3pC+rcNRQH+VKOTplK4ilxtFeykPqZdv48x+TE2d985qyhqAueA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BPtlQDyxKkDY5LOxYWOtoImea7qdTeuZQYWdJh7rsoODn/Urx4VLrbhKkUB4m+RO1UphZk9hgjhrAaA9HCJwszZ3EwgnFS4KtwJZluJCuM9lcM3WpVZ8GjZlz7FfvT/BZauHIUEPaiRh4JDOXhuslemYWYWAsKPPa8COTmXTC/4k9r9sJCwi9h/7s8DcMaR9G+nQBsC2TZrpW7VYjpSphnW0VtTLXlyS2+OxDcIal66MLNUEVWaGKQhpE9jZpGCTKNJ2bEYWT/KTKIPDeMo7lL7rQyg+sT/7EMUhFqJTv7EW1LojitJoYqdn3I4ID80qAw2NUpaTR9mymEtPpl8l6MFBNRZTiz6sT+D9ld5m9QGt9R7wxGc3CStXjk5aNq8CtFJBAxTUgPtGa5XhHrOTehPifpkrsarsKk87WFSK2PvhFZrHZzPQwNDPMu7cTVlv
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 19:14:32.8522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf5c932-1382-4d0f-a5ed-08de9cb58eb3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFF8845FFFB

The GPU's ROM may begin with an Init-from-ROM (IFR) header that precedes
the PCI Expansion ROM images (VBIOS).  When present, the PROM shadow
method must parse this header to determine the offset where the PCI ROM
images actually begin, and adjust all subsequent reads accordingly.

On most GPUs this is not needed because the IFR microcode has already
applied the ROM offset so that PROM reads transparently skip the header.
On GA100, for whatever reason, the IFR offset is not applied to PROM
reads.  Therefore, the search for the PCI expansion must skip the IFR
header, if found.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 85 +++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index e726594eb130..6bcfb6c5cf44 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -12,6 +12,8 @@
         Alignable,
         Alignment, //
     },
+    register,
+    sizes::SZ_4K,
     sync::aref::ARef,
     transmute::FromBytes,
 };
@@ -89,13 +91,94 @@ struct VbiosIterator<'a> {
     last_found: bool,
 }
 
+// IFR Header in VBIOS.
+
+register! {
+    pub(crate) NV_PBUS_IFR_FMT_FIXED0(u32) @ 0x300000 {
+        31:0    signature;
+    }
+}
+
+register! {
+    pub(crate) NV_PBUS_IFR_FMT_FIXED1(u32) @ 0x300004 {
+        30:16   fixed_data_size;
+        15:8    version => u8;
+    }
+}
+
+register! {
+    pub(crate) NV_PBUS_IFR_FMT_FIXED2(u32) @ 0x300008 {
+        19:0 total_data_size;
+    }
+}
+
+/// Return the byte offset where the PCI Expansion ROM images begin in the GPU's ROM.
+///
+/// The GPU's ROM may begin with an Init-from-ROM (IFR) header that precedes
+/// the PCI Expansion ROM images (VBIOS).  When present, the PROM shadow
+/// method must parse this header to determine the offset where the PCI ROM
+/// images actually begin, and adjust all subsequent reads accordingly.
+///
+/// On most GPUs this is not needed because the IFR microcode has already
+/// applied the ROM offset so that PROM reads transparently skip the header.
+/// On GA100, for some reason, the IFR offset is not applied to PROM
+/// reads.  Therefore, the search for the PCI expansion must skip the IFR
+/// header, if found.
+fn vbios_rom_offset(dev: &device::Device, bar0: &Bar0) -> Result<usize> {
+    /// IFR signature.
+    const NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE: u32 = u32::from_le_bytes(*b"NVGI");
+    /// ROM directory signature.
+    const NV_ROM_DIRECTORY_IDENTIFIER: u32 = u32::from_le_bytes(*b"RFRD");
+    /// Offset of the NV_PMGR_ROM_ADDR_OFFSET register in IFR Extended section.
+    const IFR_SW_EXT_ROM_ADDR_OFFSET: usize = 4;
+    /// Size of Redundant Firmware Flash Status section.
+    const RFW_FLASH_STATUS_SIZE: usize = SZ_4K;
+    /// Offset in the ROM Directory of the PCI Option ROM offset
+    const PCI_OPTION_ROM_OFFSET: usize = 8;
+
+    let signature = bar0.read(NV_PBUS_IFR_FMT_FIXED0).signature();
+
+    if signature == NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE {
+        let fixed1 = bar0.read(NV_PBUS_IFR_FMT_FIXED1);
+
+        match fixed1.version() {
+            1 | 2 => {
+                let fixed_data_size = usize::from(fixed1.fixed_data_size());
+                let pmgr_rom_addr_offset = fixed_data_size + IFR_SW_EXT_ROM_ADDR_OFFSET;
+                bar0.try_read32(ROM_OFFSET + pmgr_rom_addr_offset)
+                    .map(usize::from_safe_cast)
+            }
+            3 => {
+                let fixed2 = bar0.read(NV_PBUS_IFR_FMT_FIXED2);
+                let total_data_size = usize::from(fixed2.total_data_size());
+                let flash_status_offset =
+                    usize::from_safe_cast(bar0.try_read32(ROM_OFFSET + total_data_size)?);
+                let dir_offset = flash_status_offset + RFW_FLASH_STATUS_SIZE;
+                let dir_sig = bar0.try_read32(ROM_OFFSET + dir_offset)?;
+                if dir_sig != NV_ROM_DIRECTORY_IDENTIFIER {
+                    dev_err!(dev, "could not find IFR ROM directory\n");
+                    return Err(EINVAL);
+                }
+                bar0.try_read32(ROM_OFFSET + dir_offset + PCI_OPTION_ROM_OFFSET)
+                    .map(usize::from_safe_cast)
+            }
+            _ => {
+                dev_err!(dev, "unsupported IFR header version {}\n", fixed1.version());
+                Err(EINVAL)
+            }
+        }
+    } else {
+        Ok(0)
+    }
+}
+
 impl<'a> VbiosIterator<'a> {
     fn new(dev: &'a device::Device, bar0: &'a Bar0) -> Result<Self> {
         Ok(Self {
             dev,
             bar0,
             data: KVec::new(),
-            current_offset: 0,
+            current_offset: vbios_rom_offset(dev, bar0)?,
             last_found: false,
         })
     }
-- 
2.53.0

