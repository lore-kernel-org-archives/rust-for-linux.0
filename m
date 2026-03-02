Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010036.outbound.protection.outlook.com [40.93.198.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B434936308C;
	Mon,  2 Mar 2026 11:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772451769; cv=fail; b=bmidLVfXs1w8o93mIL89XiR80pcky0fk7eT6inhQ6eyaxQR/ratqgLLoEVHZyXsU6cE8VwTCnlgz1PxE6UgV5JQjUVRrInoIikCe9j40VGZiUnpi+5r4G4QTYvrHNpHlcz8U8ShBmgcT7mb/D6q2n3H9OCGwyzd3k0pz8f3K+eE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772451769; c=relaxed/simple;
	bh=usvL5sLeVowghAjQvz0B04mn8dYaAhYI8gKET52CPqc=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Ak1E+zmpODREPsPVVRega0cP81D7UEHJb7nPMHy6oW9xh0I7gJW3kS2KJwwF8LNx559CM24RzAlyf9wXIpURQxf90nbGJpQe28G2yPJmF3gHelALEVPhaqKxhPXU9WHLn4dhY63+AoHOUsGiGB3wBLrJLzx+RCL1EIhU1/vzSbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E+g/wpS4; arc=fail smtp.client-ip=40.93.198.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E+g/wpS4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/20TaBND+hckoKt62y67ofdoJI0seFm7Va+SXyAaJJfPU0/sJ3Nl1KviNtUgkjiNXHJckHEjqVjHh6RBOzXKFgam8GCcCuK+6fRwCgu/5s1OV0zG8EkzoDnSb73HJBp4yj5QmZfr4iqupk6V5ykyaUU6/AfX+WtS4t0o7vy6ovg0NgyZ2fsK7vPv2zHpd0+WfA05iLg6k+JV5wFmD4/Pzru371N3FOtC7Z+fcyljZKrijOdwFO/sRjrrQO9JfC++bY2sYdjoV5kJQoH9hdbGR4hJZWW3Ic6+Z659NT8vhF5PvFU3R+Go/509F+o6RAlncfU2Os1oHr6zPUCzOQYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5u8ipJbjsvmspaMfj4SBevbXzUEs8c+AsH8Xr8BtAU=;
 b=AfJbMyO80OH2/cv8XQXCVZTkAjl++9Qj+ZTqwxOl2g2Z1k7NxWgGG4ykOUFQsSTOX+Ww5667qHhfUp4uwaelwSjV9El5OSnJUexjdgJWvZlptGIGBh8hTuACWP8aTG0qdaXvNNYmC8hoDIqW65uZmljYGBS3da26UYBanzg/+Bvxz+BkkTuB2W7jlSGVFwIKyvUqFiqyU/2bX6Nrmfevyy3/Xn+SATB2mo8/P8jqCAMldQU9pDG50pzzhu/oqIqqML6lsjPZeJ6glLvD33XX3NMLtXGAX2G8Be+HazBa2vVa12VxF0YSHjl26P1v+zvASoDfF0nbNExiz2HR6eNKew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5u8ipJbjsvmspaMfj4SBevbXzUEs8c+AsH8Xr8BtAU=;
 b=E+g/wpS4e3qdPcoI2l6NmHcz1XH67rQU3MvUHUyuWfIRoP8iUebdRdxlh/Gai+th2q3MJ6dJGxci8YrE/Qt0VfOJPr79Fp7si3z3prhK2U8iFlxCMa6wCJNnMDWTt19I4JX8xs3AxO0HfpmNdJDAa7Y+gg4ymaQNUUVOZMXug1psMZANWA+yzpIO86MGIlF5maeuRSNDWAFGNGuNOvffhsL2umrbY/ZSt0Q8M/23zLBTqpCuzxBdOljwLQ9qnWnDi4kKKkZKBORkoqxJDRexksf5Gog+uMkpaQHe4qPh/VO3nylfGVsLI1vRFoI5eSqe3cfwIO8igPfDaWIlFEWefQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 11:42:42 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 11:42:41 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH v4 0/9] gpu: nova-core: gsp: add continuation record
 support
