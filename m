Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5762EC0B2;
	Tue, 10 Feb 2026 02:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691590; cv=fail; b=Q46ixCZ3TF+UNUlM2jX4klRyPYpw58KEm6laYMFIWhKa/IRgl4n9tZC5QB3r+7/7Az2ldTv+gFUBzstrXwcVSb34ahqWGkDQqrdvlFTl6YVBur1dTmZR5RkkZF7nwmwP4V5IXX7eAzpn9oa/LKteESJ/1kS2SceSGsmI/luVHkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691590; c=relaxed/simple;
	bh=z2syGlT9Zw+z5A+y9dsvl+eq7HDOFXwCEpIt6A2OXPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZeSoDEn+uPGjXQ4MIQZCnd5dAZTbrxSrXjezVgFw8ZU5QBxzZdwfj336yXKClyKRyrGiKQwenv3a7orRqaptsQIg1ExU8THbtdkYAqOIXWzKIffCFCeYW9ZstEQQ4RMpvw2AswT494dK0X9uMUXFu6UYU1+Bgf7JN1k9HO0HjjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ScrNMbuq; arc=fail smtp.client-ip=40.93.195.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ScrNMbuq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akEW5dtkJ3XUiO4Udt1OBELw5HCd5bWzewdAkSV2wyqYOT9sS00ViMJ0Fjap+lLPfwtGCF0OQtFL9Ja1eEmW2CsCHfAXN6XDD1jHx2g9ytHD9jA+yOboGBeaAmLz70vC6NUZYw1vBUuLhVjaBtdR44v1WrzZITVyBlMa7mLmCZZ+7qmEaVptlVQ6cpuwI3j4j/vtoSPIz/I8jRPx9FFRSxSJQsJTRxX/rXXmw8qNiLmyuPtohy1Cy723m7Xe70mJAUcR5Fx4z6lqMzRuJ7/IMnzn0gauFa2fK6TCy/nMI36oFJS2IVkZAsFgyihIgZRrZ2szr1HGze0M84fsFB+36Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4Z/sEQ8XtnA2rntr//N54dBVt82frihzzBYtGKBEfo=;
 b=UcxIIlqrdE+vwdMZ5EtKinZJE58J3IFjDqjLOhTS5XsT14epwRcledGvtgRLiqGiLOCX228dzO6YgQa7zh2Gm7Jauz9NM0W9TNqdPvoCuw6T3zpZuKsvThzZq8HxMzfMvrB5eSKnMSRlAsfy3hfxCq+K3d6f+yYRly8PntAV4QLDElcvZBk+e47Iir78I/NVacqGrcCldJzq5QPAahKmoaGJ7dUBAsSXrZ3t1F8uuN3G/QCxq4VeZ/I/GKfDloZ6cF/4JjvSu1T6YI7kN53uPd989j7SkR2r3zQKFRWR7gaREQHYKjeYmYkkYgTt92hsic/YcIpluPcELwYQmKNjVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4Z/sEQ8XtnA2rntr//N54dBVt82frihzzBYtGKBEfo=;
 b=ScrNMbuq2Jdq+2QJpcnIlgavFxTEKE2VdOyFovy5A0qLeLGj46rHMM1OgLpL63CU+m1vAAA34Pgw05Y+K6XZvdpUrW7fAAom1/DnI9EQQdiUwzuVGitFdHVdZYZF18maPC9oZCMWNfNPuanbkX8TjmXkxeN+1owvdqCLikLi9YpXWGM5LBkvNyfHzgHaOa6zZUvwnksr9XtnvFAKC4VYhG9gA7bCpQ9pL+r130z8bfCytowbHTtnLeH0Z3TsBykUJzwQo4xVRU/1g1HQ9591LAbjS08T84qAtaQQwEEdSggr+GJhEph4IYFtTxRuZ/ezm1DuE43Dht8u6Yzlytj82A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 02:46:17 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:17 +0000
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
Subject: [PATCH v4 08/33] gpu: nova-core: set DMA mask width based on GPU architecture
Date: Mon,  9 Feb 2026 18:45:35 -0800
Message-ID: <20260210024601.593248-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: fc62f342-c1e7-4f0d-f2a5-08de684e8dc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+yFlgCb6YBsrtVK0V2Q3jaOZodn34pwUtioS+3deyclJQz4w/TgF51tmhtd0?=
 =?us-ascii?Q?tczf6oyJ2JXfbZEVxxW0v6XH6hxBnWUM0+qHw+0ODgvLdIt5YncjiLVnpek9?=
 =?us-ascii?Q?qkwgvf19Nuwkz1kRV8A6ULAZF7PbmBI+4OHADlmcCSwY1ASmgyyIaRHiVfMt?=
 =?us-ascii?Q?mpog0pUQetvznExbq9CX1iSHeiCKMHekGVM41Zkl1j4WNM28428glLUOceLx?=
 =?us-ascii?Q?JQ6f0t+e0peR9Ggrs46yEdUOvroW21RwM/iKOoi6HDB1ijE4X/2qyZCSi6JP?=
 =?us-ascii?Q?DVGmvwHkWySGZc8YoKT6PKzVicNAVeZJKPjvFeFMx2K4MmqgbyJU6CWfjB3T?=
 =?us-ascii?Q?6RjGopK0vYQCzu9Cn99p7ve69QrWzBqy9exhO6h75PtHKXkOmNiV2FqZsJ2l?=
 =?us-ascii?Q?8sI+3CUaODqKowRDjOsAdkpxV73xkL53DLvh08EzL4ZpvTx8enQbFf+rw/8g?=
 =?us-ascii?Q?6HAG0nPrgPTwjEUrgwt9hzWJUdSsscckdDLnUN4Z+1FFHU1jvHXBZhjmQecA?=
 =?us-ascii?Q?GPgr4kcAHSwpIQrNoYA64iHUghAADfz4eojsNHbeIpJfIGJvF2beQ81cLtU/?=
 =?us-ascii?Q?0POEA5ErRpvXHqjvEWJ63da7CNEuKU1evGJ39iCN3SqFgA790I7bXKGNw8OE?=
 =?us-ascii?Q?NW0GD8J6S8IUVrRV6Ksx9TlPnKl9YnC4mD1yCwoeA8i2YhoTmTq9NfAL6arA?=
 =?us-ascii?Q?swZobQt78XOFNgF0quu1Y2BjJWrUHILOs6ibu2mU6tONtaDrNgGQ5u49ZtFy?=
 =?us-ascii?Q?Mtl76wEo5AO+W4BWezM18EtkS3lpaBQwuFQmny0BRM8KwV6WgZ1WEu0JALCw?=
 =?us-ascii?Q?9Z6MHRK+22HZn257M51y+ZUS2R8HIBJT95hbXIbHTMqf2XeDMU5+DGefePBs?=
 =?us-ascii?Q?2/Ih/U6tJIAswClWWn86W6a8Kro6K2/fW2eW5PlxXhYaNolgBmiQVVmDZgcp?=
 =?us-ascii?Q?yrTJKZEJYcvUeaWBXn6p3ZP15e+ItB9tAXhwxQIL4wnkchDZY0m3y8bN7I31?=
 =?us-ascii?Q?MHYnIOh+C50YEYlwC6mctBwP6SbmlZpxFyHQVMP1/1VfBWe2WU4D7uFhoAWh?=
 =?us-ascii?Q?rhxPAQvRRlBSV+E5oh73DdbWPwKY+Iy4TsR0DBJwPzgZpI8TikDhMkaZVs2f?=
 =?us-ascii?Q?t8/4B+X4d5BOaPKt9GuRkC0Fr/T7F1v/W+Li5glNs320f94ZT2FzEkyPBqbp?=
 =?us-ascii?Q?w32+kc9SU1OS9sT238r+eN9lpZsqWv7C+FIVSc+4NyixXG550zElEcN+MH3V?=
 =?us-ascii?Q?fWrxdQogl41iLC2pIkxXl72nUQ03JKGXAc6117aVNl0bu84XNlJhQEe7CMKl?=
 =?us-ascii?Q?PdP1/xQqHJphUclCSvcBHyz5n4z7eiRwn2QWMAr90QFrGs9RNBFgUuJtC7Q4?=
 =?us-ascii?Q?nhHYB5DsTL/C/s4rA5p5dCcdSHGzQJ11yEZ43uJlTMYzNSfnW9/sdeiCM5rZ?=
 =?us-ascii?Q?N5IpwhFknEAkLIfsvzu2il2Zq2wuWgnh6kJNoEYsAtJ+2ZJkMlVdRudDF4fu?=
 =?us-ascii?Q?0X211cNB6vDVyGoM3ErIWFC3yNYDk/7itgxkN7rFr0dWpClcl/JEw/A7yWoE?=
 =?us-ascii?Q?hzSQsWR6f7HpyeXEcUU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AF2Rybna3R6ulhY36QGoEKMt75Tki6QVLTbkIRlcLSIW3v1TiEQU4JoMBMkf?=
 =?us-ascii?Q?+1XGu856J4v8soi0zLYYp+XVjDa+Jj9tYfIkUM1qBvEdsHWHj99gWdy0oL3S?=
 =?us-ascii?Q?vbLejpElCaUz4VCnimpxrs5v80x+f2dwc8YU9cDHrO0x9Zps+L3fv1w637p7?=
 =?us-ascii?Q?8xjhzt33jsPzeSJUDEUdfKjOXqvd2GhbByiVpO2VIWmjot14JbCGXGieaCxr?=
 =?us-ascii?Q?2QqQSEVDZleZreGN3O9p2Y9WvuL7mGlDuPRP0mpTq2imwbZ8dGl2qFb8Fa93?=
 =?us-ascii?Q?g1x17CiTlBRQLZvrXwzdPv5Lg5AQPpa72kp7i0O/ERahdnjNRkEfwALlaQwy?=
 =?us-ascii?Q?capGI9XGgFQkqMkXOrzZIXeAMMuzs+sofljtcwbhcan1ylQ0uqP2Fypx6vjj?=
 =?us-ascii?Q?+ZVgQu2Osl4E01EOvFQjvphs84RkLI1F7o0CaY73yC8XdUF/e1Nte0XOH8we?=
 =?us-ascii?Q?mOpzUYjHL4gqZBVRN1+zUUOJz5YVBckbgrQ9BA7PXbbRsjqd1J0Asl2ALI8m?=
 =?us-ascii?Q?yGEWuMlK3Kbqq3oRuXdoY9BHhJLmTfVZpHEWxxJuKzEDYX/OEBd/W0Sm0lTV?=
 =?us-ascii?Q?5oouuDhrlp50qGYShKfW2pUPkmvZbC//Wte8OpREZuTXbXUWBWZnefnyKC0D?=
 =?us-ascii?Q?e4/PTmiLY7jdL/iT0Aq/jHMaszzY6bJSQh+vuZX8XNjqtNoYEKbYMzxKr6JU?=
 =?us-ascii?Q?jjFZxresmhCxL+vlk9DWhTUuEXpaUlF3K7+e/BankfO8V8aDYewU/ecqfxEf?=
 =?us-ascii?Q?zC9yEj9/m+sxbZ6X70TxVA1B+PPyx9iC8ZjQk1micbXjfhaqYW8I273fb2Xl?=
 =?us-ascii?Q?TWpUNmimGMQCHCZjAoD5JX3mpmcO/mEe1sOz/pJvgiOW2pacY0Vge9szD2xS?=
 =?us-ascii?Q?bZ0lVfHyWnZjSTS5eFkKxmmw0WyaTuDSfrGdTid1MJt2JWDmPGY3e55RVJu7?=
 =?us-ascii?Q?E8aJUhppRguJgFxYUxjlkh4mU0jvqVktBUnWdKEBgvoOdEEKfYzi9Sbzdnxb?=
 =?us-ascii?Q?ZO8sF+WOvPyQZCIM1k9fUDtsV9eW54ZgilVDWKBByWXREDNPGJkeOYaD9b3o?=
 =?us-ascii?Q?Z5UmLIHIaIN6Frzo7/0wETNGtRluws7H02mivQrhgV9C6uB4YR3MEjWDuuk2?=
 =?us-ascii?Q?FD12ndz4P9byMNCRYBNzkP3wkMLBh7naYu5A+J90BNmyYIPPpEjBgTK43WGS?=
 =?us-ascii?Q?VCWhXVaQJ0VhcKkkbkbJHS256TZNlRz1UcyX1+q/x7j926vcQi525OEsKRiM?=
 =?us-ascii?Q?2aE4iTeqkmDF9xh3/rRAF5w35vonfOiuUWCKRekwhiMHCxu1PwS/cvKJst9o?=
 =?us-ascii?Q?rj5Y0mdhB6yf5qayQrCUegqRWnj2wokgo2LV5kr69nBuXiC62qhHxetcXeor?=
 =?us-ascii?Q?5FZa+peDFGvunab3+FMClj4fPz8JMRrgSJUOcXLiZIAAf5eEe5UDmgBQZZRt?=
 =?us-ascii?Q?RVO2QvVtPgU8fXLnhsnAIugJ+s0zYq11oQa9nu3u+TKZDmEfsJKSW12MBjeE?=
 =?us-ascii?Q?utKdwTxL9hTvNXKIvQPyghknZxP2Rk/BgGSlUn73d0GcP+nxkaEWPxp1fcf3?=
 =?us-ascii?Q?6eJhRIv8AxRR/x1PSU+3l43tyIHHNb5HoCWvW1jJKphHSE7DuMIZJCqqh4i5?=
 =?us-ascii?Q?31vqGwftJtivn+nDtmPRJZ34xM6DOv4ybR6215MiqmEav+yVbiqTraLFOflf?=
 =?us-ascii?Q?1Y+NWDswysEmpVjxJ/hCmxycOZLTFRwv3vmYh3ZoKPEpL4QngvsrucwEiacD?=
 =?us-ascii?Q?BMcq++Mgiw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc62f342-c1e7-4f0d-f2a5-08de684e8dc2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:12.9973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kcnAcOGigu9+XNeECIQBRC7P4Rp8pFtQkMpzeZxreYBdMKfzwMXDirW+fMML9CSpX/wcnfHKeH1wYJHgW7jerA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

