Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B532C15A5;
	Sat, 11 Apr 2026 02:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875815; cv=fail; b=YhU/5tSJdYC51+EIZMFaY+A2eupqC3zDsFEgdkoyiG7PJdZlHGpi4AIBCuE/jycst6La5oOg24dfEqwQNyvqbxtSpzxQMJEiDgKBXcp514AqFpqa+l510dOPY+uPTuj9YnHLsdb2ZWlCf/U03nzyw1HRRCUHqqWczRHR1DVOhb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875815; c=relaxed/simple;
	bh=W/3cvNSMgcu4Vjfm41EWJH0BK4SDT5eVNT+HzS1Fy5k=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VBBZ8auqduSPVlTbDlMAE0C9Ydm97FNOHZrhIRHTxGvzLC2DKwO6L7HlKkR4hcXRA5tDRZPBxcTr7Ke7oNH+6/EbmNAwJGsun8cPG9f3+Y954dMMTxrpVjCyUtZypNj8/V1Yg/ESvNj0SLg9W/NFwkoqwJ+Uv2oHBZ2QhLLux6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ptp6JZRG; arc=fail smtp.client-ip=52.101.201.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ptp6JZRG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4UKZSRNRFkWiD2MbzV3Gqkd4WqVLwEI3Ddch5s5P+TOSVXxweqvaaxLeUpmrFftzs8miN0tPJx7KPa4yWUf7bR0uQgjk40pzqPRQXClry04ETMZJNPqfhweZ8q5bJ3x4WikY4Csv6cJJVq00O1G0LAb7nWD8Ik9+Rg1h6qUjaA97Hiz+PRfn758/eOX9vsy702+ThVtS0mukVuue05RBaD3Ud/94aiHutHnXJnv5rK+d7KIr5NW2oDKINp/nFp+rIv8+jf2uiIwPMfqtYOeecxX8nTUlnmHng30ZoBQ30uETjOiEr/YDf/LCi828oiNfjUvgups76GWA3V75tmvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUYduv3o6a3DSa4+HBAPef1pWsGI1zBit5WCrEP15xo=;
 b=o0m2sDagrjVo9IYML+fj0phpkzEI25btaMCV8uuxlJot6q5XMTi9LuXkeoiXI10r6a3+gjMY/tZd+/xHHzIclz9QycB7KqeR/tPRr92ustAdjscggQIUp6CdJ3h2svnfgKAdi47p4GVChnuLszczlaWpNLPQlelh18DrBmeW2DGSskJm6hjNFoYLFIPhFhmkW+4XFUNy1DJn4mjd1EAotI2LPTEylkEnRixnx6wBrBXmfi/m8ghfk/qbSVYA6CyJdr6CJcz+1/Jq8Wa8e7tNzRQczMzoChRAEcNQDkf/Yn/xy0UJRSHWxPneQSLjw6gpMoywmcXXY5UMWRDx8UsVGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUYduv3o6a3DSa4+HBAPef1pWsGI1zBit5WCrEP15xo=;
 b=Ptp6JZRGn1HVOiETy076k/VpogcOUvo3QIwdnfS98Sk9DyL3+qx2kIacK+h+/EHZStMEY4q9V8k7SfEKqSt0/BJd90LH5nheRHIW14jqEpK4EdY4DzjVVu1Nj+EiiM4vu3pNiT8YTEoDiITEzhzlDmhlyDBHZMFlLeOEF93wX/9HPNmWZLwH1wbjXvQbEgxZxc5rJkw6+oi6F74oEta+JM09Fo1x/C05noNGJaxUIJBMThWKYMCwMb7FjRoPt88DUXjfK4Fx/E97aBFbqwzKJs1TpwTgvtk2UZAo5/xUpqSPTtV7Rp8OVH5L7qGw/g2aD0E+91TLBayjquArTMhMig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8794.namprd12.prod.outlook.com (2603:10b6:510:27d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.15; Sat, 11 Apr
 2026 02:49:56 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:49:56 +0000
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
Subject: [PATCH v10 00/28] gpu: nova-core: firmware: Hopper/Blackwell support
Date: Fri, 10 Apr 2026 19:49:25 -0700
Message-ID: <20260411024953.473149-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::6) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: fa96fedb-911f-4b4b-424e-08de977503d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Hbrwu5hGUpXbMrBZgf8JVgPBebt4mUqFbRZLe1Um96o3f8CCENQFiCkM3ABfQ7V34d6CGKWNmr1Q2sXttkYmu6nn+HfaTowDrrEhW3suBu0HeAiJt/8ccOt1wA3J43MXuJIJzz5XCt8ZryCxapu8HkFUZcITVuT2sOgJm/3DsUjQDm5mbP4+9XtpD41JMfF2Zi4aHjnMop5CZTZ7hpuJ03rYU6yZdPtiHIrQo+bITa+6YUnFzFa3w/0pCzTaFW28HDqSdoTjs1Hu/kWtAVkgIDPqdw6ml5qYTxKgu55/LAr6d4Mw8FyoLHOf9CSeMyGB6eQ0V52IZfyMgq+Yqb3wKZNpuqt7RQcnU+VnqtShmWGXgHbWiyuuOf5sqCLjijM+H3O2k3qWEbvecj+w9cok83/Fkm3LwNT4D1dgBQOFcUaNxnauYBfHpcISEdnnceZIUShq8CnsUCUlqme5Yd/aNjJ/Se3Jopy6dC+yQarz+kbfF2NTtqxbbfIzKtUO1xoiSM33XSBkpAsBGdt6Vo5HaVe30wNck5Rayj2PHkRp2R3JCzUrmQPczujRUD5/LN3kNWNW3sXwE646kY7oRxVaCkwoSDaOEnDeaCbZMvQZEI50AB61OecF5y/315vecLv5itLBKFMh7m30Bx+pLSeD8KNgsjyihh/kJCLHZMItXy2kPHGUZXtNE4xSGNVIdaZzPg2wdY74qPadEmER7pDJjIUCxgapAq//Jfdj5SJjsVc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lRKj0EK9FmBrtvi6cDX7DliGDU/Qh8CmtEPZuPgXHqngphat8qaWC0QimwQE?=
 =?us-ascii?Q?YpH9RY1M3QzMw9gzuF38RWx0+S7P5yCPOQYDGPGkfSkBuvngw8/eXIQPN9IH?=
 =?us-ascii?Q?jRzd/jueZjUnpQuJr5FvY6V1ML77cZWm+TB+QAdZ4qRbqyvGKsUqJ468Ehzt?=
 =?us-ascii?Q?eBWllVcYJwlVxUyVEOB/mxb2HwQa40pmy7vRMjmdJmDH3oAsGRHX51fKee2V?=
 =?us-ascii?Q?1+L4ZVx24rRb3eGlBc+4770cwBQMgsxP0Cy1CcsPipCI7IKsTOZw573Jy7TZ?=
 =?us-ascii?Q?oZjSUI5EhBsDael6IbgEmNUjGzFJBvdlJtpfZCdbImIRe+LuOPkeceyFw8C/?=
 =?us-ascii?Q?ejhJlxzD6SVK0mHb9bQ7hvq6atiqDNKM6IIKG59DRl2v5NkYAi7oTgdTA940?=
 =?us-ascii?Q?Nk3HKf/6YWv8iekDOVqsGAETDEkU3ZtWt3Bv71uukULEriSMDbzW5jakWCfu?=
 =?us-ascii?Q?M6jSK8IX+BgginDCJi+trP6NTpBweiUdC6rf1BEibTEbzqr2blX0Gxopnfjd?=
 =?us-ascii?Q?Qzs0wPb5YArrerEikUSYemtYwkd8UxxjaeU2kJWy6Uc8jL9PZ08mkEjDQx95?=
 =?us-ascii?Q?NCJOeCAivrAuMVvOJS4XoLCQZlyYjz6gwlZ2vgzPpFzvUmK06mY/m/xBS+wl?=
 =?us-ascii?Q?kJCRz1k7nKRxxJTfpQhb4juklatWjLfEKSiq4i95VqWYFFl+Z8qRBFY18eoj?=
 =?us-ascii?Q?eIHQxcbxEcTPNBSWSzAO2G/emLVQxJoDSCTtr+L8qP5hAv1pPPKhHen2H4Ga?=
 =?us-ascii?Q?XB59BMIMIg+0TmYbhMTfHGsouhXkwW6mfF02d2Y+TsDUcC0nEGvcx/Dvhd6B?=
 =?us-ascii?Q?8Y/M7yw5W0qiwx6kQbinXc8e4adETgmIeymNH7QvNUeGULdWxeuJCiJ33/lE?=
 =?us-ascii?Q?gjb97JU4sE0hZmcyueJs6rUAExO/02t50T7tqE/i7WlB+MKHLPlktgS1pPvV?=
 =?us-ascii?Q?4ckIhxZU59wPZreD3pjtHvfJFh+gnhhNJGZGP7RLM5mxDtyAnlTakT6oyaDu?=
 =?us-ascii?Q?LVLrV42tqzHYLt1BPQP9D0BfbLux6m+NS7ch/eN497qXyXG5ce7H+FOTF2jd?=
 =?us-ascii?Q?PhE3337h9MCzpXEDSxB+KKdV7+s4pEgjld6N60CHAOWKCkL1YlF7pqVNaO0b?=
 =?us-ascii?Q?++qU4HGrUqLRCCut/yAJj8mNpbctY4ZKVbjmO5u1ilRMtahwyQD1smXgP4aJ?=
 =?us-ascii?Q?vUcrq4MHCPvl7D6lUk3OpC6OnR58/IM/bmcuGXUE6gKGC4ktoPG/cZsivC1n?=
 =?us-ascii?Q?9WXdRhDvIYG8bB4htgW+80RnF2ac18Gh44aNtlLYnGLNWa/qSF+HDDwNycyc?=
 =?us-ascii?Q?LPSz94HyenMdm04WovJv4ybbuJvtgQKYiHu7fGzbxqgmVSuuEs+t9dXGSvM1?=
 =?us-ascii?Q?H92F1eh0yvb8el4uHW+qFXPjEzFLDjkLgV5F7di/AGrOI4kv1dpvrzSKkAb3?=
 =?us-ascii?Q?Cc1ccYHyuAC3Y7Enypu9o7U8QLpHgwkLpWeew/+nfE/BhJ6NllufeKXISpv9?=
 =?us-ascii?Q?OTu+LCDUuS3kMoeCmSfNT1cHLT+4WqYW+VuDOpfCw+Ur5bZliKgGokej5zia?=
 =?us-ascii?Q?vMqQdhWI8iAouJzro0OyN6/pELL223gcAnEsUCZFZl2GX/+CQoEWg3y5G7f5?=
 =?us-ascii?Q?6lDj5M09gci/4FnihFUtwrKxnw8MRAhm2h0KFRk9p5baU7M9yI+ulyimUyoi?=
 =?us-ascii?Q?ckVIXC/1pffaYPqpjFxXbHtBZ3BhiwDiuA5NhqMLES2sYW23LJwRtT/vMtxp?=
 =?us-ascii?Q?lflWcJG/ow=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa96fedb-911f-4b4b-424e-08de977503d2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:49:56.6322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQCLW2LHGmT2fXT60uqLb0CaU6/x4zsJqE/qb/3pYFpTNvRAmMfDjbm0WxD8I/Co8SDUdBSNK96gEwHWac1FFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8794

