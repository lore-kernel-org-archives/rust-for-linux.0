Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013043.outbound.protection.outlook.com [40.93.201.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3C7DF59;
	Thu,  5 Feb 2026 22:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770329886; cv=fail; b=TZn4N9SgWUZK/sHJ+7DH7yZ0QH38utOxAZsq0BS9oFFpaD0Zg0CEAyDiCe7ohx/Og9yT3vUYUtwOupwEs48CNed6SCCBkgdVq2lXhIBKufwBxlGC4deqCiG/J/cZOLeegRTEBqXWA1CfOP+aRY2Zfh2rza3okMVFdQ3NOm/niyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770329886; c=relaxed/simple;
	bh=OP5+TUBTfLjbwUQY7LUJpyn/IK0GCldosXAZ4XlWqzA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=l/p6xu6cUqI/lTrFRhh/RqzW8fTtGJSx7Lum0MEvgjv6uzFUciF/DwFaa8HUvYiwVszsK/w0PYI6pjtMHCYtzE5JUPZZNtj+Evcg4BhQ4QFpnpqkTMuqMrapxrSLhfCE4XltkY511L4UdcNYDVfzUCe9Ir2cq5OXBPVVdXlV5yY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Hh/2UC/b; arc=fail smtp.client-ip=40.93.201.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Hh/2UC/b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9XzyNtBtSu/BpBewEdYdeNhGCWdrHURqnSkpJaauLovYuetXUzJriQ8uNzJYmEQVy4f538rAC8LD/Anc3GFZugd+kKITrvYZTAxX4iwPfUmr1fnLeLXZX2T5D1sKcCLX+ENxefqHtqpIu4AGM678OPmpI6WgU1ua3gH+9HOjrps9BjrsXvwgViIzpNl6En0LGjxWpETIFQwROUJXc6TB6VvjbiIreoXFAIdoZ5isnKsuJt0u2RKDLKZJAOE7WS05CCPV1Y71MYW8EeYD2X/eVBjlJtBx7EnLrhX4K9WI7g0b5GQqgSLa4dYT7qrWgK6lZMRY1a9z5JD8/6pHkSI+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkxShwgrsYspFHmpzMxRv/gkG9vF/3myHu7es41T0LI=;
 b=DEZlCPv+PT+r8BgXvGbCiR97amaK6OXux5lredfgVPTK/ksh896TtZ5NAmGPk2244zP1PPMIHRUPzxxaf/wVE3fe+Zj+CQKWPYizEiJoNAN1UJSUXCxl0SMSC8oratgbGo9qpMfQ3WieR2E6wu29xMjD+Kov4Mgm02HJMxDTliJNYQ4xHuh7IXUg6cml96ULjA1GYETAWJa+pnRh2CdvajZGU+zrvZkEmPpxj368p2mLEQ5omthhYwOZoAjbeOHRQwEaIB3XePM01ZgvcXNChrW+VvieOa7gpWwoksmCYxMxne1fx0NC5hUa8PTw+ATsY5w4DtkgIp3g3jw/gonhvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkxShwgrsYspFHmpzMxRv/gkG9vF/3myHu7es41T0LI=;
 b=Hh/2UC/bY0bKoF6PKTs1bOEABRPik6YyAU1QekcG0klWS1JCb6O/IZxWBG5/nsxBFMVdsO04gdj28JMl8vfllaWdlX7DLmcdcikpF3h1XGX7scG4G2OkWBAWlyPVARGIJu18jGdecLCv3Te6kSXy0scO1V7StPkHK05BPniyRZKuJEWT5LugtucruXx2rbTcVmWZOeUqhB+PP+va/syAEL0Igb8g3LmwsSnAA6s9lsoxVS09BcpVL/yvtw7+WF35+8+uXFBG6qE4r/q5H+/z6ZK23P4GUmDmoIxnbgAy071QGFFqr/o6RpX/8vmFmr1ftSNy6Fw0q5XjBV9F57fOkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB8570.namprd12.prod.outlook.com (2603:10b6:8:18b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.14; Thu, 5 Feb 2026 22:18:01 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 22:18:01 +0000
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
Subject: [PATCH v2] gpu: nova-core: fix aux device registration for multi-GPU systems
Date: Thu,  5 Feb 2026 14:17:58 -0800
Message-ID: <20260205221758.219192-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0083.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: 2829efd0-91f8-4553-d21c-08de65046c92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xma0mwRZiFfXU5t2pEXdwzrqdq8TInqrhL3ReJmveMk1RijOpxzzG9UldqGt?=
 =?us-ascii?Q?olFNrOhwLtc/KWlUsyHiCgA3VzH9LB6/akDor9e1N63EiSGuvADqm3AYRbo7?=
 =?us-ascii?Q?PztJI+XotjWm1w91OqIIgJAkD0wJylXyTthLbWDIG4ZZjl9/B0h2XOb6bYXc?=
 =?us-ascii?Q?Bb3dnvmGH9Gbs7GkvjMxThh6FdVVTUchBrjojRiVNeCRJ+JgVbjItAdwt7qG?=
 =?us-ascii?Q?ypRMKLCNbrWHey3xEZCpo/QS2pYxa7O99MrwMgQiF6LSwXfDvPSUtzvvIQkR?=
 =?us-ascii?Q?wzQhzekZ6qWJDxV4Pt0HEGfATu+7RcnUeOBUXmrTeapWJYdcoCLVYmU7Da13?=
 =?us-ascii?Q?pGcLb5gMFLce7yCoWJW+jPt2fOcashm5/165sEKGTqVMHAe43uCvVCkN/0NG?=
 =?us-ascii?Q?YQ7vOLiACqAZZVCZj9G21Wg8q/tkcpWgqZ6CSzZj3GFM8Rkl7/j0pwQxizNI?=
 =?us-ascii?Q?/dwEC+J7iAWNs67nkXEF+k/niqK3E9D/fDZoc0thLovRn+DcgwqRYFtB4ui1?=
 =?us-ascii?Q?QQUlyax28kwanmVX85O8oFh60mRW4039dk0w2WyabrZlqoHUqSNkl7GnGQgj?=
 =?us-ascii?Q?lK5EW5WFOMhgYIQbR0nOnSoB7FLWGd+UseKEyfzibjtKs72cu6SEpj2P6OwZ?=
 =?us-ascii?Q?IcWBryk109sBywcS3iNjx1X7UMBo7EpIQSpheLjCX8zjDf+UPjvVbRPjeC+S?=
 =?us-ascii?Q?kgBpu/jKkF8F7g9vrh37ABKScYgFcL1BYjKeX3+jeIWt+H8sHB0rWzT5KUYS?=
 =?us-ascii?Q?2FEQBIfofwVcf/VoLH9ooDgRsln7Y/PXbfYV97CCrGM3+68bHli6dXDyDotf?=
 =?us-ascii?Q?zLgr/RW+aEAAi2s9Ms4sL0UdAty7PA7MjaBuj8CEKG/Wnjv/eN/0rTgr/Kw9?=
 =?us-ascii?Q?NpvFrC5NdXaoMHi8oEhpOCCF8xUR9KL2/nmTJUpiX47gpob1Cftv+ITKVTVZ?=
 =?us-ascii?Q?lfVe6pMyCVHA/CpZdJkO1+XJ2hWFh9U76f0EtOQsrtai/1wlUwdEKBKFMABD?=
 =?us-ascii?Q?liXZD1cBSp6rR2KDL3jX76p23YyMPlg3L3o3lQ/AvGV4wule1iKz9PjAz0ZS?=
 =?us-ascii?Q?hHCX5zXtdSmAjBrdAYEejDaHICpYVx0B2cLbMRakTR4lbwJAxzXI3Ch9ONQY?=
 =?us-ascii?Q?oJoyXHAYtrhS0UzqWFiYkY3AgOg4LbSWLOEdKSOX19ghbfPWbogeUmiTiC1+?=
 =?us-ascii?Q?kudQjIHUYy0vdhTtBbsG1yFVsZ6YBd7vaFdZXMxqs0JcnOsNx6sMwq/KnNzp?=
 =?us-ascii?Q?vQ/biZw1NGbiUBmCgL1yKrrpOYChBjZ+f/ZmFOreZLBx6PXyvmaQ6pb5Rh60?=
 =?us-ascii?Q?SN5vzOeg1aATRK7LXT0NovxecoATbdtUoBjLvxG86bGSeA35CRlK6rBuvQeF?=
 =?us-ascii?Q?CHQUCEeElqHbPZpvhj2GbectubcNNPm1s+48/YgTNNBd6m7mrjdopRGOOcA6?=
 =?us-ascii?Q?LR0pES82wuLcKbBPk67l14cHSQdqteplknnv4Dx0Uqele5ri8JngK6hAbYIW?=
 =?us-ascii?Q?ZlesLc6quK2fk49jPeAejH1t3Rslz1rCA2z7bJnLMeV280JW7bearwdmZddC?=
 =?us-ascii?Q?baTWOtBVp18btj6977w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WTb3GZPUaFual9aERadJ/evHpb2xW2we+O5IfXHVZillHgltgmAtO2FQYX9y?=
 =?us-ascii?Q?B3kM+JPhIy0bKUdnpx7af6foGq+b3USPLKm853hNv9KGP5nZoXbrCzyYNUBA?=
 =?us-ascii?Q?EY6mySFmnwffyWIGbSKJ+gdB0HJXqZmBu/2jC0FJkYb9pNDqml83ZKQAvE96?=
 =?us-ascii?Q?jBxyXZ7kkA3CuqEfNNQRN0TMrUB8t8jiuYCMotF6SFl5SfcLPe25x//8hzn4?=
 =?us-ascii?Q?B753OgzMJ9j3lrXxSNj+h1A6/fE4keoA0IpEoSvp/qoKzslXA/9vYlMoJGO5?=
 =?us-ascii?Q?oscztre/Nfdyi/yxYhX37yNmaZGCg3+ZXGvgKwQ2y/wXc/GK9RMjg7iyhm3b?=
 =?us-ascii?Q?0B3UIsLqY9gx801nZIePAx+Posx2YewxuWa46M5zPhwcoTvj1+pkF0TIVqcn?=
 =?us-ascii?Q?e4WDh5vbSej2KpnFUYj+qhm0KHczUvAmMnCg6KT5dqpK6trafAhaXj8I11Wi?=
 =?us-ascii?Q?wNplOxWGMISk3Itgy1tAExmItqeyXgMI83cEDvOnFEjNmIdNL/CnVuLTvucy?=
 =?us-ascii?Q?Mf/ZrV6ijJTGPK4f8zy/7s2O9M24Zku6OOqwwxw/WTdtH7QBCgydECatUBf5?=
 =?us-ascii?Q?/fVaA6TKusd459Jm+N4jOhlp4UiS8sDEsuVfhzNFtqakMBc3RsLuuVbJLQXn?=
 =?us-ascii?Q?GdaxHjixOi2WHq+Jtqaiwmbs0VwHxakkcldVdiys3BFf3EyR9mfGh8AgUrns?=
 =?us-ascii?Q?z3c1FQnbtrsNqUs5kq5HA4nuFX3uWb4ZwRCMnp0JOeqKgrQ+XRnX8Q+gclt9?=
 =?us-ascii?Q?Kpzq2D/OvsHsxL5C3f59jgrnKDxZz4T0kFuW73j90IaaeDvU4zozLR2OFdAv?=
 =?us-ascii?Q?ekCUrM4fp0zWGQA6U2BVlXN3rxSOAXFjR66qw4TewrvdFIgJ/Q9wfybH7yB9?=
 =?us-ascii?Q?gzeQ99gUSegfMTzN+5r3AzyE/HM6f0Mq4t4O+7vPzzQqtrT/5SMvK2t2OAhT?=
 =?us-ascii?Q?5AF9M98yF13JhYxvTj79qSugF7t/p/wmL44k6L1L0Ikr/HZgHVSjubz4emcR?=
 =?us-ascii?Q?UHtklIlbv9uv6GFiCf21oHoaiMBVvLTF9FqEwd69uFp7lCjj4VJbNnn/et6y?=
 =?us-ascii?Q?eGTcWys5WD+3zaS/08hxg6c7dcUocN64n1OXTeq8MR5lRA0A6dbAf4fCa2u5?=
 =?us-ascii?Q?szcNnBc1dQajm88kx22VP2+5+MxGaZ9ZrxTi0cHrxvavYADxPlFl7m0z0tBG?=
 =?us-ascii?Q?oeJTYGShzcN7RAI8d9u7obKzR+ul1APNI4Xoa1rd145kR2uvh4OE3BZMSJx5?=
 =?us-ascii?Q?COifBw28sK+kXIadqGdV7kpa2H4+Kc/y+khNnGLkmkeNUnd2DpKfakcHOycO?=
 =?us-ascii?Q?STUeeEL+cdQhzr2+A0M2QT8SNMpgQErbxlK48e0z2IAfwcOcQ2Q/Pu2qpH7v?=
 =?us-ascii?Q?gDaytS4E5oTWmb46hCNdZbVTTHh1sraCSwrUAqFvLa2eRXL/ScqI5wcuxRzZ?=
 =?us-ascii?Q?5JWRa7wqsuPdjvE/8YmbnDZZVHct3zelSTHs7aCEBrAqsfmqr0KPzwAs0Ejq?=
 =?us-ascii?Q?sFCAXGejQSJP4x9kPNyCO15ImMt0NLoZFc61CduQ/WxbDKk4fE8Cmh3S+F5V?=
 =?us-ascii?Q?JbIlLbYYNKK+3bk36gHt1s4DfnKZGB+qQjAv/cZovFsG6S1EbiQ0Y8lR3o1c?=
 =?us-ascii?Q?3xkVTcYjMosSl2/rsB3OI7lX6aGaZGSr4Udy5htWoA1+42nw5yW6GpcSe56j?=
 =?us-ascii?Q?g0VqyaSqP7vxiXQ8O5L3PnnMYMgUrpC68xF/eEteVu/fRCfqkjZXFa5R/xVY?=
 =?us-ascii?Q?EHp+QtFrQ4hVtTK1K8dZlWFlVU8HwuY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2829efd0-91f8-4553-d21c-08de65046c92
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 22:18:01.0718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cM555QxCCOEj4VTfLArjeDQEjHLskIcaH6fRsHHaIKD7KMwABLz7rsqyqaXPwJngha/uvQbCB/QQfurQgOSY+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8570

The auxiliary device registration was using a hardcoded ID of 0, which
caused probe() to fail on multi-GPU systems with:

   sysfs: cannot create duplicate filename '/bus/auxiliary/devices/NovaCore.nova-drm.0'

Fix this by using an LKMM atomic counter to generate unique IDs for each
GPU's aux device registration. The TODO item to eventually use XArray
for recycling aux device IDs is retained (and modified slightly: IDA
might be better) but for now, this works very nicely.

This has the side effect of making debugfs[1] work on multi-GPU systems.

[1] https://lore.kernel.org/20260203224757.871729-1-ttabi@nvidia.com

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

Changes in v2:

* Use LKMM atomics (kernel::sync::atomic::Atomic<u32>) instead of Rust
  standard library atomics (core::sync::atomic::AtomicU32).

* Fix vertical import formatting (add rustfmt guard comment).

* Remove stray "we" from TODO comment.


diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 5a4cc047bcfc..eec8871aa6a5 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -14,11 +14,18 @@
     },
     prelude::*,
     sizes::SZ_16M,
+    sync::atomic::{
+        Atomic,
+        Relaxed, //
+    },
     sync::Arc, //
 };
 
 use crate::gpu::Gpu;
 
+/// Counter for generating unique auxiliary device IDs.
+static AUXILIARY_ID_COUNTER: Atomic<u32> = Atomic::new(0);
+
 #[pin_data]
 pub(crate) struct NovaCore {
     #[pin]
@@ -85,12 +92,17 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
                 GFP_KERNEL,
             )?;
 
+            // TODO[XARR]: Use XArray or perhaps IDA for proper ID allocation/recycling. For now,
+            // use a simple atomic counter that never recycles IDs. A unique ID is required for
+            // multi-GPU systems; without it, probe() fails for all but the first GPU.
+            let aux_id = AUXILIARY_ID_COUNTER.fetch_add(1, Relaxed);
+
             Ok(try_pin_init!(Self {
                 gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref())?),
                 _reg <- auxiliary::Registration::new(
                     pdev.as_ref(),
                     c"nova-drm",
-                    0, // TODO[XARR]: Once it lands, use XArray; for now we don't use the ID.
+                    aux_id,
                     crate::MODULE_NAME
                 ),
             }))

base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
-- 
2.53.0

