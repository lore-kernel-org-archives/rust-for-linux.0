Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022079.outbound.protection.outlook.com [52.101.101.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C68B315785;
	Tue,  1 Sep 2026 00:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788222136; cv=fail; b=uHxyOnjl8NxYLeiXJuyqk/XXBrzNmpqIATZgzxj8QUoX94jc6Z4zXZ+Dzgy+mw1HUn5VAVOuyrE3Vu/1LKFZ745jguvuVBu2/ybVHc4z15K2JmArKWn3toBXbiaw8yugiVdEEwH+Cc03YMlek3a3bV8Q7zqC/3NdAwxK8cBBOIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788222136; c=relaxed/simple;
	bh=neR+xuyZpAFzg63ipR/KHZJu4WcHYrEYYcT7Jgo+iyg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=pCOOvPZ+aOtK/0bzjeLN8HlOWVlEc7wJVVsRbHL7Ft+QMcVqTvhZeLT1YMk8DmHY4spi4uqcpm99zKPpnSTBgXmRSsNEo2c5yXC9KmYxEP1ey4WFUoW441EszvxoFajzZCToE9pZ8yf5TZ9T1uzp8WvWKKrgsnv4ySeaRQJuXW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=xz9Sy8CC; arc=fail smtp.client-ip=52.101.101.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="xz9Sy8CC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7J3oal9JkPPeieDZ548CXvUyl9vJGpWOO6wzLRBKDfHu9jG8xbhc+By5x1+p8K7IxUdp1ba4kcrUKEhGvyz2kkBJHW1ia5vfT5gRzLoUkNrDP3J58Q8K6H4JH1uGE4gDZuVcncnrmbdB2ocGRKBWNSzxbqA7HMpWAVC0Zgmwpi0TW8+/ZQIrX76DVBsB2ecn2/yqp0cqOr+nvtbdu6KaLAeHXT5TCiG3ycJyoxhEQJTZZu+fqW2dTCJUW+B10HqRXsZqslGRBiM3wcxDRO5SK+Q6g1c0NYHgjuXdpSDzC8f4m9y+4MNzFMwV0j8bqxxDkZLsUBj5kUuegt9axej+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNtX0U7EJXnzmTL1mUGX8eEf/PL1kPoEStZFflW8GQI=;
 b=EzAROlLnscqEgCdhgBi0nQO5ELnbiHJFgba2FsWz1mAP4CWuFkPBAqu1ud7yut/9tFEXK2kV8tNDDddRKNqR17sPc3mAhKMiSTxmet4w2KTFMrTQ7vCBRWni/f9jSG/oIpxIDcU/u8YZbFmKY/KxL1A7I06Jex+E6OtK8eJjJ3tDRO2tgYaoauk4aXOnTLyOMkozsK1/8Ql+eHXbCDRkNJn0n+5WOBX8MhY4upQqQjozVz40teJV11/VVDYuJDe6MtvCJeecLThBoWS76yhvW9bUGLt7jpiX/vbjk9U9mkbkWiodNsovBC3eQ/XjxBWi2x8Rm48KtrZA1YnZZd1z3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNtX0U7EJXnzmTL1mUGX8eEf/PL1kPoEStZFflW8GQI=;
 b=xz9Sy8CCvrj0O/Z545YrJzfKPoembD4P/XbljNVrvmNZOtYAze8RZvhkRSeIkeilKrDB9YKH2cI0+x2+diMOtN3qWggiur292dRum1/Nk87VCCF1YXf2ZGHk3LFV1Y/XEtYqNG33daasib6mUbCOn7vGOAAKo3O7G5UWU46WcMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO3P265MB2092.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:103::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 00:22:10 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 00:22:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 01:22:10 +0100
Message-Id: <DL3JU9MZGA18.3FU1H09HEPS99@garyguo.net>
Cc: "Benno Lossin" <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Mohamad Alsadhan" <mo@sdhn.cc>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: pin-init: use irrefutable pattern for
 `stack_pin_init`
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20260828155033.2101924-1-gary@kernel.org>
 <CANiq72nKwM5n5vKWAmSiMEtUpsL=rAKpwuSa7bxM-CSVT7+N+w@mail.gmail.com>
In-Reply-To: <CANiq72nKwM5n5vKWAmSiMEtUpsL=rAKpwuSa7bxM-CSVT7+N+w@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0500.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO3P265MB2092:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e6c6f3d-0290-4fda-98ec-08df07bf1079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|10070799003|366016|376014|18002099003|22082099003|56012099006|3023799007|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	SN/X93lG9ub9x7JLdP1De1JhICQxk3CEhXyooY7kpZ03YyJNxuRyaYLC1yah56eB6lt51siXvUqU+Yby900HK0TatJ2XsysRppAdcrV4Z/mmuT7meqXRu64yw5XADcLbbf7/3rbg0SkSdtjfflXWMk8alt0MeJ+y9tlmwPc00fz2JRiWDswspQfeZhbXSbksQuYM1bNGtduEV3AYnqlcFXJu0M4pbxAU5oUtPRpB8eOOyhmwZH/FMMyuY/sOJBebTupNd1A59i1o1c2Y427wn+yjXHezt09so3fuBDh8oBetTnmTYjyX/wpa5J+dzyNSpIYHbK1Q3wxbo41s1QPp5LsOVJivr1Wqp7W2h2aZxxubi6aOCBPQoCzhP4lVRzVx2h75VsqpSVS8piF0UqQOdGxO2g+xHNkJR2VZtJT4DPT1Ag/6tOkDhFSJJHpIkohjySMlDuKYghIPmCTu0go3UfeGCiH9XB+lW/PDbAODi7gmrfi7z4McGHsBNmKa/2612GHXWathpczzWfM58+wguqUtUU3MyAbCLiNyu+ssraqTm0AH46i5TgTbh22iqzqOts536taGj6/Cido695vJEsvEmUcwMaD5bmgiUMgCWNh0zLmpQ4lMK7KS469LvrhmKztS2U7vV5v8dp+fXn+uoPbjloX734EsXQ6JONQ7zYY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(10070799003)(366016)(376014)(18002099003)(22082099003)(56012099006)(3023799007)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDhpUHQxWExUdlZyT2I1NTdtRGR5K0cwN3oxcVRHc0RZN2ZJOC9uZVo5c25J?=
 =?utf-8?B?SDRLODBRaFk5VDNzVzBEUGRScFFSdXNEclk2WnpsRVRNWkxRcUtveENuOSsr?=
 =?utf-8?B?MWhVTEVJdnFvSko4ZG9QYnZ3U1hkY2gyY25tWnVleERkU1E1bFVJNVczR2pB?=
 =?utf-8?B?VnMraVg5RlRFVkNJRWE4d2IrcDVpbVEvVzBwN3hMcTRRVFh5TmpLTUpJUXBj?=
 =?utf-8?B?Yko5a1ZPMnIwOHpyK0dBbFRJTjhxYUIvOFh3bXRESCs0S1IzY241L0xYTUNX?=
 =?utf-8?B?WUpRZFdoZ0VodURJZzV5K01LcDhJSWtNYXFhMFZLM0N4alJHbS9GSWwydmJv?=
 =?utf-8?B?ZFpjSUordTVMUEk1K0FFTzhOLzAyL3VDNFZxSUxsZ1ZVWktnMzAzdDVTMGk0?=
 =?utf-8?B?NXNJY21kY0l6RHJnVkhaR25TZjNQWnB4T2k0V3VvVzV1ZHlXdmE0VVRubzVw?=
 =?utf-8?B?MGhDbUpMSzl1Z2s5eUo1VExRQjVsanVURlRaZDFGamxXM0RHeXNQYUwwWFdL?=
 =?utf-8?B?aW1LUmFaNWFXV2dQTTVENGI3Y2dzZWhlNWVmL1FSM1Zzb0FvSFlCRWlOMG5q?=
 =?utf-8?B?SWlqU3J3TnlFemlNYktSMzM4VjNTSURKNEdibWZBejRkN3ltdkczazRvNXZm?=
 =?utf-8?B?K0trVEw4Zk42b3RUUG9lcjBNcDZkVktyZEtkMHZYNEdPbGk2UDhtTTRSWHZF?=
 =?utf-8?B?OGRPNlp0ZkE4YjJvQ0U3TjZKRW1oNGNtWkhaOWROcDRrYWF0TThNazhOaVBX?=
 =?utf-8?B?WGE1WlU0MkNxS0dkdEpLdkFzVHVOdXpmT0VCMkgwaC9NSm9aSXVMMVdpV25z?=
 =?utf-8?B?ZHRHSHZkUjVVSFM3ME9OQzlLcTJrQlZkM3RlNndWQXlSem5oT2lkcXFocVdm?=
 =?utf-8?B?Slk4RlJmS1c2amt1Y2ZpMnlvaDNpS0krZlBIalhuQitHWVovM05icXduNUts?=
 =?utf-8?B?dDlwYzZ2aGNMUjd5cEZZOXArNUkvMVpwYmxjVzdDTlJONXFlTGRScFdzWG9i?=
 =?utf-8?B?ZnBvVXJUVDBmMmVuTDJkb0lwR1FrVDdpVmlVQkl6a0RpTW1ueEw2cEhqMTdr?=
 =?utf-8?B?L2dCb2lGWjluN2E0YXVac0VXSVJOQ0RjSWxvTWhuUjdLeW5ZekJicVR3U3Bx?=
 =?utf-8?B?NkZKR0hQWEZSWW1pNEt3SEc3K3B2TS84c20zWUVqM1NZNlBVTkwrNWNyVVlo?=
 =?utf-8?B?QnlKRUExRTBkdVpyRXpaLzE5RkNYYTNuSjJoQUF3VWJCRWt4RnovbjR1Tjdh?=
 =?utf-8?B?L2t5bEZ1MzVVYVNRb0l2RXFLUDJmTUNxSnZLa0hDL2xqWHBvTGJiNENNeWNq?=
 =?utf-8?B?bnBrbVFQbytGZ3JZUUx6SE5IaVpmOFd3RWNiZDcvWHdwcXkxazJzTDRwRXNr?=
 =?utf-8?B?anB1UTJDbmk1MFoxNGtpSHc2YmQ2WFkySjUrcUg1VVV5U3BkTm8vVko3d0Fn?=
 =?utf-8?B?OVdwd1pvb1FBQnlsRWtxT3NEendNejViVWpialAwN2FZVVM1NlZtQmRtampU?=
 =?utf-8?B?OURaTGtPQUNjZ2hFYjdhL25ZNFo1V2QxMHZjQzZNM2dwU0pyMFN5WGIzL2NI?=
 =?utf-8?B?TG1WT294T2I2RGhiYUM3bUtkbFBhZGZlNTdFYmZrOExudExtRXkyeGRGUVpS?=
 =?utf-8?B?NFYxMzdjV1h2ZnMram1FN3hzSlVBamo1djhBWk9ReThqckROMnk4bW5xdXV3?=
 =?utf-8?B?RVFmQWUraGY5MnBlbEcxalkza3Fzb0JGM1pOdlErcTNSM1V4Vk8zdmxDMnJV?=
 =?utf-8?B?T3Z1dDAvcEVvU0NEM2JYdmY0ODNyMFBNbEdjTGhEOVpuTnNNektJSG5iMnFB?=
 =?utf-8?B?UWgxTW8rMEVMUVdDMFRibEZRYnJJRURxTUdhVktVbTlWUkxSM01aN24rVDlr?=
 =?utf-8?B?Wnl6QkZQMnQ2eHdDNEtVNlFLL0tpQktFRVV3bWxEVHVIZjY5Nitlb25WUy9R?=
 =?utf-8?B?SUxtTDlRUk15Y0dpaU9OMjJzRXl5c25rQUNrM0cwcmVod3Vua3Q5aFMvdmJI?=
 =?utf-8?B?SytRTDNxZU9DbUZmbnIxRWkvN3dlN0tML0lSaDB5SHYrbmgySVF2ejc3K2ND?=
 =?utf-8?B?TkdKdjVHdHI0dEZBdVFoTlRRaExQTUlRL3FMSEtTaHpXNWhobUxqSmdBY2wx?=
 =?utf-8?B?Qnd1OHRzWGtlWURQUkgxNWRra3BhMXBGVW1TUWxTeWJCZmFLdjY4SnM5V1Iy?=
 =?utf-8?B?NmdKYXBPaXNCY1hFTVU4MURBY3BMSUVHY1Q1ekwwbWNwNHByV04veDlpSG1M?=
 =?utf-8?B?dVk0WFZGL2pCK3kzcVlKanptYkgrVFRKWTY0NS8vQ1ZESXUwY3p2MG5EMHJM?=
 =?utf-8?B?ajVEc1dic1ZqVHN2K1JvSEtFQjQ1d1JCUnRvSmROdkU0czZlVGsxQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e6c6f3d-0290-4fda-98ec-08df07bf1079
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 00:22:10.7102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jCoqmVLwy4IyYEPx05X7/TSfApbQPq79QItkV2Mb4Xo6CPtqtumaSXWowjprPqKfr0udYcrIrE6eizz8g2q55A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2092

On Tue Sep 1, 2026 at 12:58 AM BST, Miguel Ojeda wrote:
> On Fri, Aug 28, 2026 at 5:50=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>>
>> From: Gary Guo <gary@garyguo.net>
>>
>> In Rust 1.100.0, `Infallible` will become an alias of `!`. The let
>> binding in `stack_pin_init` will thus become unreachable and produce a
>> "unreachable expression" warning for subsequent match, and thus will fai=
l
>> `-Dwarnings` build. For this macro, all we need to know is that the erro=
r
>> type is uninhabited, so replace this with a irrefutable pattern instead.
>>
>> Reported-by: Mohamad Alsadhan <mo@sdhn.cc>
>> Closes: https://github.com/Rust-for-Linux/pin-init/pull/171
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>
> Applied to `rust-fixes` -- thanks!
>
> For stable, we will need a custom backport without
> `feature(min_exhaustive_patterns)` (we could in principle enable that
> one since it is available in Rust 1.77.0, but for stable I would avoid
> it), so I wrote this tag:

We can probably just allow `unreachable_code`?

Best,
Gary

>
>     Cc: stable@vger.kernel.org # Needed in 7.1.y and later (for 6.12.y
> and 6.18.y a custom one is needed).
>
>     [ The error looks like (dummy reproducer):
>
>           error: unreachable expression
>              --> rust/kernel/sync.rs:177:5
>               |
>           177 |     pin_init::stack_pin_init!(let num =3D 42u32);
>               |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>               |     |
>               |     unreachable expression
>               |     any code following this expression is unreachable
>               |
>               =3D note: `-D unreachable-code` implied by `-D warnings`
>               =3D help: to override `-D warnings` add `#[allow(unreachabl=
e_code)]`
>               =3D note: this error originates in the macro
> `pin_init::stack_pin_init` (in Nightly builds, run with -Z
> macro-backtrace for more info)
>
>         - Miguel ]
>
>     [ Reworded for typos. - Miguel ]
>
> Cheers,
> Miguel


