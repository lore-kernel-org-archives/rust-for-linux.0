Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C79320A0A;
	Sat, 21 Feb 2026 02:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639805; cv=fail; b=IbW2Xj0XjCIjcITU7JVg4zc0SAu92YP0Mwaqy6/rNAOkmm6zPmWrdqQyg7QBhIvepUO1X7/3KzsIn7h7N10i0StaJW7G/p93FaLUwCMBUV3aHxJFeQEkCPd/kJSerpKnq6KoP9240suJNBfq/4iTic8wqayGWTeUbHJGylCLQW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639805; c=relaxed/simple;
	bh=VDMdJyIpmrwzUygAMwraCrB89gcA6B7bO3i3BVG8QPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZRVN/XGz/hJ36Do6cFAeWpqcRHtGs1aYd+4OlpH8YyFcKARlYw+Icb4xPmppU/CcwLZyYqMAkdIStlDzLMJHHRAzq0V9h5TTucpODulwFUz7/nh7HZE1+dEbt3b3m09ky4gE07R8rXY21mvTMfwdvnJQoJxDZcT2KNl+j3pYwM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KSybzpeI; arc=fail smtp.client-ip=52.101.52.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KSybzpeI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VrfXDwxtdpj5a4B8Ey3HfCFE7LTOJdhLdPqGEXrzchRbRmq1vuJmadrqgOrKUWtHSeFfunw+RYAN7yyNAu5alYxdIjv235f1ngC1nFjUTyTuVxSoIMkl+TUiRzL6/v8ZQgCBeUyupl3xHPe2Hh2S/y5lnoyQeoGD2x0Amt7m/x1ch0PA4gyBk4Qw1Y6FiN3F0VzkN8JHK1sIf9YxY93nr8dSUhXk63XgAQwxhBJsoWvjBUtqbesdFoWucElcS4wWoWQOLDDgR1FFA9cBPvKKOh9fXSxCIi4moV/R6kkR1bKUssUYzyRQFKYaiiwp0EIk3yC9VDGmPXx34Or545kxGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=augYoep9fG7JRNxDzNw7Rdjv/E7RGyOor2DPxwe1Lc8=;
 b=auX4GM1HkZhQZCdwhYmAn+D/ye4aBTrFPPZuS6+f40GCGI7KiQgb+Wy/o/zSwtO6KhOXJ+REht4k6QPP3rZ8KSmyCJ5sZfpWzKU9a9DWPObv2QuHitTPiVjwUOhkZVsbVHiRF9y6PsbaYmkXs4cyiXZzl7EjbN/aIQxrs6XzQzZLj2yo8XgsQwtu/3WCjIJEEwJ5yxm8q9XqKrnCUx1h2T4IrF9EpK6sGih1y4YnMOYQeIkP9MWlZmKDMfSwgGVkuGk9jgm7hyvcL+RZ6CkUbt1Gd/wHTX+vcpFBEQcz++GLDeh5tmqcAA3RK8iEFrfhnUf+A7en1hkYE7SuLYSyDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=augYoep9fG7JRNxDzNw7Rdjv/E7RGyOor2DPxwe1Lc8=;
 b=KSybzpeIQpbNISuyP6CxfVdqbdnoPitRHt7DX/ey/LvWn0zMaqrSAhj1s+ezMCYixTnDRcWZgzxcBpYLE0p9N+wDH9yfl0FLzLmFCCE/LBXAE4D9zVVmpUBV2/DH8khSEf2m2/CuKUfeWq8zN+cQDnMbSJO4CAnSGubg37YRdI5rvLU9paIv+mUft8c4RlI+IIiDD2YkHsY7R317J/M89UAqeh2NLar8bLipb4/kgLyxLOalBZspnWIaZpaYXq9ALsRnLj7lirZYHKVy8NxwAgcCj8nJ/LVfQ/UKdJoyyfKtMFuBGOerrH8ZPXSpR9cJ3U16bRM5kLOoDeFszs5D7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Sat, 21 Feb 2026 02:09:56 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:09:56 +0000
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
Subject: [PATCH v5 01/38] gpu: nova-core: fix aux device registration for multi-GPU systems
Date: Fri, 20 Feb 2026 18:09:15 -0800
Message-ID: <20260221020952.412352-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 12696580-6aa4-4388-c160-08de70ee4ecd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1160gaffmvFJKFRKeQeKnfuXdmzoozPAdVKfv1cIibkeJuoWpDW8B32bD2Ob?=
 =?us-ascii?Q?IVFd10IEQHde5oDIX/0LXJjhEIWJhq2p/U1bcZetphtgkbIfTj/wMUdCFUQD?=
 =?us-ascii?Q?gTSdirF8Pp70N23R8b+YgZIJ/X/PXvJxDPQqB6JsobQcOtVGtbhXuGTajQe8?=
 =?us-ascii?Q?tK8HPj8azGdEpGHFlkFstC8S/cLXThwx60PeLX8mD9EoccZCxHDppAm9nRtn?=
 =?us-ascii?Q?F35B1Ejl7VswpNVK03uOrBd1TBFBMj3FQvPsyWhMBSrmRA6q0whiRIWhXuSp?=
 =?us-ascii?Q?CARZfX1NwURXzJoxnNH6go4LKmT4lYCu5sisc9uH9MFolwpFAsNe+AnXGmfW?=
 =?us-ascii?Q?1njrPwp5G9eILVAFKgHpYWW2w8ypxtYBpt2r5CIAVMe2cmT+aDd69IVYwrb1?=
 =?us-ascii?Q?E22CTPz/uPru6wy834qJtFsnGE3ntkwfcUorMllGtevtyQ2TBhUJ6jHgK0F9?=
 =?us-ascii?Q?PFdkpzQwpmZpVUkViZrHbxeD652C2+PMpUyRr/kpig7mvO4OhG3Ir2mam+DI?=
 =?us-ascii?Q?i93QuFIi/8qITNHwXCLa/Ah+PL5/u5aYMBC+eqwEHDSGXWIqlU2YWJ+OtbN4?=
 =?us-ascii?Q?JebnDLWkZJLTfmOaT+VvC8NV8+FeV2AVGRqeGMQtgYL2BVJ7F2WWAOumb+ge?=
 =?us-ascii?Q?g0nxXdl/sJAO05/Pk0FKxcwxaUVyUuQhZ3mZX8yHGTCKu2vftZR2geLcY/jY?=
 =?us-ascii?Q?CCWfYXGHx8MEoZQWKmU9plNvb4gF52SvEql8ZARrX+B9x35R3i4olhQA7X5g?=
 =?us-ascii?Q?WEbsV/hhg3Ty1bQiOH3H1n+C4iog1ifyYAQqBdJXC/yZWbpWUaNu8oQ4esHE?=
 =?us-ascii?Q?0yVBqEe+JIDmW8BHaAoqZvAnWOFQgPp1grz4zu3fk9Db1VTlkLdGrKhln5JI?=
 =?us-ascii?Q?NSGjS3fghBAT0FtzR3Hma1Xb5UdtcadRXsh3uldfQVYviq5LdFQcukAyEFgd?=
 =?us-ascii?Q?RpTn+ytkg+QeQl58+1zTTX36wDsrBKLH8BL8bOFMVoZBS7aGmiqtO4BmZE16?=
 =?us-ascii?Q?U4H4UoaHZpmC5xxeGRjNOMl2tA5Wm5qZ7De8QU1eaw9YlFeTVf17SLgp6zfD?=
 =?us-ascii?Q?Ze1BRt78UqOWEMvEy63DhSz3JroFlprjjsaLZBfCysWbXIyqI7c2LS//ul9T?=
 =?us-ascii?Q?8pSvFw0Ufj8bJjlpXlJXyMQps/jBsYHmVx7suSW9IBJGhovoM94BhtgNBRis?=
 =?us-ascii?Q?sXXbBmLeL1RHYlzyY7Bn07Iucyt2I0jRUwD0pAPk++68oCYdwSbwJJzYFOxQ?=
 =?us-ascii?Q?i1YRUGsAKM5U98qrkg27b6z2IS6Cb45VyD+JV7JwHpNno11rtmNfVCHZJtJE?=
 =?us-ascii?Q?fsrfj2Nov86tU3qBUrRBc1pQHgyZQSvOMQWLc707Pdd8Ctsyii18H1Q5G4Gf?=
 =?us-ascii?Q?PEKDczy+PgrA/O2780CBIzxnv73rUZp8Lm/NFhvxtN6n57XVJ22RsqSWeprz?=
 =?us-ascii?Q?mNTTxy/hZJG50qYGALRVgCdBmFLZu80QMp1iDXUV7BLEoDuciUKSj1YcWDqU?=
 =?us-ascii?Q?04UXG84rMyE2hQXbfEdMR6ws8SwCwcfgCdjFcHXXJ0HabAm3jdjoBhL+aqKW?=
 =?us-ascii?Q?My6+yI3C/q+p7ZjNCqI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bqwBv3BV+V/6ThfTQAKp5WMCffWUVPS6mttIeAiLKw+kJ4rGdMfd2mnGjMah?=
 =?us-ascii?Q?hGidUVdgHmJyjpN+jJs0xwB6m+wOWzTQSoVQ41+bSE6M5G/N4E55uE2zDg+z?=
 =?us-ascii?Q?St/lZ1qNCgZDl0rlyiBvuFg9bPv1NQCgyIJFTWdj62bbt3XUowCeV38VQM2S?=
 =?us-ascii?Q?m3Y+u+2VZJ7mS+dXGcKf6i8C3mDpurUZgGzfiUeX8Rt5sDe7dGQejD/rp9jP?=
 =?us-ascii?Q?viucLn8vY5BjcMLOQOusBQlTg1UMZ0uSRomtYsSNPNdRTlGPo3qUoD8ZNzc0?=
 =?us-ascii?Q?mJLJ0N5w3o3L+BSvF1gftKssCnw49MTDoAPe4hbZfkyInAfDmY0Y0Ok1iTKB?=
 =?us-ascii?Q?yee+jWsEq+/9PIJmFYUyeGo6Fvh/a4Kq+KEXNM7PMBKpNnzftVUGvczbHhv3?=
 =?us-ascii?Q?BF3i6N7A2uKSzgPVHy0E/AMQdE+wQSCcuUUxlGwLIvfcIEhwFm+1Rjrj/1JF?=
 =?us-ascii?Q?9hwSH1Rd8I9Qu4gkn0PcxaZ6X/4OO5r1QQUcUy09D/Zdp0lI97BwvLug2nE8?=
 =?us-ascii?Q?bVZH1BkoULle8XTZGFXn+cKRFZN+sQ2YH2jzLyK2ksnP6vAZ3CbPFg3gJ921?=
 =?us-ascii?Q?f9vo1ONUo4ue860TIgq+EZixpNcYa+CeprYIxnJGQxTVae88DDKM7yMFVphx?=
 =?us-ascii?Q?UbF/WadvQFy9fFvfshCWa/2XCuoOSS7ysRgZKCXSOPxNlO+B2uCawUrAPvr1?=
 =?us-ascii?Q?JeKjVGEXHiIaFC7/3mGGeT2DGi0Q6Z7E6HKxKcnYa5ioELNBc72s+il1/sC2?=
 =?us-ascii?Q?J5gz+s99ir7LSigQt9viUkgMwog1VJHSJQGzwMM/t81JPROc/CXK/RP6byNd?=
 =?us-ascii?Q?9fU+1tdOTr0Sma+pCXEiRqqoXCfG+Flm+slR+BqqLIqQdp5m6S9yxXUTyOWd?=
 =?us-ascii?Q?Hf7h2umaODDgDvC5ZybLgBOSDMOSl21SvpwyAYUmlLbSLN94pZzO2Yby261f?=
 =?us-ascii?Q?w1lctwdjpZwMEdzo8VQ+UF0IvzeK+Y6QHXv6fobphWypZHW3fKXTFZy6bFe/?=
 =?us-ascii?Q?iBSqNRTazO9ihTw96+Bj1duPiQbpcGZarZPFTmiE3IzOoxYH/sQPs80KtvCJ?=
 =?us-ascii?Q?+4fA1/oxUMDp1733A0+T6VQGngSmsadX6o032u0t2P/WPy3GOGdhhcHh3jAM?=
 =?us-ascii?Q?R4I+RXZt4XoT79PbUZ5SeMawPzIOUjTJfFTW4A1XtxWLAXQ76a/8PHb+9D+N?=
 =?us-ascii?Q?e2kcBD+h/Uxcg/SlpGfGW9qQfT0hiXfcEdiKwN1LvldjgTl2elOPEwvFv23g?=
 =?us-ascii?Q?5pQtbCIlmCH/7nYWYiPSt7SQik5Als1yvELAxqm3pCNWgQ14UxJCWwv7vuk+?=
 =?us-ascii?Q?zIjlQETs7C48zP3HSeLQkKlKKRKjjrxIivRralnmZyTfUXQpW10aATvxzzft?=
 =?us-ascii?Q?JZJ4GPQ31WMrx8BIRx+Ir59lAxTsJin5RFj1AZFxHNp0tbZam/+8qMtqwmPl?=
 =?us-ascii?Q?n7tn9jbABkD9EFUvcnUQBsS3gITXAcD/JA0hCEIgxCkCb1hoREuiXC8n96it?=
 =?us-ascii?Q?GBUSK1TKc0PDxn27YIh47Kn/rU26bo/jJjUeQcn4DTQmlOpricapg7AdFwiE?=
 =?us-ascii?Q?IKU6ef2V4Ly+RalE6S/SvYqEsoNyuuw5rzgsnPfmbCqcoK5bpNw7Q4h7DuPA?=
 =?us-ascii?Q?16Ox8zX/dtjrGRQ1kq9fQYrlDEP9CzivlYfNaMHCZEJcrHeN292JM9vTYYat?=
 =?us-ascii?Q?65iYqV7gJq5PCDYO1GsqoHy888AkzlQ0hfhN0BpbLtrgE7H2htf0tRK9BZso?=
 =?us-ascii?Q?0fGPHnbCig=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12696580-6aa4-4388-c160-08de70ee4ecd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:09:56.1333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: clODZtpYchJ/LoDQr+U9SE6V+2Q1YbiVO93vjvi1Fe/DLsWUqA2YytcEN0ucoHafgDZOIRBa9OTUDr2QHtz9/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106

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
index 5a4cc047bcfc..fb54f28f6da1 100644
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
@@ -19,6 +24,9 @@
 
 use crate::gpu::Gpu;
 
+/// Counter for generating unique auxiliary device IDs.
+static AUXILIARY_ID_COUNTER: AtomicU32 = AtomicU32::new(0);
+
 #[pin_data]
 pub(crate) struct NovaCore {
     #[pin]
@@ -85,12 +93,17 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
                 GFP_KERNEL,
             )?;
 
+            // TODO[XARR]: Use XArray for proper ID allocation/recycling. Until then, use a simple
+            // atomic counter which never recycles IDs. A unique ID is required for multi-GPU
+            // systems, because without it, probe() would fail for all but the first GPU.
+            let aux_id = AUXILIARY_ID_COUNTER.fetch_add(1, Ordering::Relaxed);
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
-- 
2.53.0

