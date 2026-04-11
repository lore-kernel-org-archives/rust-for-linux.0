Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216FB32E6BC;
	Sat, 11 Apr 2026 02:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875848; cv=fail; b=M/BpL4u/lJriABSY1wgvFII+dyv6tQSb5SKp3NbYYYEGQkrQrstnNc51ppx36Ip3uDkAoLquF4gEoYuDzUFSN06v/v1GZA1ApHVjaV/46W4/x4seBKH64y3pO7CVKqMMDeoGYryKRbgOmqfkC7eFtyqP0n0X3ScXU98/TrqOaGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875848; c=relaxed/simple;
	bh=9jpdtYut5lZCOZBYuo4vIV6rreBbi90ueH0MbejQw9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kzMAMLKxzODgnXBTDZGXmBdZXzT0joA4uwVY8MjOU3OJaWmwSnQEcCyzMoLWi8grqZsa3v1l205L95oW8yvDv8qCI3HoLs1tuyHLFIbl7cTPQ4fhXdi5ezhNNFzUNJO+TZXu6knFJRegSOJUi/HEZCC/b9kr/K9PfvITjdtB/70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BCDAoNXS; arc=fail smtp.client-ip=52.101.56.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BCDAoNXS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L32mOrlIVU847xc593bgpWGjyP4GFZZb15/aFjdab8XtY4J8HfmT3PlgmU6Aqn7sSj8ZaIDF43EV06icbItH6dR+B97OInEigTMckZF58I5gipSs2if1shnitYDUSzHtQ7idgOiI5dFl4WBxzsVs1Xg43AVejKenBJ0S47cbqero2HZ+dorRm6cd1kAzjsMLQ8xh90LAHrzrSyOCy+oZPLBY/NVRenqQSRmP+UxkdnAUqq72jQRahD6Cm5HwEV4/3meEJHQkPzJGP23z256d152VS3j1gLtvTzyNec4I6YvuJ26lkG8tp5/vfOTNB0Q+uGhYT0uARs2Ui7w08kVzCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsuIKJj4SOfDkp0SMU7YjaMlk/uHBGNZpbLLYENXYho=;
 b=nyZ2dxMZx/KqcL/eTjUEXeIunSpwpKBdPnidV/iL/IyNnxbayDgWNQuNPZ7zNgROlpT/JjTBRhxRSjb063gSdmEuljJcwkc3OAF9Glx77HtQCH6rsID8owJa+j+//4rcMr8HGmfE3Nj7NtmFpEPkLUPlPoibZqjSFRHFCXX8HTIPjPHWsdL+CGlocOyJLWnQKpCPrw5xY3+Go5519Y370g0nTjiTBl/KFOXzwnquGzgVQrPnI6zn+fE33jDzDl2KS2LHB1SG43irEdaIup8xAwSaMyNPr91jKoO+tC24tcJhW7V4ghzhwY0HgJc5DntIuvTkPPRe3cGk0ZP4nVV4BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsuIKJj4SOfDkp0SMU7YjaMlk/uHBGNZpbLLYENXYho=;
 b=BCDAoNXSSCb9LDnKcNn8IlbQ2oFoMbmFRUFzDymm7LBuI3GA0iws6UDD73vj+nv3jF2Lybk67Ye2c38UYe9yNKEbyqxKdIWcbr3/8oU1b8Dl8xXd+xovOWnc2SKWSdZjbzTw7qkPZhJlmpubycpDHItVHOVxJ+hUudgUKb56edMJH9mEjhocqpx9Pz/t61TKSoNIFeo4Qztk0asLytE8GplRFIgulDdCWheXTabNtI9PDgTNJBXYnFuYzUs8YhC9LtHVyxDj/gAPJy9U4bfGWgFRW6zKggQAfU4nD8s0gMlqKOku5FNy/oU/YpQ8u8N0PGgu6ybNyx4zu1AwNTN4cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.46; Sat, 11 Apr 2026 02:50:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:30 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v10 25/28] gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
