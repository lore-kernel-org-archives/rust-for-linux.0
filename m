Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011036.outbound.protection.outlook.com [40.93.194.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D2A2580F3;
	Thu, 26 Mar 2026 01:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489225; cv=fail; b=cmfAZGz6247/cJqmPPcUIH4RnkkfAEvv+sFoY0Os+rVrvr5oy60bw7bEOQZnUPqTIIHVZ3gpkhrs/u38BEquuzcrGxofHYJp4bw4mSlYbUD/4BZYKObY18eQbaE7MqJyCSFmkNVtEtHrSiH7d1W+VfBTUIvGqo6K0wg/AaNOF4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489225; c=relaxed/simple;
	bh=QRjsYJHKegX5wtgXru7+SkV49UDjtZD2bP0hyofX/cE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZBtdLS4JY+mwI/U/XmSBFXNhY/sZm8haVHTGlDeNThlqhgUoIGAQtJ5LSxYPhJmDL1bXnpXb3luQXb3ooEUETep0cZKZrkhuaDE3bA6I7yZQ/HQ6L2dEQGKWE3/rM1wLlufnx7R5N5wTUbwXjO/jxlIe3cwTC4XHgOSUsHoa7/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FOFAqVR8; arc=fail smtp.client-ip=40.93.194.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FOFAqVR8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhac1+OP4vy25lrRQzUGheFRLHesxDXFeFSYqUQI+z0yUfi7ojAMUfai87VNaM7ODSWJIw8sJ+GDnwMhYV1BGdNu43GFngK3dvzi7snNW4DwsWaMNzKBDQkpKbhD3K1vojj0JxaJaZzADn15XCNpvN00Q+HkB/xf+AHaGnKEaUZjmHKj9XFAaBdxcPH/0FtGVJmIvZsLwtG3XiI7XbSnpMPeXVXE5xIRqsleGhMwWf3NoV6Gf+GjmCU6pUjZ7POxw39jGDgnCI/czOWR5pdMzpiUKtikxk9bNbP3fe/i4qeJmFsA0OB6EfW37mnR3zovgvk3IegPZdhYN7ZJ3rffcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwYJb/pwu4dI2IH+Whi49XzSgVdhwqxbTA9+Gf+IRdo=;
 b=HzqSZHcXOHVn5z8lTkZw8uRiN5xTPy6Sq9EVHxoCKfd2sfvcLwy5ezpbG6+uRs7SNikd2H6kWOip3i+s3yFsQHoA7czOZtKApI2CO6aHIa6dOM1reCzy4FayQVtM9Zwx8TsP6ZWrwUp+svz3XnlgsXT5p9RQ4NDnpincAZkWzDdFgzntGJLgYkB2wBIH6swxHzdGIdjTUOTW6Sv8XXvbkIfdLDwALngBYHEPylQNjviZ2Ix7gAlbbtaME7s9MZjnUcHwAQIKxBtiywuVZjFlSnkf1a/YmLEAhyN7sYK6WP7LtA+SNkePiMhYu9zJVM5A8hplOk2QHsaiSKOY4wo5oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwYJb/pwu4dI2IH+Whi49XzSgVdhwqxbTA9+Gf+IRdo=;
 b=FOFAqVR87j6dDuiz/da2VR/Y+2FKjF9Q4Qwbhb0xK+ukgSjpsMnVIxlM/108s4ayU/juLWgTHNqhBBEJ74s1FsUyeYVMbuqKUOYiwZmEKcSqMAea0UOoCqvDcgFJ4GeQ8IrfSPEc9tR8BjMvuoHKKnRAXClcmzAp0+4xEfulB26HbmwE5BevzopN6bNh01Ewtg99i5R1IGJn78uTI5UsBVmjGCcBUSnyKZ03e2JFdQ33ElDvs+lu8TJ1HbmWYz0VTjGqyM8UiOcbPIkifYy+rVQDbwBkfiwXFhHYmavKcJN6TPu/6YEQETsk3XalY4PzYRFl2GbZ+b/QI3ajIxIlmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 01:40:18 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:40:18 +0000
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
Subject: [PATCH v9 30/31] gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
Date: Wed, 25 Mar 2026 18:39:01 -0700
Message-ID: <20260326013902.588242-31-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0098.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::39) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: a85920dd-390d-4dda-71bf-08de8ad890fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	siafv8Jk6QQWXwwNRPgedSDXs3VM/0DKqFTmC3uAkaf+DHX06iXXjtzFgd2lGdHsQwVuy3OgQSccybZZuHQhCEBbD/2T8Z+c0zhEQYNfa0VNhTzzae0ms8h2AVxDru2H5ey1/D0Pls95nClRsHKeIv/oAKCY53VSQ9+Crl7hFtV4gm4I3Zz5LwEATaEVjV+qt5am/mfiwafP59FjB/n/+qA2YN7qVFseRBT9jxoptmpOMPseGcRH4//9aSnwBH26S7VTbfzRzYKr8GobsSTbg9vhMaoxwKl3ATwovrrHD2MrdFwUyVGC3CBIeYQUA7g6kJYBcQSJc2qGeQojxrZ0FHwfK8oRGGka5e4cVCkXlz4SKsFZq+FUI+kWd6N65T6zswnXCJsrUVIqyUxy+dHv7vpB1/NKRkFvbUY9M43bpQ31/kezEYhlAVp7HrBQ733jx3hFKb7V4LxbrPmc8Pkp1X8VTsCpxZjZoh/2S+p7uPezWx7pswF7xE7g/O9RsChsBApfWrL3oQn/6rDqSlqVrqhGlWOVTwOSqV2WUT4aoSW4zQcmUs/VHcByE4FoHbcSCT1t55lpcMSquAwrU//NqbqFYs16+oNSn+wiDJjfir/PPLCiRO6rXRphdrWnSskFltWN5k6tOCLDElqUfjYs7rYg7F0QW0NfO8CI0usEtfVk8on2TaJsi+g1pxCI3po9e8X+b2WMuT+DrmfHSL9Mimqjl1vpr0Crpl5LZe7wLz8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ErMvdNR492P4dV+QWDGP5egjQrSBH1bZmih7ovrcwsHkh0HAEdGp7AC1/Jki?=
 =?us-ascii?Q?S3e6Wofby32PQXiQaxCyKD4sFxw5oqM8dbT1XZQBTlxuM7L+AiVLsx4uiA8j?=
 =?us-ascii?Q?fRrYmZC/Xi/zcjjT7OwjAft2psYixvSrORSx4StLTtjvukOqHvLiX9BGUg3i?=
 =?us-ascii?Q?7iU3EoDxcjtH4UEgSteR0h86EVFcPMmaX7YGpiOX8wl+/jMUy0FBkUHSX1ak?=
 =?us-ascii?Q?ErJjezHvRwnErr2i0POH5mPWKkMFsVO0kwm15DCmQjgBbsI15b3Woiyf11FF?=
 =?us-ascii?Q?h7+px8TECGK3YyCzdRCruryZtKDoj8rLtLu3So/HLGSoFNCabvKmWpFjg/X2?=
 =?us-ascii?Q?QGIOJJI4K13C9BJNycgYae4wsfAcTN3BNeWL23HiKltdpBMDX5XF8ao5PQcU?=
 =?us-ascii?Q?mQWlzY82LDZJy2y1vpvRLQoK+pRNjmRx0ot1Eg7mAp4gDcLwGwBwsjba02uo?=
 =?us-ascii?Q?ORt63x3wOJj7VB2BtloRpeZ1nzjWV4rzKUkPDakTlPRajBAn5iaHtIst+fXc?=
 =?us-ascii?Q?vrLReZ/n0UHZWgTbYncmDV7KgauJYPUTCydb7e4CjPV4t7F4tFQv+ivBjYag?=
 =?us-ascii?Q?8OJ6ILOMzJDiVtXX5OEJfSorp8QJfgPf8v5ModAJ1brVyHN6co9LJDvmIKoq?=
 =?us-ascii?Q?U/VV8xa8cU2tvqx8UsW23CsWFwIJ6ahisdB/+C8TH6YUFJxMETn3LHZqNwp/?=
 =?us-ascii?Q?vIR0nxEVd1fASd8b8eo9jXMIREzH6gOp8Vb0h7+v1UxkNBTN++vZYHVq+ZBU?=
 =?us-ascii?Q?G7Iq4iDBwCdr8DeUE0cD4YIj36/8Agw9zmudWIL/h9crHu5Ej3Ch8AkxJkww?=
 =?us-ascii?Q?Xjs89tQJiKEXYcW75liuUfw1hJwsvPaZJdnEoYIrdJaH4xOZh5FabW8qlqwG?=
 =?us-ascii?Q?Cuoewqs3MsqUqGrtnxZh3lyhCSqTW0Q3mkrtFv/RHVkmgKkYqj8N7gZwwUrQ?=
 =?us-ascii?Q?T5g27ixadDNSx8fN9lCJBSkc+IMcMoQOqjxcN9j4h/VMJj3QSBew0ot3eNs+?=
 =?us-ascii?Q?RLNOygv1KgaOaLU8CAIPjnXhqXs83lzFY+wYMUZzflKE/NESMYB3JAhK4Omd?=
 =?us-ascii?Q?3lzt7oE/UsIWDLDcUe4j4v5ePmBgLUL6Pn1cMwS5z9w6WYlWFmZ7kIrqVzhL?=
 =?us-ascii?Q?UgqzSXVsLeKh7DCOsuWX4aM7TzHCLUJHDKCpiK1S4jT/COD131HKQD2gXFL/?=
 =?us-ascii?Q?6gOCRDajjz4npWUfGo46T8M0MSBiSud0e1bIwnYq28hgIpi07JObZWLqtDRF?=
 =?us-ascii?Q?XE+oGpA0KM5m9ClHgjppGyhWz/Mmvb/dwJLpvEw2bIZvUpxqSgg1r2TqdZrz?=
 =?us-ascii?Q?jGVe7nL+78sgdvJ1PlKbiuDqeXSoAdNmKucYxtSgbnOZYBTsPqmyNDB3Gmbd?=
 =?us-ascii?Q?vKj+HVhmVpFY5CTI/dww5pot7qwZJ8W0gckNNWGPJIsi1TVa79tV2zLFdPCY?=
 =?us-ascii?Q?QmUSK4KeCn9NJrVzEaBNjr3zhpeE7IOtLlEQ+XJVjeOpy+mq8yF8uqpMGhrt?=
 =?us-ascii?Q?fCc0Z1dmY/ZJnLuAAjeihjBHqiQ5tO25Wov9be/PgJjEmF1FjRlTylt8DQwU?=
 =?us-ascii?Q?8ibQ1HOKQ6c6ZZBQ4dePvJqlR/ruMAjGUpErh1eJInsyXN6zoeOkcKXDSEIm?=
 =?us-ascii?Q?rBwOopHEYbaEUmYUdZj4XcCImISFGWffqQB0R+HfyY5hT7NXmfSGr9g2I0oU?=
 =?us-ascii?Q?4GhrnKejlzl4lCY1SgR8P3ATG5kNG+YkhuO2bmeb7b9Xu/XUuo5ppP159u9E?=
 =?us-ascii?Q?gaSRcrmzfA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a85920dd-390d-4dda-71bf-08de8ad890fa
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:48.4649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7D0jMOIxxewqCx0astcdyNtRydVvpvJeOp95c8Y9AcayZtli0AJKUH9wdwY5SVvnqGLOGUApUj0y633CkfInw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

