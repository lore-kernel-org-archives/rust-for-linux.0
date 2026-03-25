Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011000.outbound.protection.outlook.com [52.101.52.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00ED2EA48F;
	Wed, 25 Mar 2026 03:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410793; cv=fail; b=ihx9gevzP6G8pR+D3Ul2v7Hs7cD8e4EUwi8TJFHxt4nws/+OgpphX8FyDlgyQFeIT1MjMS4hg7SvlqzwAf4HIfwcEO6w4ioTmDqp7gzSTC2MDQjM3pVsDBFp4GRiV75IiY7YjL39/gf36rcmPdZkZUCTvJr2oquqHhKF34fHm6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410793; c=relaxed/simple;
	bh=fxqd4ZTTV2R51MpsuEB5IBfkx8+0QF8HzAhfznDSQ80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aZusis9Rov/QWVV/Kg+2143yu4OJs7w/5H/o460wRV4/sCdViRSnVpJA8GkBRx18dJsjds3+5TQo/n1GejzCrFlNIXPbJAkg/upHlwz4Ajw6DlWl7KAS0B3UUKhWEgDrcVx8+652lAvyrOdTjyfl/KXtmcJdvf5gzMrkn4AxM2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NVLgVGQo; arc=fail smtp.client-ip=52.101.52.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NVLgVGQo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCFO3rPVk1VVY/tcEuD667fyKmdQTn7rQQHWi2JIAlC8Bqoo8hrQIWoMUe9qMJwcnErQqCm6OpVeDtZQMOM9AM3obemry+1bst0UF0Stu4XWdThfDRJ2tWgj+WIKqdK2Aa4WFyIjin1mv8TUwemLYLum8OUaJTV/22FV1kZCw8xTOKWU49R9u0Bz+pV9WNaV5BMUS1TYg+aOVuC+bUboGJhAyAuqBkHLgYCHSZztVr4wr7RByezBlOTvYYxnKdAEPqmuW81L16wywIuyOwDxQTPUjqJsiR78AZ2LPaqgd/A7pPTb2tXtzMMd3ouN2kwRMwD5pCechHMg83VKuNh2Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGFybaBoug+2z4WYbwm0MNrHGEH8QQiSLiv+uCf/dyU=;
 b=cuwI6SKzKP4AOccUU6Rt/ViSgE+B3YJCOAOZm8xrKXLkGudu77O9j7l/CXwBozWQTY++5aFcWMGT3GYODT0+ojwX9xFz3NQrCdpW69f0m/HNODch+HoMJaLjQ9no/OrkB0qwV6KqqvOSlbHchAGhypPgs3N6m9lpgyRaeCcMJR/cY1VeeqrV1DQaLl1y581oJ0WjChtc+OXg5baxtaCxcugYFCQCxrKKcV1m2BHaQgYi0s5U4cifvW4TBVOpHgiJHuv0ltWAWlSQWleC/UGryGT6dK5PuWSIomFDjAzPKnnX0ZLiY+2Z9SQIcu6ET3BXEqxE9pIUquX6yCQvaY31PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGFybaBoug+2z4WYbwm0MNrHGEH8QQiSLiv+uCf/dyU=;
 b=NVLgVGQor2pHiMmS2NRT2c4/o4EA7I7H/qa1LX+DV64Ood7YWG2CH8HcMClVlWKV+5eDdbRDtyAhHJiFtA1piTxLiY8WQOvbYIb9E5/VITrR0r8rpOlbj63k+/ItcPTaJ5Lkza/JdrOp1fubsduFcfKu2GzgQC1Ne8Bg7k1jsu4aOoXuns44VxdnGy9R2GzkCYshhq9X4jfv85DFLzizALPeenM1NTORDhBe9zELXnCgm7W1R+j3yyPBi2SqSpKysUiQD6pu8ay8rYSreDLLWr0jhqLgCCwNwg70bUuQKQICp7ZwclxjrgxZBk2HN6msCZypYyqwTTs53S3klPTDlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB7441.namprd12.prod.outlook.com (2603:10b6:806:2b9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:52:52 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:52:52 +0000
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
Subject: [PATCH v8 06/31] gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting
Date: Tue, 24 Mar 2026 20:52:17 -0700
Message-ID: <20260325035242.368661-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee889ee-2823-4b4c-6e58-08de8a21fd36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	NBVHLMyfoa4/SVnuc+QVxctpwdyXbvYrDcErXyC7jZE8RsD7K106oDrxULOLBJXP+W3xjIx9V5FOHRRoZIJSa5nrp26m0de9q4akMVkoUjMD6HcbIHtoD9kvpNC2vRVT+VL3Y+yNLQNls0xXKqyWTZrxpQoRAmbgzVV6dYlWqja8UDB/rOlgiG4YyVc1wG0tx+D3I0WX/Bw4uZf4k7i5hlz2M7dPvJ4SF6T+uzpi5nwSHxpW1upaP+QpMSHEFr9i8LuTU6iljDW4b/yEez2zRoXwRPkensAHdDYEI4S0vwDnIasGMbmndR47ElGJT7eMX4wrIqgCNcHTUC4K8O51BgJJRULOrgpws61dQck+QVqbDUEDu9Qlleg3aqsb7ECbnS6n2zI+X4QQmVf9Bwnq0FdacQ5P2I3pZGdT7jnu2qdKVUK6q6XE0yWiK1SKCu5K7FRGZu4SmuKBfoPdOeo9QyAz861X5YKkvSjtp4OIj7c7xk7O4BeWT+pzGE2wehDG74R82VliUj9wRwP4Bje5vrJpGn7D45yexVXE2XwKEam+Y2jJbTjmZsg0vxdgQFwrS5nm93/heBBVftXlu5MX6fyxYnfSnjWyGvgff+jHlqwhyt6mR2GtI7SV1o3PvTlvRRvYR27aT8wa2gXocp8V6woIaAUmWmaLC800bJe548i61ICMVFW6ypBVQrHk0eDOfwtLuIne/rWP9InAEnrRJUGO2yLzdm1Y++QCzyceuVU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fikV26JqCglLMXDshuK4K5un5xf0UUcHMuhzSQtoQI+lX+uSbWvJO2hOaC+3?=
 =?us-ascii?Q?hw6QoPFK8Ghz/nE7SNq+Wk9n/TG+VcZna9myxENxvXCuaVfteDxqtNpBnqsj?=
 =?us-ascii?Q?O1S/WYkQ4tqLrq1ir8R1u4JgBWuM//PiZ+hmwWw1aAxCRmeVbql6tUKK8e4E?=
 =?us-ascii?Q?uDiw2GnlZmq26AUWhCPPpDpkXsoUeyUyQtiggaAVZsE/SfX46/az5eOc9UqY?=
 =?us-ascii?Q?ZYloSBFm2BT0VYWTNN2AEVlFT/wdVUqYiIZX1W4JiKL31Ae1IXVbbdmcHisP?=
 =?us-ascii?Q?uz23ziaU8Z+QQcJhqhus9ZaxuOEyg5U7FR3/aAiphlP1a8j7ItsZqu2YZsHN?=
 =?us-ascii?Q?QVX4vXOfbJc225gZPKTr5UwrbIP7bCg6Zi32yem/WK+pPFveX7+o47BX1qwt?=
 =?us-ascii?Q?9YHECbVqzvl1o81mEPqoiBQrtfTa2+MiG/g7QUX8DGPETVfDLxBUmfUwI3x0?=
 =?us-ascii?Q?w+1UgCBwsAqH68J6+1Oj+3f1oK/fdN+tcINXWDMPO2IMC7nmEGMnOr+QfOjQ?=
 =?us-ascii?Q?3kL6VCfMJ9QR2JHDUfPLbFdQTIgPVUvYPqGESulP+ceGGaSJdlhl/lg6UeBA?=
 =?us-ascii?Q?+//ZTPiEsyK+9yFEI67epDfHkoF3neQtAN6zQlf9y6C432yEkF4QaI/JbNjS?=
 =?us-ascii?Q?KKeIkHkKJCIBxlsBarHr/cvjhmWLVBzXwHUsBsukFk2BMaN8l0+Eei2eqXmv?=
 =?us-ascii?Q?FTek4CpQ0sN/4dObeJddUdDcPQH/ho92IQfhnB/MVCT99jMz2PHaxGPLpGH+?=
 =?us-ascii?Q?crWwfLinGBgYAFl9bpXA1qVwhY9si+ORHK3ysud9kUpRGp0BJ2C/Pdf6Mm7/?=
 =?us-ascii?Q?VIw+R0/xtVVea3u693Skp6wgic6f3AV0zpOV66IJIRNvjCEMyNIiNUARCXHZ?=
 =?us-ascii?Q?6jpjk37IfLTGaEJ42ZB2Xs4hP1S25lCe1NazUHwsA5GqRyb71MQKIjdVWyTB?=
 =?us-ascii?Q?ElDTU1DRugS9IdBwTzZDelWitUAEPFNo+xsNPwiVaxkFryQApWGHE7Lv+UIE?=
 =?us-ascii?Q?yb+/+1RYp05eVzYY0luWncOpohySfV5io6dd6Assl8IqMEN8p0bf6YQFG7Ef?=
 =?us-ascii?Q?9d4xdLKs+pfmTdtJ3mrTzU9CtDee0QXF9HzH3+BMqGOu3c7BSltfG8+4xeEy?=
 =?us-ascii?Q?lfrR89BrVmKUbCwWkuP50Jbujwx9QdC60ICiz36psnd3qbN8JIWHDM6F8zo9?=
 =?us-ascii?Q?1eZq7AZ6kpXvhpIDtSlG9GZ8hzV6GIlZYsyxNiWOApcYae+qslY3kiQOELdw?=
 =?us-ascii?Q?01syhg0IZyUWywjUHmZWWQJBlsJYKmLbkiZnk6L3LoWQ7MzVjkoh+U6S8sn7?=
 =?us-ascii?Q?C4EJNRHUC0MwXnmZ9lB5jKW/nK6X7GkunhYK8YkUmq5xX3E8o4n+HxAWjQmw?=
 =?us-ascii?Q?S4KyxbLW5vcVt18fYDjiczcyJQYh/+c+NJFamWcZjY0NU+vt5XrEHaC5fkJM?=
 =?us-ascii?Q?Yl0uzZcVbU5JtW1SckgiP2+Gha3OKd9RKVBj0MuKaRHxiBDR3Mm0BC4Mx1Wv?=
 =?us-ascii?Q?3aXYJempSDajYOvl2mgfrTSZXL7XEUiu3kewXFWsMlSZyunKxheky2Hz0+aV?=
 =?us-ascii?Q?Wsj36w/1auYjBSE89oZ6K1lPKvMHOnLPtiDFBlM4+YBqI9gE7lOc1Yi/fDoz?=
 =?us-ascii?Q?Gy102vU/0sUzhYeLNLEM66GD7hwnOENq82nZ+I2gfLBCrjf7Vp594C0jN8P8?=
 =?us-ascii?Q?acDGxH3CK9qsaACxXku1qkSb2Z1JyNbpfyogPj+NaeD8SQWHGqbvo/HOMfct?=
 =?us-ascii?Q?TcJ1cjsh8A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee889ee-2823-4b4c-6e58-08de8a21fd36
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:52:52.1870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wsHg7Q8IdKqgTIJY/JcLgedloYImXPvlxr+GRfRVZT//eC5+IdWSCrV3FZ9Y1on7tjjZ7/M8LdKur1JVkSi6yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7441

Hopper and Blackwell GPUs use FSP-based secure boot and do not
require waiting for GFW_BOOT completion. Move the GFW_BOOT wait
into a GPU HAL so the decision and the wait both live in the HAL.

Pre-Hopper families (Tu102 HAL) wait for GFW_BOOT completion.
Hopper and later (Gh100 HAL) skip it and boot via FSP instead.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs     |  6 +++--
 drivers/gpu/nova-core/gpu/hal.rs | 42 ++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gpu/hal.rs

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index e7c3860cfb28..5cef5b29cd3f 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -18,11 +18,12 @@
         Falcon, //
     },
     fb::SysmemFlush,
-    gfw,
     gsp::Gsp,
     regs,
 };
 
