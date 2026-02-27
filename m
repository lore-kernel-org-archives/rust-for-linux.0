Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013053.outbound.protection.outlook.com [40.93.201.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C119368943;
	Fri, 27 Feb 2026 23:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772235049; cv=fail; b=AGRHM7ILam6JaeIcEqKmckknIQTJL3fzXiVEMSMReL2Zoeb8EZWAUfpn7sjUUJ0WzNk2MjiBM8zngZF2EEBs6Z1xb/l+bD2QPHV9oG8xpZqF2BkWXV8djCtVlIyCLd0Z4FFKSG0FM1wUs3BgA56cND/3p2xxjUccWSDpdqhoJzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772235049; c=relaxed/simple;
	bh=QW2a7JBs8fTxgaHdpDP3CQG16TijrKxM92LjM0Awm+I=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=oe9ACl0SoPxaXKjjD60XOGV3ahIqhxZFyT8q2CEtRFdWC91Ip9t2QaV3bwxiOjnhQ4IaYg7wdzvX8Qhu8QuKQTFVO+MxtZJp5XxjtfXIML9KVQZjQNo1ERnB+IrD+qsm1hOkoWve2uipv7t2Z7EHX0AxEO8sTEqnjDh11Zq9RXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=emjKUmx/; arc=fail smtp.client-ip=40.93.201.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="emjKUmx/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtRtucEHdmjSfajxhin454ImhhFXov9w5XtNTYO8rcmFzomP1Yh+6shid5ljEU1LkPWZ/nAFyz8Do4kSK0sKXddxz7dy2NQlKDfMLvb/HlC06k4fCAPODAtyiu3V9/VkjGvW9ZplTPYWnSfpiJdbyGERuejz2o15Qf2RaAW//17tZCzerESL46qSSCcMWUfjKwq/fkix6avfwxmh3P7fX9uwO/wObP3yLdMTpLlnwWiMNr+FXUN7VOZi7IjFBeVdC7w9tS26R/fHXgQPE3S+Ske8AaQh/Y/4CMpzY4VWkujzxl5Az/isjWXvghy36euPTjoHgUrZEeYJud3lCzEtsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsIa1JH29fYy4m/PdRfZ7O6c96PVCRTsGMir2p8nIQ0=;
 b=ZwEuL3ANL3u+1R2GyfGfYy8M1FnQV4VaJN7Ul9B4T4EAFx5KcbwVNVOsiuIZDueBNShLCOvOcPYGHyYtwioWhcZfBEs4UYxYfOV8+LQI+utLG47h6OqW2uxdEJa4WAnCSbZMQJ/chzDnZD2eOITzp3M3zu55fHc6p+dpVhgBAhS/mT0k2Kw23OkfULbKGWbiFNqXWv7xJLiLAalS09sCl0K4VSk7Q0sYXUhVN9sUF3fiLUsBDvQh6gwjDVgYD6/o0RIKP7nPuzALjo7/tjqiY65JLAlg4hsytToD/FFXrpwyjPUwgMRze21nlcTs/DvwHPY/EDoQH86y66QEtiSKgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsIa1JH29fYy4m/PdRfZ7O6c96PVCRTsGMir2p8nIQ0=;
 b=emjKUmx/o19idxQcsGe0Zw5fnNmqa6Jr5zLblKzEl1S9aDlTV8kGTXVItYEGATxOgKFO5ncdsYFvKTcyRo0AjMNmWr3zoKLxxQICu6JjKnE53eeW/VHN3xnWvyPPd8EMB6Bar+cCZIySN/lHvpXina2aMPsx4vqAQ44P4yTAr6Uut8A1jJdsdQQrVFEZNmPdYJeywN101/w8V25nq7XyO/VYST2FoqGFUKOWip7evQEQXJi+j3HpM3rjYUpj0XzjKMVglMjEXydvkezUHM1XTeBHF9y6dCj4GSRsK0UXq74Z3Q99ANvLGDshfsllR2QEBIv6U823eoAyKRpuznxyQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7314.namprd12.prod.outlook.com (2603:10b6:930:52::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 23:30:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 23:30:43 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Feb 2026 08:30:39 +0900
Message-Id: <DGQ4W1S67PSM.117KBTJOHA449@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Boqun Feng" <boqun@kernel.org>, "Yury Norov"
 <yury.norov@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 00/10] rust: add `register!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Dirk Behme" <dirk.behme@de.bosch.com>
Content-Transfer-Encoding: quoted-printable
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <a278ad60-5912-4b9e-8930-6fc9ecedbd16@de.bosch.com>
 <DGO3AXDQKCKO.19VWO463SM0WP@nvidia.com>
 <749a803e-4167-4eb0-bf8b-da6c27dff5c2@de.bosch.com>
In-Reply-To: <749a803e-4167-4eb0-bf8b-da6c27dff5c2@de.bosch.com>
X-ClientProxiedBy: TY4P301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d18b4b-0fd3-4fe1-1397-08de765839bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	rpGcGKq0a1Et2fb221lsVyHNtYdK8mtGYbokenSzi09HDfqE0YWJUwDn05keW1REdNVvuj3eDA2r1cWI4nGoboHPeb4E6+apAB1a/UsTHiGSKxUErkDY3SxwuhO/SYawkuKb3g4BkV1I/ke49kTV7I4W2747lL/pz4ZPfzQdKuVYs6CXFmBKRNkIb24U5sG8sC57klhBQZwy3vL0Tw3Zo1IwbCc2yoSrl+douWmUgO4BJwH7JOl4GpfQuhLSnKZP9Y3xHi4EplZl8FRKRdIomLCPTanfwdNuPh6llMNl9mEpSfVuArYBXja8OCt5T67OVAQLWACUT4mHScq2s3SrD5iZmNo9fgC7ZYsRgtgU+8OciEq6Dav1DsxP6DrxYiNA8Y+mqZ2YDt+1SNN0GS9BKtatljSjj7Lz2hUz75UYvN6skMEAc5gYew55uLoBhVhSdS9epTkw4eeB0RmLiXutf5FFtaCLvfV91sCyiBYEfcFI3j0uTP6exi397KKeQuvazBzeS4hkTvQzIEnRpDFx7p3Epf/UenWNAVlG2mA0mMeEF1U5JIZ/r+der7czfbrwEZd1stnyTd/dbh6RIWFB23aGaZvwimNTCP1WzyVws8kLzsVmEy/usRte7i1bsa7HAneO6f3iXuLUDAsCVLZD23emtJFu/5UwuXeH4WtpvPI1ROksJsnRZcU3tORFfwIIsH8WxG5wloxYWolP3QOpydidnZmL4XBxJC15iBFbe5M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2xTR2NpeU1UbFVlQ21UdG1GaTR1bzc4R01tTS9lQ05Jb3RGdWVOMWl0RXRD?=
 =?utf-8?B?TW5EZWR1WmFQTHVQcko5T1BVSURjdHIyWGh4ZDhYMk1vVzJ3V0hzT1JRaEpF?=
 =?utf-8?B?SnB5ZUl5dXpzRnA0M0JXRzlEV3lvYy9lUVZpMU1iNVM1RStTdjlManVXbFZP?=
 =?utf-8?B?WFpaSjZhK29qWUwzaFB3dGdzbE9MdjJpalhHMnhha3VKWVUvMFgzZzBKVlF5?=
 =?utf-8?B?ejZxZmJZS3lrRDJMdHBnb1RIcVp3OGxGNExHTHp6d2NncG9xRzZDN2FxU0Vl?=
 =?utf-8?B?YkFFMkUxVVRJWmpiQW1VeENQVkJsdlB2OS8vdnVyemRaK213cGJhWk1kRGxX?=
 =?utf-8?B?VUJRK0NmWlRWNFBGR25ha2p5bmZQMXVxajRCYnIrZ0hYaFo4OEcxZzhxOEdi?=
 =?utf-8?B?ZWFKWThZM0ZpZnpJVUlrSjZKa09aWWRaRzUvNDhXTkFaTExNR3hESDJLUklO?=
 =?utf-8?B?Rk9vbk5XZ2JVSXFFQkdZT3kwRkRSaGFYYUVkRS9QVTVGOHc1NUpyU3VFVVY1?=
 =?utf-8?B?Q09yMGFiT3BnNXpqQ0NsRERIQVExdWh2cmdFM0t2NHdBd1h1aCs5QnJtVjRj?=
 =?utf-8?B?U1lPZ1FrS1JBczRHajkvMW9TaElITkkzTjVyMStnOTlKS3EvMHV0ZDc2NWg3?=
 =?utf-8?B?LzMvZmkzeGM2ZkZkZU01Uk4rdFZ3ZFBPbUxGS09ZNEwrSzl3TklmU1B4R2VB?=
 =?utf-8?B?Tngxekg5eXk3NDJteUV3djhvc0JHaGJFWmUrTmJIc0E4NWhZc2EzeFJYY3dq?=
 =?utf-8?B?aFVtWDUvdDNseWEvbm5HdStqcUovUWZtc2d0UlhTR1paTm8yVWtDOXBBTVND?=
 =?utf-8?B?aDNZZmxId2NBcnNiRVZ5eGhkQ1g0Q0wwcGFqMlpYczgzYitZUnA5Y3hRc1RG?=
 =?utf-8?B?UlFFMWpxaHV5UXdMaGxSd09Mek4zNXg4VElpUFVOeEUwOXAzcUZlc21MeTE2?=
 =?utf-8?B?VFc1Yi9tQW5tMG15WUpzNU5PTzJhajJHTDl6WUI4c09JRldNNmVHUndGbWg3?=
 =?utf-8?B?TlAyRGVXZ1dMZjJ0aEpaeEhINksyVFVMTlFZUk1hQjZRWEVUd2RoaytrYmdS?=
 =?utf-8?B?SXo1bXNzWThPRDcvR0VhN2V4c1V5UkkzWFl4STBWTWRCYkxMdE1pdTRCREww?=
 =?utf-8?B?ZTRPMEVwVG5hWm5KZ3pWNHR2Zld6NUYvZmhjTW4wRTVuVC9HczE0dkt3RU50?=
 =?utf-8?B?alphMGE4Szc2R0tRN0lXa05weHAwOXdZUjhNeG1WdFlLNllQaFRiMVhVa2Z0?=
 =?utf-8?B?aE01a0FwNnNvOUpJdGdmN0JjV29ack14cnZFZS91aE93VnFxK0U5VHhFRUpF?=
 =?utf-8?B?T1VJQlo4M0VJMWUzUmdGMWJXTkpudVN1djNMUi9yaG43Z0FRWVdyVHJlVlZr?=
 =?utf-8?B?bDRBOXlMWk9NV2VvYTZxaFByRG5kSHpFZ2FXcnlpT1lNZlJocElGa3RtdDB3?=
 =?utf-8?B?MmNBeXFZTys2SkNOclRQZlNhc25FTHdLcmpTank2UEtpaXJNU2ZuejFtTHhO?=
 =?utf-8?B?M0xPNTV5UUN6djJqNTgyRUlFQ2V6UGVsVVZsVWg5aHJ6T0c3WUZna2l6K2ZB?=
 =?utf-8?B?YUMrQ05qdEhvc0NvOEVsRW5OTjF0Ymg0TVcwSzJnUUwrZzFMSVVrb2RUc3BI?=
 =?utf-8?B?Z1daaytDa096bzU0R25POFRwZlB1amdXSUsrWTdGcFk4MFlHWHVHOXpOOThv?=
 =?utf-8?B?VWF4Wm1OMnNIV2pIeEhZL2dnM3J3Y09Qd1Z2a25meGRTSHFsWndYbmZXT2RB?=
 =?utf-8?B?d0svbW80RHNoMVllbEdLUnp2dTNMTm4xYnhibmNOTmdFSUdVdHZVeXF1eVBS?=
 =?utf-8?B?dGZ1ZjdxRXZ6RTZ2akNTZWlQRlQ5NkxFelR5TzhtK0E2WFFBbG1FMFNnRG5u?=
 =?utf-8?B?RmpQb0NTZFBwK0xxNEQwYkJYRGtNNVc0bllzT3NLNEVmWUtKL2tHRGVzaEFN?=
 =?utf-8?B?Y0VOeXdMUFlibTIyLytWNFlzRkJmdVFwNGVHV0lHL1BiSzFJUnc3Q2Z0L2c4?=
 =?utf-8?B?ek05cEhLZ2VFcEtLWnpvbGpYazBmZ2tLMDJYYURPdndQOWRPZE5NSlE5bVB0?=
 =?utf-8?B?VVhwdzJGUGE3d3ZPWjRPQUtnQkFhUG5Xa3diajBXa0NqVFNrTktFS21sZVVy?=
 =?utf-8?B?eVNRdXZKVTB5dUZQbC9FUmtjbmtwZFB1a1dIdjl0djB5STV3VE1YUmVqVXBY?=
 =?utf-8?B?SW5oenRjUHl0RVdiaExmdS96ZWdla25ubEZMdHBWbDFEblRJS0JXQmNpbDF0?=
 =?utf-8?B?MUdTVnVYZjhWWVVJQ21acXl3SmpIZU0xUFVnQTdRMU1RcGRBTTY1czhReE02?=
 =?utf-8?B?UWVpNXFKdFhLSWh0bm9GUyt4dzk2YWVzZTlLaFdQZFBiRUw2SGt2a2xXaGE0?=
 =?utf-8?Q?4JVW6EmLjxHq78Q3eHPWxAa7TQpfR1D5P9kEK3lUYMMYn?=
X-MS-Exchange-AntiSpam-MessageData-1: HAKgWRvdBLP4BA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d18b4b-0fd3-4fe1-1397-08de765839bd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 23:30:43.5607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vg8aW+1peKL9oSLVueoLXFE9U5T6HxMaHkWU3abjnO5nvOahvLzvFOylUyFTs7q7B/jAcGiUnIWwOIdQM+Slpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7314

On Thu Feb 26, 2026 at 9:01 PM JST, Dirk Behme wrote:
<snip>
>>> I converted my simple aarch64 TMU timer example [1] over to v7 (many
>>> thanks helping with that!) and gave it a try: It works like with v2.
>>> With that:
>>>
>>> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
>>=20
>> Really appreciated! And I think we are finally converging, so hopefully
>> no more big refactoring ahead. :) Still, please let me know if you saw
>> anything that looked off during the conversion.
>
>
> I was slightly surprised about the `set_` to `with_` change. But=20
> thinking about it I think it heavily depends on the point of view:
>
> If you look at it from a physical register point of view I'm used to=20
> "set" a register / bit. So looking from physical register point of view=20
> I find using `set_` natural.
>
> On the other hand, if we look at the Rust "syntax" you create here like
>
> foo.with_a(4).with_b(9).write(io);
>
> we write to register foo with bits a being 4 and bits b being 9. So we=20
> are doing a write *with* some bits set. From this point of view `with_`=20
> fits as well.
>
> I think you mentioned that this is discussable. And I think it heavily=20
> depends on the point of view you take. So I'm fine either.

This has to do with Rust conventions: we are using a builder pattern,
where fields are set by taking the register by value, and returning the
updated value. Such methods tend to be prefixed with `with_`, whereas
`set_` is typically used for in-plane modification using `&mut self`.

Now AFAICT this is not a *codified* convention, just a rather strong
unwritten one. But it seems adequate to follow it, so users are not
mistaken into thinking the setters do something different than they do.

As to why the builder pattern, this is because it is shorter to write

  io.write(reg.with_foo(true));

than

  mut foo =3D ...;
  reg.set_foo(true);
  io.write(reg);

and also cleaner as it removes the need for the register variable to be
mutable.
