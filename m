Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021079.outbound.protection.outlook.com [52.101.95.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A538445FFAB;
	Mon, 21 Sep 2026 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985159; cv=fail; b=fV/IkytDO3shQoKxgs/aku3FqXQ39cjF422Z/gETcIDpMpFBNx0QXFMDIt1TMEMGqj6NIDLYR63g+6kUj163jiTvkJFoR5TINAKIi15ID1nAHKZt5fZ0rM8K0Fq7YO3cnvgcqN+Hl9+OYJtvafZooDUl+SpBEfBSnq7PzqDIU94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985159; c=relaxed/simple;
	bh=pWz/X6EapOuNzQBrCDq1KMqkRpf9xzPlBkaDhEH4FdQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=bmhRDq8IintC0AGs+Vx5tms80Jv8bu5O9qNeKAj50GeM+SDEb6xiyYRKzEuEgfxqBtsRMjvvANlpXeX2UsK4W6QdIB872RZjRv3y5rW7mV0F8OdMId/RlDXvTg1TNJWS0OuA+2x2mubSLnyMFg5jsw9hUHyVMuaqb/ZTcld8nmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=za7ndFsr; arc=fail smtp.client-ip=52.101.95.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="za7ndFsr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcRONmc0/1E+qjRpvlsC8HTnnGsHV1wpgNo86l5h+e+WlZ0Gfkh/ys/cwXI/62wzpJumnJIGt4nipq3DyW12B3WtfBjOnG8ZVGzZxS3EHzXc8QjWkvmowQDjQmg+jcW/UidYTTHFGfkeLFiCY7MWL8z8bIQETi/hbo6CrYT9gwMu8ZEdgI8vLvvmtFsOmP77R1u2oVKnasy90U5zdS/8gyNXrYTe0Qf06gfAcDVTNM9qnGM/X8lun4nQmQIpCwAZXlW/THBcisyjRSeCmkE3P+9oswE6lP/hH1ZO+N5IjWW7jx97sjmmFOhbick/MU8/cgOppUHMNe927T2FDA8a1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82BiEODa1WI1B4Vkz+uIHF99U91GvVVBRtANMh7QcPU=;
 b=R+aWF6GtRG0iNwB7CHXpn6flAODeAKSvPWcE/nn1IdLfwfrIjn26x/0Rhu9ZaKsKqLIa5LA62NNvLmZ9fxnuCCkPrPhPTSy29DNUsz/X1HBAQOQqNojD5/bp1isEwTLe/zFfg50aZqVPg3tc70pPpDOQei8esYy1yJ85UUnuAKYuVswfA/EI8URh8K4fPOieRdNkpCU5j1J4BCxmfU/uh7Yk8jNDO1ODKq6BrVkq72j8g+SErNHHMpUVhdJX7K3HJh4rUR/eGCxZC6XUvaInnloWQ6W4zOnPAoXccu9ryGavto+lIWoztHWk9hSfPMT/KtrAnnULSVJvFv6ULdvQ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82BiEODa1WI1B4Vkz+uIHF99U91GvVVBRtANMh7QcPU=;
 b=za7ndFsrTe3vnNPnBE4nn0APSCCk5mFPceOzQUqzvzeUwp8HE8qLuPaJN4KkbxfbdaadKnhpiEeb7ZDBr/KTJTqmcgtQWd1ImH73i3aKxt+EVML3WWYeXAW7+FUPE+e46ZoYXJsRsaSyKrVNo0bhY5wA/MLJ+UiEfRR/F5f2tcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB3193.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:05:53 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:05:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 11:05:53 +0100
Message-Id: <DLKWS377R3K0.1XFDX36YZWRQU@garyguo.net>
Cc: "Gary Guo" <gary@garyguo.net>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <yury.norov@gmail.com>, <ojeda@kernel.org>
Subject: Re: [PATCH] rust: bitfield: require Zeroable storage for Zeroable
 impl
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Yilin Chen"
 <1479826151@qq.com>
X-Mailer: aerc 0.22.0
References: <tencent_AA30574AC78ECFD88D7E042A49371119ED08@qq.com>
 <DLEFXN8E20PU.3GJN24VECD90Z@garyguo.net>
 <tencent_BECF7D8D0F045D49DE115EED535736C7EB08@qq.com>
 <DLKT85RM6XFH.1FHCL3Q40L1I7@nvidia.com>
In-Reply-To: <DLKT85RM6XFH.1FHCL3Q40L1I7@nvidia.com>
X-ClientProxiedBy: LO4P123CA0134.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::13) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO0P265MB3193:EE_
X-MS-Office365-Filtering-Correlation-Id: a7aceaec-9e0b-43fd-6dd5-08df17c7ebf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|1800799024|366016|376014|10067099003|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	w4n34Saib/qDr2Vy5ikrWXsy0T16tnnqWisgTW11WEBIF6pZNtAI9fLzPf5n/cdx8ES5NoPJX3vZXLlS/WO5ygXDULEDfSObsMXKxlewzu00TmZwGEYqgPqocm8iSe/fsMBDUBTd1UDmfvWRawSnABYlfskE0BGsOy/CTCCC8FuWHuNt3VU1PFdYAEJcELrsYU7yth3doaBHdOQNgDkPptSV3mdY3AXgQ/tIot/tth42mc0cmr2zF/BoeON6/v4yZkVIM2v6sefJPmj/c9tj/f/DIpDKJ9dXItB7qfXmpHsAAxGHblwrdvHeCbbpZejdnPlEeB7oCaZmIgZ/Xo32ZeO62m2A6h38VoiUkebkKEBWrbKILX7H8cPPZk+YbuLL/+oi1k8SO5ftQdjgCANW6WJX4+kAJJ836ds3jhC6rW/9oTnQmIAbUj+NCbcvkdeoODEVUFFjvn/Kq+RXjycQvDJeYjMlbQfHcl+N0tYAyd/c7OyHl5vs2/UZxkYwdAYiXBmH2KTOS3ZHdsATRgUN2SFxN2K7jzM86Oav65Y1hX8Kyx4tw/lHBwLYomussvkUEKc/E4f0Ke4mLtSPwFxZyB2THomj2VfMDqAo/cLrU9CyhrFnh9gE/cPZ+J8JYom2FNtVYK1lXjihQqaqVkmIWeJgauuMjLlflPVtZphr/D0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(366016)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmszSStNWm9PeVhza2xFTkVGM1QvRGFsTTZLaXpMbVkrWGc2bEVTcWtCV0NU?=
 =?utf-8?B?M0o5QmJLNzJ0L201UHpxZ04yVHlTd0VmWFJxdU5uWTcwZ28vRjhDM08rc2ov?=
 =?utf-8?B?NEZDR3F0UUVoYkJmVmt2YTNoS3hxbmU0NVFFeDg4LzJpdGlHZ2laWEZDU05r?=
 =?utf-8?B?Y0tGaFp4blBvaDRadXoxZHMwc2NkY2p3Q25rdFNzR3hrYi9UdVpIYVJMdUhC?=
 =?utf-8?B?S0hvaGtpMWkzcURhQ1k1Sk4zQmFHb1VvZFYrb0lNL0VWYkhyU2o2S25aYTlB?=
 =?utf-8?B?ZFlTNjBtQU03MGxJeE1aVFVUQitlSVhLQXZWakx2bzhpaHhtekZidHF1SWtl?=
 =?utf-8?B?bk1SQ0daTk4wN3RzZ0lLNTY0UlFucmRGZXN2Wmw5WE5oV1VLZlhLOUhZekd4?=
 =?utf-8?B?RkJUM25NTXV6VzFvWjM5MStMMnE0dXovbnhLKzJ0MHNlY1JZdGE3VXRyVEx4?=
 =?utf-8?B?Mktwb29tSGRsRktwYlkzcVdzTVlqeVB4dTJhNTYrd2I2Nlg2cUpGOW5KWUVt?=
 =?utf-8?B?Wm9TWUllcjNTbkp6S2FzTFNuUGYvVy9mZ1BBTlh0OVNtRktXYWVzd29lQTEr?=
 =?utf-8?B?Y2pyV2RWR0NNTjVvZXV1QWY4R1ZudWo0em5KYTU3amtDcHVMbXhXeS9TQytu?=
 =?utf-8?B?RWxaQ2NaQUNaU2JTSkcreVZ6Q21HNkV4Z2xULzZlUFJSenNNUHF3Y3RYMWUv?=
 =?utf-8?B?Q2xlMGZFblZRdWwyMzRSNWlRa0NId2w5YWZtVjBZWVg5TUdjWkxSbGdwZWxR?=
 =?utf-8?B?Tmx6eDhHRlprWnJPbVFXazdiZldOZ0dySDlSYjc5QmlSVVVlK1pISVhoSnVT?=
 =?utf-8?B?ZTlCa1JlS2lIN2Jjemw1Q2RzQlo4amgwbWt0WDNtSUtTaDhjNEM0VzM0Rzhk?=
 =?utf-8?B?V09WMEFWQVA4Q1BsdTB2MWl2Tnlrc21BNUlickNLZ1J3R1B5WkNWS2xkZ3A0?=
 =?utf-8?B?cWdZY0VIY1lTUzR2TEdGTHlkMFNIUWRkcGs4emxQM2J1bzMzRWpFMjNQZ2dx?=
 =?utf-8?B?ejdET3NrNmxlaEFHREoyMWdXRG12eXgxN0JPQVNNYVh0bmdONkt6Z1NTc3B0?=
 =?utf-8?B?Y0tEaUd1M2dBb09XMk5VT0tEQzNnMy9Sd0YvaVd2STV2UUFKejRFRXJGRVh3?=
 =?utf-8?B?MVlwSyswQzRDSEtKS3JiSGdJbEorV2R1QXUweXJWMGVjTklob3QrVUdTUXRH?=
 =?utf-8?B?d3FkYUgxS2RVb09iU01RZmVXRjlkVzRKdmNiaUxVc1NKUUpERUVCekFHQWZl?=
 =?utf-8?B?MlhmLzFGQjB3R2JmNTg1WS90RnZlZGtnampaSjdtSC9idEdydThWSU05QzZh?=
 =?utf-8?B?N2FicFEzbHlOcnphVnlVSHNIV21QeWpUeEl2MG5iKzVqTTN0VTFhSGtXQTll?=
 =?utf-8?B?TTVKM29iUk9IWHVlVUg3cm90ejM5aC9Xa1NDRFhHUWZ4akpYaG5jL2ZibWhM?=
 =?utf-8?B?U3phbDVXNFdhSDFoakh1SEcxcFBYaitJNGNNb3VhTGptRGN4RDJrZks5a1VJ?=
 =?utf-8?B?RGp4akw4KzRGM3Q5ZFFDSTVTZzh2eEdQZmhFWm1sMnUwcml0YkVRdGZvS3Ry?=
 =?utf-8?B?TG8wd283SHZFQ1FDc0FudXZKS1JLdmR2U1RrOGN1aFZvUnovMUtJNnVidVZx?=
 =?utf-8?B?VHRMcDdUNFlJZFpFZEFuR1BiTVdHTWxHYWNrTUo3SS9ucnpHUG5UeVhwVCtq?=
 =?utf-8?B?SFpyYTBHaEJxcDF1TFl3bVNNQmZmUElsb3BLQ2l6Sys0dmRYVVRsdG5nOVUy?=
 =?utf-8?B?M3ZwbHZ1R1pFc2o2Qld2MXVZd0ZUYUFtd2owMTZFWFZLRjFGclZZUnpIbVpl?=
 =?utf-8?B?R09mRHpmbXR3ZkM1RTRiZ3ExYjZ3dWJaTndFajhLMkNiMm5YUWZKOUV3OWdX?=
 =?utf-8?B?R2NYcE9lZGZNbkhTV1p0Uk9oc3lLcEFpY1NOS1pjd21lOUJzajNFdWxzV3dF?=
 =?utf-8?B?UkJPbjYyM29sVGFINUpkcUVlWjk1R1FxNDB5aDNVbmZHZGxsQUtIQm1uVjlG?=
 =?utf-8?B?SUd0cC9JWm5Yc2Q5UFltL2t5bVBhMkpYd0NSdElqcjZqZkEwQWcvUTJGMDVF?=
 =?utf-8?B?TGNMYW1rN2EyNlFLeE94SWU0UytwVy9VQkhIdFFRd0lqTXNKcHRmMkpBeWNk?=
 =?utf-8?B?bTM4ZWd5Sm1rTXo2VHpRMGtHQmt3SkRzaHNnRUgvcFFXNmpHcEwxenYydnZL?=
 =?utf-8?B?SFFHU0o4akxua3BSOVE2d1RhRVVnVytzbCtUZFZCTkRkVTFGeDNMMjJIdTM0?=
 =?utf-8?B?N045V0wrOCtyTGdRNjVSV0RPUm11c3daTy9EZi9kQitkb1QwYWFOVEk1ZWRY?=
 =?utf-8?B?bUVyMks3UmN4a0crSTQ2d2N1cXZlVTFmc1pYNC9TdDRVemdwYTNsZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a7aceaec-9e0b-43fd-6dd5-08df17c7ebf2
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:05:53.5433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P6TdF+f47LzUfdo7UGiLcZkBQz0DdQWzFOadsw+GuKu/Y1ICtbR6YnWgBMGnbfp3HvtVPFesMrPy8/2do1c8zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3193