Date: Mon, 02 Mar 2026 20:42:24 +0900
Message-Id: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23QTW7DIBAF4KtErEsFw39XvUeVBYZxw8J2gx2UK
 vLdO7U3qerlQ8M3T/NgM9aCM3s7PVjFVuYyjRT0y4mlSxw/kZdMmYEAK0AonoZ85WkalzLe4kL
 TvAuhV9kEa5Ni9O+rYl/um/lx3nPF643oZX9kXZyRjGEoC62KOvQICpVxnfZeG1Syx5DARy8gC
 aONl8GzX+tS5mWq31vdJjdsbybhoFmTXHCnhAsZszFo38dWcomvtHvjGjwT4YgAIgB956w0Rtn
 +H6GeCLBHhCLCOIh0KGmd/dtiXdcfPQnPpoUBAAA=
X-Change-ID: 20260203-cmdq-continuation-b99f3d5966c3
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0353.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::10) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a4f2a4-15eb-48e0-c2e0-08de7850d01c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	N+gkCRlQ7n77mbFzfUVv4jyChfqNGse5DFfut62268OK7MqkXUhzt+HzvHohRSlYr9uTdPDGjfTtR9fLHpLFhfZPZ3CiCH7Q/hI9H7gwxpRC5rz6W1HM0OC1ikitH8ELqm1vRjRprggeW9uH96zMKvLgEHG9JLudp61p0hOCjRPOtzB7f2kMsT1bXSfbFl9y8gcOYyyQNz3tvsHYZwoDA4BVf86m3Sr5+HhJmC3h+xz9MIwBfpUR08HTl41ChKSwT/O6KJiivgSklxHbeYi4qJapzocaCO7lHapj96lTPF3N0E6JVIPPuOm7TtYx8yWPUDsyapRQFsHjoVeWmrUsNL0NOa8TMP6epHB1FCqFMD2lcyhp0Dv7QH40nqbpyFKGYWQT+VILWs5emldRbyHaBQXv17NdBFIt+Uh2BFL03yZsLaa/mrJa86X/8aOjsTjWm5jcmjemKe8KbeIMd0Rua9J4QBd20nQa05kURltZNjCerx0tKM2TXDZUqWMbEWhBhkSMLsREC/JmmFGsWC1H1faIXCQ2QuO3jMLfAGntFZWaLbI+5UAgDiwBJdsOwuwW2oEwiczbXUa6uvJ+SQDiugx7R9CjAEgUjdgAMegczJQHcJJdEpWMfQDoCNtxNpJj5Z6j2hkdY28rOunu+v1BnzgWwhxmykXsLOOrguleNMDkq4tzLK0eME2UC7xHLA2TeHnz5aOja0WAQZXh+FyRAW8IDvH+sGBVRCeJl47VxQWIBvlFkyQls/suBFD9NroRsCVb8xC+SXqGFuya8Sa8pQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmJYdzBMeVlDNzZWWVIxVDJBS3A5U1B2aldiV29xdUVobXV2bTd5RG84dG9v?=
 =?utf-8?B?aFhNQ2k2YmIrYlpFS1hsQitMUTFnSjd5OWVBMkVhZE9MeGdyZ0ErOGU5Uk9n?=
 =?utf-8?B?SWtJVU1OS1oyblAyNWV6SjRpUFowekRwM0NnbFRNTXpvMEx3aTJpSTlETXRh?=
 =?utf-8?B?N05ZQ3FJMFVXWW5wUTBKMldIOVhvK09SVWVKcmd3ZHdlODNpWUNnVVF2L3FM?=
 =?utf-8?B?cEROTkpabkJjT1pMSkFGZklLeWMwd0NaRkdYNHJncytFYkNXaEFaNGtKQURU?=
 =?utf-8?B?aXgrS0pweVBGOGM1VWg3dE9udnZNLzFBMHhFd1UzaC9ERUhrNWJhZ0xGSHMx?=
 =?utf-8?B?ODA1QlVpb1Q0cjl3T0ZhN01TdWVVWFl3Q2lpc242Zjg0TEVqdWN5amxIM213?=
 =?utf-8?B?N3lqNkx3ZWpFWlpRcElMWlFyeG9VL2svYjhNNEpyV0t4U1BhUDR0YnhZbmh0?=
 =?utf-8?B?K094blhxYThtbGswSjRxci9TSFdRaWZ0V0xxVnNrd005T3R0WjhXak1tZXZI?=
 =?utf-8?B?bDM3eURHZ1ZtVGtYZVpEcGdMVUpkYjQxdzRKRjBvVHorWm1QZU1xS1QxWkNm?=
 =?utf-8?B?dVV4M0xqV1JFVnAvVVFBQW14ejNuRlB5NUR6Vmk0a3g2TVZOdEpXMTZ1T1o2?=
 =?utf-8?B?NWhYTW5BaG9BN0U1RUZjKzJJYURXN09waFJ0K1Q5ZTR3OU8yeUJFQWt3WWdP?=
 =?utf-8?B?VVc1bUd5V2VIbjVmVS9YSDc5RXlWZG1NZHhJWHh2bjNCSFFMRmdNdHFCcjBX?=
 =?utf-8?B?aFpqL0dQOHZDZExXZUNSZHh3RWJtaCtsaVhOczh3dFJleWJNRENwaUpmcVlU?=
 =?utf-8?B?Mm9JTzM3cEhTTHpSdEtCdjdKWlpaWTYxbFAxdUFqYkRZT0VBS2dheFZpeUVm?=
 =?utf-8?B?WGRmc2tGRytMQTZ1aXZkZWV3MnVaRkU2SHRwTE1ueFpLSlNLazNuQWhOV3pm?=
 =?utf-8?B?YTdaQzRwUk9oZDRleGVjcWRpWGs0YkhKTHZMUHVHYzNkSitpSWtCVHNSVlgr?=
 =?utf-8?B?Rk9JZFVlRTQ1dHgydTUzdVptVVhjblJhR3U5bDlIQTNLbGtwVFh0b3hPbnJN?=
 =?utf-8?B?WjY5bysvdTQzOHA4SWpaalV1U1A3cmlwVEZzSzg1K2locUhwRUVoZlF2aUl1?=
 =?utf-8?B?eWdkSVV4U3JPTERodEtLa3BlYWh3MTFac0hGeElyNlI2QWpwTEVuVUF1d1B3?=
 =?utf-8?B?Z0JRT1I2RktNczJZeEo4czRRSmRkMENYaXlRZ1NFa2NzYzRVM2R4RHh1dzFO?=
 =?utf-8?B?RnhTS2IwRzV2SUN4dVZwMXhGTFNlalpGcUlRN2VKWjRZOWpxOFVKc1pKZHNl?=
 =?utf-8?B?Tis0L0M1anRwei9JL01sYzZWSzVEYnB2UE50aEduZHRtcXpLS3k1RTFkT3VN?=
 =?utf-8?B?YWI4cXVzakxiSDdLakhDTVdjMmt2cjU1YWorZEZHOVhGSG5MZ1hEUXJ2L240?=
 =?utf-8?B?VkpWcExGemo0SlJqcWFsTndUNGVmdFpTNkhZLzFKbkxZaFlPZDM3NmlWck9M?=
 =?utf-8?B?L3RCbWRleXdHM2M1aDJmNkpqNGZCcVBmN25TbnVMV0d5NWZKcFdnUGZHNmpZ?=
 =?utf-8?B?R25xWmtIZFB5eXNjSXJsV3FwSFNWeXRwcndmalFOSFRXN3VoaDg3WURQS2R1?=
 =?utf-8?B?eSthRkdLVVI3S2VaVHJsaEJnMysxY3hMUXFRYkNQTXhXaEYvNjVVaGRTTytJ?=
 =?utf-8?B?Z2VxYUpaUW13Qkh3Q1pEYmx6clF5TUYrM3ZUWGhMV2JTcURUazVHbGhiVmtt?=
 =?utf-8?B?Q0p5M0svQlJoOEllMC94ZkhMWWRhWlFSQzVDZ3NCYW9qbHJzMHVHaVhSSzZY?=
 =?utf-8?B?bnZRTStsMXZpZGZtRW90c09MaFl0YXBDQkhQR0F3YnlxYUpVb2EyU2pSUVBz?=
 =?utf-8?B?bGNHZ3AwZ3J3d0srNm85ekp0VzNUdFptdEtFOVlBbEJuZHAzOU8wdkdCWDFP?=
 =?utf-8?B?SDJic2tBWENUM3R5aFp0d3JCQjFoakRtdTB2OSt4RkxJSlloTEN1ZHhoMnEv?=
 =?utf-8?B?YlRwM0hqZENoNU4yTVRsdS8vVFhsVnRZTzBrcEsvZXppSU4yN1hpL25BZ0NY?=
 =?utf-8?B?QmFiQ3poQTBoUVROc3drUzhveFZFaVd6d2VlL2FKaGRabUhrMHhLZmE3cnpE?=
 =?utf-8?B?VWlUWkFVdEMyV2IyVTQ2cEhDT2l3MkZucVFmamprK2tmeFFSc3VtL3NycGp0?=
 =?utf-8?B?TjBDeHUvOFFXUlcwdWJjOFdDMnJnaFJ6RGdnZXgzT3gzTENBSDRhQ0xCek4x?=
 =?utf-8?B?b3Z3SmdhYUV5dWhEK3ZPeFB4dnhRMkVndnBCeTRlMkNDMWl5L2RrL3VOU3Rp?=
 =?utf-8?B?eVZqaEVnQWVCTGFCVjJSeUovak96b21Vc1lKZW1LcTJtN2hQL2h1cFVCMmVq?=
 =?utf-8?Q?cgPypx7vBwg0jrAaYPrlMAx/Y0AvcOVyQaUQfrIBYnX73?=