Date: Fri, 10 Apr 2026 19:49:50 -0700
Message-ID: <20260411024953.473149-26-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: 1122bec0-3053-4342-089a-08de97751696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	luWD8QFnP/JFQd7o+mZWR25hEJpiPQwSZA9Rm6M1mI43sRThfn8DuACpQChcNY6DaFwpej8Wz6mwmTKyOd4rXvDRIUGj2LCLMzDtlu1at8Q4moq+f8F78u1A3CLA8jwqH1xrghODAavRHru4V9ENAN54jCeP1PFaqrslm1ZIDSj0KkKEhgEpwr/zPpCKlCy4r72i1eZBEtIjZ0DvVqM/Lt3172AWTtiMBUrL4Dm//ZBFT0E0TTJCePdJy0+IvWj2q/kOYlD9knxFscCjgIhWpOGmY7RPBdnbWrppwypbm4c+UW47Pdc5/Du3R6DZgV28qMVl/dAF/Hc6qFlzyWAAl/pb53QjcuIBymZMpiFNue/pdaHsaNeg5jp96QVqe5gvlvI9GOL0AyEwyIaDoL5M6CE20CmPb2tc7QXXvrfQ+bmU7908ar6/VBX9Zx174IXmvw7O4Nf/7CcLF+epDJ1gT7XF/FPS+oD39IZFsUY+18pIJYpk0LYvn+jQwq87peWFBiz4MWMwTtkyzmpCGFiioVpvAD2o55JBM7xULuyn+MXTrKqQnLY92g7lQ4jK8Dzzd2TvCqHLkF8e5luh6XjTQWg6Ja5Vl8theZvEhrkJ2Aijk1mwjCwVm2TR0z+6junjSrkTHXnu7vmPd5z2NeXR3ve6vNNyhvplJKwhqghnElUCNKzhwI2uvxpjU5C5QnL879mngHapTU8Xn/hU1UPvjE6+r2i8PZBJi4WbJ3ow8EM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1umUGaMKBd9Fc995BRR/eL1svoGmy91fqnShHaM6O5eaeHqXIQyFlvJXIZev?=
 =?us-ascii?Q?yt22uGyaMluVVrE4TXr53iTMmh3HvmUMgQIT4gA4zzbVmus0550/X4b5u4i1?=
 =?us-ascii?Q?J9jNuWid64e7oxNuQ09mAOzqaJ3O/NEz7QNotdXHY4yEyDjytXHuVSaU9E+j?=
 =?us-ascii?Q?W85nvLOVGPjyNARKAA+e/jmLGl1WdcF05xUGxWuiCpKPSM2ZVQuRqEXybgO6?=
 =?us-ascii?Q?NSY2jpUK/VG6gUcUaN+FrApyvmLznwxvDSNcbmCfWDyJaEJ1IrhmSxwo1xmS?=
 =?us-ascii?Q?LRtoCBVGSjG3SKaotvNxvIJq5hFEMitbRgDX7D6Y4kBpFvk3F7fsrbPjWYWc?=
 =?us-ascii?Q?k9xk/WoTtFe6/KSBcSKpaFFueQYvEUonjhPzxUGweUSbeNYm5d2lIh7LxP+G?=
 =?us-ascii?Q?IUywJj+hpAbAFdXYnQg50qXVy2m7Yru802CJgKBjORjech6rCREMcM2AOHbK?=
 =?us-ascii?Q?rRVesXFyj4z8xZ8hK87bfu8hFSrABZw0ra0Nn+pXBlMtwvFy7Ux5UF+jz11D?=
 =?us-ascii?Q?XnbCgbNGlDyKTm5//SZ4aQrg8u8pgbybMWPyQAnF2gGfWYVF8uuQi3gQbgi0?=
 =?us-ascii?Q?1DjivWDHLFnK+L9bMSaaWCguUvuis/J0xQrGfkoZyLhJUh5GBjPxPeZnNu5E?=
 =?us-ascii?Q?ltuzK05OpJ+vmiPOEP3dxD73oppnhV+BitdLqEULsPdS65R/qGjWwGVwqDoJ?=
 =?us-ascii?Q?N9zUmM0BlLWYThhoTYClqb6lwcmDdiBmN2+eDmIieXDzPp7KVUG/THEH+vTZ?=
 =?us-ascii?Q?fepspjKhmcR95c62NErlCX49LAPjzBbm846SJ471HAp796eGQZbJxVKNwSxb?=
 =?us-ascii?Q?a3QtJmafXjnxVbN2S/1e0aZXX6mpGBYIGmJx8voCRFlLX11bpUtEs6HdN7Rm?=
 =?us-ascii?Q?PHqC+z1PTjcOCWroi43GRdyjD8oGHTwhyvcpRsfqVR6Yy2gPu0aPhDF7+VBG?=
 =?us-ascii?Q?t3Q2jgwgKViDGC0rLKHlJRWFrEDjB+bNblckqA0XMVnvlnBvBmEBQGHHj9an?=
 =?us-ascii?Q?23LRY+HnpnZuOAGZWTnXifYBqclCmUVJ5s3PoPvU6d6LC68V0ZmWNbKzRDGq?=
 =?us-ascii?Q?inaoAtnLlU3tPBKFAdkNPLqjWZ9toNoWx2Ojq8XwXd3sqCPaAGpPT6BB+F6j?=
 =?us-ascii?Q?ySHkuvxwjvuAcMfDEujtZwlencqJrxe74JpC+awe89VIkLFSnbFr8SDilgou?=
 =?us-ascii?Q?/SdD/LZGH4BKMjTl4nITpeTAH6uQzMHgYOl7pO8aSpht2tX2DY7vJ3dO26l/?=
 =?us-ascii?Q?D4wE3njQGUYzTWe2PaJM71nUD8q5H/G6PcjxxeZXydBXqkh98KM3dNcErnil?=
 =?us-ascii?Q?H8XZEqjjzrc2YZF9aWqkvaZUyFgHgsJARrKyeFVb0PMAjDG8TtO9dZcVAmuv?=
 =?us-ascii?Q?gyJGYVmLJT0KcNmWevz3iprN/h3RcTtyMoDyII+WmcCVS4/7/SUmDg90KwLE?=
 =?us-ascii?Q?YNRUSclx31UHC4uM5AfoF6mkONLvjsTW8BwZE4jmG0RhHIQoQ3enOU/KDzzp?=
 =?us-ascii?Q?hqnRIdomu6jTzaCzVCFt3+LCwgoRzuy2Cpzj+vpL618sB0XdNV/0BJaREk/S?=
 =?us-ascii?Q?kBP7rLNmaPtIkeLYJ1/j/KiqkpnMtovGlboyhMY9ccQs0MFKTSvMQkKNyJmO?=
 =?us-ascii?Q?eTSA9H1A2Hejlery7YWZp0p3z+p3tFDdS0+xEhPSIKe9Saga6zPUq+wKDXZh?=
 =?us-ascii?Q?HPs8c4XmEFs0vYh/1IRj3tx7e2rcEEjn7fwEnYnbdCQ0DHFLw8QFhsPvFPzJ?=
 =?us-ascii?Q?6h7rE3TpPQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1122bec0-3053-4342-089a-08de97751696
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:28.1398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4R8gZBSGjq7pXgsSy1SfXKrOmFAQ7yscMVXbS8A3CJcszI/dVIOY/PHn8jEMiIg8u2kyzgE4eMHS9ZX44Tcnww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

