Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010071.outbound.protection.outlook.com [52.101.85.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A653451CF;
	Sat, 30 May 2026 03:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110631; cv=fail; b=NXtjqmOJKizdVIR/BH7Ria1B3sQWdTwMQpfXRupx0K/2hWspdhtzjMyi2NjM2NgSdKcc3eD8I1lRInJ9XjwVZ6wq+W+K7T/wvNQyXT2PZNidflFA13CSnRXxqcbtsTNlbhQtkeFK1c+HmcrDDLVoNOKnznt7/5aQYb++DBXlHPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110631; c=relaxed/simple;
	bh=3LpJGQo8GR2Ljf9awG/86+L4AiqjesRwZ8v5UXa/oqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DOEaYLVtaoVDQ3JucTYfTd1bBYYRsOLQcdo8ghVRi/+RMd84uq5hLrpytKQ6fcFpbuzb5kmpokchpWfwnBL+yt96E2+OhmoqAtRRqNCWs2O9HJ3LW7PPXfo4nd+Cv2m2IFwyeAbAAXYHnD0Dq7JHS9AjB2BRu2nT6yESFYsKIKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EBFSNbEm; arc=fail smtp.client-ip=52.101.85.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EBFSNbEm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLvSKj0vLNQUO0dywbVigqNWCoDIGKme4Q+lZoy1/BSG/caycKMGpnjGrBB3xZurfkSVwtoR85vpJbrNQ3u6nhHMKtfIRVNVg/v66kUDQShJkU8ke0bkc/FpS9tn5TF27H2kNThZmV0rxvDSYyAodYgewUeXWE9WsTXep1ACIIi2NSixSl8kfxpLujo9jWNqdRXkRnrw/J2SraejnWxcBZw+ml/6DJYz3HIffZD4JCy2GZVsu7wK04KRd4SgaxxrO361Exu6VwOZ14GCoonRbstoyjZ3eYmAlkVNjBMJZUykH4Y6K5koCm4wMHKrpXkD0NgF7HIJDtVO0zyoPOAgLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ph3vg6nbl8q4a3nns5+4SQUy8KMrzn+gbKOeJqCjgjo=;
 b=HgbE0bYEXDf9IpWcajwQMmFeHitLCmDR70vtouVQOluIXxGTZroQE4XHAYseclpP/7oAze/ry+kQNyraOf6it0MeXFfKYdU30BNF0h6G38GNLEVkvDaxpD5qsR3Q+9s12JSVK8Lhqa6dhkMLQD4gCauj4V4wAyEIBwAv9KRk/N0/73dEdqh8+LbUHx/1NZQ1+DBXMXDaCmebei30LhEVbxKQP9my9lfV0drqw+1cwiFUSjf4l1FwS6Ocwm/DeqROx11IAIK7HZRmHK8aRJY2LlCGhfeAfzoukVhZv2AX50OQ+CDn1sLio4ObKKASJdGH81xySZ8hMwDnVr0mbHQDvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ph3vg6nbl8q4a3nns5+4SQUy8KMrzn+gbKOeJqCjgjo=;
 b=EBFSNbEmya75z/7Z+TWkdz8RV/iS8Rnygt0TmLYMInPiK5BAfcgTDjDmcRtf07sOzbXmrdLfXlZHUr3tr/oco04PcIDxEx5RjgUB/gQ4kB0rkQMYGEDRTr53C/T71HFqPHfvVUmEP9RIdgMF4Be7RwrBUCrudVsys4O4u+LwvWrZbW8WfQGaDfCugSaquM2tCXu9qTkidSfDoS+MYScQ8A/z35DVe4noOB2mV/J6BsWJ3FQPwmd9K58Rks9ODf+Zkome6KKVyb6YbMwJkecWkucRAybStg7Uejio8DoTCeKY+IkOsIUPS+WuMK/j80IhxX1wLDwYflx3ky6Tl3CFqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6850.namprd12.prod.outlook.com (2603:10b6:303:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 03:10:09 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:10:09 +0000
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
Subject: [PATCH v11 11/22] gpu: nova-core: Hopper/Blackwell: add FMC firmware image
Date: Fri, 29 May 2026 20:09:42 -0700
Message-ID: <20260530030953.740561-12-jhubbard@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4b2f2cc3-6252-4dd0-e558-08debdf8f4c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gilAF9Mx5ZXo+r4ZQRMIDOZ3dG4aW08ik3yiA+4HgpT4Wq/aFU3f2BzX2kmMpRh7XlzgcmwUBPvPXzRKodzVYlT6kPq4CBvDY/blXPkuWT4OzruXAWsK39SX+LdQIDnq9fkm0NfhuDLyRU4Kuavw0ueRP2Dt2qk15LpDqjQITxZlUzmC6x5gKTcuX7Fj0mC/cy5TcTj2VOoyO8HHtiQh0zz9EVEY1MuCEaRZ9qeJLNkhbW7MgDJvMflbwo7Lqmi8UdsgWqTOLSSNrQIGkpeINmdICMdGvP13YeSYV+xsFXYMoxjgCH5qckHdGZG6Z/QqQXLFBNGL3wzrQUv33hvH1n9jJym+O6ltUdkVFHQ3sYVjpbiH1YsrpQODQnwZXXS5tJ3Mq/+wySiMyJ+oVXw35/pKF7ZWO001AUoptgwoN7jTODJzw89P0cliukvLaFWdJzmbJji6uuqx3Om+GvmdhBAcjGCbQcngjbuoCI00qPo9jFcjQFAZWR5t3gqizDNg5SXgR8WZR4K4Vzg7gegMOWporFoRTL9Fu1xfAwebZ0b9cORsVQu9OZNww0JPyZjDZx3feVUJHtS6ifMjjPvdNN6KSG6tndK+cNQJfYGKQ1loP9HAH7BRBHISWbt/ncLOcDjo7jIG2rqiquVAulRUgvI3lSN7gl8DJDMJ2d2H5txgYzrm0ryUZGVWt2pPATOi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2YMEqpOUM+zl79dEYjuMYTVGUewU8hc2pNriqrOwM69mW6oMZ0M4adcgJPhK?=
 =?us-ascii?Q?hy3pkYIhWxMoDq03jyguecIpDAZA8n5F0T49TYPLd+9NDfVH/1KIqZ6+SKSA?=
 =?us-ascii?Q?lwxOcZriE1rfbQoiabPnp7bsfdLuxXiub3eRillneUKP+LDEEdS4qXuSFbUR?=
 =?us-ascii?Q?VPsTSEzdFNmDp36Q9iGrtDGkvSQP0UCZaOkIRLSkOnVj3kRN9Aq2lFvLK+KI?=
 =?us-ascii?Q?uld4sVpXgS/fKFVSUN4G7HUajO3N5nTcRV8K1a2x5rtvQxo1WyCQJAbns//B?=
 =?us-ascii?Q?BRfWmmPDtVX99aJcXpy+y8UFMuNtIYpInjm97Q+MmTgZ6xaSTtfJsO8vtp3O?=
 =?us-ascii?Q?7CECqpZVXGU3vuwSKpZAxoPFRU/k2vo3aeiTfRVE++MoPYA0EySt4fdAofpj?=
 =?us-ascii?Q?zakPfieJBxCoYnt1HAGdFrsD+97YPf0XER9gnyPbjmuNn9hHg8jQ77eeIGhb?=
 =?us-ascii?Q?Rk404WhU/ka4G5yJF6HoJ/0RNKk01j4/c+KBacsOUF0k4YkysNKSAjJLVgw2?=
 =?us-ascii?Q?7fSv90OC4KWDAAO0IqUm2ARXnzS9aXl43fdNEzHoNWbPEIwsuFjt3cCF0dJT?=
 =?us-ascii?Q?uqKwLuX4vvpcyWfCEv0sAufpSEXk2oxPGH4IsRqEnHCRJ2ugwQZidDWAfBBW?=
 =?us-ascii?Q?F/9aS20yJd+kIa30QlqoIhQws7ZNNyCTei2RrvAbJRALc7sKojh+y/pisHZz?=
 =?us-ascii?Q?gzfod5oxlpofoigxOhK9H9V0VWinhNL9g5+xVcYzQyR6Pw0hkvH64S/lNBq0?=
 =?us-ascii?Q?G1p2tCCgWYEy/X1uOh2R2CQ785FR/LqwKp5q1icIkXJFPwm303pTSR5z3hir?=
 =?us-ascii?Q?vfn3/4Ehj+e1fvhrNiEdAzxnQ6SJmGevkZPQBGL2AvTjuo2yNdtxuBVydLHO?=
 =?us-ascii?Q?rJ7KIbB51MkgYjdW24DcGe6XWECOCibZaJkGbXiCW445auMS+4RJk2Lv1iYR?=
 =?us-ascii?Q?ZGBYwMYzVzST/JmtOln3end5eelVJcLQXT4K2zzXS0OVC+wvAFWIh2ehGSLL?=
 =?us-ascii?Q?/ly9eDyfKm47FGeHdX+bu0pdl7eFc2Bsw/nH9qqTeMWUT/LQgiZbU9Mul8Dq?=
 =?us-ascii?Q?BZF1kEsKOhdK3Aa9kj/EEjhRBz+X8w58WMbCDPsY3fougrX8LbsAOwGlf6qb?=
 =?us-ascii?Q?3CDsNLMMNRcbSEqfIOGcVJC3UCiEVbUIb+HPVAjH9o1fnO6oz7tTuw/fIoCf?=
 =?us-ascii?Q?acq7alFt5vDJnzOEuYx90ZZzx0OLuZAb53hY+X1xHB68QjvHj+0F8rDAlk/o?=
 =?us-ascii?Q?97zk9BL3+yqqxkFG10KDcmnRFXED2fnE5ViweDrDkbEncmB4ZFOUjVMwFTKb?=
 =?us-ascii?Q?a1FGZgzUcVuRJ/NSYSVlW3RNMC7ODBMiTa65IRJrlNWcskgY02PItTRxVX/q?=
 =?us-ascii?Q?ZYlgrQ8ulkumy8gIiC7FmPZvoflUf59F6DrFtDWlW9U6jFRYMXcC1j1zIF5y?=
 =?us-ascii?Q?dHze7WEL17t+Y4PTzp3d9yalb9BQ3sqOCpQGxARIXfa8gxz6J90oJQNt7Jlo?=
 =?us-ascii?Q?CV6uW00hL7O/r95HPInGJR+KPqT86lubqIWDpCNAnjf/gxafZmijUC9CtCOT?=
 =?us-ascii?Q?yVxX8YrO5BPcAUwN00IpJINK3vXPvWP1Ruwj9oEivJM6vM5sJOHH8Yy/2rsA?=
 =?us-ascii?Q?QBnR9ZF/6oYVzYF7DKcqemdJlS7NKihUZjjYUSC/baFBMGEz7Pw3NXZcH36/?=
 =?us-ascii?Q?m+U2x21ljayP1D+IksHcfdQehX/rcGj6KRnud2Tv9fmY4oC8AaBqm7vsXVUx?=
 =?us-ascii?Q?PHSAh4+VbA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2f2cc3-6252-4dd0-e558-08debdf8f4c2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:10:09.0561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2y4CrM1fd2RtohRikpEyrTQPB34sJneCYat0CdsHrG1IfJC2T6sS2MzVtCaeG9BbOh8lx80ZbjIehpKrrz01qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6850

FSP is the Falcon that runs FMC firmware on Hopper and Blackwell.
Load the FMC ELF in two forms: the image section that FSP boots from,
and the full Firmware object for later signature extraction during
Chain of Trust verification.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs      |  1 +
 drivers/gpu/nova-core/firmware/fsp.rs  | 47 ++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/hal/gh100.rs |  5 +++
 3 files changed, 53 insertions(+)
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 866bc9b3571e..6edb50b83a29 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -28,6 +28,7 @@
 };
 
 pub(crate) mod booter;
+pub(crate) mod fsp;
 pub(crate) mod fwsec;
 pub(crate) mod gsp;
 pub(crate) mod riscv;
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
new file mode 100644
index 000000000000..011be1e571c2
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! FSP is a hardware unit that runs FMC firmware.
+
+use kernel::{
+    device,
+    dma::Coherent,
+    firmware::Firmware,
+    prelude::*, //
+};
+
+use crate::{
+    firmware::elf,
+    gpu::Chipset, //
+};
+
+pub(crate) struct FspFirmware {
+    /// FMC firmware image data (only the "image" ELF section).
+    #[expect(dead_code)]
+    pub(crate) fmc_image: Coherent<[u8]>,
+    /// Full FMC ELF for signature extraction.
+    #[expect(dead_code)]
+    pub(crate) fmc_elf: Firmware,
+}
+
+impl FspFirmware {
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &str,
+    ) -> Result<Self> {
+        let fw = super::request_firmware(dev, chipset, "fmc", ver)?;
+
+        // FSP expects only the "image" section, not the entire ELF file.
+        let fmc_image_data = elf::elf_section(fw.data(), "image").ok_or_else(|| {
+            dev_err!(dev, "FMC ELF file missing 'image' section\n");
+            EINVAL
+        })?;
+        let fmc_image = Coherent::from_slice(dev, fmc_image_data, GFP_KERNEL)?;
+
+        Ok(Self {
+            fmc_image,
+            fmc_elf: fw,
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index fe2689764c8d..c38d88bc42b0 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -17,6 +17,10 @@
         Falcon, //
     },
     fb::FbLayout,
+    firmware::{
+        fsp::FspFirmware,
+        FIRMWARE_VERSION, //
+    },
     gpu::Chipset,
     gsp::{
         boot::BootUnloadGuard,
@@ -45,6 +49,7 @@ fn boot<'a>(
         _sec2_falcon: &'a Falcon<Sec2>,
     ) -> Result<BootUnloadGuard<'a>> {
         let _fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
+        let _fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
 
         Err(ENOTSUPP)
     }
-- 
2.54.0

