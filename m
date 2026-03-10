Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010020.outbound.protection.outlook.com [52.101.193.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CB03ACF0B;
	Tue, 10 Mar 2026 02:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108739; cv=fail; b=SFa0fUOxtzP3j7LwzM5YfIBlX3d1+38gKCieqmYr2B3qA7qAZJ90yFhjIEQspn8WCRp7lrYxRzTOHFfLfH4A77m3KIqUJaHvRyItrqWBJ6d5IW44yltE/fUoSQ3g9Fwi5MwLUBoWZNNtFngkcEvSbYJVywzW7QPWWxHfRAmver0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108739; c=relaxed/simple;
	bh=Z8wFYYXKqzYO9fHaKX4a31J2bHLXI80LtHf7mdhgk6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jYrv1/ZJKg1AO2F3hGPyjdQEIj8609kWRCLe30yUhj7lJM1A8XloV3qPgatez0XVNTBPrco/Zdh4bhTx2/32BtompzmCjaz5STQpba2fKOYtV8Zm4DDbRV6910XNon4n5TpX9ESBHGIke9V5gG0Dv6qRj8AuD+VZ64d+Aao39/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sCMEkfpw; arc=fail smtp.client-ip=52.101.193.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sCMEkfpw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfsP+0TLWo4qnApFFr6eqdI9YgSHrNHPRthgyUr8gwXKzJYMKI2rLZso7aj2aUV6mM7XzYibNFcNvQZF422gwtkqATtMwwGooec1lqb7kQKp4fQ5vVX4+FR43KRJ5qahN7LNxCTJHfuuBLp5JVr285KHPb9hmfL9G66zs/aIzPV4zM5kfOejc+EiFxpmmHyxBR8e29u3eeLVDcpXaiqTPL77PLjnj6bkm9XiREIBwSE/EUaAGHny3/qJg5Bt7+wxyjZ8sExoq1E736xpqaLvM6da4PyWSEGvXIqOepOZpZ5m4BPP4T8ODe+jjdgh3uimS8YP4JyU+ZdopfiZnNgsRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFH1Lc2bn0mDibm+LFHNmx3AOI/x+Q1b1+c3JJOh73M=;
 b=bZ/aI/QNEz3PmNysjpzNilvYodz0t0F2QurPBBSb2BDYOaxKOLtGqNR/Z8irLSRfwS4vso5v/yUrmmkRFqNvf0F3bgV48r3qP2kDGIwJ9/VSPSjJ3UrA2bjOpk6H9h4/yhvfJdRWn3wMbI2/uf8hU4dP6t+eSITBzHobnCgjgV65aRplLPn9V/s+R9SQTVG9HtdRFh2ycYF+7vYVL/MWbAS1RuvDyl8SWqNtTtVAViUc3SIAhr6XY5pwYHh3i1/RNZqb5wIuAizms3V1muXjA38mGrOq7skWb2czfN8KzelB/3hpj0VYvC9rv+68W9J7VPqlHc8RhAfNuSWCzU9l/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFH1Lc2bn0mDibm+LFHNmx3AOI/x+Q1b1+c3JJOh73M=;
 b=sCMEkfpwk7AhDGbISf+HEdwxK/lqPenP+mSOWSFGRBBGJ60LnNKgWheTEd5G3m8rFjUwmKAQq54K+IR1J6jRjeppdC7HDDUbz5kyBwFEAu8RvbLjR61VhHm0BxLbe2bgJZV0bzYR0kIzbbQoYzyFp9QqQfJQQqKVIfToIsVOF83ue4Nb8pI+gGBA7DlupkZJ+f2uTBHbvtqGwDcoMFyV0dO+LPXsH6vlxGZMY7NKRe5umYJlBWPkzJl5Z5Rsh2b7R6AxPDLzKuJyyAyHKlNY8xKs5QdnX6sahKsYluoErQInAillt3+U0hF/ETRFBmLM4Je2P4YwG6WxljgQkfWWSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB8070.namprd12.prod.outlook.com (2603:10b6:8:dc::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:12:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:12:05 +0000
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
Subject: [PATCH v6 27/34] gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
Date: Mon,  9 Mar 2026 19:11:17 -0700
Message-ID: <20260310021125.117855-28-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0025.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::38) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 070b6bc4-1524-4753-25d3-08de7e4a6cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	GXRLid9hZ/9UWVuhn+ZZh5WiF2kCWumPV4/LJqczPQCIgAvdUg0mBShNLwKZS7WXSq/Mi5t1IzZ1sWQB6ASvHnZZxtLJ2bwRM7tJzpp+HyRQ/V0n4PyvhELs2Vs5+0okw+AAvc0//XSKc3gKC5/bm+TOkf5mi4C2ZXAyJBlrmcn7lZ6dphnB8RgWmKWxRPXQvUhuG8vlF3BwkIMUUviauEc1cVXx/0V9rKgYnlzLaFL03hhFVnVbQmVsmQGQxgQVWWyqgIMf9I7NLjc/czE0WljIRfiHoBLL63ZoY/pXPmDBxvJhaDCIiIBIdF8Nc0WfqpSt7EJcz9gh2fcrXgfrxHbflJ4vCkM0Lq+wXaAbY8N+8VNkFVezxqwkxy/z6pvjz3OOJaeNrFLckjyfgqxXH2Epv8mywG7mJ0PlZz1m2AVHZ8FCS/O7N2LgOgDtYUoI+3TziI4xB5IMiG9aJ/OjgGhenXN4ZZwJl9PHGimD8xmPlboDO0B24GrFzgqbWIVl71E3HeZUS4ZK3owazJW/Y0RIxn+cGI2fiJr2G4eyoByXfStNIu+E/yoB6jvggECTjwNftZdBLWlHVqE5ajfnjO2XUeQQPXqeu3CXdzGpfES3Lx5/q3DPfQhG0TKFEfK2VXt8sEFFJeNs/IA7BrDbNqUBx/jebrwMAmF/t2g0NrRakWdIDfVEAAJEv7A/r5rozUYC4O8Ct7xGanpMbIwR459f5XSUQbwAME2Tkisb3X8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IfltNEErGHPrhH3P32HvZEKvDufWCNhpopIAxWWEIZik+YbQo75MeDMsG3cm?=
 =?us-ascii?Q?Nj9jq9MngSJFGiRnZwYD5SFkL9jdDjZ1HHKt5Noy+YGbDU0G92uw/xOd4dvw?=
 =?us-ascii?Q?FG3tAWPQnL3P9e0XVmTvgZ0PSkxtnsgj8/kQpZYUWC5kEIfXot78VgT5qK2i?=
 =?us-ascii?Q?Gz7AXs/STP6cGUj956cYOAPf1/AMZ3o+IZ6QxV0wl3HfesMEz4Y27sQTK0wg?=
 =?us-ascii?Q?dr4aojZc/epTpA1Gh2T05mZK98lLLeFxjm8MIpC9aHImRm9SD6z5IkUbvAwD?=
 =?us-ascii?Q?V762rnIZ5loQi8NyW2ZEKpCl/smH3gNYpIWrSe6lb0rkkZF9lVhcUPO1Rjnr?=
 =?us-ascii?Q?bIHtBcpXJfO+aZh2gYqJr2ZYY/X7xlfA69PplKq2bFzekSfJfksCELRkY6kl?=
 =?us-ascii?Q?QH1bQW3mnJWfxY2MhteAqoyV9tbilFEn3bfaIYjkgDKJQRk/ziZP8ZLv5VrD?=
 =?us-ascii?Q?G54zbD3BK4Acg5zv4miSI/qBEhIjd/2Z6m960mb1/ltPdSnrB9VSgJlQpom+?=
 =?us-ascii?Q?RHR698OjUV/U4m0LkdCurKIk0THei9UQIUXbQHBxRqQ4CVpCGR+cDB9SkARr?=
 =?us-ascii?Q?8EIDj/PD4cifxPW9wLR3mh5EBdb/+rPrXAO3X3JiK/DE1YAkTZP4gYc1rhHH?=
 =?us-ascii?Q?iGw2di64Yk0oCsqx3Q+JskgHOKIrt3qqnl3nqfvQmIGKkhaTfocfBJvEIixN?=
 =?us-ascii?Q?TNxxEn0dgZ1BJzCSgVV9P72XjZl/fyGyDwxWEFITskZ9Xe4lQw6XMSigXj+b?=
 =?us-ascii?Q?Y53kU7oMGmeMnIWbx9Om+vnl32Hcq5ZEXEjjBR/9MGutwpHRw9gwbznVjSi/?=
 =?us-ascii?Q?PfErjCmMhzJ9h/Z5K7X9bHq/54z0/37J3MvE1wUFVKKjGMIlJqub41m8NnIG?=
 =?us-ascii?Q?Lyeeov0P2tiQJjcXS8rCzrv3P53mr7Ha5/ZXbbvSzat2DBXwn7Wt60r1H6QV?=
 =?us-ascii?Q?pwSP9oYyQhI9asCmxvQhnQqUCvpbEsz3sDoCck1DMmasJGH8Ym5tzUttK3lP?=
 =?us-ascii?Q?1zHPIuYFyOJn4mvickREA8ENkxRbn+914s6Pdz/H1F5QI+4vJgh1npvxtDqQ?=
 =?us-ascii?Q?qZKT+Z1iQFiSaf9nkE86nLXFs/RhmlcTeNdM+oqTqycKcKysH65O8eUou3c8?=
 =?us-ascii?Q?91+mR/X7CjqAxAF6zQ2CwX73nf3OMTQKPurMhm4dbXm6KFYXf5uBf+XH40Uu?=
 =?us-ascii?Q?Rbe5dlK1tQTrOHSVvhbdEVr1dyJZiRElI7Xn951xQ/4A7ohs6clkVJCECupc?=
 =?us-ascii?Q?2QBwbRiPDmZGMn5UfQk+R4IzU6VvdJhsHOboAaE76T7+q0CdCm33r+cct/aN?=
 =?us-ascii?Q?QtIT8YIXnVAKg879hYnIczeZVL9hYhRKOlbDSe0pol+JHuRojasOInZrBNQy?=
 =?us-ascii?Q?gRdFJpVRE/BXLa5T2ConKa5xJn1o1980MsB3DYKYwBBTPHWYKkCFIqMN3YMU?=
 =?us-ascii?Q?PvtL2gpgoJX+KZF2C/NK45Tbn7ho0Kh8UPuf5Vxo64wmitfxK9vybbAf/FK+?=
 =?us-ascii?Q?Vdk3U6+yWxZiNvQaAc7xi9zu5kphXAnDRlm5seqiSiiiH0ugxecCkZoFEP5M?=
 =?us-ascii?Q?UzZ1SBXdkZpjGlR/9aoO2EoFdS6OsSxPGZaqhOe1Lt+uwGJCa00DV5flhzvG?=
 =?us-ascii?Q?kn/tDZjnZ7qFP9fQaVt8OfU4bJk9iY8Y6ytjUfAu4S/jo1zsApz2PPMj9QQ1?=
 =?us-ascii?Q?sBsgBRRgb6k8ONoxnIxM13LdpdkRp0wRIesWukVBVt/+Wh4t3p2QDz8VcOZj?=
 =?us-ascii?Q?1Ir+SweFtw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 070b6bc4-1524-4753-25d3-08de7e4a6cbb
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:12:05.2069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+v0JCJcBtUeT7bB3BSN3H6jD9Xi4ka62XV1ibdzXBh3FOJyRRDA3adrOiJaZbsgkR8HddIVGxl0Y+Oyz5YWkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8070

Add dedicated FB HALs for Hopper (GH100) and Blackwell (GB100) with
architecture-specific non-WPR heap sizes. Hopper uses 2 MiB, Blackwell
uses 2 MiB + 128 KiB. These are needed for the larger reserved memory
regions that Hopper/Blackwell GPUs require.

Also adds the non_wpr_heap_size() method to the FbHal trait, and
the total_reserved_size field to FbLayout.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           | 16 ++++++++---
 drivers/gpu/nova-core/fb/hal.rs       | 16 ++++++++---
 drivers/gpu/nova-core/fb/hal/ga102.rs |  2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs | 38 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal/gh100.rs | 38 +++++++++++++++++++++++++++
 5 files changed, 102 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index ffb996b918f8..c12705f5f742 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -31,7 +31,7 @@
     regs,
 };
 
