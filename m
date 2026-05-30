Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010063.outbound.protection.outlook.com [52.101.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37A734572B;
	Sat, 30 May 2026 03:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110633; cv=fail; b=a3n8Ur9m9b0/7b4OJProoQqC7Zt9qea3r1BWHn/KPje0Q8/oBleTgLay0IcoNCf4XdN9ok8vH6OvyU+YMX+uZ7MiXjgLrmtutJXq6SLxMIy4nP6gbu3N7bHsSe1UAl+CR3osBucDZDupL28DR1Sg1Pe9QK6XyKVGz05WtrJNu6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110633; c=relaxed/simple;
	bh=rmzgI7jZlvi4pOldwYGtTWjKxTFDkiIxQL5Mu21k6v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rhT7IyyqQvvYyITacDYdXfMWNCwDQYvVJvF/e9wHqqneKPt1TtJTiMiKqaDOzDaDyvj3x7J5auttwrbZljCDUZhOqy7RvyXuenfIUr1bEH5GP2ZNCE24zXQ/aaWa7veo5sGqQmQrK2rq/hfdU+LOTIYL8oF1G1JTUi4gWrFBtg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dpKVgGPW; arc=fail smtp.client-ip=52.101.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dpKVgGPW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TuvbgYGKc1wOTRvP17sWd4MJzPC7DBuyLVmX7DsswLIxHiBrnJuFA1TDvr2dd5LTw/k84OMx2mt6u6M/VkJk8vpfEDHtLyhrIsOwzaepcTDPFJwBxlV0HWNaB001jaDZPIsFlgKaOWs11FI1HWaLOJUd+58ltpePz9Z5FJOZ/n4Jo6OAAkA8JhA8D7xq1babIG/+7zsEveACkPR+36PeVB4iYZ4klkVhX0Bw1KnZyLONYY92jQ3oz0l/rvlYbRK8DSAnWqmb6ujtC2ujx+3VBVUXVHgbfDVt9chVfu+pcvU94Nu0JMWqURLyZ2J3j4iZWDl2U6UPsaq3s1HXCMa/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkTIBuFw3vSn4XXKAj2xYt8lJTJ1y0nOkJ7MNbT5Jx0=;
 b=FjA5zj68qO9yMCWRNlcwBQkWzxaPZkbx2YMsRn0j6+WpHNuqRmDIreGBDWWYnkK0pTRjQMNcfCa7CSJPU4ZzJu6R3wGu8U5Y/r+BfSh1WO+c+cDZ21SMrC99gKmYsMVJHGOhT7MatteLIG9qxZRubulJVZ6rFBS3ROdjLMZ+verKrLLpcYPiGhEH/K5EyqlRF4kZ68C0zvisYDQUD/AUs0b/96qWeAE4aeDyB58btHYg/mlPdzk0KwFtNY/toljPdYB8Nap8nFK/o74pfikro6G63BMyOC6KtQ63I4HBCrqi38Z/Qq0dhqJFiVxiB93fCIForSNdtcsUULcO0U/ahQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkTIBuFw3vSn4XXKAj2xYt8lJTJ1y0nOkJ7MNbT5Jx0=;
 b=dpKVgGPW4xScDsVNcZbL2vA9Ywf6zoR0wK7yJK4VZl508BQMf/pyGUpPJd8EE+ssrJotkfJlCvhw0LzqLmPIWnnSqyjGbsaU08xd4HedV4bFSNR40f35oJITgbsmowALfLDH5w+1t/KSW9RH7vr8Z+ymb+pBr5D23W/GLcgviNt1AX4Vfj9WqdAj4GqJ36Zmy7tzdXPI/kV3+pCghKHFHDCGvmUbzOIY/UcorWf8HKTINAmTOrUOAY8J6/2jja6FuK55v4UJkQoyVS+dzFJqkDiz3xaZsGE29gZHSHvLahr/cJlGY0SwqPoyQAM3YVdcFgn8W1tNBvc2mkhZnFzKJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.15; Sat, 30 May 2026 03:10:03 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:10:03 +0000
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
Subject: [PATCH v11 06/22] gpu: nova-core: Blackwell: use correct sysmem flush registers
Date: Fri, 29 May 2026 20:09:37 -0700
Message-ID: <20260530030953.740561-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0108.namprd05.prod.outlook.com
 (2603:10b6:a03:334::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: b849fc3c-831e-490d-ff4e-08debdf8f169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iCrLLPaAjSjNXNedwwz6yDU4UbqZ41Si5eYMFH0tDCSHBE8mOCzU1q5ZXxDSfbr+6+AOdJaMRAPWSbU+gwllkB91ViM70F7R9jXO2VXTV5GSDM4t8Q8IV6W485E586Mr1LsQhSHRp89J5xfuMWUU59e+AzOUV1ZcH33odfh9YKK7Eg2DeCA2ssf5nPPy4EdZOdkhUhrE2aMq1jx3x9lMf6I5bNdXI3HEoTb1zirkoyzvd2m+3J1/QqFAFoLs8acxqIhT6QyBnNdh/1WqSEQR1lffkSpe+e1VOvmgfgWj54Mv+R5y8w1klEplwzRSWpGhacanj3v2fdM9ifKKL8Y4MkcZJU0BfeN4Yj+xhSGAJXrdA9JBiUG4q+1qIL/msP12pycOhC9WGf5/G6MjrINbRl0YoB5jSpFzfCTeDjMjOcA2ewp3Iy3OKyA4NCCcLuKqmbRcxI9sBVRQ2dFIl6CzkbZuYT0owM/t9QXe9pMmscaLY/kHE6QY+pn9xK6kS96kJrW21Y2/nljCkAaSWIOskN60fBEg7HNcX/wJplE2TS8GOwWBpAdGsP1/L/LQqk5n51kZp9f3zZQE2/dy0hItGKnYEbA1Cc25meH2Vr/3IydNjvdFkGSMidvQtNI1d6z1tDShxGiXaMHwNCK/yz1pmbZfmf43W8R1thXOqH/6nIr/AdWJIPt2Nt6Xy3sPhEeN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K5N8vx9Tt8wUlfRszKk0yrhRDdoLNkMDv6XllRJhFw2D/9XHfv9YB2Ipzv2q?=
 =?us-ascii?Q?UpLOLo2FsfmV2AulNg1EJ9Z2pLCZYMxP5h8gej0Wly/gGQUMtlaKHIAQ2YqP?=
 =?us-ascii?Q?JE+loeRTqDjhGdW8YmK6OZeL5EPTXh4uYmptWdrHIrMUOG65/D4RLB4ARxpq?=
 =?us-ascii?Q?75l2QCYlvm+c1t02bfoR4MkRFmPEXE54NmWI+QFkLQEW43faFq2TadMvtxmR?=
 =?us-ascii?Q?QfLBoXIMy3/syWNqzTICvFG4fiUK+Fw5fkzWpI0r81mdB5uBc76p5TBZ6Bqm?=
 =?us-ascii?Q?00SQ6sBYu+lYgA2cnrC8yCPhd91PKkEwfhr+GIbYWNxfpZqYHbrF7uMItbxx?=
 =?us-ascii?Q?9mKlECbKHd+jJ67+deSnf3dylfJk6Pxvu6M3Dxu/DW4rqBramxdpmzY6F/4K?=
 =?us-ascii?Q?5aHM9nw34r94WYHhSVv+cUAon1B9VTgyFAtNcqIQ9Pcp+zXksQtAp/DvqafT?=
 =?us-ascii?Q?jx8w9MfvONTtxO/rLJmPPcjtT69lFgmvxT7/YBLXgg2QxX1oiCgb7oH/Lk2i?=
 =?us-ascii?Q?X/TmEeM+hstyKAd0kwcsWjm0mtp06kA5B50w0qyxqXmc59b6iRbqwgZa8sAf?=
 =?us-ascii?Q?L39MwYH/lEaqhMdjDvYi9g5/ZlAsiwxMKkm/h/ySknBCFOIjbmzJbPZugtsq?=
 =?us-ascii?Q?WsVzJicfLzSXNZTc/krlJrAH7Ij8bGWHjBKP4hf/YTWQjT2GGtJ7kx+dCqmF?=
 =?us-ascii?Q?8NOf3DxxSWCq39gAd6ka8CbjqeHj+277cnSOPzo10qRvrTo5ktuYZ6trdXZR?=
 =?us-ascii?Q?hLbbHY0sEF7vItV73l+OOQD+OLWOS2E0VNsnAekr5XOGf9gMc37qjVUAussG?=
 =?us-ascii?Q?Eq8cfzwxS5ltpwEMjTYkBhcgQQd0/GxCXKuSJE/kumE9UyoaiOcDxxXk02Ul?=
 =?us-ascii?Q?6+lNMbJD0mOaIf9mg1lb000sC7+nO8LOqeTbhKPfTLAWy1/nRUfIXbInL5w9?=
 =?us-ascii?Q?Wx3k2PftRnpKMBDKI5TpcgP5Sm0EQZj9C4qA6HKWZ9BZtNc4w3rmESOKmDoy?=
 =?us-ascii?Q?pH1zCMTzSdI4KcpaSRjYRI/hx/aWK0hkvE9o9PkLFvPocxzW8SEAWj9K02PO?=
 =?us-ascii?Q?J0rJL+uJUZCVq8jRWMN/LhGiXMwfVkNGcHxuj9gNvZzTbcIxopageejcCg4M?=
 =?us-ascii?Q?7d0bjNXpo7R3OEyM2QtH/h1x7FpD51OM3IsMw3/w+Y2YhsfpxXiUT4JTrd2W?=
 =?us-ascii?Q?nJZoU2Yoe8xp2U90t1Nb9mjK/yBZUeHIq7RzMyd31/ftxOuK58/YWxa6/KSc?=
 =?us-ascii?Q?QkbeKJXcxEzMIJdUMAszE4relyrjDesAlVxIyVxDkL7Nkz5XoeIVejQTqEkY?=
 =?us-ascii?Q?39W01qN3sw7MxWE49LtHm3ahQJcx2zIwV7YoeFvSjdoWBafv718KjmQ84I7H?=
 =?us-ascii?Q?XRHIHSaAmBZXPByc+8KzdaahznSdbplOJGrKXuAdu+8jVQWqjwvECWaA54uP?=
 =?us-ascii?Q?glyqpQU8b2at2ivk5eIGV0Mpa/PueThtIT63LdPYoxnQL1ST9LFYbYaTCgwN?=
 =?us-ascii?Q?24lW9tCVS6m9JNJnaj2slDLTuad1VvdJCS9xPeL+JMRFfvIVNRZkRSEoGcjf?=
 =?us-ascii?Q?MoMYv1rNPMcEELSBhOuBVgXspQrKT0oFtJDheQFskPogYZYPjnflV9l07GDa?=
 =?us-ascii?Q?oiWpn03hlNyWk2jS+4lS+GDqmc9skRbaflokZaUjur8rSwre5ptsT683afEf?=
 =?us-ascii?Q?J/lFXmU8QPQQJrLCmOiVcBWoTLEcaptpaAiTdDNC5r0o8TMmlE9XpkAG0ENn?=
 =?us-ascii?Q?iVcjiqaqxg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b849fc3c-831e-490d-ff4e-08debdf8f169
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:10:03.4332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfTZqqHx8mupFefSyBEY7bFnGUQsquvXFzjlJQ13JnlAuu4eci4CenN/YPFK/lQY2BFeqS6SJU1JmV2jLn1Jrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863

Blackwell GPUs moved the sysmem flush page registers away from the
Ampere/Ada location. GB10x routes the flush through a pair of HSHUB0
register sets (primary and egress) that must both be programmed to
the same address. GB20x routes it through FBHUB0.

Implement these paths in the GB10x and GB20x framebuffer HALs.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb/hal/gb100.rs | 46 +++++++++++++++++++++++++--
 drivers/gpu/nova-core/fb/hal/gb202.rs | 40 +++++++++++++++++++++--
 drivers/gpu/nova-core/regs.rs         | 37 +++++++++++++++++++++
 3 files changed, 117 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
index 8d63350abf8a..70f4c11b1e77 100644
--- a/drivers/gpu/nova-core/fb/hal/gb100.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -4,6 +4,8 @@
 //! Blackwell GB10x framebuffer HAL.
 
 use kernel::{
+    io::Io,
+    num::Bounded,
     prelude::*,
     ptr::{
         const_align_up,
@@ -15,11 +17,45 @@
 use crate::{
     driver::Bar0,
     fb::hal::FbHal,
-    num::usize_into_u32, //
+    num::usize_into_u32,
+    regs, //
 };
 
 struct Gb100;
 
+fn read_sysmem_flush_page_gb100(bar: &Bar0) -> u64 {
+    let lo = u64::from(
+        bar.read(regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO)
+            .adr(),
+    );
+    let hi = u64::from(
+        bar.read(regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI)
+            .adr(),
+    );
+
+    lo | (hi << 32)
+}
+
+/// Write the sysmem flush page address through the GB10x HSHUB0 registers.
+///
+/// Both the primary and EG (egress) register pairs must be programmed to the same address,
+/// as required by hardware.
+fn write_sysmem_flush_page_gb100(bar: &Bar0, addr: Bounded<u64, 52>) {
+    // CAST: lower 32 bits. Hardware ignores bits 7:0.
+    let addr_lo = *addr as u32;
+    let addr_hi = addr.shr::<32, 20>().cast::<u32>();
+
+    // Write HI first. The hardware will trigger the flush on the LO write.
+
+    // Primary HSHUB pair.
+    bar.write_reg(regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed().with_adr(addr_hi));
+    bar.write_reg(regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed().with_adr(addr_lo));
+
+    // EG (egress) pair -- must match the primary pair.
+    bar.write_reg(regs::NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed().with_adr(addr_hi));
+    bar.write_reg(regs::NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed().with_adr(addr_lo));
+}
+
 pub(super) const fn pmu_reserved_size_gb100() -> u32 {
     usize_into_u32::<{ const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment::new::<SZ_128K>()).unwrap() }>(
     )
@@ -27,11 +63,15 @@ pub(super) const fn pmu_reserved_size_gb100() -> u32 {
 
 impl FbHal for Gb100 {
     fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
-        super::ga100::read_sysmem_flush_page_ga100(bar)
+        read_sysmem_flush_page_gb100(bar)
     }
 
     fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
-        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+        let addr: Bounded<u64, 52> = Bounded::<u64, 64>::from(addr)
+            .try_shrink::<52>()
+            .ok_or(EINVAL)?;
+
+        write_sysmem_flush_page_gb100(bar, addr);
 
         Ok(())
     }
diff --git a/drivers/gpu/nova-core/fb/hal/gb202.rs b/drivers/gpu/nova-core/fb/hal/gb202.rs
index 542c1d7429e9..5a6b815eec3d 100644
--- a/drivers/gpu/nova-core/fb/hal/gb202.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb202.rs
@@ -4,24 +4,58 @@
 //! Blackwell GB20x framebuffer HAL.
 
 use kernel::{
+    io::Io,
+    num::Bounded,
     prelude::*,
     sizes::SizeConstants, //
 };
 
 use crate::{
     driver::Bar0,
-    fb::hal::FbHal, //
+    fb::hal::FbHal,
+    regs, //
 };
 
 struct Gb202;
 
+fn read_sysmem_flush_page_gb202(bar: &Bar0) -> u64 {
+    let lo = u64::from(
+        bar.read(regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO)
+            .adr(),
+    );
+    let hi = u64::from(
+        bar.read(regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI)
+            .adr(),
+    );
+
+    lo | (hi << 32)
+}
+
+/// Write the sysmem flush page address through the GB20x FBHUB0 registers.
+fn write_sysmem_flush_page_gb202(bar: &Bar0, addr: Bounded<u64, 52>) {
+    // Write HI first. The hardware will trigger the flush on the LO write.
+    bar.write_reg(
+        regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed()
+            .with_adr(addr.shr::<32, 20>().cast::<u32>()),
+    );
+    bar.write_reg(
+        regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed()
+            // CAST: lower 32 bits. Hardware ignores bits 7:0.
+            .with_adr(*addr as u32),
+    );
+}
+
 impl FbHal for Gb202 {
     fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
-        super::ga100::read_sysmem_flush_page_ga100(bar)
+        read_sysmem_flush_page_gb202(bar)
     }
 
     fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
-        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+        let addr: Bounded<u64, 52> = Bounded::<u64, 64>::from(addr)
+            .try_shrink::<52>()
+            .ok_or(EINVAL)?;
+
+        write_sysmem_flush_page_gb202(bar, addr);
 
         Ok(())
     }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 356fbf364ea5..65be6ec71ed4 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 use kernel::{
     io::{
@@ -145,6 +146,42 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
         /// Bits 12..40 of the higher (exclusive) bound of the WPR2 region.
         31:4    hi_val;
     }
+
+    // Blackwell GB10x sysmem flush registers (HSHUB0).
+    //
+    // GB10x GPUs use two pairs of HSHUB registers for sysmembar: a primary pair and an EG
+    // (egress) pair. Both must be programmed to the same address. Hardware ignores bits 7:0
+    // of each LO register. HSHUB0 base is 0x00891000.
+
+    pub(crate) NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x00891e50 {
+        31:0    adr => u32;
+    }
+
+    pub(crate) NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x00891e54 {
+        19:0    adr;
+    }
+
+    pub(crate) NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x008916c0 {
+        31:0    adr => u32;
+    }
+
+    pub(crate) NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x008916c4 {
+        19:0    adr;
+    }
+
+    // Blackwell GB20x sysmem flush registers (FBHUB0).
+    //
+    // Unlike the older NV_PFB_NISO_FLUSH_SYSMEM_ADDR registers which encode the address with an
+    // 8-bit right-shift, these registers take the raw address split into lower/upper 32-bit halves.
+    // The hardware ignores bits 7:0 of the LO register.
+
+    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x008a1d58 {
+        31:0    adr => u32;
+    }
+
+    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x008a1d5c {
+        19:0    adr;
+    }
 }
 
 impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
-- 
2.54.0

