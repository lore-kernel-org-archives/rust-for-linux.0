Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012001.outbound.protection.outlook.com [40.107.209.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8308E337B9C;
	Tue, 10 Mar 2026 02:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108713; cv=fail; b=tL6dngjExV2EuJ+7+KsQIloZpgbjsba83sbnhMnvDJEKGJe1NFMUO+Svf4xn7NX7NG6fn01KwXaX8cwB7Jv9lUz2B1j5ymKDFjxJAW/QAAP2yAklZVd4Vp+o+/nry9aubPnzPtwzrTmxFERfhqLllXIuH51bKyd+5YBdPkfpf2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108713; c=relaxed/simple;
	bh=5qCbw8ft0a6Jowkt9a8a+KiJFyBsvbJaWKJTG4sZ0aI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JLCe7CSreJFjXCoA5KS0Uga9bTHDMKxq4rnR7m535ckLJaxnTjwn0JF326zq2gSpPgEfPl+73QzzPUDbkYjzSWYmo9gHpQWxbLyGzf1rKzr5vVv0EHap2f4j9PaT0533gXk95NOWW1O8V1VCc7ehEUwkeJ8SQd2a5LiJomfBHSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=neCU+876; arc=fail smtp.client-ip=40.107.209.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="neCU+876"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3fN6wh+lgG/4H6acUWHIIbvHrb2eaAOs1Dtn3jJmBq2BGRYumB6+XBeCVVsINvcaL3GfGa5q3vKVLrJWf3AL4AafeY/s6mzXuO60ExOEanCyrSho+wJdi4rFgio5MxEJwTPcJth9DldJjNXGA76vqgot3mvJDnw/U1dLtn3ocE/q5FxP2g0uOiGL410Broi9r3OanVtplwtQNzyJFjA5p+jFpm/zSgT1+eW+0qTJmUGc9D/iqt4LxnXmUud4ngXFld5GbIawq4Jv6YTU4QAYaf23wWRkjlgXo0muMo3ektCxtRpJNThnkvO3d1Pstjn/3RoPpe/04OVsawPWM3I0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoBX2YrJJgBM6HxlaMTrdDC/aGdUaBgaQR/yIO/mHA4=;
 b=X6l39De+CFhCkj0HTD7ZB8joRCxsw9Cydtu4recun8GRjdENbhDVXr3nW+sSOiXXpzjr3a6K+ScOGffL8R668g8va5nbbAZIBXsyhW4MnbzwB+XhrJII8uoLKLdA9harp87p0ggwaHIylXV5CuN8ejLdtgJfeOFvaiG4yCcR0thZshqiqmYvcX2gkbDNrMI2xODCYsCkxEurNNV+7Etw9p//K6TzXxI62yMXBRBbj92FwvliFrsahwq4tOQzVZr8f1CJnl/ZD6m5IjnLippHLIzUCJ2VrnDgHs6F4uL7KWeehAykeTo0uGHUFDb26pfNpm2M7hl5GAbepB+gaYD4jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoBX2YrJJgBM6HxlaMTrdDC/aGdUaBgaQR/yIO/mHA4=;
 b=neCU+876SwUlpd0vgt7UZnz6lXOxM2NWASqY7zCofh25sIloYlj2KGOOhGaMnGDKu03y6ie3dtM/ZKE5xewqC5qSSF6rMlmKKFcEkrrqqAnUKxPVFTwGVxyZ42BWZ2dIo+plgfRh1JjT25A5aJdSl558KeDvzw/p4lFRQM99uTOeqxtw9negpgnRL42SbQEPWotWwpB/8IkBPvKOFLarzzDKFI/DHEOIlWDxtrr7F1HAO/+5ayen3c9wJ0hAyfthFf3uAS5J9xbHL/6vBa52gzOGSFG48ggOlbI9bgF3lWYpJUcG5ZdlIsM/8P3NgUML5OT1yORp4f2wrbnrOPSFgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:38 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:38 +0000
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
Subject: [PATCH v6 07/34] gpu: nova-core: move GPU init and DMA mask setup into Gpu::new()
Date: Mon,  9 Mar 2026 19:10:57 -0700
Message-ID: <20260310021125.117855-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0012.namprd08.prod.outlook.com
 (2603:10b6:a03:100::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: 409d9f5b-617c-4c07-bb6b-08de7e4a5c7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	aWin7n1K8ivMIokBvBxE2UuC1JMXz27wcLs2JENDFpTmhrUPHyTScL96o761uuiK6zwEq3kMLOm/Xpnk91u/ib2zax4pOk9RAsTUyJphArzYK6VPvL7ETSWyDFox2aI8igeKk1UIgOZeGmrIBkNH4bhlmuHGHe8vyR8SHthBbpyCi2xcwcPkj24Jvq6yMUlEdCJ8xVxWkJyAQr9NEOLZCNBLedMF/WZf0systCvOXhGuFoobJJwAEurn4B2yTHzuDA0mlfujNGCGAqi/o66miPu63dN1aafPADqMxvDC/yTOAwkgYgW/X5YXn5HIdDNsBsbz1WgZOJM2/00qzjiY2ZrBJddeThs8JCiNgVfFLMBa3UYiYR2lf2DJYMSL47bh+kWGt5Tc/94Z+kuI1YH3Fvn1ZV/zgOuEBfxA6y+FdCpalp3XoPplBG80gE+L4lXjWRfBSVnJfiLI3171ppQj/t5a8XxrMHHYbkAyTAXb2RuPKTSr85aCMlMg6SI+6t8HCVicVijttaog5YkS/DWsZpVzOf/GpRYhVOMh+gufg6V6TDHumh1Gnzvi/sIfGQGgTV4uFF8bfc9ya4Wq9wy97O832mbecnNzheLO4xIKo1HMBgFt/hGaewpvAp6Wh6nJo/pKvgMESJxFW4gLt1nmrxsJL12yI1O/gS4nfr2asZ7IyGx7sGvQ7FiwvZ7ukq6YlOz58CoA/GYvy4OXUkNgx/lI+kIbhUe8sUjkCkMSXI4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AMTS3xzv2/7A774+ueIeXZAu/x4pWeB0+xDxO0uUHwSNt3eolY7X76o2Cg0g?=
 =?us-ascii?Q?RW+Dv5TDuse0cB2UVPpnI1Lhuest0IqtlgmU67AAOzVlQ1xPv3nlPEOGhUmV?=
 =?us-ascii?Q?mqOL0QWydFqzOy0lF6DKfDcVHr2gwvz6fsiTYrj/vdBwG/9eYG49NWlVNT4D?=
 =?us-ascii?Q?0Y4gdgTFKA26B4bn33FiFjmL1H6pjx5QFWaV8o84Kckn3cUPxmz82S3itQxy?=
 =?us-ascii?Q?ar28gAMejsDSE1k9KVfWlvNSKqrDYFCWDZrmdOu1ngkPyhcyKmYEoCU7HckN?=
 =?us-ascii?Q?g7esKfd4sR00VzvLoOpjlKCc5giYMUCON/dD44l1AIclVbN9tOf2L7s6VcEA?=
 =?us-ascii?Q?7FDA2Bij/McsE4FlyD2XAMMH56yg7L3a2pQm+JM/VvwKBsVBCiNJg6C9aN/w?=
 =?us-ascii?Q?J1dDwUiTwa4s3wL1oeI/rq6SQSugNot5CnryWzNJSop6YcKTtQjbgRb4QToR?=
 =?us-ascii?Q?XX3t1tJr89Df4WpdEKqjYXeAptipEZaytc2v2LkM5br/dJW/+ciq3KARRbMe?=
 =?us-ascii?Q?n3Dp3EwEwf9yBYX8/l5ew0rZw3TD0fsw8Aiw9QIxxH79Ywxr3ivR5fDT2ffZ?=
 =?us-ascii?Q?kJ6JFmVYQb9sc4JbUz4sRxx/NWtMFMyGQ1lHtPBTf4RKrSfuZPBZsDFsdqDr?=
 =?us-ascii?Q?WLHbf0dkeoa5se8/ko6N84IPoMLCJtViNtPbmVd0wNWEI0YCqwl4Nh/y4nMJ?=
 =?us-ascii?Q?jpIkUOHL/7BRc33RLKM0MbxfsYEPpK1KqBza3u9EZDk9yuy8cjpYf59um45l?=
 =?us-ascii?Q?FNm5i6x5MlMRPJNDWggd53kE2Na2/wXRastlLzbF++t/rr3J2SzaeejAmvvE?=
 =?us-ascii?Q?v4uJOkax05hXJTdMREIX9Pm8sFPKj3+H5DPdv4errWeKL4GZdpLhokPCTRdN?=
 =?us-ascii?Q?lwxuIh/PHANRk8mSLdnx6uN3royazI1XNJBE2COe1yfxuwu2RpRb+1G7nJy2?=
 =?us-ascii?Q?riAmI54CTGushjlqurl5olKv6e42AO645iJ3oasmU0jsE5q4agH43fRlVabX?=
 =?us-ascii?Q?AmlcvV5wObE/x3DrqSWJnhYj1GwUbwaFuOwmjWA0mL+T3+Fu9MDEjMZCfQWz?=
 =?us-ascii?Q?e9mjpngINkyWjI3N7h9DEe0nwSHltDApTZKZffsqM4Yo74fIPBYMRj64I/la?=
 =?us-ascii?Q?mPtR/ZB4PxGs639pr6/0OJnrmI/Q0+vAHCgcjVz1fAu6YLX5YIreajlFhD0B?=
 =?us-ascii?Q?jCV1OYI4lEwk93d85tGaSmsULzC99Vy3ZZ3hsSHkOBR3Dsbo96cgSykoYBwf?=
 =?us-ascii?Q?l2EpgKo+DAojDp12msrY9LRNiLYlrdB2wzJ9phcBuvvnuWEMhnL9MaIdFiga?=
 =?us-ascii?Q?akza4lKn8gJTLp69DlWS016G5bGV2nKShq4zHeGeYXS5T/Uk3rB7KTANDm18?=
 =?us-ascii?Q?2RaqZ34yAO4ErCdSQmZJHBraT6KTGWkhoHFptjdbwOGW3GRu0MLavTqf+mxj?=
 =?us-ascii?Q?cpAX6XrJsZrYnvWeq0sYCys0/E/T0MVGhOtD/7twMe0GGDkDrIq9FBjagvs9?=
 =?us-ascii?Q?36pQ/hCjOsBCPGE+F9NqvST12HYEK6G+rLY0/oh2VpSsKuk2sfxBMx2yp/LH?=
 =?us-ascii?Q?03zYcUm096hF2Um31JxZlgCeTwPW5V0Bd/pq5sTkS9E8tkAiiY1OCaEu91aA?=
 =?us-ascii?Q?DjIDHVyJPZQgFdQJg6wRG/qsB/+gQY2CBL7asKpLREsXsdhukQwffwr9W0JN?=
 =?us-ascii?Q?yWjjS+piBr9CAU0Y2pjFLvenmyi9KvNHpR4eMfBWg398kMQJzzG+6Jg8T6Ht?=
 =?us-ascii?Q?oweq/Pa2rg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409d9f5b-617c-4c07-bb6b-08de7e4a5c7f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:37.9523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGWva9n+biccGw/4No+/eqbMd7ng+MSCPf5qFAsHxIh3+K8GmqE8l9NWVM5ggUtO1MjU+AugD20mKocMKUAGBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930

Move Spec creation, the dev_info log, and DMA mask setup from the
driver's probe() into Gpu::new(), so that all GPU-specific
initialization lives in the Gpu constructor.

This restructures Gpu::new() to use pin_init_scope wrapping
try_pin_init!, which allows running fallible setup code (Spec::new,
dma_set_mask_and_coherent) before the pin-initializer. The parameter
type changes from pci::Device<device::Bound> to pci::Device<device::Core>
because the DMA call requires the Core device state.

Also makes Chipset::arch() const, adds Spec::chipset() accessor, and
makes Spec::new() pub(crate) for use by later patches.

No functional change: the same 47-bit DMA mask is applied.

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 15 --------
 drivers/gpu/nova-core/gpu.rs    | 64 ++++++++++++++++++++++-----------
 2 files changed, 43 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 84b0e1703150..e07f7122b35c 100644
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
@@ -84,11 +74,6 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
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
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 3b4ccc3d18b9..a7f1957880ff 100644
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
@@ -162,6 +166,10 @@ pub(crate) enum Architecture {
     Blackwell = 0x1b,
 }
 
+// TODO: Set the DMA mask per-architecture. Hopper and Blackwell support 52-bit
+// DMA addresses. For now, use 47-bit which is correct for Turing, Ampere, and Ada.
+const GPU_DMA_BITS: u32 = 47;
+
 impl TryFrom<u8> for Architecture {
     type Error = Error;
 
@@ -211,7 +219,7 @@ pub(crate) struct Spec {
 }
 
 impl Spec {
-    fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
+    pub(crate) fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
         // Some brief notes about boot0 and boot42, in chronological order:
         //
         // NV04 through NV50:
@@ -241,6 +249,10 @@ fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
             dev_err!(dev, "Unsupported chipset: {}\n", boot42);
         })
     }
+
+    pub(crate) fn chipset(&self) -> Chipset {
+        self.chipset
+    }
 }
 
 impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
