Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010034.outbound.protection.outlook.com [52.101.85.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B294C3BE4AC
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 22:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769120988; cv=fail; b=RL1zOhUVhblC8NWyCQMyG0beMcPluzgFxsJSYp2qbP2JJF1JTKWRmjoBKxkCdUtG3RLHjU1iZKE9ekf9BOodgnrqTm0B6JhqwIkm8fe14Xcc2pHFKLlEPh3SipUeCnX8jjS+TM5xWJYWmiAsXHl6UP7uXNk0fMseIpXIB9ICTcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769120988; c=relaxed/simple;
	bh=zdmkZrvdh0prvn+oCLrMBr4jC/j+yVfyVfWqjfftNCs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u1KgXTuDgvZrSc0lwN4+y5ug3gDR7UGEKH64fGQ0kXgTvtEHOZBl4iftei+V1x4hrR08ZAOnQc18cQBfKt1KfqY5O/+TXRX8LoMu/bH3KdK51ScKOnOSEtQCEE+CD5d7DIw2HQuTrGiSDQdwysewdyGmmxha0WD1cBPpJu8dOVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S2jK6mFT; arc=fail smtp.client-ip=52.101.85.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S2jK6mFT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gY3jNVs3PDkOwLatq1k0vi8OOdUzw563mTWWTvlXjfhh4HmjpozOa1rFuy0Ks2NyuslKIan8JMrND/6aPtUNelFISa2EoObaksrORf7GoNwsihyKMxzZWImIVXTFv1WFEqqbBTR4uVM87Mg/gkMSzX74t76arxrVn6TO39DW3p+btPwQ5AUdoPIF9pyP3KJOpnBEfxJyC9I2WJe8FavZBlRZqCKECq2CqGKAaGq3g6r83kDa1JeiCt/1VGgWpIGti1hSmqHm3/BDl7S8Oea4PjUZtPx7e3r0apbqD0sD3bAAIJR0TZOLr3W5nK77rasZVEYTfnt58clCv6N2Dtw1Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bce/7Lbn63FETDkpSB8mFcrVxXG0ZNqaCCKPy4Cabg=;
 b=pXEuzYiZ6aqaF0IAVQvki+KJ7i1pp7fkmOeJXQXWsISErjpWirJoS7oUo+4uGPTyB2riQ+aOPTBVR5ovCxsBRzdsM30okDyrgIcGt4tYG9YFCarLf+azzLkA+CZbRpd+6FjmfdHWQYEzUpAcdJEaC4IkNZWfhqCpGX1sc5k5qTj/YnBCObxGBTNAKL6D/bhlCNUShY6XgMI57BzNe1vSU4NxWmUh4KqvC8eK0PQgbi67+M3KT6DrfCPjnw452W+tXVnDllLHVwRfFaGCMyDlCe50LReNNUSR8GQ+EXyG6yycDbOxErqLNp56lCR5pSAnvQWGIe5JGab9gImRU3POIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bce/7Lbn63FETDkpSB8mFcrVxXG0ZNqaCCKPy4Cabg=;
 b=S2jK6mFTiE0WjS+ac7aU9bMwcoVumUshuRQfnlSsEnY8Q8IDzMEUdMs0hoG0Q+JFYr52UkeNyr2pGBpKgt7ipi8PVzKc9R8Jld7r73b6gVgAksLhiIGv59gHuxHDU505oiqf1p7xtqYLhpkd5EueZMbSl5vZ+gK0j4lEelpDXIeSirxe4ISUHyeeCRnBQxJ7R7lcKAQpCiXoDsOnpRKgC4pFeHtN4Skz4J7etZQ6cXG6Gpj1HyYW556nzJxYyAaQsFrNdmjIF6KuLOzwzG106+NMyriEiNqcRx+smui60pewgzq22ussEXTLEToMAlQgis4PRUAf5fXKmNtItNmZRg==
Received: from DM6PR08CA0060.namprd08.prod.outlook.com (2603:10b6:5:1e0::34)
 by SA1PR12MB8860.namprd12.prod.outlook.com (2603:10b6:806:38b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 22:29:34 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:1e0:cafe::f6) by DM6PR08CA0060.outlook.office365.com
 (2603:10b6:5:1e0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 22:29:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 22:29:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:10 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:07 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v8 10/13] gpu: nova-core: add FalconUCodeDescV2 support
Date: Thu, 22 Jan 2026 16:28:45 -0600
Message-ID: <20260122222848.2555890-11-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|SA1PR12MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: 775d6e3b-4329-4e1e-341b-08de5a05b80f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jx8qwjRdpd2X5qZOw4VwFxF+t3//jsCica8QU66qaFsptb9pyIr5s2c/z1//?=
 =?us-ascii?Q?s7/GBPujB8wvNKiyfdx5dNuHTOPCwsRITMrv7vkbjXOTZeFXcuCSHngq8w9+?=
 =?us-ascii?Q?KO0vLP1Z3VAMwi5UOdCWqP1QguBy1S8kPfSfkZDCyYhUGBwGsGhG+AEIMlkm?=
 =?us-ascii?Q?2mCbfgkKs3MwrgB1p1XKZGJROTsucN4KpVVz43hmhvRGmLQJaSpsOrPOukob?=
 =?us-ascii?Q?AUr7iUhscajHqZyW8NRAYYzTwELc35DOccLBenOhq70y35Sqi/dVE2KE0GZe?=
 =?us-ascii?Q?qWCLhH9/emp5oiMcHy4/+4tniNlk+E8V9ZuxlcfzzQQtKqH/3wk4VOh3pZkI?=
 =?us-ascii?Q?+zBoRz4Gk8qNqnOdGwbDHL8Gjo/lNnQiPKetPA5PzLgH1M5jUU1UCF6ny4ks?=
 =?us-ascii?Q?AlKIgj78oI+C65BAtc542KHBf71z1YJ3jWru/mldmbwluR3ZQ3s6pmoTDiOT?=
 =?us-ascii?Q?EvnsX7JITdo6bl76KG/pHjyOE9spATC8Qo3AeEuE1Rpq2inMZd8boK+UWzW8?=
 =?us-ascii?Q?OKGtIaEH4AhuzuMadEPQzpVILCHv5/E1vPm4MqIKpMZ2BMZ9B+14f6B7CzCF?=
 =?us-ascii?Q?2rQ6th3L6zvCJ05EYS3kx/WGcrm+t2A2xQEptnSeI39q19QSoVLpc1pQkkpi?=
 =?us-ascii?Q?T+05M2Zie/gd1F8gYRwocc4ZgJl+aIZfu8WfKJKVPmR4l/3XNChlYk1f3270?=
 =?us-ascii?Q?G8SxcJm1L4lPspZvKNuWBk0wllJRl237FnTKbwYT2HVscc9iHI0Si4CDXquF?=
 =?us-ascii?Q?XMHWW7fBHqOpGO7tONH/Dq6TTriXblSlbaLP2K1361BWFUNAMw980beybH8M?=
 =?us-ascii?Q?JBMNsfqwfR+A07dXvIG+/VHxd1EEPTyh+d6/1cvSGuzlfXCwqTc/TqVe3AyL?=
 =?us-ascii?Q?Bj3VpZwXITl2UNrQX6MW2IIvZTW92iKiPxYr/e1yGc0YXD9107AZkWj9XFmR?=
 =?us-ascii?Q?aTLoO507aJeoBOTNwFvHwlOoJMeVFN+IenA/4DcNsSOyx4lz8AouUuEnRBpS?=
 =?us-ascii?Q?ewWTbD9ZMfEdPpAJoVwWnhSfdNCpXDhCe5xgpJKlHM53W8tYi44MCFQwsa61?=
 =?us-ascii?Q?fU1iP6Yk4WUviW5V/WLPeBFsjTIZfniUP93hPnJavQDBLWCvIk59YZoQaPVy?=
 =?us-ascii?Q?MJBnrqnXrsOMJbm/DQAn3ZaXZwEUTCySxAfDl5fEKlmKj96OhNnPwJqek8R2?=
 =?us-ascii?Q?+apSti3CdBVRNnRbM/f8rl19IDsNz5kZ9NaLQGLS3OQ/gPK2z+WwIr70f53Y?=
 =?us-ascii?Q?177WjjJ52QKVRQxXYz1S7wXyIRwRwcIACuuqMr2x3zTBUmwIaC7BYM84Umzg?=
 =?us-ascii?Q?tjy+ZhgSpagaEbUjNTksnBmRCu9+vLHO0kyDxBoZCK7sEQ6fPhtNLpnO12Fb?=
 =?us-ascii?Q?V8LWnnff2K3KeutjfwAxEadLVx+JsOcNFjWCMTBSWaU3DUF5lKNqAyMSbH7S?=
 =?us-ascii?Q?MCcHffZ05Uwr0B3Ecy1qmeK87vNG9mw+QI/+WZjAmj9G5ymEk+kT2MJ9coJK?=
 =?us-ascii?Q?yfDKqqV29wcXDTWsJeo9N7jM1p/gDh6noDlL6Ob+aNTRPhyNSuOF3x1E4t0h?=
 =?us-ascii?Q?EN8z8sctCOm2fspgZ67RLTcP+QsWHEGkes5p7/sdolUNFFINM00h3AAAOVPw?=
 =?us-ascii?Q?kQC1wUB9GWS4fGnIULhRUAVipvnzco0iu0a1KV47choFoOvFDn8N1F2qxN1U?=
 =?us-ascii?Q?/m7e4w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 22:29:34.1014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 775d6e3b-4329-4e1e-341b-08de5a05b80f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8860

The FRTS firmware in Turing and GA100 VBIOS has an older header
format (v2 instead of v3).  To support both v2 and v3 at runtime,
add the FalconUCodeDescV2 struct, and update code that references
the FalconUCodeDescV3 directly with a FalconUCodeDesc enum that
encapsulates both.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs       | 203 +++++++++++++++++++++++-
 drivers/gpu/nova-core/firmware/fwsec.rs |  46 +++---
 drivers/gpu/nova-core/vbios.rs          |  64 ++++----
 3 files changed, 249 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 2d2008b33fb4..68779540aa28 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -4,6 +4,7 @@
 //! to be loaded into a given execution unit.
 
 use core::marker::PhantomData;
+use core::ops::Deref;
 
 use kernel::{
     device,
@@ -15,7 +16,10 @@
 
 use crate::{
     dma::DmaObject,
-    falcon::FalconFirmware,
+    falcon::{
+        FalconFirmware,
+        FalconLoadTarget, //
+    },
     gpu,
     num::{
         FromSafeCast,
@@ -43,6 +47,46 @@ fn request_firmware(
         .and_then(|path| firmware::Firmware::request(&path, dev))
 }
 
+/// Structure used to describe some firmwares, notably FWSEC-FRTS.
+#[repr(C)]
+#[derive(Debug, Clone)]
+pub(crate) struct FalconUCodeDescV2 {
+    /// Header defined by 'NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*' in OpenRM.
+    hdr: u32,
+    /// Stored size of the ucode after the header, compressed or uncompressed
+    stored_size: u32,
+    /// Uncompressed size of the ucode.  If store_size == uncompressed_size, then the ucode
+    /// is not compressed.
+    pub(crate) uncompressed_size: u32,
+    /// Code entry point
+    pub(crate) virtual_entry: u32,
+    /// Offset after the code segment at which the Application Interface Table headers are located.
+    pub(crate) interface_offset: u32,
+    /// Base address at which to load the code segment into 'IMEM'.
+    pub(crate) imem_phys_base: u32,
+    /// Size in bytes of the code to copy into 'IMEM'.
+    pub(crate) imem_load_size: u32,
+    /// Virtual 'IMEM' address (i.e. 'tag') at which the code should start.
+    pub(crate) imem_virt_base: u32,
+    /// Virtual address of secure IMEM segment.
+    pub(crate) imem_sec_base: u32,
+    /// Size of secure IMEM segment.
+    pub(crate) imem_sec_size: u32,
+    /// Offset into stored (uncompressed) image at which DMEM begins.
+    pub(crate) dmem_offset: u32,
+    /// Base address at which to load the data segment into 'DMEM'.
+    pub(crate) dmem_phys_base: u32,
+    /// Size in bytes of the data to copy into 'DMEM'.
+    pub(crate) dmem_load_size: u32,
+    /// "Alternate" Size of data to load into IMEM.
+    pub(crate) alt_imem_load_size: u32,
+    /// "Alternate" Size of data to load into DMEM.
+    pub(crate) alt_dmem_load_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for FalconUCodeDescV2 {}
+
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone)]
@@ -76,13 +120,164 @@ pub(crate) struct FalconUCodeDescV3 {
     _reserved: u16,
 }
 
-impl FalconUCodeDescV3 {
+// SAFETY: all bit patterns are valid for this type, and it doesn't use
+// interior mutability.
+unsafe impl FromBytes for FalconUCodeDescV3 {}
+
+/// Enum wrapping the different versions of Falcon microcode descriptors.
+///
+/// This allows handling both V2 and V3 descriptor formats through a
+/// unified type, providing version-agnostic access to firmware metadata
+/// via the [`FalconUCodeDescriptor`] trait.
+#[derive(Debug, Clone)]
+pub(crate) enum FalconUCodeDesc {
+    V2(FalconUCodeDescV2),
+    V3(FalconUCodeDescV3),
+}
+
+impl Deref for FalconUCodeDesc {
+    type Target = dyn FalconUCodeDescriptor;
+
+    fn deref(&self) -> &Self::Target {
+        match self {
+            FalconUCodeDesc::V2(v2) => v2,
+            FalconUCodeDesc::V3(v3) => v3,
+        }
+    }
+}
+
+/// Trait providing a common interface for accessing Falcon microcode descriptor fields.
+///
+/// This trait abstracts over the different descriptor versions ([`FalconUCodeDescV2`] and
+/// [`FalconUCodeDescV3`]), allowing code to work with firmware metadata without needing to
+/// know the specific descriptor version. Fields not present return zero.
+pub(crate) trait FalconUCodeDescriptor {
+    fn hdr(&self) -> u32;
+    fn imem_load_size(&self) -> u32;
+    fn interface_offset(&self) -> u32;
+    fn dmem_load_size(&self) -> u32;
+    fn pkc_data_offset(&self) -> u32;
+    fn engine_id_mask(&self) -> u16;
+    fn ucode_id(&self) -> u8;
+    fn signature_count(&self) -> u8;
+    fn signature_versions(&self) -> u16;
+
     /// Returns the size in bytes of the header.
-    pub(crate) fn size(&self) -> usize {
+    fn size(&self) -> usize {
+        let hdr = self.hdr();
+
         const HDR_SIZE_SHIFT: u32 = 16;
         const HDR_SIZE_MASK: u32 = 0xffff0000;
+        ((hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
+    }
 
-        ((self.hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
+    fn imem_sec_load_params(&self) -> FalconLoadTarget;
+    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget>;
+    fn dmem_load_params(&self) -> FalconLoadTarget;
+}
+
+impl FalconUCodeDescriptor for FalconUCodeDescV2 {
+    fn hdr(&self) -> u32 {
+        self.hdr
+    }
+    fn imem_load_size(&self) -> u32 {
+        self.imem_load_size
+    }
+    fn interface_offset(&self) -> u32 {
+        self.interface_offset
+    }
+    fn dmem_load_size(&self) -> u32 {
+        self.dmem_load_size
+    }
+    fn pkc_data_offset(&self) -> u32 {
+        0
+    }
+    fn engine_id_mask(&self) -> u16 {
+        0
+    }
+    fn ucode_id(&self) -> u8 {
+        0
+    }
+    fn signature_count(&self) -> u8 {
+        0
+    }
+    fn signature_versions(&self) -> u16 {
+        0
+    }
+
+    fn imem_sec_load_params(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: 0,
+            dst_start: self.imem_sec_base,
+            len: self.imem_sec_size,
+        }
+    }
+
+    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+        Some(FalconLoadTarget {
+            src_start: 0,
+            dst_start: self.imem_phys_base,
+            len: self.imem_load_size.checked_sub(self.imem_sec_size)?,
+        })
+    }
+
+    fn dmem_load_params(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: self.dmem_offset,
+            dst_start: self.dmem_phys_base,
+            len: self.dmem_load_size,
+        }
+    }
+}
+
+impl FalconUCodeDescriptor for FalconUCodeDescV3 {
+    fn hdr(&self) -> u32 {
+        self.hdr
+    }
+    fn imem_load_size(&self) -> u32 {
+        self.imem_load_size
+    }
+    fn interface_offset(&self) -> u32 {
+        self.interface_offset
+    }
+    fn dmem_load_size(&self) -> u32 {
+        self.dmem_load_size
+    }
+    fn pkc_data_offset(&self) -> u32 {
+        self.pkc_data_offset
+    }
+    fn engine_id_mask(&self) -> u16 {
+        self.engine_id_mask
+    }
+    fn ucode_id(&self) -> u8 {
+        self.ucode_id
+    }
+    fn signature_count(&self) -> u8 {
+        self.signature_count
+    }
+    fn signature_versions(&self) -> u16 {
+        self.signature_versions
+    }
+
+    fn imem_sec_load_params(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: 0,
+            dst_start: self.imem_phys_base,
+            len: self.imem_load_size,
+        }
+    }
+
+    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
+        // Not used on V3 platforms
+        None
+    }
+
+    fn dmem_load_params(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: self.imem_load_size,
+            dst_start: self.dmem_phys_base,
+            len: self.dmem_load_size,
+        }
     }
 }
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index e4009faba6c5..89dc4526041b 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -40,7 +40,7 @@
         FalconLoadTarget, //
     },
     firmware::{
-        FalconUCodeDescV3,
+        FalconUCodeDesc,
         FirmwareDmaObject,
         FirmwareSignature,
         Signed,
@@ -218,38 +218,29 @@ unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
 /// It is responsible for e.g. carving out the WPR2 region as the first step of the GSP bootflow.
 pub(crate) struct FwsecFirmware {
     /// Descriptor of the firmware.
-    desc: FalconUCodeDescV3,
+    desc: FalconUCodeDesc,
     /// GPU-accessible DMA object containing the firmware.
     ucode: FirmwareDmaObject<Self, Signed>,
 }
 
 impl FalconLoadParams for FwsecFirmware {
     fn imem_sec_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
-            src_start: 0,
-            dst_start: self.desc.imem_phys_base,
-            len: self.desc.imem_load_size,
-        }
+        self.desc.imem_sec_load_params()
     }
 
     fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
-        // Only used on Turing and GA100, so return None for now
-        None
+        self.desc.imem_ns_load_params()
     }
 
     fn dmem_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
-            src_start: self.desc.imem_load_size,
-            dst_start: self.desc.dmem_phys_base,
-            len: self.desc.dmem_load_size,
-        }
+        self.desc.dmem_load_params()
     }
 
     fn brom_params(&self) -> FalconBromParams {
         FalconBromParams {
-            pkc_data_offset: self.desc.pkc_data_offset,
-            engine_id_mask: self.desc.engine_id_mask,
-            ucode_id: self.desc.ucode_id,
+            pkc_data_offset: self.desc.pkc_data_offset(),
+            engine_id_mask: self.desc.engine_id_mask(),
+            ucode_id: self.desc.ucode_id(),
         }
     }
 