On Mon Sep 21, 2026 at 8:18 AM BST, Alexandre Courbot wrote:
> On Mon Sep 21, 2026 at 3:32 PM JST, Yilin Chen wrote:
>> Hi Gary,
>>
>> Resending my reply for visibility on the mailing list.
>>
>> You are right that a bitfield with at least one field generates a use of
>> `Bounded<$storage, ...>`, which requires the storage type to implement
>> `Integer`. However, `bitfield!` also accepts an empty field list. In tha=
t
>> case, no `Bounded` use is generated, so the `Integer` requirement is
>> absent, while the macro still generates the unconditional `Zeroable`
>> implementation.
>>
>> For example:
>>
>>     use core::num::NonZeroU32;
>>     use pin_init::Zeroable;
>>
>>     bitfield! {
>>         struct Bad(NonZeroU32) {}
>>     }
>>
>>     fn check_bad_zeroable() {
>>         let _: Bad =3D <Bad as Zeroable>::zeroed();
>>     }
>>
>> This currently compiles.
>
> No it doesn't.
>
> error[E0277]: the trait bound `core::num::NonZero<u32>: kernel::mem::AsRe=
pr` is not satisfied
> 364 | /         bitfield! {
> 365 | |             struct Bad(NonZeroU32) {}
> 366 | |         }
>     | |_________^ the trait `kernel::mem::AsRepr` is not implemented for =
`core::num::NonZero<u32>`

On the other hand, it makes sense for `NonZero<u32>` to implement
`AsRepr<Repr =3D u32>`. So I think we do need better defense.

Given that fundamental `bitfield!` needs a plain integer type, I don't thin=
k we
want a `Zeroable` bound, but rather just enforce it has to be integer
primitives.

Given the recent `Integer` sealing, ad a check that $storage implements
`Integer` is probably the best check.

Best,
Gary

