Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB01B326952;
	Thu, 12 Mar 2026 00:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773274923; cv=fail; b=CKjoZAzyBbUK+aKSIDZ2vdQ/CsbfxCjIT4pMxFQCIHtuv/X988hH8dkdvEbcfC4AfiZJu0ZllXZFl993MIcyIKuAcr3n+vBSdtO1uiffYjnbsig6UUS65FgN/pZcQ3JTgB8/upf16LgTHm2HyigEGpT7FxB1jlRoQyK5kNXO2QE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773274923; c=relaxed/simple;
	bh=+OEHHMzeKiCcmR8yJ5VJdPUnvBSdt3q1pR0rhzbZIQA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sFo7SuDIW9lmtki7GmWot6m27bkLZm35dZhZqTZIfwUO/LfmKusmgRnXWGW0WCHNkSnm04mxQlFRzBAHLUKVfy72gZ4UOpv4pdvrznyMq5a0A9mGx+/CS58I3Bqjkn0CcGci+q9nO4XiU/Xt4zXJBtpxhUzxPswM7l36PSdYZbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kW55udDo; arc=fail smtp.client-ip=52.101.52.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kW55udDo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nB3KWBeS+Fni7FpcE9n6na8xljXiVBzBd3M5D0UTeaPeJkrKrxhI1FT1+j+jxPiYp5ntHsk4O1yrqyxyN2nrqWalydZodCZ5jxjZ9o16dvu2AFNGfCNveUD4EI0UaVGh3EWRMLFvCYpciXPhxtfDe67Cf8//Px1EsrDSpZbpL/tGh5Z63k+rOKuTWWVpW3KOjNGH+3p5FwEb1KR4ojdGBC8llFl0AKmTURvYHy1NdixSzUObmc3hLW8v+Rw1E4VRP350A7vv6ZBH+0i4MBtX9oktxPQHawp21oFvuUenMrQj+O4EihnL7ArL7RgZadWOMbjluLn2oANt2WDY2+jcsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebLS9HSjf4W0PqTF0jBtX4MyAyhONml88kmCMdMvurI=;
 b=YTjRTbnh3yp6EaWGyGvvi5YXDd0S4Az+RJ8uBdpSdsoBn0BIRbCwp9cMho52IL0Wb9Z9DOZNuuzPC+zAG8E7IUFhTblm+MmuwOJ1WKyFM9VvfeDF6A9W8ZcZEL6+Nd6RsHE+WJnNrEir2bD7f4YGm9nl8Tw3t+YRSqRvjAwmG/xtuAGDTtP99jiFRQtL+wLIqdigqKUw2BaeNIlAqGZREGmi8fsVAmexnbOD1QFcgPrzQjmn/ISjQK2pWSNHmufWCHMUNDu3qpsCFj1zP3pPEH2nvRhCbdMgh/vyhEusEsJHQi0e/e5t8TDdBFk6xbhrnVDFiZdvc+c1ntqNHnlgHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebLS9HSjf4W0PqTF0jBtX4MyAyhONml88kmCMdMvurI=;
 b=kW55udDoOFost9sPiFBQ+Ba3mCsEkVkAbZCVr7CE5rTT0GTitzbncnKz117NXF7hPVd+sajS+u771585n2yhPDsPiJwCmfBjs4d6KK0feEOGrsn/bS3X+0VD5lsVePMjSfEuKiH2Nsnq0ND3V9tjUPFWM1sNPrA6MvuzNfTan0eD9UhMKPjserVMLfkFtlqx6fBic4l0LKt2kwwkbQVQg68nwQlUgTg9I2JU0VdHaj0HCqijP9vi8F7LAIirVQMBFI1m/o4fTTpZzpH6aFHuP8EQLrKgWamO/x1zWnqyMxa5LSBw4jqf1jqI+OX/UNhJaQwt1nF/qx8EZkHHVrFCpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4169.namprd12.prod.outlook.com (2603:10b6:5:215::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.10; Thu, 12 Mar 2026 00:21:56 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 00:21:56 +0000
Message-ID: <1963c84c-8406-4395-80ca-9e4c9416e18d@nvidia.com>
Date: Wed, 11 Mar 2026 17:21:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: sizes: add u64 variants of SZ_* constants
To: Alexandre Courbot <acourbot@nvidia.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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
References: <20260310023145.120037-1-jhubbard@nvidia.com>
 <20260310023145.120037-2-jhubbard@nvidia.com>
 <CANiq72kiiKkK0Q5w=UKNsPXvuuHMASpRJ7KAMy=2908n_u-DUA@mail.gmail.com>
 <DGZSMY2HLWFF.UYKDAN55CP50@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGZSMY2HLWFF.UYKDAN55CP50@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4169:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b9aea26-bd95-47ff-7c41-08de7fcd5e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yNIixSBLTTyXgcxhUnq7Y22slR4PD++eHshqNCEu2VQaO8lkQsSWDE+rvDoz+cdLX73/fc2Yvkdbiq8dhA+zZUjyHqqba87ItAgwke5A1FxrXRENQS8CtRh8YQj6QXK+qszG2XIWew6taH1XCBlwE0H0iBjvpUSESUPd9hRVpD7ugJEXf7Vvdr2zOpV8V89FTzHoEOnZ3S6CcAe/LSYf7VFHwat2kOOKDsnu8LWJoxOmihhPQY3LYYTcUgGJtXl2qo6vqh7o9rWe/aV6SpqyqTZKvHYiUYPIGc8mqHNeeEvbX5l+rIBfu0FHJPHUzqyMD6hT8wJ+9FpskggSQPTum0he2WMUrOvx5ucka3U97AtdSlx2DFGulzuwfAu2lku5Z7oqqX8jQ9Oo8JnGZSK20Vz+MPvK4jrEgcm58KJpKmFVkYnDDFRtUv8peif+IcI7M3pgBeIF6Ewe47qXJNJpX5DqjqLwJce5x7ou0vIYg1vHP/Km6tTe6csJ6GagG6mTdUE71zEXbxDuiB7k9JsguDII38IyrUPNya60KGfmTg4JbyCRF3rMfn5FrJYVKjwhEjMPuh/99BySckBFX6nj11GS9Yb9bxAWyy71DOIQoM6ufM9D8F+JyFgJVDRcqI9Y6xMzGb+E2LX0tuUGBuklxp3wMbWj3oeBR58xFojtiDOy75hW11Y/KkP4KLCTnT5rYHaNc2m8jatD7Tw/eJniIGcSnyxysf/JZ5Q5N5ExD7k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejk5MU13SDN0WUFSNEx0engwK1ZtazRxQ0hGV1pYRlBQNTVTRmpXVU5mb0Nh?=
 =?utf-8?B?K2dpM2tUUVhOUmhtNXVUTjZ2YlRUeDUyUDYzMjU3S2d5NjlDbW8rWnJCdDB2?=
 =?utf-8?B?MG9RNXpVeEtOSFdPU2xoaitDTXJ1bERKTi9OZk93dnVycW5CZFJmTlpDS0lz?=
 =?utf-8?B?eFZ0bHhESXhBby9SSUhadG04bGtXTTg3aG51b0ZWTk5XR1NkNkZQVTFWUHh5?=
 =?utf-8?B?dkVSWlZ6enVoRzRZWmJ3aVBUclZyb3VJTjhaZFB5dko0NW9LaDRsRElrS3Bx?=
 =?utf-8?B?RlR2NW1XaDRqRGFDVGtEbzlhUEs1RzU4cnFvN1VMUU95ZWYrOWkzSmc5cUl2?=
 =?utf-8?B?V0M2V2xFVnoveHlvazhwWmdXVzNKdXFvOTkvUXBNbWJLeWxuSEpYWi9vZEc4?=
 =?utf-8?B?ZkhWdUdJM3c2WmZtOWxucjAyK2xxVlFNUVM2TnJyQnB2djFVRVp4Snk1N2dh?=
 =?utf-8?B?MVl6c1JQYUt3K1NlOFVxeWxJTmJ4c081V3pqTGZ1emcxL3NSRytTM25naEtN?=
 =?utf-8?B?RkpnVlVRRW1ySGVkaHYwTEgvZGwrYVlyVDBrUGxBcEFaS3BNQmtWSHJQTjdQ?=
 =?utf-8?B?ejJSa2JWdXBiOGtUQzBLZUVLSVdmVnpOYUk0OHdRN2M0UHZScmdKakNLckFh?=
 =?utf-8?B?aDE3cksyblR1LzhMMldiaTJjZzRnd3NtOVdadGxHQ1Q5RllieVRETVFwM0ts?=
 =?utf-8?B?SlRCbTJPdDlBNUdTZmNqWmY1ZFRKeHM2TERLTThGd1ZweHJ6QU1LeXN0RXRM?=
 =?utf-8?B?V2VGNmx1VWlYeW1ZUWhxUWJHQi9nbFFWMUE0UmMrQWVBcDU4SVRsYmpsWTk0?=
 =?utf-8?B?d3VQZFVZUlZraHRHeEVuS3BHbzk2QXRWYVArSStVV2VjSEpwc2RFL0VPUnRr?=
 =?utf-8?B?N3RRejFpSnVmK09SZ01QYXp6cExmb1Jmc0UyWkhNK2ZBZ2NqQXg3RjhkU01y?=
 =?utf-8?B?T3dvNnJLK01PZnQvQVNxYXdCT1BCbUVIVk9uMTFvaUNmY2Jxcml0TlYrSGVv?=
 =?utf-8?B?M3IzcS90MWJyMnpLUlRwQldtNDNiajVOK051MStaaElxUVlMWThNMENlclpo?=
 =?utf-8?B?eHp4WlVIczd5WnZTYytoZVBjVCswcHI0M2ZDT1VISzJkZmY4ME1QRjRtc0dt?=
 =?utf-8?B?akdoZlhDelJQWnVtNXRDNlo0Wnl4RUZ6dU5UeVRLbVBlY1h3ektSYlBxUlBQ?=
 =?utf-8?B?cFJRR0lQa2gzaFRjMU5sbk1TUnlGeGl4SlJJTTlPaUQ4eWFTWk9xZkR2ejFo?=
 =?utf-8?B?dUdkWFFRUDYrM1huUUwwa1B4dTBOVGh3SHJjTTU4SmV0d3dEYmVudDZvLzNT?=
 =?utf-8?B?V0NFOUUzM2pzbGVRWFI0SWR2NW5WK1hVdlBnb3lMcjM1Wm5pYVAvM2QydzhQ?=
 =?utf-8?B?bmhpd2pmcW91L21Rc1JWeC8vMHNJTklWUUJnRnhOdmdWclIxbUZFNFlSQmVk?=
 =?utf-8?B?SU1YK2dwdzJnTGVZZzMyNzlYanp2RWxNRUY3cmpOTG9QSitCQmdtZFpVQ3Np?=
 =?utf-8?B?Tlh4TmFpN1U2MTVqYTdMaUZwVmowRU4zZUM4RHVhaFlHNmo0b1dEMUlVclZC?=
 =?utf-8?B?bkZibmVQMHdNL1Y2bkVSZHRrSXk1UGZqNWlJVDQ4T2VXaUhFSW1CRUZOdThu?=
 =?utf-8?B?UXVMREdRME0xUGJZYlFWWHJqUVV3UzRrTDVwZlFOOEFDcHhTWTVqdUZGYmNp?=
 =?utf-8?B?S0sweGxTdDJnTHpwN0FzV1UxWjB1WXoxNEpDU2FuUXJnMzNWZ3JTZVFqc1dk?=
 =?utf-8?B?bnJhcVR1Y241MEpyMGpwUldnaWI2azEvWk14eE91RHlEYUh6cmUzYmNaRFM3?=
 =?utf-8?B?UGlzZDdPUlRodW00b1hzeGRmbzJoNjdiM2hWQVBDL2FjQU1yVXNvS1grcVQ0?=
 =?utf-8?B?VVpNZmJKWWsrTTlGOCt2Qk1hS3hNYmpnMmgyUDFCMGI4WTNMM1BmdVFhYmdm?=
 =?utf-8?B?VFFCdVpXYUE2Y2pCazRsSDBuSWhQQ09zMituT1R0UVozUXJQM0tkWE0wVThl?=
 =?utf-8?B?cDV0K1Y4ajBpS0tiRW1GTWNJdmpIRlovS2xxaXBOZUExWUFYS2lHUTJadzI0?=
 =?utf-8?B?M3B4R2Y5QzJYTVQydU1CeVJRNHRiM0ZuOVVQNWVzMThvMTR6ck1aVFVSc1dT?=
 =?utf-8?B?VTh4bmlFTHlNN3phdXFEOHIwcGdzNTMzS3ZhTmZzSFl2cGRiK0lVOFlTRzRH?=
 =?utf-8?B?NnBIS2IzWnBqdzd1ZTd5OFJNT3E2VnJzVkg5bTZ5eGZCbmRvMExHSVVrRmlv?=
 =?utf-8?B?U3hYL3luanpHdzlieWpVeTBVdk5XOXkxVXEzMitzNnRudldvRk9BRGhlWWwv?=
 =?utf-8?B?UXZtdFlOS1FWK05HS1RhUDBSUEM4SzY5ZlJpUEF4Q0djS0VkdGIyZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9aea26-bd95-47ff-7c41-08de7fcd5e9a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 00:21:56.7458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pMygVmKEo2SfWxaRMHM17tVEun1jK926r4pZE0p0wE5lV5Ofok4FxIMactKZtAe2WiphAXwN3iZe0utAfp+mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4169

On 3/11/26 1:01 AM, Alexandre Courbot wrote:
> On Tue Mar 10, 2026 at 10:51 PM JST, Miguel Ojeda wrote:
>> On Tue, Mar 10, 2026 at 3:31 AM John Hubbard <jhubbard@nvidia.com> wrote:
>>>
>>> +// CAST: every SZ_* value below fits in u64, so `as u64` is always lossless.
>>
>> Nit:
>>
>>     // CAST: Every `SZ_*` value below fits in `u64`, so `as u64` is
>> always lossless.
>>
>> One alternative could be something like `sizes::u64::SZ_1M`, but if
>> you expect to mix `usize` and `u64` often then it may not be great.
> 
> How about an extension trait for integer types with all the `SZ_*`
> defined as constants?

I believe that's what I have locally, with DeviceSize, so I'll go
ahead and post it as v2, and let's see how it looks.

> 
> That would allow easy implementation for more integer types, like
> `Bounded`. Because "64 bit" address spaces are often actually less than
> that, and we might want to work with `Bounded` for them.

thanks,
-- 
John Hubbard

