Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020072.outbound.protection.outlook.com [52.101.195.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD35F3E8C7A;
	Mon,  9 Mar 2026 18:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773081739; cv=fail; b=QikISqwuo5AltsEA6T1blQSk11VK+u55RXxCW76yFdkWFALcNpgOwFoEgI3+LEeSfe7U+BPDcipdGPZQBCrqba17eUpv6/p4GM8srVt7sP4E1F/0MIjAFhEhFl73TeLCSfq0WOIGesMzWtLdk+tb+b7WWDjlcqY81EScS2BAEcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773081739; c=relaxed/simple;
	bh=Bbzp7XQxUHw9n1VMMkoVzrqdfgug2mqVIUiZkZqxYfI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=N9d1l31r2uaNY8yMr2bqCyqFuRnivwozA221ua77xGm3v3Dxpr+5tr82BCU0US7acnInkMtdIHAe60C7S87cBzZCDMyYSsEuek42L3/ooD8BM2/yqZJ/OGLgzDa2rLSUebo2zTkngalrIZp6W1MnlcTK4lgFwrdUJYAuFKycvKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=UOkyvlb8; arc=fail smtp.client-ip=52.101.195.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="UOkyvlb8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPMXVYUy3oCcSHFzU56dVw4+qzae3MvnHSoE8x4dfc/Ul6nVowc6aSeHbOnrIg5KptjMRuLr3Bx1KiyTjua1nqr/lFje/H5pfzzMhWFTyFuzFt8ftzFyo48eSENwWbhNoZrFs1+VS0xEEkchqYwfVkZFbKsBmKM69WqXjyuQi5C+uy64SqhOWToq+vGPhuevi28JXUtg5QjbQD8V9vYGmx+/amoysaa9t5pqF5PYeT/4dBDvsxw8yMiPpNEZVwmR91V1JbM8Hs68AzQXHT2iN48g6KQ9f47Qn1Ynu7bFds8x85o4NXr7GdPDGZBvsg9ofMdfGjjeNLvabssuKQ1C9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0btOUbVFoE+KbK2QOqcG5lh3i+JcmKFH2Vo407I+2W0=;
 b=KArtzElzD1HQaN4Xm2yiFwHpnwcipunEI0WHAORLe9VyqTpKeZzenUm5FP4AhhJHpwsydXAgJtTvE9LCgCH0BjtaR/ZAl1SThE5L+2g5TPrrhKdOkONI5zSZ/xTzllkdmdvtfVY62IJAz6q48jrr0hXD2Z/I18r5zzTYusgj2b+4ChXTy3x3gdIljpFOiaiwFyAu9zHYyEIGgwqMFppbt64NW/AKNrQ1lLSCWMBcRslHEPHM9v79+FU1QucQkz2BnHsi5GdMUjQMQ2vGdD32hqv2kdDeXkNun2k4/5EHAZ88hwV+7WdoF939SArcsJIm1rl+mEzQYQ7u5KvJUK9EmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0btOUbVFoE+KbK2QOqcG5lh3i+JcmKFH2Vo407I+2W0=;
 b=UOkyvlb8e1Twwai3XK6QHGlOBb7gCc+FbMyTu6g6KPafkNcnrAQx6ptaSc1ay7O5gcTfEPvElPJnKT227miHCi4cW6M8TOlvTQXD34bIobvYia2AKSDm9Sv+lGlFSzT8nZAFGwf4f2hhFxXCSByOpIhZygNRevPHE2c4/QFDwtY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOCP265MB8644.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 18:42:13 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 18:42:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 18:42:13 +0000
Message-Id: <DGYH0NAU53UK.2W84EZ63W5ZZC@garyguo.net>
Cc: "Yury Norov" <yury.norov@gmail.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk Behme"
 <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH FOR REFERENCE v8 10/10] gpu: nova-core: use the kernel
 `register!` macro
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Gary Guo" <gary@garyguo.net>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-10-424f80dd43bc@nvidia.com>
 <3f0329e0-6718-4a5a-958d-4a8fa263e879@nvidia.com>
 <d85a3776-4a73-457d-8722-82d8dfc58591@nvidia.com>
 <4f7baebe-e993-40b5-9cb2-3d4699da1299@nvidia.com>
 <fd45410a-43cc-4d8a-a750-6f3211dd2797@nvidia.com>
 <DGYGQ78QQUDO.1TVZTLEWVG6HL@garyguo.net>
 <3212056f-f1ec-4454-b07d-ec96ffeda266@nvidia.com>