Add boot_fmc() which builds and sends the Chain of Trust message to FSP.
FmcBootArgs bundles the DMA-coherent boot parameters that FSP reads at
boot time.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           |   1 -
 drivers/gpu/nova-core/firmware/fsp.rs |   1 -
 drivers/gpu/nova-core/fsp.rs          | 257 +++++++++++++++++++++++++-
 drivers/gpu/nova-core/gpu.rs          |   1 -
 drivers/gpu/nova-core/gsp/boot.rs     |  26 ++-
 drivers/gpu/nova-core/mctp.rs         |   2 -
 6 files changed, 275 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 756ff283a908..2b3a2bb2f1db 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -294,7 +294,6 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
 }
 
 /// Returns the PMU reserved memory size for `chipset`.
-#[expect(dead_code)]
 pub(crate) fn calc_pmu_reserved_size(chipset: Chipset) -> u32 {
     match chipset.arch() {
         Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => PMU_RESERVED_SIZE,
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index 3968bacb7e61..301345aa491c 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -14,7 +14,6 @@
     gpu::Chipset, //
 };
 
-#[expect(dead_code)]
 pub(crate) struct FspFirmware {
     /// FMC firmware image data (only the "image" ELF section).
     pub(crate) fmc_image: Coherent<[u8]>,
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index bc98a5c3cfaa..75e06b2d5f06 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -8,9 +8,25 @@
 
 use kernel::{
     device,
+    dma::{
+        Coherent,
+        CoherentBox, //
+    },
     io::poll::read_poll_timeout,
     prelude::*,
-    time::Delta, //
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+    sizes::{
+        SizeConstants,
+        SZ_2M, //
+    },
+    time::Delta,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
 };
 
 use crate::regs;
@@ -34,7 +50,6 @@ pub(crate) const fn new(version: u16) -> Self {
     }
 
     /// Return the raw protocol version number for the wire format.
-    #[expect(dead_code)]
     pub(crate) const fn raw(self) -> u16 {
         self.0
     }
@@ -46,6 +61,89 @@ pub(crate) const fn raw(self) -> u16 {
 /// FSP secure boot completion timeout in milliseconds.
 const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 5000;
 
+/// GSP FMC initialization parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspFmcInitParams {
+    /// CC initialization "registry keys".
+    regkeys: u32,
+}
+
+// SAFETY: GspFmcInitParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspFmcInitParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspFmcInitParams {}
+
+/// GSP ACR (Authenticated Code RAM) boot parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspAcrBootGspRmParams {
+    /// Physical memory aperture through which gspRmDescPa is accessed.
+    target: u32,
+    /// Size in bytes of the GSP-RM descriptor structure.
+    gsp_rm_desc_size: u32,
+    /// Physical offset in the target aperture of the GSP-RM descriptor structure.
+    gsp_rm_desc_offset: u64,
+    /// Physical offset in FB to set the start of the WPR containing GSP-RM.
+    wpr_carveout_offset: u64,
+    /// Size in bytes of the WPR containing GSP-RM.
+    wpr_carveout_size: u32,
+    /// Whether to boot GSP-RM or GSP-Proxy through ACR.
+    b_is_gsp_rm_boot: u32,
+}
+
+// SAFETY: GspAcrBootGspRmParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspAcrBootGspRmParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspAcrBootGspRmParams {}
+
+/// GSP RM boot parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspRmParams {
+    /// Physical memory aperture through which bootArgsOffset is accessed.
+    target: u32,
+    /// Physical offset in the memory aperture that will be passed to GSP-RM.
+    boot_args_offset: u64,
+}
+
+// SAFETY: GspRmParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspRmParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspRmParams {}
+
+/// GSP SPDM (Security Protocol and Data Model) parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspSpdmParams {
+    /// Physical memory aperture through which all addresses are accessed.
+    target: u32,
+    /// Physical offset in the memory aperture where SPDM payload buffer is stored.
+    payload_buffer_offset: u64,
+    /// Size of the above payload buffer.
+    payload_buffer_size: u32,
+}
+
+// SAFETY: GspSpdmParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspSpdmParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspSpdmParams {}
+
+/// Complete GSP FMC boot parameters passed to FSP.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+pub(crate) struct GspFmcBootParams {
+    init_params: GspFmcInitParams,
+    boot_gsp_rm_params: GspAcrBootGspRmParams,
+    gsp_rm_params: GspRmParams,
+    gsp_spdm_params: GspSpdmParams,
+}
+
+// SAFETY: GspFmcBootParams is composed of C structs with only primitive types.
+unsafe impl AsBytes for GspFmcBootParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspFmcBootParams {}
+
 /// Size constraints for FSP security signatures (Hopper/Blackwell).
 const FSP_HASH_SIZE: usize = 48; // SHA-384 hash
 const FSP_PKEY_SIZE: usize = 384; // RSA-3072 public key
