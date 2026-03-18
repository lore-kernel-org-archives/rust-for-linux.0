Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012036.outbound.protection.outlook.com [52.101.53.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7CA1A23A0;
	Wed, 18 Mar 2026 00:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773795378; cv=fail; b=F3NWO36wyy/U6cuUUArfOGhyXehUzkiUTGewB0q5EzmuYmvK0ZahCG0mh2AgAeWjFgWa7NHdBuU+AIoT2rP+HNu17V4kc8hZN5ppYBukEmwiWN8yR40+DYAYWN+pGgijnMAv7S7nUTw3Ev4NUmoQ2nHcOs/UFW3UknlrcQUi/1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773795378; c=relaxed/simple;
	bh=0K4FKNTDRCzin/e9hldGuV24axq34EEeLA8f6Io/+bY=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=fKv3lmMc5WuZGJNQ1NwAaSSo82Mqj8d3E6w+PzUhvhbYub3oqJSMEKyrdAX/yx/7T/ie4QKkmUEx2u+72dbpfk4CAqjxVBx7PSzE7sufYakfFfQ2be1sPMAR/btDqQ8OKXGBPZckNJY2geADxGjrlM+rRGMX29xfg0r0IELLLhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HNSHhxGB; arc=fail smtp.client-ip=52.101.53.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HNSHhxGB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKiPIKL/0y8DtTWgLTWzKj2jUn0mGbjhUiYUJouCjQ1su8DNSR6aPFed72VmJdEhw0exm/REKih6p/HadlFiDEG22WA1YVoSAbu5aa/X6DkGJMUf2Bn+dTit3mlAGG6Eb0SqnXnVSBnr5SoXvoBgvpEKctRhTfNdX9+Mk5trD4uxR7IB5QKgBqntSaHVDtFViqzqIXAcEM47PcrJ1yD/SCr1TGXZy6G6muehVNSA5PrV0Zn+lB6po4nz2WiwmjPF5lji87xI4gcll+8sxUMMEZkVT8RZnFizW4UQr4oSfZZ+/E342VFNAxFFqCCkC02Xl9APBtg5hL9D9jWHdIQEoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9E5MRKKAwapqDVOmE9nfLUkVoEDjnwctyU0VCeHSVvY=;
 b=k+dDQXCB9TFT1cUQ6QsdUnGVKgiO1/dgVYo7JjM2va7oSNlcWTRS+vt5a+92T/ZbbAnZ2Lq8MtWUZFCuDD64VyaOP+mkm6tPKBeaTo2bpJQJSW6ypXiYMhqyw4ryPvCmVb5B361KlwHsdRlxQFUZDSXMw7B9X8kxy0bQMbi/kgTYrFlE88782WxgDmqoVot6d9hMhswSCs6KmMrltaTLPcRaZ+4NlcscejgfZMqLO0k7D7KRquzH78ZOcS5OFgmpqZewt+/0GfDQUh6g9LXIHwGpeDZltI3RpNLrF7mbwRohz70gi7ozWkiaUAvZu+oFK913sfyfVEu0H2evF4apBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9E5MRKKAwapqDVOmE9nfLUkVoEDjnwctyU0VCeHSVvY=;
 b=HNSHhxGBWLOoPCZjneHYMxnDSRxZARP0CygBQYsaK+veHSQEzwgVMYvdhfPd7aUjs41AeXiXPtdZv8gkMw9mD4vQl897O63KRp5aRMSwu9jY3fTzOlbT+Qf1zhYeLMFiA3fVE+QqtyIphv1Co9TRX5hm1palo+7UuKK0o5mjRWGrCAXHHUXMLpFEjvMDkqZSkJvOOS9Dzd6tTIttQFAwqWtjkP5c2XvB1yol8+/0FZsLzlJCG2KSm88b576HckHHfW/po0ajeZ0X9s+GFGophti2vx21NQAzPuBPZkwqIhqVi3ebuE8+ayRP5vAW2/+OE6HD2HICFa+52AS67qyMmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8752.namprd12.prod.outlook.com (2603:10b6:930:b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 00:56:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 00:56:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 09:56:02 +0900
Message-Id: <DH5HZ7ZSNAGQ.3IG5YTMIL14XD@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 18/31] gpu: nova-core: add MCTP/NVDM protocol types
 for firmware communication
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-19-jhubbard@nvidia.com>
 <b6d58cbe-a375-40f4-ae70-a3d7344160e5@nvidia.com>
 <DH5H95R3ZKJK.3SMHG8B4JP051@kernel.org>
In-Reply-To: <DH5H95R3ZKJK.3SMHG8B4JP051@kernel.org>
X-ClientProxiedBy: TYCPR01CA0160.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::13) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8752:EE_
X-MS-Office365-Filtering-Correlation-Id: a03b6ae8-f4ef-47f4-9497-08de8489222d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dhjqJ9S7yy0B0pOhPBuaxZeQOChGOqYxx50OlS8Nz5/TkML0zVG63BzKpXkfn4PjNojMfZ1wI2ciKn0O8yfaOdgBKs66a7aw8xJAa3+CNMFQvN8UF+Wt6TNDBS6JyQ2h8D+3FFFiP8+IYjTL7WDFYFgDFwZREwcRaYQx8FRN5/me4Efrz3WFNwPTNEe3bM+cm0u9jXfaafdgxwpgoQkbF2NBD55SOtkVcNR92kqB/SN9wtzZhwAQ+4SLoFGjtLi8e6XzYgWyCFXc7xEFb5DRubvOJmuTkuJfkBrDUeYWkoXyvEy8QgnUUb+dU3+kt8z67x6Ega2R+RuvybRLpLh2t+SYw1XHUB21i1hTG7rmGy+cPvEZIlngJUNfxqq358wT957xvn2OM6aO49RM0zp4ItlaTUBKuLqxjxZapQd581bFoIE8MR79yg4vj5voDSUPoFndTIqttPrq2smCcmw1HsOMuNbammlavkezSQg5wso7I2DEfoQfXSUTKIhKpSkXdYnJcruoQhybmpFaPUkBwBruayG834wycxT5D5qTknXIXHSaioFeSLESat6vouXrff4CppUKAvzhtc0rxYTqPTYqpLk5T7BXQbqxvzGqIJksWw/etOCClSHVUY+gZ6uqjHaQK1IUy9KNuo+SepyF0BGoZBTR4wwgZIbWArQA+XEr6x6ODZdWN5WbVO7+W8piFF+dYXNk4HXf9vT2mXHOp+oVF8oYG5nLKQxE2KSRXJI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnZxZnI1OXRVVDR2eWIxQVN2c1c1aFNIcVFOMnFobEMxVGYvVDNZNlY3a2RV?=
 =?utf-8?B?N0Z2Ym9QbU54QmxqQ0NWa2ozUmZrdmsvbnBnYmduQTVURzh6NzRRN0Y1di82?=
 =?utf-8?B?em1qSzJpNnY3eHNPZVQvbDhiZ2hmZHc4ckxOelNkUkFFV2d5czA1c3RnVmpa?=
 =?utf-8?B?empJaWR3K2xYVCtLYlVRcjZxVFpOZ2tYb2N4ZW9rUGM3S2MxTzlJV0F5L3Qy?=
 =?utf-8?B?U1lCMnNIOW1McU8yMEYvYi9uOHBBelgvZGxObjhSdTlHcERQYnh1c1hOMkJE?=
 =?utf-8?B?aGlBU2NoWGowY3MzU3ZRWVhGM0xWZTl0WWZKRnFLa1luV3d3QllGZzAzVVlU?=
 =?utf-8?B?cVVXNmlzTzFMTnpHMStPV3Jlc0dYRUVjYVVhMzJCNzZ3eWVVazNrSlVmMkVS?=
 =?utf-8?B?c0pjZThNQ25TdlNBTDB4S01JWGE4T2NwampuTHJPMHVkaWRldFZvUU9YWllG?=
 =?utf-8?B?dzZRQlowejJkTkNVS2dHaVR4UCtGaS9BL0dmaXovWi8yY3JQaFhDQ1J2ZkZE?=
 =?utf-8?B?aHYrcklKYlBORnozNlJOQ25OVFJHTkd0TnR3T3VubE1FUGpSQWZQK2RIYW1G?=
 =?utf-8?B?WnR0aXd6cWVMM1U0Ynl5S0IzUzh6K29oWWU3MkR2T3MxaHhvTEYyc0hUT0t0?=
 =?utf-8?B?aTNscm92ZlcyNzVJa3VOK0FLcU1SYmJlVFNmSC91YzRieWVQSGxBOWFhcCts?=
 =?utf-8?B?bVRSK3dPZkN0MzRmU2ZCWUNaZ3ZLeURWZ2tpUmxFVFdjR092VDZzTmtjeGlM?=
 =?utf-8?B?czZhQ0dMemhzWWhsa1BlK1Uxckk1UkhMcXpvNUs4VkJNTk0zcXB0b0ZBZFRZ?=
 =?utf-8?B?Nkd4V204K3lEVlZJWWhTc0VvaVNoVVg0STV2dFl1ZlcyTUVTeHpPN1Z6WXpr?=
 =?utf-8?B?R2pBd2dTMHV5UG5ld3NwbW45QzMvZm9VRHYzd1phODk2WkVrRFNZS3libzFG?=
 =?utf-8?B?K3dMaFRKall1RGw2bW5YMUhXVFEwRW8zNzVWbktiOWhIbllDZUhHc3lLeE5a?=
 =?utf-8?B?OWtzam9uRmpncEloMmF0d0RvTVM1SW1kRGJuMEVSWkplajdRcUV1b3hvbmd2?=
 =?utf-8?B?VzNCUG5rRlRSeEphcHVoaGhWMGdHSWVvRmF6ck5lQW5iMjNhNzRSTE5kd0ZX?=
 =?utf-8?B?Ynp6SlYzdFpuOXd4bS90S1dMWHcrcDZadFFkOWZDT0dpbFlVb1RBeU9LTGp1?=
 =?utf-8?B?L1c0UU92OCttUG1mMmVkSm1QcExwWGVZTGNLdVJsdktlblZTeml6WUxVbVV0?=
 =?utf-8?B?aXdwdkZ4S2VuMHVDZHp4OURBTm1kUGc5UHBOKzZmWFVodmdnWkgrUmdjS002?=
 =?utf-8?B?clc1VVgxZFY1TVdJbkNtVHpHZll5M2R1eThMTmttanZtMGc0eFpLSkVLRDBo?=
 =?utf-8?B?a2dHNnk1Y3BOaENjcWNYZmovbzgrSXNQTjM4MktBTXZMcWR0cmRNbDhtL2hu?=
 =?utf-8?B?dDIrL3FkOXFLYTB0dTYwUndwdWNrelhCenZySWZ1c1MzU0FzMGVsd0kyaU1G?=
 =?utf-8?B?MWhRVmQveER2TGc2UUlmN3NpVEVxUlF3bzg4K0ZwaUllbm9yZk9MeHRHVFFB?=
 =?utf-8?B?Nm9ZUDdvemVTMHBNNnpJWVp4cUJ1eWhZYlJnU3Y3L0VzTUdzRnV6V3AvaGN3?=
 =?utf-8?B?TUVwMVRhUVZ0UFlkZ0JnQnNVZjlDdDF5b1FWcFZYdDYrcnpnanRGYk5Uam5I?=
 =?utf-8?B?WENMV2QvNEVzZUhqVSt0V2tGa3UvdXNCT05OSE15ZHdTMU9YWmYwNGtoNFNx?=
 =?utf-8?B?OHpPNEw0VXBMam5WM1lYbTk3TFpVcktaTFRzRTRPbXdBKzY2Z0FYYTJuSE9V?=
 =?utf-8?B?TEJYTTFrNmh3U3dCdzEwREYyVHlleXh2WU1aVVRMak1PcURFT2FVRnRKbkZ5?=
 =?utf-8?B?Wk9MT3FqWVFHMk0yS1lpTVFwcHU4Zk5UWHFHQ0FFZGNYQXQ4dWxXYWoyMFFa?=
 =?utf-8?B?YmVXYjByOVI2YXhnblhOYmVpd3lNUXRjcjdKcjVDNVlvanZyMERTQ0JIWk9j?=
 =?utf-8?B?WTNwQnlFM2RVRE8weDlJaW9OSHVJUzMvQTRDSkpMLytORWtDM204QlBXMEQr?=
 =?utf-8?B?ck5BNHFKQ0k3NzV6SjJBd2dFd1RaREczYlVzL3lHYVJEdkQ4eVZMWmFtMDcr?=
 =?utf-8?B?Rmt1Rmc3bHg3cXdtU1J2dmJxc0xLZDUzT2VLNERwR3pVL2pGUHhsdHRHS1Vx?=
 =?utf-8?B?OHJLTC9ySFh2UlJJNGY1VWdpK2N3ZEplMXVFcE95UnAyVmpabmxLSW9CblFS?=
 =?utf-8?B?NDVrMkFubW8yYnF1NXRPTG1BK1NhdHNtUkxXblM3bVJ6eUp5elVpdjFidVRW?=
 =?utf-8?B?TzZ1NnZ4UFdKeitQMVZNcVRzVkV1ZHFtVjZOaDg5NXRsZ3RhR1B3KzV2T0F5?=
 =?utf-8?Q?Y9lHfgk7kEBohRygg4bs1TISOS9VVDdMUUdJ6JfHPGkh2?=
