Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3073346A9;
	Tue, 10 Feb 2026 02:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691636; cv=fail; b=k6rDndUlH6M1H633g1Q1g9Ek9t1Q/wJixhUGqscheSjdBGp9fAlgzq2bxwp1xSn2UR1FkPgU4kL9qbH10wUvJa4FpMq8VsT4DkpABZJoifBcnXKMrjIJeeOHFCRaiD3k7SqmHayu4wsKfqAnUO30TpvId9G5Rvxmlys4kun8DwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691636; c=relaxed/simple;
	bh=SPUeGRY/eWTEArYHj/vSbAjaqggmYpZ8LMsqdW4E/Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SFl7ZvoaTgnJ2hwMFCawfOzyLpI6WUckgjXL258qps8jlB3mDgEaASFJu4yYSCPOoJ4KIYhtKtGbE+ahqBqVmDFRF5a3Ec1DeeAkjd5s4BO9mapTPS7lP598Ji1xM6PxRZ93gKTI7K5UdSvEbOBd8MRd0+E29u5xe/azYd3WDvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eoDR1U18; arc=fail smtp.client-ip=52.101.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eoDR1U18"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPtmYpPEs/5aC0u3pWJe2vRArbJtaJFAFLwASEpYImch69SVKQuyw9e178dT2u0h22ku2DIaSgWL2gRTh6oO4Y5bjSdUYB18RJxVbDCKpY8eSjUA1tyxJMpTjM3qfXsHiclheFDYVW3kH/5037YHU/YEuWsBHgr/J/yRXpdIoRC/66N2JTSEBHZ9zw7aJMrpbEuFKXcUZLHQTdfkmshJRbkHhCzNm/r1gwaDPjOkr5fyrWlBoI4IiPMuJFd4+KjVhLjCkXM8Vxuc3lQU+RxBfJaR8QsDHW2CDBqZJbozH8cLv+dpm2F7iHCx8BXz8+Pakz6xP1VfmHImZjfl7mF5VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9DVy7mVrZmidvusAIDYMck22gf4SZD8zeCb3VwQLTY=;
 b=HrtkCfrcfMZ87vqNzrgPxD4WGCWieFH/qfqgpDPrv811EwoDgmpB0iiq7uOdhZz/lnUpkKWjkVxnvIO7Ey7bsn4YYbnKYGWMtIbNDz/ZYD9A4pPviz9qSkTY6kUXR4gwgzY0iCrhB9f9BBkkXOI1xxFT+aulXOou1/Fnr9+3VVOJzKHPnByCNpUfbJXmn5/JPbn9kgyZqrO4F6RHUti+kBvGuKdcoQ68qGQ4WAbBo5eHKtdZuCbqb54xnjKDQ1zw4SKQnc6+CcPi1/FrooIygw9yi8ctg990JbwvWMbtC73AGBEoM6Q8R/tLZPh5ePBCBxSDHPYPsJ4DOvUmtid8Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9DVy7mVrZmidvusAIDYMck22gf4SZD8zeCb3VwQLTY=;
 b=eoDR1U18q/EL2dTCzIOp0Pl+sFNqTUj/3Ud1Yuiiue4oqazQDW7rFUC4XgSlgCqtbkdMvD3aA8vRkb2bDJTYUI+a1/xJIQ3i41VE/RMy5CtCNWDnV1H2TH0y2dAay6ggfUCclLX7QkzPapxuKSiXaB6C98vXwIP4QgIAPBX1Mv/rGRja/7QVi1hdEUO1GUo69RH2Jt0ILMmBAiQLyw2u/CVIaD8rl8LHFZhZvaRbexajkQZSOqKcAGd+OfNsAiItSsUcWdcOLnFv5oau33Fk95P7WYVsNnOSI04+PI2CFJFsaai/Kr+87pqS7t4m30EE6cZiHWmnD5NyN6W2Y7UD2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL4PR12MB9506.namprd12.prod.outlook.com (2603:10b6:208:590::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:47:08 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:47:07 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
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
Subject: [PATCH v4 33/33] gpu: nova-core: fix aux device registration for multi-GPU systems
Date: Mon,  9 Feb 2026 18:46:00 -0800
Message-ID: <20260210024601.593248-34-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::36) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL4PR12MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f24803-8dcc-4698-a28f-08de684eae79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bs+KZ9iZKxR09qxOYrVHvSxa3afXavMZJuaXd3D0WqK1yqJxY3CVDhJV7mGD?=
 =?us-ascii?Q?4EIUvJvSEvdcM+bzH6/CaKZBj4U/VdajUBqrqSgWkYsYO0u1E9/G8GVmYxl3?=
 =?us-ascii?Q?QXjLruJqLDy0PtxPHd1JNUnFsFORLC+L9xWXYd5Vqts/fEonS7RynsG54iPd?=
 =?us-ascii?Q?NF103VPf51ZpYITYyT3UPfGqcJ9HNbT++TmUDha0TElHw71oTp49OeEL1aoa?=
 =?us-ascii?Q?xJFBTc/r8elBjn6mpu/GW46a/FemGEjzRoHAZFYo7ent/weQnB2XfCmqh+Pn?=
 =?us-ascii?Q?onOgUSYvJu78w+/WA7Q3DCzmaLcmPvWO2VLJICzYobBehbrzI0pgfQIIZmxQ?=
 =?us-ascii?Q?rtUlhq0E0nMvcSr2vY6gikJnlXwwdTHEtdWm9vXB0dWnCFaQiTlzp74yiiHx?=
 =?us-ascii?Q?lKFZiJmaTbGc9ymMI+A9YPzx5/gi0f6ZZluj3P1M1PJ6pIohxfNrHR0nuP/D?=
 =?us-ascii?Q?My/W+VSwHZhRn9CzGGq5/C0/oEJTdK6smHakgOzT33geKpbbzxGWCgLftuIS?=
 =?us-ascii?Q?c1OYz+B11hLMOvuNefelpXYxMVi2ew/mk7xnXLwB/4+KA/ONc7IzoqlAXJAU?=
 =?us-ascii?Q?6B/XuFR0QasThk2zMEZPcfVeygVrS00ePwctcWSJvq3zrn00Rbv+aV7BM4dW?=
 =?us-ascii?Q?f5YSYK9FMHIlT03D8Lmu+kMLxN7+0ESJenLpVt5IE7gNPqf9wlPEGmOzeGfl?=
 =?us-ascii?Q?7R9fS7VIrv8Sjsvx6CFyeGCkKMuSvhyDpFOySWBovUe7WCy/TojaSGb+Ba4K?=
 =?us-ascii?Q?Q2d0X+QSDyvNyONvxGdR/GvGE6P51HBVMZ8MmCKK+Fc96iQ6JO4qKJRCziBN?=
 =?us-ascii?Q?RR9OMc8EjlShA+CKiqRumLbC91HTvTVj4RFoep6c3Uf0kTkjixI3rF2x9swS?=
 =?us-ascii?Q?JRpCFgtmmUB16p5p03dllJSPBCxqXe/QpFDyetlpQrtbNhYSDxxPETN1u9X9?=
 =?us-ascii?Q?tk8XenFRXNpUfPuS/a3Xh01+qyJ3zoO1mEX+jAudY5/Ul61T6JrfQLxTzzdT?=
 =?us-ascii?Q?/HV3AdWjoT5S9MuUXTpXNlbQ7R3goOjKa9H5iY5rJCFA7XAYZDIVAGCNzjmB?=
 =?us-ascii?Q?+DWgAKFGhvbpuU5f4jkFLQmsoVa5o7xHBUiqLBg6ZgHR5E2sGcATQysWyzxc?=
 =?us-ascii?Q?kiSkro3QFj/8IP5LWZHN/Qolnf5I8Av3BgO6ivT97BL1atyMdFjoWTPXZl4D?=
 =?us-ascii?Q?UldVZkNF9qzaXiY2snQeox/fKxLeKvzXTw+QWWA9SiVBIXV2Frx/gw/tPNs/?=
 =?us-ascii?Q?1GIRoLob+mvnY3En6cDLvvIESyKf5plnAOsmLzoJ58N4/sgSSk0UXRJS7mln?=
 =?us-ascii?Q?H0psOepC6luyookJGCE6uCH8Elwsnnlg+lZ6AKIeQC/mKXkUusi3QqQCo09M?=
 =?us-ascii?Q?bnLekqruC8Spr2n3mPyvp1JGNnFVMtqJGDkS1h8aUnG2UafmHLo5mBV8oTTD?=
 =?us-ascii?Q?4bCUDuYzCwW5YW2N5wnsN8SYRE8zk34VpOOSe8lBoC/lAk33E/FYLLt72YCU?=
 =?us-ascii?Q?Lzzl3En06dAaAJLVUeRcgFMgJPgsKY4w1H6nFeSzw1i5gUhCzgFbAeIzYq4V?=
 =?us-ascii?Q?FOQX1My28gc/l8bXVtQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JqXbD2J8TiFNZ5amuBeTu/lqDRoqckiMDdWYZQH9m2QoFIf1La2eieek8Ejv?=
 =?us-ascii?Q?Dtafzhmqt3bEolgPfH7K2m8MKXmsjkJQNg5t0qvqzePnTeW1i43iWuhLFcr4?=
 =?us-ascii?Q?AuYyLkUCGoUOHk0aQltasDhHio7A1Mo4FtCkhIp4yvi2jtm7IEiwcelbnqFU?=
 =?us-ascii?Q?Ew1RZBSahsQXgpZP7qPfEiOLHCQ85EHIRSU5n3JJmcTULS2mR2hxW7bPUIvn?=
 =?us-ascii?Q?IXXMtWG4ED+b65zPW6or2yTgEys/RAkgAtySdgpNlo7+mP031XLY1weAC37+?=
 =?us-ascii?Q?L2sG5qy+ATGthLxXSJFrjeH1KHUbjWct4vodB+qdFm/+Aelo8MlIevHjPNaq?=
 =?us-ascii?Q?vqXad4vEdU2k+VXjzf2wKOX1jK/9imubci7mOZIUFfwr889ZCRhzC0SsaEOS?=
 =?us-ascii?Q?mNSN8vdKQvKEbxi7e9j7lWrDura6nN24DczcczAZ6ja0CFjIglIXwnRoEF0b?=
 =?us-ascii?Q?bEAg1JvjLnA4+o3flmRWM13eylNbQ0KaLgjeliKRvgJ1fhIKAVwR1HeTAbOs?=
 =?us-ascii?Q?kivwNo4+/+D9iEHEPRUasgQUH0Cy2q8FwMVJ5HoeD8pGRNsxZ2J4KJuRCexO?=
 =?us-ascii?Q?T4NejqNhhUO3LXbfihu7syAY0ke6yRky4TP8l1OWumzlWMTuGUHJCXj4Niyc?=
 =?us-ascii?Q?PGOdQBMHVA+JX8XcLCdfS4LiJ8k/6LShnZZd8IOyZmMlxqh/KEcU/5kkTUqn?=
 =?us-ascii?Q?Y1Bnc5NCsSW9BFDjhXgi9+YP5tEXafEbuRz6mQzsBH5zBBx6VZ3g99Ui2QLr?=
 =?us-ascii?Q?SVMN5wrSEySOFin3305rBsYTZctQADjniLm4FMZ6oTbtiWXoRHxcXVOzkgk+?=
 =?us-ascii?Q?NrNfAm7eKkCA7IfAyVA3+x11GPE+cdM1ieaDTAS6JtOl3ycxGR9FuZ0X9Jn+?=
 =?us-ascii?Q?Cn1IVF0DMLb6jxYa/im2GguHfaDshHSQnPdmEBAOQdnIfArM2OJCy3WhzQW/?=
 =?us-ascii?Q?vyv6I6xcRt2sBnfoEtZUvbB4ZTRi3Ay1naisRykEihVOZHPnllxprTNX36nC?=
 =?us-ascii?Q?yLWdUJQzgc0GGkr3goSuj3j+ZyvWgP2yjSaf0qHsy6HxCN1hyjWl+QCVxnju?=
 =?us-ascii?Q?ZuIro1TG1QUUIm+CiR0ZOK+QSVA5dq47TpHMvfBQo5InSXnTuLsGGAxBnE05?=
 =?us-ascii?Q?FBop/iwgkRAjZmWKrZQfZbgriL6FnuaSpVYfREGovTMHi11MLBIvweKNXJqV?=
 =?us-ascii?Q?2801DMEexCx5YqlSB/EGDqcG/ZdRo+S56K9yEFH/3NtsRFTyKyf0kjjNOvLI?=
 =?us-ascii?Q?yewBOSY+7L6rIoU1fFSrIxWWmtCyhyEHP0+kfUd/ypX0zLvLtUjLrVmruZB9?=
 =?us-ascii?Q?dUAT1z6xGzpHE1DD2Ku3nD2oAtHrw60zarvNhrPLAdxD3CZ+kWcnRuFE0LUh?=
 =?us-ascii?Q?/AAqZiZrN9t9iTFGAufVuKMJUixKlB6Ea2WRHfFZ795CS2AFg3KRW6p4NHWQ?=
 =?us-ascii?Q?wSHrxjJs1XZUvNlTdVrXyx8fa8pp7fQscc3PG0o/vsj0WQOY7IAD3pnuLGdg?=
 =?us-ascii?Q?+jRI4s+lE7RBbO7KD2Jlu3WO4pj4eoq8fHF6tDrDKyKsgIQG5p22+pQ7tmzp?=
 =?us-ascii?Q?rvqzkcfxnfgZuqqwpLWC1XbXoMqnipioek9x49CjDNuCmRtzoLiiIAzGQZ5H?=
 =?us-ascii?Q?FVvdq8IhG1cqzgt7KbrsIlfYfCtCPdW3ZiAhoGD65OzWbS3fFhD66QZ1JNtg?=
 =?us-ascii?Q?bckEmrcxv4lKgGox8EX2AlbHSUY+SX7TrD/HLLZFiuV5/Nru4byvO9UB3flM?=
 =?us-ascii?Q?Tq/TO8N6Hg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f24803-8dcc-4698-a28f-08de684eae79
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:47:07.8788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d++Y1/uPrk8cLs519LR2gxP3Jak64JUTbUBiAmNiiy0N4wHVhvHK4Bu+fNzFAFZQGQQT9DNLuD8B8nFnjzZ80Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9506

