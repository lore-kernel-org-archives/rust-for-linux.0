Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010020.outbound.protection.outlook.com [52.101.193.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12313BD62A;
	Tue, 10 Mar 2026 02:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108749; cv=fail; b=SnMRJ+KSkj8AT+sM6cD5YuEetRUcVT4JrbVs0G2o8l2XAdhwaKoGMFCiTJx2lCirS0jfe+mtKETbeITnFlAaL1PPvHwm3cEWzPZpZ2kc3vdi1K2TEQihcDUPRdx7ZVmR9j9jgMkD1vEUAGbyAWDwYcMIhVtuDCfvvfK9PQrXvi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108749; c=relaxed/simple;
	bh=LNBWEyiR6gQcJbm619zpAlVn0mNOZRzBoRtEbFO69J0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j3BINKiP2GddEKY3DoPUwhzPcaJe7YO8G+L6SswVG1nJB9IMaltqMn1p4vPuhRu/+UROi3YJwTtaMP8bLMzizrjscqeN1Uafd5Txh8W1IBE6vOskswnynJN21T7CLEGUHtcVPojse4WOVD95/9Xh3gPPgpzOCp2wHmHIpHXTx60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gHrdpbrY; arc=fail smtp.client-ip=52.101.193.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gHrdpbrY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jf2GUTRtEk9CzwG1LzsLr0VfYgSYDmxBr3EvdtQcq4NFvQStSTbWxUuGycxGYGTz4mNoduh/kxYeo+hJkEPmxZPOa4B8gLrnHpUjJM1pO/x/n8gJ6tPdJCmfpT7vblm3TabOByAp1XUg9yxQFujJZDgqhfzcFr8b20AtmZAYm/Ai1OR1uDN+919AvbwjVbYjQWldxDwbjnm3+mrh4P1TRSXGmgK8saEPkGuRT7dgIcEHKcUvK6r7UhVBv28W65BA6j+r5r1YT5Ta2cYVVO+3jwQk7HSe0QBtNAZE5RhpK2dzY7/uwnpmLmY58SNX3EJeMowMTXrpb78RL9acJ2SfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AuzowustgMA1IFn1AiLhaYPGzSlVvtbi9CwJn5h0q0=;
 b=FIXjR/0HS1XKB26uB1xPV7jWXZoOHlCnNhBe8v/yYgurjHRg3Q0pp6fsHZ9lmzQKiBYnqywYYCeqiLtHYNBDAwjIGVO2xSuSu2GMLoKC0RY6ld5QqpeHc1s1Lr3jwwGIRsTzOYG3YTiGApkgfnG3zg36ZAj0kFz1zZNfzve34h8ub2Mbo2DXb31qrkDtaClNusRDO4H39Hq1ho9sHpfGiKCVdhk/Wyh4Q1sb0XGqo4gSYwn3tzBZbushc880EeRv0aAkFUnRJ14RRwqSQIFXRWYy5Zwqn/agpO+AbWCPqk7chNBsVOErBXDLiIrVdS2i2ayJDfg+2O1rJPhRdSmMiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AuzowustgMA1IFn1AiLhaYPGzSlVvtbi9CwJn5h0q0=;
 b=gHrdpbrYUrQNFKfadftcGmOQGE0B7j5hEnH6kxIzz048Hu3rtupDHdOSVJrg6Rr1bwmEBUm7eB1vAtorj96U9oUVx0Fj2+K1C6/xJZ/Lmr4epkiqQjAWYb3lbxIdJZIODsMsmPJ4+KEx1O2aSw6dhRdmR8Fvzkg44CXtUUy21iQtOFCh/2BP+sbQp1Vu5CKRv3W5Zx/ZqKhfnsbt8oxOjmmYgqXLmlr7nGXxbP0JyYnxvaGxXUVTThOIXaEq8mNAxliZXYpAYnLkAm1fKr5ObBtMpe0UrJcBi/hRH+kaBi4ESW97SHv611SJt7PjqcAmkNpD4z9FwYG0IoXf1oTn4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB8070.namprd12.prod.outlook.com (2603:10b6:8:dc::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:12:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:12:08 +0000
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
Subject: [PATCH v6 29/34] gpu: nova-core: Blackwell: use correct sysmem flush registers
Date: Mon,  9 Mar 2026 19:11:19 -0700
Message-ID: <20260310021125.117855-30-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0174.namprd05.prod.outlook.com
 (2603:10b6:a03:339::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dcdec15-26ab-4e4a-fff3-08de7e4a6e4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	FRSncfZY9n27OAHxnx4n6ZAs6t9kq5u+N95+1PRTjuqsCHdrcUzsEF3sgIw8FwvkB1jDthbNL/+i0i8zROkAlhZi46oq8PLMJnDskA+16d7524fQHfDSbe4C7XapzjI+KoAV8XExezyZgSdOdl8/3aJ3LyXx3uhZMJAex9v5xOtx/KeT/lWgBqBOZIW9rkZnxdsNYeLfoTjIfJFP4xfZxWs7WQue9n9ZgW5xvpGXUaPDaoi/jo5kOpVRGfT5yy0R4PhLpFA562MsNtgQCzJBQzJfGy9iVDv+uuUEH/2C8gw+bL6dHlH4BCzqRQXFtGu2FPuuBlEaU1/dCHYpSVWJjnyKTPvwQvPkCB9pWzYyWs4atJX8QJPMjRQx9xhMQ88pKnciKyCur2EiJAbpkHC/KW/ioJC493YZJSMy+L8TsU5VDFo/fojwQb4jWwWkVuHVdRakIANlOGCzYp9MlobALUwsh2O7QTrwTvsf/m4jgww2/ZKCfKqNvjCjXBmJ9QfczGf8YMBdIFcKl9HsDAx5QhxUX/cenV2GMGKH+YGWJNe8m4fSPwCEslKHRuWk9OIzwUbKLYTZ70L5OOrK0hUurl+iigiAsvTEu7TBoAWPlBStj5PJXFWg23eWsRklObr/1kfjHi28eiNiV/juM6viC7cHV+tZKkPKc2LWOA7p6I1KJjB8VPnLNwARYSnkO6Pw0Z7UrfaMwZPJdBxL5LPGey0o7NiCHn+UtBk0lcyxz3U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?90NOmlrE5tseytSVPaUMlB3ct7fXMRTvFnvY6j7VCFRbawVxXf9itV3CPSaM?=
 =?us-ascii?Q?rBDSPbgDf3A35DSrBOaIPRcirM5rdRWXQ++xK4qCwVJ+/bBwzfkua9z6VSS4?=
 =?us-ascii?Q?FHNUe0NIsHZ4G2JilFpzANfag02PKPiGpfRrQnLq5u4u9HXUsLgT2MMpAM2b?=
 =?us-ascii?Q?+vp9x5sY6ILWfmreeeW9jGuCEGlaRRJOkIY9WuTGivkKGWG6C+U3/tqC69Gv?=
 =?us-ascii?Q?nvj7i5s92Mzi+dIwW4+EVYQKN0fHVC0iBkn4c6Q6pVUhtfaEU5nW6dau04BM?=
 =?us-ascii?Q?ngh4xKQKzodWFvy5ZNw2VvGPq414A9RBskie/8kXZr6LQyY0ReSNWB9oUNkW?=
 =?us-ascii?Q?9gfKa+SKNq6uoHX+/NBRz6dSDm+SAvPfw5Dd9EdcVzPjDbQawq+xPS1Fw4/p?=
 =?us-ascii?Q?aWnG0/DHdahjxToZA2su5OlMP7RuL8cd8DrhcFmm9g+42xtbwZmoY9CoroW8?=
 =?us-ascii?Q?1MeCj0tsWezLYYI6KqEFHo3NW0femTtVISttt81uGdPNkB1vLbUFAK+re3P/?=
 =?us-ascii?Q?AcMZD3hzLlVnpJLS3z4l61XaIBYeazGsdcuvcZ/N2xLg91LIdonJ6ECls6H1?=
 =?us-ascii?Q?tJYqSfAB9Ebeo4Hq2j/3DzSZyrsKLK8ToknWpvZXRz68UStVszAnQicwgL9/?=
 =?us-ascii?Q?7zEXa40bjAELtJX8NZQWQth4ylj13yqvVd90ztehTJ25meGEkVZpx5/sh3pt?=
 =?us-ascii?Q?C28o54gf69F/7NmG74SKaY7McwLBEFe5fFdgEQqgubSm1SkGSa4dZYbR9yeP?=
 =?us-ascii?Q?l70CxWlUALN8HWuy00Voj2AcXQuOO90Ugx4e4q6XK91+oOW0XjlrBseTFoHc?=
 =?us-ascii?Q?Xr1RY8maqh3MgMk9XFZ+fsQuwW/IGlgQzDj0u9mdU9wPZ3D5bLThiOYtJzkv?=
 =?us-ascii?Q?DjbFqtnWQEEM7g/mkLow5gb7U+gbhwumAEYBCkK4cU/N9u8moW6e744RKJw/?=
 =?us-ascii?Q?EMAWjQDcMUHfrwb/QD2eJGg6AU4QbtPjvUxmZzD4YmymIVFOeuyfbOippEwx?=
 =?us-ascii?Q?aZiRneL5D4BhJ84H0itrnk2rUENYUAIHUqt8eKnFCBf1oLY5Mz/q4MktkjFv?=
 =?us-ascii?Q?iiXQNSl54Zb2WkYw5YNgGTJAb67JFamyXanD8Li9zO4G9QDlgDS4vEUeEfly?=
 =?us-ascii?Q?EWjI8I1Nojwb5iZK5OSy3GQO/HX5VV9qpnC+cImrHkUbgzf9svrS14aMXDdy?=
 =?us-ascii?Q?4kjRdVUUZ9Dam2a/NGbZvcxwfxm2IxKq+Rk1+lWOoK2+txeX7XHWQZrU2Qwn?=
 =?us-ascii?Q?7+3tNy6KfpnD9A97ya8a4CQQ9pzBNx++wOI8woubJVvgrekvEIrnPnQ7s5/j?=
 =?us-ascii?Q?6yYh8ec6KvT7KA3rlIEWwH6VlA3RzDgW9H0YBekdi6nk1e++5Zhg6ikI8bMR?=
 =?us-ascii?Q?v7dXW7K6bNwhLXaxHtoUmGOiUtISGSXkfLPetfOPHqRKS/2Z5XNRj4NnU4H3?=
 =?us-ascii?Q?JwVo2ERI36HMi3vNuWreCgfJKc9gq1B+mBmBYE56YD0diLboZbAZ+GNSQ5gZ?=
 =?us-ascii?Q?ixh39Rc5YN+OyzpWSLJMVu9V1faKCZnwgQCZkLtgXOzwhqlkunAQRKKQUWbr?=
 =?us-ascii?Q?iOGXlW9WfQolYQmdSHwdl9v1/qCj4JaQUpgXeGKBVt6fgtX6Z630mN0BWefY?=
 =?us-ascii?Q?LWx0hpuYOGbvmSa/puKHtA1D0lsQ9JFZTk/tOSQZlU1954eISadRmY0R1UkH?=
 =?us-ascii?Q?YEYLaejLqi62bjbBZhEhlzx0KYep1KbMr2vqXk+uszFJiHVxOAJ6tauyvPRk?=
 =?us-ascii?Q?mmcz2IlsPA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dcdec15-26ab-4e4a-fff3-08de7e4a6e4c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:12:07.8785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GaqKKOj3LeepcL+FMjiZVTiOclFZua0zTolQPaIH3TUkPqAJ9SjDg6TS0gIqekIzvjpByoT2MXnJ5ueALC+qYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8070

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
index e2ad70d32ff9..d9b4ae5be1f0 100644
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