@@ -69,6 +167,35 @@ struct NvdmPayloadCommandResponse {
     error_code: u32,
 }
 
+/// NVDM (NVIDIA Device Management) COT (Chain of Trust) payload structure.
+/// This is the main message payload sent to FSP for Chain of Trust.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadCot {
+    version: u16,
+    size: u16,
+    gsp_fmc_sysmem_offset: u64,
+    frts_sysmem_offset: u64,
+    frts_sysmem_size: u32,
+    frts_vidmem_offset: u64,
+    frts_vidmem_size: u32,
+    hash384: [u8; FSP_HASH_SIZE],
+    public_key: [u8; FSP_PKEY_SIZE],
+    signature: [u8; FSP_SIG_SIZE],
+    gsp_boot_args_sysmem_offset: u64,
+}
+
+/// Complete FSP message structure with MCTP and NVDM headers.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspMessage {
+    mctp_header: u32,
+    nvdm_header: u32,
+    cot: NvdmPayloadCot,
+}
+
+// SAFETY: FspMessage is a packed C struct with only integral fields.
+unsafe impl AsBytes for FspMessage {}
 /// Complete FSP response structure with MCTP and NVDM headers.
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
@@ -89,6 +216,73 @@ pub(crate) trait MessageToFsp: AsBytes {
     /// NVDM type identifying this message to FSP.
     const NVDM_TYPE: u32;
 }
