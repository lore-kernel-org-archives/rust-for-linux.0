Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011036.outbound.protection.outlook.com [52.101.57.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55C83FD137;
	Tue, 17 Mar 2026 22:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788085; cv=fail; b=PU8BZCKoOtflelD5EA6FxcBkCvmQyrvXFzK4BIa4HdA/ePZHxOrXyLfmABwBKBIl5bo9xLExvcmCcNYPU6tzcYYOECAZbHPKi4jlQDBMmR1AeIo1v50N4E1yiaXA3wep/GyluTLXF3mtGJcvtH0gtOd/leIvHjgYeTUG6FzOcTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788085; c=relaxed/simple;
	bh=cF30D6701HogBoOXmYnXFi9lu1miEzrDYQR8IYgU3a0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O1BQwfRs7DRMwIq0buJsq3QkLOpbCLAyVkB3JWJYZLVJ7FYV5RzblK3R+nqlrATzaFvDgElcL1Wi6akfEb0CBSQ9FfY/F1zXaCUAIAZZmy06++3P5P78lJJIbvPzD85/Ffu3U3gIRXX3Xi+eopLAXyDsdO2WVBKfd09ryELg9Zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PshmE3Xj; arc=fail smtp.client-ip=52.101.57.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PshmE3Xj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0lZZ+Kmh3U1Y2KhV6GsAZgX+UFhzZPR4EkaZkiUREbY90TTXeK3zntK0sbhvwWx6x9VewSqSNE3aq4ctZ8b/hXaNUJTpGu5M/vD5jy1EDt6BKvkL4t8eS1C2HKvVAXWAWnxt/g72aRjLWuzUMioK7WPDFpFOr0oW1vBUGYQCvWL/+aYJTGqqnELhZtcsvAdtLxc8O33ST1X2atYDBHKmnO5Z5zJkRZzoXm6v5n1pfqmfcmTYrFJTwk/qbATEbJTzoEueTvEs8vV6gWHyuDFo/ncZqJ87D4qajNJHWCjgGkI+GfPcpKV27wq80M0ChtjiKArPU+JlzFluHDV+2k8AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLTekVStI/SaaWTpw1O40ucEt00jVVhiq4DHthlQRxA=;
 b=B7eALOF3MmCdTWQ6t/kEHoaZUjyGM2iPHHeo09jnEGE3fjoqP7b8TxF39KW3wCetL0nZUhW5uyoKJTQPxiZtNy6YltdBC7STNuJJFIMw2QgqC0LY2abi8c6d50lZaMnBEvQNT7lZp+l/ZTdzwlC+tyAV7xtcKZmCN4pDti4/be/z3VpJPD5hYY5m12YQazOOXkEO2ZQgpsBA9A34C38p0u0Hy+/l3b3VtoCQyU8Lzw2I4AgM0ExvEnejRFeT5Bv0yxNanLwLtbT/O9iq+xUzHREt8PJYwmdgxMd7VC7CPnAtP7vA4WY3xFVfOvP99Zft6SdSgmIsCpVMoaZmnvtwRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLTekVStI/SaaWTpw1O40ucEt00jVVhiq4DHthlQRxA=;
 b=PshmE3XjBDgoVeo2wgN/LGP3i2s6qE3nlfMxu668/sAfqeyuBjwjFXjkRdC8OA+LWbRaAtLT99CLRdDjF1nvWsY5/3rxusOtYUsyRrxSEt3Ut4fU6TGer2lsYY8UdRCjvPy8snVpgq5jGxyy/631+I3jAXH44EgVoqtTFW2No15YOCsVFGmFIz/gui6RoG9EBLQFvyct8BwGa0zRgZHHNTE4PEb1K9hnxkgn1NqpSTJ19i20QJeLtEAiMxDW4Ew62tdCnO8w+dZgQbCNocwFpruObNI4kXAZph34sIJNrfPprKaLD9tLvCwT1ukThJQiLfasj4xufEvxRSsB5UZ5bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5848.namprd12.prod.outlook.com (2603:10b6:408:173::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 22:54:34 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:34 +0000
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
Subject: [PATCH v7 27/31] gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
Date: Tue, 17 Mar 2026 15:53:51 -0700
Message-ID: <20260317225355.549853-28-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0253.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: 87694433-db86-4773-21f1-08de8478281f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C16OWUQCHcrvTczTuFOOv3BgA54ZEOp4NQVI4w1mhwkAO4zfI17dxjlon2dRQmYVRmpGDZDitddrlY+c/3PsvFjhwyNKRrV/GKe4EZtf0/+ctNfghohF9wXnHlQTbLNZrsMo6ugvxBPFPWDnOiHk7/uXqKt7UN6ApnX0IzBuk8CsXlo+03vHQ9HbaPTELUu2nF40lW9hYs2+u39/GcelH6D3W9vE2URRom2ms5bRpum1YUUH8tM8Er5N0KF86i+bF+bTnht+Iua5GSzNhfmbSOEo7iaWE0ur1V+I6gMsAaTcvozLc0p3HeeNlkCrb5nRJ65/TM4LFY5fycxjjbvRU+aD4zN4nrqzmJehOTf1mYkgvTyMNhkmSwzv3Rg7ZF+cui711mmhS2pyCCY2PcZknZWMx9dt+7XcW0wqkiYeDhDO1y6tO7qd6VKFE5jG9zNA7e8PST0eMBQTzm9OJGyUgbNwMxbpcNNyEdxq+7Vo4VUHn2y6Mh1WeR8m7O76yR8J7rdamuSJuiy/D7p8vLbWzAxVsFfEwoz+cUzh76yGx+gVJrjLS3rl0QcdFXcIaPbsGX/PDesp81CNQNImEWtVN3FqkjWjWQrdqu0GWCgYOOo5twAEzP8agiAyY3qPPBTPIgv1SAvv1CgKPDNvqWBaJlPv/vJShCEF1n7xSl0CVRY/hDKOrKTHw/RqfZNIl5Fng0BUEEZhPkGz/i1XxumrZlws4yTajVTB6yO3RAL+vt8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wGPI28sJom25xxnBsoRSF5LOkByJn2QAfjRzGU6vEtn5dNL2oqlKTCX/iwAP?=
 =?us-ascii?Q?xEA6b7zgUbJVFP/oSWAOd+oaJsm5u3O45bdY7ZBEHXokS54tQ1FE9cR651Yq?=
 =?us-ascii?Q?12SYJvWoXlolN8s3Vzs3ibDVzhyKqqsni1OWUcPFvuZhSPwFn0FWH3wLOzlT?=
 =?us-ascii?Q?J2V9oyBmFcQXvN7m1T9xxNL5NnZchg0xnKlR/eOtLnNwED9Pb2prm3bQyZGS?=
 =?us-ascii?Q?ISEcHXU0UPFxHl2QNiXBLgEfI/4Ixmh0iF0/SjaqGe7kDC8JCHEUgVYfWC83?=
 =?us-ascii?Q?xtvJ/HxF06oSREUV1w1YSayDbFpn96YBF38bDqfKPOcWDsVYO1l42ug+k96b?=
 =?us-ascii?Q?W5SdyciuVjnqA3LF3OS6criYUjIYLqWVpKNPB/v6q7AJ6ibhLnJp7PceG+8P?=
 =?us-ascii?Q?ONyBcWKZiUvwe55N4Q6H5wWix9Pa8bjQ+/YyBzjsO6OFFmD5u1FYOzP+M3Dz?=
 =?us-ascii?Q?7afjguOpx/nr0Agwu/MMd8ReAeBxJ45yH8sSd0PgWrCgrKReJPyHGBJhLWdw?=
 =?us-ascii?Q?/1NyyjVgY5EslGbc5DF4mrmdFaj6f3cjIwZxNKFCaq5wb7KfqghrtQ5Ntr11?=
 =?us-ascii?Q?kXjOxAtAwwuaR2y3i/dGE1cb1XVb6wgKVbqElauSNl940g8D1/noYY+H+7UL?=
 =?us-ascii?Q?xQe8rXzj4fYFR0XGq6n08S5UwVmRgW5cQiS6CNHUJpWYYmM3yPV5EAyMuiEo?=
 =?us-ascii?Q?OIrFniELaG1qnWFwj7mMIQypHwxMFbgu+O1iwv+cBamGniZ7Xhi5bQ1PkjR5?=
 =?us-ascii?Q?Q8tEFqRFUbqR07oLpEOuuKk6yz9Wb7jAkKI+juoLDyNC4wd4APsHyAg/LmO1?=
 =?us-ascii?Q?M0apLXTNM156PY0Gg4tEcCQtGyTpt1wz7+HsrnMu/bvshl6ZgS9Ndz1QNjwD?=
 =?us-ascii?Q?SzaBMwEXnZQ9GKYfdJfxnJ2DUNwdb2eYLR/ZrEjgQ4gaGsj9Cv/14IJeVoIW?=
 =?us-ascii?Q?tv7S9Qez/yUOPdullsYnUc9BbdAIF6W0/lzxcvM2UH864qvQpnGnOO63ps6f?=
 =?us-ascii?Q?kuHlQdgvuCHmO8L3DuO/6C+1XnhYE8Bh0B8bb9QbvW5y5dPwQVKOLuFFkLBR?=
 =?us-ascii?Q?REi1ryPhgkiyF4zOTSbGkuNXkzV92wqNqPG8KMbA1cVFddcHCnCa8zrngJwH?=
 =?us-ascii?Q?+Wf5Ar0xoBB3XLwVmKSljAD7lfWt9QW1o7OX2UZovXSzxhTq1ubK5EfsQRmx?=
 =?us-ascii?Q?30WUj8spiIspU3/7lgO3WyFptcFHlA9W8DeffIv4+JE9ZGDbpgUAY1E9i7Yl?=
 =?us-ascii?Q?MVu90ENU42dkkN5V0GpsCW6/HiPQ/J9qDbmaTlnboZ9+1PMqqucK0+KxuJGG?=
 =?us-ascii?Q?z7MumReqagSNguoNtJVvgJs2m85NCbwd+KUcfGZuayo2QaWMW80ZmF6C+luB?=
 =?us-ascii?Q?zVP5IinqJcpNTr/nIIqDWuyk0H3cQGoL7RFCX780kH0ekDcv/P9Xx6oK6m4f?=
 =?us-ascii?Q?IuuZsauFm1oT4N9ZmLBf3BT5G8k8Aw8yvP0tv+tSPoBfYSsLHG0SgQunI4NS?=
 =?us-ascii?Q?dgaeyEkwRwnKlfJ8no+1TueEW3hnX5OBkT7FPmm4PvqeHRZh4AErttGr7prU?=
 =?us-ascii?Q?58rm8LtsktpGeEFV/+9H1jx4/PR0ZokVofM0Mdlaw1JzGCv7h7f0KOJ1Pv55?=
 =?us-ascii?Q?mboN8ZYQLTmWyLqOdbuT2Q/6gGbOUkLAoq2W7iOSPyavuQF/hP1YllwJwC1F?=
 =?us-ascii?Q?a15xCMil/+WIdqupBdSZkqUDZYF8mgXmoda4YWfvGIhRdBMmDg/IUE39ZO00?=
 =?us-ascii?Q?RUvg7chHaw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87694433-db86-4773-21f1-08de8478281f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:33.8874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjSolc3mvAfuRJttgDmJxOupoZfRdO99naHgJ7DTGk0GhQewBiUrpDFPvSkPtSkNcxu+X+Tao16n2B3oyB2nfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848

Hopper, Blackwell and later GPUs require a larger heap for WPR2.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 61 +++++++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 4a8ba2721dd1..c2eee984bd4d 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -121,21 +121,41 @@ enum GspFwHeapParams {}
 /// Minimum required alignment for the GSP heap.
 const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
 
+// These constants override the generated bindings for architecture-specific heap sizing.
+// See Open RM: kgspCalculateGspFwHeapSize and related functions.
+//
+// 14MB for Hopper/Blackwell+.
+const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100: u64 = 14 * num::usize_as_u64(SZ_1M);
+// 142MB client alloc for ~188MB total.
+const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100: u64 = 142 * num::usize_as_u64(SZ_1M);
+// Hopper/Blackwell+ minimum heap size: 170MB (88 + 12 + 70).
+// See Open RM: GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB for the base 88MB,
+// plus Hopper+ additions in kgspCalculateGspFwHeapSize_GH100.
+const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB_HOPPER: u64 = 170;
+
 impl GspFwHeapParams {
     /// Returns the amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to
     /// and including the first client subdevice allocation).
-    fn base_rm_size(_chipset: Chipset) -> u64 {
-        // TODO: this needs to be updated to return the correct value for Hopper+ once support for
-        // them is added:
-        // u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100)
-        u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
+    fn base_rm_size(chipset: Chipset) -> u64 {
+        use crate::gpu::Architecture;
+        match chipset.arch() {
+            Architecture::Hopper | Architecture::Blackwell => {
+                GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100
+            }
+            _ => u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X),
+        }
     }
 
     /// Returns the amount of heap memory required to support a single channel allocation.
-    fn client_alloc_size() -> u64 {
-        u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
-            .align_up(GSP_HEAP_ALIGNMENT)
-            .unwrap_or(u64::MAX)
+    fn client_alloc_size(chipset: Chipset) -> Result<u64> {
+        use crate::gpu::Architecture;
+        let size = match chipset.arch() {
+            Architecture::Hopper | Architecture::Blackwell => {
+                GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100
+            }
+            _ => u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE),
+        };
+        size.align_up(GSP_HEAP_ALIGNMENT).ok_or(EINVAL)
     }
 
     /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
@@ -179,12 +199,25 @@ impl LibosParams {
                 * num::usize_as_u64(SZ_1M),
     };
 
+    /// Hopper/Blackwell+ GPUs need a larger minimum heap size than the bindings specify.
+    /// The r570 bindings set LIBOS3_BAREMETAL_MIN_MB to 88MB, but Hopper/Blackwell+ actually
+    /// requires 170MB (88 + 12 + 70).
+    const LIBOS_HOPPER: LibosParams = LibosParams {
+        carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
+        allowed_heap_size: GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB_HOPPER
+            * num::usize_as_u64(SZ_1M)
+            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
+                * num::usize_as_u64(SZ_1M),
+    };
+
     /// Returns the libos parameters corresponding to `chipset`.
     pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
-        if chipset < Chipset::GA102 {
-            &Self::LIBOS2
-        } else {
-            &Self::LIBOS3
+        use crate::gpu::Architecture;
+        match chipset.arch() {
+            Architecture::Turing => &Self::LIBOS2,
+            Architecture::Ampere if chipset == Chipset::GA100 => &Self::LIBOS2,
+            Architecture::Ampere | Architecture::Ada => &Self::LIBOS3,
+            Architecture::Hopper | Architecture::Blackwell => &Self::LIBOS_HOPPER,
         }
     }
 
@@ -198,7 +231,7 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> Result<u64
             // RM boot working memory,
             .saturating_add(GspFwHeapParams::base_rm_size(chipset))
             // One RM client,
-            .saturating_add(GspFwHeapParams::client_alloc_size())
+            .saturating_add(GspFwHeapParams::client_alloc_size(chipset)?)
             // Overhead for memory management.
             .saturating_add(GspFwHeapParams::management_overhead(fb_size)?)
             // Clamp to the supported heap sizes.
-- 
2.53.0