In-Reply-To: <3212056f-f1ec-4454-b07d-ec96ffeda266@nvidia.com>
X-ClientProxiedBy: LO2P265CA0460.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOCP265MB8644:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b43228-bca2-48dc-f7c4-08de7e0b94aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|921020;
X-Microsoft-Antispam-Message-Info:
	SU5n5hTup5Q1ohtEYIIQdwptGZlfvQE0psDOvlIvsfIddSQPJThOAKxDjpDuLZBMMH+eoQr2DlklSWr3T+9zuekF7pJeXp2ji5ZI0UXn4JsTPaFD+EO+iytaFiZTSTUCd8pg227Zfny4jnDm0i/H69MULrQxTFHWEcg+52COXdJmjk6xvpCiz2BZitbuXzLWYfdH4ashzT5C/w9ss9NVwzQneSDNPR1hjZ//HmAfsDztRvPx4UlkxpXrxYzN4gS0qLGHwzJsYXSkZ1OgNBw+ino8EO/Ug1+0emGTVDW3hQjQHPGfLyxQkHMsrNWku8UovCLEOx8GT7u+HMhYzZ5sEz31sEzpT1PIEUyJ/E8PcfnPYyTKLarOwlfr5S8aCY2C/niLKZBJVrrpU9aATmoCQhvxsUV8iGvTg0Glr9Y/+bCLVnoXwc3xYOdvjRWYFhObDE6ApLnJD2IpVfw0rNIJxULND3qgatzutn0SUtveY4QLBGzXnn1YmX/JqR2vtN0L99mFKQkSi/EKfLsvQDZrmJU5VMNleuIIm0faJpwJIPCeHP83a4LGFAKoYrzWuPrHZZ54avnUgmdH4w2OtrZt60pKlcB/0Dlif9oRgFct4VhvwrrZx/j/emv7OWgF+UMSKR4jQHRzbAoqYwP28YjgDDt3o6CQZ+tQ9S91mmQKgeW0jp6mTOGUZyu+9PMlwdqdwNYgpdMTGHzQBqk2NZNUS+XBx92+m1/c0odqWvxekEmEI79qHKVT5thzXgRbDiCXsi2vMtg0iCkW3vw478FZhw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk1QNGM5Y2hJcE94TGdLRUlDb2F5YndMczROMHRaNVZ0OXI1aXJSb0MwV29F?=
 =?utf-8?B?dUxSTndJYXR5U2ZIYWhaQ0dJNFVMS1NiR0JLYmJxYUJ3Vk9rNWp1a013NW1Y?=
 =?utf-8?B?dXorMlNCWGtITWxzc1RzNTliOFlaWlpLc1FxcEdRWnM1c1RIQTkzL3BTZGlL?=
 =?utf-8?B?a0xPdm5CcTlqWWhtNmhjenVBcHN2dUFUbjdzN1BTMExBU045S3UwRlg4WU15?=
 =?utf-8?B?dmsrN3JCUFNvZGZvdnhTN0kzeDhZdEZYcld4cEZwMURldmZrdFduZjdLNVV6?=
 =?utf-8?B?WW5xNlROc0huTWxHWHIvd3FpYzhFYVk2UEtXTE9Yd0ZaYTRLc0loMGgzYVUx?=
 =?utf-8?B?S3BUbEkrK3hRZjJrelBDL0dBRGU4TzNJWlFMSnRlTDNnOGR3SkVJaE9YZ3lv?=
 =?utf-8?B?cnpLM0M3VWkxUjZLSHdUSGdpWGlUNkdSRVh0dTVUcStXeFJ5TGZ6TzNsSERW?=
 =?utf-8?B?ZkRqYzQ5YS9jSEJUZnlQL0xUYW1QTUNBdkcyeUZsSFRNTU93SjhNZ0RGbjI1?=
 =?utf-8?B?cVdZYk0walVaVGtETG9JL0Z6cFJvNDd6UWw4RkVXRENoUVBHVXQrYWlDeFlF?=
 =?utf-8?B?MEtHaWFnS05kak1nRFFLd3pIWWZwTHEwcis4bVVIekQ0M3VvMDJOZ3pzaGNu?=
 =?utf-8?B?Vno1NFFudWRqejJrbWpZS2hmNVVlUC9BUU91cjhFMlYyRnZiMEtCMysrZklo?=
 =?utf-8?B?VlFXelpobGt3bjFBaXQxZWFHNmYvaGt0WXpqOEM1SDJ2aHVmSXdxYW40cXZ6?=
 =?utf-8?B?Q0lSbGE2bDg2cTViOVJKK2JpVnVRdzZ2TTZtMzI3N3padlBGSVEyM2ttUEVz?=
 =?utf-8?B?dlVkam9Oa2dQS01QZlpDSnB5TmNyNW1OZi8zM0QzRDJtOHV2RFRvNElndG96?=
 =?utf-8?B?S1pqZ21tVmhvSVNUSzliRGQ5VU4xQ25ZdldlUTFaT3lBdmtKeFJOZU8zcTdW?=
 =?utf-8?B?ajhSVDBjbGdBY01tNFlMYkhDV0dpb2ZPZ0NyVHRSR1RNR2o3UWZmaXpRUFVm?=
 =?utf-8?B?b2NDWGF1T056VEswZHdydVZROFpZZjk5a253dEJCZXM4R2JuSmxvRmtWandB?=
 =?utf-8?B?ZWJDOXYyN21RK3Vud2NaQ2ltYlp5QndLakxYc2o0UHRqMCtLS3Y1QmxwNUhs?=
 =?utf-8?B?UmxHNkRDK29wNkpuWm1WRHVzV2xvaTRMVURSd3R1L2xmYS9ibUxQWk5oWnJQ?=
 =?utf-8?B?cG8zNEQyR3k4anlBZDV5U1VSTUpaUDdjVVpad2pGSW1IRlNydlB2S1lpenJi?=
 =?utf-8?B?UDJrWDZXSnJuakJrYlJlWUhjQzNzd0M2YWQ2OWtUdStiOWlLbExXbWg5Wm1U?=
 =?utf-8?B?UHlJWjRrM1J3OFA1bG5BNkZjVnRCL0xsWEtJYlVRb1o2NlFWL1FWT2dKY0pH?=
 =?utf-8?B?ZXR6allhWm9FN1huOWpFTytvamQ2dkNPY1JxU3NVWjhOZWgydjdHSVpLWWRa?=
 =?utf-8?B?QVA3UGl3LzNuQkM4ZmtlaHFWLzRYbHV6bmozNjJ0VzBnTVJqTlVwbk9zZEUw?=
 =?utf-8?B?eFR4TlVzZFZNTENYOHBTM1NXV1R6NGM4NXBrUW4xOWd1RGRJMnNXbm9Ebmg1?=
 =?utf-8?B?aFRhdytvVkIyeHVpY2NGNVVNQkFEeFRuUEpIMGpRTEsvbS81L0Y3UDU3ZkpS?=
 =?utf-8?B?TkhISXZ6TjZiZlp0SDJxY0V6Wmk1Q2RNNm5TUzNDcFIrTkpPbUJDcUFETSt3?=
 =?utf-8?B?VjUyMUVPbHA0VEVISGNMZlBVc1pzT3RWeFMzYTNQQkgrL2t2MU9vLzlDRjhw?=
 =?utf-8?B?aFBBUUZMWTNjR0hyN2x0QUR2QjRKUDRvaVg5bTU5MnR3d3RDUHlHSExuNjBE?=
 =?utf-8?B?YkpPR2ZJUms0K2VUU1VNVU55K0k5SFVlTDh4bjlKbm5wd25CbHQ0SDN6cVNR?=
 =?utf-8?B?M2RCTTdSd0FpMzBCUUZUMlRGTFdtUFZNMTJDRVlvQUVMcnJSZGtDNHg2clQy?=
 =?utf-8?B?YWI0SkdHVDEzR1BJYkIxa0dRMGtvSnRMaHpMaDdtQlhXc1RhWDZkMCt4bkh5?=
 =?utf-8?B?c2owU2dOYisvbWNkNTlLYW9qSnFUbkcyUDExT0pyRmFaR2QrdExYWmVrUmNO?=
 =?utf-8?B?Mk45VVdTSDdTMWszanBwNEpWdmV5LzRqYnhLSm9oVnM1QVZZZk5BQUpnd1Jj?=
 =?utf-8?B?ZTUxQjJNMUdmc2pJWEY4RkVGUFhvRFFWbjVhNzY1RHNSNlRPWU5NeE00RHlH?=
 =?utf-8?B?VUdrcjJOanBZdnRDRkZpSVRZRWdPTGswaENPS00vSkpyclZNeVNDUmJUWHN3?=
 =?utf-8?B?ZzdyOW5jeTQrYmZrd1RpQ3Z5aThNaWdmcnV1bTgvTWRRd3RnRTAwMjcxbnFL?=
 =?utf-8?B?VlE0ZU1EZVBHTjJ2S0N0dklhQ25WQUhUMUEwQmc5eVBlODVhbmUzQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b43228-bca2-48dc-f7c4-08de7e0b94aa
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 18:42:13.7714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4gVW5nIXK3J/C3FH7Ox1EoQ9AOyqCUV4rV0V/h6ScuZ9UMBOIkRw4fCEuqSMAUBnx0ZKqWqrbVQvhEzjqN9gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOCP265MB8644

