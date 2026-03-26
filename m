Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A35375F97;
	Thu, 26 Mar 2026 01:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489171; cv=fail; b=tDPFJeK/snVlM6Yroyzvisk43zA1MO2tt+gTsL5zRShRi76nBk4VwgmucMG+h+A96HdglseZGj1G7q8EWemwxTbntg6s1xwnLxVOmKD+BE9ePrfRhJyWjc0DnHw0pyKEkk/AMenWMxuWkyxQcekBfthqRjqywMJWjX0cwkuEjx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489171; c=relaxed/simple;
	bh=JQ9TjmDHnLp6asLw0+QE4+lbAftcZCCX1Rne22DMH8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gsO/iQpjHLgtFOmLnIECuFYjTwT8XcKA9JejaclWD2yiwErZsuslwrGwrbN0cocA/W337ksIy7kddGdO7WQs/pnCQDy95bS8XmIlQypsQwUE4a4LaI2IR4OItH8uQDPKVgA8VOdP5umVBZImj9shM6selE37WidB8AXnPo/Z8ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hkRncfly; arc=fail smtp.client-ip=40.93.198.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hkRncfly"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgCUUuheVfe105bqgxQiaKOBcTJ9twxfjb3c3Tr4ondk9Fx7+QyEifEZWzP2Ju6dkgXy1sGDkztuLs5hrH2i0GNA97Elc4kEXWr8kZN1QIyuJ6CiJPqZma2LZ8XZUtSTsH52xfcDGBhVt6Arb4twtDpbcwqgpC9gWw2oagsHfL3nZzebD1w4hIt2jB58BJ1GC3UOYxuvRPqRa+mI49Mb9UDmSGW0MIYVk0dGuQouJSfUmE/rOxFaX+PtsNiC/0/QnDCUO1cWQwxw3QOdyGUwm+kgvgcEQs0B/bBnhqYhq+uikTpTexCuk6JI+apxqUD9Cgo7hs9GymZfpvKelbQ2aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZT2qkPP1QRy8sh7XxXpzU6tWDO0FYvCSLG7bEiNnxJE=;
 b=UqK0UIa2IMx1fzOo1XdlMN0j4sGgTLade68CtwOCTNzm5SRYc936Q0twHjQS2P6svhA/XbcxZjurj+lfg+9y3L8awNW/mqQjVKmhlH3WMb+o5G2xFOpdZqH/X9kW1j8jG52eNm2vAmUJd9h+hjEsF4G8xCDTcgW3+ntmZ+SjXWfKe4m5Y4LGgz4EeCIeoZrTVFnb25IYXgzemyM5XPJfiTzwzkO3ngDWkUOohsCzCZBVxH7AAuqCQgoUW5FlJ0L9g0MX3avrTnEi+7JLUmU8aEctAcZ1LyPc7SY20BkJJCyYX2stWZK07toCcn1wP7hCR+QHoLYWut9vo0bGEN/pdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZT2qkPP1QRy8sh7XxXpzU6tWDO0FYvCSLG7bEiNnxJE=;
 b=hkRncflyXj/qFEBYnsqymwfoNHYeo8+Y4/g9O3t2me93yhYYLLB/YlwDar6UvhknGtSzm1aGyGZfcoVGfD5Kon7NXB2CisTzTN9UWVolAlICk9nF/yZYx7OU/zB2eeYoovYeEODCJ9HXb+LZggexoivO55NR7Pvvs6WmmU9IIpT2qnOqKoAiLsXzf9F6G3Qa89fPEj/EG24gBSZ5VjDK3HKCK/voA0ljKJQS4NRIkR3Vi5/8WzIH6F6Maxth4sx+9y9/LzmK9vsZDHOdZga+YTQ/2uoe+3OSPfDglcbgZwdDybPWvOTBM8+Wdi0GbdssmzpycPtaRKXMvelyobw5+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ5PPFF6E64BC2C.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Thu, 26 Mar
 2026 01:39:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:14 +0000
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
Subject: [PATCH v9 05/31] gpu: nova-core: set DMA mask width based on GPU architecture
Date: Wed, 25 Mar 2026 18:38:36 -0700
Message-ID: <20260326013902.588242-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0107.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ5PPFF6E64BC2C:EE_
X-MS-Office365-Filtering-Correlation-Id: 4560c815-fafd-485b-b24b-08de8ad87cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nJgCX4nb7b8iyPWUwGvKTqnNg2kKzFixlroa9d6PHreA03qPjrUmxqO+jVTiRKOgoevUsCUq8i1x7sR3ci3UREAJjZUebMgNZ1e94DNVWoIwDYSfcER1H8C3524GaATVRBsuCtJ30JWbPZWjCsKUALr33VF+i1gGJiwgalRnMnN0MnV9G57khFU9A2qXd9hFdULlw/X/ruXpV+zTAhQCHx10rrfXDOiu06qNjsCiWjtmbyAcnCgLghRX1D/hE5J72Ux6SbufSYDVCxzE7eZpSAVXCYiMUNC8CeQlCZcgXE+CPQQfibCwOj8gvr8cDnOQlt6/0+/GnhdA+fNQ8Kvb8oj1vT1j3P9zKcR6eLurwLiN7jV096ZegT/Q6ZLBfGGZOXFVJlvZqxJukbeRVdCfH60RWkO1tv/LdB/aHZNLjf8DfVFuD2xveii9pN24oWiDACzU46jNDsUEXRAM8bQNvsSLmHGXsrabZi5b5AM5By9gVP6r+tsAg8g4QFtniI+JO0Ors0GY27PZxzIg/H97Vs+TnjFJkVlU1x11eYf9lqY542BnFTFFETDhN8wmk7lYE4EY23GZydMaS3GoJbWnUsbPBjAyUXj7Q5QOnd5G8Cwqc/XHZinSrtU9JG2E7+UTsky+B17GrHPu/4h+4NEhwPZt0908hYR8sTQTOKgrVD0S+RtzdCuxEolP7a8GVfo4cyo4hsZsmMeWNk6RqUN3HXXd3vJhNf6altgONoJhjmE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?emunZugqHcqOIrG6jdqYbRdT1Al2TmqLFr0Kdo6zhrsMqMZyrX5HA79s3L89?=
 =?us-ascii?Q?HIrRVIYt0r/bdsZeqZ9IXSzJUJWWmD7Zjqd+7IyO7o0sdty4oaluDvd+20Jw?=
 =?us-ascii?Q?sF6b7uOYTEX/1/5gYxbHwDLKw51nXLzZtp58ruGdE7Avq3+1O16vfxOl9hct?=
 =?us-ascii?Q?CV5Ju4/Za+8dnD2nPFW/sQ+6JyjEbvTwCmJVByJGHDBMvf+3PMRdls3eDVsY?=
 =?us-ascii?Q?IPz4iuEvlUFV5WvIfGlOQusaRaBvzaUfFSPN+18hZWOj/hmzt8XfyxYpwS42?=
 =?us-ascii?Q?kS/RGoUzp9XBClD1R1Z7lu0Svrf0m3VYI8CBNHKvrxpFJjfJIcZkp3VSrmRt?=
 =?us-ascii?Q?pOKA1v3kbvG9p8yQa4uPA6PQpDvwtmgBA9OeheYp5XjQm1ctDdaKZwfpCNt8?=
 =?us-ascii?Q?dMuxdLEhDO7kSn3ON2lUMP4uyqKIfVywrUuox4/PZdQMRAjougbcQsK5Vb8E?=
 =?us-ascii?Q?7L1C2lP0nVBZj/MyQoU61OP434LAdcxGAQPkQfOGOku25dx7xL13lWxLaB6/?=
 =?us-ascii?Q?s5WlIiQd5/t4WBObckqpJn81yJJdPxtYQy6L7nH+QmlEQtlt01RikQX0fbiS?=
 =?us-ascii?Q?CzsfZCpgty/8giAFJK3hSXs7L/HzNv2e6Z8FCDs/JAJrR2/Mb+jkZ3Kz+K21?=
 =?us-ascii?Q?LZAbLPdoWuCS4mNrzFBFh/+ur+SSfT5iVx7bel3fIxeytoQJ64dShjrYEBg4?=
 =?us-ascii?Q?0Q94Z3lSlRdpMiEtypQZOqSkcClA+4uFerhVTDKnE/PvVRGAfSFWtwNaCAE0?=
 =?us-ascii?Q?fYOLrwMMt8iOYNZEyzJL/zAH+d4z8ysXTJjePZuWXth3bwKtyqg8XdcpsXu3?=
 =?us-ascii?Q?HdJWzjo/SEPJ0Ls9IFFscrli1j7CrLa9RBGgTiQON7BPvi09UmuKp6XPEfW/?=
 =?us-ascii?Q?9lmWsYhYLvUbE98IXJVWSuz9HrdloLM07WELJuFSdhQThMXjvRbrfpi7/n5u?=
 =?us-ascii?Q?hLeZxYjsmPtn8oDlDOSTd/eyaFyr0zD+1SnBQaeEObcut//v1dn+n9ALRev8?=
 =?us-ascii?Q?OK3NmwN0vMm3aHlsyXbBgDnFiZ9KZ6q3lB/26tdN33g3sPmfA6Xq/sx1Pcjq?=
 =?us-ascii?Q?aUJaGvvxNtQvn+LFjXN6gw2tHNECF8X/O5OXtkHjssH6PJgwF0F7v1lNBils?=
 =?us-ascii?Q?3ir+BuCQskEgv03wI9cuJuGq/uffWYky87IrTf9oB5sMSce3pMb7hLhS8neH?=
 =?us-ascii?Q?t2ahgCS4YiZWUAAcNs8yP9XEgqGvUWVXzPN5zLJxFW8zsajC0hibozgDhDbA?=
 =?us-ascii?Q?zxcFZyJ/xAbyd37seZXFeq3tvQbjQGsl0ZTOvT1EDZHWBuUSLYKlB/NrnxGz?=
 =?us-ascii?Q?Z9+cM7gfQWdBoP5SyhunLsHkGlYDAnHhkH2s0ppcp6rBf0H9UpzaS4IYaKqp?=
 =?us-ascii?Q?5Cfs8YK3w9kCBACT2TdYGqMHmgNZ1/MBNmiimbg+CqENLOsFn0nVeU0Z1suF?=
 =?us-ascii?Q?iE3VJbhAkEfJ1WLC/gwaIuATsA5DNkkdoqcsyaTc0ac1onTi3JgHJRS+DBpX?=
 =?us-ascii?Q?YIpKnMYaV61OMzkjJgXgeevKAVUfiJTeF5lv5+VhftiTIV8HT8F0wi5Dpiew?=
 =?us-ascii?Q?+vv7C4W1wJqrNvjHnZUDVBZOiRA9w1zeYtPvozc+/ydofRuzX//DnOr0IgSF?=
 =?us-ascii?Q?CegIzsOvN3gwdHtHzRh+nLtzEVNqpSiIKbFXSr/eXnCAol3ITjUL6loGHC+d?=
 =?us-ascii?Q?zWAmBbfrYWr4IvF74pDvr31EcgmoRepavy1XoVR5cMe2FkHx2a5L1+edCIq+?=
 =?us-ascii?Q?WDef7C9v2A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4560c815-fafd-485b-b24b-08de8ad87cbb
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:14.6282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kY4K7+iN0hSwEfrnqvmc5IQAWBo5zTI7eBalDvRSNN2SNm/hl5UtjX1DkRxcBTKdQAaNiw1NyyJ5SFOwLty2/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6E64BC2C

