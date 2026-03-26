Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CA7F4F1;
	Thu, 26 Mar 2026 01:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489156; cv=fail; b=HYU73166Zdd8UCc4ZZbk/I7UyjkGNez3Lo6+Zu4aqg28v0hCdq8aDb3aYPco+COhIcjhiX1DAGoGkLCDez8jfZbDE5i4Nqd5jMhvuJbj0K9iMO73FCKKGjJ4Sv6zrb06hy9qteBgbtxAZ6nSsKBqDD+qFaaeqxh4K9cPd9S4GMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489156; c=relaxed/simple;
	bh=YTLxjsFuXMDZgoJtX8VqZgNgMZnqFY6dUVlZeuoobYE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DHkx7ZXZMb0Y38dcNvswqopvRwA4vxpHlklYDYPynnDvGfR9DQdBGNzUjjptDUm7GyWwzcfPjj8yY8AdtM83IpadZji00tPporGEA4ipvGDzKjspO+ZxPA0unsILYD3YXZHcjZfDCQC+o+Z8YGiG2bNebcpcPSFyTGHzU6dSCbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eiuJYak0; arc=fail smtp.client-ip=40.93.198.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eiuJYak0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXHWYxJTujEVF4b1mitj4nnnZpl2u7Deho0YhqI1YskFU5jLBbR4HrQPfv5RYpS2CvFHLUXz/elW+WX/kLx36xIKkQlVHKNMbo3GdHTAjTUBNHKbeZJnWClctP7d1YF93KJE+tdVt6irOjUm/tRf+O3ZzKGdI91SsJJS7zi5m29cpn7vPHQY3EyyBtK6QTj4vA/MOJkD+jnRLcFP/CbEFBL8u57R9GFO8p/7xL1wkOn5gjdcxdCck92Z+y2o2lh55rYUW91Umgut8T/oYXl/BMEoUUTdr1DBeUC3pZXCW5WKJ12MHFeF68IaCLmDg6fSToFtC8WQCt2fXdXMBXVPAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjjFiyLSmCCLzLVOzgtCq0UeWMcfIyeTaP1oQij+vdM=;
 b=Tg0HPNj2vvz5h7IHJrcA5pcw78viXztPAiTPZCa1cP6bCXXwsm9R9zyVyVf0bZg5AZUMX8LDdxGicbQWZO3nfse75VWAAaTtF+x0HPxSfr64Be/mesZtbGbxJZ7OHEl/cOS+HJfM2fHQ4zhZt4QJY2VbRXdvoL7g5xkVpVg8CC/XmuxrXTImHxNRI2htuEKNAvBfVVn2YJdbqQxTeVpqY7jZ//9H2gaSW2T7erH0L2FwtWW299Ackz1lAkmyCj0BRltzA98fPdJYAPi+JoU74pOu4/RmRGMPk4LK1veH47TVziwDpr+0J+DBFNp6BIoOXZqMa/xa5OYuCPD3ntBbyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjjFiyLSmCCLzLVOzgtCq0UeWMcfIyeTaP1oQij+vdM=;
 b=eiuJYak03Mx8Vkhqc4q6tfXGQPb8OsGQn+pGgNJhlEDn63spNPIaVvckOrcveld/s+4Jc9w8/RMn6++EhW20clTpq0C11KLbCuPKSFiSyQA2rGOEBnh5z8ZAMn2Wy60IG7gNlwUBiYJQI6i/rIFhtfYm2i6EPxRQzv4QkIgqGuLPR55DX4RzK+oMIgYV1Yy7whualFRVCN51pOSpFbW9JmhQIOlfJyo1dJQs9qnfWoKR+7KhlbGRMG7QS7OBJmG5LSqZ49ULwxbJbDz5xMN7LIv0y++Fxkes0ts7Kfpy/g6Bo2D2SBVgcI7A7qer/BRaCavWteSOd8r8ouLVLWArpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ5PPFF6E64BC2C.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Thu, 26 Mar
 2026 01:39:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:05 +0000
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
Subject: [PATCH v9 00/31] gpu: nova-core: firmware: Hopper/Blackwell support
Date: Wed, 25 Mar 2026 18:38:31 -0700
Message-ID: <20260326013902.588242-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ5PPFF6E64BC2C:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb7bb3b-232d-4dd3-6162-08de8ad87734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RpUOLVEhdff3QtFN7q80ra6Mk3g0y5LMRSVZSp2aUSNNLvshvn5dqV3yhZXgeSLTNyZI57VA1MXmnUV/tdmiw9+GddmcJaZEsexHjmH0QHzReZhmdPF7VZFVqO4F4fUi7w9enkfSXAcc9jxhR1pKkkYy2K6J60ssd9A4HcM7YBdY5v+hSqvuby2LGd7oQihL05ws5RMX7sH7LKu2I8OcUX/xxkCVd6mFg6eDtlzmrWOlcuB9u5KJjJx/0rO73ggS6v73s9VNlNirVhluWif84Yk56cdBSEk4sUBFEPfk/fZKJFgb2EAVb4zm/BIdNM8wO0oW6QtzxjTphfgw3BwoP5naU0sPNtXWnbAdFGrZGIVMwIyR4tOf2CQCMhfl1YYx094+/KQ4X9jNah+NW/Cco89Ky6+FRwlQHAbmkF+1BtpmqSdK/qwuIRqesb8J3irs41Ffb9BUpWhZpd3uRZ11Rkus2YYYx8IhxYaN+jgWu05WrDjI2AT43pLZDN3gSoIBe/uFZ1gHlkyLwS6c2W8OQNDs5nzCrfy2KWr/wE3srb8BwmsOLUv9J/1c6Sss+/P1X1WuQ4tGvES5fqNIqpvE+DGjn9uLGkygEpMvwGIOzf0XE7GF60sB4mEEmU8GfEXYVG+8+jxnKmDzO1lphQD3fn1PkqltAvND3F5ibhMirxxHmaUkue4yAJMQc+dattCVxXEGF5g/gdqw4Xe6G+Px3XEbq2G6H9DX55YLNnKK/G+3kVyirwNe/k2b0C5/lPX5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KFaDHEcwFcNM+NcFvoyUMhjX0/X/kPpMNplyi1d6W3VhbXWcTUmm0v6l70hM?=
 =?us-ascii?Q?pGt4t6yAk9mzh3ss9fINLMpVJLWWUZWVPAfFADdQkybib0W30e9yiMZ9K8k4?=
 =?us-ascii?Q?2orqK48y+8oruIuXPl5aZUb7YpaoBH+wzmfjtk4mrw0xkE5ivoE6fWAVV+TY?=
 =?us-ascii?Q?C/2SpyYCxEVDlKeso5dTfpcHQF8+pPPgxTI29MRI5tlMyDvq9dxHIJp4TOJQ?=
 =?us-ascii?Q?AUg7eU3d2Y/k3HsOO38JhLF2A/5dXHMg3xIjVOj7ylr1woq3GqHnPHgR07nv?=
 =?us-ascii?Q?rRn8f0RusNUTYq/0Pnxk9PQoSP6zo0Gq1lg0OPEyjhBUo61jCQHuAaMX60qe?=
 =?us-ascii?Q?GcDVrDobitoUZ6Y8OWy8vh1VTXsCsOGvrWbXYgDUiegvB44bnncbrFeiKVIs?=
 =?us-ascii?Q?AnCEQbqtzAw37+sF7S8MouoAhSN/k6bvNUMt51eX9/PEwke+Rr4+65J7n8Hz?=
 =?us-ascii?Q?dgKV3lJ2JFDNU/x4odK81ZrHewtTPxQnJJkthG6WG+/XWI6hxB5jDNm2UhCZ?=
 =?us-ascii?Q?5v9IYnTaZwwwgljAmmKu/cQ7ijjZaIf7fjb1U0IS4qEDW9ZXL20azYP4a7l+?=
 =?us-ascii?Q?Ln+PgXnorImxO7V03lz8Cw7lJUA41EqCP4i+c6ccnIa9Uk8/ZV2EabUzuz9y?=
 =?us-ascii?Q?bpqJmI+eEjIIhsD2fNfyXfctaFAidlXQgRv3dXeH8xV75Kbu/ZwLAORUZlxt?=
 =?us-ascii?Q?kndxfLzOP6PxWQngj/OaJlYF6EYM8N+hiXK9Rgmrg/J/L9itkFGj/iAmMeIg?=
 =?us-ascii?Q?YX5nHyRo3nTdhoTKAmdORqjNdHuUtW0xFh2iwaC9yhX50aRjVC8iZ1zSvFsa?=
 =?us-ascii?Q?end2js3b7isHcUCFO+BwZmnYQ6DWVA5ZAh83vM5UK8hDUmo+xSCjlShd5/a+?=
 =?us-ascii?Q?48Ywtkb2HHSIB1ub9GVu5QH3oTmqazVw9CY82VqOUKoh9hcsb8crN+OxDNOE?=
 =?us-ascii?Q?tO++nOWT5fuVhaD8xs/5feytbzwZIrriSOgAciUDq+DIAYQ7CHUDyfXO4olU?=
 =?us-ascii?Q?Yj4lwr3Sx+qb6RSwS1OtKAoVWhgs8L/xg/5qH8tLFziNefQABhOGEJpLTghR?=
 =?us-ascii?Q?Ijgi/YZK6EK3ITlHdlH5pDyw324hyMvCzgJVt01K+vTSZSlQJ6CDhw7QAqLz?=
 =?us-ascii?Q?eLaVqSJ5Wlsuy546cbqXKmbgMevjGVA/5NS7ynwTKmva7MOnH0b/61YZhriy?=
 =?us-ascii?Q?WPU54MJ9lpEO/Dj0YsLbZBVIHRb49yed7gIQcmQMm2VlJ4bIY8KmxuDvv76Z?=
 =?us-ascii?Q?7+7QD6n/m8j93m/WF8Ieqw6KfvEXQNQeQVRAAZtEVVyv+lX2l8/P2ehMSwDV?=
 =?us-ascii?Q?XVNisTXF2RWCOPC9NL8jUqtrT4s4dFVBvzzDDhiSUCmK8TJbGM1aqHrNzQOQ?=
 =?us-ascii?Q?LTF2+/t/arVGqf0cuvAfSAq6KkcnzFbkiHC6vMkVlZRMYuCCBiRa/B4topJp?=
 =?us-ascii?Q?bGwSlycSTQCkeSAzM1TQUnMHUkJKZrPI+zVgKQc19Key8bQeXBq5r4Du/bFK?=
 =?us-ascii?Q?bHt9NnVtICCNfjTCqctP4fusVUV2flXbbZ9ZjABA71qYCp6LdDHF2WyyrYaD?=
 =?us-ascii?Q?C+9u9DEZc11IZIpO9+Mauz42NZ9MUFz9C25vjuGKylaBtnHof5k0dtZpUnKR?=
 =?us-ascii?Q?P6Aif/Wmad85q9MNW0r7wWrQC6X8mAmWh4zqyO+YwzP8KaQvIdTCizAx09wy?=
 =?us-ascii?Q?0WT8vYvgfFXU7yvoYtR9UxnpdvxKVPdQ9BMkm14MdP4SdzffHaqzGBVYGbJn?=
 =?us-ascii?Q?swrMU7sIvg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb7bb3b-232d-4dd3-6162-08de8ad87734
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:05.2385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mj1r5ats6fX+eeeqqvNqSSaPkMVIBUNKHmdymKiSqw6GXn69ww6l3ISxom7eMn9MaSbL0lreBT5oZl+uuKbxTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6E64BC2C

