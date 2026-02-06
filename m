Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012058.outbound.protection.outlook.com [52.101.53.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180DA33DECE;
	Fri,  6 Feb 2026 04:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351712; cv=fail; b=qR3u56nBEyeaj/xOD7cj83BI4nMoa/TMMbcRGP+cd2Het7IixPRVD7xFSgWX7pDYxVkWGeie4UJuGpHHUy0R3NsKAapu68h+ln+dlqR0Ny5ECdn9qaBWtg3ien9fq9FtHlwAWdD7BHpZB3mJHwrWHv2aByBlh80ugDExj5yXUqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351712; c=relaxed/simple;
	bh=P6/1jqOp9upUp5tQJI8ZJGF1uKKmZ157Q5mRgdmgs6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h1qJgRKvgPOLgtEiN5xl9/dwZL0ws4U/h257u94+9vx2E/tnmSyBpjzIrmnK2nIKLCslJVcDHvVCcd2il6sppuFctRRt95oHMYzBTyX4wryLQphja85S+9Va7TOAG6DBdrbT1s5oOP6Lbhx81lwznYXyV7wYZBshfGdRrAxi6v4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X6nen9X4; arc=fail smtp.client-ip=52.101.53.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X6nen9X4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVOL91BOAy5JSE8xRuR0J8WhY0Xr5k1wD4GnDhjHZigoUP2zxsvSscRS1x3thqcmoj6aJNIztK+35QoyYYd5i8TF2giSpjL0Lqlioj8isCWNxZRIlKReZgvmVDPLGCPvTxD/Nt80FkX+ok/8zTLZSxx5+OEw4Yf/dTWZ0dj1FBhWZjegoGbbi+PDh57B5mp8jLdpoDSsoo8eji5UZgIlvaT/OT7WGgXfarU/aoWjaK7L+XBlYxGxwEMJvvapF0Z1BVdRwsjAtwXw5icXt9g+t00ZuSyc/lrsSKYf08IooELfmBuVxiDQPLH6aFoMP2dcHHNrdvEM+JZtq/eegE0e8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Izb7MiMLfhiQTUnOE12FM9H6FE4104VaMSFtguM7/UI=;
 b=jxT3+XFYSBCsCJFBH8JLojT+nMnIcQ4/mYzbzsTunMhNS0ZIxXiyRPzSWqL2eCnX2kFyy9EKam5VxpnfUvwlL2Fy4lROXvf+8VY0YAlyPA21O6TbfpyFTOHFx5Yn9ZrrIGC/5JVrSTIfrg0w6w0sQaZsLiKkXbGacXcGp9HVI4ZsJMLN4poVBWs9Dkd0VWHIrix7kFKLpPrnv+OEAieuI/WQC3tokOWLN24vd7eCvW5Wc5rIYEKAaRBby05NE+LLEs46SnYfxvPVJXBYbEdNZTTlfAV6J3SVtDikFxzXof2hFKn3a8abUl3n+tDgfZnD4O3n/DAhc307vh18KUPmsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Izb7MiMLfhiQTUnOE12FM9H6FE4104VaMSFtguM7/UI=;
 b=X6nen9X4tQKIQtrkAFxV6MGdwmDo+DfV04fSHoHFDLLbAU9ivbQfHeQJFsk990FR/1UvbWElFu3YvMRZ+81sQEq/sHKLXR6RnXW40JB0x4c221BiJUrqjToQZQSHNJRHPQuJrFGW94wGXXrWj8Z5VBaa4zs0Hq4o1lmfyXToavyhpGGYdjEKO9nkyXwHyZPzDykkqS1sS+QeooIj/KD0hGtP+zbIgmJmrYUw0xehlFPd7nD0hzX1QvikFLqNSzcc3TkZgNKtlEik0wAqF/LpN4YPtCJBoZvp02VsX0cAUE0HR/vbwZ5y9Df3xdKaRUoMXfdQBuRnvjFuUkq4aIwFRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 04:21:48 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:48 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
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
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v3 16/30] gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
Date: Thu,  5 Feb 2026 20:21:09 -0800
Message-ID: <20260206042123.303281-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::36) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: c59d9a70-7e65-4583-1ceb-08de65373df6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uTZRuI4CqM08rDjmguaStIIoIYZXCJewv7M4RXKxoDRUTHsNzBfDkSXtMbfL?=
 =?us-ascii?Q?++/VYvfY7YGgey/Byi029Q4NKcXnjOEhFXKccjy0eVoYaZkFP6dtUycAuLlQ?=
 =?us-ascii?Q?YEQA44+glr8Lcclj3lt8wur2BZIFcneJnAuS/4okUw+IwkEkPwQyMnz85nLn?=
 =?us-ascii?Q?iCF/v7AsQAQ2mFXynmHephc0DlodZF1wdRzs/0K8M5de5yLxFZGx2I8zmhOl?=
 =?us-ascii?Q?GwDUUPfBntqYSR2jS5NmyEwaPAakW3PRKxj9bczlDJ/9Fmy5ttMYfbaMoNn+?=
 =?us-ascii?Q?svg8TNS6yWGfZvaP6QN5++H7EBK4WtGyhHyXBhqFezmLjI7/MUydkRLxBplB?=
 =?us-ascii?Q?Skn7u4WROthTg3vtbbvmqLiGpJZ7aMeXQOrCOSfnMWrG4ftBYKwlZj/fTMF3?=
 =?us-ascii?Q?0NdreSzsCJOooSCVamypoR6tANvlD36Ljva/aVHxFw195vEGwQM9mJjPLQ1t?=
 =?us-ascii?Q?4HDop5MsqWgaEgKpjJxlnI8/rZ8p5MLgJa4/1msC7EsIfuW7eBDe5C5k7UI1?=
 =?us-ascii?Q?e0NfR7pjWqxHpf+P7bGSkPBNMdMYt0fkd8FP9HxFieICS5DVUFyGjUL2dsxK?=
 =?us-ascii?Q?NOvWitB28/pdYgZJJ9DFI++9QEDwVRYpLlp/RHS0HvTCO/5Yl2g1W4i6dpnR?=
 =?us-ascii?Q?BuExuuVDrZsVr8iXoiqMhwIFq0ry3BTf4QcSyJem+bSI9a/hLECT+5Llcr4n?=
 =?us-ascii?Q?tCKn8YpDrPMAGprDkCr6bWUGnPN7CrKHYh2DB9scrppKBDDOQKUJ1JWhFpl6?=
 =?us-ascii?Q?Kf3iWa/nj/t7Gc0IQVAMtesR8wnOJZHIyYrN5xx1B85vEsMR4nVvhdPg6Bw2?=
 =?us-ascii?Q?C1JBuqShh9yJVmDrCn10AMEHrttBEpNDNddFgHlx8CL4syZgYerGHd71UiRX?=
 =?us-ascii?Q?s7vlFosuMjwBY1bf/CaCvTqTnIr6YUcoMeKbbL8aPi5rEHZIPzstDZSHkwA2?=
 =?us-ascii?Q?3KNk86z5hCPDkhLCnLWE8+6YQ+XFuNF1KtppPtH3FhEPISsEOTuXuRlSwf1s?=
 =?us-ascii?Q?wP5+SZ5+cOKb/VOQlQhrhkYWgLcj0d53FLHKQEgPT/uCr2jm3FEvnkIP3cRU?=
 =?us-ascii?Q?m1P6B6IBmuE3IYaVm9iFHyu5hQKCysS52Les+S5/RwOSRgf9psXWj8SHDRqY?=
 =?us-ascii?Q?kBFKB+We4i/93fblI/NXcXd6pVbH5eywVGDd4+ooL0H1Onq+7s28dIv4wNi1?=
 =?us-ascii?Q?c+H144YVl8pAnfM6MU86c7nis/Ee9K5iItdMkTTv1QDazB3Ic69A60cW3kVC?=
 =?us-ascii?Q?y6GlTtDbYKHuMj2bFUEPLkKjX8l/R/IP7c6KeS2UeksQXxJ43Mp6CspngIoG?=
 =?us-ascii?Q?5KpUkP1Eim+UmNxoDrsG5TQBdzOc9YLkXLoQb5gztVCeWGTawbvGBcJiQvEy?=
 =?us-ascii?Q?ModmFb6/J6S70MbQTFJpP10+2Mxwo3AJqK0ONwd7gIEk7oQb2+0eN4GQkrP2?=
 =?us-ascii?Q?Y+f6uf4qbvLLjgRD9I/QmMHqo/xXaE4n/Kxh3YrnpvABWS32Jqjdb0sFYKxT?=
 =?us-ascii?Q?zGyr7i2VXsAQwh6NJGpWGMjN/L2chnVFi2Mho9eN3ogEI4OIg5KmRNnSzUBz?=
 =?us-ascii?Q?18FpwOz5LDuObez5SEw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rKI2ZUyDrRJxDXnqyexip+QJSDu46+4UJQctfOME+qzn1Ke90+QtW/sHuIfU?=
 =?us-ascii?Q?8KucB7LsWSXcNOzXHr947OILaiepMioT51evlscXp7TokTLe8447VtswBeBS?=
 =?us-ascii?Q?7QCSLuoYN7GmzeRgJLYzyj87VcsoFz5rUQFC1yH7DgqexOM0MHjIdZfnQ10e?=
 =?us-ascii?Q?/rYPkCHBcnF0adAUw5oYio6YI418PSXbUgLPjBctmhnZstQOPzoG5fIHDrp9?=
 =?us-ascii?Q?A4NOHikjWiVuEdktZB8l9wuG9DQHMm18llkl7wALIKGvuIYxvwlgP8KPByUc?=
 =?us-ascii?Q?fzWvYXOmI4vLPzjjUFCpGjUpDLKs/wAbhGfrxs02Q074xlhl2ABB4ZiQCR9q?=
 =?us-ascii?Q?9Wkf8vxVrUokfKHOCdS0ercIEBBQviyst3uF2+rc/ttOo3DZnGU1ai5l4ofz?=
 =?us-ascii?Q?hsA2Oy8AO3sO+8fWgj8K6WegnQP1HijlSSrygQgGpynhYJBW+An2mhdbzo5h?=
 =?us-ascii?Q?/Z05U+bVr5r6/8GP4w8RklHJIbPgw7sYQMOpXXPrm+2Th0YTY3IiN6q6d49S?=
 =?us-ascii?Q?Lj6Ndd9k7odeoHH677UqFGIyFzk7HdhXnAW9ROiZEAm8tb043LzmsUUFzaoL?=
 =?us-ascii?Q?HWZcS34vmLdPcFeHGApxu0jS4sMMpDG8Arv54VOOMfM8MAJfWVzepHtsz4JL?=
 =?us-ascii?Q?7RXNPhkz9JvsMvJd1+oTPXRCSTSW7kI6D5mik1RpF9PgTGMoe2xr0zVnaXfQ?=
 =?us-ascii?Q?3YZGmoCFgAQkUFosk+HJ06jIQB56O/fNHtMse3Uoay928HAQKQ0sSiXv+Pp6?=
 =?us-ascii?Q?an6qLl/i4TBdih84QuGBlMGtCaBVkxrfV9JTx9VP+h2CcSdA5y069i+HRRAr?=
 =?us-ascii?Q?KjG5FS+LxAC/W7x8ZZMuds+agVzjwB5UlsHk+j0wzV/13mAP1VnwBvp3rSGu?=
 =?us-ascii?Q?YXgkJWnu/6sHL1oaZx+Xp31gDelpuL4z994NBqoVL8abYXEwbViRTDM9FCp+?=
 =?us-ascii?Q?4aPpat90pFC5bmPzl3FMTgtJQPTOqAyeELrQwFToBsUntfWX+p/Wbfi7PTDd?=
 =?us-ascii?Q?lY6+pJRvLL2Rb95JghyQqp/W3Y+19l1VSziNOE57F4Qwb8umi6Yv69Ok2XhW?=
 =?us-ascii?Q?kz9K3iHo7rtR0V3zuqaT7oB8Y+bccpjOY8PclgU3tv3r6te3QVW6PHZqUNOO?=
 =?us-ascii?Q?mxY5Pkyg7r8lxNTLpVSiIiRMNzL3FEP2N1V5CKgDfj/ouocpeElBGpup6vao?=
 =?us-ascii?Q?1Du3TFP+/kPDFS+ajNI9Xy28IENkNMKay9lQRf2n1gEOCniT2l4SFZyif9fu?=
 =?us-ascii?Q?CmhZzKs5opwiikPL39Abj3HjIeM2Tv0CIJXLLuGIgvkroVt0hZtg5A/g2mdz?=
 =?us-ascii?Q?BhzF8hccYduemiU9/HehFP2oaZkhOttO8xKXX2j4Z1iE0sl9ubmKYwyyDPiJ?=
 =?us-ascii?Q?BLDY6jrbqbhRK29A3eSD4OEgO9ePSNl98cLC0JTKpLhws9ZCBZnFBDU9kPPT?=
 =?us-ascii?Q?hRJnJIXUNqxe3DgUxe+Yzgv3q7xvMeZ6w3mbKADtnlnG7bmw1j6rGwuiOrv7?=
 =?us-ascii?Q?K5sh78EMqat3dzPBhe73t0UTuIXOou26uPeoakhVWgoziKKXwA6eNVXu5jHH?=
 =?us-ascii?Q?zi7s6DynYFwkvUUD7hmugxBnMrWL9cP/d0/Yk0q727GYRWohC4a244FRP4wy?=
 =?us-ascii?Q?i0DeWrQeBTfiMPlbKIugVnlW9PMaKOXJQDRIpJGWgFe1t6kL7UjByvZPm5H1?=
 =?us-ascii?Q?gFNkgcaE+kMRa6Vw4Eg4Cdky11ivqpfESsfH8rvsxGgDIObFlZ/ClsDSO/AI?=
 =?us-ascii?Q?ZTO+eT3oyQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c59d9a70-7e65-4583-1ceb-08de65373df6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:47.1602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0W2LX2HJGrGgil/10ElPz6uakyKHOGx5F+tCq67TGMEpfCXOEsyzH/DSHrGTASXja3my11o7puk11ZXW1vpLSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209

