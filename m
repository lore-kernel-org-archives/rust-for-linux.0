Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4AC3264F7;
	Sat, 11 Apr 2026 02:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875845; cv=fail; b=A2MjFpZ+O2vBNVzByYLfpev4f2tv2RCZ1fhhh8JrwQS41/jT3umlNhv6ayaD2N2Zia5DwFgGOj88rf7GmrUFq6kKe90W3cucIeT9zffxiIu9NLRiZJQcHMjU6uWrI3nABQvvla5XljE3cdLJ7VgGMCIQXzCZ2V3DIyZSEsw+4gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875845; c=relaxed/simple;
	bh=BXPl+psDm7oLy/LHbwJ7wUhJ+4C120H2l3rpCMIrdtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xmd1cD6mr3QWV4nJBZShKT91zSSpaUtJcd80jAQ6wqplwKV6vQLqVGZdMSRB6rSKja3Q1jx/lpfmO62+HlVTpXF8Kfs39EgIjZm53kXGnt8Rubrl1ZyIsL2s89NUZCW95OHcW//zO3kPflzE6HZUEOZPVgs1wZKWmDOKipeFCO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DsFw0QyC; arc=fail smtp.client-ip=52.101.56.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DsFw0QyC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xe2HVbGXjmHtJwhHrB6rkAG7aLZQHXQ3PLFH5dmSXPpR7L54BLH4EBS1tlZ9dvpkZ114Ws2vJEgO9tmioQjvIoqzWgTJUioEmiI36VrlCcqm653UvtKypB97aM24U6xwMPUu0XdQ+CN+UQowpRLNoXWjYF76wFI7Dh6+sgWacuyo1aKIeDlpT1OV26dEyMXvGU+NZWsw4o/NEzm2yRinBobZ7M1aonG0y+RVU0EtRWKA1WsKZLLJcGU4UHZoDkpNwheIQ2ncyZmGJLMfj9s8ybow5r1iMe6LMuMKgHU2wQG8eCPEY22/DQf+8H4NDBoMoGwaysH0FXS2Ly4Jvq1Dtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SX88fTE4wG+7cPb4AwhHgkrXN1rmkHg2of2ilB1MCA=;
 b=bcArVSJnuNwWPj6rO9cmZoCErx0Nvbb6E3NRcKOZllDZBihA/fCcx0flx9V5mIumKAIBGWSGU5aDMcs8kJEpx8RsMOEuJnxJrntgCA3LN5g2ATo168Y5dE3L58uUvGuw5/O4qhTS1yqUDPkb8CiLnNGnAaNgdbQS+BTBedif+vzgeKnjqLA6SxEKV7jniUuD8IcHF6YUloXhdMpPT/1nof1SGx5gL9MiPX7CwLtXydigI5Q3c/HuEjTjbESqpg5m9s80U8kJ/iPmnUat8QfJsO3lVeZVn9Qdz4nmw7cvQBDdCvb2a4+QUk2q3+AzxFM72t1TCcdqeHrP2SJcpWwwAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SX88fTE4wG+7cPb4AwhHgkrXN1rmkHg2of2ilB1MCA=;
 b=DsFw0QyCKHoMZ3QR1iehLAi0xSrGnUvUOp0BiOhDvTu7TG8TbBXqSPgfO0Vgoe/bvKrIwBcHlAWcfILN7ucYTZ3R1i4EGMDC76EbX+TN/xtIiafDoK7xRL8p+SCsT0c4dfmGpkSTmPq/qDUR1jmJPh43LYcGECW+ukNV0ynXRcUAPQWRcim+oAL438pG0N56b0OuC/XbbIZgaYfwPMNlZh6ioDoEIsFp1v9XcOgoOoHa+AR8+hTGWJ9IzADa3SVpVsK7bBLPp+jgcTTeAAnyefCLsTblGAFWpwpw3tCzmuTdHFvzsgl8cZiW+UMR+tceuhqQqO74Hgu9bld93he9Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.46; Sat, 11 Apr 2026 02:50:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:31 +0000
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
Subject: [PATCH v10 26/28] gpu: nova-core: Blackwell: use correct sysmem flush registers
Date: Fri, 10 Apr 2026 19:49:51 -0700
Message-ID: <20260411024953.473149-27-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c10491c-1e0e-45a3-6d22-08de9775176f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Ei2hPRgjz3tXr7LzdOzjJZbcbCgn+2p8yi6/T3tEK8bsQJ/2uUrBteqB9yYJqY3D3qcLYuDOGWKvtMUY7y+lYR/xSRYsTeZCwJzCi4u3RjHf3vdnbHFX8qwV/Hs5cnK4g4f0GFVrd6KV2zElflqS2db8+qFMjfyczqALyJ8Rbs5IcHivdsYoaFOlykzcASeiuA29UUlFVhFqzrXVvSVdx2p4zXUzrkuzLVhcJkmWFdr8G/WB9ue26eEZ20rshxo92PkJ85iXeYYkiIJsi3AfxPlMqw06TI4pTrK30NRAI80YxSOSX8wxNh6c2kUjbcbxmIabR8kGrPDLqgArWc+cK3d5W5d6HiwM9DfBulMUF/CConTU8V0Ab2wzEDwHHvsbOAqt/NMNN2ei/OFAo5wMmrueazDG77EJV6D/15FUz7cNAROjn0c9Q/W8dKyTkaDxYWRgxC+1NDXapxJK+912oprKr51cm9Rl2BJalnKg9OYd33tjvSAjYOKi+fDuCjHMiwrbE6j97xoRonrEfAMdNQLekNtD5UrGdPTLHE37xj11rvGicSbh+shX1kelDuibKSOud0Erd6jIeD/xVgA2U1drsMQJd1P4kgfwVc0vJrEsUrfLJR+ExS0kqfMV7/XzuuT0S5rpfK37IilSvUUjRiRsKBPqkkzQt5CseaRXueKKjihjHg608PircILMVQhOltnk8bUwouNYWabcRGkY3nAo46F1rgLk0Sy5plcqp9E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wOi7vIGY2i+2zsFDTibKEwZvdpdJ3uriu5N9YBCTKRsMpilU8EDIRDo08MPg?=
 =?us-ascii?Q?Dmgcz2TeEhsbtsvItov6gzAbIrAzZjJD7zhjDamR+hipaZL1IV9g5RmGdhod?=
 =?us-ascii?Q?Kfsb4U8VV8WFKe1H9EXJOrmAa/L4vjPZz67F7pO18QNF+qVqULtIY3arE5Kr?=
 =?us-ascii?Q?363Wq+ELbUTNSjlBS3CtuGAAL0lqZgxuR0uDZGB2q7RuGE9xsjnodsa9AExg?=
 =?us-ascii?Q?cgXvHRioG4P+qxFptvBgTr3bODzGvocTS2FT9ljAAdEf58YJcdF7z76tb1uD?=
 =?us-ascii?Q?kCDorRyL8HYwp0fK8LVh02AoEsv+lbli6lyfvXm9NzVeaJHjMI5nSr71tKHv?=
 =?us-ascii?Q?3ndDxsUFq5mmMq60GJI1Xcf9HPOw53+vRNaEojJDW2xj+ApbHX1Je1XClF/x?=
 =?us-ascii?Q?pHld+kU3T21VKFnfBzwDBh78kxDTpJq5boXKPB8SaGW9Hx45nPpTbd8q+joa?=
 =?us-ascii?Q?PNYs5IiNdui+SqzXUsSHNq8Un9oSS5ATq2hPD61LzeSXncD0TA7hCaemobYV?=
 =?us-ascii?Q?KAM7hjr86RwFu3I5raQYKoL+wD7o4bfhTbhzgibP1x+78OusqnjNdi0LcmcQ?=
 =?us-ascii?Q?Wppa6icMy747BTSgEYlRi7YnLRBNyIDccpKu2hY+CUsvGQ9I/gp1N0UyBNKu?=
 =?us-ascii?Q?QovLF4/SkmjJHKj83G+e45Jxdn0QBjgX9Umte3lUNo7zQWPQSPvm0HPUdNcU?=
 =?us-ascii?Q?lx/BWXTNa4/Xxnyk/5FU7bka7wf6XQ/4lQnCuiFSv4ruW8+Ym1hDbzJgSdka?=
 =?us-ascii?Q?tX1cIECB3pTz2Axt7VDpRqjAN0k7klm0jtu9mD6NmWFb4JwotKoeBEK1WaVF?=
 =?us-ascii?Q?AxUHgclqnRo2Al+wNWquAjzc1KMq/tKO+wQqp6btr2T7poI+pae6ukXIPhXk?=
 =?us-ascii?Q?824XCUhkIuJ6DcOua/ODsf2Qn4l9UFNS8Z5OS0wuawds2n86xEVacBQ8DTFB?=
 =?us-ascii?Q?9gmCgrA3y/IUPUXsJGJ8OStyBHO4XNbBpOa+144aTZ1C6sz3gnjt55VI+QA0?=
 =?us-ascii?Q?Rksb52F1sR3fv+8NtQIRxbHoRqFPBhc6OEYY/YItVbS3Y7KZ5+C/biuv25xV?=
 =?us-ascii?Q?Y9UfbQuPpjaJv0INUg9eqOr+130WugDhQw48RKJRXPMEdPHcf3hgTK56CFyl?=
 =?us-ascii?Q?/K+YHI8fOvOSMygWEoaM7vPCJTFMouxUCG/lH2PPQ6KjVH1JyCtCGDKESmUH?=
 =?us-ascii?Q?tGh6y69J64AdWvnrrUg2WyAmyDTELZi+u8VB9OgWJT57iDgRtPy/+13eK0k7?=
 =?us-ascii?Q?NGDKQXy+FNwznagUHbDHaw7b3/Fnjv58+UAz14n/y8hpmpVJnSBv7pAtM02O?=
 =?us-ascii?Q?PzGV5HllB82QnZwH6IQA0L8M1KQSuVt/E4BlGY2L5ulseMXDkT8P4BXcG4mn?=
 =?us-ascii?Q?kBvPp5zjRBBkF2rY0IWG2JM7OoUN2bEKCcVOpOZGBvsOBvSkcxRcbVlVYcx3?=
 =?us-ascii?Q?x5YgzAVChIpbo6mO1dcuMEv3RE0n8BPa4WAvy4XPu/2HKIAk66yRqf6zmuYQ?=
 =?us-ascii?Q?MZqn9QojluJg6cfkmeFpH5plgU7vFVx6TAS5zE7ckJ3Y8aqNBiuYV+Ys1Qjw?=
 =?us-ascii?Q?JDWUebPPMbL0SC7P+eejNsP3jiAbh7L4+idF+MaRHGo8XiNxfEzetGKCknvk?=
 =?us-ascii?Q?uJ1eiJ71wbWqpZd/k7RJSLwB84a6onf9SuSgsGQMxxxCk4mwcjR7M06Kl8QC?=
 =?us-ascii?Q?3gaqZYp9o4cKe/9s9XnQFeBOqowECOUOuLJZikMA44aI5BewCElmHFEIwjdi?=
 =?us-ascii?Q?QF7OnklakQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c10491c-1e0e-45a3-6d22-08de9775176f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:29.5416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcJ2bm55DLmgQ/73WDGNBHH4is80ld0+THh4MlUNvetvI5PL/x9npTUplyoCjIdNwPO8sn115hA6Leh6zpWB3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

