Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011036.outbound.protection.outlook.com [52.101.57.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D079734104E;
	Tue, 17 Mar 2026 22:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788083; cv=fail; b=SCGifFOSuA7XtUin1Dx0iTwkT+l/4SeRdTLpwzmi2rSBCOf/vwdqjvdiAfUeq68CEFmVWpWs0w8PYaQGpa04STn/O1RpaWs5VxhQAwCm0BxHyrhXVjo0aUTJW+qm8TkbAo4FkOEri9yZpWsnW3/PvgmrGaIxmYWSRy/LjtLm7Ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788083; c=relaxed/simple;
	bh=Ufz7b/XV1g//18kWIUv87DdzYvjoXfoVha6VKFVrgnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VVttLb5mjdkjGCPpiphSJUphHOF//8tU7hDhYD0VNxU0JO3znPS+W9V88BtmRt/I6w/+Vp0T4lThAJUNHULvxrliMxiQh9SDQLJDSFp+IvbbIAxuMGB5AgFNj9h/QBsZG0e0BkkVS0dBue9L7jtoEuHiVUCtgySbJwNEmzvPgEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LwaQZZtp; arc=fail smtp.client-ip=52.101.57.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LwaQZZtp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d42yQXV07hnQKHXsOZFIP5irw9O8cyfZquopz4876MuWXSs9MoXSC3mnR0SMNs9pBJRWCHvaXEZUyC48KDs+nNq9PQnbJHbYDvesVoO9DU8wl/6gnPbJt2pmvA7IUQOya8q9lmj17OOwdxMKqHzVM+Pt40c477/6p2RpCMTmo9YSdKK/Fkd+yMoBveOxnXEhDBo5LBwIRrhK/a5mri8KQIp0cby48Y7tzPUD9QFl1hMqmapbT7gUThsYIe+FruNOZmvjMnnCMbbttqKfaqM3zMCVQmCIdHGWL9b6fUXYM83ac3UM7IGTX1lFE2x5S2MIGtcot86PG9E0fVOJZs4MlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7RkJngPWVDn3zMnW4gjU7NsTWpAbeVZ9uQC40Aafjc=;
 b=amQfQlgX7d/IMreVBjW4kuW6oIkTwO/lzwzxXq22VVkBCvmo5BHapU0Z1XE5B1Jh6cwZ+ozeII01tVJEwRNRQwFKaTCeQQhCUoOVqGoZ7G1nW/1C7TPr5KAi+SzGRru9Ow9SypHkZC/wFTd4DF/rQwWIjv1UYiwqcOzgIbJOzUuBjnCqkxvJbBPolFfhGFN1p38QwMNaN2j2unycPtE+3gX1X47u3HtK0lT+Tta0TxUn47oiFSTjg5HeSw47nGQhfpX8Ez3f3Ia0kNwfube5tQtOqMPLEFmONgSNdBG/MjZHBtO3J34fDD/YMrRiAmDLxMRaOhJ0AX31gLKpQ85+Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7RkJngPWVDn3zMnW4gjU7NsTWpAbeVZ9uQC40Aafjc=;
 b=LwaQZZtpOhiu018BkdMsb811PpSH847g3C1fRLMq0QbIZQ+SzxPianzJ1/afNorCoZJCHy3XiO78x+aV/2bIG4W9anFMiyFwit+C5aCAcVeJFC4A9PFR4nek/9tfuBGsLNHfyX2DD1G5iYlKGPm1dixnSeNXw6ANdytDkTbmTbRwZB+rrQearpiGy35kjJFJ5n4OEVlE//8MLJ4ml2Zs+IL409XHRclOWlzrZHkY+zX/igKqpAY/t+Hlgd9lAIsLF/g+tqa2UkmhvWw5dNWMWSFHf65zqrt5NVnwnI7Q5PQlWFrEmvKhziSEphSLtqXpNkGs7yDzY4BHK7s/PZvKrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5848.namprd12.prod.outlook.com (2603:10b6:408:173::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 22:54:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:31 +0000
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
Subject: [PATCH v7 25/31] gpu: nova-core: Blackwell: use correct sysmem flush registers
Date: Tue, 17 Mar 2026 15:53:49 -0700
Message-ID: <20260317225355.549853-26-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: bb64c1e9-d717-416c-ac18-08de8478269d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/5wz+Z/h6MWWsUoIjR4RNvsv+MJEJqUPoF58wrw3S8aN4LZsxrUNJNibl4afscB2cGNFvg59agr4nIjrUDoaK8vMiBvE5JKwbV3uwmdluMAf2US5Ng0CE07GAeVBy99vhOID4M3I6WXFq+6FtWcz3+ttVCdWcsbVG8HUY5khQMBjU0Tz8Sdl1Dy228SbUIZY0mB0hK3Rn+bILg+W+NS/j0XWEUbOLbDRi8CSzWtgu/ecuusjROnQKq3fJ13NeifSm984YzVp9IgHWlAWO9pG+MQd1AST6I03akIF8YdROa6iR6tK2I/P1HrqSX9aRlM5wgkUUv1/C7J0i1wFfEZ0/37NWWyd0QudBeCgRGZvwh40cm5A3qw/+N8jLjECL3oaEeUb79hn0eh5HVhx9D/XSdZhOLYsNBXZBBcsp0Xw8yDZQPzVGZSDK3RozbDgx9VoZRf9S2WyeC/B5lzNUaBf63MdZsXpTCI5ki+l9+su0uwaEwkeG9vWeZn7N/JCFinuHg6uGpwwDeQ9bWjThsdE1dP9OU39ctvWhXsepHmQdb0L9RJCozQfgwEDqIh9qrrCLG0OuAAuvRqkxuclZH5aMNDBz/VUIPTk/HoSOKPCvbIQfe0cmKy8DV81gT6XuaSFJHRknKsXqfkpqHMh051bdpFfFtz5S8TVF6vElHRFYhKvhw8NqLgFyCvZPxs5TMpMyrY2GH+h6KmV3bAqKBl1pW+aQDmd1ckGKMm4ORh5x9Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0TxJI580HWXtHCs8tJAvFT71otYOFFHMNUCasaH7JSZ3YciBKYBXSrb6AZJC?=
 =?us-ascii?Q?iB7mbs+LfBqF3gHDtfiw8mXry0XZYvCzJas/qJztZ7KD9KQNrV5xBWH1hanf?=
 =?us-ascii?Q?UC2Mn5NWfvg8Z4caqmk51+gAb9IjqMadyyazXGsBNeWY0pZKoCrvZPXqqr16?=
 =?us-ascii?Q?M2A7Zyl8XeJQqscPAX2QXIslbUjuhlYXALoyr+DJVFAbRSwRRCmjjIFA+Erf?=
 =?us-ascii?Q?j3+b/zixhFa2HvhpHx8oi7WlYSJoQUQ1dYXsQt3MvOxehYytKcXB0R4xQ9nz?=
 =?us-ascii?Q?PW3bwk8WbVKsUnZpCx8RBnaIRdyD7eFg+k2mSIJ7BS6bM2G8+oebb3GTEySI?=
 =?us-ascii?Q?VctsWkVTccmlhLp5y39B7nuj9IcN0sGSPIg81P207Zbi/ppRXZSekN/1o2xY?=
 =?us-ascii?Q?F2DBhzKKBPPnythv+9UjpCstC3ofKWj7ga78aa1UIK4CjaCs+16soleQAa4S?=
 =?us-ascii?Q?xjApnUuycvUAyULkhsBLNG9XldvTXO4CxgbbUAkLU4q3aAuVaiCYJ3wUKz8N?=
 =?us-ascii?Q?nf+V4YYD0nCtaE371wEJZIm/5ZrF+4xev+X5rpIsueVyQ6R4dxqk2fsZ+24j?=
 =?us-ascii?Q?384R/ek3I4Bo04UuZyVgH3ULnBCat2JYTiMVUaK18ds0aigyi+DB33Xq/Php?=
 =?us-ascii?Q?Ep9eC+4IQ7l3Rfm3wzFj5CSZu7G0iTJQNc3G6foWDiV9MS7hw7Kj0KJDEXws?=
 =?us-ascii?Q?pJW4ygNIQOgdvzs6YCMnxhO5w0pKaUlLaCU+Fv3E7v0NwovGoXeQHlNuiBGK?=
 =?us-ascii?Q?fpwl6u3NRHoxUv4dR8jT6+yGapz8epdk1zzR1pZxe+rwiLburDd3gnnyhoiF?=
 =?us-ascii?Q?4WZoZTKFt5P+w2b+PqNDk5O6GumAfDrY2JNt5EOApfc+lJx2ls1AOf22VA4X?=
 =?us-ascii?Q?cPyyZ8AKGarxmwaoXmU4LhbkjUS64EQ5aS1glLuHVZmrvoNH5ARtFbEvyoEL?=
 =?us-ascii?Q?iI3VLSb4DXf7QqXxAZA7Xax6fCmTtwh2NAtBw5XdRiG5dAc0+uJSOjN5FV2e?=
 =?us-ascii?Q?HtGK3BnjQ1ICRsLXSqW6bn0Hn0NX42wZU/PBIRDHy7Kuhk0OllPBE9M3L53o?=
 =?us-ascii?Q?taFhq3bvjBMVRPa+pIk08ffsHcKYSsp8ucpZSQ/CYBOIW/Gj+scFifylnf3k?=
 =?us-ascii?Q?GIhGUv0y3DK134dtTbQN3Rn3gCxEAerC5zrXQRNR2QocoZZkLnt2g2VWCrvP?=
 =?us-ascii?Q?ibaXNn5cCGC3Bkm0N79UmsHn9UBcvEc3hhKnLuofIszOK888F8v2PXXKir9y?=
 =?us-ascii?Q?yt9s66eZydO9nf4LYdoGiNMbPcRzLiTKrJd+Uz6BRx//6AHgtct3jBPV9lcE?=
 =?us-ascii?Q?IZKLM+MedV+iw8GRGHCYD18L+wYDug4QTNqe73wU9zQ8NK5envbaFzfVdXbW?=
 =?us-ascii?Q?P7ugH4fvgv8YHxz0YC1fIprmuHbPTdg7qywFZBv3vO8XJzvHp21prOCRcvfY?=
 =?us-ascii?Q?v2sBfp+E+3qGPixQBm8DYJnpA2Lrc6VxCqwcaBqCf8PIW7nFuaFz8fnWgOSO?=
 =?us-ascii?Q?EDp4d4/J9A++moXKQSOGIcKSXb+WovK8WbJXhLpDpXUr7PTmLLdDVVF7xoyP?=
 =?us-ascii?Q?vfZ1Qcm4ShRNixeB8YsaCcLT3VpaB8PzA+hKguEtky9M4a6+ChVsS3K99vCs?=
 =?us-ascii?Q?ErY8n1i8OBwkDWc/6c2YhLHWyrtfX35WJQShJuPuwo1tAd+QNSDw9Q80czgd?=
 =?us-ascii?Q?0tM8MaAoBambu7/8Kn7kE18Sl74ljxy18J0bALs/YXSKXioWXQ6HASDBlm96?=
 =?us-ascii?Q?KhgtjEuP7A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb64c1e9-d717-416c-ac18-08de8478269d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:31.3410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WzRJh8hqufQPOKLdj5htIJ4l9To8BQ3YQYu3iaGN1dMW7R/3tiIuGaXjLPt2g1vsrv3T8IwUM+D8zwfKIPHbdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848

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