+
+impl MessageToFsp for FspMessage {
+    const NVDM_TYPE: u32 = NvdmType::Cot as u32;
+}
+
+/// Bundled arguments for FMC boot via FSP Chain of Trust.
+pub(crate) struct FmcBootArgs<'a> {
+    chipset: crate::gpu::Chipset,
+    fmc_image_fw: &'a Coherent<[u8]>,
+    fmc_boot_params: Coherent<GspFmcBootParams>,
+    resume: bool,
+    signatures: &'a FmcSignatures,
+}
+
+impl<'a> FmcBootArgs<'a> {
+    /// Build FMC boot arguments, allocating the DMA-coherent boot parameter
+    /// structure that FSP will read.
+    #[allow(clippy::too_many_arguments)]
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: crate::gpu::Chipset,
+        fmc_image_fw: &'a Coherent<[u8]>,
+        wpr_meta_addr: u64,
+        wpr_meta_size: u32,
+        libos_addr: u64,
+        resume: bool,
+        signatures: &'a FmcSignatures,
+    ) -> Result<Self> {
+        // `GSP_DMA_TARGET_*` is not in the current Rust bindings yet.
+        const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 = 1;
+        const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 = 2;
+
+        let mut fmc_boot_params = CoherentBox::<GspFmcBootParams>::zeroed(dev, GFP_KERNEL)?;
+
+        // Blackwell FSP expects wpr_carveout_offset and wpr_carveout_size to be zero;
+        // it obtains WPR info from other sources.
+        fmc_boot_params.boot_gsp_rm_params = GspAcrBootGspRmParams {
+            target: GSP_DMA_TARGET_COHERENT_SYSTEM,
+            gsp_rm_desc_size: wpr_meta_size,
+            gsp_rm_desc_offset: wpr_meta_addr,
+            b_is_gsp_rm_boot: 1,
+            ..Default::default()
+        };
+
+        fmc_boot_params.gsp_rm_params = GspRmParams {
+            target: GSP_DMA_TARGET_NONCOHERENT_SYSTEM,
+            boot_args_offset: libos_addr,
+        };
+
+        let fmc_boot_params: Coherent<GspFmcBootParams> = fmc_boot_params.into();
+
+        Ok(Self {
+            chipset,
+            fmc_image_fw,
+            fmc_boot_params,
+            resume,
+            signatures,
+        })
+    }
+
+    /// DMA address of the FMC boot parameters, needed after boot for lockdown
+    /// release polling.
+    #[expect(dead_code)]
+    pub(crate) fn boot_params_dma_handle(&self) -> u64 {
+        self.fmc_boot_params.dma_handle()
+    }
+}
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
@@ -188,8 +382,65 @@ pub(crate) fn extract_fmc_signatures(
         Ok(signatures)
     }
 
