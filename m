Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012042.outbound.protection.outlook.com [40.107.200.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C2E39EF1F;
	Tue, 17 Mar 2026 22:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788116; cv=fail; b=Ksh3Z15veNXN3JtAvE0MAk96MD200EPe642zf0scY6OFVGUk/5qv/iXjMcFwOQ4NHGQxljxZj5K+qHDqB5uickaJ4EKqdy+AVVUouv5xct6/okIwZCjU0Gw00kS7Fc1sNFGbau+YZnIcW4BSnsYczqOYJ3Qfn8L54aiV17x6cjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788116; c=relaxed/simple;
	bh=oloILfzl6POHALXbZewATt2a+upy1q7Sq1vRAw2dWGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oP47/o/e7xdv6gKBCPbXdTWJP76SvTcfTGmt0vyYXSwL3+jdnJp3CTT9S6XgmLCj2GTgK/T3/CvnUxCRRlXmsDpEMbGQeN+2R0aCa5n+nip6/QFMz3yxZ8VVF2XaP/jfqT0ESNaNYJZmLhZwZ35jSodgaF51k59ZdKwErFFRcHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hpHyP7eY; arc=fail smtp.client-ip=40.107.200.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hpHyP7eY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQdD0loYDbn+mBx6FFQ/zQ9RMq50t65WeTpqaC9mzEld2IxkSqc/zzo/3ajqtvaKdlEZF2ca8teEE6dG1korQnDLR8KanxQSPjCMQ6r3e6Tp/lmCci7EoBJjqMkKi8NQEjdDzkGtySabwf1NIj9uXiGlVbqfmkBRM/ZXp1Za0ltkT9QAVvX/6rJOVC8DPL1VoimoMRzfX91rJOb8FxRuwNj2sbQk2P9DoxBn17YLzKP6vgk/4OS4CcSw8lJHZmdB34rUSAQKEfaxNejymq5J9boQBUFpMDpZNPgFTcbEmSUqwgKzb1JNfGN0pT/0bgagZjGdvM7kDm3I1ZN0uyICrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMbbAv6GVsnMz91WNebXTNZ1UjV0J01NCdCXowHpysw=;
 b=qAc9wlpxRRrdX6IWtyBXCj+kBatUvnRDBsCBZ+Dd4i010rbRkkHHeAvrGpPHUYyBCiGQBbOeMPvfhZV5DxTNf7/P0RfdsBqmicen73oyq/Cd1pu+iI2M4qleZ513Xlwc+GRz86Vn1wW5OrRfJxJDv6Szh6vy4X36URKPcqlyD2EFGyv6Ov6Q8CKvaQLCisGQbPyt3jKzShMlHR1fg0rwpDFxPhtsHsn2W25mW7gpQe+qD9LPL8PlPm8J3ACkPOWCVhLpUHcV/wHtR121V8WLtjAzXB01JCVLuRwogXOOnFjC6NlDEgBvRvFxYMlZyF62oeFC79tZkupfM2CMmk1sLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMbbAv6GVsnMz91WNebXTNZ1UjV0J01NCdCXowHpysw=;
 b=hpHyP7eYEKh9wQwqilTrYyH0id1wBJITl7dfFwuYk1r5zgaSH8uYWyFC2Uhbdi9ILe071XT+7isdkTyGpVj5Zy0IZIgrS2SbyJrW4KXixDy/UQEknEd0NF+01snmyhJnwj4rhkRzL8ByafhIp8r6jZvlMV2FGRKX4OrpTuMFWQhgyU5FbP0LzC1HB3nEND3JzRoq4WdWvaMD2E8qazMVs02HMYIe2k5vx5ICnJLBrX0tOvbiTgNFqVx51KdYVLVmbGNGLFCswtBcYsITqQGucuTiHPFpCco8ACKPrQjZWMMy/bIhhj9Oe+qb3UtM6WlyJBcnvtxZ/TDNLzZFi8xBBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5848.namprd12.prod.outlook.com (2603:10b6:408:173::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 22:55:07 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:55:07 +0000
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
Subject: [PATCH v7 30/31] gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
Date: Tue, 17 Mar 2026 15:53:54 -0700
Message-ID: <20260317225355.549853-31-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: 69952cef-9f19-4f59-ffb8-08de84782a20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ft37/bPXG9+asqyPlluh1p5BHRUsxVcK2uo9t7CurmTWENtHUKZ8YLYFl0VEjB63hz7+0HgF2Yk4dFJPAiR3tgx5hTEonz3JA5FcIVhIX+l654EXEWU7QFwm0CAyyyfxHYmrjAoPb8rw1/gZvsEL/DtxGQkqG3dc7YXtIcYWh/bML8GyQZ3Ahx30lCAXTo9Ylz58NIs78By3TsHY3bBa1U5dq2iBm2+H3pt26qBmBsVIjfkgIOwRP9osDUZk5k+B2uzCCBt3r4d/rsgDZDyV8U9zuwxPhI9lVwXSbuEkzF20Vtl0fD8o+nKH2auapBJZ4q0XkkLaMnZs7utYZVbA5rF2hD0yaxJ3djB9vz/5dbUw9w52ATc8UJNcZjWJNjJnbbqcnjoMzbcBByfR8hW+pQqoIMgyDv8NoL4M/xDfRcV7G1ELMNAZSMXuOFAEiHGJfDOuTLBidLgWagUd8plke8fs9Db3mMUbaYjqJzxtdO8MM0t9U5zillgGyi4PAR4gg7vBgIWUGxW5+8IgQqk6MkWULWX19uybRYvLcXh45bOF0+JoDJat6wTl33ZNOzOGmJh5YUjrIPIgELGQJiWUOvlRknwnytz9R1unyj30m6CkNv3QhuvdHjgE2Mpq0zeLRfCC8QAHjGceRd4I4YoewcYjtfk0W3RaNyZP41WsKRIu2ojHFnpXveAFFOk+UYIDFpwGT6EHGobBijspaxZaNo8+7+1dz09LXaiM5XAmsSM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?04cTW0jJOpwCLw9ndzrNtmwhjGZ0xhnrmsl+5/LwUlaT98mTErFJfdsfJIAD?=
 =?us-ascii?Q?I1gRv564uYCfw5MnyNw8O5VU0q87AxwOo73IqpIfVqXgoJ1EpmTrqtMzjLu+?=
 =?us-ascii?Q?DZpNoTbgZcI5N7HHumYwDFo4BZKwaaYFB3zGUFrlZGMPqqgQ9iBavUPImzFt?=
 =?us-ascii?Q?49SlmZ/iZrb8tws0BBP/zUg5gmILMI/P7/T3QKbNqRRsGU1cv7BdD1bSLiQj?=
 =?us-ascii?Q?uPN7HkH1L3zZDrFj3biBLmus18WDfUkFqA8ZsanAsSIC3Lp1iqR/AhMBqA3q?=
 =?us-ascii?Q?uWcKLMUUcAQdi+QV1LzGmtDZ6MAbPiy5Ix7RXxWFb4AvwFrRmhv3VBYIPhut?=
 =?us-ascii?Q?qPfL9FpJbIC7rgJ183xwpSKtce2f3Lt5hNH5NrNXWsbhzJ6C4mhO8aLHyF4V?=
 =?us-ascii?Q?VTPlk3NbFft6CrWCIQyHdgO+8eHRVC9tByilfipoV2E8ww8pdSg9uenwPLo8?=
 =?us-ascii?Q?2L24TdqwmecTPr1tC+hBUIUbiG/DNqha9lABcRM8G/K5f6xh80oC24fd/FwY?=
 =?us-ascii?Q?QP/RngkwpwF/5w9lcM4LMS+raYyOcvJKROJwRVnQzRRbxHKU/OCkU7HKP3bn?=
 =?us-ascii?Q?fGIrVtdzruCa71cYG2vZC1XunLCQ45W1P/LAMACELES9UiJT7z7VNHT88E7q?=
 =?us-ascii?Q?GBgkykrt4GiFI+ia66eyGr1S9lbXRVaUCp1nNF9Q6hbBo40486Lph/OVXVIs?=
 =?us-ascii?Q?1D/UG/jH/lyuZ+xeeHpj6qFAqkPX8XcaOiJhvRfTu1I/F3akXXQE2MCij+VP?=
 =?us-ascii?Q?YzkRv8BHOidcuDpEQYUairjRAHciFb0mBsYIXMTv6W8hKIl+Aphb+vPchAFi?=
 =?us-ascii?Q?kl/8XergZL4efgOqEvXKYytlyCIWi/k0VWYLlDbFVt56hfZYW/eoKgRm7lOm?=
 =?us-ascii?Q?vPThxXdI+onBXQID9kl9gVuy8szkfdlP6n1Tvjr3PRC8Iah+hWCaOUSnueZ5?=
 =?us-ascii?Q?RumkrN5aneFBt+FkEvw+ZBLONvR2fMpK1GNePk73Tc7LJzDnX73c+ZczpqcD?=
 =?us-ascii?Q?ujyG3QouQKXJtKdKTV4VfyAt9LcJ/2pV6cATM5H8WbsPAr5+y0ocPAhTMNxb?=
 =?us-ascii?Q?NIA5hKFAhm0TniuELLQIscKLYJYJ3LJf+MW7MIs1BxqUxZwGw+5i6r9Zu6jz?=
 =?us-ascii?Q?5AGO9m5UvGUMwr7l3o+8onz3/fg2BKyDA43DiptKK9Z47RG19fThOcm5p3mA?=
 =?us-ascii?Q?py9kK5sPPN4biDSKu9QsO+a2zALlC6GySsUOtR/qnhg8XTKx7Y2+L7ZYYqSA?=
 =?us-ascii?Q?+hdQHJU/FnW5+aX2KEHN26aT4goLfifXIG58GEbtvFxajxvHUxq58NZLxBgZ?=
 =?us-ascii?Q?8spw9RzCsHTPelvMD66xk8hAIk9F1pM7sjhAYIb6soGUQXmBUeoOL/uIpj0k?=
 =?us-ascii?Q?LRNXFqWe33jIFC4wt6ytuvnTXnsrqs0E/R8bHTX4iA+bf1gX0hWxWZ9556vp?=
 =?us-ascii?Q?WetYsGIA5L0wXI4TrK9Hpnhr0yIzcCSRBjHIxbtXsOSKBnrXz8KSjNLshfKK?=
 =?us-ascii?Q?G5/Ul9t47o5ZnetFrr7Pk5DeOtVuvoyOdDRJWRauJPWEjqiM4lDSzSZ44cse?=
 =?us-ascii?Q?oS2gaGEHQ1jisD5e/CRKxmAy9zqEcptR/HqnrpvtZs0/+2d/Pf6WoALY6Deh?=
 =?us-ascii?Q?I4IlgMWlAxzU4mD0kFOZyCVAlPxwqi0t0vDSG5ys4whWkGVxa/FPtGzJJ5j7?=
 =?us-ascii?Q?e2ps0NFtvKytqmL4H4ZblUsKjXDrtOeh3DfvFph6JEDRQ+kOB1xzelifNQPD?=
 =?us-ascii?Q?Zj640av99Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69952cef-9f19-4f59-ffb8-08de84782a20
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:37.2694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Zbxs2SCDfVA19gkCuf7lu6R+inaAbAMs0HmxNCeFPUsimbmyvboa5kxMo+F0bqZMIMGhMiuvTioctp5VzF2Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848

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
index a3ab0bd7a317..7db811e90825 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -257,7 +257,7 @@ pub(crate) fn boot(
         dma_write!(wpr_meta, [0]?, GspFwWprMeta::new(&gsp_fw, &fb_layout));
 
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