@@ -285,36 +297,46 @@ pub(crate) struct Gpu {
 
 impl Gpu {
     pub(crate) fn new<'a>(
-        pdev: &'a pci::Device<device::Bound>,
+        pdev: &'a pci::Device<device::Core>,
         devres_bar: Arc<Devres<Bar0>>,
         bar: &'a Bar0,
     ) -> impl PinInit<Self, Error> + 'a {
-        try_pin_init!(Self {
-            spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
-                dev_info!(pdev,"NVIDIA ({})\n", spec);
-            })?,
+        pin_init::pin_init_scope(move || {
+            let spec = Spec::new(pdev.as_ref(), bar)?;
+            dev_info!(pdev, "NVIDIA ({})\n", spec);
+
+            // SAFETY: No concurrent DMA allocations or mappings can be made because
+            // the device is still being probed and therefore isn't being used by
+            // other threads of execution.
+            unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
+
+            let chipset = spec.chipset();
 
-            // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
-            _: {
-                gfw::wait_gfw_boot_completion(bar)
-                    .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
-            },
+            Ok(try_pin_init!(Self {
+                // We must wait for GFW_BOOT completion before doing any significant setup
+                // on the GPU.
+                _: {
+                    gfw::wait_gfw_boot_completion(bar)
+                        .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
+                },
 
-            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
+                sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, chipset)?,
 
-            gsp_falcon: Falcon::new(
-                pdev.as_ref(),
-                spec.chipset,
-            )
-            .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
+                gsp_falcon: Falcon::new(
+                    pdev.as_ref(),
+                    chipset,
+                )
+                .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
 
-            sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
+                sec2_falcon: Falcon::new(pdev.as_ref(), chipset)?,
 
-            gsp <- Gsp::new(pdev),
+                gsp <- Gsp::new(pdev),
 
-            _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
+                _: { gsp.boot(pdev, bar, chipset, gsp_falcon, sec2_falcon)? },
 
-            bar: devres_bar,
+                bar: devres_bar,
+                spec,
+            }))
         })
     }
 
-- 
2.53.0

