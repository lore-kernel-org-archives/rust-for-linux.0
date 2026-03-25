Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011037.outbound.protection.outlook.com [40.93.194.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7DC30596F;
	Wed, 25 Mar 2026 03:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410840; cv=fail; b=SAWRz7oLAMMBvJ0gJHm0uvGc8rl2I9WLeL/R7i/rbVs24RH8hbMiShBd9/e+iqhdoi7uWvyNyskxMugMLtusppo9YIZfxt/3yfjaa38u3xlPNntbX0TWgIWHHxO01cgKufTquKd36D0Vw7W7BzAcEEyVbjsfxHuMZLeWF/XFVeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410840; c=relaxed/simple;
	bh=TDpmVqYN5x70O5OFlHGx/Z/Y9afLvcsxWxRGR/2Yy6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jSnKguJENBBvGj3K4XW2UYzD7DSvg9GoV3zq2OU+rhrnE9s9qxcvZqD/aTl9GRpyVKcGj4wpGi8D6ITp+JsLU3/OzgTqTaMeZUyW4CGE3kyBFQ7Et3x3qMJ0MvV2uurlzoE8HUAU8FzslPsI6rKxLleLNnX1wNLzjNc2nBxGpLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tmanzk7M; arc=fail smtp.client-ip=40.93.194.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tmanzk7M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7HsJ+WeCKM7qc8KkKEtPgJNX+JsSyCF1+02nruT4fsHYER7/ZL+WWYosN/gubGy78QCw++3TuuWn04H266Me0X/Q5wxrIfcLzXa2kM0pN/TKnYrS/IjB7JU8MX+JjShgP22hOYykYHz3jYZKYRVDPPqreTCASgbLXbcBdOPIlu4UD2HSCJZZLtFAXxaECgE9aR088f6qrICozdkYcjqd11F/MSowypL/5v1pifTkZzcW96ocXyJAJiXaajjhtaFnIq/gfAdf1bBg+ALV+avEfnVZ20WBDfexIYeI2ssvmHKrLnqQYfhnemqyT7b5cbnTgm4ujZfV8wXiYK6gozLpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJ4787pvvlUQ2oolXaNG48rfRKL8QNSXgs7q7/tehNM=;
 b=tHZBrFepLOgOddk5LZNK4QAHfuS5br8aLH+8Qn8tINm4Y0b6JijSbEdlKCfQmtfybcnJwfA27QlP9yNneh8zKLKrc0cx2/fDfq/kzG3dKTaGh3mFwD3795ou/GuPsowscKcRUWUFreM94wkNOxFW6jdK+xNZa3RrrqbOgdnu19mcf0/mvWzjrdrZDTfznqT+dQvelPPM5hBMjzQFdRGfxOgdSnaZnie9YMHMpoPfUEGNgmbVni/y5AdYcNauU5ceX4b1l3A5ZvnKTgoyZS2LeNkEU8vCIKluwVuBz71frZLl9eyk6mRq2r1oIY5FI4N1/V7jKGymlUHBiveNprMUlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJ4787pvvlUQ2oolXaNG48rfRKL8QNSXgs7q7/tehNM=;
 b=tmanzk7Mgmhg9vgjFGYbTRQrb5Hlk9LXNAdDqgJ5cJCccLBicA5JKtpyQ3GVdYoCWn7xyfJt8vCoJRhJrzkRWQHY1OW3C+4YBlep0F94HpO+cY9w7rylgnrWV6VDbWRt4XWb0d7aQwSpTPxbMWJ/gwjYasFkJPtcnlK5XB97A4i84088BkUVpYpEa03mBuDeauNPrPokHK8ZzyiGrOuje+SBZgH8SqIIBRlc2prupvcuCG8QVkl/LCPOiDbADOLqc6EEcSS85Z7znovKAxWNmqv3rDPticFzJHGkOIccyUCHEgQpuBqGtmVmCldPrnB5bcjyVUzZ2Dx9tT1kbgmpQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ1PR12MB6121.namprd12.prod.outlook.com (2603:10b6:a03:45c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:54 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:54 +0000
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
Subject: [PATCH v8 30/31] gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
Date: Tue, 24 Mar 2026 20:52:41 -0700
Message-ID: <20260325035242.368661-31-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0262.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ1PR12MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: 17241834-4f70-4737-a69b-08de8a22103a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	GWsDm0Fq/lFj129pkfq474SkmC2a/Uzh/1krrMnKGg3z3a20IaG5hTVYR+fMByctlppQQ5PwiAyg3dRDaY2U4YRSfSwFLtD4yHz6v00CL5U7coUoYGLfqXuCovKkRJrm4SeosKzyG3kbw5Nz5v+WSVmf8z6S/c2ZuZQiWIGDfYaT1gIw2vcOKkhv84pU+wu+VWBUAhQzYfhi+66MOAzzsXCYTEH/1nhrVyaNwhCDDiAYWd4+b9BvV9ulKtIe3qdQ+/S41LWAheSVnWKalmtl0oz4OkYa7zLrn8SsWSjPF9AszgU+QrXDtsmLsfrSvaYBfp20c40z5awkg8E2Wa4E+y5ZtrQ0IfBJffHxwnLXdL/FOnv1ln+IKS2BA2QuDwIsu8Mnu+2ev1UUyvs/PcWmH8KxEz3lVq7kXTczbTNj+UM40SpMGErES7NkrGYLscuFZYEPeeJ1Yo3O9rKQi/4SXShUmf4h25P/rKslz18L/hYSAkqQLDTlQTBZbADQSSL/La60Ga4XiUUBqW7VVelt2YYD2jhHkSociOgTrevJQrgdZBjJ/u5ZAUABRSRalSCL7cM3J77HwDmlTyZaJM7mFs6QXieb2kl9T/oZUE6URDSPebzpyb6nhaJ8HVw7OCNcMrljM+MBDvNuX6+0IWOZ7975CNa+XuYhSq8cAXAgNmDS/JGD02F+77IdXCHclj5nWLCQwKMdTkDjfi5dbNvZiXSCGivy/BJJSanMPR1jtFc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s2SwE++ukFwOwSUm5ZP2Oii4mQZWihwLLsqm/JNg/4Ynk958/RvbYFRuH3zu?=
 =?us-ascii?Q?Y9Aad81qRSrjqjLq7WWtL33HOPLHMAcBoYGJJ/CqgVgrXPSIsRgrvH5/2X9K?=
 =?us-ascii?Q?R0fRoPF4QqVXhZt1NXzlZKa7GPh+ZFmgbUy/72fSEdyK1Zu/zuzEOvQHjbA5?=
 =?us-ascii?Q?ThEiIad4mxWrFGeidpV3zN+XWoXAUCSt9JLMmzSGcazis33bBGS0jVq/63AJ?=
 =?us-ascii?Q?9v1NPNOO334NQZ+9EnWQEMk0cSzBG1cnj3Xgah2px/JEyNVVp4CiyQ52IM1h?=
 =?us-ascii?Q?06W0yCwgJzUmHhK5E/affxkjnlJ+aXwqGllHNqFB5L559HhJaRy6XOZlqmIh?=
 =?us-ascii?Q?aZiIhgtE+s3VcQ2BqoNlR2Im7l9Tzg42zSqyLqMKwCwRTQ5aND5IrsqyvAuP?=
 =?us-ascii?Q?3Wl7wmxV7FheGF4Neuh9Sk3AkvWOIHGwH901XW/HPOOamcERJf9Q+k8IFTgN?=
 =?us-ascii?Q?ZVcnBdElr0WsCHK82+n+AGWZeJuvBU+Z9RHXqslPb+Bz80whjs4ZRHX308k+?=
 =?us-ascii?Q?UCUSTZ9PqOUWjuVtIcFHR8iWmeR6sYOjR6sbQGUOA/GQ0HM17JTrG803DT7I?=
 =?us-ascii?Q?v1MwZgWJq0Q+uaEIQYyZkOJ/iUOzqtnUFTw05F1az5+isfr5q2Ehm+RQ01wz?=
 =?us-ascii?Q?IHStSnAtvm8q+/QBpd3/75hdPvj47wecBqSIUylzI5AJxru6kYMkV0EEgq52?=
 =?us-ascii?Q?/Bydiz8tYRr56UnZjbO8LLjEIkM9uop5h4QU/kSjMmbWFnQ+UdSrE+R20GS4?=
 =?us-ascii?Q?IcO+fJL4Hi6WnmDd/S9C0Ki0KyAgsxYwCw1u9i9wz2PRVWRyqqglN2lm6PoB?=
 =?us-ascii?Q?aRRxGyiDeJxY+dBj+dlKD9uxwfUHFZ7LRE1Fl0a4zO+gXDkHzDMXF9ymiQqd?=
 =?us-ascii?Q?btMKEObusAIlNfeh1hIr/WKcJbdW5rwPzrI1OZvNjo/OE9KvWmFohvy5ovt8?=
 =?us-ascii?Q?S8E7+M7Q+EfqgVNNQIal8KS3OuiNU+n8z3PpNl4jjo9kygJJCZTg39aWmGKw?=
 =?us-ascii?Q?4kU/UTZ4QdN+XyQp98VbO/OwiB5ShgwuoKoB7NE2+f9Y4zExncY9J8cEvrCh?=
 =?us-ascii?Q?YkESYUopXoqI9fsZhMLSnTkSmnNi51U0dMe0k2frN+vwZDbG9pzDAlSsVNMR?=
 =?us-ascii?Q?ZDmCrpijubZf72DeWRp6kTU/OL6td7BVth1wmN3Zw/PXcNokmgvBBYpXtTl9?=
 =?us-ascii?Q?7QPUZnbEsYfYlw8P1C0nGogkTW0SofiC4ZMsfFUNI6z/Qy7QkPTFR5xBIik1?=
 =?us-ascii?Q?pzmHM+rzeYqviE9wsehnDLi/LQy45DXMEkwMt8KAIJ+u0dH0sNg/2cOgX4cF?=
 =?us-ascii?Q?8e0HdJGc7+J41cVexAweAQt2Z/pRf9/gxq6W7LIUCaORfUQ5myxWvFo9OJiT?=
 =?us-ascii?Q?bkxU89ck1r01TwBiZ4oLYG4R8GMhEMR1RwIsDRmMuqFKgFxjQTmxiQwERNRE?=
 =?us-ascii?Q?kiXP+HxDHBe8f05H0m+r6NkZawH0B6FfCZR212AROSsRD7sL1Bu6V/PmhHZL?=
 =?us-ascii?Q?M7/VpyDvGtGbiggpgBMHomR9BZsSZW6qRuv1XFKiC6XYo1OUGe83+CUhyxKD?=
 =?us-ascii?Q?7cOFAEFVAK+xqBYRv4jMoE0CGU/h2JUCTcuSTq9o7p/wf5rqdSsRR+lbu/UE?=
 =?us-ascii?Q?smUQq+eh8eNDBrRBipARVR0nYnAmJPQWZ6mYLgihqE+2SW+91lVdMLVVdp7H?=
 =?us-ascii?Q?L16HenXhLL8Q/XphstPWIjndXHQEx/a30XnfCYog7hxVXfdvybTDL+BdYcyy?=
 =?us-ascii?Q?I7H1O2leeg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17241834-4f70-4737-a69b-08de8a22103a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:24.0213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LdRBFeJ1KsEEM+iWtAJaJ50eC7bvRDZTf2hxhnkt0UbSaVdFlDX3CQe8H9xb360FuAUDmfT01V7GO6ipXWXTSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6121

Hopper and Blackwell GPUs use a different PCI config space mirror
address (0x088000) compared to older architectures (0x088480). Update
SetSystemInfo to accept a chipset parameter and select the correct
address based on architecture.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs        |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs    |  8 +++++---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 20 +++++++++++++++++---
 3 files changed, 23 insertions(+), 7 deletions(-)

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
index db46276430be..1dca2552ed54 100644
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
@@ -35,7 +44,12 @@ pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, E
             // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
             // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
             maxUserVa: (1 << 47) - 4096,
-            pciConfigMirrorBase: 0x088000,
+            // Hopper, Blackwell, and later moved the PCI config mirror window to 0x092000.
+            // Older architectures continue to use the legacy window at 0x088000.
+            pciConfigMirrorBase: match chipset.arch() {
+                Architecture::Turing | Architecture::Ampere | Architecture::Ada => 0x088000,
+                Architecture::Hopper | Architecture::Blackwell => 0x092000,
+            },
             pciConfigMirrorSize: 0x001000,
 
             PCIDeviceID: (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw()),
-- 
2.53.0

