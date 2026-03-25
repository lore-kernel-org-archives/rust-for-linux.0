Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011016.outbound.protection.outlook.com [40.93.194.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B5C31DD96;
	Wed, 25 Mar 2026 03:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410817; cv=fail; b=F2zGMOGKvpa3xxAHQSaLtdYku3mQ85oK5ZiEeHYiq+reA67PY5qNYUolsDWK+DFn8fh7DP9ZnSNzpaU0NW59Uw/sn6vswlk+aGCXwwDWDNOpvli6JFhKdE7dIMWE1X4fyTmF15LgGVd0e4acOs0DFBt0X3xKqf/ys/B3EFs1iGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410817; c=relaxed/simple;
	bh=Ufz7b/XV1g//18kWIUv87DdzYvjoXfoVha6VKFVrgnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LVbOBlXV47pJVIRCFKxcpHG2D7Hihma1RsJKFOaqox0Q4umSNZNbpG/BxSkotNbF1tut/MGaq52g1fnGRpw1jknI4xiq+Jfr4jEJIaYhsrBP+7Dp5dNBvlNi1V4khRmT+AIerjBsxjay/M5EcNgv5ZdWbbiuK2Wecj0CZnfB6NU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mwMxqSmP; arc=fail smtp.client-ip=40.93.194.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mwMxqSmP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWQ/t4KyugFpSLZc5ocoNNYF2WMvQ4ZqwAOvCFqoBaf8RMZNyXHZ/6srdfnMyX8Z1T5D4npTCCm+HxCxr/ftOMU7Cy+oxzGm0qceRyuDBKK/GD/knHgq7P4Jwv5+4STrCuIkLYNKgXDZMbV5lkLq76X/WT7YdZZO6SlhePbc4AcvhpRcG0sEqAG2AuD1TQQT/p3Nj3M18XUHnkpAqy7ts6uDZG+hBP3ULvN2NW5GtsYQXsytNtn+6qzODEWsjOdTlksHycUoVdz2eWn1IwQvZTYEocZwZVDsvpAqlxtUvvxI+RwQovUmhQzUNKSi/1JPT7TYtEtEXnAx0z8L6Kg4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7RkJngPWVDn3zMnW4gjU7NsTWpAbeVZ9uQC40Aafjc=;
 b=f0SiGyw52Q3joB1PMyDtWunV6mHbfa+zjA1UluO114zSmLiOfxEsNBlevSM/Hy899fF85NY/DX7Db8lz0G3Ff2PHyyQi0sY/xi3Fvdmj9CJOzush9Bq4svzaq+NL8ohl1UzhRizOMJRjItcnN6Ivbj21hnRU/uX5H4Ey8fFNS9WcQoMHPENlJVHGlosxg6sUPWMEyw6hk3EGr5Be2mc0tkL5bVsBwCcyavG8sNmK7gqvoknmkeYR5IV8+V4Nsy7/gBe1jaOZhcOXY/pHOhnN0R9X060E60/QSIOtko2FyPINSyz8JHKDiM5OTS0FGsDnWw/Gj7GPjyf9Fa+o9zYOTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7RkJngPWVDn3zMnW4gjU7NsTWpAbeVZ9uQC40Aafjc=;
 b=mwMxqSmPh6Mi5VuievgUObPTxRGMvW004aKMZPDVgK+gcdV7cFGbEQY0wj9n/TuvpKMVJMOa8vZOH4AnoJQhl64/VUzyTlaqhOGQvC9zcx60afqtG6wvBhK4WtTaxZpUIyRzvigcGT+PvvALbK49ccr+3PcqqJEaMbY9QKTrsJEfPWTSG/OJuOUQaU6IwsrW1oJ2RAVDpV//82+LuHZdV7v3JpFUh7ebMAAM1oLSYiFo6MSYsjUl6UoYBM/lOnsHYWdGJbHdyxF8IiIa1XGFBIQfVs0IJ/nFd+zjMQLPIgaR5jdtl4rGjJ+tT6EEy/Wy5Kn4ct4RPhtCotqFVuozLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:17 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:17 +0000
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
Subject: [PATCH v8 25/31] gpu: nova-core: Blackwell: use correct sysmem flush registers
Date: Tue, 24 Mar 2026 20:52:36 -0700
Message-ID: <20260325035242.368661-26-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:254::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c883340-ccf7-480f-67d0-08de8a220c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	U/+G+pwUKTNmytjiziHo+XBGp2Qk1n69jq8DBBIHajApb8zU/ggi6LqyATxab3p2bQ3y17XDMKCWsmujQMp9+aHCMKuxViWOD2gFvMGyrt7QbQ7bIBAMaq1MMr9Cz5YZb9Shw4fAbUq41OrPoIUooG7zDHAPsRW0ID2v5/Q1ADh6FUKLfmTOM/uUram7TYzdEpNy/W12l4PTLfM+F/udSg2FC+c4r/mkyB8S2BnnVNghJgfC/Uf1i9WokkxMFfmH7h+exYKpdV31sQimWqOkqrd6zp+PXHoH0mReshj8YeAlCD6T4STp6h82y325h/SK/B8m0Pu6YqyK/S5Jrn3aLk0SnFIppSA0qzTj6sjirCldSQwYHsIK5jlJIDXFdk3uc7GHqeCiTo2wge16Pn7Vo2cU5mmsxVNLFvHBD+iJKqNH0b4bwTbvcXhPHMBWXEjCiYiWk2/XwfJoAlkZ1qXTWowaSzUckGik7zsYB0PQaO0sYXG+flnbdlCX5HrqFmRiWGiMuSXKtABLgoXRYoT5UMZWBTvkqH84XuABvhFzONR7d+yJJHdxtMiQBc0FoV6HjYoi1NKihW6nzjwW3pfVjVnnEEcvKfnPDA4jNSZ4FoJ52cBJCHI4Sj4ti5EWBfSswTkPrNbXi3AshlJDN39Eorf1W7tMIZXnIhoBm2OLU4lJldCc8Y8j0R9XK7LiWTigKJ321gPgB7MTYD2BmtNfx3mr4YpmpNIuPhDmbZbsFiE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dDiSHr7GuTnWb0pU7nf9f2uH3gZpvT2b5rzn/NT+gFm3dpa9lILZDjM3Yzj2?=
 =?us-ascii?Q?qgMr0UukkBcUJ0euxhKCCmV/nXz49dgXqKC5wnKeL56hCZnFSn8lORsJVAMs?=
 =?us-ascii?Q?b3CSKd+Q+P2SMZcrq303S0fJFtgqhbYT6q+66K/Zd83TsnABr2XfNCwEps2K?=
 =?us-ascii?Q?kWaAmbBWcBPtv/erZiTxU4o6RbRZTafS2C/ckAN4c58N2NoqvFsBrt25lWYE?=
 =?us-ascii?Q?2LsCgCsaM2XIrOxMXgTVEI+PG/JZulxXfGry/B1SAmKBVi/PpNI4Z87CM97L?=
 =?us-ascii?Q?666HYGNmaeCnjqg6HtU4AUG7jVhsuQPPcCapn3aMVzXLLZ9IqwWtgAUeuYOy?=
 =?us-ascii?Q?yJQjmHnjQyjFUli2wzkqPrGqq0ZG29cj/exlmpbs57JFG8IJKKmrqS2KNGSd?=
 =?us-ascii?Q?GA6YghZKxV1MafceHOIc8eumYOo//h2j3cWWbzQWxYJLpVQuUizrwyhrG0w/?=
 =?us-ascii?Q?Tva8eJOy3TuaA7rYaZr54BaFw7dCq1FJL7rN0eBYVAmdclTyHVC5PpHJink1?=
 =?us-ascii?Q?w+PcgXWOt+Ze3+ds8G7eQI0Xh/iX48Cb690CW4u9O6u2gvZfo/WiYjiYCtpN?=
 =?us-ascii?Q?faXG4Jo6JD367gqgXBepFnqtNON/3Kuwqu2HCgji0YIunLP52F01y0pheA17?=
 =?us-ascii?Q?yWnDY61w5cdcivJYxcq5RFoECClODJLl2xlJIMZivrgd1NPfVFy3EYxpqS1V?=
 =?us-ascii?Q?Yx/P2SaovEfWkVrhlVDIMqBHpBa3T4nEt52WmiwD1qGk+fkM9v1qgn1Vh6kS?=
 =?us-ascii?Q?cW79kx//3Giv0nifzGXe/jRFG9RnbtgelL+9itkHT6NXwPy1c0UFbnjGdS4O?=
 =?us-ascii?Q?+th6BRTVzu3UI0YKcA0KSNPzpdsVqscaeqzcLJxFFrDaWcgbmNHvnE1GPdmL?=
 =?us-ascii?Q?8Z5Vvn421QIx6PMtjYRFc9B/+7k/DVlX5RwHe1qZOe8uc5jK5IYT1oWBhRwe?=
 =?us-ascii?Q?lFu65VtsB50d2rzfVPnGWpKGeXSrb34sDOjCRdA5o8HmwAtJxtKXA/at12v9?=
 =?us-ascii?Q?Um0JbM8h4r6kVh1s1eCQsV6+TFWzIwHj8B1unSD4InI4SWUpFLgGWZ/6/USL?=
 =?us-ascii?Q?JKPn0mXsjqaql+ADE0iiR7YI6JTkQ1fmBBFWKWCCwDYXZE2SBHkaSbUqhib1?=
 =?us-ascii?Q?jLKe5dS5WhKFHeW9SPjZXzUCPyBHVjYCXByC6KeCkA+3g3DyegHnVSqMzctD?=
 =?us-ascii?Q?VLMNh/sRD0PZFGEAzbSm7N9p26CH4NuWWY22flhB5qd7eu0ATfJE8Dkxi5sA?=
 =?us-ascii?Q?m6ClU32Oq06SZyT+agsVGOm6fgLvYajtk7kdWXdrXjAZxiiVpzeV1Y66mpKb?=
 =?us-ascii?Q?A2b/wfMSpHPfQ3AxVOAJhZxAYbt4QIs5TPt5UcMmPjtDDJCxCBvXi7EdwSba?=
 =?us-ascii?Q?QQHuLuUKjmp/KrqI/SNNi8k2GvX79qsVOYUOx1vHybWHeu2LF1F4e/m0Yfdd?=
 =?us-ascii?Q?dOXO8Sacfox9cAoJjXZjQK2oru6XQvbZHMFoaizrH04kNh24fP5fLL8684EX?=
 =?us-ascii?Q?arqQDsb19QU84FRQP1EYmeymzzimWmTP9Inz92AEjb9GwaOCkDG9M1Qr+tfw?=
 =?us-ascii?Q?CTxJAs5gC/WFlspfPUtwY9/h1jjHEgWY8FLWgc+4GODPR1WyrMVX3o8kpG8m?=
 =?us-ascii?Q?I8IE+HI3/lB9sY9R7Gb+z6SeDqKvaZeKbXg805hnffEBOrE6/nYB0nSkULpd?=
 =?us-ascii?Q?prCdalqxF1ghfQDWZJ1AmqbfHkuuDnPbWtzkRvgcXeM7DjZ+SiavnwS/0mNV?=
 =?us-ascii?Q?ISCsSGaAeA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c883340-ccf7-480f-67d0-08de8a220c45
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:17.3890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqTNDBMKrQ8FVK+y4b96shPUfgM9Zwmyx1jdBCVxb9VRbQypxmysVzTxMJde1LZZyesEhhkjHEuI6DJ0fgvTFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327

Blackwell GPUs moved the sysmem flush page registers away from the
legacy NV_PFB_NISO_FLUSH_SYSMEM_ADDR used by Ampere/Ada.

GB10x uses HSHUB0 registers, with both a primary and EG (egress) pair
that must be programmed to the same address. GB20x uses FBHUB0
registers.

Add separate GB100 and GB202 fb HALs, and split the Blackwell HAL
dispatch so that each uses its respective registers.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb/hal.rs       | 10 ++++-
 drivers/gpu/nova-core/fb/hal/gb100.rs | 47 +++++++++++++++++---
 drivers/gpu/nova-core/fb/hal/gb202.rs | 62 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs         | 36 ++++++++++++++++
 4 files changed, 149 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb202.rs

diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index ebd12247f771..844b00868832 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -13,9 +13,14 @@
 mod ga100;
 mod ga102;
 mod gb100;
+mod gb202;
 mod gh100;
 mod tu102;
 
+/// Non-WPR heap size for Blackwell (2 MiB + 128 KiB).
+/// See Open RM: kgspCalculateFbLayout_GB100.
+const BLACKWELL_NON_WPR_HEAP_SIZE: u32 = 0x220000;
+
 pub(crate) trait FbHal {
     /// Returns the address of the currently-registered sysmem flush page.
     fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64;
@@ -46,6 +51,9 @@ pub(crate) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
         Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
         Architecture::Ampere | Architecture::Ada => ga102::GA102_HAL,
         Architecture::Hopper => gh100::GH100_HAL,
-        Architecture::Blackwell => gb100::GB100_HAL,
+        Architecture::Blackwell => match chipset {
+            Chipset::GB100 | Chipset::GB102 => gb100::GB100_HAL,
+            _ => gb202::GB202_HAL,
+        },
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
index bead99a6ca76..831a058a388b 100644
--- a/drivers/gpu/nova-core/fb/hal/gb100.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -1,21 +1,59 @@
 // SPDX-License-Identifier: GPL-2.0
 
+//! Blackwell GB10x framebuffer HAL.
+//!
+//! GB10x GPUs use HSHUB0 registers for the sysmem flush page. Both the primary and EG (egress)
+//! register pairs must be programmed to the same address, as required by hardware.
+
 use kernel::prelude::*;
 
 use crate::{
     driver::Bar0,
-    fb::hal::FbHal, //
+    fb::hal::FbHal,
+    regs, //
 };
 
 struct Gb100;
 
+fn read_sysmem_flush_page_gb100(bar: &Bar0) -> u64 {
+    let lo = u64::from(regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::read(bar).adr());
+    let hi = u64::from(regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::read(bar).adr());
+
+    lo | (hi << 32)
+}
+
+fn write_sysmem_flush_page_gb100(bar: &Bar0, addr: u64) {
+    // CAST: lower 32 bits. Hardware ignores bits 7:0.
+    let addr_lo = addr as u32;
+    // CAST: upper 32 bits, then masked to 20 bits by the register field.
+    let addr_hi = (addr >> 32) as u32;
+
+    // Write HI first. The hardware will trigger the flush on the LO write.
+
+    // Primary HSHUB pair.
+    regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::default()
+        .set_adr(addr_hi)
+        .write(bar);
+    regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::default()
+        .set_adr(addr_lo)
+        .write(bar);
+
+    // EG (egress) pair -- must match the primary pair.
+    regs::NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_HI::default()
+        .set_adr(addr_hi)
+        .write(bar);
+    regs::NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_LO::default()
+        .set_adr(addr_lo)
+        .write(bar);
+}
+
 impl FbHal for Gb100 {
     fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
-        super::ga100::read_sysmem_flush_page_ga100(bar)
+        read_sysmem_flush_page_gb100(bar)
     }
 
     fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
-        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+        write_sysmem_flush_page_gb100(bar, addr);
 
         Ok(())
     }
@@ -29,8 +67,7 @@ fn vidmem_size(&self, bar: &Bar0) -> u64 {
     }
 
     fn non_wpr_heap_size(&self) -> Option<u32> {
-        // 2 MiB + 128 KiB non-WPR heap for Blackwell (see Open RM: kgspCalculateFbLayout_GB100).
-        Some(0x220000)
+        Some(super::BLACKWELL_NON_WPR_HEAP_SIZE)
     }
 }
 