Hopper and Blackwell GPUs use a different PCI config space mirror
address (0x088000) compared to older architectures (0x088480). Update
SetSystemInfo to accept a chipset parameter and select the correct
address based on architecture.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs        |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs    |  8 +++++---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 22 +++++++++++++++++++---
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index abb8ca7ce38b..3afee0ffc3d9 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -254,7 +254,7 @@ pub(crate) fn boot(
         let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
         self.cmdq
-            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev))?;
+            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
         self.cmdq
             .send_command_no_wait(bar, commands::SetRegistry::new())?;
 
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index c89c7b57a751..9551a789433c 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -19,6 +19,7 @@
 
 use crate::{
     driver::Bar0,
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
-        GspSetSystemInfo::init(self.pdev)
+        GspSetSystemInfo::init(self.pdev, self.chipset)
     }
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index db46276430be..c16acbb0237f 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -10,7 +10,13 @@
     }, //
 };
 
-use crate::gsp::GSP_PAGE_SIZE;
+use crate::{
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
+    gsp::GSP_PAGE_SIZE, //
+};
 
 use super::bindings;
 
@@ -24,7 +30,10 @@ pub(crate) struct GspSetSystemInfo {
 impl GspSetSystemInfo {
     /// Returns an in-place initializer for the `GspSetSystemInfo` command.
     #[allow(non_snake_case)]
-    pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, Error> + 'a {
+    pub(crate) fn init<'a>(
+        dev: &'a pci::Device<device::Bound>,
+        chipset: Chipset,
+    ) -> impl Init<Self, Error> + 'a {
         type InnerGspSystemInfo = bindings::GspSystemInfo;
         let init_inner = try_init!(InnerGspSystemInfo {
             gpuPhysAddr: dev.resource_start(0)?,
@@ -35,7 +44,14 @@ pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, E
             // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
             // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
             maxUserVa: (1 << 47) - 4096,
-            pciConfigMirrorBase: 0x088000,
+            // Hopper, Blackwell, and later moved the PCI config mirror window to 0x092000.
+            // Older architectures continue to use the legacy window at 0x088000.
+            pciConfigMirrorBase: match chipset.arch() {
+                Architecture::Turing | Architecture::Ampere | Architecture::Ada => 0x088000,
+                Architecture::Hopper
+                | Architecture::BlackwellGB10x
+                | Architecture::BlackwellGB20x => 0x092000,
+            },
             pciConfigMirrorSize: 0x001000,
 
             PCIDeviceID: (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw()),
-- 
2.53.0

