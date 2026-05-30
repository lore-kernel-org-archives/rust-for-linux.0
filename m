Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010010.outbound.protection.outlook.com [52.101.85.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BAE2E7BD6;
	Sat, 30 May 2026 03:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110608; cv=fail; b=iMyeescjTFI2SJvODwjkVtDiRBKvFolMaeOqna7FdebVFVKyG8c9pOSvXjg6RCAk+ZNgRZ+oBpuJNAui7Nw7MTRHJkh+DcMoOBMxqPzeg3y7TW5zpXJPZ0xr0rs4yox2d5xtP7Q38dVmtT/oOJ5Jyvp31AgQLZbOuTtkQODB2UU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110608; c=relaxed/simple;
	bh=sFHUK74rD3qeg8YqbVYV3qcs9dgavSXOZ7as0cZV1Oc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kXzYUSnvvHalZ0bLjECRMNfSt1XizHVi4b7Hkz2ftJXDL/ubnxjVtmK7UycEgfov2RofIvdH7bZutaxY5lZ3uOxq9SL9AtM5itzxQqEzf+m7WSItlfCOaomlRzgneiR/gRhyWetLh1UxOLYiL/lNGlF6texzJkK2zkobfNuhQRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oWIRrUTz; arc=fail smtp.client-ip=52.101.85.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oWIRrUTz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYd8ivG66fsbtl2H0rYT/W+qAdk4Nw71+gTgG61eekS5jrMh9UV86k/znTaSoScoxfJzltcNxFSonimkvP+3o5qYtPEako2dtL6CRuHE40OAlDqKCaZebIjNoiVapdYHSKsiznC+EtY4vMlA2i6osKdM/2+xJGjFPWsNbjPFGw/yWkOBkgjKU9oc+ZJn6tOJLH616UDRbaVS84tt2otBwjbtO42erXZlceIL4gPQAAHf9wLcVl7x4e8S8p4iZqXt/GXj4RjZLXCtHgHanqx2GV+aEa2l2n3P//Cx6MJWGwHZ4yGrC8nXfoVex794iexa4dYWffn2GmA06kEwLMt9+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEO7Ztqkuz72Ga9tAasC9hyVIZQT8ys/hoeOQPQzoeA=;
 b=GtXcsgqf4MlZKskbMwoJEKB5l5Zt4//snkFtEC8YWGTRfGgXLJpG3HLZPwGTCdYw0m0dPuFO28qeM4GnQouIwZ6WgvYdqrTPCU/Lo85XdAu38zHDZMeVE3Er5SgpLCLpWf21LfWg8wEIJ77z3DYYK25eiqN9QZkyu0Dq+2IamBaGgzSHo7tBopSFHz59BV0hLtyNXu2MrgkcqFRkHisVPoauR2wdUIGL2tNeKODwZNFniZY8Q9W1bPVicH9QxQclyLlbBmXh9Zi/m70fN35n9eBh0pmnaXU2J+knXDgjIrwE4OpakDFaEBkWQd02+VREsIDQMTesxD0NMGf49EfLOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEO7Ztqkuz72Ga9tAasC9hyVIZQT8ys/hoeOQPQzoeA=;
 b=oWIRrUTz+DZIK+7zJ6AnWuUlOdSiEoPnE8/9NTqjiwhEZBqaA+/kjWQTiuAaU1rZfacieY/0R4zd2NsyL/V5nt7Xye6E0WnV52ctFu0rY24P4uWbu7mfWsFw5IEN15QSYmTrBUp72BzKPGQsPTXbvSseORCInFFUOUWPUZWHXMTjozNLgOfvKv8dk3AAJ8hLITrkRdU7vjGFJm0WbxRKoN4DIVdiJiywkvnCBFanBr8OhuOJKI3zCfbQvpr92Wu+Y7DFsNSp0/2HqkQcZ/1sbGAfB/4szXCxnFPz2VRTJLQeE4tiPZFCVHXIchim8gZ7o5XQ57PX29PQYOJqonoHsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.15; Sat, 30 May 2026 03:09:56 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:09:56 +0000
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
Subject: [PATCH v11 00/22] gpu: nova-core: firmware: Hopper/Blackwell support
Date: Fri, 29 May 2026 20:09:31 -0700
Message-ID: <20260530030953.740561-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0050.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: dfb184c8-a001-40c3-dc5e-08debdf8ecd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099006|6133799003|5023799004|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	MyEBWlRUTbUf+nEE6QvAt4BzmDPBruqcBpO3rRvlJsr7wNiKEu2MqdDLAiys+pOsIqgg7wI4XXn02Ca69OedahGUSKi5tHVaYeBxazei1O8nLJEL2w0FjAgBt9sLYdNmUPuMHt/gN3c1jg+RiUXm7t+a+718AxBMJTI6EuLGiULR3ttxyqUTfIJFv8uT1AH7VsWUon6W3Inh+1T5d3bJ3Y2WUDceXt7r8jme5UuL1iRJtYI2ADjBzWBO/+Sq8WElaNIYYExSu7VBrtwJ/hYhbmgjAz+7wqb3j03qHccYvQdIPdBAy/gYKigIEMbHg8ZaJPsgREObHmX4W4tb2tugzpnFAICGF0NftIZumvopPnBF1hyI9fNlt3fI8Ms/C40ZCArk9FhAWI4AHghd6B++oAFzgV7TZ9F2/UnW4bM25nzOeTUSrKcNNWA4syozdmD5Ht/3s1YZnVKsKpdLfy9O0OziR9BmlqKFjXDlP+IvoNDJF6/zSplTM/fFVe4aMMedu7kBfTEFmXMUCdiKvTUsunTPqve+uBLX/snu+mw3wjk+IgxxV99nbZmxSDTBW0a1yz2puQCUELMi/algjETo+QTqbqwDzTAL9S6fPrzKYJtb9kHl4om8nn+kC1FFKn5SGq6rU6WtbNHx4mNX/uA7f1hAgtobcuiIN/L8pEtg5PKyozneq+UpJnoMcfVKuHI2btJiDWua14hj9MzB5kwivg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099006)(6133799003)(5023799004)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JMc1oZUJRvZi2t2/PbmGpgqftk9/91hjVlA1uYNU3WxbpPpTeWRkm6J2SIkT?=
 =?us-ascii?Q?B62UZ1pmBSlTvDF/zzUQFbann5orY1+Ov1vNjSEGaYvHyGL7m33DpM5bmkQH?=
 =?us-ascii?Q?1Yr07P9Muo7+WAMz7kazcG4Il3jZpQ+TmDtFHAFwxTYic+KMvk7cU7NVgUJ2?=
 =?us-ascii?Q?N+hV8Y1b4Ic0aM0rJBZBy8yRQfm3tj/bRd/Uz9y2XlxfV0iVwftJyhMY4mG7?=
 =?us-ascii?Q?6JUS6hD0gEKgH3Qv5aaNfEd3o/0qY+XD7SnvQ+Fs4d41HIlMk9B/47e9px9C?=
 =?us-ascii?Q?Ndo42xPlhrVmnAoB6AX1lObMSRa9f6PDb8Y8xO2qvdVxX0JVFhzaFOgMEFo0?=
 =?us-ascii?Q?8BEOL13kV+6/4IrpAkTa07nmCNq4uJEKaYyKXuhrJbJF/SAYeya3VAQRk2+a?=
 =?us-ascii?Q?fOr5eoGpQxSUtC/5042NsLYCea21DWeAd5Ol0Lqe/sYxGh9thZQKgZGWDJaP?=
 =?us-ascii?Q?JeI3KBnRsv4J3aKARuQtWkHSvmoJc4Wvgoasxz8wxJAky1wjb6QlUOahXNK/?=
 =?us-ascii?Q?c237HHUNWX2hVMs4F7N1pRp5I/QYqHr2tuESRvdgUi+WOPfJOWETDck2ISLb?=
 =?us-ascii?Q?mQD3GrVp7fSJvIVlZ7e/K7LmUMYYcVyW6SEGF7IEg+HMvOog8GUPlUOryBML?=
 =?us-ascii?Q?TJxIa8108yAThuL8/uSzKyr8CLKin/6a/ZIDDBwHc/yg08sCDBTjy5MKwFzp?=
 =?us-ascii?Q?7DU4XThZRgeI3oYBTXuk8agDXs8zaMb6MyRHjs0YrDIStlSkcKpq/JdZhJJy?=
 =?us-ascii?Q?zv7hqgjbak+KEMQ+5/6SNS03ngn/cdmmzsjYWzf6x0c5VDBSUWENcJ45h+5L?=
 =?us-ascii?Q?s/syzyXYBTLUTaQQoc4BtqE/KgW0/kUbG3R6GAA7SqM4jz+zvwHEJLCYpWbJ?=
 =?us-ascii?Q?xZMeG2mXnmbXawE68hMDv5RebRDniMN2NDF8I69OXkwRZfhhmI3nTei5uAhg?=
 =?us-ascii?Q?2phOPnzCKxwyL5Gq9Y+xmg9XNo4eR1hm7QnbSToX4kdbV/lLQY8HMyjmHdFj?=
 =?us-ascii?Q?Bn7rVom64M3R7dTKnH07KVW8L73II5lCkVhTNIQ/e8Iob7Bmtc1xvH6l57wk?=
 =?us-ascii?Q?Z8RT7Yq8bbmaPXFCoWO+ktN8JCjpNqwB4FQ+Ffvvl1zLDUZ5J3X7bElkfp4b?=
 =?us-ascii?Q?kw0PKmMuIjRe5j6LQYsiTob1StVxqFEZTXdPd3IvbT1D21suE+q9qR8qX3XL?=
 =?us-ascii?Q?5B/88cytu7+iPEIGB85oBY/ed3i2oc/P07k0r4RYohxQmQbzlKADyxLjqyNo?=
 =?us-ascii?Q?E62LBHo5nyBbFxQBIqW/nHInsqD07zg5XvMN5NBWeIdaVqeRyD7jCwyaPldp?=
 =?us-ascii?Q?oxwgh2Gp2CUGKtP2HreE54IMEfx4UoFBG2lPd5ff93AixGnBT4IUZ7E7T0Ij?=
 =?us-ascii?Q?F59M4LZNQWuIm/OCjgL57NwYmgY6A+PEjqs37E0deBkY2BjZWUYDWDf85i6y?=
 =?us-ascii?Q?EgDUrv96FyTQ1yccJyc/nMpyt2afjPAqFZiHF25jLcmoYaVbqPMbIaeg5nZB?=
 =?us-ascii?Q?j989Q2BEWOU3o+BeE70nZa6ypuKEqLbLvj5G8KsTZKUUlMtuMtxP8ZqOmJXz?=
 =?us-ascii?Q?xKS+FjJHqKLoyN/PB1ijalGwoR2z47JrGv42GcTxBRfwh1uXUAxY3kJo14yY?=
 =?us-ascii?Q?THyBDozN+bHjQlT+4mSFBJH5B+kJma6DDwmRzK3vUCLeVcdg6/o0uSMcIK++?=
 =?us-ascii?Q?VXEK89ZROzVbrUWHYS+hgw6pVkqmTRNUQJkBaiGg1c4aYGZD0Cj3d00gO/70?=
 =?us-ascii?Q?tXPFcodpKQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb184c8-a001-40c3-dc5e-08debdf8ecd3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:09:55.7746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pwQ6lSw2Yu/k0h/DADbm3e2Sscwa5WPtwQ/0sonB42ob0rMIbRxCDODWqNtNFVUpcgPbW0CS8ryXTE2awrgx/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863

