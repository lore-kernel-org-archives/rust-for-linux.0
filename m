Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B387B33A9F3;
	Sat, 31 Jan 2026 00:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769820997; cv=fail; b=tYE71dkbtAr0RNXC4V5vIlOxGft3Qjg2QJwfigzT0vmuGAzLEyem1icoZ1o1xd2vecAR/PNWdpa4mAWRYCd1y8Ma6zv6LkbEqiuLF21wiKdoZTzEK2iwi6GEH1EGdYl2mY5z+P5mnihWtVpa9exCU8ypmAYD9Krp7tABlBeel+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769820997; c=relaxed/simple;
	bh=YpqpMGz+EW3xIJY26BGDXnsS3PguYQ5eIZhH94S8Fok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KG7Ijwcs14wyU6rNjdOov1xuEDhdT9pzGjJBlSQnFlT12px/nxret6PglW0Dtm4iTN9V8cXUQ8batzoImCBANplnMl8D1QAKntu0mWB4bRC4Sw3KfZZXetK0p9LYvYuNZbnMAp5zYYr5tdIkgTJ/RqCD63bHMnfl2wwv6gReruY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bG8g6eXZ; arc=fail smtp.client-ip=52.101.61.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bG8g6eXZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rggx7LoZg6XpFjfhvv5dtWAcNio0oN3bU/8cFdFKgLEUIujPFqincwCZNOgoqqCJe3qmCn/pkxXA9AYlbMrKes5l/i/MW6Zz+gxgL0D3lydWGuKqCoBXABk/P/BSUeet9rbVUtkGvslXMA/THIoIL/brYRB6DUDr4NDSK7JQ5uE0zbWzQdw2H+TipTI+XxbYbyju/DEBwXHsio3LHTBUj6FiV47C1o7jXvO+dynQx6/yBlI4a4rRq8qkup/LXV5YwNATptWZ+5uUDrPMs0rfH3Zx/9WokQ6u6zMpSoKp8/cCMCiz88zQOfdwrvPWUYArs66HCZojce4SzG5baIXlKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2edp034a+EUK+eClxDHd93Lzef/3IRqi+K1pIlnAB0=;
 b=VzJXGNSXfLqLTyuxk8Gh/FHcQlqtSIDCuLH9q8EeUkrZ8aHubTh5yyn7+mXrlhcxKe2+iOdkjLz2C6pPnYyJE0CKo3CW8/y2c98l3IS9VftrHVGNlqkCkSuA+BrSxJXErK6aVTErAhgJy83AXlSUU0Wj/0iWzeDBTmrnHBv/LLfVjOEbznAQtCEMk2dqhosOsZsF1QzFDZoQLWhXvgD9O2gLqHXRkbuBfqc78s1ZZ+G0g1VXWpMdVk5cfE9jNjzZ/KDi82tbkHWQLMwNPRHZeIwKkPYJqcRehR6l0PVX862sxZjXFGmAB3M4QDsITdwQ/YF6i/eunNGKqjzO71FJGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2edp034a+EUK+eClxDHd93Lzef/3IRqi+K1pIlnAB0=;
 b=bG8g6eXZjmEkZfeAj3b7RpTVFbLzByTg2TvjnMwO547CeeZlk+FVUFYI3LNAmnYy7W4XamNn56YnCLJIqkW/yU/SejHPV4e0qG885M2uSSgl/k05vxLHY6NQIPR2LXdcJkFPgTVfZrSthTF8JV0YYTx+oB4LI/YUU+Uvlhxag67wjTmRWCQ97apahMAv9XkLeSDhGIecFchGg1vSIjPu609pLlQ7/SyvySY+AM91a1VCMRs7QnW1iqNfVbY+S3PixdV4MH02VPsVyY5dTBL3mgkHHKXtRJzNkwbHMps/i2IDK5hH5WQkuknrLt4Vsh5biBuNtpUbdTpTBLWvHdrEgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:27 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:27 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
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
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 14/30] gpu: nova-core: Hopper/Blackwell: add FMC firmware image, in support of FSP
Date: Fri, 30 Jan 2026 16:55:48 -0800
Message-ID: <20260131005604.454172-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::46) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: d68fc854-4e33-4e3f-a001-08de60639007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sG+IBqfrTlXzmZNj15wFdDLtEOfx57P2z69ROI/h84VQlyjPVrBpupk6+mXE?=
 =?us-ascii?Q?+YM3W0dQKEx2yX3W5QeAtujVbv7MsHhwB3fgTRmq1SpSJtNaYSJkfE4BA1C2?=
 =?us-ascii?Q?zHSQv3PFIYXKx+gN555Kx13ZvyX+mgDlJLApNFSzWDuYoA41eRttpRX7zyqY?=
 =?us-ascii?Q?ktYuMxPs4VHCNO2Q+fd9VohQ3VNU11KAA4UMMhw77tWXhm2HOuhkiY+SwgNq?=
 =?us-ascii?Q?OkTlOQQiQdusuwA5ttrnYpdR56FDAq3lcNoTmvvH9d+FaSBWGfxyplmnUTg8?=
 =?us-ascii?Q?D8OLRs366LTU6PL5TPO4ugImXRzi0Oo26wZRfld9C1PtnZXggTL5+zoh06xY?=
 =?us-ascii?Q?gJlqU7Lsw6zYIah7/Fvt2WC3FADLpXmw2zTnSH3INePLOOs2+eTVSGtcIs6l?=
 =?us-ascii?Q?+R2afI1t5E2Tc7GZjCTAtrp16MqELB2Q3Vjhv1nWCgaj8bkUWGtXNHL5/fVO?=
 =?us-ascii?Q?LlaqTIc0T5zVufA63x1bbU9BUGSRiBSVHScenyT+sBbcLDn8WZ2MSQ6aaovn?=
 =?us-ascii?Q?jy/b9IGOImaCsf1eX/F1fWIpck+gQfSsyaKiVnPo3euq5Nadz2A5XB+dMAai?=
 =?us-ascii?Q?ZrEaTRlv3H9vw8KCIbjtCw6yAsOnxav64A9MPaXF6Tf4Xi2Ob6GI+/x6hWBx?=
 =?us-ascii?Q?1j20YHgH1bGKM8RB92AsmAB3cwROBuMt0HVDa5ie944n5hkkW8MShe5e0QPu?=
 =?us-ascii?Q?45ugdJUPTOR95iqkxXxoNPF0oocZhpTJv92wR1f/yZbRKRiIW5FrxDHtQ5W5?=
 =?us-ascii?Q?0NOkzcp1c1KaTh6uUcJW21U0isP1cFspqN71+l32uVbukRaZDdW4zUNY7rBU?=
 =?us-ascii?Q?N1M+u6uj1rh6VpBpNHyP8if4OvAgfCwDtgUlP14Ja2OJCbmHVwZ1FbzpBy9E?=
 =?us-ascii?Q?ooq8yHbm23j9/LjFETQOTUYDUNf5am0gzk5BsQLNms245sgVUzPXH7/LdL4M?=
 =?us-ascii?Q?jto7f4urOQCzxyFPsqSY3p5w9QuFnSig3YzsHoLyM8Onm4fZlYpcAsPSHGkk?=
 =?us-ascii?Q?sgVW+x26gjLuX2FUJMnnXUHGAApBev8L1OYoCsmJ2oF+hGwpq2y7Q47Ki4/6?=
 =?us-ascii?Q?nZXut/HAxOpGXlBdWlFmibpG5QssEZxeKToS8RwRNlWRWsyDO+p3IvNsxdBW?=
 =?us-ascii?Q?gbdsM+UHj2dCJyUKEnUxBYM6TjvrtSAR5pDQzSSa1OSIwksEdso5eLyofK59?=
 =?us-ascii?Q?XvxnPrgja8DOz03eV54S0inytWlhydB3aGmoFmpt+N5aC6SivHLY4G03QsuX?=
 =?us-ascii?Q?wFhgkzU+WLt6O5NXHhzh99bDAoQjUenoKZgbxmk/a4ydfPsjX0hf+HIEbWbz?=
 =?us-ascii?Q?WT5oFy4OWp4OJrrhkrUg9Pb+EAv5rNhVeiwsBJBqnPp4aB/0zcsha5rz0lox?=
 =?us-ascii?Q?H2zLL6egkY+9ampubnteW4NG76u1X7QqgIUv3yX+ppy40Hwkg7i6CHk6QJLL?=
 =?us-ascii?Q?K29OS1eRZ+Yb9w7aVCeF1X/bkoD9ov2TSkahBKMNMdES4jMU1TTpGAa8AU8q?=
 =?us-ascii?Q?NVAlkDUZf/bMEZ1InY8er25yM1XPPT4gha7rkJEZHtvndq+5D+SMzCk8U352?=
 =?us-ascii?Q?NQ18u3U2VxPpGIITdTg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OSvKQxFo28DikiQix8yEMLQ1N/zsQO3Qn3Ktkn6mKX32Spzptv/+NAK1reYb?=
 =?us-ascii?Q?cmfF1n3+Waac0So7rUDcaoURGkB2wS2iBh769LmUfpbCJBYKHop9WRj82hcg?=
 =?us-ascii?Q?joWstaD/01EZMBOmgKRkahxaylq6Dfoo4o6S7g8XdbzhZIivIw3yWOGuPB5U?=
 =?us-ascii?Q?3HqF9zs+se2rGjlyDjRxOzzc7DNRaqy+xGwQ8621G+ZjuoE+nEfhVuXgAygU?=
 =?us-ascii?Q?PuQEGUN5rer73A7xOXjnAwAz1Gic8QFybjm8d3WD2v3fZmYDzgKDpih+Rejd?=
 =?us-ascii?Q?8MOeLl6oXAJRG+MTjZfV0NLqhTD5OBS6CpJEUWl+uyrywUqMBnXqtso+H0Tl?=
 =?us-ascii?Q?jNB0jM8u6G70k2axB2FK/W13Tik48ixaxdYxUFinULugEpbpFhnIMyCHgMav?=
 =?us-ascii?Q?rgqC5ZGsLnJYebHxSsfjEWgyVurxpWqx96Sz1G5MV3T5bZ4IGQcQoL8vR6sB?=
 =?us-ascii?Q?CncXhc2kMZGqvcht3lkE3XFM4HxFRSJ/9+VTV2mCQTtrWnChUy5DaZ8Gb/P9?=
 =?us-ascii?Q?kXualo2Dz6W6F0JYeiKn+5/FlObZJ3o38TpQaVqyKOygjntpUxKHKElLzT8u?=
 =?us-ascii?Q?IdfHD1rqf2RC0XAXoCuwOcGLJCXN4iEff/1pMh05rGnKrRO8OYpri6laikiF?=
 =?us-ascii?Q?SwxDEZm9QWW7uKsIW4ykRAw2UP7QZnZCr2wu8qvb+Xi26yFB1DrQD38EAXgW?=
 =?us-ascii?Q?fvrjxdyNxYatb6aYXgTHSU2RGvecEDfAeWpI1J78IFTo0iPn7GsdHvwPKLNF?=
 =?us-ascii?Q?5w48NfcP9LMVgO4Cn7nNfuG0szdWHF7VgUh2H0T/yjwwAaxDvwZq26FSeqL8?=
 =?us-ascii?Q?Yld4ff8UPxcddPJ4YglZtXXn65KzDHyHtYuDudTI5fXXoWZHu5GO8LVZ0XDa?=
 =?us-ascii?Q?XnZPLAL8egrOzV2bfaLrv3Xp/wrHvZeXBpJehsp2WU3xShg0P6PWbSC3N1Um?=
 =?us-ascii?Q?+PKmPM5qPg+kzPVjHPtx3RsP6NEmhbzcYMo9N+/55sM5EhlgQKgoU7BFRQN1?=
 =?us-ascii?Q?z8TC2BUlyauEawILvUWXlde45VFdup7k67siWEOKa+jiEvWDlwpVU1Si+945?=
 =?us-ascii?Q?Z0PN8YOpzofKw9Y78ElXWmlcUQ4JM8BHU9i5dxVBxOxAvF9ssRznXxRxbHPv?=
 =?us-ascii?Q?UmcRBYYM6SHa3h83zSruEJMa7obXWRwdgdRTLxFId1vu2+VsdvqSM+pQmPOG?=
 =?us-ascii?Q?QYtOkCRRtNazXnQlgvByYeOAVwZEkAAyXdNI6bb2Qa+qKQuTUOP6I8005NkP?=
 =?us-ascii?Q?PpvbFy5EaJB+zTmzhb/dhNqcQA/F37UoSKziuQnwxoLbHfXbWv26oBL7klAJ?=
 =?us-ascii?Q?DKvgVicRJZ5yTX9PvZzcw5o2LL68R/MJiCDTQ1xYCz5NB+Vf/7SxtLobQ12c?=
 =?us-ascii?Q?CPOUhVgqVKeW78isaZ/xlq3Twij3W37UybyZEakBsjO4/DGdfQD2LjF9ip7E?=
 =?us-ascii?Q?ZIB7UBqQJhjryxwUh+y0KQVy/w07AqfnxAqdRRMTqKwJixyMVgF1NYo8eTYk?=
 =?us-ascii?Q?lyrpOlMsO64SK+jMVFWwtdHaUH0pso+JX03Efgo4ssTJZpsc457FPShhXt36?=
 =?us-ascii?Q?hwanvSLaWuRX3f63KCNZQddo4zoVVOy4YAqtUQsvjF5pJE9UwD0tcDA6gWGR?=
 =?us-ascii?Q?N8NTTm2YNkTqriChcz9lE7aAw+adLLPabuAupESeWU1E2iGR48mKLmgXFFWf?=
 =?us-ascii?Q?J+JDfehv1H2BvqZkufvj5G5NR41H0Tn3auPopoTUInNH4cOQazhf1eRlSQAY?=
 =?us-ascii?Q?92xe6VBACQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d68fc854-4e33-4e3f-a001-08de60639007
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:26.9403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lC+fMSDz2WyPH+yd5cLGUM7lAw0CbEir+6Bvu+251qePTS+Kqu9K/O66VRt+NAHBLDmgM7kSAJ1UOhlBUMDX4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

