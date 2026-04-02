Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010043.outbound.protection.outlook.com [52.101.193.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5CE2517AF;
	Thu,  2 Apr 2026 15:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775143397; cv=fail; b=tT/oSjrZGVjIjFauzTWZ4zTg3Rb1+a7mN1I6lSzpEMRNtkhsVx+cbGLcMhncxKRx7JEmJ8B3OppO7+5Anbky/Junea8BNlqbqGrg6xe4lgjNuh3uIb8KGHxzbZibFFIhdBcjyZ3IOWaoz67pFFyQ0d/KGkr/+DZn2yUUK452xL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775143397; c=relaxed/simple;
	bh=R0uGhOkzOsUDoKlQJyo7xeg73PBiaBgVBd6QN8iuKqI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=awf1dKoyKydu6Jv+JpCXAcwbD9X0mBBWxJ8QGTD8tkTiqF3JZ63xf+H2LU4Q5qCu6Q55ViBfIbqPQcQUECSdMvcaCIX2DMP4SmqKcW7SwzLnRe2Gh9MqsddO5L/FmLnvAQRpdUcaZ18YyzHmOKx7qSAjmUxwwijqicAQYds7VaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RgRLnXoE; arc=fail smtp.client-ip=52.101.193.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RgRLnXoE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVjW+AKmsVt6r5ZlvYNH4w5yi25pxYERGV4e3uJbL/gtMA89slavIeHlbYvSWc0TF7HI2qvskWtdvekAt7kA+meOJEWUY4dCv8AS5BG6C4581SydQhBuJLaw1YKnOg1/PfOasSv98qtYXyyoqvZO/EtMsYUuqDOsTCVS4ewdppdRmPQZV09RsUiQsKI+OJM7ZyPUClxWwemE4CkLudiz994gWejF4O3ZcsaxCFV4fKM9XRfxF8l5Qt8nxG0KSXj31+TwAoxU1FnbL9nE8uSljcV4vH8jBwxfx5EK7xW0lcbIg0cYRYHuX61jMHuMHSxquIRaVumqWbiMPzlau0FFkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJxWYEUt0ZlnwA2A5xHMeasF5rFL1lkgAGi7fSf7+OE=;
 b=u+NYVtDAsggMuJm7QMt7EqQAg8mk+WgXwHafXXITduahOwLADfhPdgllUwXjy569Cmx6ZIBT1qqbvRy6WeX2n+0/V2NLVxVPiS/z0rHVqbw3b71PvUMfIkDOV9zDgcn1L8p9ns/BjK74YrwTKc7Sug/u6Dj5z7LIAY729djRp2HGG7O7dbkb1nnmdpaZd5ZzKajRpqFHhDJxJgOOywLb1Eklip93byCEJgxWSvwV/F/Nf0lx+w61ylq7zHj70imrA7k4catkbcXmmMYveTVjc30d18L4bgfcbIvQ3FI8f8JW4ubateU1C9ANV0EPAg6q0oL90N5rt+AUTGd7sMuqmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJxWYEUt0ZlnwA2A5xHMeasF5rFL1lkgAGi7fSf7+OE=;
 b=RgRLnXoEKxxAIAkEeqWF/+SY6aCnogQyBeXTN5FV8Sp4fEGW7g52ata05J5RrJAYEqDAB+GeeDjiFm33X6Nrezfdl41S7eBdn77tuCIyRTf4+xQquqKQTM+dpOc/4OgXz+QDWgMBatqG1RFObWnTDg6ZJI2ThRU010wAx+OVYVKqv13DkAQv7lqZkEXs1xMem97EeNGJi//8cPX2GtDuMdIB2yhJ3+40CpOeEFClc8WaAuZU7e7YcIp5vCbCCy5Rho4PlL7JTWETDz04hHUX2HOozKGtkUfWAnEDB85MeSdrMQyQBrAzgCAcrc27WrwdLbjBhOu2wrvUTEcZvirhWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by BY5PR12MB4322.namprd12.prod.outlook.com (2603:10b6:a03:20a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Thu, 2 Apr
 2026 15:23:10 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%3]) with mapi id 15.20.9769.014; Thu, 2 Apr 2026
 15:23:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 00:23:05 +0900