Blackwell GPUs moved the sysmem flush page registers away from the
legacy NV_PFB_NISO_FLUSH_SYSMEM_ADDR used by Ampere/Ada.

GB10x uses HSHUB0 registers, with both a primary and EG (egress) pair
that must be programmed to the same address. GB20x uses FBHUB0
registers.

Add separate GB100 and GB202 fb HALs, and split the Blackwell HAL
dispatch so that each uses its respective registers.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb/hal.rs       |  8 ++-
 drivers/gpu/nova-core/fb/hal/gb100.rs | 54 ++++++++++++++++---
 drivers/gpu/nova-core/fb/hal/gb202.rs | 77 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs         | 36 +++++++++++++
 4 files changed, 168 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb202.rs

diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index 478f80d640c1..65edf07c3222 100644
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
@@ -46,6 +51,7 @@ pub(crate) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
         Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
         Architecture::Ampere | Architecture::Ada => ga102::GA102_HAL,
         Architecture::Hopper => gh100::GH100_HAL,
-        Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => gb100::GB100_HAL,
+        Architecture::BlackwellGB10x => gb100::GB100_HAL,
+        Architecture::BlackwellGB20x => gb202::GB202_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
index bead99a6ca76..c6e2a505e6ae 100644
--- a/drivers/gpu/nova-core/fb/hal/gb100.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -1,21 +1,64 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::prelude::*;
+//! Blackwell GB10x framebuffer HAL.
+//!
+//! GB10x GPUs use HSHUB0 registers for the sysmem flush page. Both the primary and EG (egress)
+//! register pairs must be programmed to the same address, as required by hardware.
+
+use kernel::{
+    io::Io,
+    num::Bounded,
+    prelude::*, //
+};
 
 use crate::{
     driver::Bar0,
-    fb::hal::FbHal, //
+    fb::hal::FbHal,
+    regs, //
 };
 
 struct Gb100;
 
