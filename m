Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012011.outbound.protection.outlook.com [40.93.195.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803B114A62B;
	Fri,  6 Feb 2026 04:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351690; cv=fail; b=uH9fkfJHolNzaw0eoPb9ebBXh7R5ckNoNJR1dDC2Ro9el9Zi+jszalqE0KB9UBtetsA2avbo96maWFt3S1h2eaUmFprkWE/qkZsqDdZt+jZQT/psGWsMLNO50vATZpIX2mJsumvl9JH3LAEOFS3EARxZcKy0gNozbkAKbVqSSLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351690; c=relaxed/simple;
	bh=rnGyhLQ71mupX/Soul9+rEtIzkRd+/yyiyBdJmilHJE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gUE/2ISLe3WKY2azmUrhBcHhLYlFiKQuRdvIxr06sAu5eLcplQ6+4yZEPEwmq2pJ/WZwM4MmyuqlggfBnHKSB1YC4fTC+Ommi9vIc8wCIT5e5E2WhOtzUuAyQYSmOi8k0b7sYfo7sO/vrTaO+SGhGSeOY5tUN7CG4quzN29WK2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E/ThK78y; arc=fail smtp.client-ip=40.93.195.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E/ThK78y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YEVCvNF1aZq51Wn3G5zkkdRmIPIm/d0fCCfhi3+PDeom+tYbmvCWA0+pZxk5aMw9BVztyCAU5ogQgwLOPKVme/+V6QhwzxEECuej2hzy+Sy2DxjIe50ERvovc/aPCE/5L0T10fWQ+8RTE7x/Fl9lyRFVjNlY97XjSh1xzgS4x91c1JCkw8CR745qoMdMMJUeA0WdxW/x1dDOBJ1VvRLbQxmzeWtB68lzL2WwJtupcYKi8JKlzKTsuDCK6pxvDAl+suVg5viH95Er+y3oE2Wv9NeXwq5t29gYl9NiUJDRGeeU8931hHRnHfrwLd9ipd2JL6p+pMl/KXwzsOYbAuqj7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoiwtJOP9/tQCH+7raO4NWA2M6yi05zldj4eyiP2/W8=;
 b=MnI0GotYJCyCYzm/fqZ3CeR4UKbacl0wB9M9b5E4yD66blRb4dJ6774L+KlujxAxGiymqfwMfWvz+R2w/5Qgf4pywdAp3E5GddXbg2CAEE5h7gjST8SK8WOMkBczMXE3hDhQgT7eZqjP0EDUq8FR8t2UZmZhXMEnKm/S5lQ4uC5fLOGhOwLfqJk9qoB5xpYGlFleIvmv/M77YM8N87K6Eh6sT9Cwco4HlSp1gtJ2WJNIIjwZAWCI9KzhsqIgINMj/LD2Bx7jsa6+79grcmmYnURgBhQlVAf1ik0pIFsNMEX3wT7XWBOz1zC1QAZVja6hp/k30DtD1Vn83z8VB1SmXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoiwtJOP9/tQCH+7raO4NWA2M6yi05zldj4eyiP2/W8=;
 b=E/ThK78yAiViEru7m8kYnXaZpQNl25hID15PgmLGwxNPLmZuV/gR34giWIgCg8xhK1b/gJvLugdNoPBTm3kQb6aJ8X8Zvpn6FzBa7QNo4axv8avOaqVRBB6ze+dkj0kdzmcLvT8UITNoErYCy/atWaJFzoIitl35UxUX84C4L0xYWdXRMcsUbjLTR63Mi6k18y43+kj7aC70nkDzCWzL4E6LrHvSWCd9qiASSfZn4shzxiWGE1jhmQP3M8pfTCcGSgpNn3wCZOarcVICmHte3KwrSMB/mEKpqb9vBDNHrrbEWB/gn099aEbBR44pjAXoygLfycC139qXy8kkOE3cqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 04:21:26 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:26 +0000
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
Subject: [PATCH v3 00/30] gpu: nova-core: firmware: Hopper/Blackwell support
Date: Thu,  5 Feb 2026 20:20:53 -0800
Message-ID: <20260206042123.303281-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0098.namprd05.prod.outlook.com
 (2603:10b6:a03:334::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 295859d5-3b10-4f89-2882-08de65373195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HV3fdJyGVuLM+KF9GTue59oZAkOnCfX23v7R9iDvDtSx+NKCvsbpa0qHCFTI?=
 =?us-ascii?Q?uLL8KG8bJoQLSUQ1u9PN10MFaFKB2Hwt4D8toHE7B6RvEkX1h7DatpdOK9RH?=
 =?us-ascii?Q?Sxfdnglpx5doR7y/QCrTABDr/TyzduN6mZl+5MB3AMNNDN0frBjAs5bhJKHw?=
 =?us-ascii?Q?4xwcQi3oYDZt13ZCK+CLunVsc/8pEj+dttE9e4bOmsoD7KZdR31BMpZXOdEx?=
 =?us-ascii?Q?2DAG1nL5U5D8CmH3q7D3LPK8BHzlNiGS0sWU1e45xKncWfzGsP3NhyV/vPdV?=
 =?us-ascii?Q?G5n7ZEauov7MHbfyFZkT1vNaNPKDJeYLk1vmD/jxw4fMW7Xh4Jsr61Q0Kel1?=
 =?us-ascii?Q?Q5WaBbKY1W/zdhCEjrLHwpJMOVd/sRpgmL+z/MyP6hHBWJVllv1OOnGtp1yu?=
 =?us-ascii?Q?f3EKjOumnIO1XZYJHmFeF4K6ZOxUafWq3uas31s0uI5NEYIl4/o5B0/zm+2K?=
 =?us-ascii?Q?MmNRF3vaGWbvkd0OblQeCPayNO7qU+n3DIZczsohdUtxtfBm4awcoJW9IV1j?=
 =?us-ascii?Q?EKAuaTBV6lEAQ6h9vpeVbDryH+nWzBhOujCaUYbhVCsKddGPtJRXUn7NA7yN?=
 =?us-ascii?Q?G6Q3o+r3+hxSRD0pVHzVWyXeCIxmE7X70NC3Zff4UrH+nJVdlrNrFCAnUraz?=
 =?us-ascii?Q?7K7VQdDqawKeCTEOIQRkFrP8AtYGftiDyvO8iZMsjoX2htJnu9hxyfIJtADo?=
 =?us-ascii?Q?YWYkzjCwBy2by5UyN7xTwYVn790cC1ntPzi4CdQdRjNUsPCUUVewb4c49pim?=
 =?us-ascii?Q?nA4DZa6bIFdQSBTXzy1ZV3B5z6uJw1r39ePlZoJogqyUbb/qh/EM0pdjtlI2?=
 =?us-ascii?Q?UUSZsWqf95OrpX78RVoqbH8BDphUpqfSaTWef1vw1jmAd3HwyjwJceurZFfw?=
 =?us-ascii?Q?zkxxZbVW1ea8ruPLdo9nBfcshtGfrsYAEavi/XwYCpLlN40wesSb3oVsoZCK?=
 =?us-ascii?Q?RVCda6JbRNvRqIdQ5wM1gzhXtaRUSGdzBBRJfm4pA7qFlBJ42bGrZjm5EcR1?=
 =?us-ascii?Q?8QfuQvJbDoODZOaKiCETsktf3w9u2diR5Kj2XUXiMFVW9CtFQU9ZXJW3R/X0?=
 =?us-ascii?Q?5Zbu2uk8+unWVKppCXthYRjxz6+qImCN5PwICwd2Qv1O8efpoCU+Ls+RCi2G?=
 =?us-ascii?Q?7LIdXmGDN0Hpe9UPLctBkhOTNxTOo4QwvP5eGM4jo2AMntOMDlHFZQ9haWEY?=
 =?us-ascii?Q?+kNPuzMs9KXPJgzqfN/vYTrKXsZFKotBJcivaEpQNim2tMq7aQ7gYA810CEi?=
 =?us-ascii?Q?KvMIlYg601rUanBEMHq7o0qrOVQ+RmdXwg/OtYLOnY1bRO+P3Cp5Yz00/KCk?=
 =?us-ascii?Q?314R6YHlbSPlTixjjkxYJ3qFah2ukGoBLyfOREQsVwOOEpKK3a705vGP2NCF?=
 =?us-ascii?Q?H/f0ARZ7n1swCHPH+QGQJyUb8xbXs8DLEslwN/Hh4u2dpKcp0ssLy6Zuc2od?=
 =?us-ascii?Q?bq9VKWmIaBg+SGBfHrN9mJ37LPrkD1v+KArJCq5FILJ1+T5ed/0zWh9opKsV?=
 =?us-ascii?Q?xe5WLq5iNzP5tArcvR5CYSJlHCsnKOAoFclV78dDIjufOiVn9KTi62YMFApZ?=
 =?us-ascii?Q?DIthM8rWhETuFdx6nBV++5D3fYYWAzlAtxFezmtp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FCIIBTO4TfSw+YfWN9paoEfbChjfzZe1W3ozJGX4OHBh4C7eBZrUQxEFJ4OD?=
 =?us-ascii?Q?gBsF0i5EmrsObOQVh8pyPtnasuJUD66uO81kcdv/ljcVVL0AUwnL86/By8kT?=
 =?us-ascii?Q?Z0f6SC5FizAQnIgqvZoCr1C3Zq3j7o0WDwv0De3dT3/ekj/G2JWK5+0Zz+vs?=
 =?us-ascii?Q?oirBZ7q/NvpaWMdP9VI5V9OQIuQX4g3D1qirn8ZbBfjjQTPvRfbsTVUbMHYM?=
 =?us-ascii?Q?0+58Tc6zm6GlWyQ/XLH/W9a2xOk84HXJAlf4+FN5PcZo7coklosc4jOXnFWt?=
 =?us-ascii?Q?5fVFQ86VKzoNQNFP3tiAHcEpze1yw9DSCWIXJY8qMOAu8OXa/ciFXpQ4PZX8?=
 =?us-ascii?Q?f4Bc568xMeJoRc3RDYT1RAdq06thAYB21NUe6FpWNRE+rBHA3nNFybtm2vuz?=
 =?us-ascii?Q?ab/vDnXhUPsoswBzmQdLPOoHI9IIserECOtmLh+7bUNU2n6BB8uXZb7PnxPn?=
 =?us-ascii?Q?7oHbQfPpM90URBnRsJTMR8PH3wliknJxu1RbdSoCIB1uHZ951pfwJmbH1L4f?=
 =?us-ascii?Q?xYZVoDXymL9L8Lpa9GkBUJ9TlfYKwKSiUkVZ02PcxOxPN/2YR9rCx/lQ5N6a?=
 =?us-ascii?Q?UnuOcAANW0BPvVkwQhadWfqU+P8BdgqWfxrpazrb1z83aUnJ2590Cs8b1TS0?=
 =?us-ascii?Q?Yf8RJoMJbWFDyWupVeg/skrvayXmhUNyjNGPRdUyHraCPX6TzdiNHwp4iNow?=
 =?us-ascii?Q?tvae6RC/btAIUOzxxX3wFNfEDrbbvO/JwuIUHzdxL9WoS+FFJmWeBV30+gkx?=
 =?us-ascii?Q?2n6Xo7sTM+e+qhxayCWpHNWP3mCx4m4BF1Jz5O1NtqNvWlPW92BR1Jt/EAHY?=
 =?us-ascii?Q?bJcX+pKcVrGSPX0BZN9sdUxpH8gJ0DcX2TS1zHKoc9eDNnD7gVqMrqpgf4MB?=
 =?us-ascii?Q?iYerZraFR45w0opzMXdtUWHYgP8cVbFm4Gep8anhJorLn8uZieiB7p4aTYCX?=
 =?us-ascii?Q?gM7Nnw2JtGyd/a83q4ZfTpXcGyr97QPZ4xA6zS3ZeqoxL8P86t27Vj7RPNoa?=
 =?us-ascii?Q?x22luE/EdHAV4gHuXflxBA6cI0AvpggVnaBpjox+spSEMjKmmX+UdovK2AlX?=
 =?us-ascii?Q?faczOFqqrU/H2Ddc9cuTlP87488EQlZkLx7zLBtF/zHJYmBGJYFYo9Gm27xz?=
 =?us-ascii?Q?AEChMAm5tm15fYgEQ6R5nd7eL2Ew/UvgkivZefl98Fr4eTfxCTIBfGfiGxpX?=
 =?us-ascii?Q?YTYqeF9zOQRz6Y6Fy/+iRAikCI/Mcd5NDONwruntuva4gY9v2Hb/DpNo1hcv?=
 =?us-ascii?Q?5kZGtXjqPX+60YSeqxyL6CMBl59F6Wu+mQEI8FUBSE4JRUsZByqaxhN6k2x1?=
 =?us-ascii?Q?CkGpB3FZaNQILKbl3GOyZJYEUQhdgVYxLJDOPgBEN9WUTe7UyyVkHDWmDMQU?=
 =?us-ascii?Q?463ZHAjrl6rAepbgNjHPtCvpZ19KfavpOEBIRMSmgmchIwmzlo7j73Ntc5FT?=
 =?us-ascii?Q?FsZSu0CDXj//NCC81qdAoieim7rG5QSFD+O9MDtqy48T8P4f8xnK7NpKjeka?=
 =?us-ascii?Q?IC1FN19XbcbuyONBFhIwFwL7mxiM7v0m1j+Ui6lniLgegRTuPfFrnA23Z1A9?=
 =?us-ascii?Q?O383z0Kwe5mH+6UQI/9fiVkCGAvs4yJtISvq1Khv5DoGWsD4Fi0JVuzUlrEc?=
 =?us-ascii?Q?4WzBNCSIyJ7QbRjnmN6o+XkqtrUek7dL5KZxH6IcaQuXW/ZqOzA7RexPVDie?=
 =?us-ascii?Q?1imrvSYQS1f4aa6Qz2PB6XIREzhnNPQptE/0bAlNaE1AxeSsxrdBmS+GXtcz?=
 =?us-ascii?Q?d6Ii/5nu1Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 295859d5-3b10-4f89-2882-08de65373195
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:26.4697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebEcTvB4sLDbdA/YB0ZwSRCN8u0QTES+/c7J7I3ogDyiKuejJWR2a27NUJYqUjSkTqsZWdtKsB8VajO0auvgIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209

Hi,

This is based on today's (Feb 5, 2026) linux-next, and re-tested on
Ampere (GA104) and Blackwell (GB202) RTX GPUs here, and it looks nice.

Since posting v2, I learned that there are some IOMMU page faults
happening when IOMMU is enabled, but only for the Blackwell GPU--Ampere
doesn't have the issue. And the Blackwell GPU firmware/GSP still boots
up in this case, so it's not fatal, but something is not quite set up
yet. I'm troubleshooting these now.

Data center GPUs remain as TODO items: GA100 needs some additional code,
Hopper/GH100 might work but is not yet tested, and I haven't even
thought about Blackwell data center GPUs.

So even though many patches say Hopper/Blackwell, there may be some
test-and-fix work remaining there.

Changes in v3:

* Rebased onto linux-next (20260205), which includes several
  rust-for-linux updates that affected nova-core.

* Removed redundant .as_ref() from dev_*!() macro call sites, since the
  dev_printk!() macro now calls .as_ref() internally (Gary Guo's
  "remove redundant .as_ref() for dev_* print" series).

* Added a `use kernel::io::Io` import in regs.rs, needed after the
  upstream separation of generic I/O helpers from the MMIO
  implementation.

Changes in v2:

v2 is here:
    https://lore.kernel.org/20260131005604.454172-1-jhubbard@nvidia.com

* GA100 (an Ampere chip whose firmware boot steps are closer to Turing,
  than to other Amperes) returns ENOTSUPP for now because it is *known*
  to not work yet.

* FSP: use the new Chipset::fsp_cot_version() method instead of a
  hardcoded constant. This fixes a known wrongness on GH100.

* Changed to a HAL approach to handle the slightly different non-WPR
  heap sizes, for Hopper vs. Blackwell.

* Return Option instead of Result from get_gsp_sigs_section() since
  the failure case is simply "not found".

* Return DmaMask directly from dma_mask() instead of returning a bit
  count.

* Change fmc_full from DmaObject to KVec<u8> since it's only used for
  CPU-side signature extraction and is never submitted to hardware
  (only fmc_image is). This eliminates the need for unsafe code and
  the associated SAFETY comment entirely.

* Use as_bytes_mut() instead of unsafe core::slice::from_raw_parts_mut()
  for copying FMC signature data (hash, public_key, signature arrays).

* Refactor wait_for_gsp_lockdown_release() to use early return with ?
  instead of chained .inspect_err().map().and_then() pattern.

* Removed many dev_dbg! statements.

* Use IEC binary prefix "MiB" instead of "MB" for memory size output.
  Also improved display of small sizes (e.g., "24 KiB" instead of
  "0 MB") and fixed a typo ("suprising" -> "surprising").

* Reordered the "skip GFW boot waiting" commit to appear earlier in the
  series.

* Series has been reduced from 31 to 30 patches, because the "needs
  large reserved mem" patch was absorbed into the non-WPR heap size
  patch.

John Hubbard (30):
  gpu: nova-core: print FB sizes, along with ranges
  gpu: nova-core: add FbRange.len() and use it in boot.rs
  gpu: nova-core: Hopper/Blackwell: basic GPU identification
  gpu: nova-core: factor .fwsignature* selection into a new
    get_gsp_sigs_section()
  gpu: nova-core: use GPU Architecture to simplify HAL selections
  gpu: nova-core: apply the one "use" item per line policy to
    commands.rs
  gpu: nova-core: set DMA mask width based on GPU architecture
  gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting
  gpu: nova-core: move firmware image parsing code to firmware.rs
  gpu: nova-core: factor out a section_name_eq() function
  gpu: nova-core: don't assume 64-bit firmware images
  gpu: nova-core: add support for 32-bit firmware images
  gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
  gpu: nova-core: Hopper/Blackwell: add FMC firmware image, in support
    of FSP
  gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
  gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
  gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
  gpu: nova-core: Hopper/Blackwell: calculate reserved FB heap size
  gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion
    waiting
  gpu: nova-core: Hopper/Blackwell: add FSP message structures
  gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
  gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
  gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
  gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
  gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
  gpu: nova-core: refactor SEC2 booter loading into run_booter() helper
  gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
  gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot path
  gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
  gpu: nova-core: clarify the GPU firmware boot steps

 drivers/gpu/nova-core/driver.rs          |  35 +-
 drivers/gpu/nova-core/falcon.rs          |   1 +
 drivers/gpu/nova-core/falcon/fsp.rs      | 163 +++++++
 drivers/gpu/nova-core/falcon/hal.rs      |  20 +-
 drivers/gpu/nova-core/fb.rs              | 118 ++++-
 drivers/gpu/nova-core/fb/hal.rs          |  30 +-
 drivers/gpu/nova-core/fb/hal/ga102.rs    |   2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs    |  37 ++
 drivers/gpu/nova-core/fb/hal/gh100.rs    |  37 ++
 drivers/gpu/nova-core/firmware.rs        | 186 ++++++++
 drivers/gpu/nova-core/firmware/fsp.rs    |  47 ++
 drivers/gpu/nova-core/firmware/gsp.rs    | 138 ++----
 drivers/gpu/nova-core/fsp.rs             | 580 +++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs             |  87 +++-
 drivers/gpu/nova-core/gsp/boot.rs        | 337 ++++++++++---
 drivers/gpu/nova-core/gsp/commands.rs    |   8 +-
 drivers/gpu/nova-core/gsp/fw.rs          |  61 ++-
 drivers/gpu/nova-core/gsp/fw/commands.rs |  32 +-
 drivers/gpu/nova-core/nova_core.rs       |   1 +
 drivers/gpu/nova-core/num.rs             |  10 +
 drivers/gpu/nova-core/regs.rs            |  57 +++
 21 files changed, 1722 insertions(+), 265 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fsp.rs


base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
-- 
2.53.0

