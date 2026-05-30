Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010010.outbound.protection.outlook.com [52.101.85.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A4733689F;
	Sat, 30 May 2026 03:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110612; cv=fail; b=oFAK4Y/rgRCUWqpCmiMCW9S3nxOaT7OLl/x2dbpSHoLJx9rdPvNJfF6vRX+EJEoP2bHYSHLMlZSC4G8ItwQXFGCBBxRLQSgFpE/kWeJqkFqRXk343brHA32RYk9AjfPTRL0TFHOH/qCRdNivJS+MfCl0YNfkMubJNBYYgRugnGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110612; c=relaxed/simple;
	bh=A0B7x0M88aiqBVxq1DQpSmdVFrxRyXtbiQq9txwzx2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oZVVo4OQKpGONvVRzttKW2DRVpAfAGQSW1BBqUfaypaeLezlD3f5rHhLCHU5YH6qb85xzer7P3UU/hQhmim/nmDZzVXoW7mM3nu6YEoemdQyhPLaeXKksNVtKF42Y0pHED0oaMU1Jz+Eq2T1GOiGC6REGqPqHDNDB94U2XlcTRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=B21K6ml5; arc=fail smtp.client-ip=52.101.85.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="B21K6ml5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdwjE+NhusXSCY+P2SEE3Ex/SrrfJFVtGLluKGIpS/TC8fhfDttRm81ME/rkkqurd5M9R4EEVE2wv5PBhmVtIRKpyamXEj8p+M45Br34BoLCVQM06IdDkGc9D7Y3P4VUx50yv1Vl2DwPb06LoJpBunR/uiyHR6K+O3MJYVJqaJOB5L0VRBMGwRh76gsVijejv7kkrBylrfixkQzGBGYUhz8Vf3ZOHFGs/NKSu4oFY8DkCzsEdEWnANaNm8JawM7+r8+r88zbmbP9lNkQa3eoVNsIx6i8sfK9X7i42SXfxMbhRmxksrn0xEyHcciCCLY3yhZFpQGq56/kkEfX5THX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1mGJPqK5B323OTwdC/dEd1FBq26ohgmp4fBVGjKlnU=;
 b=PE9JZz3c+u4MpY/TYT3KgQOx9p2rwQoRzwt4jqJ//ER1Bxm7VlUSxDkR1K5DvoVNBiQMJmAKCblrvBFRY8HW5r5XoddbRNcOZqE6MjhCJZLAFg51kJXRiPbtCPGcgBz9kpigLsY/9eJ/bKnTuhBS+0kvfIbNp7itU5yJwPv6+ywt8OhZkjC3WJTi2+0bEtcZxyURPU8+yydpkAMfMaRwycomm6xu36kZjAAf4EmMiWFdC9ieGxxjVJwmRc82x1T1d2Co1VzG6lcBShzge773rtaxJrvJLpSDmdlJmw5V1P7U9OkPS+Z36Hy3jiVbjhYjlmV4ygIvlRHMc29NaQPijA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1mGJPqK5B323OTwdC/dEd1FBq26ohgmp4fBVGjKlnU=;
 b=B21K6ml56411ZHEyEcpttAQ97x8AN0l70T1aKqXd7UGWQ8VmPb3kq/7jlpRjr6w5zZ5zAlafK5dhWkrqQ7tSQvmzWa9f7x8AD9vhcs6poPXQGPT16eiiEX2OcNUnU0ynSB5ID0seoreia6ViGJyRm14ZN7LZeRcxkPQbc0imhMVZo7COJcfSvqCPKqinKnHCgGXtc3qwy4Ue1SjZ3CwC52n9siOF41NhsB+8FZ+/TKc17oQyEBJ/RlUw31b7po1dM5xzvfvEVXlzm8A82VaTGz/BM7REpyN7SXwWjtBwaUpJDhSadsXPmaBZaEzZO4E1SPaTl4L3FVXnlMb/gazf8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.15; Sat, 30 May 2026 03:09:57 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:09:57 +0000
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
Subject: [PATCH v11 01/22] gpu: nova-core: set DMA mask width based on GPU architecture
Date: Fri, 29 May 2026 20:09:32 -0700
Message-ID: <20260530030953.740561-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0124.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d74268-bd80-4d81-1053-08debdf8ed90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7Bt/3MMbRwvb4gJaN5PpxC8mLqUKBD8WMAdAZpW9ZYxoOrb9sClHKwp0QfFnkbO6BvbSHOjNAWN7vpJkb/rRMjsB99QlyQ1GJO0MAgXElvbVrwaotmJFwE21XXYNLX8sW3rrHlzBj+dT31AnXoOCUxDbB7HUZH8R9gN2/18mqGfLdjFecFSgF5P/lBbQmSM3eRRm5TFC0zTTzBiHSgr8TX2olyy5yFPTq+wZHMHasp6x6kIIppc62G8wtFIYHP9Jl6J9JFnC0fy+nQSkTqog09AmodeYCeHS2lirYEi31cmOW+6Gq5m+lrFFVgRs9RCqMfAoIGGefAV+g4X8CUhCwaB3xerfIUAFdmtS7+wRJWsSb5NOMhMdQLIqTEyiKR9YlVUouAoy/CnnkxBbymFzuT5Qj8HAV7ekKVIRkiLxO7aC6GwOt0H1CXzLo1fYVsQesEykp7u4gw8+8bHtAw2NRtY6p880Myzxf5JrJn6DiyIvokgJBRdYt3nqmTN/1Pd6FgWP5p/518wTkTdhBLARN8mcke13whVwVMSbmJf2+KahJnPknTbyRlZ53A38zghii/ayMO/vqph9TMej2b5OLiGPuVlKe7wf5mb5MY8WSQsXDy8gm+l7RlxzEkeL2WckSD18/NycROeb+/uWkNVrlMjk6khL8j++PIC1In5FTFeBnYctKSwAcjoy0L7B9wiR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T+PoDw3nKuWASsp3QlRGA9+Ju9HutIHEjoUSERUVIIDo45Efey40x21vi6iI?=
 =?us-ascii?Q?dUJMvoO07UQfLo/ZHVz2qTya95rwq8GjU0QFeDtDWrP9g3FPItE+5r1OVoke?=
 =?us-ascii?Q?7m+max5LLwTG0ORfOfLpcdAGwQk9y4ZYyYKnA1bStNYqkP1pp98UkVjUV2sz?=
 =?us-ascii?Q?SF5BEx4+kTXAREHMBP9/1DMF15AeZ3uHFIR3p1oh3576ntNkJdBaABYDUpaM?=
 =?us-ascii?Q?Z5Ua4CrXrPmu7dIy1yoXujdfEmwPMgCsq7joO35DOSRjEsQ+ATE0R/MZn9B2?=
 =?us-ascii?Q?MDiLVCtPEV8jzpH5zqZamQINNxhXVNc8jAfRoUbX3GvcUZuiT51OoJAIhfK4?=
 =?us-ascii?Q?0kk3mfqRX1ESWRt7yPdu7d68ANrV7c4mkM3HpLSikPLn17stFiZcLW8tFJ/1?=
 =?us-ascii?Q?siM0Bm27MVf3geSyDZ7U/olHfHXUMWw+moefCKipxtGAKi5qIrMHBt5m4AIP?=
 =?us-ascii?Q?FDur3xmAgzU7TSJEbHksM2sjxA61MSmlqjKcIJ6lojnDLEBPi6FsdAZb1Z/D?=
 =?us-ascii?Q?0TSHE6Qd19qSbPIPM5FBN1XNFharoDqwFZbimjAn7eF6uxbkFo8U/On4oIm6?=
 =?us-ascii?Q?QfoKCsjJ1xhD/Iz+UQu476dVkhQWzlkHpfCoB2jrGrPAcgb2m4z/m9hPzg7B?=
 =?us-ascii?Q?TqVF6TonxRXHuhsZDJ5TXb8u72QOvc5RIQzDhM0scm15zfgWrRFWpHpDhyI2?=
 =?us-ascii?Q?QXDiWDSFQfV1wg5udEeqS7pwXjD95e1BF3F11OE9tD1RIm+K7fD2lrp5MPo0?=
 =?us-ascii?Q?M6yrYdCEj5emRqA4lKm+1K9k2aFrkv/txGSh+ySUKJDIO0lp12NQUF/qK1jj?=
 =?us-ascii?Q?5oXsGsiSh6TgCvgP4XFIsfhPwW5FPzdqzhctG2MEqiIywf/nO1N+wKJugBId?=
 =?us-ascii?Q?0sVgatXeDfCL6GymCWLWt7KTlQZJDd+bNBWZyLDlkMPjxUb72dNX1Iq7BjEa?=
 =?us-ascii?Q?L+yMZ+U6FjUU1wcg2W7b6Wr0qJ9hEel3P9v66KVCZdT1vLA9U76PQXESgwR8?=
 =?us-ascii?Q?dlk13sNEbDCT2IAwWuR0lYjpM7A8OzR0OaGIDKSBsjsUglw2Z0itL4WoZkVK?=
 =?us-ascii?Q?MESbbZ6KELI7csXtsn05R34VbQtigtjHQbJ50bdMcIsAcpMUJtjFzRU+yHma?=
 =?us-ascii?Q?gRUxzOKSLvnCcM9m7n3FQm4Efsbke+3iQTUZH/yNdOrohVTnOfjSKLPJ6Gr8?=
 =?us-ascii?Q?S6I+Hjxj4K8bQMF4lzLpcY4WpzwDCgTtDmDpaaeYiylRpC+ANqH8oa0U+F85?=
 =?us-ascii?Q?pNTbYmNlCnZWYBx9SfrysM4qyL831uxo6KTHrZSHE4S6h9SkhUgqaTHF0Zq2?=
 =?us-ascii?Q?2Hte2mW3LPISNomoljFAP9+Efm0SuBCehKuDX3ijqFoictCfwrxf/ib0eNgZ?=
 =?us-ascii?Q?KxMXK4WciVM1eIWcNU8UMh3gvoWzmA4jjN/nVxWTmVqSXOl+QNTluAksIVZt?=
 =?us-ascii?Q?Uexoguyh/r0pTnupPvlPf+5R2iZqHfKvGyt6vfS+PzH2VWga2ufOR1vblbD2?=
 =?us-ascii?Q?wSMMZfU+Qm/dbgjBbXvDaolBQwLrXu4Ut1AMkwlQA8F+CoHoS8wRMflOVGnX?=
 =?us-ascii?Q?0dIfSg0GtJIX9qxtjNqTW6f89lGDMkcJ1aDe2KVJJbj0x+V0usDoeqBrqIOj?=
 =?us-ascii?Q?Q1wJKW12leJ9zBu+pFlqIOogjZhJQHH4GqQ67TNVe8SBn7hQvcmPJke125CI?=
 =?us-ascii?Q?jETpziEFhhM1KgDA53DXjoTaLFRrpCKIEt6SWReqM+dUhAJlbord+YxsReqT?=
 =?us-ascii?Q?BsXMgkRzeA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d74268-bd80-4d81-1053-08debdf8ed90
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:09:56.9931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WMc5R5EtKT2ZT+tr6Dh4b36kI40bb3Kd1RwZ43zkVyiHeZ/aapa/VthEovQlCdlXaN/O11Rg7DD1m4/OiRtdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863

Replace the hardcoded 47-bit DMA mask with a GPU HAL method that
provides the correct value for the architecture.

Set the DMA mask in Gpu::new(). Gpu owns all DMA allocations for
the device, so no concurrent allocations can exist while the
constructor is still running.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs        | 15 ---------------
 drivers/gpu/nova-core/gpu.rs           | 12 ++++++++++--
 drivers/gpu/nova-core/gpu/hal.rs       |  8 +++++++-
 drivers/gpu/nova-core/gpu/hal/gh100.rs |  9 ++++++++-
 drivers/gpu/nova-core/gpu/hal/tu102.rs |  5 +++++
 5 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index cff5034c2dcd..ade73da68be5 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -3,8 +3,6 @@
 use kernel::{
     auxiliary,
     device::Core,
-    dma::Device,
-    dma::DmaMask,
     pci,
     pci::{
         Class,
@@ -38,14 +36,6 @@ pub(crate) struct NovaCore<'bound> {
 
 const BAR0_SIZE: usize = SZ_16M;
 
-// For now we only support Ampere which can use up to 47-bit DMA addresses.
-//
-// TODO: Add an abstraction for this to support newer GPUs which may support
-// larger DMA addresses. Limiting these GPUs to smaller address widths won't
-// have any adverse affects, unless installed on systems which require larger
-// DMA addresses. These systems should be quite rare.
-const GPU_DMA_BITS: u32 = 47;
-
 pub(crate) type Bar0 = kernel::io::Mmio<BAR0_SIZE>;
 
 kernel::pci_device_table!(
@@ -88,11 +78,6 @@ fn probe<'bound>(
             pdev.enable_device_mem()?;
             pdev.set_master();
 
-            // SAFETY: No concurrent DMA allocations or mappings can be made because
-            // the device is still being probed and therefore isn't being used by
-            // other threads of execution.
-            unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
-
             Ok(try_pin_init!(NovaCore {
                 bar: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0")?,
                 // TODO: Use `&bar` self-referential pin-init syntax once available.
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index aed992488db3..38c75df77e16 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -2,6 +2,7 @@
 
 use kernel::{
     device,
+    dma::Device,
     fmt,
     io::Io,
     num::Bounded,
@@ -269,7 +270,7 @@ pub(crate) struct Gpu<'gpu> {
 
 impl<'gpu> Gpu<'gpu> {
     pub(crate) fn new(
-        pdev: &'gpu pci::Device<device::Bound>,
+        pdev: &'gpu pci::Device<device::Core<'_>>,
         bar: &'gpu Bar0,
     ) -> impl PinInit<Self, Error> + 'gpu {
         try_pin_init!(Self {
@@ -280,7 +281,14 @@ pub(crate) fn new(
 
             // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
             _: {
-                hal::gpu_hal(spec.chipset).wait_gfw_boot_completion(bar)
+                let hal = hal::gpu_hal(spec.chipset);
+                let dma_mask = hal.dma_mask();
+
+                // SAFETY: `Gpu` owns all DMA allocations for this device, and we are
+                // still constructing it, so no concurrent DMA allocations can exist.
+                unsafe { pdev.dma_set_mask_and_coherent(dma_mask)? };
+
+                hal.wait_gfw_boot_completion(bar)
                     .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
             },
 
diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gpu/hal.rs
index 788de20ab5d3..0b636b713593 100644
--- a/drivers/gpu/nova-core/gpu/hal.rs
+++ b/drivers/gpu/nova-core/gpu/hal.rs
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::prelude::*;
+use kernel::{
+    dma::DmaMask,
+    prelude::*, //
+};
 
 use crate::{
     driver::Bar0,
@@ -16,6 +19,9 @@
 pub(crate) trait GpuHal {
     /// Waits for GFW_BOOT completion if required by this hardware family.
     fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result;
+
+    /// Returns the DMA mask for the current architecture.
+    fn dma_mask(&self) -> DmaMask;
 }
 
 pub(super) fn gpu_hal(chipset: Chipset) -> &'static dyn GpuHal {
diff --git a/drivers/gpu/nova-core/gpu/hal/gh100.rs b/drivers/gpu/nova-core/gpu/hal/gh100.rs
index 1ed5bccdda1d..41fbabb04ff8 100644
--- a/drivers/gpu/nova-core/gpu/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gpu/hal/gh100.rs
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::prelude::*;
+use kernel::{
+    dma::DmaMask,
+    prelude::*, //
+};
 
 use crate::driver::Bar0;
 
@@ -12,6 +15,10 @@ impl GpuHal for Gh100 {
     fn wait_gfw_boot_completion(&self, _bar: &Bar0) -> Result {
         Ok(())
     }
+
+    fn dma_mask(&self) -> DmaMask {
+        DmaMask::new::<52>()
+    }
 }
 
 const GH100: Gh100 = Gh100;
diff --git a/drivers/gpu/nova-core/gpu/hal/tu102.rs b/drivers/gpu/nova-core/gpu/hal/tu102.rs
index 08dd4434bd72..2881ab03dbcd 100644
--- a/drivers/gpu/nova-core/gpu/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gpu/hal/tu102.rs
@@ -19,6 +19,7 @@
 //! Note that the devinit sequence also needs to run during suspend/resume.
 
 use kernel::{
+    dma::DmaMask,
     io::{
         poll::read_poll_timeout,
         Io, //
@@ -80,6 +81,10 @@ fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result {
         )
         .map(|_| ())
     }
+
+    fn dma_mask(&self) -> DmaMask {
+        DmaMask::new::<47>()
+    }
 }
 
 const TU102: Tu102 = Tu102;
-- 
2.54.0

