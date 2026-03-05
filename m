Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011035.outbound.protection.outlook.com [40.93.194.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F96218AB9;
	Thu,  5 Mar 2026 01:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772673849; cv=fail; b=dlK6h5F7cGUhqjkn0vVJune/Ag254JQhj0Z7WvTySjMlODxvTnSM8dK9IX37WMmrrQ6z9gxEQJ6Yk0CQbeii5Ube9Ud9KBOvyI+Gd4AWg9ZPuozFNfsB2JACRNA2/6PN+y15D+4425Vg0eUR6WanRgoaVULv8vik4fg7Rs66vgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772673849; c=relaxed/simple;
	bh=7TT7zwD4rVtzLLH/+gbkcmDA5WtiK65EB4MlpsGnV5g=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=OUjJfTltNVw9IGwzEP8N4QjDHhFlwoD2233QFmps5+3iTyNMHfO1qXu5K688PTVjCl6SGP4le7AlghLwqXfQtAOhWBi63FFKpOQealD0zLVeqyBKtCaY6OrAYikS4tw8+ax3OMy6LuLqjsTj4USVRYq9y65g5mx0sa+d3QrTUPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p95Di/Ub; arc=fail smtp.client-ip=40.93.194.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p95Di/Ub"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJQuWEPj41EaW0OsJ2b5uSv10Bi8IsC9/PSYxLpS5+P6dUrtX6/ZrQqx9lmVVUoiP/udq/p3BYYEqYkdzgvlyHDxD6C2atuQqMOfd2EohK9e8lmqEs+MCxRTp3X3BsIqSbcvDZkj6wxh2BIu/hLPdI1skKEUGbYKSFaXe1qkXTijAbzd6u5AXD6cQErE7kTy7+u4fbqqTSi9xKj9cy7aZZ839qKfgpix5GMFu45yu6gPDBjjvG3Noqs8ZiK1WgokcmqxGuBKW2+DXM1gv3+KYpumM8BisxJGRigU4vE2qkM1suKUVup++ArqBqJRu587PCfJkIrHY8Qr7WgUyq2N2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqcbLc1TRXlPpbR97wqxlmmPaMkU/U0gaxvmugIK870=;
 b=kRXnf9P5F0+51036WtkfydwMtOEyDxzmKsgkaIUemMobqOjTXqBCtQsdE9tzGiVqpF354wNaEQX2JTd0j6pxU7tp6X3Gnz0K+Igd7xfQzT7yZ4NqLydJfG5v8YbdIWa8rnutRIvMItqjstJoWTJn4lHjHSQjtXaMQn26cgPwWa8334ODCjiVyxL7vq7SypEk7ierfssKQa5gwFZP9SPSAWAiH2UiSI+QqjmJFU7j/NmmkvOsgpNyFUxW03yfd9p7uVgGznTlsxnnZsEVWQMluK3UC8Z3XO/du4XGwMqbBLhzqQl5EGBA+U+m/hU3enzrtEhDEch/Cdt87fSuJq11xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqcbLc1TRXlPpbR97wqxlmmPaMkU/U0gaxvmugIK870=;
 b=p95Di/Ub2P/OhHKNf20AinsCDYg3Szd2U2HUCeqeWxupoPe+28Gm08mYSk5/NgSAISCMYRziu9kBw9Nwlu5Xlui7YD68umX8pH+Nlt6H1/PfeJxxvKYR6z0fjCGe/FPeJ50JHaEe5ruTWJ1j5haMbWFzrz1lep60MgNiWbmcwzJMZvNQeq27RbHUh+aVh3hoKHaqN3nlHk5h4mxS+THpSzg2It8EXDa5+tJOsBos+d6CctNPMF1xrqO/ngTnoHStO1tg5XbcGvFzEFzXyuTWk/im/zygm+7gnbeg8/cUdItXXbVjkZLGeWE/Ri854Dvr3haCvvsAoQy8PdLEEXeGFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB5886.namprd12.prod.outlook.com (2603:10b6:8:79::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Thu, 5 Mar 2026 01:23:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 01:23:58 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 10:23:52 +0900
Message-Id: <DGUGFGFA7FVJ.297YIFEBLO3SH@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Danilo Krummrich" <dakr@kernel.org>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
Content-Transfer-Encoding: quoted-printable
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
 <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>
 <DGMAKO04ZM3J.1NJDI9SYE354S@kernel.org>
 <ba7aec533e083622be9055e77c30fee0@garyguo.net>
 <DGMEORS8PL1T.242O5BRE6ZSM6@kernel.org>
 <282c94d3-f32c-4851-969f-61fc968de6a7@nvidia.com>
 <DGTYFUCCECHS.T8EW6ZPL8NZS@garyguo.net>
 <2fe31d10-733c-414c-9936-2d892f2a4186@nvidia.com>
 <DGU8CN7OXXB4.1S5OOWY9GNRKJ@garyguo.net>
 <3ff4588c-1322-4723-bb30-9049d0b316d6@nvidia.com>
In-Reply-To: <3ff4588c-1322-4723-bb30-9049d0b316d6@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0198.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a5ee74-b8fb-43a5-e9b6-08de7a55dfa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	vD9ZqBcrMDua84a6LdqO/w/av1FpWvuqe0C2HBBRdTKNaY0JvwlrYZKYYmDkPv1iuGmOWnnvyCcHSztr4fEZdjBEPjA5pGrwvRFBZbpjirWKlwzcp4S6ifcv0NtiXv6Iz1xMMbhJ7GeEX1/TWr1NT3guSbYP9YFzKFr4qB05J8f28QYaBwHg/wegm3OgGrPwop/33oOERHl9Gob8WA/zUOdMQMti+j1FfhHY9hieIyTiMlxW3XjBLlFkm0mtglDKcK+mBsITU11FBSzicb2eAUI2sUuQmgD7BB5yWSkqKWgTArWXYAqX4rgQVe1BMloAgn143NdURR/CGV/5NAyYvpiwtkDT0Bj7USj2H7SnxnYSVVA2mF3s70xm+g+Fxx+VjoGxJWA7HdXaSQykLM3RaVe6SaGVJGNgk53k2JnH8Egic6gmzC3iUfZv4QQjITjc2Y8I0zOKMPMJ/eCiXoFWBnf+/npWhcqHmle+cnQyXUKXY1MOPWETsYgyzcX8dv78bipmNkgmEaEhcT1FVgLTV/3jiTMc/ZU115BJC2ylrP7aplCYFpdm5X3JRbQyHS8VTPV+DwpsV0P7FXu1VfQlNPyXe7AAV+J06Nbx6j+BrEBEJllTZo+xbtjdL8TjOqNI/RZRzKZKeDUctaHt53Ucxilnq7aamvbdRT4/Ayl+/T2RE+V2KWsUE3dcjQnEROTIJp5uQKvFOt2GC2pLaFT4LJaSquGCVEJN/cppxAteZ9o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmFTVzNoeWY3dy83RElnckFBQTFNR3d0clZYUERNTE9LZHoweDZiR3BNbkZN?=
 =?utf-8?B?Q2xLcW11cFUwNW1CQU1VMndSZXljaG5jQm1WTkZKMTZ4ZVVxT2Zqa1NoRGs5?=
 =?utf-8?B?SEZwR1ZNVVlIUmZnZHFiNEptUncyYXVwV1lVWkw1OEpNTWt0M3RqdExyS1hn?=
 =?utf-8?B?ZXpOcU04UlQ3QitNUHBoKzNvUFFTd0RuRU5qUUhIRjQrL3FSU21XRzJHOG9C?=
 =?utf-8?B?SjJrSnQ5dmt3clpTR0p0UmRDbG9RZEVLN3RPaEMxS0tGKzI4S3d1bjYyM2xh?=
 =?utf-8?B?VXBmWXBxWlBaVFB0WHRSVTFxT0F4MHpUbHZlL3NXWDZYamsrSzJvZXBJV1po?=
 =?utf-8?B?b1lIa3JWTW5HSCtCU044ZG8vNEFqTkFRekNWbVVJSDJuVjlBTmpIVkZHVFNL?=
 =?utf-8?B?OTN4VUVuaWxXYW0zaFFaa1VWRFcxWFZHb05DSEs0MGQ3SVR2MkN6QUg3K3VB?=
 =?utf-8?B?cGpKWllZamlKWHVVN2tkT2JQUjExaUYvcUxBTEtvbkx3MWxzVmFhSW9RSXBL?=
 =?utf-8?B?dG9VSCt1OUptR252L1ZVY3d4TjBNZHU1b1RLQVdES2lrWklQUlFEMy9MYmVJ?=
 =?utf-8?B?SkRnRXBEWkJOM3FvRkhyTnNVaTlFWGVycG00Y3hyQ2txZmlpTDU1VjZCWlpT?=
 =?utf-8?B?VDQ0ankyVFNwYlNZNmxHZmVtTVZEZU1EdGRmNDZkcTRTUU9GeXdWSDhVVXUv?=
 =?utf-8?B?bnZBWVVJSXJDTS8xK0xXazhqUnM5bWlHcVJ4SEM0OExXVnllWmh4bnB5Rmxo?=
 =?utf-8?B?eWpNMUJUbEtlWENGeUNjaFo4WEEwYVc5RTkzQ1NsWUttU1BqaHVaTTYvVjhF?=
 =?utf-8?B?VU1RcnBiM2ZSOVUwcWlpbE41Z1p5Tko0d2ZubER2bFUyRGNlcFZpeEIyNGNX?=
 =?utf-8?B?ZFpRNmtRZnVYYTNwR2JMcGkwVU9Oa295TU5GMGxrTFBCYTkvbEN4OVRLQlZv?=
 =?utf-8?B?RnV6M3M4L0VSWlVGNVZ5Q0tKUzNUWTRpYWVia1ZzTXRjZWExVURlWXl1eE9L?=
 =?utf-8?B?bmlwOHNlKzZ6T1hnb3I1OHgvOGh4QVA3cjZwaDRDNkU1MkowOXJ1VUtEOFZ4?=
 =?utf-8?B?RUlxb01Ec3F5UkR1RjlLYXNwZm1kSThiSjMvMDlzWU1ta2daR21SQ0d0bWZh?=
 =?utf-8?B?UjBCMzJhT0MyczQybFVpN3NxNlAxWG15bmZxUGVTSGtmOXAzMVgzVmsvM2Vy?=
 =?utf-8?B?UDJ1R3FlWENMY1FXWW1Pd1FzMzJNNHRPU1NXdmtCcjJIR09zd1NMS29IWEtM?=
 =?utf-8?B?a2h0TmhpVGZHaThPWFdZTTZCOVNOVkFqUFNUbFgyZ2VCS2N6Vkpvbm5OdHdQ?=
 =?utf-8?B?ZXVwZVExTkNSdDhiNFV0SjBRelF6aVZub3V0NUhBa1M4dnpGb0N0MERja0dj?=
 =?utf-8?B?UjhlcFY1UkRVRUwxOXF6ZFVVU0JSZ3J0YzArNzhRT2hmb3NONUR5ZGFoUHJY?=
 =?utf-8?B?MG93VEJONm9hcmUvMG1Nbk5nSThGNnF1V1FYaVl0Ynl5MFFBT3FSYjlUYjJu?=
 =?utf-8?B?VUQvOVpOTThFUnBic2hEUGkyMC9xQVZhZm9wY1V5a3lDcGFNOVo5SFJHamNh?=
 =?utf-8?B?OUpTdFp2T280cVBCaG1ERmwzd0dKOXU2Vk5ER2xURkxNUVNlM0c3eE1yNjd3?=
 =?utf-8?B?cUJEcTkwRCs1cFZieWxRV3Z0YW8zZHU4c3lVZmhjTXRPSHpaUGdFdTFoeFA5?=
 =?utf-8?B?ODNYQTQ2T05HQkFDY21sQWpGOHBJb1NmMjYxdHBTTlBDanNLNXkvTUdiS3Bq?=
 =?utf-8?B?K3diQXBWRW1jWDRuZ1NWQ20vUFQxQ3pMNndVRHRscllwUWVaNXVtelExVjVG?=
 =?utf-8?B?QStyWjVCSlY4blh2cW9DaWRBT2lacnlwMktZNW9FSEZJOHRCOEQ0RE9UYXZJ?=
 =?utf-8?B?ZXBydWdWNThpcVkwRTVjcEkxSCs1OFBHdVJDdWJvZmlMNUpJQVVQU2xyd24x?=
 =?utf-8?B?STJONFVDNXk2eWlHQTBxdTdxTlFQQVVYSHBqTk53dkljcUZHT1lkaTFjRkFk?=
 =?utf-8?B?dkZsK1AvVktDQS8vVGVoRTl1M0dONVc0WW4xTGJMMTU4ZkRmdnJJR3hTYzF3?=
 =?utf-8?B?U1FsVHYvK215UGJORGl1YzVuQ0NESFF4ZGsxekd6c0FiUTEwK0pkN0FrZEt5?=
 =?utf-8?B?QkxnRFV5Ti9qeFBXWCtUYlRpOURIekFsc2pDY3Vjc3h2elFsb0o0Qmt4cW9L?=
 =?utf-8?B?QXg1bVlXVkRFQlBFWDJnYjl3c0NuRjl2eGVYTy9xOUhxclo0THVvZ0VER005?=
 =?utf-8?B?cWQwRGJUakpTU2RZNUpjbloycVRaSFJBOEdNQzdlTDZHbjdJL2tjMnc0aXlt?=
 =?utf-8?B?L0tlKzN2UW9UcXVBanIvY2t0NWxmcm5DQ21CY1liVXVQSGNBNVVDeGN2UTRK?=
 =?utf-8?Q?9sxMZKHieXUTZQUzWiXorYe6C5pJVpBp8cg16SEeW6cFI?=
X-MS-Exchange-AntiSpam-MessageData-1: ByuqVE2EmqhMgA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a5ee74-b8fb-43a5-e9b6-08de7a55dfa0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 01:23:58.0052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Twb8iI6UlP9y8SPY0OvKqmIHmTufCyv+gyVhDSm3gOJAF80beMVcSFMWdSUSe6386RvlRxv3ICa9btwwP5nIag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5886

On Thu Mar 5, 2026 at 4:14 AM JST, John Hubbard wrote:
> On 3/4/26 11:04 AM, Gary Guo wrote:
>> On Wed Mar 4, 2026 at 6:53 PM GMT, John Hubbard wrote:
>>> On 3/4/26 3:18 AM, Gary Guo wrote:
>>>> On Wed Mar 4, 2026 at 3:47 AM GMT, John Hubbard wrote:
>>> ...
>>> +#[inline(always)]
>>> +pub const fn const_align_up<const ALIGN: usize>(value: usize) -> Optio=
n<usize> {
>>> +    const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of=
 two") };
>>> +    match value.checked_add(ALIGN - 1) {
>>> +        Some(v) =3D> Some(v & !(ALIGN - 1)),
>>> +        None =3D> None,
>>> +    }
>>> +}
>>=20
>> I think your signature should probably just be
>>=20
>> pub const fn const_align_up(value: usize, align: Alignment) -> Option<us=
ize> {
>>     ...
>> }
>>=20
>
> OK yes that's a bit nicer. I've done that for v6, thanks!

Hold on a bit - if we are purposing this new method for use in const
contexts, what use do we have for a `None` return value? By definition
we would know both `value` and `align` and thus the result is
deterministic.

We do have an alignment method for non-const contexts already. Gary's
initial comment was:

> Either this function is always used in const context, in which case
> you take `ALIGN` as normal function parameter and use `build_assert` and
> `build_error`

So why not make both arguments generic in this new method, and fail at
build in case of overflow?=20