On Mon Mar 9, 2026 at 6:34 PM GMT, John Hubbard wrote:
> On 3/9/26 11:28 AM, Gary Guo wrote:
>> On Mon Mar 9, 2026 at 6:01 PM GMT, John Hubbard wrote:
>>> On 3/9/26 10:51 AM, Joel Fernandes wrote:
>>>> On 3/9/2026 1:34 PM, John Hubbard wrote:
>>>>> On 3/9/26 8:43 AM, Joel Fernandes wrote:
>>>>>> On 3/9/2026 11:14 AM, Alexandre Courbot wrote:
>>> ...
>>> What about this instead (*very* approximately):
>>>
>>>    // set up or construct NV_PFALCON_FALCON_MAILBOX1:
>>>
>>>    let reg =3D NV_PFALCON_FALCON_MAILBOX1::zeroed(&bar);
>>=20
>> This doesn't really make sense. What does "zeroed(&bar)" even mean? You'=
re
>> neither zeroing the register on the bar, nor constructing a zeroed value=
?
>>=20
>
> The idea was to separate constructing with a zeroed value, from
> the actual register write. I am not surprised that the syntax
> is All Wrong at this point, I'm just hoping to spark more ideas
> about how to make this clear and nice to read.

Separated construct and write is just

    let reg =3D NV_PFALCON_FALCON_MAILBOX1::zeroed().with_value(mbox1);
    bar.write(WithBase::of::<E>(), reg);

(or `bar.write_val(reg)` for non-relative registers)

Best,
Gary