The auxiliary device registration was using a hardcoded ID of 0, which
caused probe() to fail on multi-GPU systems with:

   sysfs: cannot create duplicate filename '/bus/auxiliary/devices/NovaCore.nova-drm.0'

Fix this by using an atomic counter to generate unique IDs for each
GPU's aux device registration. The TODO item to eventually use XArray
for recycling aux device IDs is retained, but for now, this works very
nicely.

This has the side effect of making debugfs[1] work on multi-GPU systems.

[1] https://lore.kernel.org/20260203224757.871729-1-ttabi@nvidia.com

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 4ff07b643db6..52729799725b 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -1,5 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::sync::atomic::{
+    AtomicU32,
+    Ordering, //
+};
+
 use kernel::{
     auxiliary,
     device::Core,
@@ -21,6 +26,9 @@
     Spec, //
 };
 
+/// Counter for generating unique auxiliary device IDs.
+static AUXILIARY_ID_COUNTER: AtomicU32 = AtomicU32::new(0);
+
 #[pin_data]
 pub(crate) struct NovaCore {
     #[pin]
@@ -84,12 +92,17 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
             // other threads of execution.
             unsafe { pdev.dma_set_mask_and_coherent(spec.chipset().arch().dma_mask())? };
 
+            // TODO[XARR]: Use XArray for proper ID allocation/recycling. Until then, use a simple
+            // atomic counter which never recycles IDs. A unique ID is required for multi-GPU
+            // systems, because without it, probe() would fail for all but the first GPU.
+            let aux_id = AUXILIARY_ID_COUNTER.fetch_add(1, Ordering::Relaxed);
+
             Ok(try_pin_init!(Self {
                 gpu <- Gpu::new(pdev, devres_bar.clone(), devres_bar.access(pdev.as_ref())?, spec),
                 _reg <- auxiliary::Registration::new(
                     pdev.as_ref(),
                     c"nova-drm",
-                    0, // TODO[XARR]: Once it lands, use XArray; for now we don't use the ID.
+                    aux_id,
                     crate::MODULE_NAME
                 ),
             }))
-- 
2.53.0

