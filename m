Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010062.outbound.protection.outlook.com [52.101.56.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF405332ECC;
	Thu, 26 Feb 2026 11:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772106410; cv=fail; b=SPMHFyDIX7JhpqTtP29HyOpC+4MctYZvveEiLB9DrSMP0+yXx4ngj+xefAx+X6yO9P5T/+f77f6yBfDZwqEEXf4l7Lr6kZdKj+6wx2gCdffIWK8UG6xNO51Lyd4UXYnQnAXLuUuJ/C1VtpNBjqTxh2CaVasKfaVeXajQ2invzjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772106410; c=relaxed/simple;
	bh=A5ujHY4eU3ep7aDDm2FuLesQNYBm4WTa91VBvx0h6I4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=g3rTLSbUjQjp+RHAW4U2TzlKXW2scjxtF3y9uMvB8WCLEGsQ+O7ByMdBAeEXLa97zdnB68Qqv/oUUqmk5ondaGpTGegrX1krD35GI0cn5rtH7pMyoNFuifi8xS9PqW7LEQpGcDzeIrapkeVLNvgwVKQcpTVjxps7m3fqn2BRn58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W0WlGLnZ; arc=fail smtp.client-ip=52.101.56.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W0WlGLnZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3thY2IvxYcUMpRKEBszyL6RFiYR7EUf0w96Du5arlPCoJufOX+xl92UOoSkxpJZ4DxZquY5HDcNeSYp75hxSlZ8/WoKXjDTxJRARAG6fTA34Hr5OBiFLDWq9cTWroGeAXPS/R8e0uZOIt5itwASPFIrtbx/gJlNXWm9twX/Mci+EzoTKy8L2FcfO7PVsMHSnjmuMOPvrFq3GWvoFIc4a+9JrZqdUFPdPFovvvly+fdYmZRnuyIBtCpxkSsZzqqaFHrsybRGCkll5POYCfKv5C2PgZ9/9FBEOOfWzFBT/z19DNf9H6BvaMDhRwrQeqnBR34UljNZKMg59DBjEvx9VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMY96A6F1tDZHE8RLTFE5p2zhP7cdjqBaEcDOhHlkgQ=;
 b=uPqfRohpQuTfd/apkhvjOeEYBh3ZURDCfs/ovUElZa/RA0IbBH4Mc6e0lRaJcIr45qG1lbN5yUr0TrSWQEJ1dBQvOQKuusXkHiO0n0fBn4g+d6cJO73ADzsmumh6oQl8qf9ADvZSDMXiCIUD/oMFW8qrvwf5M2LC6Ubem4Nn0RUkr0HXyHXdW+Uy0pNthiLR7E3/tecZ6VuTbBPOF54k+HvY5ULlIki9GPc1iLFhajH+hVKqgViV6C9DfEVA7bfPYctSbmU5qs/5pw/R29hi33SKve7hpgnQSSC3CKmI6Kyb0mF4mQvjV1dXOUU49fWZDd2GCFXn7hWHouUQ/h1wUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMY96A6F1tDZHE8RLTFE5p2zhP7cdjqBaEcDOhHlkgQ=;
 b=W0WlGLnZQwQT8qTPtFuwCYwKF1N0BewQ4XrsQrqjxAg2c5CUpwRbBGoB7y7SAggIcZ9eLSRXGmFYfcav9aQ1j4FSUKi9caQedsvp1PioE8Wp4rF5mj0uetOLYPkS0f2J9rFgb4k2LNCJ4EiHIBBQHKUcztaXHSscdQRLwX1LrYN1O4/b93fO+HSQMnSNiqeJu7DnAFL+rHZRvfB+4UYP4AmHCTR2nNQwVB5RVujhTj6Ntxie0x9LGyjLqldkgnCH5FLgx9jm1gcSyXEHlo7pAJKCJUfUpEluXSi3NNxNrFckbBAfLlIijc9qA+k/Q4sr0ckX5N41tWTRVKrPq0z+fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Thu, 26 Feb
 2026 11:46:40 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 11:46:40 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH v3 0/9] gpu: nova-core: gsp: add continuation record
 support
