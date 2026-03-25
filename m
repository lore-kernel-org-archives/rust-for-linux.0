Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125BB17BEBF;
	Wed, 25 Mar 2026 03:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410773; cv=fail; b=jrwUMA4kLLYlp1D5DmjjKgt7iVSDC/GYvA6J9m7Ovjmgmrbzb8PTrYYCrK5d1FUtDVAwzutq+okVGS5QMwoNtYlhF23xOgByRl3AgeR+2LptNxTBjq0FLX4vPwjug/mehWGEmeVmmKnnMKyaWV3vlIhRD9mPJuSfzGXpFHEYzwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410773; c=relaxed/simple;
	bh=bjm7VWtwedwS9BJzh/uv/+xHBrDMPHqv1cLx92q7OxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DqMcuhB2F7IhXdsvanLkQlqorS5ZRC3wJb6IK3nAwRE+6mvC0T8zS4mk1b9bP7C9Gk2yJBNhNYp0VvE0vDhbGwcMAxlEwlXmmOEEPWBP8ixrl8l4el474OBjgE/rum4Yzhma+wHltzj2Ge80tcEMAP1RsaQJOqB+T87QiaOUBFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o0lX2zNg; arc=fail smtp.client-ip=52.101.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o0lX2zNg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8zoi4VpfHJ13zndpWJ3YB34FhW6g63O1Vrn57LU2F+m5ScBRC64D0w+iOMwW0Xu9GDeggbJ+0BhpEZZKrwDNSnTfs7pci3Ir1x6lfoaQyaXziKgJWrAOibfL+ZOFGwTy3nIJ1UOR0DAN/dUTC6+Swu3QxqVkGUW9l5CnAmU5PbI379D6AYoN99ck1UfBSTBnJMais8FnuwP3Kvm/yxJ2T6tsPxDwcL82zI1xw509PKk9ciytOP3XFl4D4yF91hGDfELtCDYbTcudq+ZkR1U+OtC/GH+xYH6I30HyZdcgRYx8l8iW/e9utCURTtnjHfy13TzxLV0T4nEuMbPiDjdDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReJl5k+wDg+6o4R6yP18crbCeHU7CENO6KHRzqLBCBU=;
 b=QFRDXR28v/coCTq2TEajbtsHbgBOOj4J834AtNUOKXDR+FTAaLH+idjuTjXSzOgO3RW8G1nqx73OIK9NV+iUD+jaBApiOXArXWEaNqBhqD2mv8hvHYLitNbe3j7JLQadhCUziJabyMTOalYUbiVQ7NPeRauJVVE8sQa/UJbnjUZiqK9FFybV6UATnDwOVZ6gbNhWKgnwOetmviZmUtRJqHkydApT6uMbYNuvAxgkYhqGgL/4w8QKZfmGTOpGiWpDnKnUmDSh+7SJe802Hi+FG2zmkCcioNUpmyfoiJZ/86hnpywpUQDxlrg80fVTVrWXikaeg5DZW56GD1UD2jvB9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReJl5k+wDg+6o4R6yP18crbCeHU7CENO6KHRzqLBCBU=;
 b=o0lX2zNgZMdDsvUbrYRHdMTiQy9qHmkcAgnb0eZ1qp1IfcD2jDo5NmB1qiiyY6tqfWVADr6+mpw0/Re+s9Tl8vtIGlrdakvnkN3cLNKGgjzJ3izMnsFRdcpIxwm4ykUNRm7LuYYrZ0VBOJpTBQYS6dBZLdHlAdDuxOu+TsLxRb4kZC25wGQUbDcoVxe98FtpJDZAOWtJSDZvcXd0srwQs1h4BMz9EXsMxL5YP0ae4g1jlManK7Wm8hQ2jHZvMPnPU6UowIA5uK+tyOerbC/m9V5k7uX7HClucuJEWIXZrb6RzXa7jGZkRYfcP+8CQF6Xw5nax/Ga5YA38rZZavEtSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB7441.namprd12.prod.outlook.com (2603:10b6:806:2b9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:52:45 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:52:44 +0000
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
Subject: [PATCH v8 00/31] gpu: nova-core: firmware: Hopper/Blackwell support
Date: Tue, 24 Mar 2026 20:52:11 -0700
Message-ID: <20260325035242.368661-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:254::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 63eb9112-43e4-4c48-0f17-08de8a21f8da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	zFmSDl6qWEvl6FEvJoHDZwoUNOZbIZ+GcOK7Uzy7yYWOtXNUfITHkTW8TppK1lOfRjF0tzHOrZGgLxM2j7eV6jtFrNqODhDOHkRx5RngjukFNrq95yjuFfaNrKvGZisTCVoJLNKfppSQr4OG/VcqHCIo5Oe4aDMqhlA7ouVXaUwfD346sNH4YdvGDxGmQAc9/IBmwZZY9MqIx5kaQrNBSKqJv5fBG691tmn/ndDOIOvxkp51xa9RaoGInGyLWm4HngiN2dkyPWXZ8+AlmvUyhLa5MKerj6r9EeyskXagqk+9a3XQLyJ2u2J+DbZfqUxgMgQ5Nt33FKzcJhHptAlchSkRilvDr9Q/I8Ia5G0/vX8vAfZE9ZtARmT59KCYStzfmlEytqqU09V1JuO2yUhxYGePYecoA4cJZTeW84dwIfWAV7yEkuuvbcogsR2mj2VA1cVHdHNGTavgD5Das/0bSWlRNbnE26PoEkOSTqDWcPt32v+20UgCeA/u7VKQERJ4oo5mIG/33V3WyZf2g8es7E4k5XWjUED2HIyYvGV7uYXPNPZ8O4eWIJeQvZJDyUTkmr2zJLHsYWAr1QV3Si26pk1Apfe2Yi8SHH86MqBej9ggICgDMQ8z1cRr5hWrX960ZXsRZXiCSKpWt+fwJjNlJZlakMlcGTyPonpGsEU9ZDgz0adJL3e6OahHKggYJ85kIPqVC5gAYR1O6MxKVHbTUcTm9lV/Pw1SV7vJTausken+uPsa8aGYxhG18FUMn1Oq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Oqk7sVx9QTmAIdmrY9+CclSsTDfN2PHXAqX9+Y4XVTeIBulOiPxps/vG1zWC?=
 =?us-ascii?Q?L8FnzW9xuir9rzuzHvYUM/7AALznMCLZZ3UF97ZUtmcplwa3fwGAUmBz8zee?=
 =?us-ascii?Q?YKfEWfXJLSKXm4VbvHK3yUS9Q5jpaMl79jNiJW3+dzSjCTf0URs+smzBmRJ3?=
 =?us-ascii?Q?MDqVwTBDBjxsxGGSjuhZk1HiYjhlMTsNEVb8kRtaPfHrQwt2yzuyGPU49gh8?=
 =?us-ascii?Q?AhBhidKQRuV6UxPqFB8qb5ZOOM7z4+soCVNCieB1F+gdIVUxK1Jl0A+kHraX?=
 =?us-ascii?Q?qq9x97eTBjI8LNePWbZ21xTau6tIUm9krF0KFAbzOpUKtQqA6Cw1lLvnvirs?=
 =?us-ascii?Q?KMeoal/rC0T6OCZFdhu/M2TxvJ2OGSwK2ns/U843f0YaxKX0TbHdyd/pX6QL?=
 =?us-ascii?Q?OhRb5OPT+XL21nzqjj9MQFKvmc/EOL/ZrgAqMG1fe7geu96KEPafMPofYpuh?=
 =?us-ascii?Q?rXm4Til05etoQogtTc7Cs093zTpr9z4BsRRqs+/R4iNx7VyRfPcA0gZw/bNS?=
 =?us-ascii?Q?a72Tyd5lF5f4N1quHSN3lAhmGEois7WKaIBWWLaSMmWomqesisgOC0+fq/07?=
 =?us-ascii?Q?FSR+heJ+oS+xys1hbOstYyL8BRVqS3890RjuLdV2upEDhCA4iH5Rf0ziUsPr?=
 =?us-ascii?Q?oQr4FQHCbpDb1BEQNOkJLGDsFP+eggCZPyQx1OEaXfgrVEXr+WjLzb+BlYEH?=
 =?us-ascii?Q?zneEv1lWjh8mJZzX0RZ0ZNM53oiXFb2LSpWly2f6px1AEmwz5FYZT993DLNY?=
 =?us-ascii?Q?w0V4vjvLNhkiheQjFJpDRCY7PsG1ZLudCxFLvZEp2fQ/EHiEa7/MQMpS522Q?=
 =?us-ascii?Q?SCO8KPtCjO/QV0mSq2MPNoeojO4/PNRj1oYHmLUg79LowbW1MpHZXsLIlLWo?=
 =?us-ascii?Q?/0vUkEFIGdZNg7loQBhRAPcfrgjsD9Lcf3co+O5m8hMB1bx20QceNJz27+Lo?=
 =?us-ascii?Q?LOn68RzbOYG/JJqhB/eoFfahXK0wN+Z1vy++G1JJ1dkvJ4uFhtBgzMowAp2q?=
 =?us-ascii?Q?9BaQXFzessMSkOOG1Q9X+iM4f2bJQgun0JXDCrnePruTQHLhsaZr4gtueOca?=
 =?us-ascii?Q?aUco1HwdsiFwgci040yxuCqvH8XWD5TWN5jYsVXxU0ngqBLQh1lqbuIIE5G6?=
 =?us-ascii?Q?ntRKJKNXcvjK5T4pQ+z+6mJGIP5/52pGnh53XSN1pA1L1ZN+44+o4NNtMgp8?=
 =?us-ascii?Q?829myFDR4XwBwinCjar7XPgHZA6+0eH7WATk4GjmFHdPdkGbM0Qjvg6yIhAt?=
 =?us-ascii?Q?JrwkHoYpx7dgeSRVI8hEc/CNZdhCSYPrKcKHe8lelt9DawnT/3Y40Ppqz5lU?=
 =?us-ascii?Q?LGtKJEUGj5OavRdGn1C4npfNk+5ygnP2X1mOB3qJ9L4jSAujyF8d1vB1J0mn?=
 =?us-ascii?Q?Td9sp3TDMtNg+pcoBen2lOy2Y+Q0KyiaMjVa8H72EM6MG7G5xGsZfIVc+Ke3?=
 =?us-ascii?Q?hZgmv0gQAGYfE2H5IlJsmxITkMD2Z14q6nMQGk2J/imj2f3+GQ6yXLoWgHAT?=
 =?us-ascii?Q?rSxXQM3h7+mKxcnmHJt1I8sEqwbLEjwtSMyzsti2s92qFKqFX1dm1+TA1sXW?=
 =?us-ascii?Q?dmLmfX2chOANWAt4kNohZ2+wZDp0+AMIipRoqMsCHhjUPe3X7VV+MebXVPKz?=
 =?us-ascii?Q?RKLicNtOVYsqaszyXCBiv0GPdmlax/ZARmNL4KmNTr75qQJe3L+ingCvx94/?=
 =?us-ascii?Q?2nmrNwYCCQ9jV8vqNTVrT+12390TOYJIWkni47a7cYxra8laxjW5sCIN2ejZ?=
 =?us-ascii?Q?3WhReR6pRg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63eb9112-43e4-4c48-0f17-08de8a21f8da
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:52:44.8503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGpQRlj2Yk2hiOpEQoNUpn8XdGQTWCzlRc4eNStCyswKrPUsuka+e5doMlAOi+W0c3xQ5A9DmOoDuhqaD+C6qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7441

This is based on today's drm-rust-next. A git branch is here:

    https://github.com/johnhubbard/linux/tree/nova-core-blackwell-v8

It's been re-tested on Turing and Blackwell:

    NovaCore 0000:e1:00.0: GPU name: NVIDIA GeForce GTX 1650
    NovaCore 0000:01:00.0: GPU name: NVIDIA RTX PRO 6000 Blackwell Max-Q
    Workstation Edition

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
 drivers/gpu/nova-core/firmware/booter.rs |  30 ++
 drivers/gpu/nova-core/firmware/fsp.rs    |  47 ++
 drivers/gpu/nova-core/firmware/gsp.rs    | 128 ++----
 drivers/gpu/nova-core/fsp.rs             | 523 +++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs             |  78 +++-
 drivers/gpu/nova-core/gpu/hal.rs         |  42 ++
 drivers/gpu/nova-core/gsp/boot.rs        | 292 ++++++++++---
 drivers/gpu/nova-core/gsp/commands.rs    |   8 +-
 drivers/gpu/nova-core/gsp/fw.rs          |  81 +++-
 drivers/gpu/nova-core/gsp/fw/commands.rs |  20 +-
 drivers/gpu/nova-core/mctp.rs            | 119 ++++++
 drivers/gpu/nova-core/nova_core.rs       |   2 +
 drivers/gpu/nova-core/regs.rs            |  96 +++++
 rust/kernel/ptr.rs                       |  24 ++
 25 files changed, 1966 insertions(+), 238 deletions(-)
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

