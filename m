Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022106.outbound.protection.outlook.com [52.101.101.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853E347F2E6;
	Tue,  3 Mar 2026 15:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772550318; cv=fail; b=c4NZlu2/cTo+KRPOHzfI4zPAsNtlNiEolWrwzozh4sTYnqyZtSv9AMJtDwdQr3CUpi2QYG9dbeQtvfnOOs9whaaCDBONOFYXGMKy5W186yID8M57uxEvYERPmQdqBoH4OTJuzpRsmKuchTBu40kw/ECVi6n5bvoNcMePPHvEYME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772550318; c=relaxed/simple;
	bh=bQAywx3a5SsI7jOaTLcE56fTuan+LBhW5eXDk34LRt8=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=ShwXlqbBCkJapjTKmTOiRRtXfIHFAmP3IWiRDvmdKDrvjxpUrsUbZFJX/CqHHvd3jf+5BvGX0V9D5wo8Ec9ySftTaSIsmxdyf35/wbniS7FlvsnV4wv2WSjujEJ3c59uvlgYwMxEhqU2o0NCfslI1OI9N4z9JBa7psMDdS1WQ+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=A7Y+QPDO; arc=fail smtp.client-ip=52.101.101.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="A7Y+QPDO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKxN5thTKeIg1kQ2RScIEQzSXvItpHbGuVNxokOIIz41hJEJ0TulbfLv+xPkSk07TbDdDYk/Fkrbp2H6idzidFwKqs6DBKy26rZs+ojehlpYAhYpfJHH3HYKLLHbsvnlFvv8iTA551FyUQM02fhO5yxZHr4V1fYi9GYJz0cc5iDKlK8ecHKn+QBTld9xljct1YNk1VNegRJHO/bmb92+v5Q7FeMiMq/SZrjfsFdCv3w5O5Zyds4R1oHpXal+MgK/0lHRvD5orgplQVRUbh38O6cIBylRcAPfOYttjPq5ndpk+FvCUHYnKCsF0vsO6GCKN+X7R5RS1ijpQIfGGrvZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTewcGs8ivbCh0cFTQM93AxaoOI1afrLERTyC0X8qIw=;
 b=LskqIWsRK7q5AmQEDCgF6rINrg6qbPVHwsdq3S1G3YhgRdFlU7LNRne7F+w019Ko7iw5YFmxagEXYvL8q5rDFp1hd2xYKu/79BkkFy2+Btym0cKq4xYiwRJr66zg5AnffSF7NEVuBJ+2CmAzkuW6ZpFn7HGy878jUc4tr3Q9BfyDNntjGyATuQghIG776h8P8wrivTy/kokYgoc5VrlCbFUz93Zolf1gn628NLsgpPCo7r1c0KvHS8aGVfJVsrhf1PSzTLkX0y46PfRXDLIZZfJRvsOy/eLJBaU54112/GKzHWrLegmIrqIXQ3v4XsncyuG9+TFAof/vvxtnE4hkrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTewcGs8ivbCh0cFTQM93AxaoOI1afrLERTyC0X8qIw=;
 b=A7Y+QPDOV0JwUngUGZ6l5gPqEBiYlBrdzVGB+8NP978uXiLMPMWqarjIMnclpav1dblBzky2hu9y7v6IgHTwaIXPuiyIIAuLNLjTwHpWWC84+7GrOGhs6puXzugSbDeVEiifFL8hUyj9FBT0R8YPwSFAKddnnlnqNjETC772nco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB7331.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:05:07 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 15:05:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 15:05:06 +0000
Message-Id: <DGT8N58ZX5S8.3CK1P9VUYPFM9@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
X-Mailer: aerc 0.21.0
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
 <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
 <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
 <DGSZWZCI0H7H.2EM8L04YH0YRP@nvidia.com>
 <DGT09KTYDCU8.3BBAZBGIYRGWV@nvidia.com>
 <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>
In-Reply-To: <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>
X-ClientProxiedBy: LO2P265CA0202.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: ef363c90-155c-4dd8-5899-08de793641aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	hk7Uv8NhP+mASpVKHXZ5hYAJzzh0uR4B4akq+k6+EjVBxECVpSSIYqM1AUpfucF4UEOASb4jry/uULj89j6h2QREGOIKpIkQFBwvoxHm9W85IwqDxSZA1JpBQMoQAtW/bqA22KjhXO+SXFSBLhEKkXUHOCsV6gg+RTcWiO544Rp0El8jxtyBXIUYDuRLWK4llKnDBb2GLGYaTTx8Jf3vxC76gOTkCZqzvayqtO4l5OOkqbjnE0StHW/snBbdYgtFGUQcSPn9lPSeL0B9rxTOj6YiPI+WbQjdWxuuvP/FOGEXH3bYSIOWPTSXyj8tdrAbqherEby7XrEMqu66Ujq1SK42U+ZsEBqlHUjpJln94uKw6xR8AwRs4MH6bWAGIiYFuv6FelTETKJFtzoX7lWp1DCfWXyYzL4x53sAYLn0SDqG3Gr1d8XTPf7c49rTt3HbOVEgjxSN0wjQoAQrwvin/En66Q43JsEWMUry3dUL0MKCnDVdWR8KdxEoIwKvncloSPZ/wyo26y2arCcymnGEBHnOVuKH/bj7ONKUPyJBsPzPfNY4lo6tGY+EiqYwd0hjoaQsm54S2SvOry8k/CxrMA8u+8y1DIPHKO29TMpKL0uiXYnxdZ9M1QgydwOLMC5aXD9DzNfyhGsqp/e0pE7TPFjUx8PKzRD5qcRNwE7N3VgSUqDYcZbkLnN00YApuXNeZmaJdK/RHGdoUe4+8Ad8jqYG9aZZXNDd94T1br7eREg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V01BWGZRc0gvSGI0bXpVN2k0aUlJSW9NS0F1Z0NSQ1JGdngwL3l0ajVxZE50?=
 =?utf-8?B?NmpONHRNNUFCNWlMT3BVc1ZPRVlYcVVsYVZWQnZNdW8wOWtxM2oyblBybVh5?=
 =?utf-8?B?dTRoRXpIQnVMK2hOcFNCSVg1SnY1OHc5Yi8zZm94RHcrMjBZZ0VnUnlUc21i?=
 =?utf-8?B?Y3hhV0cwWGFqUFhXWnV4L3Z1WUw0QmJKSlROUTdGeFFldXI1djcwdmMwb29k?=
 =?utf-8?B?Q1ZWRk9mb29nenBLWEJYVnQwVWd1cmQ2cTJicFBja1RIM05aN0JBMjJWYTF6?=
 =?utf-8?B?OWhMUnBBNW1reHBRVEZUTk5Sa01kd1BzU3pkK25oNGcxVkdUTGdFUXZZTHFn?=
 =?utf-8?B?bDJ5OThTbCtiaGxsa1hJdW5KbU1qZ1Z4Y3VRbDU0YjRoRUtlQnp2VkpKaVIr?=
 =?utf-8?B?Y2cvTTFmTjFsK0JucGZYMnpYRHZRanVqV0o5RTFqdGV0YlhyRm1jUjFGRHB1?=
 =?utf-8?B?blNYTGRacXdKMm9pamo5UVZNVjRiL3ZkaDlyeTh4b2VNSEhBZm1DODhNa09a?=
 =?utf-8?B?UERCaUFlUEZQdlE4YTJpdmFqeURGYVZUa0Z5ejdEbnF1bTR6VUZMTUdFS1NZ?=
 =?utf-8?B?VC9pRUJqSjRxVFBCZVgzQlluWWFjVzg2djhOSlkrQy9lNUNOTG1Da2JuWGRy?=
 =?utf-8?B?enFJcmtkbDhXZVkveS9ia241T3N2SVQrTXJRdU9NNEpnUFcxV1M2aFBEY3Vh?=
 =?utf-8?B?Z2RaYmdpWjNLWmx3K01BT1NubjN2S0lxTm9xZWpRMTBpZnVHbS9YM0EzbnFY?=
 =?utf-8?B?VHJTUlg3UjFZOWNPUTc5clk4V3JCajFRSzRocitVUmZ5VDJpdjFqcDFUNnNT?=
 =?utf-8?B?YTdrcHBxRHJiUWhPTEhlcUFtMCt3TXdHMzVwWDhWdEM1M09rL2luWWdKZGM2?=
 =?utf-8?B?Q3BEYkk2cndPR0dZcmI4T2VSUzVFQzRrL2ZuK0NPWWhTd05FR0p3OHAwSllJ?=
 =?utf-8?B?MmZUdjk4T1NDMFYwSUIxSXRLem0waEpsTStsbnlwdFdHUTNEQVNlOUY5L1JV?=
 =?utf-8?B?L1lIUmFxVmY2dEgySmVRcmxqWFowRk94enV1cElPZzd0SVVsZUk4YXNYMkpW?=
 =?utf-8?B?aHNneG1raFZiOGYxL2tzeFVkaVcvTGNST3RiMEhZRW0yQU5mcE9xSzNCSy9Y?=
 =?utf-8?B?QUVEc0hwRndIVTRZMXAzb1NBdk1PMGl1Q2xvampTK284WFVEa2NMMFZvS0JC?=
 =?utf-8?B?TmlycnFOUmFFeXI3d1BOOWNiVkgwZzlzT0xUMVp2OHUwa2FzbnZJV3BDVkQ5?=
 =?utf-8?B?SDZTdmU2U1FwVll3UU0wdTVkU2MxWm4vUFA1cTFIcTNqc0hCQXMzeHdvUDZD?=
 =?utf-8?B?cXFIMmovOUJOb2s1QnMycC90bExYeWQwdk5jN1AzM2xlQ3Jod0JKK1JQSFBt?=
 =?utf-8?B?SktmUGt2RGRoSkVjZkFEczF5NXhmeGNlUU45R2ZFVXd0U2N3c3VjQkh5TjJF?=
 =?utf-8?B?Qjc4ekk4U01kdDMrTmJncTlSeTZoZVJ2ckhYS0VOckRGYm5qV0kvWjJvRXls?=
 =?utf-8?B?ZDNuOXNXZXdQVkI2ZTg3blp0VUlSSVFyckduOGtiRUdTSGdBZ3hBWjZyRGdt?=
 =?utf-8?B?WDgvckRoQTlCaVlMS2tVZWhnTEVoSE9JQTJJcUt3NERjeGc3eHJscnBITEtp?=
 =?utf-8?B?QTB6NUIycjhZK1JQNFU0bmJWRWMyS21LNDh3Tm5XamQ2bmlvOUZpc0tPWE1B?=
 =?utf-8?B?QUJMRjl6a2Jud25wYWxaREVZL2ZzMGtTaG0vTUpmYzQvV1gxeDg3ZldYR3Bv?=
 =?utf-8?B?MW1ZRGttU1A1bGxpUEpJTHBwNXdzYTNkT0xqTngvaDJtQkVnZy9Hd1JQbUJK?=
 =?utf-8?B?cFIyQUh6cnArWXBzUnFiQWMxQzROM0xYTWwwWWszdHQ5ZEM3ZHpKUGUvK3ln?=
 =?utf-8?B?enZqMnhHT3FxcE9MNS9GaHI0S1B6UERQSmJCM3dqVStCRVE0M1N0WHBHZ0d0?=
 =?utf-8?B?anZEbFo1SElKVWVtc2ZSNFRjN040S0ZBL29lR0w2VDZHaS8wNzFJMFBNM29x?=
 =?utf-8?B?dW9kcHdWdFpqcnhSckorVTdGYnBIQmJHM2lwREZzOXFxVHNhVFhJelQvNndm?=
 =?utf-8?B?a1ZDVmpGdzNRRG5hYlAwVzdHVnExbzBRdXhJMWQ3eDNxemdsTTcyNVc0TWRV?=
 =?utf-8?B?enN2M2pneE1tMDd0cFZzTTc0T2NmdUlvUDdRenRVMmRWalE2SG5XZmpTVGpp?=
 =?utf-8?B?Wk5Dd0Jta2tDYno2TUxIbXBrUjBVOE9QQllBN1c0SHBOVHFEY2g1a3pzWThx?=
 =?utf-8?B?a2VhU0tkTk5ocnpxYzhrcUdwbEpMcTFRUnFVTWVlR092RGY1SWlXWkF4R2Z5?=
 =?utf-8?B?YWR0NXhFb05YcjRLR3U1ZlhkVnptRmV3RjA3TGlWazNZRVVUTloxTERraEYv?=
 =?utf-8?Q?+qcveJCPKRvDai9M=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ef363c90-155c-4dd8-5899-08de793641aa
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:05:07.1562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9/8Xn/Fj1WFKjs+IovW15R/fRUWHgeD3+F5XjBkUAlNjW+HQ3EK9yAgjkoY3BaSkM+U9V2/IyrAQff48aHowQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7331

On Tue Mar 3, 2026 at 2:55 PM GMT, Alexandre Courbot wrote:
> On Tue Mar 3, 2026 at 5:31 PM JST, Alexandre Courbot wrote:
>> On Tue Mar 3, 2026 at 5:14 PM JST, Alexandre Courbot wrote:
>>> On Mon Mar 2, 2026 at 10:39 PM JST, Gary Guo wrote:
>>>> On Mon Mar 2, 2026 at 1:12 PM GMT, Danilo Krummrich wrote:
>>>>> On Mon Mar 2, 2026 at 1:53 PM CET, Gary Guo wrote:
>>>>>> On Mon Mar 2, 2026 at 1:44 AM GMT, Alexandre Courbot wrote:
>>>>>>> That should be doable. Note that we currently support `zeroed` and
>>>>>>> `default` as initializers, so having the same level of coverage wou=
ld
>>>>>>> require two `write` variants. I'd like to hear what Danilo thinks.
>>>>>>
>>>>>> I wonder if just providing a single version that starts with
>>>>>> `Default::default()` should be sufficient? For most users, zeroed ve=
rsion is the
>>>>>> default version anyway. For those where default is not zero, it perh=
aps makes
>>>>>> more sense to start with default anyway; if explicitly zeroing is ne=
eded they
>>>>>> can always do an explicit `::zeroed()`.
>>>>>
>>>>> I was thinking about this for a while and also thought that we probab=
ly only
>>>>> ever need a version that starts with Default::default().
>>>>>
>>>>> What I still dislike is that the common case becomes write_with() ins=
tead of
>>>>> just write(). (Just to clarify, the name write_with() is perfectly fi=
ne for what
>>>>> the function does, it's more that we need it in the first place.)
>>>>>
>>>>> Also, IIUC, if the value is not created within the closure, we'd stil=
l have the
>>>>> following redundancy, right?
>>>>>
>>>>> 	let reg =3D regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>()
>>>>> 		.try_init(|r| r.try_with_offs(load_offsets.dst_start + pos))?;
>>>>>
>>>>> 	bar.write(regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>(), reg);
>>>>>
>>>>> It's just that this case nicely converts to write_with().
>>>>
>>>> You would have
>>>>
>>>>     let reg =3D regs::NV_PFALCON_FALCON_DMATRFMOFFS::default()
>>>>         .try_with_offs(load_offsets.dst_start + pos))?;
>>>>
>>>>     bar.write(regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>(), reg);
>>>>
>>>> Note that the `default()` invocation doesn't mention relative base, as=
 it's just
>>>> plain bitfields without offset at that point. [ I like the fact that t=
his
>>>> doesn't need to use closure, as I generally prefer code without them, =
perhaps I
>>>> am not "rusty" enough :) ]
>>>>
>>>> In my view, if the code is complex enough that you have
>>>>
>>>>     let reg =3D ...;
>>>>     <some code>
>>>>     bar.write(reg)
>>>>
>>>> then it probably makes sense to have register name mentioned again (th=
is is
>>>> typed checked anyway so you don't need to worry about misnaming it). O=
therwise,
>>>> one might read the code and be confused about what register is being w=
ritten to
>>>> at all.
>>>>
>>>> I think for explicit location parameter makes much more sense for rela=
tive
>>>> addressed registers and register arrays.
>>>
>>> I am not too worried either about having to repeat the location in a
>>> write if we needed to store the register value somewhere first. That
>>> case should be covered by `update`/`try_update` anyway. What is less
>>> acceptable imo is having to type the location twice in the same `write`
>>> statement.
>>>
>>> I spent the day testing different strategies to support the
>>> two-arguments write with both explicit values and closures to create a
>>> value from scratch. That included adding a trait to produce the value
>>> and making `write` generic against it: if both immediate values and
>>> closures implement the trait, that should work I thought. Except that i=
n
>>> the call site the compiler is unable to infer the closure's argument an=
d
>>> requires us to explicitly specify it - sending us back to square 1.
>>> again.
>>>
>>> Another strategy is to make `write` accept only closures, and implement
>>> `FnOnce` on immediate values... but that requires the `fn_traits`
>>> unstable feature.
>>>
>>> So that really leaves us with two options:
>>>
>>> - The current one-argument design based on `IoWrite`, which carries a
>>>   location and its value,
>>> - Or a pair of `write`/`write_with` methods for immediate values and
>>>   closures, respectively.
>>>
>>> I'm ok with either, but the first one looks more composable to me. I ca=
n
>>> send a version implementing the second one if people want to see what i=
t
>>> would look like.
>>
>> Mmm looking closer at the two-methods alternative, it does look more
>> familiar in terms of Rust patterns and less hacky in the end (i.e. no
>> need for `IoWrite`). The drawbacks are also manageable. I'm torn.
>
> So, to get a better idea of these two options I have converted this
> patchset to use the 2-arguments `write_with` method. Here is the
> difference between the two - it is particularly interesting to see how
> nova-core changes:
>
> https://github.com/Gnurou/linux/compare/register_1arg..Gnurou:linux:regis=
ter_2args
>
> The two-arguments version often results in *shorter* write statements
> for multi-line statements. One-liners are interestingly the same length.
> I haven't found any instance where I had to write the register location
> an extra time.

Looks pretty good. Thanks for trying out.

>
> Note that the `Map` trick to allow closures to return a `Result` is not
> implemented yet, so there are a couple of `unwrap`s to allow the code to
> build.

Alternatively we can in the initial version just add a `write_try_with` met=
hod
and add the `Map` trick later.

>
> One detail: when using `write_with`, it is more natural to specify the
> location first, and closure second, since the closure's argument is
> derived from the location. However, all the `write*` methods of `Io` use
> the `(value, location)` order. This introduces some dissonance in the
> API, unless we convert everyone to the `(location, value)` order.

Personally I was actually quite surprised that we use `(value, location)` i=
n our
I/O trait, when implementing I/O projections. I would actually be in favour=
 if
the write API always use `(location, value)`.

I think the current order is just due to the fact that `writel` and friends=
 take
value first and address second. Which itself I think probably is just a
historical choice and is not consistent with APIs like `WRITE_ONCE` and
`atomic_set`.

Best,
Gary
