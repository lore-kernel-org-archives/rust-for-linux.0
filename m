Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013022.outbound.protection.outlook.com [40.93.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B7D34575D;
	Sat, 30 May 2026 03:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110629; cv=fail; b=HIrCtRHdRLNDC80JEroiALi3vDfI+lw79tu2OppE3Ub0k7uteblV4uXdTLOpVLw6VXHrvSt6TTxLqyllx1A5nD/d9xKXb70spoBJr0fvm/UWt/24uG++0hWVs05qaUsZc7AaQFbb15ztQTinkQIodqBUc38fUHlgvf0jLL6225Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110629; c=relaxed/simple;
	bh=fEmOAB1exUEiy3R9sF65213T+PMvL/9C6gkW0gLRH5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IkdOAJIjbI1Ipi3k5uXH3j2GSCdb1f42G7DrKMILBFx25RlHk/YK2Dne/R8CsxhFpfbgrfb35QopQmX7RLGuVUYeE03P35dGWCUWNIfLSkaacbVFc6qOoJ3nd3C7SG5pe/gsVb9gVWIXE0qSQ9kJaGgilBCH1Q+IDjF1++SJGmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BmvW64/g; arc=fail smtp.client-ip=40.93.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BmvW64/g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fa+lZS4BGUqSHp3xKUcUvucW5W5JB+SE0S3jOgqqSZwbj0JVfFVItm74DRxHy1KtPuhA/uPyuuIiseKQ3ljr9bIqwPIHnJoqmpooWgEg19tQrpboEtOvgKYCKfj6ohDDd6nyAfgFBynrCNAnwiWkLhF0ooN9NYRp/b7XeuYVyJDFxj3eHGIxBcEYca3ckk91XizUftGL99U9rwQTDVJ9+Xw39mNcVFiiQZVXNIpKZC1pHJ0c21Xe8g4dpqaehNjjzjNcq0cz1OeK3J1Xj4bQHm3o7gJEpArXHFgt58bpv2LLoTqPFWpeMngt30mEY7kmqy2wxSS0Q/zeWZiYRzOcHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26Ex6Ongx70IwjUTLvB2a0XSXMQiCbu7in7fAZmqtE4=;
 b=LQ4y3Q/jA21tJfxciz/oVVc0JOWiDfGkJM/vGRIt+147YuLnSxfwVaNqvctw3CVE1rdnpDOBYVfm7HBqzWvjK7y2R1b8i1J/QVz5hHGmrzpF+UqNRofntclsZchGfzucnplo1E/AS4JEbVfgwuIm5XV46a6tmKcSPAk8uhLK3AKThY94WZ86ahCZRIo9pYneKuR7xCNoW6uXj0iUPaZXgrZ1RV3qcASrKz5PUS/7a/S8ngsoZKmRgwA1NiTiRvfRyvSEXifmcevYgFJi9yVvmpWp6ql5cRLEChNeSJvaVchm9t4WYCW7arenhHzDlgH4L8vFdsmUWlzr0X2eHx4Z6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26Ex6Ongx70IwjUTLvB2a0XSXMQiCbu7in7fAZmqtE4=;
 b=BmvW64/gf8wlPK7Nq8Z4GK0RcKqqVlFgigPFyp9rABvPeICQLTk3rFEBHsjJWo1MhanP2YTP8lTgl+8c0w3LbZ3yQSAPGo5jV1VL4DUI2ez92sFH53X/Cc+1XynJ7djZVdf5vTsUQfBLC/tXTi4ZEqVmxRfTcBg2XZI75/FYbHNVvBgp1lr47aG5xYL3PDZKsKKFvwaa8g0FLW9DL5IRGOeznGPsgTNaPweAgH2h07xRlFUh6NEohyRhpq8m4GpFk4uQMsVpQJY2K3SW7cU+0VQTkb2g4uezYe+n3ygf77d1MvOG88FW/GI1yRlkPD/CuHWviFWq8KLp5QVjBsZxBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6850.namprd12.prod.outlook.com (2603:10b6:303:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 03:10:08 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:10:08 +0000
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
Subject: [PATCH v11 10/22] gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
Date: Fri, 29 May 2026 20:09:41 -0700
Message-ID: <20260530030953.740561-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0049.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: 602ff0b4-7f0f-4604-fbba-08debdf8f418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Dtg7MX79OAe1qT8vdB7LJFCjXNBsEBp7G7CfRq/r288HIBiCrGH//yu7Kqoymme8AWOhY7RTKg45dej58w+ShyGiagL12yDfEMhfD0sODIZnCU1/4AKASChsi+nWWS3yjVVyH+QBpWUOpZ+Igz6MLoFzWYpYtNJwrtBttyNKSrBa47M0gPypW9JDXmETC76sfrH0ayQUG2CkTUA+sZ+oi4MbRVFStjJlSEFHznr1y3+38w4NZ0IEqbObwMrCQQHXx9hDglw4MqnWP5hBb8/oNsIORjfzLQBW8hEAodgkW+ILlbzUmQ7OmNE3Arty7Vs+HYlflMNSy2psrAzkPxHjGQNTQuxdm0dECZcJgsWmpSbGNJx1nPgCvjluyighmpPxf4900b+AOjiqcsLu0vwU3eggsgFs0b0EyN0prB/zElJAooHpbiHuJBfpnX001rCDRJlxmG4x5yELl+NhRgPcMSnaFkkbdIOjHY+TUA4juPZ1fzZkwUcBb0QrqX2zRs+qHkL6YMXLX6QNhClg+N7zti2Ae38sg5rQ88iHfkpb4qQMd+vSTrrl2a8ew2SkD3CMrVhaCMtUB9I7ndTahqHSiaQWUmLrKczQhcPsYvdgVxW/Hw2le2ptoiwbG/Jl90OjpppbaYVXieQzP69GB1z2Ljys/CMijfAXEHYpkFcmNavZOAD68hYtey8eOmhqk+TJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CUVFhGAEvvXv5EB751DCAS1/wpc+y58osimWyjd3bMlWm6Hy+HhbWXRtbhxB?=
 =?us-ascii?Q?zqpyJuVGX21tr0NPlKA2mKvbb9Q48t6LDJfKw3k8gCqSw7cJrKBgvOXVmJZx?=
 =?us-ascii?Q?Jai4Z7bZ5Ky0/1hSi88YEXRifyRhNkVTLzoFTwj9m+m9NNlq6wcbvdZGO0xl?=
 =?us-ascii?Q?kAmR5lutaI+4BuOm3u3zjXvRETmUXH46LPBo2VrTAb+EzJjRGNnOoN8iMwYg?=
 =?us-ascii?Q?LDPEyz15GthimUcJNCSv634NbaZhlUlRyKtm+y0n6Mgm9qMK/6sSujo5Hy0o?=
 =?us-ascii?Q?t5QF0Ii6I+CcQp40mERlv067QVkK4hkgUeAyxJHwyFZRP4ev4G0myMhXg4Qm?=
 =?us-ascii?Q?jtC2rtPRqbqRovOBLyUusR8HSfMZ/ajmGoCEz6tSIJgAF+3KSUb2eim1ji9V?=
 =?us-ascii?Q?MBAtNGnEbixgVNSnDiaUgYSu7ximzYWKHCKGe8LozV5NdNWKFtsD7UCxOkqN?=
 =?us-ascii?Q?3d9gaCjpH5zqzbuqVp9vVjCBpsecT2wLVqzztAuvj6+tNsAlNzjDuxB7n/V5?=
 =?us-ascii?Q?sVazybzr+9DC/hTFJq5KbwAKSwpccFG0sWJyJP4sZFLYgM5OQAh7bLK+Rj5C?=
 =?us-ascii?Q?ekSnhIG0kKp25yOYpJH86YtEe8K3RyN44t4uMbQwTeSyL8tC3BWwtX31u3R0?=
 =?us-ascii?Q?DznQt3bwj2mlBYmlQ+iEJFk/jXh37GG1tafqhdM5vkkVR8nFUl/KMy01WVfL?=
 =?us-ascii?Q?gppSlxuM1giLYIsQGrpsbVxVqOR06ble9sbwoE6UJVbJuweIuowHhKOznU7g?=
 =?us-ascii?Q?BlCOOBvnrHxGWQ44aoVhJfgpfkIqrznULUS5yRGrcSlhDnBMvCFOS4OQLJnR?=
 =?us-ascii?Q?oeU5F0/wkZVDpspP+97ZK0FK87QuPkaSGTz7dnhivtxbgN1ml2k8mf7jQCvk?=
 =?us-ascii?Q?7ICK85q8CvgenyEYZZX+bovZrKpJSWHfZJYxCUyYgKJO1GLb9BY69tKMx+PY?=
 =?us-ascii?Q?vQkv6iJKTGNMImOqU3NmhqIKQ9zSVvch2Gex5rprKAuLmNATUAXRpq4IhOts?=
 =?us-ascii?Q?OTF85hxjTcsdGaNnIGN7V5lQyCLCv7W5hr8OIqBmTm+osvTYFwL84nUb9rfr?=
 =?us-ascii?Q?mjycqE3a1B7Zf3vobgDXnWItDagka6Nn8IgBeNSfMoS9daYtxx4iVqItsPoH?=
 =?us-ascii?Q?mY62hOY2IfgxZDp1bbEuWIvTPGIA4QvHiOvdz4dH8QRnwfS/zWRlQNQccJ9w?=
 =?us-ascii?Q?oFxjrphXbhMfDa2ro3IDJLf0WgUe59adw8ftNeyYg0vyaZnEugzyxRcrCJG7?=
 =?us-ascii?Q?AmkzdMzlOR5LWe0IGaWFXzj16kMGY/RiSNWtW8ea9FEn1+Hbpc4DpFXwZaYK?=
 =?us-ascii?Q?wxDMqIvDoE5RC+R6yH/UGM6urAmNh65B3VE1UQpYySOPOt2uOgj3XmVIi3sP?=
 =?us-ascii?Q?ttS/bbuKvWbfZjDnRlO3Y9QHFMNk9zwzkCozPcQKS8liva+QXFlBaZWinsEH?=
 =?us-ascii?Q?cp0/hl3VfN9bicXD0mqYH03pTcugtGIzNbpd2Mcsth2slKi7HguD/xQ97G+g?=
 =?us-ascii?Q?ew74oMFuYtpD/TQ7aqlQcotKAjmmF1PzSZVR34aFjfdn+bcj+oth1Lz/vxqg?=
 =?us-ascii?Q?ROv3bePXEdt+vZx3LNWJOw/jUbt4NTCWijcFl6+2J5Rp3fAoVLbyC/gLJ2s9?=
 =?us-ascii?Q?1CAR9X2Etsp0LQEiv700A/49wkY8NWlqu5GtuNaAGPGSyvgwUT18zALR/Wzt?=
 =?us-ascii?Q?BRZ1VLWBl2K2TdHbLE6K6lzJqDgSfQ1TczT+hbvlkygAGQoZQNkud4E/ta4V?=
 =?us-ascii?Q?nuWwZSF+kA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 602ff0b4-7f0f-4604-fbba-08debdf8f418
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:10:07.9576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++M4OA61ndtGaog6sXzM1kouc9DXD66aYybv4JKQAI2uElrmw2Lj/PgxVSaa84zehoMLHgw3IInm40Yhsz3shg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6850

Add the FSP (Firmware System Processor) falcon engine type that will
handle secure boot and Chain of Trust operations on Hopper and Blackwell
architectures.

The FSP falcon replaces SEC2's role in the boot sequence for these newer
architectures. This initial stub just defines the falcon type and its
base address.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs        |  1 +
 drivers/gpu/nova-core/falcon/fsp.rs    | 28 ++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/hal/gh100.rs |  7 +++++--
 3 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 24cc2c26e28d..053ce5bea6cd 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -40,6 +40,7 @@
     regs,
 };
 
+pub(crate) mod fsp;
 pub(crate) mod gsp;
 mod hal;
 pub(crate) mod sec2;
diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
new file mode 100644
index 000000000000..73fb73cb73a5
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! FSP (Firmware System Processor) falcon engine for Hopper/Blackwell GPUs.
+//!
+//! The FSP falcon handles secure boot and Chain of Trust operations
+//! on Hopper and Blackwell architectures, replacing SEC2's role.
+
+use kernel::io::register::RegisterBase;
+
+use crate::falcon::{
+    FalconEngine,
+    PFalcon2Base,
+    PFalconBase, //
+};
+
+/// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
+pub(crate) struct Fsp(());
+
+impl RegisterBase<PFalconBase> for Fsp {
+    const BASE: usize = 0x8f2000;
+}
+
+impl RegisterBase<PFalcon2Base> for Fsp {
+    const BASE: usize = 0x8f3000;
+}
+
+impl FalconEngine for Fsp {}
diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index 9a4bb22578b3..fe2689764c8d 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -11,6 +11,7 @@
 use crate::{
     driver::Bar0,
     falcon::{
+        fsp::Fsp as FspEngine,
         gsp::Gsp as GspEngine,
         sec2::Sec2,
         Falcon, //
@@ -35,14 +36,16 @@ impl GspHal for Gh100 {
     fn boot<'a>(
         &self,
         _gsp: &'a Gsp,
-        _dev: &'a device::Device<device::Bound>,
+        dev: &'a device::Device<device::Bound>,
         _bar: &'a Bar0,
-        _chipset: Chipset,
+        chipset: Chipset,
         _fb_layout: &FbLayout,
         _wpr_meta: &Coherent<GspFwWprMeta>,
         _gsp_falcon: &'a Falcon<GspEngine>,
         _sec2_falcon: &'a Falcon<Sec2>,
     ) -> Result<BootUnloadGuard<'a>> {
+        let _fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
+
         Err(ENOTSUPP)
     }
 }
-- 
2.54.0