This is based on today's Alex Courbot's drm-rust-next-staging branch[1],
and a branch for this v10 is here:

    https://github.com/johnhubbard/linux/tree/nova-core-blackwell-v10

My prerequisite nova-core SizeConstants patch [2] is posted separately,
and also included in the above -v10 branch.

This has been re-tested on Turing, Ampere, and Blackwell. (Just
recently, I installed one of each into the same test machine, without
running out of PCI bar space, woohoo!):

  NovaCore 0000:c1:00.0: NVIDIA (Chipset: TU117, Architecture: Turing, Revision: a.1)
  NovaCore 0000:c1:00.0: GPU name: NVIDIA T400 4GB

  NovaCore 0000:c2:00.0: NVIDIA (Chipset: GB202, Architecture: BlackwellGB20x, Revision: a.1)
  NovaCore 0000:c2:00.0: GPU name: NVIDIA RTX PRO 6000 Blackwell Max-Q Workstation Edition

  NovaCore 0000:01:00.0: NVIDIA (Chipset: GA104, Architecture: Ampere, Revision: a.1)
  NovaCore 0000:01:00.0: GPU name: NVIDIA RTX A4000

Changes in v10:

* Reordered per review (and direct assistance--thanks again) from
  Alexandre Courbot: the two refactoring patches (factor .fwsignature*
  selection, use GPU Architecture to simplify HALs) now come first,
  before GPU identification. The boot_via_fsp stub is introduced early
  and completed as FSP features arrive. The SEC2 refactoring, PCI config
  mirror, and reserved heap size patches are moved earlier in the
  series.

