Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011053.outbound.protection.outlook.com [52.101.52.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ED635BDDB;
	Sat,  4 Apr 2026 21:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775338205; cv=fail; b=n+WFQD53wbgINXFZ0hseOFaM2T2+tRyau9q7P3QVrMCoMbbC64zU6ymXhXuxLY382/Ve51VKJdXFRlXOve/zqt0dZXLKvFtCD5r/QyfJPzqElmWvrko0OmUQ2Q/rfnhju21JzZzvvxFUeNMnCLbX0LFDFU5MZYki6xOo3v+XwDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775338205; c=relaxed/simple;
	bh=V6A2hPi/f+DsgHLanSOAlbLykUc/ecDtQm9/Qae8Ez8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WZjvczrEU3tKLzRYOPYsK4iSLRGHF60QqrtEjJRkmKM5pFDQUd+2+kGTlpRkLeVyGQefDxGWn9Tdl7f9zZAwEkeJLpAMRAajW2STp+Jyb6S+cnkAXcXecsEI6G+RLugiKsEAmtGYFdZZEjInLog98IUKx3uAh2tFPgv5vPvLWRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NzCVj/N7; arc=fail smtp.client-ip=52.101.52.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NzCVj/N7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YaEYQkv0EugZzCamBwH4FeN7JImB24GBtBUIGEY6zjw7X7EnEbmAslgEC0BieBcHXtXqKetuL4icivBf9B29Tn+UeEeHhjTvIphPLFsAM29OJjTmHnwBHBJ8LogDU3xveu3wbHozfQEWlCxiQIMhYrBCEqcV3k350FBhcU2IY6m6KKRhMO9HV7Xu1Z9RKaKsse1yMSoSygY5FSnt+3Gsi4Yi5CV0dN7cdn9UOKONzF64HNtL7hpJdMYW3PIeR0jkJiudLOBTf+z/WxryOYKzu7eUZJIXJ/BGOrY5U4jDTAMvG9lSVLkE6ArW5jMvnt6QLk0lSsQF7DFR6ZJY34crVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muKmABrAAGqvmgfcQReT2UHPmlqwq+wAVvyM6Z+qwbc=;
 b=wstyhDiEkcfuc/md+BpYU/P1MqSu+Jd8QTZmanJC42TNAezXddZp9erdAbW3Sma2GDTu5Ro8jzRyywFOSsNrezNGUBEay2himAXqoP5RrrE+yqIi+IL6wh5aZM1CAU5gYygfCpjjvuAiz5IbSpDG7p8MkYW1htJadxMgtUsCSKTcdN3NV1P1p2LlQFKzdbDJO6rIlhXnG+qqdOTNUuE9PspA5Afts35nckINqBPJ2IRInX/0Pcz1xZoQ48/mx9lWB0pVmT4c4lTjgTQL/UzsCEMsLuTImVgNPNxbpTJndJ200tlYK628ZQA6GJ2YQ4Sxw3G0Elyrvt7EH1HVyUvOag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muKmABrAAGqvmgfcQReT2UHPmlqwq+wAVvyM6Z+qwbc=;
 b=NzCVj/N73JTNuJGO/bUKO5D+/HY5WaYrzvWRGNFSn16AJrsenIht6dSEKV9wm6+MlYc1rs9jwLpmaN7l18AsZgc/OE57Xnl5goL+9u7QWeh7AyPDwcpNe63kfRyv3CNnkOqsTYPP/S0DwHdzVX2fzxjkESRSmHQkufRvyjzrIo9h4F1IqJiM+QKR8EbvadA+NDdkeTU7J1ir6/bliPuPWmDVP1U5X8zNi1xBmFGjQkzx9wb84INeRgFteQDuLBugee+c0ZPnnjEVltFBsat86izDUL6d0oQKMTFth2eCbNVLAuF/TzS1iIY74l4SSOan5sLokgorEW3fM6IWrgKmFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.8; Sat, 4 Apr 2026 21:28:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 21:28:33 +0000
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
Subject: [PATCH v2 0/3] Fix all clippy warnings in drm-rust-next
Date: Sat,  4 Apr 2026 14:28:28 -0700
Message-ID: <20260404212831.78971-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA0PR12MB4399:EE_
X-MS-Office365-Filtering-Correlation-Id: 8efcd1a1-c200-4d0a-0ea4-08de92911fcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IMvxaOOBDxB2uryRxeLXlBYUQVQQCf9v9PbqZCbw00Pn5oTuVk6xABNHZ9j63NdxOMb+zvc6yu4HOoeUPEyGN/r7AKfB1BWrfjULvMM5gydmnj8oCHWfJMu/9FrFJzd14ICUEKUf1CUiO+ZAGwIL4z4o9ipa3mSPXpkLiiEbZqq7QIc9L/8zEwljXW9Kbuxo/L6hZkrjj11ih2ag8kn9mt3NPwc80KMeXzGUJQvN8DtcIPFODyxgG1/r/19hCab6+bqWapriZpsaEHUHobxKzc8qFp8xTs7Fz4bGXFz3Hr1y0OEVgjDu/wbkUDoQrRly6O+OAftMUH+lzTI3h4/DgMxgIAXWZ/yyeBZfMlpgdWmokGeodwPemKJAk2dSgCkXEkRe/r16GqYmMyefcH6Eg7rftxtsYvfHy47agxbETmW8/7K5hfM5WHPjACGE1LrMlwTLrT7ArNlilptzGaKQ8TLXNILQh3FKdskRyl2tU4ZI5wUlkVPB54+YBGDY/e6emTdUlu4fdSAewApjp3zaCJCBFju0y2gxAK/KkX5kHYySAM+jXPKDWfChh58gymkWOBTz8QLbTLcYpXrorOEIzukNvAg2BsDr40dK5qnfcKOjPi3VNSD/RVJIoCBA6o/OYWWTnv5IQEkGFjiGTY6kJ8sro/6kFvceAS4kijTdNTYWZ26hBAsg81j557V7BBowVgVK6h2/woXcjg7F00mf0pjtspqA+CuWld4I/3dGew4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YslISGf+7P65nknMLAe6GJ4h2i7in5gllngZv87aAHoBAFrOOHzX9uti9tJg?=
 =?us-ascii?Q?7lMqU2wBjnGDK2dq0auuuclDTYkx+Dna41F25DO5qFCSM5Bi3UWexm4PFvIf?=
 =?us-ascii?Q?oghuny6LhVF0wMaYtwIUGxmAl9SOxJ8b854cCplPi1DoJgLA/xLSY/G3d1KQ?=
 =?us-ascii?Q?1bUEunyNqzW4BquBYihnbm2bDF3YefN6OWgplyGY3bfIMCZUJvob7oz0HBb9?=
 =?us-ascii?Q?3Vvm22KZSXbw3++eEtB+i8EvXdX24qPnzZa5RP27CNNWWvtWGCq8LMN2wmi9?=
 =?us-ascii?Q?E/tbgAlqRe7jf9n223P6QIbGU8bqu3BeMODGJhTLQV0oAlMonohI1f1xHZWg?=
 =?us-ascii?Q?cqZLb+JcXDCrC1VIxGxAMVnuGMVbWSaKMb+sHQFpJJzxim1BV1vP3qevrLqc?=
 =?us-ascii?Q?uxcyi+t8+LCyTPhbHX3iET0c7IJ03efO0nj2wuxWFdJ8xOS56DLXJSbZbBGi?=
 =?us-ascii?Q?ALTQtz5t9M5ylWrCUlOmD31jZ9HAw2BHtNkdXTkSzpnY0+XMfo4YRIEoEJIY?=
 =?us-ascii?Q?QFPuIMo1CJrHlLkp3T/n4L4yleLQdJWHPEjoumqfIpBc9ei2FoY2hWWXYGMF?=
 =?us-ascii?Q?C0cdRl7ca/L8EpyK2pniFLQfZYMkDxfb+PzRhfoVQVRjipQTFxVvHWwzk/D6?=
 =?us-ascii?Q?BdHdR6pRFYurmW+7xTTeTnWDkL6W4fSFTvk0hPaPQ/Q8ah/HWNfZqA4+hs6D?=
 =?us-ascii?Q?7G207N1LUrbj56HRWqEkGMbpg5IxPmJbdLrYjTST466YmHSWUKU3Z34koRS7?=
 =?us-ascii?Q?OxrJyyrYoTTob/cYURES8fCAt+9o2Wji5T82ZAgMzSOIlcGAVvnlXChTMRnk?=
 =?us-ascii?Q?LXY2eXapPS0ebeaRgq+c1Ar5/gDa11EqddDaBatntiv43r+U6b2MMlFJfWV7?=
 =?us-ascii?Q?gQu1EADLJ+y2RGiLoAzYSgG1YQ5HUnilNed2oRM/5VFIseMsL4sUG87HEole?=
 =?us-ascii?Q?pBEBPD8QAh75/nk7zThIlKEpQcB5XM1reVOp7sQyYdCpUzJ1RZg2FOjtgAQc?=
 =?us-ascii?Q?YvlIC5IvpAJTNtsDlzTZXjGawcZ0ZHk5zeB1xO/t4+xZtnqTljGWrpDGbR9A?=
 =?us-ascii?Q?e1906iJmOJ/jDloYSlQDrRBltkSLXIogxNZWnErl6tyTcDs+re/fF4xt974P?=
 =?us-ascii?Q?Op9Sf/tVVZS5srgOPxCAaB9uT5shjBPzFNuTsINA2i6SqxS6mhy38ObmZ9Ap?=
 =?us-ascii?Q?q/404ZZwu73JEDQeGM21Wxc/LkF+u1YFvUADIyOqpHzP2ZA/RpqVsLeY9Zt6?=
 =?us-ascii?Q?F0OeNShN1Ym9JGODfiSw6HQdDgFhiZzb8MshYQXF7UeSuclBCWuSyt1e3T/b?=
 =?us-ascii?Q?kJ8o+BJC9g/Ue2rLIMrCkULBpcV4hzJ6fqAg+fufgPXLaTwH610gwekvdIYT?=
 =?us-ascii?Q?9+4TzovtCdCpsL4pqpq5U8TCscrzND7iNGw1y6zgiOSA2KmgpgIwXBnuUi5H?=
 =?us-ascii?Q?Ro6mNroXYrjgqnLGR4vmpuwVv0uL+ucJ40FdkzXxgOjWiY7VwjUFtwgqNKiC?=
 =?us-ascii?Q?AElju893TX/dMrCnU8qF1Mydo5a3RhsmMThFQhMpbsGsoAsFgoQB/SyIjLNU?=
 =?us-ascii?Q?aQU+I8Mji2/eKcfeHu2t7uiQoJ1pEzigY6Z0nK6LSk0MZVDnNFQvVmcrwrVV?=
 =?us-ascii?Q?SDNoE0crZOfih0o6e2AxoZwf8YrBRksug5n1VSCfvVz2I05MDKW27Uh6h1/p?=
 =?us-ascii?Q?oO7rF12IZmHSlRsDyvBGAqruLhV0mL62QcwfnqILAZijlPaL18ST30B1oRY7?=
 =?us-ascii?Q?di8zTht5KA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8efcd1a1-c200-4d0a-0ea4-08de92911fcf
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 21:28:33.6870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AmdnxzLAc4D0TazeXPWjnEN5MUmrBH5CYiV0zn6Ja/okDdjtp2xbnwM0RAuemb1V8sH9nq9BykYgqnZvUjlXog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399

This series fixes all remaining clippy warnings when building
drm-rust-next with CLIPPY=1, using rustc 1.85.0. There are a few clippy
lints involved, spread across nova-core and kernel crate code:

* clippy::precedence in nova-core vbios PCI ROM header parsing (2 warnings)
* clippy::precedence in nova-core read_sysmem_flush_page_ga100() (1 warning)
* clippy::incompatible_msrv for slice_ptr_len in rust/kernel/ptr (4 warnings)

v1 is here:
  https://lore.kernel.org/20260404025821.386514-1-jhubbard@nvidia.com

Changes in v2:
* Split the vbios from_le_bytes() cleanup into its own patch, per Alex.

* New patch: silence clippy::incompatible_msrv false positives in
  rust/kernel/ptr.

* Expanded the scope of the fixes: now it makes the entire drm-rust-next
  kernel clippy-clean, at least for the toolchain that I tested on.


John Hubbard (3):
  gpu: nova-core: vbios: use from_le_bytes() for PCI ROM header parsing
  gpu: nova-core: fb: fix clippy::precedence warning in
    read_sysmem_flush_page_ga100()
  rust: ptr: allow clippy::incompatible_msrv for slice_ptr_len

 drivers/gpu/nova-core/fb/hal/ga100.rs | 7 ++++---
 drivers/gpu/nova-core/vbios.rs        | 7 +------
 rust/kernel/ptr.rs                    | 1 +
 rust/kernel/ptr/projection.rs         | 3 +++
 4 files changed, 9 insertions(+), 9 deletions(-)


base-commit: 7c50d748b4a635bc39802ea3f6b120e66b1b9067
-- 
2.53.0

