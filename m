Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C3C2E282B;
	Tue, 10 Feb 2026 02:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691575; cv=fail; b=ka4bzU9ahANOWaD205f7+axSgPW0i3IAEYJFnRiLglf/FHx3cvKwPg7CrQSgWO17UsgEYb6WoUjPfv6h+t0D6/Eye4xGO9h2vECd1QlhHZKg3Bpq/t+bVMIimr+i0hjTYmDCtwxrzaPbPsk9XN55PumfMtYq7wdIDDxlpLvNY84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691575; c=relaxed/simple;
	bh=LTUW1ym/qJobvo5sbuGjAe8gvOkGHnUUtG8p2e1QJuA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DlBHHGgh2DEkN4yP+GDOha66XtP4PNRUw1r1ZcdegehmPgP+DsKyI1GA88oSGznCe0Nb6r3wmCrmctfLbehNImGpKw0gbHZFAQIbicQnb/CIaH51QaoFRSBvt245Xc+eX3SLt0sdB1jBuX3xSw6oF8NQUQAbfRQNXkGfB11m5I0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mMypPlcM; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mMypPlcM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dc7VAo+RzIMjFEHrW3GkjnAmK5hD3I4EaZTOMbdRniQsf9b40+W1BsdRml7k+Kh+Xu5MNR5hfBYgMYyneT4EI8v7h8G/u4tT9/6r6Wq1+bjcGCF1QQgDg7z/RIjZKdDpPDuViMOlGBvL0BVatnvxixeLKdwggIYuHA2f/uA7qcbWUEX6n7KKh4XNy0uQ+uAYun87D6UkrcsQ17yucpJ9utr16cjIbDq/BVXs7XufbK7Q3fIyceqtWIEvFCX5YIUxiwm+fOhfHvJxrb3zN5Av3/4Z/rCQRYq9f2qUYtKB07SRA7lmutLakYbtBvffOFtSIG1mgfBrwqmR5SaCy0kHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGgun6SYZ9dMQpo/NdcRJXgYAPWTiWPVcNgeB3t4Eeg=;
 b=hyEz23sSYhqcsvXZsKnTRaHYglDoIkEECwpAR3moAiXr4rtfU4Sz6sKhwlsoYQQgE8for0JREm72BCHYP2esaE7K+Jq5NSRO3jBcwoqz5yoD3AsswBf208n2JOxssyl1AIXkw4ELHX9nIgRQmTVqfhDPknkCQxIoUIXU4XPI/KxK9ZH2JRkCtAFSuZfyinJoEeH/XZw79yibcGUgpAEWnft2eXOVwNA9RU9kB+kLdD2Ei+F5R1H4/WpojLYfeBFqFyEsc+9VhhODsh0paXUV8o6RZowS5/H84NUrjQxxNH2jcXXP+Iz1Lt6Ao82GiiqWa0uUVkvJRc/BQQQnBuaLbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGgun6SYZ9dMQpo/NdcRJXgYAPWTiWPVcNgeB3t4Eeg=;
 b=mMypPlcMJVCGA049YKbMt8akGZv+2hJHQDU8rvYvU/gXDEBDPwqlRz16dkr+gaesc5VypDxMllQM0vR0AcxGatKz0ndwSNwtdg3KGNgeiKyEf0qqXgsyJQfwr1ktB4HTnLtcqf9hbIhrJOPpfWaluDTRC2ACXMQAp8eYb7+A+avxFhqm7Lgy5Mr504hAVsRwj9pqjWjn6Djvpj6RT/KcDLVUdcK1s8FnCy3lKmYaB7gmm3ltqHvPnurpfRNUB9jxB0fhIZZXhumGHj4LhMKTASUtWBxWyDDLV//rY2QWZQg5vjlP6yCUylcx0PLe/i/mocc/YI1zcEGq0F0dEERW4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH0PR12MB8797.namprd12.prod.outlook.com (2603:10b6:510:28d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:46:03 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:03 +0000
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
Subject: [PATCH v4 00/33] gpu: nova-core: firmware: Hopper/Blackwell support
Date: Mon,  9 Feb 2026 18:45:27 -0800
Message-ID: <20260210024601.593248-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0181.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::6) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH0PR12MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d0b109d-6718-44fd-0fdd-08de684e87fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2XvUlIWsSWQO21TK7hi+goWm7u1t/V9gAtiCRE4TgSES4y6SWG0+p4MeTOzR?=
 =?us-ascii?Q?AxvhGiE9i2m+kP8fWolYuDPt9RLEiVenkdlqoH7zQAe8Qy/UvwKEmmsyyFcs?=
 =?us-ascii?Q?AAVyKRbrqSGhXRc3GTCqTY3zezgMJARRMlwJce5ymW2BtkLK3N/rpEMhYM4Y?=
 =?us-ascii?Q?HqFeJEhR//7TMyh1Eha+2BFHBJEcTqtj+2nqauDJzDlhdCqcd5TIQA1+doSm?=
 =?us-ascii?Q?XsW8RWGrrZXovWfea2GGRA1DRnq7MsdvWKyObGztto0OoVcOQtl3NkCgvWaB?=
 =?us-ascii?Q?FSCTkzKr5/GgPXKekJ1JaAZQpLjZGA++9PiTKIpIfT/k87megjvH6rb9gsCw?=
 =?us-ascii?Q?SsSeJLCioqPS18P9k5UixyWBFSbO/XtwtCPI96CGNzSfnpVjkR2o4tGT5eFh?=
 =?us-ascii?Q?vHkmuBcAmT2v9f1d8zcOYJTbgrGY6tmHSfoWDpCaNDyO/wAnuBO5G44MtyFR?=
 =?us-ascii?Q?CFhqlBeDJjFYu9gwquXXnbCAuqWoOsOaqxdEiflq4A3J9Mcva83AikiuB2Nt?=
 =?us-ascii?Q?BcifeJauC5YNXb3DF2RNG8bQZ/clXTHWrc8l0CJiShdCTinVSxcP4dOU0twT?=
 =?us-ascii?Q?JuVZyAtPip/wenz4fpfHA4CeSFBY9Z5+nihdAx4gSkvN+EbBuKkbo7EJNcRK?=
 =?us-ascii?Q?iZQfumjZw4rJF6b6nhyKyT8ULTvKFl+HXqtla+0UayRTYw7HSW3Ugp4HLV9G?=
 =?us-ascii?Q?Lde8V/uvcyCSB5y4czNtLUD7/bqoOCcg7NNYmzRnrx3vzSfQQiLRXi9k/5W8?=
 =?us-ascii?Q?tyexZHZvOKS+pu8640HGOB+3bUq5AeAbmDBjBAI7WtN8WrRUlq+kwOxEgbyt?=
 =?us-ascii?Q?EgL+Qeoy0cSyY9BqnUAEUdhyOeTI2iuXUqaze5PapbMdWPUJUQZPG9zxEwLg?=
 =?us-ascii?Q?Jnkhr04UQAdRlToIaozjZl0cVnsKkqSvHLRvAtgKZsqe1ZV+lpiQ4dxEihDu?=
 =?us-ascii?Q?RlYdfiJN+pB5y83eppTmv/V5jSZ1kFxvNdLcl2gsSRv9uSS1ZRrTGNbvCojH?=
 =?us-ascii?Q?GmD5IX0oiNsCBDTV7Il/5KOEU0nZGee4WcET08l8RXUpst5Zz7n7W2sac0er?=
 =?us-ascii?Q?Vh2o3Bp2J2IEtsqwaTenANCNEGE2Ixhu0oiFNfQGvyIZvW5G0+C6GY1KB7zc?=
 =?us-ascii?Q?QmikRxeqIxHQ6tjcixRKuBXtTsu3cUFtMMO33WTTNELIvMsQw0vuP4vdH2Rn?=
 =?us-ascii?Q?Rzy3plcLhIloyJBNFH6jIJh6Y+eqbUELOxGYy8ueS2fsUWZtMBTanDSMwtnU?=
 =?us-ascii?Q?fCvE2YeKP1tH6RGeRMdcBurEtb2Tk2J3j8mKcLFzDwVev0BphriTIr4y+SEV?=
 =?us-ascii?Q?oMVXdcDz91N1c0DaINwOb5tyi6MAS8l3+UOSngh/aF52IgNWzFSYvViM9pYp?=
 =?us-ascii?Q?qZi3nv9I4dzICCfGxsUTrl4Nev7k9XMZcI+clMR3HjlXLGYnC1tAxzMfdnV8?=
 =?us-ascii?Q?80du46TeWizw2y1n3YyZ7jFQnel054iEAGku/lzLee01K1mVdpCnl09fSONe?=
 =?us-ascii?Q?efvXUooDxHesYpvnxzUbD+OCYxpWp9fJkCoVkVTOPbP/D8gEQQkvr+3HPQLh?=
 =?us-ascii?Q?MMz3uNXKnEMzEqioIUI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4LffUmFjKhQADknUCd0Td5yj38iZz+MfaVRWTXGsrvSo2ab6jgZ4o4rE6jAY?=
 =?us-ascii?Q?BFK1Wv8sx8PSXpUDH1fCA68pbxvoDXkldqZiunk1p9WwL7weP7WAHRUq9+5I?=
 =?us-ascii?Q?LeHtOCeeqgqrbIrtAo12C6VjLABqmCw3MB4kdnDImfdcTemC8YtBQ+z3Ox1w?=
 =?us-ascii?Q?uJlq7If9UUe3DedNIGQ7SmRPAQMQEGtOdcmiEmIl2Fzmntd1lFtLyWDY+qDu?=
 =?us-ascii?Q?WaQXAd9nz3v4Tb3a+06qiTctjBmaIhjd3uf/8LIIHpapWmZg8vyxW4CZ5djQ?=
 =?us-ascii?Q?LusWIDpgKSNVdOBWMJXaMofGb6G2u8UKW+H0xT6KQcAU4e9iJ/XhqbPstb7Z?=
 =?us-ascii?Q?H9NEW0hu09AExvPl4NpAAQHB5XN24jG9bBRf2TrFgpKZ2aYL9DVx1BLaHASg?=
 =?us-ascii?Q?PKrd5FNgudKH55Q3SY5pXDW/UEUcnfEhDmyX5zxue251kienoLububxmpkhG?=
 =?us-ascii?Q?XrOz+YSgl1rm5PqKwIrCggUjTFT0KjnFEC3Jq2vdFydT6XPkl2rMr8fkYIbt?=
 =?us-ascii?Q?O3x6KwdDCKTmH9Oen18tR5NA48KvaZOitZqSQO9TV5LeTvHdr6/CGhh1zkwl?=
 =?us-ascii?Q?4DjoZQLJ8Y2HHUx6PePyZMI2pmk2R9OvP8BZk/qDvJTxzwAaNEsjcbitW/ih?=
 =?us-ascii?Q?c+Bv5WJWrqlZJgbB0ZMQF9phDK3OH86Ohm2Zdo74a5Vg1LPRLe6KNIs7/ZEf?=
 =?us-ascii?Q?sS6LOHJNJ1LNFcX4jJsSz0tGDHEC/c4c3tt1mtU4XnLbR6IE/OvP2ugyp9uC?=
 =?us-ascii?Q?Pn3bIrTg+86vEBTrin3sSOsZ8peFIZ3HT4WuvUOg8dG5Drffmx9QaAHE2dC5?=
 =?us-ascii?Q?fE8MfyWojwEUOiB/kN1co0dbT1jJY8sLlKW0AGHjsOFG4XB+HMaws1wPAoyw?=
 =?us-ascii?Q?IcAfjldUnSB98g2Lfvm0v776CXnNXHv3RHMyD3/RZaak3CBU4la37QREqAVR?=
 =?us-ascii?Q?tbQdo1ousAdxOjzug5rFv8rBfJVAUb1OE4KEllG/X4+jg7llDT2sGtBqRBcU?=
 =?us-ascii?Q?1mplcY61wj9xc55XF042IOmq5hbxSBetWVpcjxIL6LQyKWisYo8ef+l+n/nu?=
 =?us-ascii?Q?Eu2zZjsNkMeecp+x38c2e3W2+CSmxIm1EIROvXuLikorx9ARlDB6gtCnJ3YM?=
 =?us-ascii?Q?xTy0cKz0Zk3EAU36/6pJfgf3A4CY9zgrhzCtAjV4ipYMJzcHUBeKRKbkYKrn?=
 =?us-ascii?Q?BrLQpDy1QVPmWlZQgQOYg3Prc5cEpF/TSoBRNZA7U4Rl4H2eyQ01eqVhrKjA?=
 =?us-ascii?Q?aS0tDs8+qICl/WYwa/jv0FOhWqkD6jmfvJWap2AzsKU8kiHDXAJwp9g+TUpB?=
 =?us-ascii?Q?oDg5iKMzr29+ziarjdCU+rS07xVJzEctItqDsspbzpPr9w7AjOU8CV8V1ERD?=
 =?us-ascii?Q?auC8wUiTVYUDiMIQqQDencN4bRhJ6beFTOhuG26A11xgVuGHYstxJzrIKpyN?=
 =?us-ascii?Q?wcveyQ2WMYxItCbmTXFbIQ78eofbV8IchexdE0uIPgkr4bDHj10D3/O3RwZC?=
 =?us-ascii?Q?uZCHiXcD/mdXpsKrLkO1b5ZstRDD2q9O2hMj4hkgVlXp/+0ypx7kozbjLJls?=
 =?us-ascii?Q?cyDutUgyLnmS/Hwg66o1+5PCRRbNiPzqscsahAzyVwV3jE5K4a//brk6Zi6C?=
 =?us-ascii?Q?EQ9i4p92lhbZMtQB1erGsdANV6SCOkO3VpBaj9XV/FG79ewEdQh9WjHwVtfJ?=
 =?us-ascii?Q?JD9WgwfF9HcllfDmUoQukcbEsc531zWfrdrER34ksbN0LDqEeXJg7oHZrwtM?=
 =?us-ascii?Q?C3iFE82OIw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0b109d-6718-44fd-0fdd-08de684e87fa
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:03.2938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkCmEzf1hr1mliZb35SHETHIhoaO1zwnzptcNkcZTGk8wCGj90vIUjLkjrSBweD/9/5sMhBRipwfzejzTDgVzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8797

