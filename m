Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31283358DE;
	Tue, 10 Mar 2026 02:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108707; cv=fail; b=eE+cC+h0Gi2HwEH9HKbewtcI8s8W0mFXboHeuIBDkWK9KqHlIbdwQ78InuAieKEBfehRCPH38wqeG2MLWVA3yuHCnPyHfVMIEFpEC+HAJ0e06Qs9HPbpZ0CAv1uuIdxm6Gs5PY2TEmpRfrscNTL2Oi9D1E0hdslwrwEVzYAX510=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108707; c=relaxed/simple;
	bh=VtMEuwcTBw+xISpvWrqx49T0DNX9ZNEpjrwDjCzHvXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qs9GKJB04QYPYQoQgyzZxJbYYT9NwnWW1UbMWZOu2ttTewIRV3NmN9cBhKZnDvZ0MgHMXjCdLxF8QcPL/wEtHit143a9N8ybrkLRtgIojuGOS2Hw+L3S24B6XEnSEwiqf0FDzwLctm0zuOVexOMo0MYAW06jt8mW03zEanD2bHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tPGfEjpL; arc=fail smtp.client-ip=52.101.62.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tPGfEjpL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSNJgZ5KC6JI/8zne2tmpTjW4t/Zt6NvXHCv7vIjzK5VtGP/eVy+47u3j205CVkljgLwzvVRK/cZLAUfhb5HEOksCP9ZX4Jq1pmREBM6+52UG0fUe2uJIw+MmnDh52CR9y/UHLwNBNUuuAbexa5RZfgxJS88LXQ8gJUDbybycLEUzh938pzmIqrqRmrTOdXGE8lVENBukTBndT1ds7hxoxX8wgxqDWRLXGDFVsQHE6MepNd1pO06uNcCNI0pJJn/crhdf2PWhilFQAi2Csu6NGvY3qliAeV3hUn29X96akbv6QtfGoNFwJWwYIYOCMHKOFkDkcdHbU8+Hec5ekmCsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTlaPYwtd/sdS/TEnsGxPpH83H/2IusT3pCL0acj84s=;
 b=GXwmQ7ZdsHeHCJxy5FbuASYBvfQUOy9uHzHAucUd6cXnL97ZLT5cwtKIa/aEAHuwV6JBoWAG++mtEg+QXxxkDB4cK4SLk9CUnWpJlAXmA+vhH3O6QlRacnQrCJau33/ekZucYe9ulkJinhKzBfoWJURO38TmIBw4R3DwO+FTs/MYsRvKV94KmEzBJqmKXaL1cjVgbbB+lekhITAlKgtp9FHBGQlgoWbAA0btOFH2xHkaMllc8g6NJ5Fk/D3albjMsBpQIeHg/qwaeQLVnVcyCU/wooKxzcvrNrj9Q3O3xrUE6AcSOk7dyWshG9K4AtVeSkJJq+XVCQEDCiW0SuudSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTlaPYwtd/sdS/TEnsGxPpH83H/2IusT3pCL0acj84s=;
 b=tPGfEjpLxdZv7edjzAyGKKIg2JFUJ3Tu7/2jRrJyTaKsebqcVaMxL/o7h9Tnr+JUMCM2huA/yXWN8vSoZVP2QvlGldIYiVUi2mS+Kn5cw2JINcxF6MI5EZWJ5rhCLhtjV+YQlFMPk4ZZm3jXbZE1eMPIjJdEOgjD4h1okTxoKiGsEhSjRC0byNCX51yQb+WE8fYNs2NXpuR/782p0CnHqqYFbqcbWT2USgsZ+1P3LSZqvwLmiz1NEixeB96sKE7szQOxscv08bJGgYFd0MPoW0XZuQwZ8YEfZbYHTxaGW2U/K2Pz5F/Fik0YwYXrEpCv/Bz18YFbStc42t5Ou8+lZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:32 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:32 +0000
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
Subject: [PATCH v6 03/34] gpu: nova-core: Hopper/Blackwell: basic GPU identification
Date: Mon,  9 Mar 2026 19:10:53 -0700
Message-ID: <20260310021125.117855-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: 3856dfe6-c699-49d1-50c3-08de7e4a591a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	cQeBkeAsjRjtE+ihRvUVD+jfXJUvEe83Dv15jA0VT+du1h1BnVTjvgf1r/11NrqDtCXBSpTJG0OlvDt4ulNXXCzu/PmanDe/b6hcJKa3/nAtJnXLdO861pwhrOjjglPFlVOZKn4AvltSAa34vhLZ97Y4AnccgnzCunEt0UhqsEEEudw4lIQs8CEzXKNvuRhO20z1rCngMv7L/CqhvF/k5FoPLlqcANBtmkWcchNoGtEn1OLlx0kpkgtBGFNFbBeWPoFQV2i2i/J46WXy97bw0/IFBIV5+lDffn4awks2ZXPpIdDoMlqZLOmN2YEZFDGNSQ9m039b3yyYO9az5461YG1pd6zW4Awg1rJJSVWgcrzbwxeP2SK+SI+boVzdO/G5MFwxgSWPvEFJtEsoVc71EfCx+iTvRW3blLzRjCsG5IKeARg8HgFDMQTkzuOZ67eMbtS6at3v5Lqsy1DkdWDkE4M8TFfdadaYSGyNG6MzLYOmoj4nv2B+qH526vmTacsKS2JHrkIXKQTL0F8mLCf+H/qXfgdunR+wrTX/GArb2jytYym6KxdHsgIrGA2DJ0MRJkYG3TOF7MXTl23QZY+Ka25VlceFprVkfdDlUVkPs11CbOiL0aS2a6wVrDvXG6GR0Heltj3zrHZB1MSgSAdN4whc3fUtiIm4rN1EwYhS6aPfr0DwVz0jdc8mloQzyWpf2IXJTPlv0TyJGD/4N+VESJo40MzbR0bp7/MibdKgBeU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9/5S8zYo9YH09OIDxp3/dogvh8m3QzlKQpTTb9G84I4C8YrieJvDlDQopXv4?=
 =?us-ascii?Q?r6dem6EGyIKkdptophCHfgzynuVMHDi1cXmhXroyud+zdRP3RxpYwai0Padu?=
 =?us-ascii?Q?kTDCzM3rgHFjEA7MBi0SZ+Dq+Ysi0EcH0+Hb2jD3QvEGRTAbVXzRjaDvhJgt?=
 =?us-ascii?Q?Wo1jcUnHPFKA4GjK1+u4Fwv4PHwNlAUjRd0tKElNkPCPEr342kEEj0751bOZ?=
 =?us-ascii?Q?hLb5F0xk5dlT1ydmn+FuIqRNDSYoky1YASOaWCV4UEGzgpx+lQdoyjxeG3cG?=
 =?us-ascii?Q?ymTVz1Klbr0IHU28ANWJ4C+/kHxrO/eaRmF0zq7aUQGyURfXXg0yVymf3A66?=
 =?us-ascii?Q?Iy71DNh/+ITJPzdqWv6Ad+Jr/rxxDu+/ii/GIkhETvZ5b8lmtrSxFp6Hdzbg?=
 =?us-ascii?Q?SriD7mIrMq8ISI/L2sD+RDin2yI5njful10H7tOtUwqIUJWWRmKfkylickn4?=
 =?us-ascii?Q?7fiAHE37vk6p1XELNB1DYR2CvloGJzNAdrdvbbh/xKRbJF4JCIphdgVCp5zP?=
 =?us-ascii?Q?/RanprjcI3QXb5iKQkZ3rbSS1ooO9gaYrZx/1Y/5ln0tZ1G8/VwlJD+p5Bj6?=
 =?us-ascii?Q?lE4vI9E585VBLCJnsk0+ZePcNlXPgTbZhn6FTvN8r8eecOedqssQJ8Ku9axe?=
 =?us-ascii?Q?6BadTLOmuNyNUJU+UP9F+7heqcygTKcLAFgLoRxN3xpkDV/ZQSIgJk4+mRs7?=
 =?us-ascii?Q?QUAmGsde/HnI8AZ7/45L1Xln4G9zE5PDFRKkHtJbc6kv3nZq2BtmqhM8BfNR?=
 =?us-ascii?Q?yLqZdEdHBnvmH4sNsUtkM+Jks1jaf4wPZ+enD/8hijX9snzoQa5ZskUur8b3?=
 =?us-ascii?Q?zQxaSRYdDEYzF160ZOZ+r8ouSWoq9rKCe33mVyNYAHlez6KVgkoL2Y1HP0md?=
 =?us-ascii?Q?m4LlxITFDa/dZliai3aLoG3N7nMgSNHtjVO8e7U9Lt+r8+sa46oZI942V/Rj?=
 =?us-ascii?Q?qSZp/FJ573BE0vgMnL/S2axPKdWzOJJRdgz9pkOchnjDz0yn3kBYP9nnH75Q?=
 =?us-ascii?Q?nq+qs8ln9dM3ijnFv3+MxwOi5C73MSBYqrU/7R4xVImf9h0AIeXEcxcVYahK?=
 =?us-ascii?Q?bc+kpMWnjzd2d8lSAaB8kjB95rdlxcGNSkq2Jk2LmrNnPefrHtSyHcjcEZSY?=
 =?us-ascii?Q?+IMH+nLvt/8sqZcJZjyiRK1o98jQXSObjBnkrNTR73CGtBAz1s+f0KsUdjfC?=
 =?us-ascii?Q?N46iRGSrzjm11RxEAzCCgCvWbZIfs2GKgKF16V30AFnj3fDTRuH0W8yCp+3p?=
 =?us-ascii?Q?x+73HbLKbBDMs5nlgVyZeruTc0BF4l8b0/uCeDr+vz+XBQECYwY5DCMFcBvt?=
 =?us-ascii?Q?87kKH0oDJA/6QmGW4UK5rNV2QHAiXaAbhu1AW8KCQeNtun8W7DLkezUH9DTP?=
 =?us-ascii?Q?8TBF9w4+sriDApD5EaATXw6Rg3wDx001zNi9XvfRU/K9cDpAT695CevUMjIc?=
 =?us-ascii?Q?1KviXrW+rOjynF/xjsKLeyE2LjWs6T6zzu+ImEFn9Zlg+qTexg2Ay1GKwzJN?=
 =?us-ascii?Q?EcK8maM3k+W6YXJYQRlut0b3uphIJNQsZQb6fyZkQ1Gl74qGXnM1cn15uz3J?=
 =?us-ascii?Q?FmlgGtD2JCcHNy2eQTWM46rCiysOpZnUZCmBjT1YROefauVyGqkSKi1nlAmc?=
 =?us-ascii?Q?MfOq5AeYyRucDaG100Pxyxl6aQudZpR6HXEUJDRZ40P7Mn9DbYV+g3VLVq/M?=
 =?us-ascii?Q?y2xcy4Zh2aL/MoFeGhOlMpXnI8SUuIXuLv4FD5MIAN/FZ/ljVH/FMxjf/FRa?=
 =?us-ascii?Q?xac7qW94pg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3856dfe6-c699-49d1-50c3-08de7e4a591a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:32.3222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+j52UTK6RGwd7LRkU8is7lYbAKrgsc+wOkSSz8FC2CqFisNjZ9E7t8hyPvFuEc7cpLtYN3HVa69k19Qg62eNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930

