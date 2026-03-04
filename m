Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010070.outbound.protection.outlook.com [40.93.198.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95549311C1D;
	Wed,  4 Mar 2026 01:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772588609; cv=fail; b=qLN/UGXUrSIyr2y0xTILxedogFmpXw88jO8JW3B7Xyxu+EPe0esagB/+2C3T+TqOZ6Kppq1Ium+GGwmIeckPzpqHNq9l+RMWCRUJ0+LX0ctezElKoYDu/ogqNJtfyJZjV4KLxAzdI7ycviUzxzq7b24wlBZSG3GOKkgPlTnVk3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772588609; c=relaxed/simple;
	bh=5PnK8FVw1aiU0kxPwqPVRzcfHFJ1dbvotDzt/hNfyjQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uZBDfzocTZmUlOAASBB6ef/CvjskeiuQG3Im8ik4WB0QXa/IuzCEXNqxGUIk4bh5wHUZhuh/wzAD3e9I8LipNdKLlB1XzlQ/aMZQd1iBF3bzVLRUog9+K4plw5RaNvu6m9LsF2I8fhR7XXpb69HfvaOUV+7kOt66tNVvEWRljTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oerJuvqc; arc=fail smtp.client-ip=40.93.198.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oerJuvqc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rH+Dd3OGKAYLpMMlIT9qV92VFrqhqLZU6S/xK4aaqsCD8EBILTenQW7eKnEIksXPmh/NLJU9SPtZxirDhO5KFNOgOPQvIdzLzl8qzmqwSRDTDR3S0NF+D+xk7Ueji5qc1TCqNFn18Z4Zmw4r7JtFTvUmCuKb1HD50YlWngYhVYws2AGn7uTq3YTJWSCRKvBTb2xhSkWTXSIaqfPfVRdYhFSBMBBc/P0PaR8YhNPenUwt5WDz9swyaSerf3nJy5bYxu39KulmY1neAmZizqUXzz1cUS9e+VzxDxE0ci4tyVceiN969RO7S0lUFhEGiw/y1T1CU6Y3PoIgrMo6xA6MJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iieEQoCz5ehjLsPi53n/YzanT2QOrhkOg4BiEbGx3rw=;
 b=ndCIOjK0tNgJyegeVG+84g25LWeIxNyJWbC+7gcFM/NshukitRjUxD8aKj4TbaNrjYz0h6eA5padVIXoe7U0sd/sjaFow7npoIqDB30r2nXCmkOORiC0ll0OcntCYvlZL1hbFrb+nn3yeURc8j4xoy4ssqNWUeiy1gZMWEntxfu0erSeLe2tqWyXsP80xjcT24ba0QTGwUfIi14n7JwQ3smdCUPM5AnK7APEAhbBQuNdeWC9OSNaCFGJjuxDilzX0pxwRQSRXPeBIPt4IB9COd1edketSZhWMjcvqXbY8LffWxNlbcKnvDcxkj98GwjRPh5gLp5bjTHrI763AlPuAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iieEQoCz5ehjLsPi53n/YzanT2QOrhkOg4BiEbGx3rw=;
 b=oerJuvqcafdJHlFbPtxFxF3eObebg+dq5XYgUIm7yvcCw8ACHXKghnj9o3phgmDAb6C6LYA9vxJ9W/e11mJu36aVAsnUKUNQINC3QG4iMkoJux/2ZgxSC0gjLWu06Q7k/qlkGk6KfUK1tKUhnvXSR909hkvimU8MzII4r9kXYEPIRcuhRpRxd18FKmy7lDEExUxl2/IkAPoHpTKHR/O2bqvBYELJa/EkPqFfp9IPWH7MpHHFpj+D69Nl5das3TuebQB0rHymzy6a4pTPN6wo4uTRv0wu6esr0jDqn8Iq11kBpKP5d5fcJEroG/UiAy80Rev0ewBJcZdtNuhG27nh1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BL3PR12MB6545.namprd12.prod.outlook.com (2603:10b6:208:38c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Wed, 4 Mar
 2026 01:43:25 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:43:25 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 04 Mar 2026 10:42:21 +0900
Subject: [PATCH v5 5/9] gpu: nova-core: gsp: clarify invariant on command
 queue
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-cmdq-continuation-v5-5-3f19d759ed93@nvidia.com>
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
In-Reply-To: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0183.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::19) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BL3PR12MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: ca73fd75-e7d1-477a-2d47-08de798f6d34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	V0uNQZfCJJi2Bb9RpmQ+zNZ6MZkQcwEblVQxT8XLDIAqg6b6+JlVvxskiW8oQTr/CiHiJveGZwXRncTQi4dnmkYvsoxWBc394OQ//9DLaXvJgynXeiQ/WR7GLBBjW+FILL841e/f6hDZDQ0rRs8r7W7V/4rtej7KDj5FoL6KLGkkoZn3TAz+2Ud7eY4Tjjt7ctXYoaekBkIQP4ywwHsxYa5oEzu25QHlJpMafPTlV05BLJhPFcVKE+Go2fkxhmYF3gD2o+V4RawRz5DvR6whFjFy15qz277sI8veDjjwEXADSj3+0GGgmyM6OKw77iN9mW5/wSDC/+TfhD1T+uvSbp/w4FCkl4aCKYA8DbtdV9wwhNLDZV9v5l70Lzqgg2W604kwoKa7sunG72vOE57SyA5q1+LoavrEKnVnT8l7u+Qf3sKfv76gkBThWSTvQB3PPSxifQyCtRMERS5xvzGfjg5g2aHnjDWNUfdCXDoeLEF3JsSJ/BkptFJlq1bZ2M71o7XZKThRfCJec2jLoFDLQ0LIj/V/PRWX2ObUfH04mYXdRhIWEgWsH1ljR3hm8ExjcDnt+3gTBEz541cypURiNSJmCONKiQCCj+nYcoLuqxboC7SL5i4Tb8Hm+fPWQrEUVtCCdi9CQ2bfgF/z+wD1AZZQ+gzNOb15axX/tPMD0LyrUf9haJpKtqoM7LNGoDVnG9ybTvOjhCleQbuHU5+Ycqzw3k+lUW0BCa0I3cMKZaFlfcEhdz9D1YH6X3+K5dOIC8yLpDHX/+JVntP1g7IRDA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXVIcCtBMTdKVDVSZXBTY0taYW1Va09uUGZleGM4RElCY0lJbm54cjRIYW1S?=
 =?utf-8?B?WW54ZmFZUlpEcUJpN1dWdHRSTTc2N2NsWDByTk9YRFZ2ME9wRll6cjV0cVYx?=
 =?utf-8?B?L1A4MGNrdDR4NXRneGl0a0dnQ3hwdVhqcmxtODNHRU5JRVRvL2tUWm9EbzVy?=
 =?utf-8?B?SVU3cVF1ZUlkNlF4d2RWTG1qSmhYRXJWSGlZU2ZLK0JqMnFxeVF3UXdtVm81?=
 =?utf-8?B?SFo2NzZsTnBZQWd0S0R0R3ZVNnhSbGdwdEJ3OGQxVE1uTTROeWVaWGdBK0do?=
 =?utf-8?B?bkxiTE84elk5ZnF0VzQybkZzT1ppZjgzUTVIZmFBWmZ1UUEyWGZ6TVpxbVMw?=
 =?utf-8?B?K1ZHazdxY1NzbVZmVDBTdDMxV3M2U2NOb21TMWJNMTZGM08yYUZ4U0ptVXZl?=
 =?utf-8?B?YituU2Q4M292RGE0VU8zcjltbkI1Sk5JOHBPS2dlWXJoSlNWUjlOMnUwL3Vm?=
 =?utf-8?B?N1g1LzNndy85dGdrSzEweFBDeC9pb1NoOXZ3dklJdEF0bXkvaDJKdG9jUEZx?=
 =?utf-8?B?bllNWjJjR2xoS1NwWHowR2dGNzlwQjJoNEJpbG5uSE82T2VhSkVORm14Z0RH?=
 =?utf-8?B?RkpZWDc1UzZzY3pzRlRPVEtRcC9NRjRMUjJ6a2IyNXMwVWhjWjA1RmJ3MTBV?=
 =?utf-8?B?bE1ia2pkamVDcytjNk1XdVJ3VU1aRDBjdUVGSlFtMnlOV3pnVmNYalJDb0dh?=
 =?utf-8?B?UnpYRDB2MTVJYTNpeEV4TmJjY3VJQkZlNkFYZ2hEcFRKdG1MRERYTFMrK25B?=
 =?utf-8?B?RGV2bXBzWkQybVFxYkpwTERnWFhTZkExbzdma2hvRCsvRzVxcU1FVDhKcEZu?=
 =?utf-8?B?NTluWlk0dE1VeDBRcHVqVTBwWCs0Ri9Pa3VieEtvdk43R2lxNlNzbXlvZjBn?=
 =?utf-8?B?NXJvdHBuNDJVRXVHbGlVT0RnTzdRaW13aVE5bmkzME9rOEVjc3NjYVh4eGF3?=
 =?utf-8?B?alpLYTJ3TFNvZEF1WGVjbjNtZEhDblNIQklDU0JVcXJBL296ZFJMSWd5NUVO?=
 =?utf-8?B?TkRwNzVJMlRVZ0F5ZnVlbHlkU0RWYVNSOTh6a2dzdUVqREN2N1hJWjVhTU9w?=
 =?utf-8?B?aUJyZmU4NDNWKy9YYy9EYjhXOWhmdDZJb21nSFd4YXlYMTlmNDFJSHJPbytP?=
 =?utf-8?B?YS90aUR1QkpCN0h3UVJzbkhwamQ4V2MvZEIzTGx5dnZWRWpwa0lmVnpPaC9s?=
 =?utf-8?B?eStkWHM4YitnQmdIUExNcHZieEM3TG1ZRStEc2xiR0FXSlhVRkNlTmUrVXo1?=
 =?utf-8?B?SFRlOGVHTzJGWEQ0Z1ZzYXZXc1liY2t5TEVWQkdpYnU2MW96d2VIWDVYcG0v?=
 =?utf-8?B?UFNNOVdlY0x2dE9HNnZKR3R4dnVtTGpoNFZrTGhYYlFzOWNOVHNmc2toaVBW?=
 =?utf-8?B?L0VCRnlPcEtINHMvUFdXaytjMURaNDV2V0I1L29qd2laeDFHVEVHeWQwbUgz?=
 =?utf-8?B?eUFScDZjbEtJVE1ObEQyUGJYZEV1K0FYT2I1SVVVTVY0UU9IZ2VsY0pJemow?=
 =?utf-8?B?cGh1RGFnRTIwYUJuMitucVMrVCtmWkpYa0lsOWFJcnd0ZjBqNk5Qd2ltdWxD?=
 =?utf-8?B?L2hRQWFSY09TenhXK2QvVnFQbjhLOGJvd0wrWDY5bXluMllFY0lUdlNPZDR4?=
 =?utf-8?B?ZVpsQWtPYk5UbmFlekR4aEt2MWI1aTluYW02Tlk0R1AwMzl3bXVlZUw3VUJB?=
 =?utf-8?B?NSs1bFZ6WXpRYllnSSsrVkNkR3A4RU4rbzRJcFdHZXVrQnpFeVc4N3d4OVJU?=
 =?utf-8?B?VkkvUXdya3NUV2tnRUltRUsxMDliSVVxcWdyR25WaERmREQxaVVvbHNmb3Z6?=
 =?utf-8?B?UDNlNGxuWE1Nd0xaZTNML3RNL3h3eHRUOE13TE55RHpiQ1BWb2luQzlPYTIv?=
 =?utf-8?B?a3Z4VDVySWhMcWgxQ0NkWDhudVpycEx1SHZXVERhMVpiWUtyTi9qZjY3YVRV?=
 =?utf-8?B?b0lsbmcvSS9IZFVwRjNtYUk2a3VGZklTRnp6QTRlYWVBTXFvSzF6UGZ5WDkv?=
 =?utf-8?B?TWJqUTcydGwwRzJNYnNCVnk0VCs2NzZzNk9NZkVIWUNIaWZjYlFuSjhTNDJX?=
 =?utf-8?B?cWI1V1Mwa2MrSGN6UmsrdFVCcE4yMWRmRS9SbXIrdFY1YmdyTFVQZkhReXpw?=
 =?utf-8?B?U09TZ2RRZjR0ZmRvWEtJcGFTbWJqVlV2OWsvTmM0cTNVaEp5eEhzQUZkNXpE?=
 =?utf-8?B?MzdKSTg3L21EaVE4Q0J4VGdMK3BYQUdEVkVjYkdSbGUvajJ1eDBrNVJWK20w?=
 =?utf-8?B?elVyOVdVbmF2cVoxYXEwZlRHQ1N5cWp2MmhGRHZCUm0vUENCdWprczVrOHEz?=
 =?utf-8?B?Q2ZtZWk0OHFvQ2tjeHNRK1JaZmluV2JQVHJhbndtQmlJeEV4QkhTRnN0MTlG?=
 =?utf-8?Q?cshyykxDbRzHhHFJfcfjvAZj3DNQKRfeqkSbofPHtTvH0?=
X-MS-Exchange-AntiSpam-MessageData-1: rUvtAxnT+Jmnmg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca73fd75-e7d1-477a-2d47-08de798f6d34
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:43:25.5253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7NT1kCK50vOCfTOhVn61mGxOlUEXD7/GcnToR0caCuQ7tSktjk0qqpjk7rZ8K6cNtzVjtfB7y67pEGly4pSBLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6545

Clarify why using only the first returned slice from allocate_command
for the message headers is okay.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 73012da436e5..c91da368206d 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -534,7 +534,9 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
             .gsp_mem
             .allocate_command(command_size, Self::ALLOCATE_TIMEOUT)?;
 
-        // Extract area for the command itself.
+        // Extract area for the command itself. The GSP message header and the command header
+        // together are guaranteed to fit entirely into a single page, so it's ok to only look
+        // at `dst.contents.0` here.
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;
 
         // Fill the header and command in-place.

-- 
2.53.0