diff --git a/drivers/gpu/nova-core/fb/hal/gb202.rs b/drivers/gpu/nova-core/fb/hal/gb202.rs
new file mode 100644
index 000000000000..2a4c3e7961b2
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gb202.rs
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Blackwell GB20x framebuffer HAL.
+//!
+//! GB20x GPUs moved the sysmem flush registers from `NV_PFB_NISO_FLUSH_SYSMEM_ADDR` to
+//! `NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_{LO,HI}`.
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal,
+    regs, //
+};
+
+struct Gb202;
+
+fn read_sysmem_flush_page_gb202(bar: &Bar0) -> u64 {
+    let lo = u64::from(regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::read(bar).adr());
+    let hi = u64::from(regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::read(bar).adr());
+
+    lo | (hi << 32)
+}
+
+fn write_sysmem_flush_page_gb202(bar: &Bar0, addr: u64) {
+    // Write HI first. The hardware will trigger the flush on the LO write.
+    regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::default()
+        // CAST: upper 32 bits, then masked to 20 bits by the register field.
+        .set_adr((addr >> 32) as u32)
+        .write(bar);
+    regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::default()
+        // CAST: lower 32 bits. Hardware ignores bits 7:0.
+        .set_adr(addr as u32)
+        .write(bar);
+}
+
+impl FbHal for Gb202 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        read_sysmem_flush_page_gb202(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        write_sysmem_flush_page_gb202(bar, addr);
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
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        Some(super::BLACKWELL_NON_WPR_HEAP_SIZE)
+    }
+}
+
+const GB202: Gb202 = Gb202;
+pub(super) const GB202_HAL: &dyn FbHal = &GB202;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 183915a3bb31..e70be122e1c9 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -116,6 +116,42 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
     23:0    adr_63_40 as u32;
 });
 