+mod hal;
+
 macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
     {
@@ -309,10 +310,11 @@ pub(crate) fn new<'a>(
         spec: Spec,
     ) -> impl PinInit<Self, Error> + 'a {
         let chipset = spec.chipset();
+        let hal = hal::gpu_hal(chipset);
 
         try_pin_init!(Self {
             _: {
-                gfw::wait_gfw_boot_completion(bar)
+                hal.wait_gfw_boot_completion(bar)
                     .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
             },
 
diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gpu/hal.rs
new file mode 100644
index 000000000000..2f9e18e67a35
--- /dev/null
+++ b/drivers/gpu/nova-core/gpu/hal.rs
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    gfw,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
+};
+
+pub(crate) trait GpuHal {
+    /// Waits for GFW_BOOT completion if required by this hardware family.
+    fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result;
+}
+
+struct Tu102;
+struct Gh100;
+
+impl GpuHal for Tu102 {
+    fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result {
+        gfw::wait_gfw_boot_completion(bar)
+    }
+}
+
+impl GpuHal for Gh100 {
+    fn wait_gfw_boot_completion(&self, _bar: &Bar0) -> Result {
+        Ok(())
+    }
+}
+
+const TU102: Tu102 = Tu102;
+const GH100: Gh100 = Gh100;
+
+pub(super) fn gpu_hal(chipset: Chipset) -> &'static dyn GpuHal {
+    match chipset.arch() {
+        Architecture::Turing | Architecture::Ampere | Architecture::Ada => &TU102,
+        Architecture::Hopper | Architecture::Blackwell => &GH100,
+    }
+}
-- 
2.53.0