Message-Id: <DHIRT9ISB4FJ.1XZGJIV9DO7Q6@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
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
Subject: Re: [PATCH v4 2/2] gpu: nova-core: use SizeConstants trait for u64
 size constants
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <20260401222743.148710-1-jhubbard@nvidia.com>
 <20260401222743.148710-3-jhubbard@nvidia.com>
 <b1c23169-9368-4ec5-98f9-f73fe8128305@nvidia.com>
 <DHIR7Y4FLM2H.ENO8SJ92Q24J@nvidia.com>
 <aadd85a7-efc5-4d4e-893f-533049de54d6@nvidia.com>
 <2edf0385-b756-4dcb-a235-d16236b0177c@nvidia.com>
In-Reply-To: <2edf0385-b756-4dcb-a235-d16236b0177c@nvidia.com>
X-ClientProxiedBy: TY4P286CA0105.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::9) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|BY5PR12MB4322:EE_
X-MS-Office365-Filtering-Correlation-Id: a8dab97d-6a7a-4daf-ccf4-08de90cbbfac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	YdxXHKnVWn2tjYvn8mqDp69Iv18BKGF4NoxW9vnbTxqbqlwBU70yOqE3nsgfXq4iZ2Ai5wDHYntgvWr+mTGTb/wSIGrqTSGqMKsfPfaWvOpXgJEwicjHklj03QNkYf5c27OO6EicIsVwuIVWVN/TzZjtWNnq8wuAN+aVXOkC6usr5A6pXYk2KCG41K65dUg1ymu8dW9B4cKEj1Pz+a+COPVVj1leWUoeqIIApuDPiG6h22WBVP/WFAjx+WgYKtDyarkxPohimwbdZ3oSMvboqRaiutnq2S+womLTr6HFXteyo+84JCmhBsM+vMJJt8tlfzuhL/HHVcjP2AWsq0t0msOqYab1rSDBBHNi9ZicXYaIdSMHHEAcUVC4/cNfWA1wiT8uj6IbJK1Kjg3hrcBtvnJKkB7VVZR52rwUhQwtXsrqYDcFUdP7VcrDICbP21+WbZ2wd61cBBkhEtqAYHC5V/JK2O8svOtnbiw89amMGI4cU05O2+5xIFKOENErP6JxD5uqeDXe0jTRtGhQE+Eiokt3QK1C4vDs86vduVUamuA86hpUpMgSSlWILtMWNtkWgdO25xuS0xQTT+xKXpJhch3KEn3AfEDZNeRzDr+lKywt7Q3ZEw39Fbu54Yap7j42JNn65sIl0/VDRDwC5ac3OTnzpEn/WFdpQynmRf9hQ0UkC+t6NLDGkHNXwQfQ53i+GSsDFzRV/l2aRBTS4hU+WdpT8K5tl2VIGXTdGyX+168=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjUweG1LMWJTS0d1cERQVTZ5KzlpTWNwcHR4eUVIaEtMSFhhcHNPbzNJOXR3?=
 =?utf-8?B?NHV0KzdCQ2M2MnNnQ2NPZmg3ZGIya2U4UmxsZjJ1UmE5VUFQRlRBUHc0QzRT?=
 =?utf-8?B?eTRSWjJuckFkYk5RYVhIYmcyMG02TTM0OEZzeGZsbmZnaGltUkRnV3QrVHdt?=
 =?utf-8?B?TVpMNmczWkxLN1FrMU9ZQzlJMW5abVZUMFZkTXRtSEtLTVJGNEc3RUt4Y0Vh?=
 =?utf-8?B?QTBzRWlTc1hRZVBRczBSY3ZKV3JWQ25YNmhnQzZhaE9hQWhzZkZRa3MyTmhK?=
 =?utf-8?B?UDNwNE9uVTN0UFBGa3hYbmZ1UmRaZ3hyQlB4TnR1ejFGUUg1bUZQMCtUSytm?=
 =?utf-8?B?WFF4b1A4dTVaU3A4cmJRTWI5dGhHdVkvYy92emJiaC81UXNMd2hlU1dvb21h?=
 =?utf-8?B?RTdYVGE5OVVyZjZQR1VKQlpNZkxFQmFHTUZZTnBCd0N2aGgzd3E4OGY0QmZG?=
 =?utf-8?B?azR4QVR2M2swOG80UVdXSTNtdUlSTUpxOTZzYXU4eVdhQ1Q1UlJsWFJucUcy?=
 =?utf-8?B?c1NHaFAyTUNHUURSUnZXOWVuczVrYk55Z3Jaam9hOVZqa0Ixc0dnc29DeGE5?=
 =?utf-8?B?b3lIVmJscXNaeWN3cGxNbHZKZ2ZkOE5sb243S2wvRXdtZ2VNSHpTL3k2VHIy?=
 =?utf-8?B?OG5PNmZBVnA3bjRkTXBTK3R5WDJkOFE1WFhoc1JRQWg3QUtva1hFMXRCOUZ1?=
 =?utf-8?B?S3AvOU5obGZoZWxBOUFHQ3JNMzU1RnNpWUo5aWVZSmRlSFNZT1dIM1A2ZU9V?=
 =?utf-8?B?L204WERmdldyakNQL3NPbi9aYlBWdVNOU2d4K1lPalB3S0JBUVpaOUQ0K2Mw?=
 =?utf-8?B?cW84aURaRzRFN0ZvWm80b0daTGU2V25ENWxXZHpWaGRUSDFGSDREUVZwdjhR?=
 =?utf-8?B?eGFLdXlFWnJhcU1JNzJoL0pyUkFWR0NKclhvZDY2QjZibEhSa0pqcVlGY01s?=
 =?utf-8?B?QjZEd1NJVjIwSmI1bjVtVTRSR29TUThqWWNBUklkenZMWCs1TEJ0M0xIN1FI?=
 =?utf-8?B?aHgrdjJhVGhZalc5a0ZaalJDaUUrL05ObEVHdHg0MjduREVYY3ZMSERMK3cx?=
 =?utf-8?B?Yjh6YVpkTEZ1cm5ZNFVQSlR1ajY4d29oQkY0UkdSS1FpRG9oSjB2eU90QVlS?=
 =?utf-8?B?NzBLV1RRZ2dtdDYxV2gyenY0NEExZWNOcnlSQ1FUdFJFdnZLVjg1Nk92Y0xC?=
 =?utf-8?B?dHBZWFppejZsUWErcUdRVkttV1dsalhZVTJxdzdGRTJVRWI3VktzR0Z4R0hB?=
 =?utf-8?B?QVVhVmlJTEM5UEhuWGV3Y1JIQkI4bDM4WlZINTE3MXVMcmp6MXMxNXpHaTFp?=
 =?utf-8?B?bG9INkZVaXU2S1daWEdrWWRudDBSSEpabnlpYTJMYVcrNDFvd2FBT09xMVZl?=
 =?utf-8?B?VDlWV1pJS2hOYjBIRFFMRFlIRDN6alhwMjUxckNUVnkwMVVxQlZ1SUhDaU5k?=
 =?utf-8?B?UU12V0hPakZSV3Z3bEYybndBR1MwSVRMSHZPbHF3eVM5ZHhHWXp3YXk0aHIz?=
 =?utf-8?B?NDZGa0gxU08zZFlJMjRIOU9SVExCMnNwL2lBQURQTm1WUDFjMmY4MWRBVVdF?=
 =?utf-8?B?eFpZYXFscy8rMEFNMjVJVXk1WWJQckRvZ05uTkN5ZEZYUUFHN0JNSUQxRW1J?=
 =?utf-8?B?dTJCWk45dGdHUlZxdTV2aXFaMmwxQWxHVTdURkpXMXQxd3pqZUdBTFl6UjJJ?=
 =?utf-8?B?ai9NTEo5VEFrV1pQZy9EVG9YYVYyR1dJVEZ4ZS9HTWE2NjBEbUsyK3Z0MjBE?=
 =?utf-8?B?SERBRjZEWmw3bDQ2Y1JmRjR4OWVwdmkxN1Flelo2SkRxOEl4Sjl4dTJQZEND?=
 =?utf-8?B?NTBpVEpENWcvd2hqT0FOT0VVUkl5U1h6SkV2cDIwNFRuWllaMmtVamc2Rkkv?=
 =?utf-8?B?OS9MVEFTd3JTclJ4dDdWbUFkWlBZYXJCWlc0RWJiM3l6bktBT092NzlML3pP?=
 =?utf-8?B?RENiLzFwdS9XUlc2VXJvbnUwSVh1U3J1ZkpLSXA3aGpwWjNhNndoMmNzNStH?=
 =?utf-8?B?Wm5nc0FodnpyNkJ6bll4YW9YZXlUUWYxMEV0bDYrR2JsT1dQR2wrd3Yrc1JT?=
 =?utf-8?B?VlduSHJIcXNVbjZVK0pjaUZLNkQ1NXF5UERWbFJLbU9KdGFGTS9jRmVOdHFh?=
 =?utf-8?B?aHJKWkp4VUFnUVI0RDU4by9lWE5Xd2NLZVREdWFxZ1VQd1VDRVJIcnhXdGFQ?=
 =?utf-8?B?czJrWEhTNjJEZEF0RUlTS0FjMHM1ekZsZEhwNThidE5pc0s5RG0rYWdONkY0?=
 =?utf-8?B?cFN5VHFBZ2ZXT2J2ZlVXaVJWTDN4RHUzRzFMMFR6VkM2K2JHdjRXNUFXcDJs?=
 =?utf-8?B?UVlqZ0xRczBnTlRnSERkUzJ6dHlrZHh1YjV5K3FPSVdTenVRckcwWStlU2VO?=
 =?utf-8?Q?6IoPgBU1nZX9VyDB/moWR5x5mIWcYhBs9aduJtqQ/2lTx?=
