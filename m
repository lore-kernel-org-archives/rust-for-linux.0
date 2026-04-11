Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011065.outbound.protection.outlook.com [52.101.52.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC972D8DDF;
	Sat, 11 Apr 2026 02:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875817; cv=fail; b=EnTNpO93ll7h/p/uf41KH616PDKfDovc8KcVERXbW52xpfOIwaeAc2Q88eSEcj4gyoy/1lJojkGaJZgANNE+Qv8QS/Pezok55aMgCGEkrXWG9YgYz2r7In7ns5bfmj4VjAtmFH0RLrb9mkPYboJa3BO19XbozqoLlyT8tzJkEPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875817; c=relaxed/simple;
	bh=YOD0XzZj5qg2RbK9CZnDYF84yUecXwMi7bYFBO0IA90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CWzd9HSJTaMrJZky3v5gkhFnlSUxgxP7VY96nquremw2alFgAg//c9wG9dTJahLdoPPM9Kiu2g9cxFHER6+UMJcuOOjk1+U5w3JLZGu80xVQ36/Gb5T6+ZBQsHJHNta9XQCWx7A1fmHk7LDxCYx+DVhlJB5yVEffcSr9catnuwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kQqhAG7t; arc=fail smtp.client-ip=52.101.52.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kQqhAG7t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHqjwZHgTIO7pAb+aN32afuWLP9ZB0L8G3AVwOiWdc2ns+yYDDnP6H5vgrFDonZKNDV1XmviKZvwF08ND8Xfca0zhLbp7GIerQzbZolj8FS8pYqlFr/1yN+UQEzQcnv/ANKduQnDMrsSqe/MkwkHjGB9RDiEUpXW59Ke4jCtc5uJvGGfhlUewCX9vtImIEt/QIQJWMrKAAjS+pxn4wWiLVcvjJdy5qIDxwWOEBLufgvT8QePuctU3PFQDISnJx14HmFoJ2GzPCOnxuJTmxUYWNL9OVy920myKb7NNOj1cNSVfZoVXJn4q2nJ3xnl3dN7XVRtownLfVnS7ZGc9egBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMGp/Y0WPog3PWj9JK4VALv2lKlEySOcj5EdJzcSsr0=;
 b=tMPbh3vQxZ2qCRFkahoXPOqz50MvW1IitQTc7+z7Yi2Ryma2z6U/XtjGDT3KORMoJiSDKrgXEaMLLzvOUgYiv9GprE9F+C/h+ImunCBI6mKPJt2yNGv8EjEPqGhw3obYzieUCFOsxvMMPzASdYVQjawfJcVyHol2NpVAWAssEufYI4O6pVgKFadRLcW466egZGFIYJjDpFSFOCbdS7yhmE3PSDdUON+vQ7Q6EuEJcaIQRyezLgpee4IXAGmhLMChsIR0BIOqHdr3FMneXN2u9k4VM3GnNkjMWVRTDfr7WN6PjCZznah9Praic5P/vq9C88yAu+wLKTIdMFQwBSrf/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMGp/Y0WPog3PWj9JK4VALv2lKlEySOcj5EdJzcSsr0=;
 b=kQqhAG7tDNg0y1YJwWZHHjf61QxAgrvedWCYJo9QumjEAdWigCmd4VuT3fFPIsdZHzOp7Z9CwMmPcDLHWrBVhpFVA9HPDfJp45L3SvsSOWHyN4hE6kSaRfQYu1Y2Uao3XLQdWf+q9MYKnpcYq/DtuzEcGL3D3WqeiiZoGYKPwoCDn3UnpRqhUFe6skByeJE41Hi8s5c5holbUxWkhct1M4owFoPbnJZLUpDu+oKOg3d68O3yZWjpP4srDkgqBw31oduP/0QOVzej0fFEkttiSz4C3O1I5vmh+3SMdV5Mbvg5UWR40n6hcR8FWpooruaP5sb6+x3D578QF35yI0trmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8794.namprd12.prod.outlook.com (2603:10b6:510:27d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.15; Sat, 11 Apr
 2026 02:50:03 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:03 +0000
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
Subject: [PATCH v10 05/28] gpu: nova-core: set DMA mask width based on GPU architecture
Date: Fri, 10 Apr 2026 19:49:30 -0700
Message-ID: <20260411024953.473149-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::39) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: 286846ae-ff35-4bfe-55d0-08de977507c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UzUNuKZQE7pIz7DLbe+aXAzombujP+jZDd6ACb2KsW8wOqAvhHDbaz5pj280E/Q5DazvnHerYCT3hnzy+E8rDuysBTEfDB531YwYBqJy2/jHNWnB1+iXq5c1Gi+ktrO14+6cpoSm6Ro6s4KCZDCeQnMXeYP5nCGqdfOu9XokTKLQGFs2saDUARPXsGpdxbtx8vTnDS3eP9Ta7ZjnE3/EYWIspoO3yA2DF+sauzPjmwgQmwI6aX2DcwL3rwN1+tjAkoyMmXA2EJ6JaNrfnfTmgWtrpNzd6BnNMNnYvR8q0y+QDtMmS6yWsR26lGCed+NFAXQINDZE3jTNK6X+UwkEX5XdEaXgDSUhnrasbtExdDgIbn9xPgjcO7AKpmUjapbP/t/soSXqkYMxu4iipz9LKUNAzA1eRFwJwOiN4EeN003pDy1NB5PA7OKhxJ5QRbR/2faFkmCOFvz1hB/6hYcOTPt8ykKbKiU5qlfmBL9/6oyCCw9bRQsOcuMpQflZ15R+v8QroM4KgKB3kyLXIr61LRNkeh67FLVNz5lK0gKW3iMLUnvH1J2TIwUEmWUa3nxOU06ISwmp1scHTjYSJHGoY0V7LRjBaqzpLBOBbO6/XIyycTKcOgpYlbrWOAwxq1/UQQPoFOFdMHKOmCyQXkFJqUK6fBpfDyqM8bD5tvFHiFdvWZR1rc6B8n/M/MlfxUM9qe0RTSnkMWdDPMGcfybBlB2KLD3DJ84uTufHC4deurw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sFYj+3wrNGhXWQnufrMzj7yTIwsylyFrUiVmyznchV12Wvaf27l1nanA14N3?=
 =?us-ascii?Q?ldusQWSObV2QCN9eAViEDagstwHtWVjLTuBgne3DprNy/sDW6pG/GpFvXOJU?=
 =?us-ascii?Q?E3DCOiqohm8raxA9Cy3bPE/1+LHXew24tJ6W/J/hv6kdUbrIKJRdYlCiJhrE?=
 =?us-ascii?Q?BXeW9DkA9/rPdsU2ZHYT2+vNoF+zBRexUvpJb9azaVvW9JoiR6PRYn9kQtF3?=
 =?us-ascii?Q?mNTqpJ/aOTUsW4P0vqELPKmp4dIXcacBt7oKHvvudIYSV7AQiLTwZDxUcwC9?=
 =?us-ascii?Q?gOWpkg33k5hqYsYmjvXA9kdQwKT7ts8REBGfXwJSS2WEdIfXtta0T5Hn0dpJ?=
 =?us-ascii?Q?bWNL48HDzBaDMzKpZF4YrdRjtssA8JJGtsz/HjJz7A/2WB0Ewo6kZ3yd20sD?=
 =?us-ascii?Q?J7Dm+cIoRwae/BPaFgKfVFvvGLZq4sG/2jFT36vMvkRYw9XuPH7Yg9U+2FcB?=
 =?us-ascii?Q?4tcIVdAsFny0xd8wvWMp+YEI4lPmVsYMIt1N410/fey9bdVkRDgABZ47DJ4+?=
 =?us-ascii?Q?83kfjsinhRT5gQFkdZzYbPlrD4GdfbRxO2jl1crftNXsaONubLv55Y8S5yUe?=
 =?us-ascii?Q?sN3nyb/i8OXQuxcq5bYcEO6OQfYBT8kGXEDwMljCJvrjdZDfSUCCNs5va+Kk?=
 =?us-ascii?Q?qG+2kGkEyN0NNTOAFyVaYvtNG95Ail3g8/f9+iGPtUo3QswhT57mDEX78zjT?=
 =?us-ascii?Q?Ktn2gBfXXh2+RZ1fvKgd4ARpB13hYkHXutM4wTUW4yF9JQn/6vb44o5x9b3r?=
 =?us-ascii?Q?CodXHO5BlTZVa6MGuBNhrD2Jd5QxpuKg1tdacP0I2vMM8EZ7Ws5v9xsCvhQ+?=
 =?us-ascii?Q?/JEiXQh60Sv9X/3kfmn9YD24tMKqFUonFuMjm5FClM9gWHNIurwcoHEzzJJX?=
 =?us-ascii?Q?0kF8GqBwrqT22ZOKO+1FluvSKzekJQgmK/nMq+/hQBpZzVn1vOKpVZ8yW1/n?=
 =?us-ascii?Q?2uPo+qAF7ME/NVujzUEy0s4CLLlw2P5sucJxRHOJvtvIRP1IECG5XXxF6KmT?=
 =?us-ascii?Q?JeO/8ESK4Fj8Tb+HV9ljfxQZ+PDvsqQMbnL9ZDF5x+XLCZIE97MXSbK/QNwA?=
 =?us-ascii?Q?YuhpdTyYRFM2QTaw91OhUGaCRc4wyeQinalqWEDF1SRwgmwmnKmFALH1O0hz?=
 =?us-ascii?Q?gBYJQ/nrZZPDOQOXTjFuq59rRladzVRNTWUnyWfNRgytzGL08o7HBk0XrJKJ?=
 =?us-ascii?Q?hIFOtXW3tuaxjToIaCjbtZkJvCpHQEgSdNtK8lr7SCxmGNyIJeJiysIOFcC+?=
 =?us-ascii?Q?serGXEDdrerGi7+UhmSFBKDhYj7p+ivCRcsXRk3i/Rv0pZuSs8dVdgAS2MWC?=
 =?us-ascii?Q?4ku0b6XYIejiTvXSN/DseaV1iA3qi/hzHKOpNqM4adqtNTfOviGAA4Cw0fZD?=
 =?us-ascii?Q?zKVJT+LYrxycEeRX0pzgv7e8ZOU+wxt5DO1MBoMZPGs0564uxqIeQ2JvTd87?=
 =?us-ascii?Q?xehlyPRJJy0bnF8+SX9jHcoXYnejfNjhZ9mrxdvaPhVT+Ou/Su7/hS98C6CA?=
 =?us-ascii?Q?JgENb+Zz6+ftHkoQqlmmW4uMr/W73lt0wgvDZuV521AWJZTUIefnprkdQYT9?=
 =?us-ascii?Q?Do5+0w+43nvPITia2YA82TD3gzjE6HQvTChFeBF3KQ8MqbfW4dIL6srodLvl?=
 =?us-ascii?Q?5Q2Z+pp1CR9M3piOq2BSXT2/AYLhO3kuxqpw8C26cDHNIqHJ7Z1pdPaE5Zor?=
 =?us-ascii?Q?WHLdlot82XcbWemyiVzTYQ0OmzRHLawRh8KvGUvQv9zJwabvLFl/lBvt3LYN?=
 =?us-ascii?Q?UCokjgU2VA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 286846ae-ff35-4bfe-55d0-08de977507c3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:03.2434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWntlPdQYW8sim02sDIXBmBrYgD+2sd+sXwsAYis1Ob1ZsqD3BNicKSjT1Lb0aXXlC7or1yXCZ6V5qlwCFz7jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8794

Replace the hardcoded 47-bit DMA mask with per-architecture values.
Add Architecture::dma_mask() with an exhaustive match, so new
architectures get a compile-time reminder to specify their width.

Set the DMA mask in Gpu::new(). Gpu owns all DMA allocations for
the device, so no concurrent allocations can exist while the
constructor is still running.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 16 ----------------
 drivers/gpu/nova-core/gpu.rs    | 22 ++++++++++++++++++++--
 2 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 84b0e1703150..3f655337ef6f 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -4,8 +4,6 @@
     auxiliary,
     device::Core,
     devres::Devres,
-    dma::Device,
-    dma::DmaMask,
     pci,
     pci::{
         Class,
@@ -38,14 +36,6 @@ pub(crate) struct NovaCore {
 
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
@@ -84,16 +74,10 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
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
-
             Ok(try_pin_init!(Self {
                 gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref())?),
                 _reg <- auxiliary::Registration::new(
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 4cf5e1ff830b..6db646a49519 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -3,6 +3,10 @@
 use kernel::{
     device,
     devres::Devres,
+    dma::{
+        Device,
+        DmaMask, //
+    },
     fmt,
     io::Io,
     num::Bounded,
@@ -159,6 +163,16 @@ pub(crate) enum Architecture with TryFrom<Bounded<u32, 6>> {
     }
 }
 
+impl Architecture {
+    /// Returns the DMA mask supported by this architecture.
+    pub(crate) const fn dma_mask(&self) -> DmaMask {
+        match self {
+            Self::Turing | Self::Ampere | Self::Ada => DmaMask::new::<47>(),
+            Self::Hopper | Self::BlackwellGB10x | Self::BlackwellGB20x => DmaMask::new::<52>(),
+        }
+    }
+}
+
 #[derive(Clone, Copy)]
 pub(crate) struct Revision {
     major: Bounded<u8, 4>,
@@ -262,17 +276,21 @@ pub(crate) struct Gpu {
 
 impl Gpu {
     pub(crate) fn new<'a>(
-        pdev: &'a pci::Device<device::Bound>,
+        pdev: &'a pci::Device<device::Core>,
         devres_bar: Arc<Devres<Bar0>>,
         bar: &'a Bar0,
     ) -> impl PinInit<Self, Error> + 'a {
         try_pin_init!(Self {
             spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
-                dev_info!(pdev,"NVIDIA ({})\n", spec);
+                dev_info!(pdev, "NVIDIA ({})\n", spec);
             })?,
 
             // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
             _: {
+                // SAFETY: `Gpu` owns all DMA allocations for this device, and we are
+                // still constructing it, so no concurrent DMA allocations can exist.
+                unsafe { pdev.dma_set_mask_and_coherent(spec.chipset.arch().dma_mask())? };
+
                 gfw::wait_gfw_boot_completion(bar)
                     .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
             },
-- 
2.53.0