Changes in v11:

* Made the FSP messaging path sound. The FSP falcon's EMEM window is a
  stateful register pair (program an offset, then touch the data
  register), so modeling it as a stateless I/O region let aliasing
  accesses corrupt each other's offset with no unsafe at the call site.
  The EMEM accessors and the send/receive helpers now take &mut self, so
  the falcon handle is the exclusive token for an in-flight exchange,
  and the unsafe Io/IoCapable impls and their unreachable! bounds checks
  are gone. The accessors now program the EMEM offset once and stream
  through the data register using the falcon's auto-increment, matching
  Open RM, instead of re-programming the offset for every word.

* Rebased onto a current drm-rust-next that already carries the v10
  preparatory patches, which are dropped from the series.

* Top of the series: the v10 boot-integration patch is replaced by "gsp:
  enable FSP boot path" (Alexandre Courbot) and "add non-sec2 unload
  path" (Eliot Courtney). The Hopper/Blackwell boot path now lives in
  the GSP HAL (gsp/hal/gh100.rs) and returns a BootUnloadGuard.

* Reordered per review: hardware-differences patches first (DMA mask,
  PCI config mirror, PMU-reserved framebuffer, non-WPR heap, WPR2 heap,
  sysmem flush registers), then the FSP/FMC stack, then GSP lockdown
  release polling.

