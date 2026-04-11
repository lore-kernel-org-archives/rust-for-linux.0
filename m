Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011065.outbound.protection.outlook.com [52.101.52.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF7E2FD1B5;
	Sat, 11 Apr 2026 02:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875824; cv=fail; b=qKm5YikVWMTF06uesiok6P84zABk7O/+5Y1KeOC4pMloIzX0Pq4T8759zLdN3k76sC3up+PoGyO9SwxGviz6taKSCjXBgYiJoIujyBSLP3OBfCY3H3O5VJKg1cgLGVPCr8cMFIH/h8pAI1u5JbynxeztWr+t0lHGmpJf5wAKf7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875824; c=relaxed/simple;
	bh=cOPecNATjhT2vd7zUC93FL9uHDDJSrmMOhBhLvhCf34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QazjvlVzX6+XQ/sxUfyahDN03k8zqAxOY5B7c5p1V6Kb2+XFt2flzLdUANiLBb9NHtQVJmPz+T8cw2kIUr891HYeRuqJK6FoOXq49vtHsiV0EtIQIlEEO3iYard+slkXA/EXkznpEuVaL7ftbeVBh+cUQBfc6lK6V3R/NuRCZ50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n9MiSIBu; arc=fail smtp.client-ip=52.101.52.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n9MiSIBu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3f1b4MjySgTgm4Vj05yOQhaovXa5oY/38wmut9kLNH/bBWZIEC+JqY1Um1jWHYdumuGctwnLonlZS/BMv+rUeqGlX4nI4OcYV2e0PjANUkIho+PEdySaCJlIS5uwpkpEyTEZ6li515duXHl2KfP6d5IZTCsFDXPbUBDkE4j8rnZ6/6W0ptFxgrcpNOnv++RZbBWnfu08sQH7/7M/fYo63rP8K3ldLKeli7Ek468KLeXMCivgMZf7A6BjrO43Z53y+PhKdY8FR1v4ADhxCf5qbYclgg0ZROUG/L/rLmnhU2BxW5EdDGTR4knRFf24aEAHxevCO0DBTlOWJgvqWfAMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yf/CVbcGu4CSuHLL06sJCObIQC+zNEVrGqk1z9cly44=;
 b=fVAi7KHAonTqqbS7SbM220gwzm93SU0K39ZR9pGPasVCyzM4rC9rCCDv9tYYYqQl5vGagbcj3MDMb4MiacrpZZ0fGC6onVH5g1RJOJzq+t9achWXD4uiHJDh7WG2yXdmdfl3IpSGNJJtO+OEywrbiM0F5Bamcr545RkfcVv9BSdit/01xr67lGap/DDHnactkmkctZdDcDLFdlmftAEcZbwAATNrzEAhuOLFvKTEifKYqJyqzWIP0vpXLTWr9phLOwynPS/l2QpgyYC9/8ymyG92ZVwMqn/f8MfiB49k4Yzr4UNDMi5rBO4iCad9AHpA9HJaz0PGY5foIDASS8EBPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yf/CVbcGu4CSuHLL06sJCObIQC+zNEVrGqk1z9cly44=;
 b=n9MiSIBuADZYaZAh+Ho6qMuZ1NNdJvQXWzOx6IG3PWJ36eh2aMt7ZIW6toAxnIFMnqO4Dzvsn+7mIIwm84YaXoDRVyDgZfmYinSmJRsKwuWquARg7EYmATSXEnCCZNcHdvftsOgXoAdumxh159R3VIu7r9ZFQqFrNIBLRk476gbubeYBY0YBApOID082QSkJiXYEwb2BM6ZNbDdMFqbFBTRXeY09sr7umhfJ/Dhi4ZHavG/i6VWwSszBCo7HPlMICwQXjxo+OslI6za1CnaHe8YNT9CD44ilEDbky3xYqHdzTg6Er7a9W4crrtDkJjjrjRXAgTQEcAOYRm0dZQygEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8794.namprd12.prod.outlook.com (2603:10b6:510:27d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.15; Sat, 11 Apr
 2026 02:50:08 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:08 +0000
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
Subject: [PATCH v10 09/28] gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
Date: Fri, 10 Apr 2026 19:49:34 -0700
Message-ID: <20260411024953.473149-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0016.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d1f4f6-31fe-4f3a-d8b6-08de97750aca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IqDZ2cdoLc6HY7Tmf3wYdNVfonQ6Cadm1aj7jOXAMYVjv2bqH538F7ymP11tahLH17hnDpAur0FgsktVsTb+AsMJvAAIuVd0dgrpH6BY0ldhwQv23bf+Weo8vKUHs7TgjeSudswceU3GHEWP8FqYabdykNQlz53x72gnwi+AawKwgi7cFm3UaEmiCbOlywe/4QxOGwevevNt316kZdBbioNnA2ow6yy/zImRpeclfq6WrHCF+pu9ZzKn8flfcozxJLneGspALyO+fsheyValNXkZFiF2YJiWopozb1NpIi355vRgtq0wdRr7yjBRD7iyktQcvxkJclmZJH9k02sxxu4aGtmsamHLEt446cnv7yDm1dIFSEE5KRxRGjUyz/bs1OaTUQ4+r3qA8m4wOLHbYJQTzp28DGSEcKxtpw277R5sl9IUMj6iuApfvkmz4j3SOWDCY49sHhXrEfBogl6MI7suoKpnwEnsdvuOsymt28uxUDwx8XlBAPeCElAAFG2MgEJK5wXpbla2gnwKPNVkprNUGkL/KiHlKIOYrSr1+B4N77/F7eGyA/S2xAr1fM9/fPi01VbM48GVWj6Rb2RuMez7B5CZgY95V9y/zk9vep3VLUBKvDu7IGXhhaEluqhwWYKk/+0HS90oMprBmLi9bgw8BU+Srq1qLEm2P5Jc+qrCsrl7ELdv/ZS5bf2qxF/x7m/MsHOyJaXW6QiH3UOOw+oMSQdtCp9n6D4AZKeIhHw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fZ8nf1+yrz9LryHYWDwFs/dIgvHK1+09U3ljbgqFS84l7U/0H1WKRo7exwTf?=
 =?us-ascii?Q?nQTHirSz3H7qlYU6eCyf36p68w0mAoFW9PaFe+/adxOhHYESOjcDc5ZwX13O?=
 =?us-ascii?Q?NXDhTS7deeeZ+7IgiLg76ZRmQmCw+npeodyw8HI1BGNU00lMu/Df4zHv1Jco?=
 =?us-ascii?Q?c8ncjxV8RjSa3GySWvhfb+fmN9Vd61dIAkLDNUhTpO8CrU47JRrYwhI+W7Y7?=
 =?us-ascii?Q?qIixjDuu6DpR96qL4nSBx1SrsyuW7j9eIp9UsDkBXKt3cKSSgAYKBN+oBwcL?=
 =?us-ascii?Q?bwe0HSr7cSujAzabFZN6V40jjqiysOUQbyD2RY84+JKd9l30T+ioyzzM5Gtr?=
 =?us-ascii?Q?0xf4G4D5jq6z+aM90wDVyKIxjMdqG8VjpJ3erFKtaB0zS+brVxjwQ04dTYNm?=
 =?us-ascii?Q?1+NCFNAgv7zg+q9S8qLv0+z1r4j9/VxJC86MvhfIXxIb2PKEW1W6b795917p?=
 =?us-ascii?Q?FxilhTn5bbJJfoLY04J5XjSqPUrDTD9aOsQFmXU4Q89KdGNItE9SEd9KKeEn?=
 =?us-ascii?Q?C6Ae4QFNv07G2vW7Y7S8ZvtKzRJSajrDX7IJ+zIVn6i/mdVaKI4NbyhxURmh?=
 =?us-ascii?Q?kK09TixKieIoBma/XRJazPFXuGxuOPRWQIv5Dhvnkvp8qv/rlzyTl8tt+dmK?=
 =?us-ascii?Q?vO5pj2vNMWZXz+w9cbn8enBFni5pgqP6O79vPza7bjfh0sfPmdhHl21Xj+K3?=
 =?us-ascii?Q?q4WBX3QLU5jhLKjwevhf03cDe2kWR83hEQPaupQh4/GZS9Fn0nw8wDoq8A5t?=
 =?us-ascii?Q?2k0e6WPSverlqkks8xz2+4EuSZpMOQll63UM/LcTU6AooWBJgS64lUwAgvw6?=
 =?us-ascii?Q?sS1fQHuNk1WVcxt5Gtbmqbknev26tN9iyQoW1Qd/5ie8nJ0bBzBbMAd7C4Q6?=
 =?us-ascii?Q?Aj5uz7McYXgxTaK9yvKB/QV/27AxdxufWFYTKEiHXrxK+oW/OwdeMC6Z37U2?=
 =?us-ascii?Q?gwT7TLvuA0bmAe0dlqnnVabAWVZQgWcv7TpZUKgrSEAh8z01ndOYNstP0Y1P?=
 =?us-ascii?Q?QSWCU4Qr4hNIXUWgKj9LfDM5wzgUlZZMOesZ3J5DFK8iQDuI6Lp4T8Si6371?=
 =?us-ascii?Q?7uK+K+jsHf1hIJxiJOdGshQFOSdXYF2WVNCaVxSv/IxXKvFpkExGGPxNdoQG?=
 =?us-ascii?Q?rXY2usFspc8nYnxTz1D1tLiiU6Wi3k/XUCYI5G8Jqt5XnVQ2PyeGLg843Be9?=
 =?us-ascii?Q?YEvAgIJ6ckx6s0BQevFnhjQHtPDqGD7NtMR0fpsUBMs7B08c8PEOLRuD7SLV?=
 =?us-ascii?Q?hL5PhxEL0tjGurYfw3sP/V+WphqoKCOO1YbbRPaL8vq4b0jupXMtNbzTi2As?=
 =?us-ascii?Q?4gIs9U+SPwLcyT9i01FHD2tql2/L8gd58ja19T8dqr1h+D/jRO8tOFS0yUwK?=
 =?us-ascii?Q?IohmgrZsBV6nmBGsgRhvlSn6z6TJmvwmzA64Ippt80zpVeu5/JyWLr+Y+V03?=
 =?us-ascii?Q?gKjRmLkILTx7UsAAg+bHDZ7otxxtsUqyRoMjTc2I7US5Mqvp7BUWnaDGCkdn?=
 =?us-ascii?Q?lqYvyauq3sJLbHxgH0C+dr9r3TOxaarWi+gejQOf1hrBll3/v2wXZQuMf/BU?=
 =?us-ascii?Q?B14Hwe8xJtQjaoxQRAQkn1YUUV52283/4sM9EJwLQoTx8isJ1960uXKWE7u+?=
 =?us-ascii?Q?1p5afwG925TGKCezr3eF/0i4vzwqBGNGuuUnSOr1R6Y6yRNSv7z0GJWSLBoh?=
 =?us-ascii?Q?hcgNtAWBkseCL4nAHz+UaDynksJpul30VKEZIm69/Rs1Oo3vuDjzYpFX4lEc?=
 =?us-ascii?Q?4g3yZ9pmHA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d1f4f6-31fe-4f3a-d8b6-08de97750aca
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:08.2952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtQrOQeuyVk89KEcAyn7vXE9Z1kubmdy0/rLwd6PwmNogAUi6dq+Lt6ULU02pVx3iXtM6Hk6wNHKJnnd7sE6rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8794

Hopper and Blackwell GPUs use a different PCI config space mirror
address (0x092000) compared to older architectures (0x088000). Update
SetSystemInfo to accept a chipset parameter and select the correct
address based on architecture.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs        |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs    |  8 +++++---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 22 +++++++++++++++++++---
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 18f356c9178e..1aa869693b75 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -169,7 +169,7 @@ pub(crate) fn boot(
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