Date: Thu, 26 Feb 2026 20:45:32 +0900
Message-Id: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OTW7DIBAF4KtYrEsFw48hq96jygLD0LCwnQBBq
 SLfvdTetFKWbzTzzXuSgjlhIafhSTK2VNK69CDeBuIvbvlCmkLPBBhoBkxQP4cb9etS03J3tW/
 TydoogrJae0H63TVjTI/d/DwfOePt3ul6DMnkCnZjnlM9DdJJGxEECjVO0hipUPCI1oNxhoFnS
 irDrSG/1iWVuubvvW7jO3Y04/CiWeOU0VGw0QYMSqH+WFoKyb333zvX4C9hXxHQCUAzjZorJXT
 8R2zb9gPSagN/QgEAAA==
X-Change-ID: 20260203-cmdq-continuation-b99f3d5966c3
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0063.jpnprd01.prod.outlook.com
 (2603:1096:405:2::27) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: b2746439-ec04-46d5-c145-08de752cb481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	2nTGyCC946eyMinC2B5yEgtJQOKRNvVL7+XjI82HZzzixiX8oVxD7Qz0XDSq0piTd/7Wz6r/3XLcsrFtpB0Fq7jBDRccUWKavXjsmWdvdmUKn6y+vil5H2dR0BkRZMRpFrrTRS8yMHUfDRY2XUss7ADidwmWtVGIBUZKHPNLGLTEDzCOKkFY72tcZeHHFa+ZU5nHOX0Jx3kK0e+OG26zed04Ll9t7QClKa3hdzitjyzQo4WLa0bTD5Fxlwci4mTeRzyGhORaS5Ax+hmZMqJWNgvmFx5ffEHlLsubr+jo2VOCeELXsU8LxeJcmORTQ1ZOGNg5YHlW7d0IkOZ1oJuxJXo5ZRYMkIXynUy9ODdEG+xT2agm7spQJQJei4VmllseFX/h8+2eAfamumbUPwtbvWSD/GiFU9OC7uNxiMvlxyxLaaoEoM2hWgFMSaW0Yu1L9Afneh713eQ+CUNYfY4AHbhWMPvmX2pAcHAyQrJuw1NuIQKnrcQrvEOL7EX1ooPRAjzalEdS3m1B156y/UbzIpBIg3XvnQIlis79KlZ7tWqLhXVRd5zl8snf03Gkaz7/EDehFRL2BshHDPeG0I7YDjFIlQZ6KeHZ3Cv1pHRaeZctsudGbe1cwdHRuKjX2YEQ2jEfoX4V1IDoYUiAepfQ/kmP3sofIpUCt05vjcJfuM0J0/BDjhLfxPrLZdDTme11++UEtSWxDu42CWmNcCNdlb9lMWIGkBBWMuf526Qa/RPwT61yYpHGpUhW5OO4Bh0ealzue3prYGCLRqGwyGOYRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3J2cC9obi9ZMjg0bUNRT2J3T1JIb0JoN2hFaHExU3FKUUtBVHlrUUU0MzVs?=
 =?utf-8?B?RTNES3F5YWcwa2RsOEpwK1p5Q1dnTVdvamNNeHNLUjNuUmNkbnVCVjJnMlBm?=
 =?utf-8?B?eWNxZG5hZE0xY05EbEJlZjlDY3NlSHh5dnpxUHBHcHB0S0tMbkV5bGQrSFNO?=
 =?utf-8?B?dVFkWDFNcFdMRmk2SEhISVJQRFUzdW1YYWg2N3ArTmp2S3VYTlNNamdJZmlL?=
 =?utf-8?B?SjJUMmZQUzk0OWJvTnFnZmI0OW5qVkc0VUIzemErSUpadXVKTmhTeCtRVmNz?=
 =?utf-8?B?ODFyNHI3VjNUcjFHRlVJZlF4YXFwNUN6UG9uNFBtU2djaXJsZTdDZm4zbmty?=
 =?utf-8?B?OE9sQ21weksyZzJsR3FJSHg0MGlQeitTdjByQnE0S2llYTFEKzY4YkJtTHA4?=
 =?utf-8?B?bVQreXprdzlXU2ZFT0RPMGUxY3dNRzI4Q295OHRId3FnZVJpTE1RT0MyQ25O?=
 =?utf-8?B?eXo2YXdPdGtrUzIybGRZd0V4Y2F6d3VPQTR2eFROTEV4a3orSHEydXk1Ry9D?=
 =?utf-8?B?dGVTd0V3bzZHVjBQTitZYmFMMEY2TDlYNlZZci9DQUZ2a3AzS0ZPV3llMzJZ?=
 =?utf-8?B?UjBuZUNGVzVlby96KzJaejR6NGNsQUxBMkdzY1ozdFc5bWhVYkpyUUdtdW1Y?=
 =?utf-8?B?aExqUytZclY4OG9YazZYN3JKZnJlQmVkR3RveXhCbVpWR3g1SnJzcGtjMmg0?=
 =?utf-8?B?V1hvZmxtUTM5RTNRZHBheWhUOW9UUUcvck1NWlpxdVAvNlQ1ejRzempubms1?=
 =?utf-8?B?dU12VW9vaG0zTm1QLzRsRG95RjBCczJlZ1V3TEZDcENlbWxhMFFYYytYZEoy?=
 =?utf-8?B?QXR4VXBYYkxxaHVHNFFhVWFmY3ovSXJMVHByaXBJZ2ROZ0VveE1qd3F4eHUw?=
 =?utf-8?B?OStqQmFFMHFFSUlPc1FDN3hGQ2ZIaUpNb3lZc0Y5S0FselZRZ0g5MVB5TUI5?=
 =?utf-8?B?Z01QazcwcTI0ckFSWHRFclJYRytYVURlN0pBejRyQk1sUGU5VmEwYUlXZmZk?=
 =?utf-8?B?ejBzazVKdVI3b09NV0dNR3BkQ3VxSTJhZHpuQXF6OGEySTFlTk5XQWpOSDFy?=
 =?utf-8?B?cEZ5QVdoRGJibWYzT2RUV0RZWGxBRDc5MlNDcmFxVUhlR0kydmtxSnFjTjVH?=
 =?utf-8?B?Y3Fwci9tTGdjaTFrRXJCQjBqNzdTc2dpdzJNWGI1SlVqQmI4Q1NUaU9nbjRi?=
 =?utf-8?B?cmtMRjlaZm1PY0U4VDg2R1Jvam5MWHV0NFpLYTc5eXM2cE9OallSeFhWbnBy?=
 =?utf-8?B?eGFIamhsNFd4a09WZ0p6eFYySWtFTm5PbTFJK2FWaG9GajBXMXRiSkJIV2s3?=
 =?utf-8?B?YXlNemd6d3VNcWdiRC9tL2RtWFRwcEpyQmlhd0JtUkhtWWJjclpabnN6aHNm?=
 =?utf-8?B?SzBDei8raWUzL0dnd3M4elc0MGZoZElwK3FRclVmcU5qc01wZWdsVlliR1k2?=
 =?utf-8?B?ODYwQVZaeWdzRzJNTTlmYkhPSHF2TzFINi9nQXhROGFvb0w0WUNuc3VMdGQr?=
 =?utf-8?B?akZ6TjFrWU5yUE4xOEgvT0JGOWJrUHRCMWpvZlNmRk1HTXFPSXRHbE1LZUdI?=
 =?utf-8?B?Y0lZNU1ENUZrSXlPcDZkOEZibi9rVFVKTmI3LytPcHRYcmRUajhoUXdGTy9n?=
 =?utf-8?B?ZTRDRlBwWnVES3FUOTdBaTFYeGdLTDV0YnBaN3F2QzBQZks5SjFOQlIvVnB1?=
 =?utf-8?B?NkJiTmR1QXVkOGhFa3IvbHcySDhMMklDb3BmcDcwZHhnNnI2TkMzU3dqdFk4?=
 =?utf-8?B?ZG5GOFJ0VCtwVjFiRkZ6djBuZTl4T3BESmRTOUpCdVNhSFpiUXhPNHpEaFBq?=
 =?utf-8?B?dnpPbGowV1J2RWkxSndRTGR1U1YwZWZsL3ptMnNTemVHSDEwa05WUWR6UThG?=
 =?utf-8?B?MVpsNEVwOWJqdjNzc0owUUx0OFQ4MUY0YTdqQnVkb2g0OEg0OGpyNVhidVpy?=
 =?utf-8?B?cHZPZ01hM1h5MmtISWhVdy9NSkhzUSs2TTJUR2NoRkdtT0hhdW9VWXJKY09H?=
 =?utf-8?B?OU80YUZCdmRvSElubzdTOFlWY3k1Zkx1MjV3K2IxOFZUKzYrYkREMHJUSmIx?=
 =?utf-8?B?UmFNSFRmbGN1UThwTVFUS2hVemxqNVI3QlZDNWR6b3RrZkVmV2NLaFJyaUlE?=
 =?utf-8?B?SFZaWS9VVERSc2hxVmhKaHVuY2E0SVhoOVJ4L1F2UmJ4c2hPODFRZit3OXZ4?=
 =?utf-8?B?UlhmZHA1TGNHSzMxMm1jOWdmYXYveWNzUnZjVkJOdWFDQ1N5cUUyUUdORUh1?=
 =?utf-8?B?QnR3aFlmbk85MElVZlVaS2RxYythQkV2amVtRHM4SnRoRUxYU1RxZWxHbGdC?=
 =?utf-8?B?ck9IcUd2aDRMcnc0azlEU05WUHlmaDVLVG9oY1JNU2l6RS9sOXV1cEVnM3BX?=
 =?utf-8?Q?yQkESZ6KjvetL/bNOiMxDlGSZOhL9Y9prIHppk3hRSAzn?=