* Hardware-difference patches are now HAL methods instead of inline
  Architecture matches: the PMU-reserved framebuffer size (patch
  retitled from "calculate reserved FB heap size" to "compute
  PMU-reserved framebuffer size"), the non-WPR heap size (now u32 with a
  1 MiB default instead of Option<u32>, per v10 review, with the GB10x
  value in the GB100 HAL and the larger GB20x value in the GB202 HAL),
  and the PCI config mirror range. The larger WPR2 heap pulls its base
  size from the generated bindings, drops the custom constants that have
  no Open RM counterpart, and matches all architectures exhaustively.

* FSP firmware handling moved into firmware/fsp.rs: FspFirmware now
  holds parsed signatures (KBox<FmcSignatures>) instead of a raw ELF
  copy, extracted through a get_section closure (per v10 review).

* FSP secure-boot polling uses a per-chipset FSP HAL
  (fsp/hal/{gh100,gb202}.rs) reading the correct NV_THERM_I2CS register,
  instead of a free function in regs.rs.

* FSP Chain of Trust boot was redone around a new FmcBootArgs type, and
  the response headers are strongly typed (MctpHeader/NvdmHeader instead
  of bare u32), with the vendor ID from kernel::pci::Vendor.

* GB10x/GB20x sysmem flush: the HSHUB0/FBHUB0 register details moved
  from module doccomments onto the write_sysmem_flush_page_* methods.

