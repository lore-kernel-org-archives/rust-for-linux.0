Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135833F9F48;
	Tue, 17 Mar 2026 22:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788068; cv=fail; b=ZitB2xovSuMSJ+kXx2l2EtXdtUwF6wN4ITNbvuYg04NlRGsdeYrvolZKF0q3aPtIV9cs0L+jdHoSAXH/TEQDVyKip/9vZ26yYJhR3GezqdO41CwFHswfP/aDTaulSJAw5QnfEBUUjK93hx1LArLy7iJDiXVgouN/N78JrLfG0y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788068; c=relaxed/simple;
	bh=9HVIv2Ob9jqkZQHCFAQKrSMNLt3aIvtUxN3u69tr2Ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AQaRvHP2WdYCTkoZ1FHDeCHCzUyO7qSGXlphUB2SwgrynMuwDXXR2ret0nuxQgT0KoP07kkCLPUKAFf3DhVXXV2f0SzT0Q09q0RRgrTJzFd0WMDU2gToUnXd8yRgjI18/tWwzwfRxPsHyySIgAcjXnjCGq/DSEbmwuDzjKlk3DM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OQQ0XW9t; arc=fail smtp.client-ip=52.101.43.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OQQ0XW9t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBna55hi3x/y3yCWCbIMFuFPTisKKnSqu8zoiYgHkYrF+nyBmg9J3O9pZkZvr0iBJlbi2/4TesXE2OcQ3OCWiMYcL/l/60NNCLT2fRHtApTILm9QPUA2tNNtlMyzSw574mEyOqK3VNPuP71QBJ0ckvE2nR2eqNCLPz5osBHGpvcm7drdwc7xLlm4O5CwZ7pvor6F1s/fp0dbQiRd1vm+W0a4UEmGTbywaiXP8ImYJnUYi1srjorrKcPlwdPi1BHnkeoWPFmR7qwiFddH+vUWI3IavVi/zTlhJjP0q8SgPC8vB8ghVdMyyYtTF7vbaXUZmIdtMTC6PBZLp4etHR1BsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGT+JL+3eoZTa5OC0izGMCigslcKHghTNFlTCRuBHc4=;
 b=SJIZ13ZCBqZzGRleZ6pGSB/QcheMall8ANsNeiVKWeobDDRf5WcsnbqU1ZfCcDrYskICcCxknX0uqYATCwa4cgQ7p9vVyjJJH3Gk6/ZHb5B4AT0cRKZ8gIiMA94oQdNE0Loj7uihuNM4FVqpFPuGtC9AET31VJ72ZDMgUlpxa0hJNWLXrIAySctrt7BZcm8KuIt/lWRqlrsCPoyeBRZR0RjthJB6UH2muNCgWdun1QaxREqUkLbMTKlLNc9MTEpBC2st+dfPiJlWBgazIHvrIlCfua9sN+zzI5ENi2sznhecuEZvIh4HfEScnE6USSS4eoYJ4eimqFG2rJcoY6czEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGT+JL+3eoZTa5OC0izGMCigslcKHghTNFlTCRuBHc4=;
 b=OQQ0XW9treP84hNkUdukBjukN/gaX3k0ZRLl3ZJXUfVTytFolPS2cswTrETFDJc4DGQtBFPFPS5+eqsfmchiRkBJ1UB1lj1Q0hafk+28U9gn40o5dtPPPHL7wBXoh4DuiJki2BavopNp6XKwg1hdvjV7R+wachedVWMRWOLVhDcczAloRF5i86qjtO3BNyPLJV7e6e7CWiLFVBgWDxIjDqPHY2f0NLtoF0lPOP3BMSxG/MRgpHtgdh96KAjvVWeb964AI/ZURLQzbbcVJu/D1tBlAKDIdMtgA9EGN1YKY5vqsuaRc0PIjzPyi8OVJmhRALCZv9mzz9negc+FzwjSSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:54:15 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:15 +0000
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
Subject: [PATCH v7 13/31] gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
Date: Tue, 17 Mar 2026 15:53:37 -0700
Message-ID: <20260317225355.549853-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0059.namprd07.prod.outlook.com
 (2603:10b6:a03:60::36) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 983df694-dc10-4c2a-86a5-08de84781d20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	D2qb++EU6D0s5fgQ2hXPKe5uxcZAarwONgbEDi/GVJlGT9NzX5epy6mrDGk6hVMEeMq1ievaEDl52aPEaDDKNN8Q0smidYInHcGHHF2OWzV9QSjBuauBX+w/XGcYwVPJAWtz+alB7ZHqHTyxZqvWtT9fjidjdnf/ZYqIuLYGLs9SJB1KXHqg6eWrSerRT5Ho5hMXoslwAA/v0pOLlLvqu+Yhty3Nq9JRlsQNnGumgA76MyfFx9Nd3L2g3QHCd0V6AtySldVbt24ijWwFX9SCm/DgvJON+EvhzIiC7LJTjoO06EPzYGQ/Na1O4Ie97+zRzDPJvuCC/YgUAw95eOZAVNijkzV/p8pab48ksYmgm9x5KAL3hCLgjLWyoBekQz3vIlo7ePRG3OKxSNlyQY9ClI0XhBMhYBVbZMIF3Toc7qVXj4FdaAZOwaLsIDORYWXyWP1+vJ1EPRoWZhVDRoiiqxr0Nc2cYpgkO8PwxHXGbB4eUZo9+di8Sy3OMKGiHGJdc56MN4eVzj5RQxIq7mWkiMSovvn6i3Z3B5GgqJECVFhUac6o4lyIPrEb1D0G1rplHw/rPyRZKRFvyYPdtPh+TrQpj81evJrRk9a/nbCMcagvS8SKuBhQRluRELqqFf5NNLDx6fE8DxAYZaeSdu7cDNXwJ3CmJAzLvWmHYNY9o2SdyRHzx0a24Le28H5NKgC1hamiPRero4ix9oTqakbp5YVW4wRjbexS6yQOUw6yu2c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1+ybUvryp8AO65cMJdLxQRVsN8hYkxcu7FFcard8LJAHnqfqcplcUBWfbxQa?=
 =?us-ascii?Q?QkL7GlD6Hbw7Uv4SuYCkL8JkNGjHbczi1MlXywZvZHcurO8nL3POblZjvA6+?=
 =?us-ascii?Q?LXVy2Pp/1bIsjy3bTqzlHMOaTv7y+69D7t05MF5vendCoExdZ549vfNQSPup?=
 =?us-ascii?Q?Wm/26ckVMXco7IPEuZ+MSe1kmAJirNBp41YhJhR/4Th/yUzc4I1aNbRFTGPP?=
 =?us-ascii?Q?EtTR9oeKYC5vyeteI/wd6G7PE/xsTbPCgGigTDF+eVoyzmFWJDqy74P3zVSk?=
 =?us-ascii?Q?Th2D+VyQqt+XXoM+qczCxJ3NNULtreT6AAk2yezeMz7mKdN12BxoI96L59PI?=
 =?us-ascii?Q?PcA+8ogc3Ai/PkSljeQE32XXGTTASbqIwC3WfUY8wCM9S/rrweCPXyeF2Fwh?=
 =?us-ascii?Q?vIg5aNLIuaCWEocMzx1vhgnNVzT4Gq/R6Eq/AG4GERVwZK6Wq1wwodS2QSSJ?=
 =?us-ascii?Q?uoaGW0/12YYguW+6iOiiP0Mg8Z54CiNE+FqTHklyCVkh0kZVauMCGtNTMvSL?=
 =?us-ascii?Q?nNUuBrw99uejoDGQIfuHBHuXTMq5eEJkyxYEHRvjeBVYeE7teMdSLDiiSbq9?=
 =?us-ascii?Q?gcrgDAxISuYUhHQ1HBP2YUXkPCy83xvGd9xviHHqxNHbGQXp4wunOpc+Q2by?=
 =?us-ascii?Q?S6tUEqeSnonrHIppop2emLBR+s+W257Gz5buO+gOJnDr1/vAgmYEIOt49QKB?=
 =?us-ascii?Q?T9NVli3EDhfaPEmgPnfF04/OEdGe+rFz40wPRVUzYb7U4l53RW6kWMaIe4Qc?=
 =?us-ascii?Q?WKcUQKKRl7bMRJdTtAG8Ho7IeLSjFbqlFDelZT/NZxBWHBfzMHI3oeyd8Zyf?=
 =?us-ascii?Q?0Z12ypxLCr1W1iEG+5ndsL0lkRd5okDxf9BUqCBeq4HTy1IAjgF/c7PHIgL8?=
 =?us-ascii?Q?+nD4U9jsKTZ96fFOuW3DsGTjfRjqxPJa+VPW7gtujaZKQrFbEjqXBu8jIcEX?=
 =?us-ascii?Q?5hVIyCLHsgMmV190SQG6NjGC8KEfotU6g8A2+F91UOf6gvdgqYr5Egilip18?=
 =?us-ascii?Q?m6fDYP0H3Q62VrCJJdk2sniO9u7d1wFE4HSZaT18XDgOIwNg0aOctV4cQJXO?=
 =?us-ascii?Q?8HaQdgO0K/R/BPr+uo1I1dowMo95XfvIOmssmJFDqCdt3BLso6hVB044+owe?=
 =?us-ascii?Q?ZqGammUpibVj1F+8RimsOTlut6fpZSBv2r3cB9zPIyRdIRXvRAIqa/sFyM94?=
 =?us-ascii?Q?0yChvGzoCeluxzF5QSvTM1dU9JEQN7yOmWMdGuLeia3mMRxyyQH2dgoYcr+V?=
 =?us-ascii?Q?D321SFwyf2f59vUhle6D390p6c1mMOrtsJgWYMZyYgFjQ9fTihH4Xn/TboMl?=
 =?us-ascii?Q?ojxbhfdmqn+fevjHEFShIe6Hty6Fl0mkokFbGWZw/hdFamdAH/oHWDGV7QuS?=
 =?us-ascii?Q?eILEDytNxAZY234oNm+n02FXBie6/u60FaLk0x9yLdSv0qBO5gJJCu/B7dWi?=
 =?us-ascii?Q?kX58N5G7hfg2MfxisYolVPrDQGknYJCogFmzlTvCUwlynRmvDngdYAGOaBQz?=
 =?us-ascii?Q?auETvxdJgRpF0PkmYEaxq5eCHOOTgyOsB7qk0GMAT+uZn504pM1x6FA3DV6H?=
 =?us-ascii?Q?QQsS5AkDfEzJ5JdbMqPkbf9xxj6CmTApYfkRpl9tVelkqgq/NJ2shdOw7F4j?=
 =?us-ascii?Q?n7Zz6dgKWxfqp8JHXPUmFMWLQIBLHOCYxQvxkM3Wl9eb5E8e7iRClo7LowpB?=
 =?us-ascii?Q?/DnvzQNqNg72NPCOavzOG4oqYjoj5uTeojbGYYCqVf62Be5DCt0cRaRvKiYy?=
 =?us-ascii?Q?l2ITqW3AIg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 983df694-dc10-4c2a-86a5-08de84781d20
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:15.4251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: St/A62ujR8Q5Np369JAhoUYqcz2sfcWzN4fibYxjfZPT/dS/B47/LYiZlxd/pitwRTYLc+6pmfrE1Dc+CguOyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

Add the FSP (Firmware System Processor) falcon engine type that will
handle secure boot and Chain of Trust operations on Hopper and Blackwell
architectures.

The FSP falcon replaces SEC2's role in the boot sequence for these newer
architectures. This initial stub just defines the falcon type and its
base address.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs     |  1 +
 drivers/gpu/nova-core/falcon/fsp.rs | 30 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 7097a206ec3c..f515a4ff2f5f 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -33,6 +33,7 @@
     regs::macros::RegisterBase, //
 };
 
+pub(crate) mod fsp;
 pub(crate) mod gsp;
 mod hal;
 pub(crate) mod sec2;
diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
new file mode 100644
index 000000000000..c5ba1c2412cd
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FSP (Firmware System Processor) falcon engine for Hopper/Blackwell GPUs.
+//!
+//! The FSP falcon handles secure boot and Chain of Trust operations
+//! on Hopper and Blackwell architectures, replacing SEC2's role.
+
+use crate::{
+    falcon::{
+        FalconEngine,
+        PFalcon2Base,
+        PFalconBase, //
+    },
+    regs::macros::RegisterBase,
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
+impl FalconEngine for Fsp {
+    const ID: Self = Fsp(());
+}
-- 
2.53.0