Hi,

This is based on the Feb 5, 2026 linux-next: commit 9845cf73f7db ("Add
linux-next specific files for 20260205") That's new enough to have the
pdev.as_ref() changes (see below for details), but not so new as to
include the current merge window churn for Linux .70.

I've re-tested on Ampere (GA104) and Blackwell (GB202) RTX GPUs.

Data center GPUs remain as TODO items: GA100 needs some additional code,
Hopper/GH100 might work but is not yet tested, and I haven't even
thought about Blackwell data center GPUs.

So, even though many patches say Hopper/Blackwell, there may be some
test-and-fix work remaining there.

Changes in v4:

* Fixed the IOMMU page faults on address 0x0 that I was seeing on v3 and
  earlier, for the iommu enabled case. These were due to the sysmem
  flush buffer being in a different location for Blackwell, so I've
  HAL-ified that aspect.

* Added a patch (0001) to pass pdev directly to dev_* logging macros.
  Then converted the remaining patches to also use pdev directly,
  instead of pdev.as_ref(). This is only possible in branches that have
  commit a38cd1fea989 ("rust: device: support `dev_printk` on all
  devices"), which in turn is why this v4 is based on a linux-next
  commit.

* Changed FmcSignatures fields from [u32; N] to [u8; N] arrays because
  the data is not treated as 32-bit integers. This eliminates the need
  for .as_bytes_mut() in the FMC signature extraction patch and allows
  using named constants like [u8; FSP_HASH_SIZE]. (From Timur Tabi's
  review.)

* Changed .unwrap_or(u64::MAX) to .expect("...") for alignment overflow
  in client_alloc_size() and management_overhead(). A panic is warranted
  here since the values are compile-time constants and overflow is
  impossible. (From Timur Tabi's review.)

* Added a patch at the end that I actually expect will get merged
  earlier, separately. But for now, it avoids nova-drm aux bus
  registration failure on multi-GPU systems, which in turn keeps the
  driver alive, which in turn avoids a driver teardown missing feature
  (pre-existing), which in turn avoids IOMMU page faults at non-zero
  addresses. whew. :)

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

John Hubbard (33):
  gpu: nova-core: pass pdev directly to dev_* logging macros
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
  gpu: nova-core: Blackwell: use correct sysmem flush registers
  gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
  gpu: nova-core: refactor SEC2 booter loading into run_booter() helper
  gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
  gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot path
  gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
  gpu: nova-core: clarify the GPU firmware boot steps
  gpu: nova-core: fix aux device registration for multi-GPU systems

 drivers/gpu/nova-core/driver.rs          |  48 +-
 drivers/gpu/nova-core/falcon.rs          |   1 +
 drivers/gpu/nova-core/falcon/fsp.rs      | 160 +++++++
 drivers/gpu/nova-core/falcon/hal.rs      |  20 +-
 drivers/gpu/nova-core/fb.rs              | 118 ++++-
 drivers/gpu/nova-core/fb/hal.rs          |  34 +-
 drivers/gpu/nova-core/fb/hal/ga102.rs    |   2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs    |  73 +++
 drivers/gpu/nova-core/fb/hal/gb202.rs    |  62 +++
 drivers/gpu/nova-core/fb/hal/gh100.rs    |  37 ++
 drivers/gpu/nova-core/firmware.rs        | 186 ++++++++
 drivers/gpu/nova-core/firmware/fsp.rs    |  47 ++
 drivers/gpu/nova-core/firmware/gsp.rs    | 140 ++----
 drivers/gpu/nova-core/fsp.rs             | 561 +++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs             |  87 +++-
 drivers/gpu/nova-core/gsp/boot.rs        | 337 +++++++++++---
 drivers/gpu/nova-core/gsp/commands.rs    |   8 +-
 drivers/gpu/nova-core/gsp/fw.rs          |  63 ++-
 drivers/gpu/nova-core/gsp/fw/commands.rs |  32 +-
 drivers/gpu/nova-core/nova_core.rs       |   1 +
 drivers/gpu/nova-core/num.rs             |  10 +
 drivers/gpu/nova-core/regs.rs            |  95 ++++
 22 files changed, 1856 insertions(+), 266 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb202.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fsp.rs


base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
-- 
2.53.0