Hopper (GH100) and Blackwell identification, including ELF
.fwsignature_* items.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs   |  3 ++-
 drivers/gpu/nova-core/fb/hal.rs       |  5 ++---
 drivers/gpu/nova-core/firmware/gsp.rs | 17 +++++++++++++++++
 drivers/gpu/nova-core/gpu.rs          | 22 ++++++++++++++++++++++
 4 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index a7e5ea8d0272..c7f12f2a7a35 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -80,7 +80,8 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
         TU102 | TU104 | TU106 | TU116 | TU117 => {
             KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
+        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
         _ => return Err(ENOTSUPP),
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index aba0abd8ee00..e709affaa7e8 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -34,8 +34,7 @@ pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset {
         TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
         GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
-            ga102::GA102_HAL
-        }
+        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => ga102::GA102_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 9488a626352f..bc2243450989 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -222,6 +222,23 @@ pub(crate) fn new<'a>(
                         Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
                         Architecture::Ampere => ".fwsignature_ga10x",
                         Architecture::Ada => ".fwsignature_ad10x",
+                        Architecture::Hopper => ".fwsignature_gh10x",
+                        Architecture::Blackwell => {
+                            // Distinguish between GB10x and GB20x series
+                            match chipset {
+                                // GB10x series: GB100, GB102
+                                Chipset::GB100 | Chipset::GB102 => ".fwsignature_gb10x",
+                                // GB20x series: GB202, GB203, GB205, GB206, GB207
+                                Chipset::GB202
+                                | Chipset::GB203
+                                | Chipset::GB205
+                                | Chipset::GB206
+                                | Chipset::GB207 => ".fwsignature_gb20x",
+                                // It's not possible to get here with a non-Blackwell chipset, but
+                                // Rust doesn't know that.
+                                _ => return Err(ENOTSUPP),
+                            }
+                        }
                     };
 
                     elf::elf64_section(firmware.data(), sigs_section)
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8579d632e717..3b4ccc3d18b9 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -83,12 +83,22 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
     GA104 = 0x174,
     GA106 = 0x176,
     GA107 = 0x177,
