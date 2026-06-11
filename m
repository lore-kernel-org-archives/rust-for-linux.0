Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010042.outbound.protection.outlook.com [52.101.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16368360EC9
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 19:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781207544; cv=fail; b=u95H/9YpIbsjliy9gGJXn4jeO7GLbct7OjEM4R4cwcYg7V9oGF3EA8VnCNpn2Jx4d+6VxZcZh/FZFYR1NCkCGZMy3a38Hg7XM9oUPvMfVXG64jDXsWldUndS7BFG6zvsvATfw1a1MLULLOBMo7bXc88ZNajIGHTrg0u7RyAWl7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781207544; c=relaxed/simple;
	bh=LJ7pJKVCqUZGecqqhdrwygvpZUsveFmg57oIwYxRHUo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fzW3E270y+KjhI2+Qr3D9xXsmkCRKrINOipVr1Ur9G6B+07OPm6KCPwhEq9PCYG6oVNixzaUwVd/f4tjcdq5+ijRb8iy3SKT9e+bzYEimUOBlrjmWrFbNnAqALlTlnwJK/qHrv1U5mxydjG0M5VKwUFVkkp6V8RZBJ6YRbRZ3hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SCmLDy5b; arc=fail smtp.client-ip=52.101.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SCmLDy5b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBkiDhJo/dcfgbzjaCzh9wsixdL3sbNWRJlqI1xrI2aceW8Quh1EqF6ZeL6ggrk70pG7dhVhu67xCv0BEUGE6TfMcOJl/JsTuXuIcucXGYIeAnG4H1AqqZOpMfB2XDDsYPW5YhQlUxxt3BIUrDq9t8p2p0RA/ZNJIew8onHArIhYsH1Q5iK6oHvVBol3KTU4+BF0DnSx1IO/YF6ZmEDm0MHyFpb4WS8pEV8SKrxk+N0n7UZZhOTep/PT5f293YLpeEAO4K8YHVgewr4hEB+lKQO2qgAh3JYeliKaNOtKso82BIbBEn3j6ENPUcodw6RZ2eLB4UsH63leasovJMnwcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+JdwPpKaVYO//CpAwyBsZRQG6IDyR6hwy6rJP24NiY=;
 b=mMyHDNiiiUCc9fppkm2BG0zB+J6QBvp92WHg1gvkE8B7Udpba24wMsmywHuHDHDYJW4LiLbmwP8qEv5yJg8ZzZvfH9cdSDV0bq+Zfjxo/OFz7FK2foOZ+E2x16m5jlbwssS+t/cO8dOY62uXyaaizG7uXYPCU6IektS6egcYEzjgsmFzS1t3eTuzcsvPNYGF3mXJOxYuXlxupUPSrIssO3XK0L3K1fucqdCSJU/pVn8tBWbfhkP8MvH/uGVHwD6ZliPIc8bZxXIDCblq3YUt3sLJlCkr0HpbC3F9SQqTlpihO4TZe+Vl3X8eb5lO288mZPsuN7YTlXH3Lwpqpqx53A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+JdwPpKaVYO//CpAwyBsZRQG6IDyR6hwy6rJP24NiY=;
 b=SCmLDy5bfPSI9DmagvR41rxtyup316hkaD+ElTfwUkKCLKSdXY1sFTWcPuP8AlZtLYtSRug2FVCrkphcsl2obCI+WCdCIuimZysBWyEIabySbc+e/58iewHI7B/YOK0Qm2jRM7Xc+tYnjK37L3VwDgdEU5Tg0oqk1KY1nbRCHqZdXQj+344OUi3QZBJaf6LSnfE+oZXbmZW381mFnXfJnJSYzciX7iOqCo/bOTMtckWRvEOriSdfBchMkBMtLsplwjBjjJFEZ9f5tFBTabvzFA6y2GMbD47DYUKwCMDKbC2dKtumv9Ffs6Rc/Jfe6R2MT3BAzxo8iO4hqVXf6JVWRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB7529.namprd12.prod.outlook.com (2603:10b6:208:431::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 11 Jun
 2026 19:52:17 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 19:52:15 +0000
Message-ID: <d61b8c75-d51c-4537-a73c-001541bec786@nvidia.com>
Date: Thu, 11 Jun 2026 12:52:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] MAINTAINERS: add Alexandre Courbot as Rust reviewer
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 rust-for-linux@vger.kernel.org
References: <20260611055538.61425-1-ojeda@kernel.org>
 <20260611055538.61425-3-ojeda@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260611055538.61425-3-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0157.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: 214a3ee8-52ad-476e-f081-08dec7f2efd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	1gZ7QDCDR0WSVl98r1eHs/E5IvZHBZ+VBM7RbsGKusnLkY5je3ELdt1yJv+NODje+4ZhYYFY6o0BzTJdJoO/dl18iXxNrYAXi7GqkzAuxb3RbuYRWptIj3jQojE6ErwvFxZ5GcCVKX4dYrBFsSc9N+0g28EG1VYrR6dKkXMk2wRP/FKC9Pa3uhjRl6fcbXD7LGEEnGETrYtWLH0TKB8YxjYBn7QVImEO2Q/ZZFeJTduTMXSkTwbPUU/ZJIXHcYTFj3rP0w0nq3zs2saU9N99I1djtnSlF9fYpJxPX8NgYxK36HEwmexiAWfVpRzjyy/iAYxzdVtnY7qb1kpnFxGI3MNRVUzDybP+g6X5qWny4tM8+gVRdQPGBClfgD14etTSoYf40Sd8zEOESiU1zkKY+6v1W2hO/mp05ku8Pq/neoXwRiatd3mopfro0BvTjLo1fxiZOiaElWM+CoQPLpwwkCxpV96uxAMlxNr/he8eDbbKt5APpfjzIBUW3O4oW8mp+wzh6BpThctp1kmXmtPlR4pzY8yR/nuueQfYT5+PZihKV9245/YQ7NXaH0JXd0Jl9wIHC9Cj5cll1JjmdLR8JYJ0IFEl0x4uLuirS+CNnpQYLoHjRSa+MKHDDsoDcGOlJN54NvkF7+/ZtRRlGNAsmEncP/JfR/Tw5eLL9HMkn75x1GD1bswwoZDjgfj2SlOR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajBIdmRNVHlnK05yL0Voa2dWelVRN0VHUElzK2htb0x0YUh2bkwxWDdrYUV3?=
 =?utf-8?B?dkZyaHBpdmZkSkVyRjErbnpTVjRLMFdiS2d0RzRYTUNLN3Vmc3owdEwxMkwz?=
 =?utf-8?B?R3liMi9qNFg2bWhSa1NmR1ZwemYvSWNSVHQySFNOWFAzcHl4UFY2dnMyUExZ?=
 =?utf-8?B?c014dVZyenVsbTBqNWVzT05rbnZpUi9ZNlNMTlpzdGJYNGREb1psenZiZHp1?=
 =?utf-8?B?NitwS0Q2VzRjNm9PeVRlM05NZUtpTGV2MVZzSWpJRjVLN2p2cTlrc3REd2VN?=
 =?utf-8?B?OE9aVFdlNDVMYzhqMTFjSGlCMDRCTEtFRDZYYUFCaS9ubytwUTJSeXZTM0I1?=
 =?utf-8?B?UVlyUnkvZDVEK3BtNllValR3dGk1b2RMZWRGMkRwK2l2ZHJqd2dPdXlVTm9O?=
 =?utf-8?B?RCt6eHpLb1Q0Um80ZW1WSFgyYjVCVWZzcG9jOHQ5QWluQ0JGSjh3clBZcnhI?=
 =?utf-8?B?VkZFdS9hL0RneElNdkdXejBCRkVpbUpuSm9EeWx2SFBteUhLQjkxUlVSRU9o?=
 =?utf-8?B?bjVhNzJNK3FINmdGd1NQenRYYVhMK3VqVGgydUJuak9XaDd3cXFnajNUT2tV?=
 =?utf-8?B?RTlDT0lHSFdSYmk4RU5RYUFJSVM5UHBsTjRhTUlzbSthSzI5QVhIa0dwV2V4?=
 =?utf-8?B?b1RiOFVIS1oycUVtd0FyQmVvOVdOQ1RacHZJWG1SYzJodGdoV21FNENIcHdU?=
 =?utf-8?B?TUNGQ2JhMXFSNHJ2NlhqdXVGajJaamNZZnl4d3hyTFhOT3dtMExXNWtvNnlC?=
 =?utf-8?B?THVyZU9USThySnNIQmxzbURyZ29HWGE0UG56WEF3d1VlR012dTRLV2JQVWtW?=
 =?utf-8?B?dEZnUitNazdzc1d1Y0E3QlcwYloyVVZ6Q2JTUHgvUDZML2hZWVF5S3IyNlFC?=
 =?utf-8?B?S202S1lwelJqMzJoanVkU2FVT0lSVkpsWE1QM1RLSHBzbitKWmwyWWtkUVpG?=
 =?utf-8?B?VlJoaW9HSVlkenA3L05tWDMzaHRHbWtSL0d1U2UyTUJvR054WjR1UFRGSjU1?=
 =?utf-8?B?RElDaVo3S3B0NmUzUjA0ekhvdFRiRFFrUW96S3pySlhTa3R1bnBzSzczOHF1?=
 =?utf-8?B?UWdEV3FrMHhmaDZhOXNwTXVVdlZaR0FudzZmUHNhdUluNnFTaFNYMEIyNUNS?=
 =?utf-8?B?cGw0YmdOREZNbkJWWlIxanNObi9IQzl6NTJKU09BYlNBUVRvMHN5UG9xTTlI?=
 =?utf-8?B?aU5kem8wTnhxWkpnOXBvdWhQVmNPNjh6U0hGNHNoUWRqK2xkQnVnNWJlVnZw?=
 =?utf-8?B?Z21JY2VmUHRFZ1JuQ1R1MjVDRkdYNDVIVnRnbWltelM0aVY3bE1VbkJNQml0?=
 =?utf-8?B?Snp4MTZBU0czaGR5QXh4WFBQRzhPTTR4WnBWVmlpSS9xMmZIdVBQRTNieDBQ?=
 =?utf-8?B?YTliN3ZlRFo1eS96NkNpWDV5dDJLMUdSQ052NUYxQjNhNEZLQXhRWGxlRURC?=
 =?utf-8?B?TzhZUnUyM3NVRGpaUW9VWW52VnZma0hwYVdtSTRIdCsrcDZvV21QbmZ2WWI1?=
 =?utf-8?B?LzRQVXJidStVeXNUOXo5aG5vcnZQUUw2NU5mUmVSaFBZYzU4bnlPNlZLS3Jo?=
 =?utf-8?B?VzEzS0FiMHBwN0ZsN0x5QllBQi9DWUg3TVhqekFOdWxNMGJkQWlFb2NBUE9B?=
 =?utf-8?B?WDFBZFZ0T3ltamg4ZXF1UmE0TWVPRS9SRHo2TzRWTktiNVhDdE5YdjJEWUIr?=
 =?utf-8?B?WEd4blYySGVGOWkvY3FaLy9HTlpkdWVmRDFxUTNCM05NOGFlZUNEWUpWdnoy?=
 =?utf-8?B?LzF6RWFvbGwzaEhoRTZlakFPWEFUZ0dJcGx2anFGdDY4bU0rYTNldlNTV3RM?=
 =?utf-8?B?M2ZqTkxQNnI1K0Q4YnFndGNNdU9Ub1c3dFUvRk9RTklpaVdJWXdxd3FKT2J5?=
 =?utf-8?B?RWdFQjNaa21nTS95d0Joa0dvM3BsdVM0MFJWeFZ3cGRleW1vTDFEQmlzWHVx?=
 =?utf-8?B?NmJJanMrckxUZlVXZXRNcW0ySW03N1hIOXZDSGo0a2tOWTBKU0ltakJlRU5Z?=
 =?utf-8?B?MUVCLzMzbUZNVlRjVDJ1OFkrVHpCeVZCMnd2ODZKakl6eWZLOU9JYnNNTTlC?=
 =?utf-8?B?MjFRdXhzUlN3T29ZMlJobXlESGdkQ2NPNkl5Tm9hSENRMFRNNXhqT0wyVzY1?=
 =?utf-8?B?azlteWtnWWFuTFdkdEVtN2o5RmM0SUpodk5hc3FBYjdkRGhUaVVjYzNvYThj?=
 =?utf-8?B?RDhvN1VRZU9YM0lSbTM0TmM5SndtS3hEak1vNE8rcThFTFpvbU83MUR6M2dD?=
 =?utf-8?B?a0RpMkxnc2QvdWRkWlJzTDVOSUM5RGh5cHY1UnJoeExYNEFSZTVXalZZY1dC?=
 =?utf-8?B?RFY2NFhORVFNRnJocTBoazFrdWJaV091bm9sbmtzTmR2QmFqMFRqdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 214a3ee8-52ad-476e-f081-08dec7f2efd5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 19:52:15.4440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9W88CZA3JofxeRoLw/TkhNuLN8V8tvAptLbXIObwhOT2s923NJDLr1M3i7rhtFiLDAjp6KLKtOyiUqtfi3UiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7529

On 6/10/26 10:55 PM, Miguel Ojeda wrote:
> Alexandre has been involved with the Rust for Linux project for more
> than a year now. He is one of the main contributors to Nova [1], the
> Rust driver for NVIDIA GPUs, and has authored core Rust infrastructure
> motivated by that work, such as the `num` module with the `Bounded`
> integer type, the `register!` and `bitfield!` macros, as well as
> improvements to abstractions like DMA.
> 
> He maintains the nova-core driver, as well as the `RUST [NUM]`, `RUST
> [BITFIELD]` and `RUST [INTEROP]` entries. In addition, he has been very
> active reviewing Rust code in the mailing list.
> 
> He also proposed and implemented the `int_lowest_highest_one` feature
> in the Rust standard library [2], which we should eventually use in
> the kernel.
> 
> His experience maintaining a major Rust GPU driver and the abstractions
> it needs will be very useful to have around in the future. Thus add him
> to the `RUST` entry as reviewer.

Congratulations, Alex!

thanks,
-- 
John Hubbard

> 
> Link: https://rust-for-linux.com/nova-gpu-driver [1]
> Link: https://github.com/rust-lang/rust/issues/145203 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 813c75e930ad..bf7a7a52e9a8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23395,6 +23395,7 @@ R:	Trevor Gross <tmgross@umich.edu>
>  R:	Danilo Krummrich <dakr@kernel.org>
>  R:	Daniel Almeida <daniel.almeida@collabora.com>
>  R:	Tamir Duberstein <tamird@kernel.org>
> +R:	Alexandre Courbot <acourbot@nvidia.com>
>  L:	rust-for-linux@vger.kernel.org
>  S:	Supported
>  W:	https://rust-for-linux.com


