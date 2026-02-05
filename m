Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011002.outbound.protection.outlook.com [52.101.62.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09407156677;
	Thu,  5 Feb 2026 04:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770264687; cv=fail; b=E4PLquPcwJ9HecGpcKAIY180AP+GMQUCLLQyiI2BgrLs3LX4hLDL2LWnp31ww7eWAFk6jxjN+WaJNw/82MVtswY4UMlAKCGjAfdqF7gvoemJR/qsPU22pCYbs7it12yluLUuML0b7gAYPg/qKIeDrJTeZInTU10MQbxoYPZzuAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770264687; c=relaxed/simple;
	bh=Rz0g+iStfWqJzN3Lvq20HkH8NEMg3yUF0IgUVKC4XAA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mo16eOd8J3Ezmy0DJ5iYVnkkabMYQUzsDqwrOYbM2OG/rA7WiZEOWzwJ0YsWajM654lnXUEx0vfXqQumul8broLzxdI+RVYMu4m3yHmeU7c5tKgQ/rdsPCsJpq0i81jLpi7EG3R7/Y+gnx+Pn+XbPLIHtkkPdtfFpSDhEYsWD5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o9KWfFlS; arc=fail smtp.client-ip=52.101.62.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o9KWfFlS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DquDF/yFe4mHKJg/SjqQxBo6gXOX6EPC9ocxg56GJj2kP783D2lLT+HTwZhxvp7olwyxKLgyp9sikKKuYXb1FoKMPc1c74Vktgh8CkqOCu9fM0u+MYnaDI1JMkQvdc8oeXs5QJrAk8pvJq2V9BO2HMi28YD9rHRqgXRxyZDCri3ilAT4qQooKLCgQOIR+pNM5k2qZyuNiGDZ8TzaTTx/26WHEl9gkw5wzZG0IbHxDBKcbjzohg2XWQxlQWUPQfbO1ciHKCf8Ohqd5v5RjybaGM8V1usWY57SXH3ynYZAN5GjdlGDEyYwWB0SVTf9Fi0rMYLq6Sa+KIWpPrWf4NokwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVXY+iJe0cVSQdDstIo2LPwwKqtoy+5ts97JE4dDTjo=;
 b=YblOPDGvy+gDwUpWbRx9+pEVmsLFBsOOcMFcPv4SzCZ08hrQGYRF/8BQQCcYSyX9xHESoCVyxwgt9OgvwX5+y2g5VDIpTGQX1dmRk3D+tt+QTQhmwgz6LXLNBUj84eGAEf9dAmHJVKNMfoguQOJPerwDIgCi7vZYKNEuFiGUH+5hgSZQreaB8bTkaNKwZs+YbmFYuhpRJt/E+6OkKuJHI1rq0wMzKhux4otANOifYDwiae+nGLWIq8go53fS1gjKgyVZWLYDzRs3lB9IkqJnG9YnBl8fRIUX9JzugmM4Bqt1AL0QJHPLKuAWGKSqEDt+fTERrigzPQtimwFb1B56zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVXY+iJe0cVSQdDstIo2LPwwKqtoy+5ts97JE4dDTjo=;
 b=o9KWfFlS0o7FsRuH6xf/jEW6nAnrmWlKFz2qK69drXZm5jFbN0Af706qOOO7WiUMev3ZbqlZfQa36GjoyQVC0FRhVKO8LmCPNUfXTgPk7YRuVQhzwq49GUYYWZV1I/oZMEk21gdaWioIS5NhvUUx6vhDHFUAFrKmtPlgY9K+UmJGSY/t2p2Ykm+PDHx2TT59ADgPxngPwBLCYAxUrEwHrVjQVodOK6+6Wz8gBkR4fb0pwCQvFKdxgLlT3oY5emriZph1pfo9uNYlDDytPcm0165P+v1J30Jq6izz1aQkcwdrBXEvr5cgtf6HwOUQd7SoAfavjwsNxSQayE/lz0950A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN2PR12MB4080.namprd12.prod.outlook.com (2603:10b6:208:1d9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 04:11:23 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 04:11:23 +0000
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
Subject: [PATCH] gpu: nova-core: fix aux device registration for multi-GPU systems
Date: Wed,  4 Feb 2026 20:11:20 -0800
Message-ID: <20260205041120.127106-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN2PR12MB4080:EE_
X-MS-Office365-Filtering-Correlation-Id: 508a7928-87a8-48a8-7b4a-08de646c9fa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ga9X4Bj6V5kbi+n6PYS37OzJ06q03K6nbptgYq7mkdOnoqrDMdNUMxjKNxvU?=
 =?us-ascii?Q?O1DzavRPl0B9GQbwdu/qjIMyGgZ9rE/n+aGj8FEi57ImPExYU1W0J2gQ7ltM?=
 =?us-ascii?Q?ro1bgIjuC4vtZ3vHscughSSZvQDIJ3txl6cmNxBltxLdXUQUnTTI6I29qFiZ?=
 =?us-ascii?Q?z+qwCoJPXuFhx8TBq69mBT1a0o6qkvm8784KlwDKQ2oZW+l+9VQ8FaQXBTWO?=
 =?us-ascii?Q?yWkxdlJJonVz8gqFOGkxRireGtNzI3IYc25RoBqJ2z3wiChl4bzTSOuYYiB0?=
 =?us-ascii?Q?v+bM4Fyrn/kb5G6Qc7mCq+yXNsWfkeimHGCs4M/LVbxBXlcXXorv5kpy+V/p?=
 =?us-ascii?Q?kJiO2lncImOM9cLexcCLRJeH5szKaA36LxzI7ONwbM5ThIu4S8K6qxbcjfRz?=
 =?us-ascii?Q?rObRzUMU/L/rrHp97tOQ9PxcNUWQUap8JjugI2HTPQMLckU1AclXYIuiOuze?=
 =?us-ascii?Q?Lx6OalPVywUH5FggwAQDwhYT5oVCPXvKo8xIs1cHGQsb3hcYsTHEdDCtP1Bh?=
 =?us-ascii?Q?Ry77q8gX2VWPiEpMakMh7PETNjw4BQcPQtNsDHq+UNMHr7x2OAac6yddAj1s?=
 =?us-ascii?Q?KGaU40aAbV4dOqbzGsSjVwEgL0UTE8TEvlgiYWBlNMSLYy4xl/Nfm37fA3hu?=
 =?us-ascii?Q?bpcGUc17bETMU3eC89zf/e4YI2tjWw4Ds52bqbAy0pzf1cH+XsHlS/fnNeb6?=
 =?us-ascii?Q?stTHYZmnSVjghL+LyuBlVb859JTME66La6W4jog7jrjw7n6mAL67qXY/KNq4?=
 =?us-ascii?Q?2RVOzhqOv9q/sfJmJ85ZlejWMjQIzAUvURhbkwoI7wxtYU/ytX5PjAzdGM72?=
 =?us-ascii?Q?TU5q8skm81WTF5atQeopuA0MBjSHrmiFPOV1tbKAwYgUuOzuMV1rOR0QaTPW?=
 =?us-ascii?Q?ksDwtDtpeZIF1PCPEYtufsrm5D4HGZI8DglEVVzpbrRtgaa8pOlktDleKCF+?=
 =?us-ascii?Q?HbASKDQ0y2SOCrIvi28iv/6mYKG3P+NRrNys4Catb7jsLZkemByVsy6tem4O?=
 =?us-ascii?Q?jf2si4iQNQpAO4qSTR9V7ctiQMj1CKVUiahpMmNz6VczRgsl75pPiS4R0yjF?=
 =?us-ascii?Q?p1wz23v6HwdLFL117vu9LXyTQwoWvDWlTrCoLMDkrvw9HNP0Dzz3pvSRznrq?=
 =?us-ascii?Q?vvLWpQYNja4/w2FV3ZJhCLcYOI+W5AxDm0qhLUYRbzO/qjrGP2yp6VRDoouk?=
 =?us-ascii?Q?Y6THElcf1iUr0j+SOetTJQCe0fOknjCJjLCY+zNgnN3TiPfIhVngLUz69hCH?=
 =?us-ascii?Q?fSBlYiuCcvl+wD9NEpMt1XlhgYXR0fGC4AAHYDS+nTN2lC0BLAkdR5/abGKR?=
 =?us-ascii?Q?IpVOATRjU7l1sPsA6mY5VxNLHLCgMS17R+d/FoA2Q20jo4a4Wbp02NVji4YC?=
 =?us-ascii?Q?gqcnyCKbHK2TCpaaukQqEiQ60JILxf6agN/fav27LOcbJAJmTpdL+CNfSI+n?=
 =?us-ascii?Q?1VTDNbe+71orAM5Bi+wqdAENIpKUoxyYNV0h+MNOfPZjbzbqdZUQSwuKWNV9?=
 =?us-ascii?Q?S8/2XKgmEyRY5B8kAjY/0lc+gHJws7eZW/WwdCUZDTTxavMThFbBRNhmjaWb?=
 =?us-ascii?Q?Facu95jKaLilQH7TO82O/ZJP3ZYThIcAy7aa9h44?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7mwchk9xJUsnRl5LVE8PZrHuUTRn8sDg+yTTJ+yT9N+zradkvBpacKlW1JR0?=
 =?us-ascii?Q?y3lAFavkxnu2AZ7MKrLQO8dX9S3SibyNwerBihEhflGpLsMdIB6dZOH5IodU?=
 =?us-ascii?Q?4IVH2nMpwKfzqWkeivmyHuX+/0cCCBb/lnnuqHnyO2pyQg1p1JO1JCBVC4sE?=
 =?us-ascii?Q?fvKqhIjEgQ/0lC/N9UfcltLi4yxPEL5EClZRnwhG76798pxOmLD1MXWsceVP?=
 =?us-ascii?Q?Jm4oSxT/daONZqiW6GJJA/9n3eZ0OzT4+SfJGuqv7iLqPcQrVvLlUsRD+pcb?=
 =?us-ascii?Q?ZfYFEiMAyljZy+9MRrgdeTOlmBDsUZMU4T7Y6A1w+yAco3nZf0Rd4Q/J4Yt/?=
 =?us-ascii?Q?c1xR/fHEjfwfktydFcktWTgx7g6gLbPjGdthcBXIkRdgkNG6iWgoDtDK1Jqd?=
 =?us-ascii?Q?UIveFdCm0jzBQVH1tx9JGQUHIZQRrtbfY4shOJbyymxUThplV14sgufQm9hm?=
 =?us-ascii?Q?o2IAzu5TuOpFby7sl9pPZ/qbvL1YeGFK3g2la8pM0ENQbLgC8NyIJm4iRdCR?=
 =?us-ascii?Q?4h3grJXi9DRgyTFBiJdzMsogxN2ahBrN4WjXpm9jdCHI528cFBlq7/OVxVWY?=
 =?us-ascii?Q?x83p+QoVwRUaw4R8d22hnHP5F1+S+M32LmIZgUFK4H0eRj/pF37kmBMdY3Mt?=
 =?us-ascii?Q?F0+EbFKL4/r89YYAvnBCKgaWb6BJpAeJmi9fzEj5u4mRrEqQWEf9+J/COeTp?=
 =?us-ascii?Q?SYZL0DmcKXR02U17RMJjOpc1vzm9AsD5m2xDHWf3t149m8ACd7RSiqSogo7a?=
 =?us-ascii?Q?jppt8rRoOTphGqRykPU5aV4Q1axSMAFfDUaMPcj7/B5ee8jVe6t704DmCeT7?=
 =?us-ascii?Q?hqKAP6zfvsa4ce5/IlNafm8MRcH7OKkzfhDGlLEV4yGKyQZ42b9/k3uexkuB?=
 =?us-ascii?Q?SSV2NQDZbETIJvtA5gOOfk3RgkURFTPKMsvMoahRP/XTf/20RCl1AJT/2EMm?=
 =?us-ascii?Q?gWOsMZfGBoHCMs6gPszK8f/6TtUQfiCMAPC0r9oIq4Mce7fMn/fgeLhnGkC/?=
 =?us-ascii?Q?G+XiNV3Njj2vxX3Iv8m4c4vFpyVlzIm+XZz2lw+ui2CD3IC158BEcE0BtCMU?=
 =?us-ascii?Q?21bb5mJsHIY9E8cRcxFXbkf3avOWSTgTKaGDO3ukMPhxSq+TcNZkjCearKP9?=
 =?us-ascii?Q?l+7GUicwJoPhjoGX47bLI/y1WPGN/BYkHNLNjpPeRWfFm5DlEkna/elM9AP6?=
 =?us-ascii?Q?pIpVmJLK8lBMgQvI2sBJOCyuYntbIVBopzjGB+hvAL0dp8VZEfj8IMl2Nlfg?=
 =?us-ascii?Q?MtidkyN9+ZuOqOKie+VPvl4h829otfNYMIuyJPKFO+6WlDZx3pJ647o0ECZk?=
 =?us-ascii?Q?kuLm0aaVfNZ1pxcGdlI6oxiV5LFZrFTz9Y1DNAivxJA78swCORPPJ8l8eP1R?=
 =?us-ascii?Q?PnyLiF4bcpTpZNofDywQwyUY62pFQiFp7GuBjTALPkVqRU4OdtUeJHzt2fxY?=
 =?us-ascii?Q?MAMKY/2JB5fGShnxxBx/f913XeNDp8ehx/5C3KtQm+ANHXx/reTeu//SkaFA?=
 =?us-ascii?Q?MsCqlt2osiW5ctZHuAY6jWsaWFuM6Q9wX6hxXdK/BNzakjG58zZMocUKBoYp?=
 =?us-ascii?Q?Ar+pQdqMGi+4D3+DOx4/sASiHY+5Tc0bR3FUxlNn7OhCrdDxFP8/y+27hDoX?=
 =?us-ascii?Q?F84DhuPHqDULn49cQrqKm/RPmX0SlAEGxbndu8ozjgCEOoZtGBaQnIUkAHpK?=
 =?us-ascii?Q?sRORHGA7sYxZv5ONdIoU3qptSj0c4M7DjysN4w+qjxxWpXIErPP8CIJO/5nv?=
 =?us-ascii?Q?q8Ot9u/qZQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 508a7928-87a8-48a8-7b4a-08de646c9fa0
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 04:11:23.3434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPfVljuUDoG2/q9TGSwfbt+gBKwwOqdZugpS9NZ4UJhbW9Vd5ONLkP+IfwSZ8qCULFWVPQAkNGXvAMT95vp3+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4080

The auxiliary device registration was using a hardcoded ID of 0, which
caused probe() to fail on multi-GPU systems with:

   sysfs: cannot create duplicate filename '/bus/auxiliary/devices/NovaCore.nova-drm.0'

Fix this by using an atomic counter to generate unique IDs for each
GPU's aux device registration. The TODO item to eventually use XArray
for recycling aux device IDs is retained, but for now, this works very
nicely.

This has the side effect of making debugfs[1] work on multi-GPU systems.

[1] https://lore.kernel.org/20260203224757.871729-1-ttabi@nvidia.com

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

Hi,

This is based on today's (Feb 4, 2026) linux-next/master branch.

thanks,
John Hubbard

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 5a4cc047bcfc..a542ec0b40fa 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::sync::atomic::{AtomicU32, Ordering};
+
 use kernel::{
     auxiliary,
     device::Core,
@@ -19,6 +21,9 @@
 
 use crate::gpu::Gpu;
 
+/// Counter for generating unique auxiliary device IDs.
+static AUXILIARY_ID_COUNTER: AtomicU32 = AtomicU32::new(0);
+
 #[pin_data]
 pub(crate) struct NovaCore {
     #[pin]
@@ -85,12 +90,17 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
                 GFP_KERNEL,
             )?;
 
+            // TODO[XARR]: Use XArray for proper ID allocation/recycling; for now we use a simple
+            // atomic counter which never recycles IDs. A unique ID is required for multi-GPU
+            // systems; without it, probe() fails for all but the first GPU.
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

base-commit: 0f8a890c4524d6e4013ff225e70de2aed7e6d726
-- 
2.53.0