+// Blackwell GB10x sysmem flush registers (HSHUB0).
+//
+// GB10x GPUs use two pairs of HSHUB registers for sysmembar: a primary pair and an EG
+// (egress) pair. Both must be programmed to the same address. Hardware ignores bits 7:0
+// of each LO register. HSHUB0 base is 0x00891000.
+
+register!(NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO @ 0x00891e50 {
+    31:0    adr as u32;
+});
+
+register!(NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI @ 0x00891e54 {
+    19:0    adr as u32;
+});
+
+register!(NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_LO @ 0x008916c0 {
+    31:0    adr as u32;
+});
+
+register!(NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_HI @ 0x008916c4 {
+    19:0    adr as u32;
+});
+
+// Blackwell GB20x sysmem flush registers (FBHUB0).
+//
+// Unlike the older NV_PFB_NISO_FLUSH_SYSMEM_ADDR registers which encode the address with an
+// 8-bit right-shift, these registers take the raw address split into lower/upper 32-bit halves.
+// The hardware ignores bits 7:0 of the LO register.
+
+register!(NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO @ 0x008a1d58 {
+    31:0    adr as u32;
+});
+
+register!(NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI @ 0x008a1d5c {
+    19:0    adr as u32;
+});
+
 register!(NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE @ 0x00100ce0 {
     3:0     lower_scale as u8;
     9:4     lower_mag as u8;
-- 
2.53.0

