Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011015.outbound.protection.outlook.com [52.101.57.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14A4202C29;
	Wed,  8 Apr 2026 03:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775617291; cv=fail; b=hH0JJO3XF4M1LX3Xk1sb/qTp7NMa5Sxud664l/NZGkCxkr+Y1SighAGtci8w5R6VHrmFZ5Sqf8HKAr5szw3Amg+QggVR0sN2g5jxiC+SkCTHw4vgcBozSV+8MHzdlWJPXWzV6tKn1+bptFIm1+i2cjEK81vxn0g5puyyXj6pB+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775617291; c=relaxed/simple;
	bh=ABppPnct2umgiD1emt3jkiOKUuRjLUZo5p8/AR0BWgY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SGFbJydU9+7V2PBNggobDtpdv7+TcDKr9AAVupJxmb43JtMxGiB2g6by0O8aDLw6Mt7TU7Npk6R6m042IoLhMbE2j4eEBQfh8VGDb3CVIsG/t6rStZFpfLDep01yXUS0FpQuYn8fjPA1I/BoSmaJ9quEN33vBQRl9/zyNRBAk9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AWijBxKG; arc=fail smtp.client-ip=52.101.57.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AWijBxKG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oy5m4lkg1pMU6oki4tybDpQptJgt1VLUznYuZrPLJnFpz3M+tpJfEKVM3pCo8B79sHCZZVOm2JToWoQrKAxQpk6jbvSzCB/ZlxXKZtHR9MGHmtcDAkx9D6IlwjAy8pxzLlqor9WOZYtkbX0RGcUWY5zJN8X2S94rAzjfAd2/IRTgH64myANxUTuMrunM+sNff5QN5AJ85bhKcCo65p8ZUl5wKtwKWkV3H5fQf56gcVXtj21LO85AVoa5+PxfunE5ox+JckPefUannGSpXZB3jNqF/JNZtS5tDPsdsbEgJo1oze7CzTU9bIKK50voapydNs96xJNq3w8VG3H9fbXo1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXi19WwaXbi+eDiegPr2iylJ9lJkyXw5HDnjgKjTILs=;
 b=DEZGAqeWmz6EGOW8h5Fv+uUhHhlkK1i8zMYAm260StZUl9fvAXcryW9TsN/R4wKIS2hZiGE48gGjv7dk4i9ZmoGKbqVy6pMZmiyBYlNWintUbRY6TDAyP5nkA0Tp7NbDyicWDWQ6T1+yJrWkouE2o2pe1dLsqFuuNXSfoyUA1VjZ27t4LqcXObroeYpXgHkq+2sPsXbi3nJAxQN3vsprOd9Bz16077zLBh2Eeo9H+8SMGGjb7xznhd/TaAhZvp4sh7lQahd9Mk0gr5aCrb3IAX+65CyfU6cCUB+PEIU2zUjAWcRUMoxRpU3pvrplwgykM/C3gfiWF9wwsOfVAj5wAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXi19WwaXbi+eDiegPr2iylJ9lJkyXw5HDnjgKjTILs=;
 b=AWijBxKGSCYtr1bw2SyZvoNI7qD3cX9onxOL79x2AiIGPC9bShRENRYicZoWTyvIDHNcb4vi+VXidlYgN3dV9G9cRiqIr831PM3R0T9TYvYra1nEQceh/EO2m1Y3G9q/4zJrJMK9Mc6wCObvSF+e/qLczGJRJht0oSZhc+QOAVPV4bzY+KT7R7Uwe/wDXk1zpv7k5HptRGwCn5Lc0FJCQMH89RrkiqUXVuwlaaZFZ7mayz68paGrN5BfZU/PJF2lZ8o3EGFmC3HJfpE9cDesTL3NDCFWC1dlCEmi+7zpwCVrnxpcPb8ew1GwudQ0A0jnP8I7ppFRcE8qKwxy4kGCeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB8873.namprd12.prod.outlook.com (2603:10b6:a03:53d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 03:01:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 03:01:25 +0000
Message-ID: <b916be6c-83f2-4e45-a80c-3d08f3684132@nvidia.com>
Date: Tue, 7 Apr 2026 20:01:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/31] gpu: nova-core: firmware: Hopper/Blackwell
 support
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <DHNEBF89VSO4.258WCJ0M744MD@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHNEBF89VSO4.258WCJ0M744MD@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0021.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB8873:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b0162e5-b852-4310-b4d7-08de951b1ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AXyXeK1ZDxWLnHmWJW+JTF2xATwpYRCCMX7+ZMOafkZwhv8GfDPYObbf5GbBExcvkiE2jIYzOYzjFwkH9/Nc+qOODJhxVKGvkqqEWZL3Q1vJmy4sLwEw6DQ/kLpnrlOmYIi6OAp8rCrAGmg+z3waBwbL/oA8hr4sVqeBJENg35NXGrEUJC72MFtUqlRMJhcjNOpkLj0QX1xU1hgbkLUWpMOCKgyy/t4hU8LN8+kt/JH4U2NT6NxGHT06s90mEXs43jnLioGzac3C4hLTCLpJUc0ghMb4ejMuKZS7srFj0QZzHm+vgPPrkDqVJr35SxVjlzZRo1TDeUCOz067yGsupyx9L+d24no3KfXjQfbDZUxDAsB+gfJRw/4BH2xDK+uqbzA2RbJ/H7rUywWVwo3A4KZgKd9ZWzasNPykVTO19aCICIwsfHeLiLp+juyMdihxyfZsVHS/BjJpVDW2uFn+45hn0l71FYH8/PrrAeOJWs3NmyGpZ7SVPq5ofNXBAUdEUCm4WlnALdKGZtzQFAkLtt0tjjN0bBhzFPpVSwMbSebL3+tsMgDCD5uj797XOkwMZ2AH6bvncraZFSv+Lha78VsGvl2Z1dMpZhwHVIBWLfMFSf0iEBJYpFYXQbRN7Oxog5ZJBTSpygtQHcYdWefnAQhauoO4BAg09LJLEZB4/eguNDxfa24xlts3QhfM+0lvw2XwdO8yJPPLlIFdiWS9eUvLyLtxLS+QrD6N58F0PFM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0RNeXlVd3I3aWNVK1E0RWhZTmgrTW4yQWtDb2xENFRNWGVLQ3JMQjU0WlNz?=
 =?utf-8?B?YndJaHcrNmV6ZTVheFBFV0p1eGZKU2JCak5Fb2taL1VLcFgxS2Q2NGtoeThN?=
 =?utf-8?B?YURuSlFuUFdWY1ZNaWJsS242SXJ1clprN05FbGZzYmpwdVR0SG9MYmFyWm9s?=
 =?utf-8?B?b0pnNnpMNUd4WnRSd3ZiSXU2WFVwV1ZkZkt1Wk5aZk50NTVmNDA2Zy91U2hs?=
 =?utf-8?B?T1ordGtPWTY1QjJ6T1FpWWYzOGxrS1VsNExIQllpUWVHU2krSHIrTjZOdm9i?=
 =?utf-8?B?RW5tVkVkOUJOVXFiWS9uN1M1eUhjZk9pakpEeURpekpQakt5eTIydmZzOFNn?=
 =?utf-8?B?RDZZdXJtZUpoeE9hbkhNbmJpQ3BFWkZzcXdzem00eVZ5YlNoN1FlSW5lYytN?=
 =?utf-8?B?cktuSUFqT1pSekt3RVNpVDhuZlNBZHlVeFpQNUJBL2dXK05TWVE1RTZkOUJm?=
 =?utf-8?B?YWxhWkIvVUxHTExyTGZMcFVkZFBrbStsS1BQQmlGZFhhcXV1WENZelp1OVl4?=
 =?utf-8?B?SDB2ZHNidlJxb1F2ZVJMcmpMNFB0ZlJFS3RhUXVuUXBqcmF2S0kwSllkSWZh?=
 =?utf-8?B?TnF3djlZYS90UEd1SGdMd0w0clc2dTBWSnJGb0NlekxBbGdxVlpHZ0NZRWMv?=
 =?utf-8?B?ZmNCNENpcUZMUFFEWHp1Y3plcVZBdytiZ3ZjS245anJZR0xwR0JwQkJGcGpR?=
 =?utf-8?B?ZUtmdU1QYkIxaGlNMzJFRjRiZFE1Z2RSbWw2QlZzMzBYRldhNzREL2ZvdTdB?=
 =?utf-8?B?K3B2MG9nMkNVREoxbm9OY2tNV01RNFFzM1pJQzVwZjNSVDE3QVpWUTBNYW9R?=
 =?utf-8?B?dHpTY25reXRYSlhtQTBBZlB1UzdOM3hDNWRaUVYxYXM4enZ1ZUx4QVV6c0o3?=
 =?utf-8?B?VE5wWkl1NEZiZm9EbHVnb2JVcW5SeGdaRU84dVFka1hQSHE3aFQxZHkxb0Zk?=
 =?utf-8?B?WEp1emVBZjFYb2xCR0lia0xVZG9PSGp3L25TOWZrcEhqaU1kMEZNTjlWSzN1?=
 =?utf-8?B?bXlJN0FpUjl5Wkw5Ri9HL2RGaWhXNXJOTk9WcGltUFdaQjBNUzAyQklMVC9O?=
 =?utf-8?B?amdGcEczMU1ESWxJM1JYdjMwOUtoRWt6L0ZWNFMzY2QzRU5tckljUTlIeVJF?=
 =?utf-8?B?M3NyQnYwS0hubTZIU25RQzJiR0tEZjFnVTIyOEdIYlhES2RXa1NqTFh1L2Vx?=
 =?utf-8?B?dDg1TURrT1ozYkFMdDRiRXBseVQ0NFFlTWdFNUFvMElMYW1pMlVjVWNNWHJa?=
 =?utf-8?B?R3Fod01ISC9CRFVqbStOQXhXMU54M1JPSUJNcXRNdVlrUDQvK0RmSVpkWWpC?=
 =?utf-8?B?NjU2a1AxWUpiWjRveVI1d2JETll2NW82Uyt0WThkcGNUT3ZKeWZ5S3F3NUR1?=
 =?utf-8?B?UW9VQnJzd3JIaEt4NktnUG1nMU1uaW56ejVSZ1dtZVFIcXN1VTB5ZkxsUHNy?=
 =?utf-8?B?cXRuN2dzbHdSSVllcXh4WG5KTmFSeG9jbFNQQkxkdm9QZHhCM3BiejZ5WGdq?=
 =?utf-8?B?UkI1aU5kQytSdlRQVkFpTUg1SVZheitLOE95VUpoV0hVYjNSVnUzN2tXREN6?=
 =?utf-8?B?V1dDQm5QNElDU2htL0NhazdVdW1iSFM2dkxRUDZtNTE0WWQxVU9Lb1hRc0Zy?=
 =?utf-8?B?OHhySk5LclBrMkJtRExWSVFvMmxvcVVFMTRBU3JGOFMxK1NScStVcklSbDA3?=
 =?utf-8?B?cW9lcVNYV3ZoYkNLWktkbzBNQmJKNVE0cDBacG1kUkNQWnhub3VVc2YrbW5I?=
 =?utf-8?B?NGc4VW5MSjBLS2E0N2EzbTV2ZlBHZWV6L1dTZ1dZMm16b3JmOTJjaWlGbDlX?=
 =?utf-8?B?UHg0K29ZcW1Bb1JjVWZmMjZaeE5zOUxwN1pyK1BDeExVRFcxSzF4K0gzYkNh?=
 =?utf-8?B?L2Q1dWdZaDFha1NBUTJRdGVLejdYMHRBdERjcGNDRzdjTmFZM2pSRnc5L0RR?=
 =?utf-8?B?bXo5MzZ1ank0RmtmWmlLb3NqWTl3SDhiMDZJS0I2L2ZWbmZFSUw5c1RsRzNP?=
 =?utf-8?B?RFIrVjIwaUUrSHFtazNJdmZWK2hIYVdETjhmWGlzR0hERmwveDVLZkR4QzFh?=
 =?utf-8?B?WjN3TlVkV2JjZW4xYTB0L3dCa2l2VWlxamIyUitoeUlnVWNxVGg2ZEJUd0E4?=
 =?utf-8?B?d0JPL25jWWNjTW9OaWV2a0pTdTVhdnJ4RFdQYVAwNGYvZzVDMGJFZStmV2RE?=
 =?utf-8?B?ZmE2T2ZBZ2RXRHluMEY1eVZBRk1QaHJrOUJ5ZGt0aWhmSEpoRGVxNzYwbzV3?=
 =?utf-8?B?QUlldXdHWUR6S0NCZmZPZG1tb0VjVGQyZ1FvVVBiWkQ4L2Z2dDMzWVExQ0dh?=
 =?utf-8?B?MHcrUGMvMXhCL2l1QmlkYUlrdVN5NXVyLzc5T2xaQmJrK1FXNXlUQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0162e5-b852-4310-b4d7-08de951b1ec3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 03:01:24.7683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EtFSnjtH7A4mDVboHgpTQFBtWZIiivhwEYNiFuXIJXVwy0rlSy9St2xtcMIFdkMo430AL0euVUjxe5V2doQMrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8873

On 4/7/26 6:51 PM, Alexandre Courbot wrote:
> On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
...
> A few remarks on the ordering:
> 
> - Patches 2 and 3 should come first, so the code is reorganized before
>   we add the new architecture (and to reduce the overall diff). This
>   also allows us to apply these patches earlier, as they are valuable
>   regardless of Blackwell support.
> - Patch 26 looks like it is independent from the rest of the series - it
>   could have been merged earlier if it was placed at the beginning of
>   the series.
> - Same for patch 17, although the commit log mentions Blackwell (but not
>   the code).
> - The progression of the series is such that it adds new features that
>   remain unused until the final patch which exercices the FSP boot path.
>   We could avoid that by introducing `boot_via_fsp` early in the series
>   (making it just return `ENOPSUPP`), and completing it as the FSP
>   features become available. This removes a lot of `dead_code`s, and
>   also provides a logical order for the patches since it can follow the
>   flow of `boot_via_fsp`.
>

OK.

 
> I still want to dive in depth into the messaging parts, but I think I'll
> keep that for next respin to avoid giving too much feedback on a single
> revision. :) At least we can say that the overall structure seems to be
> converging.

Yes, and I'll also apply SizeConstants to the series, now that it's
available to us in this particular branch setup.

thanks,
-- 
John Hubbard

