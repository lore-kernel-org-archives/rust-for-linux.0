Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2322639EF39;
	Thu, 26 Mar 2026 01:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489193; cv=fail; b=R35G9mjay1qV5ag6hXNlTbQnNbby2aM+FFB1gHGAtkHsZtWlblVnVlUzB78tz17MZRXusiU++LWzDu2qvovIvHfpVUSTNzOuL5Y8MU4RHU5LmhDLHmeFFAT4CuOTtxfSb6ts6ocBn02O1YqtcYF9ZvMHWhLI8Pj9ipb48C9Uluc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489193; c=relaxed/simple;
	bh=65aHD0GUGPZuJOee6kXuz0o8AY17Yw8jkBTxKEEFJW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JHDWtVAW3YVT32zfirFa9fQUYoMhQQTBTNrEUE9Z0b/iRKYrPRiu8zniQxN6Ekfe7clYkKJcwAI38CXdf7E0YIPLl/SvExranoXFTjlHICDenWrxwuNHL0RrtFNR3Rc/69qbMSFpF0ZtJcAqm2/SNawWJOcaw+ddZNbRxBXtFbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZeKm9lHT; arc=fail smtp.client-ip=52.101.56.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZeKm9lHT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtwPLFISemQR0NAnbDQHLOQSgSb9sEeB6BGiNzL/jNm/7OrLM4HjPCSc/B2cBsis+X+epLOr985aQ7lu35d3y9jzJFkfbYBFv2FLG1XvHcCM7hFPSg0dGIwMCdjpimXgjiW+JlvrfEDXK8GFfykR0tmkpxQ33C9ln5GiQ+rsRssig3l43XgDaYpiHkjP28jqKoGf3YQc9fqKWp1gortel7tRyb/AdTZ7lEtMBGufT08rl5PqnYTJMqg8Ah+nUjt+sQ7i9+MlPJrQb7lJe/8/7ommXi/KqE6a/bKOyeWtMgXe9tBtXDx8TXtitBbrGK1yjHzGMspmayOwnGc0o6i7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P867nldNZtd4uVgMdRM4+pXqrjbtk1mPEYqe0G7Jqa8=;
 b=jlOR7j7bAROeG7cKAcqYSHtU6zqXg2QB+6Sasft/KUM2eMPSI4OVFsvrpGa6oh+aK/7/XcYPBaPnCa+8RtSMlwBmPQ/KRfy16zFjzwYHbdXJPMmVfdOhJ2s8abQKGA5AzlXQxRqDdTL2PZo6rkEPPDsl9tr6iwAh/Einm4+KuAzjfeTezEcFoesRcm9rk2r1yKSvhD03PpTjLDXQr72eSfTmaZ96l2nUFDMmOzQWFWQ0vFFw19eWD9UeuaeUwh12dMC7TDFSuG9YwWh6AdG1V/kjKyTi53sqPnEr4XM9ueWAAw1wwCdQ/WI3tpR0Yta3OLA7gi5azNkPo4jQGIVa6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P867nldNZtd4uVgMdRM4+pXqrjbtk1mPEYqe0G7Jqa8=;
 b=ZeKm9lHTiDwe/7IH5ym6EFym3/hLzLMpTh0ws1KxqM8ukkx67aKB8fnEZ4sTs4Q1BPzcUTGgWgVsshe9CQPlRZi+XjlkUTI4CAcSEtAMWCtzjdV6dHyWhFwl7oCI9IWwOIWaunnAByrogNq+M0ik3uF2DwA6TwRt7A3laiAJ5LjIMbzgQtg+QeJiHBXDmr86sIStutaPIKHzN0AmbwEA3vxD9Y4Qw3kzsgoiBu6bRl6jw3GZucBRMiiIA6p4txXhxEUNw2XsLgCz+j3VgnOpL3/bs1A/jJxNpKpze6J426PvQSxR+Kwfev4MZS0jiOu4mQRogyRR3TRPrODGj7oyXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 01:39:41 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:41 +0000
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
Subject: [PATCH v9 25/31] gpu: nova-core: Blackwell: use correct sysmem flush registers
Date: Wed, 25 Mar 2026 18:38:56 -0700
Message-ID: <20260326013902.588242-26-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0117.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: 73532de1-3bd3-4306-c371-08de8ad88cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kGMQuh8hG0NFTQEw9ND0sU0lY+76o8CslE8u3kYZQTlGuqtDLhtyEL+EqNwc3BgDzBLJEkKIxwOiROHUpwOUmS4XfW4NS0dV0FcqqwnaXmwVlPVKrgxrLCiLmz3wTO2GzEjBWwkDGrui5eB1v2osv9EW/apBpxRPsrvpJYu/6fFBsgE6YbxtgybmXJiFMMHZDVcgeW7mpXPG15ZfmqPUV9uCl7l7ObXIcP1cVO1nRFMh0DFucaYc4CN59EODZ3/HTsVIJ++LEWwbBPaN/UQce4U62XZz8FEk8SpWx4P0XzouJQNqq5NxEg19jWw4Ml8NnTXVPEBCuXCyOizXQk6gtDKTPx3KPLt3XLE+NWQ7fGoz9Iq5dJY5NIE9S7wF6TvSBUmzmJGPcS//wdJhyub/kRvi1gAxEolccsykwBICKlGOezcRJJtMpDTkJiA3ZzzR5Q6vR+HVwBTAFeYaV4Suyhn560JadNzP8F6jwVBbJNScQVOaFjB7MxLdTjgCRs6hapbsQrkLy8cl3AwtA/MZtti1LiwQoyvkVhBK4MWMeVoDUpdPmuqcdZm+F/tOOU54gBWXDJfWRCxeVWgSiodcNIhqxGRgLpalCssu5Rs2yWlmKpOPKDVlrDdERUmFlBywlhHtkiug1xlZAOAsO1ySKZj9notK4VEhPz0ZUOeJ76jBljm3JsGYJ4fiavQMF6mbeLlwgJEbnn5mSJ361gSJCHgg4zON5KF2AMrr0pYCSE4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s0obQ4rkweCUTxPSOByZ0xgc/DNyRNb/SO0cVKHFDThhwgBA2ZwpSIajlCth?=
 =?us-ascii?Q?8ZMwd5aMXkubXXv24mgEPmgjk5pNDVtlvKhuKhnCUvv6jGdUEcP0+NqMfJcv?=
 =?us-ascii?Q?b44vx0h+CgTDDO2C/7mGFGLF//uHtMHWM/X+Qia5MqN6/m6fBP5VD0BlCGHb?=
 =?us-ascii?Q?fTqutQ4Wp55SFxhYDxuQA06l6JuO3iK5l2rDjNNMqoGYDoqpnUdjbQxNmZWp?=
 =?us-ascii?Q?4Ib0jmV+6eFz9PAfc50KpXlApp1FZrtoJFgH003XMApCSRTfI9rAnNNIxpPY?=
 =?us-ascii?Q?FBdi69T+qqkjMLXePWox7pRT1w2fY+pH+QzPhyj/9zDcvHMftfr/r0OZl66+?=
 =?us-ascii?Q?3d/3SkKi2Yxz3FfDL8d+3gBk5tA6i028u9U7p2c5WYc5kbx0D4/DaIyp7wux?=
 =?us-ascii?Q?MsbOi3K6C3+9gZ9ZBpOkQXyIDLNa3C+rbKy0Yj975wUSXWoJi3qSbKo3s69A?=
 =?us-ascii?Q?9Q66GqHW6aHpoNnpBjnABN9G3aQMdX37ATBJ5ks6RioX8uKmOQzT65gKPQJG?=
 =?us-ascii?Q?CklUXGLkep7g2cy/Vb4YJ1k7xcOodhVdszZHXcxwzodel4OzT5PbD/QmiD1b?=
 =?us-ascii?Q?f3C8gPm8VMvYv0iDOEVwa1N1WgR4kb5FUhOAQO+oQNXqTKK/n7W7XRtodiM1?=
 =?us-ascii?Q?L1dJ20EncvBFZMsErJ2YY5smQUwqzNow+AxwT1ic8CUwcatCQOe+Fgtd7ryu?=
 =?us-ascii?Q?JoleTdCw7LQ/tiJoWm3mdo7vi9gBedr0Uqv1lk2hQvUN7YJ67DUFO2a8wJ/8?=
 =?us-ascii?Q?If5n3BFFGZsGh5Se9Hd3EFyVoaNcXL0wWS5XeBJPDH6wg6Yl5KIO7mNNE/Qv?=
 =?us-ascii?Q?rdLkcxGnaqCJ9nGaZJUu6UdbHVNwvoNsWfhmtDu09yR9R/jxeA5oFwGaYiCK?=
 =?us-ascii?Q?tF3bZkTXjV58WbSonwPmr51EifA03634yIvpM0W3N9fry1ig27yq1edU+sZn?=
 =?us-ascii?Q?dGlMqgsD7O7+oWirPYUxTIdBgWJDXWaCSPmfp1KjGQpccsVMcFa2xcMqBM85?=
 =?us-ascii?Q?zch4hRkQQ5VILI4KLANSiQ8yJEGOfcvRVxyVHSH/a12onWvt8aLklT6fLEkT?=
 =?us-ascii?Q?DQx8+DqjzDG65KoLz/rgyQi9bDXifrHcUiqSNlFsmMyPyYj/jHnlRBJEH/ce?=
 =?us-ascii?Q?XYff86uGWrziO0dUx1p/DKuJ157shIOFCiHD6bOmwDzVh+VJy9PLARzr67ZK?=
 =?us-ascii?Q?fnG0SDl1cNk7Ij6YdPDi977vX0gtenN0gRTEXcBQISlU8hw0cKoCXHkt+qVW?=
 =?us-ascii?Q?BJzubRWTtc4H8oV8JMDUzTqzcBSGP7lyNlqipAP+/Wv901+Ln8zm1At+jzgS?=
 =?us-ascii?Q?KcZEp9A0RoGe6VVyR8aH9ES2p58fWdGy/t0wMoU8eEhGqtwqjFbRojwSXayV?=
 =?us-ascii?Q?NbGXFees2gr30K1k1dVST5jDbZvzXtLedAAuryynCkoz8NPt/At747fls6OU?=
 =?us-ascii?Q?pCM1Do9JBethMO/660Ddnb2z6mTh2+PCkMNxX9kzfQJUmnEBz7iX4Wcmd7UP?=
 =?us-ascii?Q?s+QXlARpueJDCRDvBqQeLsWQ8+S2LgvmdsUHDsf+R7pEnmZw32dnh64Wa3qQ?=
 =?us-ascii?Q?lL5bZMa4QlNCfsS8N4uUaJOgXqRVr7l4iwN1tYgz3CWjU3oM9zPNoS4PrU1D?=
 =?us-ascii?Q?CoZyo7UJfBR5TY3lUdHwFf6rhTnFtFITJFngEH2RlN3uBSttde8eQDfzVukx?=
 =?us-ascii?Q?Ch6Xb1gqJMNPS0JOanGwVFI48GV2rCVs2LMVgfcZtMF8Kus1AWRKAIUMS1eG?=
 =?us-ascii?Q?2MjRqtIK7A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73532de1-3bd3-4306-c371-08de8ad88cc1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:41.4038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Idyx/59UuSHw1mTyWm//QwhwENsJsOvzXY5NOrDYJUwxMbb/ABhk8zyVlSpwZUIrzOo6IhAga1R/lgm6F0JNmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

Blackwell GPUs moved the sysmem flush page registers away from the
legacy NV_PFB_NISO_FLUSH_SYSMEM_ADDR used by Ampere/Ada.

GB10x uses HSHUB0 registers, with both a primary and EG (egress) pair
that must be programmed to the same address. GB20x uses FBHUB0
registers.

Add separate GB100 and GB202 fb HALs, and split the Blackwell HAL
dispatch so that each uses its respective registers.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb/hal.rs       |  8 +++-
 drivers/gpu/nova-core/fb/hal/gb100.rs | 47 +++++++++++++++++---
 drivers/gpu/nova-core/fb/hal/gb202.rs | 62 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs         | 36 ++++++++++++++++
 4 files changed, 147 insertions(+), 6 deletions(-)
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
index e768a1429a2f..a255ee1474dc 100644
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

