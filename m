Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011050.outbound.protection.outlook.com [40.107.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8F33EB80C;
	Tue, 17 Mar 2026 22:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788054; cv=fail; b=nNFOToSOqQtW0kaLeCL/mqSi1FW/XxS6KKosh6uR2PzzS/EtgEToR8hfLuzOODhpiONyRBHc6Ah/MtG/XkQ4tCegqPvwNn6NkdKiqJIHR6i6J00YrPbvQLbIRuxYUF+Hp6r+K8xoAH/Y4cya07oMW1mtzXNi8YlU/wOVJe3AAM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788054; c=relaxed/simple;
	bh=KC2ucIDfXAxqvRr1F1DH9KIChd1pAr1Le+dyzzANGus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aefxc6pvw8aH9rCs1SO2ysLzuK23R0zhukbLuMK3vr/AqS7TGUADwrSkcQykK9WcxzKe3ihbZp05bC7o+KyMsPTcnvmjrl1Afmtqy9axNZ3kXQFW9tUL9U2NRpemOhkBaAZT7HLnVztd19ZsdpOlMWo1gTVHATM9STI0Z/iaM2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cljygy/J; arc=fail smtp.client-ip=40.107.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cljygy/J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pmwwR8/WrEYcFfYEjPDDfe9neyjLITXLu6r5Tc1l79aCNQtoWDNsSPCx8MBcJi/3nbxvejcuec2Nr89KCE/m0wsgOuFrvPBBg+h+aPzOQ+fGpJ+LGT768O1Ztlvej6ip3TeuPSgLu5nH/nQ9MNTwfCVGRbRr01eN3nfw13ZUoK2UJ+3fSEQG8F9+HELDJgeqH3xhMtXpz9FqbQwG8KtlG4/7U4XFTUaP0hD2l1bI+z5x+DcL9CyTR1il+qrh13xhWeJ8C3ldMTOFVFtJc3OqjfsZEkOO2mF8fUgwmCiaxj/3YabYNdPlqdFsnqE1xdTysIs4XQRhUkC1pCMIzVv6Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uv7SwPecmmncG6cRG6fVOJqKT2hQh0muFNuLY/Mj9DE=;
 b=F4GieFCDqwDOSxq/cQxzBPn7zHH2U+IBVP1U7scqKvvKO+lnNZoF0cSEhVrP8fDaAUGrYNb/77hDlXEWlV+Y0bEPdDU4xaHzr1PVNQo2k8a4kXf/5DCNLaNUTpak+IUkEkZe/Sdaac0C1tz536qFDGKczmrHgX0eEjbr+DRPWuA7XHg7S7Ni4rk1MofWu+8GMASqwc4IuGc+qhzFnrLwtgFTM6ruxgTpJatcH6n+3JFrN/SMMibkBg+TosY2GghXxr6UILZsHvxKxqbEkyJiKGDYe5W8ocn7JswAxccTT7y/dVS5UVVCYYfO+3bmPKYWex8SwGOr89M72/F5scnaZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uv7SwPecmmncG6cRG6fVOJqKT2hQh0muFNuLY/Mj9DE=;
 b=cljygy/JrcObG6cIGFGRveurjvHyYyixdd0bcJU6ekzGvv3AK2kcSdL5zPiKD2GM0NmdvZLFvzAe9MlJqSIRo1nyWy27LO72eUas0o6gGtD/SGVeGqupfaERAp6/k0gQwKPvSukSb4O2+yPlE8VQFnzhp93BUjerGW/Qc6dejPe2raq/HYFQ/dVvO9x+/YDMH20eb2ZNetzUts+F+tSBG9gvKBFBZDuSLCW/HYgscSlOLxHrX8uPoQwmKuVFx1PDzetmIb4mEZgvpFeAKcoqf2ZwmmkOOP9sOxII6aHH3QnOsmLhv9RtLeWRPikjN/njVnWPP+Wr5csyRjYcWwMSSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:54:01 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:01 +0000
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
Subject: [PATCH v7 02/31] gpu: nova-core: factor .fwsignature* selection into a new find_gsp_sigs_section()
Date: Tue, 17 Mar 2026 15:53:26 -0700
Message-ID: <20260317225355.549853-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 8034970a-9412-4744-e731-08de847814b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|7053199007|56012099003;
X-Microsoft-Antispam-Message-Info:
	GhDUZz5tHWMxqdWGBOyqJG8whoO6lHsWrtj62eNeniHwppOb8qfF8qWJ/r/QR3cGblrscPBEDXnqr8lanRwXYLcoyYLtGV5ACyDVPXbfGWkhk6OXXV2mg6+0GpY2hS9HnaKVOf+nLctTrgbPsvjlNYopUQS92wZ7uU/89q0pK+jSPQPDQdmHCpAWsXVpeXkfKRIf9RbdMYoclp1hZijelCOIyo0690CaJk5FIrOpfklLAX2g2x3v/GfLAR9PiyLwhnVYZPmNiOPlgnDBVVoae+Z+DDomNNmLTQwRK6brA2GuA8ymB5LClamVQI1lAzpbpDlQEUOCV2sNOkpOLmzF/RvvWMa8+OMsRp/eC4/4AtH6RL44mmtzW+dZamW3gglB9W3EnWvl4jn/oopn0lS2ZrYNdoFzBvwaO+iwkjJp0/jUHz62xaaJLCZp7IN5ElHQ6ydWg8ReHUWSh51JpiCgdmcgHY3AlVY1GzSDdaHnQkcWiOBj9KwHCECmlsRjYAbv+/CJtAv9DBl4F+4W5RIGcMwfGEZdP1f0IrThrj4DP/UvDbs+jYzYlhB+1iOWaO6WK2VtY7kfF43bGcyFnY4Kl0AtV6eUJ1plznGtbwP0gBfrehSU9dTMDA8tQzU9GR5PLCH69n+mXBMo03ttRcFn9yvsXWfq6tYElwTV6T/ZLxBu4v2zoIOEm+jGxuzminYXucR0R1ralqOZJdi0v3cIskd18e4eROEwQefm2v+JhoU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(7053199007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uIh7bRkGxZS+EbtAosKf6mh9hhtRtxVdKkkuh9pzq4IqzaNIZ2z++a60xdtY?=
 =?us-ascii?Q?UzNVQKc2k3FTiYU+SWk4R4P203HFjiy4Tk7lVkHDLre/SsKfYduijxAv42Ky?=
 =?us-ascii?Q?494D0Q04j7xHrvhXXh2HjyWBsP1SO2kIJ/YmuIb8t3pUg4GPgqIIVjiXtNNN?=
 =?us-ascii?Q?8KLONDFhN5yPeGd/NcF5a5e9EMp5fegWMAVhBTR9+x6X9QJSelDHyjUDwXjE?=
 =?us-ascii?Q?otAcksJYSZqiOgrRezN1OBmbFlJibhfgOSQV6LhkEfmKsiFOeM6dWZLQNT7h?=
 =?us-ascii?Q?cokA2YzIqEz6IRU+G9H4z2B6VJM8PR0xoRhq/atgo5DJSz/B1rVbCRIIC3/g?=
 =?us-ascii?Q?ZAdEF9mUpGeT0q1qrH6CxzkVtaJjJ31B3evnX8OTKL/HCDMGRXxh/UnjWWtu?=
 =?us-ascii?Q?eBbd4D0Y481Ki0gND++PKqSaiX0BvWCSx41PLPz7mY3XdJNk85CR/AGfR495?=
 =?us-ascii?Q?fNCzfgcVqdmASLsxiXusJsGs0vbx5IY3T5DpWOfl/3pBV4fKUfvY9wwTDkW+?=
 =?us-ascii?Q?eEbqTjPPI1nUXgjqAQcLC3nzYnmEKFnj7lz6BMmG7tpbLLCboqmnNLvuduDQ?=
 =?us-ascii?Q?ieTfZYT5JFunPSM3MMPih+MhektA0L8Ts75zocNICNVwamj71nLVW1Fw8zkK?=
 =?us-ascii?Q?RJ6D351MiRvn+rHHL5qzIjUKM7As7iEDwj7GyTczFbQXyYxKCXZfQ8/pY+0A?=
 =?us-ascii?Q?rSH+0Whjq6q+o1hC5DjnFScB342KzP1Saarm/y9GLwd2+C5mthOmZ1F9CyF2?=
 =?us-ascii?Q?Rniw9k1U5qNypXuZnHPzro91zOGB/mILzhQI11iYoT1p5oUBCZ8RpE9Na7pu?=
 =?us-ascii?Q?w4q9CshlY6RM3s7g8WuXZtQwEieSI6u+QHbfY1zk63wYi4sN+NtpMuacqPKf?=
 =?us-ascii?Q?6WL6RS6/2jyqd3iRONHSEDcY8EHfEfAqRxbK6TMlAnXUFjtf5KlCyjCL75Sk?=
 =?us-ascii?Q?BcyRJeLujx48s96nIDtXjbOoyZGL4wZ7m8XNV3G8qcA9LLlTfDntDbUnvho4?=
 =?us-ascii?Q?3S46IqM+1pfbKCHUHEH/84T1QIf8SNIsreK+nh9oR1SUeyo8WmG7rDv6JhQJ?=
 =?us-ascii?Q?sK0j/v6N6ZMCu7Y9VFYGIETp8ogwlkz1COKk0819PbxjejnlOJ5ztvunGbj2?=
 =?us-ascii?Q?x7H6lCT9K2v4Wl2rHyPVeC8LVZwqfHyHyktvf32Sqoqg7McrwS5wjwXMfNjX?=
 =?us-ascii?Q?XGIHeci7h7Ib5wvgz/oNzB8LKOb6u+fgzt4QBAxj9/1rb7uLS/5tRSxA/f0D?=
 =?us-ascii?Q?kqqUG3ktcNHua6BQlDqWtGTAZ5Xry6z0vXdjOAUDvst8wsiITNi7Al3n0JPE?=
 =?us-ascii?Q?O8b8Zpd2HivXCBOwLGULV8qjAbJZUoyMBFLEBbF1+rof5HQooWKD1p6+AYPf?=
 =?us-ascii?Q?QzQg0WgFPxfu19lP5DlSUeOq4tacNdU7JC24a+vYznhH8+sv2+LC3lxo4AI+?=
 =?us-ascii?Q?8O0PQBZfy/i/EBp96BRbUkrbVKEyTT3lVn9hjxQ5rU3IrOMeazdDVL1WCXXZ?=
 =?us-ascii?Q?qqfJWyhiM1CXBKqprrRBOCJsNM23Mbn8Zz4UWTtWo6YaRbRUDqlZT97G3F1F?=
 =?us-ascii?Q?SgxvQ/1gHjOtHKVlHSq38AilE4P0JPFdtR3RLME8rKprC8kjusy+FU6CYhO/?=
 =?us-ascii?Q?mjZV4vJUx/k7iGDtBdJA7n5R7UVw8Tdjz3Lr3i4FdiPx6CVSE3wBLFVBxOh0?=
 =?us-ascii?Q?t0v3A2wuCoUdUP9o4QQV4oYH4VWFVCj04mmqbb02o6As+lUbyhWKcme7aN6E?=
 =?us-ascii?Q?tbcElhNYew=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8034970a-9412-4744-e731-08de847814b7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:01.2976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WWEP4fdoHTjKtvsG0Fpvb3a6NsIgm1DcmK52BrCq0ptVPfFXGhWvJ7TvkKLaj3iDEfHHGUmuADv2qNs9/G0tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

Keep Gsp::new() from getting too cluttered, by factoring out the
selection of .fwsignature* items. This will continue to grow as we add
GPUs.

Cc: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 36 ++++++++++++++-------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index c1f0a606f5c0..8bbc3809c640 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -146,6 +146,24 @@ pub(crate) struct GspFirmware {
 }
 
 impl GspFirmware {
+    fn find_gsp_sigs_section(chipset: Chipset) -> Option<&'static str> {
+        match chipset.arch() {
+            Architecture::Turing if matches!(chipset, Chipset::TU116 | Chipset::TU117) => {
+                Some(".fwsignature_tu11x")
+            }
+            Architecture::Turing => Some(".fwsignature_tu10x"),
+            // GA100 uses the same firmware as Turing
+            Architecture::Ampere if chipset == Chipset::GA100 => Some(".fwsignature_tu10x"),
+            Architecture::Ampere => Some(".fwsignature_ga10x"),
+            Architecture::Ada => Some(".fwsignature_ad10x"),
+            Architecture::Hopper => Some(".fwsignature_gh10x"),
+            Architecture::Blackwell if matches!(chipset, Chipset::GB100 | Chipset::GB102) => {
+                Some(".fwsignature_gb10x")
+            }
+            Architecture::Blackwell => Some(".fwsignature_gb20x"),
+        }
+    }
+
     /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
     /// tables expected by the GSP bootloader to load it.
     pub(crate) fn new<'a>(
@@ -211,23 +229,7 @@ pub(crate) fn new<'a>(
                 },
                 size,
                 signatures: {
-                    let sigs_section = match chipset.arch() {
-                        Architecture::Turing
-                            if matches!(chipset, Chipset::TU116 | Chipset::TU117) => {
-                            ".fwsignature_tu11x"
-                        }
-                        Architecture::Turing => ".fwsignature_tu10x",
-                        // GA100 uses the same firmware as Turing
-                        Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
-                        Architecture::Ampere => ".fwsignature_ga10x",
-                        Architecture::Ada => ".fwsignature_ad10x",
-                        Architecture::Hopper => ".fwsignature_gh10x",
-                        Architecture::Blackwell
-                            if matches!(chipset, Chipset::GB100 | Chipset::GB102) => {
-                            ".fwsignature_gb10x"
-                        }
-                        Architecture::Blackwell => ".fwsignature_gb20x",
-                    };
+                    let sigs_section = Self::find_gsp_sigs_section(chipset).ok_or(ENOTSUPP)?;
 
                     elf::elf64_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
-- 
2.53.0

