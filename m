Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806523F7E9A;
	Tue, 17 Mar 2026 22:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788058; cv=fail; b=fzf3BgChNmlAi86DQUB5lVS4AZEWZa/L/EekdC1cIuGRROyiuTM4Q0FwVcQdyNust5RBxak0dCFy7hdOpaSRc5wpbXmqab1sXqeDa+NoKSKUNL+nuXX0o8iJHQa5pcq7hei8xOFOqJHocGmP8zn6cIjaYhTjUwX76wfojdrBh3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788058; c=relaxed/simple;
	bh=HGGxnZAhH3ZQS29Zg9b5FbR8pj81XIsnn5OWf552kVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o2MmvOMao/GWITumNr37n6Neil+FWJ7oVsu8Rz4zCna3vUbqZiYz7fxMQ8jgUnKrhedzympLttiMLjfPzPVhQ97B82UMDr6SkyT5HkBKUWqcsDPP6MvrkVphnfnbDHJXXH8Q4CvxvS304IhqNFiJpWLxRq0mVbO5ZXnAVKsn2Mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RJdCwl3V; arc=fail smtp.client-ip=52.101.43.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RJdCwl3V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2d6zXMucAq+r/dS0Jss+Y4asvErr0iYPxpi6eCHkqhZsfKURMwUEcYJt6enUIQWMhnp+6xXiP8iKwOMT1XdODAloFBnaX8akYLrXzHRNQJXC2fVMJSwlgbV+7MFUh556fx4EFUMMqqT4Vmje7/UtY1/QniddL7o9+ApjPh5cbgRIeV+vwGL+DwhsQie3NAJ6Pw9XCR9s6IubmRtZqvQF/jPwNwnzlo7exNvQrjLlv0D7u0XT8E3jrYiBTUVNS2DYDohqU/MsPyuzqJUuR5qa0N+SSlIrDF8FkvIyErJ5WxqQXVUlpWCcnLYyp7NNKek27UImwooznswnsb1BcLHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLSyv8qCQlbZEoL5LOvLGSsg0FF553hpaFOyZaNpzks=;
 b=ejGR9JXeba3y9DGNyjwKV4pWWrXo2Jz7uWAMri3/cbZFxvkkUlAHc/2uDlqkY8h4KwJY02ycdUG65uk428zEmAmoayCuMuV8hH8flNhRtkWwQtA8rZUCelcmU/kIH1ydq7D+XprozRYFqR1eCYivpe4UaIMzUG6GiLUqzTB6MbbAHetPNo6ePpwWYEhytkhyJZNL1LHygjO6plOaEgbZB/ZoRu4EYNnFeYdsWc5aOLI3VzDYbHGbS3JgEMjkfd60+FxuDN/EqbK28aiun9DUuFsylCsJzAn+hXzwy96KhD9oCsTmjBAwlqDZqpCKC8FVv/4MX4FV95z4AImCaQ/lrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLSyv8qCQlbZEoL5LOvLGSsg0FF553hpaFOyZaNpzks=;
 b=RJdCwl3Vt2XFxyN7FDnQTFkPZMBvaWxpJtcXkFghAuLCNoPyqkjTDX4ADW2qIpb6x9cJqBUmsu9vBNF3jx4lP07ZgaA0iifvUE+51Z7e8ds2dGhKzshZ+0vJBbnKAhg2k6D5pvamS6t7+ll9AiZ1yYrZINMENmZHSUaluEGTH2ElZhsvHoL981osAlBs3CBVoF2hw3l+cBIGbk0NugEF+v4vLRLmlfYWMALizGaDGTSwq2OB2sHhdapSVD/24qkqbWJCfqXQu1xnEzHPYJhgG1fVsmqGMB3VudHN7WJJ3s4OfrCeDEo65eBZUjTwB4vDJP4JDBQpumZcBIN6RjoRHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:54:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:05 +0000
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
Subject: [PATCH v7 05/31] gpu: nova-core: set DMA mask width based on GPU architecture
Date: Tue, 17 Mar 2026 15:53:29 -0700
Message-ID: <20260317225355.549853-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0237.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d2a25eb-2f74-4801-10f9-08de84781709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|7053199007|56012099003;
X-Microsoft-Antispam-Message-Info:
	esZyps3v9hv4ClnPxrJ0O442pLLn6tglDZFT/om4XCAVOGigp7ch5peTTQx0VT1zmmWYgYl38WAprNPCyXZKgwSQ1h/Tb/w2l4NsrJHr8B5bnXDVcabqS86l6JWFof1uLnFj+MENlwlnZyQstklgAYCSvBXCxtrwGxRjEIe95OQ97DiVuQCyahFid8IifbY1MRpUTRTEx6ys/5l1RDtWHGX9K5r1W+ik+TWRyrWW/cPbWr/sZWb5lEDY5TYc6emAbk/axxQPgJk6Gm1sLe5fPMQHEYiRVGnCcjY8u/cNcgXt9zNCJt+5+in+hOlve2q2hezpVLU7Kl8wmzWfapnUjl8z7LYU6vL+lX8hkrhV3MFLF+Hp3h/LDP6ZMgo05JMXcLjNkfy4IZkHPw3Pd3DxB/SbIE/+B8W6dQTBt0IzpPSuHSrVhWMOQFCTCn9yJMM7h6k58JCJd8ycEdsTkA0RbLngvQnWgJlOiQksav/0Qjy+QQHqhSii9kQu5SQjFFySRDxI3gYq1rsrrcEZGZhd1eDwS6nP9UW7GYbpwIYuqf6GGqQbx/NcsxGjGEHvtlLpPGPBDi2sLpHys8ZTTyir0Wsp0DMwlPHepqo257q7zMuI3fayiFzPg9pFmM8yCJbLuOQJ8uoNQnsR5JrMXgxCKEX+bU3SxgVbS/mPmlPR10o3jWB7B68NiDWJCJYnsOIAIlZWkUvETvwyspcdGfCe+GE847DnX9TLro+mICtx/8A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(7053199007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/7zJonF7X5e4XjPB3E7P2s1TB0hqMkmuW08++PPlE/lkyWutIN2EmP6/BGnx?=
 =?us-ascii?Q?C6HswUTeW0eNdP5A6dUHCEsgMQ6GDEGPWAG6shlLptvx9hXV/m86RP4xIgau?=
 =?us-ascii?Q?ulk3PYOiHOsz+jB7dZzeB0dek39EXVYMYYk/lZsaGkgzcJDRu2C6xKwPKt3G?=
 =?us-ascii?Q?GPoW6+hoDH9ynfEoSsOn0Mg4Am+cxEB5KyIBvWfZPzmIsuv5SeEzxGjY3THz?=
 =?us-ascii?Q?o6h9Ve74hIJgZnrYeOCWKw3WqthBA/Cu+8ecBHZVHs0udH10mFjWVB8Et4Um?=
 =?us-ascii?Q?MMRwPUWRylBXsReJ/IRwCnU+T9kAzW7jsNS0rNJivOxVGzQZQTVV7BM4p4nJ?=
 =?us-ascii?Q?8VJZDylRtUvnqMTk+/eyF5kxS9iLJfoIgmdLBMwxfAtTJjDj3WHDQT1bYdDb?=
 =?us-ascii?Q?EJGcZnxfEQqqCN4C2RQ3F5vmHEG9IiFgewfQSpSzeYE5RIjA/Q2GobUD5SgC?=
 =?us-ascii?Q?g0qPdNJ5PuyeQz/906tC/Kbuo3dsswVS8zsgIal0BpL55Fn5BohFZCmV5STZ?=
 =?us-ascii?Q?LEjB09sLypJ0t76PIrtTJ5tzRpOjcM8CsmNG+hilw3NGvIkBXOxCzPv5Hn2r?=
 =?us-ascii?Q?YFMB8rnr7STeR1MfN2Hev1dNNhqv5WJGeCR//a6/FJ67qy78x++xi0vTACSq?=
 =?us-ascii?Q?ILBDVBhRVq2RJSuCRBaxeBiu9LqvPUAMQ0BBsUQ6cvQBt/bcOBk3fz7jqh6l?=
 =?us-ascii?Q?3kavxxCKL7aJPyzQ+UCyV8Dbc5i8tZn/DpB+72YnP0GmGwRy0P8M2G5kCrS1?=
 =?us-ascii?Q?ACVlaamewnuPDiBDel3IS8Dj2UXrUw/X/fonJR+JacEzAmZu4jO+mB04Uc4B?=
 =?us-ascii?Q?N7JUHWlnkrYyfKYH3bEaReXCbbi3HhNDQiSh9mtfpaiHRlQIrZY9QJOHD2m1?=
 =?us-ascii?Q?ZKyZwtT3ZfTOKDZazDBs8qwSqzziQk3tFarybpjGw5nKOK8TYLNiDnWoQZc7?=
 =?us-ascii?Q?AM55wamhRs2frt6WN+hJEtrirszj1GZ2VdkfIYyG3XpExl0WMgIxo0Hr/fq/?=
 =?us-ascii?Q?N9AIwMMVA+XKXTHs2WTt38VktMp7H+ZmsbAYbq05BfZmzlK72JGpwM3mEXKq?=
 =?us-ascii?Q?BSS3fLTDwqeGmEy2RKlxkfPFm7KnBRDe5paBcW8MD356K0FpNFJMtJsnrBNo?=
 =?us-ascii?Q?ZG7GxNEhwiy3QLWszZnm2QpB9JB91kw3d6g/hwCHJfMBX5DIzI6QIloR1kxA?=
 =?us-ascii?Q?jRTsvDy+624YPIhxXN2R/tppwGduoKeTqaaVItC2vcxw3pSAr5t2BZfMlgwi?=
 =?us-ascii?Q?G3vZfZY6kAmwNu/JRN7dt7jccUXU4xMAtkHQcQQAGdcPsLwvETEpN3BkLoKE?=
 =?us-ascii?Q?NeuagXwa0mt+hAORLgUtk57aOWJbJi2iGcgMD7Im8vaG4nFmqk6+inN7mOc4?=
 =?us-ascii?Q?WZCkG2Cxlq4bdL+4xhaw4Hz4vRicQvFo+tIJ1u0T9PdNXLyKQ6UISVyCmX5m?=
 =?us-ascii?Q?Y084H9P/DahDaX76DEZ0ODU9FcCB2+/n92s+MuM42qKr4e6paxZYCElsKz1n?=
 =?us-ascii?Q?VH3CL9nDHEvSNd4aFC8OwjpwvnkksaObkqQ9rrAIFhMgC5/YNYZyg3NqWZkH?=
 =?us-ascii?Q?/j3G0ZJMR9kaxpSvy2Ym3p88pwpaOGgzTAkyVaxjpHfspKmEwJYyFMPyWK99?=
 =?us-ascii?Q?UuYzAZYRBYQa7Hi4VgyKxpT4x8+aECEEzMBdXSwNasZmuCV1vl1DqQqhWXA9?=
 =?us-ascii?Q?RPFBGXxGPPoFyf8bX4XZSjwwUPd314QnGGTZLNPGbvow+C40ThPw1NuGwS0Q?=
 =?us-ascii?Q?z2HRbvsEDQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2a25eb-2f74-4801-10f9-08de84781709
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:05.2438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oY+YW/mig5/Qv5RM+vVIIfHsivxL4YZGoUJcZqkah1cZp0Fq6XRFjumrJLnDfGFLXswJbO1HCFlDmYvGg3xtEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

Replace the hardcoded 47-bit DMA mask with per-architecture values.
Hopper and Blackwell support 52-bit DMA addresses, while Turing,
Ampere, and Ada use 47-bit.

Add Architecture::dma_mask() as a const method with an exhaustive
match, so new architectures get a compile-time reminder to specify
their DMA mask width. Move Spec creation into probe() so the
architecture is known before setting the DMA mask, and pass the Spec
into Gpu::new().

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 28 +++++++--------
 drivers/gpu/nova-core/gpu.rs    | 60 +++++++++++++++++++--------------
 2 files changed, 47 insertions(+), 41 deletions(-)

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
index 8f317d213908..9e140463603b 100644
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
@@ -162,6 +163,19 @@ pub(crate) enum Architecture {
     Blackwell = 0x1b,
 }
 
+impl Architecture {
+    /// Returns the DMA mask supported by this architecture.
+    ///
+    /// Hopper and Blackwell support 52-bit DMA addresses, while earlier
+    /// architectures (Turing, Ampere, Ada) support 47-bit.
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
 
@@ -211,7 +225,7 @@ pub(crate) struct Spec {
 }
 
 impl Spec {
-    fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
+    pub(crate) fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
         // Some brief notes about boot0 and boot42, in chronological order:
         //
         // NV04 through NV50:
@@ -292,38 +306,34 @@ pub(crate) fn new<'a>(
         pdev: &'a pci::Device<device::Bound>,
         devres_bar: Arc<Devres<Bar0>>,
         bar: &'a Bar0,
+        spec: Spec,
     ) -> impl PinInit<Self, Error> + 'a {
-        pin_init::pin_init_scope(move || {
-            let spec = Spec::new(pdev.as_ref(), bar)?;
-            dev_info!(pdev, "NVIDIA ({})\n", spec);
-
-            let chipset = spec.chipset();
+        let chipset = spec.chipset();
 
-            Ok(try_pin_init!(Self {
-                // We must wait for GFW_BOOT completion before doing any significant setup
-                // on the GPU.
-                _: {
-                    gfw::wait_gfw_boot_completion(bar)
-                        .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
-                },
+        try_pin_init!(Self {
+            // We must wait for GFW_BOOT completion before doing any significant setup
+            // on the GPU.
+            _: {
+                gfw::wait_gfw_boot_completion(bar)
+                    .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
+            },
 
-                sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, chipset)?,
+            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, chipset)?,
 
-                gsp_falcon: Falcon::new(
-                    pdev.as_ref(),
-                    chipset,
-                )
-                .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
+            gsp_falcon: Falcon::new(
+                pdev.as_ref(),
+                chipset,
+            )
+            .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
 
-                sec2_falcon: Falcon::new(pdev.as_ref(), chipset)?,
+            sec2_falcon: Falcon::new(pdev.as_ref(), chipset)?,
 
-                gsp <- Gsp::new(pdev),
+            gsp <- Gsp::new(pdev),
 
-                _: { gsp.boot(pdev, bar, chipset, gsp_falcon, sec2_falcon)? },
+            _: { gsp.boot(pdev, bar, chipset, gsp_falcon, sec2_falcon)? },
 
-                bar: devres_bar,
-                spec,
-            }))
+            bar: devres_bar,
+            spec,
         })
     }
 
-- 
2.53.0

