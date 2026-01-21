Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011058.outbound.protection.outlook.com [40.93.194.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE6B22A7F9
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 23:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769039645; cv=fail; b=WqKJ1T7fNZXo9bcMNJ50nHc5DVrVEit815WYEi1gaffXvcKBnXZOnRJwxPcarjnWMP7+EMBYzFA3OJXbKnyphxmPUVFz0eqILp3MM1BMRSJyylFYmOox9NA4vObpejBDsPsAn+XHsComCxPzBWbuqNEGFtxWXWu/IlaC3aIAmsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769039645; c=relaxed/simple;
	bh=/squCWXu7kZErTssIPXH1WdGesrgX7s6WanQHEEsTOo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T6+DuLPz87U2jxZOlf9tkUk+X4mGtFAAIzjIbbk7CiRFDcH7TuyXwULg69hf9/rU9ihCXP2bV6hVIcAprvF09F2a6kojQoiWFQ3WZYzhd8m+VoPFF/5A129Clu7JrzzFRJ5w6m97a3GMRiSEadfhYrGX3kn5Yu+0OwzEl9YJED0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o/fjadnl; arc=fail smtp.client-ip=40.93.194.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o/fjadnl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycbxMetqGvchq4oin34LBzkeJu/2PuhHbJRomgYhjElmKOqZvNeW3s/yNLIcXl7gKHjjCL3FCjaoxYm/9wkEiP/Hf40zeEdMnh92D5DjdbHLGVo5Wb9d0KyJrH72ATgTFcM95372Tv8rnDi1G9XjNHL0kuZrhDzcTL1epPSDujt2/ko9yz/N0+sy+oFji+oxg28mMw6BF+K6kl3nVqYh8OrnEAeLrRXt6sAteSJrc0UZGxJgB/gF5EDNFMSwr2sbQWLg7uD26Gh6eZG+9TLaIzE/MWlnMqibIOb1oaT2kaWX4wC5nGvCQnQNJMF+qr8jyZ0YG0MXTT+sT9leLDRAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0mOWqZrIhm+VxE31bly3ANEiX6fQJf9m1uTW1dYEV8=;
 b=Are2g21jDwP+EmmIThZ4tnatokgfK5l6Im4UYnkN8W20X5MMOE4eOcg/4ZlhbOGC70ICwmfU0ojuZwJhCXVRkKMe+pAFqtxqIXT50Nwm0HUff01rPRJXwiVN3y/ybg5JydbKPfX+3pttT6Zrzj3WEa5QGKJacAVLttieVagz3yANxWQSKtziZnByPNFUDdxp0uOZhGmbij4b8aIMI414EjYOQDjamBunp2l0yWSyJWmh5FaH7w6mp/PaQtnHrreWrDPfje5x1aslOygpFco7QMvsKaqMBC/LxU+EyixrJaIaYb7Kvs5NCuPoTnnIqp8ZlUABK27kCZTn2kEFLDKQ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0mOWqZrIhm+VxE31bly3ANEiX6fQJf9m1uTW1dYEV8=;
 b=o/fjadnl4kUFgTpadXPUQIJ31OpxAtgOTp3wPxb/a6ak10I4gHgsHan8wdJqzikBuDTFoN7uIcXmjF+WoVYUWz15+fYfippKGV/DMKcOVQlL9UTNnakveqbs+RRJOSdDF048LNqriC/oQpcRooE2Xd3POeu3QNgj/6mRTW6+u4CGaQFZvWqJTBonDEW9NvptKb57BpBxcFR+B+oZDN+4kRNe5iN8ouhH7cKzmt1KeDo1hY78IUj648FxhNLq2t8BdqRGRGHhL1f9SHr4SpLiDJYNKGcBaQzLzUR/oA+xhkpRGomJ2Ilwhlbp0zmRhihPYHWKVhaAWPjGEaSJRpFUNA==
Received: from DM5PR08CA0039.namprd08.prod.outlook.com (2603:10b6:4:60::28) by
 CH3PR12MB8545.namprd12.prod.outlook.com (2603:10b6:610:163::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Wed, 21 Jan 2026 23:53:47 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:4:60:cafe::cb) by DM5PR08CA0039.outlook.office365.com
 (2603:10b6:4:60::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 23:53:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 23:53:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:22 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:21 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v7 10/12] gpu: nova-core: add FalconUCodeDescV2 support
Date: Wed, 21 Jan 2026 17:53:00 -0600
Message-ID: <20260121235302.1962185-11-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121235302.1962185-1-ttabi@nvidia.com>
References: <20260121235302.1962185-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|CH3PR12MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: 55681cac-21e7-484b-0d34-08de59484f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cIbT4ZFALvVcwUvrDVjKzaoRYuNT/p2jsM6zPRvQsa7lSEizSSvGvWWf68yz?=
 =?us-ascii?Q?V6d5WyQMmvhaJu4KyQX7ZXOF4SsvLzDFr6NZumFxNaU48D6wR3o2Zylz4rq/?=
 =?us-ascii?Q?MYCZmXzvYtp6/XzQCxb8kYytimMYA+yJd8dpHgfiOjgnqnNW3AlTA7ODLPNS?=
 =?us-ascii?Q?zr2oA9OuGgWdFtZjpxhlJlCeCe3QA5xHk/P0KCWny9+hHt+c7z9SN3w3oOH/?=
 =?us-ascii?Q?NH/wJgC92cVq/xyz6ywegBXM+GW8qcqOZLsYJSANf9tHd+KuhYcbYCp8/7dO?=
 =?us-ascii?Q?iQyYdv5d4/wfe/hBqUuPqUe5UbCZIFyzB0M7p9Ojd7LAybuRffSJIYleIvYY?=
 =?us-ascii?Q?VCD5hNvaXeQX8/eeFak0xkSIBBkCLPg5Y9vup5zedKc/fwHb1JlBJU32m02X?=
 =?us-ascii?Q?6xFa/NL1f5Ip2y1Zo2nUkoHzsJ63F7QWvWWtBv95ywL4fRMBbLTVLCR3YZWl?=
 =?us-ascii?Q?GH98FVYKtDovJGww8PzCDGBv1WRSXzTT7QZbPIAO57que7VUxgJsBakP5mej?=
 =?us-ascii?Q?fp4NwA1zxXZyJR3B/86F5QzLv84kE+/QavFJzRIQaZ15/f8iu3da22KOU7HY?=
 =?us-ascii?Q?D2Y7MYyg0Ok/dddBQB6KL4WjE7wqvtP2obazan+51UjzQR0jJisPd0s9qCYP?=
 =?us-ascii?Q?4iU715EiH4yZMVArdv7dYdy9HnF2laq+1F59chQ636fEyQyI4A8xbz978v/Z?=
 =?us-ascii?Q?BdJunj6Ht7mFPgGGaBYx2sBWMHMBTR/EbXlT4ebFJH2o6lVNZITH+d05+tqv?=
 =?us-ascii?Q?85xOUXi9yunRmyHEYoXayBTRfcWtOoJ410SIoLx7btQswj7OY1Owf3dtp4Oy?=
 =?us-ascii?Q?QDv7lKE6atfqJhc6rOPf/kc4aa/p4WbIrC53JIISrU1I/yWF1W+6d6D4EI/1?=
 =?us-ascii?Q?Wy5ntHThJOkRVk4FO2lb1AJzYJKIQCRYKdQe3RWE4EHeNEyGWyKAziSEVrVM?=
 =?us-ascii?Q?mRVv7HuP5p5GUVPa0f+ucKL81UWqHZ7GocE177hzwm8ZCK/EzJODQEDkShoX?=
 =?us-ascii?Q?pCxSMtBq4fIP2LviQBJjQBjqbI62oTWE+f5dZLYyfey0iAVuvUaMrOHTPZcP?=
 =?us-ascii?Q?obunJY87D2wu++WXFnr3uqrZ9ve/vgWqHTRPfktSUqAcbdQv03kqEW42K4rS?=
 =?us-ascii?Q?TNLZiWFOcAi0oEjvAh8UZqAWzrAK23tS56XEyLn9VNPFXFarXqzrOmdTpopz?=
 =?us-ascii?Q?LYFzlwE2RhmsZJnDgUOJJ8SBotyAJuOY4ctzPH3K6+eeC56UHi4UtYCEWtDa?=
 =?us-ascii?Q?ZWzGvzc1rSV0UpOCXmcxrUF/jXuaCkrbxxlJdYMHFee0h5YxoGkSEgko/IIa?=
 =?us-ascii?Q?Gukg04FZ09fo2nk3bZW9x2uSR8bgQDUGbrEee5GPyTbgwiiNQEhnn2fvZoWQ?=
 =?us-ascii?Q?5MUpNqzoGHCoSVj/7naiK2jRXsrj3nwXGCQaJ6U78ZsRvGNV0uEoBj+fAZ17?=
 =?us-ascii?Q?keYflYNSo7RPWQohV94Ut5bI13AJMSWaOyQNVdwHCcGu2p9lkHjqaxg2h8JB?=
 =?us-ascii?Q?AB5loohmf5j7ehx5abpFmZVlm8wiJB3F9i+Ew9zyZcDS/mc2xbTKNBoV8q8A?=
 =?us-ascii?Q?14uYEuw5qV+gjiSJigoC0EAgPz7CsYwsdRnosXoFECV8q04uplrAXmJHCEgT?=
 =?us-ascii?Q?IrjqRDOHfu5DKtFIWLixRP1FEb4UXwfe81muDePbIP3R8UxslXJM4+wxFwLW?=
 =?us-ascii?Q?ei0bGw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7142099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 23:53:43.9825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55681cac-21e7-484b-0d34-08de59484f9b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8545

The FRTS firmware in Turing and GA100 VBIOS has an older header
format (v2 instead of v3).  To support both v2 and v3 at runtime,
add the FalconUCodeDescV2 struct, and update code that references
the FalconUCodeDescV3 directly with a FalconUCodeDesc enum that
encapsulates both.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs       |  203 ++++-
 drivers/gpu/nova-core/firmware/fwsec.rs |   46 +-
 drivers/gpu/nova-core/vbios.rs          |   64 +-
 drivers/gpu/nova-core/vbios.rs.orig     | 1105 +++++++++++++++++++++++
 4 files changed, 1354 insertions(+), 64 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vbios.rs.orig

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
diff --git a/drivers/gpu/nova-core/vbios.rs.orig b/drivers/gpu/nova-core/vbios.rs.orig
new file mode 100644
index 000000000000..ac62211cda5b
--- /dev/null
+++ b/drivers/gpu/nova-core/vbios.rs.orig
@@ -0,0 +1,1105 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! VBIOS extraction and parsing.
+
+use core::convert::TryFrom;
+
+use kernel::{
+    device,
+    prelude::*,
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+    sync::aref::ARef,
+    transmute::FromBytes,
+};
+
+use crate::{
+    driver::Bar0,
+    firmware::{
+        fwsec::Bcrt30Rsa3kSignature,
+        FalconUCodeDesc,
+        FalconUCodeDescV2,
+        FalconUCodeDescV3, //
+    },
+    num::FromSafeCast,
+};
+
+/// The offset of the VBIOS ROM in the BAR0 space.
+const ROM_OFFSET: usize = 0x300000;
+/// The maximum length of the VBIOS ROM to scan into.
+const BIOS_MAX_SCAN_LEN: usize = 0x100000;
+/// The size to read ahead when parsing initial BIOS image headers.
+const BIOS_READ_AHEAD_SIZE: usize = 1024;
+/// The bit in the last image indicator byte for the PCI Data Structure that
+/// indicates the last image. Bit 0-6 are reserved, bit 7 is last image bit.
+const LAST_IMAGE_BIT_MASK: u8 = 0x80;
+
+/// BIOS Image Type from PCI Data Structure code_type field.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+#[repr(u8)]
+enum BiosImageType {
+    /// PC-AT compatible BIOS image (x86 legacy)
+    PciAt = 0x00,
+    /// EFI (Extensible Firmware Interface) BIOS image
+    Efi = 0x03,
+    /// NBSI (Notebook System Information) BIOS image
+    Nbsi = 0x70,
+    /// FwSec (Firmware Security) BIOS image
+    FwSec = 0xE0,
+}
+
+impl TryFrom<u8> for BiosImageType {
+    type Error = Error;
+
+    fn try_from(code: u8) -> Result<Self> {
+        match code {
+            0x00 => Ok(Self::PciAt),
+            0x03 => Ok(Self::Efi),
+            0x70 => Ok(Self::Nbsi),
+            0xE0 => Ok(Self::FwSec),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+// PMU lookup table entry types. Used to locate PMU table entries
+// in the Fwsec image, corresponding to falcon ucodes.
+#[expect(dead_code)]
+const FALCON_UCODE_ENTRY_APPID_FIRMWARE_SEC_LIC: u8 = 0x05;
+#[expect(dead_code)]
+const FALCON_UCODE_ENTRY_APPID_FWSEC_DBG: u8 = 0x45;
+const FALCON_UCODE_ENTRY_APPID_FWSEC_PROD: u8 = 0x85;
+
+/// Vbios Reader for constructing the VBIOS data.
+struct VbiosIterator<'a> {
+    dev: &'a device::Device,
+    bar0: &'a Bar0,
+    /// VBIOS data vector: As BIOS images are scanned, they are added to this vector for reference
+    /// or copying into other data structures. It is the entire scanned contents of the VBIOS which
+    /// progressively extends. It is used so that we do not re-read any contents that are already
+    /// read as we use the cumulative length read so far, and re-read any gaps as we extend the
+    /// length.
+    data: KVec<u8>,
+    /// Current offset of the [`Iterator`].
+    current_offset: usize,
+    /// Indicate whether the last image has been found.
+    last_found: bool,
+}
+
+impl<'a> VbiosIterator<'a> {
+    fn new(dev: &'a device::Device, bar0: &'a Bar0) -> Result<Self> {
+        Ok(Self {
+            dev,
+            bar0,
+            data: KVec::new(),
+            current_offset: 0,
+            last_found: false,
+        })
+    }
+
+    /// Read bytes from the ROM at the current end of the data vector.
+    fn read_more(&mut self, len: usize) -> Result {
+        let current_len = self.data.len();
+        let start = ROM_OFFSET + current_len;
+
+        // Ensure length is a multiple of 4 for 32-bit reads
+        if len % core::mem::size_of::<u32>() != 0 {
+            dev_err!(
+                self.dev,
+                "VBIOS read length {} is not a multiple of 4\n",
+                len
+            );
+            return Err(EINVAL);
+        }
+
+        self.data.reserve(len, GFP_KERNEL)?;
+        // Read ROM data bytes and push directly to `data`.
+        for addr in (start..start + len).step_by(core::mem::size_of::<u32>()) {
+            // Read 32-bit word from the VBIOS ROM
+            let word = self.bar0.try_read32(addr)?;
+
+            // Convert the `u32` to a 4 byte array and push each byte.
+            word.to_ne_bytes()
+                .iter()
+                .try_for_each(|&b| self.data.push(b, GFP_KERNEL))?;
+        }
+
+        Ok(())
+    }
+
+    /// Read bytes at a specific offset, filling any gap.
+    fn read_more_at_offset(&mut self, offset: usize, len: usize) -> Result {
+        if offset > BIOS_MAX_SCAN_LEN {
+            dev_err!(self.dev, "Error: exceeded BIOS scan limit.\n");
+            return Err(EINVAL);
+        }
+
+        // If `offset` is beyond current data size, fill the gap first.
+        let current_len = self.data.len();
+        let gap_bytes = offset.saturating_sub(current_len);
+
+        // Now read the requested bytes at the offset.
+        self.read_more(gap_bytes + len)
+    }
+
+    /// Read a BIOS image at a specific offset and create a [`BiosImage`] from it.
+    ///
+    /// `self.data` is extended as needed and a new [`BiosImage`] is returned.
+    /// `context` is a string describing the operation for error reporting.
+    fn read_bios_image_at_offset(
+        &mut self,
+        offset: usize,
+        len: usize,
+        context: &str,
+    ) -> Result<BiosImage> {
+        let data_len = self.data.len();
+        if offset + len > data_len {
+            self.read_more_at_offset(offset, len).inspect_err(|e| {
+                dev_err!(
+                    self.dev,
+                    "Failed to read more at offset {:#x}: {:?}\n",
+                    offset,
+                    e
+                )
+            })?;
+        }
+
+        BiosImage::new(self.dev, &self.data[offset..offset + len]).inspect_err(|err| {
+            dev_err!(
+                self.dev,
+                "Failed to {} at offset {:#x}: {:?}\n",
+                context,
+                offset,
+                err
+            )
+        })
+    }
+}
+
+impl<'a> Iterator for VbiosIterator<'a> {
+    type Item = Result<BiosImage>;
+
+    /// Iterate over all VBIOS images until the last image is detected or offset
+    /// exceeds scan limit.
+    fn next(&mut self) -> Option<Self::Item> {
+        if self.last_found {
+            return None;
+        }
+
+        if self.current_offset > BIOS_MAX_SCAN_LEN {
+            dev_err!(self.dev, "Error: exceeded BIOS scan limit, stopping scan\n");
+            return None;
+        }
+
+        // Parse image headers first to get image size.
+        let image_size = match self.read_bios_image_at_offset(
+            self.current_offset,
+            BIOS_READ_AHEAD_SIZE,
+            "parse initial BIOS image headers",
+        ) {
+            Ok(image) => image.image_size_bytes(),
+            Err(e) => return Some(Err(e)),
+        };
+
+        // Now create a new `BiosImage` with the full image data.
+        let full_image = match self.read_bios_image_at_offset(
+            self.current_offset,
+            image_size,
+            "parse full BIOS image",
+        ) {
+            Ok(image) => image,
+            Err(e) => return Some(Err(e)),
+        };
+
+        self.last_found = full_image.is_last();
+
+        // Advance to next image (aligned to 512 bytes).
+        self.current_offset += image_size;
+        self.current_offset = self.current_offset.align_up(Alignment::new::<512>())?;
+
+        Some(Ok(full_image))
+    }
+}
+
+pub(crate) struct Vbios {
+    fwsec_image: FwSecBiosImage,
+}
+
+impl Vbios {
+    /// Probe for VBIOS extraction.
+    ///
+    /// Once the VBIOS object is built, `bar0` is not read for [`Vbios`] purposes anymore.
+    pub(crate) fn new(dev: &device::Device, bar0: &Bar0) -> Result<Vbios> {
+        // Images to extract from iteration
+        let mut pci_at_image: Option<PciAtBiosImage> = None;
+        let mut first_fwsec_image: Option<FwSecBiosBuilder> = None;
+        let mut second_fwsec_image: Option<FwSecBiosBuilder> = None;
+
+        // Parse all VBIOS images in the ROM
+        for image_result in VbiosIterator::new(dev, bar0)? {
+            let image = image_result?;
+
+            dev_dbg!(
+                dev,
+                "Found BIOS image: size: {:#x}, type: {:?}, last: {}\n",
+                image.image_size_bytes(),
+                image.image_type(),
+                image.is_last()
+            );
+
+            // Convert to a specific image type
+            match BiosImageType::try_from(image.pcir.code_type) {
+                Ok(BiosImageType::PciAt) => {
+                    pci_at_image = Some(PciAtBiosImage::try_from(image)?);
+                }
+                Ok(BiosImageType::FwSec) => {
+                    let fwsec = FwSecBiosBuilder {
+                        base: image,
+                        falcon_data_offset: None,
+                        pmu_lookup_table: None,
+                        falcon_ucode_offset: None,
+                    };
+                    if first_fwsec_image.is_none() {
+                        first_fwsec_image = Some(fwsec);
+                    } else {
+                        second_fwsec_image = Some(fwsec);
+                    }
+                }
+                _ => {
+                    // Ignore other image types or unknown types
+                }
+            }
+        }
+
+        // Using all the images, setup the falcon data pointer in Fwsec.
+        if let (Some(mut second), Some(first), Some(pci_at)) =
+            (second_fwsec_image, first_fwsec_image, pci_at_image)
+        {
+            second
+                .setup_falcon_data(&pci_at, &first)
+                .inspect_err(|e| dev_err!(dev, "Falcon data setup failed: {:?}\n", e))?;
+            Ok(Vbios {
+                fwsec_image: second.build()?,
+            })
+        } else {
+            dev_err!(
+                dev,
+                "Missing required images for falcon data setup, skipping\n"
+            );
+            Err(EINVAL)
+        }
+    }
+
+    pub(crate) fn fwsec_image(&self) -> &FwSecBiosImage {
+        &self.fwsec_image
+    }
+}
+
+/// PCI Data Structure as defined in PCI Firmware Specification
+#[derive(Debug, Clone)]
+#[repr(C)]
+struct PcirStruct {
+    /// PCI Data Structure signature ("PCIR" or "NPDS")
+    signature: [u8; 4],
+    /// PCI Vendor ID (e.g., 0x10DE for NVIDIA)
+    vendor_id: u16,
+    /// PCI Device ID
+    device_id: u16,
+    /// Device List Pointer
+    device_list_ptr: u16,
+    /// PCI Data Structure Length
+    pci_data_struct_len: u16,
+    /// PCI Data Structure Revision
+    pci_data_struct_rev: u8,
+    /// Class code (3 bytes, 0x03 for display controller)
+    class_code: [u8; 3],
+    /// Size of this image in 512-byte blocks
+    image_len: u16,
+    /// Revision Level of the Vendor's ROM
+    vendor_rom_rev: u16,
+    /// ROM image type (0x00 = PC-AT compatible, 0x03 = EFI, 0x70 = NBSI)
+    code_type: u8,
+    /// Last image indicator (0x00 = Not last image, 0x80 = Last image)
+    last_image: u8,
+    /// Maximum Run-time Image Length (units of 512 bytes)
+    max_runtime_image_len: u16,
+}
+
+// SAFETY: all bit patterns are valid for `PcirStruct`.
+unsafe impl FromBytes for PcirStruct {}
+
+impl PcirStruct {
+    fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
+        let (pcir, _) = PcirStruct::from_bytes_copy_prefix(data).ok_or(EINVAL)?;
+
+        // Signature should be "PCIR" (0x52494350) or "NPDS" (0x5344504e).
+        if &pcir.signature != b"PCIR" && &pcir.signature != b"NPDS" {
+            dev_err!(
+                dev,
+                "Invalid signature for PcirStruct: {:?}\n",
+                pcir.signature
+            );
+            return Err(EINVAL);
+        }
+
+        if pcir.image_len == 0 {
+            dev_err!(dev, "Invalid image length: 0\n");
+            return Err(EINVAL);
+        }
+
+        Ok(pcir)
+    }
+
+    /// Check if this is the last image in the ROM.
+    fn is_last(&self) -> bool {
+        self.last_image & LAST_IMAGE_BIT_MASK != 0
+    }
+
+    /// Calculate image size in bytes from 512-byte blocks.
+    fn image_size_bytes(&self) -> usize {
+        usize::from(self.image_len) * 512
+    }
+}
+
+/// BIOS Information Table (BIT) Header.
+///
+/// This is the head of the BIT table, that is used to locate the Falcon data. The BIT table (with
+/// its header) is in the [`PciAtBiosImage`] and the falcon data it is pointing to is in the
+/// [`FwSecBiosImage`].
+#[derive(Debug, Clone, Copy)]
+#[repr(C)]
+struct BitHeader {
+    /// 0h: BIT Header Identifier (BMP=0x7FFF/BIT=0xB8FF)
+    id: u16,
+    /// 2h: BIT Header Signature ("BIT\0")
+    signature: [u8; 4],
+    /// 6h: Binary Coded Decimal Version, ex: 0x0100 is 1.00.
+    bcd_version: u16,
+    /// 8h: Size of BIT Header (in bytes)
+    header_size: u8,
+    /// 9h: Size of BIT Tokens (in bytes)
+    token_size: u8,
+    /// 10h: Number of token entries that follow
+    token_entries: u8,
+    /// 11h: BIT Header Checksum
+    checksum: u8,
+}
+
+// SAFETY: all bit patterns are valid for `BitHeader`.
+unsafe impl FromBytes for BitHeader {}
+
+impl BitHeader {
+    fn new(data: &[u8]) -> Result<Self> {
+        let (header, _) = BitHeader::from_bytes_copy_prefix(data).ok_or(EINVAL)?;
+
+        // Check header ID and signature
+        if header.id != 0xB8FF || &header.signature != b"BIT\0" {
+            return Err(EINVAL);
+        }
+
+        Ok(header)
+    }
+}
+
+/// BIT Token Entry: Records in the BIT table followed by the BIT header.
+#[derive(Debug, Clone, Copy)]
+#[expect(dead_code)]
+struct BitToken {
+    /// 00h: Token identifier
+    id: u8,
+    /// 01h: Version of the token data
+    data_version: u8,
+    /// 02h: Size of token data in bytes
+    data_size: u16,
+    /// 04h: Offset to the token data
+    data_offset: u16,
+}
+
+// Define the token ID for the Falcon data
+const BIT_TOKEN_ID_FALCON_DATA: u8 = 0x70;
+
+impl BitToken {
+    /// Find a BIT token entry by BIT ID in a PciAtBiosImage
+    fn from_id(image: &PciAtBiosImage, token_id: u8) -> Result<Self> {
+        let header = &image.bit_header;
+
+        // Offset to the first token entry
+        let tokens_start = image.bit_offset + usize::from(header.header_size);
+
+        for i in 0..usize::from(header.token_entries) {
+            let entry_offset = tokens_start + (i * usize::from(header.token_size));
+
+            // Make sure we don't go out of bounds
+            if entry_offset + usize::from(header.token_size) > image.base.data.len() {
+                return Err(EINVAL);
+            }
+
+            // Check if this token has the requested ID
+            if image.base.data[entry_offset] == token_id {
+                return Ok(BitToken {
+                    id: image.base.data[entry_offset],
+                    data_version: image.base.data[entry_offset + 1],
+                    data_size: u16::from_le_bytes([
+                        image.base.data[entry_offset + 2],
+                        image.base.data[entry_offset + 3],
+                    ]),
+                    data_offset: u16::from_le_bytes([
+                        image.base.data[entry_offset + 4],
+                        image.base.data[entry_offset + 5],
+                    ]),
+                });
+            }
+        }
+
+        // Token not found
+        Err(ENOENT)
+    }
+}
+
+/// PCI ROM Expansion Header as defined in PCI Firmware Specification.
+///
+/// This is header is at the beginning of every image in the set of images in the ROM. It contains
+/// a pointer to the PCI Data Structure which describes the image. For "NBSI" images (NoteBook
+/// System Information), the ROM header deviates from the standard and contains an offset to the
+/// NBSI image however we do not yet parse that in this module and keep it for future reference.
+#[derive(Debug, Clone, Copy)]
+#[expect(dead_code)]
+struct PciRomHeader {
+    /// 00h: Signature (0xAA55)
+    signature: u16,
+    /// 02h: Reserved bytes for processor architecture unique data (20 bytes)
+    reserved: [u8; 20],
+    /// 16h: NBSI Data Offset (NBSI-specific, offset from header to NBSI image)
+    nbsi_data_offset: Option<u16>,
+    /// 18h: Pointer to PCI Data Structure (offset from start of ROM image)
+    pci_data_struct_offset: u16,
+    /// 1Ah: Size of block (this is NBSI-specific)
+    size_of_block: Option<u32>,
+}
+
+impl PciRomHeader {
+    fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
+        if data.len() < 26 {
+            // Need at least 26 bytes to read pciDataStrucPtr and sizeOfBlock.
+            return Err(EINVAL);
+        }
+
+        let signature = u16::from_le_bytes([data[0], data[1]]);
+
+        // Check for valid ROM signatures.
+        match signature {
+            0xAA55 | 0xBB77 | 0x4E56 => {}
+            _ => {
+                dev_err!(dev, "ROM signature unknown {:#x}\n", signature);
+                return Err(EINVAL);
+            }
+        }
+
+        // Read the pointer to the PCI Data Structure at offset 0x18.
+        let pci_data_struct_ptr = u16::from_le_bytes([data[24], data[25]]);
+
+        // Try to read optional fields if enough data.
+        let mut size_of_block = None;
+        let mut nbsi_data_offset = None;
+
+        if data.len() >= 30 {
+            // Read size_of_block at offset 0x1A.
+            size_of_block = Some(
+                u32::from(data[29]) << 24
+                    | u32::from(data[28]) << 16
+                    | u32::from(data[27]) << 8
+                    | u32::from(data[26]),
+            );
+        }
+
+        // For NBSI images, try to read the nbsiDataOffset at offset 0x16.
+        if data.len() >= 24 {
+            nbsi_data_offset = Some(u16::from_le_bytes([data[22], data[23]]));
+        }
+
+        Ok(PciRomHeader {
+            signature,
+            reserved: [0u8; 20],
+            pci_data_struct_offset: pci_data_struct_ptr,
+            size_of_block,
+            nbsi_data_offset,
+        })
+    }
+}
+
+/// NVIDIA PCI Data Extension Structure.
+///
+/// This is similar to the PCI Data Structure, but is Nvidia-specific and is placed right after the
+/// PCI Data Structure. It contains some fields that are redundant with the PCI Data Structure, but
+/// are needed for traversing the BIOS images. It is expected to be present in all BIOS images
+/// except for NBSI images.
+#[derive(Debug, Clone)]
+#[repr(C)]
+struct NpdeStruct {
+    /// 00h: Signature ("NPDE")
+    signature: [u8; 4],
+    /// 04h: NVIDIA PCI Data Extension Revision
+    npci_data_ext_rev: u16,
+    /// 06h: NVIDIA PCI Data Extension Length
+    npci_data_ext_len: u16,
+    /// 08h: Sub-image Length (in 512-byte units)
+    subimage_len: u16,
+    /// 0Ah: Last image indicator flag
+    last_image: u8,
+}
+
+// SAFETY: all bit patterns are valid for `NpdeStruct`.
+unsafe impl FromBytes for NpdeStruct {}
+
+impl NpdeStruct {
+    fn new(dev: &device::Device, data: &[u8]) -> Option<Self> {
+        let (npde, _) = NpdeStruct::from_bytes_copy_prefix(data)?;
+
+        // Signature should be "NPDE" (0x4544504E).
+        if &npde.signature != b"NPDE" {
+            dev_dbg!(
+                dev,
+                "Invalid signature for NpdeStruct: {:?}\n",
+                npde.signature
+            );
+            return None;
+        }
+
+        if npde.subimage_len == 0 {
+            dev_dbg!(dev, "Invalid subimage length: 0\n");
+            return None;
+        }
+
+        Some(npde)
+    }
+
+    /// Check if this is the last image in the ROM.
+    fn is_last(&self) -> bool {
+        self.last_image & LAST_IMAGE_BIT_MASK != 0
+    }
+
+    /// Calculate image size in bytes from 512-byte blocks.
+    fn image_size_bytes(&self) -> usize {
+        usize::from(self.subimage_len) * 512
+    }
+
+    /// Try to find NPDE in the data, the NPDE is right after the PCIR.
+    fn find_in_data(
+        dev: &device::Device,
+        data: &[u8],
+        rom_header: &PciRomHeader,
+        pcir: &PcirStruct,
+    ) -> Option<Self> {
+        // Calculate the offset where NPDE might be located
+        // NPDE should be right after the PCIR structure, aligned to 16 bytes
+        let pcir_offset = usize::from(rom_header.pci_data_struct_offset);
+        let npde_start = (pcir_offset + usize::from(pcir.pci_data_struct_len) + 0x0F) & !0x0F;
+
+        // Check if we have enough data
+        if npde_start + core::mem::size_of::<Self>() > data.len() {
+            dev_dbg!(dev, "Not enough data for NPDE\n");
+            return None;
+        }
+
+        // Try to create NPDE from the data
+        NpdeStruct::new(dev, &data[npde_start..])
+    }
+}
+
+/// The PciAt BIOS image is typically the first BIOS image type found in the BIOS image chain.
+///
+/// It contains the BIT header and the BIT tokens.
+struct PciAtBiosImage {
+    base: BiosImage,
+    bit_header: BitHeader,
+    bit_offset: usize,
+}
+
+#[expect(dead_code)]
+struct EfiBiosImage {
+    base: BiosImage,
+    // EFI-specific fields can be added here in the future.
+}
+
+#[expect(dead_code)]
+struct NbsiBiosImage {
+    base: BiosImage,
+    // NBSI-specific fields can be added here in the future.
+}
+
+struct FwSecBiosBuilder {
+    base: BiosImage,
+    /// These are temporary fields that are used during the construction of the
+    /// [`FwSecBiosBuilder`].
+    ///
+    /// Once FwSecBiosBuilder is constructed, the `falcon_ucode_offset` will be copied into a new
+    /// [`FwSecBiosImage`].
+    ///
+    /// The offset of the Falcon data from the start of Fwsec image.
+    falcon_data_offset: Option<usize>,
+    /// The [`PmuLookupTable`] starts at the offset of the falcon data pointer.
+    pmu_lookup_table: Option<PmuLookupTable>,
+    /// The offset of the Falcon ucode.
+    falcon_ucode_offset: Option<usize>,
+}
+
+/// The [`FwSecBiosImage`] structure contains the PMU table and the Falcon Ucode.
+///
+/// The PMU table contains voltage/frequency tables as well as a pointer to the Falcon Ucode.
+pub(crate) struct FwSecBiosImage {
+    base: BiosImage,
+    /// The offset of the Falcon ucode.
+    falcon_ucode_offset: usize,
+}
+
+/// BIOS Image structure containing various headers and reference fields to all BIOS images.
+///
+/// A BiosImage struct is embedded into all image types and implements common operations.
+#[expect(dead_code)]
+struct BiosImage {
+    /// Used for logging.
+    dev: ARef<device::Device>,
+    /// PCI ROM Expansion Header
+    rom_header: PciRomHeader,
+    /// PCI Data Structure
+    pcir: PcirStruct,
+    /// NVIDIA PCI Data Extension (optional)
+    npde: Option<NpdeStruct>,
+    /// Image data (includes ROM header and PCIR)
+    data: KVec<u8>,
+}
+
+impl BiosImage {
+    /// Get the image size in bytes.
+    fn image_size_bytes(&self) -> usize {
+        // Prefer NPDE image size if available
+        if let Some(ref npde) = self.npde {
+            npde.image_size_bytes()
+        } else {
+            // Otherwise, fall back to the PCIR image size
+            self.pcir.image_size_bytes()
+        }
+    }
+
+    /// Get the BIOS image type.
+    fn image_type(&self) -> Result<BiosImageType> {
+        BiosImageType::try_from(self.pcir.code_type)
+    }
+
+    /// Check if this is the last image.
+    fn is_last(&self) -> bool {
+        // For NBSI images, return true as they're considered the last image.
+        if self.image_type() == Ok(BiosImageType::Nbsi) {
+            return true;
+        }
+
+        // For other image types, check the NPDE first if available
+        if let Some(ref npde) = self.npde {
+            return npde.is_last();
+        }
+
+        // Otherwise, fall back to checking the PCIR last_image flag
+        self.pcir.is_last()
+    }
+
+    /// Creates a new BiosImage from raw byte data.
+    fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
+        // Ensure we have enough data for the ROM header.
+        if data.len() < 26 {
+            dev_err!(dev, "Not enough data for ROM header\n");
+            return Err(EINVAL);
+        }
+
+        // Parse the ROM header.
+        let rom_header = PciRomHeader::new(dev, &data[0..26])
+            .inspect_err(|e| dev_err!(dev, "Failed to create PciRomHeader: {:?}\n", e))?;
+
+        // Get the PCI Data Structure using the pointer from the ROM header.
+        let pcir_offset = usize::from(rom_header.pci_data_struct_offset);
+        let pcir_data = data
+            .get(pcir_offset..pcir_offset + core::mem::size_of::<PcirStruct>())
+            .ok_or(EINVAL)
+            .inspect_err(|_| {
+                dev_err!(
+                    dev,
+                    "PCIR offset {:#x} out of bounds (data length: {})\n",
+                    pcir_offset,
+                    data.len()
+                );
+                dev_err!(
+                    dev,
+                    "Consider reading more data for construction of BiosImage\n"
+                );
+            })?;
+
+        let pcir = PcirStruct::new(dev, pcir_data)
+            .inspect_err(|e| dev_err!(dev, "Failed to create PcirStruct: {:?}\n", e))?;
+
+        // Look for NPDE structure if this is not an NBSI image (type != 0x70).
+        let npde = NpdeStruct::find_in_data(dev, data, &rom_header, &pcir);
+
+        // Create a copy of the data.
+        let mut data_copy = KVec::new();
+        data_copy.extend_from_slice(data, GFP_KERNEL)?;
+
+        Ok(BiosImage {
+            dev: dev.into(),
+            rom_header,
+            pcir,
+            npde,
+            data: data_copy,
+        })
+    }
+}
+
+impl PciAtBiosImage {
+    /// Find a byte pattern in a slice.
+    fn find_byte_pattern(haystack: &[u8], needle: &[u8]) -> Result<usize> {
+        haystack
+            .windows(needle.len())
+            .position(|window| window == needle)
+            .ok_or(EINVAL)
+    }
+
+    /// Find the BIT header in the [`PciAtBiosImage`].
+    fn find_bit_header(data: &[u8]) -> Result<(BitHeader, usize)> {
+        let bit_pattern = [0xff, 0xb8, b'B', b'I', b'T', 0x00];
+        let bit_offset = Self::find_byte_pattern(data, &bit_pattern)?;
+        let bit_header = BitHeader::new(&data[bit_offset..])?;
+
+        Ok((bit_header, bit_offset))
+    }
+
+    /// Get a BIT token entry from the BIT table in the [`PciAtBiosImage`]
+    fn get_bit_token(&self, token_id: u8) -> Result<BitToken> {
+        BitToken::from_id(self, token_id)
+    }
+
+    /// Find the Falcon data pointer structure in the [`PciAtBiosImage`].
+    ///
+    /// This is just a 4 byte structure that contains a pointer to the Falcon data in the FWSEC
+    /// image.
+    fn falcon_data_ptr(&self) -> Result<u32> {
+        let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
+
+        // Make sure we don't go out of bounds
+        if usize::from(token.data_offset) + 4 > self.base.data.len() {
+            return Err(EINVAL);
+        }
+
+        // read the 4 bytes at the offset specified in the token
+        let offset = usize::from(token.data_offset);
+        let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
+            dev_err!(self.base.dev, "Failed to convert data slice to array\n");
+            EINVAL
+        })?;
+
+        let data_ptr = u32::from_le_bytes(bytes);
+
+        if (usize::from_safe_cast(data_ptr)) < self.base.data.len() {
+            dev_err!(self.base.dev, "Falcon data pointer out of bounds\n");
+            return Err(EINVAL);
+        }
+
+        Ok(data_ptr)
+    }
+}
+
+impl TryFrom<BiosImage> for PciAtBiosImage {
+    type Error = Error;
+
+    fn try_from(base: BiosImage) -> Result<Self> {
+        let data_slice = &base.data;
+        let (bit_header, bit_offset) = PciAtBiosImage::find_bit_header(data_slice)?;
+
+        Ok(PciAtBiosImage {
+            base,
+            bit_header,
+            bit_offset,
+        })
+    }
+}
+
+/// The [`PmuLookupTableEntry`] structure is a single entry in the [`PmuLookupTable`].
+///
+/// See the [`PmuLookupTable`] description for more information.
+#[repr(C, packed)]
+struct PmuLookupTableEntry {
+    application_id: u8,
+    target_id: u8,
+    data: u32,
+}
+
+impl PmuLookupTableEntry {
+    fn new(data: &[u8]) -> Result<Self> {
+        if data.len() < core::mem::size_of::<Self>() {
+            return Err(EINVAL);
+        }
+
+        Ok(PmuLookupTableEntry {
+            application_id: data[0],
+            target_id: data[1],
+            data: u32::from_le_bytes(data[2..6].try_into().map_err(|_| EINVAL)?),
+        })
+    }
+}
+
+#[repr(C)]
+struct PmuLookupTableHeader {
+    version: u8,
+    header_len: u8,
+    entry_len: u8,
+    entry_count: u8,
+}
+
+// SAFETY: all bit patterns are valid for `PmuLookupTableHeader`.
+unsafe impl FromBytes for PmuLookupTableHeader {}
+
+/// The [`PmuLookupTableEntry`] structure is used to find the [`PmuLookupTableEntry`] for a given
+/// application ID.
+///
+/// The table of entries is pointed to by the falcon data pointer in the BIT table, and is used to
+/// locate the Falcon Ucode.
+struct PmuLookupTable {
+    header: PmuLookupTableHeader,
+    table_data: KVec<u8>,
+}
+
+impl PmuLookupTable {
+    fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
+        let (header, _) = PmuLookupTableHeader::from_bytes_copy_prefix(data).ok_or(EINVAL)?;
+
+        let header_len = usize::from(header.header_len);
+        let entry_len = usize::from(header.entry_len);
+        let entry_count = usize::from(header.entry_count);
+
+        let required_bytes = header_len + (entry_count * entry_len);
+
+        if data.len() < required_bytes {
+            dev_err!(dev, "PmuLookupTable data length less than required\n");
+            return Err(EINVAL);
+        }
+
+        // Create a copy of only the table data
+        let table_data = {
+            let mut ret = KVec::new();
+            ret.extend_from_slice(&data[header_len..required_bytes], GFP_KERNEL)?;
+            ret
+        };
+
+        Ok(PmuLookupTable { header, table_data })
+    }
+
+    fn lookup_index(&self, idx: u8) -> Result<PmuLookupTableEntry> {
+        if idx >= self.header.entry_count {
+            return Err(EINVAL);
+        }
+
+        let index = (usize::from(idx)) * usize::from(self.header.entry_len);
+        PmuLookupTableEntry::new(&self.table_data[index..])
+    }
+
+    // find entry by type value
+    fn find_entry_by_type(&self, entry_type: u8) -> Result<PmuLookupTableEntry> {
+        for i in 0..self.header.entry_count {
+            let entry = self.lookup_index(i)?;
+            if entry.application_id == entry_type {
+                return Ok(entry);
+            }
+        }
+
+        Err(EINVAL)
+    }
+}
+
+impl FwSecBiosBuilder {
+    fn setup_falcon_data(
+        &mut self,
+        pci_at_image: &PciAtBiosImage,
+        first_fwsec: &FwSecBiosBuilder,
+    ) -> Result {
+        let mut offset = usize::from_safe_cast(pci_at_image.falcon_data_ptr()?);
+        let mut pmu_in_first_fwsec = false;
+
+        // The falcon data pointer assumes that the PciAt and FWSEC images
+        // are contiguous in memory. However, testing shows the EFI image sits in
+        // between them. So calculate the offset from the end of the PciAt image
+        // rather than the start of it. Compensate.
+        offset -= pci_at_image.base.data.len();
+
+        // The offset is now from the start of the first Fwsec image, however
+        // the offset points to a location in the second Fwsec image. Since
+        // the fwsec images are contiguous, subtract the length of the first Fwsec
+        // image from the offset to get the offset to the start of the second
+        // Fwsec image.
+        if offset < first_fwsec.base.data.len() {
+            pmu_in_first_fwsec = true;
+        } else {
+            offset -= first_fwsec.base.data.len();
+        }
+
+        self.falcon_data_offset = Some(offset);
+
+        if pmu_in_first_fwsec {
+            self.pmu_lookup_table = Some(PmuLookupTable::new(
+                &self.base.dev,
+                &first_fwsec.base.data[offset..],
+            )?);
+        } else {
+            self.pmu_lookup_table = Some(PmuLookupTable::new(
+                &self.base.dev,
+                &self.base.data[offset..],
+            )?);
+        }
+
+        match self
+            .pmu_lookup_table
+            .as_ref()
+            .ok_or(EINVAL)?
+            .find_entry_by_type(FALCON_UCODE_ENTRY_APPID_FWSEC_PROD)
+        {
+            Ok(entry) => {
+                let mut ucode_offset = usize::from_safe_cast(entry.data);
+                ucode_offset -= pci_at_image.base.data.len();
+                if ucode_offset < first_fwsec.base.data.len() {
+                    dev_err!(self.base.dev, "Falcon Ucode offset not in second Fwsec.\n");
+                    return Err(EINVAL);
+                }
+                ucode_offset -= first_fwsec.base.data.len();
+                self.falcon_ucode_offset = Some(ucode_offset);
+            }
+            Err(e) => {
+                dev_err!(
+                    self.base.dev,
+                    "PmuLookupTableEntry not found, error: {:?}\n",
+                    e
+                );
+                return Err(EINVAL);
+            }
+        }
+        Ok(())
+    }
+
+    /// Build the final FwSecBiosImage from this builder
+    fn build(self) -> Result<FwSecBiosImage> {
+        let ret = FwSecBiosImage {
+            base: self.base,
+            falcon_ucode_offset: self.falcon_ucode_offset.ok_or(EINVAL)?,
+        };
+
+        if cfg!(debug_assertions) {
+            // Print the desc header for debugging
+            let desc = ret.header()?;
+            dev_dbg!(ret.base.dev, "PmuLookupTableEntry desc: {:#?}\n", desc);
+        }
+
+        Ok(ret)
+    }
+}
+
+impl FwSecBiosImage {
+    /// Get the FwSec header ([`FalconUCodeDesc`]).
+    pub(crate) fn header(&self) -> Result<FalconUCodeDesc> {
+        // Get the falcon ucode offset that was found in setup_falcon_data.
+        let falcon_ucode_offset = self.falcon_ucode_offset;
+
+        // Read the first 4 bytes to get the version.
+        let hdr_bytes: [u8; 4] = self.base.data[falcon_ucode_offset..falcon_ucode_offset + 4]
+            .try_into()
+            .map_err(|_| EINVAL)?;
+        let hdr = u32::from_le_bytes(hdr_bytes);
+        let ver = (hdr & 0xff00) >> 8;
+
+        let hdr_size = match ver {
+            2 => core::mem::size_of::<FalconUCodeDescV2>(),
+            3 => core::mem::size_of::<FalconUCodeDescV3>(),
+            _ => {
+                dev_err!(self.base.dev, "invalid fwsec firmware version: {:?}\n", ver);
+                return Err(EINVAL);
+            }
+        };
+        // Make sure the offset is within the data bounds
+        if falcon_ucode_offset + hdr_size > self.base.data.len() {
+            dev_err!(
+                self.base.dev,
+                "fwsec-frts header not contained within BIOS bounds\n"
+            );
+            return Err(ERANGE);
+        }
+
+        let data = self
+            .base
+            .data
+            .get(falcon_ucode_offset..falcon_ucode_offset + hdr_size)
+            .ok_or(EINVAL)?;
+
+        match ver {
+            2 => {
+                let v2 = FalconUCodeDescV2::from_bytes(data).ok_or(EINVAL)?;
+                Ok(FalconUCodeDesc::V2(v2.clone()))
+            }
+            3 => {
+                let v3 = FalconUCodeDescV3::from_bytes(data).ok_or(EINVAL)?;
+                Ok(FalconUCodeDesc::V3(v3.clone()))
+            }
+            _ => Err(EINVAL),
+        }
+    }
+
+    /// Get the ucode data as a byte slice
+    pub(crate) fn ucode(&self, desc: &FalconUCodeDesc) -> Result<&[u8]> {
+        let falcon_ucode_offset = self.falcon_ucode_offset;
+
+        // The ucode data follows the descriptor.
+        let ucode_data_offset = falcon_ucode_offset + desc.size();
+        let size = usize::from_safe_cast(desc.imem_load_size() + desc.dmem_load_size());
+
+        // Get the data slice, checking bounds in a single operation.
+        self.base
+            .data
+            .get(ucode_data_offset..ucode_data_offset + size)
+            .ok_or(ERANGE)
+            .inspect_err(|_| {
+                dev_err!(
+                    self.base.dev,
+                    "fwsec ucode data not contained within BIOS bounds\n"
+                )
+            })
+    }
+
+    /// Get the signatures as a byte slice
+    pub(crate) fn sigs(&self, desc: &FalconUCodeDesc) -> Result<&[Bcrt30Rsa3kSignature]> {
+        let hdr_size = match desc {
+            FalconUCodeDesc::V2(_v2) => core::mem::size_of::<FalconUCodeDescV2>(),
+            FalconUCodeDesc::V3(_v3) => core::mem::size_of::<FalconUCodeDescV3>(),
+        };
+        // The signatures data follows the descriptor.
+        let sigs_data_offset = self.falcon_ucode_offset + hdr_size;
+        let sigs_count = usize::from(desc.signature_count());
+        let sigs_size = sigs_count * core::mem::size_of::<Bcrt30Rsa3kSignature>();
+
+        // Make sure the data is within bounds.
+        if sigs_data_offset + sigs_size > self.base.data.len() {
+            dev_err!(
+                self.base.dev,
+                "fwsec signatures data not contained within BIOS bounds\n"
+            );
+            return Err(ERANGE);
+        }
+
+        // SAFETY: we checked that `data + sigs_data_offset + (signature_count *
+        // sizeof::<Bcrt30Rsa3kSignature>()` is within the bounds of `data`.
+        Ok(unsafe {
+            core::slice::from_raw_parts(
+                self.base
+                    .data
+                    .as_ptr()
+                    .add(sigs_data_offset)
+                    .cast::<Bcrt30Rsa3kSignature>(),
+                sigs_count,
+            )
+        })
+    }
+}
-- 
2.52.0

