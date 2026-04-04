Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013002.outbound.protection.outlook.com [40.93.201.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2831DED4C;
	Sat,  4 Apr 2026 02:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775268732; cv=fail; b=lWnJkIT3hVhh1xB8rxv4MAiOeim7dhKInZiErWIbQKqUdx8Jm7RtEIiY6GsYeCsGFTsxQbjNy3w3+tgtvA0S6iZmu/RI1GUE5QD9ir4/G+DZV9Fyrc8PELqBX5mEv3zlX/6Ke4GITYfsoR7UguPnPU9shCnALPXnORxDKMs9qMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775268732; c=relaxed/simple;
	bh=SHEUxGNJNXLgIYTxT4aGkPhLGSZ68wBaExYgps4XL94=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Uz3e+ikG6ydPDil2VAWckOKaBi9tVM6hl8Jx4owJiQ//JIz/jHKO5DSeAYyKkETFHiE7fOj6rHa525beTGrcAaVP7oTbGLsuuSvKO7NHrLMcCtdfrNMMiWq3/P65N1xfY8OyFHIOyvjtgTX7atA/L0ai876RZ5LEq9fxNpuIiYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BuYYyEhi; arc=fail smtp.client-ip=40.93.201.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BuYYyEhi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdiXYS7YoitLOZT1ceRPXUOda4oi39s3AeA+n7v10Ly213zh+pRXKEVtCJwigZSNH1qUoaKtR3n6xc9kR8JgOiPe8l7sN0POQUwb4DKc7cFBiwNDzsrtboO2sHLO0pY6bS4TH4iV3AUy34nevo/d3DBjpIor8HUNWbYcT40GfyWFt+nQMqCxF2+yuMy7cVS17WmLawwpV4NK1ScEkzSsZMNILAVp6koF6S2OwxlQTFg2AU1XF4LvjC9emiL8IFgXX0dGhnrt8ngv7HhdJiKQpK8KenD0m4n1p2OgixMUlT4AEBM4972vRBMDh7bRCUofeEoaImSXPRVAhAhjvflhTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNr5HKpJDC86wou0QWfRyWjTuoLMOv1hKadpcZWckbE=;
 b=s4PJpqp6yhIkthOgSAFN6sYNmgBlug5fRnquCoGitB7vSp2PHrOgmczrzraaCBbApGu5I+wNQUJw/HLvq4bRgsbjrL+zEXQoNEa/KnlK6KMIj/7JOa1+T2gIjGyAkgTtmC7Q5i3k9AwRq2lmnnjnQEv6PUT3IXXjQfJD+mLf3VGXPR35Cr22OHTHNdKGi0lw8wUCJ9cHHWTB48WbgGAghlaRMVXb5/23K34tlWy6sfBhlT0a7AQO/TgN/o33pcaOFE+KnRi02OcdK+BsJxZV57FyM54YId5FbhgpLr61nzQ6PNzAZR1tJDEmX2JA9jvlv4EzFkFE8ORk7RZHN8004g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNr5HKpJDC86wou0QWfRyWjTuoLMOv1hKadpcZWckbE=;
 b=BuYYyEhi22FXTKdoqKIw5+Tw031GupjptQPtBOuRB8Arui0GmJmyVGBy/NOIgtD/tsZHA/+IbGo3oqXEhEHgef16FN+9kfTC7r3cVsF+D+RAbg4CTihHsaBhUtR1HQhjaYjgLas/6feBQzwhNVXPl6i1EvSnY36BrA0dn13h94Y0kh7ZVIB1jChAA3PDafAE6YS3xTKBNj9oIesF92inzaf6R4cLr1qafhSoM1Rdvj7ilQCwOaw627OYbVCJguECsJQQpELaF436yZtftOeu55fkBrOV0UewYWrIx0ib+2iXKXBoUXO+k0d626NlOe2IKNZc2TMKIZoCB6nyjhAEeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY5PR12MB6177.namprd12.prod.outlook.com (2603:10b6:930:26::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.16; Sat, 4 Apr 2026 02:12:07 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 02:12:07 +0000
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
Subject: [PATCH v5 0/3] rust, nova-core: add SizeConstants trait for SZ_* constants
Date: Fri,  3 Apr 2026 19:12:01 -0700
Message-ID: <20260404021204.339779-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0080.namprd05.prod.outlook.com
 (2603:10b6:a03:332::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY5PR12MB6177:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9b2f29-9f51-4de2-b15d-08de91ef9225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DtVjBmUG0jaCWJ0Ebr85S5lfMYF7SrNvW2keqShvxQwy2VPpiWquQvk43Oz73TJKTnmie27147+lML6BzVmc1fUuKDrJgUB6Of5wZtrO50svIAlVtIoacojlrnFGAz6MOwqp2wUDEijHh6H/z3JTJomk1ciRhCTdNIkrz7xEeCxCUQr5N9YLG8UiqpQ6wQouEt4YklJZMV1FYnlY5ZvG9xm+6ybJ+da5aNNr7i5SR2qjrDhzlgMmLhpfyoRQfz2J6Y0eeFv77Ez4z4kSFJa6OQqy7MhI96KNDl0RuEYxxArZdTv4nk+jZ8wLuEg5tv9Evb4FSD8nTCg1Q6l0g0Ed7QzDe6xbylMRiDq7tU4J4aAbjmxU7gYoXhgSgEgApWwiJzJtRYEqLAh0zukluln49TMPW/qCCxr8xurIitJzGc+ynyNd2ot/i/h5be8KoUHc6I8mpViqSKYBTHB4Yq5RJDURhn4Zfii61pysvYwJeuV7Fp3qjkPN8E0YZV13qQG2Kl8BVdRGyeVVR60tEQYO43oaaWMYhfzWwW4oMJVo4VX/ZH/u38dJ/rCYvawTuryZo3rb0jfys8sJAK6X1uRYqnjbYdm0RwUaBidu9Hw30IaKSdXAtwOKkqUD6R3K7HYy96WBYnFDjENHl2yGuuCOW0V6Cw78JCC382jJUmfJUoXSV1yHNRfgKtJXSm1ZoQZ0iacTd7doAODt4EYG64kRjMtQRtIpo9tL/au+TzRxTNg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5nL/RdBlYm6MlLw98dD3d7g1IKbZHRgUZIS2zpOWBp1YMzZ0ghkI8mnEMtsT?=
 =?us-ascii?Q?nspcq7AHGdL3GY/84lzsWIJvvdYYmU27LTfSvtFqBrjSgpwUFWXFMYGlzB0Z?=
 =?us-ascii?Q?uEUTObX7d2KjwCUaX2kV95NkNkcp3mGNTBbF4AUuZv8Cvx4d9jIOb4WRC/QJ?=
 =?us-ascii?Q?gRdpbo0ZgZtli3GkJJuds0BpRXhjXklYnwQjIyJx/p0JPSsLle5gVd0B3vwX?=
 =?us-ascii?Q?9LjCcM+cJX/1wzy+wfV0cZtCmJqYcRPJbCJ+9HIjTFPpzpjJ/U9hrA6z06VJ?=
 =?us-ascii?Q?E6FpyvQps7xMREFmDZGHpnvmlNlJlSqljxnZJGVk1RAYzvS6t3KnYqXkTIM0?=
 =?us-ascii?Q?/fF4OADBv7BRt8PmLfOnJmarMnN9+52jJnF4yK8BXBpSU9pha9vZAsYI8tj9?=
 =?us-ascii?Q?PSatOmlH89MhALqMEwH2yG7j7j+ZV4R0gJDi5CFmbFcn+I1dfidrJnqhTNY5?=
 =?us-ascii?Q?3yUPxt/hfn/Y6PC91U2Me5UxyfIhG5Qdt0VMEux18sQgvgcM/25keSV6aRQo?=
 =?us-ascii?Q?EZLxm8bgFkRf8w2GlI9aVZnYJULRmJ7bLCztYqc8PH1w88E+Gp6cSi6ybpPl?=
 =?us-ascii?Q?39l1BJBPenIoeXEbCTaDPsrcvRLW4k2wMtOW60CI05amFjXqMF3ulOdS9K/7?=
 =?us-ascii?Q?xhPb2OdnemAOPWBmdF3TZTBC6SOATtf34DQk7Zgzi/ArMl+zoDLwI35iYK1j?=
 =?us-ascii?Q?jTMBIzsoJJZuDpRJRfwJ11LsVbCNduJHEG7BKe1wAS54hLY2+qCIayFOo4uN?=
 =?us-ascii?Q?pnc4wOn/zQgsolImR7UvfD/1FfMBrQalQwA3zmaEI0rAD3zfYyjcimccl2/n?=
 =?us-ascii?Q?t5z+SldiK2F0ULUs+dAffl/0xe/u6JyNmbFXRRSarEabpJi+J38inJ6KNXys?=
 =?us-ascii?Q?IN6dY4Cm1zR40xl8T2tvCC+CegEu1N2c4lYQpBVofm4JTGh8eKKjJO3S873x?=
 =?us-ascii?Q?0PSlky21YQGbYLEcrJMSU9C19Fsc7QmQ6smwHTua69taUWQtYtSm9i4+jAWY?=
 =?us-ascii?Q?tpmnmdGNAI2o/0GbvVlQp1bRvxxcoduGo7tmOmlAjWS/hZHi3zBheD8Q29xx?=
 =?us-ascii?Q?0wTZYYn+gAIWemnRX6CgOCcxPrJ7JLEJ7PS1ieweLs+DXso9VfESOPuMvLo7?=
 =?us-ascii?Q?M8nNmINWldkg7wRDRtujQgc2I/DypmM0/raJ3ZnFQXM1tSDxE2zmatsdq/zp?=
 =?us-ascii?Q?YmOPnUsYwMgn1YA8wqsXn/i1gNgJHMn3+hxlZtQ/6wY/q5MOH5r9XlH6lTB7?=
 =?us-ascii?Q?btuzeOyW8SomCEiCkuECeuRaE1LIQJmfu6HEV0k1seCtla7SvOwc6bTF6SA5?=
 =?us-ascii?Q?VYG7ygoxMwNUqHTFrZeL9pxkFNskPfrTDMFZwEAmHEW5RhI5ogsQrzgZKQom?=
 =?us-ascii?Q?+f4Wv8/hyZbew+hYCJYWxcrfTT5jIG4k5P2PtUnc9kqAkakNTNJM39tcKmwl?=
 =?us-ascii?Q?uUG0zDUpa4wGSnpGcc+ogk7sRzdoKoUQ0Tk5fjAhCYTyggMsMjF3TP/aK7ps?=
 =?us-ascii?Q?mwm8bFYU2DIR3Cm9g1r7ekHJTkwx97uZp9XLFFNIzfSNno1mZReP5mwPwINP?=
 =?us-ascii?Q?NxYYrmpgYR2jHC69GlHd0Z4WNP70Cy0HmU7mSNfHauy0Fx9/XEh4Aoo9IJY7?=
 =?us-ascii?Q?YUQzN9pVD67H3FdNRAaGMQyxuGs32iclhylGaO3jAsH0OihcFW0fvs8J5xRc?=
 =?us-ascii?Q?Dyl02c+Ss6KJO32tAItETxfrOM2j/0q/fvb1X2DSxxdYKlhhKZHlk2VvLlr7?=
 =?us-ascii?Q?IL1EyvZliA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9b2f29-9f51-4de2-b15d-08de91ef9225
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 02:12:07.0582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XY5inEUknTRMNS8DFghruNerTgm1QxYtT5s4XWf6J8FUkAoZQDBNyVYYEDz7+DwBtpzF+Ao3esLuiFnL3x5k8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6177

Changes in v5:
  * Changed the subject line of this cover letter to not use the old
    DeviceSize name.

  * Collected Reviewed-by tags from Alexandre Courbot and Joel
    Fernandes, and Acked-by from Gary Guo.

  * Added a new patch 3/3 with a todo.rst entry for device address
    type wrappers and a marker trait, as discussed with Danilo.

  * Rebased onto latest drm-rust-next.

Changes in v4:
  * Renamed the trait from DeviceSize to SizeConstants.

  * Added backticks and trailing periods to all hex-value doc comments
    on the SZ_* constants.

  * Removed redundant type annotations from doc-test examples.

  * Used a `use` import for PAGE_SIZE in the module-level doc-test
    instead of a fully qualified path.

  * Rewrote doc-test comments to clarify the distinction between
    module-level constants (no type qualifier) and trait associated
    constants (type qualifier required).

  * Added Reviewed-by from Eliot Courtney.

Changes in v3:
  * Dropped the Alignment::from_u64() patch.

  * Reworked define_sizes! macro to accept target types as arguments
    (define_sizes!(u32, u64, usize)) using recursive macro arms,
    instead of hardcoding impls for u32 and u64. Overflow checking
    uses u128 casts so the same assert works for any ("reasonable")
    target type.

  * Added usize to the DeviceSize implementations, so the trait
    covers u32, u64, and usize.

  * Hex values for each constant are now proper doc-comments
    (forwarded via macro meta), instead of inline comments.

  * Rebased onto latest drm-rust-next.

Changes in v2:
  * Replaced flat SZ_*_U64 constants with a DeviceSize trait that
    provides SZ_* as associated constants on u32 and u64.

  * A define_sizes! macro generates everything from one list of names.

  * Added Alignment::from_u64() so alignment values can be constructed
    from DeviceSize constants without falling back to usize variants.

  * Rebased onto drm-rust-next. No longer depends on the Blackwell
    patchset.

v1 is here:
    https://lore.kernel.org/20260310023145.120037-1-jhubbard@nvidia.com

John Hubbard (3):
  rust: sizes: add SizeConstants trait for device address space
    constants
  gpu: nova-core: use SizeConstants trait for u64 size constants
  gpu: nova-core: add task for device address type wrappers

 Documentation/gpu/nova/core/todo.rst |  13 +++
 drivers/gpu/nova-core/fb.rs          |  21 ++--
 drivers/gpu/nova-core/gsp/fw.rs      |  15 ++-
 drivers/gpu/nova-core/regs.rs        |   7 +-
 rust/kernel/sizes.rs                 | 167 ++++++++++++++++++++-------
 5 files changed, 155 insertions(+), 68 deletions(-)


base-commit: 7c50d748b4a635bc39802ea3f6b120e66b1b9067
-- 
2.53.0

