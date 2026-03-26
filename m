Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010001.outbound.protection.outlook.com [52.101.61.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77983932CD;
	Thu, 26 Mar 2026 01:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489184; cv=fail; b=ZS8K76VW3SsENG4k8sUphnBsP3EetbTgDfYnn+pKVNmKYdeZxhiBacZbXY5LDF42atdON/y33B4UxaHBG9NlsfWa29OfSz1m5pUqxD9NKt9Z7sCfTCMP7pB+rmt/N8DQNGNtOVfgIIw9Jt4KV99bkTt1fDhxr+y6JJg90J+x0hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489184; c=relaxed/simple;
	bh=+G12Q+p/JBpfHCbQhFCgedbc1ER5Wuv9ZR/Krob1dL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZsTWdKWtraxuV3XGtSyKZ8pDm3AbqdwvcjAc83nTg2JavNqc0wtNDXPKL0Ptdgff4I4TWueK/vkn7wQUBL7njPC/wsP/IDeVfQ4oMJOK3S4Pkkg3r2UGgNTum6s8Z5WQUiac8vOOF6CagfwO02P0lbhRuRyeCDJqw+AcXN8OlTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IOveuHE2; arc=fail smtp.client-ip=52.101.61.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IOveuHE2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaErT5pxQoTXKJkBFJ6GqX2r5FPkFaQc9rhkq5rcoFKPe4s2mBG1Ew7UHqfQuTvGvYmM2vqvOkxDkGx4HQ+OL52zzSd07qCmZyHc3jhr2KY3oT3H5XE7wjPjAC+gzjozZerPc3/EmtAJPFsPKmXKGfi5CJxQKkCyJ1AaAZNOHfAsBZZEXIIecRMuUotfknUqHF1kTG3GXQ5+SPO2y17LOmcRYGBGTZ2TcZML/fR/vtyXRTGisnyWAeKFTSE9cng8qseGoaU7FuH0keI37uG+4NZFE9mSRyxbwPGimT51IOasi1j6CuUV76gCbuBl3CBBujXPzpXYoLvI95MM2sauMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OU9shpUDWicS5NxxKmHDBs5Cqtj+W/rPKDpf5TFtpY=;
 b=jTYys1WqVSo8k221OvKgCCjO9QEpF/FqP6/5dkCMKZZ1fR+3GnOumTKPBgrvgZG6eM1JVeTdFNzUmqDkCA/0IPSxwb1A3zeVQfzu+S03xHuaLnZUVXp/Gk+5ZcHYsoWXovZxpXQh8HtnE25QAJCqXsknpFSzbSksQFQObv/qnubrTOB7TQt4thwrlxp3j4pB8RF3XWzCOREYE5auCkTKRBQTLyChj71Wzqu3VK98Pde5t5D3fYXhtwh7Ij6BH1O/JxpdEaDsHhQwquH7fUPSH/Q2uCoRRS9jLf2BnxMpoKf3qNq24IPW+VYUZyTEyvvHbFGlFJ5iBV1mmnbogE8uAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OU9shpUDWicS5NxxKmHDBs5Cqtj+W/rPKDpf5TFtpY=;
 b=IOveuHE2DKFFEi9YO/od/qFGaP88GwhZP08fDwf/XvzUzcCvoRtGujVLJk5TKtBXV6VaQB0eIbniqgp/gMRvT59soyBvY0dqZ6CetZyHyMTXgQOlookWiJ2dEsX/z+GaTkEifBKMbr284Ss3KysvmYU9x/4m8njb3QbsxUkR7yNnokFBitG4iye4nNTALMbvzJDx3tSVDI9ikcsIPwG2ojLjahD4aebDuq86YMNOV4Vkt/t+vrhWj4W+Ju0JgKICOTcdGp3GR6y1Cnl1kQQINUZHmPMc4f8xeajYrdo+HntfV3yh5HAmxViBQIfEnUiWWW3ysQR4IcWhncewu+iWpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ5PPFF6E64BC2C.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Thu, 26 Mar
 2026 01:39:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:25 +0000
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
Subject: [PATCH v9 13/31] gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
Date: Wed, 25 Mar 2026 18:38:44 -0700
Message-ID: <20260326013902.588242-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0003.namprd08.prod.outlook.com
 (2603:10b6:a03:100::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ5PPFF6E64BC2C:EE_
X-MS-Office365-Filtering-Correlation-Id: ffdb8add-b6d8-4dc8-2dcb-08de8ad8831f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6elHG+b+hRm+mAt13SNBm7zqOOKAhlaOjFNFJ3x6R6QYvwWRktE5V9tFkeHe70iKiVw2C2DVrF94aY80v+IQribN/XviHp1agNoM3X9niFcW8oLfnFs02qSpzd3f6I95MMeiti5ZUs8DQ2CJFjwAXR1oYGfLCKutEfER1T6skQKXTp+Zir//AMpknvWQozz/uRq8mzVow0iWA2IijGY+IFozYJbsQFxSEVHmbSWGt3ukCp0ReQ3IBKugQOJbeUKm4Wqq2aA1n5JH3fEHBhbVwJA7bOwni7PZSrKa50ByKDg0Azp9uM9Dao0YSM9dfinmmpTz8JBfC5SylnVNzP8xZq7Kqs2KDBQ4YSl8zVotX80NJdjR4ASV6q50BUMn4iW/YUSkWOdjRS+/zqLQq1asOx33yoGZdq0AF+i4dA6lPZ8ArilcLdj3tVG8vY78FfeOr3Z47Xf2VQMHy8ZUxjGMVX46HqVXPzlm//RGtxy5AaHZI/E07x1iohzUJCfu5aooH3vw+W4TnsbFd3gDTV2fIPq2Bvd21UokAPb4FckK/zQ1Y4XisGNM0z3cyA03fJwiZK7x7EjSY2Ewm5pGVyPSLhChfB8W+p4U9TKuaBUUFALwcG/X+7G2iEl5C92vA5LY94CqsJgkEQOCVjXewVmrJZS2Z3HJ9TTI/x8d73RNuoH9o2pcgAtv0kfiPCkH50yQALj9sKxBEVLQCpb1qgaskPmx3m2sBEI8R7qmDM1yN9o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FVWNAWE85O3kUWJTMcX7xduMS78cdCeoddaaPRBrBuRHVl0AqF6BJzoKrAC/?=
 =?us-ascii?Q?4o55XsFyX6w/SupN01pfYF4+9XClNM636kegzammpI+xgJmEgoJ5JXCUwRcg?=
 =?us-ascii?Q?Pko2p2YctVB98oG8W8MC5pAdahYBrEuUxY4gOMF7bI7JCyaEgui0oVTQvdoD?=
 =?us-ascii?Q?f1r8yoG4HrbMw87wmFavkVRTczAcSGLxC6kUmRi1UBENL+nPFGvlGYgNpZrb?=
 =?us-ascii?Q?qD0bh/xbJJEQBD8ZGn897UNV4mcMhc7p+WDEIOjEG5E5pVpyZduoBgk84PSl?=
 =?us-ascii?Q?bYAHIaOVZC46/dnIUqSjsGav+7RNBtvyF2p/lps3OA2BlzBsL+DKXSmKfAEL?=
 =?us-ascii?Q?koXpZUFzl2sw6UYsjyvYvr/D8sFQ2a4hxE7BRDaJ2m7h6UvtetcZoi0uGZG4?=
 =?us-ascii?Q?JPBgDTrAZ7k27q+8X9LpNpa06oBbBTxMSPOFoJZM15EiDbJBQXwg0lp5LdMr?=
 =?us-ascii?Q?1GCbJ5WPUEe3eHUKOg/SlnD4/q741x1gyOEShc5vcdv7n5onL5UowoJuEBqo?=
 =?us-ascii?Q?RQm6HLR2EgSqgga2t8DbIVVw/wWsCyp43pqH7cN7SRlzvtecmiNa61yNE4Zg?=
 =?us-ascii?Q?cPrgfJErYd7fYHCwhLgueq4CSo/4NFmuNK4BTBekU+Cm+Er186LjXkk0TDMv?=
 =?us-ascii?Q?3AGNScxDU4XqfOkjqx5D/9RpRbOpmo7DSYWTipLmwKFF7/O7aUHbMNcn7Ues?=
 =?us-ascii?Q?zc3ipKlX8WMwjFwsoEN8fP20FX8zvxkb8RNLSGsWcuVRSABA34Ol1MdJ8bUf?=
 =?us-ascii?Q?FbdFBbnVQoQcvsYyJhIjfGsrotK9mYwCjTZshp/M+K9+4d2H/mpzwzFn565a?=
 =?us-ascii?Q?dMzjFY+pvy1YZ/3ddmFnP1fla3FK0gKuqb4cuieCTKt/YHyEnkMBQYgpw/FQ?=
 =?us-ascii?Q?M9B15kCSiCMeKs/7kcQl2ybFUA14jEy+/JBRD2CaaBKjNNyEDUVfrQzhxsjc?=
 =?us-ascii?Q?6UwAYfZefujbSDzvMKbFgqyTvszqbu58495F2ijngiP5ICbJaI7C/CAPARmJ?=
 =?us-ascii?Q?GOhndFzEhz8dboqe/wiqwr8wJpzBnvouX1+jRMvd5VDfmWciGRkffCuGgZcv?=
 =?us-ascii?Q?dTgGcwfh3aUhfDGGXkqCtng37+HtU5AN0cRgi95/d9oKdDw8HdSYmaCTnsKq?=
 =?us-ascii?Q?fe3Di1qK6r61jxO8sRtiVBEix0UCBfoBOFj0u5d6FjniGF4w+HI7wfsLNs9/?=
 =?us-ascii?Q?BI17EJltxOF/PxX8bRuiJIZpIiX9sF46Bhrghjd1JSOiGPMlkp0x1wZSOZHM?=
 =?us-ascii?Q?KvLqM9rG+XSIqq2U20IYL1e/6P7B+unTX+r8tTnoMaWfSxz1W/16zyqNmsXW?=
 =?us-ascii?Q?Tmf7UkhobkJOFd2RpClEcY6LCoungH+gQ5owj1lCjAK8jWcysgI30dqidZZc?=
 =?us-ascii?Q?52N/S9TKoHf97UAryAL/vaoVB1uQMTzsbz9UuHKmsoXU/EcDQwXEoW4K6yY/?=
 =?us-ascii?Q?gG83XB3sFpKKj2v43t2cgPr4sz1vbC2DRSlsQY9fnvQH4CdRRrtNgQY3thoP?=
 =?us-ascii?Q?6oaGEHmW+LX9ca/AqJ6N7nh2lQ7K5GAMbeFlpYK8LqiVQS8lYmygLe9jFgLW?=
 =?us-ascii?Q?cxfoi62oIGcXpikLdOnw/Ld+ZiZC+JKIpC7AeAxxOrE3NX0Kwv79RfJboDr0?=
 =?us-ascii?Q?CVapOw/u0F4HsOldLdxUnKCVieBvIJA2m+33StDyrhIrSJWbfEGRTzC8H+Jf?=
 =?us-ascii?Q?U2jXpfsDDVVNiEVihOOwM+A0hrI4yB92Rj7TDj6yX6G2ww1oQrWnmcSzeEaO?=
 =?us-ascii?Q?2TrLM+vqyQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffdb8add-b6d8-4dc8-2dcb-08de8ad8831f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:25.2108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWh5uxkRD5+Or+F0bV1qGk2AsjkcYPqka0gwzjXoZl2K5E4B93Dvpq07kjOABKWx1Ed8SW8Zw0aTp/3Te9NCYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6E64BC2C

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
index 5bf8da8760bf..8022075c55ed 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -32,6 +32,7 @@
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