+fn read_sysmem_flush_page_gb100(bar: &Bar0) -> u64 {
+    let lo = u64::from(
+        bar.read(regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO)
+            .adr(),
+    );
+    let hi = u64::from(
+        bar.read(regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI)
+            .adr(),
+    );
+
+    lo | (hi << 32)
+}
+
+fn write_sysmem_flush_page_gb100(bar: &Bar0, addr: Bounded<u64, 52>) {
+    // CAST: lower 32 bits. Hardware ignores bits 7:0.
+    let addr_lo = *addr as u32;
+    let addr_hi = addr.shr::<32, 20>().cast::<u32>();
+
+    // Write HI first. The hardware will trigger the flush on the LO write.
+
+    // Primary HSHUB pair.
+    bar.write_reg(regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed().with_adr(addr_hi));
+    bar.write_reg(regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed().with_adr(addr_lo));
+
+    // EG (egress) pair -- must match the primary pair.
+    bar.write_reg(regs::NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed().with_adr(addr_hi));
+    bar.write_reg(regs::NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed().with_adr(addr_lo));
+}
+
 impl FbHal for Gb100 {
     fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
-        super::ga100::read_sysmem_flush_page_ga100(bar)
+        read_sysmem_flush_page_gb100(bar)
     }
 
     fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