FSP is a hardware unit that runs FMC firmware.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     |  1 +
 drivers/gpu/nova-core/firmware/fsp.rs | 44 +++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 43a4e70aeedc..9a9b969aaf79 100644
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
index 000000000000..80401b964488
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FSP is a hardware unit that runs FMC firmware.
+
+use kernel::{
+    device,
+    prelude::*, //
+};
+
+use crate::{
+    dma::DmaObject,
+    firmware::elf,
+    gpu::Chipset, //
+};
+
+#[expect(unused)]
+pub(crate) struct FspFirmware {
+    /// FMC firmware image data (only the .image section)
+    fmc_image: DmaObject,
+    /// Full FMC ELF data (for signature extraction)
+    fmc_full: DmaObject,
+}
+
+impl FspFirmware {
+    #[expect(unused)]
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &str,
+    ) -> Result<Self> {
+        let fw = super::request_firmware(dev, chipset, "fmc", ver)?;
+
+        // FSP expects only the .image section, not the entire ELF file
+        let fmc_image_data = elf::elf_section(fw.data(), "image").ok_or_else(|| {
+            dev_err!(dev, "FMC ELF file missing 'image' section\n");
+            EINVAL
+        })?;
+
+        Ok(Self {
+            fmc_image: DmaObject::from_data(dev, fmc_image_data)?,
+            fmc_full: DmaObject::from_data(dev, fw.data())?,
+        })
+    }
+}
-- 
2.52.0

