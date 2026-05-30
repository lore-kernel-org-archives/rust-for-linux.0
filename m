Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010010.outbound.protection.outlook.com [52.101.85.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF91344DBB;
	Sat, 30 May 2026 03:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110620; cv=fail; b=lRqcqEKNvLXQUgcVJiA+Q7/z0Q5DP82E8T8+ZC4zfJfHWvlCU8yqMLti120dQzOI5TIpq4djl+AREU0LlJFlj/y8ov/7zLLrxjTd7Ym6jmZf5+iSmokbTw7cNgVXIqQt7jXbhDk1hqCK3DrYq1aDh7iRc296ex6YsULEnDMgdWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110620; c=relaxed/simple;
	bh=AnR5TuDVKfIHLOd1KRaxob3wGiQu9LKeKhRxYz9DcMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qlw1ZoFM87EY5OcVZiwDfDHzsa8R+sPzqB/IRdXy8NzYRbeAL4o3SdkYcSOnAK9t5X0Ovo/2NFGmsdll/h7P37+8jaVjK9M9IzuVnTMlPoecAUuFSqQIWN2xYnvh7yLcpUMUINuAzCuH2tr7JJnL/TuLE/yN+o7cE+sw/5HNlck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=piZqDUID; arc=fail smtp.client-ip=52.101.85.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="piZqDUID"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyQdM0KdODTN0mXp/VoVGFXSLmL2lUIfcqS7QN3UOX9yJZRS/jLTpGTU5AsBpN5RZAlRwAMgXbA0WK5DszpV1MYnVef7VJDqhvcAYLGr6PuttE/7Wgyeqzas52IYjN3BKqJqR8te4PrsQjviq+MxhRmrVrs59I0DwJi97Vlxl9ygwJVVynJFistv0HNqVz3jBWpkA31jHZkNLUFoREESdhZ/vzRZ45/Y9A5UA25f8lr+hDnSo5R7lub6zMvCx6DZiUcqS7iWxBgtFdl+pstI4jJ46SP/nYmr365yd34W1o1CakNr/UEQKMShy4RDXqDec5WYBRFYB8k9RQEF2DczTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yb5NkbF0AIHjMVM5nJclIlYji+pt21Kic/brrPQSmTQ=;
 b=kGDkBw2Lx4M1u7NsFJX8t/Ycw/PkONPRtW4XF/O4fUM4ZmPhhkM9S65QqR241hbMhm04v5P2A4ZCUAFgo57XH5rJfNZJ/EPJ0H93vTzqccEoWDDOKDnDBgx9imPa9mvMh3r9OHXFMtimz/xEwXDbW3x8zj2vNxDKp8C8a9g3Q4MSGzSc/q6xyUTpT9aaoFJ/ZP+WU90Rts4W8zRfJ6r7zMLNIX73KUpu8n5lv7Tp1RbbLtR6qQWNSRbDdy8ANnqaQxxZEwtmtyDSQvooPW7OEpGtUDxf1WyaGylG9H0j4rRzbTJVknnR9Ucf4+WLWRVwPISWuOoH/+AMalE6NM8LpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yb5NkbF0AIHjMVM5nJclIlYji+pt21Kic/brrPQSmTQ=;
 b=piZqDUIDUNGCbyqT36E0dcFSnvSCYgmQpuT06pLAFbKxNP0e4aiQa45KuIRSSedXFTmWXocKPO+k4QjTZW4RIyx2ebABLAM+XNG/jHNq9nNA4/Sph4Zcjfn2CsVA+8VVNvp5I99mA0//N0qhUBOn23dlQqNH3vVsnQlwG5z7cQw8WJ25AsF8yuh2L8J/PmtWZFxG2L0azLjGGfM6eZWtbF4pukVH1czwHXVAdu3lvyxuZw+QqKYRgLqcYtOfbAd+gyEkdSACiGJSN/ZQ/l4mFbqEHvRwCwjZczGyg724obi0gGOTUwVIwoeCWhr2Tqk/KfxZDzXEPhh9kc9L3djnDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.15; Sat, 30 May 2026 03:09:59 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:09:59 +0000
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
Subject: [PATCH v11 03/22] gpu: nova-core: Blackwell: compute PMU-reserved framebuffer size
Date: Fri, 29 May 2026 20:09:34 -0700
Message-ID: <20260530030953.740561-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0045.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: e14dd232-564e-4669-eaf0-08debdf8ef2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RWJkl+ujYrairpCAott/wg8NPdukfkYtAzuQUhHlY7/i71lBVNtCcxINAwbZsmYL5qrVCR+bD6RMjh7EmlHgqC2NNmn0Pr4ZNNP2QduGouskaoWynmz2WaWqUZ4NyLnLbnfkKoSmj6rWYT52Rm2jDyhadMWIb8QxqWk0M+9Onr03pJs7X6BqNhfa7eo1He0J5Jn09hvPTgX3edWtgqU/bAr6Hp2OIQD2766f4E6cYwlqvSu+X6PwrTNz/J2lxLQXZ+Ho+eY1U8oNqJ8/Rl7m3xMab2usf35TLUroQz/8TXUtJYV4k9vsHMp9K0JeakFDZjaGXz1R6z5Lw/2sgCoyjnvyP4x5nly13U4PDKj1W7jztyUKMwMTnytwMsBOlhDxgRUnNTJRgTey6qiyMcD0FcMktbJgyjhUWBDOp/Z7X/4T0HCEY2hvFa6M5lJe7jIx5yIxSdVzahkN1ueH4GgffurDQVND8/C322Q6gp+s7RGjO/qrSLSalWLrFxw4Bwj/8IJPHRkNyBzILzJBxuVTHzQplAMofInv9lhOe90bh0dloorRAcS3hKftOCR04FH1XpvpfgI9zB3yl2aJJynehD1nJQRQxkmXy2/gABPXDG7BzjlsUfPdhvwVKk4Jou62foQJLq5EFk4VddN8m+dF6sQ5FYMFs0FM8fzLjA4Q+gabFISuPqSyW8j5AA3f3Xge
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kdwv6xIKXK7C/R3zbQ2Zxv9NDhOzsxJJ3bFLBRCd8eUjlLcdPCrioNh6dZ23?=
 =?us-ascii?Q?3tExjBNCZrkdJEx1IBsGkpETCtUvG984xuHceuQM5/9qjkJQ5sFUvTCSCmdB?=
 =?us-ascii?Q?MvSNVS65GNhjtubVeESu3DENgrwvbLky4YiFB2S7jIOVr1i1O7UQcWbP0rFB?=
 =?us-ascii?Q?4wvwGo6Ka0cPsEJPHii4DOZOtOTBr/7zCMwf2Ja7BO0j2sz5t9+A7FRUpNY9?=
 =?us-ascii?Q?q5hGnSPjj7thYhw5EFWT7dGm2vzTWNBXnuqSn2aPMZa5//aUBRypaHD7txvM?=
 =?us-ascii?Q?Hdgo3xhj4NaNKLVUOqiKr9ShmPnUV7FTgwKdkBjhxyBuu9RRpbPrG+1P6mXU?=
 =?us-ascii?Q?B/Dfslhvgt9tJWkKomYawiBGrw6cc1s21q0X+jNZsmQk2C1AHEF/WNyxEK3v?=
 =?us-ascii?Q?dwfG3hxcZRsuUJoEsIvaP/4muvVi+TTQVeVw13sW1gm+4NpP7D+IRvtxI6zS?=
 =?us-ascii?Q?3G20M+zusKEP+tk2G6QG3ZEcvKmF+jI5s+zvU0RNi2xdlbp1PYXjx5NEEvip?=
 =?us-ascii?Q?XdA6Oy97WbGEPvjP2XIXGqt2H7waMyRAdzS9GlN/9/86ZOrp1VVn6zMvbxlb?=
 =?us-ascii?Q?oV54UTTmbNJHvqRZfsEm8euiRppVAyyNDVb3picXxixTKre3ifzz5xhqJqZH?=
 =?us-ascii?Q?KSbmhzW/p+4MA+LD5HFcy0HDaw2F1SKwKg6BQYQdYZeJCy/I9h1q9RP62One?=
 =?us-ascii?Q?hQsKnuzYF+1p/sn0bYLE45emL5DoBTq1blkl7SdpdIMTYqOItzQC7cVl3Qqu?=
 =?us-ascii?Q?CS7ynKsEZ9kxUkCzOc8+H3qhB293YIDE1EJUeH3rDtlbXMUWckmBKYMdtFQX?=
 =?us-ascii?Q?rhajcKQNpiEWPhSo/i5EhqYqDQ7M5kq5QQa7dTrbGmCd16bJzwydVm1Qc13/?=
 =?us-ascii?Q?zRVceMI7fQgeVjs724VQ/yjNpL+BnehEKenivNQsEjCs6rytJYSIEmQIYkl8?=
 =?us-ascii?Q?/Q5tc/9nPuLuOANDyz9l6wZp0O0vg0e5peqHoQ7INeQudzxEO5dVCWe4Fa6r?=
 =?us-ascii?Q?DAIU5cFxwGL3ucWWEVXPc/odAgDExJkXp1/2639BGjGueBrzTiuRsGpgbRgY?=
 =?us-ascii?Q?XEaB5XqLWOqYgjofvMd3TUwHDVBSB7A0lp/GXfurH0UDUNWJI9oR9/xwn99R?=
 =?us-ascii?Q?14YyXlz8B1cMV2ezwEUaM6QLZFp2TvVfI4WNP2iPYeaZwePA8ruS+/9FL/t0?=
 =?us-ascii?Q?+bQJhdRQcDOdFtrxbpr3H/DkVwJUkL0YNcRdOvoz9c/IuS4aki3/xCCNlRXz?=
 =?us-ascii?Q?Bw8nzw7iZtvPxpBQtThtCG/49xKO09U1Z+tvQk5lKWXsnbOPJP3xZ8UwlqYe?=
 =?us-ascii?Q?onpJa3yWxcWbdaBYkod7A2PviomRUt+8cw0wkg4iC0VZW9BPE36tCzcrIN/s?=
 =?us-ascii?Q?GQyzz9imMPAcW0amZVEL4AdyKMJisjz3qHJ74ERrdu2D9lQypFdX8ZIblK+Q?=
 =?us-ascii?Q?XAjFRr1/jGx+geg+L6e7b8ec6bJGyhRhb+8yVTn5cK/SZVAd5nq8cYlCofvy?=
 =?us-ascii?Q?OH3/2Oqrqp/LNYfvYkUfkY9jt8MkoAJlyf8bStJjPVsBYUNW3+dmdaLeTbYD?=
 =?us-ascii?Q?vs5ZuQjGuox81eKm7/xZof4kYTsajbJ0Epy2UKfFeF3PZkAvZOfv2uZaV2Qe?=
 =?us-ascii?Q?iso47lYI1rW9vJdYYrA9bXSj3A/euCdiCg8dQPAG9Y+HiL1xNc6BAMqoKLmV?=
 =?us-ascii?Q?zmTksgN5x3T9GYsM0NRXKIFzzBLIlLH6dqTh0zigfHfOQaa/vNIRK9KkORpA?=
 =?us-ascii?Q?mR3HQCr0Gg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e14dd232-564e-4669-eaf0-08debdf8ef2e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:09:59.6755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QvSa7aK8QV1bmc4d/8FBBXGGtRyHbOcwbR4xwRgJKaIXhcZPp/uzfrdB0yRcSHCjQ93HBFxL3G7aQQd5TVCRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863

GSP boot needs to know how much framebuffer memory is reserved for
the PMU. Compute it per architecture: Blackwell dGPUs reserve a
non-zero amount, earlier architectures leave it at zero, matching
Open RM behavior.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           |  3 ++
 drivers/gpu/nova-core/fb/hal.rs       | 14 ++++---
 drivers/gpu/nova-core/fb/hal/ga100.rs |  5 +++
 drivers/gpu/nova-core/fb/hal/ga102.rs |  7 +++-
 drivers/gpu/nova-core/fb/hal/gb100.rs | 57 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal/gh100.rs | 42 ++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal/tu102.rs |  9 +++++
 drivers/gpu/nova-core/gsp/fw.rs       |  1 +
 8 files changed, 132 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 1fb65d4eb290..d7a4dc944131 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -165,6 +165,8 @@ pub(crate) struct FbLayout {
     pub(crate) wpr2: FbRange,
     pub(crate) heap: FbRange,
     pub(crate) vf_partition_count: u8,
+    /// PMU reserved memory size, in bytes.
+    pub(crate) pmu_reserved_size: u32,
 }
 
 impl FbLayout {
@@ -265,6 +267,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             wpr2,
             heap,
             vf_partition_count: 0,
+            pmu_reserved_size: hal.pmu_reserved_size(),
         })
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index 8b192a503363..e6ac55bba9b9 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 use kernel::prelude::*;
 