-        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+        let addr: Bounded<u64, 52> = Bounded::<u64, 64>::from(addr)
+            .try_shrink::<52>()
+            .ok_or(EINVAL)?;
+
+        write_sysmem_flush_page_gb100(bar, addr);
 
         Ok(())
     }
@@ -29,8 +72,7 @@ fn vidmem_size(&self, bar: &Bar0) -> u64 {
     }
 
     fn non_wpr_heap_size(&self) -> Option<u32> {
-        // 2 MiB + 128 KiB non-WPR heap for Blackwell (see Open RM: kgspCalculateFbLayout_GB100).
-        Some(0x220000)
+        Some(super::BLACKWELL_NON_WPR_HEAP_SIZE)
     }
 }
 
diff --git a/drivers/gpu/nova-core/fb/hal/gb202.rs b/drivers/gpu/nova-core/fb/hal/gb202.rs
new file mode 100644
index 000000000000..0eaabc9920c7
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gb202.rs
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Blackwell GB20x framebuffer HAL.
+//!
+//! GB20x GPUs moved the sysmem flush registers from `NV_PFB_NISO_FLUSH_SYSMEM_ADDR` to
+//! `NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_{LO,HI}`.
+
+use kernel::{
+    io::Io,
+    num::Bounded,
+    prelude::*, //
+};
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
+    let lo = u64::from(
+        bar.read(regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO)
+            .adr(),
+    );
+    let hi = u64::from(
+        bar.read(regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI)
+            .adr(),
+    );
+
+    lo | (hi << 32)
+}
+
+fn write_sysmem_flush_page_gb202(bar: &Bar0, addr: Bounded<u64, 52>) {
+    // Write HI first. The hardware will trigger the flush on the LO write.
+    bar.write_reg(
+        regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed()
+            .with_adr(addr.shr::<32, 20>().cast::<u32>()),
+    );
+    bar.write_reg(
+        regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed()
+            // CAST: lower 32 bits. Hardware ignores bits 7:0.
+            .with_adr(*addr as u32),
+    );
+}
+
+impl FbHal for Gb202 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        read_sysmem_flush_page_gb202(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        let addr: Bounded<u64, 52> = Bounded::<u64, 64>::from(addr)
+            .try_shrink::<52>()
+            .ok_or(EINVAL)?;
+
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
index c3ccae0c235f..77b11c7de3f8 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -145,6 +145,42 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
         /// Bits 12..40 of the higher (exclusive) bound of the WPR2 region.
         31:4    hi_val;
     }
+
+    // Blackwell GB10x sysmem flush registers (HSHUB0).
+    //
+    // GB10x GPUs use two pairs of HSHUB registers for sysmembar: a primary pair and an EG
+    // (egress) pair. Both must be programmed to the same address. Hardware ignores bits 7:0
+    // of each LO register. HSHUB0 base is 0x00891000.
+
+    pub(crate) NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x00891e50 {
+        31:0    adr => u32;
+    }
+
+    pub(crate) NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x00891e54 {
+        19:0    adr;
+    }
+
+    pub(crate) NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x008916c0 {
+        31:0    adr => u32;
+    }
+
+    pub(crate) NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x008916c4 {
+        19:0    adr;
+    }
+
+    // Blackwell GB20x sysmem flush registers (FBHUB0).
+    //
+    // Unlike the older NV_PFB_NISO_FLUSH_SYSMEM_ADDR registers which encode the address with an
+    // 8-bit right-shift, these registers take the raw address split into lower/upper 32-bit halves.
+    // The hardware ignores bits 7:0 of the LO register.
+
+    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x008a1d58 {
+        31:0    adr => u32;
+    }
+
+    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x008a1d5c {
+        19:0    adr;
+    }
 }
 
 impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
-- 
2.53.0

