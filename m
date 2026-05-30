Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010063.outbound.protection.outlook.com [52.101.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17393375CB;
	Sat, 30 May 2026 03:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110616; cv=fail; b=t/cYKItvxZMfxkRCOYM8/pgPtYK1X+01TPHaew12MMydi4nPg4rlQP4LfE1xzhJNul1oyr5AhCdEu/PsLQVCQ4rYBOFkN+3cV304THODmbqN5ys5tOCrLNNGwJjmB+pdOWuqlq3IR4tOKLBYiw7lngkIlSKa9M43wCiuMABB0/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110616; c=relaxed/simple;
	bh=pbuziWFeA7MNaKNXb97DoYMWnN2l8NutMC+ZS1CuqCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wbp2ifeFxGBkhIeZeRMaWhbHZQVj3KKlZbaCtamajVRmej5YDKs9Hy4tsYVwgaJDlpNImHYgSOzueFFI9+jlH2dufVoXB1FoBq8zUARJ8CTgRhcsfPk3OqEEqVCeBmawoiutEiSZF1tkUCDPV5nsda+bVIirAd0pEtpqeXQlcJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MWKUlP4e; arc=fail smtp.client-ip=52.101.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MWKUlP4e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVkwlZo3bITbb1KmaiN9LYsmsJKx0kFWcL2Vu1xssPXVc9P7mBNyV/cSMhV01Gkj/Fcr9OlZjZvuTygz9OCNqZE0CdYdV4JgRcjNY9oRn+Gm/+TIi20ovGbinpbf3Jd7EfO8C/9gJunyPEZd8VLnqj0h0x5KSwZru7V5hnDPPBmd4/wq8RumefrdkVnlLxKvuBphLefcAQMiAJTDtBCEvrdvEz2IFKX6nmLffS4UStxUY/xeXECkzo653KkNvXhPs8MQU4mYwBXOeDmq7u8srj5zu0yZksnlkVYYmWMbGc2uNGhOHHpCokVf4vKHoOJjJwTfYt9r0BDZbZBj8p5fOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfTVN33zAiO7dO2q+XBSG4Vqi04JgtPW/HtREEynGfQ=;
 b=f65r2WGDtLN2bjAsjiRBUfArGYXEXSl7q5fpbuEN3m2BO8qsZuelAuk34MlrACGRPdho8aVXizMkXqJlokebnFGSsJTy6xlqPFPO5IHmJOYGMVDnWjIQrj2Ni1F1qZmAC6IGtSql5c0D3/QeGAUG+sLP1hMkzAW2mWGGPEP+JrKwSOKFm2jpkAkcnEYYBSHlUVDZiYxfT6RxK6qV3KgWSVrh+5f6NzjcL7ykhaFHarhFJj7wQArh+7BNx3jTagecpp+dT1X3Vdh9RpWeBNo14li7Olwn0akya7IJ8/hmPvZzctgL+5xr5LiPUagK16Ms0whckLzAdJMK7NFaz94JCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfTVN33zAiO7dO2q+XBSG4Vqi04JgtPW/HtREEynGfQ=;
 b=MWKUlP4eFkD0HQI8UyTaaWLB4uKsevPP+SNryJvypBGovxD++oarmMebsaaIx61FAFqHTUB7jj5OtCAeerMXAmQkcmTrQ+saYsSjdVJGhLy3/vEGPB8B9qo0QE/ExJ5g4BMr3LUaJkkwitK3Srdti//txktj/FwNTcdk9C0RZ84AwHpk9trCiTeWqBB25jLZunBCuX2wE1EgMcfXrBETGpYRhwpWglUBQdxjhIYY828uJrIwjpY5708LQNH9hlSPP060HLd6J2IiW6DPYUwK1ExMFVjId4gpDhnejgdUmDlDsQ/ReBdqXAP8YIncZUAvdcf40y5/8XB4H0UPZE8iBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.15; Sat, 30 May 2026 03:09:58 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:09:58 +0000
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
Subject: [PATCH v11 02/22] gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
Date: Fri, 29 May 2026 20:09:33 -0700
Message-ID: <20260530030953.740561-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0039.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: cd5e6521-ce94-4b86-e9b3-08debdf8ee5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	selcomX2JhseZLyEfA4VvMmr1//iL2fhN6AyAgBPsfsFOgHa2WIhIvIBcgutxdcPwF71YfojG3fPiT0Rn17akL6kE2cbaLZLHtgzdd6SKhjHvajTQ9kuuIwbs2KBiwocp9e5fL6+T5Y1Mwjgwa2UYSquE2DUCezHwTCfcifVqTmEmesc+WUmB4cS2evvm3a1NeaflJNDqPtfsSt9fYmJl9slpWvLW6OrMtWYFcGtA7EHJf+MRanq4+yYUdD1ZIYAZ3DgQn6aqWJR2CxZJoXss3M6ngLKKcw8Oja0X8azMVukkD3C1/PstdiUhLAriCNlh/Af1KYzxYu7nqhpBYG0qEXuDaoOMJFJjG7uGGe49p71FeU7guiY4Gd5KIi4HnXkUUObZZP3M9RdDrisjWBEt9uizm0f+bPZM/s68IkRe1t1oZtZennSuaHh0yECfH9KaxKaDZT4shAjQvw33vATua5xlLVOo5p7yV/0IM2TzDlTbWZswEMIzaCu9bTbbp2BfK/z77lKxq0w/bznsor3/XoRThR6lvYLemobCBQ5TeImJzoPjv18GZN3JF/fI7TAVm3V+TMO4+q1otOVM0LD7SmWcG973aaHK7xyBm0E2st38wLKFAiD47uCg2VlUYMyqKzqoR5Di1G9WZ4rgGk8WLoNQBoyDuGTWkyCPkq9p4zaYg7I5IHj1gbP5DCyKDkt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ksdk0JAUJuvpIcSJKZl8+tY+ZAvN/9AI2eQyY7RxIbcVsi3XVO7vd9TvdaP3?=
 =?us-ascii?Q?ZIeFueV2HezE+yJMZaI5eo1bZAqeYT9SnoLbq6Fic8SkTE5L27WZltonuBJl?=
 =?us-ascii?Q?4GINxaL1njTKcyi+jWO93pppWN239WlFxhXjyXxLXGO3C2KEicGa0qcBPh/q?=
 =?us-ascii?Q?IIdrB4piZ3psr6mNehOCi2CC/CTSetm8CyfAoPxh1cQrNLY1rD4OfnfqW8FZ?=
 =?us-ascii?Q?h+a8fiQ+bxiOrZ6Rw4jq69RFTYt0B2Zl202mAvX2CE8ImYA1pUfqV6q2QGim?=
 =?us-ascii?Q?1p8+VzVbBLDT3Gh8fEo8gPRlNSx0QDQHqtZDIaKTOYrRd5zwWHS4kp2YeKku?=
 =?us-ascii?Q?dZw4c5YECMHZHdIuDonfvDVYoMbQebSydOKe6wTvseAEYT3RUUVDvHVMY7GW?=
 =?us-ascii?Q?/N4IAB9l4JvuSho7mSASY7so0FkNAt162UCB89c4xn1AWpn56UGwyukAbdvu?=
 =?us-ascii?Q?wrxo4GZnJEdVOnOYPF4AnTrmCQBiR9R4AkdO9IczLWlPdZC9XNN4Rry8yFHO?=
 =?us-ascii?Q?BpGz3XCglHVqxUUlUzM0y1eE/FrdFQrIPqqs2TN82IpCS4m3iw7QkXf7MVKK?=
 =?us-ascii?Q?YYmkdwuTqqjUBclSYESbeOhpsCFnsm8Zv5022/LWR0sjltB2gymiOiAv5qm8?=
 =?us-ascii?Q?VfIuJhx7HNhdrQBshd53OKCVBGDMND0pCmtLe4fR2WI3xHWNk6JQusvC3lIy?=
 =?us-ascii?Q?bedOXhxLoBabjbtSRyF+XWl6yJIqdZUm3zbvjT88nVoXsGCEZzAywEqdbWiJ?=
 =?us-ascii?Q?t0YoZCQrDZPZ2gcDdqxfoDThdU2VZX2lEKX0W2yeIrknZIbKIneQg4Mf5iUH?=
 =?us-ascii?Q?emYTMsAMzgy8Hc8Qq0i/Pj4uIdrnBc9EbTeEBQSrD2GJTYtuDUA1j7oweI9X?=
 =?us-ascii?Q?RnLgzRGRgHmR5dWkaPevFphu6jfOyAMHQQ1Gn2ZoRRUNAypk7hPh/9qVor4O?=
 =?us-ascii?Q?I0AKgEF70e8mBWCVmOVf0Kx1W+I/5KGt3vJhVz5/YM23PuacePBbS9NQm6NY?=
 =?us-ascii?Q?29wD603WXazPgq4z0nKFtS6+QZzXoiyp9eM5XzXmXxw8vwlkir6V1vL1eCin?=
 =?us-ascii?Q?XIWGR+z6G0IZkkxpo32IeQNSt2yvvqt38BenNLAqAURZNtUfBcBrGX3anq76?=
 =?us-ascii?Q?+0jM76Jyteim7z7CuVD+ko5HhhpiLLltKnVP2r2mEoir6Z4fdgpSwlUJrCDY?=
 =?us-ascii?Q?a43n+aAwWDGY4KpBkQQ175/1Djc0eaC9bdlI9NfaV/kumFsu72r039VwMyxM?=
 =?us-ascii?Q?553/k1h9DwNUD5La0mld0hYldfdBzZ3fqzQ+nl95n3tvQsesKQbNIGItHJCT?=
 =?us-ascii?Q?SmLIesmXkk/CHo0u5x4V0o1zOPVMCLH/af6lUgnudDiRZR0Ngtn6Lpa+hi4j?=
 =?us-ascii?Q?q0ZraI3Kj38zpzsSWHSKg6NjA3OemNYiPptXRv8IcRw/fRYW9nvIu/jfz1eE?=
 =?us-ascii?Q?XKqfPguTzpdwY9SjccRRBCJbPdy6Mtd62lpg5FFAKrYOdkMIjmQXykp+e5bS?=
 =?us-ascii?Q?3kWh3y7n/lwSDCL/a1Itq6fV8wcTBko0JipeoZi0PykPycjyhpCMm1c28cuI?=
 =?us-ascii?Q?Ho2L1xs4NIODM8xW0cAsM4/EK/ubk1wfbygK7rbpnnwxMJ3wV9MnQYzk1i2D?=
 =?us-ascii?Q?F5Y+pAQRrhTABbnoJFJckmJ8CqGbxzCXkdl8YRsR47kEje10f4W5qu5Vf9Jf?=
 =?us-ascii?Q?xvez/c79ICamcNGIQ03v6s+C5LprneHIkLv25jLfYr6QvCdjyHs5AUK4tS6F?=
 =?us-ascii?Q?w8SeOWJVHQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5e6521-ce94-4b86-e9b3-08debdf8ee5b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:09:58.3033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wiywAhyF94Qh7sAJOalqXKwgQuoGY6Oik0wE+P8IvUUE+q3G1tXTQiKLrndudJH8wq5/2imKgtq4Maq2k3n1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863

Hopper and Blackwell GPUs moved the PCI config space mirror from
0x088000 to 0x092000. Select the correct address per architecture
when building the GSP system info command.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs             |  7 +++++++
 drivers/gpu/nova-core/gpu/hal.rs         |  5 +++++
 drivers/gpu/nova-core/gpu/hal/gh100.rs   |  9 +++++++++
 drivers/gpu/nova-core/gpu/hal/tu102.rs   |  9 +++++++++
 drivers/gpu/nova-core/gsp/boot.rs        |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs    |  8 +++++---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 15 +++++++++++----
 7 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 38c75df77e16..7dd736e5b190 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::ops::Range;
+
 use kernel::{
     device,
     dma::Device,
@@ -134,6 +136,11 @@ pub(crate) const fn arch(self) -> Architecture {
     pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
         matches!(self.arch(), Architecture::Turing) || matches!(self, Self::GA100)
     }
+
+    /// Returns the address range of the PCI config mirror space.
+    pub(crate) fn pci_config_mirror_range(self) -> Range<u32> {
+        hal::gpu_hal(self).pci_config_mirror_range()
+    }
 }
 
 // TODO
diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gpu/hal.rs
index 0b636b713593..cd833bd49b9b 100644
--- a/drivers/gpu/nova-core/gpu/hal.rs
+++ b/drivers/gpu/nova-core/gpu/hal.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::ops::Range;
+
 use kernel::{
     dma::DmaMask,
     prelude::*, //
@@ -22,6 +24,9 @@ pub(crate) trait GpuHal {
 
     /// Returns the DMA mask for the current architecture.
     fn dma_mask(&self) -> DmaMask;
+
+    /// Returns the address range of the PCI config mirror space.
+    fn pci_config_mirror_range(&self) -> Range<u32>;
 }
 
 pub(super) fn gpu_hal(chipset: Chipset) -> &'static dyn GpuHal {
diff --git a/drivers/gpu/nova-core/gpu/hal/gh100.rs b/drivers/gpu/nova-core/gpu/hal/gh100.rs
index 41fbabb04ff8..17778a618900 100644
--- a/drivers/gpu/nova-core/gpu/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gpu/hal/gh100.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::ops::Range;
+
 use kernel::{
     dma::DmaMask,
     prelude::*, //
@@ -19,6 +21,13 @@ fn wait_gfw_boot_completion(&self, _bar: &Bar0) -> Result {
     fn dma_mask(&self) -> DmaMask {
         DmaMask::new::<52>()
     }
+
+    fn pci_config_mirror_range(&self) -> Range<u32> {
+        const PCI_CONFIG_MIRROR_START: u32 = 0x092000;
+        const PCI_CONFIG_MIRROR_SIZE: u32 = 0x001000;
+
+        PCI_CONFIG_MIRROR_START..PCI_CONFIG_MIRROR_START + PCI_CONFIG_MIRROR_SIZE
+    }
 }
 
 const GH100: Gh100 = Gh100;
diff --git a/drivers/gpu/nova-core/gpu/hal/tu102.rs b/drivers/gpu/nova-core/gpu/hal/tu102.rs
index 2881ab03dbcd..125478bfe07a 100644
--- a/drivers/gpu/nova-core/gpu/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gpu/hal/tu102.rs
@@ -18,6 +18,8 @@
 //!
 //! Note that the devinit sequence also needs to run during suspend/resume.
 
+use core::ops::Range;
+
 use kernel::{
     dma::DmaMask,
     io::{
@@ -85,6 +87,13 @@ fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result {
     fn dma_mask(&self) -> DmaMask {
         DmaMask::new::<47>()
     }
+
+    fn pci_config_mirror_range(&self) -> Range<u32> {
+        const PCI_CONFIG_MIRROR_START: u32 = 0x088000;
+        const PCI_CONFIG_MIRROR_SIZE: u32 = 0x001000;
+
+        PCI_CONFIG_MIRROR_START..PCI_CONFIG_MIRROR_START + PCI_CONFIG_MIRROR_SIZE
+    }
 }
 
 const TU102: Tu102 = Tu102;
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 087ee59da6d9..8c316fa2e585 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -144,7 +144,7 @@ pub(crate) fn boot(
         dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar),);
 
         self.cmdq
-            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev))?;
+            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
         self.cmdq
             .send_command_no_wait(bar, commands::SetRegistry::new())?;
 
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 3a365455d10c..f84de9f4f045 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -19,6 +19,7 @@
 };
 
 use crate::{
+    gpu::Chipset,
     gsp::{
         cmdq::{
             Cmdq,
@@ -37,12 +38,13 @@
 /// The `GspSetSystemInfo` command.
 pub(crate) struct SetSystemInfo<'a> {
     pdev: &'a pci::Device<device::Bound>,
+    chipset: Chipset,
 }
 
 impl<'a> SetSystemInfo<'a> {
     /// Creates a new `GspSetSystemInfo` command using the parameters of `pdev`.
-    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>) -> Self {
-        Self { pdev }
+    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>, chipset: Chipset) -> Self {
+        Self { pdev, chipset }
     }
 }
 
@@ -53,7 +55,7 @@ impl<'a> CommandToGsp for SetSystemInfo<'a> {
     type InitError = Error;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        Self::Command::init(self.pdev)
+        Self::Command::init(self.pdev, self.chipset)
     }
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 42985d446bae..7bcc41fc7fa0 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -11,7 +11,10 @@
     }, //
 };
 