Add external memory (EMEM) read/write operations to the GPU's FSP falcon
engine. These operations use Falcon PIO (Programmed I/O) to communicate
with the FSP through indirect memory access.

Cc: Gary Guo <gary@garyguo.net>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 62 ++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs       | 10 +++++
 2 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index cc3fc3cf2f6a..5152c2f1ed26 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -5,15 +5,27 @@
 //! The FSP falcon handles secure boot and Chain of Trust operations
 //! on Hopper and Blackwell architectures, replacing SEC2's role.
 
+use kernel::prelude::*;
+
 use crate::{
+    driver::Bar0,
     falcon::{
+        Falcon,
         FalconEngine,
         PFalcon2Base,
         PFalconBase, //
     },
-    regs::macros::RegisterBase,
+    regs::{
+        self,
+        macros::RegisterBase, //
+    },
 };
 
+/// EMEM control register bit 24: write mode.
+const EMEM_CTL_WRITE: u32 = 1 << 24;
+/// EMEM control register bit 25: read mode.
+const EMEM_CTL_READ: u32 = 1 << 25;
+
 /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
 pub(crate) struct Fsp(());
 
@@ -29,3 +41,51 @@ impl RegisterBase<PFalcon2Base> for Fsp {
 impl FalconEngine for Fsp {
     const ID: Self = Fsp(());
 }
+
+impl Falcon<Fsp> {
+    /// Writes `data` to FSP external memory at byte `offset` using Falcon PIO.
+    ///
+    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
+    #[expect(unused)]
+    pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
+        // TODO: replace with `is_multiple_of` once the MSRV is >= 1.82.
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
+            .set_value(EMEM_CTL_WRITE | offset)
+            .write(bar, &Fsp::ID);
+
+        for chunk in data.chunks_exact(4) {
+            let word = u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]);
+            regs::NV_PFALCON_FALCON_EMEM_DATA::default()
+                .set_data(word)
+                .write(bar, &Fsp::ID);
+        }
+
+        Ok(())
+    }
+
+    /// Reads FSP external memory at byte `offset` into `data` using Falcon PIO.
+    ///
+    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
+    #[expect(unused)]
+    pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
+        // TODO: replace with `is_multiple_of` once the MSRV is >= 1.82.
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
+            .set_value(EMEM_CTL_READ | offset)
+            .write(bar, &Fsp::ID);
+
+        for chunk in data.chunks_exact_mut(4) {
+            let word = regs::NV_PFALCON_FALCON_EMEM_DATA::read(bar, &Fsp::ID).data();
+            chunk.copy_from_slice(&word.to_le_bytes());
+        }
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index ea0d32f5396c..30a5a49edeab 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -431,6 +431,16 @@ pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
     8:8     br_fetch as bool;
 });
 
+// GP102 EMEM PIO registers (used by FSP for Hopper/Blackwell)
+// These registers provide falcon external memory communication interface
+register!(NV_PFALCON_FALCON_EMEM_CTL @ PFalconBase[0x00000ac0] {
+    31:0    value as u32;       // EMEM control register
+});
+
+register!(NV_PFALCON_FALCON_EMEM_DATA @ PFalconBase[0x00000ac4] {
+    31:0    data as u32;        // EMEM data register
+});
+
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 
-- 
2.53.0

