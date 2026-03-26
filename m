Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0391F287246;
	Thu, 26 Mar 2026 01:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489161; cv=fail; b=lVtWnmDlQSK0eZznjAFocgl6OMhNqrx+v8gOUcMYEIY9UcaVNmzxFBmK0tqqN0JPpl/QFT5nQayx9+xImjtnGoXGhX9FYPqXy9AaCjkIg2lBTMRMIUHlMECVP78tfOPqKckejAGXAcGmAGOy6vfLo5fmHN8pCIg9UohvfsF3lpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489161; c=relaxed/simple;
	bh=6ZpvBBKZ2kRaf8a6wlGbfZAZxnK+bc55UCF9semwEDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s1B6psEVC7JB+gyc94l1SPXQKySPi9aQK3SDaeY91vpdMVFSq4E22CJ2M+a83fOxT9NHPPHbTZ4qZB0bhQ9UJAOyh25PLEA16jrJdvfNRII7tzC48gXbJ2OeZ85xuOSy7nbvEUsJVUST95ecyy4AbbqK2ZIpiGeG3MCv3VXr0eE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dmbqg75Q; arc=fail smtp.client-ip=40.93.198.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dmbqg75Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADFm2FPRb0YjFLo6iIWnJI48ARbt86dRxi5eLa+P2YRqhmXoE82JbtwXQt0pNGTcCnGCPanR2GVPHTrciARNao/tvBt/5O+vSAz4E8TYPyMjfsr2fMieQmT6kr+Z7ocPdESDp5h+smtl2TV79EgHxhQ91/hONSHFVXNTjGTI2ZDuslwYyQEExiS4c2VuWC9KUdWIXieSg+zzWn2YsMISmzcJVQxTlhf8sIQ0o2MLTPCrimpAm4Ron+0PSkDWAk2j3Etr3J62UZDmF3R1sok/cqQ8Mc8Jgjp/bSDGukTMR03LnjBucpm3hAEEAwIB8mmCUwIci7bwMJlsQgo+41kMEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0TTqPHG63uxYukxsRAQbtKnxHF85saLZ0yL9L4ZvGk=;
 b=jaGe5JZFCLCB/VqRlbjnXAI2GtYN76jz/kv3gdNKkZVR6B4/AwKm+7xcGRLvnfXaxzldgfSLFi879dxNOsw6LcQqhFfEZgeKUaopWLN/ZPnPP23McYqdwiQ2VNiEa126RXuTZvQwH6X5VYJ60CQcY8vdDaZMDSH9SrSmqWpgc7ifgCzzVZgQnhkHJ/hhoqiu1GaqKffUlxCRP0srqyCpOxS/VoCXT98NaJstA6o+ruj+pj4JSFSrevRjPFx+ix9UgA5q3m3mIo1GKUhUiJUrDb2OZpawsrWwT9ONrE6NJ4o9oeMRNAJeJQ8OTudM+XLbpGqmd1peSAS1eVziZu8kSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0TTqPHG63uxYukxsRAQbtKnxHF85saLZ0yL9L4ZvGk=;
 b=dmbqg75Q+8VZbTUlwArX1ZED54kZmCU7ZhkK5iupuHR1PMZgyEhtNmLl/v8caPZb8/u954T8mPAzMWbUsialLEp/+iZYJUW3BAo/R1XxSamir8XsNTCWnmtkW63oGSljA5ZzioeTjgMAvYMAQXzxwz688qj6X3i0ER+Mfvr61FpcX0gSlpG8HYiuAY+Rm9ckI5uiiga+SF5FnWuqcJGF55FcGERdtRsCp3cT2FIdzLzcpr2Fnfv//PpTQHfgREFFdWhB5Fr34z7SVL/sVH6wIzuzPN8IjU+yNcuxYArYvvWHIqvvt0kThQiSOPDQo0alTt8XxKUSCytfiSrbVwdfdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ5PPFF6E64BC2C.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Thu, 26 Mar
 2026 01:39:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:06 +0000
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
Subject: [PATCH v9 01/31] gpu: nova-core: Hopper/Blackwell: basic GPU identification
Date: Wed, 25 Mar 2026 18:38:32 -0700
Message-ID: <20260326013902.588242-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0084.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ5PPFF6E64BC2C:EE_
X-MS-Office365-Filtering-Correlation-Id: 49f2e836-dbb7-4778-6fb1-08de8ad877e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CPzd1QSy4kjSWy125OQJ6jl3Tcbf9vDAnJx3hwU7yATp/b1w8CI6VHiGzTR84XpR8Tyh49g+1PsA0Hk7PCCZPTyv4hVyAttJtdT64e74z1mx9ipy8VK6Jlv2JU7+OTIPrapVQrQplE+nqhkXjIbJZ35s51zCqHr39wk0q848Y1Kr6K1OSYAtN/erUgwcW++FNAOnVZqRZrnpYOyYVn4WvScj0YpqeZ9fctEFijfE3NhkPak99vAdSWxseIGNtt5TBdghklDgixSycmNE+Xtt2lI8JyBaev0R40o0hJ5DpmojUEXXjJ/A1ljl8GrnWCwTsnAqh7pzWcuD+/kLa/ZopezcS48ryJ5j7wdThlZxXeu3Q3ak36U3nOEubk+leOcATzIA6mBtS6P5kV5N6VdMn4icj5uotNPZOZ9Qn+bcqMAtMiV2u3eJjA8N6XC+PtDqO7/Ssa8NGUl6j0FEaw3/yR0rhwBlSAqK/WBBUg59byfJ1LQ3K8UpD1wGHRkTdxTa42c5P0uX/jumliAyktMbOVHB55+Ws3Ee1JE+jW7ksxpVN2o9W0WQ1Sha7miihqtTfJjXDdudBb3BjAE31aOx4nku7UTDOyk/I6UzJJXIWTu3JTkapp4NZ0B0vQv5QrasYdKibOXvqshNd0NcyEGkTGq2mCxOUcR8yT2WHfs0Mgaz8heID8s/CbNNGrjAG8WIDsNc9RiUOum0NsMBUKeTCNNgPLONoSuriO/C/EkSYEM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+QqiaKJSLrWFlLAg1ugMMZ2pJuA/sceGBylkO4HTm03RKF3MqTlDGyds7cDR?=
 =?us-ascii?Q?cIkCWOXje6pEXJDydvjB8v4JxRpT6fQVK+9d7jkmHuEET5VC3sJH4H5oDavW?=
 =?us-ascii?Q?Zf6t8IuojxGm1AO5UaxlVnBxr9y05BEuC0N1iE1rQZqrBdbg9RUhwT4GjzRU?=
 =?us-ascii?Q?6HYRRzWSUCQx+P3c4Ww5SJy52CSMaEmRULfbB6D0meGRFWWJV3KQrn1XNSyq?=
 =?us-ascii?Q?vP+X33wITrB+mzRkXt6vq/W/Aa+E2C7PXH0AkeDX+EsQ/n1j8NC7J1NNsx/p?=
 =?us-ascii?Q?itew0iZV3V2LmT3Fn7MCudr2ItP8aONSq9V1+Wuzt3SZSN2lTlGxhMqCQXKK?=
 =?us-ascii?Q?xLGa2J2nN+Q++OuQ+UAo/wqB6tazM/0eN9cZyZJm6rKDiMScDE3ekBQ8P4Yq?=
 =?us-ascii?Q?hvG9p/lCW2oxd04IA75+Cjho3bOC0rf+jm7uhqgQZzuYDe4uk5/2vowf451M?=
 =?us-ascii?Q?+s63F0cSE767Pz1211kv79k7HC2YZX3j8WOmFL4tCuXMV024VhtJ9NgnhKrn?=
 =?us-ascii?Q?T0TCCZfQ2Cf9k6m52Ah9h58jFK5BdbFP/UVhuAtzCntwIg6ha+72gMffMK7I?=
 =?us-ascii?Q?GbV78skEe/5oFvwX4wDMHXQHHMbuKtUsoZ7vWEWkI7Itxawd6YIsGXTqHn3v?=
 =?us-ascii?Q?6RKzfLKJmjraqsaogry7cUQjWqHQxyYN75enBadMF2bwXWpd+kiDf9ZX3M0Z?=
 =?us-ascii?Q?zGSpRwZlUC4BDGOnA6xK3TTlwgViu1QeEo0eq4s0zTdkYjAivg3OKp7E+o4G?=
 =?us-ascii?Q?oPuzSN+ty/2Iy/JLnDSW0Ve9y3fh0eHZcvX6n09Ag6XKlyDeiYEhdcGauUN5?=
 =?us-ascii?Q?cZZ3ELvMALAsXwwfcmH4gBn11rkhIGTQM9koT1bwh2O0Ty1sgzATuJiGj31J?=
 =?us-ascii?Q?NT+ajqTBrZbuiaRH7EQlCAMIaZYlvsnUT1BvkZDcnUXxH0Er/eqROgyQn0Ze?=
 =?us-ascii?Q?6UO5urCUTeQYtJUwCsxYDh1IgT3LFHPb0wC+Tad597u6Dc6GgFhCym8DK8YH?=
 =?us-ascii?Q?8ZdkkAKwTwZHoqzlSE+rIyB524XVDD4ndiJP/f4b71WByQPBPDi99c3S1Ewj?=
 =?us-ascii?Q?tmLcFG5Ms3ZOXNWUxJ/UOa4/mgZPC8T6mo8UWi+zPFJ+quZGPHDnrkilk5Fa?=
 =?us-ascii?Q?hYWP3moB4nELcghyVkQfo/Yc5eyc9b5Um0AHx1g+zB0k+PuAFNyrrUHR9FKy?=
 =?us-ascii?Q?ecZRtxdj4eD+Mkg8d+gqV4cGEbE5i3hzRSeAOTFrvFR+Q1IfoM13e5dO7CMc?=
 =?us-ascii?Q?7szkpqyMvDpq0uf8IGKWMxM11kyaEq82NI/OZWJ6T9al5LK/8PEjfgvwpUIi?=
 =?us-ascii?Q?0iE6c98sdAWQTq+bBuc3bL0impkVti3+HQVO5kB6iRLz/74EUwebu9lmt63E?=
 =?us-ascii?Q?m80WE3ktdkUri3x+Xm9JQb0mRaX4CNd2SKlZ2hTxMy0erqhlBV9arLLtjoRe?=
 =?us-ascii?Q?EvS+GB6poaHWO+kYhlDiQ6u0k/EWFK4mF95CRNrTtDvIe93audHfzq3uL8Qq?=
 =?us-ascii?Q?cwGjlJyu9zRw9FfB7m8ZRtoVY5ARAzUYMZP+K3x8xsCIAQT1iHEHpwWIEYNF?=
 =?us-ascii?Q?T284ZqRnZTCXb/XpvnQHsGj5iNoya4OywRKVan7rgzNs9Qh9ViZGYp6uvjNG?=
 =?us-ascii?Q?liuYi3+HmUT1sOE3Vqi++wAIhnajyY4LP2QjW2kI88WKRx0zSsn+jJtseS/H?=
 =?us-ascii?Q?6/L3zf+pxrnoIWhRqfru4Vfiann2IXor+6JbLUEWQ6whlT0GRLAJ93lfYtoo?=
 =?us-ascii?Q?3bIJlbm4Sw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f2e836-dbb7-4778-6fb1-08de8ad877e5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:06.3796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ty5JstTborYjvkLnuS951/iNyPMlBqoa87nOtPTiKYGBAf2CZwsUzuC7r6jmU/jXmmRrHB2ceau3NPwh+C6dEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6E64BC2C