This removes a "TODO" item in the code, which was hardcoded to work on
Ampere and Ada GPUs. Hopper/Blackwell+ have a larger width, so do an
early read of boot42, in order to pick the correct value.

Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 33 ++++++++++++++--------------
 drivers/gpu/nova-core/gpu.rs    | 38 ++++++++++++++++++++++++---------
 2 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index e39885c0d5ca..4ff07b643db6 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -5,7 +5,6 @@
     device::Core,
     devres::Devres,
     dma::Device,
-    dma::DmaMask,
     pci,
     pci::{
         Class,
@@ -17,7 +16,10 @@
     sync::Arc, //
 };
 
-use crate::gpu::Gpu;
+use crate::gpu::{
+    Gpu,
+    Spec, //
+};
 
 #[pin_data]
 pub(crate) struct NovaCore {
@@ -29,14 +31,6 @@ pub(crate) struct NovaCore {
 
 const BAR0_SIZE: usize = SZ_16M;
 
-// For now we only support Ampere which can use up to 47-bit DMA addresses.
-//
-// TODO: Add an abstraction for this to support newer GPUs which may support
-// larger DMA addresses. Limiting these GPUs to smaller address widths won't
-// have any adverse affects, unless installed on systems which require larger
-// DMA addresses. These systems should be quite rare.
-const GPU_DMA_BITS: u32 = 47;
-
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
@@ -75,18 +69,23 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
             pdev.enable_device_mem()?;
             pdev.set_master();
 
-            // SAFETY: No concurrent DMA allocations or mappings can be made because
-            // the device is still being probed and therefore isn't being used by
-            // other threads of execution.
-            unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
-
-            let bar = Arc::pin_init(
+            let devres_bar = Arc::pin_init(
                 pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0"),
                 GFP_KERNEL,
             )?;
 
+            // Read the GPU spec early to determine the correct DMA address width.
+            // Hopper/Blackwell+ support 52-bit DMA addresses, earlier architectures use 47-bit.
+            let spec = Spec::new(pdev.as_ref(), devres_bar.access(pdev.as_ref())?)?;
+            dev_info!(pdev.as_ref(), "NVIDIA ({})\n", spec);
+
+            // SAFETY: No concurrent DMA allocations or mappings can be made because
+            // the device is still being probed and therefore isn't being used by
+            // other threads of execution.
+            unsafe { pdev.dma_set_mask_and_coherent(spec.chipset().arch().dma_mask())? };
+
             Ok(try_pin_init!(Self {
-                gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref())?),
+                gpu <- Gpu::new(pdev, devres_bar.clone(), devres_bar.access(pdev.as_ref())?, spec),
                 _reg <- auxiliary::Registration::new(
                     pdev.as_ref(),
                     c"nova-drm",
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index b6a898008a59..24feb0e8723e 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -3,6 +3,7 @@
 use kernel::{
     device,
     devres::Devres,
+    dma::DmaMask,
     fmt,
     pci,
     prelude::*,
@@ -102,7 +103,7 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
 });
 
 impl Chipset {
-    pub(crate) fn arch(&self) -> Architecture {
+    pub(crate) const fn arch(&self) -> Architecture {
         match self {
             Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self::TU116 => {
                 Architecture::Turing
@@ -155,6 +156,19 @@ pub(crate) enum Architecture {
     Blackwell = 0x1b,
 }
 
+impl Architecture {
+    /// Returns the DMA mask supported by this architecture.
+    ///
+    /// Hopper and Blackwell support 52-bit DMA addresses, while earlier architectures
+    /// (Turing, Ampere, Ada) support 47-bit DMA addresses.
+    pub(crate) const fn dma_mask(&self) -> DmaMask {
+        match self {
+            Self::Turing | Self::Ampere | Self::Ada => DmaMask::new::<47>(),
+            Self::Hopper | Self::Blackwell => DmaMask::new::<52>(),
+        }
+    }
+}
+
 impl TryFrom<u8> for Architecture {
     type Error = Error;
 
@@ -204,7 +218,7 @@ pub(crate) struct Spec {
 }
 
 impl Spec {
-    fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
+    pub(crate) fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
         // Some brief notes about boot0 and boot42, in chronological order:
         //
         // NV04 through NV50:
@@ -234,6 +248,10 @@ fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
             dev_err!(dev, "Unsupported chipset: {}\n", boot42);
         })
     }
+
+    pub(crate) fn chipset(&self) -> Chipset {
+        self.chipset
+    }
 }
 
 impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
@@ -281,33 +299,33 @@ pub(crate) fn new<'a>(
         pdev: &'a pci::Device<device::Bound>,
         devres_bar: Arc<Devres<Bar0>>,
         bar: &'a Bar0,
+        spec: Spec,
     ) -> impl PinInit<Self, Error> + 'a {
-        try_pin_init!(Self {
-            spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
-                dev_info!(pdev, "NVIDIA ({})\n", spec);
-            })?,
+        let chipset = spec.chipset();
 
+        try_pin_init!(Self {
             // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
             _: {
                 gfw::wait_gfw_boot_completion(bar)
                     .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
             },
 
-            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
+            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, chipset)?,
 
             gsp_falcon: Falcon::new(
                 pdev.as_ref(),
-                spec.chipset,
+                chipset,
             )
             .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
 
-            sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
+            sec2_falcon: Falcon::new(pdev.as_ref(), chipset)?,
 
             gsp <- Gsp::new(pdev),
 
-            _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
+            _: { gsp.boot(pdev, bar, chipset, gsp_falcon, sec2_falcon)? },
 
             bar: devres_bar,
+            spec,
         })
     }
 
-- 
2.53.0