-mod hal;
+pub(crate) mod hal;
 
 /// Type holding the sysmem flush memory page, a page of memory to be written into the
 /// `NV_PFB_NISO_FLUSH_SYSMEM_ADDR*` registers and used to maintain memory coherency.
@@ -99,6 +99,15 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
     }
 }
 
+/// Calculate non-WPR heap size based on chipset architecture.
+/// This matches the logic used in FSP for consistency.
+pub(crate) fn calc_non_wpr_heap_size(chipset: Chipset) -> u64 {
+    hal::fb_hal(chipset)
+        .non_wpr_heap_size()
+        .map(u64::from)
+        .unwrap_or(usize_as_u64(SZ_1M))
+}
+
 pub(crate) struct FbRange(Range<u64>);
 
 impl FbRange {
@@ -253,9 +262,8 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         };
 
         let heap = {
-            const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
-
-            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
+            let heap_size = calc_non_wpr_heap_size(chipset);
+            FbRange(wpr2.start - heap_size..wpr2.start)
         };
 
         Ok(Self {
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index d33ca0f96417..ebd12247f771 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -12,6 +12,8 @@
 
 mod ga100;
 mod ga102;
+mod gb100;
+mod gh100;
 mod tu102;
 
 pub(crate) trait FbHal {
@@ -28,14 +30,22 @@ pub(crate) trait FbHal {
 
     /// Returns the VRAM size, in bytes.
     fn vidmem_size(&self, bar: &Bar0) -> u64;
+
+    /// Returns the non-WPR heap size for GPUs that need large reserved memory.
+    ///
+    /// Returns `None` for GPUs that don't need extra reserved memory.
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        None
+    }
 }
 
 /// Returns the HAL corresponding to `chipset`.
-pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
+pub(crate) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset.arch() {
         Architecture::Turing => tu102::TU102_HAL,
         Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
-        Architecture::Ampere => ga102::GA102_HAL,
-        Architecture::Ada | Architecture::Hopper | Architecture::Blackwell => ga102::GA102_HAL,
+        Architecture::Ampere | Architecture::Ada => ga102::GA102_HAL,
+        Architecture::Hopper => gh100::GH100_HAL,
+        Architecture::Blackwell => gb100::GB100_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-core/fb/hal/ga102.rs
index 734605905031..f8d8f01e3c5d 100644
--- a/drivers/gpu/nova-core/fb/hal/ga102.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -8,7 +8,7 @@
     regs, //
 };
 
-fn vidmem_size_ga102(bar: &Bar0) -> u64 {
+pub(super) fn vidmem_size_ga102(bar: &Bar0) -> u64 {
     regs::NV_USABLE_FB_SIZE_IN_MB::read(bar).usable_fb_size()
 }
 
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
new file mode 100644
index 000000000000..bead99a6ca76
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal, //
+};
+
+struct Gb100;
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
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        // 2 MiB + 128 KiB non-WPR heap for Blackwell (see Open RM: kgspCalculateFbLayout_GB100).
+        Some(0x220000)
+    }
+}
+
+const GB100: Gb100 = Gb100;
+pub(super) const GB100_HAL: &dyn FbHal = &GB100;
diff --git a/drivers/gpu/nova-core/fb/hal/gh100.rs b/drivers/gpu/nova-core/fb/hal/gh100.rs
new file mode 100644
index 000000000000..32d7414e6243
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gh100.rs
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
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
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        // 2 MiB non-WPR heap for Hopper (see Open RM: kgspCalculateFbLayout_GH100).
+        Some(0x200000)
+    }
+}
+
+const GH100: Gh100 = Gh100;
+pub(super) const GH100_HAL: &dyn FbHal = &GH100;
-- 
2.53.0