* Made pmuReservedSize conditional on Blackwell dGPU architectures.
  Open RM only sets this field for Blackwell (Turing/Ampere/Ada/Hopper
  all leave it zero). Added calc_pmu_reserved_size() helper and
  FbLayout.pmu_reserved_size field to route the value through the
  layout instead of using the constant unconditionally. Replaced
  `as u32` cast with usize_into_u32 for PMU_RESERVED_SIZE. (Alexandre)

* Split the GFW boot wait HAL change into two patches: one that moves
  the existing behavior into a GpuHal trait, and a second that adds the
  Hopper/Blackwell skip.

* Removed the Spec::chipset() accessor (no longer needed after
  restructuring). Updated the Copy/Clone commit message accordingly.

* Rebased onto drm-rust-next-staging, which includes
  const_align_up(), "move firmware image parsing code to firmware.rs",
  "factor out an elf_str() function", and "make WPR heap sizing
  fallible" from the v9 series. Series is now 28 patches (was 31).

* Depends on the "rust: sizes: SizeConstants trait" series[N], which
  adds typed SZ_* constants (u64::SZ_1M, u32::SZ_4K, etc.). The
  nova-core conversion patch ("use SizeConstants trait for u64 size
  constants") will be posted separately, but is already included in my
  git branch. The Blackwell patches that introduce new SZ_* usage
  (larger non-WPR heap, FSP Chain of Trust boot, larger WPR2 heap) use
  the trait form from the start.

* Fixed the PCI config mirror commit message: corrected hex offsets to
  match the code (older architectures use 0x088000, Hopper/Blackwell
  use 0x092000).

* Dropped the never-used nvdm_type_raw() method from the MCTP/NVDM
  introducing patch.

* Removed stale Co-developed-by tag from the FSP Chain of Trust boot
  commit per Alex's request. Rewrote the commit message to remove
  references to the no-longer-existent fmc_full field.

* Added missing #[expect(dead_code)] on GspFmcBootParams in the FSP
  secure boot commit, removed when the struct becomes used in the
  Chain of Trust boot commit.

Changes in v9:

* Rebased onto today's drm-rust-next.

* Split Architecture::Blackwell into BlackwellGB10x and BlackwellGB20x,
  after Gary Guo and Sashiko pointed out that GB10x and GB20x are
  distinct enough to warrant separate architecture variants. This
  surfaced several bugs where all Blackwell chips were incorrectly
  treated as a single group:
  * Fixed the FSP boot completion register address for GB10x. GB10x
    uses the same address as Hopper (0x000200bc), not the GB20x
    address (0x00ad00bc).
  * Made the FSP secure boot timeout architecture-dependent. GB20x
    now gets 5000ms while Hopper and GB10x keep 4000ms.
  * Removed chipset-level match arms that were working around the
    single-variant design in fb/hal.rs, firmware/gsp.rs, and regs.rs.

* Simplified find_gsp_sigs_section() to return &'static str instead of
  Option<&'static str>, since the Architecture enum is now exhaustive
  and every variant has a known signature section name.

* Moved dma_set_mask_and_coherent from probe() into Gpu::new(), with
  the unsafe block narrowed to just that call. Gpu::new() now takes
  pci::Device<device::Core> instead of device::Bound to support this.

* Dropped the local `chipset` variable in Gpu::new() and accessed
  spec.chipset() directly, since Spec is now Copy.

* Changed Spec::chipset() to take self instead of &self, since Spec is
  Copy.

* Removed the unnecessary Tu102/Gh100 consts in gpu/hal.rs and used the
  unit structs directly.

* Kept a hold on the Firmware object in FspFirmware instead of copying
  the FMC ELF into a KVec<u8>.

* Moved the dev_info formatting fix and the GFW_BOOT comment removal
  out of the Copy/Clone patch and into the patches that actually touch
  those lines.

* Added Reviewed-by tags from Gary Guo and Alice Ryhl.

Changes in v8:

* Added Clone/Copy derives to Spec and Revision. Removed the
  unnecessary pin_init_scope wrapping in Gpu::new() that the lack of
  Copy had forced. Added a Spec::chipset() accessor.

* Removed implementation-detail sentence from the
  Architecture::dma_mask() doccomment.

* Simplified the GPU HAL to two variants (Tu102, Gh100) instead of
  four. Renamed "Fsp" to "Gh100" to follow the HAL naming convention.
  Removed the spurious GA100 special case. Moved the GFW_BOOT wait into
  the HAL method itself instead of returning a bool.

* Increased the GFW_BOOT wait timeout from 4 seconds to 30 seconds,
  after Joel found that a different Blackwell SKU required extra time.

* Removed stray Cc lines from each patch.

* Fixed rustfmt issues in gsp/fw.rs and gsp/boot.rs reported by the
  kernel test robot against v7 patches 27 and 31.

Changes in v7:
* Rebased onto Alexandre Courbot's rust register!() series in
  drm-rust-next, including the related generic I/O accessor and
  IoCapable changes.

* Rebased onto drm-rust-next (v7.0-rc4 based).

* Dropped the v6 patches that are already in drm-rust-next: the
  aux-device fix, the pdev helper macro patch, and the one-item-per-line
  use cleanup.

* Reworked the GPU init pieces per review. DMA mask setup now stays in
  driver probe, with the mask width selected by GPU architecture, and
  the GFW boot policy now lives in a dedicated GPU HAL.

* Reworked firmware image parsing per review around a single ElfFormat
  trait with associated header types. Also added support for both ELF32
  and ELF64 images, with automatic format detection.

* Reworked the MCTP/NVDM protocol code to use bitfield! and typed
  accessors, removing the open-coded bit handling.

* Reworked the FSP messaging part of the series so that the message
  structures are introduced in the first patches that use them, instead
  of as a standalone dead-code-only patch. Also changed fmc_full to use
  KVec<u8> from the start.

* Split the WPR heap overflow handling out into a separate prep patch.
  That patch makes management_overhead() and wpr_heap_size() fallible,
  uses checked arithmetic, and leaves the larger WPR2 heap patch with
  only the Hopper and Blackwell sizing changes.

* Added a code comment documenting the Hopper and Blackwell PCI config
  mirror base change.

Changes in v6:

* Rebased onto drm-rust-next (v7.0-rc1 based).

* Dropped the first two patches from v5 (aux device fix and pdev
  macros), which have since been merged independently.

* const_align_up(): reworked per review from Gary Guo, Miguel Ojeda,
  and Danilo Krummrich: now returns Option<usize> instead of panicking,
  takes an Alignment argument instead of a const generic, and no longer
  needs the inline_const feature addition in scripts/Makefile.build.

* The rust/sizes and SZ_*_U64 patches from v5 are no longer included.
  I plan to post those as a separate series that depends on this one.

Changes in v5:

* Rebased onto linux.git master.

* Split MCTP protocol into its own module and file.

* Many Rust-based improvements: more use of types, especially. Also
  used Result and Option more.

* Lots of cleanup of comments and print output and error handling.

* Added const_align_up() to rust/ and used it in nova-core. This
  required enabling a Rust feature: inline_const, as recommended by
  Miguel Ojeda.

* Refactoring various things, such as Gpu::new() to own Spec creation,
  and several more such things.

* Fixed three Delta::ZERO busy-polls (patches 21, 24, 31) to use
  non-zero sleep intervals (after just realizing that it was a bad
  choice to have zero in there).

* Reduced GH100/GB100 HAL duplication. Made FSP_PKEY_SIZE/FSP_SIG_SIZE
  consistent across patches. Replaced fragile architecture checks with
  chipset.arch(). Renamed LIBOS_BLACKWELL.

* Narrowed the scope of some of the #![expect(dead_code)] cases,
  although that really only matters within the series, not once it is
  fully applied.

[1] https://github.com/Gnurou/linux/commits/drm-rust-next-staging/
[2] https://lore.kernel.org/20260411024118.471294-1-jhubbard@nvidia.com

John Hubbard (28):
  gpu: nova-core: factor .fwsignature* selection into a new
    find_gsp_sigs_section()
  gpu: nova-core: use GPU Architecture to simplify HAL selections
  gpu: nova-core: Hopper/Blackwell: basic GPU identification
  gpu: nova-core: add Copy/Clone to Spec and Revision
  gpu: nova-core: set DMA mask width based on GPU architecture
  gpu: nova-core: move GFW boot wait into a GPU HAL
  gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting
  gpu: nova-core: Blackwell: calculate reserved FB heap size
  gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
  gpu: nova-core: refactor SEC2 booter loading into
    BooterFirmware::run()
  gpu: nova-core: Hopper/Blackwell: integrate FSP boot path into boot()
  gpu: nova-core: don't assume 64-bit firmware images
  gpu: nova-core: add support for 32-bit firmware images
  gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
  gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
  gpu: nova-core: Hopper/Blackwell: add FMC firmware image, in support
    of FSP
  gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion
    waiting
  gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
  gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
  gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
  gpu: nova-core: add MCTP/NVDM protocol types for firmware
    communication
  gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
  gpu: nova-core: Hopper/Blackwell: add FspCotVersion type
  gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
  gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
  gpu: nova-core: Blackwell: use correct sysmem flush registers
  gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
  gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling

 drivers/gpu/nova-core/driver.rs          |  16 -
 drivers/gpu/nova-core/falcon.rs          |   1 +
 drivers/gpu/nova-core/falcon/fsp.rs      | 234 ++++++++++
 drivers/gpu/nova-core/falcon/hal.rs      |  21 +-
 drivers/gpu/nova-core/fb.rs              |  51 ++-
 drivers/gpu/nova-core/fb/hal.rs          |  36 +-
 drivers/gpu/nova-core/fb/hal/ga102.rs    |   2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs    |  80 ++++
 drivers/gpu/nova-core/fb/hal/gb202.rs    |  77 ++++
 drivers/gpu/nova-core/fb/hal/gh100.rs    |  38 ++
 drivers/gpu/nova-core/firmware.rs        | 176 ++++++--
 drivers/gpu/nova-core/firmware/booter.rs |  30 ++
 drivers/gpu/nova-core/firmware/fsp.rs    |  44 ++
 drivers/gpu/nova-core/firmware/gsp.rs    |  35 +-
 drivers/gpu/nova-core/fsp.rs             | 523 +++++++++++++++++++++++
 drivers/gpu/nova-core/gfw.rs             |  76 ----
 drivers/gpu/nova-core/gpu.rs             |  62 ++-
 drivers/gpu/nova-core/gpu/hal.rs         |  28 ++
 drivers/gpu/nova-core/gpu/hal/gh100.rs   |  18 +
 drivers/gpu/nova-core/gpu/hal/tu102.rs   |  86 ++++
 drivers/gpu/nova-core/gsp/boot.rs        | 286 ++++++++++---
 drivers/gpu/nova-core/gsp/commands.rs    |   8 +-
 drivers/gpu/nova-core/gsp/fw.rs          |  62 ++-
 drivers/gpu/nova-core/gsp/fw/commands.rs |  22 +-
 drivers/gpu/nova-core/mctp.rs            | 119 ++++++
 drivers/gpu/nova-core/nova_core.rs       |   3 +-
 drivers/gpu/nova-core/regs.rs            | 104 +++++
 27 files changed, 2000 insertions(+), 238 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb202.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fsp.rs
 delete mode 100644 drivers/gpu/nova-core/gfw.rs
 create mode 100644 drivers/gpu/nova-core/gpu/hal.rs
 create mode 100644 drivers/gpu/nova-core/gpu/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/gpu/hal/tu102.rs
 create mode 100644 drivers/gpu/nova-core/mctp.rs


base-commit: dcba1b1052c8a7381df762597fa50a50ad2efb8d
-- 
2.53.0

