Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011065.outbound.protection.outlook.com [40.93.194.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A067A316189;
	Wed, 25 Mar 2026 03:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410816; cv=fail; b=BRM6SAKsBS1gJrGfXSfd4/p78FI+O7+1ldUfhmlubONthN/vWbTOfQkQSLod6lhvboJM8cHSkg+ebPe1k2cqLKCP42vF50+GN3nRziJLUwfaXLS6safgzMHymHLYuxuYPgKUj9HfC6+E52OLYSfQD3K5+Y/xTpdAzQPEt1tphAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410816; c=relaxed/simple;
	bh=Z8wFYYXKqzYO9fHaKX4a31J2bHLXI80LtHf7mdhgk6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cAPLCGReevQKsARRV/mRPEky8B2yv2UKBkieIWDW2VEuPkaFqcKQNsCY5eFV2IAIEUPSKi0E9m1GLhHB7p5duVrmMtD94UeGUKt4ij4MeWxVfHivnbvZMPhRQwmGJ3OXbDFU7DXRX23ZiX8xvmIP/sZGlnxRfuX7jQwlz88h/GA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WDzL97bV; arc=fail smtp.client-ip=40.93.194.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WDzL97bV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWHG5K58uZCJLkgqVViDcibxqpeJN9NJNs5X6oeejXSUztMv14osmc/Y19ICXwm1dizvN8SrrxRji6fXEeIU8X9Ym1+Pav1+NdpDbZS+3lchFuoOcd1+IhHJqX4C3288WiyA57k8qlWPf7Jt0i3Ey05X5/zZk4qDaFnsJV++MjeUMxvyGiOIBB9IEHrIimg3SJGiVvcljzglXv6kCBk+52ldN8FqnEmA3jAjwCE7/K1X9h7yDibn96R6VUc/4NaIeD7NIC6tiVV+NrgHDGD0knf43h1N52U5Ic+2C294WQ3WUVkQRazLIk0lIMD8GJbkCTc9npUyqlZdq3q8cJ8DDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFH1Lc2bn0mDibm+LFHNmx3AOI/x+Q1b1+c3JJOh73M=;
 b=Bj5NC9xd/nDZSl571B7EOLmnMgiM1kEchdqdzM54phGpaAMgXt3dOeQK4LCfImFypO/240dcjbyjiy1iJcxwSYyUwukJsoJzuBRnhD1Mi+YjPbDi7AysMGn++VnanzeDFfDK3LayStm/5M3tvCLnEU/9rY7B3xV62fvVuduD4HwhfCEpV1iuMLX9T1JJ7wCt3rkwxPqE/RWPA2y1mJti1eWIziOj3f1M7zk8CMXLO5jyc6t0P31k+EckwS0WoHZvi6zcUlFbSPxvXot2k9osOGRqSWylkoR+gDEkioUsijYg7uHyNk98GCIA0f8/cswjaAnZfsa2bXDkCAVikAphZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFH1Lc2bn0mDibm+LFHNmx3AOI/x+Q1b1+c3JJOh73M=;
 b=WDzL97bVeHBOiJbSo8kR/4jvjTkQUxAPkO7zIzjwgFsR2JYuhFlbUluaMTdj00wd7tdo6EMeGL/ExxYjoz2toSJd7ALNdX9nN74MyxN1kWvA0wIkhbiwLK4tQLHvUS8kpYhJjHX2xPAs/hTqZvNhpdUQ0McVaUGXcpqHV540wlDiLPjEA0acZdjsB+mrNcSXym1FHkspMyL9yXeqKiBnTCyXhd1l1eU+Jv576qGOlZuvtc5EcVZ4VifZp/csXJ+tvt7cYgjSSKX6rmR+ow99swMe6sGAiMnnkniUtECtwEhP3T0665MW9QtYoT7tAZvXZLCHYte1SoemupRazbccNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:14 +0000
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
Subject: [PATCH v8 23/31] gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
Date: Tue, 24 Mar 2026 20:52:34 -0700
Message-ID: <20260325035242.368661-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:334::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fed33c2-4c5e-47d3-7474-08de8a220a6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	z07/YaqN2grJ9J1hVi8V4x3sL3HCmwT15CGOD1HwpW7/cwX2oIVonUpMX+khhqwp8CdrG0wjxxoFeRQcsrSJyBH355rXpCd8nEkbxejEGhVbB4ox7m0u16UxpKe0FwO+dX1hC+z6/AT90X6HJGV8kqQ8SV3lmChwYxtw1g8SaB8fT+RvOBf/ZfMaSt2bwBx+nzUezn91Bz+7D40MeGdPGMcAPqh76WpH9Gaz4DBs0PW3N2M+KWQhcEkBUaEpR88Ct1oWjOKgFhrXXtAVHnrUEeLqzEKWFmwGi2Rvlk+Zr8XTatgAcItcKZZj95+Fv9BczuMW1qb2QJdIZtlCIVNK1ULFJMPcpSKLFfwQSzr8G5MlEXlX8J+qVVNyht9x8FAiK9/BhQWbdsSKnKIWf7kcKTWna4UIiv1TpBMIR7j/i9YrSHbr6CgJCME/3g62xNfdKE7eE68bfjfSEp9RiHJlaIAOw2a+yqpBpqfUwmgr0lDQmiQhZx/G/kAWg/lDLqccpqhZZedleQzPuNMQSuCLRvNL5wH56o4Dv2RXdoGJl76HB3OXUPzJLbEdzGsVK/zG/eXnuIIedYEujmUtYr88nXg4Ru2wgU8t/FUF6yMSdDCBkVGeNB5T7RpBIjg7tmWYdAfcaNqi8CvbP7PM3zYAYjXTdKQ9CXbTld1ozah+dQal8coT6ecgrprpHnvtZptlf06Zu4wIoViGDFLA7fjm9ZHrciPS9cFv6vfqHxMC8vY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BBQ+CoQ6Bi//gAXq68qjEOysJdCZCFS8GD1L/PEGO2MMuG91f9BLlrADfRwl?=
 =?us-ascii?Q?tkVk73gq5tJ28ycINGvNnrY56kevKXbefl4RsA3fh7mm4OjlyEvlKBktRcTS?=
 =?us-ascii?Q?oq5nNLDh3hX3pFXewIGQhRFp8qnnrMo1FdQIag/M+KooGRQO9zv5z71EHQhF?=
 =?us-ascii?Q?BQvH3rtOUldAvIisalqbtJNz9rMCsHXEKrrIMVyfjMKwu1KbIElcJjYRlA/v?=
 =?us-ascii?Q?R+JjJqs58/PGNFlxHCnxz7rhCdQbSsD1Ox+R0jb/hu9QiG61/82I7uiasOpf?=
 =?us-ascii?Q?xB6jV7MS2num7dOxyjATV4jt520sz2j9X+3iEqhHXd/oKQhq4LPVRzVpoYEe?=
 =?us-ascii?Q?60g6TOZko8r/DpQ83/6jjHNCludCN+Q6RGo0hc1ykcM704xlCiALAKLMH+fe?=
 =?us-ascii?Q?ZRRqY0EzX2frwzrDZgFx4vZIpsorQ8mqYiaMjMI1wT6/1KvqbZR6U2pf2W9B?=
 =?us-ascii?Q?q5aA/+51hAD4C/EVEJQBNmkXT34IIqkwWNEvovrB8juQAPAXMIneoQvf8P3b?=
 =?us-ascii?Q?wNFCpCzSMMAPpsyzyqMDboK6+nRJM85ShKR1hmqIVBGzn31cXULid+tKCvQq?=
 =?us-ascii?Q?eIvo6Ocf6gw+icMD50Zj/eWlyiXuLWvpHd6QF0YuWaoXCdHV2NJqpIPxjUHQ?=
 =?us-ascii?Q?llKvvmeLaufmjzH088kWqpGlGDCnV5PUNIeLw6r5cSBhe4SnICdVTAPd5kul?=
 =?us-ascii?Q?H8VxFH9P5JtLPHZD7qh8mHd7YZW13L4dkpxUEV6ZA78B2K/6M9JDk6d2bf5Q?=
 =?us-ascii?Q?cDTzKVzYe0enJhyskAcdA+wHazqBGkVUAAIwXBN7T1Q/AcX0Wsysetz+wOaW?=
 =?us-ascii?Q?3eFMbCuf5sK83Cb8qO9mtmEPx4sKHOwNtkhATj1wHxgItuc+kJ/PXbeJmuDI?=
 =?us-ascii?Q?xoOVuqTEsgV622fvGBI7/uF0aQBGdffaFr1fKnBN0nx3S9/sLdjMYUDrsFqd?=
 =?us-ascii?Q?Ld6Df5IFBK7nVWZJH5CktROCuFjBOEaygfVbX/5GATOL9VM2vFQmrKDwSgTb?=
 =?us-ascii?Q?VoWSPGM5bimasiTcpurWc/iyXRfcuaRQ3ytO/j98oW/ooWbrGfYsaw6A/nJQ?=
 =?us-ascii?Q?cWTaRYVCGOIShPXMj1y5UalJSeiGmyj2oZz4Lwg+JJn8zRCB9R2sxMCVfMMI?=
 =?us-ascii?Q?osUTWnMwexhKUoBdx1opr7Sl1UJZfRSaT9p5LSx3oO80D2GWzESaX8BTJeMU?=
 =?us-ascii?Q?6jzJSFt3D9ie0C1sLDoz7jGF9zMOMVkGIVU2iQofoFvoGPKSRLStU+oQvE1m?=
 =?us-ascii?Q?v84arsqYlmXev9+uRhH/OyGqZCa5WMi800uwqw25SPksek5uWn6dvThz3XN9?=
 =?us-ascii?Q?sdQ/ceF9MJMqpPU/3ZZxUaM4ynLmKGipEjWybHTuxs7LzaJKNENMWWk4gFBK?=
 =?us-ascii?Q?z7ZmJCv0j4i3wvcihbWM/gerLu3x0WDJlgOP1hstEi28QPmNlgYSyFH/55Oi?=
 =?us-ascii?Q?xm7FqaiSbRSPzrTQHtLrh8J99ITKrwOKos1ClnkCB40MgfQZpiTauh3wLhyd?=
 =?us-ascii?Q?wjFXe69FVwuD7Q8Dq9FOIUoIiKWGXXh21FbZg8pUu0Z6uZi4ZNDMlV8lf7Kk?=
 =?us-ascii?Q?ltMGel+LCW9FMM6H8w3YjokfDUuXeFyPNRzWvI0B3daBTRVrou+LWQAX1o0Y?=
 =?us-ascii?Q?9uwZ9THqRrb8EQWgZcvTbC0zbctdANVNole5/0g1KVcrHs/1bpvigwqSZLtC?=
 =?us-ascii?Q?cGncrj8FzhXDS5qW392j6snT6hb1WHItuPATdDTGASDwfR2IMsRLe8cFj2mX?=
 =?us-ascii?Q?mmyE5BwM6g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fed33c2-4c5e-47d3-7474-08de8a220a6c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:14.2828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5wGtYkf5qlQhE88FsmunwEaIZ1nvr4TfD2m4ewuloWfB0SuBr1zHxHdkq8To6jquCMgS4NNFePeGUMdbEq9jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327

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

