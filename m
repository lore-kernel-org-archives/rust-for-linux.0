Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010063.outbound.protection.outlook.com [52.101.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E93F346784;
	Sat, 30 May 2026 03:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110629; cv=fail; b=UUTueeJ8PjSonsTeVA3qBy8NQ6vh16SyrVDc4f/GvCLczWNPnSpTbALImfaWdnIwVOwU7wpTouBsOG5ZnuOQnHldamSp5S06CZEldDwS5XYZX5BNsIGjyf2vk5HGeh8msSFHwQwLTz9LINAq8qT7tDOUfhypsI9FWxAUqqUqk2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110629; c=relaxed/simple;
	bh=2Itq6L8CtYgyL77jtUalGlvFBfY+yxFI0UbF4F++wfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rut2Ixs0DrAeABPtsPcjeoTT/zszkuJS5iRsHAeKGFPWg4qHx6fCo0cstAr6FKEI8WHLkdcjgBaVOYpxg3YvE7wnSQwzbvWK4EITo2zEIgbpJTm4wf4n7EcSwBsqKxpdZ9XIDmzihhvwq/Vlx0Yt+xyYUnwycmuP+SM/UPfGV98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cnvpovUH; arc=fail smtp.client-ip=52.101.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cnvpovUH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IO9PizI8OvrN2gwSHeoJXndoRMtQqxbMWcomaleDUVlTbR/aHLMWQXrdocqihV/0wJbmXKNOdzypwy0+lJMkhJVn8BPyKKI4O6dWS1ePVu8kFaudylW4wnIVCkimRlugqPEYx1Sbp5hWHjGmZvAeBtrzq7LQpJ/yNTmaTUZPC07WJcn79Rc0jhBluq1oJe/S+nF/5XQszulx3FCgpVi2NKWAz1F0sZStlvU0o734/F90371ULgVLgPC6dvUBbP5kW1aYFAfs1cBOYGPs13dq19YJpUS/f0FNAskFoTBBqChVbq5EgswywSi6mkQKAY7DvFALX6qUEonCumSiQLn0jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyNVCk2kDzZCTv2PZF2eIyhr/pvfyUezkj6zO1/kpS8=;
 b=LwSCJDGA90rqpanIqJrQ/ofsQHLaK4eBeMqQlfRZubNr/hnwCasYxBpnjIZOKUB9mICCGVu310uy/LJgtwYkzVkJUEcd4J432nmpnqgQi+JLihMdBxngcry8D6N9eVm+FPWgjl1MAnQ7EZp6kaYfDoM6GkaPwo4KdbKaneRBBFiOkzOm6Iu616dgNU+NQpbuLqq1Og4jGYnIMYlGTlv7AW2TH/C8VOiJdb0hRz6/JIO5t7ieYRgzYyUFLSrXB7S5qaJDTUdrBnnJFDSTSj665H7Vc7mWbAySJc3Wuy+QYnKgZgiIqT6krfBzVnYMCH1WjcEobZceqCxHswlV7vfLrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyNVCk2kDzZCTv2PZF2eIyhr/pvfyUezkj6zO1/kpS8=;
 b=cnvpovUHP3BU+yIVs9C/KE5INXdHuTVfeYl1UaFR0e1MScQHdTLJDah1MgBsY+xjuwjbH45jd4QfhzB1ya9Y01ML4YZQ/lglTeH3qi4CSs/ejG8xsxyGI1bwq7ra3FvDsJoQnJOSjPi8jEule05JqKOU6JsMPRMYPRQrzWmnmSoAucDr245sT1D47DiKXjTqwyXvRsMO8fGM0/MTU2fQlIkRUPYNnmwyxdwrIhoXWlNGPAyp5mOZRisaszuq5dYj8jyyJwANhdNWAz4NnUmXgbc8MicrTiMDvVj1qmffMsVnj4Q/ywnpkDdp5YSJsWrIUamgdgpZu/ZDha92LTVHvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.15; Sat, 30 May 2026 03:10:01 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:10:00 +0000
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
Subject: [PATCH v11 04/22] gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
Date: Fri, 29 May 2026 20:09:35 -0700
Message-ID: <20260530030953.740561-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0049.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 5158ec5f-6ecf-45c9-0d78-08debdf8efe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HWx5fLPy13x2PWTV6Hgqq/AVWRZipsopp9AI52ExiWt6L6roRZpVJBG4HgPw7YCa/ji+84brB7gljpSKLWP5nKF8rZwBXvXuW6fp6M9xktFaaIDd0RJgA6dBfCBw0ybFSrO7+iRneZnpOD55D5GQ/UAVh+MzTCN93FsFPdqMuU4aJDYZL/xmDj5hhOccrIVTMT1roRzfBrCZjY4+VdPnxiV4MFxXCRxJ0cco+lexrfgzwmR8CYZiCktKdNz8CYaMgvZPkIlWMyeKZ1atb0unuGstQ0kqLxkTLxVK84H326YERgxwuYxtdVL6JLFBaz1HkhaPFRCT54tos6bPBYM6P7O/aENpss87jnydhZGN7oZaHSl8FyvsxII0zXCaWOeExmSvce0boasELOSkwnYB09hpQE6aHdocnKwh3IgAG9uXslL8EyH2pSQx6gzEB6Uih9wzk3y5YBWEYJFfHKoPQk8VhJmoKk/KbHrCF2SdaSGymnPT557Q7GL/fqktRT8fVFn0D+dHuqjR/l2tSH76AzgocBhsxbq3ACW22FQS7tTlXrSrEex6FHvsynfRi5p/Nt+KF/MxyTHo53nrZrd30ej5LBgqU62pqgz5QRCd0jutWhdRm81OucSj0lHPNxmlD6/lJQt5abSvdpu42EXznnzyLdgeLGX/Asm/UdjpZZ0rfJfFF+LWqFLi/3Bs9dXc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zVYe98KbDG16VmG52UbNHIwsIBtN6UiaHJRm/k2iE91CQeNyW5JfdjgGWCe0?=
 =?us-ascii?Q?M1knlXA/Fk64E5L5VjkMR8LUjFPxi5QWbg5eqnzbswmFziRS5uqnYjqGm14U?=
 =?us-ascii?Q?OCJHn5H9hRZ5Go8bjHiYZXec4sHgCv1hUS7mCbIv7676VPO9grBxPjgvucUq?=
 =?us-ascii?Q?XN+Yni2bYOPSJZrKGTPTFlH8tYfgWpMbLlRhP0lz4V10bdZzEbLnIBbl4Nju?=
 =?us-ascii?Q?RLGoh6N2ThozX23bjzSuhdT5HIGzWk9qktmnOu9EnrPIPn8VqYcu4Bz7wbW4?=
 =?us-ascii?Q?YEOscs/t7eUXR6kbBTn6jjbRm620D1WsBGLhzKUyml1alCKQAazix2xWrT0d?=
 =?us-ascii?Q?G8nQpSwc/t/l55pLhDB9jCCa4Kl5Qgqi1xpfk6ICFIYlogK0IHCdJPWSUAmO?=
 =?us-ascii?Q?MheIEtOdOfoEmT6FOQyejVeaVCgac30orqzapx5ytVjI/S8v205lP/hmQMGN?=
 =?us-ascii?Q?NJhvvkDxhdRYazcLVAKXXZAz8wSI7c3hQLP4glQU8/9+ZHvkXdsDth1eS21p?=
 =?us-ascii?Q?f3Gz50cG2JcO3E8kyaOueTf0B3GYtTD2JQw7dZq1Es4dQMEaBD7aqDKcXKVe?=
 =?us-ascii?Q?ACUpPBLqLd0YcVbVqWQYcbWRpWd/y2kvHOYbjpybmdcDmF3qZNa/OiD3cRk8?=
 =?us-ascii?Q?ZxbTUyhtyH/NdPaJwVZQzdtY2roEfSR1NZe4Dm/9MW0wQiLD5/1ho6q8lF81?=
 =?us-ascii?Q?2rm8c43xsjiH2uHoBFutT7+vwKIuTeYoTYfCvh5b63ND00ajkewZe4rHaIw7?=
 =?us-ascii?Q?sW45Ui9ngkor9921DSIS8yct6sAPPKlB5Kaxgod6m3pL9tZ1j2EFCrLcrEZH?=
 =?us-ascii?Q?SDx6uiCoErPwF2O0REgVP4zu6tH0Ue9yAL5CCgObOl93NxLSoafjWYV2EhhD?=
 =?us-ascii?Q?Cu3AAu6kkyWF9FzI1/EYirN4GzN5UmW1ZOaGnTX2waG5z3v4ilcvBhfd2maS?=
 =?us-ascii?Q?9t6W+AMkepQSUo9lffBX/rTG4FWQmcs9UKeooYA4Tro3lB43GpXlarGfb7l8?=
 =?us-ascii?Q?pTK+PhnhS0NjlMOBDzxvhduQfsnJPOGaSgh5D79oBuA4Af9BHOxR4r5wPtLg?=
 =?us-ascii?Q?FaXnXRF2o1ow8k9f5OJzyj54rGBBKvHeklrevi7iCoNBfeJgqPD+tg4UUrBg?=
 =?us-ascii?Q?G2pnR0MIHgGrwtqA1c3bTuGLzuFsSoN0ClMR+REHwV9TWABa5XSz4XkDL7nY?=
 =?us-ascii?Q?Lkqr0lcqc5r4ydQEztT4lvbu5eho0P5El++eQe/v2pNWlMVfFQ0gbv4cgMsv?=
 =?us-ascii?Q?iBzgNIR4EMMi71IuWX3eDxqg0Y6SDt+P41uy382ehA3NENs1Kjyru1f3LexZ?=
 =?us-ascii?Q?pWPTBHepVYN04HQ+PXmyphKua9TXuNILypUzgaeg+WrCzKt6L2lTn2XDi5nt?=
 =?us-ascii?Q?ZGWsRzat+L0EcAIqIomYU/6MQVB40fWlWJ3ulkolcHXC/6WJ4EbEr7/UWLH0?=
 =?us-ascii?Q?l3Pubm6LrB2kBsDdjMBbfPw+X62D6ZsxKofJ+5LPT5i0rVj9uFgZX9tY+kUf?=
 =?us-ascii?Q?6q7IAv6oUEZTGgikgXLW5MfWqKscRRrVqITmJt7hXEy4oGsyZjyYKCApjxPY?=
 =?us-ascii?Q?BSGVfA4bVWK3lbGunWQNJmYbdJi/j4cRYvjicoHwNqxYMWkWcQCfpT9B50om?=
 =?us-ascii?Q?e0pRj/tjuXoFr2PFTbEfuzkxfdP8i2amOmuBhtqe7mwk8B5Xru4hK7hqSIX0?=
 =?us-ascii?Q?T0VpbgHyEPg2z41LEdfpVCjOf7t/C4IpJv8CrVHFT6Nrv/BhEHV5BRzuBCJ9?=
 =?us-ascii?Q?uFgEaoOsSw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5158ec5f-6ecf-45c9-0d78-08debdf8efe4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:10:00.8675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0YFBXFuWyWoL1dJWKZrlVKGdfRolIiirIggF5vY4/OWZC+snadcxF4+kDuF6LysAydtdYrfZRlKa6mEr36A4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863

Hopper and Blackwell need a larger non-WPR heap than the 1 MiB that
earlier architectures use. Hopper and Blackwell GB10x need 2 MiB, while
Blackwell GB20x needs 2 MiB + 128 KiB. Because GB10x and GB20x diverge
here, give each Blackwell family its own framebuffer HAL and select the
non-WPR heap size per chipset family.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           |  5 ++-
 drivers/gpu/nova-core/fb/hal.rs       | 16 +++++++--
 drivers/gpu/nova-core/fb/hal/gb100.rs |  9 +++--
 drivers/gpu/nova-core/fb/hal/gb202.rs | 52 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal/gh100.rs | 10 +++++-
 5 files changed, 84 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb202.rs

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index d7a4dc944131..0aaee718c2c3 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -252,9 +252,8 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         };
 
         let heap = {
-            const HEAP_SIZE: u64 = u64::SZ_1M;
-
-            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
+            let heap_size = u64::from(hal.non_wpr_heap_size());
+            FbRange(wpr2.start - heap_size..wpr2.start)
         };
 
         Ok(Self {
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index e6ac55bba9b9..acb934f9aa9f 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -1,7 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 // SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
-use kernel::prelude::*;
+use kernel::{
+    prelude::*,
+    sizes::SizeConstants, //
+};
 
 use crate::{
     driver::Bar0,
@@ -14,6 +17,7 @@
 mod ga100;
 mod ga102;
 mod gb100;
+mod gb202;
 mod gh100;
 mod tu102;
 
@@ -37,6 +41,13 @@ pub(crate) trait FbHal {
 
     /// Returns the FRTS size, in bytes.
     fn frts_size(&self) -> u64;
+
+    /// Returns the non-WPR heap size for this chipset, in bytes.
+    ///
+    /// Older architectures use 1 MiB. Hopper and Blackwell override this.
+    fn non_wpr_heap_size(&self) -> u32 {
+        u32::SZ_1M
+    }
 }
 
 /// Returns the HAL corresponding to `chipset`.
@@ -46,6 +57,7 @@ pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
         Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
         Architecture::Ampere | Architecture::Ada => ga102::GA102_HAL,
         Architecture::Hopper => gh100::GH100_HAL,
-        Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => gb100::GB100_HAL,
+        Architecture::BlackwellGB10x => gb100::GB100_HAL,
+        Architecture::BlackwellGB20x => gb202::GB202_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
index c78027c26a9e..8d63350abf8a 100644
--- a/drivers/gpu/nova-core/fb/hal/gb100.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
-//! Blackwell framebuffer HAL.
+//! Blackwell GB10x framebuffer HAL.
 
 use kernel::{
     prelude::*,
@@ -20,7 +20,7 @@
 
 struct Gb100;
 
-const fn pmu_reserved_size_gb100() -> u32 {
+pub(super) const fn pmu_reserved_size_gb100() -> u32 {
     usize_into_u32::<{ const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment::new::<SZ_128K>()).unwrap() }>(
     )
 }
@@ -48,6 +48,11 @@ fn pmu_reserved_size(&self) -> u32 {
         pmu_reserved_size_gb100()
     }
 
+    fn non_wpr_heap_size(&self) -> u32 {
+        // Non-WPR heap for GB10x (see Open RM: kgspGetNonWprHeapSize, GB100/GB102).
+        u32::SZ_2M
+    }
+
     fn frts_size(&self) -> u64 {
         super::tu102::frts_size_tu102()
     }
diff --git a/drivers/gpu/nova-core/fb/hal/gb202.rs b/drivers/gpu/nova-core/fb/hal/gb202.rs
new file mode 100644
index 000000000000..542c1d7429e9
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gb202.rs
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Blackwell GB20x framebuffer HAL.
+
+use kernel::{
+    prelude::*,
+    sizes::SizeConstants, //
+};
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal, //
+};
+
+struct Gb202;
+
+impl FbHal for Gb202 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        super::ga100::read_sysmem_flush_page_ga100(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+
+        Ok(())
+    }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        super::ga100::display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        super::ga102::vidmem_size_ga102(bar)
+    }
+
+    fn pmu_reserved_size(&self) -> u32 {
+        super::gb100::pmu_reserved_size_gb100()
+    }
+
+    fn non_wpr_heap_size(&self) -> u32 {
+        // Non-WPR heap for GB20x (see Open RM: kgspGetNonWprHeapSize, GB202+).
+        u32::SZ_2M + u32::SZ_128K
+    }
+
+    fn frts_size(&self) -> u64 {
+        super::tu102::frts_size_tu102()
+    }
+}
+
+const GB202: Gb202 = Gb202;
+pub(super) const GB202_HAL: &dyn FbHal = &GB202;
diff --git a/drivers/gpu/nova-core/fb/hal/gh100.rs b/drivers/gpu/nova-core/fb/hal/gh100.rs
index c122ac2091f8..8f79c72b1823 100644
--- a/drivers/gpu/nova-core/fb/hal/gh100.rs
+++ b/drivers/gpu/nova-core/fb/hal/gh100.rs
@@ -1,7 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 // SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
-use kernel::prelude::*;
+use kernel::{
+    prelude::*,
+    sizes::SizeConstants, //
+};
 
 use crate::{
     driver::Bar0,
@@ -33,6 +36,11 @@ fn pmu_reserved_size(&self) -> u32 {
         super::tu102::pmu_reserved_size_tu102()
     }
 
+    fn non_wpr_heap_size(&self) -> u32 {
+        // Non-WPR heap for Hopper (see Open RM: kgspCalculateFbLayout_GH100).
+        u32::SZ_2M
+    }
+
     fn frts_size(&self) -> u64 {
         super::tu102::frts_size_tu102()
     }
-- 
2.54.0