+    // Hopper
+    GH100 = 0x180,
     // Ada
     AD102 = 0x192,
     AD103 = 0x193,
     AD104 = 0x194,
     AD106 = 0x196,
     AD107 = 0x197,
+    // Blackwell
+    GB100 = 0x1a0,
+    GB102 = 0x1a2,
+    GB202 = 0x1b2,
+    GB203 = 0x1b3,
+    GB205 = 0x1b5,
+    GB206 = 0x1b6,
+    GB207 = 0x1b7,
 });
 
 impl Chipset {
@@ -100,9 +110,17 @@ pub(crate) const fn arch(self) -> Architecture {
             Self::GA100 | Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
                 Architecture::Ampere
             }
+            Self::GH100 => Architecture::Hopper,
             Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self::AD107 => {
                 Architecture::Ada
             }
+            Self::GB100
+            | Self::GB102
+            | Self::GB202
+            | Self::GB203
+            | Self::GB205
+            | Self::GB206
+            | Self::GB207 => Architecture::Blackwell,
         }
     }
 
@@ -139,7 +157,9 @@ pub(crate) enum Architecture {
     #[default]
     Turing = 0x16,
     Ampere = 0x17,
+    Hopper = 0x18,
     Ada = 0x19,
+    Blackwell = 0x1b,
 }
 
 impl TryFrom<u8> for Architecture {
@@ -149,7 +169,9 @@ fn try_from(value: u8) -> Result<Self> {
         match value {
             0x16 => Ok(Self::Turing),
             0x17 => Ok(Self::Ampere),
+            0x18 => Ok(Self::Hopper),
             0x19 => Ok(Self::Ada),
+            0x1b => Ok(Self::Blackwell),
             _ => Err(ENODEV),
         }
     }
-- 
2.53.0