-use crate::gsp::GSP_PAGE_SIZE;
+use crate::{
+    gpu::Chipset,
+    gsp::GSP_PAGE_SIZE, //
+};
 
 use super::bindings;
 
@@ -25,8 +28,12 @@ pub(crate) struct GspSetSystemInfo {
 impl GspSetSystemInfo {
     /// Returns an in-place initializer for the `GspSetSystemInfo` command.
     #[allow(non_snake_case)]
-    pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, Error> + 'a {
+    pub(crate) fn init<'a>(
+        dev: &'a pci::Device<device::Bound>,
+        chipset: Chipset,
+    ) -> impl Init<Self, Error> + 'a {
         type InnerGspSystemInfo = bindings::GspSystemInfo;
+        let pci_config_mirror_range = chipset.pci_config_mirror_range();
         let init_inner = try_init!(InnerGspSystemInfo {
             gpuPhysAddr: dev.resource_start(0)?,
             gpuPhysFbAddr: dev.resource_start(1)?,
@@ -36,8 +43,8 @@ pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, E
             // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
             // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
             maxUserVa: (1 << 47) - 4096,
-            pciConfigMirrorBase: 0x088000,
-            pciConfigMirrorSize: 0x001000,
+            pciConfigMirrorBase: pci_config_mirror_range.start,
+            pciConfigMirrorSize: pci_config_mirror_range.end - pci_config_mirror_range.start,
 
             PCIDeviceID: (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw()),
             PCISubDeviceID: (u32::from(dev.subsystem_device_id()) << 16)
-- 
2.54.0