@@ -273,10 +264,10 @@ impl FalconFirmware for FwsecFirmware {
 impl FirmwareDmaObject<FwsecFirmware, Unsigned> {
     fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
         let desc = bios.fwsec_image().header()?;
-        let ucode = bios.fwsec_image().ucode(desc)?;
+        let ucode = bios.fwsec_image().ucode(&desc)?;
         let mut dma_object = DmaObject::from_data(dev, ucode)?;
 
-        let hdr_offset = usize::from_safe_cast(desc.imem_load_size + desc.interface_offset);
+        let hdr_offset = usize::from_safe_cast(desc.imem_load_size() + desc.interface_offset());
         // SAFETY: we have exclusive access to `dma_object`.
         let hdr: &FalconAppifHdrV1 = unsafe { transmute(&dma_object, hdr_offset) }?;
 
@@ -303,7 +294,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             let dmem_mapper: &mut FalconAppifDmemmapperV3 = unsafe {
                 transmute_mut(
                     &mut dma_object,
-                    (desc.imem_load_size + dmem_base).into_safe_cast(),
+                    (desc.imem_load_size() + dmem_base).into_safe_cast(),
                 )
             }?;
 
@@ -317,7 +308,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             let frts_cmd: &mut FrtsCmd = unsafe {
                 transmute_mut(
                     &mut dma_object,
-                    (desc.imem_load_size + cmd_in_buffer_offset).into_safe_cast(),
+                    (desc.imem_load_size() + cmd_in_buffer_offset).into_safe_cast(),
                 )
             }?;
 
@@ -364,11 +355,12 @@ pub(crate) fn new(
 
         // Patch signature if needed.
         let desc = bios.fwsec_image().header()?;
-        let ucode_signed = if desc.signature_count != 0 {
-            let sig_base_img = usize::from_safe_cast(desc.imem_load_size + desc.pkc_data_offset);
-            let desc_sig_versions = u32::from(desc.signature_versions);
+        let ucode_signed = if desc.signature_count() != 0 {
+            let sig_base_img =
+                usize::from_safe_cast(desc.imem_load_size() + desc.pkc_data_offset());
+            let desc_sig_versions = u32::from(desc.signature_versions());
             let reg_fuse_version =
-                falcon.signature_reg_fuse_version(bar, desc.engine_id_mask, desc.ucode_id)?;
+                falcon.signature_reg_fuse_version(bar, desc.engine_id_mask(), desc.ucode_id())?;
             dev_dbg!(
                 dev,
                 "desc_sig_versions: {:#x}, reg_fuse_version: {}\n",
@@ -402,7 +394,7 @@ pub(crate) fn new(
             dev_dbg!(dev, "patching signature with index {}\n", signature_idx);
             let signature = bios
                 .fwsec_image()
-                .sigs(desc)
+                .sigs(&desc)
                 .and_then(|sigs| sigs.get(signature_idx).ok_or(EINVAL))?;
 
             ucode_dma.patch_signature(signature, sig_base_img)?
@@ -411,7 +403,7 @@ pub(crate) fn new(
         };
 
         Ok(FwsecFirmware {
-            desc: desc.clone(),
+            desc,
             ucode: ucode_signed,
         })
     }
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index e59eee2050a8..72cba8659a2d 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -19,6 +19,8 @@
     driver::Bar0,
     firmware::{
         fwsec::Bcrt30Rsa3kSignature,
+        FalconUCodeDesc,
+        FalconUCodeDescV2,
         FalconUCodeDescV3, //
     },
     num::FromSafeCast,
@@ -998,20 +1000,11 @@ fn build(self) -> Result<FwSecBiosImage> {
 }
 
 impl FwSecBiosImage {
-    /// Get the FwSec header ([`FalconUCodeDescV3`]).
-    pub(crate) fn header(&self) -> Result<&FalconUCodeDescV3> {
+    /// Get the FwSec header ([`FalconUCodeDesc`]).
+    pub(crate) fn header(&self) -> Result<FalconUCodeDesc> {
         // Get the falcon ucode offset that was found in setup_falcon_data.
         let falcon_ucode_offset = self.falcon_ucode_offset;
 
-        // Make sure the offset is within the data bounds.
-        if falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>() > self.base.data.len() {
-            dev_err!(
-                self.base.dev,
-                "fwsec-frts header not contained within BIOS bounds\n"
-            );
-            return Err(ERANGE);
-        }
-
         // Read the first 4 bytes to get the version.
         let hdr_bytes: [u8; 4] = self.base.data[falcon_ucode_offset..falcon_ucode_offset + 4]
             .try_into()
@@ -1019,33 +1012,34 @@ pub(crate) fn header(&self) -> Result<&FalconUCodeDescV3> {
         let hdr = u32::from_le_bytes(hdr_bytes);
         let ver = (hdr & 0xff00) >> 8;
 
-        if ver != 3 {
-            dev_err!(self.base.dev, "invalid fwsec firmware version: {:?}\n", ver);
-            return Err(EINVAL);
+        let data = self.base.data.get(falcon_ucode_offset..).ok_or(EINVAL)?;
+        match ver {
+            2 => {
+                let v2 = FalconUCodeDescV2::from_bytes_copy_prefix(data)
+                    .ok_or(EINVAL)?
+                    .0;
+                Ok(FalconUCodeDesc::V2(v2))
+            }
+            3 => {
+                let v3 = FalconUCodeDescV3::from_bytes_copy_prefix(data)
+                    .ok_or(EINVAL)?
+                    .0;
+                Ok(FalconUCodeDesc::V3(v3))
+            }
+            _ => {
+                dev_err!(self.base.dev, "invalid fwsec firmware version: {:?}\n", ver);
+                Err(EINVAL)
+            }
         }
-
-        // Return a reference to the FalconUCodeDescV3 structure.
-        //
-        // SAFETY: We have checked that `falcon_ucode_offset + size_of::<FalconUCodeDescV3>` is
-        // within the bounds of `data`. Also, this data vector is from ROM, and the `data` field
-        // in `BiosImageBase` is immutable after construction.
-        Ok(unsafe {
-            &*(self
-                .base
-                .data
-                .as_ptr()
-                .add(falcon_ucode_offset)
-                .cast::<FalconUCodeDescV3>())
-        })
     }
 
     /// Get the ucode data as a byte slice
-    pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
+    pub(crate) fn ucode(&self, desc: &FalconUCodeDesc) -> Result<&[u8]> {
         let falcon_ucode_offset = self.falcon_ucode_offset;
 
         // The ucode data follows the descriptor.
         let ucode_data_offset = falcon_ucode_offset + desc.size();
-        let size = usize::from_safe_cast(desc.imem_load_size + desc.dmem_load_size);
+        let size = usize::from_safe_cast(desc.imem_load_size() + desc.dmem_load_size());
 
         // Get the data slice, checking bounds in a single operation.
         self.base
@@ -1061,10 +1055,14 @@ pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
     }
 
     /// Get the signatures as a byte slice
-    pub(crate) fn sigs(&self, desc: &FalconUCodeDescV3) -> Result<&[Bcrt30Rsa3kSignature]> {
+    pub(crate) fn sigs(&self, desc: &FalconUCodeDesc) -> Result<&[Bcrt30Rsa3kSignature]> {
+        let hdr_size = match desc {
+            FalconUCodeDesc::V2(_v2) => core::mem::size_of::<FalconUCodeDescV2>(),
+            FalconUCodeDesc::V3(_v3) => core::mem::size_of::<FalconUCodeDescV3>(),
+        };
         // The signatures data follows the descriptor.
-        let sigs_data_offset = self.falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
-        let sigs_count = usize::from(desc.signature_count);
+        let sigs_data_offset = self.falcon_ucode_offset + hdr_size;
+        let sigs_count = usize::from(desc.signature_count());
         let sigs_size = sigs_count * core::mem::size_of::<Bcrt30Rsa3kSignature>();
 
         // Make sure the data is within bounds.
-- 
2.52.0