X-MS-Exchange-AntiSpam-MessageData-1: CsWoSO/3AaPyxw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8dab97d-6a7a-4daf-ccf4-08de90cbbfac
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 15:23:10.3969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Vhr8pnb0HUZEk3l5Yy+LyXtKFO89FlLsC0ekCNk6QmSmHGR6KLaV/8NQp5Vxo5wuTi8w/Q4fBopVShycM/c/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4322

On Fri Apr 3, 2026 at 12:05 AM JST, Joel Fernandes wrote:
>
>
> On 4/2/2026 10:59 AM, Joel Fernandes wrote:
>>=20
>>=20
>> On 4/2/2026 10:55 AM, Alexandre Courbot wrote:
>>> On Thu Apr 2, 2026 at 11:33 PM JST, Joel Fernandes wrote:
>>>>
>>>>
>>>> On 4/1/2026 6:27 PM, John Hubbard wrote:
>>>>> Replace manual usize-to-u64 conversions of SZ_* constants with the
>>>>> SizeConstants trait's associated constants on u64. With the
>>>>> SizeConstants trait in scope, u64::SZ_1M replaces usize_as_u64(SZ_1M)
>>>>> and similar.
>>>>>
>>>>> This removes several now-unused imports: usize_as_u64, FromSafeCast,
>>>>> and individual SZ_* type-level constants.
>>>>>
>>>>> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
>>>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>>>
>>>> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
>>>>
>>>> I am very happy to see this series since I have these issues with mm
>>>> patches quite a bit, which this series will resolve. Should I update t=
he
>>>> nova mm series to use these, or wait for it to be merged? The issue wi=
th
>>>> updating the nova mm series is, then I'll have to either:
>>>>
>>>>  a) carry the series as a dependency.
>>>>  b) wait for it to merge into drm-rust-next and rebase
>>>>
>>>> I could do a) and add a [REFERENCE] prefix to the patches, similar to =
how I
>>>> did for some drm buddy bindings patches. Thoughts?
>>>
>>> There is no need to carry the series into yours, just add a link to the
>>> cover letter to your dependencies and folks can pick them up.
>>>
>>> b4 also provides a dependency management mechanism, and will even fetch
>>> them automatically if the people applying your series also use it.
>>=20
>> Oooh, b4 can actually track dependencies not in any tree as well? I have=
 to
>> check that out.
>>=20
>
> There is also the issue of if we sure we are going forward with this as t=
he
> final api (I am inclined to believe it is). Trying to avoid reworking too
> much, I'd rather wait in that case for it to be confirmed as being slated
> for merge.

Yup that's probably simpler for now given that not having this series is
a mere inconvenience, as opposed to a hard blocker.