+    /// Boot GSP FMC via FSP Chain of Trust.
+    ///
+    /// Builds the COT message from the pre-configured [`FmcBootArgs`], sends it
+    /// to FSP, and waits for the response.
+    pub(crate) fn boot_fmc(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
+        args: &FmcBootArgs<'_>,
+    ) -> Result {
+        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", args.chipset);
+
+        let fmc_addr = args.fmc_image_fw.dma_handle();
+        let fmc_boot_params_addr = args.fmc_boot_params.dma_handle();
+
+        // frts_offset is relative to FB end: FRTS_location = FB_END - frts_offset
+        let frts_offset = if !args.resume {
+            let frts_reserved_size = crate::fb::calc_non_wpr_heap_size(args.chipset)
+                .checked_add(u64::from(crate::fb::calc_pmu_reserved_size(args.chipset)))
+                .ok_or(EINVAL)?;
+
+            frts_reserved_size
+                .align_up(Alignment::new::<SZ_2M>())
+                .ok_or(EINVAL)?
+        } else {
+            0
+        };
+        let frts_size: u32 = if !args.resume { u32::SZ_1M } else { 0 };
+
+        let msg = KBox::new(
+            FspMessage {
+                mctp_header: MctpHeader::single_packet().raw(),
+                nvdm_header: NvdmHeader::new(NvdmType::Cot).raw(),
+
+                cot: NvdmPayloadCot {
+                    version: args.chipset.fsp_cot_version().ok_or(ENOTSUPP)?.raw(),
+                    size: u16::try_from(core::mem::size_of::<NvdmPayloadCot>())
+                        .map_err(|_| EINVAL)?,
+                    gsp_fmc_sysmem_offset: fmc_addr,
+                    frts_sysmem_offset: 0,
+                    frts_sysmem_size: 0,
+                    frts_vidmem_offset: frts_offset,
+                    frts_vidmem_size: frts_size,
+                    hash384: args.signatures.hash384,
+                    public_key: args.signatures.public_key,
+                    signature: args.signatures.signature,
+                    gsp_boot_args_sysmem_offset: fmc_boot_params_addr,
+                },
+            },
+            GFP_KERNEL,
+        )?;
+
+        Self::send_sync_fsp(dev, bar, fsp_falcon, &*msg)?;
+
+        dev_dbg!(dev, "FSP Chain of Trust completed successfully\n");
+        Ok(())
+    }
+
     /// Send message to FSP and wait for response.
-    #[expect(dead_code)]
     fn send_sync_fsp<M>(
         dev: &device::Device<device::Bound>,
         bar: &crate::driver::Bar0,
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 5d7fd810687d..0a05d038ab76 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -141,7 +141,6 @@ pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
     ///
     /// Hopper (GH100) uses version 1, Blackwell uses version 2.
     /// Returns `None` for architectures that do not use FSP.
-    #[expect(dead_code)]
     pub(crate) const fn fsp_cot_version(&self) -> Option<FspCotVersion> {
         match self.arch() {
             Architecture::Hopper => Some(FspCotVersion::new(1)),
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 739624af1cef..703c9ee48363 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -33,7 +33,10 @@
         gsp::GspFirmware,
         FIRMWARE_VERSION, //
     },
-    fsp::Fsp,
+    fsp::{
+        FmcBootArgs,
+        Fsp, //
+    },
     gpu::{
         Architecture,
         Chipset, //
@@ -203,16 +206,29 @@ fn boot_via_fsp(
         bar: &Bar0,
         chipset: Chipset,
         _gsp_falcon: &Falcon<Gsp>,
-        _wpr_meta: &Coherent<GspFwWprMeta>,
-        _libos: &Coherent<[LibosMemoryRegionInitArgument]>,
+        wpr_meta: &Coherent<GspFwWprMeta>,
+        libos: &Coherent<[LibosMemoryRegionInitArgument]>,
     ) -> Result {
-        let _fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
+        let fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
 
         let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
-        let _signatures = Fsp::extract_fmc_signatures(dev, fsp_fw.fmc_elf.data())?;
+        let signatures = Fsp::extract_fmc_signatures(dev, fsp_fw.fmc_elf.data())?;
 
         Fsp::wait_secure_boot(dev, bar, chipset.arch())?;
 
+        let args = FmcBootArgs::new(
+            dev,
+            chipset,
+            &fsp_fw.fmc_image,
+            wpr_meta.dma_handle(),
+            core::mem::size_of::<GspFwWprMeta>() as u32,
+            libos.dma_handle(),
+            false,
+            &signatures,
+        )?;
+
+        Fsp::boot_fmc(dev, bar, &fsp_falcon, &args)?;
+
         Err(ENOTSUPP)
     }
 
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index 680ed19d196e..c23e8ec69636 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -6,8 +6,6 @@
 //! Device Management) messages between the kernel driver and GPU firmware
 //! processors such as FSP and GSP.
 
-#![expect(dead_code)]
-
 /// NVDM message type identifiers carried over MCTP.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 #[repr(u8)]
-- 
2.53.0

