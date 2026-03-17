Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011050.outbound.protection.outlook.com [40.107.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3013E51F7;
	Tue, 17 Mar 2026 22:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788047; cv=fail; b=bQ4/i6CQomCMgLIbgw3hQpAGqA37t7D4ktrDkrPi7EJ3+3caSLb0cQsGXJ4BEYvRIeww0oixB7NIMp/LexXpEohhAITUzBu+z5xVe7yAFUzZj5/9CDQCVv7bHf7AGNrvVaAzkoueOH/7fb3FgxMcEJgmWEm6l1Th4zHRmMM9vbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788047; c=relaxed/simple;
	bh=A0dZaq4KaELwJLiaf8N9tn53G0wVVPtHJIYrpZ3+214=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EVDtWYuCpU0MMQ1rAnTMf7D/a9A3Fb2WaDVcoaEtkXesSQEKKvAndZ1jrQfTW0kzftd2UIoRsZT5vNLA4To9TxfB/EKkp4zI0c9zen4Vxz0jgq0j04oB9SLocSvDZuxPfcyVWYLlaTAM7DnFgp6VZ8pEWyMmO9K+iKRfrkfdumQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NfAySE3x; arc=fail smtp.client-ip=40.107.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NfAySE3x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9Wbehba3cV2o7i3EKS8bfXYUyEBaqGnIdpYZdV7a9gHBDI4RawvmUYpKlV8LmIbwAbtSb1jgWk/WftMwlP3fRJkMPXhVDMNpRP1AELmaYYgBFqG0CpTouQt1m0k4aq2bPKqvxBSsORckZYTqq6wXnJdipl9+kLpVN5ysyrlLP8e+Uz3ahQFwecn5okILOt4fyAOIKW9wJnmwSGeou3dR7o9xBUSiZmPzt0WMZc947jH+kRKhmbtEdFn8VVcPeo661OaODZ+0knHWvZjuiie/WohB/ktI7uj5hZ5O8/XMviAilSXg3zIUJjy/mW2kvo0lNAK1cML/VidVU+KP8pX5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2abxit447JnBPnS55rx7Eq5jaXfrzOdFZjpZm/BH404=;
 b=bo124pvofefijf5PagaRgw+fXwdek+KHhz1xOyUtuxZNbWnetmDarKuRb6RXgXkkThsDAKNzIN2E7zPDxLwqGj3Z5PvcaHGeLXpfqFwtvVXctYClKhYs5eI8KRozrO36m3x1/NrJcduiYR8+akmK0WSehFy6dRFYfa0zJpbKHc0BfbC19TyRZ+wf4UJQELuPIbuCWszbG7H9nTtLpzfzEwJyHNyZB0NHgdGcsbjO1QQM/lxiNJqnj6VsVxEWtgeQ8G9AZUKW80uXppO28K2/JvKESCw6R12Ht4fkJm/Cd//BsaBC3BZjBuL079Mmb/B5HcytncAKt6OKLD2uvA/spg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2abxit447JnBPnS55rx7Eq5jaXfrzOdFZjpZm/BH404=;
 b=NfAySE3xA4yNS6uRrLRtuD48sz5F7VFJn/WYoSW/L9rVb/fA5NawOg7xVcpyz0MrLIPmNXPjNVYlmbYKMH/XPDoGjkd5L1/lgPmZHCEJfcvVWkUZJmWQ3yj24/Bjb6M74yj1/uEtAvBajhp8nSdbuKnJumKQGQuJ4t7oK9K5lNBjDWSpBaye9u6B6Yn1bx710JYsjNGKb+bmu2uAT5yQAoehGk5+/lMqhIcP1EJgcyzxKeOetORs0yO0fS+M8Ms9ZDetXCTwVbaKEdnGQhP5oNx8zWdQW2YJAshv/3STHzUSPHcrW9DdCQI4zogrUhpjzRuTK0xsTnwqB3xN++U1qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:53:58 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:53:57 +0000
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
Subject: [PATCH v7 00/31] gpu: nova-core: firmware: Hopper/Blackwell support
Date: Tue, 17 Mar 2026 15:53:24 -0700
Message-ID: <20260317225355.549853-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 43248d3f-7cac-4160-ae22-08de847812a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+3eaZQEbXj/DSSQJJUi6drdHsIwC8lS80/ct4+iFaUFEwbWCXyNlYIQ7fhZuV2U0WnfoTzjqr548dbcdSG/wx7mhQnZwcf9FBITsLKrNrwa700ELnneMUWb5/ZVujq4W2XSubJ0fVfrIFnIzcAwJjSg0GdJbHP+oxihlhU3yBAZVP102FHP+LYdrPU3wQjQA0DPkcxDOTp36+pNT8f1EXY7Vq5wxEUuy8S06Uj0U6I9QolfElf0vhseIrss1Is97IXUwIbEbL7eEyith4DEuxGCgl4DpLWRliHfqn8h85gndX3tTo+xbw7c4HUbKTYdFjEYvYXYEWrihQ2hW93CKsbhja5xr7vK9sodMozGZFiU+IL3AzIt9J4jXMly1OisnvVtPc1CXttRwZ+ZvWn7lwEeHOdAGiRFS1GnF0mrtKPKtnrtEQB09ChWoBomQ0oEJfP8jFC8dXGTYg3Yc9kfInQOYYxawc3XCsV5/yKwctgCglHeU0SwAfACQ1wOBK2EkGa8sHwtXmgwPJfbd4GqEmSS5TxEWhx6QUO5TMB/bn2ZC5psRuEqmoY845wSeZPK3uYzoCuaOuvaW4XTXDk8kH30FApQ/g1+v9eNyiLORvuX93rpoKE+Z/R1LmYWd7TdmdMSFIQrzuqj6nURy/1T5UkHYeSaDOdQPL7tqOs+Yoj1QTXv4WXw1NQppG3tM/mWDvY9TYmmUopembUev95v1WYxIb+mo0Db28kGKpzi1Hp9Tpd6wHqkaIHAzia3gaen5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f2WPuz+rlHKr/VheRDtYodR/WfuyGJbYfVbNKNKuqynUamqs0zAZUntJtvcB?=
 =?us-ascii?Q?whbCuMTrae9Wa6XSRZU8UHqKkE9Ca9P04u/IfVLzkWxZDTl0uRtbIWmK5vxc?=
 =?us-ascii?Q?KaPWh58aYJtgHWPrcykM6Rgpy5axgrtG31mSC44H0/SpcwH3O0wGeKUL9kDt?=
 =?us-ascii?Q?OWMM2bfM3Uu6AorYtwj5D+rQGWgjjOuMEqzw4C0yR7fvV+OhltIvFetRizG0?=
 =?us-ascii?Q?VeHGd0om8Z3iWa9AdSfHE5K88LSIF/BZh8wX9vXLo15JB9zGWzRh90YLVyXc?=
 =?us-ascii?Q?gplag3NQ9oRpyAHoCJfrjmlc0GC+ScD2iqD07YOLzCM10RKZUheL93fP7Rw/?=
 =?us-ascii?Q?Jqq7pQYsCmu8DdXuQP0OlgpWgRwuIpxaH5V8L6S+DwhymAQqdF6XmoeSiqgx?=
 =?us-ascii?Q?z7w9pfl8VvaJDBDEz7GTIoX3+UHsfJpqMRyw7E0wl4Ix1LocXFtWYpMmiYva?=
 =?us-ascii?Q?iv1R/4e0g6be+/BvW4rmzDbrK9Z4FYsJNRgh4RoWxR3oYmq0naZQ87spG6q8?=
 =?us-ascii?Q?OW4J8NnFjekC+t5KDYmrJbfiMBuM0u+nHkQkkl7VnlyNL1740C7A+YItaL5V?=
 =?us-ascii?Q?zb8TJKaYJbFYfBLLeXfmaAUCEvxdzv704rXrqD9vMfrj0VCPC2aB7ZvjFnIC?=
 =?us-ascii?Q?9B2D0hBchghs+3urfIJ/s3fl4HdzwsL0x+nZ47yHpF4UbohUHjewWtmrRf45?=
 =?us-ascii?Q?fAoNrF+tj5DsxL/jjohy0mBQHOYq78A/2kV62B+psMR2tkOvhk3RwErxVHRI?=
 =?us-ascii?Q?C9vOmXnJQT5ZIUsx/BoxPFGADAoOb4c8+UxizFzJlcTk5JpBaOWT3h23jTrF?=
 =?us-ascii?Q?HoCL77vBE1xg4InK5urQeP29MVEXk+xKmz+8Pbt1Gmt7YmtPmRE/aRazMQns?=
 =?us-ascii?Q?mMhQzOUdghyTc0Q5beM87AIlckynVkqoEf7rGnSYn7D0op50bAUSHeBZ4Jxq?=
 =?us-ascii?Q?qu+BfHq2lz2SUb5PrKbQoWv2qjjdjXyopVvZpzhKueKcTjJUfiwtyKYeiK0m?=
 =?us-ascii?Q?je1azqDlCNQc20UQQL5RP71PT3LJ/KhpSZlO9060AE7nzhxLkdWqZnz4wfJG?=
 =?us-ascii?Q?NtJSfvLn8McOPAL8jfXifEJAoARZl2AscvaEaSGfqy7KlbiBI1eGWLvRXsaU?=
 =?us-ascii?Q?0KYHe8CZgMzabopmjcLYKuLkLKuhPj4ClZ1FOxbfS4N2x6SYqwcFX85Tjcbu?=
 =?us-ascii?Q?JUi054Nqtnf2N9EFNL8yrCUKmr3PRG3O/RJUlty5hifKPxg0H+027J9DOjsO?=
 =?us-ascii?Q?XrcC39wQo5oCEEKEKm2LsuAxyy9yOXAuP79+1tI8N7o2nf/G9CbsxL+O1ZcT?=
 =?us-ascii?Q?VcPZj+6BF2O8RP1Si4k5xF1agGHeHkwr+OHGHjkQsbH/994R2Nk9NdTOgsoW?=
 =?us-ascii?Q?1uu6g6/f0WV975iQHV74Fy5w9lyqsu4sib7k+Bl5GPp7oBzFntx1enelbghU?=
 =?us-ascii?Q?8fLO5ZVZ+a1uLbN5YSY9O9c6aTNrUGYsg4X82SmTW7+e2Uk9wbPJImsIYQnP?=
 =?us-ascii?Q?ZRpI1fnwHq+0NfFv/lqfBXyTyKunjljPy7sUOVPK0LRHCF5dyR4NlzzBTif+?=
 =?us-ascii?Q?qtWSZcCCTaPUZlVsEt+xBeI6KEkW3/DxXs1PSaFcK1tnj2lJXJlhlvKeMT2L?=
 =?us-ascii?Q?R9ZQtw8eDHZj2150d3wp8ERTO8iqOmjJz7d9rb97Q/NixanyTus4+BGqE6HH?=
 =?us-ascii?Q?EpBncwf7RO/w+wab0K4GiVaCraO2Rew4SsnhQqsxQfJLDYD10b3qT/avMLd7?=
 =?us-ascii?Q?owg4Npqm3A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43248d3f-7cac-4160-ae22-08de847812a5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:53:57.8876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZLoLqFaPrI23XMa5gTYaX5o/eiAumpxqv/rzddhBCX10k7+FXs7wmi/hrzVI/f4AvCH4/Nk8pCek8RNC0MrIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

This is based on today's drm-rust-next, which has Alex's register!()
macro series. A git branch is here:

    https://github.com/johnhubbard/linux/tree/nova-core-blackwell-v7

It's been re-tested on Turing, Ampere and Blackwell:

    NovaCore 0000:e1:00.0: GPU name: NVIDIA GeForce GTX 1650
    NovaCore 0000:e1:00.0: GPU name: NVIDIA RTX A4000
    NovaCore 0000:01:00.0: GPU name: NVIDIA RTX PRO 6000 Blackwell Max-Q
    Workstation Edition

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
  gpu: nova-core: move GPU init into Gpu::new()
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

 drivers/gpu/nova-core/driver.rs          |  28 +-
 drivers/gpu/nova-core/falcon.rs          |   1 +
 drivers/gpu/nova-core/falcon/fsp.rs      | 220 ++++++++++
 drivers/gpu/nova-core/falcon/hal.rs      |  20 +-
 drivers/gpu/nova-core/fb.rs              |  26 +-
 drivers/gpu/nova-core/fb/hal.rs          |  38 +-
 drivers/gpu/nova-core/fb/hal/ga102.rs    |   2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs    |  75 ++++
 drivers/gpu/nova-core/fb/hal/gb202.rs    |  62 +++
 drivers/gpu/nova-core/fb/hal/gh100.rs    |  38 ++
 drivers/gpu/nova-core/firmware.rs        | 204 +++++++++
 drivers/gpu/nova-core/firmware/booter.rs |  35 +-
 drivers/gpu/nova-core/firmware/fsp.rs    |  47 ++
 drivers/gpu/nova-core/firmware/gsp.rs    | 128 ++----
 drivers/gpu/nova-core/fsp.rs             | 527 +++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs             |  86 +++-
 drivers/gpu/nova-core/gpu/hal.rs         |  54 +++
 drivers/gpu/nova-core/gsp/boot.rs        | 298 ++++++++++---
 drivers/gpu/nova-core/gsp/commands.rs    |   8 +-
 drivers/gpu/nova-core/gsp/fw.rs          |  83 +++-
 drivers/gpu/nova-core/gsp/fw/commands.rs |  20 +-
 drivers/gpu/nova-core/mctp.rs            | 119 +++++
 drivers/gpu/nova-core/nova_core.rs       |   2 +
 drivers/gpu/nova-core/regs.rs            |  96 +++++
 rust/kernel/ptr.rs                       |  24 ++
 25 files changed, 2001 insertions(+), 240 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb202.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fsp.rs
 create mode 100644 drivers/gpu/nova-core/gpu/hal.rs
 create mode 100644 drivers/gpu/nova-core/mctp.rs


base-commit: d19ab42867ae7c68be84ed957d95712b7934773f
-- 
2.53.0

