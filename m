Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011000.outbound.protection.outlook.com [52.101.52.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5ED2DFA46;
	Wed, 25 Mar 2026 03:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410787; cv=fail; b=Ng1bpeIl2o+rcLNuFSmLvfOim/5rJfhfL1szIHYo4V5SvbNc07VPQIA9HQd8tCl7cdJsfGgMPhmGTs4fQ3tp98P15OYBBJJt1Np4MLYsA8cpgkbl2Joj3NH9v8jGUxv/OiWZqn5NgpygL2s0lWYsrN2hj2jDkiM+ZXT5hiDIIjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410787; c=relaxed/simple;
	bh=fwykvaIsNtfgoJicX6LUxrOPwuzfyCVixX0XL6NetIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pRLCtVIcwo2Ew6zW6GwwJ/pNnw/K7iQPdgDan7+RuaA2Msk1IXPSWlhvrp3Pqw52/XcrlwTISDlOe3l5mmvWuIXt3rWKtpzA1+0wS2ILFKvqtLjehFJ6p6BX3mbdCzUH7zbimKNiaTeTlEtwqoRQZmYunYgsMHhxpkwblSptiTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E9H9qHUz; arc=fail smtp.client-ip=52.101.52.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E9H9qHUz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUa7UEN2zL2yMH28B0a5lcIPV5YekUklZPv3tbOOtsihSONVSdAykeX7EwilnhrPPoJ0j/Qxf3XdfkrHyfYTZk1wpML23VZUl9gQ41LjGrdQciA0K61fgz2OHRjqC8z3DIFcuO5OfCW+eMB7aRH2v43/9KhLcAoWuDE5srIvbpSo/E93pdrtj8JZ1DNRFi8MjNKsHwGpBjiQJWcLZu7gfCJrcWS2G3Wi75e/tS7N6Ty4REhOFY/+f9m1kOawjQyMoi18RXQpbIzchyk1bAKbVWofLRG7nOPNta6FqLi92jTRIMfAC1wgb86AzuKVqPh4CTALePWYaXGbbe9fW7q4sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3P9mUTK2kgM9+3Zv9FC+0+UXYh6BMn/A2RMlNETIcVg=;
 b=hDUuwgyvthf10giOYM+QI9ib5hUv1jd8pVUQS6cegntg+3ydCeUQpVD1aWPs/CTdOw+LU4uSDLyDUACJ0l7/8ZG83pkCwhCItd/6I/HR4FE8rkG82dnBQ7nmvVsiW97T/A3zrurrDlgIVSyHaCjAF1oQSE/+j4c6ykB8eA0BLiYi7a0yAfFyEyZQdyx4pZ+S8lWs4ELcCCPz6kOZx8pbPap0UEQ4cGJm7ksQsNqM0OVQwI2X1k9sQjSpSLzaP0A7zJq2AhPzlQi5y0r+FPcfvxSvb6OUYWmnCmy1YQ+YrqJI6EiZxsujB9wjFhiv0OI0Kmoh8jrS4+HOg4FVhpbKEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3P9mUTK2kgM9+3Zv9FC+0+UXYh6BMn/A2RMlNETIcVg=;
 b=E9H9qHUzsXdYZWYNe9dOEORmy3lQ4HEEDION8YxbfdzMMQoknbIv+ceiDM2zJPDNsCDY5iDs9nEII5YZ+nCGjkHGz3aTQiKJgMnvvXnozTLxeSwYTI+Clz5BEBGowlY8AzQjogwSK+bOCCDzAhpzi6EyVxGJhoe7OEdU2kM5Jbk2WquBwIIW9Yasoqt9679OJmUjOQfZI7ZnK8ZbHIyw83hlqJWZvV9wmjXviGXxtZfnOw113Cd2Q/awUP6Egfnugy9Ru+Y4+w47tRvoA8C4RvYMj81uTzseEYpKGzpJgiZRDcbnxdxNhsLLTWArG+0CmchDHdzSUIi+WylAFYDU5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB7441.namprd12.prod.outlook.com (2603:10b6:806:2b9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:52:51 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:52:51 +0000
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
Subject: [PATCH v8 05/31] gpu: nova-core: set DMA mask width based on GPU architecture
Date: Tue, 24 Mar 2026 20:52:16 -0700
Message-ID: <20260325035242.368661-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ecf12a-322f-4165-bf09-08de8a21fc92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	28kOZ+WIo2rJQ71a8nbyMRIVPbdo0K/K9qmcC5Ex/yKUhbrvGG52YBlxvOXAPhAd+Y8MWDb3TnkSnPIKg7xR3D+bJm/ONnFdo7A4Pm7A7yO796CyqRTgMEqQZMd6QEwbKZ/AqPSb1I+gTj+ro6Ez3LFsTH86iiZNWpQU9ysLSQS7k2hL+pnDmDLyPIAPi3nfT6kln6YURjfVQmFWMVuoK1CGjhb3r9DCm/2aTHrh7tm0Sufg2kV1KqWz7+LRgpuAITnu+IOdCEIiOhoy6lx8a9YmTWDkNN+mUjKmYlfV/adlPErjLzMKy9r9KcKo5ftc3C87xLrC++r7hNWQY2S7ASDmhAS6HC2e1QQ2VfbJbT8S8ZdddKZ5Eh1GjZ4dTXEhrRDAZsCHVKuqHAMrzrRx2uMDgwaeiV/Q2MkznT+BTxmrEevfO1GIdkGDBV3oJ/GgesOOeA4BjD9X5LUgTJ0VZfn2RxmxnBBqBNv6CJmbf8o68ZebYc8nyr4Fe16yhbifrkrkJPwmJQfuTmEWPtCbCZIupNSt6dM/wnDFDJNtaYRCWY1c8FMpO/UFPzvuPIJ6X5E5lnC2FKzxIhrStc74GjPR+qO14Pap9J8EFr5Quups53HJs/9i2off+Xb5H6A2XQlIMJKQ7IMSEDW3WPvO8mEm2J5qNiqJGlb3U8K/6T9z4S+V0wUj7RfGSqnr/pgnsCLQcvhtot/doVyawRFIuG/tQVe0Q0SaM8exFovaKzQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DIwfvZ5T34rJ8/4QjMBKIQoV8zkHMAd8lX+RZNuFef6g+iCWFMO/LzS3SQ1B?=
 =?us-ascii?Q?kl5azLRnkMcKHAjLxz3Jrzv45tmLq2mFEx3an68D6j7iwlHWs/B79ifQsTrZ?=
 =?us-ascii?Q?Y2hSPbbgDjBpnrwzG4xDvxCPvsQyrGX00d9a9bEYI7Z2EihkRdmmkQuhIhLX?=
 =?us-ascii?Q?htnhPmfC7O9RLG0lRDkbFsiCq6as3WxJruYV3unsHcBByGtGlf0KiMt89S9+?=
 =?us-ascii?Q?mn31SNw6lQTAettBTgeOLLUSeDGz0e10wjACtdL/xWJEujmKD7XrfJpFIVLo?=
 =?us-ascii?Q?CgptBYbb0eG3i/F0MXpvqYbYeqhop/spWh0q48qgsrsWUJATu1psoePBDAJS?=
 =?us-ascii?Q?Aw0nhMS8W5ppySqUSQ/T3nuTw2RiIV6igpxlzeIld6biEtUc3vjpl7esoEuQ?=
 =?us-ascii?Q?7jq48Fukqe0LMnts8ptAiAXEMN44UAbbw78wmwkMt9dsPQ0BJg/dCUEwNPBo?=
 =?us-ascii?Q?UUv9YUmXW6uNFFDYQvNjvf3OMkBHlbOPTCj+amrmOTGthi2wprZvKacRwa2V?=
 =?us-ascii?Q?/GsafF5rmBRoTiDgzphIPuRHNAeU0CJ7oibp+twG9oHit5W7MC8p6bT18+o1?=
 =?us-ascii?Q?tWWx6oTG4aQrqbaej6gkRyJsN/jtevSQceDAXON6t4AmigSC80YXPjIKqLif?=
 =?us-ascii?Q?LSKQo0Npyl4CTK/631DLXKVgWjoEX93M2VqSmPP6KJBQn7Fq20+D85U6nT/r?=
 =?us-ascii?Q?b4B63wjOuj5cYgGCuOpKC5HyKcsX5Y+ufX2Ul8PMBycChIzes+L31arwCcJ+?=
 =?us-ascii?Q?c3tsJ4f04bUQrhmuvH28qHZjsOfBeyHeoiDORMbNV2Wso2c7xmfUonC00KV6?=
 =?us-ascii?Q?ixTrNioXVVkqlg4Ies6RoYJLxmOe2LnM0v/kuxAizXnLmDjWSZLN7LaMASB+?=
 =?us-ascii?Q?jYdkW7CjwFQMG5tq50/kPXmBpu04S4JsHCeKbq7qiZz7q2LRh76bXkYnuFW2?=
 =?us-ascii?Q?HCgS2umSNRv5LW24l3nYBfkmDxKVBks4z30nJgxpvV2GJ7wyO3NepZdNbONv?=
 =?us-ascii?Q?PQMjQ8I7G0UF8PEgGLjVm0LjlYQuI+rbxQ52jjIbVVI769mUmQg3CH+JYiCz?=
 =?us-ascii?Q?2pqz2d1eWzBn5UxB9Jj+kcqeHWZvPX4aTS7YOtIinWALfmu/tXuJ8klnIzC1?=
 =?us-ascii?Q?ZwYoyqnGP5uA2X1FjZ+o0aD0jj1xMfH/5SqyDt54d0MQmcKFAYWvXUzETmWV?=
 =?us-ascii?Q?88l8WcE2HbO3/ZIMBqPKjeLrlXoU6D+bYjxRjohtDUhQLL2XZXjMAEhUWHR+?=
 =?us-ascii?Q?O1kNm2g1l5/xqmthMwqAL1aJlC0XexRVf+aOyOxlGrGSD1mvwxWXm/+iroqT?=
 =?us-ascii?Q?bkmGgOGiNUqEOZPUL1AxESyyexdF0bi0rSCvaQp9w7L/fL7rgJrg4lvBeCRd?=
 =?us-ascii?Q?MB61m9dEEjKfHZ7l52hNXatN/tnejED7vjbgS8bA1Ju/+7ecoDf/DPUGSIBw?=
 =?us-ascii?Q?x+Bf9Ov7wnAEKmUHo2s6hy/0w4zjCwiFsK+HSr5iVD1XEau9Wwr54T/1lQeH?=
 =?us-ascii?Q?0nTMkFpeS16Itn7HObNoewLTkZX9/wnjkxIjd3j0XxYUvl/OErwgvbjBINDw?=
 =?us-ascii?Q?yGNhXT8JjfdPe8OqkmxV4SQbmXfJZ+2ACcM6R79mGMMUH8VfXNVFg8K4yrD1?=
 =?us-ascii?Q?jQmHMAlRM0drtbnHxQA34PGvTKM8zLDQOMkSgRu5gWp0U+640p98mEGbW0ah?=
 =?us-ascii?Q?irkes7WmvTpyEUTR/AOxK4MZdWKyVi/odIBAufhgxp20DfBrEMdQ4lndEju8?=
 =?us-ascii?Q?ealmN5PhxA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ecf12a-322f-4165-bf09-08de8a21fc92
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:52:51.0732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nL7VrYTiQlIti30pVHA4b6okRa9AbPABzSCd3Qbico7/CASwb78HJjueqBeiQzL5lp9dXhM/XqQ7p1nRygDBOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7441

Replace the hardcoded 47-bit DMA mask with per-architecture values.
Add Architecture::dma_mask() with an exhaustive match, so new
architectures get a compile-time reminder to specify their width.

Move Spec creation into probe() so the architecture is known before
setting the DMA mask, and pass Spec into Gpu::new().

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 28 ++++++++++++----------------
 drivers/gpu/nova-core/gpu.rs    | 29 ++++++++++++++++++++---------
 2 files changed, 32 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 84b0e1703150..41227d29934e 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -5,7 +5,6 @@
     device::Core,
     devres::Devres,
     dma::Device,
-    dma::DmaMask,
     pci,
     pci::{
         Class,
@@ -23,7 +22,10 @@
     },
 };
 
-use crate::gpu::Gpu;
+use crate::gpu::{
+    Gpu,
+    Spec, //
+};
 
 /// Counter for generating unique auxiliary device IDs.
 static AUXILIARY_ID_COUNTER: Atomic<u32> = Atomic::new(0);
@@ -38,14 +40,6 @@ pub(crate) struct NovaCore {
 
 const BAR0_SIZE: usize = SZ_16M;
 
-// For now we only support Ampere which can use up to 47-bit DMA addresses.
-//
-// TODO: Add an abstraction for this to support newer GPUs which may support
-// larger DMA addresses. Limiting these GPUs to smaller address widths won't
-// have any adverse affects, unless installed on systems which require larger
-// DMA addresses. These systems should be quite rare.
-const GPU_DMA_BITS: u32 = 47;
-
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
@@ -84,18 +78,20 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
             pdev.enable_device_mem()?;
             pdev.set_master();
 
-            // SAFETY: No concurrent DMA allocations or mappings can be made because
-            // the device is still being probed and therefore isn't being used by
-            // other threads of execution.
-            unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
-
             let bar = Arc::pin_init(
                 pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0"),
                 GFP_KERNEL,
             )?;
+            let spec = Spec::new(pdev.as_ref(), bar.access(pdev.as_ref())?)?;
+            dev_info!(pdev, "NVIDIA ({})\n", spec);
+
+            // SAFETY: No concurrent DMA allocations or mappings can be made because
+            // the device is still being probed and therefore isn't being used by
+            // other threads of execution.
+            unsafe { pdev.dma_set_mask_and_coherent(spec.chipset().arch().dma_mask())? };
 
             Ok(try_pin_init!(Self {
-                gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref())?),
+                gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref())?, spec),
                 _reg <- auxiliary::Registration::new(
                     pdev.as_ref(),
                     c"nova-drm",
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 3cd7709883be..e7c3860cfb28 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -3,6 +3,7 @@
 use kernel::{
     device,
     devres::Devres,
+    dma::DmaMask,
     fmt,
     pci,
     prelude::*,
@@ -162,6 +163,16 @@ pub(crate) enum Architecture {
     Blackwell = 0x1b,
 }
 
+impl Architecture {
+    /// Returns the DMA mask supported by this architecture.
+    pub(crate) const fn dma_mask(&self) -> DmaMask {
+        match self {
+            Self::Turing | Self::Ampere | Self::Ada => DmaMask::new::<47>(),
+            Self::Hopper | Self::Blackwell => DmaMask::new::<52>(),
+        }
+    }
+}
+
 impl TryFrom<u8> for Architecture {
     type Error = Error;
 
@@ -213,7 +224,7 @@ pub(crate) struct Spec {
 }
 
 impl Spec {
-    fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
+    pub(crate) fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
         // Some brief notes about boot0 and boot42, in chronological order:
         //
         // NV04 through NV50:
@@ -295,32 +306,32 @@ pub(crate) fn new<'a>(
         pdev: &'a pci::Device<device::Bound>,
         devres_bar: Arc<Devres<Bar0>>,
         bar: &'a Bar0,
+        spec: Spec,
     ) -> impl PinInit<Self, Error> + 'a {
-        try_pin_init!(Self {
-            spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
-                dev_info!(pdev, "NVIDIA ({})\n", spec);
-            })?,
+        let chipset = spec.chipset();
 
+        try_pin_init!(Self {
             _: {
                 gfw::wait_gfw_boot_completion(bar)
                     .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
             },
 
-            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
+            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, chipset)?,
 
             gsp_falcon: Falcon::new(
                 pdev.as_ref(),
-                spec.chipset,
+                chipset,
             )
             .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
 
-            sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
+            sec2_falcon: Falcon::new(pdev.as_ref(), chipset)?,
 
             gsp <- Gsp::new(pdev),
 
-            _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
+            _: { gsp.boot(pdev, bar, chipset, gsp_falcon, sec2_falcon)? },
 
             bar: devres_bar,
+            spec,
         })
     }
 
-- 
2.53.0

