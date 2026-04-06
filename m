Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011053.outbound.protection.outlook.com [52.101.52.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5152D9EC4;
	Mon,  6 Apr 2026 05:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775454216; cv=fail; b=qK5ikP/krVqHKUckZ0mZpgCPMNhPZSpsppHYkAmDdum/FggXArppCaZCZC+06iOBZ4Mxbn6bA52tMSakLhUSKF8R5qBbSji9QavySwFa+vaPDr+bzAGZmBiYUnpSmMyCjjln7SXPlg2XaKDcGqCvR1MgPpsEL8ODZJCfQCTXW7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775454216; c=relaxed/simple;
	bh=4hVOmfVJUsHtfDIfQsVamsJISWyZ4nmjcurM0VEp2CQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OVIBKihHcL50NGw2W02DUrytKyB8BlIIMPF5eOdB0N0OZdb69pvJM1YZNcsahO/+W2fDvaeUjzsZb+BKnz7zwxEaJ2h1Ec8DkxjCg5M9gDiWsh6kJgF6XjuTYGMxhNu8VASCkyw4/oD8xrDeLECuUbyYZq0IQzEvIb7OUkuHrkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U9TS5FwE; arc=fail smtp.client-ip=52.101.52.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U9TS5FwE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTOUKs/WMNMUnEgBYmD+8hvgRB+wIsPnsRu8K5licbz0GHZj8yNtCrUNU8IkBIumaBkKt5fq+JsJZ5AcXtacVM3XOaOeLf0JYUxyV2O+boObqQTtnNBmVtY6Yk2GVlo7ETwCM+iKwNhYoAXJJorzU+d1q91K/WyzzPW+VFY/t75XxN9DcyoOuH6Ideeom9GmRnij7JPGziTQqaiU3cDGxlHunZxeK8XmKu5nJso0vxVIcs8G/wojdS+vWQGOXIYQgomTYr14IvkdSY0/9gV5jnNx00W9M8l4qH/9aOwNhEowENOC27gca12fFTMDvTanwxsyEgkQPA00io5cfE539w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvHq3S0Iamx7eJP7GQ+7gJLQz6Bjxwy+WJ7Jzf3w5hE=;
 b=mXfVyfjMRUZjUvXHhEYDlNHSzz6F7SqwUAyV3qtI2+W0C+8Y1U45OT0WASRh7kEhlOM6DFXWE9ana34LZJteW5nrJqQDHYjzvKM+Yak+fXgys68rOVaQUH1xkYwc2FlQSyPgdaouMbIU0+mEtc7Gp2Qb/lckjtAGcogicuJlGjIuPRoDNfbzdXQb87iixWYV+hJ5QsDTZYFa826t8Ck6VZp/ewnqJ3Db0ohFLa8x7lsbDT+B3Ibv7OUAsPQpq4rgUZGXNSxH8RmnSe7ZKnvgbF6A4j3jiR4yucMsKp8JOMaPggtbeWurt8KmjD1/uutfhs177svR2B4JcEO9r2Be2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvHq3S0Iamx7eJP7GQ+7gJLQz6Bjxwy+WJ7Jzf3w5hE=;
 b=U9TS5FwEfMkPaYbbqT2Z5C5svRJgHQkrAshbOwXPUAaRIYNFIOVUEtokYLGKt//PneRe5rWSyBU9F+BpBMU1gO1m35D5dXLyWFuZ1RxQXmbGM6K2Cd0LXn9U2QXvQB6h5EyxPkDk1qI09J0y9ONZGhptqzBxGxgUDEhx4SGo/yvLMLAlH2Mda3+Ue/11kglIT+WOrH02AS+Oa8Ulgdi132pBFRR9Won6ZMrGSB05CEpD0hKzV4FTUWlRbzn83J/uC7ZR5gwJVbCisqMwhCNDFfjNzYAXLQX9wtQMLrSzssgz62snr9sg74uYX9torAwa/waWy6iCXENHiVCbc512mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS2PR12MB9712.namprd12.prod.outlook.com (2603:10b6:8:275::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.20; Mon, 6 Apr 2026 05:43:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Mon, 6 Apr 2026
 05:43:28 +0000
Message-ID: <b3961e8c-ab76-4150-8344-69d36161ace6@nvidia.com>
Date: Sun, 5 Apr 2026 22:43:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] rust: ptr: allow clippy::incompatible_msrv for
 slice_ptr_len
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
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
References: <20260404212831.78971-1-jhubbard@nvidia.com>
 <20260404212831.78971-4-jhubbard@nvidia.com>
 <CANiq72nToewesUCDJS=WBKRvCO-obzixW9+D1vH6s9mJXUeO1Q@mail.gmail.com>
 <8d8b120e-be8b-409d-9a40-db0f2aa08d6a@nvidia.com>
 <CANiq72msbAP3F2wtCxA=Zn9w__7bTgUxjjOvS1pR_xOB9pQYYQ@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72msbAP3F2wtCxA=Zn9w__7bTgUxjjOvS1pR_xOB9pQYYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0158.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS2PR12MB9712:EE_
