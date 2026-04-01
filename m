Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716563C3445;
	Wed,  1 Apr 2026 22:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775082495; cv=fail; b=IrT2tSa03Hhlgs/f7RSI7vZi8l6qaMStmdjA7IIfn3+FjxcXBwHmFomet+yRvlwegrM8JT73ZUFeXT/kPI4xYs5njYlrglFxcI+HWHZkswNlrnGEJUmh/eYV6ViLTxwAq0Ey/cOpikHr1rRe/ZOaaSlH5JyFL3XcprlxEjHnqUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775082495; c=relaxed/simple;
	bh=jgEs9A4rjXQ5q/Ij7XRE1Yq5U9Q+wiwVJ7KiWK1wYAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s41Ax0BnHa5Y0pE5JU3bTAF7e8cZhKxt/D18x2eM0Pj4eiYplveNKvqX/qaU1W6B5bB1Vev/lPNF51L3krKiyrhAWFg+4dMoW3AkT5l0KdvFFtE86b0Nj/VDxafg99CKAno/FKNvL0QQv+Ft836rSPP0p8pDC7E+UGITxyfnK3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OMwxr4vc; arc=fail smtp.client-ip=52.101.56.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OMwxr4vc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDby8TU1WGcXYQcFh0q1fskBRADECUc0jOZ1/TXR3IH4aHKcKEHE1E9Dk64ahY4QVb3U7PvBrd+T3TVI3Dncym4CPa/cJ7cEXD711/c2+k7ZHn5ZsSJU5skW1dfyfLYutjOV97jkceOPIOyHP6ev69ewFYdADIpZE3HRQdMa+FcdTXu0wbUQrl7zcJRi43MNOpmD7pN8X/2bPJ7zF3nkN9Ziu0zUse6V4SFe+BfLHeuew7iZwLTWuiG/IQjcOvPwfL29wVL4383w6+I02Ma1Z4kMJG3LdTB7R3vhdRPCTGHUZSuq1qs8dVFQltTYtsYU7S0f5dSB/UFv0JzOpbkWPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mla1uHeECkT8Uq+H8nxO3r3cdASYLdteBny+vIC9AmM=;
 b=CuaI+kb48bxJ/VYoFEedy4cUb8QKOXtRivijqM8fZs8viOkJNlxyT7iVKaZ1FQavnqr2Yw7rIZ/YLNQ3EayCVjHFvE5XLTMzwZxP1F9j00MWuvPlG7JrWmofexQ4iY8ESQwO31InbaY49gBZcBeZId0Mum7Y7KKp6/tAO0ajINVH3Hm3wnQTBBkHJ/6ewK5pVqny4Cbb0CrFhPMViqmh8Y3neI51JtaTV3No/X65JI8szQZFNgriS+yTT5X7rZSTQBdkzr6WL1QKowdtlchuuJS+NBhQGO8UZkqx1lXGYNN05crAkkUUGBd1Wd6RQ+v3jnO0duvvkb8ZndyQTXoYSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mla1uHeECkT8Uq+H8nxO3r3cdASYLdteBny+vIC9AmM=;
 b=OMwxr4vcCHNLVXSVRZYAVbR0UZIzHK7SYWUw0wtMYcc83au0d9sz0b88fPqRsqhRGuj/FtD4jpTyd9/Pa5qzhjIpn+ephYRR1vqfobZNydZVX4QcR5bJ7WFXxM2sMHUyEKLhTMebLhdv9N7bGjR2P8JsgR9+aUD23ZHJ3Bphfb4AZifdf58uobUfemY20craqAoShLnLrSutak1ZRPPFTlvr8Nnh2i/thGhVg+4XqNK0sK99niBv5nQciwPiDox6FF8gVjBJfwTJ4aR6tako32pa3Udg7gtG3+1V8F/aTgxMygb4KKLNLPIo+IxM5yWuuW1KSUb6z9Ki6V/eprbHSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN2PR12MB4456.namprd12.prod.outlook.com (2603:10b6:208:266::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Wed, 1 Apr
 2026 22:27:49 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 22:27:49 +0000
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
Subject: [PATCH v4 2/2] gpu: nova-core: use SizeConstants trait for u64 size constants
Date: Wed,  1 Apr 2026 15:27:43 -0700
Message-ID: <20260401222743.148710-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401222743.148710-1-jhubbard@nvidia.com>
References: <20260401222743.148710-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN2PR12MB4456:EE_
X-MS-Office365-Filtering-Correlation-Id: d6bd5a67-640a-48d7-ee9c-08de903de783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5AW3x6OOYRy23phCdKJBJsiUezebI9hPHk+s3GJ0aCvJKcwP4MjC2zZB4KnEnKl/x4vPo+uTFlPL3fqKSRcuYuf+mDcEWRwf9EUSn5PwoupR/R0lfXvpvwHPLxvnLjHi/v8YJdUbpLc732UK/tVHTN5o63S6hHzePhsGf0xOLQl/pM9uYC7G3MmQt65Z5eByegHC2lFoIK5HwbRNl6Tzw07jFeE+qnEGkR0cV1ERJcSUPl6EJVM1PJ/iwgIvW6kSOU8ypN9X4nrOKUVyrxQCNA8sLhzxmqPfTPRD47NDGoS6YagqhkZdm62y1V7IhEBxUaQoI5+Kotla5Gn+xJtlbV25Q1SzVfgKDhzNX5IZGJ5Y3I/gB8hLepdqzCZIW7TVCX82DP0eBQDW+/rMGpl29HBCTDBLWEzLz83X74vJw37tqP4SZ/KywTv+XNoS8hMEszwQTxBi1T/x3wW76VcoeATwEOdUFzP5ts3PjLwrPpCmg/HvQ8He3gybVabys7yRYUdxWyTZiof4lTo1B9tJGwWxDcN0UhBzQMlEe2bCJhpSacg5P0BHbta3WxnazPqWQ2tD4qkYjMWmhsL9IV6jbHGwp/M+gSIQoUczwZOjDrZ8nLCV3FstajCAsfuu3i0RgeNK45xMZd7rQQ0Px2/pI1Ff2XDm03sE08+QqqiOpbcmSe8biH46Bi2cDpQY6wvTf/G3S0WXNdGtymPTFE9w3zycvd/jp9dS9NloIi/mXaQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fQhwePEshsvlU7ckXDhEeB7G/6NJpotSvrOwVVxu9TOrDYrCvgRr9CtC9dTc?=
 =?us-ascii?Q?Z2tdvViz851L+ADUL2Ml4lQgchikXJ8h7RnDowIIM4vvc1PxrY+5T2eF0OD1?=
 =?us-ascii?Q?qJzJZ1eVNOhmygX6Tz3kldOAxH5/JoE5tgdUv83Mp5cshk3P++Ff55mpNLN3?=
 =?us-ascii?Q?ZSWg5pul3lgLaEGhcpS3/bUmYWN1Ot4a+2u8YuoeV0oy1132gqPlAio1U5yQ?=
 =?us-ascii?Q?2hfvfAlbR/6ayITlK3TLYSN86x3TVSq8wIicYKygzgicsDx60Fcb4JsmCzA9?=
 =?us-ascii?Q?9c5VnQN9pqQiExQr32Kpiv4UY3ae6HaoNILox1JgVreRijt/fQD1cs2SfJmY?=
 =?us-ascii?Q?Kxj/JHMbZW7IfaHUmAjzkGBEjUbMEQVKOXYQb8X5bG5qx2PV7xVaMcSlstp2?=
 =?us-ascii?Q?NpsNFRHLGbL0I1xOJ+u08oG2DcPdI4/fIrGhQ15NLnEJqHxq5sHtzUSWopWN?=
 =?us-ascii?Q?HW6akfGt8tQHpBloqE5D3ikWZsVlTf/Am827ffSmkrKYtdfmwWgicrYVWvng?=
 =?us-ascii?Q?1nN9fkCXs9vih4aTBW5bAPRPkpwRCOdTJg11oCU/Ntp91VCtD3vZLxMy+f8V?=
 =?us-ascii?Q?sVnkpcl95f50Ilcy8DMrGIGFvE4Qs2JRmnIr+67AlPXRGX0aOEdZMZtwQWYq?=
 =?us-ascii?Q?PxMn37xlf5Mh5WlNLU3oDQYJM7uNCsra9bKIh1mY4C+7n/IWC6CNV6tDo5qH?=
 =?us-ascii?Q?sAY/pdtZS7JvyM+mVKpthCMxQU4axqvm+Ac9xt0GZfmkg+ocDRWhidSqNa4K?=
 =?us-ascii?Q?N3xa/m1Cr8p3zw42v7egbUqSloXWQxfkEYMhd3hEQ/a8Mw3fHU6qa31eawSK?=
 =?us-ascii?Q?r93B2IghMieiEbTwcjGqOkvtZvJeE9Kq/GOwqJzk3cxo9Gg2pE8lHcuBJPhn?=
 =?us-ascii?Q?KGAgDFkh3NtRhtCG/yc33oS9ygCxGflqyz4WOez/xjfYYubtzFMZNVpwzZa6?=
 =?us-ascii?Q?9sfBiVywSbhocG0vPJumusdt4mewxUuSvSZortHUNT4UmAZmLBuNa2GNSxjt?=
 =?us-ascii?Q?1ZblcyiEWPEahg/L2f/01gc74FaG1WpVPjGVqXKaMtxiDeCOAE7QJQf2a0TV?=
 =?us-ascii?Q?ugO9M8QZYzIYPNZIE4hkADrZRsuPGvxkT54sqSyDN/pIAhHizGlA7ZnQwjAP?=
 =?us-ascii?Q?IHOWubMECee0aWEaNSnfrA9nldzHbTklqyK3IcwxpMMCADQvWg/B2JGiUS9j?=
 =?us-ascii?Q?AdZ7cqlxCak6HN5UgWbRekkHiQ0adCWpnZtIMf+wDLxj9WyZYsBevQQTLdWE?=
 =?us-ascii?Q?0LEc80Zp3BDls0sl1JRjO4rTGTYL5CQWTM+J9XeQoqjyExuN+ZPhGGPaTfOR?=
 =?us-ascii?Q?NuCoAbFqqWWVspxhvl35rkimmBnP16c5AoI7GYYN17ItCXnkHP3qkIfiT0OO?=
 =?us-ascii?Q?qyuzwNXbVTAUywhptzbURYRFQOf7Dgu+L3BXiQMO8gtDBv1xPeZwYEikGx3q?=
 =?us-ascii?Q?OdXmxcfYn+NYfWYvtg1oBpPMSIZVZoJmqiSkR/ojlZC40QvlTte1oG3JChVI?=
 =?us-ascii?Q?NI7erM8fEI/EBjzrBTxPTvdPv6Q4kB+wAcOeEIVMNLcJgAZZdjPjV4cqAl19?=
 =?us-ascii?Q?i/OdPi2YGlZVSXAUYWP8JMbmIAynXS2OKTMO0yQqFHuQICuM15MePps2fYIc?=
 =?us-ascii?Q?JM5WuUIvQGYxefbQ0tuUYexeY6oFnoqDjX3A40BFYjWOS4rtu6VkkGDo8O/7?=
 =?us-ascii?Q?wSvDQ3a/0XXpPA7OnuRvv6XPpcfwmySXKC4yPALCp57nsxUAo1t94lYB8WI5?=
 =?us-ascii?Q?9jJ1iDq2Tg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6bd5a67-640a-48d7-ee9c-08de903de783
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 22:27:48.6267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPrn5Jhr/j7vc9Qp0/87H0S0RMIW9SIBveuIynDUymjAq+1eJN04OXOtyx+MKW7wT46YQL/NcA93sdRf31x6Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4456

Replace manual usize-to-u64 conversions of SZ_* constants with the
SizeConstants trait's associated constants on u64. With the
SizeConstants trait in scope, u64::SZ_1M replaces usize_as_u64(SZ_1M)
and similar.

This removes several now-unused imports: usize_as_u64, FromSafeCast,
and individual SZ_* type-level constants.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 21 +++++++++------------
 drivers/gpu/nova-core/gsp/fw.rs | 15 +++++++--------
 drivers/gpu/nova-core/regs.rs   |  7 +++----
 3 files changed, 19 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index bdd5eed760e1..5c304fc03467 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -24,11 +24,8 @@
     firmware::gsp::GspFirmware,
     gpu::Chipset,
     gsp,
-    num::{
-        usize_as_u64,
-        FromSafeCast, //
-    },
-    regs,
+    num::FromSafeCast,
+    regs, //
 };
 
 mod hal;