X-MS-Exchange-AntiSpam-MessageData-1: EJ92YT9jjf2NMQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2746439-ec04-46d5-c145-08de752cb481
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:46:40.2265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmHPlI3H6D/crYZOVaL+PbQu3Pst4y+u4R7sVGU7UMZn3GJF9Q80xNqnEumTxa4wijljzaK3Qri1nakjACEW6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7112

GSP commands over 16 pages need to be sent using "continuation records"
which essentially means splitting the payload over multiple commands.

This series adds a command type `ContinuationRecord` which just writes
its header and whatever payload it is given. It also adds types
`SplitState` and `SplitCommand` which support splitting a large RPC
into smaller ones while transparently letting regular sized RPCs be sent
without extra copies.

The send pathway uses `SplitState` to send all commands, but if
the command fits into 16 pages, it still writes directly into the
command queue. If it is larger than 16 pages and needs continuation
records, it writes into a staging buffer, so there is one copy.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
Changes in v3:
- Rebased onto drm-rust-next
- Added some doc comments
- Reworded command_size doc comment
- Link to v2: https://lore.kernel.org/r/20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com

Changes in v2:
- Added doccoments
- Renamed driver_bytes_available_to_write to driver_write_area_size
- allocate_command_with_timeout merged allocate_command with timeout parameter
- Replaced hardcoded GSP_PAGE_SIZE * 16 with bindings
- Changed oversized command error from EIO to EMSGSIZE
- Added EMSGSIZE to kernel/error.rs
- Split WrappingCommand functionality into SplitState + SplitCommand enum
- Made max_size a const (MAX_CMD_SIZE)
- Removed send_continuation_record + added comment for type inference
- send_single_command now consumes the command
- Extracted command_size + used in SplitState 
- Link to v1: https://lore.kernel.org/r/20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com

---
Eliot Courtney (9):
      gpu: nova-core: gsp: sort MsgFunction variants alphabetically
      gpu: nova-core: gsp: add mechanism to wait for space on command queue
      rust: add EMSGSIZE error code
      gpu: nova-core: gsp: add checking oversized commands
      gpu: nova-core: gsp: clarify invariant on command queue
      gpu: nova-core: gsp: unconditionally call variable payload handling
      gpu: nova-core: gsp: add command_size helper
      gpu: nova-core: gsp: support large RPCs via continuation record
      gpu: nova-core: gsp: add tests for SplitState

 drivers/gpu/nova-core/gsp/cmdq.rs                 | 116 +++++++---
 drivers/gpu/nova-core/gsp/commands.rs             | 258 +++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw.rs                   |  75 ++++---
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |   1 +
 rust/kernel/error.rs                              |   1 +
 5 files changed, 393 insertions(+), 58 deletions(-)
---
base-commit: 4a49fe23e357b48845e31fe9c28a802c05458198
change-id: 20260203-cmdq-continuation-b99f3d5966c3

Best regards,
-- 
Eliot Courtney <ecourtney@nvidia.com>