* Commit message cleanups: dropped stale claims, shortened an
  over-length subject, and fixed trailer ordering.

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

Alexandre Courbot (1):
  gpu: nova-core: gsp: enable FSP boot path

Eliot Courtney (1):
  gpu: nova-core: add non-sec2 unload path

John Hubbard (20):
  gpu: nova-core: set DMA mask width based on GPU architecture
  gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
  gpu: nova-core: Blackwell: compute PMU-reserved framebuffer size
  gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
  gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
  gpu: nova-core: Blackwell: use correct sysmem flush registers
  gpu: nova-core: don't assume 64-bit firmware images
  gpu: nova-core: add support for 32-bit firmware images
  gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
  gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
  gpu: nova-core: Hopper/Blackwell: add FMC firmware image
  gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion
    waiting
  gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
  gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
  gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
  gpu: nova-core: add MCTP/NVDM protocol types for firmware
    communication
  gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
  gpu: nova-core: Hopper/Blackwell: add FspCotVersion type
  gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
  gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling

 drivers/gpu/nova-core/driver.rs               |  15 -
 drivers/gpu/nova-core/falcon.rs               |   1 +
 drivers/gpu/nova-core/falcon/fsp.rs           | 202 +++++++++++
 drivers/gpu/nova-core/fb.rs                   |   8 +-
 drivers/gpu/nova-core/fb/hal.rs               |  28 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs         |   5 +
 drivers/gpu/nova-core/fb/hal/ga102.rs         |   7 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs         | 102 ++++++
 drivers/gpu/nova-core/fb/hal/gb202.rs         |  86 +++++
 drivers/gpu/nova-core/fb/hal/gh100.rs         |  50 +++
 drivers/gpu/nova-core/fb/hal/tu102.rs         |   9 +
 drivers/gpu/nova-core/firmware.rs             | 176 +++++++--
 drivers/gpu/nova-core/firmware/fsp.rs         | 129 +++++++
 drivers/gpu/nova-core/firmware/gsp.rs         |   4 +-
 drivers/gpu/nova-core/fsp.rs                  | 334 ++++++++++++++++++
 drivers/gpu/nova-core/fsp/hal.rs              |  27 ++
 drivers/gpu/nova-core/fsp/hal/gb202.rs        |  23 ++
 drivers/gpu/nova-core/fsp/hal/gh100.rs        |  23 ++
 drivers/gpu/nova-core/gpu.rs                  |  34 +-
 drivers/gpu/nova-core/gpu/hal.rs              |  13 +-
 drivers/gpu/nova-core/gpu/hal/gh100.rs        |  18 +-
 drivers/gpu/nova-core/gpu/hal/tu102.rs        |  14 +
 drivers/gpu/nova-core/gsp.rs                  |   1 +
 drivers/gpu/nova-core/gsp/boot.rs             |   2 +-
 drivers/gpu/nova-core/gsp/commands.rs         |   8 +-
 drivers/gpu/nova-core/gsp/fw.rs               |  85 ++++-
 drivers/gpu/nova-core/gsp/fw/commands.rs      |  15 +-
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  83 +++++
 drivers/gpu/nova-core/gsp/hal/gh100.rs        | 166 ++++++++-
 drivers/gpu/nova-core/mctp.rs                 | 100 ++++++
 drivers/gpu/nova-core/nova_core.rs            |   2 +
 drivers/gpu/nova-core/regs.rs                 | 111 ++++++
 32 files changed, 1800 insertions(+), 81 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb202.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fsp/hal.rs
 create mode 100644 drivers/gpu/nova-core/fsp/hal/gb202.rs
 create mode 100644 drivers/gpu/nova-core/fsp/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/mctp.rs


base-commit: 2cfcf9dfb48e932d46c3fa9ae99f1607d1a80162
-- 
2.54.0

