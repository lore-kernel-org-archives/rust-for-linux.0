Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011065.outbound.protection.outlook.com [52.101.52.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D42C2DEA64;
	Sat, 11 Apr 2026 02:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875822; cv=fail; b=OXB//qAoxuxtvFolyiFj7ZxmE+C6CaenBXcBmbPomd8G1UL/jShQ+wml7wC//7tQBQrV5SCUKVd027qOLVfBOQ3MlcyracFQgEBJPc3bobbROj4WZEEr+33x8yh4tRF/ml4ZrHYmXYg98btd3eTWeDedLPTmQiGURfa4gaJbymo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875822; c=relaxed/simple;
	bh=T7kN9fBivdw+BfmuEiI/fehmonmMpt86cQm36Vg6Zrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FnqaZOzZ98JGRbhiBzWFEqAX9TcomU156i0NcXPwl1cnu/0NzyRIQGl1y2YZEf+8fAmDdULFr9ATU4TsCh1/oLA6xaK76WHp/RVwUe2JIzzQx8ESov9jsD6F8AopoOYO63eaWZnt1i9TPdH4T/ypZoNRGOJxdU1s1ywARw4Z0nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CgCVckFE; arc=fail smtp.client-ip=52.101.52.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CgCVckFE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SM8CdCS3X014+j4qlFPwtDBvXjDm5AlE3U4RlrxSfrSGLJ/JinRUW6bRTaHpyH+bHFAOncNSNckYSjdM9XI/KqcLw/VcL8d/qIRKa/A4fm3YNiZJK0AkiB6t5ZLhmUoUcqnz/z46z2uqI6WUmibYXNABpmIYfYM2iialiq2g2A+uDWsSO08YhPtdJhLmrIRdScbR1CF4g26+qmLabGPlvcK8xP2ML+JUdll8dWhPYFnByPXKdQ0ikV8G+LWoRpFQ4h/udv2e3adTJpLA6fZ27G7iJrgitTa+MAH2rk5yzviCnquLTCGsB+wawxWIOh1zEJGt5TtF6Kn2fuiYKvin6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFnJBZKqATPD/a4nvCuhwdPFc4LjhEyNpHiXxqdMKCw=;
 b=KLSBkGZY/5j3bli0K3LBLvChH614UwrMqjRqp9HeVJM7WEPU62dmkB2hHvkC7p8hjlrcvT2H0YccbVW/bSrD/6C7ca1NeI213pyvEwJRv0iXOZQgycSC5Ss0tndRxCsX5/hmeUSmJ8cmTl8/6FvPHr/EcC9jI9dfUjS377UiiOXGGpADe70UtPs1e2IlWPE76icVQad00GMb7or478EFUD7L0mLZnIbkGkg4I++bpua2rqmaubgfn0fXUHoEapaoxtATOiVAr+81bhUcdN4zhS1uWUQsGVsJtr0t/LJ/qEe+ydJi4bCnAaxkB4Q/UD78V+Av6ZnWa6Cjb6maNATq9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFnJBZKqATPD/a4nvCuhwdPFc4LjhEyNpHiXxqdMKCw=;
 b=CgCVckFEew9/NicxbPLoE0S2inMftpPX0J2wByBauda8ExcySY4G5uAeRz2Slo0eqHFgesqi8y/S7fvGvGz4po9VRY+JEXkRt/kjZL0f6WxR4bQ4BBA4jFeyct/vaL7dHm6DaVN+Tc7T583atIOlc7c5pbrKmdJ5FYlTBXCrh6OdyitZBdLtxXQd7UniqEw7ZuNc/Gxk09V6NOrA7iUVTm0bAqVh7VbJeQRDAvk0WmImiRUywBKrtGhGjLurJal8sn9NRIYqErJQFrn/qwHa81Z0kHFPkXvfprtgSq9CdS78URQxRFVxSI/t0zL0XD8wnUj0wRUJdDv/TQNuWgQEJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8794.namprd12.prod.outlook.com (2603:10b6:510:27d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.15; Sat, 11 Apr
 2026 02:50:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:05 +0000
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
Subject: [PATCH v10 07/28] gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting
Date: Fri, 10 Apr 2026 19:49:32 -0700
Message-ID: <20260411024953.473149-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: a2e3e6fb-fccc-4c1c-04c5-08de97750943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	50bjqwVKaMNXwAToQOiPjyEEM21mvNMsQth12zNw4UwTHb/aJMokD/LumNJXQ1HLC18IT7uvNOarZgemfnH84FGfpfAJ9pGzAINFCt7vi1TOMR0ql08luhkXibcyupip8AH9IAVaNoB4b56uPx99LFsEz3UukIZn+R8wDWXNekeJpRxG5KtqD07GrNpeCjfZD9+va/XC38aJcnfSzG6GcjerFSwNtU1Ye3y7gdCKAsTYoJdbvMmVqE0kRreLZeH70BpkdLL1DE8zKX/6FGrx1RAHbGUpXssgK6fBJ7YWdJ3FCa6qudFSkS5XanbO4UKcpH/tJk0rYoshWIEsUixomJLvbVQgmqwmSoTsM98zc+8WcTxS68R0ZQ6VZ5W6F/8op6CVXF32JzO69HRURK7wYrOoLQWMoLWkgIKX/deHnt646LBYBHInFcHKVSGn5rcr1LPV6I4BQT3y49xLLDmSQgvhOshW/XOQvj8JIPFRmMHqsFAAQQmWfUx2D6Eouat6QX+eaRRqUyCIRvja5mz8z0T6qcmd0vRfRgAX8/k9FrTj+Y7soT+1rBl0oa0/j5cidUwFyTQSocjln3Fu/J0vjWc4BkCN+/05qiIVzEbdh8aInt4XBkns3MGot7odRxTQHCPyeoU9dJkWzKCNQ0AxRkbrXniEplRl0UIbmNQ61o4ulAF0vhFgSe1iIj7qnodVxsXU7GCPyTGT1/48/4NZ8yQWhpj/X5ijDFgOiUi/mqk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mEunwtDKxjbvCVb1uKMH08Fv8jA2y3UTBYNds839YaxIIa7p4rDPzSiaZukQ?=
 =?us-ascii?Q?bYC/F8QMJKNDFOM19QKqBobVTiAcCHD37Zp3FukytyM2OWIEztNh8wbQsxnZ?=
 =?us-ascii?Q?+DJCkIWiQE9soCoMBw54PdSEOt4BH/qmP5rb/YgVJNHpCDBQtNXFyMHQmzng?=
 =?us-ascii?Q?GrS5IWVx33migCSMFkSZKb9GSaefhIizkNJ+rFrKZ16/vRjJ6/iuTzTLN4Fe?=
 =?us-ascii?Q?D0Qbda2jz04+D29h6ztzOZWQ8u4Uv1MtxlLfbGSB3+mBxZ8yVxtPxB8QPk6l?=
 =?us-ascii?Q?Xx+pRNNzWJfo5BwRYlsRtd5Sgeq6fYQ7n4EEV1jrUkuqWp+dMVWFFDHcmICk?=
 =?us-ascii?Q?hv84/G5rvDZNnNkKIOXlDMPFlQE9sLItMzqPM4TUJYR3vu+phCeOvBG4V/3o?=
 =?us-ascii?Q?3yr1yV53Gd2sfXFsHNND6cGVllcgIqqsn0a6s9Sx/3uq/vC0TRhMP7VTpXy+?=
 =?us-ascii?Q?dIUsiitJrouMoW3holkT+ZzQ2v2IbtEu+mIvqkCg/1Hx7IAWwkYymN4ej1e8?=
 =?us-ascii?Q?5tTK7jTrJ4fkil3Mx5QWLgS/CpbvjTNqelmArzIUGD+PaRIGWNgNsjFiunCt?=
 =?us-ascii?Q?n7P+Dxn9XouhfQJ4M76Mp1kUInZLRXnUyzbxd5kQArHEdeEHPjXAtUvAZoDb?=
 =?us-ascii?Q?rfBn7JDVRqycei8R4p0qfxRGCK/ZINOGbE9HEUNNRRfep1/pML7iw8QYJ7gs?=
 =?us-ascii?Q?hxQf3zWpGmJ92xYok/p8IxJpm5VK5S4yJC/wfgZnZXAN350QCjFqViuUsHcg?=
 =?us-ascii?Q?OPddPwXtO+umwR/7Id9AXGyiU43Y2JMuL5GePy2rfUE8PkshFz4ar3TqhndK?=
 =?us-ascii?Q?ua9lxMGlICrQpM0XnVDlCtJ/TtzBv0E1WfX72LUW+gp7Qn70iwYAAwM1vHdX?=
 =?us-ascii?Q?z4eO7YxPfspxMlw9JWfrF/S8rRHkfpk4PezwoziyIYvUIuzpKhcj9x68rn50?=
 =?us-ascii?Q?Cu2OytJzq71Zzrc7BU+jPz3eBcCu9GelyAXeIijk61K97K06TjxnT7C57Qe6?=
 =?us-ascii?Q?8zg6HNqHn3nseeu99dZevp3EY05heETZ6OY/NJvuV5Merrb8PlkSMjVHMwDF?=
 =?us-ascii?Q?FRiQaT/iBZ8wrLxdMcjQsq7ZF8oi+BgXNsGgPeKEpZSX2fwD6ImrvsnuG+sF?=
 =?us-ascii?Q?RMoK4M8mPDjMJneY04z5kSZHDV2zQhw6bhJ//sqHkmB6PVbDxYR9IqaSoQTb?=
 =?us-ascii?Q?X0xLkIKoPEJ3n60KYlbZGEMUexiDEEhwdhifvsJ5Ti+7nfB9vm42MQE+qBgG?=
 =?us-ascii?Q?gCNnCGP1lySDYDuw8y1lUUXqdJgwSTnDmcpPczHzSE8bTY03caf1ZEhPFs/I?=
 =?us-ascii?Q?Rz7PmDCnE1ij8ulVBZ3+6KCsIQV9cirMMhJOTDt3L70SySNLwJWvP0QFpU4H?=
 =?us-ascii?Q?tWMYHQaTRfZv+Ij+zTLQi8DtOL4pZzctVNGaHkf7eXC75NwJeYFvhdCobZbC?=
 =?us-ascii?Q?NIBGQhW56B/LMPI8mNcJ4+GhBvM3mcRfAPjeED8hq+ZANNSJinixHlbAtItC?=
 =?us-ascii?Q?8FpWaH+G7gYuaqg96puD6hCwaj1GTPJGNFzB4mfHAOtFTPSnuUcNyRpGdmC2?=
 =?us-ascii?Q?wFn6I6i27VHcncxUij/5iS17GGbDAwYAIYzZjSrU9TfVm844xZiysY3h0KFN?=
 =?us-ascii?Q?TGxJnts6WhzJqyvo+wL5Z/j2CaqYVu0/73QydGaIjt/4HimXr6EnDb3EqeYL?=
 =?us-ascii?Q?8IA05DyCjHGEPTouORL1OPVCmt6Lmhku9r2ejnBcx/Tzw9fbBsO2uEmhjksc?=
 =?us-ascii?Q?3d7Ko0YB+Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e3e6fb-fccc-4c1c-04c5-08de97750943
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:05.6916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGEPpX1jtkLLlHZSF6AGAcpneVXkdbCeeCF+rk/9Kdi7IhnIzCHlxG9WDY/b0yZsBlmBOZrzsnIkxysUNOOz3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8794

Hopper and Blackwell GPUs use FSP-based secure boot and do not
require waiting for GFW_BOOT completion. Add a Gh100 GPU HAL that
returns Ok(()) for wait_gfw_boot_completion(), and route Hopper
and Blackwell architectures to it.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu/hal.rs       | 11 +++++------
 drivers/gpu/nova-core/gpu/hal/gh100.rs | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gpu/hal/gh100.rs

diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gpu/hal.rs
index a261c6af92be..788de20ab5d3 100644
--- a/drivers/gpu/nova-core/gpu/hal.rs
+++ b/drivers/gpu/nova-core/gpu/hal.rs
@@ -10,6 +10,7 @@
     },
 };
 