X-MS-Office365-Filtering-Correlation-Id: f34e9677-f064-42d7-3675-08de939f6dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	g12unjlpl5/kzyNIpUvYEROjrH1/bBqI3MXfB3sfgB8gJJK+9RBoUs4c6/ILRUQlIAoBq0vba5CfxXH1fBfIhu70zplw00vaOFZk6/mp7VQ9GAXJ4ICA5YyuWuNYC1D6NyFabYzEgm9bJqUuRyo2Q1hAf2sg0IRLyABxiTgZeZ0XOHFcKj2+G+qb79+cJ2NAVuEUg6vYxR1lehpo+6s/u+G1j6cBNknj1Sf9/9BvLnMPGl8LOQg12JlJElxmvho1STfiXyP47Mj2vM4MheMRyh1opKUKN95byfo+ZVAgJ2yqmcdtBjQl8bGDXprsJE2WMfIgp1PSBf3jNE2SaJ/90ahOI2+omX/gsYTjbyimWGrdTW2d+kyib3bOxL/3XLcy+3bns9opuOsn0xn8fKmQ86EysReOWy4iUb3Lyi0wl6nJcWoOeu1JHqn/VMfd1FNvM3LvlnAkd055k/WkVsNB7Uu0m6fk7JsIojWiKY5v7hA7NYNQmQqPL7fdp4XcL5fj7qgvoiQJhxSeh3nZiDoZ0mehHGZEKb8FeJHe8BkQT6VqMeRUg1xdbcZniXGfHWFEzwt86IjMDmyo7BhKRChdtWGEN8KCCRR/SMQ97UCJMWGb8cfAjyvkf+Ju547pQPzQCNwCUiC7MiTYJzQhujYOBFbrGVrNYi3qNXXNKEguxlaLWkg1R5wpfGF8oNwkn9WYAAY2XBa6YL3bErediQSlTXVb+QIW29c4t+qsc/6163E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkkrUGREQ0dub0psQ0VSU0o4alducXRnVkNwdDdMbUExSmhnbng3MWpTOFdS?=
 =?utf-8?B?SnlvaEltVHUwU2NiT0R1UUwycDB4QmYzUHJhc293QUN5NXNNUHorTEZQQlp2?=
 =?utf-8?B?MTdKUUFpK0JsaE5zQlpBWkhOZkdJNy8rZ0dyMEhhQzFVUHNjR1dZZ3p1Z2ZI?=
 =?utf-8?B?VFg2cXlScVppTnl2Ni9JQThkbFUxRUhRbkw2ZlpCK2tGYjNxSkxza25mdnRx?=
 =?utf-8?B?Sitsc21lVmQyL3BZSFArYms1eGJIdmpWWnRUNjJrOU13b1VuSmtFU1NKUHY2?=
 =?utf-8?B?WkIxYTBTMXpRZmlEdThnK1AvRXlBbk0xTmtpS21pNDVBa3NLVUhJMmtHaWhx?=
 =?utf-8?B?czZxSHJHMGlRek0xN0ZkU0hXUkhHNE9wdUlnTnF3MkJxZWhXdGhXbWJnWG1x?=
 =?utf-8?B?bmNrbUo0czMvRmg4SXI1NWcvK0VrcEZDc0M2UzQ1REZQTGxWdXkvOUdMS0Ur?=
 =?utf-8?B?ekNhVm1mNXFlQTI2T3dqRDEwaC81VmpHb1Z0dDNyR05jWHlTRTBoQ3ROdm1q?=
 =?utf-8?B?dmNpTDZrc1l0aWc5MGxFd3JMMDNhWUJhb2FOVnRiZDZ5OWxOWThRQzBmREZi?=
 =?utf-8?B?THZPWk5McGJaRHozdHBFVWNMbnMyZHJVN1JNN01IN3F0d0ZyZGJPTHRSUEh2?=
 =?utf-8?B?RE1TdllZdU5pdVBCSUhlM2xpbW9hSWcrUkhXMC9GUzJiWU1ZOXJ5Ry81TGNr?=
 =?utf-8?B?SGtZZ2E0aS9vMFpxVmRWanFzczNRVkF1U0MrVlo3U2dXVWJlZmNlcUI3emM0?=
 =?utf-8?B?RUNZVG9jNlRVM1lDTTRBQXB4TUhhSjBiZ2VWQ1R2aGxxYTl2OU5MUXFyNTZH?=
 =?utf-8?B?QWl5NVhjME1udldzS2dkbFY2aUZKL0d4cVlqOEc0cmg3S3FONWtYcGtQcnBD?=
 =?utf-8?B?cGozUTFwejJEdnpzbGZNNmh6MUNhRzBXaXo2cW5PL0lrVkpzdi94MW1WbEF0?=
 =?utf-8?B?NVlPMUxwMmJ4bTBNZTg3Z1FwN1RKMjVXUFJUK3czQWNTbHV5YkE3L2phdkN5?=
 =?utf-8?B?VUFyZk5sYWdUajdFSGV4cEhBYkVLMWV2cXpLOE5rRkJKZWJyeDFzLy9RRUNz?=
 =?utf-8?B?eVBtOCtFeWIyanB3TjJXV1kwV2NzcmdyQkw2enE4ZlQwcFZPSm1rWjErUzcr?=
 =?utf-8?B?OHRyKzhsOGZEOGsyVlM2bXgxY2xMT1ZneEw0Zk5GT2hBcFBpOGtsU2pUempx?=
 =?utf-8?B?ZlpmY3VlTVpjQzRyOElxWHYxS3BoRFlDaDVhYWxxRmFMdXNNa2lCcTdoakxZ?=
 =?utf-8?B?ZFJPM0FDZjhhVG80R1NKeUJnempSWFl1M0tMVnYyM3M4M05vNVlRNjBQcTkz?=
 =?utf-8?B?NkFuK0pva2lySXNVRlh5M3BuTUVHR1VSaDMvYU0ybWdLVVBDSjJUbnRDczh0?=
 =?utf-8?B?R0dPMnpKc3Uwd2hHVFFFV1A1WXVWT2RLR0p1dGdUTW55TmJGSFN6OWxUQzFT?=
 =?utf-8?B?TjRlWC9nckI0UGpxMUNEWUdNd2dVQks2bm9reXZOOGtpZjc0SzNmSHlVTFRu?=
 =?utf-8?B?MklJYllUUnp6MFYvbGMzQVNwM1UwK3NHOUMwOUcxQUF6RDZCaklVR3dTOHdM?=
 =?utf-8?B?dGlhUEsxYTcxMVZianNoRFZNcHIrUGR2RmtkVWQwRXd4bEhsQzhqSlAzN1Fj?=
 =?utf-8?B?cm5PMy9zZmRQRWFZOHZIODhrZUZsSy9UK3pCc1VBajg0aU0zVG9iM0VtcHFH?=
 =?utf-8?B?MW42WXE4WjFzSU8zRXZvNExzRGFYN2R3eEhPN2dQQit6bzB5blZTV1JaVHRU?=
 =?utf-8?B?MTIzNnpBbWJEL3N4NVB2QUF2S0dVQVVqQ3NENFdnWHB1VzY5VXl0bFBFcHB5?=
 =?utf-8?B?TlBKRk1Ib016V20wdStKZ29NNDBhUXU5amo5RHVBdGI3dnY2N2JDenpCU1Q1?=
 =?utf-8?B?N1RZRjRDYjNmQXh2NjNLSjdjTGZaT2UxM0ZmU2s4SEdrajJmK1UzV0FCeE9j?=
 =?utf-8?B?M2dMM3hyNkdkblM3amtGaHNJYlFkN0NGR2tSemV6VGFxRlVLMGpLYW5HYWtM?=
 =?utf-8?B?Q0NVNFl2YUYxSkUyV09obFFyczhiVkloR2M0Sk4rNUswekg1ekVyS2FyZnl0?=
 =?utf-8?B?cXBhNm5WZHF2Q3A3SWQxQlA0R01ZZ3RyN3VNZHFSTEcySzcyeVN6a3NGZ0ds?=
 =?utf-8?B?Qzd5cTV6T1piOHhLMEFHWkF4SUpmWWpFcDRUK1dOWGxwb3U3MXZMM2VWQXlr?=
 =?utf-8?B?TjlYTnNWQytoT01qRWFpdjNYYTBENFBBMlk1SzNuVHR3aU1EZUJzTjJKRHdO?=
 =?utf-8?B?YndnS1FyOXNyREtYZ0YxTTc3ZVhGSWM1U0F2MDlNbmxSWmlrV25xSUxLYm5x?=
 =?utf-8?B?cGw5SVcrUzFNL0VzZWpiTERYeHRNK1lORXo3K0tXL0dqOW8wQkpkZ2E1Tzlr?=
 =?utf-8?Q?8XTtYP5cAFm4eezc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34e9677-f064-42d7-3675-08de939f6dc9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 05:43:28.6387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bt9uMl/Ll0y/NoTAHw11asz6pfD4BbRiM0B62MW3yYZd3iXl9zwdZKnbe8jjJLJxkyEiKuWeKOz/It6IwO9Hqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9712

On 4/5/26 4:22 PM, Miguel Ojeda wrote:
> On Sat, Apr 4, 2026 at 11:49 PM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> And that bump is destined for this merge window, right?
> 
> Yes, but I already replied here to this:
> 
>    https://lore.kernel.org/rust-for-linux/CANiq72nbHtFpqgC-CGyLULSH9C90U2bw7bmovscqffd4HP0Oxw@mail.gmail.com/
> 
> So I am wondering if you meant something else in one of them (?).
> 
> Confused...

But considerably less confused than I was, when I wrote that
second question. haha :)

Anyway, all is clear now. I was a bit rattled when the new drm-rust-next
presented me 7 new CLIPPY warnings, but it appears that each one has
a resolution, so good.


thanks,
-- 
John Hubbard

