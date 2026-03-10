Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012034.outbound.protection.outlook.com [40.93.195.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F5B346E50;
	Tue, 10 Mar 2026 22:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773181166; cv=fail; b=PXx/3fk2gNoO7yVuH2dO/rfts4ugqQsoPzh0Omq8csgHABjIW5ZYRZg3MfenU6R4dSxCxBT1+ILVxg0cIbNI+uW1EcAi5b1x40lXw7STG8p77Wsmu1PMn/iTYQPjHiglvT6X1mlArt1TFP7HdqWiQU7ZAZO2yuuV9GbYD4EQUZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773181166; c=relaxed/simple;
	bh=mKyjS+LUyUdCUakPiOZwaYaSaFqdn0KGcIjWK1Ui37Q=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rQCnbWiPoG1hTKOG7z/fz4eYwaGqbonT9QM1a/9spbIe1wdXksGVdRoTdPKoBabGkZ1ayuR+6SjidaW674+YL6v9r7B2BWuvqe+Kn0iIK/yn/EiZP7Hl5wtGdkT2VsU+wvDn0S46U/viqvw3ncprCrtpJ/wmiT0a13u+xtgNDrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mzGSSzJZ; arc=fail smtp.client-ip=40.93.195.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mzGSSzJZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+BGma2tgXwQfib7FCOndw6/JNVnvrkK2jjJlUy+6UWSxaSNvaJlYU35vx38fzsz+sIJJ2FukAP1mjZDT97ZOstEdZmtrydUXBdnvb/6s8oANtNClACY0kDs0BkbiOeCt/zwcfy3EHTFsOSLjpYl8dsdg/sWq2wKpPDkDT0LJbxp9bflHEKPXylskiXanoBkUqnYm6KP/i36qsmvzQMKLmllM2Bn2Ee8xm+hOaStx4FL/4ofg3I/oPldkGvXRKJOFKF0uihslh2f8rd90i/zLSIoX1kp0xAqT9dU9Kl/TnufrW4Cxn4H9xtN+KTYgmD/F1rVRtdTDr8BjMqIioBWNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SenWlnASjw0InKZ1MnhK0NF9oA1VOJmqswgP6pCIZAw=;
 b=JcOqTtMvTPV4mb4Itsrdp60HJFU00eFtKbdKVxSDiG4A7N1etIYinhxdRt6billm7oiG+aUSu6OuZI3+sNsFwMzTOq9+NLapfld1O7Ep2hW2z+zf5g1v/kuERXjPo5yrMT0nXifLE48AnaAwdHdiwrLEOk6+wW4EIeuNm8Bbz2MFiiriDWfnJo1CuqKqEhFrGNa10M7w/RgIv2cb5cgzbEX7uaU2ZmldvGJ57OZyo7vXznGisLnZREzPWzyzJ4iJ711q02EbAj0QyvtNxZIx6Nn/Kmgmi+JVjhsfC1igy5X6UtsSDtQ4iqNK4+ZjJeRncgK3jYdFklVUJntJ/kxXKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SenWlnASjw0InKZ1MnhK0NF9oA1VOJmqswgP6pCIZAw=;
 b=mzGSSzJZSgJfMDlreYzNzqlwC1FUBSwKFWOgedpt7vRLvUMMg4jPZLl+KHzZa6lKshOS8BRW5UHqtXSHdJcL9fO565iUdGoRgreo2RO0O6E8F6cg8HEzSbATO2BBipdNW0Q+4vOxtIDjoKKc8tkU64h/M/mV645anzBHPURVwrqNbZF0j3HiHzW2kqKdl/bXuHLQc++yr7ANcvlZl7HkIkLapmrbzNr6W4ipid+t2G5oMXbQF49EFEWzqaD4kBctl1pDgc1KISCwxJpuLELXG51jlcYYKLk/Hd8ITUv2p7ySA4zDAkfpgeIojQ1qRK9h033NSulKqN39O4W+QfECfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB7543.namprd12.prod.outlook.com (2603:10b6:208:42d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 22:19:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 22:19:20 +0000
Message-ID: <12a41450-2197-409d-8f14-73ae6817e73c@nvidia.com>
Date: Tue, 10 Mar 2026 15:19:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: sizes: add u64 variants of SZ_* constants
From: John Hubbard <jhubbard@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
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
References: <20260310023145.120037-1-jhubbard@nvidia.com>
 <20260310023145.120037-2-jhubbard@nvidia.com>
 <CANiq72kiiKkK0Q5w=UKNsPXvuuHMASpRJ7KAMy=2908n_u-DUA@mail.gmail.com>
 <CANiq72k45b+famoLjUyk+UFnZbEONLNSgiwDDQCgUoV6U2m1uQ@mail.gmail.com>
 <DGZEBEPLULOZ.2GT5QV8I8VBXJ@kernel.org>
 <DGZEHD0JWHZ6.3HW5U5JTEN9NT@kernel.org>
 <CANiq72=OJfRgJB1fA1T1OkteAzOYZP5OAkFqKV+WueE5C0N+Xw@mail.gmail.com>
 <d6d0307e-4e27-40b9-b5cc-8e488b5092ba@nvidia.com>
Content-Language: en-US
In-Reply-To: <d6d0307e-4e27-40b9-b5cc-8e488b5092ba@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: 3890e975-6114-4ea5-21d4-08de7ef3134f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	svz2z+I/v6nAIZberPPtuZxKW7yFmhvIJAG1487K7OQeVLN83Up5k89MTYWMd9RaecYImhs2/CxhJAxaGlaoaH+a09A7KFpLzX6ps1W4FfyHmUqidF5m7Yifo5hTKxGBunDAt0foffVcKVp2wGCW7oQHHXd582Z0HvLnqZ+4MXhwxT0BoJLwlXUlyoFJCiPyOYtiFeEN9pqf/ODYrn3BIbkAdGbZFakGQ+aTfyTU1/0Yv2nUwe/FBmKaLgdKr/vmWYhG7ygEaQ0FKXV9O/Uh0IKQ+EUGlPvaKjYtEkng8vPawjK/LcPcNUMh6ivIX53qeKIJ5buwftXP6otUjLKo1WpjfrnTQ4ruROXAd2IlvkjUCEYS01TxWFdGLgScEHv9ii+A/iTXNlOchCYPtsYExFYJp8/K0vx/Q1+o37kg4bOoFic2Jo92Kc/1ek3w7Dw+0zPkFqsQh9xEP0mulDYgCXbPVFeQ2r7qFq6cA1Dkrb3gtRWzu1uen8Nk8SXai70ulujSLxhpu6WLrY48ulzjc6Bzx+tXgTuoOED+Dskj51JukfFr2lv0LUNF5lEmydty38zVWYdyZN793q19hFS4BMMoSxD747d2eqUkvwK73W6sD+m6rPyTElDG2y5lJ3gKEv6PJyPDS0kJ18jAMvSkFIqXq/jEnKKKdNhtoKavgZC+BPgX6IjCs2TvyJIsRwHzhXMBmuIm/PEUkr3U48qt+6700PtlYOd8MceW1Ld2ymA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2hxRGw3TTZKMzBKTkFia1BkUUc0Njh4UzNtak91MXM5QTIxN2Y4MkgrQ29k?=
 =?utf-8?B?aDVDSEJ6Z0dCY3FMR2lqY2l6cWVpSHloS210MWw3RC9hNDNZbi9zZmZvS3lW?=
 =?utf-8?B?UHAyWVdsK01XMnBxZForNXpsaE5lN0lzT29Xb3FVY255WHpDVkZsTW1kbDUz?=
 =?utf-8?B?RDY0ekM3b1lnVXhGZFlSN01IMkdEVSt3VjhOb2JKVTlIbDlERkI3REJ5d3A2?=
 =?utf-8?B?UllyM1duaTh4RENxQndiQlo5UHZJczBVZVVac3U0Z0JTelAwd0xMc2xOOC9u?=
 =?utf-8?B?MlZDa0Y0NjFhL1k1YlRCeGZ2OXVCWkZRb0p0NXh0Ry91clNrUUlpYTFJb3Jp?=
 =?utf-8?B?R0huVDh6TWwwYnkvODFmc3oxWTMrTFNWd3pGd1BFSDRzMmdIQW5DQnEvQ01n?=
 =?utf-8?B?L0xVQUtMU2xFNTNqdlEvcmZBMlhBR3kzakJVRGdEMkFYekFDdDZYczN3ZElN?=
 =?utf-8?B?Mkp6dWtvOStiLzd2UzZjY2NFZEZ2N1E5Sytad3J3cDdPSGN0ZHFYV25MT1py?=
 =?utf-8?B?S0wwaDdrTWhaWVFBbDhjYmRRdjh2NDBpKzBtY3lvLzJRcDZHZXEzSUIzS0pH?=
 =?utf-8?B?UDVGVVJXU0tBMlByWEI0VDc5R1cvQ25sZlRmbHlsZmhMeklXMEord0xGRTNl?=
 =?utf-8?B?RDdtNDBXUjZwZUlmV0grL240Z09Ma1FodTVFOU0wRDZSSWthUTZtTG1Ld3lK?=
 =?utf-8?B?cGhpazRLcjZQOStsdEducytOWFMyN3c2dHdveElxV0pocnpoVzd1M1hWNXZN?=
 =?utf-8?B?NjZXWlphWVNuU1VOclExVGp0RjcyaW1CQnlXTnBiMzNwbHoyRnI0c2YvVzJm?=
 =?utf-8?B?S08weFJJTHhLbWJVNWh1NFFPaFhsSHFXRUhmajl0NmovVDJ6eGpZMnhmM3RO?=
 =?utf-8?B?T2JzMEVVOFJXRDZQa3pYZDJYSjBMRGtJaU9IRTJ2UGJpaVBWYzU5YUNSVFFC?=
 =?utf-8?B?RkJsaGE0QmRTdHhrK05TczZkWHc2Q0tUbkF2T01Bdjl5U0cvK0tORVEvdnRj?=
 =?utf-8?B?ejE5VlJVQ0NDL3QzZEJHaE0rVFpHVUpZeDFDbDNZMWUzZU83V1BFWTBoNmto?=
 =?utf-8?B?Y2ZOV3NnQUY4OE1kNGFJdTdRaEhwWHJXeC9DS3BaZVhwRzBEVjFwK3VpczN1?=
 =?utf-8?B?UWtKYllGL3Z2YmJkY2p6bm0zdVBNVWFKUXBmNTZQU01HK2ZYTU11bGxPQXkz?=
 =?utf-8?B?V29IUjRINW1lbUFKTndGVjFyeG56bTNoY0x6VElwZzFrdnVnSnEzUWpNcDFk?=
 =?utf-8?B?QTNjV2pPK0s5M0QyV2NMU093V0E1UzlyL0kwbGZZZWhDL2U5cHhCdFF1bWU5?=
 =?utf-8?B?V08zUHozK2h3bkZ1QTI0VEdkWlk4MFZTMncxamt1V0hyYzlBWno1Ulh0N2lN?=
 =?utf-8?B?V1lQWDlsek1TQzBtT0VaaVpjTGtXaVJ6Y0JYQVpsUUJ0cFpldW4yWnRzN21C?=
 =?utf-8?B?b3ZhcmJ2YklJNEFlL2NJZ2FqWFAxaFhBcFpEMmhlMlpVQmlmanRDd1YxSjRk?=
 =?utf-8?B?cENHeStNVjNZUWhsUC9qZzhnYzBmd3hPK1ovSjB4Ry9ZS2RQRFAyN3JNVjdn?=
 =?utf-8?B?Vzg0K29OU0I5MXdPNzJ5MVVERVVsVk5YZ3A1d0lremh3Y2NGeUZka0ErU1Fa?=
 =?utf-8?B?MHVEUnRMckZTaDh0aVlHRWtIRy8zMktoUmVuUHEzdUxLUkQ5K045Z0tjc1l3?=
 =?utf-8?B?Z2VzWFcvbXFGNU5kSDN3N0Rrd1FFRVVyYU14Y2MxYVRrM1NycFoxL0RPTXlM?=
 =?utf-8?B?aVlGUFNCNWUxM0k1Qzd3NzFIbHo1OWFENi83VE1XVnhSczlXeHpIRUMxNlRx?=
 =?utf-8?B?Mkc0TG9oVDFHbXc4dWFNZzNsaVZWWUVWbWdLODBRQkI1bTRhUXlneXNLU1Ew?=
 =?utf-8?B?S3lOZU0wNWJIZ2VvblB6ZE1PTUV0L1lvYmJnMHE2TEJNc0x4a1hqbUlFSUZ3?=
 =?utf-8?B?Q2pQRzgrVjMyT0pTYWNkVWdMWWtyb2RUbWtBTkdrME5wTndDcFE3NU56N00w?=
 =?utf-8?B?R09xeWh6UHFvM3V1bXM4eFlMdXRkT1hCNDZqSzhnaERaUElMQWxkMGtPNEk1?=
 =?utf-8?B?eWRwaEMwbWxkT2czenpoUFNjUWZXUTNWWXZoSzg1SU8zY0JDN09yVHZZRUw2?=
 =?utf-8?B?aVBXa1NqbkdKZStENURVWmxMV3ROUHBoWHJGSnJnQnNuUm80dEwxVkV4K0lR?=
 =?utf-8?B?K1h2TVdycENtMFNvVkFqdjJPRnpWbGNMb0orSGplZHBCZkFnaWFLKzQ1cmlx?=
 =?utf-8?B?ZWJ4dU0rd0cvQkR3YkZwZ2p6NUVBeDA2REpFUnlDT1NNU3pyTFJoUGRmOHpT?=
 =?utf-8?B?VXZWM3VCbERzdlVhY0p0M2E2NlB3SzBuMGZkcjQreFhwRElpeEdKdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3890e975-6114-4ea5-21d4-08de7ef3134f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:19:20.0769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2/xS4pco4NIb/7PmiEXLTuCmh6xlvcYWnadJI22CZ2UV1fR3X34hL4t1RaQ8m/OYGGBfNxZCcurVZiNWCu2tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7543

On 3/10/26 3:13 PM, John Hubbard wrote:
> On 3/10/26 3:08 PM, Miguel Ojeda wrote:
>> On Tue, Mar 10, 2026 at 9:55 PM Danilo Krummrich <dakr@kernel.org> wrote:
>>>
>>> Forgot to mention, the background of this is that existing DRM components, such
>>> as GPUVM, Buddy, etc. just use u64 as a common denominator. However, this
>>> becomes annoying when the corresponding device is u32 (or even smaller outside
>>> of DRM). Because then we have all the fallible conversions on the other end
>>> where the driver interacts with the HW.
>>>
>>> So, on the Rust side I think we want to abstract this, such that drivers can
>>> choose the actual device size type and the corresponding APIs just work with
>>> this type and store the actual value in the backing u64 internally, but hand it
>>> out as the actual type the driver passed in originally.
>>
>> I see, thanks for that context -- yes, if the types are different and
>> known, it would be better to abstract over the right one.
>>
>> (And perhaps it may even make sense to use newtypes too, depending on
>> the details.)
> 
> It might. Because GpuAddr is a bit vague, whereas FbAddr is always going
> to be u64.
> 
> OK, I think a define_size!() macro that implements a DeviceSize trait works
> here. We still end up converting call sites to use sizes::u64::SZ_1M, once

ah, correction, make that u64::SZ_1M, when DeviceSize is in scope.
(No sizes:: prefix.)

> DeviceSize is in scope.
> 
> And then later, one can build on top of that with things such as
> <T: DeviceSize>, and such.
> 
> I'll post a v2, assuming that this sounds about right.
> 
> thanks,

thanks,
-- 
John Hubbard