@@ -127,8 +124,8 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         if f.alternate() {
             let size = self.len();
 
-            if size < usize_as_u64(SZ_1M) {
-                let size_kib = size / usize_as_u64(SZ_1K);
+            if size < u64::SZ_1M {
+                let size_kib = size / u64::SZ_1K;
                 f.write_fmt(fmt!(
                     "{:#x}..{:#x} ({} KiB)",
                     self.0.start,
@@ -136,7 +133,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                     size_kib
                 ))
             } else {
-                let size_mib = size / usize_as_u64(SZ_1M);
+                let size_mib = size / u64::SZ_1M;
                 f.write_fmt(fmt!(
                     "{:#x}..{:#x} ({} MiB)",
                     self.0.start,
@@ -186,7 +183,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
 
         let vga_workspace = {
             let vga_base = {
-                const NV_PRAMIN_SIZE: u64 = usize_as_u64(SZ_1M);
+                const NV_PRAMIN_SIZE: u64 = u64::SZ_1M;
                 let base = fb.end - NV_PRAMIN_SIZE;
 
                 if hal.supports_display(bar) {
@@ -196,7 +193,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
                     {
                         Some(addr) => {
                             if addr < base {
-                                const VBIOS_WORKSPACE_SIZE: u64 = usize_as_u64(SZ_128K);
+                                const VBIOS_WORKSPACE_SIZE: u64 = u64::SZ_128K;
 
                                 // Point workspace address to end of framebuffer.
                                 fb.end - VBIOS_WORKSPACE_SIZE
@@ -216,7 +213,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
 
         let frts = {
             const FRTS_DOWN_ALIGN: Alignment = Alignment::new::<SZ_128K>();
-            const FRTS_SIZE: u64 = usize_as_u64(SZ_1M);
+            const FRTS_SIZE: u64 = u64::SZ_1M;
             let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
 
             FbRange(frts_base..frts_base + FRTS_SIZE)
@@ -256,7 +253,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         };
 
         let heap = {
-            const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
+            const HEAP_SIZE: u64 = u64::SZ_1M;
 
             FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
         };
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 0c8a74f0e8ac..9dac3288f3a3 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -17,8 +17,8 @@
         KnownSize, //
     },
     sizes::{
-        SZ_128K,
-        SZ_1M, //
+        SizeConstants,
+        SZ_128K, //
     },
     transmute::{
         AsBytes,
@@ -123,7 +123,7 @@ fn client_alloc_size() -> u64 {
     /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
     /// `fb_size`.
     fn management_overhead(fb_size: u64) -> u64 {
-        let fb_size_gb = fb_size.div_ceil(u64::from_safe_cast(kernel::sizes::SZ_1G));
+        let fb_size_gb = fb_size.div_ceil(u64::SZ_1G);
 
         u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
             .saturating_mul(fb_size_gb)
@@ -145,9 +145,8 @@ impl LibosParams {
     const LIBOS2: LibosParams = LibosParams {
         carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2),
         allowed_heap_size: num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB)
-            * num::usize_as_u64(SZ_1M)
-            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB)
-                * num::usize_as_u64(SZ_1M),
+            * u64::SZ_1M
+            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB) * u64::SZ_1M,
     };
 
     /// Version 3 of the GSP LIBOS (GA102+)
@@ -155,9 +154,9 @@ impl LibosParams {
         carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
         allowed_heap_size: num::u32_as_u64(
             bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB,
-        ) * num::usize_as_u64(SZ_1M)
+        ) * u64::SZ_1M
             ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
-                * num::usize_as_u64(SZ_1M),
+                * u64::SZ_1M,
     };
 
     /// Returns the libos parameters corresponding to `chipset`.
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 2f171a4ff9ba..6faeed73901d 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -7,6 +7,7 @@
         Io, //
     },
     prelude::*,
+    sizes::SizeConstants,
     time, //
 };
 
@@ -30,7 +31,6 @@
         Architecture,
         Chipset, //
     },
-    num::FromSafeCast,
 };
 
 // PMC
@@ -150,8 +150,7 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
 impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
-        let size = (u64::from(self.lower_mag()) << u64::from(self.lower_scale()))
-            * u64::from_safe_cast(kernel::sizes::SZ_1M);
+        let size = (u64::from(self.lower_mag()) << u64::from(self.lower_scale())) * u64::SZ_1M;
 
         if self.ecc_mode_enabled() {
             // Remove the amount of memory reserved for ECC (one per 16 units).
@@ -241,7 +240,7 @@ pub(crate) fn completed(self) -> bool {
 impl NV_USABLE_FB_SIZE_IN_MB {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
-        u64::from(self.value()) * u64::from_safe_cast(kernel::sizes::SZ_1M)
+        u64::from(self.value()) * u64::SZ_1M
     }
 }
 
-- 
2.53.0

