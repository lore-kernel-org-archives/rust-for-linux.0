Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDF72BE63F;
	Sat, 11 Apr 2026 02:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875810; cv=fail; b=QZe0Z3hZ+ptnvuKdoQ/EpgMr419Xd9Sc+EOq9KBcH92KNT5aaCdsLhqgh+GjUsLi0pbfvcT1AYJg4wLNcc/FTt25W7BDPElSZZctlDgZXsag7XGYJN+phemKEMMZ4zDOBDpB8hKsIvi/EAdwE7Je3fWrFzj0jhUUqDI1y+LnKqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875810; c=relaxed/simple;
	bh=JFy/i7wyN4iRwKqof8BpDyUzEE4gwH+tw07DhV65rbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vh4jZgij1DSZOJ/b3TyicxMJ81Tzv/1rHHGwfmyvjjgLwkrn31c8vt1+5/0u7PijSp/xmB+aqEtSkgzkt3CjXyjvUrBhnMCk2Pk3ytaMa8IsTWSXQOSyLW7OXwmj9MSDQWjkwItSrq1oqtNKfXtzFFiYqplqmF+QzV4OIWJa+d0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sd5B+OzX; arc=fail smtp.client-ip=52.101.201.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sd5B+OzX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2NR5kIlYcFE4Ool0GYdQzjHJuDnzJ87tL99xQDvM4uSRthscFfX0OHSWNFa3zCT7Oo0cie3ghtPFvkr3SAvU9m8IsOt7IQ9sJ931Rv3Nh5scLIS7cdYLJufpNn8gWuYb60grME6XmI0STHYiGqI6rwRMbPcgbbtQXMZ/tUnXm79Nf4Uw0nTU2ZIvbv9vdTiaAQa5kYGm4YoxEIHHIyO+AaztYyrzDnF1boMbELHTRVOtQ7emP7p/NePhinOvk0UWOXyIeogjafapRBXzpeK6CTIWJuHI/N9tlsh6LggRrHWbKMWNqNYi+HFdq7mLP4jtVkNP3X94X5DX0TKyIA5xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56+RUD1HtPAzgErbxGLkoRCUPKQhGJrZmADo5nYKWzc=;
 b=Dfnv/IJOsWPy+gbl7XP2IeZBeb9xXil2oFa39fhm3f6riNNAZ0oAuh9aVSSEnuUS1D3J6xqQw2J/0Av4SfxUEeH14T8t8h3AZRrut+Io/gy4uwtJ837hL/su+ULqQH98W5LzEip5vJrJw+MIpTYVeXO0glUql74gZTMlPnW9aP4JkE57IlpGH0LNK96fAaUrWVI5Uu4FJNOjg5dcNuFlwzRpR+rz5776arb6h48vnR9fkel8aebQUEZApcdXRPIHimaupR0bzPZ5ghyOt8DN8BVttOmk6E7geqfEJ0dB8ysVVu2cTYU659AkRT+hxSI5mwcP71c1Lx46AeyosPQ1YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56+RUD1HtPAzgErbxGLkoRCUPKQhGJrZmADo5nYKWzc=;
 b=sd5B+OzXSc8+IWMz20w63q9+sfMYYTOME2+G4gNMVU7M1jMP/QQBUxqAtkBZ1QKhQ2PdVTAKrhjGAbDmj8jUiLXssiZiuBIWIEo5bAUddJO5SViBaCPfKUfcIW0RM9D9PQxarJN8wuK71RL+hNvyCmvGSbX9hIW/vHrms3El9lOweEr+KiCT9O0jum4ME1QddWIowvZkJv6M0J2KU4hE4iGBEzpLkjRNcNuPNiEYq0oXfZsIZSTs5tHa0ukK5UN9wBKNvunoK0kUrqxJLJqAc1Sc5tro9a/JCy/qEQGkPCrQglUp8LvCMGBgbnftSbneg+dZmCo4I3QPqQjW0EryCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8794.namprd12.prod.outlook.com (2603:10b6:510:27d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.15; Sat, 11 Apr
 2026 02:49:59 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:49:59 +0000
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
Subject: [PATCH v10 02/28] gpu: nova-core: use GPU Architecture to simplify HAL selections
Date: Fri, 10 Apr 2026 19:49:27 -0700
Message-ID: <20260411024953.473149-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0012.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e254698-de04-4430-9498-08de9775055e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	f3rN3FK9fjZO+6PH7cL94N635JeQ4/vwq3+aGxzSgp0HqGmFvXueDvi7SJpvX6NLP0yIZrNpzPvhuRGC3HlztN4HcbaJb1ffBrj+fP0KhdE6YO/7RfrIka1IBOVNghReDWZ3IZy+IJnTdfc42mqH1aEGqyLibINfyDK6BUWiLFgFgbGKqs4+kB8+vtTb4MHkis1Fl2AIMl4FV6lC+llmJ0JF2b4g5Xx9RqNfSB4Km9ijBIDsq7pmmtmhLv6F0BFEZnUpGtBPn39jXPN/jt7Ig17OmgYZqSqkQye8/TbYLp406ptzK70mQsruoGfhLP/0pJKQqM509CmuJPrNP4oRz86Muzn44dsBJXZJ9FO0YisIC5NIuQ2BbgYPv/PQYsfXFkf749BafYssaFKpJ3BBxahbTF7pCQr7wuWRmMBoMIrDGuWK8ie88zWry8oXwM/G5QT1tsaZXrsWTdB92XR2mS/jwopkX6vVUrh1i3WhMV0KUs3i62YyLC6rJcfXv7RPGA5jl8Kw8SPAk1TBOFcR2S4hM1poWdCui2cD7vBmQi0XsmhIHeRLpYGM+RfFqO8cEwkFSn0EILM8jYTYLzqtVVcBA/Pceehk0h3ImlgYdstjjsA0k0EqYsOusk2aUPxAxA6MNBajXgCIBxlZ3SyW1nthPX2vKvC5HSNedAgmMJwU1JCCNPUL8HpRiOP4nalSEIiJkv9mncQXbnoDHlUPqj8cIUOCgTQhql+uB45Kqx0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y+4mp+SN05rC8amD6Td8URioibCjFDch/iqoVG/iVzUMJoIRn29hCkC09OQM?=
 =?us-ascii?Q?nEl6Vq9Y3CFIoLb3SxeUz5UL25bJ3fHdsy2BHpBRicmp19BqjpihBX6JXZv7?=
 =?us-ascii?Q?NuyN4VtHFak5//zLGNOkYFj0QpviG6WdNaLzNC0MEmcL0DCxDYEpA68O+2DC?=
 =?us-ascii?Q?U5gU+02kEzTVuHy/KA/LFYaIdXDIt4EjKgvP/YGSWfqoYukFImvfrefiM+O+?=
 =?us-ascii?Q?std+iw8C+CBopTGLl9jlY60IwAkN8nsurODcvUi4dwx5181B18X8cLZE6PEk?=
 =?us-ascii?Q?zCCn4pIy3etCNnDTN7FksKcwSgWO5yiSEFYpC1xH51QvTgGoXuzAp9EgMCJJ?=
 =?us-ascii?Q?rimbIIddvnYOPrZzwIRq8xhZao6gsqgUHU8wARw1OXK2+CRBEKg3Q3X+m6cx?=
 =?us-ascii?Q?p5KkwjS0TfFk3XwkLgujxau2XWxm3cnoXjq4wx/rlghCjc3zcbzYhE+q5VGC?=
 =?us-ascii?Q?AkT7fXM4XRBCY1+hHCIHMs5ZhZ/rh8eXsmkx0HssRuxzddsF28m1JmIJzCnm?=
 =?us-ascii?Q?rHVhoBf+cqTcL80SHJVYY4J1Ioy0Vwb+gmNPvjVcGMLd/dA4En8EdvwNizOt?=
 =?us-ascii?Q?JVDzfw0yQySfLzGjJrTaQHp0WCoDdtjW6FRUku0R8FuU/MU5rkZk2Hym+UeO?=
 =?us-ascii?Q?rtlH3y/oSj62o1Ghahj5pzMIxkSFGq/IteaTruWbeQZ4+Ds0BYPtD/DyHahy?=
 =?us-ascii?Q?6bYC26rg9FDcNFNYfUZtiAaMWo9xZxkPUgixm5zhG25+utvA0FGW+iugCN0F?=
 =?us-ascii?Q?eSLM3gxygNjDpPsQIkgBg0Q90RQwLbUkmsdU67fTIv0uA/kUTC/O2ddOBxS2?=
 =?us-ascii?Q?nONxcJtKxAEeezzzyzLZatEQRHwlk885RCQSwINKOHGs32P52b1UrHMe5giN?=
 =?us-ascii?Q?mxPsuBMG+eod4FhNuGjqWdXtxdL9/QvPIq/Jp2VSveI1GmUMm6L0tzvJhWpK?=
 =?us-ascii?Q?eLXFUny8Brl/N3qZSv6ylifJA06PJOh/cyo/jOLi44Tdk9BOsomkzgPmHQcV?=
 =?us-ascii?Q?EiCHjvWQYpD+btVp5IacqeJteMID6RrbTbnvXbkaSbGiU1H5/B9xc3ogjJqg?=
 =?us-ascii?Q?Rh4PwudMXyHQruewkgg6OSH5fnxjxXaMvcIn9UyvlDWwqqDTR7ls4DqUAf1l?=
 =?us-ascii?Q?/1RFKVscE4FjuAhYoAVxjN5ki3nPOMM5vKQthL7kfJ1UzJsly8ghEXSwYHAe?=
 =?us-ascii?Q?d7VRcwta3cVxynjBDEguRJB7sLNb5DhAzP5aTKd95GcZpGv0oBr7v9X74maX?=
 =?us-ascii?Q?HI3D6UAV9Z/Txd3WMdZnUFhfBUP5YUiFe6iPNw59QrFAfe5B/vUCSlLotVN9?=
 =?us-ascii?Q?SB56pqUx7PzWGp+eEuEdjKCjmPMVexgP4PZVwoJ/AUgu84OS2g5jYS303ySU?=
 =?us-ascii?Q?B3LJxBxFkFJwUebwczEfhcnj+5bpKFZaVFhnVkGEwVHg+iv3oOx0Bu/Ythd0?=
 =?us-ascii?Q?NTROeXNFzBovOz8Y6KbYKxiFIwKav6/FyKm43puhCYPwCdLiajZ9d5wKEgTU?=
 =?us-ascii?Q?HJbsNvmEYeeoMaRfiDGtg7QLaG7+0Y2+URHMW8D6q5RFSLULnIpsFqDDIpVy?=
 =?us-ascii?Q?/hie9DY1ESHjTKGbxiomXEkKfhrK8sZmmRTGcrTOPBnvHT8D29hwdjKlulNW?=
 =?us-ascii?Q?P2Xr8KVJYElcU6yHVVz8cXC85s1w1SHkI0DjgIrGiABx3gWK3C8w4SbFUkk4?=
 =?us-ascii?Q?XfyxDStCHDBySPTfRkud/q4Pn4jd3rTuI38lgjsN9yftoZLipyxroo91axsT?=
 =?us-ascii?Q?yk0wcLeUCg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e254698-de04-4430-9498-08de9775055e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:49:59.1652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8FSTS/tM0uEtPgzkrW+O+AfIxfdIRkTK/zDORz5jHGvdVIkAomp49yMkz9bzJ4YDOo+6x2qLx9QHEoN90P5mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8794

Replace per-chipset match arms with Architecture-based matching in the
falcon and FB HAL selection functions. This reduces the number of match
arms that need updating when new chipsets are added within an existing
architecture.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs | 17 ++++++++++-------
 drivers/gpu/nova-core/fb/hal.rs     | 18 +++++++++---------
 2 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 71df33c79884..3bfb42684a0e 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -9,7 +9,10 @@
         FalconBromParams,
         FalconEngine, //
     },
