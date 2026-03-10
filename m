Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010020.outbound.protection.outlook.com [52.101.193.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE443C3BFD;
	Tue, 10 Mar 2026 02:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108751; cv=fail; b=hEgI4RdV8su3cRqyLxTlnmgS3OPPoTKIxFhbE3+68LPfMvhwGQYYB/EsLCWwbZvAi5AbiLolCd4qA4tBs4aMx+sFBFr9BajmXg2rwuxgirnUt7+c7vYBZqe29P2j9cqEfSE9MXWAGDlT44xdCHQ4g2kBzNoexaHnJd5aWmKMDjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108751; c=relaxed/simple;
	bh=9ZPWtY8wWQq49EExIzPsnaZ15d2Ke2B6gba48lBjpdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cy3RGyTimYCeznb28EWTBstnoskA0B9AVRMmulCtHx7sYJjpfO5rID4r6zFKHqjpId6R6kVW+u1bGG7aIcuC/VuadBmLzhTmpZBJ+LdXElOzFHlv5YVu8qQT8piWFQXFvPIqu9jwAHJHZGIQjhNAu9IvTS4Xg+Xv2sLOVwpXhyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LM1n+jfX; arc=fail smtp.client-ip=52.101.193.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LM1n+jfX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6ILlXgyxR/eP/UjgPZrEVX/hvbpTvq1nDj7LhRevg3QhL77JCN1HGJa2q04JLR3+4a2jAhdICulkiLquen9d+qKOWyr0CiDTOq94TwW3Msm91Ggtajuiu+XlLGX7FrNqOvCwi6iYx0d+64KJVsJbybo5EsfJpi2sxr98pr5Uo/2J86uFfOTeFNDbQriM9yHUd39OiIYBqn86HQ1DLw4qQFpSqwdOQMLBPHmwNp74R9ljnedP93g9FYlg5eHZNOCVK1BSQE87sJgJU2D8uLlQLgNKAwiw2JmmWq8r1ewiMReKAC7kk07AjBrv76YoYiGr2Mtmdlzeko1jeq950jM3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKH5l+iG8a06wBfCbSleySitAk/fYDEtNAdsFQ170N0=;
 b=WxVLDokA8IBeicMcti2tZfOdnIAQey39JUZZM05BTz17rhYJRjg69JouG1mFuJd30vttqVMZ1oiCrR01uo3lWjag1dZmpyAew2nFiVHTRJZvF9ibBEFVeL6Xwn1ZrpQOoq29MlCCLfUmTlvSzDYDdDY9t5WXbv9mrLKLvQMbPi4Rq2sbFx7UY0yPDJYSULrN8h3ktoA/+9bYFyYJfgiVqaXq56TInL1M+4FIlBjmhANSI+IUWUjbWXbmRdSTAg0ElylBpWfgyRnR0YG0fh61l3ilTDLKPsCkRnlvyeH9XetS9defOjcW8RQmF0EEN9zV/jOxA5vYfgKMUM8UAWfCJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKH5l+iG8a06wBfCbSleySitAk/fYDEtNAdsFQ170N0=;
 b=LM1n+jfXT/Tk12ddo/ZFR5VbZ99svJKAUVMUvgrEQ+vM+N/ZQerX5Qu0xkKUSfJObVQPHOrinpVqHoXeiapSeiqotnpaqUcAXp/XPI8kcFC7L1EHoViHoLLCmkWRW9CDqq7ghlXL6KAT5TajP5MAGtqRfx7gHU4mNunhvsFUjYPrFSlEb/TqS3JGRfmJQBBuGr50rBeROS5qX1BP3tho5cwTaZwMGTOmrNAa+hq7qtV0Fl9pE4cwXyNaRyc0qisbju1I+fkv5lB79MMDqwm1L9YJaW7NqbdsULWybZFJOVInvYr3RDISiMSHN8sPaRXMXl/3+JjvszqyrEpe+ZTVww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB8070.namprd12.prod.outlook.com (2603:10b6:8:dc::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:12:13 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:12:13 +0000
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
Subject: [PATCH v6 33/34] gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
Date: Mon,  9 Mar 2026 19:11:23 -0700
Message-ID: <20260310021125.117855-34-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0179.namprd05.prod.outlook.com
 (2603:10b6:a03:339::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 35ce523b-ab48-48e5-b89a-08de7e4a717a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	UrOt+qWg4i4EkhTvCMbBWwMVwZt78eGsUKSlQHrw7U/3Mu5jNcK/BY5XYVeJFAdQW23xQQ2+MDTXjN5kH/n9735qpXDhDPVvpicfdfJKsKfnry7l0l54t7kTOVvYMqwrdOWzOQQDivnujetaqYTWab5yvYAXVOIkXosq3CYAOaEV5D9wlEsXK+V4yN7Z+ZoSNN4YhjphULtnXqInqI4j5adUMkHaswX9P96aHLcrnHDxCFQTNWGs83Ak67k53f9ZMcuVbYbj96wVAD1rMn1EPzt2HQg1+fwYv3a3bfP7KsVSrIiAkxx0O8L4WAcGpEicaL2gygWbYhGGWA7LBAUDx6xujgguzry3FGQtBKbXi3XZ2XZPq0xfKmuLnG8LlCwbhth5oIDayW/erbLfW/1Ad5Isy/6jhUklbgBgxBj8pR7veDCm3LPrHcCCbJxclnwyp4azp0DyYVklpzVXX+fgWfeOvNdweo6uV8WgkaLOBdfWMX7Vlhh7hECNgeO/JN+wsW0A/VL3EuBdHMIFlILWFKYP4ubQicUYsXLOriRsJE4Y6E5LG/ZUhf+CxlgIWMQWHwOyIyJqgAORZpX1IxU0hdp1APdIfOheXYH+Zo2eD/QzKT3V2hGonGVdFa2QeodUcxP4yxEIdSgsoqFoMA0wLPgsncmk5zqaIdK3uTQGCPhCA0B0ZdrJ5f8jiezURzsLq47AfNJL2A1ihO/fIsr0b4a7Fd8DlnSgp3hZboL23w8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I3Pai1J2Ufhx5j29MwB4T7b8tYdGueCAiSNmbxX2odZy4mbGfMOrbV3JrzkF?=
 =?us-ascii?Q?8dY9lcQJTtDwXk3giEiWTyTRWonHQpYERUZypG6MiXgqZVQUmC/b93I2Fqx4?=
 =?us-ascii?Q?7HvedhWhOMSvov3heuhh29adZIQGKv24Quzdt+ZxbafparqA4BNhTJD5CcPp?=
 =?us-ascii?Q?EQf3rs8gXtcbwaZqIChsMRSfbjopO62H2+RqGdfxcLW09sGqa98UWjRrB3yA?=
 =?us-ascii?Q?SY3QKl4xQpgegsVfD+FGdQteo17yHJ9WQwyPuCA33vkpLU1iJuXqqdEg0qqa?=
 =?us-ascii?Q?rWZujA8BrlUjqBT5HvmIR6mBRphV9gxFo2tjCfMDO/BMIhwCZyP8+23+QjzV?=
 =?us-ascii?Q?aNQv3QqnbFN+SPiyAits7B9JhtHYY8RbdlJ1AGKmq/RM/7dyezf09N7NceRl?=
 =?us-ascii?Q?NQZrH0LpWfhQWNKQRoVVBWD8cOgdFmuRboBSbFjwRlVBh8F2n7qDmeRn5eqL?=
 =?us-ascii?Q?wTB2/LV/s/EJNcD6nfvWSb6T4hSGaBbG4D5cCqjiuxngasmsMcj9NWt8Gcol?=
 =?us-ascii?Q?b7NlBZoacaNhrRPtnl/8y7+KaZrM3m56QIhq2NT0yMv7usnUfcjTK5Aj7+ys?=
 =?us-ascii?Q?72KNRGWvUhW7mCBs3VezTViYYkwrcduS59PLJ0SxqeBIVGRohZ4YZLadMkbg?=
 =?us-ascii?Q?F0CkPJ3BvU9/4Z4KSvVWvIW1seehXBj5sxxu7OFSMD4sgxzT0YnPOiUIaCG7?=
 =?us-ascii?Q?gQLVI/0LYOkeCcoTpB2GSnWAR/CPe5Ek+9Zo21a4lf6HNY5MfNu5ALg4X5JG?=
 =?us-ascii?Q?0Uy4Sn5bcIwsTO6vuC4ge8YWGNDEs6ZCw7oAGL0XsAsjOjf42GmATgpChY1T?=
 =?us-ascii?Q?jG8ZzugpjUr2zuBTLdF/JtOsm2cxDGIv6cjuku8GQCfNOKaTfMq5ZBnDNZj1?=
 =?us-ascii?Q?S0ktUWprljNv72xNEZsfUMxta+TGqUxXk6fdP7UeXitKwCuuWMwVpk+zZTVI?=
 =?us-ascii?Q?qjv3vQFfnCsIBB0ttfAj6TCUNTXvPzKNBfMep/2PYGZGYlChXxN8+5DukuAd?=
 =?us-ascii?Q?TmE/vajDvcRkqPZta9yJbVm/1BiaqcQJPssuB1bdzZhnICq24fAgo6DsAzav?=
 =?us-ascii?Q?ex3UxoopydWLvJPUKqxpY7X/jeNjG0r5WZQDFIE/xOOd32uNcGLGFfTEZiG3?=
 =?us-ascii?Q?PCg6YiGQCq+a9J9Joyp3kaJmCNx03m+xGjObWEbUBBZvnBTHYXmRWuUkclQQ?=
 =?us-ascii?Q?u13nQS3IpCAxoJsgr7J4IkQKWQTy26wGSENGWedhLNUdq1ZeE03uQIW6RMaz?=
 =?us-ascii?Q?8BvDx9ULSBwffQYtpdyYNUx71FRfxrntfv5OwM0EsD2H8crZtluSwi/pyZ2z?=
 =?us-ascii?Q?oDFMFfztXOKWttaXXbxKN8XskApYfx+O85WJkK7cBgSnI3Zn47hvSM5xgXGy?=
 =?us-ascii?Q?oGl7yjFtPeDM8aei17Ty6zV2If/Wmjum3vTSOeZQfQpSZhxotg1wvP6QSbfU?=
 =?us-ascii?Q?qTVYjwCIWnePzq2SKMr1k7wWY1VR+3LRoa4o4/S1eABqlzX6F4q5md6ZTuFX?=
 =?us-ascii?Q?UiGkrhbecUt2n2g9B6wtC5xgTTNFfA5Lj0DnJhlegg+MLLbfcmZTYr3mww+s?=
 =?us-ascii?Q?Pr4gHKKxvociQWXkWb1FNvqDC5EvMOIKm0glJNITUeC3Jj7HatqXj3vvevII?=
 =?us-ascii?Q?/vByOM+q5kL9snOymkSNqlwNyeVoK+py7M/hjoVHrECruHqDvq3nr/TcQvnW?=
 =?us-ascii?Q?k5+79SORkLdhHW+mcIFcEMBJLmpoXf6J2zYNjLKow6SVyhgN/gc9v/Bs10Ir?=
 =?us-ascii?Q?vg3HkwKnzw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ce523b-ab48-48e5-b89a-08de7e4a717a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:12:13.2245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhrCUIpZop7jlb9RuWWVSgjLSos4sKdT3ofX8YbloaPH3a48fdaVdem6aYP6EeJTusa8HcyOw4YxQ6Y/A1lbiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8070

Hopper and Blackwell GPUs use a different PCI config space mirror
address than older architectures. Update SetSystemInfo to accept a
chipset parameter and select the correct address based on architecture.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs        |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs    |  8 +++++---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 18 +++++++++++++++---
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 7bf160723acf..7b49ca6e7a41 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -257,7 +257,7 @@ pub(crate) fn boot(
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
         self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
+            .send_command(bar, commands::SetSystemInfo::new(pdev, chipset))?;
         self.cmdq.send_command(bar, commands::SetRegistry::new())?;
 
         gsp_falcon.reset(bar)?;
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 8f270eca33be..e6a9a1fc6296 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -20,6 +20,7 @@
 
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
 
@@ -52,7 +54,7 @@ impl<'a> CommandToGsp for SetSystemInfo<'a> {
     type InitError = Error;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        GspSetSystemInfo::init(self.pdev)
+        GspSetSystemInfo::init(self.pdev, self.chipset)
     }
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index db46276430be..c8d1e025b047 100644
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
@@ -35,7 +44,10 @@ pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, E
             // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
             // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
             maxUserVa: (1 << 47) - 4096,
-            pciConfigMirrorBase: 0x088000,
+            pciConfigMirrorBase: match chipset.arch() {
+                Architecture::Turing | Architecture::Ampere | Architecture::Ada => 0x088000,
+                Architecture::Hopper | Architecture::Blackwell => 0x092000,
+            },
             pciConfigMirrorSize: 0x001000,
 
             PCIDeviceID: (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw()),
-- 
2.53.0