Hopper (GH100) and Blackwell identification, including ELF
.fwsignature_* items.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs   |  3 ++-
 drivers/gpu/nova-core/fb/hal.rs       |  5 ++---
 drivers/gpu/nova-core/firmware/gsp.rs |  6 ++++--
 drivers/gpu/nova-core/gpu.rs          | 21 +++++++++++++++++++++
 4 files changed, 29 insertions(+), 6 deletions(-)

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
index 9488a626352f..2bbea1db0238 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -213,8 +213,7 @@ pub(crate) fn new<'a>(
                 signatures: {
                     let sigs_section = match chipset.arch() {
                         Architecture::Turing
-                            if matches!(chipset, Chipset::TU116 | Chipset::TU117) =>
-                        {
+                            if matches!(chipset, Chipset::TU116 | Chipset::TU117) => {
                             ".fwsignature_tu11x"
                         }
                         Architecture::Turing => ".fwsignature_tu10x",
@@ -222,6 +221,9 @@ pub(crate) fn new<'a>(
                         Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
                         Architecture::Ampere => ".fwsignature_ga10x",
                         Architecture::Ada => ".fwsignature_ad10x",
+                        Architecture::Hopper => ".fwsignature_gh10x",
+                        Architecture::BlackwellGB10x => ".fwsignature_gb10x",
+                        Architecture::BlackwellGB20x => ".fwsignature_gb20x",
                     };
 
                     elf::elf64_section(firmware.data(), sigs_section)
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8579d632e717..0c68bca7bf65 100644
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
@@ -100,9 +110,14 @@ pub(crate) const fn arch(self) -> Architecture {
             Self::GA100 | Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
                 Architecture::Ampere
             }
+            Self::GH100 => Architecture::Hopper,
             Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self::AD107 => {
                 Architecture::Ada
             }
+            Self::GB100 | Self::GB102 => Architecture::BlackwellGB10x,
+            Self::GB202 | Self::GB203 | Self::GB205 | Self::GB206 | Self::GB207 => {
+                Architecture::BlackwellGB20x
+            }
         }
     }
 
@@ -139,7 +154,10 @@ pub(crate) enum Architecture {
     #[default]
     Turing = 0x16,
     Ampere = 0x17,
+    Hopper = 0x18,
     Ada = 0x19,
+    BlackwellGB10x = 0x1a,
+    BlackwellGB20x = 0x1b,
 }
 
 impl TryFrom<u8> for Architecture {
@@ -149,7 +167,10 @@ fn try_from(value: u8) -> Result<Self> {
         match value {
             0x16 => Ok(Self::Turing),
             0x17 => Ok(Self::Ampere),
+            0x18 => Ok(Self::Hopper),
             0x19 => Ok(Self::Ada),
+            0x1a => Ok(Self::BlackwellGB10x),
+            0x1b => Ok(Self::BlackwellGB20x),
             _ => Err(ENODEV),
         }
     }
-- 
2.53.0