Replace the hardcoded 47-bit DMA mask with per-architecture values.
Add Architecture::dma_mask() with an exhaustive match, so new
architectures get a compile-time reminder to specify their width.

Set the DMA mask in Gpu::new(). Gpu owns all DMA allocations for
the device, so no concurrent allocations can exist while the
constructor is still running.

Move Spec creation into probe() so the dev_info is printed early,
and pass Spec into Gpu::new().

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 24 ++++++--------------
 drivers/gpu/nova-core/gpu.rs    | 39 +++++++++++++++++++++++----------
 2 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 84b0e1703150..bb82e63af044 100644
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
@@ -23,7 +21,10 @@
     },
 };
 
-use crate::gpu::Gpu;
+use crate::gpu::{
+    Gpu,
+    Spec, //
+};
 
 /// Counter for generating unique auxiliary device IDs.
 static AUXILIARY_ID_COUNTER: Atomic<u32> = Atomic::new(0);
@@ -38,14 +39,6 @@ pub(crate) struct NovaCore {
 
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
@@ -84,18 +77,15 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
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
 
             Ok(try_pin_init!(Self {
-                gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref())?),
+                gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref())?, spec),
                 _reg <- auxiliary::Registration::new(
                     pdev.as_ref(),
                     c"nova-drm",
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 685ae4c81268..f70bfbda1614 100644
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
     pci,
     prelude::*,
@@ -160,6 +164,16 @@ pub(crate) enum Architecture {
     BlackwellGB20x = 0x1b,
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
 impl TryFrom<u8> for Architecture {
     type Error = Error;
 
@@ -212,7 +226,7 @@ pub(crate) struct Spec {
 }
 
 impl Spec {
-    fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
+    pub(crate) fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
         // Some brief notes about boot0 and boot42, in chronological order:
         //
         // NV04 through NV50:
@@ -244,7 +258,6 @@ fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
     }
 
     /// Returns this GPU's chipset.
-    #[expect(dead_code)]
     pub(crate) fn chipset(self) -> Chipset {
         self.chipset
     }
@@ -292,36 +305,40 @@ pub(crate) struct Gpu {
 
 impl Gpu {
     pub(crate) fn new<'a>(
-        pdev: &'a pci::Device<device::Bound>,
+        pdev: &'a pci::Device<device::Core>,
         devres_bar: Arc<Devres<Bar0>>,
         bar: &'a Bar0,
+        spec: Spec,
     ) -> impl PinInit<Self, Error> + 'a {
-        try_pin_init!(Self {
-            spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
-                dev_info!(pdev,"NVIDIA ({})\n", spec);
-            })?,
+        let dma_mask = spec.chipset().arch().dma_mask();
 
+        try_pin_init!(Self {
             // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
             _: {
+                // SAFETY: `Gpu` owns all DMA allocations for this device, and we are
+                // still constructing it, so no concurrent DMA allocations can exist.
+                unsafe { pdev.dma_set_mask_and_coherent(dma_mask)? };
+
                 gfw::wait_gfw_boot_completion(bar)
                     .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
             },
 
-            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
+            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset())?,
 
             gsp_falcon: Falcon::new(
                 pdev.as_ref(),
-                spec.chipset,
+                spec.chipset(),
             )
             .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
 
-            sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
+            sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset())?,
 
             gsp <- Gsp::new(pdev),
 
-            _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
+            _: { gsp.boot(pdev, bar, spec.chipset(), gsp_falcon, sec2_falcon)? },
 
             bar: devres_bar,
+            spec,
         })
     }
 
-- 
2.53.0