X-MS-Exchange-AntiSpam-MessageData-1: vI/dgDKtYyHDJw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a03b6ae8-f4ef-47f4-9497-08de8489222d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 00:56:05.9903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9h+tggnV8jkspOh+V/Rmgq+QG3c1BdXFnTnDLdpg0dPsjb6biIfxBZFIkkQdrCjQzG9kxF1EmM+ctwXfilxGhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8752

On Wed Mar 18, 2026 at 9:21 AM JST, Danilo Krummrich wrote:
> On Wed Mar 18, 2026 at 1:01 AM CET, John Hubbard wrote:
>> On 3/17/26 3:53 PM, John Hubbard wrote:
>> ...
>>> +bitfield! {
>>> +    pub(crate) struct MctpHeader(u32), "MCTP transport header for NVID=
IA firmware messages." {
>>> +        31:31 som as bool, "Start-of-message bit.";
>>> +        30:30 eom as bool, "End-of-message bit.";
>>> +        29:28 seq as u8, "Packet sequence number.";
>>> +        23:16 seid as u8, "Source endpoint ID.";
>>
>> hmmm, I seem to remember my very slightly younger self insisting
>> that fields be listed from lowest to highest bits. And now I've
>> violated that in both headers in this patch. arghh
>
> My now slightly older self still thinks that what you have above is actua=
lly the
> way to go. So, I think your current self intuitively did the right thing.=
 :P
>
> It should be either
>
> 	31:16
> 	15:0
>
> or it should be
>
> 	0:15
> 	16:31
>
> with a strong preference for the former, but this
>
> 	15:0
> 	31:16
>
> still looks pretty odd to me.

Mmm, that's the order `regs.rs` currently uses. I don't have any
particular problem with it tbh.

The second form (`0:15`) is going to be rejected by the macro - it
expects the high bit first.