X-MS-Exchange-AntiSpam-MessageData-1: gDfwAh2ZI7JxMw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a4f2a4-15eb-48e0-c2e0-08de7850d01c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 11:42:41.8919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYGvf/i3/Sx1lsMf5US3KjGgINrDqXBs7KV7DM9iqSX1MMAY7O1LrOvmPi0c5vErXas3wWMhNKvHnlLZ/04l4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6259

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
Changes in v4:
- Removed Tested-by Zhi on the ContinuationRecord patch, since it
  changed substantively.
- Incorporated Alex's design for SplitState
- Moved the continuation record types into their own module.
- Tightened visibility on continuation record types.
- Used non-zero sized command in tests.
- Link to v3: https://lore.kernel.org/r/20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com

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
      gpu: nova-core: gsp: add tests for continuation records

 drivers/gpu/nova-core/gsp.rs                      |   1 +
 drivers/gpu/nova-core/gsp/cmdq.rs                 | 114 ++++++--
 drivers/gpu/nova-core/gsp/continuation.rs         | 305 ++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs                   |  75 +++---
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |   1 +
 rust/kernel/error.rs                              |   1 +
 6 files changed, 440 insertions(+), 57 deletions(-)
---
base-commit: 4a49fe23e357b48845e31fe9c28a802c05458198
change-id: 20260203-cmdq-continuation-b99f3d5966c3

Best regards,
-- 
Eliot Courtney <ecourtney@nvidia.com>