+mod gh100;
 mod tu102;
 
 pub(crate) trait GpuHal {
@@ -19,11 +20,9 @@ pub(crate) trait GpuHal {
 
 pub(super) fn gpu_hal(chipset: Chipset) -> &'static dyn GpuHal {
     match chipset.arch() {
-        Architecture::Turing
-        | Architecture::Ampere
-        | Architecture::Ada
-        | Architecture::Hopper
-        | Architecture::BlackwellGB10x
-        | Architecture::BlackwellGB20x => tu102::TU102_HAL,
+        Architecture::Turing | Architecture::Ampere | Architecture::Ada => tu102::TU102_HAL,
+        Architecture::Hopper | Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
+            gh100::GH100_HAL
+        }
     }
 }
diff --git a/drivers/gpu/nova-core/gpu/hal/gh100.rs b/drivers/gpu/nova-core/gpu/hal/gh100.rs
new file mode 100644
index 000000000000..1ed5bccdda1d
--- /dev/null
+++ b/drivers/gpu/nova-core/gpu/hal/gh100.rs
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+
+use super::GpuHal;
+
+struct Gh100;
+
+impl GpuHal for Gh100 {
+    fn wait_gfw_boot_completion(&self, _bar: &Bar0) -> Result {
+        Ok(())
+    }
+}
+
+const GH100: Gh100 = Gh100;
+pub(super) const GH100_HAL: &dyn GpuHal = &GH100;
-- 
2.53.0