This is based on today's drm-rust-next. A git branch is here:

    https://github.com/johnhubbard/linux/tree/nova-core-blackwell-v9

It's been re-tested on Turing and Blackwell:

    NovaCore 0000:e1:00.0: GPU name: NVIDIA GeForce GTX 1650
    NovaCore 0000:01:00.0: GPU name: NVIDIA RTX PRO 6000 Blackwell Max-Q
    Workstation Edition

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

John Hubbard (31):
  gpu: nova-core: Hopper/Blackwell: basic GPU identification
  gpu: nova-core: factor .fwsignature* selection into a new
    find_gsp_sigs_section()
  gpu: nova-core: use GPU Architecture to simplify HAL selections
  gpu: nova-core: add Copy/Clone to Spec and Revision, add chipset()
    accessor
  gpu: nova-core: set DMA mask width based on GPU architecture
  gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting
  gpu: nova-core: move firmware image parsing code to firmware.rs
  gpu: nova-core: factor out an elf_str() function
  gpu: nova-core: don't assume 64-bit firmware images
  gpu: nova-core: add support for 32-bit firmware images
  gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
  gpu: nova-core: Hopper/Blackwell: add FMC firmware image, in support
    of FSP
  gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
  gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
  gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
  rust: ptr: add const_align_up()
  gpu: nova-core: Hopper/Blackwell: calculate reserved FB heap size
  gpu: nova-core: add MCTP/NVDM protocol types for firmware
    communication
  gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion
    waiting
  gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
  gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
  gpu: nova-core: Hopper/Blackwell: add FspCotVersion type
  gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
  gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
  gpu: nova-core: Blackwell: use correct sysmem flush registers
  gpu: nova-core: make WPR heap sizing fallible
  gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
  gpu: nova-core: refactor SEC2 booter loading into
    BooterFirmware::run()
  gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
  gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
  gpu: nova-core: Hopper/Blackwell: integrate FSP boot path into boot()

 drivers/gpu/nova-core/driver.rs          |  24 +-
 drivers/gpu/nova-core/falcon.rs          |   1 +
 drivers/gpu/nova-core/falcon/fsp.rs      | 220 ++++++++++
 drivers/gpu/nova-core/falcon/hal.rs      |  21 +-
 drivers/gpu/nova-core/fb.rs              |  26 +-
 drivers/gpu/nova-core/fb/hal.rs          |  36 +-
 drivers/gpu/nova-core/fb/hal/ga102.rs    |   2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs    |  75 ++++
 drivers/gpu/nova-core/fb/hal/gb202.rs    |  62 +++
 drivers/gpu/nova-core/fb/hal/gh100.rs    |  38 ++
 drivers/gpu/nova-core/firmware.rs        | 204 +++++++++
 drivers/gpu/nova-core/firmware/booter.rs |  30 ++
 drivers/gpu/nova-core/firmware/fsp.rs    |  44 ++
 drivers/gpu/nova-core/firmware/gsp.rs    | 126 ++----
 drivers/gpu/nova-core/fsp.rs             | 530 +++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs             |  87 +++-
 drivers/gpu/nova-core/gpu/hal.rs         |  41 ++
 drivers/gpu/nova-core/gsp/boot.rs        | 292 ++++++++++---
 drivers/gpu/nova-core/gsp/commands.rs    |   8 +-
 drivers/gpu/nova-core/gsp/fw.rs          |  85 +++-
 drivers/gpu/nova-core/gsp/fw/commands.rs |  22 +-
 drivers/gpu/nova-core/mctp.rs            | 119 +++++
 drivers/gpu/nova-core/nova_core.rs       |   2 +
 drivers/gpu/nova-core/regs.rs            |  96 ++++
 rust/kernel/ptr.rs                       |  24 +
 25 files changed, 1976 insertions(+), 239 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb202.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fsp.rs
 create mode 100644 drivers/gpu/nova-core/gpu/hal.rs
 create mode 100644 drivers/gpu/nova-core/mctp.rs


base-commit: dff8302ca1d0e773c90dbeeb05e759f995c95482
-- 
2.53.0