-    gpu::Chipset,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
 };
 
 mod ga102;
@@ -74,16 +77,16 @@ fn signature_reg_fuse_version(
 pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     chipset: Chipset,
 ) -> Result<KBox<dyn FalconHal<E>>> {
-    use Chipset::*;
-
-    let hal = match chipset {
-        TU102 | TU104 | TU106 | TU116 | TU117 => {
+    let hal = match chipset.arch() {
+        Architecture::Turing => {
             KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
+        // TODO: support GA100. Its boot sequence is a lot like Turing, except that it handles the
+        // FRTS steps differently (specifically, it skips FWSEC-FRTS).
+        Architecture::Ampere if chipset == Chipset::GA100 => return Err(ENOTSUPP),
+        Architecture::Ampere | Architecture::Ada => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        _ => return Err(ENOTSUPP),
     };
 
     Ok(hal)
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index aba0abd8ee00..5a6cb8221e78 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -4,7 +4,10 @@
 
 use crate::{
     driver::Bar0,
-    gpu::Chipset, //
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
 };
 
 mod ga100;
@@ -29,13 +32,10 @@ pub(crate) trait FbHal {
 
 /// Returns the HAL corresponding to `chipset`.
 pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
-    use Chipset::*;
-
-    match chipset {
-        TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
-        GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
-            ga102::GA102_HAL
-        }
+    match chipset.arch() {
+        Architecture::Turing => tu102::TU102_HAL,
+        Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
+        Architecture::Ampere => ga102::GA102_HAL,
+        Architecture::Ada => ga102::GA102_HAL,
     }
 }
-- 
2.53.0