@@ -12,6 +13,8 @@
 
 mod ga100;
 mod ga102;
+mod gb100;
+mod gh100;
 mod tu102;
 
 pub(crate) trait FbHal {
@@ -29,6 +32,9 @@ pub(crate) trait FbHal {
     /// Returns the VRAM size, in bytes.
     fn vidmem_size(&self, bar: &Bar0) -> u64;
 
+    /// Returns the amount of VRAM to reserve for the PMU.
+    fn pmu_reserved_size(&self) -> u32;
+
     /// Returns the FRTS size, in bytes.
     fn frts_size(&self) -> u64;
 }
@@ -38,10 +44,8 @@ pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset.arch() {
         Architecture::Turing => tu102::TU102_HAL,
         Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
-        Architecture::Ampere => ga102::GA102_HAL,
-        Architecture::Ada
-        | Architecture::Hopper
-        | Architecture::BlackwellGB10x
-        | Architecture::BlackwellGB20x => ga102::GA102_HAL,
+        Architecture::Ampere | Architecture::Ada => ga102::GA102_HAL,
+        Architecture::Hopper => gh100::GH100_HAL,
+        Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => gb100::GB100_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index 2f5871d915c3..0f5132aa9c31 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 use kernel::{
     io::Io,
@@ -67,6 +68,10 @@ fn vidmem_size(&self, bar: &Bar0) -> u64 {
         super::tu102::vidmem_size_gp102(bar)
     }
 
+    fn pmu_reserved_size(&self) -> u32 {
+        super::tu102::pmu_reserved_size_tu102()
+    }
+
     // GA100 is a special case where its FRTS region exists, but is empty.  We
     // return a size of 0 because we still need to record where the region starts.
     fn frts_size(&self) -> u64 {
diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-core/fb/hal/ga102.rs
index 3bb66f64bef7..17a2fef1ad44 100644
--- a/drivers/gpu/nova-core/fb/hal/ga102.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 use kernel::{
     io::Io,
@@ -11,7 +12,7 @@
     regs, //
 };
 
-fn vidmem_size_ga102(bar: &Bar0) -> u64 {
+pub(super) fn vidmem_size_ga102(bar: &Bar0) -> u64 {
     bar.read(regs::NV_USABLE_FB_SIZE_IN_MB).usable_fb_size()
 }
 
@@ -36,6 +37,10 @@ fn vidmem_size(&self, bar: &Bar0) -> u64 {
         vidmem_size_ga102(bar)
     }
 
+    fn pmu_reserved_size(&self) -> u32 {
+        super::tu102::pmu_reserved_size_tu102()
+    }
+
     fn frts_size(&self) -> u64 {
         super::tu102::frts_size_tu102()
     }
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
new file mode 100644
index 000000000000..c78027c26a9e
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Blackwell framebuffer HAL.
+
+use kernel::{
+    prelude::*,
+    ptr::{
+        const_align_up,
+        Alignment, //
+    },
+    sizes::*, //
+};
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal,
+    num::usize_into_u32, //
+};
+
+struct Gb100;
+
+const fn pmu_reserved_size_gb100() -> u32 {
+    usize_into_u32::<{ const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment::new::<SZ_128K>()).unwrap() }>(
+    )
+}
+
+impl FbHal for Gb100 {
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
+        pmu_reserved_size_gb100()
+    }
+
+    fn frts_size(&self) -> u64 {
+        super::tu102::frts_size_tu102()
+    }
+}
+
+const GB100: Gb100 = Gb100;
+pub(super) const GB100_HAL: &dyn FbHal = &GB100;
diff --git a/drivers/gpu/nova-core/fb/hal/gh100.rs b/drivers/gpu/nova-core/fb/hal/gh100.rs
new file mode 100644
index 000000000000..c122ac2091f8
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gh100.rs
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal, //
+};
+
+struct Gh100;
+
+impl FbHal for Gh100 {
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
+        super::tu102::pmu_reserved_size_tu102()
+    }
+
+    fn frts_size(&self) -> u64 {
+        super::tu102::frts_size_tu102()
+    }
+}
+
+const GH100: Gh100 = Gh100;
+pub(super) const GH100_HAL: &dyn FbHal = &GH100;
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index 22c174bf1472..1755bbc27866 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 use kernel::{
     io::Io,
@@ -39,6 +40,10 @@ pub(super) fn vidmem_size_gp102(bar: &Bar0) -> u64 {
         .usable_fb_size()
 }
 
+pub(super) const fn pmu_reserved_size_tu102() -> u32 {
+    0
+}
+
 pub(super) const fn frts_size_tu102() -> u64 {
     u64::SZ_1M
 }
@@ -62,6 +67,10 @@ fn vidmem_size(&self, bar: &Bar0) -> u64 {
         vidmem_size_gp102(bar)
     }
 
+    fn pmu_reserved_size(&self) -> u32 {
+        pmu_reserved_size_tu102()
+    }
+
     fn frts_size(&self) -> u64 {
         frts_size_tu102()
     }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 33c9f5860771..919d3ab00075 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -247,6 +247,7 @@ pub(crate) fn new<'a>(
             fbSize: fb_layout.fb.end - fb_layout.fb.start,
             vgaWorkspaceOffset: fb_layout.vga_workspace.start,
             vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
+            pmuReservedSize: fb_layout.pmu_reserved_size,
             ..Zeroable::init_zeroed()
         });
 
-- 
2.54.0

